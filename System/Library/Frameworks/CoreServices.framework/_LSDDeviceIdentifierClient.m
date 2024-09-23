@implementation _LSDDeviceIdentifierClient

- (BOOL)canAccessAdvertisingIdentifier
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  _QWORD v27[5];
  audit_token_t buf;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[LSApplicationRestrictionsManager sharedInstance]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[LSApplicationRestrictionsManager isAdTrackingEnabled](v3) & 1) == 0)
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      buf.val[0] = 67109120;
      buf.val[1] = objc_msgSend(v8, "processIdentifier");
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access denied because app tracking disabled by device management profile", (uint8_t *)&buf, 8u);

    }
LABEL_6:

    v9 = 0;
    goto LABEL_7;
  }
  v4 = (const __CFString *)getkTCCServiceUserTracking();
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "auditToken");
  else
    memset(&v27[1], 0, 32);
  buf = *(audit_token_t *)&v27[1];
  v11 = softLinkTCCAccessPreflightWithAuditToken(v4, &buf, 0);

  if (v11)
  {
    if (v11 == 1)
    {
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "processIdentifier");
        buf.val[0] = 67109120;
        buf.val[1] = v19;
        _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access denied because because user denided kTCCServiceUserTracking", (uint8_t *)&buf, 8u);

      }
    }
    else
    {
      if (v11 == 2)
      {
        v27[0] = 0;
        if (+[LSATTrackingEnforcementManager shouldEnforceTrackingWithReasonCode:](LSATTrackingEnforcementManager, "shouldEnforceTrackingWithReasonCode:", v27))
        {
          _LSDefaultLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            -[_LSDClient XPCConnection](self, "XPCConnection");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "processIdentifier");
            buf.val[0] = 67109120;
            buf.val[1] = v14;
            _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access denied because because app has not requested kTCCServiceUserTracking", (uint8_t *)&buf, 8u);

          }
        }
        else
        {
          _LSDefaultLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            buf.val[0] = 134217984;
            *(_QWORD *)&buf.val[1] = v27[0];
            _os_log_impl(&dword_182882000, v20, OS_LOG_TYPE_INFO, "Advertising identifier: AppTrackingTransparency enforcement is off (ATEnforcementServiceReasonCode %ld)", (uint8_t *)&buf, 0xCu);
          }

          if (!-[LSApplicationRestrictionsManager isLimitAdTrackingForced]((uint64_t)v3))
          {
            _LSDefaultLog();
            v12 = objc_claimAutoreleasedReturnValue();
            v9 = 1;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              -[_LSDClient XPCConnection](self, "XPCConnection");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "processIdentifier");
              buf.val[0] = 67109120;
              buf.val[1] = v24;
              _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access permitted because AppTrackingTransparency enforcement is off and LimitAdTracking is off", (uint8_t *)&buf, 8u);

              v9 = 1;
            }
            goto LABEL_30;
          }
          _LSDefaultLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            -[_LSDClient XPCConnection](self, "XPCConnection");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "processIdentifier");
            buf.val[0] = 67109120;
            buf.val[1] = v22;
            _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access denied because LimitAdTracking is on", (uint8_t *)&buf, 8u);

          }
        }
        v9 = 0;
LABEL_30:

        goto LABEL_7;
      }
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "processIdentifier");
        buf.val[0] = 67109376;
        buf.val[1] = v26;
        LOWORD(buf.val[2]) = 1024;
        *(unsigned int *)((char *)&buf.val[2] + 2) = v11;
        _os_log_error_impl(&dword_182882000, v7, OS_LOG_TYPE_ERROR, "Advertising identifier: PID %d access denied because because kTCCServiceUserTracking has invalid state %u", (uint8_t *)&buf, 0xEu);

      }
    }
    goto LABEL_6;
  }
  _LSDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "processIdentifier");
    buf.val[0] = 67109120;
    buf.val[1] = v17;
    _os_log_impl(&dword_182882000, v15, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access permitted because user granted kTCCServiceUserTracking", (uint8_t *)&buf, 8u);

  }
  v9 = 1;
LABEL_7:

  return v9;
}

- (_LSDDeviceIdentifierClient)initWithXPCConnection:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_LSDDeviceIdentifierClient;
  return -[_LSDClient initWithXPCConnection:](&v4, sel_initWithXPCConnection_, a3);
}

- (void)getIdentifierOfType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68___LSDDeviceIdentifierClient_getIdentifierOfType_completionHandler___block_invoke;
  v8[3] = &unk_1E1042EC8;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[_LSDDeviceIdentifierClient getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:completionHandler:](self, "getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:completionHandler:", a3, v8);

}

- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  if (!v10 || !v11)
  {
LABEL_8:
    v12[2](v12, 0);
    goto LABEL_9;
  }
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _LSCheckEntitlementForXPCConnection(v14, CFSTR("com.apple.lsapplicationproxy.deviceidentifierforvendor"));

  if (!v15)
  {
    _LSDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v21;
      v24 = 1024;
      v25 = a3;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_182882000, v20, OS_LOG_TYPE_DEFAULT, "Unentitled request from XPC connection %@ for identifier type %i of vendor %@", (uint8_t *)&v22, 0x1Cu);

    }
    goto LABEL_8;
  }
  +[_LSDeviceIdentifierManager sharedInstance](_LSDeviceIdentifierManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentPersona");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cacheForPersona:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "getIdentifierOfType:vendorName:bundleIdentifier:completionHandler:", a3, v10, v11, v12);

LABEL_9:
}

