@implementation CARAutomaticDNDStatus

- (CARAutomaticDNDStatus)init
{
  CARAutomaticDNDStatus *v2;
  CARAutomaticDNDStatus *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CARAutomaticDNDStatus;
  v2 = -[CARAutomaticDNDStatus init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cachedAutomaticDNDActiveState = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_CARDNDEnabledCallback, (CFStringRef)CARAutomaticDNDEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_CARDNDDisabledCallback, (CFStringRef)CARAutomaticDNDDisabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_CARDNDExitConfirmationEnabledCallback, (CFStringRef)CARAutomaticDNDExitConfirmationEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_CARDNDExitConfirmationDisabledCallback, (CFStringRef)CARAutomaticDNDExitConfirmationDisabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    -[CARAutomaticDNDStatus _setupConnection](v3, "_setupConnection");
  }
  return v3;
}

+ (id)_DNDServiceInterface
{
  if (_DNDServiceInterface_onceToken != -1)
    dispatch_once(&_DNDServiceInterface_onceToken, &__block_literal_global_14);
  return (id)_DNDServiceInterface___interface;
}

void __45__CARAutomaticDNDStatus__DNDServiceInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC438);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DNDServiceInterface___interface;
  _DNDServiceInterface___interface = v0;

}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.dnd.service"), 4096);
  objc_msgSend((id)objc_opt_class(), "_DNDServiceInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit DND service.", v6, 2u);
  }

  objc_msgSend(v3, "resume");
  -[CARAutomaticDNDStatus setConnection:](self, "setConnection:", v3);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)CARAutomaticDNDStatus;
  -[CARAutomaticDNDStatus dealloc](&v4, sel_dealloc);
}

- (void)fetchAutomaticDNDAssertionWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke;
  v9[3] = &unk_1E5428B38;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke_87;
  v7[3] = &unk_1E5427E30;
  v8 = v10;
  v6 = v10;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v9, v7);

}

void __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke_2;
  v4[3] = &unk_1E5428B10;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "isCarPlayAutomaticDNDActiveWithReply:", v4);

}

uint64_t __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CarDNDWDLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "Fetched Driving state %@", (uint8_t *)&v8, 0xCu);

  }
  v6 = 1;
  if ((_DWORD)a2)
    v6 = 2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v6;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke_87(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

+ (BOOL)isAutomaticDNDAvailable
{
  if (isAutomaticDNDAvailable_onceToken != -1)
    dispatch_once(&isAutomaticDNDAvailable_onceToken, &__block_literal_global_89);
  return isAutomaticDNDAvailable___isAvailable;
}

void __48__CARAutomaticDNDStatus_isAutomaticDNDAvailable__block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    isAutomaticDNDAvailable___isAvailable = CFEqual(v0, CFSTR("iPhone")) != 0;
    CFRelease(v1);
  }
}

- (void)_xpcFetchWithServiceBlock:(id)a3 errorHandler:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  id *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  uint8_t buf[16];

  v6 = (void (**)(id, void *))a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "isAutomaticDNDAvailable") & 1) != 0)
  {
    -[CARAutomaticDNDStatus connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__CARAutomaticDNDStatus__xpcFetchWithServiceBlock_errorHandler___block_invoke_2;
    v14[3] = &unk_1E5427E30;
    v9 = &v15;
    v15 = v7;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      CarDNDWDLogging();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit Driving service.", buf, 2u);
      }

      v6[2](v6, v10);
    }
    goto LABEL_10;
  }
  CarDNDWDLogging();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v12, OS_LOG_TYPE_DEFAULT, "DND While Driving is not available on this device.", buf, 2u);
  }

  if (v7)
  {
    -[CARAutomaticDNDStatus connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__CARAutomaticDNDStatus__xpcFetchWithServiceBlock_errorHandler___block_invoke;
    block[3] = &unk_1E5428B80;
    v9 = &v17;
    v17 = v7;
    dispatch_async(v13, block);

LABEL_10:
  }

}

