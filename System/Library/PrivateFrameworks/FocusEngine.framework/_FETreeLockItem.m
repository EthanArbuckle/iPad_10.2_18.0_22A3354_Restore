@implementation _FETreeLockItem

- (_FETreeLockItem)initWithEnvironment:(id)a3 finalUnlockHandler:(id)a4
{
  id v6;
  id v7;
  _FETreeLockItem *v8;
  uint64_t v9;
  id finalUnlockHandler;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  const __CFString *v15;
  NSString *environmentDescription;
  _FEWeakHelper *v17;
  _FETreeLockItem *v18;
  _FEWeakHelper *v19;
  uint64_t v21;
  NSMutableArray *lockCallStackSymbols;
  uint64_t v23;
  NSMutableArray *unlockCallStackSymbols;
  _QWORD v25[4];
  _FETreeLockItem *v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_FETreeLockItem;
  v8 = -[_FETreeLockItem init](&v27, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x2426205A4](v7);
    finalUnlockHandler = v8->_finalUnlockHandler;
    v8->_finalUnlockHandler = (id)v9;

    objc_storeWeak((id *)&v8->_environment, v6);
    v8->_unsafeEnvironment = (_FEFocusEnvironment *)v6;
    v11 = v6;
    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
      v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFSTR("(nil)");
    }

    environmentDescription = v8->_environmentDescription;
    v8->_environmentDescription = &v15->isa;

    v8->_lockCount = 0;
    v8->_lockTime = CFAbsoluteTimeGetCurrent();
    if (os_variant_has_internal_diagnostics() && _FEGetFocusTreeLockVerboseLogging())
    {
      v21 = objc_opt_new();
      lockCallStackSymbols = v8->_lockCallStackSymbols;
      v8->_lockCallStackSymbols = (NSMutableArray *)v21;

      v23 = objc_opt_new();
      unlockCallStackSymbols = v8->_unlockCallStackSymbols;
      v8->_unlockCallStackSymbols = (NSMutableArray *)v23;

    }
    v17 = [_FEWeakHelper alloc];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __58___FETreeLockItem_initWithEnvironment_finalUnlockHandler___block_invoke;
    v25[3] = &unk_250D3A358;
    v18 = v8;
    v26 = v18;
    v19 = -[_FEWeakHelper initWithDeallocationBlock:](v17, "initWithDeallocationBlock:", v25);
    objc_setAssociatedObject(v11, v18, v19, (void *)1);
    -[_FETreeLockItem lock](v18, "lock");

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[_FETreeLockItem _cleanup:](self, "_cleanup:", 1);
  v3.receiver = self;
  v3.super_class = (Class)_FETreeLockItem;
  -[_FETreeLockItem dealloc](&v3, sel_dealloc);
}

- (void)lock
{
  NSMutableArray *lockCallStackSymbols;
  void *v4;
  NSObject *v5;
  NSString *environmentDescription;
  unint64_t lockCount;
  int v8;
  NSString *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ++self->_lockCount;
  lockCallStackSymbols = self->_lockCallStackSymbols;
  if (lockCallStackSymbols)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](lockCallStackSymbols, "addObject:", v4);

  }
  logger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    environmentDescription = self->_environmentDescription;
    lockCount = self->_lockCount;
    v8 = 138412546;
    v9 = environmentDescription;
    v10 = 2048;
    v11 = lockCount;
    _os_log_debug_impl(&dword_23C48C000, v5, OS_LOG_TYPE_DEBUG, "Locking environment %@ — %lu locks total for this environment.", (uint8_t *)&v8, 0x16u);
  }

}

- (BOOL)unlock
{
  unint64_t lockCount;
  unint64_t v4;
  NSMutableArray *unlockCallStackSymbols;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSString *environmentDescription;
  unint64_t v11;
  NSString *v12;
  CFAbsoluteTime v13;
  void *v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  CFAbsoluteTime v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  lockCount = self->_lockCount;
  if (!lockCount)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FETreeLock.m"), 289, CFSTR("Overreleasing a lock. This is a UIKit bug. Additional info:\n%@"), self);

    lockCount = self->_lockCount;
  }
  v4 = lockCount - 1;
  self->_lockCount = lockCount - 1;
  unlockCallStackSymbols = self->_unlockCallStackSymbols;
  if (unlockCallStackSymbols)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](unlockCallStackSymbols, "addObject:", v6);

    v4 = self->_lockCount;
  }
  logger();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8)
    {
      environmentDescription = self->_environmentDescription;
      v11 = self->_lockCount;
      *(_DWORD *)buf = 138412546;
      v17 = environmentDescription;
      v18 = 2048;
      v19 = *(double *)&v11;
      _os_log_debug_impl(&dword_23C48C000, v7, OS_LOG_TYPE_DEBUG, "Unlocking environment %@ — %lu locks remaining for this environment.", buf, 0x16u);
    }

  }
  else
  {
    if (v8)
    {
      v12 = self->_environmentDescription;
      v13 = CFAbsoluteTimeGetCurrent() - self->_lockTime;
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2048;
      v19 = v13;
      _os_log_debug_impl(&dword_23C48C000, v7, OS_LOG_TYPE_DEBUG, "Unlocking environment %@ after %.2fs — 0 locks remaining for this environment.", buf, 0x16u);
    }

    -[_FETreeLockItem _cleanup:](self, "_cleanup:", 0);
  }
  return self->_lockCount == 0;
}

