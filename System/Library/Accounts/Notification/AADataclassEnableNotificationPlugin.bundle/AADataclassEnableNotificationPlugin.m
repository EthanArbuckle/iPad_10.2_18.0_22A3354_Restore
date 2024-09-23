id sub_230EB3FCC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v7 = (void *)objc_msgSend_mutableCopy(a1, v5, v6);
  objc_msgSend_removeObject_(v7, v8, (uint64_t)v4);

  v11 = (void *)objc_msgSend_copy(v7, v9, v10);
  return v11;
}

id sub_230EB401C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v7 = (void *)objc_msgSend_mutableCopy(a1, v5, v6);
  objc_msgSend_minusSet_(v7, v8, (uint64_t)v4);

  v11 = (void *)objc_msgSend_copy(v7, v9, v10);
  return v11;
}

uint64_t sub_230EB4248(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t canAutoEnableDataclass_forAccount;
  void *v8;
  const char *v9;

  v3 = a2;
  if ((objc_msgSend_isEnabledForDataclass_(*(void **)(a1 + 32), v4, (uint64_t)v3) & 1) != 0)
  {
    canAutoEnableDataclass_forAccount = 0;
  }
  else
  {
    objc_msgSend_sharedManager(AADataclassManager, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    canAutoEnableDataclass_forAccount = objc_msgSend_canAutoEnableDataclass_forAccount_(v8, v9, (uint64_t)v3, *(_QWORD *)(a1 + 32));

  }
  return canAutoEnableDataclass_forAccount;
}

void sub_230EB42BC(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138412290;
      v14 = v8;
      v9 = "Successfully enabled datclasses for account %@";
      v10 = v7;
      v11 = 12;
LABEL_7:
      _os_log_impl(&dword_230EB3000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v5)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      v9 = "Failed to enable dataclasses for account %@ with error %@";
      v10 = v7;
      v11 = 22;
      goto LABEL_7;
    }
LABEL_8:

  }
}

id sub_230EB43DC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v7 = (void *)objc_msgSend_mutableCopy(a1, v5, v6);
  objc_msgSend_removeObject_(v7, v8, (uint64_t)v4);

  v11 = (void *)objc_msgSend_copy(v7, v9, v10);
  return v11;
}

id sub_230EB442C(void *a1, uint64_t a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  const char *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v5, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, a2, a1, CFSTR("NSArray+AppleAccount.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v11 = objc_msgSend_count(a1, v9, v10);
  v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_230EB4548;
  v23[3] = &unk_24FF9ECA8;
  v24 = v13;
  v25 = v7;
  v14 = v13;
  v15 = v7;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v16, (uint64_t)v23);
  v19 = (void *)objc_msgSend_copy(v14, v17, v18);

  return v19;
}

void sub_230EB4548(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;

  v4 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend_addObject_(*(void **)(a1 + 32), v3, (uint64_t)v4);

}

id sub_230EB45B0(void *a1, uint64_t a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v12;
  const char *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, a2, a1, CFSTR("NSArray+AppleAccount.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  v8 = objc_msgSend_indexOfObjectPassingTest_(a1, v5, (uint64_t)v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndex_(a1, v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id sub_230EB4670(void *a1, uint64_t a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  const char *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v5, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, a2, a1, CFSTR("NSArray+AppleAccount.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v11 = objc_msgSend_count(a1, v9, v10);
  v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_230EB4790;
  v23[3] = &unk_24FF9ECD0;
  v24 = v13;
  v25 = v7;
  v14 = v7;
  v15 = v13;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v16, (uint64_t)v23);
  v19 = (void *)objc_msgSend_copy(v15, v17, v18);

  return v19;
}

void sub_230EB4790(uint64_t a1)
{
  void *v1;
  const char *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v1, v2, (uint64_t)v3);

}

