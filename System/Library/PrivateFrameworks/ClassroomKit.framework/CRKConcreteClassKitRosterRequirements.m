@implementation CRKConcreteClassKitRosterRequirements

- (void)dealloc
{
  objc_super v3;

  -[CRKConcreteClassKitRosterRequirements unregisterGeneralObserverConstituents](self, "unregisterGeneralObserverConstituents");
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteClassKitRosterRequirements;
  -[CRKConcreteClassKitRosterRequirements dealloc](&v3, sel_dealloc);
}

+ (id)studentRosterRequirementsWithClassKitFacade:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClassKitFacade:isForInstructor:", v4, 0);

  return v5;
}

+ (id)instructorRosterRequirementsWithClassKitFacade:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClassKitFacade:isForInstructor:", v4, 1);

  return v5;
}

- (CRKConcreteClassKitRosterRequirements)initWithClassKitFacade:(id)a3 isForInstructor:(BOOL)a4
{
  id v7;
  CRKConcreteClassKitRosterRequirements *v8;
  CRKConcreteClassKitRosterRequirements *v9;
  uint64_t v10;
  NSMutableDictionary *generalObserversByToken;
  uint64_t v12;
  NSMutableDictionary *personObserversByToken;
  uint64_t v14;
  NSArray *dataObservers;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKConcreteClassKitRosterRequirements;
  v8 = -[CRKConcreteClassKitRosterRequirements init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_classKitFacade, a3);
    v9->_forInstructor = a4;
    v10 = objc_opt_new();
    generalObserversByToken = v9->_generalObserversByToken;
    v9->_generalObserversByToken = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    personObserversByToken = v9->_personObserversByToken;
    v9->_personObserversByToken = (NSMutableDictionary *)v12;

    -[CRKConcreteClassKitRosterRequirements makeDataObservers](v9, "makeDataObservers");
    v14 = objc_claimAutoreleasedReturnValue();
    dataObservers = v9->_dataObservers;
    v9->_dataObservers = (NSArray *)v14;

  }
  return v9;
}

- (BOOL)ownsError:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ownsError:", v4);

  return v6;
}

- (void)syncServerConfigWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncServerConfigWithCompletion:", v4);

}

- (BOOL)isForStudent
{
  return !-[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
}

- (void)removeGeneralObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements generalObserversByToken](self, "generalObserversByToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v4);

  -[CRKConcreteClassKitRosterRequirements generalObserversByToken](self, "generalObserversByToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[CRKConcreteClassKitRosterRequirements unregisterGeneralObserverConstituents](self, "unregisterGeneralObserverConstituents");
}

- (void)removePersonObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements personObserversByToken](self, "personObserversByToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cancel");
  -[CRKConcreteClassKitRosterRequirements personObserversByToken](self, "personObserversByToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);

}

- (id)makeToken
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
}

- (void)registerGeneralObserverConstituents
{
  if (!-[CRKConcreteClassKitRosterRequirements generalObserverConstituentsRegistered](self, "generalObserverConstituentsRegistered"))
  {
    -[CRKConcreteClassKitRosterRequirements setGeneralObserverConstituentsRegistered:](self, "setGeneralObserverConstituentsRegistered:", 1);
    -[CRKConcreteClassKitRosterRequirements registerDataObservers](self, "registerDataObservers");
    -[CRKConcreteClassKitRosterRequirements registerForCurrentUserChangeNotification](self, "registerForCurrentUserChangeNotification");
    -[CRKConcreteClassKitRosterRequirements registerForMembershipChangeDarwinNotification](self, "registerForMembershipChangeDarwinNotification");
    -[CRKConcreteClassKitRosterRequirements startObservingAccountState](self, "startObservingAccountState");
  }
}

