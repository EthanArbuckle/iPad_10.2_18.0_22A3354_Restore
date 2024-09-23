@implementation CLTimeCoercibleDispatchSilo

- (CLTimeCoercibleDispatchSilo)initWithIdentifier:(id)a3
{
  CLTimeCoercibleDispatchSilo *v3;
  uint64_t v4;
  NSMutableArray *timerHolders;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLTimeCoercibleDispatchSilo;
  v3 = -[CLDispatchSilo initWithIdentifier:](&v7, sel_initWithIdentifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    timerHolders = v3->_timerHolders;
    v3->_timerHolders = (NSMutableArray *)v4;

  }
  return v3;
}

- (CLTimeCoercibleDispatchSilo)initWithUnderlyingQueue:(id)a3
{
  CLTimeCoercibleDispatchSilo *v3;
  uint64_t v4;
  NSMutableArray *timerHolders;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLTimeCoercibleDispatchSilo;
  v3 = -[CLDispatchSilo initWithUnderlyingQueue:](&v7, sel_initWithUnderlyingQueue_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    timerHolders = v3->_timerHolders;
    v3->_timerHolders = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)setLatchedAbsoluteTimestamp:(double)a3
{
  double v5;
  double v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *timerHolders;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  double v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[CLDispatchSilo currentLatchedAbsoluteTimestamp](self, "currentLatchedAbsoluteTimestamp");
  v6 = a3 - v5;
  -[CLDispatchSilo _setLatchedAbsoluteTimestamp:](self, "_setLatchedAbsoluteTimestamp:", a3);
  v7 = self->_timerHolders;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  timerHolders = self->_timerHolders;
  self->_timerHolders = v9;

  v11 = (void *)MEMORY[0x1E0CB3880];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1A1A12200;
  v23[3] = &unk_1E45FBB20;
  v25 = v6;
  v12 = v8;
  v24 = v12;
  objc_msgSend(v11, "predicateWithBlock:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](v7, "filterUsingPredicate:", v13);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "shouldFire", (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v16);
  }

  -[NSMutableArray addObjectsFromArray:](self->_timerHolders, "addObjectsFromArray:", v7);
}

- (void)prepareAndRunBlock:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)afterInterval:(double)a3 async:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v6 = a4;
  v7 = -[CLTimeCoercibleDispatchSilo newTimer](self, "newTimer");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = sub_1A1A12384;
  v13 = &unk_1E45FBB48;
  v14 = v7;
  v15 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "setHandler:", &v10);
  objc_msgSend(v8, "setNextFireDelay:", a3, v10, v11, v12, v13);

}

- (void)heartBeat:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[CLDispatchSilo queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A1A12444;
  block[3] = &unk_1E45FBB70;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (id)newTimer
{
  id v3;
  NSMutableArray *timerHolders;
  void *v5;

  v3 = -[CLTimer initInSilo:withScheduler:]([CLTimer alloc], "initInSilo:withScheduler:", self, 0);
  timerHolders = self->_timerHolders;
  +[CLTimerWeakHolder holderWithTimer:](CLTimerWeakHolder, "holderWithTimer:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](timerHolders, "addObject:", v5);

  return v3;
}

- (NSMutableArray)timerHolders
{
  return self->_timerHolders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerHolders, 0);
}

@end
