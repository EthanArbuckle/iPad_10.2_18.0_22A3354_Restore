@implementation AVCScreenCapturePicker

- (AVCScreenCapturePicker)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  AVCScreenCapturePicker *v15;
  AVCScreenCapturePicker *v16;
  AVConferenceXPCClient *v17;
  id v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *CustomRootQueue;
  dispatch_queue_t v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  objc_super v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  AVCScreenCapturePicker *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if ((AVCScreenCapturePicker *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v38 = v8;
        v39 = 2080;
        v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
        v41 = 1024;
        v42 = 29;
        v10 = " [%s] %s:%d Begin";
        v11 = v9;
        v12 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[AVCScreenCapturePicker performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v38 = v13;
        v39 = 2080;
        v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
        v41 = 1024;
        v42 = 29;
        v43 = 2112;
        v44 = v7;
        v45 = 2048;
        v46 = self;
        v10 = " [%s] %s:%d %@(%p) Begin";
        v11 = v14;
        v12 = 48;
        goto LABEL_11;
      }
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)AVCScreenCapturePicker;
  v15 = -[AVCScreenCapturePicker init](&v36, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_19;
  if (a4)
  {
    v15->_screenCapturePickerQueue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
    if (v16->_screenCapturePickerQueue)
      goto LABEL_15;
LABEL_32:
    if ((AVCScreenCapturePicker *)objc_opt_class() == v16)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCScreenCapturePicker initWithDelegate:delegateQueue:].cold.1();
      }
      goto LABEL_54;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = (const __CFString *)-[AVCScreenCapturePicker performSelector:](v16, "performSelector:", sel_logPrefix);
    else
      v30 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_54;
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_DWORD *)buf = 136316162;
    v38 = v32;
    v39 = 2080;
    v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
    v41 = 1024;
    v42 = 38;
    v43 = 2112;
    v44 = v30;
    v45 = 2048;
    v46 = v16;
    v34 = " [%s] %s:%d %@(%p) Failed to create xpc command queue";
LABEL_56:
    _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x30u);
    goto LABEL_54;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v29 = dispatch_queue_create_with_target_V2("com.apple.AVConference.screenCapture", 0, CustomRootQueue);
  v16->_screenCapturePickerQueue = (OS_dispatch_queue *)v29;
  if (!v29)
    goto LABEL_32;
LABEL_15:
  v17 = objc_alloc_init(AVConferenceXPCClient);
  v16->_connection = v17;
  if (v17)
  {
    v18 = -[AVConferenceXPCClient sendMessageSync:arguments:](v17, "sendMessageSync:arguments:", "vcScreenCapturePickerInitialize", 0);
    if (v18 && !objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ERROR")))
    {
      -[AVCScreenCapturePicker registerBlocksForNotifications](v16, "registerBlocksForNotifications");
      objc_storeWeak((id *)&v16->_delegate, a3);
      v16->_isValid = 1;
      goto LABEL_19;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCScreenCapturePicker initWithDelegate:delegateQueue:].cold.3();
    }
    goto LABEL_54;
  }
  if ((AVCScreenCapturePicker *)objc_opt_class() == v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCScreenCapturePicker initWithDelegate:delegateQueue:].cold.2();
    }
    goto LABEL_54;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v31 = (const __CFString *)-[AVCScreenCapturePicker performSelector:](v16, "performSelector:", sel_logPrefix);
  else
    v31 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v35 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = v35;
      v39 = 2080;
      v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
      v41 = 1024;
      v42 = 41;
      v43 = 2112;
      v44 = v31;
      v45 = 2048;
      v46 = v16;
      v34 = " [%s] %s:%d %@(%p) Failed to create XPC connection";
      goto LABEL_56;
    }
  }
LABEL_54:

  v16 = 0;
