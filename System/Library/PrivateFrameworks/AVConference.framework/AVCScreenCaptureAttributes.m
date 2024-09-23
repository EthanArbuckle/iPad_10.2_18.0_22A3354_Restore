@implementation AVCScreenCaptureAttributes

- (AVCScreenCaptureAttributes)initWithConfiguration:(id)a3
{
  char *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFDictionary *v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_super v22;
  uint8_t v23[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  _BYTE buf[38];
  __int16 v30;
  char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)AVCScreenCaptureAttributes;
  v4 = -[AVCScreenCaptureAttributes init](&v22, sel_init);
  if (!v4)
    goto LABEL_34;
  if ((char *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[AVCScreenCaptureAttributes initWithConfiguration:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 22;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = a3;
        v8 = " [%s] %s:%d configuration=%@";
        v9 = v7;
        v10 = 38;
LABEL_12:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[AVCScreenCaptureAttributes initWithConfiguration:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 22;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v5;
        v30 = 2048;
        v31 = v4;
        v32 = 2112;
        v33 = a3;
        v8 = " [%s] %s:%d %@(%p) configuration=%@";
        v9 = v12;
        v10 = 58;
        goto LABEL_12;
      }
    }
  }
  v13 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureAttributesStreamType"));
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCScreenCaptureAttributes initWithConfiguration:].cold.1();
    }
    goto LABEL_34;
  }
  *((_QWORD *)v4 + 2) = objc_msgSend(v13, "integerValue");
  v14 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureAttributesPixelScale"));
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCScreenCaptureAttributes initWithConfiguration:].cold.2();
    }
    goto LABEL_34;
  }
  objc_msgSend(v14, "floatValue");
  *((_DWORD *)v4 + 2) = v15;
  v16 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureAttributesContentsRect"));
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCScreenCaptureAttributes initWithConfiguration:].cold.3();
    }
    goto LABEL_34;
  }
  memset(buf, 0, 32);
  CGRectMakeWithDictionaryRepresentation(v16, (CGRect *)buf);
  v17 = *(_OWORD *)&buf[16];
  *(_OWORD *)(v4 + 24) = *(_OWORD *)buf;
  *(_OWORD *)(v4 + 40) = v17;
  if (*((_QWORD *)v4 + 2))
  {
    v18 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("vcScreenCaptureAttributesDisplayID"));
    if (v18)
    {
      *((_DWORD *)v4 + 3) = objc_msgSend(v18, "unsignedIntValue");
      return (AVCScreenCaptureAttributes *)v4;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCScreenCaptureAttributes initWithConfiguration:].cold.4();
    }
LABEL_34:

    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v23 = 136315650;
      v24 = v19;
      v25 = 2080;
      v26 = "-[AVCScreenCaptureAttributes initWithConfiguration:]";
      v27 = 1024;
      v28 = 38;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d displayID ignored sinced contentType is not display bound", v23, 0x1Cu);
    }
  }
  return (AVCScreenCaptureAttributes *)v4;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  AVCScreenCaptureAttributes *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((AVCScreenCaptureAttributes *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[AVCScreenCaptureAttributes dealloc]";
        v16 = 1024;
        v17 = 54;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[AVCScreenCaptureAttributes performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[AVCScreenCaptureAttributes dealloc]";
        v16 = 1024;
        v17 = 54;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AVCScreenCaptureAttributes;
  -[AVCScreenCaptureAttributes dealloc](&v11, sel_dealloc);
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (float)pointPixelScale
{
  return self->_pointPixelScale;
}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (void)initWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Content type is not provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Pixel scale is not provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Contents rect is not provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Display ID is not provided, but content type is display bound", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
