@implementation JFXGuidedFilter

- (JFXGuidedFilter)initWithDiameter:(int)a3
{
  JFXGuidedFilter *v4;
  MTLDevice *v5;
  MTLDevice *device;
  MTLDevice *v7;
  NSObject *v8;
  uint64_t v9;
  MTLCommandQueue *commandQueue;
  NSObject *v11;
  int v12;
  id v13;
  int v14;
  uint64_t v15;
  MPSImageGuidedFilter *osGuidedFilter;
  double v17;
  double v18;
  double v19;
  uint8_t v21[16];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)JFXGuidedFilter;
  v4 = -[JFXGuidedFilter init](&v22, sel_init);
  if (v4)
  {
    v5 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v4->_device;
    v4->_device = v5;

    v7 = v4->_device;
    if (v7)
    {
      CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v7, 0, &v4->_textureCache);
      if (!v4->_textureCache)
      {
        JFXLog_matting();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "Error: Failed to create a Metal texture cache", v21, 2u);
        }

      }
      v9 = -[MTLDevice newCommandQueue](v4->_device, "newCommandQueue");
      commandQueue = v4->_commandQueue;
      v4->_commandQueue = (MTLCommandQueue *)v9;

      if (!v4->_commandQueue)
      {
        JFXLog_matting();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEFAULT, "Error: Failed to create a Metal command queue", v21, 2u);
        }

      }
      if (!v4->_osGuidedFilter)
      {
        if (a3 >= 0)
          v12 = a3;
        else
          v12 = a3 + 1;
        v13 = objc_alloc(MEMORY[0x24BDDE3D0]);
        v14 = v12 | 1;
        if (a3 < 2)
          v14 = 3;
        v15 = objc_msgSend(v13, "initWithDevice:kernelDiameter:", v4->_device, v14);
        osGuidedFilter = v4->_osGuidedFilter;
        v4->_osGuidedFilter = (MPSImageGuidedFilter *)v15;

        LODWORD(v17) = 981668463;
        -[MPSImageGuidedFilter setEpsilon:](v4->_osGuidedFilter, "setEpsilon:", v17);
        LODWORD(v18) = 1068708659;
        -[MPSImageGuidedFilter setReconstructScale:](v4->_osGuidedFilter, "setReconstructScale:", v18);
        LODWORD(v19) = -1102263091;
        -[MPSImageGuidedFilter setReconstructOffset:](v4->_osGuidedFilter, "setReconstructOffset:", v19);
        -[MPSImageGuidedFilter setLabel:](v4->_osGuidedFilter, "setLabel:", CFSTR("Guided Filter for edge refinement"));
      }
    }
  }
  return v4;
}

