@implementation VCImageConverterBase

- (BOOL)setUpBufferPoolForOutputWidth:(unint64_t)a3 outputHeight:(unint64_t)a4
{
  __CVPixelBufferPool **p_bufferPool;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CVPixelBufferPool *bufferPool;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  VCImageConverterBase *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  p_bufferPool = &self->_bufferPool;
  if (self->_bufferPool)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315906;
        v19 = v8;
        v20 = 2080;
        v21 = "-[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:]";
        v22 = 1024;
        v23 = 53;
        v24 = 2048;
        v25 = self;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p, Releasing _bufferPool to create a new one", (uint8_t *)&v18, 0x26u);
      }
    }
    CVPixelBufferPoolRelease(*p_bufferPool);
    *p_bufferPool = 0;
  }
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPoolDictionary, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CA90E0]);
  self->_outputWidth = a3;
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPoolDictionary, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CA8FD8]);
  self->_outputHeight = a4;
  v12 = *MEMORY[0x1E0CBC048];
  v30[0] = *MEMORY[0x1E0CBC018];
  v30[1] = v12;
  v31[0] = MEMORY[0x1E0C9AAB0];
  v31[1] = CFSTR("AVConference:ImageConverter");
  v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPoolDictionary, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CA8FF0]);
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFDictionaryRef)self->_bufferPoolDictionary, p_bufferPool);
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136316418;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:]";
        v22 = 1024;
        v23 = 70;
        v24 = 2048;
        v25 = self;
        v26 = 1024;
        v27 = a3;
        v28 = 1024;
        v29 = a4;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame Transform, %p, create %ux%u _bufferPool", (uint8_t *)&v18, 0x32u);
      }
    }
  }
  else
  {
    self->_outputWidth = 0;
    self->_outputHeight = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:].cold.1();
    }
  }
  return bufferPool != 0;
}

- (VCImageConverterBase)initWithFormatType:(unsigned int)a3
{
  uint64_t v3;
  VCImageConverterBase *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v3 = *(_QWORD *)&a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCImageConverterBase;
  v4 = -[VCImageConverterBase init](&v9, sel_init);
  if (v4)
  {
    v4->_bufferPoolDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_bufferPoolDictionary, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CA9040]);
    v4->_formatType = v3;
    v6 = MEMORY[0x1E0C9AAB0];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_bufferPoolDictionary, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA9010]);
    v10 = *MEMORY[0x1E0CBC018];
    v11[0] = v6;
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_bufferPoolDictionary, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CA8FF0]);
  }
  return v4;
}

- (BOOL)ensureBufferPoolSupportsOutputWidth:(unint64_t)a3 outputHeight:(unint64_t)a4
{
  return self->_bufferPool && self->_bufferPoolDictionary && self->_outputWidth == a3 && self->_outputHeight == a4
      || -[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:](self, "setUpBufferPoolForOutputWidth:outputHeight:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CVPixelBufferPoolRelease(self->_bufferPool);

  v3.receiver = self;
  v3.super_class = (Class)VCImageConverterBase;
  -[VCImageConverterBase dealloc](&v3, sel_dealloc);
}

- (void)setUpBufferPoolForOutputWidth:outputHeight:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:]";
  v6 = 1024;
  v7 = 75;
  v8 = 2048;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p, CVPixelBufferPoolCreate failed", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