id sub_230EB47D4(void *a1, uint64_t a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  const char *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v5, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, a2, a1, CFSTR("NSArray+AppleAccount.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v11 = objc_msgSend_count(a1, v9, v10);
  v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_230EB48F0;
  v23[3] = &unk_24FF9ECA8;
  v24 = v13;
  v25 = v7;
  v14 = v13;
  v15 = v7;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v16, (uint64_t)v23);
  v19 = (void *)objc_msgSend_copy(v14, v17, v18);

  return v19;
}

void sub_230EB48F0(uint64_t a1)
{
  char *v2;
  char *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (char *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend_addObject_(*(void **)(a1 + 32), v2, (uint64_t)v2);
    v2 = v3;
  }

}

uint64_t sub_230EB4940(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t isSubsetOfSet;

  v4 = (objc_class *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = [v4 alloc];
  v8 = (void *)objc_msgSend_initWithArray_(v6, v7, a1);
  v9 = objc_alloc(MEMORY[0x24BDBCF20]);
  v11 = (void *)objc_msgSend_initWithArray_(v9, v10, (uint64_t)v5);

  isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v8, v12, (uint64_t)v11);
  return isSubsetOfSet;
}

id sub_230EB49BC(void *a1, const char *a2, uint64_t a3)
{
  const char *v4;
  void *v5;
  const char *v6;

  if (objc_msgSend_count(a1, a2, a3))
  {
    objc_msgSend_objectAtIndex_(a1, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectAtIndex_(a1, v6, 0);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id sub_230EB4A0C(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lastObject(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeLastObject(a1, v5, v6);
  return v4;
}

void sub_230EB4AE4()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)qword_255EAA698;
  qword_255EAA698 = v0;

}

void sub_230EB4B50()
{
  id v0;
  const char *v1;
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  void *v12;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v1, (uint64_t)CFSTR("DisableBookmarksiCloudSetting"), *MEMORY[0x24BDB3DB0]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v2, (uint64_t)CFSTR("DisableFMMiCloudSetting"), *MEMORY[0x24BDB3E00]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v3, (uint64_t)CFSTR("DisableAddressBookiCloudSetting"), *MEMORY[0x24BDB3DE8]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v4, (uint64_t)CFSTR("DisableCalendariCloudSetting"), *MEMORY[0x24BDB3DD8]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v5, (uint64_t)CFSTR("DisableMailiCloudSetting"), *MEMORY[0x24BDB3E38]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v6, (uint64_t)CFSTR("DisableNotesiCloudSetting"), *MEMORY[0x24BDB3E68]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v7, (uint64_t)CFSTR("DisableRemindersiCloudSetting"), *MEMORY[0x24BDB3E88]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v8, (uint64_t)CFSTR("DisableKeychainCloudSync"), *MEMORY[0x24BDB3E30]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v9, (uint64_t)CFSTR("DisableCloudSync"), *MEMORY[0x24BDB3EC8]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v10, (uint64_t)CFSTR("DisablePhotosiCloudSetting"), *MEMORY[0x24BDB3E78]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v11, (uint64_t)CFSTR("DisableFreeformiCloudSetting"), *MEMORY[0x24BDB3E10]);
  v12 = (void *)qword_255EAA6A8;
  qword_255EAA6A8 = (uint64_t)v0;

}

void sub_230EB5730()
{
  AADataclassManager *v0;
  void *v1;

  v0 = objc_alloc_init(AADataclassManager);
  v1 = (void *)qword_255EAA6B8;
  qword_255EAA6B8 = (uint64_t)v0;

}

void sub_230EB586C()
{
  const char *v0;
  const char *v1;
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v0, (uint64_t)CFSTR("com.apple.mobilesafari"), *MEMORY[0x24BDB3DB0]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v1, (uint64_t)CFSTR("com.apple.mobilecal"), *MEMORY[0x24BDB3DD8]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v2, (uint64_t)CFSTR("com.apple.MobileAddressBook"), *MEMORY[0x24BDB3DE8]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v3, (uint64_t)CFSTR("com.apple.freeform"), *MEMORY[0x24BDB3E10]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v4, (uint64_t)CFSTR("com.apple.Home"), *MEMORY[0x24BDB3E20]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v5, (uint64_t)CFSTR("com.apple.mobilemail"), *MEMORY[0x24BDB3E38]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v6, (uint64_t)CFSTR("com.apple.news"), *MEMORY[0x24BDB3E60]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v7, (uint64_t)CFSTR("com.apple.mobilenotes"), *MEMORY[0x24BDB3E68]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v8, (uint64_t)CFSTR("com.apple.reminders"), *MEMORY[0x24BDB3E88]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v9, (uint64_t)CFSTR("com.apple.stocks"), *MEMORY[0x24BDB3EC0]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v10, (uint64_t)CFSTR("com.apple.MobileSMS"), *MEMORY[0x24BDB3E48]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v11, (uint64_t)CFSTR("com.apple.Health"), *MEMORY[0x24BDB3E18]);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v12, (uint64_t)CFSTR("com.apple.DocumentsApp"), *MEMORY[0x24BDB3EC8]);
  v15 = objc_msgSend_copy(v17, v13, v14);
  v16 = (void *)qword_255EAA6C8;
  qword_255EAA6C8 = v15;

}