LABEL_19:
  if ((AVCScreenCapturePicker *)objc_opt_class() == v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v38 = v20;
        v39 = 2080;
        v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
        v41 = 1024;
        v42 = 58;
        v22 = " [%s] %s:%d End";
        v23 = v21;
        v24 = 28;
LABEL_29:
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[AVCScreenCapturePicker performSelector:](v16, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v38 = v25;
        v39 = 2080;
        v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
        v41 = 1024;
        v42 = 58;
        v43 = 2112;
        v44 = v19;
        v45 = 2048;
        v46 = v16;
        v22 = " [%s] %s:%d %@(%p) End";
        v23 = v26;
        v24 = 48;
        goto LABEL_29;
      }
    }
  }
  return v16;
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
  NSObject *screenCapturePickerQueue;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  AVCScreenCapturePicker *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((AVCScreenCapturePicker *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[AVCScreenCapturePicker performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136316162;
    v14 = v9;
    v15 = 2080;
    v16 = "-[AVCScreenCapturePicker dealloc]";
    v17 = 1024;
    v18 = 63;
    v19 = 2112;
    v20 = v3;
    v21 = 2048;
    v22 = self;
    v6 = " [%s] %s:%d %@(%p) ";
    v7 = v10;
    v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = v4;
      v15 = 2080;
      v16 = "-[AVCScreenCapturePicker dealloc]";
      v17 = 1024;
      v18 = 63;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  -[AVCScreenCapturePicker invalidate](self, "invalidate");

  screenCapturePickerQueue = self->_screenCapturePickerQueue;
  if (screenCapturePickerQueue)
  {
    dispatch_release(screenCapturePickerQueue);
    self->_screenCapturePickerQueue = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)AVCScreenCapturePicker;
  -[AVCScreenCapturePicker dealloc](&v12, sel_dealloc);
}

- (void)invalidate
{
  NSObject *screenCapturePickerQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  screenCapturePickerQueue = self->_screenCapturePickerQueue;
  if (screenCapturePickerQueue)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __36__AVCScreenCapturePicker_invalidate__block_invoke;
    v4[3] = &unk_1E9E521C0;
    v4[4] = self;
    dispatch_sync(screenCapturePickerQueue, v4);
  }
}

uint64_t __36__AVCScreenCapturePicker_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _BYTE v12[24];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 32))
  {
    v2 = result;
    *(_BYTE *)(v1 + 32) = 0;
    if (objc_opt_class() == *(_QWORD *)(result + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)v12 = 136315650;
      *(_QWORD *)&v12[4] = v4;
      *(_WORD *)&v12[12] = 2080;
      *(_QWORD *)&v12[14] = "-[AVCScreenCapturePicker invalidate]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 75;
      v6 = " [%s] %s:%d invalidating";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(v2 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v11 = *(_QWORD *)(v2 + 32);
      *(_DWORD *)v12 = 136316162;
      *(_QWORD *)&v12[4] = v9;
      *(_WORD *)&v12[12] = 2080;
      *(_QWORD *)&v12[14] = "-[AVCScreenCapturePicker invalidate]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 75;
      WORD2(v13) = 2112;
      *(_QWORD *)((char *)&v13 + 6) = v3;
      HIWORD(v13) = 2048;
      v14 = v11;
      v6 = " [%s] %s:%d %@(%p) invalidating";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v12, v8);
LABEL_13:
    objc_msgSend(*(id *)(v2 + 32), "deregisterBlocksForNotifications", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
    objc_storeWeak((id *)(*(_QWORD *)(v2 + 32) + 24), 0);
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerTerminate");
  }
  return result;
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)show
{
  NSObject *screenCapturePickerQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  screenCapturePickerQueue = self->_screenCapturePickerQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__AVCScreenCapturePicker_show__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(screenCapturePickerQueue, v3);
}

uint64_t __30__AVCScreenCapturePicker_show__block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _BYTE v12[24];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 32))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
      *(_DWORD *)v12 = 136315650;
      *(_QWORD *)&v12[4] = v4;
      *(_WORD *)&v12[12] = 2080;
      *(_QWORD *)&v12[14] = "-[AVCScreenCapturePicker show]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 92;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v12 = 136316162;
      *(_QWORD *)&v12[4] = v9;
      *(_WORD *)&v12[12] = 2080;
      *(_QWORD *)&v12[14] = "-[AVCScreenCapturePicker show]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 92;
      WORD2(v13) = 2112;
      *(_QWORD *)((char *)&v13 + 6) = v3;
      HIWORD(v13) = 2048;
      v14 = v11;
      v6 = " [%s] %s:%d %@(%p) ";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v12, v8);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
  }
  return result;
}

- (void)showUsingContentStyle:(int64_t)a3
{
  NSObject *screenCapturePickerQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  screenCapturePickerQueue = self->_screenCapturePickerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVCScreenCapturePicker_showUsingContentStyle___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_async(screenCapturePickerQueue, block);
}

uint64_t __48__AVCScreenCapturePicker_showUsingContentStyle___block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 32))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315650;
      v15 = v4;
      v16 = 2080;
      v17 = "-[AVCScreenCapturePicker showUsingContentStyle:]_block_invoke";
      v18 = 1024;
      v19 = 101;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      v15 = v9;
      v16 = 2080;
      v17 = "-[AVCScreenCapturePicker showUsingContentStyle:]_block_invoke";
      v18 = 1024;
      v19 = 101;
      v20 = 2112;
      v21 = v3;
      v22 = 2048;
      v23 = v11;
      v6 = " [%s] %s:%d %@(%p) ";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_13:
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40), CFSTR("vcScreenCaptureAttributesContentStyle"));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageSync:arguments:", "vcScreenCapturePickerShowUsingContentStyle", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  }
  return result;
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__AVCScreenCapturePicker_registerBlocksForNotifications__block_invoke;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcScreenCapturePickerDidSelectAttributes", v6, self->_screenCapturePickerQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __56__AVCScreenCapturePicker_registerBlocksForNotifications__block_invoke_33;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcScreenCapturePickerDidCancel", v5, self->_screenCapturePickerQueue);
}

