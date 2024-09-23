@implementation AAUISpinnerManager

- (AAUISpinnerManager)init
{
  AAUISpinnerManager *v2;
  uint64_t v3;
  NSMutableDictionary *spinnerControllers;
  UINavigationItem *navItem;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUISpinnerManager;
  v2 = -[AAUISpinnerManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    spinnerControllers = v2->_spinnerControllers;
    v2->_spinnerControllers = (NSMutableDictionary *)v3;

    v2->_controllersLock._os_unfair_lock_opaque = 0;
    navItem = v2->_navItem;
    v2->_navItem = 0;

  }
  return v2;
}

- (AAUISpinnerManager)initWithNavigationItem:(id)a3 hideBackButton:(BOOL)a4
{
  id v7;
  AAUISpinnerManager *v8;
  AAUISpinnerManager *v9;

  v7 = a3;
  v8 = -[AAUISpinnerManager init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_navItem, a3);
    v9->_shouldHideBackButton = a4;
  }

  return v9;
}

- (void)startNavigationSpinner
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "navItem is nil. Use initWithNavigationItem: before calling startNavigationSpinner", a5, a6, a7, a8, 0);
}

void __44__AAUISpinnerManager_startNavigationSpinner__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AAUINavigationItemSpinnerController *v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("_AAUINavSpinnerKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    _AAUILogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__AAUISpinnerManager_startNavigationSpinner__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    v11 = -[AAUINavigationItemSpinnerController initWithNavigationItem:hideBackButton:]([AAUINavigationItemSpinnerController alloc], "initWithNavigationItem:hideBackButton:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32));
    -[AAUINavigationItemSpinnerController startSpinning](v11, "startSpinning");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v11, CFSTR("_AAUINavSpinnerKey"));

  }
}

- (void)stopNavigationSpinner
{
  -[AAUISpinnerManager stopAnimatingForKey:](self, "stopAnimatingForKey:", CFSTR("_AAUINavSpinnerKey"));
}

- (void)startSpinnerInSpecifier:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_controllersLock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  p_controllersLock = &self->_controllersLock;
  v11[2] = __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke;
  v11[3] = &unk_1EA2DB818;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  os_unfair_lock_lock(p_controllersLock);
  __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke(v11);
  os_unfair_lock_unlock(p_controllersLock);

}

void __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AAUISpecifierSpinnerController *v11;

  v2 = (uint64_t)(a1 + 5);
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _AAUILogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke_cold_1(v2, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    v11 = -[AAUISpecifierSpinnerController initWithSpecifier:]([AAUISpecifierSpinnerController alloc], "initWithSpecifier:", a1[6]);
    -[AAUISpecifierSpinnerController startSpinning](v11, "startSpinning");
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", v11, a1[5]);

  }
}

- (void)stopAllSpinners
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allKeys](self->_spinnerControllers, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[AAUISpinnerManager stopAnimatingForKey:](self, "stopAnimatingForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)stopAnimatingForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_controllersLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_controllersLock = &self->_controllersLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke;
  v7[3] = &unk_1EA2DB778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_controllersLock);
  __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_controllersLock);

}

void __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a1 + 40;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stopSpinning");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  }
  else
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_spinnerControllers, 0);
}

void __44__AAUISpinnerManager_startNavigationSpinner__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Nav bar spinner is already active!", a5, a6, a7, a8, 0);
}

void __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Duplicate spinner for key %@", a5, a6, a7, a8, 2u);
}

void __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "No spinner found for key %@", a5, a6, a7, a8, 2u);
}

@end
