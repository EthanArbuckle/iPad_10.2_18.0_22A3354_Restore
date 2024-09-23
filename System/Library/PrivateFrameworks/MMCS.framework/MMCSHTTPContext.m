@implementation MMCSHTTPContext

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  MMCSHTTPContext *v7;
  id v8;
  NSObject *v9;
  CFStringRef v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  CFStringRef v14;
  NSObject *v15;
  NSObject *v16;
  CFStringRef v17;
  NSObject *v18;
  void (*v19)(uint64_t, _QWORD, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  CFStringRef v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  CFStringRef v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFError *error_with_underlying_error;
  void *v41;
  int v42;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CFStringRef v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)-[MMCSHTTPContext hc](self, "hc")[584], &state);
  v7 = self;
  -[MMCSHTTPContext outputStream](v7, "outputStream");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6 && !-[MMCSHTTPContext isTaskDone](v7, "isTaskDone"))
  {
    v12 = -[MMCSHTTPContext isValid](v7, "isValid");

    if (!v12)
      goto LABEL_4;
    if ((uint64_t)a4 > 7)
    {
      if (a4 == 8)
      {
        v28 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "streamError");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ stream %@ error %@"), v7, v6, v29);

          v31 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v30;
            _os_log_impl(&dword_1D3C3F000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
          if (v30)
            CFRelease(v30);
        }
        v32 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "streamError");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("Write stream had error:%@"), v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)objc_msgSend(v6, "streamError");
        error_with_underlying_error = mmcs_cferror_create_error_with_underlying_error(CFSTR("com.apple.mmcs"), 38, v35, CFSTR("%@"), v36, v37, v38, v39, (char)v34);
        mmcs_http_context_set_error((uint64_t)-[MMCSHTTPContext hc](v7, "hc"), error_with_underlying_error);
        if (error_with_underlying_error)
          CFRelease(error_with_underlying_error);
        -[MMCSHTTPContext outputStream](v7, "outputStream");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "close");

        if (!(_QWORD)-[MMCSHTTPContext hc](v7, "hc")[496])
          __assert_rtn("-[MMCSHTTPContext stream:handleEvent:]", "MMCSHTTPContext.m", 138, "self.hc->requestBodyCallback");
        ((void (*)(mmcs_http_context *, _QWORD, uint64_t))-[MMCSHTTPContext hc](v7, "hc")[496])(-[MMCSHTTPContext hc](v7, "hc"), (_QWORD)-[MMCSHTTPContext hc](v7, "hc")[576], 3);

        goto LABEL_9;
      }
      if (a4 != 16)
        goto LABEL_33;
      if (gMMCS_DebugLevel >= 4)
      {
        v16 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v17 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ stream %@ ended"), v7, v6);
          v18 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v17;
            _os_log_impl(&dword_1D3C3F000, v18, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
          }
          if (v17)
            CFRelease(v17);
        }
      }
      if (!(_QWORD)-[MMCSHTTPContext hc](v7, "hc")[496])
      {
        v42 = 148;
        goto LABEL_59;
      }
      v19 = (void (*)(uint64_t, _QWORD, uint64_t))-[MMCSHTTPContext hc](v7, "hc")[496];
      v20 = -[MMCSHTTPContext hc](v7, "hc");
      v21 = -[MMCSHTTPContext hc](v7, "hc");
      v22 = 4;
    }
    else
    {
      if (a4 != 1)
      {
        if (a4 == 4)
        {
          if (gMMCS_DebugLevel >= 5)
          {
            v13 = mmcs_logging_logger_default();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              v14 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ stream %@ has space available"), v7, v6);
              v15 = mmcs_logging_logger_default();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v45 = v14;
                _os_log_impl(&dword_1D3C3F000, v15, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
              }
              if (v14)
                CFRelease(v14);
            }
          }
          if ((_QWORD)-[MMCSHTTPContext hc](v7, "hc")[496])
          {
            ((void (*)(mmcs_http_context *, _QWORD, uint64_t))-[MMCSHTTPContext hc](v7, "hc")[496])(-[MMCSHTTPContext hc](v7, "hc"), (_QWORD)-[MMCSHTTPContext hc](v7, "hc")[576], 2);
            if (!-[MMCSHTTPContext isTaskDone](v7, "isTaskDone"))
              -[MMCSHTTPContext isValid](v7, "isValid");
            goto LABEL_9;
          }
          v42 = 121;
LABEL_59:
          __assert_rtn("-[MMCSHTTPContext stream:handleEvent:]", "MMCSHTTPContext.m", v42, "self.hc->requestBodyCallback");
        }
LABEL_33:
        v23 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ ignoring stream event %u from stream %@"), v7, a4, v6);
          v24 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v10;
            _os_log_impl(&dword_1D3C3F000, v24, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
          if (v10)
            goto LABEL_8;
        }
        goto LABEL_9;
      }
      if (gMMCS_DebugLevel >= 4)
      {
        v25 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ stream %@ opened"), v7, v6);
          v27 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v26;
            _os_log_impl(&dword_1D3C3F000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
          }
          if (v26)
            CFRelease(v26);
        }
      }
      if (!(_QWORD)-[MMCSHTTPContext hc](v7, "hc")[496])
      {
        v42 = 113;
        goto LABEL_59;
      }
      v19 = (void (*)(uint64_t, _QWORD, uint64_t))-[MMCSHTTPContext hc](v7, "hc")[496];
      v20 = -[MMCSHTTPContext hc](v7, "hc");
      v21 = -[MMCSHTTPContext hc](v7, "hc");
      v22 = 1;
    }
    v19(v20, *(_QWORD *)(v21 + 576), v22);
    goto LABEL_9;
  }

LABEL_4:
  v9 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ ignoring stream event %u from stream %@"), v7, a4, v6);
    v11 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v45 = v10;
      _os_log_impl(&dword_1D3C3F000, v11, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    if (v10)
LABEL_8:
      CFRelease(v10);
  }
LABEL_9:

  os_activity_scope_leave(&state);
}

