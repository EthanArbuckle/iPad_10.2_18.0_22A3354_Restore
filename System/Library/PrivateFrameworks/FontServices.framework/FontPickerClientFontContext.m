@implementation FontPickerClientFontContext

- (FontPickerClientFontContext)initWithEndpoint:(id)a3
{
  id v4;
  FontPickerClientFontContext *v5;
  FontPickerClientFontContext *v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FontPickerClientFontContext;
  v5 = -[FontPickerClientFontContext init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v5->_nestCount = 0;
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
      connection = v6->_connection;
      v6->_connection = (NSXPCConnection *)v7;

      objc_initWeak(&location, v6);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __48__FontPickerClientFontContext_initWithEndpoint___block_invoke;
      v15 = &unk_1E612C4A8;
      objc_copyWeak(&v16, &location);
      -[NSXPCConnection setInvalidationHandler:](v6->_connection, "setInvalidationHandler:", &v12);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB7698, v12, v13, v14, v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v6->_connection, "setRemoteObjectInterface:", v9);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB7B10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v6->_connection, "setExportedInterface:", v10);
      -[NSXPCConnection setExportedObject:](v6->_connection, "setExportedObject:", v6);
      -[NSXPCConnection resume](v6->_connection, "resume");
      v6->_forClientContext = 1;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      v5->_forClientContext = 0;
    }
  }

  return v6;
}

void __48__FontPickerClientFontContext_initWithEndpoint___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSLog(CFSTR("FontPickerClientFontContext connection was invalidated."));
    v1 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

  }
}

+ (id)sharedInstanceForEndpoint:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  FontPickerClientFontContext *v9;

  v3 = a3;
  v4 = v3;
  if (gSharedClientFontContextInstances)
  {
    if (v3)
    {
LABEL_3:
      v5 = v4;
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)gSharedClientFontContextInstances;
    gSharedClientFontContextInstances = v6;

    if (v4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = v5;
  objc_msgSend((id)gSharedClientFontContextInstances, "objectForKey:", v5);
  v9 = (FontPickerClientFontContext *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[FontPickerClientFontContext initWithEndpoint:]([FontPickerClientFontContext alloc], "initWithEndpoint:", v4);
    objc_msgSend((id)gSharedClientFontContextInstances, "setObject:forKey:", v9, v8);
  }

  return v9;
}

+ (void)invalidateSharedInstanceForEndpoint:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = (void *)gSharedClientFontContextInstances;
    v4 = a3;
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");
    objc_msgSend((id)gSharedClientFontContextInstances, "removeObjectForKey:", v4);

  }
}

- (void)checkin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[FontPickerClientFontContext connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_255);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__FontPickerClientFontContext_checkin___block_invoke_2;
  v8[3] = &unk_1E612C430;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "checkin:", v8);

}

void __39__FontPickerClientFontContext_checkin___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("xpc error: %s - %@"), "-[FontPickerClientFontContext checkin:]_block_invoke", a2);
}

uint64_t __39__FontPickerClientFontContext_checkin___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setup
{
  _QWORD v2[5];

  if (!self->_clientEndpoint)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __36__FontPickerClientFontContext_setup__block_invoke;
    v2[3] = &unk_1E612C458;
    v2[4] = self;
    -[FontPickerClientFontContext checkin:](self, "checkin:", v2);
  }
}

void __36__FontPickerClientFontContext_setup__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFAllocator *v13;
  __SecTask *v14;
  __SecTask *v15;
  const __CFArray *v16;
  const __CFArray *v17;
  CFTypeID v18;
  CFIndex Count;
  _BOOL8 v20;
  audit_token_t v21;
  audit_token_t v22;
  CFRange v23;
  CFRange v24;

  v9 = *(void **)(a1 + 32);
  v10 = a3;
  objc_msgSend(v9, "setClientEndpoint:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setHideProfileFonts:", a5);
  memset(&v22, 0, sizeof(v22));
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "auditToken");
  else
    memset(&v22, 0, sizeof(v22));

  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v21 = v22;
  v14 = SecTaskCreateWithAuditToken(v13, &v21);
  if (v14)
  {
    v15 = v14;
    v16 = (const __CFArray *)SecTaskCopyValueForEntitlement(v14, CFSTR("com.apple.developer.user-fonts"), 0);
    if (v16)
    {
      v17 = v16;
      v18 = CFGetTypeID(v16);
      if (v18 == CFArrayGetTypeID())
      {
        Count = CFArrayGetCount(v17);
        v23.location = 0;
        v23.length = Count;
        if (CFArrayContainsValue(v17, v23, CFSTR("font-enumeration")))
        {
          v20 = 1;
        }
        else
        {
          v24.location = 0;
          v24.length = Count;
          v20 = CFArrayContainsValue(v17, v24, CFSTR("app-usage")) != 0;
        }
      }
      else
      {
        v20 = 0;
      }
      CFRelease(v17);
    }
    else
    {
      v20 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setClientHasFontAccessEntitlement:", v20);
  objc_msgSend(*(id *)(a1 + 32), "synchronize:deactivated:includingFontAssets:", v10, 0, a4);

}

- (void)invalidate
{
  NSXPCConnection *connection;
  NSXPCListenerEndpoint *clientEndpoint;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  clientEndpoint = self->_clientEndpoint;
  self->_clientEndpoint = 0;

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSDictionary allKeys](self->_locallyActivatedFontsInfo, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        GSFontReleaseSandboxExtension();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FontPickerClientFontContext;
  -[FontPickerClientFontContext dealloc](&v8, sel_dealloc);
}

- (void)_setupLocallyActivatedFonts
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSDictionary allKeys](self->_locallyActivatedFontsInfo, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = GSFontRegisterURL();
          if ((_DWORD)v9)
            FSLog_Error(CFSTR("FontPickerSupport"), CFSTR("failed to use client's locally activated font (%d) - %@"), v10, v11, v12, v13, v14, v15, v9);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

    _CTClearFontFallbacksCache();
    GSFontPurgeFontCache();
    objc_msgSend(getUIFontClass(), "_evictAllItemsFromFontAndFontDescriptorCaches");
  }

}

