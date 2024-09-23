@implementation ASCWebKitSPISupport

+ (BOOL)shouldUseAlternateCredentialStore
{
  passwd *v2;
  int pw_uid;
  BOOL result;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint8_t v11[16];

  v2 = getpwnam("_securityagent");
  if (v2)
    pw_uid = v2->pw_uid;
  else
    pw_uid = 92;
  if (getuid() == pw_uid)
    return 0;
  if (!objc_msgSend(MEMORY[0x24BE82CC8], "isInternalInstall"))
    return 1;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("AuthenticationServicesAgent")) & 1) == 0)
  {

    return 1;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("useLegacyPlatformAuthenticatorInternal"));

  if (!v8)
    return 1;
  v9 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v10)
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_20E648000, v9, OS_LOG_TYPE_DEFAULT, "Using legacy platform authenticator due to syncingPlatformAuthenticatorEnabled", v11, 2u);
    return 0;
  }
  return result;
}

+ (void)setShouldUseAlternateCredentialStore:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20E648000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring request to turn off passkeys.", v4, 2u);
  }
}

+ (void)getShouldUseAlternateCredentialStoreWithCompletionHandler:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

+ (BOOL)arePasskeysDisallowedForRelyingParty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  char v8;
  int v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t *v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.AuthenticationServicesCore.AuthenticationServicesAgent")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", authenticationServicesViewServiceBundleIdentifier) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Preferences")))
  {

LABEL_5:
    +[ASFeatureManager sharedManager](ASFeatureManager, "sharedManager");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject arePasskeysDisallowedForRelyingParty:](v7, "arePasskeysDisallowedForRelyingParty:", v4);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v5, "safari_isSafariFamilyApplicationBundle");

  if (v10)
    goto LABEL_5;
  v11 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E648000, v11, OS_LOG_TYPE_INFO, "Synchronously looking up passkey quirks.", buf, 2u);
  }
  v12 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x2020000000;
  v19 = 0;
  dispatch_group_enter(v12);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__ASCWebKitSPISupport_arePasskeysDisallowedForRelyingParty___block_invoke;
  v13[3] = &unk_24C97F970;
  v15 = buf;
  v7 = v12;
  v14 = v7;
  objc_msgSend(a1, "getArePasskeysDisallowedForRelyingParty:withCompletionHandler:", v4, v13);
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = v17[24] != 0;

  _Block_object_dispose(buf, 8);
LABEL_6:

  return v8;
}

void __60__ASCWebKitSPISupport_arePasskeysDisallowedForRelyingParty___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)getArePasskeysDisallowedForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = getArePasskeysDisallowedForRelyingParty_withCompletionHandler__onceToken;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&getArePasskeysDisallowedForRelyingParty_withCompletionHandler__onceToken, &__block_literal_global_11);
  v8 = (void *)getArePasskeysDisallowedForRelyingParty_withCompletionHandler__agentProxy;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__ASCWebKitSPISupport_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_24C97F9B8;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "getArePasskeysDisallowedForRelyingParty:withCompletionHandler:", v7, v10);

}

void __85__ASCWebKitSPISupport_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke()
{
  ASCAgentProxy *v0;
  void *v1;

  v0 = objc_alloc_init(ASCAgentProxy);
  v1 = (void *)getArePasskeysDisallowedForRelyingParty_withCompletionHandler__agentProxy;
  getArePasskeysDisallowedForRelyingParty_withCompletionHandler__agentProxy = (uint64_t)v0;

}

uint64_t __85__ASCWebKitSPISupport_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)canCurrentProcessAccessPasskeysForRelyingParty:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = dispatch_group_create();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  dispatch_group_enter(v5);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__ASCWebKitSPISupport_canCurrentProcessAccessPasskeysForRelyingParty___block_invoke;
  v8[3] = &unk_24C97F970;
  v10 = &v11;
  v6 = v5;
  v9 = v6;
  objc_msgSend(a1, "getCanCurrentProcessAccessPasskeysForRelyingParty:withCompletionHandler:", v4, v8);
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(a1) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)a1;
}

void __70__ASCWebKitSPISupport_canCurrentProcessAccessPasskeysForRelyingParty___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)getCanCurrentProcessAccessPasskeysForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler__onceToken;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler__onceToken, &__block_literal_global_15);
  v8 = (void *)getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler__agentProxy;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __95__ASCWebKitSPISupport_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_24C97F9B8;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "getCanCurrentProcessAccessPasskeysForRelyingParty:withCompletionHandler:", v7, v10);

}

void __95__ASCWebKitSPISupport_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke()
{
  ASCAgentProxy *v0;
  void *v1;

  v0 = objc_alloc_init(ASCAgentProxy);
  v1 = (void *)getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler__agentProxy;
  getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler__agentProxy = (uint64_t)v0;

}

uint64_t __95__ASCWebKitSPISupport_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)resetCredentialStore
{
  ASCAgentProxy *v2;
  ASCAgentProxy *v3;
  _QWORD v4[4];
  ASCAgentProxy *v5;

  v2 = objc_alloc_init(ASCAgentProxy);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__ASCWebKitSPISupport_resetCredentialStore__block_invoke;
  v4[3] = &unk_24C97E868;
  v5 = v2;
  v3 = v2;
  -[ASCAgentProxy clearAllPlatformPublicKeyCredentialsWithCompletionHandler:](v3, "clearAllPlatformPublicKeyCredentialsWithCompletionHandler:", v4);

}

void __43__ASCWebKitSPISupport_resetCredentialStore__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Cleared credential store.", v1, 2u);
  }
}

+ (id)alternateLargeBlobIfNecessaryForRelyingParty:(id)a3 clientDataHash:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;

  v5 = sub_20E6EA1CC();
  v7 = v6;
  v8 = a4;
  v9 = sub_20E6E9C80();
  v11 = v10;

  v12 = _sSo19ASCWebKitSPISupportC26AuthenticationServicesCoreE29alternateLargeBlobIfNecessary3for14clientDataHash10Foundation0N0VSgSS_AItFZ_0(v5, v7);
  v14 = v13;
  sub_20E6673F4(v9, v11);
  swift_bridgeObjectRelease();
  if (v14 >> 60 == 15)
  {
    v15 = 0;
  }
  else
  {
    v15 = (void *)sub_20E6E9C68();
    sub_20E66AA28((uint64_t)v12, v14);
  }
  return v15;
}

+ (id)entepriseAttestationIdentityPersistentReferenceForRelyingParty:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  sub_20E6EA1CC();
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v4 = (void *)sub_20E6EA1C0();
  v5 = objc_msgSend(v3, sel_entepriseAttestationIdentityPersistentReferenceForRelyingParty_, v4);

  if (v5)
  {
    v6 = sub_20E6E9C80();
    v8 = v7;
    swift_bridgeObjectRelease();

    v9 = (void *)sub_20E6E9C68();
    sub_20E6673F4(v6, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    v9 = 0;
  }
  return v9;
}

+ (void)getClientCapabilitiesForRelyingParty:(NSString *)a3 withCompletionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A2E8A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_20E6EA37C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_254A2EFC8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_254A2EFD0;
  v14[5] = v13;
  v15 = a3;
  sub_20E6E2380((uint64_t)v9, (uint64_t)&unk_254A2E918, (uint64_t)v14);
  swift_release();
}

@end