void sub_230EB5B70(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[10];
  _QWORD v18[11];

  v18[10] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE638C0];
  v3 = *MEMORY[0x24BDB3E40];
  v17[0] = *MEMORY[0x24BDB3E28];
  v17[1] = v3;
  v4 = *MEMORY[0x24BE63A68];
  v18[0] = v2;
  v18[1] = v4;
  v5 = *MEMORY[0x24BE63AA8];
  v6 = *MEMORY[0x24BDB3EB0];
  v17[2] = *MEMORY[0x24BDB3EA8];
  v17[3] = v6;
  v7 = *MEMORY[0x24BE63840];
  v18[2] = v5;
  v18[3] = v7;
  v8 = *MEMORY[0x24BE638B8];
  v9 = *MEMORY[0x24BDB3E00];
  v17[4] = *MEMORY[0x24BDB3DA8];
  v17[5] = v9;
  v10 = *MEMORY[0x24BE63920];
  v18[4] = v8;
  v18[5] = v10;
  v11 = *MEMORY[0x24BE63950];
  v12 = *MEMORY[0x24BDB3E20];
  v17[6] = *MEMORY[0x24BDB3E18];
  v17[7] = v12;
  v13 = *MEMORY[0x24BE63960];
  v18[6] = v11;
  v18[7] = v13;
  v14 = *MEMORY[0x24BDB3EC8];
  v17[8] = *MEMORY[0x24BDB3E60];
  v17[9] = v14;
  v18[8] = *MEMORY[0x24BE63A20];
  v18[9] = v2;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v18, v17, 10);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)qword_255EAA6D8;
  qword_255EAA6D8 = v15;

}

void sub_230EB601C(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB3DE8];
  v7[0] = *MEMORY[0x24BDB3DD8];
  v7[1] = v2;
  v3 = *MEMORY[0x24BDB3E20];
  v7[2] = *MEMORY[0x24BDB3E18];
  v7[3] = v3;
  v4 = *MEMORY[0x24BDB3EC8];
  v7[4] = *MEMORY[0x24BDB3E88];
  v7[5] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v7, 6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_255EAA6E8;
  qword_255EAA6E8 = v5;

}

void sub_230EB6B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_230EB6B64(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_230EB6B74(uint64_t a1)
{

}

void sub_230EB6B7C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void (*v7)(void);
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_230EB7E40();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_230EB3000, v6, OS_LOG_TYPE_DEFAULT, "Save without auto-enableable dataclasses successful completed.", v10, 2u);
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

