@implementation CLKComplicationServer

+ (CLKComplicationServer)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__CLKComplicationServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (CLKComplicationServer *)(id)sharedInstance___sharedServer_0;
}

void __39__CLKComplicationServer_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedInstance___sharedServer_0;
  sharedInstance___sharedServer_0 = v1;

}

- (CLKComplicationServer)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("You cannot alloc/init new instances of %@. Use +sharedInstance."), objc_opt_class());

  return 0;
}

- (CLKComplicationServer)initWithClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  CLKComplicationServer *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CLKLoggingObjectForDomain(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2114F4000, v5, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer initWithClientIdentifier: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v6 = (CLKComplicationServer *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_init
{
  CLKComplicationServer *v2;
  void *v3;
  uint64_t v4;
  NSString *clientIdentifier;
  NSString *v6;
  Class v7;
  objc_class *v8;
  NSObject *v9;
  const char *v10;
  id v11;
  uint32_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *templateFinalizationQueue;
  uint8_t v21[8];
  _QWORD handler[4];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)CLKComplicationServer;
  v2 = -[CLKComplicationServer init](&v24, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v2->_clientIdentifier;
    v2->_clientIdentifier = (NSString *)v4;

    objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CLKComplicationPrincipalClass"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v2->_connectionLock._os_unfair_lock_opaque = 0;
    v7 = NSClassFromString(v6);
    v8 = v7;
    if (v7 && -[objc_class conformsToProtocol:](v7, "conformsToProtocol:", &unk_254AC2F38))
    {
      CLKLoggingObjectForDomain(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_2114F4000, v9, OS_LOG_TYPE_DEFAULT, "Principal class %@ conforms to correct protocol", buf, 0xCu);
      }

      v2->_dataSourceClass = v8;
      objc_initWeak((id *)buf, v2);
      v2->_restartNotificationToken = -1;
      v10 = (const char *)objc_msgSend(CFSTR("com.apple.ClockKit.complicationservicedidstart"), "UTF8String");
      v11 = MEMORY[0x24BDAC9B8];
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __30__CLKComplicationServer__init__block_invoke;
      handler[3] = &unk_24CBF9FE0;
      objc_copyWeak(&v23, (id *)buf);
      v12 = notify_register_dispatch(v10, &v2->_restartNotificationToken, MEMORY[0x24BDAC9B8], handler);

      if (v12)
      {
        CLKLoggingObjectForDomain(1);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[CLKComplicationServer _init].cold.1(v12, v13);

      }
      CLKLoggingObjectForDomain(1);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2114F4000, v14, OS_LOG_TYPE_DEFAULT, "creating complication server connection", v21, 2u);
      }

      -[CLKComplicationServer _createConnection](v2, "_createConnection");
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      NSLog(CFSTR("Missing or Invalid Principal Class: (%@). Please check 'ClockKit Complication - Principal' Class property in WatchKit Extension's Info.plist "), v6);
      CLKLoggingObjectForDomain(1);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_2114F4000, v15, OS_LOG_TYPE_DEFAULT, "missing or invalid principal class (%@)", buf, 0xCu);
      }

      CLKLoggingObjectForDomain(1);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2114F4000, v16, OS_LOG_TYPE_DEFAULT, "not creating complication server connection", buf, 2u);
      }

    }
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_DEFAULT, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.ClockKit.timelineFinalization", v17);
    templateFinalizationQueue = v2->_templateFinalizationQueue;
    v2->_templateFinalizationQueue = (OS_dispatch_queue *)v18;

  }
  return v2;
}

void __30__CLKComplicationServer__init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_complicationServiceDidStart");

}

- (void)dealloc
{
  int restartNotificationToken;
  objc_super v4;

  restartNotificationToken = self->_restartNotificationToken;
  if (restartNotificationToken != -1)
    notify_cancel(restartNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)CLKComplicationServer;
  -[CLKComplicationServer dealloc](&v4, sel_dealloc);
}

