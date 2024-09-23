@implementation FSUserFontManager

+ (id)xpcInterface
{
  if (xpcInterface_onceToken != -1)
    dispatch_once(&xpcInterface_onceToken, &__block_literal_global_5);
  return (id)xpcInterface_xpcInterface;
}

void __33__FSUserFontManager_xpcInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEBA048);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcInterface_xpcInterface;
  xpcInterface_xpcInterface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_installFonts_forIdentifier_enabled_appInfo_completionHandler_, 0, 0);
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_installFonts_forIdentifier_enabled_appInfo_completionHandler_, 0, 1);
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_installFonts_forIdentifier_enabled_appInfo_completionHandler_, 1, 1);
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_uninstallFonts_forIdentifier_appInfo_completionHandler_, 0, 0);
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_uninstallFonts_forIdentifier_appInfo_completionHandler_, 0, 1);
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_uninstallFonts_forIdentifier_appInfo_completionHandler_, 1, 1);
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_registeredFontsInfoForIdentifier_enabled_appInfo_completionHandler_, 0, 1);
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_enableOrDisablePersistentURLs_enabled_completionHandler_, 0, 0);
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_enableOrDisablePersistentURLs_enabled_completionHandler_, 0, 1);
  objc_msgSend((id)xpcInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_fontProvidersSubscriptionSupportInfo_, 0, 1);

}

+ (id)_UserFontManagerConnection
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a1;
  objc_sync_enter(v2);
  if (_UserFontManagerConnection_connection)
  {
    v3 = (id)_UserFontManagerConnection_connection;
  }
  else
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.FontServices.UserFontManager"));
    v5 = (void *)_UserFontManagerConnection_connection;
    _UserFontManagerConnection_connection = v4;

    objc_msgSend((id)_UserFontManagerConnection_connection, "setInvalidationHandler:", &__block_literal_global_189);
    +[FSUserFontManager xpcInterface](FSUserFontManager, "xpcInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_UserFontManagerConnection_connection, "setRemoteObjectInterface:", v6);
    objc_msgSend((id)_UserFontManagerConnection_connection, "resume");
    v3 = (id)_UserFontManagerConnection_connection;

  }
  objc_sync_exit(v2);

  return v3;
}

void __47__FSUserFontManager__UserFontManagerConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  uint64_t vars0;

  FSLog(CFSTR("FSUserFontManager"), CFSTR("XPC connection for 'com.apple.FontServices.UserFontManager' was invalidated"), a3, a4, a5, a6, a7, a8, vars0);
  v8 = (void *)_UserFontManagerConnection_connection;
  _UserFontManagerConnection_connection = 0;

}

+ ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  void *v5;
  void *v6;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  id v8;

  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_194_0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ping:", &__block_literal_global_197);
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "auditToken");
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

void __31__FSUserFontManager_auditToken__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("xpc error: %s - %@"), "+[FSUserFontManager auditToken]_block_invoke", a2);
}

+ (void)installFonts:(id)a3 forIdentifier:(id)a4 enabled:(BOOL)a5 appInfo:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a5;
  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__FSUserFontManager_installFonts_forIdentifier_enabled_appInfo_completionHandler___block_invoke;
  v22[3] = &unk_1E612C5D0;
  v17 = v11;
  v23 = v17;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __82__FSUserFontManager_installFonts_forIdentifier_enabled_appInfo_completionHandler___block_invoke_2;
  v20[3] = &unk_1E612C810;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "installFonts:forIdentifier:enabled:appInfo:completionHandler:", v14, v13, v8, v12, v20);

}

uint64_t __82__FSUserFontManager_installFonts_forIdentifier_enabled_appInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager installFonts:forIdentifier:enabled:appInfo:completionHandler:]_block_invoke");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __82__FSUserFontManager_installFonts_forIdentifier_enabled_appInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)uninstallFonts:(id)a3 forIdentifier:(id)a4 appInfo:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__FSUserFontManager_uninstallFonts_forIdentifier_appInfo_completionHandler___block_invoke;
  v20[3] = &unk_1E612C5D0;
  v15 = v9;
  v21 = v15;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __76__FSUserFontManager_uninstallFonts_forIdentifier_appInfo_completionHandler___block_invoke_2;
  v18[3] = &unk_1E612C810;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "uninstallFonts:forIdentifier:appInfo:completionHandler:", v12, v11, v10, v18);

}

uint64_t __76__FSUserFontManager_uninstallFonts_forIdentifier_appInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager uninstallFonts:forIdentifier:appInfo:completionHandler:]_block_invoke");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __76__FSUserFontManager_uninstallFonts_forIdentifier_appInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)registeredFontsInfoForIdentifier:(id)a3 enabled:(BOOL)a4 appInfo:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_199_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__FSUserFontManager_registeredFontsInfoForIdentifier_enabled_appInfo___block_invoke_200;
  v13[3] = &unk_1E612C858;
  v13[4] = &v14;
  objc_msgSend(v10, "registeredFontsInfoForIdentifier:enabled:appInfo:completionHandler:", v7, v6, v8, v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __70__FSUserFontManager_registeredFontsInfoForIdentifier_enabled_appInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager registeredFontsInfoForIdentifier:enabled:appInfo:]_block_invoke");
}

