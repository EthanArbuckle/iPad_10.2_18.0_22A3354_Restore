@implementation INUICKPSynchronousRemoteViewControllerAllocator

- (INUICKPSynchronousRemoteViewControllerAllocator)init
{
  INUICKPSynchronousRemoteViewControllerAllocator *v2;
  NSMutableArray *v3;
  NSMutableArray *mutableSynchronousRemoteViewControllers;
  NSMutableArray *v5;
  NSMutableArray *finalInterfaceSections;
  NSMutableSet *v7;
  NSMutableSet *handledParameters;
  NSMutableDictionary *v9;
  NSMutableDictionary *mutableSynchronousRemoteViewControllersByInitialInterfaceSection;
  NSMutableArray *v11;
  NSMutableArray *mutableRedundantInterfaceSections;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)INUICKPSynchronousRemoteViewControllerAllocator;
  v2 = -[INUICKPSynchronousRemoteViewControllerAllocator init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableSynchronousRemoteViewControllers = v2->_mutableSynchronousRemoteViewControllers;
    v2->_mutableSynchronousRemoteViewControllers = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    finalInterfaceSections = v2->_finalInterfaceSections;
    v2->_finalInterfaceSections = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    handledParameters = v2->_handledParameters;
    v2->_handledParameters = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mutableSynchronousRemoteViewControllersByInitialInterfaceSection = v2->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection;
    v2->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableRedundantInterfaceSections = v2->_mutableRedundantInterfaceSections;
    v2->_mutableRedundantInterfaceSections = v11;

    v2->_synchronousRemoteViewControllerClass = (Class)objc_opt_class();
    v2->_requiresUserConsent = 1;
  }
  return v2;
}

- (void)setSynchronousRemoteViewControllerClass:(Class)a3
{
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    self->_synchronousRemoteViewControllerClass = a3;
}

- (void)performAllocationsFromInteraction:(id)a3 initialInterfaceSections:(id)a4 completion:(id)a5
{
  id v8;
  NSMutableArray *mutableSynchronousRemoteViewControllers;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  mutableSynchronousRemoteViewControllers = self->_mutableSynchronousRemoteViewControllers;
  v10 = a4;
  v11 = a3;
  -[NSMutableArray removeAllObjects](mutableSynchronousRemoteViewControllers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_mutableRedundantInterfaceSections, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_finalInterfaceSections, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_handledParameters, "removeAllObjects");
  -[INUICKPSynchronousRemoteViewControllerAllocator setInteraction:](self, "setInteraction:", v11);

  v12 = (void *)objc_msgSend(v10, "mutableCopy");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __121__INUICKPSynchronousRemoteViewControllerAllocator_performAllocationsFromInteraction_initialInterfaceSections_completion___block_invoke;
  v14[3] = &unk_24EB4F328;
  v15 = v8;
  v13 = v8;
  -[INUICKPSynchronousRemoteViewControllerAllocator _beginRecursivelyConnectingForInterfaceSectionQueue:completion:](self, "_beginRecursivelyConnectingForInterfaceSectionQueue:completion:", v12, v14);

}

uint64_t __121__INUICKPSynchronousRemoteViewControllerAllocator_performAllocationsFromInteraction_initialInterfaceSections_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (NSArray)allocatedViewControllers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableSynchronousRemoteViewControllers, "copy");
}

- (NSDictionary)viewControllersByInitialInterfaceSection
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection, "copy");
}

- (NSArray)redundantInterfaceSections
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableRedundantInterfaceSections, "copy");
}

- (void)_beginRecursivelyConnectingForInterfaceSectionQueue:(id)a3 completion:(id)a4
{
  -[INUICKPSynchronousRemoteViewControllerAllocator _recursivelyConnectForInterfaceSectionQueue:recursionDepth:completion:](self, "_recursivelyConnectForInterfaceSectionQueue:recursionDepth:completion:", a3, 0, a4);
}