- (int64_t)writeRequestBody:(const char *)a3 maxLength:(unint64_t)a4
{
  MMCSHTTPContext *v6;
  void *v7;
  _BOOL4 v8;
  char v9;
  NSObject *v10;
  CFStringRef v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  int64_t v15;
  NSObject *v16;
  unint64_t v17;
  const __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  CFStringRef v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  -[MMCSHTTPContext outputStream](v6, "outputStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MMCSHTTPContext isHandlingError](v6, "isHandlingError");
  objc_sync_exit(v6);

  if (v7)
    v9 = v8;
  else
    v9 = 1;
  if ((v9 & 1) != 0)
  {
    v10 = mmcs_logging_logger_default();
    if (v7)
    {
      if (!v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ not writing to output stream for unknown reason; attempted to write %lu bytes."),
                  v6,
                  a4);
          v20 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v24 = v11;
            _os_log_impl(&dword_1D3C3F000, v20, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
          v15 = -1;
          if (v11)
            goto LABEL_30;
        }
        else
        {
          v15 = -1;
        }
        goto LABEL_31;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ writing 0 bytes because request cannot accept data at the moment."), v6);
        v12 = mmcs_logging_logger_default();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          goto LABEL_29;
        *(_DWORD *)buf = 138543362;
        v24 = v11;
        v13 = v12;
        v14 = OS_LOG_TYPE_DEBUG;
        goto LABEL_28;
      }
LABEL_17:
      v15 = 0;
      goto LABEL_31;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ output stream is nil; attempted to write %lu bytes."),
            v6,
            a4);
    v19 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 138543362;
    v24 = v11;
LABEL_27:
    v13 = v19;
    v14 = OS_LOG_TYPE_ERROR;
LABEL_28:
    _os_log_impl(&dword_1D3C3F000, v13, v14, "%{public}@", buf, 0xCu);
    goto LABEL_29;
  }
  v15 = objc_msgSend(v7, "write:maxLength:", a3, a4);
  if (v15 != -1)
    goto LABEL_31;
  v16 = mmcs_logging_logger_default();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    goto LABEL_17;
  v17 = objc_msgSend(v7, "streamStatus");
  if (v17 > 7)
    v18 = CFSTR("none");
  else
    v18 = off_1E9584780[v17];
  objc_msgSend(v7, "streamError");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ output stream %@ had an error writing in state %@: stream error %@: Ignoring this, and treating this as if the stream cannot accept data at the moment"), v6, v7, v18, v21);

  v19 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v11;
    goto LABEL_27;
  }
LABEL_29:
  v15 = 0;
  if (v11)
LABEL_30:
    CFRelease(v11);
LABEL_31:

  return v15;
}

- (void)requestBodyDone
{
  void *v3;
  NSObject *v4;
  CFStringRef v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  CFStringRef v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[MMCSHTTPContext outputStream](self, "outputStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MMCSHTTPContext outputStream](self, "outputStream");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "close");

  }
  else
  {
    v4 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ has no output stream to close."), self);
      v6 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v9 = v5;
        _os_log_impl(&dword_1D3C3F000, v6, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
      if (v5)
        CFRelease(v5);
    }
  }
}

- (NSString)description
{
  void *v3;
  const char *v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[MMCSHTTPContext isValid](self, "isValid"))
    v4 = "valid";
  else
    v4 = "invalid";
  if (-[MMCSHTTPContext isTaskDone](self, "isTaskDone"))
    v5 = "done";
  else
    v5 = "undone";
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%s %s %@"), v4, v5, MMCSRequestOptionsDiscretionaryNetworkBehaviorGetString(*(_QWORD *)((_QWORD)-[MMCSHTTPContext hc](self, "hc")[368]+ 88)));
}

- (void)invalidateStreamPair
{
  void *v3;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[MMCSHTTPContext inputStream](self, "inputStream");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  -[MMCSHTTPContext outputStream](self, "outputStream");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v13[5] || v7[5])
  {
    -[MMCSHTTPContext outputStream](self, "outputStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", 0);

    -[MMCSHTTPContext outputStream](self, "outputStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "close");

    -[MMCSHTTPContext setOutputStream:](self, "setOutputStream:", 0);
    -[MMCSHTTPContext setInputStream:](self, "setInputStream:", 0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__MMCSHTTPContext_invalidateStreamPair__block_invoke;
    v5[3] = &unk_1E9584648;
    v5[4] = &v12;
    v5[5] = &v6;
    HttpContextPerformBlockAsync(self, v5);
  }
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

void __39__MMCSHTTPContext_invalidateStreamPair__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (BOOL)requestBodyCanAcceptData
{
  MMCSHTTPContext *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  CFStringRef v8;
  NSObject *v9;
  uint8_t buf[4];
  CFStringRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[MMCSHTTPContext outputStream](v2, "outputStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MMCSHTTPContext outputStream](v2, "outputStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasSpaceAvailable");

    if (v5)
      LODWORD(v3) = !-[MMCSHTTPContext isHandlingError](v2, "isHandlingError");
    else
      LODWORD(v3) = 0;
  }
  objc_sync_exit(v2);

  if (gMMCS_DebugLevel >= 5)
  {
    v6 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = CFSTR("NO");
      if ((_DWORD)v3)
        v7 = CFSTR("YES");
      v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ canAcceptData %@"), v2, v7);
      v9 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v8;
        _os_log_impl(&dword_1D3C3F000, v9, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v8)
        CFRelease(v8);
    }
  }
  return (char)v3;
}

- (int64_t)countOfRequestBodyBytesSent
{
  void *v2;
  int64_t v3;

  -[MMCSHTTPContext dataTask](self, "dataTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfBytesSent");

  return v3;
}

- (BOOL)createNewRequestBodyInputStream
{
  NSObject *v3;
  CFStringRef v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  MMCSHTTPContext *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  CFStringRef v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (gMMCS_DebugLevel >= 4)
  {
    v3 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("createNewRequestBodyInputStream %@"), self);
      v5 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v4;
        _os_log_impl(&dword_1D3C3F000, v5, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v4)
        CFRelease(v4);
    }
  }
  -[MMCSHTTPContext invalidateStreamPair](self, "invalidateStreamPair");
  mmcs_http_reset_context_for_new_stream((uint64_t)-[MMCSHTTPContext hc](self, "hc"));
  v13 = 0;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99E70], "getBoundStreamsWithBufferSize:inputStream:outputStream:", 0x8000, &v14, &v13);
  v6 = v14;
  v7 = v13;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
  {
    -[MMCSHTTPContext setInputStream:](self, "setInputStream:", v6);
    -[MMCSHTTPContext setOutputStream:](self, "setOutputStream:", v8);
    v11 = self;
    objc_sync_enter(v11);
    -[MMCSHTTPContext setIsHandlingError:](v11, "setIsHandlingError:", 0);
    objc_sync_exit(v11);

    objc_msgSend(v8, "setDelegate:", v11);
    mmcs_nshttp_schedule_stream((uint64_t)-[MMCSHTTPContext hc](v11, "hc"));
    objc_msgSend(v8, "open");
  }

  return v10;
}

- (MMCSHTTPContext)initWithContext:(mmcs_http_context *)a3 options:(const mmcs_http_context_options *)a4 activityMarker:(os_activity_s *)a5
{
  MMCSHTTPContext *v7;
  MMCSHTTPContext *v8;
  uint64_t v9;
  uint64_t valuePtr;
  objc_super v12;

  if (!a3)
    -[MMCSHTTPContext initWithContext:options:activityMarker:].cold.1();
  v12.receiver = self;
  v12.super_class = (Class)MMCSHTTPContext;
  v7 = -[MMCSHTTPContext init](&v12, sel_init, a3, a4);
  v8 = v7;
  if (v7)
  {
    -[MMCSHTTPContext setHc:](v7, "setHc:", a3);
    C3BaseRetain(-[MMCSHTTPContext hc](v8, "hc"));
    *(_QWORD *)(-[MMCSHTTPContext hc](v8, "hc") + 560) = appendTrailers;
    -[MMCSHTTPContext setIsValid:](v8, "setIsValid:", 1);
    if (a5)
      os_retain(a5);
    -[MMCSHTTPContext setActivityMarker:](v8, "setActivityMarker:", a5);
    valuePtr = 0;
    if (*(_QWORD *)((_QWORD)-[MMCSHTTPContext hc](v8, "hc")[368] + 144))
    {
      CFNumberGetValue(*(CFNumberRef *)((_QWORD)-[MMCSHTTPContext hc](v8, "hc")[368] + 144), kCFNumberNSIntegerType, &valuePtr);
      v9 = valuePtr;
    }
    else
    {
      v9 = 0;
    }
    -[MMCSHTTPContext setContainerType:](v8, "setContainerType:", v9);
  }
  return v8;
}

