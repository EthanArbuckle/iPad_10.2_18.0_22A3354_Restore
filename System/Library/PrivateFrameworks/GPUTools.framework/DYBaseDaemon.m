@implementation DYBaseDaemon

- (DYBaseDaemon)init
{
  DYBaseDaemon *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DYBaseDaemon;
  v2 = -[DYBaseDaemon init](&v4, sel_init);
  if (v2)
    v2->_isAppleInternal = os_variant_allows_internal_security_policies();
  return v2;
}

- (void)observeInferior
{
  NSObject *v3;
  _QWORD v4[6];

  v3 = dispatch_source_create(MEMORY[0x24BDAC9F8], self->_inferiorPid, 0x80000000uLL, MEMORY[0x24BDAC9B8]);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__DYBaseDaemon_observeInferior__block_invoke;
  v4[3] = &unk_250D58DC0;
  v4[4] = self;
  v4[5] = v3;
  dispatch_source_set_event_handler(v3, v4);
  dispatch_resume(v3);
  dispatch_retain(v3);
  self->_process_source = (OS_dispatch_source *)v3;
}

void __31__DYBaseDaemon_observeInferior__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(int *)(v2 + 32) >= 1)
  {
    objc_msgSend(*(id *)(v2 + 40), "destroySharedMemoryTransport");
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), CFSTR("GTErrorKeyProcessName"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32)), CFSTR("GTErrorKeyPID"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE60], "now"), CFSTR("GTErrorKeyCrashDate"));
    v4 = objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:attributes:", 1282, v3);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "send:inReplyTo:error:", v4, 0, 0);
    v5 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__DYBaseDaemon_observeInferior__block_invoke_2;
    block[3] = &unk_250D587B0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (v6)
  {
    dispatch_release(v6);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  }
}

_BYTE *__31__DYBaseDaemon_observeInferior__block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "terminate:", 0);
  return result;
}

- (id)captureAPISupportForAPI:(unsigned int)a3
{
  return 0;
}

- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 withAPI:(unsigned int)a4 uniqueIdentifier:(id)a5 error:(id *)a6
{
  DYBaseDaemon *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL result;
  void *v17;
  DYBaseDaemon *v18;
  SEL v19;
  DYBaseDaemon *v20;
  uint64_t v21;

  v10 = self;
  -[DYBaseDaemon setCaptureApiSupport:](self, "setCaptureApiSupport:", -[DYBaseDaemon captureAPISupportForAPI:](self, "captureAPISupportForAPI:", *(_QWORD *)&a4));
  if (a4 || (DYCheckGLDispatchTableSize() & 1) != 0)
  {
    v11 = (void *)-[DYBaseSocketTransport createNewSharedMemoryTransportWithUniqueIdentifier:loadCapture:loadDiagnostics:](v10->_transport, "createNewSharedMemoryTransportWithUniqueIdentifier:loadCapture:loadDiagnostics:", a5, v10->_shouldLoadCapture, v10->_shouldLoadDiagnostics);
    v13 = v12;
    v14 = objc_msgSend(v11, "absoluteString");
    v15 = objc_msgSend(v13, "absoluteString");
    if (v10->_shouldLoadCapture)
    {
      if (!v14)
      {
        v10 = (DYBaseDaemon *)v10->_transport;
        v20 = v10;
        v21 = objc_msgSend((id)-[DYBaseDaemon debugDescription](v10, "debugDescription"), "UTF8String");
        DYLog();
        dy_abort();
LABEL_15:
        objc_msgSend((id)-[DYBaseSocketTransport debugDescription](v10->_transport, "debugDescription", v20, v21), "UTF8String");
        DYLog();
        v18 = (DYBaseDaemon *)dy_abort();
        -[DYBaseDaemon run](v18, v19);
        return result;
      }
      objc_msgSend(a3, "setObject:forKeyedSubscript:", v14, -[DYCaptureAPISupport transportEnvironmentVariable](-[DYBaseDaemon captureApiSupport](v10, "captureApiSupport"), "transportEnvironmentVariable"));
      -[DYCaptureAPISupport interposeDylibPath](v10->_captureApiSupport, "interposeDylibPath");
      DYAppendInsertLibrary();
    }
    if (!v10->_shouldLoadDiagnostics
      || !objc_msgSend((id)-[DYCaptureAPISupport diagnosticsDylibPath](v10->_captureApiSupport, "diagnosticsDylibPath"), "length"))
    {
      return 1;
    }
    if (v15)
    {
      objc_msgSend(a3, "setObject:forKeyedSubscript:", v15, -[DYCaptureAPISupport diagnosticsTransportEnvironmentVariable](-[DYBaseDaemon captureApiSupport](v10, "captureApiSupport"), "diagnosticsTransportEnvironmentVariable"));
      DYAppendInsertLibrary();
      return 1;
    }
    goto LABEL_15;
  }
  if (!a6)
    return 0;
  v17 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 517, 0);
  result = 0;
  *a6 = v17;
  return result;
}

