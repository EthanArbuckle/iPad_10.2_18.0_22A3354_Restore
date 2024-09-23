@implementation CTCellularPlanManager

uint64_t __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke_2;
  v5[3] = &unk_1E9521A28;
  v5[4] = v2;
  result = objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (void)_ensureConnected_sync
{
  if (!self->_connection)
    -[CTCellularPlanManager _connect_sync](self, "_connect_sync");
}

uint64_t __29__CTCellularPlanManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
}

uint64_t __46__CTCellularPlanManager_getSupportedFlowTypes__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)getPlansPendingTransfer:(id *)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__CTCellularPlanManager_getPlansPendingTransfer___block_invoke;
  v13[3] = &unk_1E9521E80;
  v13[4] = &v14;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CTCellularPlanManager_getPlansPendingTransfer___block_invoke_255;
  v6[3] = &unk_1E9521EA8;
  v6[4] = &v14;
  v6[5] = &v7;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v13), "getPlansPendingTransferWithCompletion:", v6);
  if (a3)
    *a3 = (id)v15[5];
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v14, 8);
  return v4;
}

CTCellularPlanManager *__38__CTCellularPlanManager_sharedManager__block_invoke()
{
  CTCellularPlanManager *result;

  result = objc_alloc_init(CTCellularPlanManager);
  sharedManager_sharedManager = (uint64_t)result;
  return result;
}

- (CTCellularPlanManager)init
{
  CTCellularPlanManager *v2;
  NSObject *queue;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v5;
  id v7;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTCellularPlanManager;
  v2 = -[CTCellularPlanManager init](&v9, sel_init);
  if (v2)
  {
    v2->_queue = (dispatch_queue_s *)dispatch_queue_create("com.apple.CoreTelephony.CellularPlan", 0);
    v2->_delegate = objc_alloc_init(CTCellularPlanManagerDelegate);
    queue = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__CTCellularPlanManager_init__block_invoke;
    block[3] = &unk_1E95219B0;
    block[4] = v2;
    dispatch_async(queue, block);
    v7 = 0;
    objc_initWeak(&v7, v2);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v5 = objc_loadWeak(&v7);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_CTDaemonReady, (CFStringRef)*MEMORY[0x1E0CA7360], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v7);
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  return (id)sharedManager_sharedManager;
}

- (id)planItemsShouldUpdate:(BOOL)a3
{
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager planItemsShouldUpdate:]";
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  v5 = -[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", &__block_literal_global_251);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__CTCellularPlanManager_planItemsShouldUpdate___block_invoke_2;
  v8[3] = &unk_1E9521E30;
  v8[4] = &buf;
  objc_msgSend(v5, "planItemsWithCompletion:", v8);
  v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v6;
}

- (id)danglingPlanItemsShouldUpdate:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager danglingPlanItemsShouldUpdate:]";
    _os_log_impl(&dword_1D33B0000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  v6 = -[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", &__block_literal_global_254);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__CTCellularPlanManager_danglingPlanItemsShouldUpdate___block_invoke_2;
  v9[3] = &unk_1E9521E30;
  v9[4] = &buf;
  objc_msgSend(v6, "danglingPlanItemsShouldUpdate:completion:", v3, v9);
  v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v7;
}

- (unint64_t)getSupportedFlowTypes
{
  NSObject *v3;
  id v4;
  unint64_t v5;
  _QWORD v7[5];
  __int128 buf;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager getSupportedFlowTypes]";
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  v4 = -[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", &__block_literal_global_222);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x2020000000;
  v10 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CTCellularPlanManager_getSupportedFlowTypes__block_invoke_2;
  v7[3] = &unk_1E9521BD0;
  v7[4] = &buf;
  objc_msgSend(v4, "getSupportedFlowTypes:", v7);
  v5 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v5;
}

- (void)_connect_sync
{
  NSXPCInterface *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[16];
  _QWORD v8[4];
  id v9;
  id location;

  self->_connection = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.CellularPlanDaemon.xpc"), 4096);
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCCE5E0));
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCCCC18));
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self->_delegate);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_planItemsWithCompletion_, 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_danglingPlanItemsShouldUpdate_completion_, 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_getPlansPendingTransferWithCompletion_, 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_getPlansPendingTransferForTestabilityWithCompletion_, 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_activatePlanPendingTransfer_completion_, 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_cancelPlanActivation_completion_, 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_deletePlanPendingTransfer_completion_, 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanCarrierItemXpcWhitelistSet(), sel_carrierItemsShouldUpdate_completion_, 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_remotePlanItemsWithUpdateFetch_completion_, 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_getPredefinedLabels_, 0, 1);
  v3 = -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v3, "setClasses:forSelector:argumentIndex:ofReply:", (id)objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0), sel_getShortLabelsForLabels_completion_, 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_didSelectPlansForIMessage_completion_, 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", CTCellularPlanXpcWhitelistSet(), sel_didEnablePlanItems_completion_, 0, 0);
  location = 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__CTCellularPlanManager__connect_sync__block_invoke;
  v8[3] = &unk_1E9521A00;
  objc_copyWeak(&v9, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v8);
  -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_queue);
  -[NSXPCConnection resume](self->_connection, "resume");
  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "Connected to Xpc Service", buf, 2u);
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)synchronousProxyWithErrorHandler:(id)a3
{
  NSObject *queue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E9521A50;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __55__CTCellularPlanManager_danglingPlanItemsShouldUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __47__CTCellularPlanManager_planItemsShouldUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)_reconnect
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CTCellularPlanManager__reconnect__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__CTCellularPlanManager__reconnect__block_invoke(uint64_t a1)
{
  id *v2;

  v2 = *(id **)(a1 + 32);
  if (v2[2])
  {
    objc_msgSend(v2[2], "setInvalidationHandler:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v2 = *(id **)(a1 + 32);
  }
  return objc_msgSend(v2, "ping");
}

void __38__CTCellularPlanManager__connect_sync__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *Weak;
  id *v4;
  uint8_t v5[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "Xpc Connection invalidated", v5, 2u);
  }
  Weak = (id *)objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    v4 = Weak;

    v4[2] = 0;
  }
}

uint64_t __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke_2_cold_1();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)ping
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CTCellularPlanManager_ping__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__CTCellularPlanManager_ping__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxy");
  if (v2)
  {
    objc_msgSend(v2, "ping");
  }
  else
  {
    v3 = CellularPlanLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __29__CTCellularPlanManager_ping__block_invoke_cold_1(v3);
  }
}

- (void)shouldShowPlanSetup:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_217;
  v7[3] = &unk_1E9521AC8;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "shouldShowPlanSetup:", v7);
}

