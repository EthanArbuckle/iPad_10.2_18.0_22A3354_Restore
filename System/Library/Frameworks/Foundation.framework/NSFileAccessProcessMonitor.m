@implementation NSFileAccessProcessMonitor

- (void)addProcessManager:(id)a3 forPID:(int)a4
{
  uint64_t v7;
  NSHashTable *v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = -[objc_class identifierWithPid:](objc_lookUpClass("RBSProcessIdentifier"), "identifierWithPid:", *(_QWORD *)&a4);
  os_unfair_lock_lock(&self->_lock);
  v8 = (NSHashTable *)-[NSMutableDictionary objectForKey:](self->_pidToProcessManagers, "objectForKey:", v7);
  if (!v8)
  {
    v8 = +[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable");
    -[NSMutableDictionary setObject:forKey:](self->_pidToProcessManagers, "setObject:forKey:", v8, v7);
  }
  if (-[NSHashTable containsObject:](v8, "containsObject:", a3))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v9 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10[0] = 67109120;
      v10[1] = a4;
      _os_log_debug_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEBUG, "Creating process monitor for pid %d", (uint8_t *)v10, 8u);
    }
    -[NSHashTable addObject:](v8, "addObject:", a3);
    os_unfair_lock_unlock(&self->_lock);
    -[NSFileAccessProcessMonitor updateMonitorPredicate](self, "updateMonitorPredicate");
  }
}

- (void)updateMonitorPredicate
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  RBSProcessMonitor *monitor;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[objc_class predicateMatchingIdentifiers:](objc_lookUpClass("RBSProcessPredicate"), "predicateMatchingIdentifiers:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[NSMutableDictionary allKeys](self->_pidToProcessManagers, "allKeys")));
  monitor = self->_monitor;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__NSFileAccessProcessMonitor_updateMonitorPredicate__block_invoke;
  v6[3] = &unk_1E0F524C8;
  v6[4] = v4;
  -[RBSProcessMonitor updateConfiguration:](monitor, "updateConfiguration:", v6);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeProcessManager:(id)a3 forPID:(int)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = -[objc_class identifierWithPid:](objc_lookUpClass("RBSProcessIdentifier"), "identifierWithPid:", *(_QWORD *)&a4);
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)-[NSMutableDictionary objectForKey:](self->_pidToProcessManagers, "objectForKey:", v7);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "containsObject:", a3);
    if (v10)
    {
      v11 = _NSFCProcessMonitorLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12[0] = 67109120;
        v12[1] = a4;
        _os_log_debug_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEBUG, "Destroying process monitor for pid %d", (uint8_t *)v12, 8u);
      }
      objc_msgSend(v9, "removeObject:", a3);
    }
    if (!objc_msgSend(v9, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_pidToProcessManagers, "removeObjectForKey:", v7);
    os_unfair_lock_unlock(&self->_lock);
    if (v10)
      -[NSFileAccessProcessMonitor updateMonitorPredicate](self, "updateMonitorPredicate");
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__NSFileAccessProcessMonitor_sharedInstance__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD0A618 != -1)
    dispatch_once(&qword_1ECD0A618, v3);
  return (id)qword_1ECD0A610;
}

uint64_t __35__NSFileAccessProcessMonitor__init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "process:receivedUpdate:");
}

uint64_t __52__NSFileAccessProcessMonitor_updateMonitorPredicate__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1));
}

- (void)process:(id)a3 receivedUpdate:(id)a4
{
  uint64_t v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "currentState"), "taskState") == 3)
  {
    v6 = -[objc_class identifierWithPid:](objc_lookUpClass("RBSProcessIdentifier"), "identifierWithPid:", objc_msgSend(a3, "pid"));
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_pidToProcessManagers, "objectForKey:", v6), "allObjects");
    os_unfair_lock_unlock(p_lock);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "processSuspended");
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v10);
    }
  }
}

- (id)_init
{
  NSFileAccessProcessMonitor *v3;
  NSFileAccessProcessMonitor *v4;
  RBSProcessMonitor *v5;
  uint64_t v6;
  _QWORD v8[5];
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A608 != -1)
    dispatch_once(&qword_1ECD0A608, &__block_literal_global_68);
  if (_MergedGlobals_143)
  {
    v9.receiver = self;
    v9.super_class = (Class)NSFileAccessProcessMonitor;
    v3 = -[NSFileAccessProcessMonitor init](&v9, sel_init);
    v4 = v3;
    if (v3)
    {
      v3->_lock._os_unfair_lock_opaque = 0;
      v5 = (RBSProcessMonitor *)objc_alloc_init(objc_lookUpClass("RBSProcessMonitor"));
      v6 = MEMORY[0x1E0C809B0];
      v4->_monitor = v5;
      v8[0] = v6;
      v8[1] = 3221225472;
      v8[2] = __35__NSFileAccessProcessMonitor__init__block_invoke_2;
      v8[3] = &unk_1E0F524C8;
      v8[4] = v4;
      -[RBSProcessMonitor updateConfiguration:](v5, "updateConfiguration:", v8);
      v4->_pidToProcessManagers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

Class __35__NSFileAccessProcessMonitor__init__block_invoke()
{
  Class result;

  dlopen("/System/Library/PrivateFrameworks/RunningBoardServices.framework/RunningBoardServices", 256);
  result = objc_lookUpClass("RBSProcessMonitor");
  _MergedGlobals_143 = result != 0;
  return result;
}

uint64_t __35__NSFileAccessProcessMonitor__init__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__NSFileAccessProcessMonitor__init__block_invoke_3;
  v4[3] = &unk_1E0F524A0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "setUpdateHandler:", v4);
  return objc_msgSend(a2, "setStateDescriptor:", -[objc_class descriptor](objc_lookUpClass("RBSProcessStateDescriptor"), "descriptor"));
}

uint64_t __44__NSFileAccessProcessMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  qword_1ECD0A610 = result;
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)NSFileAccessProcessMonitor;
  -[NSFileAccessProcessMonitor dealloc](&v3, sel_dealloc);
}

- (BOOL)processWithPIDIsSuspended:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[objc_class identifierWithPid:](objc_lookUpClass("RBSProcessIdentifier"), "identifierWithPid:", *(_QWORD *)&a3);
  v4 = -[objc_class predicateMatchingIdentifier:](objc_lookUpClass("RBSProcessPredicate"), "predicateMatchingIdentifier:", v3);
  return objc_msgSend((id)objc_msgSend((id)-[objc_class handleForPredicate:error:](objc_lookUpClass("RBSProcessHandle"), "handleForPredicate:error:", v4, 0), "currentState"), "taskState") == 3;
}

@end
