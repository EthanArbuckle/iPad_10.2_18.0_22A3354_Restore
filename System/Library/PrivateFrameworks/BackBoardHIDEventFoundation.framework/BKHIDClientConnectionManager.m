@implementation BKHIDClientConnectionManager

- (__IOHIDEventSystemConnection)copyClientForDestination:(id)a3
{
  void *v3;
  __IOHIDEventSystemConnection *v4;

  -[BKHIDClientConnectionManager clientForDestination:](self, "clientForDestination:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__IOHIDEventSystemConnection *)objc_msgSend(v3, "connection");

  if (v4)
    CFRetain(v4);
  return v4;
}

- (__IOHIDEventSystemConnection)copyClientForTaskPort:(unsigned int)a3
{
  void *v3;
  __IOHIDEventSystemConnection *v4;

  -[BKHIDClientConnectionManager clientForTaskPort:](self, "clientForTaskPort:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__IOHIDEventSystemConnection *)objc_msgSend(v3, "connection");

  if (v4)
    CFRetain(v4);
  return v4;
}

- (id)clientForTaskPort:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[BSMutableIntegerMap objectForKey:](self->_taskPortToClientConnectionMapping, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)clientForDestination:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  NSMutableDictionary *versionedPIDToClientConnectionMapping;
  void *v8;
  void *v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_msgSend(v4, "versionedPID");
  if (v6 == -1)
  {
    -[BSMutableIntegerMap objectForKey:](self->_pidToClientConnectionMapping, "objectForKey:", (int)objc_msgSend(v4, "pid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    versionedPIDToClientConnectionMapping = self->_versionedPIDToClientConnectionMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](versionedPIDToClientConnectionMapping, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BKHIDClientConnectionManager)initWithHIDEventSystem:(__IOHIDEventSystem *)a3
{
  BKHIDClientConnectionManager *v4;
  BKHIDClientConnectionManager *v5;
  BSMutableIntegerMap *v6;
  BSMutableIntegerMap *taskPortToClientConnectionMapping;
  BSMutableIntegerMap *v8;
  BSMutableIntegerMap *pidToClientConnectionMapping;
  NSMutableDictionary *v10;
  NSMutableDictionary *versionedPIDToClientConnectionMapping;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  CFIndex i;
  void *ValueAtIndex;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BKHIDClientConnectionManager;
  v4 = -[BKHIDClientConnectionManager init](&v20, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    if (a3)
    {
      v4->_hidEventSystem = a3;
      CFRetain(a3);
    }
    v6 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    taskPortToClientConnectionMapping = v5->_taskPortToClientConnectionMapping;
    v5->_taskPortToClientConnectionMapping = v6;

    v8 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    pidToClientConnectionMapping = v5->_pidToClientConnectionMapping;
    v5->_pidToClientConnectionMapping = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    versionedPIDToClientConnectionMapping = v5->_versionedPIDToClientConnectionMapping;
    v5->_versionedPIDToClientConnectionMapping = v10;

    v5->_hidConnectionToBKConnection = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v5->_hidEventSystem)
    {
      IOHIDEventSystemRegisterConnectionAdditionCallback();
      IOHIDEventSystemRegisterConnectionRemovalCallback();
      v12 = (const __CFArray *)IOHIDEventSystemCopyConnections();
      if (v12)
      {
        v13 = v12;
        Count = CFArrayGetCount(v12);
        if (Count >= 1)
        {
          v15 = Count;
          for (i = 0; i != v15; ++i)
          {
            ValueAtIndex = (void *)CFArrayGetValueAtIndex(v13, i);
            BKHIDClientConnectionAdditionCallback((uint64_t)v5, v18, ValueAtIndex);
          }
        }
        CFRelease(v13);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  __IOHIDEventSystem *hidEventSystem;
  __CFDictionary *hidConnectionToBKConnection;
  objc_super v5;

  IOHIDEventSystemUnregisterConnectionAdditionCallback();
  IOHIDEventSystemUnregisterConnectionRemovalCallback();
  hidEventSystem = self->_hidEventSystem;
  if (hidEventSystem)
  {
    CFRelease(hidEventSystem);
    self->_hidEventSystem = 0;
  }
  hidConnectionToBKConnection = self->_hidConnectionToBKConnection;
  if (hidConnectionToBKConnection)
    CFRelease(hidConnectionToBKConnection);
  v5.receiver = self;
  v5.super_class = (Class)BKHIDClientConnectionManager;
  -[BKHIDClientConnectionManager dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_taskPortToClientConnectionMapping, CFSTR("TaskPort->ClientConnection"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_pidToClientConnectionMapping, CFSTR("pid->ClientConnection"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_versionedPIDToClientConnectionMapping, CFSTR("vpid->ClientConnection"));
  v7 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_hidConnectionToBKConnection, CFSTR("HIDConnection->BKConnection"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int)pidForBundleID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  BSMutableIntegerMap *pidToClientConnectionMapping;
  int v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  if (objc_msgSend(v4, "length"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    pidToClientConnectionMapping = self->_pidToClientConnectionMapping;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__BKHIDClientConnectionManager_pidForBundleID___block_invoke;
    v9[3] = &unk_1E81F7048;
    v10 = v4;
    v11 = &v12;
    -[BSMutableIntegerMap enumerateWithBlock:](pidToClientConnectionMapping, "enumerateWithBlock:", v9);
    os_unfair_lock_unlock(p_lock);

  }
  v7 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)bundleIDForPID:(int)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  if (a3 < 1)
  {
    v7 = 0;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(p_lock);
    -[BSMutableIntegerMap objectForKey:](self->_pidToClientConnectionMapping, "objectForKey:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);

  }
  return v7;
}

- (int64_t)versionedPIDForPID:(int)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  int64_t v7;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[BSMutableIntegerMap objectForKey:](self->_pidToClientConnectionMapping, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "versionedPID");
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)addRemovalObserverForConnectionWithVersionedPID:(int64_t)a3 observerBlock:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  NSMutableDictionary *versionedPIDToClientConnectionMapping;
  void *v9;
  void *v10;
  void *v11;

  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  versionedPIDToClientConnectionMapping = self->_versionedPIDToClientConnectionMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](versionedPIDToClientConnectionMapping, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addDisconnectionObserverBlock:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionedPIDToClientConnectionMapping, 0);
  objc_storeStrong((id *)&self->_pidToClientConnectionMapping, 0);
  objc_storeStrong((id *)&self->_taskPortToClientConnectionMapping, 0);
}

void __47__BKHIDClientConnectionManager_pidForBundleID___block_invoke(uint64_t a1, int a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(a3, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

  if ((_DWORD)v7)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

@end
