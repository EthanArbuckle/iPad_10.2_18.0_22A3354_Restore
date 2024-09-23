@implementation CRKClassKitCurrentUserProvider

- (void)dealloc
{
  objc_super v3;

  -[CRKClassKitCurrentUserProvider stopObservingCurrentUser](self, "stopObservingCurrentUser");
  v3.receiver = self;
  v3.super_class = (Class)CRKClassKitCurrentUserProvider;
  -[CRKClassKitCurrentUserProvider dealloc](&v3, sel_dealloc);
}

- (CRKClassKitCurrentUserProvider)initWithClassKitFacade:(id)a3
{
  id v5;
  CRKClassKitCurrentUserProvider *v6;
  CRKClassKitCurrentUserProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKClassKitCurrentUserProvider;
  v6 = -[CRKClassKitCurrentUserProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classKitFacade, a3);
    -[CRKClassKitCurrentUserProvider startObservingCurrentUser](v7, "startObservingCurrentUser");
    -[CRKClassKitCurrentUserProvider updateCurrentUser](v7, "updateCurrentUser");
  }

  return v7;
}

- (void)startObservingCurrentUser
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

  -[CRKClassKitCurrentUserProvider classKitFacade](self, "classKitFacade");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("accountState"), 3, CFSTR("CRKClassKitCurrentUserProviderObservationContext"));

  objc_initWeak(&location, self);
  -[CRKClassKitCurrentUserProvider classKitFacade](self, "classKitFacade");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __59__CRKClassKitCurrentUserProvider_startObservingCurrentUser__block_invoke;
  v9 = &unk_24D9C7A60;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "subscribeToCurrentUserDidChangeEvents:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitCurrentUserProvider setCurrentUserSubscription:](self, "setCurrentUserSubscription:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __59__CRKClassKitCurrentUserProvider_startObservingCurrentUser__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateCurrentUser");

}

- (void)stopObservingCurrentUser
{
  void *v3;
  void *v4;

  -[CRKClassKitCurrentUserProvider classKitFacade](self, "classKitFacade");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("accountState"), CFSTR("CRKClassKitCurrentUserProviderObservationContext"));

  -[CRKClassKitCurrentUserProvider currentUserSubscription](self, "currentUserSubscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[CRKClassKitCurrentUserProvider setCurrentUserSubscription:](self, "setCurrentUserSubscription:", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  objc_super v16;

  if (a6 == CFSTR("CRKClassKitCurrentUserProviderObservationContext"))
  {
    v11 = a5;
    objc_msgSend(v11, "crk_keyValueObservingOldObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(v11, "crk_keyValueObservingNewObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "integerValue");
    LODWORD(v14) = -[CRKClassKitCurrentUserProvider isSafeToTalkToProgressdWithAccountState:](self, "isSafeToTalkToProgressdWithAccountState:", v13);
    if ((_DWORD)v14 != -[CRKClassKitCurrentUserProvider isSafeToTalkToProgressdWithAccountState:](self, "isSafeToTalkToProgressdWithAccountState:", v15))-[CRKClassKitCurrentUserProvider updateCurrentUser](self, "updateCurrentUser");
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CRKClassKitCurrentUserProvider;
    v10 = a5;
    -[CRKClassKitCurrentUserProvider observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);

  }
}