void __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_216;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_216(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_217(uint64_t a1, char a2)
{
  NSObject *global_queue;
  _QWORD v5[5];
  char v6;

  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_3;
  v5[3] = &unk_1E9521AA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getSupportedFlowTypes:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_2_220;
  v7[3] = &unk_1E9521B68;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "getSupportedFlowTypes:", v7);
}

void __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_219;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_219(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_2_220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *global_queue;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_3;
  block[3] = &unk_1E9521B40;
  block[5] = *(_QWORD *)(a1 + 32);
  block[6] = a2;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

uint64_t __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)startProvisioningWithCompletion:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_2_224;
  v7[3] = &unk_1E9521AC8;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "startProvisioningWithCompletion:", v7);
}

void __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_223;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_223(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_2_224(uint64_t a1, char a2)
{
  NSObject *global_queue;
  _QWORD v5[5];
  char v6;

  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_3;
  v5[3] = &unk_1E9521AA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)finishProvisioningWithCompletion:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_2_226;
  v7[3] = &unk_1E9521AC8;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "finishProvisioningWithCompletion:", v7);
}

void __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_225;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_225(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_2_226(uint64_t a1, char a2)
{
  NSObject *global_queue;
  _QWORD v5[5];
  char v6;

  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_3;
  v5[3] = &unk_1E9521AA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)enterSimSetupWithCompletion:(id)a3
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CTCellularPlanManager_enterSimSetupWithCompletion___block_invoke;
  block[3] = &unk_1E9521A78;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

uint64_t __53__CTCellularPlanManager_enterSimSetupWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)exitSimSetupWithCompletion:(id)a3
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CTCellularPlanManager_exitSimSetupWithCompletion___block_invoke;
  block[3] = &unk_1E9521A78;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

uint64_t __52__CTCellularPlanManager_exitSimSetupWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4 triggerType:(int64_t)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  NSObject *queue;
  _QWORD v8[10];

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke;
  v8[3] = &unk_1E9521BF8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a7;
  v8[8] = a5;
  v8[9] = a6;
  dispatch_async(queue, v8);
}

uint64_t __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_2;
  v11[3] = &unk_1E9521A28;
  v11[4] = *(_QWORD *)(a1 + 56);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v11);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_2_228;
  v10[3] = &unk_1E9521A28;
  v10[4] = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v4, "addNewPlanWithCardData:confirmationCode:triggerType:userConsent:completion:", v5, v6, v7, v8, v10);
}

void __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_227;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_227(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_2_228(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addNewPlanWithFlowType:(unint64_t)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke;
  block[3] = &unk_1E9521C20;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(queue, block);
}

uint64_t __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_2;
  v9[3] = &unk_1E9521A28;
  v9[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_2_230;
  v8[3] = &unk_1E9521A28;
  v6 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "addNewPlanWithFlowType:completion:", v6, v8);
}

void __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_229;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_2_230(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addNewPlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 triggerType:(int64_t)a7 userConsent:(int64_t)a8 completion:(id)a9
{
  NSObject *queue;
  _QWORD v10[12];

  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke;
  v10[3] = &unk_1E9521C48;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  v10[8] = a6;
  v10[9] = a9;
  v10[10] = a7;
  v10[11] = a8;
  dispatch_async(queue, v10);
}

uint64_t __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_2;
  v13[3] = &unk_1E9521A28;
  v13[4] = *(_QWORD *)(a1 + 72);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 88);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_2_232;
  v12[3] = &unk_1E9521A28;
  v12[4] = *(_QWORD *)(a1 + 72);
  return objc_msgSend(v4, "addNewPlanWithAddress:matchingId:oid:confirmationCode:triggerType:userConsent:completion:", v5, v6, v7, v8, v9, v10, v12);
}

void __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_231;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_231(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_2_232(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)installPendingRemotePlan:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_2_234;
  v7[3] = &unk_1E9521A28;
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v4, "installPendingRemotePlan:completion:", v5, v7);
}

void __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_233;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_233(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_2_234(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4 completion:(id)a5
{
  NSObject *queue;
  _QWORD v6[7];
  BOOL v7;

  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke;
  v6[3] = &unk_1E9521C98;
  v6[4] = self;
  v6[5] = a5;
  v7 = a3;
  v6[6] = a4;
  dispatch_async(queue, v6);
}

uint64_t __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_2;
  v10[3] = &unk_1E9521A28;
  v10[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_2_236;
  v9[3] = &unk_1E9521A28;
  v7 = *(_QWORD *)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "resumePlanProvisioning:userConsent:completion:", v6, v7, v9);
}

void __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_235;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_235(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_2_236(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getIMEIPrefix:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __39__CTCellularPlanManager_getIMEIPrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_2_238;
  v7[3] = &unk_1E9521CC0;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "getIMEIPrefix:", v7);
}

void __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "unable to get IMEI prefix %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_237;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_237(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_2_238(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setIMEIPrefix:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__CTCellularPlanManager_setIMEIPrefix___block_invoke;
  v4[3] = &unk_1E95219D8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __39__CTCellularPlanManager_setIMEIPrefix___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_240), "setIMEIPrefix:", *(_QWORD *)(a1 + 40));
}

void __39__CTCellularPlanManager_setIMEIPrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "unable to set IMEI prefix %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getSelectedEnv:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __40__CTCellularPlanManager_getSelectedEnv___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke_2_242;
  v7[3] = &unk_1E9521D30;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "getSelectedEnv:", v7);
}

void __40__CTCellularPlanManager_getSelectedEnv___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "unable to get Env index %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke_241;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __40__CTCellularPlanManager_getSelectedEnv___block_invoke_241(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__CTCellularPlanManager_getSelectedEnv___block_invoke_2_242(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  _QWORD v5[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke_3;
  v5[3] = &unk_1E9521D08;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __40__CTCellularPlanManager_getSelectedEnv___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setSelectedEnv:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__CTCellularPlanManager_setSelectedEnv___block_invoke;
  v4[3] = &unk_1E9521D78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __40__CTCellularPlanManager_setSelectedEnv___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_244), "setSelectedEnv:", *(_QWORD *)(a1 + 40));
}

void __40__CTCellularPlanManager_setSelectedEnv___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "unable to set Env index %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getSelectedProxy:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __42__CTCellularPlanManager_getSelectedProxy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke_2_246;
  v7[3] = &unk_1E9521D30;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "getSelectedProxy:", v7);
}

void __42__CTCellularPlanManager_getSelectedProxy___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "unable to get Proxy index %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke_245;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __42__CTCellularPlanManager_getSelectedProxy___block_invoke_245(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__CTCellularPlanManager_getSelectedProxy___block_invoke_2_246(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  _QWORD v5[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke_3;
  v5[3] = &unk_1E9521D08;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __42__CTCellularPlanManager_getSelectedProxy___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setSelectedProxy:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CTCellularPlanManager_setSelectedProxy___block_invoke;
  v4[3] = &unk_1E9521D78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __42__CTCellularPlanManager_setSelectedProxy___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_247), "setSelectedProxy:", *(_QWORD *)(a1 + 40));
}