- (void)_recursivelyConnectForInterfaceSectionQueue:(id)a3 recursionDepth:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(void);
  void *v15;
  id v16;
  void (**v17)(void);
  NSObject *v18;
  _BOOL4 v19;
  void (**v20)(void);
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  BOOL v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void (**v35)(void);
  _QWORD v36[4];
  id v37;
  id v38;
  INUICKPSynchronousRemoteViewControllerAllocator *v39;
  id v40;
  void (**v41)(void);
  id v42;
  id location;
  _QWORD v44[4];
  id v45;
  INUICKPSynchronousRemoteViewControllerAllocator *v46;
  void (**v47)(void);
  unint64_t v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v35 = (void (**)(void))a5;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "removeObject:", v9);
    objc_msgSend(v9, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[INUICKPSynchronousRemoteViewControllerAllocator _unhandledParametersForInterfaceSection:](self, "_unhandledParametersForInterfaceSection:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke;
    v44[3] = &unk_24EB4F350;
    v45 = v8;
    v46 = self;
    v48 = a4;
    v14 = v35;
    v47 = v14;
    v15 = (void *)MEMORY[0x22767AA30](v44);
    objc_initWeak(&location, self);
    v36[0] = v13;
    v36[1] = 3221225472;
    v36[2] = __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_2;
    v36[3] = &unk_24EB4F3A0;
    objc_copyWeak(&v42, &location);
    v33 = v11;
    v37 = v33;
    v16 = v9;
    v38 = v16;
    v39 = self;
    v34 = v15;
    v40 = v34;
    v41 = v14;
    v17 = (void (**)(void))MEMORY[0x22767AA30](v36);
    if (objc_msgSend(v16, "isWildCardSection"))
    {
      v18 = *MEMORY[0x24BE15490];
      v19 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO);
      v20 = v17;
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        v50 = v16;
        v21 = "Interface section %@ is a \"wild\" card section; attempting connection to RVC";
        v22 = v18;
        v23 = 12;
LABEL_17:
        _os_log_impl(&dword_222C18000, v22, OS_LOG_TYPE_INFO, v21, buf, v23);
        v20 = v17;
      }
    }
    else
    {
      if (a4)
        v24 = v12 == 0;
      else
        v24 = 0;
      v25 = !v24;
      if (!v10 || !v25)
      {
        v28 = (id)*MEMORY[0x24BE15490];
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
        if (!v10 || v12)
        {
          if (v29)
          {
            objc_msgSend(v16, "parameters");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v50 = v32;
            v51 = 2112;
            v52 = v16;
            _os_log_impl(&dword_222C18000, v28, OS_LOG_TYPE_INFO, "Interface section has no parameters - continuing\n    Parameters: %@\n    Interface section: %@", buf, 0x16u);

          }
        }
        else
        {
          if (v29)
          {
            objc_msgSend(v16, "parameters");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v50 = v30;
            v51 = 2112;
            v52 = v16;
            _os_log_impl(&dword_222C18000, v28, OS_LOG_TYPE_INFO, "All parameters are currently handled by another interface section - continuing\n    Parameters: %@\n    Interface section: %@", buf, 0x16u);

          }
          -[INUICKPSynchronousRemoteViewControllerAllocator mutableRedundantInterfaceSections](self, "mutableRedundantInterfaceSections");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v16);

        }
        v20 = (void (**)(void))v34;
        goto LABEL_27;
      }
      v26 = *MEMORY[0x24BE15490];
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO);
      v20 = v17;
      if (v27)
      {
        *(_DWORD *)buf = 138412546;
        v50 = v16;
        v51 = 2112;
        v52 = v33;
        v21 = "Still have parameters to handle for interface section %@ - attempting to connect to RVC\n"
              "    Unhandled parameters: %@";
        v22 = v26;
        v23 = 22;
        goto LABEL_17;
      }
    }
LABEL_27:
    v20[2]();

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    goto LABEL_28;
  }
  if (v35)
    v35[2]();
LABEL_28:

}