- (void)updateCurrentUser
{
  void *v3;
  _QWORD v4[4];
  id v5[2];
  id location;

  -[CRKClassKitCurrentUserProvider setSequenceNumber:](self, "setSequenceNumber:", -[CRKClassKitCurrentUserProvider sequenceNumber](self, "sequenceNumber") + 1);
  v3 = -[CRKClassKitCurrentUserProvider sequenceNumber](self, "sequenceNumber");
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__CRKClassKitCurrentUserProvider_updateCurrentUser__block_invoke;
  v4[3] = &unk_24D9CA908;
  objc_copyWeak(v5, &location);
  v5[1] = v3;
  -[CRKClassKitCurrentUserProvider safeFetchCurrentUserWithCompletion:](self, "safeFetchCurrentUserWithCompletion:", v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __51__CRKClassKitCurrentUserProvider_updateCurrentUser__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "sequenceNumber") == *(_QWORD *)(a1 + 40))
  {
    if (v6)
    {
      if (_CRKLogASM_onceToken_30 != -1)
        dispatch_once(&_CRKLogASM_onceToken_30, &__block_literal_global_114);
      v9 = (void *)_CRKLogASM_logObj_30;
      if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_30, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        objc_msgSend(v6, "verboseDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_218C99000, v10, OS_LOG_TYPE_INFO, "Failed to fetch current ClassKit user in current user provider: %{public}@", (uint8_t *)&v12, 0xCu);

      }
    }
    objc_msgSend(v8, "updateCurrentUser:fetched:", v5, 1);
  }

}

- (void)updateCurrentUser:(id)a3 fetched:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  const __CFString **v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  const __CFString *v15;
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[CRKClassKitCurrentUserProvider currentUserFetched](self, "currentUserFetched") == v4)
  {
    v15 = CFSTR("currentUser");
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = &v15;
    v9 = 1;
  }
  else
  {
    v16[0] = CFSTR("currentUserFetched");
    v16[1] = CFSTR("currentUser");
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = (const __CFString **)v16;
    v9 = 2;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__CRKClassKitCurrentUserProvider_updateCurrentUser_fetched___block_invoke;
  v12[3] = &unk_24D9CA930;
  v12[4] = self;
  v13 = v6;
  v14 = v4;
  v11 = v6;
  -[CRKClassKitCurrentUserProvider performKVOUpdateForKeyPaths:updateBlock:](self, "performKVOUpdateForKeyPaths:updateBlock:", v10, v12);

}

void __60__CRKClassKitCurrentUserProvider_updateCurrentUser_fetched___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a1 + 48);
}

- (void)performKVOUpdateForKeyPaths:(id)a3 updateBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        -[CRKClassKitCurrentUserProvider willChangeValueForKey:](self, "willChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }
  v7[2](v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "reverseObjectEnumerator", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[CRKClassKitCurrentUserProvider didChangeValueForKey:](self, "didChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)safeFetchCurrentUserWithCompletion:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[CRKClassKitCurrentUserProvider classKitFacade](self, "classKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKClassKitCurrentUserProvider isSafeToTalkToProgressdWithAccountState:](self, "isSafeToTalkToProgressdWithAccountState:", objc_msgSend(v5, "accountState"));

  if (v6)
  {
    -[CRKClassKitCurrentUserProvider classKitFacade](self, "classKitFacade");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __69__CRKClassKitCurrentUserProvider_safeFetchCurrentUserWithCompletion___block_invoke;
    v8[3] = &unk_24D9CA958;
    v9 = v4;
    objc_msgSend(v7, "currentUserWithCompletion:", v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __69__CRKClassKitCurrentUserProvider_safeFetchCurrentUserWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CRKClassKitCurrentUserProvider_safeFetchCurrentUserWithCompletion___block_invoke_2;
  block[3] = &unk_24D9C7620;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __69__CRKClassKitCurrentUserProvider_safeFetchCurrentUserWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)isSafeToTalkToProgressdWithAccountState:(int64_t)a3
{
  return a3 == 2;
}

- (CRKClassKitCurrentUser)currentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(id)a3
{
  objc_storeStrong((id *)&self->_currentUser, a3);
}

- (BOOL)currentUserFetched
{
  return self->_currentUserFetched;
}

- (void)setCurrentUserFetched:(BOOL)a3
{
  self->_currentUserFetched = a3;
}

- (CRKClassKitFacade)classKitFacade
{
  return self->_classKitFacade;
}

- (CRKCancelable)currentUserSubscription
{
  return self->_currentUserSubscription;
}

- (void)setCurrentUserSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserSubscription, a3);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserSubscription, 0);
  objc_storeStrong((id *)&self->_classKitFacade, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
}

@end
