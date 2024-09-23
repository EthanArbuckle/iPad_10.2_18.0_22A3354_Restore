@implementation CFPDObserverOnlyTombstone

- (BOOL)isEqual:(id)a3
{
  __CFString *domain;
  __CFString *v6;
  int v7;
  __CFString *userOrContainer;
  __CFString *v9;

  if (!a3)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  if (self == a3)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_shmemIndex != *((unsigned __int16 *)a3 + 18))
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  domain = self->_domain;
  v6 = (__CFString *)*((_QWORD *)a3 + 1);
  if (domain == v6 || (LOBYTE(v7) = 0, domain) && v6 && (v7 = CFEqual(self->_domain, v6)) != 0)
  {
    userOrContainer = self->_userOrContainer;
    v9 = (__CFString *)*((_QWORD *)a3 + 2);
    if (userOrContainer != v9)
    {
      LOBYTE(v7) = 0;
      if (userOrContainer && v9)
        LOBYTE(v7) = CFEqual(self->_userOrContainer, v9) != 0;
      return v7;
    }
LABEL_15:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)dealloc
{
  __CFString *domain;
  __CFString *userOrContainer;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  domain = self->_domain;
  if (domain)
    CFRelease(domain);
  userOrContainer = self->_userOrContainer;
  if (userOrContainer)
    CFRelease(userOrContainer);
  -[CFPDObserverOnlyTombstone _operateOnObservingConnectionsAsMultiple:asSingle:]((uint64_t)self, (uint64_t)&__block_literal_global_260, (uint64_t)&__block_literal_global_262);
  v5.receiver = self;
  v5.super_class = (Class)CFPDObserverOnlyTombstone;
  -[CFPDObserverOnlyTombstone dealloc](&v5, sel_dealloc);
}

- (void)_operateOnObservingConnectionsAsMultiple:(uint64_t)a3 asSingle:
{
  os_unfair_lock_s *v6;
  const void *v7;
  CFSetRef *v8;
  const void *v9;
  CFTypeID v10;
  CFIndex Count;
  CFSetRef v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    v9 = *(const void **)(a1 + 24);
    v8 = (CFSetRef *)(a1 + 24);
    v7 = v9;
    if (v9)
    {
      v10 = CFGetTypeID(v7);
      if (v10 == CFSetGetTypeID())
      {
        (*(void (**)(uint64_t, CFSetRef))(a2 + 16))(a2, *v8);
        Count = CFSetGetCount(*v8);
        if (Count)
        {
          if (Count == 1)
          {
            v14 = 0;
            v15 = &v14;
            v16 = 0x3052000000;
            v17 = __Block_byref_object_copy__4;
            v18 = __Block_byref_object_dispose__4;
            v19 = 0;
            v12 = *v8;
            v13[0] = MEMORY[0x1E0C809B0];
            v13[1] = 3221225472;
            v13[2] = __79__CFPDObserverOnlyTombstone__operateOnObservingConnectionsAsMultiple_asSingle___block_invoke;
            v13[3] = &unk_1E12E0FA0;
            v13[4] = &v14;
            CFSetApply(v12, (uint64_t)v13);
            CFRelease(*v8);
            *v8 = (CFSetRef)v15[5];
            _Block_object_dispose(&v14, 8);
          }
        }
        else
        {
          CFRelease(*v8);
          *v8 = 0;
        }
      }
      else if (*v8)
      {
        (*(void (**)(uint64_t, CFSetRef *))(a3 + 16))(a3, v8);
      }
    }
    os_unfair_lock_unlock(v6);
  }
}

void __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_3(uint64_t a1, xpc_object_t *a2)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(*a2);
  *a2 = 0;
}

void __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_2(uint64_t a1, void *a2)
{
  CFSetApply(a2, *(_QWORD *)(a1 + 32));
  CFSetRemoveAllValues((CFMutableSetRef)a2);
}

void __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_2(uint64_t a1, CFMutableSetRef theSet)
{
  CFSetRemoveValue(theSet, *(const void **)(a1 + 32));
}

xpc_object_t __79__CFPDObserverOnlyTombstone__operateOnObservingConnectionsAsMultiple_asSingle___block_invoke(uint64_t a1, xpc_object_t object, _BYTE *a3)
{
  xpc_object_t result;

  result = xpc_retain(object);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a3 = 1;
  return result;
}

