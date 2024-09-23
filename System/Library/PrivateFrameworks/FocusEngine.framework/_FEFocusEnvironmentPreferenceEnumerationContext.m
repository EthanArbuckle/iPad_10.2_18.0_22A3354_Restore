@implementation _FEFocusEnvironmentPreferenceEnumerationContext

- (_FEFocusEnvironmentPreferenceEnumerationContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 74, CFSTR("-init is not a valid initializer for this class. Use -initWithFocusEnvironment:enumerationMode: instead."));

  return 0;
}

- (_FEFocusEnvironmentPreferenceEnumerationContext)initWithFocusEnvironment:(id)a3 enumerationMode:(int64_t)a4
{
  id v7;
  _FEFocusEnvironmentPreferenceEnumerationContext *v8;
  void *v9;
  id v10;
  id v11;
  _FEFocusEnvironment *preferredSubtree;
  id v13;
  uint64_t v14;
  _FEFocusSystem *focusSystem;
  uint64_t v16;
  NSMutableArray *visitedEnvironmentStack;
  uint64_t v18;
  NSHashTable *allVisitedEnvironments;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  objc_super v31;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusEnvironment"));

  }
  v31.receiver = self;
  v31.super_class = (Class)_FEFocusEnvironmentPreferenceEnumerationContext;
  v8 = -[_FEFocusEnvironmentPreferenceEnumerationContext init](&v31, sel_init);
  if (v8)
  {
    if (a4)
    {
      v9 = (void *)objc_opt_new();
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__0;
      v29 = __Block_byref_object_dispose__0;
      v30 = 0;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __92___FEFocusEnvironmentPreferenceEnumerationContext_initWithFocusEnvironment_enumerationMode___block_invoke;
      v22[3] = &unk_250D3A0E8;
      v10 = v9;
      v23 = v10;
      v24 = &v25;
      _FEFocusEnvironmentEnumerateAncestorEnvironments(v7, v22);
      objc_storeStrong((id *)&v8->_preferredEnvironmentsMap, v9);
      v11 = (id)v26[5];
      if (v11 && v11 != v7)
      {
        preferredSubtree = v8->_preferredSubtree;
        v8->_preferredSubtree = (_FEFocusEnvironment *)v7;
        v13 = v7;

        v7 = (id)v26[5];
      }

      _Block_object_dispose(&v25, 8);
    }
    objc_storeStrong((id *)&v8->_environment, v7);
    +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    focusSystem = v8->_focusSystem;
    v8->_focusSystem = (_FEFocusSystem *)v14;

    objc_storeStrong((id *)&v8->_lastPrimaryPreferredEnvironment, v7);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v7, 0);
    visitedEnvironmentStack = v8->_visitedEnvironmentStack;
    v8->_visitedEnvironmentStack = (NSMutableArray *)v16;

    v8->_hasNeverPoppedInPreferredSubtree = 1;
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v18 = objc_claimAutoreleasedReturnValue();
    allVisitedEnvironments = v8->_allVisitedEnvironments;
    v8->_allVisitedEnvironments = (NSHashTable *)v18;

    -[NSHashTable addObject:](v8->_allVisitedEnvironments, "addObject:", v7);
  }

  return v8;
}

- (BOOL)isPrimaryPreference
{
  return self->_environment == self->_lastPrimaryPreferredEnvironment;
}

