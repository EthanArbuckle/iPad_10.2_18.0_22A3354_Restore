@implementation MADVideoRemoveBackgroundPreviewFrame

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoRemoveBackgroundPreviewFrame)initWithPresentationTimeStamp:(id *)a3 surface:(id)a4
{
  id v7;
  char *v8;
  MADVideoRemoveBackgroundPreviewFrame *v9;
  __int128 v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADVideoRemoveBackgroundPreviewFrame;
  v8 = -[MADVideoRemoveBackgroundPreviewFrame init](&v12, sel_init);
  v9 = (MADVideoRemoveBackgroundPreviewFrame *)v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v8 + 5) = a3->var3;
    *(_OWORD *)(v8 + 24) = v10;
    objc_storeStrong((id *)v8 + 1, a4);
  }

  return v9;
}

- (MADVideoRemoveBackgroundPreviewFrame)initWithCoder:(id)a3
{
  id v4;
  MADVideoRemoveBackgroundPreviewFrame *v5;
  uint64_t v6;
  IOSurface *surface;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVideoRemoveBackgroundPreviewFrame;
  v5 = -[MADVideoRemoveBackgroundPreviewFrame init](&v9, sel_init);
  if (v5)
  {
    v5->_presentationTimeStamp.value = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("PresentationTimeStampValue"));
    v5->_presentationTimeStamp.timescale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("PresentationTimeStampScale"));
    v5->_presentationTimeStamp.flags = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("PresentationTimeStampFlags"));
    v5->_presentationTimeStamp.epoch = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("PresentationTimeStampEpoch"));
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

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_presentationTimeStamp.value, CFSTR("PresentationTimeStampValue"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_presentationTimeStamp.timescale, CFSTR("PresentationTimeStampScale"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_presentationTimeStamp.flags, CFSTR("PresentationTimeStampFlags"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_presentationTimeStamp.epoch, CFSTR("PresentationTimeStampEpoch"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_surface, CFSTR("Surface"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t timescale;
  CMTime time;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  timescale = self->_presentationTimeStamp.timescale;
  time = (CMTime)self->_presentationTimeStamp;
  objc_msgSend(v3, "appendFormat:", CFSTR("presentationTimeStamp: %lld/%d (%0.3fs), "), time.value, timescale, CMTimeGetSeconds(&time));
  objc_msgSend(v3, "appendFormat:", CFSTR("surface: %@>"), self->_surface);
  return v3;
}

- (__CVBuffer)pixelBuffer
{
  __CVBuffer *result;
  CF<__CVBuffer *> *p_pixelBuffer;
  CVReturn v5;

  p_pixelBuffer = &self->_pixelBuffer;
  result = self->_pixelBuffer.value_;
  if (!result)
  {
    v5 = CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)self->_surface, 0, &p_pixelBuffer->value_);
    result = self->_pixelBuffer.value_;
    if (!result)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADVideoRemoveBackgroundPreviewFrame pixelBuffer].cold.1(v5);
      return p_pixelBuffer->value_;
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void).cxx_destruct
{
  CF<CGColorSpace *>::~CF((const void **)&self->_pixelBuffer.value_);
  objc_storeStrong((id *)&self->_surface, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
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
}

@end
