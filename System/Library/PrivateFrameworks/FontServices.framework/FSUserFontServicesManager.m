@implementation FSUserFontServicesManager

+ (id)_UserFontServicesConnection
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v18;

  v2 = a1;
  objc_sync_enter(v2);
  if (_UserFontServicesConnection_connection)
  {
    v3 = (id)_UserFontServicesConnection_connection;
  }
  else
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.FontServices.UserFontServices"));
    v5 = (void *)_UserFontServicesConnection_connection;
    _UserFontServicesConnection_connection = v4;

    objc_msgSend((id)_UserFontServicesConnection_connection, "setInvalidationHandler:", &__block_literal_global_8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEBA0A8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_GSFontRegisterPersistentURLs_enabled_forProfileFonts_withReply_, 0, 0);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_GSFontUnregisterPersistentURLs_forProfileFonts_withReply_, 0, 0);
    v18 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_GSFontRegisterPersistentURLs_enabled_forProfileFonts_withReply_, 0, 1);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_GSFontUnregisterPersistentURLs_forProfileFonts_withReply_, 0, 1);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_GSFontEnableOrDisablePersistentURLs_forProfileFonts_enabled_suspend_withReply_, 0, 0);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_GSFontEnableOrDisablePersistentURLs_forProfileFonts_enabled_suspend_withReply_, 0, 1);
    v16 = v6;
    objc_msgSend((id)_UserFontServicesConnection_connection, "setRemoteObjectInterface:", v16);
    objc_msgSend((id)_UserFontServicesConnection_connection, "resume");
    v3 = (id)_UserFontServicesConnection_connection;

  }
  objc_sync_exit(v2);

  return v3;
}

void __56__FSUserFontServicesManager__UserFontServicesConnection__block_invoke()
{
  void *v0;

  NSLog(CFSTR("FSUserFontManager - XPC connection for 'com.apple.FontServices.UserFontServices' was invalidated"));
  v0 = (void *)_UserFontServicesConnection_connection;
  _UserFontServicesConnection_connection = 0;

}

+ (void)GSFontRegisterPersistentURLs:(id)a3 enabled:(BOOL)a4 forProfileFonts:(BOOL)a5 withReply:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a5;
  v7 = a4;
  v9 = a6;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontServicesConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__FSUserFontServicesManager_GSFontRegisterPersistentURLs_enabled_forProfileFonts_withReply___block_invoke;
  v14[3] = &unk_1E612C5D0;
  v15 = v9;
  v12 = v9;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "GSFontRegisterPersistentURLs:enabled:forProfileFonts:withReply:", v10, v7, v6, v12);
}

uint64_t __92__FSUserFontServicesManager_GSFontRegisterPersistentURLs_enabled_forProfileFonts_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)GSFontUnregisterPersistentURLs:(id)a3 forProfileFonts:(BOOL)a4 withReply:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontServicesConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__FSUserFontServicesManager_GSFontUnregisterPersistentURLs_forProfileFonts_withReply___block_invoke;
  v12[3] = &unk_1E612C5D0;
  v13 = v7;
  v10 = v7;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "GSFontUnregisterPersistentURLs:forProfileFonts:withReply:", v8, v5, v10);
}

uint64_t __86__FSUserFontServicesManager_GSFontUnregisterPersistentURLs_forProfileFonts_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)GSFontEnableOrDisablePersistentURLs:(id)a3 forProfileFonts:(BOOL)a4 enabled:(BOOL)a5 suspend:(BOOL)a6 withReply:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a7;
  objc_msgSend((id)objc_opt_class(), "_UserFontServicesConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __107__FSUserFontServicesManager_GSFontEnableOrDisablePersistentURLs_forProfileFonts_enabled_suspend_withReply___block_invoke;
  v20 = &unk_1E612CC70;
  v21 = v11;
  v22 = v12;
  v14 = v11;
  v15 = v12;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "GSFontEnableOrDisablePersistentURLs:forProfileFonts:enabled:suspend:withReply:", v14, v10, v9, v8, v15, v17, v18, v19, v20);
}

uint64_t __107__FSUserFontServicesManager_GSFontEnableOrDisablePersistentURLs_forProfileFonts_enabled_suspend_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