void __56__AVCScreenCapturePicker_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  AVCScreenCaptureAttributes *v18;
  void *v19;
  _BYTE v20[24];
  __int128 v21;
  void *v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v5)
    return;
  v6 = v5;
  v7 = (void *)objc_msgSend(v5, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return;
  if ((void *)objc_opt_class() != v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_14;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_DWORD *)v20 = 136316418;
    *(_QWORD *)&v20[4] = v14;
    *(_WORD *)&v20[12] = 2080;
    *(_QWORD *)&v20[14] = "-[AVCScreenCapturePicker registerBlocksForNotifications]_block_invoke";
    *(_WORD *)&v20[22] = 1024;
    LODWORD(v21) = 118;
    WORD2(v21) = 2112;
    *(_QWORD *)((char *)&v21 + 6) = v8;
    HIWORD(v21) = 2048;
    v22 = v6;
    LOWORD(v23) = 2112;
    *(_QWORD *)((char *)&v23 + 2) = a3;
    v11 = " [%s] %s:%d %@(%p) received callback for didSelectAttributes error=%@";
    v12 = v15;
    v13 = 58;
    goto LABEL_13;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v20 = 136315906;
      *(_QWORD *)&v20[4] = v9;
      *(_WORD *)&v20[12] = 2080;
      *(_QWORD *)&v20[14] = "-[AVCScreenCapturePicker registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v20[22] = 1024;
      LODWORD(v21) = 118;
      WORD2(v21) = 2112;
      *(_QWORD *)((char *)&v21 + 6) = a3;
      v11 = " [%s] %s:%d received callback for didSelectAttributes error=%@";
      v12 = v10;
      v13 = 38;
LABEL_13:
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v20, v13);
    }
  }
LABEL_14:
  v16 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureAttributesError"), *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, v22, v23);
  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureAttributesErrorDomain")), (int)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureAttributesErrorCode")), "intValue"), objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureAttributesErrorUserInfo")));
    v18 = 0;
  }
  else
  {
    v18 = -[AVCScreenCaptureAttributes initWithConfiguration:]([AVCScreenCaptureAttributes alloc], "initWithConfiguration:", a2);
    v17 = 0;
  }
  if (v17)
    v19 = v17;
  else
    v19 = a3;
  objc_msgSend(v7, "picker:didSelectAttributes:error:", v6, v18, v19);

}

uint64_t __56__AVCScreenCapturePicker_registerBlocksForNotifications__block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _BYTE v15[24];
  __int128 v16;
  void *v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (result)
  {
    v4 = (void *)result;
    v5 = (void *)objc_msgSend((id)result, "delegate");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureCaptureSourceID")), "integerValue");
      if ((void *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18);
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18);
        *(_DWORD *)v15 = 136315906;
        *(_QWORD *)&v15[4] = v8;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[AVCScreenCapturePicker registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 144;
        WORD2(v16) = 2048;
        *(_QWORD *)((char *)&v16 + 6) = v6;
        v10 = " [%s] %s:%d received callback for didCancel captureSourceID=%ld";
        v11 = v9;
        v12 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18);
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18);
        *(_DWORD *)v15 = 136316418;
        *(_QWORD *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[AVCScreenCapturePicker registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 144;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = v7;
        HIWORD(v16) = 2048;
        v17 = v4;
        LOWORD(v18) = 2048;
        *(_QWORD *)((char *)&v18 + 2) = v6;
        v10 = " [%s] %s:%d %@(%p) received callback for didCancel captureSourceID=%ld";
        v11 = v14;
        v12 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
      return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18);
    }
  }
  return result;
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcScreenCapturePickerDidSelectAttributes");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcScreenCapturePickerDidCancel");
}

- (BOOL)excludeCurrentApplication
{
  return self->_excludeCurrentApplication;
}

- (void)setExcludeCurrentApplication:(BOOL)a3
{
  self->_excludeCurrentApplication = a3;
}

- (void)initWithDelegate:delegateQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create xpc command queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:delegateQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create XPC connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:delegateQueue:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error initializing connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