- (void)_doneWithLocallyActivatedFonts
{
  NSDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = self->_locallyActivatedFontsInfo;
  v3 = -[NSDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = GSFontUnregisterURL2();
        if ((_DWORD)v8)
          FSLog_Error(CFSTR("FontPickerSupport"), CFSTR("failed to unregister locally activated font (%d) - %@"), v9, v10, v11, v12, v13, v14, v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

- (void)runWithClientFonts:(id)a3
{
  void (**v4)(id, BOOL, BOOL);
  FontPickerClientFontContext *v5;
  int nestCount;
  int v7;
  void (**v8)(id, BOOL, BOOL);

  v4 = (void (**)(id, BOOL, BOOL))a3;
  v8 = v4;
  if (self->_forClientContext)
  {
    v5 = self;
    objc_sync_enter(v5);
    nestCount = v5->_nestCount;
    v5->_nestCount = nestCount + 1;
    if (!nestCount)
    {
      -[FontPickerClientFontContext setup](v5, "setup");
      -[FontPickerClientFontContext _setupLocallyActivatedFonts](v5, "_setupLocallyActivatedFonts");
    }
    v8[2](v8, v5->_clientHasFontAccessEntitlement, v5->_hideProfileFonts);
    v7 = v5->_nestCount - 1;
    v5->_nestCount = v7;
    if (!v7)
      -[FontPickerClientFontContext _doneWithLocallyActivatedFonts](v5, "_doneWithLocallyActivatedFonts");
    objc_sync_exit(v5);

  }
  else
  {
    v4[2](v4, 0, 1);
  }

}

- (BOOL)_isFontFilePathAccepatableForClient:(id)a3 withFontEntitlement:(BOOL)a4 hideProfileFonts:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  const char *v8;
  void *v9;
  BOOL v10;
  const char *v11;

  v5 = a5;
  v7 = a3;
  v9 = v7;
  v10 = (a4
      || (IsPathUserInstalledFontFile(v7, v8) & 1) == 0
      && (IsPathRegisteredFontAssetFontFile(v9) & 1) == 0
      && (IsPathConfigurationProfileFontFile(v9, v11) & 1) == 0)
     && (!v5 || (IsPathConfigurationProfileFontFile(v9, v8) & 1) == 0);

  return v10;
}

- (BOOL)isFontFamilyAcceptableForClient:(id)a3 withFontEntitlement:(BOOL)a4 hideProfileFonts:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)GSFontCopyFontNamesForFontFamilyName();
    if (objc_msgSend(v9, "count"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = (void *)GSFontCopyFontFilePath();
            if (v15
              && -[FontPickerClientFontContext _isFontFilePathAccepatableForClient:withFontEntitlement:hideProfileFonts:](self, "_isFontFilePathAccepatableForClient:withFontEntitlement:hideProfileFonts:", v15, v6, v5, v18))
            {

              v16 = 1;
              goto LABEL_16;
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            continue;
          break;
        }
      }
      v16 = 0;
LABEL_16:

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)fontNamesForFontFamily:(id)a3 withFontEntitlement:(BOOL)a4 hideProfileFonts:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR(".AppleSystemUIFont")))
  {
    objc_msgSend(getUIFontClass(), "fontNamesForFamilyName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v18 = v8;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = (id)GSFontCopyFontNamesForFontFamilyName();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
          v16 = (void *)GSFontCopyFontFilePath();
          if (v16
            && -[FontPickerClientFontContext _isFontFilePathAccepatableForClient:withFontEntitlement:hideProfileFonts:](self, "_isFontFilePathAccepatableForClient:withFontEntitlement:hideProfileFonts:", v16, v6, v5))
          {
            objc_msgSend(v9, "addObject:", v15);
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v8 = v18;
  }

  return v9;
}

- (void)enumerateFontFamilyNamesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__FontPickerClientFontContext_enumerateFontFamilyNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E612C4D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FontPickerClientFontContext runWithClientFonts:](self, "runWithClientFonts:", v6);

}

