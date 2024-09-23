@implementation WFPersonalHotspotSettingsClient

- (WFPersonalHotspotSettingsClient)initWithClient:(NETRBClient *)a3
{
  WFPersonalHotspotSettingsClient *v5;
  WFPersonalHotspotSettingsClient *v6;
  WFPersonalHotspotSettingsClient *v7;
  void *v10;
  objc_super v11;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPersonalHotspotSettingsClient.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  v11.receiver = self;
  v11.super_class = (Class)WFPersonalHotspotSettingsClient;
  v5 = -[WFPersonalHotspotSettingsClient init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_client = a3;
    v7 = v5;
  }

  return v6;
}

- (void)dealloc
{
  NETRBClient *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v3 = -[WFPersonalHotspotSettingsClient client](self, "client");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = get_NETRBClientDestroySymbolLoc_ptr;
  v12 = get_NETRBClientDestroySymbolLoc_ptr;
  if (!get_NETRBClientDestroySymbolLoc_ptr)
  {
    v5 = NetrbLibrary();
    v4 = dlsym(v5, "_NETRBClientDestroy");
    v10[3] = (uint64_t)v4;
    get_NETRBClientDestroySymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v9, 8);
  if (v4)
  {
    ((void (*)(NETRBClient *))v4)(v3);
    v8.receiver = self;
    v8.super_class = (Class)WFPersonalHotspotSettingsClient;
    -[WFPersonalHotspotSettingsClient dealloc](&v8, sel_dealloc);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_Bool soft_NETRBClientDestroy(NETRBClientRef)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("WFPersonalHotspotSettingsClient.m"), 21, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)getStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, BOOL, _QWORD);
  NETRBClient *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  _BYTE buf[24];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, BOOL, _QWORD))a3;
  v11 = 0;
  v12 = 1020;
  v5 = -[WFPersonalHotspotSettingsClient client](self, "client");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v6 = get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr;
  v14 = get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr;
  if (!get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr)
  {
    v7 = NetrbLibrary();
    v6 = dlsym(v7, "_NETRBClientGetGlobalServiceState");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v6;
    get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(buf, 8);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_Bool soft_NETRBClientGetGlobalServiceState(NETRBClientRef, netrbStateRef, netrbReasonRef)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("WFPersonalHotspotSettingsClient.m"), 22, CFSTR("%s"), dlerror());

    __break(1u);
  }
  ((void (*)(NETRBClient *, int *, int *))v6)(v5, &v12, &v11);
  getWFBundledIntentsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFPersonalHotspotSettingsClient getStateWithCompletionHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Retrieved Personal Hotspot state: %d", buf, 0x12u);
  }

  v4[2](v4, v12 == 1023, 0);
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  uint64_t v7;
  NETRBClient *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BYTE buf[24];
  void *v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (v4)
    v7 = 1023;
  else
    v7 = 1022;
  v8 = -[WFPersonalHotspotSettingsClient client](self, "client");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v9 = get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr;
  v17 = get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr;
  if (!get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr)
  {
    v10 = NetrbLibrary();
    v9 = dlsym(v10, "_NETRBClientSetGlobalServiceState");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;
    get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(buf, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_Bool soft_NETRBClientSetGlobalServiceState(NETRBClientRef, netrbState)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFPersonalHotspotSettingsClient.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
  if (!((unsigned int (*)(NETRBClient *, uint64_t))v9)(v8, v7))
    goto LABEL_18;
  getWFBundledIntentsLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFPersonalHotspotSettingsClient setState:completionHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_INFO, "%s Setting Personal Hotspot state to %d", buf, 0x12u);
  }

  if (!WiFiManagerClientCreate())
    goto LABEL_18;
  WiFiManagerClientSetMISDiscoveryState();
  if ((((WiFiManagerClientGetMISDiscoveryState() == 0) ^ v4) & 1) == 0)
  {
    getWFBundledIntentsLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFPersonalHotspotSettingsClient setState:completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = 0;
      _os_log_impl(&dword_22D353000, v13, OS_LOG_TYPE_ERROR, "%s Failed to set hotspot status with error %@", buf, 0x16u);
    }

LABEL_18:
    WFSettingsClientError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v12 = 0;
LABEL_19:
  v6[2](v6, v12);

}

- (NETRBClient)client
{
  return self->_client;
}

- (void)setClient:(NETRBClient *)a3
{
  self->_client = a3;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v4 = (void (**)(id, void *, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCapability:", *MEMORY[0x24BEC1860]);

  if ((v6 & 1) == 0)
    goto LABEL_7;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v7 = get_NETRBClientCreateSymbolLoc_ptr;
  v16 = get_NETRBClientCreateSymbolLoc_ptr;
  if (!get_NETRBClientCreateSymbolLoc_ptr)
  {
    v8 = NetrbLibrary();
    v7 = dlsym(v8, "_NETRBClientCreate");
    v14[3] = (uint64_t)v7;
    get_NETRBClientCreateSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v13, 8);
  if (v7)
  {
    v9 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v7)(0, 0, 0);
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClient:", v9);
      v4[2](v4, v10, 0);
LABEL_8:

      return;
    }
LABEL_7:
    WFSettingsClientError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v10);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NETRBClientRef soft_NETRBClientCreate(__strong dispatch_queue_t, __strong NETRBEventHandler, __strong xpc_object_t)");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFPersonalHotspotSettingsClient.m"), 20, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
