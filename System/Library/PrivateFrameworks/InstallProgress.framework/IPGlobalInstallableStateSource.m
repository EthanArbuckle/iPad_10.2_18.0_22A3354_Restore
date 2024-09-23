@implementation IPGlobalInstallableStateSource

- (IPGlobalInstallableStateSource)initWithBehavior:(id)a3
{
  id v5;
  IPGlobalInstallableStateSource *v6;
  IPGlobalInstallableStateSource *v7;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPGlobalInstallableStateSource;
  v6 = -[IPGlobalInstallableStateSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ivarLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_behavior, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

  }
  return v7;
}

+ (id)sharedAllAppStateSource
{
  if (sharedAllAppStateSource_onceToken != -1)
    dispatch_once(&sharedAllAppStateSource_onceToken, &__block_literal_global);
  return (id)sharedAllAppStateSource_sharedAllAppStateSource;
}

void __57__IPGlobalInstallableStateSource_sharedAllAppStateSource__block_invoke()
{
  IPGlobalInstallableStateSource *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [IPGlobalInstallableStateSource alloc];
  +[IPGlobalInstallableStateSourceDefaultBehavior sharedInstance](IPGlobalInstallableStateSourceDefaultBehavior, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[IPGlobalInstallableStateSource initWithBehavior:](v0, "initWithBehavior:", v3);
  v2 = (void *)sharedAllAppStateSource_sharedAllAppStateSource;
  sharedAllAppStateSource_sharedAllAppStateSource = v1;

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__IPGlobalInstallableStateSource_addObserver___block_invoke;
  v6[3] = &unk_250FA3B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  IPDoWithLock(&self->_ivarLock, v6);

}

uint64_t __46__IPGlobalInstallableStateSource_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 40))
  {
    result = objc_msgSend(*(id *)(v3 + 16), "addObserver:");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__IPGlobalInstallableStateSource_removeObserver___block_invoke;
  v6[3] = &unk_250FA3B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  IPDoWithLock(&self->_ivarLock, v6);

}

uint64_t __49__IPGlobalInstallableStateSource_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)makeAndEnumerateStateSourcesForExtantIdentities:(id)a3
{
  -[IPGlobalInstallableStateSourceBehavior makeExtantStateSourcesForGlobalSource:andEnumerate:](self->_behavior, "makeExtantStateSourcesForGlobalSource:andEnumerate:", self, a3);
}

- (void)makeAndEnumerateStateSourcesForInstallingIdentities:(id)a3
{
  -[IPGlobalInstallableStateSourceBehavior makeInstallingStateSourcesForGlobalSource:andEnumerate:](self->_behavior, "makeInstallingStateSourcesForGlobalSource:andEnumerate:", self, a3);
}

- (void)testingActionBarrier
{
  -[IPGlobalInstallableStateSourceBehavior serverActionBarrierForTesting](self->_behavior, "serverActionBarrierForTesting");
}

- (void)globalStateSourceBehavior:(id)a3 stateSourceAvailableForIdentity:(id)a4 withGenerator:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __106__IPGlobalInstallableStateSource_globalStateSourceBehavior_stateSourceAvailableForIdentity_withGenerator___block_invoke;
  v21[3] = &unk_250FA3B78;
  v21[4] = self;
  v21[5] = &v22;
  IPDoWithLock(&self->_ivarLock, v21);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (id)v23[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v10[2](v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "globalInstallableStateSource:stateSourceIsAvailable:", self, v16, (_QWORD)v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
    }
    while (v12);
  }

  _Block_object_dispose(&v22, 8);
}

void __106__IPGlobalInstallableStateSource_globalStateSourceBehavior_stateSourceAvailableForIdentity_withGenerator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownIdentities, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
