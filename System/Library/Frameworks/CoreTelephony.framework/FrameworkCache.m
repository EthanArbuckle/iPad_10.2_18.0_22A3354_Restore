@implementation FrameworkCache

- (void)handleNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  FrameworkCache *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "getCacheableSelectorForNotification:", v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self;
    objc_sync_enter(v7);
    -[NSMutableDictionary objectForKey:](v7->_selectorValueDict, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = CTLogClientCache();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FrameworkCache handleNotification:].cold.1(v10, (uint64_t)v11, v9);
      }
      -[NSMutableDictionary removeObjectForKey:](v7->_selectorValueDict, "removeObjectForKey:", v6);
    }
    objc_sync_exit(v7);

  }
}

+ (SEL)getCacheableSelectorForNotification:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  uint64_t *v9;
  const char *v10;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  {
    v16[0] = (unint64_t)sel_currentDataServiceDescriptorChanged_;
    v16[1] = (unint64_t)sel_getCurrentDataServiceDescriptor_;
    std::map<objc_selector *,objc_selector *>::map[abi:nn180100]((uint64_t)&v13, v16, 1);
    v12 = (_QWORD *)v14;
    +[FrameworkCache getCacheableSelectorForNotification:]::notificationSelectors = (uint64_t)v13;
    qword_1ECDA4A08 = v14;
    qword_1ECDA4A10 = v15;
    if (v15)
    {
      *(_QWORD *)(v14 + 16) = &qword_1ECDA4A08;
      v13 = &v14;
      v14 = 0;
      v15 = 0;
      v12 = 0;
    }
    else
    {
      +[FrameworkCache getCacheableSelectorForNotification:]::notificationSelectors = (uint64_t)&qword_1ECDA4A08;
    }
    std::__tree<std::__value_type<objc_selector *,objc_selector *>,std::__map_value_compare<objc_selector *,std::__value_type<objc_selector *,objc_selector *>,std::less<objc_selector *>,true>,std::allocator<std::__value_type<objc_selector *,objc_selector *>>>::destroy((uint64_t)&v13, v12);
  }
  v4 = objc_msgSend(v3, "selector");
  v5 = qword_1ECDA4A08;
  if (!qword_1ECDA4A08)
    goto LABEL_13;
  v6 = &qword_1ECDA4A08;
  do
  {
    v7 = *(_QWORD *)(v5 + 32);
    v8 = v7 >= v4;
    if (v7 >= v4)
      v9 = (uint64_t *)v5;
    else
      v9 = (uint64_t *)(v5 + 8);
    if (v8)
      v6 = (uint64_t *)v5;
    v5 = *v9;
  }
  while (*v9);
  if (v6 != &qword_1ECDA4A08 && v4 >= v6[4])
    v10 = (const char *)v6[5];
  else
LABEL_13:
    v10 = 0;

  return v10;
}

- (FrameworkCache)init
{
  FrameworkCache *v2;
  uint64_t v3;
  NSMutableDictionary *selectorValueDict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FrameworkCache;
  v2 = -[FrameworkCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v3 = objc_claimAutoreleasedReturnValue();
    selectorValueDict = v2->_selectorValueDict;
    v2->_selectorValueDict = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorValueDict, 0);
}

- (void)handleDisconnection
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_4_2(&dword_18425C000, a4, (uint64_t)a3, "[XXX] Purging value for selector '%@'", a2);

  OUTLINED_FUNCTION_8();
}

- (void)handleValue:(id)a3 forSelector:(SEL)a4
{
  id v6;
  void *v7;
  FrameworkCache *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "getCachePolicyForSelector:", a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    objc_sync_enter(v8);
    if (v6)
    {
      v9 = CTLogClientCache();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FrameworkCache handleValue:forSelector:].cold.2(v10, (uint64_t)v6, (uint64_t)v14);
      }
      -[NSMutableDictionary setObject:forKey:](v8->_selectorValueDict, "setObject:forKey:", v6, v7);
    }
    else
    {
      -[NSMutableDictionary objectForKey:](v8->_selectorValueDict, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = CTLogClientCache();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FrameworkCache handleValue:forSelector:].cold.1(v13, (uint64_t)v14, v12);
        }
        -[NSMutableDictionary removeObjectForKey:](v8->_selectorValueDict, "removeObjectForKey:", v7);
      }
    }
    objc_sync_exit(v8);

  }
}

+ (unsigned)getCachePolicyForSelector:(SEL)a3
{
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  BOOL v6;
  uint64_t *v7;
  _QWORD *v9;
  const char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  {
    v10 = a3;
    v14 = sel_getCurrentDataServiceDescriptor_;
    v15 = 2;
    v9 = (_QWORD *)v12;
    +[FrameworkCache getCachePolicyForSelector:]::cacheableSelectors = (uint64_t)v11;
    qword_1ECDA3C80 = v12;
    qword_1ECDA3C88 = v13;
    if (v13)
    {
      *(_QWORD *)(v12 + 16) = &qword_1ECDA3C80;
      v11 = &v12;
      v12 = 0;
      v13 = 0;
      v9 = 0;
    }
    else
    {
      +[FrameworkCache getCachePolicyForSelector:]::cacheableSelectors = (uint64_t)&qword_1ECDA3C80;
    }
    a3 = v10;
  }
  v3 = qword_1ECDA3C80;
  if (!qword_1ECDA3C80)
    return 0;
  v4 = &qword_1ECDA3C80;
  do
  {
    v5 = *(_QWORD *)(v3 + 32);
    v6 = v5 >= (unint64_t)a3;
    if (v5 >= (unint64_t)a3)
      v7 = (uint64_t *)v3;
    else
      v7 = (uint64_t *)(v3 + 8);
    if (v6)
      v4 = (uint64_t *)v3;
    v3 = *v7;
  }
  while (*v7);
  if (v4 != &qword_1ECDA3C80 && v4[4] <= (unint64_t)a3)
    return *((_BYTE *)v4 + 40);
  else
    return 0;
}

- (id)valueForSelector:(SEL)a3
{
  FrameworkCache *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v4->_selectorValueDict, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = CTLogClientCache();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FrameworkCache valueForSelector:].cold.1(v8, (uint64_t)v6, (uint64_t)v11);
    }
    v9 = v6;
  }

  objc_sync_exit(v4);
  return v6;
}

- (void)handleValue:(NSObject *)a3 forSelector:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_2(&dword_18425C000, a3, (uint64_t)a3, "Removing value for selector '%@'", (uint8_t *)a2);

  OUTLINED_FUNCTION_8();
}

- (void)handleValue:(uint64_t)a3 forSelector:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_18425C000, "Caching value for selector '%@': %@", v4, v5);

  OUTLINED_FUNCTION_8();
}

- (void)handleNotification:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_2(&dword_18425C000, a3, (uint64_t)a3, "Purging value due to notification for selector '%@'", (uint8_t *)a2);

  OUTLINED_FUNCTION_8();
}

- (void)valueForSelector:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_18425C000, "Found cached value for selector '%@': %@", v4, v5);

  OUTLINED_FUNCTION_8();
}

@end