- (__CFError)send
{
  uint64_t v3;
  void *v4;
  CFURLRef v5;
  void *v6;
  __CFString *v7;
  void *v8;
  CFDictionaryRef v9;
  void *v10;
  const __CFURL *v11;
  void *v12;
  void *v13;
  __CFError *error;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CFStringRef v24;
  CFStringRef v25;
  void *v26;
  double v27;
  const __CFNumber *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  mmcs_http_context *v36;
  void *v37;
  __CFError *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *log;
  void *v45;
  void *v46;
  const __CFDictionary *v47;
  id v48;
  id v49;
  uint8_t valuePtr[16];
  objc_super v51;

  v3 = (uint64_t)-[MMCSHTTPContext hc](self, "hc")[368];
  -[MMCSHTTPContext setIsHandlingError:](self, "setIsHandlingError:", 0);
  objc_msgSend(MEMORY[0x1E0D03780], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFHTTPMessageCopyRequestURL((CFHTTPMessageRef)-[MMCSHTTPContext hc](self, "hc")[336]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:cachePolicy:timeoutInterval:", v5, 0, 300.0);
  v7 = (__CFString *)CFHTTPMessageCopyRequestMethod((CFHTTPMessageRef)-[MMCSHTTPContext hc](self, "hc")[336]);
  if (v7)
  {
    objc_msgSend(v6, "setHTTPMethod:", v7);
    objc_msgSend(v6, "_setRequiresShortConnectionTimeout:", *(_BYTE *)(v3 + 76) != 0);
    objc_msgSend(v6, "setHTTPShouldHandleCookies:", 0);
    objc_msgSend(v6, "setAllowsCellularAccess:", *(_BYTE *)(v3 + 74) != 0);
    v8 = *(void **)(v3 + 56);
    if (v8)
      objc_msgSend(v6, "setNetworkServiceType:", (int)objc_msgSend(v8, "intValue"));
    if (*(_QWORD *)(v3 + 16))
      objc_msgSend(v6, "setBoundInterfaceIdentifier:");
    v9 = CFHTTPMessageCopyAllHeaderFields((CFHTTPMessageRef)-[MMCSHTTPContext hc](self, "hc")[336]);
    if (v9)
      objc_msgSend(v6, "setAllHTTPHeaderFields:", v9);
    -[__CFDictionary objectForKey:](v9, "objectForKey:", CFSTR("Trailer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(objc_retainAutorelease(v6), "_CFURLRequest");
      _CFURLRequestSetAllowedProtocolTypes();
    }
    if ((_QWORD)-[MMCSHTTPContext hc](self, "hc")[496])
    {
      if (!-[MMCSHTTPContext createNewRequestBodyInputStream](self, "createNewRequestBodyInputStream"))
      {
        error = mmcs_cferror_create_error(CFSTR("com.apple.mmcs"), 1, CFSTR("createNewRequestBodyInputStream failed"));
        goto LABEL_69;
      }
      v47 = v9;
      v11 = v5;
      v12 = v4;
      -[MMCSHTTPContext inputStream](self, "inputStream");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHTTPBodyStream:", v13);
    }
    else
    {
      v13 = CFHTTPMessageCopyBody((CFHTTPMessageRef)-[MMCSHTTPContext hc](self, "hc")[336]);
      v47 = v9;
      v11 = v5;
      v12 = v4;
      if (v13)
        objc_msgSend(v6, "setHTTPBody:", v13);
    }

    v15 = (void *)MEMORY[0x1E0CB3940];
    v51.receiver = self;
    v51.super_class = (Class)MMCSHTTPContext;
    -[MMCSHTTPContext description](&v51, sel_description);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ hc=%p tx%04ld uuid:%@"), v16, -[MMCSHTTPContext hc](self, "hc"), (_QWORD)-[MMCSHTTPContext hc](self, "hc")[272], (_QWORD)-[MMCSHTTPContext hc](self, "hc")[304]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (mmcs_http_request_options_is_background(v3) && (double)-[MMCSHTTPContext hc](self, "hc")[384] > 0.0)
    {
      v18 = v17;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MMCSHTTPContext hc](self, "hc")[384]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setStartTimeoutDate:", v19);

      v17 = v18;
      objc_msgSend(v6, "_setPayloadTransmissionTimeout:", 3600.0);
    }
    v4 = v12;
    if (v12)
    {
      v46 = v12;
      v20 = objc_alloc_init(MEMORY[0x1E0D03788]);
      v21 = (uint64_t)-[MMCSHTTPContext hc](self, "hc")[368];
      objc_msgSend(v20, "setQualityOfService:", *(_QWORD *)(v21 + 80));
      if (*(_QWORD *)(v21 + 88) <= 2uLL)
        objc_msgSend(v20, "setDiscretionaryNetworkBehavior:");
      v45 = v17;
      if (*(_QWORD *)(v21 + 96) <= 2uLL)
        objc_msgSend(v20, "setDuetPreClearedMode:");
      objc_msgSend(v20, "set_allowsRetryForBackgroundDataTasks:", *(_BYTE *)(v21 + 104) != 0);
      if (*(_QWORD *)(v21 + 112))
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", CFBooleanGetValue(*(CFBooleanRef *)(v21 + 112)) != 0);
        objc_msgSend(v20, "setPrivacyProxyFailClosedOverride:", v22);

      }
      v5 = v11;
      if (*(_QWORD *)(v21 + 120))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", CFBooleanGetValue(*(CFBooleanRef *)(v21 + 120)) != 0);
        objc_msgSend(v20, "setUseNWLoaderOverride:", v23);

      }
      objc_msgSend(v20, "setTlsPinning:", mmcs_http_context_is_to_mobile_me((uint64_t)-[MMCSHTTPContext hc](self, "hc")) != 0);
      objc_msgSend(v20, "setAllowRouting:", mmcs_http_context_is_to_mobile_me((uint64_t)-[MMCSHTTPContext hc](self, "hc")) != 0);
      objc_msgSend(v20, "setMetricOptions:", *(_QWORD *)(v21 + 128));
      objc_msgSend(v20, "setNetworkingDelegate:", *(_QWORD *)(v21 + 136));
      objc_msgSend(v20, "setRedactRemoteEndpointFromNetworkMetrics:", *(_BYTE *)(v21 + 77) != 0);
      objc_msgSend(v20, "setRedactUniformResourceIdentifierFromNetworkMetrics:", 1);
      v9 = v47;
      if ((_QWORD)-[MMCSHTTPContext hc](self, "hc")[304])
      {
        v24 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFUUIDRef)-[MMCSHTTPContext hc](self, "hc")[304]);
        if (v24)
        {
          v25 = v24;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ requestUUID:%@"), (_QWORD)-[MMCSHTTPContext hc](self, "hc")[264], v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v25);
          if (v26)
          {
            objc_msgSend(v20, "setIdentifier:", v26);

          }
        }
      }
      v27 = mmcs_http_total_timeout(3600.0);
      if (v27 <= 0.0)
        v27 = 3600.0;
      objc_msgSend(v20, "set_timeoutIntervalForResource:", v27);
      if (mmcs_http_context_is_container_upload((uint64_t)-[MMCSHTTPContext hc](self, "hc")))
        objc_msgSend(v20, "set_timeoutIntervalForRequest:", 600.0);
      objc_msgSend(v20, "set_appleIDContextSessionIdentifier:", 0);
      if (v20)
      {
        objc_msgSend(v20, "setOutOfProcessPoolName:", *(_QWORD *)(v21 + 48));
        objc_msgSend(v20, "setAllowsCellularAccess:", *(_BYTE *)(v21 + 74) != 0);
        objc_msgSend(v20, "set_allowsExpensiveAccess:", *(_BYTE *)(v21 + 75) != 0);
        objc_msgSend(v20, "set_allowsPowerNapScheduling:", *(_BYTE *)(v21 + 73) != 0);
      }
      v28 = *(const __CFNumber **)(v21 + 144);
      v4 = v46;
      if (v28)
      {
        *(_QWORD *)valuePtr = 0;
        if (CFNumberGetValue(v28, kCFNumberNSIntegerType, valuePtr))
          objc_msgSend(v20, "setContainerType:", *(_QWORD *)valuePtr);
      }
      if (*(_QWORD *)((_QWORD)-[MMCSHTTPContext hc](self, "hc")[368] + 24))
        objc_msgSend(v20, "set_sourceApplicationBundleIdentifier:", *(_QWORD *)((_QWORD)-[MMCSHTTPContext hc](self, "hc")[368] + 24));
      if (*(_QWORD *)((_QWORD)-[MMCSHTTPContext hc](self, "hc")[368] + 32))
        objc_msgSend(v20, "set_sourceApplicationSecondaryIdentifier:", *(_QWORD *)((_QWORD)-[MMCSHTTPContext hc](self, "hc")[368] + 32));
      if (*(_QWORD *)((_QWORD)-[MMCSHTTPContext hc](self, "hc")[368] + 40))
        objc_msgSend(v20, "set_sourceApplicationAuditTokenData:", *(_QWORD *)((_QWORD)-[MMCSHTTPContext hc](self, "hc")[368] + 40));
      v49 = 0;
      objc_msgSend(v46, "createDataTaskWithRequest:options:delegate:sessionHandle:", v6, v20, self, &v49);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v49;
      -[MMCSHTTPContext setDataTask:](self, "setDataTask:", v29);

      -[MMCSHTTPContext dataTask](self, "dataTask");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        if (mmcs_http_request_options_is_background(v3))
        {
          v32 = (uint64_t)-[MMCSHTTPContext hc](self, "hc")[352];
          if (v32 != -1)
          {
            -[MMCSHTTPContext dataTask](self, "dataTask");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setCountOfBytesClientExpectsToSend:", v32);

          }
          v34 = (uint64_t)-[MMCSHTTPContext hc](self, "hc")[360];
          if (v34 != -1)
          {
            -[MMCSHTTPContext dataTask](self, "dataTask");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setCountOfBytesClientExpectsToReceive:", v34);

          }
        }
        if (*(_BYTE *)((_QWORD)-[MMCSHTTPContext hc](self, "hc")[368] + 152))
        {
          v36 = -[MMCSHTTPContext hc](self, "hc");
          if (v20)
          {
            if (!v36->var48)
            {
              v48 = 0;
              objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, &v48);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (__CFError *)v48;
              if (v37)
              {
                v39 = v37;
                *(_QWORD *)(-[MMCSHTTPContext hc](self, "hc") + 616) = v39;
              }
              else
              {
                v40 = mmcs_logging_logger_default();
                if (v38)
                {
                  XCFPrintError(v40, CFSTR("ErrorSerializingWarmRequestOptions"), v38);
                }
                else
                {
                  log = v40;
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)valuePtr = 0;
                    _os_log_impl(&dword_1D3C3F000, log, OS_LOG_TYPE_ERROR, "Unable to serialize archivedData, error not returned.", valuePtr, 2u);
                  }
                }
              }

            }
          }
        }
      }

      v17 = v45;
    }
    else
    {
      v30 = 0;
      v5 = v11;
      v9 = v47;
    }
    -[MMCSHTTPContext dataTask](self, "dataTask");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[MMCSHTTPContext setUrlSession:](self, "setUrlSession:", v30);
      -[MMCSHTTPContext dataTask](self, "dataTask");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "resume");

      error = 0;
      goto LABEL_70;
    }
    -[MMCSHTTPContext setIsTaskDone:](self, "setIsTaskDone:", 1);
    error = mmcs_cferror_create_error(CFSTR("com.apple.mmcs"), 50, CFSTR("Session was invalidated"));