- (BOOL)isLeafPreference
{
  void *v2;
  BOOL v3;

  -[_FEFocusEnvironmentPreferenceEnumerationContext preferredEnvironments](self, "preferredEnvironments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)isPreferredByItself
{
  _FEFocusEnvironment *environment;
  _FEFocusEnvironment *v3;

  environment = self->_environment;
  -[_FEFocusEnvironmentPreferenceEnumerationContext preferringEnvironment](self, "preferringEnvironment");
  v3 = (_FEFocusEnvironment *)objc_claimAutoreleasedReturnValue();
  LOBYTE(environment) = environment == v3;

  return (char)environment;
}

- (_FEFocusEnvironment)preferringEnvironment
{
  NSMutableArray *v2;
  unint64_t v3;
  void *v4;

  v2 = self->_visitedEnvironmentStack;
  v3 = -[NSMutableArray count](v2, "count");
  if (v3 < 2)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](v2, "objectAtIndex:", v3 - 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (_FEFocusEnvironment *)v4;
}

- (BOOL)isInPreferredSubtree
{
  return !self->_preferredSubtree || self->_preferredSubtreeEntryPoint != 0;
}

- (NSArray)preferredEnvironments
{
  if (!self->_hasResolvedPreferredFocusEnvironments)
    -[_FEFocusEnvironmentPreferenceEnumerationContext _resolvePreferredFocusEnvironments](self, "_resolvePreferredFocusEnvironments");
  return self->_cachedPreferredEnvironments;
}

- (BOOL)prefersNothingFocused
{
  return 0;
}

- (void)_invalidatePreferredEnvironments
{
  NSArray *cachedPreferredEnvironments;

  cachedPreferredEnvironments = self->_cachedPreferredEnvironments;
  self->_cachedPreferredEnvironments = 0;

  self->_cachedPrefersNothingFocused = 0;
  self->_hasResolvedPreferredFocusEnvironments = 0;
}

- (void)_resolvePreferredFocusEnvironments
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _FEFocusEnvironment *v9;
  void *v10;
  void *v11;
  void *v12;
  _FEFocusEnvironment *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  NSArray *v23;
  NSArray *cachedPreferredEnvironments;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  BOOL v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (-[_FEFocusEnvironmentPreferenceEnumerationContext isPreferredByItself](self, "isPreferredByItself"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = WeakRetained;
    if (WeakRetained
      && !objc_msgSend(WeakRetained, "_shouldInferDefaultPreferenceForEnvironmentInContext:", self))
    {
      v5 = 0;
    }
    else
    {
      -[_FEFocusEnvironmentPreferenceEnumerationContext _inferPreferencesForEnvironment:](self, "_inferPreferencesForEnvironment:", self->_environment);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v5)
      v15 = v5;
    else
      v15 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&self->_cachedPreferredEnvironments, v15);
    self->_cachedPrefersNothingFocused = 0;

  }
  else
  {
    v29 = 0;
    -[NSMapTable objectForKey:](self->_preferredEnvironmentsMap, "objectForKey:", self->_environment);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!v7)
    {
      _FEFocusEnvironmentEffectivePreferredFocusEnvironments(self->_environment, &v29);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "mutableCopy");

    }
    if (-[NSMutableArray count](self->_visitedEnvironmentStack, "count") == 1)
    {
      v9 = self->_environment;
      +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_topEnvironment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = 0;
      if (v11 && v11 != v10)
      {
        if (!_FEFocusEnvironmentIsAncestorOfEnvironment(v9, v11)
          || (objc_msgSend(v10, "focusedItem"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v14 == v12))
        {
          v13 = 0;
        }
        else
        {
          v13 = v12;
        }
      }

      if (v13
        && v13 != self->_environment
        && -[_FEFocusEnvironmentPreferenceEnumerationContext _isAllowedToPreferEnvironment:](self, "_isAllowedToPreferEnvironment:", v13))
      {
        objc_msgSend(v7, "insertObject:atIndex:", v13, 0);
      }

    }
    if (self->_preferredSubtree && -[NSMutableArray count](self->_visitedEnvironmentStack, "count") == 1)
      objc_msgSend(v7, "addObject:", self->_preferredSubtree);
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (-[_FEFocusEnvironmentPreferenceEnumerationContext _isAllowedToPreferEnvironment:](self, "_isAllowedToPreferEnvironment:", v22, (_QWORD)v25))
          {
            objc_msgSend(v16, "addObject:", v22);
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v19);
    }

    v23 = (NSArray *)objc_msgSend(v16, "copy");
    cachedPreferredEnvironments = self->_cachedPreferredEnvironments;
    self->_cachedPreferredEnvironments = v23;

    self->_cachedPrefersNothingFocused = v29;
  }
  self->_hasResolvedPreferredFocusEnvironments = 1;
}

