@implementation CRKClassKitChangeNotifier

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  -[CRKClassKitChangeNotifier generalObserverToken](self, "generalObserverToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitChangeNotifier trustedPersonObserverToken](self, "trustedPersonObserverToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitChangeNotifier requirements](self, "requirements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CRKClassKitChangeNotifier_dealloc__block_invoke;
  block[3] = &unk_24D9C84C0;
  v11 = v3;
  v12 = v5;
  v13 = v4;
  v6 = v4;
  v7 = v5;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  v9.receiver = self;
  v9.super_class = (Class)CRKClassKitChangeNotifier;
  -[CRKClassKitChangeNotifier dealloc](&v9, sel_dealloc);
}

uint64_t __36__CRKClassKitChangeNotifier_dealloc__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 32))
    result = objc_msgSend(*(id *)(result + 40), "removeObserver:");
  if (*(_QWORD *)(v1 + 48))
    return objc_msgSend(*(id *)(v1 + 40), "removeObserver:");
  return result;
}

- (CRKClassKitChangeNotifier)initWithRequirements:(id)a3
{
  id v5;
  CRKClassKitChangeNotifier *v6;
  CRKClassKitChangeNotifier *v7;
  uint64_t v8;
  NSSet *observedTrustedPersonIDs;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKClassKitChangeNotifier;
  v6 = -[CRKClassKitChangeNotifier init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requirements, a3);
    v8 = objc_opt_new();
    observedTrustedPersonIDs = v7->_observedTrustedPersonIDs;
    v7->_observedTrustedPersonIDs = (NSSet *)v8;

    -[CRKClassKitChangeNotifier startObservingGeneralChanges](v7, "startObservingGeneralChanges");
  }

  return v7;
}

- (BOOL)updateObservedTrustedPersonIDsWithRoster:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  -[CRKClassKitChangeNotifier trustedPersonIDsInRoster:](self, "trustedPersonIDsInRoster:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  -[CRKClassKitChangeNotifier observedTrustedPersonIDs](self, "observedTrustedPersonIDs");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 | v4
    && (v6 = (void *)v5,
        -[CRKClassKitChangeNotifier observedTrustedPersonIDs](self, "observedTrustedPersonIDs"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v4),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    -[CRKClassKitChangeNotifier setObservedTrustedPersonIDs:](self, "setObservedTrustedPersonIDs:", v4);
    -[CRKClassKitChangeNotifier stopObservingTrustedPersons](self, "stopObservingTrustedPersons");
    -[CRKClassKitChangeNotifier requirements](self, "requirements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassKitChangeNotifier makeObserverBlock](self, "makeObserverBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserverForPersonIDs:observerBlock:", v4, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassKitChangeNotifier setTrustedPersonObserverToken:](self, "setTrustedPersonObserverToken:", v12);

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)startObservingGeneralChanges
{
  void *v3;
  void *v4;
  id v5;

  -[CRKClassKitChangeNotifier requirements](self, "requirements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitChangeNotifier makeObserverBlock](self, "makeObserverBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGeneralObserver:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitChangeNotifier setGeneralObserverToken:](self, "setGeneralObserverToken:", v4);

}

- (void)stopObservingGeneralChanges
{
  void *v3;
  void *v4;
  void *v5;

  -[CRKClassKitChangeNotifier generalObserverToken](self, "generalObserverToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRKClassKitChangeNotifier requirements](self, "requirements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassKitChangeNotifier generalObserverToken](self, "generalObserverToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

    -[CRKClassKitChangeNotifier setGeneralObserverToken:](self, "setGeneralObserverToken:", 0);
  }
}

- (void)stopObservingTrustedPersons
{
  void *v3;
  void *v4;
  void *v5;

  -[CRKClassKitChangeNotifier trustedPersonObserverToken](self, "trustedPersonObserverToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRKClassKitChangeNotifier requirements](self, "requirements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassKitChangeNotifier trustedPersonObserverToken](self, "trustedPersonObserverToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

    -[CRKClassKitChangeNotifier setTrustedPersonObserverToken:](self, "setTrustedPersonObserverToken:", 0);
  }
}

- (id)makeObserverBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__CRKClassKitChangeNotifier_makeObserverBlock__block_invoke;
  v4[3] = &unk_24D9C7A60;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x219A226E8](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __46__CRKClassKitChangeNotifier_makeObserverBlock__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CRKClassKitChangeNotifier_makeObserverBlock__block_invoke_2;
  block[3] = &unk_24D9C7A60;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __46__CRKClassKitChangeNotifier_makeObserverBlock__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataChanged");

}

- (void)dataChanged
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (_CRKLogASM_onceToken_25 != -1)
    dispatch_once(&_CRKLogASM_onceToken_25, &__block_literal_global_88);
  v3 = _CRKLogASM_logObj_25;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "ClassKit data changed", v5, 2u);
  }
  -[CRKClassKitChangeNotifier delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifierDidObserveClassKitChange:", self);

}

- (id)trustedPersonIDsInRoster:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
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
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = v3;
  objc_msgSend(v3, "courses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v10, "trustedUsers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

- (CRKClassKitChangeNotifierDelegate)delegate
{
  return (CRKClassKitChangeNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (id)generalObserverToken
{
  return self->_generalObserverToken;
}

- (void)setGeneralObserverToken:(id)a3
{
  objc_storeStrong(&self->_generalObserverToken, a3);
}

- (id)trustedPersonObserverToken
{
  return self->_trustedPersonObserverToken;
}

- (void)setTrustedPersonObserverToken:(id)a3
{
  objc_storeStrong(&self->_trustedPersonObserverToken, a3);
}

- (NSSet)observedTrustedPersonIDs
{
  return self->_observedTrustedPersonIDs;
}

- (void)setObservedTrustedPersonIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedTrustedPersonIDs, 0);
  objc_storeStrong(&self->_trustedPersonObserverToken, 0);
  objc_storeStrong(&self->_generalObserverToken, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