void __42__CTCellularPlanManager_setSelectedProxy___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "unable to set Proxy index %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)mccMncOverride:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CTCellularPlanManager_mccMncOverride___block_invoke;
  block[3] = &unk_1E9521A78;
  block[4] = a3;
  dispatch_async(queue, block);
}

void __40__CTCellularPlanManager_mccMncOverride___block_invoke(uint64_t a1)
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CTCellularPlanManager_mccMncOverride___block_invoke_2;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __40__CTCellularPlanManager_mccMncOverride___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)latitudeLongitudeOverride:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CTCellularPlanManager_latitudeLongitudeOverride___block_invoke;
  block[3] = &unk_1E9521A78;
  block[4] = a3;
  dispatch_async(queue, block);
}

void __51__CTCellularPlanManager_latitudeLongitudeOverride___block_invoke(uint64_t a1)
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CTCellularPlanManager_latitudeLongitudeOverride___block_invoke_2;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __51__CTCellularPlanManager_latitudeLongitudeOverride___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
}

- (void)planItemsWithCompletion:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "planItemsWithCompletion", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_248;
  v9[3] = &unk_1E9521A28;
  v9[4] = v4;
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E9521DE8;
  v8[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v6, "planItemsWithCompletion:", v8);
}

void __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_248(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting plan items %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_249;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_249(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_3;
  block[3] = &unk_1E9521DC0;
  v7 = *(_QWORD *)(a1 + 32);
  block[5] = a3;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)planItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
  -[CTCellularPlanManager planItemsWithCompletion:](self, "planItemsWithCompletion:", a4);
}

- (void)danglingPlanItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke;
  block[3] = &unk_1E9521E58;
  block[4] = self;
  block[5] = a4;
  v6 = a3;
  dispatch_async(queue, block);
}

uint64_t __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "danglingPlanItemsShouldUpdate", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_252;
  v10[3] = &unk_1E9521A28;
  v10[4] = v4;
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v10);
  v7 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_2;
  v9[3] = &unk_1E9521DE8;
  v9[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v6, "danglingPlanItemsShouldUpdate:completion:", v7, v9);
}

void __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_252(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting plan items %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_253;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_253(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_3;
  block[3] = &unk_1E9521DC0;
  v7 = *(_QWORD *)(a1 + 32);
  block[5] = a3;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

id __49__CTCellularPlanManager_getPlansPendingTransfer___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  id result;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting synchronous proxy: %@", (uint8_t *)&v6, 0xCu);
  }
  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __49__CTCellularPlanManager_getPlansPendingTransfer___block_invoke_255(uint64_t a1, void *a2, void *a3)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a3;
  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)getPlansPendingTransferForTestability:(id *)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__CTCellularPlanManager_getPlansPendingTransferForTestability___block_invoke;
  v13[3] = &unk_1E9521E80;
  v13[4] = &v14;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__CTCellularPlanManager_getPlansPendingTransferForTestability___block_invoke_256;
  v6[3] = &unk_1E9521EA8;
  v6[4] = &v14;
  v6[5] = &v7;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v13), "getPlansPendingTransferForTestabilityWithCompletion:", v6);
  if (a3)
    *a3 = (id)v15[5];
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v14, 8);
  return v4;
}

id __63__CTCellularPlanManager_getPlansPendingTransferForTestability___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  id result;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting synchronous proxy: %@", (uint8_t *)&v6, 0xCu);
  }
  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __63__CTCellularPlanManager_getPlansPendingTransferForTestability___block_invoke_256(uint64_t a1, void *a2, void *a3)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a3;
  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)activatePlanPendingTransfer:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_2_258;
  v7[3] = &unk_1E9521EF8;
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v4, "activatePlanPendingTransfer:completion:", v5, v7);
}

void __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting remote proxy %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_257;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_257(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

void __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_2_258(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *global_queue;
  uint64_t v11;
  _QWORD block[8];
  char v13;

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_3;
  block[3] = &unk_1E9521ED0;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = a2;
  block[4] = a3;
  block[5] = a4;
  block[6] = a5;
  block[7] = v11;
  dispatch_async(global_queue, block);
}

uint64_t __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)cancelPlanActivation:(id)a3
{
  id v3;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__CTCellularPlanManager_cancelPlanActivation___block_invoke;
  v6[3] = &unk_1E9521E80;
  v6[4] = &v7;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__CTCellularPlanManager_cancelPlanActivation___block_invoke_2;
  v5[3] = &unk_1E9521E80;
  v5[4] = &v7;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v6), "cancelPlanActivation:completion:", a3, v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

id __46__CTCellularPlanManager_cancelPlanActivation___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __46__CTCellularPlanManager_cancelPlanActivation___block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)deletePlanPendingTransfer:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_2_261;
  v7[3] = &unk_1E9521A28;
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v4, "deletePlanPendingTransfer:completion:", v5, v7);
}

void __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting remote proxy %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_260;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_260(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_2_261(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)resolveSimLabel:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "resolveSimLabel", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_262;
  v9[3] = &unk_1E9521A28;
  v9[4] = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_3;
  v8[3] = &unk_1E9521A28;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v5, "resolveSimLabel:completion:", v6, v8);
}

void __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_262(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_4;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)resolveSimLabel:(id)a3
{
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager resolveSimLabel:]";
    _os_log_impl(&dword_1D33B0000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__CTCellularPlanManager_resolveSimLabel___block_invoke;
  v9[3] = &unk_1E9521E80;
  v9[4] = &buf;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__CTCellularPlanManager_resolveSimLabel___block_invoke_2;
  v8[3] = &unk_1E9521E80;
  v8[4] = &buf;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v9), "resolveSimLabel:completion:", a3, v8);
  v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v6;
}

id __41__CTCellularPlanManager_resolveSimLabel___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __41__CTCellularPlanManager_resolveSimLabel___block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)remapSimLabel:(id)a3 to:(id)a4 completion:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke;
  v6[3] = &unk_1E9521F20;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

uint64_t __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "remapSimLabel", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_263;
  v10[3] = &unk_1E9521A28;
  v10[4] = *(_QWORD *)(a1 + 56);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_3;
  v9[3] = &unk_1E9521A28;
  v9[4] = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v5, "remapSimLabel:to:completion:", v6, v7, v9);
}

