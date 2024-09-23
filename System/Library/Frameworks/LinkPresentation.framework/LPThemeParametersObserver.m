@implementation LPThemeParametersObserver

- (LPThemeParametersObserver)init
{
  LPThemeParametersObserver *v2;
  void *v3;
  LPThemeParametersObserver *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPThemeParametersObserver;
  v2 = -[LPThemeParametersObserver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_didChangeDarkenColorsStatus_, *MEMORY[0x1E0DC4508], 0);

    v4 = v2;
  }

  return v2;
}

+ (id)shared
{
  void *v2;
  LPThemeParametersObserver *v3;
  void *v4;

  v2 = (void *)shared_observer;
  if (!shared_observer)
  {
    v3 = objc_alloc_init(LPThemeParametersObserver);
    v4 = (void *)shared_observer;
    shared_observer = (uint64_t)v3;

    v2 = (void *)shared_observer;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)LPThemeParametersObserver;
  -[LPThemeParametersObserver dealloc](&v4, sel_dealloc);
}

- (void)addClient:(id)a3
{
  id v4;
  NSHashTable *clients;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  clients = self->_clients;
  v8 = v4;
  if (!clients)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_clients;
    self->_clients = v6;

    clients = self->_clients;
    v4 = v8;
  }
  if (-[NSHashTable containsObject:](clients, "containsObject:", v4))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Trying to add a LPThemeClient that is already a client."));
  -[NSHashTable addObject:](self->_clients, "addObject:", v8);

}

- (void)removeClient:(id)a3
{
  NSHashTable *clients;
  id v5;

  v5 = a3;
  clients = self->_clients;
  if (clients)
    -[NSHashTable removeObject:](clients, "removeObject:", v5);

}

- (void)didChangeThemeParameters
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  themeCache();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_clients;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "themeParametersDidChange", (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