- (void)_cleanup:(BOOL)a3
{
  NSObject *v4;
  NSString *v5;
  void *v6;
  NSObject *v8;
  NSObject *WeakRetained;
  NSString *environmentDescription;
  void *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _FETreeLockItem *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!self->_didCleanup || a3)
  {
    if (!self->_didCleanup && a3)
    {
      logger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        environmentDescription = self->_environmentDescription;
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = environmentDescription;
        v14 = 2112;
        v15 = v11;
        v16 = 2112;
        v17 = self;
        _os_log_debug_impl(&dword_23C48C000, v8, OS_LOG_TYPE_DEBUG, "Cleaning up environment lock for %@ from dealloc. Cleanup from dealloc might indicate an unbalanced lock call. Stack trace:\n%@\nAdditional info:\n%@", (uint8_t *)&v12, 0x20u);

      }
    }
    self->_didCleanup = 1;
    (*((void (**)(void))self->_finalUnlockHandler + 2))();
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    v4 = WeakRetained;
    if (WeakRetained)
    {
      objc_getAssociatedObject(WeakRetained, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidate");
      objc_setAssociatedObject(v4, self, 0, (void *)1);
      goto LABEL_14;
    }
  }
  else
  {
    logger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = self->_environmentDescription;
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = self;
      _os_log_debug_impl(&dword_23C48C000, v4, OS_LOG_TYPE_DEBUG, "Ignoring call to cleanup environment lock for %@. Cleanup has already happened. Stack trace:\n%@\nAdditional info:\n%@", (uint8_t *)&v12, 0x20u);
LABEL_14:

    }
  }

}

- (void)validate
{
  id WeakRetained;
  double v4;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  NSString *environmentDescription;
  int v10;
  _FETreeLockItem *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  _FETreeLockItem *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (!WeakRetained)
  {
    logger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v10 = 138412290;
      v11 = self;
      _os_log_fault_impl(&dword_23C48C000, v7, OS_LOG_TYPE_FAULT, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_16;
  }
  v4 = CFAbsoluteTimeGetCurrent() - self->_lockTime;
  if (!self->_didSoftAssert && v4 >= 20.0)
  {
    if ((_FEProcessIsBeingDebugged() & 1) == 0)
    {
      logger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        environmentDescription = self->_environmentDescription;
        v10 = 138412802;
        v11 = (_FETreeLockItem *)environmentDescription;
        v12 = 2048;
        v13 = v4;
        v14 = 2112;
        v15 = self;
        _os_log_fault_impl(&dword_23C48C000, v6, OS_LOG_TYPE_FAULT, "Lock for environment %@ was aquired %.2f seconds ago and might be stuck. This can have a serious impact on focus updates. Additional info:\n%@", (uint8_t *)&v10, 0x20u);
      }

    }
    self->_didSoftAssert = 1;
  }
  if (v4 > 5.0)
  {
    logger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = self->_environmentDescription;
      v10 = 138412546;
      v11 = (_FETreeLockItem *)v8;
      v12 = 2048;
      v13 = v4;
      _os_log_debug_impl(&dword_23C48C000, v7, OS_LOG_TYPE_DEBUG, "Lock for environment %@ was aquired %.2f seconds ago and might be stuck or take very long to be unlocked.", (uint8_t *)&v10, 0x16u);
    }
LABEL_16:

  }
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained((id *)&self->_environment);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendString:withName:", v8, CFSTR("environment"));
  }
  else
  {
    objc_msgSend(v3, "appendString:withName:", CFSTR("(nil)"), CFSTR("environment"));

    v9 = (id)objc_msgSend(v3, "appendObject:withName:", self->_environmentDescription, CFSTR("environmentDescription"));
  }
  v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_lockCount, CFSTR("lockCount"));
  v11 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("duration"), 2, CFAbsoluteTimeGetCurrent() - self->_lockTime);
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_lockCallStackSymbols, CFSTR("LOCK call stacks"), 1);
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_unlockCallStackSymbols, CFSTR("UNLOCK call stacks"), 1);
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (_FEFocusEnvironment)environment
{
  return (_FEFocusEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (NSString)environmentDescription
{
  return self->_environmentDescription;
}

- (unint64_t)lockCount
{
  return self->_lockCount;
}

- (double)lockTime
{
  return self->_lockTime;
}

- (NSArray)lockCallStackSymbols
{
  return &self->_lockCallStackSymbols->super;
}

- (NSArray)unlockCallStackSymbols
{
  return &self->_unlockCallStackSymbols->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentDescription, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong(&self->_finalUnlockHandler, 0);
  objc_storeStrong((id *)&self->_unlockCallStackSymbols, 0);
  objc_storeStrong((id *)&self->_lockCallStackSymbols, 0);
}

@end