LABEL_69:
    goto LABEL_70;
  }
  error = mmcs_cferror_create_error(CFSTR("com.apple.mmcs"), 1, CFSTR("CFHTTPMessageCopyRequestMethod failed"));
LABEL_70:

  return error;
}

- (void)dealloc
{
  NSObject *v3;
  CFStringRef v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  CFStringRef v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (gMMCS_DebugLevel >= 5)
  {
    v3 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("dealloc"));
      v5 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v8 = v4;
        _os_log_impl(&dword_1D3C3F000, v5, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v4)
        CFRelease(v4);
    }
  }
  if (-[MMCSHTTPContext activityMarker](self, "activityMarker"))
    os_release(-[MMCSHTTPContext activityMarker](self, "activityMarker"));
  -[MMCSHTTPContext setActivityMarker:](self, "setActivityMarker:", 0);
  if (-[MMCSHTTPContext hc](self, "hc"))
    C3BaseRelease(-[MMCSHTTPContext hc](self, "hc"));
  -[MMCSHTTPContext setHc:](self, "setHc:", 0);
  v6.receiver = self;
  v6.super_class = (Class)MMCSHTTPContext;
  -[MMCSHTTPContext dealloc](&v6, sel_dealloc);
}

- (void)cleanupResponse
{
  -[MMCSHTTPContext invalidate](self, "invalidate");
  -[MMCSHTTPContext setUrlSession:](self, "setUrlSession:", 0);
  -[MMCSHTTPContext setDataTask:](self, "setDataTask:", 0);
}

