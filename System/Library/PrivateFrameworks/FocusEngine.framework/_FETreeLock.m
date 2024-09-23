@implementation _FETreeLock

- (_FETreeLock)init
{
  _FETreeLock *v2;
  uint64_t v3;
  NSMapTable *lockedEnvironments;
  void *v6;
  uint64_t v7;
  NSTimer *validationTimer;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_FETreeLock;
  v2 = -[_FETreeLock init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 10);
    lockedEnvironments = v2->_lockedEnvironments;
    v2->_lockedEnvironments = (NSMapTable *)v3;

    if (os_variant_has_internal_diagnostics())
    {
      objc_initWeak(&location, v2);
      v6 = (void *)MEMORY[0x24BDBCF40];
      v9 = MEMORY[0x24BDAC760];
      v10 = 3221225472;
      v11 = __19___FETreeLock_init__block_invoke;
      v12 = &unk_250D39E68;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v9, 5.0);
      v7 = objc_claimAutoreleasedReturnValue();
      validationTimer = v2->_validationTimer;
      v2->_validationTimer = (NSTimer *)v7;

      -[NSTimer setTolerance:](v2->_validationTimer, "setTolerance:", 1.0, v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)lockEnvironmentTree:(id)a3
{
  id v5;
  _FETreeLockItem *v6;
  _FETreeLockItem *v7;
  _FETreeLockItem *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FETreeLock.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  -[NSMapTable objectForKey:](self->_lockedEnvironments, "objectForKey:", v5);
  v6 = (_FETreeLockItem *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[_FETreeLockItem lock](v6, "lock");
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = [_FETreeLockItem alloc];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35___FETreeLock_lockEnvironmentTree___block_invoke;
    v10[3] = &unk_250D3A868;
    objc_copyWeak(&v11, &location);
    v7 = -[_FETreeLockItem initWithEnvironment:finalUnlockHandler:](v8, "initWithEnvironment:finalUnlockHandler:", v5, v10);
    -[NSMapTable setObject:forKey:](self->_lockedEnvironments, "setObject:forKey:", v7, v5);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (BOOL)unlockEnvironmentTree:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  id v11;
  __CFString *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FETreeLock.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  -[NSMapTable objectForKey:](self->_lockedEnvironments, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unlock");
  }
  else
  {
    logger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v11 = v5;
      if (v5)
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_fault_impl(&dword_23C48C000, v9, OS_LOG_TYPE_FAULT, "Unbalanced call to unlockEnvironmentTree: for an environment that is not locked: %@", buf, 0xCu);

    }
    v8 = 1;
  }

  return v8;
}

- (BOOL)isEnvironmentLocked:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  BOOL HaveCommonHierarchy;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMapTable objectEnumerator](self->_lockedEnvironments, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 138412290;
    v15 = v7;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "environment", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          logger();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v10;
            _os_log_fault_impl(&dword_23C48C000, v12, OS_LOG_TYPE_FAULT, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", buf, 0xCu);
          }

        }
        HaveCommonHierarchy = _FEFocusEnvironmentsHaveCommonHierarchy(v4, v11);

        if (HaveCommonHierarchy)
        {
          LOBYTE(v6) = 1;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

  return v6;
}

- (void)_validateLockedEnvironments
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

  v13 = *MEMORY[0x24BDAC8D0];
  if (os_variant_has_internal_diagnostics())
  {
    CFAbsoluteTimeGetCurrent();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMapTable objectEnumerator](self->_lockedEnvironments, "objectEnumerator", 0);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "validate");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_lockedEnvironments, CFSTR("lockedEnvironments"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMapTable)lockedEnvironments
{
  return self->_lockedEnvironments;
}

- (NSTimer)validationTimer
{
  return self->_validationTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationTimer, 0);
  objc_storeStrong((id *)&self->_lockedEnvironments, 0);
}

@end