- (void)run
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = (void *)-[DYBaseSocketTransport newSourceWithQueue:](self->_transport, "newSourceWithQueue:", MEMORY[0x24BDAC9B8]);
  if (!v3)
  {
    v5 = objc_msgSend((id)objc_msgSend((id)-[DYBaseSocketTransport error](self->_transport, "error"), "description"), "UTF8String");
    DYLog();
    -[DYBaseDaemon terminate:](self, "terminate:", 1, v5);
  }
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __19__DYBaseDaemon_run__block_invoke;
  v8[3] = &unk_250D587B0;
  v8[4] = self;
  objc_msgSend(v3, "setCancellationHandler:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __19__DYBaseDaemon_run__block_invoke_2;
  v7[3] = &unk_250D58DE8;
  v7[4] = self;
  objc_msgSend(v3, "setMessageHandler:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __19__DYBaseDaemon_run__block_invoke_3;
  v6[3] = &unk_250D587B0;
  v6[4] = self;
  objc_msgSend(v3, "setRegistrationHandler:", v6);
  objc_msgSend(v3, "resume");
  self->_source = (DYTransportSource *)v3;
}

_BYTE *__19__DYBaseDaemon_run__block_invoke(uint64_t a1)
{
  _BYTE *result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "terminate:", 0);
  return result;
}

void __19__DYBaseDaemon_run__block_invoke_2(uint64_t a1, id a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "handleMessage:", a2);

}

uint64_t __19__DYBaseDaemon_run__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "connect"), "BOOLResult");
  if ((result & 1) == 0)
  {
    DYLog();
    result = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(result + 24))
      return objc_msgSend((id)result, "terminate:", 1);
  }
  return result;
}

- (void)handleMessage:(id)a3
{
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  pid_t inferiorPid;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  mach_error_t v17;
  uint64_t v18;
  mach_error_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  mach_port_name_t target_task[2];

  if (objc_msgSend(a3, "kind") == 4353)
  {
    -[DYBaseSocketTransport relayMessageOverSecondarySharedMemoryTransport:error:](self->_transport, "relayMessageOverSecondarySharedMemoryTransport:error:", a3, 0);
    return;
  }
  v5 = objc_msgSend(a3, "kind");
  switch(v5)
  {
    case 1280:
      v6 = objc_msgSend(a3, "plistPayload");
      if (!v6)
        -[DYBaseDaemon terminate:](self, "terminate:", 1);
      v7 = (void *)objc_opt_new();
      *(_QWORD *)target_task = 0;
      if (self->_inferiorPid)
      {
        v8 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 516, 0);
        v9 = 0;
        *(_QWORD *)target_task = v8;
        if (!v8)
        {
LABEL_9:
          -[DYBaseSocketTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:attributes:objectPayload:", 1280, v7, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9)), a3, 0);
          goto LABEL_38;
        }
      }
      else
      {
        v28 = 0;
        v9 = -[DYBaseDaemon launchInferior:finalEnvironment:error:](self, "launchInferior:finalEnvironment:error:", v6, &v28, target_task);
        if (v28)
          objc_msgSend(v7, "setObject:forKey:", v28, CFSTR("final environment"));
        v8 = *(id *)target_task;
        if (!*(_QWORD *)target_task)
          goto LABEL_9;
      }
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v8, "domain"), CFSTR("error domain"));
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)target_task, "code")), CFSTR("error code"));
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)target_task, "localizedDescription"), CFSTR("error description"));
      goto LABEL_9;
    case 1281:
      inferiorPid = self->_inferiorPid;
      if (inferiorPid >= 1)
      {
        if (self->_ownsInferior)
          -[DYBaseSocketTransport sendNewMessage:error:](self->_transport, "sendNewMessage:error:", 1282, 0);
        else
          kill(inferiorPid, 9);
      }
      return;
    case 1282:
    case 1285:
    case 1287:
    case 1288:
    case 1289:
    case 1290:
    case 1291:
    case 1292:
      goto LABEL_12;
    case 1283:
      -[DYBaseDaemon terminate:](self, "terminate:", 0);
      return;
    case 1284:
      v11 = objc_msgSend(a3, "plistPayload");
      if (v11)
      {
        -[DYBaseDaemon setApplications:](self, "setApplications:", v11);
      }
      else
      {
        v21 = -[DYBaseDaemon getApplications](self, "getApplications");
        -[DYBaseSocketTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:plistPayload:", 1284, v21), a3, 0);
      }
      return;
    case 1286:
      v7 = (void *)objc_opt_new();
      *(_QWORD *)target_task = 0;
      if (self->_inferiorPid)
      {
        v12 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 516, 0);
        v13 = 0;
        *(_QWORD *)target_task = v12;
        if (!v12)
          goto LABEL_22;
        goto LABEL_21;
      }
      v22 = (void *)objc_msgSend(a3, "plistPayload");
      if (objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BE39448]))
        v23 = objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BE39420]), "BOOLValue");
      else
        v23 = 1;
      self->_shouldLoadCapture = v23;
      self->_shouldLoadDiagnostics = objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BE39430]), "BOOLValue");
      v13 = (void *)objc_msgSend((id)objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BE39438]), "mutableCopy");
      v24 = (void *)objc_msgSend(v13, "objectForKey:", CFSTR("GPUTOOLS_LOAD_GTMTLCAPTURE"));
      v25 = objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BE39458]);
      objc_msgSend(v24, "intValue");
      DYSetGTMTLCaptureMode();
      -[DYBaseDaemon createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:](self, "createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:", v13, v25, target_task);
      DYModifyEnvironmentForDualCaptureSupport();
      v12 = *(id *)target_task;
      if (*(_QWORD *)target_task)
      {
LABEL_21:
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v12, "domain"), CFSTR("error domain"));
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)target_task, "code")), CFSTR("error code"));
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)target_task, "localizedDescription"), CFSTR("error description"));
      }