- (void)unregisterGeneralObserverConstituents
{
  if (-[CRKConcreteClassKitRosterRequirements generalObserverConstituentsRegistered](self, "generalObserverConstituentsRegistered"))
  {
    -[CRKConcreteClassKitRosterRequirements setGeneralObserverConstituentsRegistered:](self, "setGeneralObserverConstituentsRegistered:", 0);
    -[CRKConcreteClassKitRosterRequirements deregisterDataObservers](self, "deregisterDataObservers");
    -[CRKConcreteClassKitRosterRequirements unregisterForCurrentUserChangeNotification](self, "unregisterForCurrentUserChangeNotification");
    -[CRKConcreteClassKitRosterRequirements unregisterForMembershipChangeDarwinNotification](self, "unregisterForMembershipChangeDarwinNotification");
    -[CRKConcreteClassKitRosterRequirements stopObservingAccountState](self, "stopObservingAccountState");
  }
}

- (void)registerForCurrentUserChangeNotification
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[CRKConcreteClassKitRosterRequirements userDidChangeSubscription](self, "userDidChangeSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __81__CRKConcreteClassKitRosterRequirements_registerForCurrentUserChangeNotification__block_invoke;
  v9 = &unk_24D9C7A60;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "subscribeToCurrentUserDidChangeEvents:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteClassKitRosterRequirements setUserDidChangeSubscription:](self, "setUserDidChangeSubscription:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __81__CRKConcreteClassKitRosterRequirements_registerForCurrentUserChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "callGeneralObserversWithReason:", CFSTR("ClassKit current user changed"));

}

- (void)unregisterForCurrentUserChangeNotification
{
  void *v3;

  -[CRKConcreteClassKitRosterRequirements userDidChangeSubscription](self, "userDidChangeSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CRKConcreteClassKitRosterRequirements setUserDidChangeSubscription:](self, "setUserDidChangeSubscription:", 0);
}

- (void)registerForMembershipChangeDarwinNotification
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  if (!-[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor"))
  {
    objc_initWeak(&location, self);
    -[CRKConcreteClassKitRosterRequirements membershipDidChangeSubscription](self, "membershipDidChangeSubscription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __86__CRKConcreteClassKitRosterRequirements_registerForMembershipChangeDarwinNotification__block_invoke;
    v9 = &unk_24D9C7A60;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "subscribeToClassMembershipChangeEvents:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKConcreteClassKitRosterRequirements setMembershipDidChangeSubscription:](self, "setMembershipDidChangeSubscription:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __86__CRKConcreteClassKitRosterRequirements_registerForMembershipChangeDarwinNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "callGeneralObserversWithReason:", CFSTR("ClassKit class membership changed"));

}

- (void)unregisterForMembershipChangeDarwinNotification
{
  void *v3;

  -[CRKConcreteClassKitRosterRequirements membershipDidChangeSubscription](self, "membershipDidChangeSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CRKConcreteClassKitRosterRequirements setMembershipDidChangeSubscription:](self, "setMembershipDidChangeSubscription:", 0);
}

- (id)makeDataObservers
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v3 = (void *)objc_opt_new();
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classDataObserverWithSortDescriptors:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _CRKLogASM_11();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRKConcreteClassKitRosterRequirements makeDataObservers].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  -[CRKConcreteClassKitRosterRequirements makeDataChangedBlockWithObserverDescription:](self, "makeDataChangedBlockWithObserverDescription:", CFSTR("classes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataChanged:", v14);

  -[CRKConcreteClassKitRosterRequirements addNullableObserver:toArray:](self, "addNullableObserver:toArray:", v5, v3);
  if (-[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor"))
  {
    -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "locationsObserverWithSortDescriptors:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      _CRKLogASM_11();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CRKConcreteClassKitRosterRequirements makeDataObservers].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    }
    -[CRKConcreteClassKitRosterRequirements makeDataChangedBlockWithObserverDescription:](self, "makeDataChangedBlockWithObserverDescription:", CFSTR("locations"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDataChanged:", v25);

    -[CRKConcreteClassKitRosterRequirements addNullableObserver:toArray:](self, "addNullableObserver:toArray:", v16, v3);
  }
  v26 = (void *)objc_msgSend(v3, "copy");

  return v26;
}

- (void)addNullableObserver:(id)a3 toArray:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addObject:");
}

- (id)makeDataChangedBlockWithObserverDescription:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ClassKit data observer for '%@' fired"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__CRKConcreteClassKitRosterRequirements_makeDataChangedBlockWithObserverDescription___block_invoke;
  v8[3] = &unk_24D9C8A60;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x219A226E8](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __85__CRKConcreteClassKitRosterRequirements_makeDataChangedBlockWithObserverDescription___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __85__CRKConcreteClassKitRosterRequirements_makeDataChangedBlockWithObserverDescription___block_invoke_2;
  v2[3] = &unk_24D9C7DC8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v4);
}

void __85__CRKConcreteClassKitRosterRequirements_makeDataChangedBlockWithObserverDescription___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callGeneralObserversWithReason:", *(_QWORD *)(a1 + 32));

}

- (void)registerDataObservers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CRKConcreteClassKitRosterRequirements dataObservers](self, "dataObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "registerDataObserver:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)deregisterDataObservers
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  -[CRKConcreteClassKitRosterRequirements dataObservers](self, "dataObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __64__CRKConcreteClassKitRosterRequirements_deregisterDataObservers__block_invoke;
  v11 = &unk_24D9C72D0;
  v5 = v3;
  v12 = v5;
  v6 = v4;
  v13 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x219A226E8](&v8);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v8, v9, v10, v11))
    v7[2](v7);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __64__CRKConcreteClassKitRosterRequirements_deregisterDataObservers__block_invoke(uint64_t a1)
{
  id v2;
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

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(a1 + 40), "deregisterDataObserver:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (int64_t)accountState
{
  void *v2;
  int64_t v3;

  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accountState");

  return v3;
}

- (void)startObservingAccountState
{
  id v3;

  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("accountState"), 0, CFSTR("ObservationContext"));

}