void __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_263(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_4;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)remapSimLabel:(id)a3 to:(id)a4
{
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  __int128 buf;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = CellularPlanLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager remapSimLabel:to:]";
    _os_log_impl(&dword_1D33B0000, v7, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__CTCellularPlanManager_remapSimLabel_to___block_invoke;
  v11[3] = &unk_1E9521E80;
  v11[4] = &buf;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__CTCellularPlanManager_remapSimLabel_to___block_invoke_2;
  v10[3] = &unk_1E9521E80;
  v10[4] = &buf;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v11), "remapSimLabel:to:completion:", a3, a4, v10);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v8;
}

id __42__CTCellularPlanManager_remapSimLabel_to___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __42__CTCellularPlanManager_remapSimLabel_to___block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)carrierItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke;
  block[3] = &unk_1E9521E58;
  block[4] = self;
  block[5] = a4;
  v6 = a3;
  dispatch_async(queue, block);
}

uint64_t __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "carrierItemsShouldUpdate", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_264;
  v10[3] = &unk_1E9521A28;
  v10[4] = v4;
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v10);
  v7 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_2;
  v9[3] = &unk_1E9521DE8;
  v9[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v6, "carrierItemsShouldUpdate:completion:", v7, v9);
}

void __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_264(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting carrier items %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_265;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_3;
  block[3] = &unk_1E9521DC0;
  v7 = *(_QWORD *)(a1 + 32);
  block[5] = a3;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)didSelectPlanItem:(id)a3 isEnable:(BOOL)a4 completion:(id)a5
{
  NSObject *queue;
  _QWORD v6[7];
  BOOL v7;

  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke;
  v6[3] = &unk_1E9521F98;
  v7 = a4;
  v6[5] = a3;
  v6[6] = a5;
  v6[4] = self;
  dispatch_async(queue, v6);
}

uint64_t __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    v13 = v3;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "didSelectPlanItem enable: %d", buf, 8u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_266;
  v11[3] = &unk_1E9521A28;
  v11[4] = *(_QWORD *)(a1 + 48);
  v6 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v11);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_3;
  v10[3] = &unk_1E9521F70;
  v8 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v6, "didSelectPlanItem:enable:completion:", v8, v7, v10);
}

void __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_266(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "didselect completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_267;
  block[3] = &unk_1E9521F48;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = a3;
  block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_267(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)didSelectPlanItem:(id)a3 isEnable:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  __int128 buf;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = CellularPlanLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager didSelectPlanItem:isEnable:]";
    _os_log_impl(&dword_1D33B0000, v7, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__CTCellularPlanManager_didSelectPlanItem_isEnable___block_invoke;
  v11[3] = &unk_1E9521E80;
  v11[4] = &buf;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__CTCellularPlanManager_didSelectPlanItem_isEnable___block_invoke_2;
  v10[3] = &unk_1E9521FC0;
  v10[4] = &buf;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v11), "didSelectPlanItem:enable:completion:", a3, v4, v10);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v8;
}

id __52__CTCellularPlanManager_didSelectPlanItem_isEnable___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __52__CTCellularPlanManager_didSelectPlanItem_isEnable___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  id result;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "didselect completion, was successful: %d", (uint8_t *)v8, 8u);
  }
  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)didSelectPlanForData:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "didselectplanfordata", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_269;
  v9[3] = &unk_1E9521A28;
  v9[4] = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_3;
  v8[3] = &unk_1E9521F70;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v5, "didSelectPlanForData:completion:", v6, v8);
}

void __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_269(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "didselectplanfordata completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_270;
  block[3] = &unk_1E9521F48;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = a3;
  block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_270(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)didSelectPlanForData:(id)a3
{
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager didSelectPlanForData:]";
    _os_log_impl(&dword_1D33B0000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__CTCellularPlanManager_didSelectPlanForData___block_invoke;
  v9[3] = &unk_1E9521E80;
  v9[4] = &buf;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__CTCellularPlanManager_didSelectPlanForData___block_invoke_2;
  v8[3] = &unk_1E9521FC0;
  v8[4] = &buf;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v9), "didSelectPlanForData:completion:", a3, v8);
  v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v6;
}

id __46__CTCellularPlanManager_didSelectPlanForData___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __46__CTCellularPlanManager_didSelectPlanForData___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  id result;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "didselectplanfordata completion, was successful: %d", (uint8_t *)v8, 8u);
  }
  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)didEnablePlanItems:(id)a3
{
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager didEnablePlanItems:]";
    _os_log_impl(&dword_1D33B0000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__CTCellularPlanManager_didEnablePlanItems___block_invoke;
  v9[3] = &unk_1E9521E80;
  v9[4] = &buf;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__CTCellularPlanManager_didEnablePlanItems___block_invoke_2;
  v8[3] = &unk_1E9521E80;
  v8[4] = &buf;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v9), "didEnablePlanItems:completion:", a3, v8);
  v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v6;
}

id __44__CTCellularPlanManager_didEnablePlanItems___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

_QWORD *__44__CTCellularPlanManager_didEnablePlanItems___block_invoke_2(_QWORD *result, void *a2)
{
  _QWORD *v2;

  if (a2)
  {
    v2 = result;
    result = a2;
    *(_QWORD *)(*(_QWORD *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

- (id)setLabelForPlan:(id)a3 label:(id)a4
{
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  __int128 buf;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = CellularPlanLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager setLabelForPlan:label:]";
    _os_log_impl(&dword_1D33B0000, v7, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__CTCellularPlanManager_setLabelForPlan_label___block_invoke;
  v11[3] = &unk_1E9521E80;
  v11[4] = &buf;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__CTCellularPlanManager_setLabelForPlan_label___block_invoke_2;
  v10[3] = &unk_1E9521FC0;
  v10[4] = &buf;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v11), "setLabelForPlan:label:completion:", a3, a4, v10);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v8;
}

id __47__CTCellularPlanManager_setLabelForPlan_label___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __47__CTCellularPlanManager_setLabelForPlan_label___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id result;

  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)didSelectPlanForDefaultVoice:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "didSelectPlanForDefaultVoice", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_271;
  v9[3] = &unk_1E9521A28;
  v9[4] = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_3;
  v8[3] = &unk_1E9521F70;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v5, "didSelectPlanForDefaultVoice:completion:", v6, v8);
}

