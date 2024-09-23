@implementation FontServicesDaemonManager

void __42__FontServicesDaemonManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sSharedInstance;
  sharedManager_sSharedInstance = v0;

}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  return (id)sharedManager_sSharedInstance;
}

void __39__FontServicesDaemonManager_connection__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Error(CFSTR("ServicesDaemonManager"), CFSTR("invalidationHandler is called. %s"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager connection]_block_invoke_2");
}

- (NSXPCConnection)connection
{
  FontServicesDaemonManager *v2;
  NSXPCConnection *connection;
  uint64_t v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSXPCConnection *v15;

  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (!connection)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.fontservicesd"), 0);
    v5 = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB9F88);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_checkin_reply_, 0, 1);
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v6);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB7E80);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v14);
    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_64);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_67);
    -[NSXPCConnection resume](v2->_connection, "resume");

    connection = v2->_connection;
  }
  v15 = connection;
  objc_sync_exit(v2);

  return v15;
}

- (void)fontAddedInfo:(id)a3 addedURLStrings:(id)a4 removedURLStrings:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v7 = a5;
  v8 = a4;
  v16 = a3;
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(v7, "count");
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("font change notification - add: %d, remove:%d"), v10, v11, v12, v13, v14, v15, v9);
  GSFontChangeNotificationHandler();

}

- (void)checkin:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__FontServicesDaemonManager_checkin_reply___block_invoke;
  v15[3] = &unk_1E612C5D0;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __43__FontServicesDaemonManager_checkin_reply___block_invoke_2;
  v13[3] = &unk_1E612C5F8;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "checkin:reply:", v7, v13);

}

uint64_t __43__FontServicesDaemonManager_checkin_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Error(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager checkin:reply:]_block_invoke");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__FontServicesDaemonManager_checkin_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkinForFontPicker:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__FontServicesDaemonManager_checkinForFontPicker___block_invoke;
  v12[3] = &unk_1E612C5D0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __50__FontServicesDaemonManager_checkinForFontPicker___block_invoke_2;
  v10[3] = &unk_1E612C5F8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "checkinForFontPicker:", v10);

}

uint64_t __50__FontServicesDaemonManager_checkinForFontPicker___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager checkinForFontPicker:]_block_invoke");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__FontServicesDaemonManager_checkinForFontPicker___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestFonts:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  -[FontServicesDaemonManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__FontServicesDaemonManager_requestFonts_reply___block_invoke;
  v26[3] = &unk_1E612C5D0;
  v10 = v7;
  v27 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v12 = (void *)getUIWindowClass_softClass;
  v32 = getUIWindowClass_softClass;
  if (!getUIWindowClass_softClass)
  {
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __getUIWindowClass_block_invoke;
    v28[3] = &unk_1E612C590;
    v28[4] = &v29;
    __getUIWindowClass_block_invoke((uint64_t)v28);
    v12 = (void *)v30[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v29, 8);
  objc_msgSend(v13, "_applicationKeyWindow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "windowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_sceneIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("got sceneID: %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __48__FontServicesDaemonManager_requestFonts_reply___block_invoke_2;
  v24[3] = &unk_1E612C5F8;
  v25 = v10;
  v23 = v10;
  objc_msgSend(v11, "requestFonts:sceneID:reply:", v6, v16, v24);

}

uint64_t __48__FontServicesDaemonManager_requestFonts_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager requestFonts:reply:]_block_invoke");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__FontServicesDaemonManager_requestFonts_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestFonts:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "requestFonts:forClient:reply:", v7, v6, &__block_literal_global_10);
}

void __52__FontServicesDaemonManager_requestFonts_forClient___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager requestFonts:forClient:]_block_invoke");
}

- (void)fontChanged:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fontChanged:reply:", v7, v6);
}

void __47__FontServicesDaemonManager_fontChanged_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager fontChanged:reply:]_block_invoke");
}

- (void)resumeAndShowAlertForSuspendedFontProviders
{
  void *v2;
  id v3;

  -[FontServicesDaemonManager connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "resumeAndShowAlertForSuspendedFontProviders:", &__block_literal_global_13);
}

void __72__FontServicesDaemonManager_resumeAndShowAlertForSuspendedFontProviders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager resumeAndShowAlertForSuspendedFontProviders]_block_invoke");
}

- (void)updatingUserFonts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__FontServicesDaemonManager_updatingUserFonts___block_invoke_2;
  v8[3] = &unk_1E612C6C0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "updatingUserFonts:", v8);

}

void __47__FontServicesDaemonManager_updatingUserFonts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager updatingUserFonts:]_block_invoke");
}

uint64_t __47__FontServicesDaemonManager_updatingUserFonts___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetIssuedFontsFor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resetIssuedFontsFor:reply:", v4, &__block_literal_global_16);
}

void __49__FontServicesDaemonManager_resetIssuedFontsFor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager resetIssuedFontsFor:]_block_invoke");
}

- (void)checkinForWebKitProcess:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "checkinForWebKitProcess:reply:", v7, v6);
}

void __59__FontServicesDaemonManager_checkinForWebKitProcess_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager checkinForWebKitProcess:reply:]_block_invoke");
}

- (void)synchronizeFontAssets:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_18);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "synchronizeFontAssets:reply:", v7, v6);
}

void __57__FontServicesDaemonManager_synchronizeFontAssets_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager synchronizeFontAssets:reply:]_block_invoke");
}

- (void)accessFontAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_19);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessFontAsset:", v4);
}

void __45__FontServicesDaemonManager_accessFontAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager accessFontAsset:]_block_invoke");
}

- (void)scheduleFontFilesDeletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FontServicesDaemonManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_20);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scheduleFontFilesDeletion:", v4);
}

void __55__FontServicesDaemonManager_scheduleFontFilesDeletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("ServicesDaemonManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager scheduleFontFilesDeletion:]_block_invoke");
}

void __39__FontServicesDaemonManager_connection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Error(CFSTR("ServicesDaemonManager"), CFSTR("interruptionHandler is called. %s"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager connection]_block_invoke");
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