uint64_t __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    return objc_msgSend(*(id *)(a1 + 40), "_recursivelyConnectForInterfaceSectionQueue:recursionDepth:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v3 = objc_alloc(MEMORY[0x24BDDA4F0]);
    objc_msgSend(WeakRetained, "interaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithInteraction:", v4);

    objc_msgSend(v5, "setRequiresUserConsent:", objc_msgSend(WeakRetained, "requiresUserConsent"));
    v6 = (void *)WeakRetained[1];
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA4F8]), "initWithParameters:interactiveBehavior:hostedViewContext:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "interactiveBehavior"), 0);
    v8 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_3;
    v9[3] = &unk_24EB4F378;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = WeakRetained;
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v6, "requestInstanceWithInfo:configuration:synchronousRemoteViewControllerDelegate:reply:", v5, v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_3_cold_1((uint64_t)v6, a1, v7);
  }
  else
  {
    v8 = *MEMORY[0x24BE15490];
    v9 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        v11 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v19 = 138412802;
        v20 = v10;
        v21 = 2112;
        v22 = v11;
        v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_222C18000, v8, OS_LOG_TYPE_DEFAULT, "Synchronous remote view controller retrieved\n    Interface section: %@\n    Parameters: %@\n    Synchronous remote view controller: %@", (uint8_t *)&v19, 0x20u);
      }
      objc_msgSend(v5, "setInterfaceSectionOrganizer:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 48), "mutableSynchronousRemoteViewControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v5);

      objc_msgSend(v5, "cachedRepresentedParameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyWithZone:", 0);
      objc_msgSend(v14, "setParameters:", v13);
      objc_msgSend(*(id *)(a1 + 48), "handledParameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "unionSet:", v13);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "finalInterfaceSections");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v14);

      }
      objc_msgSend(*(id *)(a1 + 48), "mutableSynchronousRemoteViewControllersByInitialInterfaceSection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

    }
    else if (v9)
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = 138412290;
      v20 = v18;
      _os_log_impl(&dword_222C18000, v8, OS_LOG_TYPE_DEFAULT, "No synchronous remote view controller retrieved\n    Parameters: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)_unhandledParametersForInterfaceSection:(id)a3
{
  id v4;
  NSMutableSet *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v5 = self->_handledParameters;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "parameters", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v12 = v5;
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v21;
          while (2)
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              if ((objc_msgSend(v11, "isSubParameterOf:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16)) & 1) != 0)
              {

                goto LABEL_18;
              }
              ++v16;
            }
            while (v14 != v16);
            v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v14)
              continue;
            break;
          }
        }

        objc_msgSend(v19, "addObject:", v11);
LABEL_18:
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  return v19;
}

- (id)organizedInterfaceSections
{
  return (id)-[NSMutableArray copy](self->_finalInterfaceSections, "copy");
}

- (double)boundingWidthForSynchronousRemoteViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[INUICKPSynchronousRemoteViewControllerAllocator delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingWidthForViewControllerAllocator:", self);
  v6 = v5;

  return v6;
}

- (INUICKPViewControllerAllocatingDelegate)delegate
{
  return (INUICKPViewControllerAllocatingDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (NSMutableArray)mutableSynchronousRemoteViewControllers
{
  return self->_mutableSynchronousRemoteViewControllers;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_interaction, a3);
}

- (NSMutableArray)finalInterfaceSections
{
  return self->_finalInterfaceSections;
}

- (NSMutableSet)handledParameters
{
  return self->_handledParameters;
}

- (NSMutableDictionary)mutableSynchronousRemoteViewControllersByInitialInterfaceSection
{
  return self->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection;
}

- (NSMutableArray)mutableRedundantInterfaceSections
{
  return self->_mutableRedundantInterfaceSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableRedundantInterfaceSections, 0);
  objc_storeStrong((id *)&self->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection, 0);
  objc_storeStrong((id *)&self->_handledParameters, 0);
  objc_storeStrong((id *)&self->_finalInterfaceSections, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_mutableSynchronousRemoteViewControllers, 0);
  objc_destroyWeak((id *)&self->delegate);
}

void __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_222C18000, log, OS_LOG_TYPE_ERROR, "Error retrieving synchronous remote view controller\n    Error: %@\n    Parameters: %@", (uint8_t *)&v4, 0x16u);
}

@end