void __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_271(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "didSelectPlanForDefaultVoice completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_272;
  block[3] = &unk_1E9521F48;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = a3;
  block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_272(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)didSelectPlanForDefaultVoice:(id)a3
{
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager didSelectPlanForDefaultVoice:]";
    _os_log_impl(&dword_1D33B0000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CTCellularPlanManager_didSelectPlanForDefaultVoice___block_invoke;
  v9[3] = &unk_1E9521E80;
  v9[4] = &buf;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CTCellularPlanManager_didSelectPlanForDefaultVoice___block_invoke_2;
  v8[3] = &unk_1E9521FC0;
  v8[4] = &buf;
  objc_msgSend(-[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", v9), "didSelectPlanForDefaultVoice:completion:", a3, v8);
  v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v6;
}

id __54__CTCellularPlanManager_didSelectPlanForDefaultVoice___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __54__CTCellularPlanManager_didSelectPlanForDefaultVoice___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  id result;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "didSelectPlanForDefaultVoice completion, was successful: %d", (uint8_t *)v8, 8u);
  }
  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)didSelectPlansForIMessage:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CTCellularPlanManager didSelectPlansForIMessage:completion:]_block_invoke";
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_273;
  v9[3] = &unk_1E9521A28;
  v9[4] = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_3;
  v8[3] = &unk_1E9521F70;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v5, "didSelectPlansForIMessage:completion:", v6, v8);
}

void __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_273(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "didSelectPlansForIMessage completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_274;
  block[3] = &unk_1E9521F48;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = a3;
  block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_274(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)didPurchasePlanWithIccid:(id)a3 downloadProfile:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CTCellularPlanManager_didPurchasePlanWithIccid_downloadProfile___block_invoke;
  block[3] = &unk_1E9522008;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(queue, block);
}

uint64_t __66__CTCellularPlanManager_didPurchasePlanWithIccid_downloadProfile___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_275), "didPurchasePlanWithIccid:downloadProfile:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)didDeletePlanItem:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "Delete plan", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_276;
  v9[3] = &unk_1E9521A28;
  v9[4] = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_3;
  v8[3] = &unk_1E9521F70;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v5, "didDeletePlanItem:completion:", v6, v8);
}

void __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_276(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "Delete Plan completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_277;
  block[3] = &unk_1E9521F48;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = a3;
  block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_277(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)eraseAllPlans:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __39__CTCellularPlanManager_eraseAllPlans___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "Erase All Plans", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke_278;
  v9[3] = &unk_1E9521A28;
  v9[4] = v4;
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke_3;
  v8[3] = &unk_1E9521F70;
  v8[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v6, "eraseAllPlansWithCompletion:", v8);
}

void __39__CTCellularPlanManager_eraseAllPlans___block_invoke_278(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __39__CTCellularPlanManager_eraseAllPlans___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __39__CTCellularPlanManager_eraseAllPlans___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "Erase All Plans completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke_279;
  block[3] = &unk_1E9521F48;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = a3;
  block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __39__CTCellularPlanManager_eraseAllPlans___block_invoke_279(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)eraseAllRemotePlansWithCSN:(id)a3 completion:(id)a4
{
  -[CTCellularPlanManager eraseAllRemotePlansWithCompletion:](self, "eraseAllRemotePlansWithCompletion:", a4);
}

- (void)didPurchasePlanForCsn:(id)a3 iccid:(id)a4 profileServer:(id)a5 state:(id)a6
{
  NSObject *v11;
  NSObject *queue;
  _QWORD block[9];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = CellularPlanLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CTCellularPlanManager didPurchasePlanForCsn:iccid:profileServer:state:]";
    _os_log_impl(&dword_1D33B0000, v11, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CTCellularPlanManager_didPurchasePlanForCsn_iccid_profileServer_state___block_invoke;
  block[3] = &unk_1E9522050;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(queue, block);
}

uint64_t __73__CTCellularPlanManager_didPurchasePlanForCsn_iccid_profileServer_state___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_280), "didPurchasePlanForCsn:iccid:profileServer:state:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __73__CTCellularPlanManager_didPurchasePlanForCsn_iccid_profileServer_state___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didPurchasePlanForCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  NSObject *v13;
  NSObject *queue;
  _QWORD v15[10];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = CellularPlanLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CTCellularPlanManager didPurchasePlanForCarrier:mnc:gid1:gid2:state:]";
    _os_log_impl(&dword_1D33B0000, v13, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__CTCellularPlanManager_didPurchasePlanForCarrier_mnc_gid1_gid2_state___block_invoke;
  v15[3] = &unk_1E9522098;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  v15[9] = a7;
  dispatch_async(queue, v15);
}

uint64_t __71__CTCellularPlanManager_didPurchasePlanForCarrier_mnc_gid1_gid2_state___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_281), "didPurchasePlanForCarrier:mnc:gid1:gid2:state:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __71__CTCellularPlanManager_didPurchasePlanForCarrier_mnc_gid1_gid2_state___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didTransferPlanForCsn:(id)a3 iccid:(id)a4 srcIccid:(id)a5 profileServer:(id)a6 state:(id)a7
{
  NSObject *v13;
  NSObject *queue;
  _QWORD v15[10];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = CellularPlanLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CTCellularPlanManager didTransferPlanForCsn:iccid:srcIccid:profileServer:state:]";
    _os_log_impl(&dword_1D33B0000, v13, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__CTCellularPlanManager_didTransferPlanForCsn_iccid_srcIccid_profileServer_state___block_invoke;
  v15[3] = &unk_1E9522098;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  v15[9] = a7;
  dispatch_async(queue, v15);
}

uint64_t __82__CTCellularPlanManager_didTransferPlanForCsn_iccid_srcIccid_profileServer_state___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_282), "didTransferPlanForCsn:iccid:srcIccid:profileServer:state:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __82__CTCellularPlanManager_didTransferPlanForCsn_iccid_srcIccid_profileServer_state___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setUserInPurchaseFlow:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CTCellularPlanManager_setUserInPurchaseFlow___block_invoke;
  v4[3] = &unk_1E9522100;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __47__CTCellularPlanManager_setUserInPurchaseFlow___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_283), "setUserInPurchaseFlow:", *(unsigned __int8 *)(a1 + 40));
}

- (void)expirePlan
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CTCellularPlanManager_expirePlan__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__CTCellularPlanManager_expirePlan__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_284), "expirePlan");
}

void __35__CTCellularPlanManager_expirePlan__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)isRemotePlanCapableWithContext:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_2_286;
  v7[3] = &unk_1E9521AC8;
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v4, "isRemotePlanCapableWithContext:completion:", v5, v7);
}

void __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_285;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_285(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_2_286(uint64_t a1, char a2)
{
  NSObject *global_queue;
  _QWORD v5[5];
  char v6;

  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_3;
  v5[3] = &unk_1E9521AA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)shouldShowAddNewRemotePlanWithContext:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_2_288;
  v7[3] = &unk_1E9522170;
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v4, "shouldShowAddNewRemotePlanWithContext:completion:", v5, v7);
}

void __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_287;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

void __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_2_288(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *global_queue;
  uint64_t v11;
  _QWORD block[8];
  char v13;

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_3;
  block[3] = &unk_1E9522148;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = a2;
  block[6] = v11;
  block[7] = a3;
  block[4] = a4;
  block[5] = a5;
  dispatch_async(global_queue, block);
}

