id defaultFormatter()
{
  if (defaultFormatter_onceToken != -1)
    dispatch_once(&defaultFormatter_onceToken, &__block_literal_global_555);
  return (id)defaultFormatter_formatter;
}

void sub_21D91CDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21D91CFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSubstring(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = v9;
  if (a4)
    v11 = 4;
  else
    v11 = 0;
  if (!v8)
  {
    v14 = 0;
    if (v9)
    {
LABEL_7:
      v15 = objc_msgSend(v7, "rangeOfString:options:", v10, v11);
      if (!v16)
        goto LABEL_8;
LABEL_11:
      objc_msgSend(v7, "substringWithRange:", v14, v15 - v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v12 = objc_msgSend(v7, "rangeOfString:", v8);
  if (v13)
  {
    v14 = v12 + v13;
    if (v10)
      goto LABEL_7;
    goto LABEL_10;
  }
LABEL_8:
  v17 = 0;
LABEL_12:

  return v17;
}

__CFString *getIntervalString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  const __CFString *v9;
  __CFString *v10;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  v6 = objc_msgSend(v4, "isEqualToDate:", v3);
  v7 = 0.5;
  v8 = 0.5;
  if ((v6 & 1) != 0)
    goto LABEL_3;
  objc_msgSend(v5, "timeIntervalSinceDate:", v3, 0.5, 0.5);
  if (v7 < 0.0)
  {
LABEL_7:
    v10 = &stru_24E138A50;
    goto LABEL_8;
  }
  if (v7 < 3600.0)
  {
    if (v7 >= 60.0)
      v8 = v7 / 60.0;
    else
      v8 = v7;
LABEL_3:
    v9 = CFSTR("minutes");
    if (v7 < 60.0)
      v9 = CFSTR("seconds");
    goto LABEL_5;
  }
  v9 = CFSTR("hours");
  v8 = v7 / 3600.0;
LABEL_5:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%3.2lf %@"), *(_QWORD *)&v8, v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v10;
}

void sub_21D922EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_21D923178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __defaultFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)defaultFormatter_formatter;
  defaultFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)defaultFormatter_formatter, "setDateStyle:", 1);
  objc_msgSend((id)defaultFormatter_formatter, "setTimeStyle:", 2);
  v2 = (void *)defaultFormatter_formatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

void __timeOnlyFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)timeOnlyFormatter_timeOnlyFormatter;
  timeOnlyFormatter_timeOnlyFormatter = (uint64_t)v0;

  objc_msgSend((id)timeOnlyFormatter_timeOnlyFormatter, "setDateStyle:", 0);
  objc_msgSend((id)timeOnlyFormatter_timeOnlyFormatter, "setTimeStyle:", 2);
  v2 = (void *)timeOnlyFormatter_timeOnlyFormatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

