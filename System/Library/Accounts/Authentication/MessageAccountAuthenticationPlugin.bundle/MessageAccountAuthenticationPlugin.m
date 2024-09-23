BOOL sub_230E98D74(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  _BOOL8 v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  v9 = v6;
  if (v6
    && (objc_msgSend_password(v6, v7, v8), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    objc_msgSend_mf_legacyPasswordFromKeychain(v5, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15 != 0;
    if (v15)
    {
      objc_msgSend_setPassword_(v9, v14, (uint64_t)v15);
      objc_msgSend_mf_removeLegacyPasswordInKeychain(v5, v16, v17);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_230E98E0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_230E98E30()
{
  return 0;
}

uint64_t sub_230E98E38(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  v4 = a3;
  v7 = (void *)objc_msgSend_mf_accountClass(a1, v5, v6);
  v9 = objc_msgSend_migrateCredentialsIfNecessaryWithPersistentAccount_credential_(v7, v8, (uint64_t)a1, v4);

  return v9;
}

void sub_230E98E7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_230E98E8C(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;

  v4 = (void *)MEMORY[0x24BE66328];
  objc_msgSend_mf_hostname(a1, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_username(a1, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_mf_legacyPortNumberForKeychain(a1, v9, v10);
  v14 = objc_msgSend_mf_legacyKeychainProtocol(a1, v12, v13);
  objc_msgSend_passwordForHost_username_port_keychainProtocol_(v4, v15, (uint64_t)v5, v8, v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void sub_230E98F1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_230E98F38(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;

  v4 = (void *)MEMORY[0x24BE66328];
  objc_msgSend_mf_hostname(a1, a2, a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_username(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_mf_legacyPortNumberForKeychain(a1, v8, v9);
  v13 = objc_msgSend_mf_legacyKeychainProtocol(a1, v11, v12);
  objc_msgSend_removePasswordForHost_username_port_keychainProtocol_(v4, v14, (uint64_t)v15, v7, v10, v13);

}

void sub_230E98FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_230E98FDC(void *a1, const char *a2)
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v3 = (void *)objc_msgSend_accountClassForPersistentAccount_error_(MEMORY[0x24BE662C8], a2, (uint64_t)a1, &v16);
  v4 = v16;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_accountType(a1, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_230E97000, v7, OS_LOG_TYPE_DEFAULT, "#Warning failed to load class for account of type %@", buf, 0xCu);

    }
  }
  v14 = v3;

  return v14;
}

void sub_230E990F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_230E99128(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char isEqualToString;
  const char *v22;
  uint64_t v23;

  v4 = (void *)objc_msgSend_mf_accountClass(a1, a2, a3);
  objc_msgSend_accountProperties(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x24BE662A0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (objc_opt_respondsToSelector() & 1) == 0 || (v12 = objc_msgSend_intValue(v9, v10, v11), !(_DWORD)v12))
  {
    if (!objc_msgSend_mf_usesSSL(a1, v10, v11)
      || (v12 = objc_msgSend_defaultSecurePortNumber(v4, v10, v13), !(_DWORD)v12))
    {
      v12 = objc_msgSend_defaultPortNumber(v4, v10, v13);
    }
  }
  if (objc_msgSend_isCommonPortNumber_(v4, v10, v12))
  {
    objc_msgSend_accountType(a1, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x24BDB4118]);

    if ((isEqualToString & 1) != 0)
      v12 = 25;
    else
      v12 = objc_msgSend_defaultPortNumber(v4, v22, v23);
  }

  return v12;
}

void sub_230E99240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id sub_230E99274(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;

  v4 = (void *)objc_msgSend_mf_accountClass(a1, a2, a3);
  objc_msgSend_hostname(v4, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend_accountProperties(a1, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x24BE66298]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void sub_230E992D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_230E992E4(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend_mf_accountClass(a1, a2, a3);
  return MEMORY[0x24BEDD108](v3, sel_legacyKeychainProtocol, v4);
}

uint64_t sub_230E992F8(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v4 = (void *)objc_msgSend_mf_accountClass(a1, a2, a3);
  if ((objc_msgSend_usesSSL(v4, v5, v6) & 1) != 0)
    return 1;
  objc_msgSend_accountProperties(a1, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x24BE662A8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend_BOOLValue(v12, v13, v14);
  else
    v9 = 0;

  return v9;
}

void sub_230E99390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_230E99444(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_230E99600(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_230E99804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_230E99844(_QWORD *a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v6 = 0;
  objc_msgSend__verifyAccount_error_(v3, a2, v4, &v6);
  v5 = v6;
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_230E998A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_230E99944(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_230E99C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,void *a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_230E99CD8(uint64_t a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;

  if (!*(_BYTE *)(a1 + 72))
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_230E99E80;
    v10[3] = &unk_24FF9ADE0;
    v10[4] = v7;
    v11 = *(id *)(a1 + 32);
    v15 = *(_BYTE *)(a1 + 73);
    v12 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 64);
    v13 = *(id *)(a1 + 56);
    objc_msgSend__showPasswordPromptWithAccount_completionBlock_(v7, v9, v8, v10);

    v6 = v11;
    goto LABEL_5;
  }
  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend_setAuthenticated_(*(void **)(a1 + 32), a2, 1);
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_230E99E6C;
    v16[3] = &unk_24FF9AD90;
    v17 = *(id *)(a1 + 64);
    objc_msgSend_saveAccount_withHandler_(v3, v5, v4, v16);
    v6 = v17;
LABEL_5:

    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void sub_230E99E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{

  _Unwind_Resume(a1);
}

uint64_t sub_230E99E6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E99E80(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  int TokensIfNecessary;
  const char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;

  v5 = a3;
  v7 = v5;
  if (a2 != 3)
  {
    if (a2 == 1)
    {
      v8 = 0;
      objc_msgSend__logWithAccount_level_reason_message_(*(void **)(a1 + 32), v6, *(_QWORD *)(a1 + 40), 1, CFSTR("user cancelled credential renewal"), 0);
    }
    else if (v5)
    {
      objc_msgSend_setPassword_(*(void **)(a1 + 56), v6, (uint64_t)v5);
      v13 = *(void **)(a1 + 56);
      v29 = 0;
      TokensIfNecessary = objc_msgSend_fetchTokensIfNecessary_(v13, v14, (uint64_t)&v29);
      v8 = v29;
      if (TokensIfNecessary)
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("renewing credentials %s"), "succeeded");
      else
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("renewing credentials %s"), "failed");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend_description(v8, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__logWithAccount_level_reason_message_(v18, v23, v19, 1, v17, CFSTR("%@"), v22);

      v24 = (void *)MEMORY[0x24BE00E88];
      objc_msgSend_persistentAccount(*(void **)(a1 + 56), v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCredentialForAccount_(v24, v28, (uint64_t)v27);

    }
    else
    {
      v8 = 0;
    }
    goto LABEL_13;
  }
  objc_msgSend__logWithAccount_level_reason_message_(*(void **)(a1 + 32), v6, *(_QWORD *)(a1 + 40), 1, CFSTR("credential renewal was aborted"), 0);
  if (!*(_BYTE *)(a1 + 72))
  {
    v8 = 0;
LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_14;
  }
  objc_msgSend_setAuthenticated_(*(void **)(a1 + 40), v9, 1);
  v11 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = sub_230E9A0E4;
  v30[3] = &unk_24FF9ADB8;
  v31 = *(id *)(a1 + 64);
  v32 = 2;
  objc_msgSend_saveAccount_withHandler_(v10, v12, v11, v30);

  v8 = 0;
LABEL_14:

}

void sub_230E9A098(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t sub_230E9A0E4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t sub_230E9A0F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E9A4EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_230E9A61C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_230E9A6E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_230E9A8A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_230E9AAE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x24BDBC948](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t MFLogGeneral()
{
  return MEMORY[0x24BE666A8]();
}

uint64_t MFLookupLocalizedString()
{
  return MEMORY[0x24BE66228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

                           objc_msgSend_appendFormat_(v19, v22, (uint64_t)CFSTR(" %@"), v10);
  if (v9)
  {
    objc_msgSend_accountDescription(v9, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v9, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountType(v9, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v19, v34, (uint64_t)CFSTR(" for account %@ (%@) of type %@"), v24, v27, v33);

  }
  if (objc_msgSend_length(v11, v22, v23))
  {
    buf[0] = &v41;
    v35 = objc_alloc(MEMORY[0x24BDD17C8]);
    v37 = (void *)objc_msgSend_initWithFormat_arguments_(v35, v36, (uint64_t)v11, &v41);
    objc_msgSend_appendString_(v19, v38, (uint64_t)v37);

  }
  MFLogGeneral();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, (os_log_type_t)a4))
  {
    LODWORD(buf[0]) = 138412290;
    *(_QWORD *)((char *)buf + 4) = v19;
    _os_log_impl(&dword_230E97000, v39, (os_log_type_t)a4, "%@", (uint8_t *)buf, 0xCu);
  }

}

- (BOOL)_clientIsEntitled:(id)a3
{
  return MEMORY[0x24BEDD108](a3, sel_hasEntitlement_, *MEMORY[0x24BDB4450]);
}

@end
