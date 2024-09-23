@implementation DTXPCControlService

+ (void)registerCapabilities:(id)a3
{
  objc_msgSend(a3, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.device.xpccontrol"), 2, a1);
}

- (DTXPCControlService)initWithChannel:(id)a3
{
  id v4;
  DTXPCControlService *v5;
  _QWORD v7[4];
  DTXPCControlService *v8;
  objc_super v9;
  uint8_t buf[4];
  DTXPCControlService *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTXPCControlService;
  v5 = -[DTProcessControlService initWithChannel:](&v9, sel_initWithChannel_, v4);
  if (v5)
  {
    if (sub_222B7F0C4() && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v5;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "XPCControlService %p", buf, 0xCu);
    }
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_222B7F108;
    v7[3] = &unk_24EB27E30;
    v8 = v5;
    objc_msgSend(v4, "registerDisconnectHandler:", v7);

  }
  return v5;
}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (sub_222B7F0C4() && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = v14;
    v35 = 2112;
    v36 = v15;
    v37 = 2112;
    v38 = v16;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCControlService launchSuspendedProcessWithDevicePath called: path=%@, bundleIdentifier=%@, environment=%@, arguments=%@, options=%@", buf, 0x34u);
  }
  if (!objc_msgSend(v13, "length"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid bundle identifier"));
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_opt_new();
  v20 = v19;

  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], DTProcessControlServiceOption_OnceOnlyKey[0]);
  v21 = objc_alloc_init(MEMORY[0x24BE2A968]);
  +[DTXPCServiceController sharedInstance](DTXPCServiceController, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = sub_222B7F41C;
  v27[3] = &unk_24EB2A6C0;
  v27[4] = self;
  v23 = v21;
  v28 = v23;
  objc_msgSend(v22, "registerClient:forXPCService:environment:arguments:options:handler:", self, v13, v14, v15, v20, v27);

  v24 = v28;
  v25 = v23;

  return v25;
}

- (void)messageReceived:(id)a3
{
  id v4;

  if ((id)*MEMORY[0x24BE2A988] == a3)
  {
    +[DTXPCServiceController sharedInstance](DTXPCServiceController, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterClient:withIdentifier:parent:", self, 0, 0);

  }
}

- (void)observeServicesWithIdentifier:(id)a3 requestingProcess:(int)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  DTXPCControlService *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v10 = *(_QWORD *)&a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (sub_222B7F0C4() && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    v27 = v12;
    v28 = 1024;
    v29 = v10;
    v30 = 2112;
    v31 = v13;
    v32 = 2112;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCControlService observeServicesWithIdentifier called: serviceID=%@, requestingProcess=%d, environment=%@, arguments=%@, options=%@", buf, 0x30u);
  }
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_opt_new();
  v19 = v18;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, DTProcessControlServiceOption_RequestingPidKey[0]);

  +[DTXPCServiceController sharedInstance](DTXPCServiceController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_222B7F7EC;
  v23[3] = &unk_24EB2A6C0;
  v24 = v19;
  v25 = self;
  v22 = v19;
  objc_msgSend(v21, "registerClient:forXPCService:environment:arguments:options:handler:", self, v12, v13, v14, v22, v23);

}

- (void)requestDebugLaunchOfDaemonWithSpecifier:(id)a3 programPath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  DTXPCControlService *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (sub_222B7F0C4() && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCControlService requestDebugLaunchOfDaemonWithSpecifier called: specifier=%@, programPath=%@, environment=%@, arguments=%@, options=%@", buf, 0x34u);
  }
  +[DTXPCServiceController sharedInstance](DTXPCServiceController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_222B7FA54;
  v19[3] = &unk_24EB2A6C0;
  v20 = v16;
  v21 = self;
  v18 = v16;
  objc_msgSend(v17, "requestDebugLaunchOfDaemonWithSpecifier:programPath:environment:arguments:options:handler:", v12, v13, v14, v15, v18, v19);

}

- (void)stopObservationsForIdentifier:(id)a3 requestingProcess:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  +[DTXPCServiceController sharedInstance](DTXPCServiceController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterClient:withIdentifier:parent:", self, v6, v4);

}

@end
