@implementation VCScreenCaptureVirtualDisplay

- (VCScreenCaptureVirtualDisplay)initWithDelegate:(id)a3 screenCaptureSourceContext:(const _VCScreenCaptureSourceContext *)a4
{
  uint64_t v7;
  NSObject *v8;
  VCScreenCaptureVirtualDisplay *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v7;
      v14 = 2080;
      v15 = "-[VCScreenCaptureVirtualDisplay initWithDelegate:screenCaptureSourceContext:]";
      v16 = 1024;
      v17 = 61;
      v18 = 2112;
      v19 = a3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@", buf, 0x26u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)VCScreenCaptureVirtualDisplay;
  v9 = -[VCObject init](&v11, sel_init);
  if (v9)
  {
    v9->_delegate = (VCScreenCaptureSourceDelegate *)a3;
    v9->_frameCallback = *a4;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCScreenCaptureVirtualDisplay;
  -[VCObject dealloc](&v2, sel_dealloc);
}

- (int)setupCaptureSession:(id)a3
{
  int v5;
  uint64_t CMBaseObject;
  void (*v7)(uint64_t, _QWORD, void *);
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v18;
  int v19;
  int v20;
  int v22;
  const __CFString *v23;
  int v24;
  const __CFString *v25;
  int v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  VCScreenCaptureVirtualDisplay *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  VCScreenCaptureVirtualDisplay *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = FigVirtualDisplayProcessorCreate();
  if (v5)
  {
    v22 = v5;
    if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
    {
      v20 = -2146893820;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCScreenCaptureVirtualDisplay setupCaptureSession:].cold.3();
      }
      return v20;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix, 0, 0, 0, 0, 0, 0, 0);
    else
      v23 = &stru_1E9E58EE0;
    v20 = -2146893820;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v20;
    v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v20;
    *(_DWORD *)buf = 136316418;
    v35 = v28;
    v36 = 2080;
    v37 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
    v38 = 1024;
    v39 = 84;
    v40 = 2112;
    v41 = (void *)v23;
    v42 = 2048;
    v43 = self;
    v44 = 1024;
    LODWORD(v45) = v22;
    v30 = " [%s] %s:%d %@(%p) FigVirtualDisplayProcessorCreate %d";
LABEL_55:
    _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x36u);
    return v20;
  }
  CMBaseObject = FigVirtualDisplayProcessorGetCMBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    v7(CMBaseObject, *MEMORY[0x1E0CC6570], &unk_1E9EF3A88);
  if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description", 0, 0, 0, 0, 0, 0, 0), "UTF8String");
        else
          v11 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v35 = v9;
        v36 = 2080;
        v37 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
        v38 = 1024;
        v39 = 86;
        v40 = 2080;
        v41 = (void *)v11;
        v15 = " [%s] %s:%d FigVirtualDisplayProcessorCreate options: %s";
        v16 = v10;
        v17 = 38;
        goto LABEL_20;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix, 0, 0, 0, 0, 0, 0, 0);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v14 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v14 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v35 = v12;
        v36 = 2080;
        v37 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
        v38 = 1024;
        v39 = 86;
        v40 = 2112;
        v41 = (void *)v8;
        v42 = 2048;
        v43 = self;
        v44 = 2080;
        v45 = v14;
        v15 = " [%s] %s:%d %@(%p) FigVirtualDisplayProcessorCreate options: %s";
        v16 = v13;
        v17 = 58;
LABEL_20:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
  }
  v33 = self;
  v18 = FigVirtualDisplaySinkConduitCreate();
  if (v18)
  {
    v24 = v18;
    v20 = -2146893820;
    if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCScreenCaptureVirtualDisplay setupCaptureSession:].cold.2();
      }
      return v20;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix, v33);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v20;
    v31 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v20;
    *(_DWORD *)buf = 136316418;
    v35 = v31;
    v36 = 2080;
    v37 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
    v38 = 1024;
    v39 = 94;
    v40 = 2112;
    v41 = (void *)v25;
    v42 = 2048;
    v43 = self;
    v44 = 1024;
    LODWORD(v45) = v24;
    v30 = " [%s] %s:%d %@(%p) FigVirtualDisplaySinkConduitCreate %d";
    goto LABEL_55;
  }
  FigVirtualDisplaySourceScreenGetCurrent();
  v19 = FigVirtualDisplaySessionCreateWithComponents();
  if (!v19)
    return 0;
  v26 = v19;
  v20 = -2146893820;
  if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCScreenCaptureVirtualDisplay setupCaptureSession:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix, v33);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v35 = v32;
        v36 = 2080;
        v37 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
        v38 = 1024;
        v39 = 97;
        v40 = 2112;
        v41 = (void *)v27;
        v42 = 2048;
        v43 = self;
        v44 = 1024;
        LODWORD(v45) = v26;
        v30 = " [%s] %s:%d %@(%p) FigVirtualDisplaySessionCreateWithComponents %d";
        goto LABEL_55;
      }
    }
  }
  return v20;
}