- (id)_inferPreferencesForEnvironment:(id)a3
{
  id v4;
  _FEFocusSystem *v5;
  void *v6;
  _FEFocusMap *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_focusSystem;
  if (v5)
  {
    _FEFocusEnvironmentPreferredFocusMapContainer(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v10 = (void *)MEMORY[0x24BDBD1A8];
LABEL_12:

      goto LABEL_13;
    }
    v7 = -[_FEFocusMap initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:]([_FEFocusMap alloc], "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", v5, v6, 0, 0, 0);
    -[_FEFocusMap _inferredDefaultFocusItemInEnvironment:](v7, "_inferredDefaultFocusItemInEnvironment:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      if ((id)v8 != v4
        && -[_FEFocusEnvironmentPreferenceEnumerationContext _isAllowedToPreferEnvironment:](self, "_isAllowedToPreferEnvironment:", v8))
      {
        -[_FEFocusEnvironmentPreferenceEnumerationContext _reportInferredPreferredFocusEnvironment:](self, "_reportInferredPreferredFocusEnvironment:", v9);
        v12[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      -[_FEFocusEnvironmentPreferenceEnumerationContext _reportInferredPreferredFocusEnvironment:](self, "_reportInferredPreferredFocusEnvironment:", 0);
    }
    v10 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_11;
  }
  v10 = (void *)MEMORY[0x24BDBD1A8];
LABEL_13:

  return v10;
}

- (BOOL)_isAllowedToPreferEnvironment:(id)a3
{
  _FEFocusEnvironment *v4;
  NSObject *v5;
  _FEFocusEnvironment *environment;
  __CFString *v8;
  void *v9;
  _FEFocusEnvironment *v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  _FEFocusEnvironment *v14;
  __CFString *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  NSMutableArray *visitedEnvironmentStack;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  NSMutableArray *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (_FEFocusEnvironment *)a3;
  if (self->_environment == v4)
  {
    LODWORD(v5) = !-[_FEFocusEnvironmentPreferenceEnumerationContext isPreferredByItself](self, "isPreferredByItself");
  }
  else if (-[NSMutableArray containsObject:](self->_visitedEnvironmentStack, "containsObject:", v4))
  {
    logger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      environment = self->_environment;
      if (environment)
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
        v10 = environment;
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v10);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = CFSTR("(nil)");
      }
      v13 = v8;
      v14 = v4;
      if (v14)
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v14);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = CFSTR("(nil)");
      }

      visitedEnvironmentStack = self->_visitedEnvironmentStack;
      *(_DWORD *)buf = 138412802;
      v21 = v13;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = visitedEnvironmentStack;
      _os_log_error_impl(&dword_23C48C000, v5, OS_LOG_TYPE_ERROR, "Loop in preferred focus environment chain. %@ prefers %@, which is already on the stack: %@", buf, 0x20u);

    }
    LOBYTE(v5) = 0;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return (char)v5;
}

- (void)pushEnvironment:(id)a3
{
  _FEFocusEnvironment *v6;
  _FEFocusEnvironment *preferredSubtree;
  _FEFocusEnvironment *v8;
  _FEFocusEnvironment *v9;
  _FEFocusEnvironment *v10;
  _FEFocusEnvironment *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  _FEFocusEnvironment *v18;

  v6 = (_FEFocusEnvironment *)a3;
  v18 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 352, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

    v6 = 0;
  }
  if (self->_environment != v6)
  {
    objc_storeStrong((id *)&self->_environment, a3);
    if (self->_hasNeverPoppedInPreferredSubtree)
      objc_storeStrong((id *)&self->_lastPrimaryPreferredEnvironment, a3);
    preferredSubtree = self->_preferredSubtree;
    v6 = v18;
    if (preferredSubtree)
    {
      if (!self->_preferredSubtreeEntryPoint)
      {
        _FEFocusEnvironmentFirstCommonAncestor(preferredSubtree, v18);
        v8 = (_FEFocusEnvironment *)objc_claimAutoreleasedReturnValue();
        v9 = self->_preferredSubtree;

        v6 = v18;
        if (v8 == v9)
        {
          objc_storeStrong((id *)&self->_preferredSubtreeEntryPoint, a3);
          v6 = v18;
        }
      }
    }
  }
  if (self->_debugStack)
  {
    -[NSMutableArray lastObject](self->_visitedEnvironmentStack, "lastObject");
    v10 = (_FEFocusEnvironment *)objc_claimAutoreleasedReturnValue();

    v6 = v18;
    if (v10 != v18)
    {
      v11 = v18;
      if (v18)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = CFSTR("(nil)");
      }

      +[_FEDebugLogMessage messageWithString:](_FEDebugLogNode, "messageWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[_FEDebugLogStack pushNode:](self->_debugStack, "pushNode:", v16);
      v6 = v18;
    }
  }
  -[NSMutableArray addObject:](self->_visitedEnvironmentStack, "addObject:", v6);
  -[NSHashTable addObject:](self->_allVisitedEnvironments, "addObject:", v18);
  -[_FEFocusEnvironmentPreferenceEnumerationContext _invalidatePreferredEnvironments](self, "_invalidatePreferredEnvironments");

}

