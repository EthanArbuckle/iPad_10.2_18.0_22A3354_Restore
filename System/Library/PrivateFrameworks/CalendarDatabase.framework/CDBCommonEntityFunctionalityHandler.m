@implementation CDBCommonEntityFunctionalityHandler

void __62__CDBCommonEntityFunctionalityHandler_addDestructionObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "destructionObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSMutableSet)destructionObservers
{
  return self->_destructionObservers;
}

- (void)addDestructionObserver:(CalRelation *)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[16];

  if (a3)
  {
    -[CDBCommonEntityFunctionalityHandler lock](self, "lock");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__CDBCommonEntityFunctionalityHandler_addDestructionObserver___block_invoke;
    v7[3] = &unk_1E4F8EF98;
    v7[4] = self;
    v7[5] = a3;
    dispatch_sync(v5, v7);

  }
  else
  {
    v6 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5CCB000, v6, OS_LOG_TYPE_ERROR, "nil 'observer' given.  Will not add destruction observer.", buf, 2u);
    }
  }
}

- (OS_dispatch_queue)lock
{
  return self->_lock;
}

- (CDBCommonEntityFunctionalityHandler)init
{
  CDBCommonEntityFunctionalityHandler *v2;
  id v3;
  NSObject *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CDBCommonEntityFunctionalityHandler;
  v2 = -[CDBCommonEntityFunctionalityHandler init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CDBCommonEntityFunctionalityHandler setDestructionObservers:](v2, "setDestructionObservers:", v3);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("CDBCommonEntityFunctionalityHandler.lock", v4);
    -[CDBCommonEntityFunctionalityHandler setLock:](v2, "setLock:", v5);

  }
  return v2;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void)setDestructionObservers:(id)a3
{
  objc_storeStrong((id *)&self->_destructionObservers, a3);
}

- (void)notifyOfEntityDestruction
{
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  v10 = 0;
  -[CDBCommonEntityFunctionalityHandler lock](self, "lock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CDBCommonEntityFunctionalityHandler_notifyOfEntityDestruction__block_invoke;
  v4[3] = &unk_1E4F8EFC0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  objc_msgSend((id)objc_opt_class(), "_notifyDestructionObservers:", v6[5]);
  _Block_object_dispose(&v5, 8);

}

+ (void)_notifyDestructionObservers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        CDBRelationEliminateRelatedObjectReference(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __64__CDBCommonEntityFunctionalityHandler_notifyOfEntityDestruction__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "destructionObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "destructionObservers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destructionObservers, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CDBCommonEntityFunctionalityHandler destructionObservers](self, "destructionObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend((id)objc_opt_class(), "_notifyDestructionObservers:", v3);

  v4.receiver = self;
  v4.super_class = (Class)CDBCommonEntityFunctionalityHandler;
  -[CDBCommonEntityFunctionalityHandler dealloc](&v4, sel_dealloc);
}

- (void)removeDestructionObserver:(CalRelation *)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[16];

  if (a3)
  {
    CFRetain(a3);
    -[CDBCommonEntityFunctionalityHandler lock](self, "lock");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__CDBCommonEntityFunctionalityHandler_removeDestructionObserver___block_invoke;
    v7[3] = &unk_1E4F8EF98;
    v7[4] = self;
    v7[5] = a3;
    dispatch_sync(v5, v7);

    CFRelease(a3);
  }
  else
  {
    v6 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5CCB000, v6, OS_LOG_TYPE_ERROR, "nil 'observer' given.  Will not remove destruction observer.", buf, 2u);
    }
  }
}

void __65__CDBCommonEntityFunctionalityHandler_removeDestructionObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "destructionObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

@end