uint64_t __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)startRemoteProvisioningForCSN:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke;
  v5[3] = &unk_1E9521AF0;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

uint64_t __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_2_291;
  v7[3] = &unk_1E9521AC8;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "startRemoteProvisioningWithCompletion:", v7);
}

void __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_290;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_290(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_2_291(uint64_t a1, char a2)
{
  NSObject *global_queue;
  _QWORD v5[5];
  char v6;

  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_3;
  v5[3] = &unk_1E9521AA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)finishRemoteProvisioningForCSN:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke;
  v5[3] = &unk_1E9521AF0;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

uint64_t __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_2_293;
  v7[3] = &unk_1E9521AC8;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "finishRemoteProvisioningWithCompletion:", v7);
}

void __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_292;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_292(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_2_293(uint64_t a1, char a2)
{
  NSObject *global_queue;
  _QWORD v5[5];
  char v6;

  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_3;
  v5[3] = &unk_1E9521AA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)manageAccountForRemotePlan:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_2_295;
  v7[3] = &unk_1E9521F70;
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v4, "manageAccountForRemotePlan:completion:", v5, v7);
}

void __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_294;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_294(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_2_295(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[6];
  char v9;

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_3;
  block[3] = &unk_1E9521F48;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = a2;
  block[4] = a3;
  block[5] = v7;
  dispatch_async(global_queue, block);
}

uint64_t __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)addNewRemotePlan:(BOOL)a3 withCSN:(id)a4 withContext:(id)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  NSObject *queue;
  _QWORD v8[9];
  BOOL v9;

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke;
  v8[3] = &unk_1E9522198;
  v9 = a3;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a7;
  v8[8] = a6;
  dispatch_async(queue, v8);
}

uint64_t __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_2;
  v11[3] = &unk_1E9521A28;
  v11[4] = *(_QWORD *)(a1 + 56);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v11);
  v5 = *(unsigned __int8 *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_2_297;
  v10[3] = &unk_1E9521A28;
  v8 = *(_QWORD *)(a1 + 64);
  v10[4] = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v4, "addNewRemotePlan:withCSN:withContext:userConsent:completion:", v5, v6, v7, v8, v10);
}

void __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_296;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_296(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_2_297(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addNewRemotePlanWithCardData:(id)a3 confirmationCode:(id)a4 isPairing:(BOOL)a5 withCSN:(id)a6 withContext:(id)a7 userConsent:(int64_t)a8 completion:(id)a9
{
  NSObject *queue;
  _QWORD v10[11];
  BOOL v11;

  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke;
  v10[3] = &unk_1E95221C0;
  v10[4] = self;
  v10[5] = a3;
  v11 = a5;
  v10[6] = a4;
  v10[7] = a6;
  v10[8] = a7;
  v10[9] = a9;
  v10[10] = a8;
  dispatch_async(queue, v10);
}

uint64_t __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2;
  v13[3] = &unk_1E9521A28;
  v13[4] = *(_QWORD *)(a1 + 72);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2_299;
  v12[3] = &unk_1E9521A28;
  v10 = *(_QWORD *)(a1 + 80);
  v12[4] = *(_QWORD *)(a1 + 72);
  return objc_msgSend(v4, "addNewRemotePlanWithCardData:confirmationCode:isPairing:withCSN:withContext:userConsent:completion:", v5, v6, v7, v8, v9, v10, v12);
}

void __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_298;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_298(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2_299(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addNewRemotePlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 isPairing:(BOOL)a7 withCSN:(id)a8 withContext:(id)a9 userConsent:(int64_t)a10 completion:(id)a11
{
  NSObject *queue;
  _QWORD v12[13];
  BOOL v13;

  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke;
  v12[3] = &unk_1E95221E8;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a5;
  v13 = a7;
  v12[8] = a6;
  v12[9] = a8;
  v12[10] = a9;
  v12[11] = a11;
  v12[12] = a10;
  dispatch_async(queue, v12);
}

uint64_t __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];
  _QWORD v15[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2;
  v15[3] = &unk_1E9521A28;
  v15[4] = *(_QWORD *)(a1 + 88);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v15);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(unsigned __int8 *)(a1 + 104);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 80);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2_301;
  v14[3] = &unk_1E9521A28;
  v12 = *(_QWORD *)(a1 + 96);
  v14[4] = *(_QWORD *)(a1 + 88);
  return objc_msgSend(v4, "addNewRemotePlanWithAddress:matchingId:oid:confirmationCode:isPairing:withCSN:withContext:userConsent:completion:", v5, v6, v7, v8, v9, v10, v11, v12, v14);
}

void __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_300;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_300(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2_301(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)remotePlanItemsWithCompletion:(id)a3
{
  -[CTCellularPlanManager remotePlanItemsWithUpdateFetch:withCSN:completion:](self, "remotePlanItemsWithUpdateFetch:withCSN:completion:", 0, 0, a3);
}

- (void)remotePlanItemsWithUpdateFetch:(BOOL)a3 withCSN:(id)a4 completion:(id)a5
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v7;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke;
  block[3] = &unk_1E9521E58;
  block[4] = self;
  block[5] = a5;
  v7 = a3;
  dispatch_async(queue, block);
}

uint64_t __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_2;
  v9[3] = &unk_1E9521A28;
  v9[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v9);
  v6 = *(unsigned __int8 *)(a1 + 48);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_4;
  v8[3] = &unk_1E9521DE8;
  v8[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "remotePlanItemsWithUpdateFetch:completion:", v6, v8);
}

void __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_5;
  block[3] = &unk_1E9521DC0;
  v7 = *(_QWORD *)(a1 + 32);
  block[5] = a3;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)didSelectRemotePlanItem:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "proxy_select", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_302;
  v9[3] = &unk_1E9521A28;
  v9[4] = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_3;
  v8[3] = &unk_1E9521F70;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v5, "didSelectRemotePlanItem:completion:", v6, v8);
}

void __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_302(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "proxy_select completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_303;
  block[3] = &unk_1E9521F48;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = a3;
  block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_303(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)didDeleteRemotePlanItem:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "proxy_delete", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_304;
  v9[3] = &unk_1E9521A28;
  v9[4] = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_3;
  v8[3] = &unk_1E9521F70;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v5, "didDeleteRemotePlanItem:completion:", v6, v8);
}

void __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_304(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "proxy_delete completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_305;
  block[3] = &unk_1E9521F48;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = a3;
  block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_305(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)fetchRemoteProfiles:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CTCellularPlanManager_fetchRemoteProfiles___block_invoke;
  v4[3] = &unk_1E95219D8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __45__CTCellularPlanManager_fetchRemoteProfiles___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_306), "fetchRemoteProfiles:", *(_QWORD *)(a1 + 40));
}

