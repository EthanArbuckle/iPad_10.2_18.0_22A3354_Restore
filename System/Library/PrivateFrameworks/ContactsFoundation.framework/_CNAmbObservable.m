@implementation _CNAmbObservable

- (_CNAmbObservable)init
{
  return -[_CNAmbObservable initWithObservables:](self, "initWithObservables:", MEMORY[0x1E0C9AA60]);
}

- (_CNAmbObservable)initWithObservables:(id)a3
{
  id v4;
  _CNAmbObservable *v5;
  uint64_t v6;
  NSArray *observables;
  uint64_t v8;
  NSMapTable *tokensByObserver;
  _CNAmbObservable *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNAmbObservable;
  v5 = -[_CNAmbObservable init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    observables = v5->_observables;
    v5->_observables = (NSArray *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(v4, "count"));
    tokensByObserver = v5->_tokensByObserver;
    v5->_tokensByObserver = (NSMapTable *)v8;

    v5->_winnerDeclared = 0;
    v10 = v5;
  }

  return v5;
}

- (id)subscribe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _CNAmbObserver *v14;
  void *v15;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray count](self->_observables, "count"))
  {
    +[CNObservable emptyObservable](CNObservable, "emptyObservable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[NSArray count](self->_observables, "count") == 1)
  {
    -[NSArray firstObject](self->_observables, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v5;
    objc_msgSend(v5, "subscribe:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_observables;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = -[_CNAmbObserver initWithObserver:delegate:]([_CNAmbObserver alloc], "initWithObserver:delegate:", v4, self);
        objc_msgSend(v13, "subscribe:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_tokensByObserver, "setObject:forKey:", v15, v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __30___CNAmbObservable_subscribe___block_invoke;
  v17[3] = &unk_1E29B9358;
  v17[4] = self;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v7;
}

- (void)observerWillRelayEvent:(id)a3
{
  _CNAmbObservable *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_winnerDeclared)
  {
    objc_sync_exit(v4);

  }
  else
  {
    objc_msgSend(v5, "declareWinner");
    -[NSMapTable removeObjectForKey:](v4->_tokensByObserver, "removeObjectForKey:", v5);
    v4->_winnerDeclared = 1;
    objc_sync_exit(v4);

    -[_CNAmbObservable cancelRemainingObservables](v4, "cancelRemainingObservables");
  }

}

- (void)cancelRemainingObservables
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_tokensByObserver, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensByObserver, 0);
  objc_storeStrong((id *)&self->_observables, 0);
}

@end
