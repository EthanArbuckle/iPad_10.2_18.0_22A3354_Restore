@implementation BLSHLocalAssertionAttributeHandler

+ (id)registerHandlerForService:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForService:", v4);

  objc_msgSend(v5, "setupService");
  return v5;
}

+ (id)attributeClasses
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalAssertionAttributeHandler and override %@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = a1;
    v17 = 2114;
    v18 = CFSTR("BLSHLocalAssertionAttributeHandler.m");
    v19 = 1024;
    v20 = 25;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (Class)attributeBaseClass
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  Class result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalAssertionAttributeHandler and override %@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = a1;
    v17 = 2114;
    v18 = CFSTR("BLSHLocalAssertionAttributeHandler.m");
    v19 = 1024;
    v20 = 30;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (Class)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (Class)entryClass
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  Class result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalAssertionAttributeHandler and override %@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = a1;
    v17 = 2114;
    v18 = CFSTR("BLSHLocalAssertionAttributeHandler.m");
    v19 = 1024;
    v20 = 35;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (Class)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)initForService:(id)a3
{
  id v4;
  BLSHLocalAssertionAttributeHandler *v5;
  BLSHLocalAssertionAttributeHandler *v6;
  uint64_t v7;
  NSMutableDictionary *entries;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSHLocalAssertionAttributeHandler;
  v5 = -[BLSHLocalAssertionAttributeHandler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    entries = v6->_entries;
    v6->_entries = (NSMutableDictionary *)v7;

    objc_storeWeak((id *)&v6->_service, v4);
  }

  return v6;
}

- (void)setupService
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  objc_msgSend((id)objc_opt_class(), "attributeClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "registerAttributeHandler:forAttributeClasses:", self, v3);

}

- (id)withLock_entryFromEntries:(void *)a3 forAttribute:
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 4);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "attribute", (_QWORD)v14);
          v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v6)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)activateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  BLSHLocalAssertionAttributeHandler *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v31 = a5;
  v33 = v9;
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKey:](self->_entries, "objectForKey:", v10);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_entries, "setObject:forKey:");
    }
    v29 = v10;
    v32 = objc_msgSend((id)objc_opt_class(), "entryClass");
    v11 = objc_msgSend((id)objc_opt_class(), "attributeBaseClass");
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v30 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          v17 = *(NSObject **)(*((_QWORD *)&v35 + 1) + 8 * v16);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[BLSHLocalAssertionAttributeHandler withLock_entryFromEntries:forAttribute:]((const os_unfair_lock *)self, v34, v17);
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = v18;
              v20 = -[NSObject reactivateIfPossible](v18, "reactivateIfPossible");
              bls_assertions_log();
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if ((v20 & 1) != 0)
              {
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  NSStringFromBLSAssertingObject();
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218754;
                  v40 = self;
                  v41 = 2114;
                  v42 = v19;
                  v43 = 2112;
                  v44 = (uint64_t)v17;
                  v45 = 2112;
                  v46 = v23;
                  _os_log_debug_impl(&dword_2145AC000, v22, OS_LOG_TYPE_DEBUG, "%p did re-activate entry:%{public}@ for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x2Au);
                  goto LABEL_28;
                }
              }
              else if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
              {
                NSStringFromBLSAssertingObject();
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218754;
                v40 = self;
                v41 = 2114;
                v42 = v19;
                v43 = 2112;
                v44 = (uint64_t)v17;
                v45 = 2112;
                v46 = v23;
                _os_log_fault_impl(&dword_2145AC000, v22, OS_LOG_TYPE_FAULT, "%p (cannot re-activate) already have entry:%{public}@ for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x2Au);
LABEL_28:

              }
              goto LABEL_22;
            }
            -[NSObject activateForAttribute:fromAssertion:forService:attributeHandler:](v32, "activateForAttribute:fromAssertion:forService:attributeHandler:", v17, v33, v31, self);
            v19 = objc_claimAutoreleasedReturnValue();
            bls_assertions_log();
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v19)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                NSStringFromBLSAssertingObject();
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218754;
                v40 = self;
                v41 = 2112;
                v42 = v19;
                v43 = 2112;
                v44 = (uint64_t)v17;
                v45 = 2112;
                v46 = v27;
                _os_log_debug_impl(&dword_2145AC000, v25, OS_LOG_TYPE_DEBUG, "%p did activate entry:%{pubic}@ for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x2Au);

              }
              -[NSObject addObject:](v34, "addObject:", v19);
            }
            else
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                NSStringFromBLSAssertingObject();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218754;
                v40 = self;
                v41 = 2112;
                v42 = v32;
                v43 = 2114;
                v44 = (uint64_t)v17;
                v45 = 2112;
                v46 = v26;
                _os_log_impl(&dword_2145AC000, v25, OS_LOG_TYPE_DEFAULT, "%p nil when activating attribute:%{pubic}@ entryClass:%{public}@ assertion:%{pubic}@", buf, 0x2Au);

              }
              v19 = v25;
            }
          }
          else
          {
            bls_assertions_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134218498;
              v40 = self;
              v41 = 2112;
              v42 = v17;
              v43 = 2112;
              v44 = v11;
              _os_log_fault_impl(&dword_2145AC000, v19, OS_LOG_TYPE_FAULT, "%p cannot activate invalid attribute:%@ not of class:%@", buf, 0x20u);
            }
          }
