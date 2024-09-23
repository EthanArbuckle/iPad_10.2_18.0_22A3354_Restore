@implementation FontPickerSupporter

- (FontPickerSupporter)initWithEndpoint:(id)a3
{
  id v4;
  FontPickerSupporter *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  FontPickerSupporter *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  FontPickerSupporter *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FontPickerSupporter;
  v5 = -[FontPickerSupporter init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__FontPickerSupporter_initWithEndpoint___block_invoke;
    v12[3] = &unk_1E612C2A0;
    v8 = v5;
    v13 = v8;
    -[NSXPCConnection setInvalidationHandler:](v5->_connection, "setInvalidationHandler:", v12);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB7698);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v9);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB7B10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5->_connection, "setExportedInterface:", v10);
    -[NSXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v8);
    -[NSXPCConnection resume](v5->_connection, "resume");

  }
  return v5;
}

void __40__FontPickerSupporter_initWithEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  NSLog(CFSTR("FontPickerSupport connection was invalidated."));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (BOOL)clientHasFontAccessEntitlement:(id *)a3
{
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  const __CFArray *v8;
  const __CFArray *v9;
  CFTypeID v10;
  CFIndex Count;
  int v12;
  __CFString *v13;
  const char *v14;
  int v15;
  audit_token_t v17;
  CFRange v18;
  CFRange v19;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v17.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v17.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &v17);
  if (v6)
  {
    v7 = v6;
    v8 = (const __CFArray *)SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.developer.user-fonts"), 0);
    if (v8)
    {
      v9 = v8;
      v10 = CFGetTypeID(v8);
      if (v10 == CFArrayGetTypeID())
      {
        Count = CFArrayGetCount(v9);
        v18.location = 0;
        v18.length = Count;
        if (CFArrayContainsValue(v9, v18, CFSTR("font-enumeration")))
        {
          v12 = 1;
          goto LABEL_9;
        }
        v19.location = 0;
        v19.length = Count;
        v15 = CFArrayContainsValue(v9, v19, CFSTR("app-usage"));
        CFRelease(v9);
        if (v15)
        {
          v12 = 1;
          goto LABEL_13;
        }
      }
      else
      {
        CFRelease(v9);
      }
    }
    v13 = (__CFString *)SecTaskCopySigningIdentifier(v7, 0);
    if (!v13)
    {
      v12 = 0;
      goto LABEL_13;
    }
    v9 = (const __CFArray *)v13;
    v12 = IsApplicationIdentifierGrantedFontEnumeration(v13, v14);
LABEL_9:
    CFRelease(v9);
LABEL_13:
    CFRelease(v7);
    LOBYTE(v6) = v12 != 0;
  }
  self->_clientHasFontAccessEntitlement = (char)v6;
  return (char)v6;
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
  -[FontPickerSupporter connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__FontPickerSupporter_checkin___block_invoke_2;
  v8[3] = &unk_1E612C430;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "checkin:", v8);

}

void __31__FontPickerSupporter_checkin___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("xpc error: %s - %@"), "-[FontPickerSupporter checkin:]_block_invoke", a2);
}

uint64_t __31__FontPickerSupporter_checkin___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setup
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __28__FontPickerSupporter_setup__block_invoke;
  v2[3] = &unk_1E612C458;
  v2[4] = self;
  -[FontPickerSupporter checkin:](self, "checkin:", v2);
}

void __28__FontPickerSupporter_setup__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  v7 = a2;
  v8 = a3;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "auditToken");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }

  v11 = *(void **)(a1 + 32);
  v12[0] = v13;
  v12[1] = v14;
  if (objc_msgSend(v11, "clientHasFontAccessEntitlement:", v12))
  {
    objc_msgSend(*(id *)(a1 + 32), "setClientEndpoint:", v7);
    GSFontSetupForFontPicker();
  }
  objc_msgSend(*(id *)(a1 + 32), "synchronize:deactivated:includingFontAssets:", v8, 0, a4);

}

- (void)done
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *activatedFontFilePaths;
  NSXPCConnection *connection;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_activatedFontFilePaths;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (GSFontUnregisterURL())
          NSLog(CFSTR("failed to unregister locally activated font - %@"), v8);

      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v10 = (NSMutableSet *)objc_opt_new();
  activatedFontFilePaths = self->_activatedFontFilePaths;
  self->_activatedFontFilePaths = v10;

  GSFontDoneForFontPicker();
  CTFontManagerInstalledFontsChanged();
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)synchronize:(id)a3 deactivated:(id)a4 includingFontAssets:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v7 = a4;
  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_sync_enter(obj);
  if (v5)
    MEMORY[0x1B5E09718](v8);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  v11 = 0;
  if (v10)
  {
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (GSFontUnregisterURL())
        {
          NSLog(CFSTR("failed to unregister locally activated font - %@"), v14);
        }
        else
        {
          -[NSMutableSet removeObject:](self->_activatedFontFilePaths, "removeObject:", v14);
          v11 = 1;
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_opt_new();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __67__FontPickerSupporter_synchronize_deactivated_includingFontAssets___block_invoke;
  v32[3] = &unk_1E612C480;
  v17 = v16;
  v33 = v17;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = GSFontRegisterURL();
        if ((_DWORD)v24)
          NSLog(CFSTR("failed to use client's locally activated font (%d) - %@"), v24, v22);
        else
          v11 = 1;

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v19);
  }

  if ((v11 & 1) != 0)
    CTFontManagerInstalledFontsChanged();
  -[NSMutableSet addObjectsFromArray:](self->_activatedFontFilePaths, "addObjectsFromArray:", v18);

  objc_sync_exit(obj);
}

void __67__FontPickerSupporter_synchronize_deactivated_includingFontAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  MEMORY[0x1B5E09640]();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

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

- (NSMutableSet)activatedFontFilePaths
{
  return self->_activatedFontFilePaths;
}

- (void)setActivatedFontFilePaths:(id)a3
{
  objc_storeStrong((id *)&self->_activatedFontFilePaths, a3);
}

- (BOOL)clientHasFontAccessEntitlement
{
  return self->_clientHasFontAccessEntitlement;
}

- (void)setClientHasFontAccessEntitlement:(BOOL)a3
{
  self->_clientHasFontAccessEntitlement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedFontFilePaths, 0);
  objc_storeStrong((id *)&self->_clientEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
