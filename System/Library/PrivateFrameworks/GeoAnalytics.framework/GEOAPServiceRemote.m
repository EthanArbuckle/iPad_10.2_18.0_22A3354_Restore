@implementation GEOAPServiceRemote

void __87__GEOAPServiceRemote_reportDailyUsageCountType_usageString_usageBool_appId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  GEOGetGEOAPRemoteAnalyticsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315138;
    v7 = "-[GEOAPServiceRemote reportDailyUsageCountType:usageString:usageBool:appId:completion:]_block_invoke";
    _os_log_impl(&dword_23CBB4000, v4, OS_LOG_TYPE_DEBUG, "complete %s", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v10 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  GEOGetGEOAPRemoteAnalyticsLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[GEOAPServiceRemote reportDailyUsageCountType:usageString:usageBool:appId:completion:]";
    _os_log_impl(&dword_23CBB4000, v16, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[GEOAPServiceRemote _sharedDaemonConnection](self, "_sharedDaemonConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __87__GEOAPServiceRemote_reportDailyUsageCountType_usageString_usageBool_appId_completion___block_invoke;
  v19[3] = &unk_250DC6278;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v17, "reportDailyUsageCountType:usageString:usageBool:appId:completion:", v10, v15, v14, v13, v19);

}

- (id)_sharedDaemonConnection
{
  GEOAPXPCDaemonExporting *daemonSvc;
  GEOAPXPCDaemonExporting *v4;
  void *v5;
  void *v6;
  GEOAPXPCDaemonExporting *v7;
  GEOAPXPCDaemonExporting *v8;
  _QWORD v10[5];
  geo_isolater *v11;

  v11 = self->_xpcIso;
  _geo_isolate_lock();
  daemonSvc = self->_daemonSvc;
  if (daemonSvc)
  {
    v4 = daemonSvc;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256C3EF58);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.geoanalyticsd"), 4096);
    objc_msgSend(v6, "setRemoteObjectInterface:", v5);
    objc_msgSend(v6, "setInterruptionHandler:", &__block_literal_global_97_0);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__GEOAPServiceRemote__sharedDaemonConnection__block_invoke_98;
    v10[3] = &unk_250DC0660;
    v10[4] = self;
    objc_msgSend(v6, "setInvalidationHandler:", v10);
    objc_msgSend(v6, "resume");
    objc_storeStrong((id *)&self->_conn, v6);
    -[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy");
    v7 = (GEOAPXPCDaemonExporting *)objc_claimAutoreleasedReturnValue();
    v8 = self->_daemonSvc;
    self->_daemonSvc = v7;

    v4 = self->_daemonSvc;
  }
  _geo_isolate_unlock();

  return v4;
}

- (GEOAPServiceRemote)init
{
  GEOAPServiceRemote *v2;
  GEOAPServiceRemote *v3;
  GEOAPXPCDaemonExporting *daemonSvc;
  NSXPCConnection *conn;
  uint64_t v6;
  geo_isolater *xpcIso;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEOAPServiceRemote;
  v2 = -[GEOAPServiceRemote init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    daemonSvc = v2->_daemonSvc;
    v2->_daemonSvc = 0;

    conn = v3->_conn;
    v3->_conn = 0;

    v6 = geo_isolater_create();
    xpcIso = v3->_xpcIso;
    v3->_xpcIso = (geo_isolater *)v6;

    GEOGetGEOAPRemoteAnalyticsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23CBB4000, v8, OS_LOG_TYPE_DEBUG, "hello", v10, 2u);
    }

  }
  return v3;
}

+ (id)_daemonConnectionWithExportedClient:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256C3EF58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256C27090);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.geoanalyticsd"), 4096);
  objc_msgSend(v5, "setRemoteObjectInterface:", v3);
  objc_msgSend(v5, "setExportedInterface:", v4);
  objc_msgSend(v5, "setExportedObject:", v2);

  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_16);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_92);
  objc_msgSend(v5, "resume");

  return v5;
}

void __65__GEOAPServiceRemote_local___daemonConnectionWithExportedClient___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  GEOGetGEOAPRemoteAnalyticsLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23CBB4000, v0, OS_LOG_TYPE_INFO, "xpc connection with export interrupted", v1, 2u);
  }

}

