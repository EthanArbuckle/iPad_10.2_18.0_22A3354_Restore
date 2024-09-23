@implementation CVAFilterHybridResampling

- (CVAFilterHybridResampling)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 commandQueue:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CVAFilterHybridResampling *v17;
  objc_class *v18;
  uint64_t v19;
  NSString *label;
  MTLDeviceSPI **p_device;
  uint64_t v22;
  MPSImageLanczosScale *scaler;
  void *v24;
  CVAFilterHybridResampling *v25;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CVAFilterHybridResampling;
  v17 = -[ImageSaverRegistrator init](&v27, sel_init);
  if (v17)
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = objc_claimAutoreleasedReturnValue();
    label = v17->_label;
    v17->_label = (NSString *)v19;

    p_device = &v17->_device;
    objc_storeStrong((id *)&v17->_device, a3);
    sub_1B5674B88((void **)&v17->_doubleUpsampler, v14, v15, v17->_device, CFSTR("doubleUpsample"), a7, 0);
    sub_1B5674B88((void **)&v17->_halfDownSampler, v14, v15, v17->_device, CFSTR("halfDownsample"), a7, 0);
    sub_1B5674B88((void **)&v17->_linearResampler, v14, v15, v17->_device, CFSTR("linearResample"), a7, 0);
    sub_1B5674B88((void **)&v17->_doubleUpsamplerOneComponent, v14, v15, v17->_device, CFSTR("doubleUpsampleOneComponent"), a7, 0);
    sub_1B5674B88((void **)&v17->_halfDownSamplerOneComponent, v14, v15, v17->_device, CFSTR("halfDownsampleOneComponent"), a7, 0);
    sub_1B5674B88((void **)&v17->_linearResamplerOneComponent, v14, v15, v17->_device, CFSTR("linearResampleOneComponent"), a7, 0);
    if (!sub_1B569090C(CFSTR("harvesting.enabled"), CFSTR("com.apple.coremedia"), 0))
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E80]), "initWithDevice:", *p_device);
      scaler = v17->_scaler;
      v17->_scaler = (MPSImageLanczosScale *)v22;

      -[MPSImageLanczosScale setEdgeMode:](v17->_scaler, "setEdgeMode:", 1);
      objc_msgSend(v16, "commandBuffer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setLabel:", CFSTR("MPSImageLanczosScale"));
      +[CVAFilterHybridResampling prewarmScaler:device:commandBuffer:](CVAFilterHybridResampling, "prewarmScaler:device:commandBuffer:", v17->_scaler, *p_device, v24);
      objc_msgSend(v24, "commit");

    }
    v25 = v17;
  }

  return v17;
}

- (void)encodeHybridDownsamplingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  id *p_hybridDownsamplingIntermediateR32Texture;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  MTLTexture *v15;
  MTLTexture *hybridDownsamplingIntermediateR16Texture;
  void *v17;
  MTLTexture *v18;
  MTLTexture *hybridDownsamplingIntermediateR8Texture;
  void *v20;
  MTLTexture *v21;
  MTLTexture *hybridDownsamplingIntermediateTexture;
  int *v23;
  uint64_t v24;
  id v25;
  id v26;

  v26 = a3;
  v8 = a4;
  v9 = a5;
  p_hybridDownsamplingIntermediateR32Texture = (id *)&self->_hybridDownsamplingIntermediateR32Texture;
  if (!self->_hybridDownsamplingIntermediateR32Texture)
  {
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, (unint64_t)objc_msgSend(v8, "width") >> 1, (unint64_t)objc_msgSend(v8, "height") >> 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUsage:", 3);
    v12 = -[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);

    v13 = *p_hybridDownsamplingIntermediateR32Texture;
    *p_hybridDownsamplingIntermediateR32Texture = (id)v12;

    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, (unint64_t)objc_msgSend(v8, "width") >> 1, (unint64_t)objc_msgSend(v8, "height") >> 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUsage:", 3);
    v15 = (MTLTexture *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v14);

    hybridDownsamplingIntermediateR16Texture = self->_hybridDownsamplingIntermediateR16Texture;
    self->_hybridDownsamplingIntermediateR16Texture = v15;

    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, (unint64_t)objc_msgSend(v8, "width") >> 1, (unint64_t)objc_msgSend(v8, "height") >> 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUsage:", 3);
    v18 = (MTLTexture *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v17);

    hybridDownsamplingIntermediateR8Texture = self->_hybridDownsamplingIntermediateR8Texture;
    self->_hybridDownsamplingIntermediateR8Texture = v18;

    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, (unint64_t)objc_msgSend(v8, "width") >> 1, (unint64_t)objc_msgSend(v8, "height") >> 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUsage:", 3);
    v21 = (MTLTexture *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v20);

    hybridDownsamplingIntermediateTexture = self->_hybridDownsamplingIntermediateTexture;
    self->_hybridDownsamplingIntermediateTexture = v21;

  }
  if (objc_msgSend(v8, "pixelFormat") != 55)
  {
    if (objc_msgSend(v8, "pixelFormat") == 25)
    {
      v23 = &OBJC_IVAR___CVAFilterHybridResampling__hybridDownsamplingIntermediateR16Texture;
    }
    else
    {
      v24 = objc_msgSend(v8, "pixelFormat");
      v23 = &OBJC_IVAR___CVAFilterHybridResampling__hybridDownsamplingIntermediateTexture;
      if (v24 == 10)
        v23 = &OBJC_IVAR___CVAFilterHybridResampling__hybridDownsamplingIntermediateR8Texture;
    }
    p_hybridDownsamplingIntermediateR32Texture = (id *)((char *)&self->super.super.isa + *v23);
  }
  v25 = *p_hybridDownsamplingIntermediateR32Texture;
  -[CVAFilterHybridResampling encodeBilinearScalingToCommandBuffer:source:destination:mode:](self, "encodeBilinearScalingToCommandBuffer:source:destination:mode:", v26, v8, v25, 1);
  -[MPSImageLanczosScale encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_scaler, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v26, v25, v9);

}