- (id)serverProxy
{
  os_unfair_lock_s *p_connectionLock;
  void *v4;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  -[NSXPCConnection remoteObjectProxy](self->_serverConnection, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_connectionLock);
  return v4;
}

- (void)reloadTimelineForComplication:(CLKComplication *)complication
{
  CLKComplication *v4;
  id v5;

  v4 = complication;
  -[CLKComplicationServer serverProxy](self, "serverProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadTimelineForComplication:", v4);

}

- (void)extendTimelineForComplication:(CLKComplication *)complication
{
  CLKComplication *v4;
  id v5;

  v4 = complication;
  -[CLKComplicationServer serverProxy](self, "serverProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendTimelineForComplication:", v4);

}

- (void)reloadComplicationDescriptors
{
  id v2;

  -[CLKComplicationServer serverProxy](self, "serverProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadComplicationDescriptors");

}

- (NSArray)activeComplications
{
  return -[NSSet allObjects](self->_activeComplications, "allObjects");
}

- (NSDate)earliestTimeTravelDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[CLKDate complicationDate](CLKDate, "complicationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -1, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (NSDate)latestTimeTravelDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[CLKDate complicationDate](CLKDate, "complicationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 2, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)_createConnection
{
  os_unfair_lock_s *p_connectionLock;
  NSObject *v4;
  NSXPCConnection *serverConnection;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  NSXPCConnection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self->_serverConnection)
  {
    CLKLoggingObjectForDomain(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      serverConnection = self->_serverConnection;
      *(_DWORD *)buf = 138412290;
      v17 = serverConnection;
      _os_log_impl(&dword_2114F4000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating existing server connection (%@) while trying to create a new one", buf, 0xCu);
    }

    -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
    v6 = self->_serverConnection;
    self->_serverConnection = 0;

  }
  v7 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ClockKit.complicationserver"), 4096);
  v8 = self->_serverConnection;
  self->_serverConnection = v7;

  objc_initWeak((id *)buf, self);
  v9 = self->_serverConnection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__CLKComplicationServer__createConnection__block_invoke;
  v14[3] = &unk_24CBF9088;
  objc_copyWeak(&v15, (id *)buf);
  -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v14);
  -[NSXPCConnection setInvalidationHandler:](self->_serverConnection, "setInvalidationHandler:", &__block_literal_global_19);
  v10 = self->_serverConnection;
  CLKComplicationServerInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v11);

  v12 = self->_serverConnection;
  CLKComplicationClientInterface();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v12, "setExportedInterface:", v13);

  -[NSXPCConnection setExportedObject:](self->_serverConnection, "setExportedObject:", self);
  -[NSXPCConnection resume](self->_serverConnection, "resume");
  os_unfair_lock_unlock(p_connectionLock);
  -[CLKComplicationServer _checkinWithServer](self, "_checkinWithServer");
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __42__CLKComplicationServer__createConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  CLKLoggingObjectForDomain(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2114F4000, v2, OS_LOG_TYPE_DEFAULT, "Complication server connection interrupted. Will attempt to reconnect.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkinWithServer");

}

void __42__CLKComplicationServer__createConnection__block_invoke_89()
{
  NSObject *v0;

  CLKLoggingObjectForDomain(1);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __42__CLKComplicationServer__createConnection__block_invoke_89_cold_1();

}

- (void)_complicationServiceDidStart
{
  NSObject *v3;
  uint8_t v4[16];

  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2114F4000, v3, OS_LOG_TYPE_DEFAULT, "Complication server restarted. Reconnecting", v4, 2u);
  }

  -[CLKComplicationServer _createConnection](self, "_createConnection");
}

- (void)_checkinWithServer
{
  NSString *clientIdentifier;
  void *v4;
  void *v5;
  id v6;

  -[CLKComplicationServer serverProxy](self, "serverProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  clientIdentifier = self->_clientIdentifier;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkinWithClientIdentifier:bundlePath:", clientIdentifier, v5);

}

