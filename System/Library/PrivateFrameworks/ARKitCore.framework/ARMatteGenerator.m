@implementation ARMatteGenerator

- (ARMatteGenerator)initWithDevice:(id)a3 matteResolution:(int64_t)a4 useSmoothing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  ARMatteGenerator *v9;
  ARMatteGenerator *v10;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARMatteGenerator;
  v9 = -[ARMatteGenerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
    -[ARMatteGenerator _commonInitWithDevice:matteResolution:useSmoothing:](v9, "_commonInitWithDevice:matteResolution:useSmoothing:", v8, a4, v5);

  return v10;
}

- (ARMatteGenerator)initWithDevice:(id)device matteResolution:(ARMatteResolution)matteResolution
{
  id v6;
  ARMatteGenerator *v7;
  ARMatteGenerator *v8;
  objc_super v10;

  v6 = device;
  v10.receiver = self;
  v10.super_class = (Class)ARMatteGenerator;
  v7 = -[ARMatteGenerator init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[ARMatteGenerator _commonInitWithDevice:matteResolution:useSmoothing:](v7, "_commonInitWithDevice:matteResolution:useSmoothing:", v6, matteResolution, 0);

  return v8;
}

- (void)_commonInitWithDevice:(id)a3 matteResolution:(int64_t)a4 useSmoothing:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  void *v10;
  MTLLibrary *v11;
  MTLLibrary *mattingLibrary;
  float v13;
  int v14;
  ARDualGuidedFilter *v15;
  ARDualGuidedFilter *dualGuidedFilter;
  void *v17;
  MTLComputePipelineState *v18;
  MTLComputePipelineState *mattingDual;
  void *v20;
  MTLComputePipelineState *v21;
  MTLComputePipelineState *resampleAlpha;
  void *v23;
  MTLComputePipelineState *v24;
  MTLComputePipelineState *depthDilation;
  id v26;

  v5 = a5;
  v26 = a3;
  objc_storeStrong((id *)&self->_device, a3);
  ARKitCoreBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (MTLLibrary *)-[MTLDevice newLibraryWithURL:error:](self->_device, "newLibraryWithURL:error:", v10, 0);
  mattingLibrary = self->_mattingLibrary;
  self->_mattingLibrary = v11;

  self->_dilationRadius = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.matting.dilationRadius"));
  +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.matting.depthScale"));
  self->_depthScale = v13;
  v14 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.matting.doubleMLResolutionForIPad"));
  self->_enableDoubleMLResolutionMatting = v14;
  if (v14)
    LOBYTE(v14) = ARDeviceIsiPad();
  self->_enableDoubleMLResolutionMatting = v14;
  v15 = -[ARDualGuidedFilter initWithDevice:useSmoothing:]([ARDualGuidedFilter alloc], "initWithDevice:useSmoothing:", self->_device, v5);
  dualGuidedFilter = self->_dualGuidedFilter;
  self->_dualGuidedFilter = v15;

  v17 = (void *)-[MTLLibrary newFunctionWithName:](self->_mattingLibrary, "newFunctionWithName:", CFSTR("matting_dual"));
  v18 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v17, 0);
  mattingDual = self->_mattingDual;
  self->_mattingDual = v18;

  v20 = (void *)-[MTLLibrary newFunctionWithName:](self->_mattingLibrary, "newFunctionWithName:", CFSTR("resample_alpha_linear"));
  v21 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v20, 0);
  resampleAlpha = self->_resampleAlpha;
  self->_resampleAlpha = v21;

  v23 = (void *)-[MTLLibrary newFunctionWithName:](self->_mattingLibrary, "newFunctionWithName:", CFSTR("dilated_mask_with_depth_k"));
  v24 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v23, 0);
  depthDilation = self->_depthDilation;
  self->_depthDilation = v24;

  self->_matteResolution = a4;
}

- (void)setUncertaintyRadius:(unint64_t)a3
{
  -[ARDualGuidedFilter setUncertaintyRadius:](self->_dualGuidedFilter, "setUncertaintyRadius:", a3);
}

- (void)setErosionRadius:(unint64_t)a3
{
  -[ARDualGuidedFilter setErosionRadius:](self->_dualGuidedFilter, "setErosionRadius:", a3);
}

- (void)setDilationRadius:(unint64_t)a3
{
  self->_dilationRadius = a3;
}

