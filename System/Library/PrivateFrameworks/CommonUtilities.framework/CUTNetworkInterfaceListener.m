@implementation CUTNetworkInterfaceListener

+ (id)sharedInstance
{
  if (qword_1ECD8FDC8 != -1)
    dispatch_once(&qword_1ECD8FDC8, &unk_1E448FF18);
  return (id)qword_1EE5CD6B0;
}

- (CUTNetworkInterfaceListener)init
{
  id v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  SCDynamicStoreRef v6;
  const __CFArray *v7;
  const __SCDynamicStore *v8;
  NSObject *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  SCDynamicStoreContext context;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CUTNetworkInterfaceListener;
  v2 = -[CUTNetworkInterfaceListener init](&v29, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1A1B01454]();
    *((_QWORD *)v2 + 4) = -1;
    v4 = dispatch_queue_create("com.apple.cut.delegate", 0);
    v5 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v4;

    context.version = 0;
    context.info = v2;
    context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
    context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
    context.copyDescription = 0;
    v6 = SCDynamicStoreCreate(0, CFSTR("com.apple.cutnetworkinterfacelistener"), (SCDynamicStoreCallBack)sub_1A0BC7DFC, &context);
    *((_QWORD *)v2 + 1) = v6;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("State:/Network/Interface/[^/]+/IPv4"), CFSTR("State:/Network/Interface/[^/]+/IPv6"), 0);
      v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      if (SCDynamicStoreSetNotificationKeys(*((SCDynamicStoreRef *)v2 + 1), 0, v7))
      {
        v8 = (const __SCDynamicStore *)*((_QWORD *)v2 + 1);
        dispatch_get_global_queue(0, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        SCDynamicStoreSetDispatchQueue(v8, v9);

      }
      else
      {
        v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
        if (v18)
          sub_1A0BD1EE0(v18, v19, v20, v21, v22, v23, v24, v25);
        CFRelease(*((CFTypeRef *)v2 + 1));
        *((_QWORD *)v2 + 1) = 0;
      }

    }
    else
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        sub_1A0BD1EA8(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    objc_autoreleasePoolPop(v3);
    v26 = v2;
  }

  return (CUTNetworkInterfaceListener *)v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_dynamicStore);
  v3.receiver = self;
  v3.super_class = (Class)CUTNetworkInterfaceListener;
  -[CUTNetworkInterfaceListener dealloc](&v3, sel_dealloc);
}

- (CUTNetworkInterfaceListener)allocWithZone:(_NSZone *)a3
{
  return (CUTNetworkInterfaceListener *)(id)qword_1EE5CD6B0;
}

- (void)_handleNetworkChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  CFPropertyListRef v13;
  void *v14;
  CFTypeID TypeID;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v19 = v5;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(__CFString **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v9 = -[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("State:/Network/Interface/en"), v19);
        v10 = -[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("State:/Network/Interface/pdp_ip"));
        v11 = v10;
        if ((v9 & 1) != 0 || v10)
        {
          v12 = -[__CFString hasSuffix:](v8, "hasSuffix:", CFSTR("/IPv6"));
          v13 = SCDynamicStoreCopyValue((SCDynamicStoreRef)self->_dynamicStore, v8);
          if (v13)
          {
            v14 = (void *)v13;
            TypeID = CFDictionaryGetTypeID();
            if (TypeID == CFGetTypeID(v14))
            {
              objc_msgSend(v14, "objectForKey:", CFSTR("Addresses"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v16);
              -[CUTNetworkInterfaceListener _notifyDelegatesOfAddressChange:isIPv6:](self, "_notifyDelegatesOfAddressChange:isIPv6:", v17, v12);

            }
            CFRelease(v14);
            v18 = 1;
            v5 = v19;
            if (v11)
            {
LABEL_12:
              -[CUTNetworkInterfaceListener _notifyDelegatesOfCellChange:](self, "_notifyDelegatesOfCellChange:", v18);
              goto LABEL_16;
            }
          }
          else
          {
            v18 = 0;
            if (v11)
              goto LABEL_12;
          }
          if (v9)
            -[CUTNetworkInterfaceListener _notifyDelegatesOfWifiChange:](self, "_notifyDelegatesOfWifiChange:", v18);
        }
LABEL_16:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

}

- (void)_notifyDelegatesOfWifiChange:(int)a3
{
  NSObject *delegateQueue;
  _QWORD v4[5];
  int v5;

  delegateQueue = self->_delegateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A0BC80B4;
  v4[3] = &unk_1E4490190;
  v4[4] = self;
  v5 = a3;
  dispatch_async(delegateQueue, v4);
}

- (void)_notifyDelegatesOfCellChange:(int)a3
{
  NSObject *delegateQueue;
  _QWORD v4[5];
  int v5;

  delegateQueue = self->_delegateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A0BC8248;
  v4[3] = &unk_1E4490190;
  v4[4] = self;
  v5 = a3;
  dispatch_async(delegateQueue, v4);
}

- (void)_notifyDelegatesOfAddressChange:(id)a3 isIPv6:(BOOL)a4
{
  id v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A0BC840C;
  block[3] = &unk_1E44901B8;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(delegateQueue, block);

}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A0BC8600;
  v7[3] = &unk_1E44901E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, v7);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A0BC86EC;
  v7[3] = &unk_1E44901E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, v7);

}

- (int)wifiState
{
  return self->_wifiState;
}

- (int)cellState
{
  return self->_cellState;
}

- (NSSet)IPv6Addresses
{
  return self->_IPv6Addresses;
}

- (NSSet)IPv4Addresses
{
  return self->_IPv4Addresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IPv4Addresses, 0);
  objc_storeStrong((id *)&self->_IPv6Addresses, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegateMap, 0);
}

@end
