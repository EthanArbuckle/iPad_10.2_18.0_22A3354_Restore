@implementation LAAuthenticationMethod

- (LAAuthenticationMethod)initWithConfiguration:(id)a3
{
  id v5;
  LAAuthenticationMethod *v6;
  LAAuthenticationMethod *v7;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LAAuthenticationMethod;
  v6 = -[LAAuthenticationMethod init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

  }
  return v7;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)forEachObserverWithProtocol:(id)a3 selector:(SEL)a4 invoke:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_observers;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((!v8
           || objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "conformsToProtocol:", v8, (_QWORD)v16))&& (!a4 || (objc_opt_respondsToSelector() & 1) != 0))
        {
          v9[2](v9, v15);
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)forEachObserverWithInvoke:(id)a3
{
  -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:](self, "forEachObserverWithProtocol:selector:invoke:", 0, 0, a3);
}

- (BOOL)start
{
  self->_running = 1;
  return 1;
}

- (void)terminate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__LAAuthenticationMethod_terminate__block_invoke;
  v3[3] = &unk_1E707A270;
  v3[4] = self;
  -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:](self, "forEachObserverWithProtocol:selector:invoke:", &unk_1EF235030, sel_authenticationMethodWillTerminate_, v3);
  self->_running = 0;
}

uint64_t __35__LAAuthenticationMethod_terminate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "authenticationMethodWillTerminate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  if (self->_running)
    -[LAAuthenticationMethod terminate](self, "terminate");
  v3.receiver = self;
  v3.super_class = (Class)LAAuthenticationMethod;
  -[LAAuthenticationMethod dealloc](&v3, sel_dealloc);
}

- (LAAuthenticationMethodConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