void __65__GEOAPServiceRemote_local___daemonConnectionWithExportedClient___block_invoke_91()
{
  NSObject *v0;
  uint8_t v1[16];

  GEOGetGEOAPRemoteAnalyticsLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23CBB4000, v0, OS_LOG_TYPE_INFO, "xpc connection with export invalidated", v1, 2u);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_conn, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)GEOAPServiceRemote;
  -[GEOAPServiceRemote dealloc](&v3, sel_dealloc);
}

void __45__GEOAPServiceRemote__sharedDaemonConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  GEOGetGEOAPRemoteAnalyticsLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23CBB4000, v0, OS_LOG_TYPE_INFO, "xpc connection interrupted", v1, 2u);
  }

}

uint64_t __45__GEOAPServiceRemote__sharedDaemonConnection__block_invoke_98()
{
  NSObject *v0;
  uint8_t buf[16];

  GEOGetGEOAPRemoteAnalyticsLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23CBB4000, v0, OS_LOG_TYPE_INFO, "xpc connection invalidated", buf, 2u);
  }

  return geo_isolate_sync();
}

void __45__GEOAPServiceRemote__sharedDaemonConnection__block_invoke_99(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  GEOGetGEOAPRemoteAnalyticsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[GEOAPServiceRemote reportLogMsg:uploadBatchId:completion:]";
    _os_log_impl(&dword_23CBB4000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[GEOAPServiceRemote _sharedDaemonConnection](self, "_sharedDaemonConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__GEOAPServiceRemote_reportLogMsg_uploadBatchId_completion___block_invoke;
  v13[3] = &unk_250DC06D8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "reportLogMsg:uploadBatchId:completion:", v9, a4, v13);

}

uint64_t __60__GEOAPServiceRemote_reportLogMsg_uploadBatchId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  GEOGetGEOAPRemoteAnalyticsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23CBB4000, v2, OS_LOG_TYPE_DEBUG, "reportLogMsg completed", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)reportDailySettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  GEOGetGEOAPRemoteAnalyticsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[GEOAPServiceRemote reportDailySettings:completion:]";
    _os_log_impl(&dword_23CBB4000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[GEOAPServiceRemote _sharedDaemonConnection](self, "_sharedDaemonConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__GEOAPServiceRemote_reportDailySettings_completion___block_invoke;
  v11[3] = &unk_250DC6278;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "reportDailySettings:completion:", v7, v11);

}

void __53__GEOAPServiceRemote_reportDailySettings_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  GEOGetGEOAPRemoteAnalyticsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315138;
    v7 = "-[GEOAPServiceRemote reportDailySettings:completion:]_block_invoke";
    _os_log_impl(&dword_23CBB4000, v4, OS_LOG_TYPE_DEBUG, "complete %s", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)setEvalMode:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  GEOGetGEOAPRemoteAnalyticsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[GEOAPServiceRemote setEvalMode:]";
    _os_log_impl(&dword_23CBB4000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[GEOAPServiceRemote _sharedDaemonConnection](self, "_sharedDaemonConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEvalMode:", v3);

}

- (void)flushEvalData
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  GEOGetGEOAPRemoteAnalyticsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[GEOAPServiceRemote flushEvalData]";
    _os_log_impl(&dword_23CBB4000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[GEOAPServiceRemote _sharedDaemonConnection](self, "_sharedDaemonConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flushEvalData");

}

