@implementation CRKIDSFirewallUpdatingRosterProvider

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CRKIDSFirewallUpdatingRosterProvider endObservingRosters](self, "endObservingRosters");
  -[CRKIDSFirewallUpdatingRosterProvider operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  v4.receiver = self;
  v4.super_class = (Class)CRKIDSFirewallUpdatingRosterProvider;
  -[CRKIDSFirewallUpdatingRosterProvider dealloc](&v4, sel_dealloc);
}

- (CRKIDSFirewallUpdatingRosterProvider)initWithRosterProvider:(id)a3 IDSPrimitives:(id)a4
{
  return -[CRKIDSFirewallUpdatingRosterProvider initWithPrimaryRosterProvider:secondaryRosterProvider:IDSPrimitives:](self, "initWithPrimaryRosterProvider:secondaryRosterProvider:IDSPrimitives:", a3, 0, a4);
}

- (CRKIDSFirewallUpdatingRosterProvider)initWithPrimaryRosterProvider:(id)a3 secondaryRosterProvider:(id)a4 IDSPrimitives:(id)a5
{
  id v9;
  id v10;
  CRKIDSFirewallUpdatingRosterProvider *v11;
  CRKIDSFirewallUpdatingRosterProvider *v12;
  uint64_t v13;
  CATOperationQueue *operationQueue;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRKIDSFirewallUpdatingRosterProvider;
  v11 = -[CRKASMRosterProviderDecoratorBase initWithRosterProvider:](&v16, sel_initWithRosterProvider_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_secondaryRosterProvider, a4);
    objc_storeStrong((id *)&v12->_IDSPrimitives, a5);
    v13 = objc_opt_new();
    operationQueue = v12->_operationQueue;
    v12->_operationQueue = (CATOperationQueue *)v13;

    -[CRKIDSFirewallUpdatingRosterProvider beginObservingRosters](v12, "beginObservingRosters");
    -[CRKIDSFirewallUpdatingRosterProvider performSelectorOnMainThread:withObject:waitUntilDone:](v12, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_rosterDidChange, 0, 0);
  }

  return v12;
}

- (void)rosterDidChange
{
  void *v4;
  void *v5;
  void *v6;
  CRKSynchronizeIDSFirewallOperation *v7;
  void *v8;
  CRKSynchronizeIDSFirewallOperation *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKIDSFirewallUpdatingRosterProvider.m"), 76, CFSTR("%@ must be called from the main thread"), v13);

  }
  if (-[CRKIDSFirewallUpdatingRosterProvider areRosterProvidersPopulated](self, "areRosterProvidersPopulated"))
  {
    -[CRKIDSFirewallUpdatingRosterProvider primaryRosterProvider](self, "primaryRosterProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "roster");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRKIDSFirewallUpdatingRosterProvider makeTrustedAppleIDs](self, "makeTrustedAppleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [CRKSynchronizeIDSFirewallOperation alloc];
    -[CRKIDSFirewallUpdatingRosterProvider IDSPrimitives](self, "IDSPrimitives");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CRKSynchronizeIDSFirewallOperation initWithIDSPrimitives:localStorage:trustedRosterAppleIDs:](v7, "initWithIDSPrimitives:localStorage:trustedRosterAppleIDs:", v8, self, v6);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __55__CRKIDSFirewallUpdatingRosterProvider_rosterDidChange__block_invoke;
    v14[3] = &unk_24D9C70C0;
    v14[4] = self;
    v15 = v5;
    v10 = v5;
    +[CRKBlockOperation blockOperationWithBlock:](CRKBlockOperation, "blockOperationWithBlock:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKSynchronizeIDSFirewallOperation addTarget:selector:forOperationEvents:](v9, "addTarget:selector:forOperationEvents:", self, sel_synchronizeFirewallOperationDidFail_, 4);
    -[CRKIDSFirewallUpdatingRosterProvider enqueueWorkOperation:](self, "enqueueWorkOperation:", v9);
    -[CRKIDSFirewallUpdatingRosterProvider enqueueWorkOperation:](self, "enqueueWorkOperation:", v11);

  }
}

void __55__CRKIDSFirewallUpdatingRosterProvider_rosterDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CRKIDSFirewallUpdatingRosterProvider_rosterDidChange__block_invoke_2;
  block[3] = &unk_24D9C7938;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __55__CRKIDSFirewallUpdatingRosterProvider_rosterDidChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "publishedRoster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 || *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "publishedRoster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

    if ((v4 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setPublishedRoster:", *(_QWORD *)(a1 + 40));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)enqueueWorkOperation:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    -[CRKIDSFirewallUpdatingRosterProvider lastWorkOperation](self, "lastWorkOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CRKIDSFirewallUpdatingRosterProvider lastWorkOperation](self, "lastWorkOperation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addDependency:", v6);

    }
    -[CRKIDSFirewallUpdatingRosterProvider setLastWorkOperation:](self, "setLastWorkOperation:", v8);
    -[CRKIDSFirewallUpdatingRosterProvider operationQueue](self, "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addOperation:", v8);

  }
  else
  {
    -[CRKIDSFirewallUpdatingRosterProvider performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v8, 0);
  }

}