- (void)invalidate
{
  NSObject *v3;
  CFStringRef v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  CFStringRef v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (gMMCS_DebugLevel >= 4)
  {
    v3 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ invalidate"), self);
      v5 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v8 = v4;
        _os_log_impl(&dword_1D3C3F000, v5, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v4)
        CFRelease(v4);
    }
  }
  -[MMCSHTTPContext invalidateStreamPair](self, "invalidateStreamPair");
  -[MMCSHTTPContext setIsValid:](self, "setIsValid:", 0);
  -[MMCSHTTPContext dataTask](self, "dataTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[MMCSHTTPContext setDataTask:](self, "setDataTask:", 0);
  -[MMCSHTTPContext setUrlSession:](self, "setUrlSession:", 0);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id);
  os_activity_scope_state_s v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id))a7;
  os_activity_scope_enter((os_activity_t)-[MMCSHTTPContext activityMarker](self, "activityMarker", 0, 0), &v17);
  v16[2](v16, v15);
  os_activity_scope_leave(&v17);

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11;
  NSObject *v12;
  CFStringRef v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  CFStringRef v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v30;
  _QWORD v31[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CFStringRef v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v11 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)-[MMCSHTTPContext activityMarker](self, "activityMarker"), &state);
  if (gMMCS_DebugLevel >= 5)
  {
    v12 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ %@ %@ didSendBodyData:%lld totalBytesSent:%lld totalBytesExpectedToSend:%lld"), self, v30, v11, a5, a6, a7);
      v14 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v13;
        _os_log_impl(&dword_1D3C3F000, v14, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v13)
        CFRelease(v13);
    }
  }
  if (-[MMCSHTTPContext isValid](self, "isValid"))
  {
    -[MMCSHTTPContext dataTask](self, "dataTask");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "taskDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[MMCSHTTPContext dataTask](self, "dataTask");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "taskDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "taskDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) != 0)
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __91__MMCSHTTPContext_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
        v31[3] = &unk_1E9584670;
        v31[4] = self;
        v31[5] = a5;
        v31[6] = a6;
        v31[7] = a7;
        HttpContextPerformBlockAsync(self, v31);
        goto LABEL_22;
      }
    }
    else
    {

    }
    v24 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "taskDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MMCSHTTPContext dataTask](self, "dataTask");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "taskDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ unknown task %@. Expected %@: ignoring delegate callback"), self, v25, v27);

      v28 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v22;
        _os_log_impl(&dword_1D3C3F000, v28, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v22)
LABEL_21:
        CFRelease(v22);
    }
  }
  else
  {
    v21 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ invalid: ignoring delegate callback"), self);
      v23 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v22;
        _os_log_impl(&dword_1D3C3F000, v23, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v22)
        goto LABEL_21;
    }
  }
LABEL_22:
  os_activity_scope_leave(&state);

}

void __91__MMCSHTTPContext_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  NSObject *v2;
  CFStringRef v3;
  NSObject *v4;
  uint8_t buf[4];
  CFStringRef v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isValid") & 1) != 0)
  {
    mmcs_nshttp_sent_data(objc_msgSend(*(id *)(a1 + 32), "hc"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("mmcs runloop: %@ invalid: ignoring delegate callback"), *(_QWORD *)(a1 + 32));
      v4 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v6 = v3;
        _os_log_impl(&dword_1D3C3F000, v4, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v3)
        CFRelease(v3);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  CFStringRef v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  CFStringRef v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  void (**v31)(id, _QWORD);
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CFStringRef v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)-[MMCSHTTPContext activityMarker](self, "activityMarker"), &state);
  if (gMMCS_DebugLevel >= 5)
  {
    v11 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ %@ %@ needNewBodyStream"), self, v8, v9);
      v13 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v12;
        _os_log_impl(&dword_1D3C3F000, v13, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v12)
        CFRelease(v12);
    }
  }
  if (!-[MMCSHTTPContext isValid](self, "isValid"))
  {
    v20 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_22;
    v21 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ invalid: calling completionHandler with nil"), self);
    v22 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_impl(&dword_1D3C3F000, v22, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v21)
      goto LABEL_22;
LABEL_21:
    CFRelease(v21);
LABEL_22:
    v10[2](v10, 0);
    goto LABEL_23;
  }
  -[MMCSHTTPContext dataTask](self, "dataTask");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "taskDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

    goto LABEL_17;
  }
  -[MMCSHTTPContext dataTask](self, "dataTask");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "taskDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "taskDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if ((v19 & 1) == 0)
  {
LABEL_17:
    v23 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      goto LABEL_22;
    objc_msgSend(v9, "taskDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MMCSHTTPContext dataTask](self, "dataTask");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "taskDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ unknown task %@. Expected %@: ignoring delegate callback"), self, v24, v26);

    v27 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_impl(&dword_1D3C3F000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v21)
      goto LABEL_22;
    goto LABEL_21;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __53__MMCSHTTPContext_URLSession_task_needNewBodyStream___block_invoke;
  v28[3] = &unk_1E9584698;
  v28[4] = self;
  v31 = v10;
  v29 = v8;
  v30 = v9;
  HttpContextPerformBlockAsync(self, v28);

LABEL_23:
  os_activity_scope_leave(&state);

}

void __53__MMCSHTTPContext_URLSession_task_needNewBodyStream___block_invoke(uint64_t a1)
{
  NSObject *v2;
  CFStringRef v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  CFStringRef v7;
  NSObject *v8;
  uint8_t buf[4];
  CFStringRef v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isValid") & 1) != 0)
  {
    if (gMMCS_DebugLevel >= 4)
    {
      v2 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ %@ %@ needNewBodyStream on run loop"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v4 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v10 = v3;
          _os_log_impl(&dword_1D3C3F000, v4, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
        if (v3)
          CFRelease(v3);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setDidOpen:", 0);
    if (objc_msgSend(*(id *)(a1 + 32), "createNewRequestBodyInputStream"))
    {
      objc_msgSend(*(id *)(a1 + 32), "inputStream");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v6 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("mmcs runloop: %@ invalid. Returning nil body stream"), *(_QWORD *)(a1 + 32));
      v8 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v7;
        _os_log_impl(&dword_1D3C3F000, v8, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v7)
        CFRelease(v7);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  CFAbsoluteTime Current;
  MMCSHTTPContext *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  CFStringRef v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  CFStringRef v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CFStringRef v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v8 = a4;
  v9 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)-[MMCSHTTPContext activityMarker](self, "activityMarker"), &state);
  -[MMCSHTTPContext setIsTaskDone:](self, "setIsTaskDone:", 1);
  if ((double)-[MMCSHTTPContext hc](self, "hc")[120] == 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    *(CFAbsoluteTime *)(-[MMCSHTTPContext hc](self, "hc") + 120) = Current;
  }
  v11 = self;
  objc_sync_enter(v11);
  -[MMCSHTTPContext setIsHandlingError:](v11, "setIsHandlingError:", 1);
  objc_sync_exit(v11);

  -[MMCSHTTPContext cleanupRequest](v11, "cleanupRequest");
  objc_msgSend(v8, "_timingData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "originalRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "description");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = &stru_1E95863B0;
    }
    v17 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ with %@ did complete %@"), v11, v15, v16, v33);
    if (v9)

    v18 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v17;
      _os_log_impl(&dword_1D3C3F000, v18, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v17)
      CFRelease(v17);
  }
  if (-[MMCSHTTPContext isValid](v11, "isValid"))
  {
    -[MMCSHTTPContext dataTask](v11, "dataTask");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "taskDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[MMCSHTTPContext dataTask](v11, "dataTask");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "taskDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "taskDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if ((v24 & 1) != 0)
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __56__MMCSHTTPContext_URLSession_task_didCompleteWithError___block_invoke;
        v34[3] = &unk_1E95846C0;
        v34[4] = v11;
        v35 = v12;
        v36 = v8;
        v37 = v9;
        HttpContextPerformBlockAsync(v11, v34);

        goto LABEL_28;
      }
    }
    else
    {

    }
    v28 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "taskDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MMCSHTTPContext dataTask](v11, "dataTask");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "taskDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ unknown task %@. Expected %@: ignoring delegate callback"), v11, v29, v31);

      v32 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v26;
        _os_log_impl(&dword_1D3C3F000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v26)
