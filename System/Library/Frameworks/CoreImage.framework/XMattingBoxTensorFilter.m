@implementation XMattingBoxTensorFilter

- (XMattingBoxTensorFilter)initWithDevice:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  XMattingBoxTensorFilter *v9;
  XMattingBoxTensorFilter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XMattingBoxTensorFilter;
  v9 = -[XMattingBoxTensorFilter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
    v10->_supportsReadWriteTextures = (unint64_t)objc_msgSend(v7, "readWriteTextureSupport") > 1;
  }

  return v10;
}

- (int)allocateResources:(id)a3
{
  MPSImageBox *v5;
  MPSImageBox *boxfilter;
  int v7;

  v5 = (MPSImageBox *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E10]), "initWithDevice:kernelWidth:kernelHeight:", self->_device, (2 * a3.var0) | 1, (2 * a3.var0) | 1);
  boxfilter = self->_boxfilter;
  self->_boxfilter = v5;

  -[MPSImageBox setEdgeMode:](self->_boxfilter, "setEdgeMode:", 0);
  *($85CD2974BE96D4886BB301820D1C36C2 *)&self->_radius = a3;
  v7 = -[XMattingBoxTensorFilter _compileShadersWithLibrary:](self, "_compileShadersWithLibrary:", self->_library);
  if (v7)
    -[XMattingBoxTensorFilter releaseResources](self, "releaseResources");
  return v7;
}

- (void)releaseResources
{
  MPSImageBox *boxfilter;
  MTLTexture *tmpTexture;
  MTLComputePipelineState *depthFilterSeparableSlidingStacks_arrayKernel;
  MTLComputePipelineState *renormalizeFromMPSImageEdgeModeZeroKernel;

  boxfilter = self->_boxfilter;
  self->_boxfilter = 0;

  tmpTexture = self->_tmpTexture;
  self->_tmpTexture = 0;

  depthFilterSeparableSlidingStacks_arrayKernel = self->_depthFilterSeparableSlidingStacks_arrayKernel;
  self->_depthFilterSeparableSlidingStacks_arrayKernel = 0;

  renormalizeFromMPSImageEdgeModeZeroKernel = self->_renormalizeFromMPSImageEdgeModeZeroKernel;
  self->_renormalizeFromMPSImageEdgeModeZeroKernel = 0;

}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4;
  void *v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *depthFilterSeparableSlidingStacks_arrayKernel;
  const __CFString *v8;
  uint64_t v9;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *renormalizeFromMPSImageEdgeModeZeroKernel;
  int v12;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("depthFilterSeparableSlidingStacks_array"));
  v6 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  depthFilterSeparableSlidingStacks_arrayKernel = self->_depthFilterSeparableSlidingStacks_arrayKernel;
  self->_depthFilterSeparableSlidingStacks_arrayKernel = v6;

  if (self->_depthFilterSeparableSlidingStacks_arrayKernel)
  {
    if (self->_supportsReadWriteTextures)
      v8 = CFSTR("renormalizeFromMPSImageEdgeModeZero_RWS");
    else
      v8 = CFSTR("renormalizeFromMPSImageEdgeModeZero");
    v9 = objc_msgSend(v4, "newFunctionWithName:", v8);

    v10 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v9, 0);
    renormalizeFromMPSImageEdgeModeZeroKernel = self->_renormalizeFromMPSImageEdgeModeZeroKernel;
    self->_renormalizeFromMPSImageEdgeModeZeroKernel = v10;

    if (self->_renormalizeFromMPSImageEdgeModeZeroKernel)
      v12 = 0;
    else
      v12 = -12786;
    v5 = (void *)v9;
  }
  else
  {
    v12 = -12786;
  }

  return v12;
}

+ (id)supportedPixelFormats
{
  if (supportedPixelFormats_onceToken != -1)
    dispatch_once(&supportedPixelFormats_onceToken, &__block_literal_global_78);
  return (id)_supportedPixelFormats;
}

void __48__XMattingBoxTensorFilter_supportedPixelFormats__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E2F1DD08);
  v1 = (void *)_supportedPixelFormats;
  _supportedPixelFormats = v0;

}

- (int)encodeSeparableSlidingStackOnCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  _QWORD v13[3];
  _QWORD v14[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_depthFilterSeparableSlidingStacks_arrayKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);

  objc_msgSend(v10, "setBytes:length:atIndex:", &self->_depthRadius, 4, 0);
  LODWORD(a3) = -[MTLComputePipelineState threadExecutionWidth](self->_depthFilterSeparableSlidingStacks_arrayKernel, "threadExecutionWidth");
  LODWORD(v8) = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_depthFilterSeparableSlidingStacks_arrayKernel, "maxTotalThreadsPerThreadgroup")/ (int)a3;
  v11 = (int)((_DWORD)a3 + objc_msgSend(v9, "width") - 1) / (int)a3;
  LODWORD(self) = objc_msgSend(v9, "height");

  v14[0] = v11;
  v14[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v14[2] = 1;
  v13[0] = (int)a3;
  v13[1] = (int)v8;
  v13[2] = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v14, v13);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)encodeOnCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  MTLTexture *tmpTexture;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  MTLTexture *v37;
  MTLTexture *v38;
  MTLTexture *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  int v46;
  void *v47;
  int v48;
  id v50;
  void *v51;
  id v52;
  id v53;
  _QWORD v54[3];
  _QWORD v55[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[XMattingBoxTensorFilter supportedPixelFormats](XMattingBoxTensorFilter, "supportedPixelFormats");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "pixelFormat"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if (!v13)
    goto LABEL_34;
  +[XMattingBoxTensorFilter supportedPixelFormats](XMattingBoxTensorFilter, "supportedPixelFormats");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "pixelFormat"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "containsObject:", v15);

  if (!v16)
    goto LABEL_34;
  v17 = objc_msgSend(v9, "width");
  if (v17 == objc_msgSend(v10, "width")
    && (v18 = objc_msgSend(v9, "height"), v18 == objc_msgSend(v10, "height"))
    && (v19 = objc_msgSend(v9, "arrayLength"), v19 == objc_msgSend(v10, "arrayLength"))
    && objc_msgSend(v9, "textureType") == 3
    && objc_msgSend(v10, "textureType") == 3)
  {
    v20 = v10;
    objc_msgSend(v8, "pushDebugGroup:", CFSTR("encode"));
    v52 = v10;
    v50 = v20;
    if (self->_depthRadius)
    {
      objc_msgSend(MEMORY[0x1E0CC6E38], "imageDescriptorWithChannelFormat:width:height:featureChannels:numberOfImages:usage:", 4, objc_msgSend(v9, "width"), objc_msgSend(v9, "height"), 4, objc_msgSend(v9, "arrayLength"), 19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CC7230], "temporaryImageWithCommandBuffer:imageDescriptor:", v8, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "textureType");
      v51 = v22;
      objc_msgSend(v22, "texture");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 == 3)
      {
        v25 = v20;
      }
      else
      {
        v26 = objc_msgSend(v24, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v9, "pixelFormat"), 3, 0, 1, 0, objc_msgSend(v9, "arrayLength"));

        v25 = v24;
        v24 = (void *)v26;
      }

    }
    else
    {
      v51 = 0;
      v24 = v20;
    }
    if (objc_msgSend(v9, "arrayLength"))
    {
      v27 = 0;
      v53 = v8;
      do
      {
        v28 = (void *)objc_msgSend(v9, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v9, "pixelFormat"), 2, 0, 1, v27, 1);
        v29 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v24, "pixelFormat"), 2, 0, 1, v27, 1);
        -[MPSImageBox encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_boxfilter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v8, v28, v29);
        if (!self->_supportsReadWriteTextures)
        {
          tmpTexture = self->_tmpTexture;
          if (!tmpTexture
            || (v31 = -[MTLTexture width](tmpTexture, "width"), v31 != objc_msgSend(v29, "width"))
            || (v32 = -[MTLTexture height](self->_tmpTexture, "height"), v32 != objc_msgSend(v29, "height"))
            || (v33 = -[MTLTexture pixelFormat](self->_tmpTexture, "pixelFormat"),
                v33 != objc_msgSend(v29, "pixelFormat")))
          {
            objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v29, "pixelFormat"), objc_msgSend(v29, "width"), objc_msgSend(v29, "height"), 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v34)
              goto LABEL_33;
            v35 = v34;
            objc_msgSend(v34, "setUsage:", 3);
            objc_msgSend(v24, "device");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (MTLTexture *)objc_msgSend(v36, "newTextureWithDescriptor:", v35);
            v38 = self->_tmpTexture;
            self->_tmpTexture = v37;

            v39 = self->_tmpTexture;
            if (!v39)
            {
LABEL_33:

              v48 = -12786;
              v47 = v51;
              v10 = v52;
              goto LABEL_31;
            }
          }
          objc_msgSend(v8, "blitCommandEncoder");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "copyFromTexture:toTexture:", v29, self->_tmpTexture);
          objc_msgSend(v40, "endEncoding");

        }
        objc_msgSend(v8, "computeCommandEncoder");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setComputePipelineState:", self->_renormalizeFromMPSImageEdgeModeZeroKernel);
        if (self->_supportsReadWriteTextures)
        {
          v42 = 0;
        }
        else
        {
          objc_msgSend(v41, "setTexture:atIndex:", self->_tmpTexture, 0);
          v42 = 1;
        }
        objc_msgSend(v41, "setTexture:atIndex:", v29, v42);
        objc_msgSend(v41, "setBytes:length:atIndex:", &self->_radius, 4, 0);
        v43 = -[MTLComputePipelineState threadExecutionWidth](self->_renormalizeFromMPSImageEdgeModeZeroKernel, "threadExecutionWidth");
        v44 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_renormalizeFromMPSImageEdgeModeZeroKernel, "maxTotalThreadsPerThreadgroup")/ v43;
        v45 = (int)(v43 + objc_msgSend(v9, "width") - 1) / v43;
        v46 = objc_msgSend(v9, "height");
        v55[0] = v45;
        v55[1] = (v44 + v46 - 1) / v44;
        v55[2] = 1;
        v54[0] = v43;
        v54[1] = v44;
        v54[2] = 1;
        objc_msgSend(v41, "dispatchThreadgroups:threadsPerThreadgroup:", v55, v54);
        objc_msgSend(v41, "endEncoding");

        ++v27;
        v8 = v53;
      }
      while (v27 < objc_msgSend(v9, "arrayLength"));
    }
    v47 = v51;
    if (self->_depthRadius)
    {
      -[XMattingBoxTensorFilter encodeSeparableSlidingStackOnCommandBuffer:sourceTexture:destinationTexture:](self, "encodeSeparableSlidingStackOnCommandBuffer:sourceTexture:destinationTexture:", v8, v24, v50);
      objc_msgSend(v51, "setReadCount:", 0);
    }
    objc_msgSend(v8, "popDebugGroup");
    v48 = 0;
    v10 = v52;
LABEL_31:

  }
  else
  {
LABEL_34:
    v48 = -12780;
  }

  return v48;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renormalizeFromMPSImageEdgeModeZeroKernel, 0);
  objc_storeStrong((id *)&self->_depthFilterSeparableSlidingStacks_arrayKernel, 0);
  objc_storeStrong((id *)&self->_tmpTexture, 0);
  objc_storeStrong((id *)&self->_boxfilter, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
