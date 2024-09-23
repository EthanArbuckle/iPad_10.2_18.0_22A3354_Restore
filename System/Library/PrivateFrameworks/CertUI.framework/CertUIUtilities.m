@implementation CertUIUtilities

+ (id)bundleIDFromAuditToken:(id *)a3
{
  __int128 v3;
  NSObject *v4;
  const char *v5;
  NSObject *v8;
  void *cf;
  uint8_t buf[16];
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  v11 = v3;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    v4 = _CertUILogObjects;
    if (!os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_DEBUG))
      return cf;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = 0;
    v5 = "Looked up bundle ID %@ from audit token using entitlement.";
LABEL_4:
    _os_log_impl(&dword_20AA96000, v4, OS_LOG_TYPE_DEBUG, v5, buf, 0xCu);
    return cf;
  }
  cf = (void *)CPCopyBundleIdentifierFromAuditToken();
  if (cf)
  {
    v4 = _CertUILogObjects;
    if (!os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_DEBUG))
      return cf;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = cf;
    v5 = "Looked up bundle ID %@ from audit token using Info.plist.";
    goto LABEL_4;
  }
  v8 = _CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA96000, v8, OS_LOG_TYPE_ERROR, "Could not look up bundle identifier using audit token.", buf, 2u);
  }
  return 0;
}

+ (id)localizedAppTitleForBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SafariViewService")) & 1) != 0
    || objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.webapp")))
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilesafari"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = _CertUILogObjects;
      if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
      {
        v18 = 138543362;
        v19 = v4;
        _os_log_impl(&dword_20AA96000, v6, OS_LOG_TYPE_ERROR, "Could not retrieve localized app title for Safari for bundle ID: %{public}@", (uint8_t *)&v18, 0xCu);
      }
    }
    objc_msgSend(v5, "localizedName");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (__CFString *)v7;
    v9 = CFSTR("Safari");
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;
LABEL_9:
    v11 = v10;

    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.WebSheet")))
  {
    v13 = MGGetBoolAnswer();
    v14 = CFSTR("WEBSHEET_LOCALIZED_NAME");
    if (v13)
      v14 = CFSTR("WEBSHEET_LOCALIZED_NAME_CHINA");
    v8 = v14;
    objc_msgSend(a1, "_certUIBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v8, &stru_24C35DEB0, 0);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (!v15
    || (objc_msgSend(v15, "localizedName"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v16, !v16))
  {
    v17 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543362;
      v19 = v4;
      _os_log_impl(&dword_20AA96000, v17, OS_LOG_TYPE_ERROR, "Could not retrieve localized app title given bundle ID: %{public}@", (uint8_t *)&v18, 0xCu);
    }
  }
  objc_msgSend(v5, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

+ (id)_certUIBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__CertUIUtilities__certUIBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_certUIBundle_onceToken != -1)
    dispatch_once(&_certUIBundle_onceToken, block);
  return (id)_certUIBundle_certUIBundle;
}

void __32__CertUIUtilities__certUIBundle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_certUIBundle_certUIBundle;
  _certUIBundle_certUIBundle = v1;

}

@end