void __45__CTCellularPlanManager_fetchRemoteProfiles___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getAutoPlanSelectionWithCompletion:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__CTCellularPlanManager_getAutoPlanSelectionWithCompletion___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __60__CTCellularPlanManager_getAutoPlanSelectionWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_307), "getAutoPlanSelectionWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __60__CTCellularPlanManager_getAutoPlanSelectionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setAutoPlanSelection:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CTCellularPlanManager_setAutoPlanSelection___block_invoke;
  v4[3] = &unk_1E9522100;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __46__CTCellularPlanManager_setAutoPlanSelection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_308), "setAutoPlanSelection:", *(unsigned __int8 *)(a1 + 40));
}

void __46__CTCellularPlanManager_setAutoPlanSelection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getRoamingSignupOverrideWithCompletion:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CTCellularPlanManager_getRoamingSignupOverrideWithCompletion___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __64__CTCellularPlanManager_getRoamingSignupOverrideWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_309), "getRoamingSignupOverrideWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __64__CTCellularPlanManager_getRoamingSignupOverrideWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setRoamingSignupOverride:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CTCellularPlanManager_setRoamingSignupOverride___block_invoke;
  v4[3] = &unk_1E9522100;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __50__CTCellularPlanManager_setRoamingSignupOverride___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_310), "setRoamingSignupOverride:", *(unsigned __int8 *)(a1 + 40));
}

void __50__CTCellularPlanManager_setRoamingSignupOverride___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getSkipEligibilityCheck:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__CTCellularPlanManager_getSkipEligibilityCheck___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__CTCellularPlanManager_getSkipEligibilityCheck___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_311), "getSkipEligibilityCheck:", *(_QWORD *)(a1 + 40));
}

void __49__CTCellularPlanManager_getSkipEligibilityCheck___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setSkipEligibilityCheck:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__CTCellularPlanManager_setSkipEligibilityCheck___block_invoke;
  v4[3] = &unk_1E9522100;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__CTCellularPlanManager_setSkipEligibilityCheck___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_312), "setSkipEligibilityCheck:", *(unsigned __int8 *)(a1 + 40));
}

void __49__CTCellularPlanManager_setSkipEligibilityCheck___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)selectRemoteProfile:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CTCellularPlanManager_selectRemoteProfile___block_invoke;
  v4[3] = &unk_1E95219D8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __45__CTCellularPlanManager_selectRemoteProfile___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_313), "selectRemoteProfile:", *(_QWORD *)(a1 + 40));
}

void __45__CTCellularPlanManager_selectRemoteProfile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)deleteRemoteProfile:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CTCellularPlanManager_deleteRemoteProfile___block_invoke;
  v4[3] = &unk_1E95219D8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __45__CTCellularPlanManager_deleteRemoteProfile___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_314), "deleteRemoteProfile:", *(_QWORD *)(a1 + 40));
}

void __45__CTCellularPlanManager_deleteRemoteProfile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)deleteAllRemoteProfiles
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CTCellularPlanManager_deleteAllRemoteProfiles__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __48__CTCellularPlanManager_deleteAllRemoteProfiles__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_315), "deleteAllRemoteProfiles");
}

void __48__CTCellularPlanManager_deleteAllRemoteProfiles__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getRemoteInfo:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __39__CTCellularPlanManager_getRemoteInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = v3;
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke_2_317;
  v7[3] = &unk_1E9522290;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "getRemoteInfo:", v7);
}

void __39__CTCellularPlanManager_getRemoteInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting device info %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke_316;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __39__CTCellularPlanManager_getRemoteInfo___block_invoke_316(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __39__CTCellularPlanManager_getRemoteInfo___block_invoke_2_317(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "getRemoteInfo completed", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke_318;
  block[3] = &unk_1E9521DC0;
  v8 = *(_QWORD *)(a1 + 32);
  block[5] = a3;
  block[6] = v8;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __39__CTCellularPlanManager_getRemoteInfo___block_invoke_318(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getPhoneAuthTokenWithMessage:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke;
  block[3] = &unk_1E9521C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_2;
  v8[3] = &unk_1E9521A28;
  v8[4] = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_2_321;
  v7[3] = &unk_1E95222B8;
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v4, "getPhoneAuthTokenWithMessage:completion:", v5, v7);
}

void __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting device info %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_320;
  v7[3] = &unk_1E9521B18;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_320(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32) != 0);
}

void __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_2_321(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[6];
  char v9;

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_3;
  block[3] = &unk_1E9521F48;
  v7 = *(_QWORD *)(a1 + 32);
  block[4] = a2;
  block[5] = v7;
  v9 = a3;
  dispatch_async(global_queue, block);
}

uint64_t __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (void)didPurchaseRemotePlanForEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSmdpFqdn:(id)a7 completion:(id)a8
{
  NSObject *v15;
  NSObject *queue;
  _QWORD block[11];
  uint8_t buf[16];

  v15 = CellularPlanLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v15, OS_LOG_TYPE_INFO, "didPurchaseRemotePlanForEid", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke;
  block[3] = &unk_1E95222E0;
  block[9] = a7;
  block[10] = a8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(queue, block);
}

uint64_t __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_2;
  v12[3] = &unk_1E9521A28;
  v12[4] = *(_QWORD *)(a1 + 80);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v12);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_2_324;
  v11[3] = &unk_1E9521AC8;
  v9 = *(_QWORD *)(a1 + 72);
  v11[4] = *(_QWORD *)(a1 + 80);
  return objc_msgSend(v4, "didPurchaseRemotePlanForEid:imei:meid:iccid:alternateSmdpFqdn:completion:", v5, v6, v7, v8, v9, v11);
}

void __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = a2;
    _os_log_impl(&dword_1D33B0000, v4, OS_LOG_TYPE_INFO, "Error getting proxy %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_323;
  block[3] = &unk_1E9521A78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_323(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_2_324(uint64_t a1, char a2)
{
  NSObject *global_queue;
  _QWORD v5[5];
  char v6;

  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_3;
  v5[3] = &unk_1E9521AA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)didCancelRemotePlan
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CTCellularPlanManager didCancelRemotePlan]";
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CTCellularPlanManager_didCancelRemotePlan__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__CTCellularPlanManager_didCancelRemotePlan__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_325), "didCancelRemotePlan");
}

void __44__CTCellularPlanManager_didCancelRemotePlan__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)pendingReleaseRemotePlan
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CTCellularPlanManager pendingReleaseRemotePlan]";
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CTCellularPlanManager_pendingReleaseRemotePlan__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__CTCellularPlanManager_pendingReleaseRemotePlan__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_326), "pendingReleaseRemotePlan");
}