- (void)showEvalDataWithVisitorBlock:(id)a3
{
  id v3;
  GEOAPShowEvalHandler *v4;
  id v5;
  GEOAPServiceRemote *v6;
  uint64_t v7;
  NSXPCConnection *conn;
  uint64_t v9;
  GEOAPXPCDaemonExporting *daemonSvc;
  dispatch_semaphore_t v11;
  geo_isolater *xpcIso;
  NSObject *v13;
  NSXPCConnection *v14;
  GEOAPServiceRemote *v15;
  objc_super v16;
  uint8_t buf[4];
  NSXPCConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [GEOAPShowEvalHandler alloc];
  v5 = v3;
  if (v4
    && (v16.receiver = v4,
        v16.super_class = (Class)GEOAPShowEvalHandler,
        (v6 = -[GEOAPServiceRemote init](&v16, sel_init)) != 0))
  {
    v15 = v6;
    +[GEOAPServiceRemote _daemonConnectionWithExportedClient:]((uint64_t)GEOAPServiceRemote, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    conn = v15->_conn;
    v15->_conn = (NSXPCConnection *)v7;

    v9 = objc_msgSend(v5, "copy");
    daemonSvc = v15->_daemonSvc;
    v15->_daemonSvc = (GEOAPXPCDaemonExporting *)v9;

    v11 = dispatch_semaphore_create(0);
    xpcIso = v15->_xpcIso;
    v15->_xpcIso = (geo_isolater *)v11;

    GEOGetGEOAPShowEvalHandlerAnalyticsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = v15->_conn;
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl(&dword_23CBB4000, v13, OS_LOG_TYPE_DEBUG, "hello: %@", buf, 0xCu);
    }

  }
  else
  {
    v15 = 0;
  }

  -[GEOAPServiceRemote visit](v15, "visit");
}

- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEOAPShowEvalHandler *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSXPCConnection *xpcConn;
  NSObject *v16;
  NSXPCConnection *v17;
  uint64_t v18;
  id streamLogMsgBlock;
  uint64_t v20;
  id streamDailyUsageBlock;
  uint64_t v22;
  id streamMonthlyUsageBlock;
  dispatch_time_t v24;
  GEOAPShowEvalHandler *v25;
  _QWORD block[4];
  GEOAPShowEvalHandler *v27;
  objc_super v28;
  uint8_t buf[4];
  NSXPCConnection *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [GEOAPShowEvalHandler alloc];
  v11 = v9;
  v12 = v8;
  v13 = v7;
  if (v10)
  {
    v28.receiver = v10;
    v28.super_class = (Class)GEOAPShowEvalHandler;
    v10 = -[GEOAPServiceRemote init](&v28, sel_init);
    if (v10)
    {
      +[GEOAPServiceRemote _daemonConnectionWithExportedClient:]((uint64_t)GEOAPServiceRemote, v10);
      v14 = objc_claimAutoreleasedReturnValue();
      xpcConn = v10->_xpcConn;
      v10->_xpcConn = (NSXPCConnection *)v14;

      GEOGetGEOAPShowEvalHandlerAnalyticsLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = v10->_xpcConn;
        *(_DWORD *)buf = 138412290;
        v30 = v17;
        _os_log_impl(&dword_23CBB4000, v16, OS_LOG_TYPE_DEBUG, "hello: %@", buf, 0xCu);
      }

      v18 = MEMORY[0x24262F900](v11);
      streamLogMsgBlock = v10->_streamLogMsgBlock;
      v10->_streamLogMsgBlock = (id)v18;

      v20 = MEMORY[0x24262F900](v12);
      streamDailyUsageBlock = v10->_streamDailyUsageBlock;
      v10->_streamDailyUsageBlock = (id)v20;

      v22 = MEMORY[0x24262F900](v13);
      streamMonthlyUsageBlock = v10->_streamMonthlyUsageBlock;
      v10->_streamMonthlyUsageBlock = (id)v22;

    }
  }

  -[GEOAPShowEvalHandler stream](v10, "stream");
  v24 = dispatch_time(0, 99999999000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__GEOAPServiceRemote_streamWithLogMsgBlock_dailyUsageBlock_monthlyUsageBlock___block_invoke;
  block[3] = &unk_250DC0660;
  v27 = v10;
  v25 = v10;
  dispatch_after(v24, MEMORY[0x24BDAC9B8], block);

}

void __78__GEOAPServiceRemote_streamWithLogMsgBlock_dailyUsageBlock_monthlyUsageBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  GEOGetGEOAPRemoteAnalyticsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_23CBB4000, v2, OS_LOG_TYPE_DEBUG, "stream handler %p is exhausted", (uint8_t *)&v4, 0xCu);
  }

}

- (void)runAggregationTasks
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  GEOGetGEOAPRemoteAnalyticsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[GEOAPServiceRemote runAggregationTasks]";
    _os_log_impl(&dword_23CBB4000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[GEOAPServiceRemote _sharedDaemonConnection](self, "_sharedDaemonConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runAggregationTasks");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcIso, 0);
  objc_storeStrong((id *)&self->_daemonSvc, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end