- (void)setupAlphaBufferForFrame:(id)a3
{
  id v4;
  int64_t matteResolution;
  size_t Width;
  size_t Height;
  MTLTexture *alphaTexture;
  void *v9;
  MTLTexture *v10;
  MTLTexture *v11;
  id v12;

  v4 = a3;
  matteResolution = self->_matteResolution;
  v12 = v4;
  if (matteResolution == 1)
  {
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v4, "capturedImage")) >> 1;
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v12, "capturedImage")) >> 1;
  }
  else if (matteResolution)
  {
    Height = 0;
    Width = 0;
  }
  else
  {
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v4, "capturedImage"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v12, "capturedImage"));
  }
  alphaTexture = self->_alphaTexture;
  if (!alphaTexture
    || -[MTLTexture width](alphaTexture, "width") != Width
    || -[MTLTexture height](self->_alphaTexture, "height") != Height)
  {
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, Height, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUsage:", 7);
    v10 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
    v11 = self->_alphaTexture;
    self->_alphaTexture = v10;

  }
}

- (void)setupDepthBufferForFrame:(id)a3
{
  size_t Width;
  size_t Height;
  void *v6;
  MTLTexture *v7;
  MTLTexture *occluderDepthDilatedTexture;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "estimatedDepthData"))
  {
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v9, "estimatedDepthData"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v9, "estimatedDepthData"));
  }
  else
  {
    Width = 256;
    Height = 192;
  }
  if (!self->_occluderDepthDilatedTexture
    || objc_msgSend(v9, "estimatedDepthData")
    && (-[MTLTexture width](self->_occluderDepthDilatedTexture, "width") != Width
     || -[MTLTexture height](self->_occluderDepthDilatedTexture, "height") != Height))
  {
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, Width, Height, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUsage:", 7);
    v7 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v6);
    occluderDepthDilatedTexture = self->_occluderDepthDilatedTexture;
    self->_occluderDepthDilatedTexture = v7;

  }
}

- (void)setupBuffersForFrame:(id)a3
{
  id v4;
  size_t Width;
  __CVBuffer *v6;
  size_t Height;
  MTLTexture *v8;
  MTLTexture *overlayCoefficientsFG;
  MTLTexture *v10;
  MTLTexture *overlayCoefficientsBG;
  void *v12;
  MTLTexture *v13;
  MTLTexture *stencilTexture;
  id v15;

  v4 = a3;
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v4, "mattingScaleImagePixelBuffer"));
  v6 = (__CVBuffer *)objc_msgSend(v4, "mattingScaleImagePixelBuffer");

  Height = CVPixelBufferGetHeight(v6);
  if (Width != -[MTLTexture width](self->_overlayCoefficientsFG, "width")
    || Height != -[MTLTexture height](self->_overlayCoefficientsFG, "height"))
  {
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, Width, Height, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUsage:", 3);
    v8 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v15);
    overlayCoefficientsFG = self->_overlayCoefficientsFG;
    self->_overlayCoefficientsFG = v8;

    v10 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v15);
    overlayCoefficientsBG = self->_overlayCoefficientsBG;
    self->_overlayCoefficientsBG = v10;

    if (self->_enableDoubleMLResolutionMatting)
    {
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, Height, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setUsage:", 3);
      v13 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v12);
      stencilTexture = self->_stencilTexture;
      self->_stencilTexture = v13;

    }
    else
    {

    }
  }
}

- (void)encodeCoefficients:(id)a3 frame:(id)a4 coefficientsForeground:(id)a5 coefficientsBackground:(id)a6
{
  id v10;
  __CVBuffer *v11;
  __CVBuffer *v12;
  __CVBuffer *v13;
  OSType PixelFormatType;
  __IOSurface *IOSurface;
  __IOSurface *v16;
  __IOSurface *v17;
  void *v18;
  size_t Width;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  size_t v24;
  void *v25;
  MTLTexture *v26;
  MTLTexture *cameraImageTexture;
  void *v28;
  size_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  MTLTexture *v37;
  MTLTexture *stencilTexture;
  unsigned int v39;
  unsigned int v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[3];
  _QWORD v45[3];

  v43 = a3;
  v10 = a4;
  v42 = a6;
  v41 = a5;
  v11 = (__CVBuffer *)objc_msgSend(v10, "mattingScaleImagePixelBuffer");
  v12 = (__CVBuffer *)objc_msgSend(v10, "segmentationBuffer");
  v13 = (__CVBuffer *)objc_msgSend(v10, "capturedImage");
  PixelFormatType = CVPixelBufferGetPixelFormatType(v13);
  IOSurface = CVPixelBufferGetIOSurface(v12);
  v16 = CVPixelBufferGetIOSurface(v11);
  v17 = CVPixelBufferGetIOSurface(v13);
  v18 = (void *)MEMORY[0x1E0CC6BB0];
  Width = IOSurfaceGetWidth(v16);
  objc_msgSend(v18, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, Width, IOSurfaceGetHeight(v16), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v20, v16, 0);
  if (PixelFormatType == 2016686640)
    v22 = 505;
  else
    v22 = 500;
  v23 = (void *)MEMORY[0x1E0CC6BB0];
  v24 = IOSurfaceGetWidth(v17);
  objc_msgSend(v23, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v22, v24, IOSurfaceGetHeight(v17), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v25, v17, 0);
  cameraImageTexture = self->_cameraImageTexture;
  self->_cameraImageTexture = v26;

  v28 = (void *)MEMORY[0x1E0CC6BB0];
  v29 = IOSurfaceGetWidth(IOSurface);
  objc_msgSend(v28, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v29, IOSurfaceGetHeight(IOSurface), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "segmentationBuffer"))
  {
    v37 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v30);