- (void)stopObservingAccountState
{
  id v3;

  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("accountState"), CFSTR("ObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  int v11;
  id v12;

  v12 = a3;
  v9 = a4;
  if (a6 == CFSTR("ObservationContext"))
  {
    -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v9)
    {
      v11 = objc_msgSend(v12, "isEqualToString:", CFSTR("accountState"));

      if (v11)
        -[CRKConcreteClassKitRosterRequirements callGeneralObserversWithReason:](self, "callGeneralObserversWithReason:", CFSTR("Account state changed"));
    }
    else
    {

    }
  }

}

- (void)callGeneralObserversWithReason:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteClassKitRosterRequirements.m"), 273, CFSTR("%@ must be called from the main thread"), v14);

  }
  _CRKLogASM_11();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "Firing roster requirements general observers with reason: '%{public}@'", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CRKConcreteClassKitRosterRequirements generalObserversByToken](self, "generalObserversByToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (id)addGeneralObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements registerGeneralObserverConstituents](self, "registerGeneralObserverConstituents");
  -[CRKConcreteClassKitRosterRequirements makeToken](self, "makeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x219A226E8](v4);

  -[CRKConcreteClassKitRosterRequirements generalObserversByToken](self, "generalObserversByToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v5);

  return v5;
}

- (id)addObserverForPersonIDs:(id)a3 observerBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CRKClassKitPersonIDObservation *v9;
  void *v10;
  CRKClassKitPersonIDObservation *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[CRKConcreteClassKitRosterRequirements makeToken](self, "makeToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [CRKClassKitPersonIDObservation alloc];
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CRKClassKitPersonIDObservation initWithPersonIDs:classKitFacade:block:](v9, "initWithPersonIDs:classKitFacade:block:", v7, v10, v6);

  -[CRKConcreteClassKitRosterRequirements personObserversByToken](self, "personObserversByToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v8);

  return v8;
}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements removeGeneralObserver:](self, "removeGeneralObserver:", v4);
  -[CRKConcreteClassKitRosterRequirements removePersonObserver:](self, "removePersonObserver:", v4);

}

- (id)objectIDsOfPersonsInClass:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "objectIDsOfInstructorsInClass:", v4);
  else
    objc_msgSend(v6, "objectIDsOfStudentsInClass:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)objectIDsOfTrustedPersonsInClass:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "objectIDsOfStudentsInClass:", v4);
  else
    objc_msgSend(v6, "objectIDsOfInstructorsInClass:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)currentUserWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUserWithCompletion:", v4);

}

