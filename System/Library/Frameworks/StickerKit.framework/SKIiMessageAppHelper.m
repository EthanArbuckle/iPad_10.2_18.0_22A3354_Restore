@implementation SKIiMessageAppHelper

+ (id)extendedIdentifierFromIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v4 = (void *)getLSPlugInKitProxyClass_softClass;
  v20 = getLSPlugInKitProxyClass_softClass;
  if (!getLSPlugInKitProxyClass_softClass)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __getLSPlugInKitProxyClass_block_invoke;
    v16[3] = &unk_2505BD420;
    v16[4] = &v17;
    __getLSPlugInKitProxyClass_block_invoke((uint64_t)v16);
    v4 = (void *)v18[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v5, "pluginKitProxyForIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "teamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "containingBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "teamID");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("0000000000");
    if (v11)
      v13 = (__CFString *)v11;
    v9 = v13;

  }
  objc_msgSend((id)*MEMORY[0x24BE50B60], "stringByAppendingFormat:", CFSTR(":%@:%@"), v9, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entitlementValueForBalloonHost:(id)a3 expectedClass:(Class)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDDD0F8], "activeExtensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = v5;
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "balloonHostAuditToken", (unsigned __int128)0, (unsigned __int128)0);
    v8 = (void *)IMDAuditTokenTaskCopyValueForEntitlement();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)balloonHostAppIsMessages
{
  void *v2;
  BOOL v3;

  +[SKIiMessageAppHelper entitlementValueForBalloonHost:expectedClass:](SKIiMessageAppHelper, "entitlementValueForBalloonHost:expectedClass:", CFSTR("com.apple.messages.sticker-sharing-level"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = objc_msgSend(CFSTR("Messages"), "caseInsensitiveCompare:", v2) == 0;
  else
    v3 = 0;

  return v3;
}

@end