LABEL_9:
    stencilTexture = self->_stencilTexture;
    self->_stencilTexture = v37;

    v32 = v43;
    goto LABEL_10;
  }
  if (!self->_enableDoubleMLResolutionMatting)
  {
    v37 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v30, IOSurface, 0);
    goto LABEL_9;
  }
  v40 = -[MTLTexture width](self->_stencilTexture, "width");
  v39 = -[MTLTexture height](self->_stencilTexture, "height");
  v31 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v30, IOSurface, 0);
  v32 = v43;
  objc_msgSend(v43, "computeCommandEncoder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setComputePipelineState:", self->_resampleAlpha);
  objc_msgSend(v33, "setTexture:atIndex:", v31, 0);
  objc_msgSend(v33, "setTexture:atIndex:", self->_stencilTexture, 1);
  v34 = -[MTLComputePipelineState threadExecutionWidth](self->_resampleAlpha, "threadExecutionWidth");
  v35 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_resampleAlpha, "maxTotalThreadsPerThreadgroup");
  v36 = -[MTLComputePipelineState threadExecutionWidth](self->_resampleAlpha, "threadExecutionWidth");
  v45[0] = (v34 + v40 - 1) / v34;
  v45[1] = (v35 / v36 + v39 - 1) / (v35 / v36);
  v45[2] = 1;
  v44[0] = v34;
  v44[1] = v35 / v36;
  v44[2] = 1;
  objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", v45, v44);
  objc_msgSend(v33, "endEncoding");

LABEL_10:
  -[ARMatteGenerator setupBuffersForFrame:](self, "setupBuffersForFrame:", v10);
  -[ARDualGuidedFilter encodeDualCoefficients:guide:stencil:coefficientsTextureFG:coefficientsTextureBG:](self->_dualGuidedFilter, "encodeDualCoefficients:guide:stencil:coefficientsTextureFG:coefficientsTextureBG:", v32, v21, self->_stencilTexture, v41, v42);

}

- (id)generateMatteFromFrame:(ARFrame *)frame commandBuffer:(id)commandBuffer
{
  ARFrame *v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  MTLTexture *v14;
  _QWORD v16[3];
  _QWORD v17[3];

  v6 = frame;
  v7 = commandBuffer;
  -[ARMatteGenerator setupAlphaBufferForFrame:](self, "setupAlphaBufferForFrame:", v6);
  if (-[ARFrame mattingScaleImagePixelBuffer](v6, "mattingScaleImagePixelBuffer")
    && -[ARFrame segmentationBuffer](v6, "segmentationBuffer"))
  {
    -[ARMatteGenerator setupBuffersForFrame:](self, "setupBuffersForFrame:", v6);
    -[ARMatteGenerator encodeCoefficients:frame:coefficientsForeground:coefficientsBackground:](self, "encodeCoefficients:frame:coefficientsForeground:coefficientsBackground:", v7, v6, self->_overlayCoefficientsFG, self->_overlayCoefficientsBG);
    v8 = -[MTLTexture width](self->_alphaTexture, "width");
    v9 = -[MTLTexture height](self->_alphaTexture, "height");
    objc_msgSend(v7, "computeCommandEncoder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setComputePipelineState:", self->_mattingDual);
    objc_msgSend(v10, "setTexture:atIndex:", self->_cameraImageTexture, 0);
    objc_msgSend(v10, "setTexture:atIndex:", self->_overlayCoefficientsFG, 1);
    objc_msgSend(v10, "setTexture:atIndex:", self->_overlayCoefficientsBG, 2);
    objc_msgSend(v10, "setTexture:atIndex:", self->_alphaTexture, 3);
    v11 = -[MTLComputePipelineState threadExecutionWidth](self->_mattingDual, "threadExecutionWidth");
    v12 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_mattingDual, "maxTotalThreadsPerThreadgroup");
    v13 = -[MTLComputePipelineState threadExecutionWidth](self->_mattingDual, "threadExecutionWidth");
    v17[0] = (v11 + v8 - 1) / v11;
    v17[1] = (v12 / v13 + v9 - 1) / (v12 / v13);
    v17[2] = 1;
    v16[0] = v11;
    v16[1] = v12 / v13;
    v16[2] = 1;
    objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v17, v16);
    objc_msgSend(v10, "endEncoding");
    v14 = self->_alphaTexture;

  }
  else
  {
    v14 = self->_alphaTexture;
  }

  return v14;
}