void sub_230EB6EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230EB6EE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD *WeakRetained;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  if (v5)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("dataclasses"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v5, v9, (uint64_t)CFSTR("dataclassActions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_230EB3000, v11, OS_LOG_TYPE_DEFAULT, "Filtered dataclasses: %@", (uint8_t *)&buf, 0xCu);
    }

    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_230EB3000, v12, OS_LOG_TYPE_DEFAULT, "Filtered dataclass actions: %@", (uint8_t *)&buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v28 = 0x3032000000;
      v29 = sub_230EB6B64;
      v30 = sub_230EB6B74;
      v31 = (id)os_transaction_create();
      v14 = (void *)WeakRetained[1];
      v15 = *(void **)(a1 + 32);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = sub_230EB7208;
      v22[3] = &unk_24FF9EE10;
      v23 = v15;
      v24 = v10;
      v25 = *(id *)(a1 + 40);
      p_buf = &buf;
      objc_msgSend_saveAccount_withDataclassActions_doVerify_completion_(v14, v16, (uint64_t)v23, v24, 1, v22);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      _AALogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_230EB7F00(v18);

      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, *MEMORY[0x24BE048B0], -8015, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v21);

    }
  }
  else
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_230EB7EA0();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_230EB71E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230EB7208(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    v8 = a1[4];
    v9 = a1[5];
    if (a2)
      v7 = CFSTR("YES");
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_230EB3000, v6, OS_LOG_TYPE_DEFAULT, "Account save with dataclass actions had success (%@) for account (%@) with dataclass actions: %@", (uint8_t *)&v13, 0x20u);
  }

  if (v5)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_230EB7F40();

  }
  (*(void (**)(void))(a1[6] + 16))();
  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

void sub_230EB7668(void **a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend_count(v6, v7, v8))
  {
    v11 = objc_msgSend_count(v6, v9, v10);
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 == 1)
    {
      if (v13)
      {
        objc_msgSend_objectAtIndexedSubscript_(v6, v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 134218242;
        v32 = objc_msgSend_type(v15, v16, v17);
        v33 = 2112;
        v34 = (uint64_t)v5;
        _os_log_impl(&dword_230EB3000, v12, OS_LOG_TYPE_DEFAULT, "Action %lu available for %@", (uint8_t *)&v31, 0x16u);

      }
      objc_msgSend_firstObject(v6, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isDataclassActionSafeForAutoEnablement_(a1[4], v21, (uint64_t)v20))
      {
        objc_msgSend_setObject_forKey_(a1[5], v22, (uint64_t)v20, v5);
      }
      else
      {
        _ACLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v28 = objc_msgSend_type(v20, v26, v27);
          v31 = 138412546;
          v32 = (uint64_t)v5;
          v33 = 2048;
          v34 = v28;
          _os_log_impl(&dword_230EB3000, v25, OS_LOG_TYPE_DEFAULT, "\"Not enabling dataclass %@ as only action %lu is not safe for auto enablement.\"", (uint8_t *)&v31, 0x16u);
        }

        objc_msgSend_removeObject_(a1[6], v29, (uint64_t)v5);
        objc_msgSend_setEnabled_forDataclass_(a1[7], v30, 0, v5);
      }

    }
    else
    {
      if (v13)
      {
        v31 = 138412290;
        v32 = (uint64_t)v5;
        _os_log_impl(&dword_230EB3000, v12, OS_LOG_TYPE_DEFAULT, "Unable to auto-enable dataclass %@ as enablement requires a user decision.", (uint8_t *)&v31, 0xCu);
      }

      objc_msgSend_removeObject_(a1[6], v23, (uint64_t)v5);
      objc_msgSend_setEnabled_forDataclass_(a1[7], v24, 0, v5);
    }
  }

}

uint64_t sub_230EB7940(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t canAutoEnableDataclass_forAccount;
  void *v9;
  const char *v10;

  v3 = a2;
  if (objc_msgSend_isProvisionedForDataclass_(*(void **)(a1 + 32), v4, (uint64_t)v3)
    && (objc_msgSend_isEnabledForDataclass_(*(void **)(a1 + 32), v5, (uint64_t)v3) & 1) == 0)
  {
    objc_msgSend_sharedManager(AADataclassManager, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    canAutoEnableDataclass_forAccount = objc_msgSend_canAutoEnableDataclass_forAccount_(v9, v10, (uint64_t)v3, *(_QWORD *)(a1 + 32));

  }
  else
  {
    canAutoEnableDataclass_forAccount = 0;
  }

  return canAutoEnableDataclass_forAccount;
}

void sub_230EB79E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_230EB79F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_230EB7A18(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = qword_255EAA698;
  _os_log_debug_impl(&dword_230EB3000, log, OS_LOG_TYPE_DEBUG, "Current device model: %@", (uint8_t *)&v1, 0xCu);
}

void sub_230EB7A98(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230EB3000, a2, OS_LOG_TYPE_DEBUG, "Policy identifier does not exist for %@", (uint8_t *)&v2, 0xCu);
}