- (void)scaleImage:(__CVBuffer *)a3 guidanceImage:(__CVBuffer *)a4 destinationImage:(__CVBuffer *)a5
{
  MTLCommandQueue *commandQueue;
  uint64_t v10;
  NSObject *v11;
  __CVBuffer *v12;
  __CVBuffer *v13;
  __CVBuffer *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  __CVPixelBufferPool *coeffPool;
  NSObject *v19;
  const char *v20;
  const char *v21;
  int v22;
  size_t Height;
  void *v24;
  __CVBuffer *v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  void *v29;
  uint8_t buf[16];
  CVPixelBufferRef pixelBufferOut[2];

  if (self->_device && (commandQueue = self->_commandQueue) != 0 && self->_textureCache)
  {
    -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      if (!self->_osGuidedFilter)
      {
        JFXLog_matting();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(pixelBufferOut[0]) = 0;
          _os_log_impl(&dword_2269A9000, v15, OS_LOG_TYPE_DEFAULT, "Error: guided filter is NULL in filterImage", (uint8_t *)pixelBufferOut, 2u);
        }
        goto LABEL_43;
      }
      pixelBufferOut[0] = 0;
      v12 = +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:](JFXMetalHelpers, "createCVTextureFromImage:withTextureCache:", a3, self->_textureCache);
      v13 = +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:](JFXMetalHelpers, "createCVTextureFromImage:withTextureCache:", a4, self->_textureCache);
      v14 = +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:](JFXMetalHelpers, "createCVTextureFromImage:withTextureCache:", a5, self->_textureCache);
      CVMetalTextureGetTexture(v12);
      v15 = objc_claimAutoreleasedReturnValue();
      CVMetalTextureGetTexture(v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CVMetalTextureGetTexture(v14);
      v17 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v17;
      if (v15)
      {
        if (v16)
        {
          if (v17)
          {
            coeffPool = self->_coeffPool;
            if (!coeffPool)
            {
              if ((-[MPSImageGuidedFilter options](self->_osGuidedFilter, "options") & 2) != 0)
                v22 = 1380411457;
              else
                v22 = 1380410945;
              v28 = v22;
              self->_guideImageWidth = CVPixelBufferGetWidth(a4);
              Height = CVPixelBufferGetHeight(a4);
              self->_guideImageHeight = Height;
              if (JFXCreatePixelBufferPool(self->_guideImageWidth, Height, v28, &self->_coeffPool))
              {
                JFXLog_matting();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v20 = "Error: CreatePixelBufferPool for _coeffPool failed";
                  goto LABEL_32;
                }
                goto LABEL_33;
              }
              coeffPool = self->_coeffPool;
            }
            if (!CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], coeffPool, pixelBufferOut))
            {
              v25 = +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:](JFXMetalHelpers, "createCVTextureFromImage:withTextureCache:", pixelBufferOut[0], self->_textureCache);
              CVMetalTextureGetTexture(v25);
              v26 = objc_claimAutoreleasedReturnValue();
              if (v26)
              {
                v24 = (void *)v26;
                -[MPSImageGuidedFilter encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:](self->_osGuidedFilter, "encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:", v11, v15, v16, 0, v26);
                -[MPSImageGuidedFilter encodeReconstructionToCommandBuffer:guidanceTexture:coefficientsTexture:destinationTexture:](self->_osGuidedFilter, "encodeReconstructionToCommandBuffer:guidanceTexture:coefficientsTexture:destinationTexture:", v11, v16, v24, v29);
                -[NSObject commit](v11, "commit");
              }
              else
              {
                JFXLog_matting();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2269A9000, v27, OS_LOG_TYPE_DEFAULT, "Error: coeffTexture is NULL", buf, 2u);
                }

                v24 = 0;
              }
              goto LABEL_34;
            }
            JFXLog_matting();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v20 = "Error: CVPixelBufferPoolCreatePixelBuffer for coeffImage failed";
LABEL_32:
              _os_log_impl(&dword_2269A9000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
            }
          }
          else
          {
            JFXLog_matting();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v20 = "Error: destination texture is NULL";
              goto LABEL_32;
            }
          }
        }
        else
        {
          JFXLog_matting();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v20 = "Error: guidance texture is NULL";
            goto LABEL_32;
          }
        }
      }
      else
      {
        JFXLog_matting();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v20 = "Error: source texture is NULL";
          goto LABEL_32;
        }
      }
LABEL_33:

      v24 = 0;
      v25 = 0;
LABEL_34:
      if (v12)
        CFRelease(v12);
      if (v25)
        CFRelease(v25);
      if (v13)
        CFRelease(v13);
      if (v14)
        CFRelease(v14);
      CVPixelBufferRelease(pixelBufferOut[0]);

LABEL_43:
      goto LABEL_44;
    }
    JFXLog_matting();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(pixelBufferOut[0]) = 0;
      v21 = "Error: failed to create a Metal command buffer";
      goto LABEL_15;
    }
  }
  else
  {
    JFXLog_matting();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(pixelBufferOut[0]) = 0;
      v21 = "Error: Metal compute not available.";
LABEL_15:
      _os_log_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)pixelBufferOut, 2u);
    }
  }
LABEL_44:

}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  MPSImageGuidedFilter *osGuidedFilter;
  MTLCommandQueue *commandQueue;
  objc_super v6;

  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  CVPixelBufferPoolRelease(self->_coeffPool);
  osGuidedFilter = self->_osGuidedFilter;
  self->_osGuidedFilter = 0;

  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)JFXGuidedFilter;
  -[JFXGuidedFilter dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_osGuidedFilter, 0);
}

@end
