@implementation GKUpdateGroup

+ (id)updateGroup
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:targetQueue:", 0, MEMORY[0x1E0C80D38]);
}

+ (GKUpdateGroup)updateGroupWithName:(id)a3
{
  return (GKUpdateGroup *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:targetQueue:", a3, MEMORY[0x1E0C80D38]);
}

+ (id)updateGroupForTargetQueue:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:targetQueue:", 0, a3);
}

+ (GKUpdateGroup)updateGroupWithName:(id)a3 taregetQueue:(id)a4
{
  return (GKUpdateGroup *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:targetQueue:", a3, a4);
}

- (GKUpdateGroup)initWithName:(id)a3 targetQueue:(id)a4
{
  GKUpdateGroup *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKUpdateGroup;
  v6 = -[GKUpdateGroup init](&v8, sel_init);
  if (v6)
  {
    v6->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v6->_targetQueue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
    v6->_dispatchGroup = (OS_dispatch_group *)dispatch_group_create();
    v6->_notifiers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!a3)
      a3 = (id)-[GKUpdateGroup description](v6, "description");
    -[GKUpdateGroup setName:](v6, "setName:", a3);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_targetQueue);
  dispatch_release((dispatch_object_t)self->_dispatchGroup);

  v3.receiver = self;
  v3.super_class = (Class)GKUpdateGroup;
  -[GKUpdateGroup dealloc](&v3, sel_dealloc);
}

- (void)performOnQueue:(id)a3 block:(id)a4
{
  GKUpdateGroupNotifier *v7;
  void *v8;
  _QWORD v9[6];

  v7 = objc_alloc_init(GKUpdateGroupNotifier);
  -[NSMutableArray addObject:](-[GKUpdateGroup notifiers](self, "notifiers"), "addObject:", v7);

  -[GKUpdateGroupNotifier setGroup:](v7, "setGroup:", self);
  v8 = _Block_copy(a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__GKUpdateGroup_performOnQueue_block___block_invoke;
  v9[3] = &unk_1E75B24B0;
  v9[4] = v7;
  v9[5] = v8;
  dispatch_async((dispatch_queue_t)a3, v9);
}

void __38__GKUpdateGroup_performOnQueue_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
}

- (void)perform:(id)a3
{
  -[GKUpdateGroup performOnQueue:block:](self, "performOnQueue:block:", MEMORY[0x1E0C80D38], a3);
}

- (void)join:(id)a3
{
  GKUpdateGroup *v5;
  NSObject *dispatchGroup;
  NSObject *targetQueue;
  _QWORD v8[6];

  v5 = self;
  dispatchGroup = self->_dispatchGroup;
  targetQueue = self->_targetQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __22__GKUpdateGroup_join___block_invoke;
  v8[3] = &unk_1E75B24B0;
  v8[4] = self;
  v8[5] = a3;
  dispatch_group_notify(dispatchGroup, targetQueue, v8);
}

void __22__GKUpdateGroup_join___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (void)joinApplyUpdatesAndDo:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__GKUpdateGroup_joinApplyUpdatesAndDo___block_invoke;
  v3[3] = &unk_1E75B24D8;
  v3[4] = self;
  v3[5] = a3;
  -[GKUpdateGroup join:](self, "join:", v3);
}

uint64_t __39__GKUpdateGroup_joinApplyUpdatesAndDo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "applyUpdates");
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "error"));
}

- (void)joinAndApplyUpdates
{
  -[GKUpdateGroup joinApplyUpdatesAndDo:](self, "joinApplyUpdatesAndDo:", &__block_literal_global_15);
}

- (void)wait
{
  dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)applyUpdates
{
  NSMutableArray *notifiers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  notifiers = self->_notifiers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](notifiers, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(notifiers);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v8, "lock"), "lock");
        if (!self->_error)
        {
          v16 = 0u;
          v17 = 0u;
          v14 = 0u;
          v15 = 0u;
          v9 = (void *)objc_msgSend(v8, "updateQueue", 0);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v15;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v15 != v12)
                  objc_enumerationMutation(v9);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j) + 16))();
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
            }
            while (v11);
          }
        }
        objc_msgSend((id)objc_msgSend(v8, "updateQueue"), "removeAllObjects");
        objc_msgSend(v8, "setGroup:", 0);
        objc_msgSend((id)objc_msgSend(v8, "lock"), "unlock");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](notifiers, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_notifiers, "removeAllObjects");
  -[GKUpdateGroup setError:](self, "setError:", 0);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)cancelUpdates
{
  NSMutableArray *notifiers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  notifiers = self->_notifiers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](notifiers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(notifiers);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v8, "lock"), "lock");
        objc_msgSend((id)objc_msgSend(v8, "updateQueue"), "removeAllObjects");
        objc_msgSend(v8, "setGroup:", 0);
        objc_msgSend((id)objc_msgSend(v8, "lock"), "unlock");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](notifiers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_notifiers, "removeAllObjects");
  -[GKUpdateGroup setError:](self, "setError:", 0);
  -[NSLock unlock](self->_lock, "unlock");
}

- (int64_t)updateCount
{
  NSMutableArray *notifiers;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  notifiers = self->_notifiers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](notifiers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(notifiers);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v9, "lock"), "lock");
        v6 += objc_msgSend((id)objc_msgSend(v9, "updateQueue"), "count");
        if (objc_msgSend(v9, "error"))
          ++v6;
        objc_msgSend((id)objc_msgSend(v9, "lock"), "unlock");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](notifiers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v6;
}

- (NSLock)lock
{
  return (NSLock *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)notifiers
{
  return self->_notifiers;
}

- (void)setNotifiers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