- (void)classesWithCompletion:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "instructedClassesWithCompletion:", v4);
  else
    objc_msgSend(v6, "enrolledClassesWithCompletion:", v4);

}

- (void)personsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "instructorsInClassWithObjectID:completion:", v7, v6);
  else
    objc_msgSend(v9, "studentsInClassWithObjectID:completion:", v7, v6);

}

- (void)trustedPersonsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "studentsInClassWithObjectID:completion:", v7, v6);
  else
    objc_msgSend(v9, "instructorsInClassWithObjectID:completion:", v7, v6);

}

- (void)executeQuery:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:", v4);

}

- (void)addPerson:(id)a3 toClass:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "addInstructor:toClass:", v7, v6);
  else
    objc_msgSend(v9, "addStudent:toClass:", v7, v6);

}

- (void)removePerson:(id)a3 fromClass:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "removeInstructor:fromClass:", v7, v6);
  else
    objc_msgSend(v9, "removeStudent:fromClass:", v7, v6);

}

- (void)addTrustedPerson:(id)a3 toClass:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "addStudent:toClass:", v7, v6);
  else
    objc_msgSend(v9, "addInstructor:toClass:", v7, v6);

}

- (void)removeTrustedPerson:(id)a3 fromClass:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKConcreteClassKitRosterRequirements isForInstructor](self, "isForInstructor");
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "removeStudent:fromClass:", v7, v6);
  else
    objc_msgSend(v9, "removeInstructor:fromClass:", v7, v6);

}

- (id)makeStudentQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "makeStudentQueryForSearchString:locationIDs:sortingGivenNameFirst:pageSize:", v11, v10, v7, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)makeInstructorQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "makeInstructorQueryForSearchString:locationIDs:sortingGivenNameFirst:pageSize:", v11, v10, v7, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)makeQueryForPersonsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeQueryForPersonsWithIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)makeQueryForLocationsAllowingEasyStudentSignInForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeQueryForLocationsAllowingEasyStudentSignInForPersonID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)makeClassWithLocationID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeClassWithLocationID:name:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)saveClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveClass:completion:", v7, v6);

}

- (void)removeClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeClass:completion:", v7, v6);

}

- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationsWithManagePermissionsForUserWithObjectID:completion:", v7, v6);

}

- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKConcreteClassKitRosterRequirements classKitFacade](self, "classKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationsWithObjectIDs:completion:", v7, v6);

}

- (CRKClassKitFacade)classKitFacade
{
  return self->_classKitFacade;
}

- (BOOL)isForInstructor
{
  return self->_forInstructor;
}

- (CRKCancelable)membershipDidChangeSubscription
{
  return self->_membershipDidChangeSubscription;
}

- (void)setMembershipDidChangeSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_membershipDidChangeSubscription, a3);
}

- (CRKCancelable)userDidChangeSubscription
{
  return self->_userDidChangeSubscription;
}

- (void)setUserDidChangeSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_userDidChangeSubscription, a3);
}

- (NSArray)dataObservers
{
  return self->_dataObservers;
}

- (NSMutableDictionary)generalObserversByToken
{
  return self->_generalObserversByToken;
}

- (NSMutableDictionary)personObserversByToken
{
  return self->_personObserversByToken;
}

- (BOOL)generalObserverConstituentsRegistered
{
  return self->_generalObserverConstituentsRegistered;
}

- (void)setGeneralObserverConstituentsRegistered:(BOOL)a3
{
  self->_generalObserverConstituentsRegistered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personObserversByToken, 0);
  objc_storeStrong((id *)&self->_generalObserversByToken, 0);
  objc_storeStrong((id *)&self->_dataObservers, 0);
  objc_storeStrong((id *)&self->_userDidChangeSubscription, 0);
  objc_storeStrong((id *)&self->_membershipDidChangeSubscription, 0);
  objc_storeStrong((id *)&self->_classKitFacade, 0);
}

- (void)makeDataObservers
{
  OUTLINED_FUNCTION_0_4(&dword_218C99000, a1, a3, "Class observer is nil", a5, a6, a7, a8, 0);
}

@end