- (int)startScreenCaptureWithConfig:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  OpaqueFigVirtualDisplaySession *session;
  void (*v8)(OpaqueFigVirtualDisplaySession *);
  OpaqueFigVirtualDisplaySession *v9;
  int v10;
  OpaqueFigVirtualDisplaySession *v11;
  uint64_t (*v12)(OpaqueFigVirtualDisplaySession *, id, _QWORD *);
  int v13;
  OpaqueFigVirtualDisplaySession *v14;
  uint64_t (*v15)(OpaqueFigVirtualDisplaySession *);
  int v16;
  int v17;
  int v18;
  const __CFString *v19;
  int v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  _QWORD v27[5];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  VCScreenCaptureVirtualDisplay *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v29 = v5;
      v30 = 2080;
      v31 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]";
      v32 = 1024;
      v33 = 110;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting FigVirtualDisplay Screen Capture", buf, 0x1Cu);
    }
  }
  session = self->_session;
  if (session)
  {
    v8 = *(void (**)(OpaqueFigVirtualDisplaySession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v8)
      v8(session);
    v9 = self->_session;
    if (v9)
    {
      CFRelease(v9);
      self->_session = 0;
    }
  }
  v10 = -[VCScreenCaptureVirtualDisplay setupCaptureSession:](self, "setupCaptureSession:", a3);
  if (v10)
  {
    v17 = v10;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:].cold.3();
    }
    return v17;
  }
  v11 = self->_session;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __62__VCScreenCaptureVirtualDisplay_startScreenCaptureWithConfig___block_invoke;
  v27[3] = &unk_1E9E53170;
  v27[4] = self;
  v12 = *(uint64_t (**)(OpaqueFigVirtualDisplaySession *, id, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 8);
  if (v12)
  {
    v13 = v12(v11, a3, v27);
    if (!v13)
    {
      v14 = self->_session;
      v15 = *(uint64_t (**)(OpaqueFigVirtualDisplaySession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v15)
      {
        v16 = v15(v14);
        if (!v16)
          return 0;
        v20 = v16;
      }
      else
      {
        v20 = -12782;
      }
      v17 = -2146893820;
      if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v21 = (const __CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v21 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          return v17;
        v25 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          return v17;
        *(_DWORD *)buf = 136316418;
        v29 = v25;
        v30 = 2080;
        v31 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]";
        v32 = 1024;
        v33 = 133;
        v34 = 2112;
        v35 = v21;
        v36 = 2048;
        v37 = self;
        v38 = 1024;
        v39 = v20;
        v24 = " [%s] %s:%d %@(%p) FigVirtualDisplaySessionGetStartStatus %d";
LABEL_38:
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x36u);
        return v17;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:].cold.2();
      }
      return v17;
    }
    v18 = v13;
  }
  else
  {
    v18 = -12782;
  }
  v17 = -2146893820;
  if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v29 = v22;
        v30 = 2080;
        v31 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]";
        v32 = 1024;
        v33 = 129;
        v34 = 2112;
        v35 = v19;
        v36 = 2048;
        v37 = self;
        v38 = 1024;
        v39 = v18;
        v24 = " [%s] %s:%d %@(%p) FigVirtualDisplaySessionStart failed %d";
        goto LABEL_38;
      }
    }
  }
  return v17;
}

void __62__VCScreenCaptureVirtualDisplay_startScreenCaptureWithConfig___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!a2)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v18 = 136315650;
      v19 = v10;
      v20 = 2080;
      v21 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]_block_invoke";
      v22 = 1024;
      v23 = 123;
      v12 = " [%s] %s:%d startPreview FigVirtualDisplaySessionStart succeeded";
      v13 = v11;
      v14 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v17 = *(_QWORD *)(a1 + 32);
      v18 = 136316162;
      v19 = v15;
      v20 = 2080;
      v21 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]_block_invoke";
      v22 = 1024;
      v23 = 123;
      v24 = 2112;
      v25 = v6;
      v26 = 2048;
      v27 = v17;
      v12 = " [%s] %s:%d %@(%p) startPreview FigVirtualDisplaySessionStart succeeded";
      v13 = v16;
      v14 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
    return;
  }
  objc_msgSend(v3, "callbackWithEventString:", CFSTR("vcScreenCaptureFailStart"));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __62__VCScreenCaptureVirtualDisplay_startScreenCaptureWithConfig___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v18 = 136316418;
        v19 = v7;
        v20 = 2080;
        v21 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]_block_invoke";
        v22 = 1024;
        v23 = 126;
        v24 = 2112;
        v25 = v5;
        v26 = 2048;
        v27 = v9;
        v28 = 1024;
        v29 = a2;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) startPreview FigVirtualDisplaySessionStart error %d", (uint8_t *)&v18, 0x36u);
      }
    }
  }
}