void __70__FSUserFontManager_registeredFontsInfoForIdentifier_enabled_appInfo___block_invoke_200(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)registeredFontsForIdentifier:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_202_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__FSUserFontManager_registeredFontsForIdentifier_enabled___block_invoke_2;
  v10[3] = &unk_1E612C858;
  v10[4] = &v11;
  objc_msgSend(v7, "registeredFontsForIdentifier:enabled:completionHandler:", v5, v4, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __58__FSUserFontManager_registeredFontsForIdentifier_enabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager registeredFontsForIdentifier:enabled:]_block_invoke");
}

void __58__FSUserFontManager_registeredFontsForIdentifier_enabled___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)registeredFamiliesForIdentifier:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_203_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__FSUserFontManager_registeredFamiliesForIdentifier_enabled___block_invoke_2;
  v10[3] = &unk_1E612C858;
  v10[4] = &v11;
  objc_msgSend(v7, "registeredFamiliesForIdentifier:enabled:completionHandler:", v5, v4, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __61__FSUserFontManager_registeredFamiliesForIdentifier_enabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager registeredFamiliesForIdentifier:enabled:]_block_invoke");
}

void __61__FSUserFontManager_registeredFamiliesForIdentifier_enabled___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)deleteAppDialogWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  DeleteAppFontsDialogHandler *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_opt_class())
  {
    +[FSUserFontManager registeredFamiliesForIdentifier:enabled:](FSUserFontManager, "registeredFamiliesForIdentifier:enabled:", v5, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (void *)v7;
    else
      v8 = (void *)MEMORY[0x1E0C9AA60];
    v9 = -[DeleteAppFontsDialogHandler initWithCompletionHandler:]([DeleteAppFontsDialogHandler alloc], "initWithCompletionHandler:", v6);
    v10 = (void *)_deleteAppFontsDialogHandler;
    _deleteAppFontsDialogHandler = (uint64_t)v9;

    v12[0] = CFSTR("registeredFonts");
    v12[1] = CFSTR("deleteAppIdentifier");
    v13[0] = v8;
    v13[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_deleteAppFontsDialogHandler, "showDialogWithUserInfo:", v11);

  }
}

+ (void)unregisterAndRemoveFontFilesForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__FSUserFontManager_unregisterAndRemoveFontFilesForIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E612C5D0;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __81__FSUserFontManager_unregisterAndRemoveFontFilesForIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_1E612C5D0;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "unregisterAndRemoveFontFilesForIdentifier:completionHandler:", v6, v12);

}

void __81__FSUserFontManager_unregisterAndRemoveFontFilesForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), v3, v4, v5, v6, v7, v8, (uint64_t)"+[FSUserFontManager unregisterAndRemoveFontFilesForIdentifier:completionHandler:]_block_invoke");
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

}

uint64_t __81__FSUserFontManager_unregisterAndRemoveFontFilesForIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)enableOrDisablePersistentURLs:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_209);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "enableOrDisablePersistentURLs:enabled:completionHandler:", v5, v4, &__block_literal_global_210);
}

void __59__FSUserFontManager_enableOrDisablePersistentURLs_enabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager enableOrDisablePersistentURLs:enabled:]_block_invoke");
}

void __59__FSUserFontManager_enableOrDisablePersistentURLs_enabled___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    FSLog_Error(CFSTR("FSUserFontManager"), CFSTR("enableOrDisablePersistentURLs errors - %@"), a3, a4, a5, a6, a7, a8, a2);
}

+ (id)userFontsInfo
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_213);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__FSUserFontManager_userFontsInfo__block_invoke_2;
  v6[3] = &unk_1E612CA60;
  v6[4] = &v7;
  objc_msgSend(v3, "userFontsInfo:", v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__FSUserFontManager_userFontsInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager userFontsInfo]_block_invoke");
}

void __34__FSUserFontManager_userFontsInfo__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)profileFontsInfo
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_215);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__FSUserFontManager_profileFontsInfo__block_invoke_2;
  v6[3] = &unk_1E612CA60;
  v6[4] = &v7;
  objc_msgSend(v3, "profileFontsInfo:", v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __37__FSUserFontManager_profileFontsInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager profileFontsInfo]_block_invoke");
}

void __37__FSUserFontManager_profileFontsInfo__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)directoryNameFromIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_216);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__FSUserFontManager_directoryNameFromIdentifier___block_invoke_2;
  v8[3] = &unk_1E612CA88;
  v8[4] = &v9;
  objc_msgSend(v5, "directoryNameFromIdentifier:completionHandler:", v3, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __49__FSUserFontManager_directoryNameFromIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager directoryNameFromIdentifier:]_block_invoke");
}

