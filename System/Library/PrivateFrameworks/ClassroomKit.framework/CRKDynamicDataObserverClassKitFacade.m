@implementation CRKDynamicDataObserverClassKitFacade

- (void)dealloc
{
  objc_super v3;

  -[CRKDynamicDataObserverClassKitFacade stopObservingCurrentUser](self, "stopObservingCurrentUser");
  -[CRKDynamicDataObserverClassKitFacade deregisterDataObservers](self, "deregisterDataObservers");
  v3.receiver = self;
  v3.super_class = (Class)CRKDynamicDataObserverClassKitFacade;
  -[CRKDynamicDataObserverClassKitFacade dealloc](&v3, sel_dealloc);
}

+ (id)dynamicDataObserverFacadeWithClassKitFacade:(id)a3 expectedUserRole:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithClassKitFacade:expectedUserRole:", v5, a4);

  objc_msgSend(v6, "startObservingCurrentUser");
  return v6;
}

- (CRKDynamicDataObserverClassKitFacade)initWithClassKitFacade:(id)a3 expectedUserRole:(int64_t)a4
{
  id v6;
  CRKDynamicDataObserverClassKitFacade *v7;
  CRKDynamicDataObserverClassKitFacade *v8;
  uint64_t v9;
  NSMutableArray *dataObservers;
  CRKClassKitCurrentUserProvider *v11;
  CRKClassKitCurrentUserProvider *currentUserProvider;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRKDynamicDataObserverClassKitFacade;
  v7 = -[CRKClassKitFacadeDecoratorBase initWithClassKitFacade:](&v14, sel_initWithClassKitFacade_, v6);
  v8 = v7;
  if (v7)
  {
    v7->_expectedUserRole = a4;
    v9 = objc_opt_new();
    dataObservers = v8->_dataObservers;
    v8->_dataObservers = (NSMutableArray *)v9;

    v11 = -[CRKClassKitCurrentUserProvider initWithClassKitFacade:]([CRKClassKitCurrentUserProvider alloc], "initWithClassKitFacade:", v6);
    currentUserProvider = v8->_currentUserProvider;
    v8->_currentUserProvider = v11;

  }
  return v8;
}

- (void)updateCurrentUserState
{
  void *v3;
  int v4;
  id v5;

  -[CRKDynamicDataObserverClassKitFacade currentUserProvider](self, "currentUserProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (-[CRKDynamicDataObserverClassKitFacade expectedUserRole](self, "expectedUserRole") == 1
    && (objc_msgSend(v5, "isStudent") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (-[CRKDynamicDataObserverClassKitFacade expectedUserRole](self, "expectedUserRole") != 2)
    {
      objc_msgSend(v5, "hasEDUAccount");
LABEL_10:
      -[CRKDynamicDataObserverClassKitFacade deregisterDataObservers](self, "deregisterDataObservers");
      goto LABEL_11;
    }
    v4 = objc_msgSend(v5, "isInstructor");
  }
  if (!objc_msgSend(v5, "hasEDUAccount") || !v4)
    goto LABEL_10;
  -[CRKDynamicDataObserverClassKitFacade registerDataObservers](self, "registerDataObservers");
LABEL_11:

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
  if (!-[CRKDynamicDataObserverClassKitFacade dataObserversAreRegistered](self, "dataObserversAreRegistered"))
  {
    -[CRKDynamicDataObserverClassKitFacade setDataObserversAreRegistered:](self, "setDataObserversAreRegistered:", 1);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[CRKDynamicDataObserverClassKitFacade dataObservers](self, "dataObservers", 0);
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
          -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
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
}

- (void)deregisterDataObservers
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
  if (-[CRKDynamicDataObserverClassKitFacade dataObserversAreRegistered](self, "dataObserversAreRegistered"))
  {
    -[CRKDynamicDataObserverClassKitFacade setDataObserversAreRegistered:](self, "setDataObserversAreRegistered:", 0);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[CRKDynamicDataObserverClassKitFacade dataObservers](self, "dataObservers", 0);
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
          -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deregisterDataObserver:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (void)addDataObserver:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKDynamicDataObserverClassKitFacade.m"), 100, CFSTR("%@ must be called from the main thread"), v8);

  }
  -[CRKDynamicDataObserverClassKitFacade dataObservers](self, "dataObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  if (-[CRKDynamicDataObserverClassKitFacade dataObserversAreRegistered](self, "dataObserversAreRegistered"))
  {
    -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerDataObserver:", v9);

  }
}

- (void)removeDataObserver:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKDynamicDataObserverClassKitFacade.m"), 110, CFSTR("%@ must be called from the main thread"), v8);

  }
  -[CRKDynamicDataObserverClassKitFacade dataObservers](self, "dataObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v9);

  if (-[CRKDynamicDataObserverClassKitFacade dataObserversAreRegistered](self, "dataObserversAreRegistered"))
  {
    -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deregisterDataObserver:", v9);

  }
}

- (void)startObservingCurrentUser
{
  id v3;

  -[CRKDynamicDataObserverClassKitFacade currentUserProvider](self, "currentUserProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("currentUser"), 4, CFSTR("ObservationContext"));

}

- (void)stopObservingCurrentUser
{
  id v3;

  -[CRKDynamicDataObserverClassKitFacade currentUserProvider](self, "currentUserProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("currentUser"), CFSTR("ObservationContext"));

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
    -[CRKDynamicDataObserverClassKitFacade updateCurrentUserState](self, "updateCurrentUserState", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKDynamicDataObserverClassKitFacade;
    -[CRKDynamicDataObserverClassKitFacade observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (int64_t)expectedUserRole
{
  return self->_expectedUserRole;
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (BOOL)dataObserversAreRegistered
{
  return self->_dataObserversAreRegistered;
}

- (void)setDataObserversAreRegistered:(BOOL)a3
{
  self->_dataObserversAreRegistered = a3;
}

- (NSMutableArray)dataObservers
{
  return self->_dataObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataObservers, 0);
  objc_storeStrong((id *)&self->_currentUserProvider, 0);
}

@end
