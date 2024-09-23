@implementation FCObservable

- (id)observe:(id)a3
{
  void *v4;
  id v5;
  FCObserver *v6;
  unint64_t v7;
  FCObserver *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  v6 = [FCObserver alloc];
  v7 = -[FCObservable token](self, "token");
  -[FCObservable setToken:](self, "setToken:", v7 + 1);
  v8 = -[FCObserver initWithToken:](v6, "initWithToken:", v7);
  -[FCObserver setObserverBlock:](v8, "setObserverBlock:", v5);

  -[FCObserver setKeepAliveObject:](v8, "setKeepAliveObject:", self);
  -[FCObservable observers](self, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  return v8;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (FCObservable)initWithValue:(id)a3
{
  id v5;
  FCObservable *v6;
  FCObservable *v7;
  uint64_t v8;
  NSMutableArray *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCObservable;
  v6 = -[FCObservable init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_value, a3);
    v7->_token = 0;
    v8 = objc_opt_new();
    observers = v7->_observers;
    v7->_observers = (NSMutableArray *)v8;

  }
  return v7;
}

- (FCObservable)init
{
  return -[FCObservable initWithValue:](self, "initWithValue:", 0);
}

- (void)dealloc
{
  NSMutableArray *observers;
  id value;
  objc_super v5;

  observers = self->_observers;
  self->_observers = 0;

  value = self->_value;
  self->_value = 0;

  v5.receiver = self;
  v5.super_class = (Class)FCObservable;
  -[FCObservable dealloc](&v5, sel_dealloc);
}

- (void)setValue:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCObservable next:](self, "next:", v5);

}

- (void)quietNext:(id)a3
{
  id v4;
  id value;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  value = self->_value;
  self->_value = v4;

}

- (void)next:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_storeStrong(&self->_value, a3);
  v6 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[FCObservable observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "keepAliveObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "observerBlock");
          v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v14)[2](v14, self->_value);

        }
        else
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        -[FCObservable observers](self, "observers", (_QWORD)v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

}

- (id)value
{
  return self->_value;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