- (void)_createDataSourceIfNecessary
{
  OUTLINED_FUNCTION_0_4(&dword_2114F4000, a1, a3, "%s data source implements widgetMigrator but does not implement migration query method. Widget migration will be unsupported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)_shouldAllowComplication:(id)a3
{
  return 1;
}

- (void)setActiveComplications:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__CLKComplicationServer_setActiveComplications___block_invoke;
  v6[3] = &unk_24CBFA008;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __48__CLKComplicationServer_setActiveComplications___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isEqualToSet:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
      objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("CLKComplicationServerActiveComplicationsDidChangeNotification"), 0);

    CLKLoggingObjectForDomain(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_2114F4000, v3, OS_LOG_TYPE_DEFAULT, "Set active complications to %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)getSupportedTimeTravelDirectionsForComplication:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__CLKComplicationServer_getSupportedTimeTravelDirectionsForComplication_withHandler___block_invoke;
  block[3] = &unk_24CBFAD40;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __85__CLKComplicationServer_getSupportedTimeTravelDirectionsForComplication_withHandler___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __85__CLKComplicationServer_getSupportedTimeTravelDirectionsForComplication_withHandler___block_invoke_2;
  v5[3] = &unk_24CBFAD18;
  v6 = *(id *)(a1 + 48);
  v2 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v5);
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldAllowComplication:", *(_QWORD *)(a1 + 40)) & 1) != 0
    && (v3 = *(_QWORD *)(a1 + 32), *(_BYTE *)(v3 + 56)))
  {
    CLKComplicationTimeTravelDirectionsAssertionBlock(*(void **)(a1 + 48), v2, *(unsigned __int8 *)(v3 + 69), CFSTR("-[CLKComplicationDataSource getSupportedTimeTravelDirectionsForComplication:withHandler:]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getSupportedTimeTravelDirectionsForComplication:withHandler:", *(_QWORD *)(a1 + 40), v4);

  }
  else
  {
    v2[2](v2);
  }

}

uint64_t __85__CLKComplicationServer_getSupportedTimeTravelDirectionsForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getTimelineEndDateForComplication:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke;
  block[3] = &unk_24CBFADB8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v2 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_2;
  v15[3] = &unk_24CBFAD90;
  v3 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v3;
  v17 = *(id *)(a1 + 48);
  v10 = v2;
  v11 = 3221225472;
  v12 = __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_4;
  v13 = &unk_24CBFAD18;
  v4 = (id)MEMORY[0x212BDBEAC](v15);
  v14 = v4;
  v5 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](&v10);
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldAllowComplication:", *(_QWORD *)(a1 + 40), v10, v11, v12, v13) & 1) != 0
    && (v6 = *(_QWORD *)(a1 + 32), *(_BYTE *)(v6 + 58)))
  {
    v7 = *(void **)(v6 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    CLKDateHandlerAssertionBlock(v4, v5, *(unsigned __int8 *)(v6 + 69), CFSTR("-[CLKComplicationDataSource getTimelineEndDateForComplication:withHandler:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getTimelineEndDateForComplication:withHandler:", v8, v9);

  }
  else
  {
    v5[2](v5);
  }

}

void __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if (a2 || (v2 = *(_BYTE **)(a1 + 32), !v2[56]))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_3;
    v4[3] = &unk_24CBFAD68;
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v2, "getSupportedTimeTravelDirectionsForComplication:withHandler:", v3, v4);

  }
}

void __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