LABEL_27:
        CFRelease(v26);
    }
  }
  else
  {
    v25 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ invalid: ignoring delegate callback"), v11);
      v27 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v26;
        _os_log_impl(&dword_1D3C3F000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v26)
        goto LABEL_27;
    }
  }
LABEL_28:

  os_activity_scope_leave(&state);
}

void __56__MMCSHTTPContext_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFAllocator *v3;
  void *v4;
  void *v5;
  void *v6;
  CFStringRef v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  CFStringRef v12;
  NSObject *v13;
  uint8_t buf[4];
  CFStringRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isValid") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setTimingData:", *(_QWORD *)(a1 + 40));
    if (gMMCS_DebugLevel >= 5)
    {
      v2 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v4 = *(void **)(a1 + 32);
        objc_msgSend(v4, "timingData");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "description");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = CFStringCreateWithFormat(v3, 0, CFSTR("%@ %@"), v4, v6);

        v8 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v15 = v7;
          _os_log_impl(&dword_1D3C3F000, v8, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
        if (v7)
          CFRelease(v7);
      }
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "didOpen") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setDidOpen:", 1);
      mmcs_nshttp_did_open(objc_msgSend(*(id *)(a1 + 32), "hc"));
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "hc");
    v10 = objc_msgSend(*(id *)(a1 + 48), "countOfBytesSent");
    objc_msgSend(*(id *)(a1 + 48), "countOfBytesExpectedToSend");
    mmcs_nshttp_sent_data(v9, 0, v10);
    mmcs_nshttp_did_complete(objc_msgSend(*(id *)(a1 + 32), "hc"), *(id *)(a1 + 56));
  }
  else
  {
    v11 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("mmcs runloop: %@ invalid: ignoring delegate callback"), *(_QWORD *)(a1 + 32));
      v13 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v12;
        _os_log_impl(&dword_1D3C3F000, v13, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v12)
        CFRelease(v12);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  CFStringRef v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  CFStringRef v24;
  NSObject *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CFStringRef v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)-[MMCSHTTPContext activityMarker](self, "activityMarker"), &state);
  if (-[MMCSHTTPContext isValid](self, "isValid"))
  {
    -[MMCSHTTPContext dataTask](self, "dataTask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "taskDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[MMCSHTTPContext dataTask](self, "dataTask");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "taskDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "taskDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v16 & 1) != 0)
      {
LABEL_16:
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __54__MMCSHTTPContext_URLSession_dataTask_didReceiveData___block_invoke;
        v26[3] = &unk_1E95846E8;
        v26[4] = self;
        v27 = v9;
        v28 = v10;
        HttpContextPerformBlockSync(self, v26);

        goto LABEL_17;
      }
    }
    else
    {

    }
    v20 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "taskDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MMCSHTTPContext dataTask](self, "dataTask");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "taskDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ unknown task %@. Expected %@: ignoring delegate callback"), self, v21, v23);

      v25 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v24;
        _os_log_impl(&dword_1D3C3F000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v24)
        CFRelease(v24);
    }
    goto LABEL_16;
  }
  v17 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ invalid: ignoring delegate callback"), self);
    v19 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_impl(&dword_1D3C3F000, v19, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v18)
      CFRelease(v18);
  }
LABEL_17:
  os_activity_scope_leave(&state);

}

void __54__MMCSHTTPContext_URLSession_dataTask_didReceiveData___block_invoke(id *a1)
{
  NSObject *v2;
  const __CFAllocator *v3;
  id v4;
  void *v5;
  CFStringRef v6;
  NSObject *v7;
  NSObject *v8;
  CFStringRef v9;
  NSObject *v10;
  uint8_t buf[4];
  CFStringRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1[4], "isValid") & 1) != 0)
  {
    if ((objc_msgSend(a1[4], "didOpen") & 1) == 0)
    {
      v2 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v4 = a1[4];
        objc_msgSend(a1[5], "response");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = CFStringCreateWithFormat(v3, 0, CFSTR("%@ not already open. Is there a response?'%@'"), v4, v5);

        v7 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v12 = v6;
          _os_log_impl(&dword_1D3C3F000, v7, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }
        if (v6)
          CFRelease(v6);
      }
      objc_msgSend(a1[4], "setDidOpen:", 1);
      mmcs_nshttp_did_open(objc_msgSend(a1[4], "hc"));
    }
    mmcs_nshttp_received_data(objc_msgSend(a1[4], "hc"), a1[6]);
  }
  else
  {
    v8 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("mmcs runloop: %@ invalid: ignoring delegate callback"), a1[4]);
      v10 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v9;
        _os_log_impl(&dword_1D3C3F000, v10, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v9)
        CFRelease(v9);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  CFStringRef v14;
  NSObject *v15;
  CFAbsoluteTime Current;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  CFStringRef v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[5];
  void (**v33)(id, _QWORD);
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CFStringRef v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)-[MMCSHTTPContext activityMarker](self, "activityMarker"), &state);
  v13 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ URLSession:%@ dataTask:%@ didReceiveResponse:%@"), self, v31, v10, v11);
    v15 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v14;
      _os_log_impl(&dword_1D3C3F000, v15, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v14)
      CFRelease(v14);
  }
  if ((double)-[MMCSHTTPContext hc](self, "hc")[120] == 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    *(CFAbsoluteTime *)(-[MMCSHTTPContext hc](self, "hc") + 120) = Current;
  }
  if (!-[MMCSHTTPContext isValid](self, "isValid"))
  {
    v23 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    v24 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ invalid: calling completionHandler with NSURLSessionResponseCancel"), self);
    v25 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v24;
      _os_log_impl(&dword_1D3C3F000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v24)
      goto LABEL_23;
LABEL_22:
    CFRelease(v24);
LABEL_23:
    v12[2](v12, 0);
    goto LABEL_24;
  }
  -[MMCSHTTPContext dataTask](self, "dataTask");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "taskDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    goto LABEL_18;
  }
  -[MMCSHTTPContext dataTask](self, "dataTask");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "taskDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "taskDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if ((v22 & 1) == 0)
  {
LABEL_18:
    v26 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    objc_msgSend(v10, "taskDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MMCSHTTPContext dataTask](self, "dataTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "taskDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ unknown task %@. Expected %@: ignoring delegate callback"), self, v27, v29);

    v30 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v24;
      _os_log_impl(&dword_1D3C3F000, v30, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v24)
      goto LABEL_23;
    goto LABEL_22;
  }
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __76__MMCSHTTPContext_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v32[3] = &unk_1E9584710;
  v32[4] = self;
  v33 = v12;
  HttpContextPerformBlockAsync(self, v32);