LABEL_22:

          ++v16;
        }
        while (v14 != v16);
        v28 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        v14 = v28;
      }
      while (v28);
    }

    os_unfair_lock_unlock(&self->_lock);
    v10 = v29;
    v8 = v30;
  }
  else
  {
    bls_assertions_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BLSHLocalAssertionAttributeHandler activateAttributes:fromAssertion:forService:].cold.1();
  }

}

- (void)deactivateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  BLSHLocalAssertionAttributeHandler *v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v27 = a4;
  objc_msgSend(v27, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend((id)objc_opt_class(), "attributeBaseClass");
    -[NSMutableDictionary objectForKey:](self->_entries, "objectForKey:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v25 = v8;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = v7;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v29;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v11);
            v16 = *(NSObject **)(*((_QWORD *)&v28 + 1) + 8 * v15);
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[BLSHLocalAssertionAttributeHandler withLock_entryFromEntries:forAttribute:]((const os_unfair_lock *)self, v10, v16);
              v17 = objc_claimAutoreleasedReturnValue();
              bls_assertions_log();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v17)
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  NSStringFromBLSAssertingObject();
                  v20 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218754;
                  v33 = self;
                  v34 = 2112;
                  v35 = v17;
                  v36 = 2112;
                  v37 = (uint64_t)v16;
                  v38 = 2112;
                  v39 = v20;
                  v21 = (void *)v20;
                  _os_log_debug_impl(&dword_2145AC000, v19, OS_LOG_TYPE_DEBUG, "%p will deactive entry:%{pubic}@ for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x2Au);

                }
                -[NSObject invalidate](v17, "invalidate");
                -[NSObject removeObject:](v10, "removeObject:", v17);
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
                {
                  NSStringFromBLSAssertingObject();
                  v22 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218498;
                  v33 = self;
                  v34 = 2112;
                  v35 = v16;
                  v36 = 2112;
                  v37 = v22;
                  v23 = (void *)v22;
                  _os_log_fault_impl(&dword_2145AC000, v19, OS_LOG_TYPE_FAULT, "%p (cannot deactivate) no entry for attribute:%{pubic}@ assertion:%{pubic}@", buf, 0x20u);

                }
              }
            }
            else
            {
              bls_assertions_log();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 134218242;
                v33 = self;
                v34 = 2112;
                v35 = v16;
                _os_log_fault_impl(&dword_2145AC000, v17, OS_LOG_TYPE_FAULT, "%p cannot deactivate invalid attribute:%@", buf, 0x16u);
              }
            }

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v13);
      }

      v8 = v25;
      v7 = v26;
      p_lock = &self->_lock;
      if (!-[NSObject count](v10, "count"))
        -[NSMutableDictionary removeObjectForKey:](self->_entries, "removeObjectForKey:", v25);
    }
    else
    {
      bls_assertions_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BLSHLocalAssertionAttributeHandler deactivateAttributes:fromAssertion:forService:].cold.2();

    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    bls_assertions_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BLSHLocalAssertionAttributeHandler activateAttributes:fromAssertion:forService:].cold.1();
  }

}

- (BLSHLocalAssertionService)service
{
  return (BLSHLocalAssertionService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_entries, 0);
}

- (void)activateAttributes:fromAssertion:forService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_2145AC000, v0, v1, "%p no identifier for assertion:%{pubic}@");
  OUTLINED_FUNCTION_2();
}

- (void)deactivateAttributes:fromAssertion:forService:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_2145AC000, v0, v1, "%p no entries for assertion:%{pubic}@");
  OUTLINED_FUNCTION_2();
}

@end