uint64_t __64__CARAutomaticDNDStatus__xpcFetchWithServiceBlock_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__CARAutomaticDNDStatus__xpcFetchWithServiceBlock_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CarDNDWDLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "CarKit Driving service error: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)_resetUserDNDSettingsWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CARAutomaticDNDStatus__resetUserDNDSettingsWithReply___block_invoke;
  v9[3] = &unk_1E5428BA8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __56__CARAutomaticDNDStatus__resetUserDNDSettingsWithReply___block_invoke_2;
  v7[3] = &unk_1E5427E30;
  v8 = v10;
  v6 = v10;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v9, v7);

}

uint64_t __56__CARAutomaticDNDStatus__resetUserDNDSettingsWithReply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetAutomaticDNDPreferencesWithReply:", *(_QWORD *)(a1 + 32));
}

uint64_t __56__CARAutomaticDNDStatus__resetUserDNDSettingsWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)setAutomaticDNDActive:(BOOL)a3 withReply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__CARAutomaticDNDStatus_setAutomaticDNDActive_withReply___block_invoke;
  v11[3] = &unk_1E5428BD0;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __57__CARAutomaticDNDStatus_setAutomaticDNDActive_withReply___block_invoke_2;
  v9[3] = &unk_1E5427E30;
  v10 = v12;
  v8 = v12;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v11, v9);

}

uint64_t __57__CARAutomaticDNDStatus_setAutomaticDNDActive_withReply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCarPlayAutomaticDNDActive:withReply:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __57__CARAutomaticDNDStatus_setAutomaticDNDActive_withReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchAutomaticDNDExitConfirmationWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__CARAutomaticDNDStatus_fetchAutomaticDNDExitConfirmationWithReply___block_invoke;
  v9[3] = &unk_1E5428BA8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __68__CARAutomaticDNDStatus_fetchAutomaticDNDExitConfirmationWithReply___block_invoke_2;
  v7[3] = &unk_1E5427E30;
  v8 = v10;
  v6 = v10;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v9, v7);

}

uint64_t __68__CARAutomaticDNDStatus_fetchAutomaticDNDExitConfirmationWithReply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldDisplayExitConfirmationWithReply:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__CARAutomaticDNDStatus_fetchAutomaticDNDExitConfirmationWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)allowedAutoReplyAudience:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__CARAutomaticDNDStatus_allowedAutoReplyAudience___block_invoke;
  v9[3] = &unk_1E5428BA8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __50__CARAutomaticDNDStatus_allowedAutoReplyAudience___block_invoke_2;
  v7[3] = &unk_1E5427E30;
  v8 = v10;
  v6 = v10;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v9, v7);

}

uint64_t __50__CARAutomaticDNDStatus_allowedAutoReplyAudience___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allowedAutoReplyAudienceWithReply:", *(_QWORD *)(a1 + 32));
}

uint64_t __50__CARAutomaticDNDStatus_allowedAutoReplyAudience___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)setAllowedAutoReplyAudience:(unint64_t)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CARAutomaticDNDStatus_setAllowedAutoReplyAudience_reply___block_invoke;
  v11[3] = &unk_1E5428BF8;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __59__CARAutomaticDNDStatus_setAllowedAutoReplyAudience_reply___block_invoke_2;
  v9[3] = &unk_1E5427E30;
  v10 = v12;
  v8 = v12;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v11, v9);

}

uint64_t __59__CARAutomaticDNDStatus_setAllowedAutoReplyAudience_reply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAllowedAutoReplyAudience:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __59__CARAutomaticDNDStatus_setAllowedAutoReplyAudience_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)autoReplyMessageWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke;
  v9[3] = &unk_1E5428BA8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke_3;
  v7[3] = &unk_1E5427E30;
  v8 = v10;
  v6 = v10;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v9, v7);

}

void __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke_2;
  v3[3] = &unk_1E5428C20;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "autoReplyMessageWithReply:", v3);

}

uint64_t __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)setAutoReplyMessage:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke;
  v13[3] = &unk_1E5428B38;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke_3;
  v11[3] = &unk_1E5427E30;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v13, v11);

}

void __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke_2;
  v4[3] = &unk_1E5428618;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "setAutoReplyMessage:reply:", v3, v4);

}

