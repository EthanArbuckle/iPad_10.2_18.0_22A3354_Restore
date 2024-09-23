void sub_230F01650(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    sub_230F01754(qword_255EABA80);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_230F00000, v3, OS_LOG_TYPE_ERROR, "Error setting the routine cloud sync provisioning state, %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

uint64_t sub_230F01714(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "provisionedDataclasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsObject:", *MEMORY[0x24BDB45B0]);

  return v2;
}

id sub_230F01754(dispatch_once_t *predicate)
{
  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_230F01798);
  return (id)predicate[2];
}

os_log_t sub_230F01798(uint64_t a1)
{
  os_log_t result;

  result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