uint64_t __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPrivacyBehaviorForComplication:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__CLKComplicationServer_getPrivacyBehaviorForComplication_withHandler___block_invoke;
  block[3] = &unk_24CBFAD40;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __71__CLKComplicationServer_getPrivacyBehaviorForComplication_withHandler___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__CLKComplicationServer_getPrivacyBehaviorForComplication_withHandler___block_invoke_2;
  v7[3] = &unk_24CBFAD18;
  v8 = *(id *)(a1 + 48);
  v2 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v7);
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldAllowComplication:", *(_QWORD *)(a1 + 40)) & 1) != 0
    && (v3 = *(_QWORD *)(a1 + 32), *(_BYTE *)(v3 + 59)))
  {
    v4 = *(void **)(v3 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    CLKComplicationPrivacyBehaviorAssertionBlock(*(void **)(a1 + 48), v2, *(unsigned __int8 *)(v3 + 69), CFSTR("-[CLKComplicationDataSource getPrivacyBehaviorForComplication:withHandler:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getPrivacyBehaviorForComplication:withHandler:", v5, v6);

  }
  else
  {
    v2[2](v2);
  }

}

uint64_t __71__CLKComplicationServer_getPrivacyBehaviorForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getTimelineAnimationBehaviorForComplication:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__CLKComplicationServer_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke;
  block[3] = &unk_24CBFAD40;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __81__CLKComplicationServer_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__CLKComplicationServer_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke_2;
  v7[3] = &unk_24CBFAD18;
  v8 = *(id *)(a1 + 48);
  v2 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v7);
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldAllowComplication:", *(_QWORD *)(a1 + 40)) & 1) != 0
    && (v3 = *(_QWORD *)(a1 + 32), *(_BYTE *)(v3 + 60)))
  {
    v4 = *(void **)(v3 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    CLKComplicationTimelineAnimationBehaviorBlock(*(void **)(a1 + 48), v2, *(unsigned __int8 *)(v3 + 69), CFSTR("-[CLKComplicationDataSource getTimelineAnimationBehaviorForComplication:withHandler:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getTimelineAnimationBehaviorForComplication:withHandler:", v5, v6);

  }
  else
  {
    v2[2](v2);
  }

}

uint64_t __81__CLKComplicationServer_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAlwaysOnTemplateForComplication:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke;
  v11[3] = &unk_24CBFAE08;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke(id *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a1[4], "_createDataSourceIfNecessary");
  v2 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke_2;
  v11[3] = &unk_24CBFAD18;
  v12 = a1[6];
  v3 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v11);
  if ((objc_msgSend(a1[4], "_shouldAllowComplication:", a1[5]) & 1) != 0 && *((_BYTE *)a1[4] + 70))
  {
    v8[0] = v2;
    v8[1] = 3221225472;
    v8[2] = __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke_3;
    v8[3] = &unk_24CBFADE0;
    v9 = a1[5];
    v7 = *((_OWORD *)a1 + 3);
    v4 = (id)v7;
    v10 = v7;
    v5 = (void *)MEMORY[0x212BDBEAC](v8);
    CLKComplicationTemplateAssertionBlock(v5, v3, *((unsigned __int8 *)a1[4] + 69), CFSTR("-[CLKComplicationDataSource getAlwaysOnTemplateForComplication:withHandler:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1[4] + 4), "getAlwaysOnTemplateForComplication:withHandler:", a1[5], v6);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke_3(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = _ValidateTemplate(v6, objc_msgSend(*(id *)(a1 + 32), "family"));
  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v6, "finalizedCopy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

- (void)getCurrentTimelineEntryForComplication:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  CLKLoggingObjectForDomain(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2114F4000, v8, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer: -getCurrentTimelineEntryForComplication:withHandler:", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke;
  block[3] = &unk_24CBFADB8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "_createDataSourceIfNecessary");
  if ((objc_msgSend(a1[4], "_shouldAllowComplication:", a1[5]) & 1) != 0)
  {
    v2 = MEMORY[0x24BDAC760];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke_2;
    v6[3] = &unk_24CBF8FF0;
    v7 = a1[5];
    v8 = a1[6];
    v4[0] = v2;
    v4[1] = 3221225472;
    v4[2] = __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke_3;
    v4[3] = &unk_24CBFAD18;
    v5 = a1[6];
    CLKComplicationTimelineEntryAssertionBlock(v6, v4, *((unsigned __int8 *)a1[4] + 69), CFSTR("-[CLKComplicationDataSource getCurrentTimelineEntryForComplication:withHandler:]"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1[4] + 4), "getCurrentTimelineEntryForComplication:withHandler:", a1[5], v3);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = _ValidateEntry(v6, objc_msgSend(*(id *)(a1 + 32), "family"));
  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v6, "finalizedCopy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

uint64_t __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getTimelineEntriesForComplication:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 withHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  SEL v23;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a6;
  CLKLoggingObjectForDomain(1);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2114F4000, v14, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer: -getTimelineEntriesForComplication:afterDate:limit:withHandler:", buf, 2u);
  }

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke;
  v18[3] = &unk_24CBFAEA8;
  v18[4] = self;
  v19 = v11;
  v20 = v12;
  v21 = v13;
  v22 = a5;
  v23 = a2;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  dispatch_async(MEMORY[0x24BDAC9B8], v18);

}

void __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v2 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_2;
  v17[3] = &unk_24CBFAD18;
  v18 = *(id *)(a1 + 56);
  v3 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v17);
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldAllowComplication:", *(_QWORD *)(a1 + 40)) & 1) != 0
    && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 61))
  {
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_3;
    v10[3] = &unk_24CBFAE80;
    v11 = *(id *)(a1 + 40);
    v4 = *(id *)(a1 + 48);
    v5 = *(void **)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v12 = v4;
    v7 = *(_QWORD *)(a1 + 72);
    v15 = v6;
    v16 = v7;
    v8 = v5;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = v8;
    CLKComplicationTimelineEntryArrayAssertionBlock(v10, v3, *(unsigned __int8 *)(v13 + 69), CFSTR("-[CLKComplicationDataSource getTimelineEntriesForComplication:afterDate:limit:withHandler:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getTimelineEntriesForComplication:afterDate:limit:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), v9);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_4;
  v11[3] = &unk_24CBFAE58;
  v4 = v3;
  v12 = v4;
  v13 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v14 = v5;
  v8 = *(_QWORD *)(a1 + 72);
  v16 = v7;
  v17 = v8;
  v15 = v6;
  v9 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v11);
  if (CLKIsBeingDebugged())
  {
    CLKLoggingObjectForDomain(7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_3_cold_1();

    v9[2](v9);
  }
  else
  {
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 48) + 80), v9);
  }

}