uint64_t __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (BOOL)platformSupportsSendingAutoReplies
{
  const void *v2;
  BOOL v3;

  v2 = (const void *)MGCopyAnswer();
  v3 = CFEqual(v2, CFSTR("iPhone")) != 0;
  CFRelease(v2);
  return v3;
}

- (BOOL)platformSupportsUrgentMessages
{
  const void *v2;
  BOOL v3;

  v2 = (const void *)MGCopyAnswer();
  v3 = CFEqual(v2, CFSTR("iPhone")) != 0;
  CFRelease(v2);
  return v3;
}

- (void)fetchAutomaticDNDTriggerPreferenceWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__CARAutomaticDNDStatus_fetchAutomaticDNDTriggerPreferenceWithReply___block_invoke;
  v9[3] = &unk_1E5428BA8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __69__CARAutomaticDNDStatus_fetchAutomaticDNDTriggerPreferenceWithReply___block_invoke_2;
  v7[3] = &unk_1E5427E30;
  v8 = v10;
  v6 = v10;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v9, v7);

}

uint64_t __69__CARAutomaticDNDStatus_fetchAutomaticDNDTriggerPreferenceWithReply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchDNDTriggerModeWithReply:", *(_QWORD *)(a1 + 32));
}

uint64_t __69__CARAutomaticDNDStatus_fetchAutomaticDNDTriggerPreferenceWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)setAutomaticDNDTriggerPreference:(unint64_t)a3 withReply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__CARAutomaticDNDStatus_setAutomaticDNDTriggerPreference_withReply___block_invoke;
  v11[3] = &unk_1E5428BF8;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __68__CARAutomaticDNDStatus_setAutomaticDNDTriggerPreference_withReply___block_invoke_2;
  v9[3] = &unk_1E5427E30;
  v10 = v12;
  v8 = v12;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v11, v9);

}

uint64_t __68__CARAutomaticDNDStatus_setAutomaticDNDTriggerPreference_withReply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDNDTriggerMode:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __68__CARAutomaticDNDStatus_setAutomaticDNDTriggerPreference_withReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)disableDNDUntilEndOfDriveWithContext:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__CARAutomaticDNDStatus_disableDNDUntilEndOfDriveWithContext_reply___block_invoke;
  v13[3] = &unk_1E5428B38;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __68__CARAutomaticDNDStatus_disableDNDUntilEndOfDriveWithContext_reply___block_invoke_2;
  v11[3] = &unk_1E5427E30;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[CARAutomaticDNDStatus _xpcFetchWithServiceBlock:errorHandler:](self, "_xpcFetchWithServiceBlock:errorHandler:", v13, v11);

}

uint64_t __68__CARAutomaticDNDStatus_disableDNDUntilEndOfDriveWithContext_reply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "disableDNDUntilEndOfDriveWithContext:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __68__CARAutomaticDNDStatus_disableDNDUntilEndOfDriveWithContext_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)disableDNDUntilEndOfDriveWithReply:(id)a3
{
  -[CARAutomaticDNDStatus disableDNDUntilEndOfDriveWithContext:reply:](self, "disableDNDUntilEndOfDriveWithContext:reply:", 0, a3);
}

- (void)setAutomaticDNDInternalExitConfirmationOverrideEnabledPreference:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARDNDMiniInternalExitConfirmationOverride");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (BOOL)isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDMiniInternalExitConfirmationOverride"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAutomaticDNDInternalForceOverrideEnabledPreference:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARDNDMiniInternalForceOverride");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (BOOL)isAutomaticDNDInternalForceOverrideEnabledPreference
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDMiniInternalForceOverride"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setCompletedFirstRidePreference:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARDNDMiniHasCompletedFirstRide");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (BOOL)hasCompletedFirstRidePreference
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDMiniHasCompletedFirstRide"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setStartedFirstRidePreference:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARDNDMiniHasStartedFirstRide");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (BOOL)hasStartedFirstRidePreference
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDMiniHasStartedFirstRide"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAutomaticDNDTriggeringMethod:(unint64_t)a3
{
  __CFString *v5;
  void *v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v9;
  __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[CARAutomaticDNDStatus automaticDNDTriggeringMethod](self, "automaticDNDTriggeringMethod") != a3)
  {
    v5 = CFSTR("CARDNDAutomaticTriggeringMethod");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CarDNDWDLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = CRPreferencesAutomaticDNDDomain;
      _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v9, 0x20u);
    }

    CFPreferencesSetAppValue(v5, v6, CRPreferencesAutomaticDNDDomain);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[CARAutomaticDNDStatus setMostRecentTriggerMethodChange:](self, "setMostRecentTriggerMethodChange:");
    -[CARAutomaticDNDStatus setHasAdjustedTriggerMethod:](self, "setHasAdjustedTriggerMethod:", 1);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)CARAutomaticDNDTriggeringPreferenceChangedNotification, 0, 0, 1u);
  }
}