- (void)synchronizeFirewallOperationDidFail:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE2C4A8]) & 1) != 0)
  {
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "code");

    if (v7 == 404)
      goto LABEL_9;
  }
  else
  {

  }
  if (_CRKLogASM_onceToken_9 != -1)
    dispatch_once(&_CRKLogASM_onceToken_9, &__block_literal_global_97);
  v8 = (void *)_CRKLogASM_logObj_9;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_9, OS_LOG_TYPE_ERROR))
    -[CRKIDSFirewallUpdatingRosterProvider synchronizeFirewallOperationDidFail:].cold.1(v8, v3);
LABEL_9:

}

+ (id)keyPathsForValuesAffectingRoster
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("publishedRoster"));
}

+ (id)observedKeyPaths
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("roster");
  v3[1] = CFSTR("populated");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)beginObservingRosters
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
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

  v24 = *MEMORY[0x24BDAC8D0];
  if (!-[CRKIDSFirewallUpdatingRosterProvider isObservingRosters](self, "isObservingRosters"))
  {
    -[CRKIDSFirewallUpdatingRosterProvider setObservingRosters:](self, "setObservingRosters:", 1);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend((id)objc_opt_class(), "observedKeyPaths");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v19;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v19 != v5)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6);
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          -[CRKIDSFirewallUpdatingRosterProvider rosterProviders](self, "rosterProviders");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
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
                objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "addObserver:forKeyPath:options:context:", self, v7, 0, CFSTR("ObservationContext"));
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v4);
    }

  }
}

- (void)endObservingRosters
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
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

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[CRKIDSFirewallUpdatingRosterProvider isObservingRosters](self, "isObservingRosters"))
  {
    -[CRKIDSFirewallUpdatingRosterProvider setObservingRosters:](self, "setObservingRosters:", 0);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend((id)objc_opt_class(), "observedKeyPaths");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v19;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v19 != v5)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6);
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          -[CRKIDSFirewallUpdatingRosterProvider rosterProviders](self, "rosterProviders");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
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
                objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "removeObserver:forKeyPath:context:", self, v7, CFSTR("ObservationContext"));
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v4);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("ObservationContext"))
  {
    -[CRKIDSFirewallUpdatingRosterProvider rosterDidChange](self, "rosterDidChange", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKIDSFirewallUpdatingRosterProvider;
    -[CRKIDSFirewallUpdatingRosterProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)rosterProviders
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[CRKIDSFirewallUpdatingRosterProvider secondaryRosterProvider](self, "secondaryRosterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKIDSFirewallUpdatingRosterProvider primaryRosterProvider](self, "primaryRosterProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    -[CRKIDSFirewallUpdatingRosterProvider secondaryRosterProvider](self, "secondaryRosterProvider", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)areRosterProvidersPopulated
{
  void *v2;
  char v3;

  -[CRKIDSFirewallUpdatingRosterProvider rosterProviders](self, "rosterProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "crk_allObjectsMatchPredicate:", &__block_literal_global_18);

  return v3;
}

uint64_t __67__CRKIDSFirewallUpdatingRosterProvider_areRosterProvidersPopulated__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPopulated");
}

- (id)makeTrustedAppleIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CRKIDSFirewallUpdatingRosterProvider rosterProviders](self, "rosterProviders", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = (void *)objc_opt_class();
        objc_msgSend(v9, "roster");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "trustedUserAppleIDsFromRoster:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

+ (id)trustedUserAppleIDsFromRoster:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF20];
  if (a3)
  {
    objc_msgSend(a3, "courses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crk_flatMapUsingBlock:", &__block_literal_global_28);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)objc_opt_new();
  }
  return v6;
}

id __70__CRKIDSFirewallUpdatingRosterProvider_trustedUserAppleIDsFromRoster___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "trustedUsers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __70__CRKIDSFirewallUpdatingRosterProvider_trustedUserAppleIDsFromRoster___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appleID");
}

- (NSSet)allowedAppleIDs
{
  return self->_allowedAppleIDs;
}

- (void)setAllowedAppleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CRKASMRosterProviding)secondaryRosterProvider
{
  return self->_secondaryRosterProvider;
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (BOOL)isObservingRosters
{
  return self->_observingRosters;
}

- (void)setObservingRosters:(BOOL)a3
{
  self->_observingRosters = a3;
}

- (CRKASMRoster)publishedRoster
{
  return self->_publishedRoster;
}

- (void)setPublishedRoster:(id)a3
{
  objc_storeStrong((id *)&self->_publishedRoster, a3);
}

- (CATOperation)lastWorkOperation
{
  return (CATOperation *)objc_loadWeakRetained((id *)&self->_lastWorkOperation);
}

- (void)setLastWorkOperation:(id)a3
{
  objc_storeWeak((id *)&self->_lastWorkOperation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastWorkOperation);
  objc_storeStrong((id *)&self->_publishedRoster, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
  objc_storeStrong((id *)&self->_secondaryRosterProvider, 0);
  objc_storeStrong((id *)&self->_allowedAppleIDs, 0);
}

- (void)synchronizeFirewallOperationDidFail:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v5;
  _os_log_error_impl(&dword_218C99000, v3, OS_LOG_TYPE_ERROR, "Failed to synchronize IDS firewall. Error: %{public}@", (uint8_t *)&v6, 0xCu);

}

@end