void __49__CTCellularPlanManager_pendingReleaseRemotePlan__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)userSignupInitiatedOrFailed
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CTCellularPlanManager userSignupInitiatedOrFailed]";
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CTCellularPlanManager_userSignupInitiatedOrFailed__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__CTCellularPlanManager_userSignupInitiatedOrFailed__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_327), "userSignupInitiatedOrFailed");
}

void __52__CTCellularPlanManager_userSignupInitiatedOrFailed__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)eraseAllRemotePlansWithCompletion:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke;
  v4[3] = &unk_1E9521AF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v2, OS_LOG_TYPE_INFO, "prxoy_erase_remote_plans", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_328;
  v9[3] = &unk_1E9521A28;
  v9[4] = v4;
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_3;
  v8[3] = &unk_1E9521F70;
  v8[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v6, "eraseAllRemotePlansWithCompletion:", v8);
}

void __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_328(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_2;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  uint8_t buf[16];

  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D33B0000, v6, OS_LOG_TYPE_INFO, "proxy_erase_remote_plans completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_329;
  block[3] = &unk_1E9521F48;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = a3;
  block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_329(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)getPredefinedLabels
{
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  __int128 buf;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CTCellularPlanManager getPredefinedLabels]";
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  v4 = -[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", &__block_literal_global_330);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CTCellularPlanManager_getPredefinedLabels__block_invoke_2;
  v7[3] = &unk_1E9521E30;
  v7[4] = &buf;
  objc_msgSend(v4, "getPredefinedLabels:", v7);
  v5 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v5;
}

id __44__CTCellularPlanManager_getPredefinedLabels__block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)userDidProvideResponse:(int64_t)a3 confirmationCode:(id)a4 forPlan:(id)a5 isRemote:(BOOL)a6 completion:(id)a7
{
  NSObject *v13;
  NSObject *queue;
  _QWORD v15[9];
  BOOL v16;
  uint8_t buf[4];
  int64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13 = CellularPlanLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v18 = a3;
    v19 = 2112;
    v20 = a4;
    _os_log_impl(&dword_1D33B0000, v13, OS_LOG_TYPE_INFO, "userDidProvideResponse: consent response: %ld, confirmation code: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke;
  v15[3] = &unk_1E9522198;
  v16 = a6;
  v15[7] = a7;
  v15[8] = a3;
  v15[4] = self;
  v15[5] = a4;
  v15[6] = a5;
  dispatch_async(queue, v15);
}

uint64_t __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_2;
  v11[3] = &unk_1E9521A28;
  v11[4] = *(_QWORD *)(a1 + 56);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v11);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 72))
  {
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_4;
    v10[3] = &unk_1E9521F70;
    v10[4] = *(_QWORD *)(a1 + 56);
    return objc_msgSend(v4, "remoteUserDidProvideResponse:confirmationCode:plan:completion:", v5 == 0, v6, v7, v10);
  }
  else
  {
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_6;
    v9[3] = &unk_1E9521F70;
    v9[4] = *(_QWORD *)(a1 + 56);
    return objc_msgSend(v4, "userDidProvideResponse:confirmationCode:plan:completion:", v5, v6, v7, v9);
  }
}

void __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_3;
  v6[3] = &unk_1E9521B18;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_4(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[6];
  char v9;

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_5;
  block[3] = &unk_1E9521F48;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = a2;
  block[4] = a3;
  block[5] = v7;
  dispatch_async(global_queue, block);
}

uint64_t __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_6(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[6];
  char v9;

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_7;
  block[3] = &unk_1E9521F48;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = a2;
  block[4] = a3;
  block[5] = v7;
  dispatch_async(global_queue, block);
}

uint64_t __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)userDidProvideConsentResponse:(int64_t)a3 forPlan:(id)a4 isRemote:(BOOL)a5 completion:(id)a6
{
  -[CTCellularPlanManager userDidProvideResponse:confirmationCode:forPlan:isRemote:completion:](self, "userDidProvideResponse:confirmationCode:forPlan:isRemote:completion:", a3, 0, a4, a5, a6);
}

- (id)getSubscriptionContextUUIDforPlan:(id)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  __int128 buf;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1D33B0000, v5, OS_LOG_TYPE_INFO, "getSubscriptionContextUUIDforPlan: %@", (uint8_t *)&buf, 0xCu);
  }
  v6 = -[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", &__block_literal_global_331);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v7 = objc_msgSend(a3, "iccid");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CTCellularPlanManager_getSubscriptionContextUUIDforPlan___block_invoke_2;
  v10[3] = &unk_1E95223A8;
  v10[4] = &buf;
  objc_msgSend(v6, "getSubscriptionContextUUIDforPlan:completion:", v7, v10);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v8;
}

id __59__CTCellularPlanManager_getSubscriptionContextUUIDforPlan___block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)getShortLabelsForLabels:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1D33B0000, v5, OS_LOG_TYPE_INFO, "getShortLabelsForLabels: %@", (uint8_t *)&buf, 0xCu);
  }
  v6 = -[CTCellularPlanManager synchronousProxyWithErrorHandler:](self, "synchronousProxyWithErrorHandler:", &__block_literal_global_333);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__CTCellularPlanManager_getShortLabelsForLabels___block_invoke_2;
  v9[3] = &unk_1E9521E30;
  v9[4] = &buf;
  objc_msgSend(v6, "getShortLabelsForLabels:completion:", a3, v9);
  v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v7;
}

id __49__CTCellularPlanManager_getShortLabelsForLabels___block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

+ (int64_t)calculateInstallConsentTextTypeFor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(a3);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
      if (objc_msgSend(v9, "type") == 2)
      {
        if (objc_msgSend(v9, "isSelected")
          && objc_msgSend((id)objc_msgSend(v9, "plan"), "status") == 7)
        {
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "isDisableNotAllowed") & 1) != 0)
            return 1;
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "isDeleteNotAllowed") & 1) != 0)
            return 2;
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "requiresUserConsent"))
          {
            if (objc_msgSend(v9, "shouldDisplayExtendedConsentInfo"))
              return 7;
            else
              return 3;
          }
        }
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "isDisableNotAllowed") & 1) != 0)
        {
          v6 = 4;
        }
        else if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "isDeleteNotAllowed") & (v6 == 0)) != 0)
        {
          v6 = 5;
        }
      }
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
      continue;
    break;
  }
  return v6;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *queue;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  objc_super v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    v6 = self->_connection;
  }
  else
  {
    v6 = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)CTCellularPlanManager;
  -[CTCellularPlanManager dealloc](&v7, sel_dealloc);
}

void __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D33B0000, v0, v1, "Failed to create synchronous remote object proxy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __29__CTCellularPlanManager_ping__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D33B0000, log, OS_LOG_TYPE_ERROR, "no proxy", v1, 2u);
}

void __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D33B0000, v0, v1, "proxy error, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
