@implementation BKPresenceDetectOperation

- (id)optionsDictionaryWithError:(id *)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_priority)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("BKOptionPriority"));

  }
  return v4;
}

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  id v12;
  BiometricKitXPCClient *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    v20 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKPresenceDetectOperation::startOperation (_cid %lu)\n", buf, 0xCu);

  }
  v18 = 0;
  -[BKPresenceDetectOperation optionsDictionaryWithError:](self, "optionsDictionaryWithError:", &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  if (v11)
  {
    v13 = self->super._xpcClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__BKPresenceDetectOperation_startBioOperation_reply___block_invoke;
    v16[3] = &unk_1E5F83DE0;
    v17 = v6;
    -[BiometricKitXPCClient detectPresenceWithOptions:async:withReply:](v13, "detectPresenceWithOptions:async:withReply:", v11, v4, v16);

  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v7;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "options";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_1AF575226;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      v27 = 1024;
      v28 = 1003;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v12);
  }
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = v7;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKPresenceDetectOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __53__BKPresenceDetectOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)a2)
  {
    +[BKErrorHelper errorWithOSStatus:](BKErrorHelper, "errorWithOSStatus:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

@end