void __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  const char *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD block[4];
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  char v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v1 = a1;
  v57 = *MEMORY[0x24BDAC8D0];
  if (_ValidateEntries(*(void **)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "family")))
  {
    v2 = *(void **)(v1 + 48);
    v3 = *(_QWORD *)(v1 + 64);
    v4 = *(const char **)(v1 + 72);
    v5 = *(id *)(v1 + 32);
    v6 = v2;
    if (v5)
    {
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = ___FinalizedEntriesFilteredByDateAndCount_block_invoke;
      v46[3] = &unk_24CBFAF98;
      v48 = 0;
      v33 = v6;
      v7 = v6;
      v47 = v7;
      objc_msgSend(v5, "indexesOfObjectsPassingTest:", v46);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectsAtIndexes:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v5, "count");
      v10 = v9 - objc_msgSend(v8, "count");
      if (v10 >= 1)
      {
        CLKLoggingObjectForDomain(3);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(v4);
          v34 = v4;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v50 = v12;
          v51 = 2112;
          v52 = v13;
          v53 = 2112;
          v54 = CFSTR("before start");
          v55 = 2112;
          v56 = v7;
          _os_log_impl(&dword_2114F4000, v11, OS_LOG_TYPE_DEFAULT, "%@ -- invalid entries returned. (%@ entries %@ date %@).  Excess entries will be discarded.", buf, 0x2Au);

          v4 = v34;
        }

      }
      v14 = v8;

      v15 = objc_msgSend(v14, "count");
      v16 = v14;
      if (v15 > v3)
      {
        v17 = v15;
        CLKLoggingObjectForDomain(3);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v50 = v19;
          v51 = 2112;
          v52 = v20;
          v53 = 2112;
          v54 = v21;
          _os_log_impl(&dword_2114F4000, v18, OS_LOG_TYPE_DEFAULT, "%@ -- too many entries provided (%@; limit = %@). Excess entries will be discarded.",
            buf,
            0x20u);

        }
        objc_msgSend(v14, "subarrayWithRange:", 0, v3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v35 = v1;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v23 = v16;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, buf, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v43;
        v27 = MEMORY[0x24BDAC9B8];
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v43 != v26)
              objc_enumerationMutation(v23);
            v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v28);
            if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
            {
              objc_msgSend(v29, "finalizedCopy");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v30);
            }
            else
            {
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = ___FinalizedEntriesFilteredByDateAndCount_block_invoke_204;
              block[3] = &unk_24CBFA008;
              v40 = v22;
              v41 = v29;
              dispatch_sync(v27, block);
              v30 = v40;
            }

            ++v28;
          }
          while (v25 != v28);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, buf, 16);
        }
        while (v25);
      }

      v6 = v33;
      v1 = v35;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    (*(void (**)(void))(*(_QWORD *)(v1 + 56) + 16))();
  }
  else
  {
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_5;
    v36[3] = &unk_24CBFAE30;
    v38 = *(id *)(v1 + 56);
    v37 = v22;
    dispatch_async(MEMORY[0x24BDAC9B8], v36);

  }
}