- (void)getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  os_unfair_lock_s *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 == 1
    && (-[_LSDClient XPCConnection](self, "XPCConnection"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "_xpcConnection"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = _LSCheckEntitlementForXPCConnectionQuiet(v8, CFSTR("com.apple.developer.exposure-notification")),
        v8,
        v7,
        v9))
  {
    _LSDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = CFSTR("com.apple.developer.exposure-notification");
      _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "Request for IDFA/IDFV from a process that has entitlement %{public}@; ignoring.",
        buf,
        0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v6 + 2))(v6, 0, 0, 1);
  }
  else
  {
    _LSServer_DatabaseExecutionContext();
    v11 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke;
    v12[3] = &unk_1E10417E0;
    v12[4] = self;
    v13 = v6;
    -[LSDBExecutionContext syncRead:](v11, v12);

  }
}

- (unsigned)findAppBundleForExecutableURL:(id)a3 withContext:(LSContext *)a4
{
  id v5;
  FSNode *v6;
  uint64_t v7;
  unsigned int v8;
  int v10;
  unsigned int v11;

  v5 = a3;
  v11 = 0;
  v6 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v5, 0, 0);
  if (v6)
  {
    if (_LSBundleFindWithNode((uint64_t)a4, v6, &v11, 0))
    {
      v10 = 0;
      v7 = _LSPluginFindWithInfo(a4->db, 0, 0, 0, v6, &v10, 0);
      if (v7)
        v11 = *(_DWORD *)(v7 + 224);
    }
  }

  v8 = v11;
  return v8;
}

- (BOOL)hasUninstallEntitlement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_LSDClient XPCConnection](self, "XPCConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LSCheckMIAllowedSPIForXPCConnection(v3, CFSTR("UninstallForLaunchServices")) != 0;

  return v4;
}

- (BOOL)hasEntitlementToClearAllIdentifiersOfType:(int64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  BOOL v7;

  if (a3)
  {
    if (a3 == 1)
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_xpcConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = _LSCheckEntitlementForXPCConnection(v5, CFSTR("com.apple.launchservices.clearadvertisingid"));
LABEL_8:
      v7 = v6 != 0;

      return v7;
    }
    return 0;
  }
  else
  {
    if (!-[_LSDDeviceIdentifierClient hasUninstallEntitlement](self, "hasUninstallEntitlement"))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_xpcConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = _LSCheckEntitlementForXPCConnection(v5, CFSTR("com.apple.launchservices.clearvendorid"));
      goto LABEL_8;
    }
    return 1;
  }
}

- (void)urlContainsDeviceIdentifierForAdvertising:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90___LSDDeviceIdentifierClient_urlContainsDeviceIdentifierForAdvertising_completionHandler___block_invoke;
  v10[3] = &unk_1E1042EF0;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[_LSDDeviceIdentifierClient getIdentifierOfType:completionHandler:](self, "getIdentifierOfType:completionHandler:", 1, v10);

}

- (void)generateIdentifiersWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Generating identifiers for vendor %@", (uint8_t *)&v17, 0xCu);
    }

    +[_LSDeviceIdentifierManager sharedInstance](_LSDeviceIdentifierManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentPersona");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cacheForPersona:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getIdentifierOfType:vendorName:bundleIdentifier:completionHandler:", 0, v5, v7, 0);

    +[_LSDeviceIdentifierManager sharedInstance](_LSDeviceIdentifierManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentPersona");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cacheForPersona:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getIdentifierOfType:vendorName:bundleIdentifier:completionHandler:", 1, v5, v7, 0);

  }
}

- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (-[_LSDDeviceIdentifierClient hasUninstallEntitlement](self, "hasUninstallEntitlement"))
    {
      _LSDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412546;
        v16 = v6;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "Asking to clear identifiers for vendor %@/bundle %@", (uint8_t *)&v15, 0x16u);
      }

      +[_LSDeviceIdentifierManager sharedInstance](_LSDeviceIdentifierManager, "sharedInstance");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentPersona");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject cacheForPersona:](v10, "cacheForPersona:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "clearIdentifiersForUninstallationWithVendorName:bundleIdentifier:", v6, v8);

    }
    else
    {
      _LSDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v14;
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "Unentitled request from XPC connection %@ to clear identifiers for vendor %@/bundle %@", (uint8_t *)&v15, 0x20u);

      }
    }

  }
}

- (void)clearAllIdentifiersOfType:(int64_t)a3
{
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[_LSDDeviceIdentifierClient hasEntitlementToClearAllIdentifiersOfType:](self, "hasEntitlementToClearAllIdentifiersOfType:");
  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v12 = 67109120;
      LODWORD(v13) = a3;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Asking to clear all identifiers of type %i", (uint8_t *)&v12, 8u);
    }

    +[_LSDeviceIdentifierManager sharedInstance](_LSDeviceIdentifierManager, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject cacheForPersona:](v6, "cacheForPersona:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clearAllIdentifiersOfType:", a3);

  }
  else if (v7)
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v11;
    v14 = 1024;
    v15 = a3;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Unentitled request from XPC connection %@ to clear all identifiers of type %i", (uint8_t *)&v12, 0x12u);

  }
}

@end
