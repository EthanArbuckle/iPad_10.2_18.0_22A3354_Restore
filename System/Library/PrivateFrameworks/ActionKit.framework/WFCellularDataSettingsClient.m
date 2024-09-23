@implementation WFCellularDataSettingsClient

- (WFCellularDataSettingsClient)initWithServerConnection:(__CTServerConnection *)a3
{
  WFCellularDataSettingsClient *v5;
  WFCellularDataSettingsClient *v6;
  void *v9;
  objc_super v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCellularDataSettingsClient.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverConnection"));

  }
  v10.receiver = self;
  v10.super_class = (Class)WFCellularDataSettingsClient;
  v5 = -[WFCellularDataSettingsClient init](&v10, sel_init);
  if (v5)
  {
    v5->_connection = (__CTServerConnection *)CFRetain(a3);
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_connection);
  v3.receiver = self;
  v3.super_class = (Class)WFCellularDataSettingsClient;
  -[WFCellularDataSettingsClient dealloc](&v3, sel_dealloc);
}

- (void)getStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  __CTServerConnection *connection;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  _BYTE buf[24];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v14 = 0;
  connection = self->_connection;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v6 = get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr;
  v16 = get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr;
  if (!get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr)
  {
    v7 = CoreTelephonyLibrary_42510();
    v6 = dlsym(v7, "_CTServerConnectionGetCellularDataIsEnabled");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v6;
    get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(buf, 8);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CTError WF_CTServerConnectionGetCellularDataIsEnabled(CTServerConnectionRef, Boolean *)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("WFCellularDataSettingsClient.m"), 20, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v8 = ((uint64_t (*)(__CTServerConnection *, unsigned __int8 *))v6)(connection, &v14);
  WFNSErrorFromCTError(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v4[2](v4, 0, v9);
  }
  else
  {
    v10 = v14;
    getWFBundledIntentsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFCellularDataSettingsClient getStateWithCompletionHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v10 == 1;
      _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_INFO, "%s Retrieved Cellular Data state: %d", buf, 0x12u);
    }

    ((void (**)(id, BOOL, void *))v4)[2](v4, v10 == 1, 0);
  }

}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *);
  __CTServerConnection *connection;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _BYTE buf[24];
  void *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  connection = self->_connection;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v8 = get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_ptr;
  v16 = get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_ptr;
  if (!get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_ptr)
  {
    v9 = CoreTelephonyLibrary_42510();
    v8 = dlsym(v9, "_CTServerConnectionSetCellularDataIsEnabled");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
    get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(buf, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CTError WF_CTServerConnectionSetCellularDataIsEnabled(CTServerConnectionRef, Boolean)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("WFCellularDataSettingsClient.m"), 21, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v10 = ((uint64_t (*)(__CTServerConnection *, _BOOL8))v8)(connection, v4);
  WFNSErrorFromCTError(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v6[2](v6, v11);
  }
  else
  {
    getWFBundledIntentsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFCellularDataSettingsClient setState:completionHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_INFO, "%s Set Cellular Data state to %d", buf, 0x12u);
    }

    v6[2](v6, 0);
  }

}

- (__CTServerConnection)connection
{
  return self->_connection;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v12[0] = 0;
  v13 = 0u;
  v14 = 0;
  v12[1] = a1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v5 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr_42543;
  v18 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr_42543;
  if (!get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr_42543)
  {
    v6 = CoreTelephonyLibrary_42510();
    v5 = dlsym(v6, "_CTServerConnectionCreateWithIdentifier");
    v16[3] = (uint64_t)v5;
    get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr_42543 = v5;
  }
  _Block_object_dispose(&v15, 8);
  if (v5)
  {
    v7 = ((uint64_t (*)(_QWORD, const __CFString *, uint64_t (*)(), _QWORD *))v5)(*MEMORY[0x24BDBD240], CFSTR("com.apple.shortcuts"), WFCoreTelephonyConnectionCallbackStub_42542, v12);
    if (v7)
    {
      v8 = (const void *)v7;
      v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithServerConnection:", v7);
      CFRelease(v8);
      v4[2](v4, v9, 0);
    }
    else
    {
      WFSettingsClientError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CTServerConnectionRef WF_CTServerConnectionCreateWithIdentifier(CFAllocatorRef, CFStringRef, CTServerConnectionCallback, _CTServerConnectionContext *)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("WFCellularDataSettingsClient.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

@end
