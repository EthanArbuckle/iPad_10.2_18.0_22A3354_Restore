void sub_1D4F36734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DEPLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _bundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("DEPLocalizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _bundle()
{
  if (_bundle_once != -1)
    dispatch_once(&_bundle_once, &__block_literal_global);
  return (id)_bundle_bundle;
}

id DEPUSEnglishString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _bundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:localization:", v1, 0, CFSTR("DEPLocalizable"), CFSTR("en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DEPErrorArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10)
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  id *v18;

  v10 = a1;
  v11 = (void *)objc_opt_new();
  _DEPStashFormattedStringInArray(v11, v10, 0, (uint64_t)&a9);
  _DEPStashFormattedStringInArray(v11, v10, 1, (uint64_t)&a9);
  v12 = v11;
  v18 = (id *)&a10;
  v13 = a9;
  if (v13)
  {
    v14 = v13;
    do
    {
      objc_msgSend(v12, "addObject:", v14);
      v15 = v18++;
      v16 = *v15;

      v14 = v16;
    }
    while (v16);
  }

  return v12;
}

void _DEPStashFormattedStringInArray(void *a1, void *a2, int a3, uint64_t a4)
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a2;
  v8 = a1;
  v9 = [v6 alloc];
  if (a3)
  {
    DEPUSEnglishString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (DEPUSEnglishLocale_once != -1)
      dispatch_once(&DEPUSEnglishLocale_once, &__block_literal_global_35);
    v11 = (void *)objc_msgSend(v9, "initWithFormat:locale:arguments:", v10, DEPUSEnglishLocale_locale, a4, a4, a4);
    objc_msgSend(v8, "addObject:", v11);
  }
  else
  {
    DEPLocalizedString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithFormat:locale:arguments:", v10, v11, a4);
    objc_msgSend(v8, "addObject:", v12);

    v8 = (id)v12;
  }

}

void ___bundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_bundle_bundle;
  _bundle_bundle = v0;

}

uint64_t *DEPLogObjects()
{
  if (DEPLogObjects_onceToken != -1)
    dispatch_once(&DEPLogObjects_onceToken, &__block_literal_global_0);
  return &DEPLogObjects__DEPLogObjects;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

