@implementation EMFocusController

- (id)_currentFocusedAccountIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringArrayForKey:", CFSTR("FocusedAccountIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)updatedPredicateForFocus:(id)a3 currentPredicate:(id)a4 usingAccountRepository:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a1, "predicateForFocus:usingAccountRepository:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "ef_andCompoundPredicateForOptionalPredicate:second:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForFocus:(id)a3 usingAccountRepository:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "focusedAccountIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v6, "receivingAccounts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __62__EMFocusController_predicateForFocus_usingAccountRepository___block_invoke;
      v12[3] = &unk_1E70F2DF8;
      v13 = v7;
      objc_msgSend(v8, "ef_compactMap:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchNothingPredicate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (EMFocusController)init
{
  EMFocusController *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t v5;
  EFAssertableScheduler *observationScheduler;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  EFCancelable *observationToken;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)EMFocusController;
  v2 = -[EMFocusController init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.mail.CurrentFocusObservation"));
    v5 = objc_claimAutoreleasedReturnValue();
    observationScheduler = v2->_observationScheduler;
    v2->_observationScheduler = (EFAssertableScheduler *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    if (_os_feature_enabled_impl())
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v2);
      objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __25__EMFocusController_init__block_invoke;
      v14[3] = &unk_1E70F2DA8;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v7, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", CFSTR("FocusedAccountIdentifiers"), 1, 1, v14);
      v9 = objc_claimAutoreleasedReturnValue();
      observationToken = v2->_observationToken;
      v2->_observationToken = (EFCancelable *)v9;

      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __25__EMFocusController_init__block_invoke_2;
      v12[3] = &unk_1E70F2DD0;
      objc_copyWeak(&v13, &location);
      -[EMFocusController getCurrentFocus:](v2, "getCurrentFocus:", v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)getCurrentFocus:(id)a3
{
  void *v5;
  EMFocus *v6;
  void *v7;
  void (**v8)(id, EMFocus *);

  v8 = (void (**)(id, EMFocus *))a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMFocusController.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[EMFocusController _currentFocusedAccountIdentifiers](self, "_currentFocusedAccountIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[EMFocus initWithFocusedAccountIdentifiers:]([EMFocus alloc], "initWithFocusedAccountIdentifiers:", v5);
    else
      v6 = 0;
    v8[2](v8, v6);

  }
  else
  {
    v8[2](v8, 0);
  }

}

void __25__EMFocusController_init__block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  id v6;

  v6 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 10);
    objc_storeStrong((id *)&v5[8], a2);
    os_unfair_lock_unlock(v5 + 10);
  }

}

- (id)addObserver:(id)a3 currentFocus:(id *)a4
{
  id v6;
  NSHashTable *observers;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id from;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a3);
  v6 = objc_alloc_init(MEMORY[0x1E0D1EE78]);
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __46__EMFocusController_addObserver_currentFocus___block_invoke;
  v13 = &unk_1E70F2870;
  objc_copyWeak(&v14, &from);
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "addCancelationBlock:", &v10);
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  v8 = objc_loadWeakRetained(&location);
  -[NSHashTable addObject:](observers, "addObject:", v8, v10, v11, v12, v13);

  os_unfair_lock_unlock(&self->_lock);
  if (a4)
    objc_storeStrong(a4, self->_currentFocus);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v6;
}

void ___ef_log_EMFocusController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EMFocusController");
  v1 = (void *)_ef_log_EMFocusController_log;
  _ef_log_EMFocusController_log = (uint64_t)v0;

}

void __25__EMFocusController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_focusModeChanged");

}

- (void)_focusModeChanged
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[8];

  if (_os_feature_enabled_impl())
  {
    _ef_log_EMFocusController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Focus mode changed", buf, 2u);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __38__EMFocusController__focusModeChanged__block_invoke;
    v4[3] = &unk_1E70F2DD0;
    objc_copyWeak(&v5, (id *)buf);
    -[EMFocusController getCurrentFocus:](self, "getCurrentFocus:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak((id *)buf);
  }
}

void __38__EMFocusController__focusModeChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 2);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__EMFocusController__focusModeChanged__block_invoke_2;
    v7[3] = &unk_1E70F2070;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "performBlock:", v7);

  }
}

void __38__EMFocusController__focusModeChanged__block_invoke_2(uint64_t a1)
{
  id *v2;
  os_unfair_lock_s *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 40);
  os_unfair_lock_lock(v3);
  objc_storeStrong((id *)*v2 + 4, v2[1]);
  objc_msgSend(*((id *)*v2 + 1), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v3);
  _ef_log_EMFocusController();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "Current focus: %{public}@", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "currentFocusChanged:", *(_QWORD *)(a1 + 40), (_QWORD)v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __46__EMFocusController_addObserver_currentFocus___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  id v5;
  os_unfair_lock_s *v6;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained + 10;
    v6 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 10);
    v4 = *(void **)&v6[2]._os_unfair_lock_opaque;
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "removeObject:", v5);

    os_unfair_lock_unlock(v3);
    WeakRetained = v6;
  }

}

id __62__EMFocusController_predicateForFocus_usingAccountRepository___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "representedObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    +[EMMessageListItemPredicates predicateForAccount:](EMMessageListItemPredicates, "predicateForAccount:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_observationScheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
