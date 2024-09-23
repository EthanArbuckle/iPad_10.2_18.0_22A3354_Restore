@implementation CRKDataSeparationBlockingClassKitFacade

- (void)dealloc
{
  objc_super v3;

  -[CRKDataSeparationBlockingClassKitFacade stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)CRKDataSeparationBlockingClassKitFacade;
  -[CRKDataSeparationBlockingClassKitFacade dealloc](&v3, sel_dealloc);
}

- (CRKDataSeparationBlockingClassKitFacade)initWithClassKitFacade:(id)a3
{
  id v4;
  CRKDataSeparationBlockingClassKitFacade *v5;
  CRKClassKitCurrentUserProvider *v6;
  CRKClassKitCurrentUserProvider *currentUserProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKDataSeparationBlockingClassKitFacade;
  v5 = -[CRKClassKitFacadeDecoratorBase initWithClassKitFacade:](&v9, sel_initWithClassKitFacade_, v4);
  if (v5)
  {
    v6 = -[CRKClassKitCurrentUserProvider initWithClassKitFacade:]([CRKClassKitCurrentUserProvider alloc], "initWithClassKitFacade:", v4);
    currentUserProvider = v5->_currentUserProvider;
    v5->_currentUserProvider = v6;

    -[CRKDataSeparationBlockingClassKitFacade startObserving](v5, "startObserving");
    -[CRKDataSeparationBlockingClassKitFacade updateAccountState](v5, "updateAccountState");
  }

  return v5;
}

+ (id)observedKeyPathsOnCurrentUserProvider
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("currentUser"), CFSTR("currentUserFetched"), 0);
}

- (void)startObserving
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend((id)objc_opt_class(), "observedKeyPathsOnCurrentUserProvider", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[CRKDataSeparationBlockingClassKitFacade currentUserProvider](self, "currentUserProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, v8, 0, CFSTR("CRKDataSeparationBlockingClassKitFacadeObservationContext"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("accountState"), 0, CFSTR("CRKDataSeparationBlockingClassKitFacadeObservationContext"));

}

- (void)stopObserving
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend((id)objc_opt_class(), "observedKeyPathsOnCurrentUserProvider", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[CRKDataSeparationBlockingClassKitFacade currentUserProvider](self, "currentUserProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, v8, CFSTR("CRKDataSeparationBlockingClassKitFacadeObservationContext"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:forKeyPath:context:", self, CFSTR("accountState"), CFSTR("CRKDataSeparationBlockingClassKitFacadeObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("CRKDataSeparationBlockingClassKitFacadeObservationContext"))
  {
    -[CRKDataSeparationBlockingClassKitFacade updateAccountState](self, "updateAccountState", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKDataSeparationBlockingClassKitFacade;
    -[CRKDataSeparationBlockingClassKitFacade observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)updateAccountState
{
  int64_t v3;

  v3 = -[CRKDataSeparationBlockingClassKitFacade nextAccountState](self, "nextAccountState");
  if (-[CRKDataSeparationBlockingClassKitFacade modifiedAccountState](self, "modifiedAccountState") != v3)
    -[CRKDataSeparationBlockingClassKitFacade setModifiedAccountState:](self, "setModifiedAccountState:", v3);
}

- (int64_t)nextAccountState
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accountState");

  if (v4 == 2)
  {
    -[CRKDataSeparationBlockingClassKitFacade currentUserProvider](self, "currentUserProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasDataSeparatedAccount");

    if (v7)
    {
      if (_CRKLogASM_onceToken_12 != -1)
        dispatch_once(&_CRKLogASM_onceToken_12, &__block_literal_global_29);
      v8 = (void *)_CRKLogASM_logObj_12;
      if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_12, OS_LOG_TYPE_ERROR))
        -[CRKDataSeparationBlockingClassKitFacade nextAccountState].cold.1(v8);
      return 0;
    }
    else
    {
      return 2;
    }
  }
  return v4;
}

+ (id)keyPathsForValuesAffectingAccountState
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("modifiedAccountState"));
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (int64_t)modifiedAccountState
{
  return self->_modifiedAccountState;
}

- (void)setModifiedAccountState:(int64_t)a3
{
  self->_modifiedAccountState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserProvider, 0);
}

- (void)nextAccountState
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = 138543362;
  v3 = objc_opt_class();
  _os_log_error_impl(&dword_218C99000, v1, OS_LOG_TYPE_ERROR, "%{public}@: overriding account state to ineligible because the current user is data separated", (uint8_t *)&v2, 0xCu);

}

@end