void __49__FSUserFontManager_directoryNameFromIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (double)secondsSinceLastAccessed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  _QWORD v8[5];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_218);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__FSUserFontManager_secondsSinceLastAccessed___block_invoke_2;
  v8[3] = &unk_1E612CAB0;
  v8[4] = &v9;
  objc_msgSend(v5, "secondsSinceLastAccessed:completionHandler:", v3, v8);
  v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __46__FSUserFontManager_secondsSinceLastAccessed___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager secondsSinceLastAccessed:]_block_invoke");
}

uint64_t __46__FSUserFontManager_secondsSinceLastAccessed___block_invoke_2(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (id)fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled:(unint64_t *)a3 andRemovedCount:(unint64_t *)a4 andProfileFontsCount:(unint64_t *)a5
{
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_220);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __119__FSUserFontManager_fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled_andRemovedCount_andProfileFontsCount___block_invoke_2;
  v12[3] = &unk_1E612CAD8;
  v12[4] = &v13;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a5;
  objc_msgSend(v9, "fontProvidersSubscriptionSupportInfo:", v12);
  v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __119__FSUserFontManager_fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled_andRemovedCount_andProfileFontsCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled:andRemovedCount:andProfileFontsCount:]_block_invoke");
}

void __119__FSUserFontManager_fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled_andRemovedCount_andProfileFontsCount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10;
  _QWORD *v11;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v11 = *(_QWORD **)(a1 + 48);
  **(_QWORD **)(a1 + 40) = a3;
  *v11 = a4;
  **(_QWORD **)(a1 + 56) = a5;

}

+ (id)resumeSuspendedFontFiles
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_222);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__FSUserFontManager_resumeSuspendedFontFiles__block_invoke_2;
  v6[3] = &unk_1E612CA60;
  v6[4] = &v7;
  objc_msgSend(v3, "resumeSuspendedFontFiles:", v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __45__FSUserFontManager_resumeSuspendedFontFiles__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager resumeSuspendedFontFiles]_block_invoke");
}

void __45__FSUserFontManager_resumeSuspendedFontFiles__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)suspendFontProvider:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_223);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "suspendFontProvider:completionHandler:", v3, &__block_literal_global_224);
}

void __41__FSUserFontManager_suspendFontProvider___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager suspendFontProvider:]_block_invoke");
}

+ (id)suspendedFontProviders
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_225);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__FSUserFontManager_suspendedFontProviders__block_invoke_2;
  v6[3] = &unk_1E612C858;
  v6[4] = &v7;
  objc_msgSend(v3, "suspendedFontProviders:", v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __43__FSUserFontManager_suspendedFontProviders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager suspendedFontProviders]_block_invoke");
}

void __43__FSUserFontManager_suspendedFontProviders__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)knownFontProviders
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_226);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__FSUserFontManager_knownFontProviders__block_invoke_2;
  v6[3] = &unk_1E612C858;
  v6[4] = &v7;
  objc_msgSend(v3, "knownFontProviders:", v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __39__FSUserFontManager_knownFontProviders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager knownFontProviders]_block_invoke");
}

void __39__FSUserFontManager_knownFontProviders__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)synchronizeFontProviders
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_227);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "synchronizeFontProviders:", &__block_literal_global_229);
}

void __45__FSUserFontManager_synchronizeFontProviders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager synchronizeFontProviders]_block_invoke");
}

+ (void)updateAppInfo:(id)a3 forIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_230);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updateAppInfo:forIdentifier:", v6, v5);
}

void __49__FSUserFontManager_updateAppInfo_forIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager updateAppInfo:forIdentifier:]_block_invoke");
}

+ (id)identifierFromDirectoryName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_231);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__FSUserFontManager_identifierFromDirectoryName___block_invoke_2;
  v8[3] = &unk_1E612CA88;
  v8[4] = &v9;
  objc_msgSend(v5, "identifierFromDirectoryName:completionHandler:", v3, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __49__FSUserFontManager_identifierFromDirectoryName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager identifierFromDirectoryName:]_block_invoke");
}

void __49__FSUserFontManager_identifierFromDirectoryName___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)reset
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_232);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "reset");
}

void __26__FSUserFontManager_reset__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager reset]_block_invoke");
}

+ (void)_removeAllUserFonts
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_233);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_removeAllUserFonts");
}

void __40__FSUserFontManager__removeAllUserFonts__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager _removeAllUserFonts]_block_invoke");
}

+ (void)synchronizeFontAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_234);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "synchronizeFontAssets:", v3);
}

void __43__FSUserFontManager_synchronizeFontAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager synchronizeFontAssets:]_block_invoke");
}

+ (void)synchronizeProfileFonts:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_UserFontManagerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_235);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "synchronizeProfileFonts:", v3);
}

void __45__FSUserFontManager_synchronizeProfileFonts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(CFSTR("FSUserFontManager"), CFSTR("xpc error: %s - %@"), a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager synchronizeProfileFonts:]_block_invoke");
}

@end