LABEL_24:
  os_activity_scope_leave(&state);

}

uint64_t __76__MMCSHTTPContext_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v3;
  CFStringRef v4;
  NSObject *v5;
  uint8_t buf[4];
  CFStringRef v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isValid") & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "didOpen") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setDidOpen:", 1);
      mmcs_nshttp_did_open(objc_msgSend(*(id *)(a1 + 32), "hc"));
    }
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    v3 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("mmcs runloop: %@ invalid: ignoring delegate callback"), *(_QWORD *)(a1 + 32));
      v5 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v7 = v4;
        _os_log_impl(&dword_1D3C3F000, v5, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v4)
        CFRelease(v4);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  NSObject *v12;
  CFStringRef v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  CFStringRef v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  CFStringRef v36;
  NSObject *v37;
  NSObject *v38;
  _BOOL4 v39;
  NSObject *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  void (**v47)(id, _QWORD);
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CFStringRef v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v10 = a4;
  v42 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)-[MMCSHTTPContext activityMarker](self, "activityMarker"), &state);
  if (gMMCS_DebugLevel >= 4)
  {
    v12 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ %@ %@ %@"), self, v41, v10, v42);
      v14 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v13;
        _os_log_impl(&dword_1D3C3F000, v14, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v13)
        CFRelease(v13);
    }
  }
  if (!-[MMCSHTTPContext isValid](self, "isValid"))
  {
    v25 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ invalid: calling completionHandler with nil request"), self);
    v27 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v26;
      _os_log_impl(&dword_1D3C3F000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v26)
      goto LABEL_26;
LABEL_25:
    CFRelease(v26);
LABEL_26:
    v33 = 0;
LABEL_27:
    ((void (**)(id, id))v11)[2](v11, v33);
    goto LABEL_28;
  }
  -[MMCSHTTPContext dataTask](self, "dataTask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "taskDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {

    goto LABEL_21;
  }
  -[MMCSHTTPContext dataTask](self, "dataTask");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "taskDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "taskDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if ((v20 & 1) == 0)
  {
LABEL_21:
    v28 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    objc_msgSend(v10, "taskDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MMCSHTTPContext dataTask](self, "dataTask");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "taskDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ unknown task %@. Expected %@: ignoring delegate callback"), self, v29, v31);

    v32 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v26;
      _os_log_impl(&dword_1D3C3F000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v26)
      goto LABEL_26;
    goto LABEL_25;
  }
  if (!-[MMCSHTTPContext requestIsStreamed](self, "requestIsStreamed"))
  {
    v33 = v42;
    if (gMMCS_DebugLevel < 5)
      goto LABEL_27;
    v34 = mmcs_logging_logger_default();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);
    v33 = v42;
    if (!v35)
      goto LABEL_27;
    v36 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ %@ %@ %@ is not streamed; using as is."),
            self,
            v41,
            v10,
            v42);
    v37 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v36;
      _os_log_impl(&dword_1D3C3F000, v37, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    v33 = v42;
    if (!v36)
      goto LABEL_27;
LABEL_34:
    CFRelease(v36);
    v33 = v42;
    goto LABEL_27;
  }
  if (-[MMCSHTTPContext requestIsStreamed](self, "requestIsStreamed"))
  {
    objc_msgSend(v42, "HTTPBodyStream");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v42, "HTTPBodyStream");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MMCSHTTPContext inputStream](self, "inputStream");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22 == v23;

      if (v24)
      {
        v33 = v42;
        if (gMMCS_DebugLevel < 5)
          goto LABEL_27;
        v38 = mmcs_logging_logger_default();
        v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
        v33 = v42;
        if (!v39)
          goto LABEL_27;
        v36 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ %@ %@ %@ is streamed, and the request input stream is non-nil and equal context input stream; using as is."),
                self,
                v41,
                v10,
                v42);
        v40 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v50 = v36;
          _os_log_impl(&dword_1D3C3F000, v40, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
        v33 = v42;
        if (!v36)
          goto LABEL_27;
        goto LABEL_34;
      }
    }
  }
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __94__MMCSHTTPContext_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
  v43[3] = &unk_1E9584738;
  v43[4] = self;
  v47 = v11;
  v44 = v41;
  v45 = v10;
  v46 = v42;
  HttpContextPerformBlockAsync(self, v43);

LABEL_28:
  os_activity_scope_leave(&state);

}

void __94__MMCSHTTPContext_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFAllocator *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  CFStringRef v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  CFStringRef v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v18;
  uint8_t buf[4];
  CFStringRef v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isValid") & 1) != 0)
  {
    if (gMMCS_DebugLevel >= 5)
    {
      v2 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v4 = *(void **)(a1 + 32);
        v18 = *(_OWORD *)(a1 + 40);
        v5 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v4, "inputStream");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = CFSTR("using existing stream");
        if (!v6)
          v7 = CFSTR("creating new stream");
        v8 = CFStringCreateWithFormat(v3, 0, CFSTR("%@ %@ %@ %@ is streamed, and the request input stream is nil or not equal the context input stream; %@."),
               v4,
               v18,
               v5,
               v7);

        v9 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v8;
          _os_log_impl(&dword_1D3C3F000, v9, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
        if (v8)
          CFRelease(v8);
      }
    }
    mmcs_http_context_mark_as_writing(objc_msgSend(*(id *)(a1 + 32), "hc"));
    objc_msgSend(*(id *)(a1 + 32), "inputStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      objc_msgSend(*(id *)(a1 + 32), "createNewRequestBodyInputStream");
    objc_msgSend(*(id *)(a1 + 32), "inputStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
      objc_msgSend(*(id *)(a1 + 32), "inputStream");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHTTPBodyStream:", v13);

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      return;
    }
    v17 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v15 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("mmcs runloop: %@ unable to create new input stream"), *(_QWORD *)(a1 + 32));
      v16 = mmcs_logging_logger_default();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      *(_DWORD *)buf = 138543362;
      v20 = v15;
