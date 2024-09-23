@implementation VCImageRotationConverter

- (VCImageRotationConverter)initWithRotationAngle:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5 formatType:(unsigned int)a6
{
  VCImageRotationConverter *v9;
  VCImageRotationConverter *v10;
  uint64_t v11;
  NSObject *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCImageRotationConverter;
  v9 = -[VCImageRotationConverterBase initWithRotationAngle:formatType:](&v14, sel_initWithRotationAngle_formatType_, *(_QWORD *)&a3, *(_QWORD *)&a6);
  v10 = v9;
  if (v9)
  {
    if (a3 == 90 || a3 == 270)
    {
      -[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:](v9, "setUpBufferPoolForOutputWidth:outputHeight:", a5, a4);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCImageRotationConverter initWithRotationAngle:width:height:formatType:].cold.1(v11, a3, v12);
      }

      return 0;
    }
  }
  return v10;
}

CVPixelBufferRef __VCImageRotationConverter_CreateRotatedSampleBuffer_block_invoke(uint64_t a1, __CVBuffer *a2)
{
  return VCImageRotationConverter_CreateRotatedPixelBuffer(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

- (void)initWithRotationAngle:(os_log_t)log width:height:formatType:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCImageRotationConverter initWithRotationAngle:width:height:formatType:]";
  v7 = 1024;
  v8 = 19;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Rotation angle %d is not supported (Only 90 and 270 are valid).", (uint8_t *)&v3, 0x22u);
}

@end
