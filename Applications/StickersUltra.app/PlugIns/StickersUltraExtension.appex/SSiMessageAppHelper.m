@implementation SSiMessageAppHelper

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
  v4 = (void *)qword_10009D898;
  v20 = qword_10009D898;
  if (!qword_10009D898)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000973C;
    v16[3] = &unk_10008A010;
    v16[4] = &v17;
    sub_10000973C((uint64_t)v16);
    v4 = (void *)v18[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v17, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pluginKitProxyForIdentifier:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "teamID"));
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containingBundle"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "teamID"));
    v12 = (void *)v11;
    v13 = CFSTR("0000000000");
    if (v11)
      v13 = (__CFString *)v11;
    v9 = v13;

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(IMBalloonPluginIdentifierMessageExtension, "stringByAppendingFormat:", CFSTR(":%@:%@"), v9, v3));

  return v14;
}

+ (id)entitlementValueForBalloonHost:(id)a3 expectedClass:(Class)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext"));
  if ((objc_opt_respondsToSelector(v6, "balloonHostAuditToken") & 1) != 0)
  {
    v7 = v6;
    v8 = v7;
    v12 = 0u;
    v13 = 0u;
    if (v7)
      objc_msgSend(v7, "balloonHostAuditToken", v12, v13);
    v9 = (void *)IMDAuditTokenTaskCopyValueForEntitlement(&v12, v5);
    if ((objc_opt_isKindOfClass(v9, a4) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)balloonHostAppIsMessages
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = +[SSiMessageAppHelper entitlementValueForBalloonHost:expectedClass:](SSiMessageAppHelper, "entitlementValueForBalloonHost:expectedClass:", CFSTR("com.apple.messages.sticker-sharing-level"), objc_opt_class(NSString, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
    v4 = objc_msgSend(CFSTR("Messages"), "caseInsensitiveCompare:", v3) == 0;
  else
    v4 = 0;

  return v4;
}

@end