- (void)encodeBilinearScalingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 mode:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int *v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v12, "width");
  v14 = objc_msgSend(v12, "height");
  objc_msgSend(v10, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a6)
  {
    case 2:
      if (objc_msgSend(v11, "pixelFormat") == 125 || objc_msgSend(v11, "pixelFormat") == 115)
      {
        objc_msgSend(v15, "setLabel:", CFSTR("_linearResampler"));
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__linearResampler;
      }
      else
      {
        objc_msgSend(v15, "setLabel:", CFSTR("_linearResamplerOneComponent"));
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__linearResamplerOneComponent;
      }
      goto LABEL_16;
    case 1:
      if (objc_msgSend(v11, "pixelFormat") == 125 || objc_msgSend(v11, "pixelFormat") == 115)
      {
        objc_msgSend(v15, "setLabel:", CFSTR("_halfDownSampler"));
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__halfDownSampler;
      }
      else
      {
        objc_msgSend(v15, "setLabel:", CFSTR("_halfDownSamplerOneComponent"));
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__halfDownSamplerOneComponent;
      }
      goto LABEL_16;
    case 0:
      if (objc_msgSend(v11, "pixelFormat") == 125 || objc_msgSend(v11, "pixelFormat") == 115)
      {
        objc_msgSend(v15, "setLabel:", CFSTR("_doubleUpsampler"));
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__doubleUpsampler;
      }
      else
      {
        objc_msgSend(v15, "setLabel:", CFSTR("_doubleUpsamplerOneComponent"));
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__doubleUpsamplerOneComponent;
      }
LABEL_16:
      objc_msgSend(v15, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v16));
      break;
  }
  objc_msgSend(v15, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v12, 1);
  v19[0] = (unint64_t)(v13 + 15) >> 4;
  v19[1] = (unint64_t)(v14 + 15) >> 4;
  v19[2] = 1;
  v18 = 1;
  v17 = xmmword_1B56AC968;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", v19, &v17);
  objc_msgSend(v15, "endEncoding");

}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (MPSImageLanczosScale)scaler
{
  return (MPSImageLanczosScale *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_linearResamplerOneComponent, 0);
  objc_storeStrong((id *)&self->_halfDownSamplerOneComponent, 0);
  objc_storeStrong((id *)&self->_doubleUpsamplerOneComponent, 0);
  objc_storeStrong((id *)&self->_linearResampler, 0);
  objc_storeStrong((id *)&self->_halfDownSampler, 0);
  objc_storeStrong((id *)&self->_doubleUpsampler, 0);
  objc_storeStrong((id *)&self->_hybridDownsamplingIntermediateR8Texture, 0);
  objc_storeStrong((id *)&self->_hybridDownsamplingIntermediateR16Texture, 0);
  objc_storeStrong((id *)&self->_hybridDownsamplingIntermediateR32Texture, 0);
  objc_storeStrong((id *)&self->_hybridDownsamplingIntermediateTexture, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)prewarmScaler:(id)a3 device:(id)a4 commandBuffer:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v25 = a3;
  v7 = a4;
  v24 = a5;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, 72, 54, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, 36, 27, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, 16, 12, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, 8, 6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v23);
  v12 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v8);
  objc_msgSend(v9, "setUsage:", 3);
  v13 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v9);
  objc_msgSend(v10, "setUsage:", 3);
  v14 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v10);
  objc_msgSend(v25, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v24, v11, v13);
  objc_msgSend(v25, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v24, v12, v14);

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, 16, 12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, 36, 27, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUsage:", 3);
  v17 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v15);
  v18 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v16);
  objc_msgSend(v25, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v24, v17, v18);

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, 16, 12, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, 36, 27, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUsage:", 3);
  v21 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v19);
  v22 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v20);
  objc_msgSend(v25, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v24, v21, v22);

}

@end