- (unint64_t)automaticDNDTriggeringMethod
{
  void *v2;
  unint64_t v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDAutomaticTriggeringMethod"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setAutomaticDNDInternalShowGeofencingAlertsEnabledPreference:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARDNDMiniInternalShowGeofencingAlerts");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (BOOL)isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDMiniInternalShowGeofencingAlerts"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAutomaticDNDInternalShowUserAlertsEnabledPreference:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARDNDMiniInternalShowInternalAlerts");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (BOOL)isAutomaticDNDInternalShowUserAlertsEnabledPreference
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDMiniInternalShowInternalAlerts"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAutomaticDNDInternalDNDBuddyEnabledPreference:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARDNDInternalDNDBuddyDisplay");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (BOOL)isAutomaticDNDInternalDNDBuddyPreference
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDInternalDNDBuddyDisplay"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setOptedOutOfAutomaticDND:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARDNDMiniUserOptedOutInBuddy");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (BOOL)hasOptedOutOfAutomaticDND
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDMiniUserOptedOutInBuddy"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setHasAdjustedTriggerMethod:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARDNDUserHasAdjustedTriggerMethod");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (BOOL)hasAdjustedTriggerMethod
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDUserHasAdjustedTriggerMethod"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasMigratedToDriving
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARHasMigratedToDriving"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setHasMigratedToDriving:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CARHasMigratedToDriving");
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);

  }
  v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

}

- (void)setActivateWithCarPlay:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  CFPropertyListRef *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v9;
  __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (-[CARAutomaticDNDStatus shouldActivateWithCarPlay](self, "shouldActivateWithCarPlay") != a3)
  {
    v4 = CFSTR("CARDNDActivateWithCarPlay");
    CarDNDWDLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v4;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = CRPreferencesAutomaticDNDDomain;
      _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v9, 0x20u);

    }
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
    if (!v3)
      v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
    CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)CARAutomaticDNDCarPlayActivationChangedNotification, 0, 0, 1u);
  }
}

- (BOOL)shouldActivateWithCarPlay
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDActivateWithCarPlay"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (double)mostRecentTriggerMethodChange
{
  void *v2;
  uint64_t v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDTriggerPreferenceChangedTimestamp"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "integerValue");

  return (double)v3;
}

- (void)setMostRecentTriggerMethodChange:(double)a3
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  NSObject *v6;
  int v7;
  __CFString *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t)a3;
  v4 = CFSTR("CARDNDTriggerPreferenceChangedTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CarDNDWDLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412802;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v7, 0x20u);
  }

  CFPreferencesSetAppValue(v4, v5, CRPreferencesAutomaticDNDDomain);
}

- (void)setFirstBuddyPresentationFirstMoment:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  double v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startOfDayForDate:", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[__CFString timeIntervalSinceReferenceDate](v5, "timeIntervalSinceReferenceDate");
    v7 = (uint64_t)v6;
    v8 = CFSTR("CARDNDFirstBuddyDateFirstMoment");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CarDNDWDLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412802;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = CRPreferencesAutomaticDNDDomain;
      _os_log_impl(&dword_1A83A2000, v10, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v12, 0x20u);
    }

    CFPreferencesSetAppValue(v8, v9, CRPreferencesAutomaticDNDDomain);
  }
  else
  {
    v5 = CFSTR("CARDNDFirstBuddyDateFirstMoment");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CarDNDWDLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412802;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = CRPreferencesAutomaticDNDDomain;
      _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v12, 0x20u);
    }

    CFPreferencesSetAppValue(v5, v8, CRPreferencesAutomaticDNDDomain);
  }

}