- (id)initMatchingSource:(id)a3
{
  CFPDObserverOnlyTombstone *v4;
  const void *v5;
  const void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CFPDObserverOnlyTombstone;
  v4 = -[CFPDObserverOnlyTombstone init](&v8, sel_init);
  if (v4)
  {
    v5 = (const void *)objc_msgSend(a3, "domain");
    if (v5)
      v4->_domain = (__CFString *)CFRetain(v5);
    v6 = (const void *)objc_msgSend(a3, "container");
    if (v6 || (v6 = (const void *)objc_msgSend(a3, "user")) != 0)
      v4->_userOrContainer = (__CFString *)CFRetain(v6);
    v4->_shmemIndex = objc_msgSend(a3, "shmemIndex");
    v4->_lock._os_unfair_lock_opaque = 0;
    *((_BYTE *)v4 + 38) = *((_BYTE *)v4 + 38) & 0xFE | objc_msgSend(a3, "managed");
  }
  return v4;
}

- (unint64_t)hash
{
  __CFString *domain;
  CFHashCode v4;
  CFHashCode userOrContainer;

  domain = self->_domain;
  if (domain)
    v4 = CFHash(domain);
  else
    v4 = 0;
  userOrContainer = (CFHashCode)self->_userOrContainer;
  if (userOrContainer)
    userOrContainer = CFHash((CFTypeRef)userOrContainer);
  return userOrContainer ^ v4 ^ self->_shmemIndex;
}

void __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke(uint64_t a1, void *a2)
{
  __CFSet *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(a1 + 32);
  objc_opt_self();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke;
  v6[3] = &unk_1E1336618;
  v7 = v5;
  if (withClientContext((_xpc_connection_s *)a2, (uint64_t)v6))
  {
    v4 = *(__CFSet **)(*(_QWORD *)(a1 + 40) + 72);
    if (!v4)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
      v4 = *(__CFSet **)(*(_QWORD *)(a1 + 40) + 72);
    }
    CFSetAddValue(v4, a2);
  }
}

void __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke(uint64_t a1, void *a2)
{
  __CFSet *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(a1 + 32);
  objc_opt_self();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke;
  v6[3] = &unk_1E1336618;
  v7 = v5;
  if (withClientContext((_xpc_connection_s *)a2, (uint64_t)v6))
  {
    v4 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if (v4)
        __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke_cold_1();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
      CFSetAddValue(*(CFMutableSetRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = 0;
      v4 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    else if (!v4)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = xpc_retain(a2);
      return;
    }
    CFSetAddValue(v4, a2);
  }
}

+ (BOOL)replaceObserved:(uint64_t)a3 withObserved:(_xpc_connection_s *)a4 forConnection:
{
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke;
  v8[3] = &unk_1E1336618;
  v8[4] = a2;
  v8[5] = a3;
  return withClientContext(a4, (uint64_t)v8);
}

void __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  __CFSet *v3;
  const void *v5;

  v3 = *(__CFSet **)(a2 + 24);
  if (v3)
  {
    v5 = *(const void **)(a1 + 32);
    if (v5 != *(const void **)(a1 + 40))
    {
      CFSetRemoveValue(v3, v5);
      CFSetAddValue(*(CFMutableSetRef *)(a2 + 24), *(const void **)(a1 + 40));
    }
  }
}

- (void)alreadyLocked_transferObservingConnectionsFromSource:(id)a3
{
  void *v5;
  OS_xpc_object *v6;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner((const os_unfair_lock *)a3 + 25);
  v5 = (void *)*((_QWORD *)a3 + 9);
  if (v5)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    v17 = 0;
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke;
    v7[3] = &unk_1E1336480;
    v7[4] = a3;
    v7[5] = self;
    v7[6] = &v12;
    v7[7] = &v8;
    CFSetApply(v5, (uint64_t)v7);
    v6 = (OS_xpc_object *)v13[5];
    if (!v6)
      v6 = (OS_xpc_object *)v9[3];
    self->_observers._single = v6;
    CFRelease(v5);
    *((_QWORD *)a3 + 9) = 0;
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(&v12, 8);
  }
}

- (void)transferObservingConnectionsToSource:(id)a3
{
  os_unfair_lock_s *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v5 = (os_unfair_lock_s *)((char *)a3 + 108);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 27);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 25);
  if (*((_QWORD *)a3 + 9))
    -[CFPDObserverOnlyTombstone transferObservingConnectionsToSource:].cold.1();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke;
  v8[3] = &unk_1E13365A0;
  v8[4] = self;
  v8[5] = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_2;
  v7[3] = &unk_1E13365C8;
  v7[4] = v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_3;
  v6[3] = &unk_1E13365F0;
  v6[4] = v8;
  -[CFPDObserverOnlyTombstone _operateOnObservingConnectionsAsMultiple:asSingle:]((uint64_t)self, (uint64_t)v7, (uint64_t)v6);
  os_unfair_lock_unlock((os_unfair_lock_t)a3 + 25);
  os_unfair_lock_unlock(v5);
}