void __66__FontPickerClientFontContext_enumerateFontFamilyNamesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(getUIFontClass(), "familyNames", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "fontNamesForFontFamily:withFontEntitlement:hideProfileFonts:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), a2, a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)runWithFontNamesForFamilyName:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__FontPickerClientFontContext_runWithFontNamesForFamilyName_usingBlock___block_invoke;
    v8[3] = &unk_1E612C4F8;
    v8[4] = self;
    v9 = v6;
    v10 = v7;
    -[FontPickerClientFontContext runWithClientFonts:](self, "runWithClientFonts:", v8);

  }
}

void __72__FontPickerClientFontContext_runWithFontNamesForFamilyName_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "fontNamesForFontFamily:withFontEntitlement:hideProfileFonts:", *(_QWORD *)(a1 + 40), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)runBlockInClientFontContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke;
  v6[3] = &unk_1E612C548;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FontPickerClientFontContext runWithClientFonts:](self, "runWithClientFonts:", v6);

}

uint64_t __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  _QWORD v5[5];
  char v6;
  char v7;
  _QWORD v8[4];
  uint64_t v9;
  char v10;
  char v11;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke_2;
  v8[3] = &unk_1E612C520;
  v3 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  v11 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke_3;
  v5[3] = &unk_1E612C520;
  v5[4] = v9;
  v6 = a2;
  v7 = a3;
  return (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *))(v3 + 16))(v3, v8, v5);
}

uint64_t __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR(".AppleSystemUIFont")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "isFontFamilyAcceptableForClient:withFontEntitlement:hideProfileFonts:", v3, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));

  return v4;
}

uint64_t __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR(".AppleSystemUIFont")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)GSFontCopyFontFilePath();
    if (v5)
      v4 = objc_msgSend(*(id *)(a1 + 32), "_isFontFilePathAccepatableForClient:withFontEntitlement:hideProfileFonts:", v5, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
    else
      v4 = 0;

  }
  return v4;
}

- (void)fontSelected:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_forClientContext)
  {
    v6 = v4;
    FSFontPickerSupportFontSelected(v4);
    goto LABEL_5;
  }
  if (self->_clientEndpoint)
  {
    v6 = v4;
    +[FontServicesDaemonManager sharedManager](FontServicesDaemonManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestFonts:forClient:", v6, self->_clientEndpoint);

LABEL_5:
    v4 = v6;
  }

}

- (void)synchronize:(id)a3 deactivated:(id)a4 includingFontAssets:(BOOL)a5
{
  id v7;
  id v8;
  FontPickerClientFontContext *v9;
  NSDictionary *locallyActivatedFontsInfo;
  uint64_t v11;
  NSDictionary *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (objc_msgSend(v8, "count") || objc_msgSend(v7, "count"))
  {
    locallyActivatedFontsInfo = v9->_locallyActivatedFontsInfo;
    if (locallyActivatedFontsInfo)
      v11 = -[NSDictionary mutableCopy](locallyActivatedFontsInfo, "mutableCopy");
    else
      v11 = objc_opt_new();
    v12 = (NSDictionary *)v11;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v13);
          -[NSDictionary removeObjectForKey:](v12, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16), (_QWORD)v18);
          GSFontReleaseSandboxExtension();
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_263);
    -[NSDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", v7);
    v17 = v9->_locallyActivatedFontsInfo;
    v9->_locallyActivatedFontsInfo = v12;

  }
  objc_sync_exit(v9);

}

void __75__FontPickerClientFontContext_synchronize_deactivated_includingFontAssets___block_invoke()
{
  JUMPOUT(0x1B5E09640);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSXPCListenerEndpoint)clientEndpoint
{
  return self->_clientEndpoint;
}

- (void)setClientEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_clientEndpoint, a3);
}

- (NSDictionary)locallyActivatedFontsInfo
{
  return self->_locallyActivatedFontsInfo;
}

- (void)setLocallyActivatedFontsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_locallyActivatedFontsInfo, a3);
}

- (BOOL)clientHasFontAccessEntitlement
{
  return self->_clientHasFontAccessEntitlement;
}

- (void)setClientHasFontAccessEntitlement:(BOOL)a3
{
  self->_clientHasFontAccessEntitlement = a3;
}

- (BOOL)hideProfileFonts
{
  return self->_hideProfileFonts;
}

- (void)setHideProfileFonts:(BOOL)a3
{
  self->_hideProfileFonts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locallyActivatedFontsInfo, 0);
  objc_storeStrong((id *)&self->_clientEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
