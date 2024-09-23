@implementation VCImageResizingConverter

- (VCImageResizingConverter)initWithOutputWidth:(unint64_t)a3 outputHeight:(unint64_t)a4 formatType:(unsigned int)a5
{
  VCImageResizingConverter *v7;
  uint64_t v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  VCImageResizingConverter *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCImageResizingConverter;
  v7 = -[VCImageConverterBase initWithFormatType:](&v11, sel_initWithFormatType_, *(_QWORD *)&a5);
  if (v7)
  {
    VTPixelTransferSessionCreate(0, &v7->_transferSession);
    VTSessionSetProperty(v7->_transferSession, (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB48]);
    if (-[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:](v7, "setUpBufferPoolForOutputWidth:outputHeight:", a3, a4))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v13 = v8;
          v14 = 2080;
          v15 = "-[VCImageResizingConverter initWithOutputWidth:outputHeight:formatType:]";
          v16 = 1024;
          v17 = 36;
          v18 = 2048;
          v19 = v7;
          v20 = 2048;
          v21 = a3;
          v22 = 2048;
          v23 = a4;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame Transform resize, %p outputSize %zux%zu", buf, 0x3Au);
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *transferSession;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  VTPixelTransferSessionInvalidate(self->_transferSession);
  transferSession = self->_transferSession;
  if (transferSession)
  {
    CFRelease(transferSession);
    self->_transferSession = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCImageResizingConverter;
  -[VCImageConverterBase dealloc](&v4, sel_dealloc);
}

CVPixelBufferRef __VCImageResizingConverter_CreateResizedSampleBuffer_block_invoke(uint64_t a1, __CVBuffer *a2)
{
  return VCImageResizingConverter_CreateResizedPixelBuffer(*(_QWORD *)(a1 + 32), a2);
}

@end