- (int)stopScreenCapture
{
  uint64_t v3;
  NSObject *v4;
  OpaqueFigVirtualDisplaySession *session;
  void (*v6)(OpaqueFigVirtualDisplaySession *);
  OpaqueFigVirtualDisplaySession *v7;
  void (*v8)(OpaqueFigVirtualDisplaySession *);
  OpaqueFigVirtualDisplaySession *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = v3;
      v13 = 2080;
      v14 = "-[VCScreenCaptureVirtualDisplay stopScreenCapture]";
      v15 = 1024;
      v16 = 140;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping FigVirtualDisplay Screen Capture", (uint8_t *)&v11, 0x1Cu);
    }
  }
  session = self->_session;
  if (session)
  {
    v6 = *(void (**)(OpaqueFigVirtualDisplaySession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v6)
      v6(session);
    v7 = self->_session;
    if (v7)
    {
      v8 = *(void (**)(OpaqueFigVirtualDisplaySession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v8)
        v8(v7);
      v9 = self->_session;
      if (v9)
      {
        CFRelease(v9);
        self->_session = 0;
      }
    }
  }
  return 0;
}

- (int)pauseScreenCapture:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  OpaqueFigVirtualDisplaySession *session;
  uint64_t v9;
  void (*v10)(OpaqueFigVirtualDisplaySession *);
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = "Resuming";
      v16 = v5;
      v15 = 136315906;
      v18 = "-[VCScreenCaptureVirtualDisplay pauseScreenCapture:]";
      v17 = 2080;
      if (v3)
        v7 = "Pausing";
      v19 = 1024;
      v20 = 150;
      v21 = 2080;
      v22 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s FigVirtualDisplay Screen Capture", (uint8_t *)&v15, 0x26u);
    }
  }
  session = self->_session;
  if (session)
  {
    v9 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
    if (v3)
    {
      v10 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v9 + 24);
      if (!v10)
        return 0;
      goto LABEL_16;
    }
    v10 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v9 + 32);
    if (v10)
LABEL_16:
      v10(session);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = "Resuming";
      v15 = 136315906;
      v16 = v11;
      v17 = 2080;
      v18 = "-[VCScreenCaptureVirtualDisplay pauseScreenCapture:]";
      if (v3)
        v13 = "Pausing";
      v19 = 1024;
      v20 = 158;
      v21 = 2080;
      v22 = v13;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s FigVirtualDisplay Screen Capture ignored due to nil session", (uint8_t *)&v15, 0x26u);
    }
  }
  return 0;
}

- (void)finalize
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCScreenCaptureVirtualDisplay finalize]";
      v9 = 1024;
      v10 = 164;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finalizing FigVirtualDisplay Screen Capture", (uint8_t *)&v5, 0x1Cu);
    }
  }
  -[VCScreenCaptureVirtualDisplay stopScreenCapture](self, "stopScreenCapture");

  self->_delegate = 0;
  self->_frameCallback.sinkContext = 0;
  self->_frameCallback.sinkCallback = 0;
}

- (void)shouldClearScreen:(BOOL)a3
{
  VCScreenCaptureSourceDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    -[VCScreenCaptureSourceDelegate screenCaptureSourceShouldClearScreen:](delegate, "screenCaptureSourceShouldClearScreen:", a3);
}

- (void)callbackWithEventString:(id)a3
{
  VCScreenCaptureSourceDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    -[VCScreenCaptureSourceDelegate screenCaptureSourceProcessEventString:](delegate, "screenCaptureSourceProcessEventString:", a3);
}

- (void)setupCaptureSession:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigVirtualDisplaySessionCreateWithComponents %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupCaptureSession:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigVirtualDisplaySinkConduitCreate %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupCaptureSession:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigVirtualDisplayProcessorCreate %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)startScreenCaptureWithConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigVirtualDisplaySessionStart failed %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)startScreenCaptureWithConfig:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigVirtualDisplaySessionGetStartStatus %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)startScreenCaptureWithConfig:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Setup Screen Capture failed error=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __62__VCScreenCaptureVirtualDisplay_startScreenCaptureWithConfig___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d startPreview FigVirtualDisplaySessionStart error %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