LABEL_20:
      _os_log_impl(&dword_1D3C3F000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
LABEL_21:
      if (v15)
        CFRelease(v15);
    }
  }
  else
  {
    v14 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("mmcs runloop: %@ invalid: ignoring delegate callback"), *(_QWORD *)(a1 + 32));
      v16 = mmcs_logging_logger_default();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      *(_DWORD *)buf = 138543362;
      v20 = v15;
      goto LABEL_20;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CFStringRef v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  MMCSHTTPContext *v20;
  NSObject *v21;
  CFStringRef v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CFStringRef v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)-[MMCSHTTPContext activityMarker](self, "activityMarker"), &state);
  v11 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ %@ %@ _willRetryBackgroundDataTask after error %@"), self, v8, v9, v10);
    v13 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_impl(&dword_1D3C3F000, v13, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v12)
      CFRelease(v12);
  }
  if (-[MMCSHTTPContext isValid](self, "isValid"))
  {
    -[MMCSHTTPContext dataTask](self, "dataTask");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "taskDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[MMCSHTTPContext dataTask](self, "dataTask");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "taskDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "taskDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if ((v19 & 1) != 0)
      {
        v20 = self;
        objc_sync_enter(v20);
        -[MMCSHTTPContext setIsHandlingError:](v20, "setIsHandlingError:", 1);
        objc_sync_exit(v20);

        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __69__MMCSHTTPContext_URLSession__willRetryBackgroundDataTask_withError___block_invoke;
        v29[3] = &unk_1E95846E8;
        v29[4] = v20;
        v30 = v9;
        v31 = v10;
        HttpContextPerformBlockSync(v20, v29);

        goto LABEL_21;
      }
    }
    else
    {

    }
    v24 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "taskDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MMCSHTTPContext dataTask](self, "dataTask");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "taskDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ unknown task %@. Expected %@: ignoring delegate callback"), self, v25, v27);

      v28 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v22;
        _os_log_impl(&dword_1D3C3F000, v28, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v22)
LABEL_20:
        CFRelease(v22);
    }
  }
  else
  {
    v21 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ invalid: ignoring delegate callback"), self);
      v23 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v22;
        _os_log_impl(&dword_1D3C3F000, v23, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v22)
        goto LABEL_20;
    }
  }
LABEL_21:
  os_activity_scope_leave(&state);

}

void __69__MMCSHTTPContext_URLSession__willRetryBackgroundDataTask_withError___block_invoke(id *a1)
{
  NSObject *v2;
  CFStringRef v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  CFStringRef v7;
  NSObject *v8;
  uint64_t user_data;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFStringRef v17;
  NSObject *v18;
  id v19;
  const __CFString *v20;
  NSObject *v21;
  CFStringRef v22;
  NSObject *v23;
  __CFError *error_with_underlying_error;
  id v25;
  uint8_t buf[4];
  CFStringRef v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v25 = a1[4];
    v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("mmcs runloop: %@ synchronous callback"));
    v4 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v3;
      _os_log_impl(&dword_1D3C3F000, v4, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v3)
      CFRelease(v3);
  }
  if ((objc_msgSend(a1[4], "isValid") & 1) != 0)
  {
    objc_msgSend(a1[5], "_timingData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setTimingData:", v5);

    objc_msgSend(a1[4], "invalidateStreamPair");
    mmcs_nshttp_will_retry_in_background(objc_msgSend(a1[4], "hc"), a1[6]);
    if (!objc_msgSend(a1[4], "hc") || *(_BYTE *)(objc_msgSend(a1[4], "hc") + 292))
      goto LABEL_9;
    user_data = mmcs_http_context_get_user_data(objc_msgSend(a1[4], "hc"));
    if (*(_QWORD *)(objc_msgSend(a1[4], "hc") + 368) && *(_BYTE *)(*(_QWORD *)(objc_msgSend(a1[4], "hc") + 368) + 76))
    {
      objc_msgSend(a1[6], "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
      {
        v11 = objc_msgSend(a1[6], "code");

        if (v11 == -1001)
        {
          v12 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v17 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("Cancelling request with FailFail enabled after initial background error"));
            v18 = mmcs_logging_logger_default();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v27 = v17;
              _os_log_impl(&dword_1D3C3F000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }
            if (v17)
              CFRelease(v17);
          }
          v19 = a1[6];
          v20 = CFSTR("Fastfail enabled; cancelling background request after timeout.");
LABEL_36:
          error_with_underlying_error = mmcs_cferror_create_error_with_underlying_error(CFSTR("com.apple.mmcs"), 38, v19, v20, v13, v14, v15, v16, (char)v25);
          mmcs_http_context_should_cancel((_BYTE *)objc_msgSend(a1[4], "hc"), error_with_underlying_error);
          if (error_with_underlying_error)
            CFRelease(error_with_underlying_error);
        }
      }
      else
      {

      }
    }
    else if (mmcs_http_context_is_request_body_done(objc_msgSend(a1[4], "hc"))
           && user_data
           && mmcs_http_request_is_put_complete_at_edge_protocol_v2(*(_QWORD *)(user_data + 24)))
    {
      v21 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("Cancelling background retry with PutCompleteAtEdge && RequestBodyDone after initial background error"));
        v23 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v22;
          _os_log_impl(&dword_1D3C3F000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
        if (v22)
          CFRelease(v22);
      }
      v19 = a1[6];
      v20 = CFSTR("PutCompleteAtEdge && RequestBodyDone; cancelling background request upon automatic retry.");
      goto LABEL_36;
    }
LABEL_9:
    if (objc_msgSend(a1[4], "isValid"))
      objc_msgSend(a1[4], "setDidOpen:", 0);
    return;
  }
  v6 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("mmcs runloop: %@ invalid: ignoring delegate callback"), a1[4]);
    v8 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v7;
      _os_log_impl(&dword_1D3C3F000, v8, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v7)
      CFRelease(v7);
  }
}

- (mmcs_http_context)hc
{
  return self->_hc;
}

- (void)setHc:(mmcs_http_context *)a3
{
  self->_hc = a3;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setInputStream:(id)a3
{
  objc_storeStrong((id *)&self->_inputStream, a3);
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setOutputStream:(id)a3
{
  objc_storeStrong((id *)&self->_outputStream, a3);
}

- (NSURLSessionDataTask)dataTask
{
  return self->_dataTask;
}

- (void)setDataTask:(id)a3
{
  objc_storeStrong((id *)&self->_dataTask, a3);
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
  objc_storeStrong((id *)&self->_timingData, a3);
}

- (BOOL)didOpen
{
  return self->_didOpen;
}

- (void)setDidOpen:(BOOL)a3
{
  self->_didOpen = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isTaskDone
{
  return self->_isTaskDone;
}

- (void)setIsTaskDone:(BOOL)a3
{
  self->_isTaskDone = a3;
}

- (BOOL)requestIsStreamed
{
  return self->_requestIsStreamed;
}

- (void)setRequestIsStreamed:(BOOL)a3
{
  self->_requestIsStreamed = a3;
}

- (BOOL)isHandlingError
{
  return self->_isHandlingError;
}

- (void)setIsHandlingError:(BOOL)a3
{
  self->_isHandlingError = a3;
}

- (os_activity_s)activityMarker
{
  return self->_activityMarker;
}

- (void)setActivityMarker:(os_activity_s *)a3
{
  self->_activityMarker = a3;
}

- (int64_t)containerType
{
  return self->_containerType;
}

- (void)setContainerType:(int64_t)a3
{
  self->_containerType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

- (void)initWithContext:options:activityMarker:.cold.1()
{
  __assert_rtn("-[MMCSHTTPContext initWithContext:options:activityMarker:]", "MMCSHTTPContext.m", 332, "hc");
}

@end