- (id)generateDilatedDepthFromFrame:(ARFrame *)frame commandBuffer:(id)commandBuffer
{
  ARFrame *v6;
  id v7;
  __IOSurface *IOSurface;
  void *v9;
  size_t Width;
  void *v11;
  void *v12;
  void *v13;
  unint64_t dilationRadius;
  unint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  __int128 v19;
  unint64_t v20;
  MTLTexture *v21;
  int64x2_t v23;
  uint64_t v24;
  _QWORD v25[3];
  _OWORD v26[3];

  v6 = frame;
  v7 = commandBuffer;
  -[ARMatteGenerator setupDepthBufferForFrame:](self, "setupDepthBufferForFrame:", v6);
  if (-[ARFrame estimatedDepthData](v6, "estimatedDepthData"))
  {
    IOSurface = CVPixelBufferGetIOSurface(-[ARFrame estimatedDepthData](v6, "estimatedDepthData"));
    v9 = (void *)MEMORY[0x1E0CC6BB0];
    Width = IOSurfaceGetWidth(IOSurface);
    objc_msgSend(v9, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, Width, IOSurfaceGetHeight(IOSurface), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v11, IOSurface, 0);
    objc_msgSend(v7, "computeCommandEncoder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLabel:", CFSTR("Compute depth stencil dilation"));
    dilationRadius = self->_dilationRadius;
    v15 = 16 - 2 * dilationRadius;
    v16 = objc_msgSend(v12, "width");
    v17 = objc_msgSend(v12, "height");
    v18 = (v16 - 2 * dilationRadius + 15) / v15;
    *(_QWORD *)&v19 = 0;
    HIDWORD(v19) = 0;
    v26[0] = 0u;
    v26[2] = 0u;
    LODWORD(v26[0]) = self->_dilationRadius;
    DWORD2(v19) = LODWORD(self->_depthScale);
    v26[1] = v19;
    v20 = (v17 - 2 * dilationRadius + 15) / v15;
    objc_msgSend(v13, "setComputePipelineState:", self->_depthDilation);
    objc_msgSend(v13, "setTexture:atIndex:", v12, 0);
    objc_msgSend(v13, "setTexture:atIndex:", self->_occluderDepthDilatedTexture, 1);
    objc_msgSend(v13, "setBytes:length:atIndex:", v26, 48, 0);
    v25[0] = v18;
    v25[1] = v20;
    v25[2] = 1;
    v23 = vdupq_n_s64(0x10uLL);
    v24 = 1;
    objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v25, &v23);
    objc_msgSend(v13, "endEncoding");
    v21 = self->_occluderDepthDilatedTexture;

  }
  else
  {
    v21 = self->_occluderDepthDilatedTexture;
  }

  return v21;
}

- (unint64_t)uncertaintyRadius
{
  return self->_uncertaintyRadius;
}

- (unint64_t)erosionRadius
{
  return self->_erodeRadius;
}

- (unint64_t)dilationRadius
{
  return self->_dilationRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stencilTexture, 0);
  objc_storeStrong((id *)&self->_occluderDepthDilatedTexture, 0);
  objc_storeStrong((id *)&self->_alphaTexture, 0);
  objc_storeStrong((id *)&self->_cameraImageTexture, 0);
  objc_storeStrong((id *)&self->_overlayCoefficientsBG, 0);
  objc_storeStrong((id *)&self->_overlayCoefficientsFG, 0);
  objc_storeStrong((id *)&self->_depthDilation, 0);
  objc_storeStrong((id *)&self->_resampleAlpha, 0);
  objc_storeStrong((id *)&self->_mattingDual, 0);
  objc_storeStrong((id *)&self->_mattingLibrary, 0);
  objc_storeStrong((id *)&self->_dualGuidedFilter, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
