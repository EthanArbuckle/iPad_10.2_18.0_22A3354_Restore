id sub_230F5F534()
{
  return (id)qword_255EAD7E0;
}

uint64_t sub_230F5F540()
{
  void *v0;
  uint64_t v1;

  if (qword_25414C408 != -1)
    dispatch_once(&qword_25414C408, &unk_24FFBE790);
  if (!byte_25414C400)
    return 0;
  objc_msgSend((id)qword_25414C410, "currentUser");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isLoginUser") ^ 1;

  return v1;
}

uint64_t sub_230F5F5B8(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "compare:options:", *MEMORY[0x24BDB3FD8], 4))
    v4 = 0;
  else
    v4 = objc_msgSend(v1, "aa_isManagedAppleID");

  return v4;
}

void sub_230F5F634(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sub_230F5F534();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_230F5FE2C();

}

void sub_230F5FAD0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    sub_230F5F534();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_230F5FECC();
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB68]);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("com.apple.idms.config.KCKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE17B80]), "initWithUserActivityLabel:", CFSTR("EMCS credential change"));
      v9 = *MEMORY[0x24BE17C08];
      v17[0] = *MEMORY[0x24BE17BD8];
      v17[1] = v9;
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v18[0] = MEMORY[0x24BDBD1C8];
      v18[1] = v10;
      v12 = *MEMORY[0x24BE17BF8];
      v17[2] = *MEMORY[0x24BE17C00];
      v17[3] = v12;
      v18[2] = v11;
      v18[3] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_230F5FCCC;
      v14[3] = &unk_24FFBE728;
      v15 = *(id *)(a1 + 48);
      v16 = *(id *)(a1 + 56);
      -[NSObject enableWithInfo:completionBlock:](v8, "enableWithInfo:completionBlock:", v13, v14);

    }
    else
    {
      sub_230F5F534();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_230F5FE8C(v8);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void sub_230F5FCCC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  sub_230F5F534();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_230F5FE2C();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
    objc_msgSend(*(id *)(a1 + 32), "credential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCredentialItem:forKey:", 0, CFSTR("old-password"));

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t sub_230F5FD60()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_25414C410;
  qword_25414C410 = v0;

  result = objc_msgSend((id)qword_25414C410, "isMultiUser");
  byte_25414C400 = result;
  return result;
}

void sub_230F5FDA8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_230F5FDCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F5FDC0();
  sub_230F5FDA8(&dword_230F5E000, v0, v1, "SecureBackup backup returned %@", v2, v3, v4, v5, v6);
  sub_230F5FDB8();
}

void sub_230F5FE2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F5FDC0();
  sub_230F5FDA8(&dword_230F5E000, v0, v1, "error from SecureBackup enableWithInfo: %@", v2, v3, v4, v5, v6);
  sub_230F5FDB8();
}

void sub_230F5FE8C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230F5E000, log, OS_LOG_TYPE_ERROR, "no EMCS IdMS dict", v1, 2u);
}

void sub_230F5FECC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F5FDC0();
  sub_230F5FDA8(&dword_230F5E000, v0, v1, "error from authenticateWithContext: %@", v2, v3, v4, v5, v6);
  sub_230F5FDB8();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

