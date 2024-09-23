@implementation HDSessionAssertionGroup

- (HDSessionAssertionGroup)init
{
  HDSessionAssertionGroup *v2;
  NSMutableSet *v3;
  NSMutableSet *allAssertions;
  NSMutableDictionary *v5;
  NSMutableDictionary *assertionsForState;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDSessionAssertionGroup;
  v2 = -[HDSessionAssertionGroup init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allAssertions = v2->_allAssertions;
    v2->_allAssertions = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assertionsForState = v2->_assertionsForState;
    v2->_assertionsForState = v5;

  }
  return v2;
}

- (void)setupState:(int64_t)a3 withAssertions:(id)a4
{
  id v6;
  NSMutableDictionary *assertionsForState;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  assertionsForState = self->_assertionsForState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](assertionsForState, "setObject:forKeyedSubscript:", v6, v8);

  -[NSMutableSet addObjectsFromArray:](self->_allAssertions, "addObjectsFromArray:", v6);
  if (self->_state == a3)
  {
    _HKInitializeLogging();
    HKLogAssertions();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      HKLogAssertions();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "Assertion group: Updating assertions for current state %@", (uint8_t *)&v13, 0xCu);

      }
    }
    -[HDSessionAssertionGroup _transitionToNewAssertions:]((uint64_t)self, v6);
  }

}

- (void)_transitionToNewAssertions:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = *(id *)(a1 + 8);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v5)
      goto LABEL_21;
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412290;
    v18 = v6;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
        if (!objc_msgSend(v3, "containsObject:", v10, v18, (_QWORD)v19))
        {
          if (!v10)
            goto LABEL_17;
          objc_msgSend(*(id *)(v10 + 8), "invalidate");
          v14 = *(NSObject **)(v10 + 8);
          *(_QWORD *)(v10 + 8) = 0;
          goto LABEL_16;
        }
        v11 = objc_msgSend((id)v10, "taken");
        if (v10 && (v11 & 1) == 0)
        {
          if (objc_msgSend((id)v10, "taken"))
          {
            _HKInitializeLogging();
            HKLogAssertions();
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

            if (!v13)
              goto LABEL_17;
            HKLogAssertions();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(*(id *)(v10 + 8), "assertionIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v18;
              v25 = v15;
              _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "Attempting to take assertion already taken: %@", buf, 0xCu);

            }
          }
          else
          {
            objc_msgSend(*(id *)(v10 + 8), "invalidate");
            (*(void (**)(void))(*(_QWORD *)(v10 + 16) + 16))();
            v16 = objc_claimAutoreleasedReturnValue();
            v14 = *(NSObject **)(v10 + 8);
            *(_QWORD *)(v10 + 8) = v16;
          }
LABEL_16:

        }
LABEL_17:
        ++v9;
      }
      while (v7 != v9);
      v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v7 = v17;
      if (!v17)
      {
LABEL_21:

        break;
      }
    }
  }

}

- (void)transitionToState:(int64_t)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  NSMutableDictionary *assertionsForState;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_state == a3)
  {
    _HKInitializeLogging();
    HKLogAssertions();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (!v5)
      return;
    HKLogAssertions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "Assertion group: Already in state %@", (uint8_t *)&v19, 0xCu);

    }
  }
  else
  {
    self->_state = a3;
    _HKInitializeLogging();
    HKLogAssertions();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      HKLogAssertions();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v12;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "Assertion group: Transitioning to state %@", (uint8_t *)&v19, 0xCu);

      }
    }
    assertionsForState = self->_assertionsForState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](assertionsForState, "objectForKeyedSubscript:", v14);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HDSessionAssertionGroup _transitionToNewAssertions:]((uint64_t)self, v6);
    }
    else
    {
      _HKInitializeLogging();
      HKLogAssertions();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

      if (v16)
      {
        HKLogAssertions();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412290;
          v20 = v18;
          _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_INFO, "Assertion group: No assertions for state %@", (uint8_t *)&v19, 0xCu);

        }
      }
      v6 = 0;
    }
  }

}

- (void)invalidate
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id *v7;
  int v8;
  BOOL v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_allAssertions;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(id **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "taken", (_QWORD)v11);
        if (v7)
          v9 = v8 == 0;
        else
          v9 = 1;
        if (!v9)
        {
          objc_msgSend(v7[1], "invalidate");
          v10 = v7[1];
          v7[1] = 0;

        }
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionsForState, 0);
  objc_storeStrong((id *)&self->_allAssertions, 0);
}

@end