- (void)popEnvironment
{
  _FEFocusEnvironment *v3;
  id v4;
  _FEFocusEnvironment *v5;
  _FEFocusEnvironment *environment;
  _FEFocusEnvironment *v7;
  _FEFocusEnvironment *v8;

  if (-[NSMutableArray count](self->_visitedEnvironmentStack, "count") != 1)
  {
    -[NSMutableArray lastObject](self->_visitedEnvironmentStack, "lastObject");
    v8 = (_FEFocusEnvironment *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_visitedEnvironmentStack, "removeLastObject");
    -[NSMutableArray lastObject](self->_visitedEnvironmentStack, "lastObject");
    v3 = (_FEFocusEnvironment *)objc_claimAutoreleasedReturnValue();

    if (v3 != v8)
      v4 = -[_FEDebugLogStack popNode](self->_debugStack, "popNode");
    -[NSMutableArray lastObject](self->_visitedEnvironmentStack, "lastObject");
    v5 = (_FEFocusEnvironment *)objc_claimAutoreleasedReturnValue();
    environment = self->_environment;
    self->_environment = v5;

    -[_FEFocusEnvironmentPreferenceEnumerationContext _invalidatePreferredEnvironments](self, "_invalidatePreferredEnvironments");
    if (-[_FEFocusEnvironmentPreferenceEnumerationContext isInPreferredSubtree](self, "isInPreferredSubtree"))
      self->_hasNeverPoppedInPreferredSubtree = 0;
    v7 = v8;
    if (self->_preferredSubtree)
    {
      if (self->_preferredSubtreeEntryPoint == v8)
      {
        self->_preferredSubtreeEntryPoint = 0;

        v7 = v8;
      }
    }

  }
}

- (id)_startLogging
{
  _FEDebugLogStack *v3;
  _FEDebugLogStack *debugStack;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (self->_debugStack)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 419, CFSTR("Logging already in progress. Starting to log again would cause an undefined state."));

  }
  v3 = (_FEDebugLogStack *)objc_opt_new();
  debugStack = self->_debugStack;
  self->_debugStack = v3;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_visitedEnvironmentStack;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        if (v10)
        {
          v11 = (void *)MEMORY[0x24BDD17C8];
          v12 = v10;
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v12, (_QWORD)v20);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v15 = CFSTR("(nil)");
        }
        +[_FEDebugLogMessage messageWithString:](_FEDebugLogNode, "messageWithString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[_FEDebugLogStack pushNode:](self->_debugStack, "pushNode:", v16);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  -[_FEDebugLogStack rootNode](self->_debugStack, "rootNode");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_stopLogging
{
  _FEDebugLogStack *debugStack;

  debugStack = self->_debugStack;
  self->_debugStack = 0;

}

- (void)_reportInferredPreferredFocusEnvironment:(id)a3
{
  id v4;
  _FEDebugLogStack *debugStack;
  void *v6;
  _FEDebugLogStack *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  debugStack = self->_debugStack;
  if (debugStack)
  {
    v14 = v4;
    +[_FEDebugLogMessage messageWithString:](_FEDebugLogMessage, "messageWithString:", CFSTR("No more preferred environments. Trying to infer environment from visual layout..."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEDebugLogStack addMessage:](debugStack, "addMessage:", v6);

    v7 = self->_debugStack;
    if (v14)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      v9 = v14;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[_FEDebugLogMessage messageWithFormat:](_FEDebugLogMessage, "messageWithFormat:", CFSTR("Found environment: %@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_FEDebugLogStack addMessage:](v7, "addMessage:", v13);

    }
    else
    {
      +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 3, CFSTR("No focusable items found."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_FEDebugLogStack addMessage:](v7, "addMessage:", v12);
    }

    v4 = v14;
  }

}

- (_FEFocusEnvironment)environment
{
  return self->_environment;
}

- (_FEFocusEnvironmentPreferenceEnumerationContextDelegate)delegate
{
  return (_FEFocusEnvironmentPreferenceEnumerationContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_FEDebugLogStack)debugStack
{
  return self->_debugStack;
}

- (void)setDebugStack:(id)a3
{
  objc_storeStrong((id *)&self->_debugStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugStack, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_preferredEnvironmentsMap, 0);
  objc_storeStrong((id *)&self->_preferredSubtreeEntryPoint, 0);
  objc_storeStrong((id *)&self->_allVisitedEnvironments, 0);
  objc_storeStrong((id *)&self->_cachedPreferredEnvironments, 0);
  objc_storeStrong((id *)&self->_lastPrimaryPreferredEnvironment, 0);
  objc_storeStrong((id *)&self->_visitedEnvironmentStack, 0);
  objc_storeStrong((id *)&self->_preferredSubtree, 0);
  objc_storeStrong((id *)&self->_focusSystem, 0);
}

@end