- (void)removeObservingConnection:(id)a3 daemon:(id)a4
{
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke;
  v5[3] = &unk_1E1336578;
  v5[4] = self;
  v5[5] = a3;
  os_unfair_lock_lock((os_unfair_lock_t)a4 + 12);
  __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke((uint64_t)v5, *((__CFSet **)a4 + 4));
  os_unfair_lock_unlock((os_unfair_lock_t)a4 + 12);
}

void __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke(uint64_t a1, __CFSet *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[6];
  _QWORD v7[4];
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_2;
  v7[3] = &unk_1E1336528;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_3;
  v6[3] = &unk_1E1336550;
  v6[4] = v8;
  v6[5] = &v9;
  -[CFPDObserverOnlyTombstone _operateOnObservingConnectionsAsMultiple:asSingle:](v4, (uint64_t)v7, (uint64_t)v6);
  if (*((_BYTE *)v10 + 24))
  {
    v5 = *(id *)(a1 + 32);
    CFSetRemoveValue(a2, *(const void **)(a1 + 32));
  }
  _Block_object_dispose(&v9, 8);
}

void __36__CFPDObserverOnlyTombstone_dealloc__block_invoke(int a1, CFTypeRef cf)
{
  CFRelease(cf);
}

void __36__CFPDObserverOnlyTombstone_dealloc__block_invoke_2(uint64_t a1, xpc_object_t *a2)
{
  xpc_release(*a2);
}

void __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_3(uint64_t a1, xpc_object_t *a2)
{
  if (*a2 == *(xpc_object_t *)(a1 + 32))
  {
    xpc_release(*a2);
    *a2 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)description
{
  NSMutableString *v3;
  const __CFString *v4;

  v3 = +[NSMutableString stringWithFormat:](&off_1EDCDD768, "stringWithFormat:", CFSTR("Tombstone for CFPDSource (domain: %@, "), self->_domain);
  if (CFStringHasPrefix(self->_userOrContainer, CFSTR("/")))
    v4 = CFSTR("container: %@, ");
  else
    v4 = CFSTR("user: %@, ");
  -[NSMutableString appendFormat:](v3, "appendFormat:", v4, self->_userOrContainer);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("shmemIndex: %d)"), self->_shmemIndex);
  return v3;
}

- (BOOL)managed
{
  return *((_BYTE *)self + 38) & 1;
}

- (void)_sendNotificationToConnection:(uint64_t)a1
{
  char v4;
  xpc_object_t v5;
  _QWORD handler[6];
  id v7;
  xpc_object_t values;
  char *keys;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    v4 = *(_BYTE *)(a1 + 38);
    if ((v4 & 2) != 0)
    {
      *(_BYTE *)(a1 + 38) = v4 | 4;
    }
    else
    {
      *(_BYTE *)(a1 + 38) = v4 & 0xF9 | 2;
      objc_initWeak(location, (id)a1);
      keys = "CFPreferencesDomain";
      values = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(a1 + 8));
      v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __59__CFPDObserverOnlyTombstone__sendNotificationToConnection___block_invoke;
      handler[3] = &unk_1E1336640;
      objc_copyWeak(&v7, location);
      handler[4] = a1;
      handler[5] = a2;
      xpc_connection_send_message_with_reply(a2, v5, 0, handler);
      xpc_release(values);
      xpc_release(v5);
      objc_destroyWeak(&v7);
      objc_destroyWeak(location);
    }
  }
}

void __59__CFPDObserverOnlyTombstone__sendNotificationToConnection___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = WeakRetained + 8;
    os_unfair_lock_lock(WeakRetained + 8);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 38) &= ~2u;
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 38) & 4) != 0)
      -[CFPDObserverOnlyTombstone _sendNotificationToConnection:]();
    os_unfair_lock_unlock(v3);

  }
}

- (void)notifyObservers
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 38) & 1;
  v4 = 138543618;
  v5 = v2;
  v6 = 1024;
  v7 = v3;
  _os_log_debug_impl(&dword_182A8C000, a2, OS_LOG_TYPE_DEBUG, "Notifying observers of { %{public}@, managed: %d }", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_1_21();
}

void __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  -[CFPDObserverOnlyTombstone _sendNotificationToConnection:](*(_QWORD *)(a1 + 32), a2);
}

uint64_t __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_3;
  v3[3] = &unk_1E1336690;
  v3[4] = *(_QWORD *)(a1 + 32);
  return CFSetApply(a2, (uint64_t)v3);
}

uint64_t __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke_cold_1()
{
  __assert_rtn("-[CFPDObserverOnlyTombstone alreadyLocked_transferObservingConnectionsFromSource:]_block_invoke", "CFPDSource.m", 3081, "!multipleObservers");
}

- (void)transferObservingConnectionsToSource:.cold.1()
{
  __assert_rtn("-[CFPDObserverOnlyTombstone transferObservingConnectionsToSource:]", "CFPDSource.m", 3180, "source->_observingConnections == NULL");
}

@end