uint64_t __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getNextRequestedUpdateDateWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__CLKComplicationServer_getNextRequestedUpdateDateWithHandler___block_invoke;
  v6[3] = &unk_24CBFAED0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __63__CLKComplicationServer_getNextRequestedUpdateDateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 63))
    return objc_msgSend(*(id *)(v2 + 32), "getNextRequestedUpdateDateWithHandler:", *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)requestedUpdateDidBegin
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CLKComplicationServer_requestedUpdateDidBegin__block_invoke;
  block[3] = &unk_24CBF9F60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __48__CLKComplicationServer_requestedUpdateDidBegin__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 64))
    return objc_msgSend(*(id *)(v3 + 32), "requestedUpdateDidBegin");
  return result;
}

- (void)requestedUpdateBudgetExhausted
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CLKComplicationServer_requestedUpdateBudgetExhausted__block_invoke;
  block[3] = &unk_24CBF9F60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __55__CLKComplicationServer_requestedUpdateBudgetExhausted__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 65))
    return objc_msgSend(*(id *)(v3 + 32), "requestedUpdateBudgetExhausted");
  return result;
}

- (void)getLocalizableSampleTemplateForComplication:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke;
  v11[3] = &unk_24CBFAE08;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke(id *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  _BYTE *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;

  objc_msgSend(a1[4], "_createDataSourceIfNecessary");
  v2 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_2;
  v18[3] = &unk_24CBFAD18;
  v19 = a1[6];
  v3 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v18);
  if ((objc_msgSend(a1[4], "_shouldAllowComplication:", a1[5]) & 1) == 0)
    goto LABEL_7;
  v4 = a1[4];
  if (!v4[68])
  {
    if (v4[66])
    {
      v12[0] = v2;
      v12[1] = 3221225472;
      v12[2] = __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_134;
      v12[3] = &unk_24CBFADE0;
      v13 = a1[5];
      v11 = *((_OWORD *)a1 + 3);
      v8 = (id)v11;
      v14 = v11;
      CLKComplicationTemplateAssertionBlock(v12, v3, 0, CFSTR("-[CLKComplicationDataSource getPlaceholderTemplateForComplication:withHandler:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)a1[4] + 4), "getPlaceholderTemplateForComplication:withHandler:", a1[5], v9);

      v7 = v13;
      goto LABEL_6;
    }
LABEL_7:
    v3[2](v3);
    goto LABEL_8;
  }
  v15[0] = v2;
  v15[1] = 3221225472;
  v15[2] = __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131;
  v15[3] = &unk_24CBFADE0;
  v16 = a1[5];
  v10 = *((_OWORD *)a1 + 3);
  v5 = (id)v10;
  v17 = v10;
  CLKComplicationTemplateAssertionBlock(v15, v3, *((unsigned __int8 *)a1[4] + 69), CFSTR("-[CLKComplicationDataSource getLocalizableSampleTemplateForComplication:withHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)a1[4] + 4), "getLocalizableSampleTemplateForComplication:withHandler:", a1[5], v6);

  v7 = v16;
LABEL_6:

LABEL_8:
}

uint64_t __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  CLKLoggingObjectForDomain(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v3 = a2;
  CLKLoggingObjectForDomain(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131_cold_3(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = _ValidateTemplate(v3, objc_msgSend(*(id *)(a1 + 32), "family"));
  CLKLoggingObjectForDomain(1);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14)
      __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131_cold_1(v13, v15, v16, v17, v18, v19, v20, v21);

    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "finalizedCopy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

  }
  else
  {
    if (v14)
      __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131_cold_1(v13, v15, v16, v17, v18, v19, v20, v21);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v3 = a2;
  CLKLoggingObjectForDomain(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131_cold_3(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = _ValidateTemplate(v3, objc_msgSend(*(id *)(a1 + 32), "family"));
  CLKLoggingObjectForDomain(1);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14)
      __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131_cold_1(v13, v15, v16, v17, v18, v19, v20, v21);

    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "finalizedCopy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

  }
  else
  {
    if (v14)
      __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131_cold_1(v13, v15, v16, v17, v18, v19, v20, v21);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)getComplicationDescriptorsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;
  uint8_t buf[16];

  v5 = a3;
  CLKLoggingObjectForDomain(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2114F4000, v6, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer: -getComplicationDescriptorsWithHandler:", buf, 2u);
  }

  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__CLKComplicationServer_getComplicationDescriptorsWithHandler___block_invoke;
  v12[3] = &unk_24CBFAEF8;
  v13 = v5;
  v14 = a2;
  v8 = v5;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __63__CLKComplicationServer_getComplicationDescriptorsWithHandler___block_invoke_139;
  v10[3] = &unk_24CBFAED0;
  v10[4] = self;
  v11 = (id)MEMORY[0x212BDBEAC](v12);
  v9 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __63__CLKComplicationServer_getComplicationDescriptorsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  if (v4 >= 0x33)
  {
    v5 = v4;
    CLKLoggingObjectForDomain(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = &unk_24CC177B8;
      _os_log_impl(&dword_2114F4000, v6, OS_LOG_TYPE_DEFAULT, "%@ -- too many complication descriptors provided (%@; limit = %@). Excess descriptors will be discarded.",
        buf,
        0x20u);

    }
    objc_msgSend(v3, "subarrayWithRange:", 0, 50);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v9;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "validate", (_QWORD)v17);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  v15 = *(_QWORD *)(a1 + 32);
  v16 = (void *)objc_msgSend(v10, "copy");
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

}

void __63__CLKComplicationServer_getComplicationDescriptorsWithHandler___block_invoke_139(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CLKComplicationDescriptor *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CLKComplicationDescriptor *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 71))
  {
    objc_msgSend(*(id *)(v2 + 32), "getComplicationDescriptorsWithHandler:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CLKComplicationSupportedFamilies"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
          v16 = 0;
          if (CLKComplicationFamilyFromString(v11, &v16))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v8);
    }

    v13 = *(_QWORD *)(a1 + 40);
    v14 = -[CLKComplicationDescriptor initWithIdentifier:displayName:supportedFamilies:]([CLKComplicationDescriptor alloc], "initWithIdentifier:displayName:supportedFamilies:", CFSTR("CLKDefaultComplicationIdentifier"), &stru_24CBFCB28, v5);
    v21 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v15);

  }
}