LABEL_22:
      v14 = objc_alloc(MEMORY[0x24BE39128]);
      if (v13)
      {
        v15 = (void *)objc_msgSend(v14, "initWithKind:attributes:plistPayload:", 1286, v7, v13);

      }
      else
      {
        v15 = (void *)objc_msgSend(v14, "initWithKind:attributes:payload:", 1286, v7, 0);
      }
      -[DYBaseSocketTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", v15, a3, 0);

LABEL_38:
      return;
    case 1293:
      v16 = self->_inferiorPid;
      if (v16)
      {
        self->_capturingInferior = 0;
        target_task[0] = 0;
        v17 = task_for_pid(*MEMORY[0x24BDAEC58], v16, target_task);
        if (v17)
        {
          v18 = self->_inferiorPid;
          v26 = mach_error_string(v17);
          DYLog();
          -[DYBaseDaemon terminate:](self, "terminate:", 1, v18, v26);
        }
        v19 = task_resume(target_task[0]);
        if (v19)
        {
          v20 = self->_inferiorPid;
          v27 = mach_error_string(v19);
          DYLog();
          -[DYBaseDaemon terminate:](self, "terminate:", 1, v20, v27);
        }
      }
      return;
    default:
      if (v5 == 264)
        self->_capturingInferior = 1;
LABEL_12:
      -[DYBaseSocketTransport relayMessageOverSharedMemoryTransport:error:](self->_transport, "relayMessageOverSharedMemoryTransport:error:", a3, 0);
      return;
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYBaseDaemon;
  -[DYBaseDaemon dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *process_source;

  -[DYTransportSource cancel](self->_source, "cancel");

  self->_source = 0;
  process_source = self->_process_source;
  if (process_source)
  {
    dispatch_source_cancel(process_source);
    dispatch_release((dispatch_object_t)self->_process_source);
    self->_process_source = 0;
  }
  self->_invalidated = 1;
}

- (void)terminate:(int)a3
{
  -[DYBaseDaemon doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 uniqueIdentifier:(id)a4 error:(id *)a5
{
  -[DYBaseDaemon doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (void)setApplications:(id)a3
{
  -[DYBaseDaemon doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)getApplications
{
  -[DYBaseDaemon doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)launchInferior:(id)a3 finalEnvironment:(id *)a4 error:(id *)a5
{
  -[DYBaseDaemon doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (DYBaseSocketTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)inferiorPid
{
  return self->_inferiorPid;
}

- (void)setInferiorPid:(int)a3
{
  self->_inferiorPid = a3;
}

- (NSString)inferiorName
{
  return self->_inferiorName;
}

- (void)setInferiorName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)ownsInferior
{
  return self->_ownsInferior;
}

- (void)setOwnsInferior:(BOOL)a3
{
  self->_ownsInferior = a3;
}

- (DYCaptureAPISupport)captureApiSupport
{
  return self->_captureApiSupport;
}

- (void)setCaptureApiSupport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)capturingInferior
{
  return self->_capturingInferior;
}

- (void)setCapturingInferior:(BOOL)a3
{
  self->_capturingInferior = a3;
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (BOOL)shouldLoadCapture
{
  return self->_shouldLoadCapture;
}

- (void)setShouldLoadCapture:(BOOL)a3
{
  self->_shouldLoadCapture = a3;
}

- (BOOL)shouldLoadDiagnostics
{
  return self->_shouldLoadDiagnostics;
}

- (void)setShouldLoadDiagnostics:(BOOL)a3
{
  self->_shouldLoadDiagnostics = a3;
}

@end