- (id)firstBuddyPresentationFirstMoment
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDFirstBuddyDateFirstMoment"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setDisableTimerTimestamp:(id)a3
{
  double v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v4 = (uint64_t)v3;
    v5 = CFSTR("CARDNDDisableTimerTimestamp");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v4;
  }
  else
  {
    v5 = CFSTR("CARDNDDisableTimerTimestamp");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = 0;
  }
  objc_msgSend(v6, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CarDNDWDLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1A83A2000, v9, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v10, 0x20u);
  }

  CFPreferencesSetAppValue(CFSTR("CARDNDDisableTimerTimestamp"), v8, CRPreferencesAutomaticDNDDomain);
}

- (id)disableTimerTimestamp
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CARDNDDisableTimerTimestamp"), CRPreferencesAutomaticDNDDomain);
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_performCARPreferencesBlock:(id)a3 forReading:(BOOL)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  void (**v6)(_QWORD);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a4;
  v5 = (void (**)(_QWORD))a3;
  v6 = v5;
  if (v4)
  {
    if (!CFPreferencesAppSynchronize(CRPreferencesAutomaticDNDDomain))
    {
      CarDNDWDLogging();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[CARAutomaticDNDStatus _performCARPreferencesBlock:forReading:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    }
    v6[2](v6);
  }
  else
  {
    v5[2](v5);
    if (!CFPreferencesAppSynchronize(CRPreferencesAutomaticDNDDomain))
    {
      CarDNDWDLogging();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[CARAutomaticDNDStatus _performCARPreferencesBlock:forReading:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);

    }
  }

}

- (void)_detachObservers
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)_dndStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _BOOL4 v6;
  unint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a3;
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = 2;
      _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Received car DND state ON.", buf, 2u);
    }
    else
    {
      v7 = 2;
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Received car DND state OFF.", v10, 2u);
    }
    v7 = 1;
  }

  self->_cachedAutomaticDNDActiveState = v7;
  -[CARAutomaticDNDStatus statusChangeObserver](self, "statusChangeObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CARAutomaticDNDStatus statusChangeObserver](self, "statusChangeObserver");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, v3);

  }
}

- (void)_exitConfirmationStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  __int16 v11;
  __int16 v12;

  v3 = a3;
  CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v6)
      goto LABEL_7;
    v12 = 0;
    v7 = "Received exit confirmation observer ON.";
    v8 = (uint8_t *)&v12;
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v11 = 0;
    v7 = "Received exit confirmation observer OFF.";
    v8 = (uint8_t *)&v11;
  }
  _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_7:

  -[CARAutomaticDNDStatus exitConfirmationChangeObserver](self, "exitConfirmationChangeObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CARAutomaticDNDStatus exitConfirmationChangeObserver](self, "exitConfirmationChangeObserver");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, v3);

  }
}

- (unint64_t)cachedAutomaticDNDActiveState
{
  return self->_cachedAutomaticDNDActiveState;
}

- (id)statusChangeObserver
{
  return self->_statusChangeObserver;
}

- (void)setStatusChangeObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)exitConfirmationChangeObserver
{
  return self->_exitConfirmationChangeObserver;
}

- (void)setExitConfirmationChangeObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_exitConfirmationChangeObserver, 0);
  objc_storeStrong(&self->_statusChangeObserver, 0);
}

- (void)_performCARPreferencesBlock:(uint64_t)a3 forReading:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A83A2000, a1, a3, "Failed synchronizing for reading.", a5, a6, a7, a8, 0);
}

- (void)_performCARPreferencesBlock:(uint64_t)a3 forReading:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A83A2000, a1, a3, "Failed synchronizing for writing.", a5, a6, a7, a8, 0);
}

@end