- (void)handleSharedComplicationDescriptors:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__CLKComplicationServer_handleSharedComplicationDescriptors___block_invoke;
  v6[3] = &unk_24CBFA008;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __61__CLKComplicationServer_handleSharedComplicationDescriptors___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 72))
    return objc_msgSend(*(id *)(v3 + 32), "handleSharedComplicationDescriptors:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)notifyDebugTimeoutWithCharging:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a3;
  CLKLoggingObjectForDomain(7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5)
      -[CLKComplicationServer notifyDebugTimeoutWithCharging:].cold.1();
  }
  else if (v5)
  {
    -[CLKComplicationServer notifyDebugTimeoutWithCharging:].cold.2();
  }

}

- (void)getWidgetMigrationConfigurationFrom:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  CLKLoggingObjectForDomain(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2114F4000, v8, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer: -getWidgetMigrationConfigurationFrom:withHandler:", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke;
  block[3] = &unk_24CBFAD40;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceIfNecessary");
  v2 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_2;
  v21[3] = &unk_24CBFAD18;
  v22 = *(id *)(a1 + 48);
  v3 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v21);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 73))
  {
    objc_msgSend(*(id *)(v4 + 32), "widgetMigrator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CLKLoggingObjectForDomain(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_2();

    v16 = v2;
    v17 = 3221225472;
    v18 = __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_145;
    v19 = &unk_24CBFAF20;
    v20 = *(id *)(a1 + 48);
    CLKComplicationWidgetMigrationConfigurationAssertionBlock(&v16, v3, 0, CFSTR("-[CLKComplicationServer getWidgetMigrationConfigurationFrom:withHandler:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getWidgetConfigurationFrom:completionHandler:", *(_QWORD *)(a1 + 40), v7, v16, v17, v18, v19);

  }
  else
  {
    CLKLoggingObjectForDomain(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

    v3[2](v3);
  }

}

uint64_t __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  CLKLoggingObjectForDomain(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_145(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  CLKLoggingObjectForDomain(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_145_cold_2();

    -[NSObject _internalCopy](v3, "_internalCopy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
      __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_145_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);
    v13 = 0;
    v3 = v4;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateFinalizationQueue, 0);
  objc_storeStrong((id *)&self->_activeComplications, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)_init
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2114F4000, a2, OS_LOG_TYPE_ERROR, "complication server failed to register for restart notifications: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3_0();
}

void __42__CLKComplicationServer__createConnection__block_invoke_89_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_3(&dword_2114F4000, v0, v1, "Complication server connection invalidated. You may lack the entitlement to look up the mach service, or there may have been an encoding error. Did the client invalidate the connection intentionally?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_3(&dword_2114F4000, v0, v1, "Validating complication timeline entries synchronously because the debugger is attached. In a live environment, this will be asynchronous", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2114F4000, a1, a3, "%s default block", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2114F4000, a1, a3, "%s calling handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_131_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2114F4000, a1, a3, "%s validating", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)notifyDebugTimeoutWithCharging:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_3(&dword_2114F4000, v0, v1, "Active CLKComplicationDataSource query timed out - this will be ignored because the process is being debugged on power, but in a production environment this may result in your complication no longer updating", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)notifyDebugTimeoutWithCharging:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_3(&dword_2114F4000, v0, v1, "Active CLKComplicationDataSource query timed out! Too many timeouts will deny your app future complication updates until it is foregrounded.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2114F4000, a1, a3, "%s skipping widget migration query, because data source does not support widget migration", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_2114F4000, v0, v1, "%s asking widget migrator for widget migration configuration: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2114F4000, a1, a3, "%s default block", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_145_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2114F4000, a1, a3, "%s calling handler with no widget migration configuration", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_145_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_2114F4000, v0, v1, "%s calling handler with widget migration configuration: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
