@implementation VCPPreAnalysisImageEntry

- (VCPPreAnalysisImageEntry)initWithPixelBuffer:(__CVBuffer *)a3
{
  VCPPreAnalysisImageEntry *v4;
  CFTypeRef v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VCPPreAnalysisImageEntry;
  v4 = -[VCPPreAnalysisImageEntry init](&v7, sel_init);
  if (v4)
  {
    v6 = CFRetain(a3);
    CF<__CVBuffer *>::operator=((const void **)&v4->_pixelBuffer.value_, &v6);
    CF<opaqueCMSampleBuffer *>::~CF(&v6);
  }
  return v4;
}

- (void)dealloc
{
  int Width;
  int Height;
  objc_super v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_count
    && (int)MediaAnalysisLogLevel() >= 4
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    Width = CVPixelBufferGetWidth(self->_pixelBuffer.value_);
    Height = CVPixelBufferGetHeight(self->_pixelBuffer.value_);
    *(_DWORD *)buf = 67109376;
    v7 = Width;
    v8 = 1024;
    v9 = Height;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PreAnalysis] Pre-warmed image unused (%dx%d)", buf, 0xEu);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPPreAnalysisImageEntry;
  -[VCPPreAnalysisImageEntry dealloc](&v5, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer.value_;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBuffer.value_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
