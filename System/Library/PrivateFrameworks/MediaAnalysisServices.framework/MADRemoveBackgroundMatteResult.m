@implementation MADRemoveBackgroundMatteResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADRemoveBackgroundMatteResult)initWithSurface:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  MADRemoveBackgroundMatteResult *v11;
  MADRemoveBackgroundMatteResult *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADRemoveBackgroundMatteResult;
  v11 = -[MADResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_surface, a3);
    v12->_cropRect.origin.x = x;
    v12->_cropRect.origin.y = y;
    v12->_cropRect.size.width = width;
    v12->_cropRect.size.height = height;
  }

  return v12;
}

- (MADRemoveBackgroundMatteResult)initWithCoder:(id)a3
{
  id v4;
  MADRemoveBackgroundMatteResult *v5;
  uint64_t v6;
  IOSurface *surface;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADRemoveBackgroundMatteResult;
  v5 = -[MADResult initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Surface"));
    v6 = objc_claimAutoreleasedReturnValue();
    surface = v5->_surface;
    v5->_surface = (IOSurface *)v6;

    objc_msgSend(v4, "decodeRectForKey:", CFSTR("CropRect"));
    v5->_cropRect.origin.x = v8;
    v5->_cropRect.origin.y = v9;
    v5->_cropRect.size.width = v10;
    v5->_cropRect.size.height = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADRemoveBackgroundMatteResult;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_surface, CFSTR("Surface"));
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("CropRect"), self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);

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

  objc_msgSend(v3, "appendFormat:", CFSTR("surface: %@, "), self->_surface);
  objc_msgSend(v3, "appendFormat:", CFSTR("cropRect: %0.2fx%0.2f @ (%0.2f, %0.2f)>"), *(_QWORD *)&self->_cropRect.size.width, *(_QWORD *)&self->_cropRect.size.height, *(_QWORD *)&self->_cropRect.origin.x, *(_QWORD *)&self->_cropRect.origin.y);
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
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t ImageReference;
  uint64_t v22;
  CGColorSpaceRef DeviceRGB;

  p_image = &self->_image;
  result = self->_image.value_;
  if (!result)
  {
    if (-[IOSurface pixelFormat](self->_surface, "pixelFormat") == 1111970369)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      -[IOSurface width](self->_surface, "width");
      -[IOSurface height](self->_surface, "height");
      v22 = CGIOSurfaceContextCreate();
      ImageReference = CGIOSurfaceContextCreateImageReference();
      CF<CGImage *>::operator=((const void **)&p_image->value_, (const void **)&ImageReference);
      CF<CGColorSpace *>::~CF((const void **)&ImageReference);
      if (!p_image->value_)
      {
        v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v5)
          -[MADRemoveBackgroundMatteResult image].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      CF<CGColorSpace *>::~CF((const void **)&v22);
      CF<CGColorSpace *>::~CF((const void **)&DeviceRGB);
      return p_image->value_;
    }
    else
    {
      v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v13)
        -[MADRemoveBackgroundMatteResult image].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
      return 0;
    }
  }
  return result;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
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

- (void)pixelBuffer
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create CVPixelBufferRef from IOSurface (%d)", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)image
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "Unexpected pixel format", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