void sub_230EB7B0C(uint64_t a1, char a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("YES");
  if ((a2 & 1) == 0)
    v3 = CFSTR("NO");
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_230EB3000, log, OS_LOG_TYPE_DEBUG, "Policy restriction for %@ is %@", (uint8_t *)&v4, 0x16u);
}

void sub_230EB7BA8()
{
  __assert_rtn("-[AADataclassManager filteredServerProvidedFeatures:forAccount:]", "AADataclassManager.m", 235, "[dataclass isKindOfClass:[NSString class]]");
}

void sub_230EB7BD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EB7A0C();
  sub_230EB79E4(&dword_230EB3000, v0, v1, "Nil bundle ID passed. No reason to consider restricted or removed for dataclass %@", v2, v3, v4, v5, v6);
  sub_230EB7A04();
}

void sub_230EB7C30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EB7A0C();
  sub_230EB79E4(&dword_230EB3000, v0, v1, "Error creating appRecord. No reason to consider restricted or removed for dataclass %@", v2, v3, v4, v5, v6);
  sub_230EB7A04();
}

void sub_230EB7C90()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sub_230EB7A0C();
  v3 = 2112;
  v4 = v0;
  v5 = 2112;
  v6 = CFSTR("YES");
  _os_log_debug_impl(&dword_230EB3000, v1, OS_LOG_TYPE_DEBUG, "Dataclass %@ with bundleid %@ is installed or placeholder: %@", v2, 0x20u);
}

void sub_230EB7D20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EB7A0C();
  sub_230EB79E4(&dword_230EB3000, v0, v1, "System app is restricted or removed for dataclass %@", v2, v3, v4, v5, v6);
  sub_230EB7A04();
}

void sub_230EB7D80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EB7A0C();
  sub_230EB79E4(&dword_230EB3000, v0, v1, "Notes is migrated, so we won't provision it for this basic account %@", v2, v3, v4, v5, v6);
  sub_230EB7A04();
}

void sub_230EB7DE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EB7A0C();
  sub_230EB79E4(&dword_230EB3000, v0, v1, "Reminders is migrated, so we won't provision it for this basic account %@", v2, v3, v4, v5, v6);
  sub_230EB7A04();
}

void sub_230EB7E40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EB7A0C();
  sub_230EB79F4(&dword_230EB3000, v0, v1, "Failed to save account without auto-enableable dataclasses with error: %@", v2, v3, v4, v5, v6);
  sub_230EB7A04();
}

void sub_230EB7EA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EB7A0C();
  sub_230EB79F4(&dword_230EB3000, v0, v1, "Unable to build list of dataclasses and actions for enablement %@", v2, v3, v4, v5, v6);
  sub_230EB7A04();
}

void sub_230EB7F00(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230EB3000, log, OS_LOG_TYPE_ERROR, "AADataclassManager failed to maintain ref to self.", v1, 2u);
}

void sub_230EB7F40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EB7A0C();
  sub_230EB79F4(&dword_230EB3000, v0, v1, "Encountered error when saving with dataclass actions: %@", v2, v3, v4, v5, v6);
  sub_230EB7A04();
}

void sub_230EB7FA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EB7A0C();
  sub_230EB79F4(&dword_230EB3000, v0, v1, "Failed to get dataclass actions for account, error: %@", v2, v3, v4, v5, v6);
  sub_230EB7A04();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t _AALogSystem()
{
  return MEMORY[0x24BE04AA8]();
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x24BDB4428]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

