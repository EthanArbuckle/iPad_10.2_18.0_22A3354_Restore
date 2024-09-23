void sub_2172C36C0(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6 = a3;
  objc_msgSend(v5, "profileDataForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToData:", v6);

  if ((v8 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

void sub_2172C3744(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v4);

}

id CorrectionsProfilesDigest(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "sortUsingComparator:", &unk_24D7297F0);
  AFSecurityDigestChunksWithProvider();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (v5)
  {
    v6 = *MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "CorrectionsProfilesDigest";
      v15 = 2112;
      v16 = v1;
      v17 = 2112;
      v18 = v5;
      _os_log_error_impl(&dword_2172C1000, v6, OS_LOG_TYPE_ERROR, "%s Error creating digest for correction profiles %@: %@", buf, 0x20u);
    }
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "length");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 2 * v8);
    v9 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    if (v8)
    {
      v10 = (unsigned __int8 *)v9;
      do
      {
        v11 = *v10++;
        objc_msgSend(v7, "appendFormat:", CFSTR("%02x"), v11);
        --v8;
      }
      while (v8);
    }
  }

  return v7;
}

uint64_t sub_2172C4328(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t AFSecurityDigestChunksWithProvider()
{
  return MEMORY[0x24BE08F50]();
}

uint64_t AFUserSupportDirectoryPath()
{
  return MEMORY[0x24BE09090]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

