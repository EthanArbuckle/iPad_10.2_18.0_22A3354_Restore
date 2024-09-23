@implementation ARImageScalePass

- (ARImageScalePass)initWithDescription:(id)a3
{
  id v4;
  ARImageScalePass *v5;
  CGFloat v6;
  CGFloat v7;
  CFTypeRef *p_vtPixelTransferSession;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  ARImageScalePass *v13;
  objc_class *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  ARImageScalePass *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARImageScalePass;
  v5 = -[ARImageScalePass init](&v16, sel_init);
  if (!v5)
    goto LABEL_15;
  objc_msgSend(v4, "size");
  v5->_scaledSize.width = v6;
  v5->_scaledSize.height = v7;
  v5->_conversionPixelFormatType = objc_msgSend(v4, "pixelBufferFormat");
  p_vtPixelTransferSession = (CFTypeRef *)&v5->_vtPixelTransferSession;
  if (!VTPixelTransferSessionCreate(0, &v5->_vtPixelTransferSession))
  {
    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.scaling.useOptimalMSRCoeficients"))&& VTSessionSetProperty(*p_vtPixelTransferSession, (CFStringRef)*MEMORY[0x1E0CED860], (CFTypeRef)*MEMORY[0x1E0C9AE50]))
    {
      if (*p_vtPixelTransferSession)
        CFRelease(*p_vtPixelTransferSession);
      _ARLogTechnique_12();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2048;
      v20 = v5;
      v12 = "%{public}@ <%p>: Unable to set pixel transfer session properties";
      goto LABEL_7;
    }
LABEL_15:
    v13 = v5;
    goto LABEL_16;
  }
  if (*p_vtPixelTransferSession)
    CFRelease(*p_vtPixelTransferSession);
  _ARLogTechnique_12();
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    goto LABEL_8;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v18 = v11;
  v19 = 2048;
  v20 = v5;
  v12 = "%{public}@ <%p>: Unable to create pixel transfer session for image downscaling";
LABEL_7:
  _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);

LABEL_8:
  v13 = 0;
LABEL_16:

  return v13;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *vtPixelTransferSession;
  OpaqueVTPixelTransferSession *v4;
  __CVPixelBufferPool *scaledPixelBufferPool;
  objc_super v6;

  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(vtPixelTransferSession);
    v4 = self->_vtPixelTransferSession;
    if (v4)
      CFRelease(v4);
    self->_vtPixelTransferSession = 0;
  }
  scaledPixelBufferPool = self->_scaledPixelBufferPool;
  if (scaledPixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledPixelBufferPool);
    self->_scaledPixelBufferPool = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ARImageScalePass;
  -[ARImageScalePass dealloc](&v6, sel_dealloc);
}

- (void)setConversionPixelFormatType:(unsigned int)a3
{
  if (-[ARImageScalePass conversionPixelFormatType](self, "conversionPixelFormatType") != a3)
  {
    self->_conversionPixelFormatType = a3;
    CVPixelBufferPoolRelease(self->_scaledPixelBufferPool);
    self->_scaledPixelBufferPool = 0;
  }
}

- (__CVBuffer)scalePixelBuffer:(__CVBuffer *)a3
{
  unsigned int conversionPixelFormatType;
  double v6;
  double v7;
  __CVBuffer *v8;
  OSStatus v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  ARImageScalePass *v17;
  __int16 v18;
  OSStatus v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  conversionPixelFormatType = self->_conversionPixelFormatType;
  if (!conversionPixelFormatType)
    conversionPixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  -[ARImageScalePass scaledSize](self, "scaledSize");
  v8 = ARCreateCVPixelBufferFromPool(&self->_scaledPixelBufferPool, conversionPixelFormatType, self, CFSTR("scaling pass pool"), v6, v7);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(v8, 0);
  v9 = VTPixelTransferSessionTransferImage(self->_vtPixelTransferSession, a3, v8);
  CVPixelBufferUnlockBaseAddress(v8, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (v9)
  {
    CVPixelBufferRelease(v8);
    _ARLogTechnique_12();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2048;
      v17 = self;
      v18 = 1024;
      v19 = v9;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to scale image with error %d", (uint8_t *)&v14, 0x1Cu);

    }
    return 0;
  }
  return v8;
}

- (unsigned)conversionPixelFormatType
{
  return self->_conversionPixelFormatType;
}

- (CGSize)scaledSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scaledSize.width;
  height = self->_scaledSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
