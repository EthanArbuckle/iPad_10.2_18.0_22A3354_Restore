@implementation MADMLScalingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMLScalingResult)initWithSurface:(id)a3
{
  id v5;
  MADMLScalingResult *v6;
  MADMLScalingResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMLScalingResult;
  v6 = -[MADResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_surface, a3);

  return v7;
}

- (MADMLScalingResult)initWithCoder:(id)a3
{
  id v4;
  MADMLScalingResult *v5;
  uint64_t v6;
  IOSurface *surface;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMLScalingResult;
  v5 = -[MADResult initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Surface"));
    v6 = objc_claimAutoreleasedReturnValue();
    surface = v5->_surface;
    v5->_surface = (IOSurface *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADMLScalingResult;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_surface, CFSTR("Surface"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("surface: %@>"), self->_surface);
  return v3;
}

- (__CVBuffer)pixelBuffer
{
  CF<__CVBuffer *> *p_pixelBuffer;
  __CVBuffer *result;
  CVReturn v5;

  p_pixelBuffer = &self->_pixelBuffer;
  result = self->_pixelBuffer.value_;
  if (!result)
  {
    v5 = CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)self->_surface, 0, &p_pixelBuffer->value_);
    result = p_pixelBuffer->value_;
    if (!p_pixelBuffer->value_)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADRemoveBackgroundMatteResult pixelBuffer].cold.1(v5);
      return p_pixelBuffer->value_;
    }
  }
  return result;
}

- (CGImage)image
{
  CF<CGImage *> *p_image;
  CGImage *result;
  OSType v5;
  size_t v6;
  CGBitmapInfo v7;
  IOSurface *surface;
  size_t v9;
  size_t v10;
  size_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CGImageRef v28;
  CGDataProviderDirectCallbacks callbacks;
  CGColorSpaceRef space;
  CGDataProvider *v31;

  p_image = &self->_image;
  result = self->_image.value_;
  if (!result)
  {
    if (-[IOSurface pixelFormat](self->_surface, "pixelFormat") == 1111970369)
    {
      *(_QWORD *)&callbacks.version = CGColorSpaceCreateDeviceRGB();
      -[IOSurface width](self->_surface, "width");
      -[IOSurface height](self->_surface, "height");
      v31 = (CGDataProvider *)CGIOSurfaceContextCreate();
      space = (CGColorSpaceRef)CGIOSurfaceContextCreateImageReference();
      CF<CGImage *>::operator=((const void **)&p_image->value_, (const void **)&space);
      CF<CGColorSpace *>::~CF((const void **)&space);
      CF<CGColorSpace *>::~CF((const void **)&v31);
      CF<CGColorSpace *>::~CF((const void **)&callbacks);
    }
    else if (-[IOSurface pixelFormat](self->_surface, "pixelFormat") == 1278226534
           || -[IOSurface pixelFormat](self->_surface, "pixelFormat") == 1278226488)
    {
      v5 = -[IOSurface pixelFormat](self->_surface, "pixelFormat");
      if (v5 == 1278226488)
        v6 = 8;
      else
        v6 = 32;
      if (v5 == 1278226488)
        v7 = 0;
      else
        v7 = 8448;
      *(_OWORD *)&callbacks.version = xmmword_1E97E22D0;
      *(_OWORD *)&callbacks.releaseBytePointer = *(_OWORD *)&off_1E97E22E0;
      callbacks.releaseInfo = (CGDataProviderReleaseInfoCallback)SurfaceReleaseInfoCallback;
      surface = self->_surface;
      v31 = CGDataProviderCreateDirect(surface, -[IOSurface height](surface, "height") * -[IOSurface bytesPerRow](surface, "bytesPerRow"), &callbacks);
      if (v31)
      {
        CFRetain(surface);
        space = CGColorSpaceCreateDeviceGray();
        v9 = -[IOSurface width](self->_surface, "width");
        v10 = -[IOSurface height](self->_surface, "height");
        v11 = -[IOSurface bytesPerRow](self->_surface, "bytesPerRow");
        v28 = CGImageCreate(v9, v10, v6, v6, v11, space, v7, v31, 0, 1, kCGRenderingIntentDefault);
        CF<CGImage *>::operator=((const void **)&p_image->value_, (const void **)&v28);
        CF<CGColorSpace *>::~CF((const void **)&v28);
        CF<CGColorSpace *>::~CF((const void **)&space);
      }
      else
      {
        v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v12)
          -[MADMLScalingResult image].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      CF<CGColorSpace *>::~CF((const void **)&v31);
    }
    result = p_image->value_;
    if (!p_image->value_)
    {
      v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v20)
        -[MADRemoveBackgroundMatteResult image].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
      return p_image->value_;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  CF<CGColorSpace *>::~CF((const void **)&self->_image.value_);
  CF<CGColorSpace *>::~CF((const void **)&self->_pixelBuffer.value_);
  objc_storeStrong((id *)&self->_surface, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

- (void)image
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "Failed to create CGDataProviderRef for IOSurface", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
