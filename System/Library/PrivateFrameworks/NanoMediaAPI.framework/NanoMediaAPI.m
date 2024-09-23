void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id NMLogForCategory(uint64_t a1)
{
  if (NMLogForCategory_onceToken != -1)
    dispatch_once(&NMLogForCategory_onceToken, &__block_literal_global);
  return (id)NMLogForCategory_logObjects[a1];
}

id NMAPIDictionaryWithObject(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;

  v5 = a1;
  v6 = a2;
  if ((_NSIsNSDictionary() & 1) != 0)
  {
    NMLogForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      NMAPIDictionaryWithObject_cold_1();

    v8 = v5;
  }
  else
  {
    NMLogForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      NMAPIDictionaryWithObject_cold_2();

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7102, 0);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

id NMAPIArrayWithObject(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;

  v5 = a1;
  v6 = a2;
  if ((_NSIsNSArray() & 1) != 0)
  {
    NMLogForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      NMAPIDictionaryWithObject_cold_1();

    v8 = v5;
  }
  else
  {
    NMLogForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      NMAPIArrayWithObject_cold_2();

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7102, 0);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

id NMAPIStringWithObject(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;

  v5 = a1;
  v6 = a2;
  if ((_NSIsNSString() & 1) != 0)
  {
    NMLogForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      NMAPIDictionaryWithObject_cold_1();

    v8 = v5;
  }
  else
  {
    NMLogForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      NMAPIStringWithObject_cold_2();

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7102, 0);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

id NMAPIDictionaryInSingleObjectArray(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v5, "count") == 1)
  {
    NMLogForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      NMAPIDictionaryWithObject_cold_1();

    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NMAPIDictionaryWithObject(v8, v6, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NMLogForCategory(9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      NMAPIDictionaryInSingleObjectArray_cold_2((uint64_t)v6, v5, v10);

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7102, 0);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

id NMAPIOptionalDictionaryWithObject(void *a1, void *a2, _QWORD *a3)
{
  if (a1)
  {
    NMAPIDictionaryWithObject(a1, a2, a3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id NMAPIOptionalArrayWithObject(void *a1, void *a2, _QWORD *a3)
{
  if (a1)
  {
    NMAPIArrayWithObject(a1, a2, a3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id MusicURLComponentsWithURLBag(void *a1, int a2)
{
  void *v3;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;

  objc_msgSend(a1, "dictionaryForBagKey:", *MEMORY[0x24BEC86E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSDictionary() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("ampMusicAPIDomains"));
    v4 = objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSDictionary() & 1) != 0)
    {
      v5 = CFSTR("default");
      if (a2)
        v5 = CFSTR("listenNow");
      v6 = v5;
      -[NSObject objectForKey:](v4, "objectForKey:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSString() & 1) != 0)
      {
        v8 = (void *)objc_opt_new();
        objc_msgSend(v8, "setScheme:", CFSTR("https"));
        objc_msgSend(v8, "setHost:", v7);
      }
      else
      {
        NMLogForCategory(9);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          MusicURLComponentsWithURLBag_cold_1((uint64_t)v6, (uint64_t)v4, v16);

        v8 = 0;
      }

    }
    else
    {
      NMLogForCategory(9);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        MusicURLComponentsWithURLBag_cold_2((uint64_t)v3, v7);
      v8 = 0;
    }

  }
  else
  {
    NMLogForCategory(9);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      MusicURLComponentsWithURLBag_cold_3(v4, v9, v10, v11, v12, v13, v14, v15);
    v8 = 0;
  }

  return v8;
}

id MusicURLPathStorefrontWithURLBag(void *a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "stringForBagKey:", CFSTR("countryCode"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    NMLogForCategory(9);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      MusicURLPathStorefrontWithURLBag_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    v2 = 0;
  }

  return v2;
}

id MusicURLQueryItemLanguageWithURLBag(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "stringForBagKey:", CFSTR("language"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("l"), v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NMLogForCategory(9);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      MusicURLQueryItemLanguageWithURLBag_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    v2 = 0;
  }

  return v2;
}

void NMAPIDictionaryWithObject_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21A803000, v0, v1, "[NMAPIResponseParser] %@: %@");
  OUTLINED_FUNCTION_3();
}

void NMAPIDictionaryWithObject_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_21A803000, v0, v1, "[NMAPIResponseParser] Expected a dictionary for %@ object: %@");
  OUTLINED_FUNCTION_3();
}

void NMAPIArrayWithObject_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_21A803000, v0, v1, "[NMAPIResponseParser] Expected an array for %@ object: %@");
  OUTLINED_FUNCTION_3();
}

void NMAPIStringWithObject_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_21A803000, v0, v1, "[NMAPIResponseParser] Expected a string for %@ object: %@");
  OUTLINED_FUNCTION_3();
}

void NMAPIDictionaryInSingleObjectArray_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "count");
  _os_log_error_impl(&dword_21A803000, a3, OS_LOG_TYPE_ERROR, "[NMAPIResponseParser] Invalid response due to %@ object count: %lu", (uint8_t *)&v4, 0x16u);
}

void MusicURLComponentsWithURLBag_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_21A803000, log, OS_LOG_TYPE_ERROR, "No host found for API domain requested (%{public}@): %{public}@", (uint8_t *)&v3, 0x16u);
}

void MusicURLComponentsWithURLBag_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21A803000, a2, OS_LOG_TYPE_ERROR, "No domains in music common dictionary of bag, can't generate URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

void MusicURLComponentsWithURLBag_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A803000, a1, a3, "No music subscription dictionary in bag, can't get subscription properties to generate URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void MusicURLPathStorefrontWithURLBag_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A803000, a1, a3, "No country code found in bag, can't create storefront endpoint URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void MusicURLQueryItemLanguageWithURLBag_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A803000, a1, a3, "No language found in bag, can't create storefront endpoint URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x24BDBD150]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x24BDBD168]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x24BDBD178]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

