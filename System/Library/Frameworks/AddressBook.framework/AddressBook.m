id sABSValueToABValueTransform_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE19240], "dateFromDayComponents:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id sABValueToABSValueTransform_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE19240], "dayComponentsFromDate:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

Class initCNAssistantConversion()
{
  Class result;

  if (LoadContactsAssistantServices_loadPredicate != -1)
    dispatch_once(&LoadContactsAssistantServices_loadPredicate, &__block_literal_global_2);
  result = objc_getClass("CNAssistantConversion");
  classCNAssistantConversion = (uint64_t)result;
  getCNAssistantConversionClass = (uint64_t (*)())CNAssistantConversionFunction;
  return result;
}

id CNAssistantConversionFunction()
{
  return (id)classCNAssistantConversion;
}

void sub_20A3098A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20A309A5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A309BCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A309D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t ABSIsLogEnabled(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ABS%@LogEnabled"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE192E8], "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedInToPreference:", v1);

  return v3;
}

uint64_t ABSIsAPILogEnabled()
{
  if (ABSIsAPILogEnabled_onceToken != -1)
    dispatch_once(&ABSIsAPILogEnabled_onceToken, &__block_literal_global_4);
  return ABSIsAPILogEnabled_result;
}

uint64_t ABSRecordGetTypeID()
{
  if (gABRegisteredWithCF != -1)
    dispatch_once(&gABRegisteredWithCF, &__block_literal_global_5);
  return kABCRecordTypeID;
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  void *v6;
  const void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v2 = *(_QWORD *)&property;
  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        v5 = "YES";
      else
        v5 = "NO";
      +[ABSPerson nameForProperty:](ABSPerson, "nameForProperty:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = v5;
      v12 = 2080;
      v13 = "CFTypeRef ABRecordCopyValue(ABRecordRef, ABPropertyID)";
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);

    }
  }
  v7 = (const void *)objc_msgSend((id)record, "copyValueForProperty:", v2);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "CFTypeRef ABRecordCopyValue(ABRecordRef, ABPropertyID)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

BOOL ABRecordSetValue(ABRecordRef record, ABPropertyID property, CFTypeRef value, CFErrorRef *error)
{
  uint64_t v6;
  NSObject *v8;
  int v9;
  const char *v10;
  char v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v6 = *(_QWORD *)&property;
  v20 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v10 = "NO";
      if (v9)
        v10 = "YES";
      v14 = 136315650;
      v15 = v10;
      v16 = 2080;
      v17 = "_Bool ABRecordSetValue(ABRecordRef, ABPropertyID, CFTypeRef, CFErrorRef *)";
      v18 = 2112;
      v19 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v14, 0x20u);
    }

  }
  v11 = objc_msgSend((id)record, "setValue:forProperty:withError:", value, v6, error);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "_Bool ABRecordSetValue(ABRecordRef, ABPropertyID, CFTypeRef, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

BOOL ABRecordRemoveValue(ABRecordRef record, ABPropertyID property, CFErrorRef *error)
{
  uint64_t v4;
  NSObject *v6;
  int v7;
  const char *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = *(_QWORD *)&property;
  v21 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      *(_DWORD *)buf = 136315650;
      v16 = v8;
      v17 = 2080;
      v18 = "_Bool ABRecordRemoveValue(ABRecordRef, ABPropertyID, CFErrorRef *)";
      v19 = 2112;
      v20 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  v14 = 0;
  v9 = objc_msgSend((id)record, "removeProperty:withError:", v4, &v14);
  v10 = v14;
  v11 = v10;
  if (error && (v9 & 1) == 0)
    *error = (CFErrorRef)v10;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "_Bool ABRecordRemoveValue(ABRecordRef, ABPropertyID, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v9;
}

CFStringRef ABRecordCopyCompositeName(ABRecordRef record)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v9 = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "CFStringRef ABRecordCopyCompositeName(ABRecordRef)";
      v13 = 2112;
      v14 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend((id)record, "compositeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFString *)objc_msgSend(v5, "copy");

  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "CFStringRef ABRecordCopyCompositeName(ABRecordRef)";
      _os_log_impl(&dword_20A301000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

ABRecordRef ABGroupCreate(void)
{
  NSObject *v0;
  int v1;
  const char *v2;
  ABSGroup *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v2 = "NO";
      if (v1)
        v2 = "YES";
      v6 = 136315650;
      v7 = v2;
      v8 = 2080;
      v9 = "ABRecordRef ABGroupCreate(void)";
      v10 = 2112;
      v11 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }

  }
  ABSRecordGetTypeID();
  v3 = objc_alloc_init(ABSGroup);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "ABRecordRef ABGroupCreate(void)";
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

ABRecordRef ABGroupCreateInSource(ABRecordRef source)
{
  NSObject *v2;
  int v3;
  const char *v4;
  ABSGroup *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "ABRecordRef ABGroupCreateInSource(ABRecordRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v5 = -[ABSGroup initWithSource:]([ABSGroup alloc], "initWithSource:", source);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "ABRecordRef ABGroupCreateInSource(ABRecordRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

ABRecordRef ABGroupCopySource(ABRecordRef group)
{
  NSObject *v2;
  int v3;
  const char *v4;
  const void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "ABRecordRef ABGroupCopySource(ABRecordRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  objc_msgSend((id)group, "source");
  v5 = (const void *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "ABRecordRef ABGroupCopySource(ABRecordRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

CFArrayRef ABGroupCopyArrayOfAllMembers(ABRecordRef group)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  const __CFArray *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v9 = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "CFArrayRef ABGroupCopyArrayOfAllMembers(ABRecordRef)";
      v13 = 2112;
      v14 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend((id)group, "addressBook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peopleInGroup:sortOrder:", group, 0xFFFFFFFFLL);
  v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "CFArrayRef ABGroupCopyArrayOfAllMembers(ABRecordRef)";
      _os_log_impl(&dword_20A301000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

CFArrayRef ABGroupCopyArrayOfAllMembersWithSortOrdering(ABRecordRef group, ABPersonSortOrdering sortOrdering)
{
  uint64_t v2;
  NSObject *v4;
  int v5;
  const char *v6;
  void *v7;
  const __CFArray *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v2 = *(_QWORD *)&sortOrdering;
  v17 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v11 = 136315650;
      v12 = v6;
      v13 = 2080;
      v14 = "CFArrayRef ABGroupCopyArrayOfAllMembersWithSortOrdering(ABRecordRef, ABPersonSortOrdering)";
      v15 = 2112;
      v16 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v11, 0x20u);
    }

  }
  objc_msgSend((id)group, "addressBook");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "peopleInGroup:sortOrder:", group, v2);
  v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "CFArrayRef ABGroupCopyArrayOfAllMembersWithSortOrdering(ABRecordRef, ABPersonSortOrdering)";
      _os_log_impl(&dword_20A301000, v9, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v11, 0xCu);
    }

  }
  return v8;
}

BOOL ABGroupAddMember(ABRecordRef group, ABRecordRef person, CFErrorRef *error)
{
  NSObject *v6;
  int v7;
  const char *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      *(_DWORD *)buf = 136315650;
      v17 = v8;
      v18 = 2080;
      v19 = "_Bool ABGroupAddMember(ABRecordRef, ABRecordRef, CFErrorRef *)";
      v20 = 2112;
      v21 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  objc_msgSend((id)group, "addressBook");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v9, "addMember:toGroup:error:", person, group, &v15);
  v11 = v15;
  v12 = v11;
  if ((v10 & 1) == 0 && error && v11)
    *error = (CFErrorRef)v11;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "_Bool ABGroupAddMember(ABRecordRef, ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v13, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v10;
}

BOOL ABGroupRemoveMember(ABRecordRef group, ABRecordRef member, CFErrorRef *error)
{
  NSObject *v6;
  int v7;
  const char *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      *(_DWORD *)buf = 136315650;
      v17 = v8;
      v18 = 2080;
      v19 = "_Bool ABGroupRemoveMember(ABRecordRef, ABRecordRef, CFErrorRef *)";
      v20 = 2112;
      v21 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  objc_msgSend((id)group, "addressBook");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v9, "removeMember:fromGroup:error:", member, group, &v15);
  v11 = v15;
  v12 = v11;
  if ((v10 & 1) == 0 && error && v11)
    *error = (CFErrorRef)v11;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "_Bool ABGroupRemoveMember(ABRecordRef, ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v13, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v10;
}

ABRecordRef ABAddressBookGetGroupWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  uint64_t v2;
  NSObject *v4;
  int v5;
  const char *v6;
  const void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v2 = *(_QWORD *)&recordID;
  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "ABRecordRef ABAddressBookGetGroupWithRecordID(ABAddressBookRef, ABRecordID)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v7 = (const void *)objc_msgSend((id)addressBook, "groupWithRecordID:", v2);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "ABRecordRef ABAddressBookGetGroupWithRecordID(ABAddressBookRef, ABRecordID)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

CFIndex ABAddressBookGetGroupCount(ABAddressBookRef addressBook)
{
  NSObject *v2;
  int v3;
  const char *v4;
  CFIndex v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "CFIndex ABAddressBookGetGroupCount(ABAddressBookRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v5 = objc_msgSend((id)addressBook, "groupCount");
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "CFIndex ABAddressBookGetGroupCount(ABAddressBookRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

CFArrayRef ABAddressBookCopyArrayOfAllGroups(ABAddressBookRef addressBook)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  const __CFArray *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v9 = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "CFArrayRef ABAddressBookCopyArrayOfAllGroups(ABAddressBookRef)";
      v13 = 2112;
      v14 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "allGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFArray *)objc_msgSend(v5, "copy");

  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "CFArrayRef ABAddressBookCopyArrayOfAllGroups(ABAddressBookRef)";
      _os_log_impl(&dword_20A301000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

CFArrayRef ABAddressBookCopyArrayOfAllGroupsInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  NSObject *v4;
  int v5;
  const char *v6;
  const __CFArray *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "CFArrayRef ABAddressBookCopyArrayOfAllGroupsInSource(ABAddressBookRef, ABRecordRef)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "groupsInSource:", source);
  v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "CFArrayRef ABAddressBookCopyArrayOfAllGroupsInSource(ABAddressBookRef, ABRecordRef)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

uint64_t ABSAddressBookGetTypeID()
{
  if (gABRegisteredWithCF_0 != -1)
    dispatch_once(&gABRegisteredWithCF_0, &__block_literal_global_6);
  return kABCAddressBookTypeID;
}

ABAuthorizationStatus ABAddressBookGetAuthorizationStatus(void)
{
  return +[ABSAddressBook authorizationStatus](ABSAddressBook, "authorizationStatus");
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  NSObject *v4;
  int v5;
  const char *v6;
  ABSAddressBook *v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      *(_DWORD *)buf = 136315650;
      v16 = v6;
      v17 = 2080;
      v18 = "ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef, CFErrorRef *)";
      v19 = 2112;
      v20 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  if (gABRegisteredWithCF_0 != -1)
    dispatch_once(&gABRegisteredWithCF_0, &__block_literal_global_6);
  v14 = 0;
  v7 = -[ABSAddressBook initWithOptions:error:]([ABSAddressBook alloc], "initWithOptions:error:", options, &v14);
  v8 = v14;
  v9 = v8;
  if (v7)
    v10 = 1;
  else
    v10 = error == 0;
  if (!v10 && v8 != 0)
    *error = (CFErrorRef)v8;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v7;
}

ABSAddressBook *ABAddressBookCreateWithOptionsAndPolicy(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  NSObject *v6;
  int v7;
  const char *v8;
  ABSAddressBook *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      *(_DWORD *)buf = 136315650;
      v16 = v8;
      v17 = 2080;
      v18 = "ABAddressBookRef ABAddressBookCreateWithOptionsAndPolicy(CFDictionaryRef, ABCreatePolicy, CFErrorRef *)";
      v19 = 2112;
      v20 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  if (gABRegisteredWithCF_0 != -1)
    dispatch_once(&gABRegisteredWithCF_0, &__block_literal_global_6);
  v14 = 0;
  v9 = -[ABSAddressBook initWithOptions:policy:error:]([ABSAddressBook alloc], "initWithOptions:policy:error:", a1, a2, &v14);
  v10 = v14;
  v11 = v10;
  if (a3 && !v9)
    *a3 = v10;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "ABAddressBookRef ABAddressBookCreateWithOptionsAndPolicy(CFDictionaryRef, ABCreatePolicy, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v9;
}

ABAddressBookRef ABAddressBookCreate(void)
{
  NSObject *v0;
  int v1;
  const char *v2;
  ABSAddressBook *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v2 = "NO";
      if (v1)
        v2 = "YES";
      v6 = 136315650;
      v7 = v2;
      v8 = 2080;
      v9 = "ABAddressBookRef ABAddressBookCreate(void)";
      v10 = 2112;
      v11 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }

  }
  if (gABRegisteredWithCF_0 != -1)
    dispatch_once(&gABRegisteredWithCF_0, &__block_literal_global_6);
  v3 = objc_alloc_init(ABSAddressBook);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "ABAddressBookRef ABAddressBookCreate(void)";
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

void ABAddressBookRequestAccessWithCompletion(ABAddressBookRef addressBook, ABAddressBookRequestAccessCompletionHandler completion)
{
  ABAddressBookRequestAccessCompletionHandler v2;
  NSObject *v3;
  int v4;
  const char *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = completion;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v5 = "NO";
      if (v4)
        v5 = "YES";
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "void ABAddressBookRequestAccessWithCompletion(ABAddressBookRef, __strong ABAddressBookRequestAccessCompletionHandler)";
      v11 = 2112;
      v12 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v3, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v7, 0x20u);
    }

  }
  +[ABSAddressBook requestAccessWithCompletion:](ABSAddressBook, "requestAccessWithCompletion:", v2);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "void ABAddressBookRequestAccessWithCompletion(ABAddressBookRef, __strong ABAddressBookRequestAccessCompletionHandler)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v7, 0xCu);
    }

  }
}

BOOL ABAddressBookSave(ABAddressBookRef addressBook, CFErrorRef *error)
{
  NSObject *v4;
  int v5;
  const char *v6;
  NSObject *v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      *(_DWORD *)buf = 136315650;
      v16 = v6;
      v17 = 2080;
      v18 = "_Bool ABAddressBookSave(ABAddressBookRef, CFErrorRef *)";
      v19 = 2112;
      v20 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  +[ABSLog log](ABSLog, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    ABAddressBookSave_cold_2(v7);

  v14 = 0;
  v8 = objc_msgSend((id)addressBook, "save:", &v14);
  v9 = v14;
  v10 = v9;
  if ((v8 & 1) == 0 && error && v9)
    *error = (CFErrorRef)v9;
  +[ABSLog log](ABSLog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    ABAddressBookSave_cold_1(v8, v11);

  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "_Bool ABAddressBookSave(ABAddressBookRef, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v8;
}

BOOL ABAddressBookAddRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  NSObject *v6;
  int v7;
  const char *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      *(_DWORD *)buf = 136315650;
      v16 = v8;
      v17 = 2080;
      v18 = "_Bool ABAddressBookAddRecord(ABAddressBookRef, ABRecordRef, CFErrorRef *)";
      v19 = 2112;
      v20 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  v14 = 0;
  v9 = objc_msgSend((id)addressBook, "addRecord:error:", record, &v14);
  v10 = v14;
  v11 = v10;
  if (error && (v9 & 1) == 0)
    *error = (CFErrorRef)v10;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "_Bool ABAddressBookAddRecord(ABAddressBookRef, ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v9;
}

BOOL ABAddressBookRemoveRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  NSObject *v6;
  int v7;
  const char *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      *(_DWORD *)buf = 136315650;
      v16 = v8;
      v17 = 2080;
      v18 = "_Bool ABAddressBookRemoveRecord(ABAddressBookRef, ABRecordRef, CFErrorRef *)";
      v19 = 2112;
      v20 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  v14 = 0;
  v9 = objc_msgSend((id)addressBook, "removeRecord:error:", record, &v14);
  v10 = v14;
  v11 = v10;
  if (error && (v9 & 1) == 0)
    *error = (CFErrorRef)v10;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "_Bool ABAddressBookRemoveRecord(ABAddressBookRef, ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v9;
}

CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef label)
{
  NSObject *v2;
  int v3;
  const char *v4;
  const __CFString *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  +[ABSAddressBook localizedLabelForLabel:](ABSAddressBook, "localizedLabelForLabel:", label);
  v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
  NSObject *v6;
  int v7;
  const char *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      v10 = 136315650;
      v11 = v8;
      v12 = 2080;
      v13 = "void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef, ABExternalChangeCallback, void *)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "registerExternalChangeCallback:context:", callback, context);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef, ABExternalChangeCallback, void *)";
      _os_log_impl(&dword_20A301000, v9, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
}

void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
  NSObject *v6;
  int v7;
  const char *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      v10 = 136315650;
      v11 = v8;
      v12 = 2080;
      v13 = "void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef, ABExternalChangeCallback, void *)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "unregisterExternalChangeCallback:context:", callback, context);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef, ABExternalChangeCallback, void *)";
      _os_log_impl(&dword_20A301000, v9, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
  NSObject *v2;
  int v3;
  const char *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v6 = 136315650;
      v7 = v4;
      v8 = 2080;
      v9 = "void ABAddressBookRevert(ABAddressBookRef)";
      v10 = 2112;
      v11 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "revert");
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "void ABAddressBookRevert(ABAddressBookRef)";
      _os_log_impl(&dword_20A301000, v5, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t ABAddressBookCopyMe(void *a1)
{
  objc_msgSend(a1, "mePerson");
  return objc_claimAutoreleasedReturnValue();
}

uint64_t ABAddressBookCopyUniqueIdentifier(void *a1)
{
  objc_msgSend(a1, "uniqueDatabaseVersionIdentifier");
  return objc_claimAutoreleasedReturnValue();
}

BOOL ABAddressBookForceNullDatabaseForAccessDeniedIsEnabled()
{
  CFPreferencesSynchronize(CFSTR(".GlobalPreferences"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  return CFPreferencesGetAppBooleanValue(CFSTR("ABForceNullDatabaseForAccessDenied"), CFSTR(".GlobalPreferences"), 0) != 0;
}

uint64_t ABAddressBookForceNullDatabaseForAccessDeniedSetEnabled(CFPropertyListRef value)
{
  CFPreferencesSetAppValue(CFSTR("ABForceNullDatabaseForAccessDenied"), value, CFSTR(".GlobalPreferences"));
  return CFPreferencesSynchronize(CFSTR(".GlobalPreferences"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

uint64_t ABInitialize()
{
  return +[ABSAddressBook ABInitialize](ABSAddressBook, "ABInitialize");
}

BOOL ABValidateAlternateBirthday(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  if (!a1)
    return 1;
  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("calendarIdentifier"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("month"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v10 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v5 = (void *)v4;
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("day"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("calendarIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE48]), "initWithCalendarIdentifier:", v7);

      if (v8)
      {

        goto LABEL_10;
      }
      objc_msgSend(v7, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE48]), "initWithCalendarIdentifier:", v11);
      if (v12)
      {
LABEL_10:
        v13 = (void *)MEMORY[0x24BDBCE48];
        objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("calendarIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "calendarWithIdentifier:", v14);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (v3)
        {
          v15 = objc_alloc_init(MEMORY[0x24BDBCE68]);
          objc_msgSend(v15, "setCalendar:", v3);
          objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("month"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setMonth:", objc_msgSend(v16, "integerValue"));

          objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("day"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDay:", objc_msgSend(v17, "integerValue"));

          objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("isLeapMonth"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("isLeapMonth"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setLeapMonth:", objc_msgSend(v19, "BOOLValue"));

          }
          objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("era"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("era"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setEra:", objc_msgSend(v21, "integerValue"));

          }
          objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("year"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("year"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setYear:", objc_msgSend(v23, "integerValue"));

          }
          v10 = objc_msgSend(v15, "isValidDate");

        }
        else
        {
          v10 = 1;
        }
        goto LABEL_20;
      }
    }
  }
  v10 = 0;
LABEL_21:

  return v10 != 0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t ABSPeoplePickerPrefs()
{
  uint64_t result;

  result = ABSPeoplePickerPrefs__peoplePickerPrefs;
  if (!ABSPeoplePickerPrefs__peoplePickerPrefs)
  {
    if (ABSPeoplePickerPrefs___once_peoplePickerPrefs != -1)
      dispatch_once(&ABSPeoplePickerPrefs___once_peoplePickerPrefs, &__block_literal_global_10);
    return ABSPeoplePickerPrefs__peoplePickerPrefs;
  }
  return result;
}

void sub_20A311908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A314F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t ABSMultiValueGetTypeID()
{
  if (gABMultiValueRegisteredWithCF != -1)
    dispatch_once(&gABMultiValueRegisteredWithCF, &__block_literal_global_12);
  return kABCMultiValueTypeID;
}

ABPropertyType ABMultiValueGetPropertyType(ABMultiValueRef multiValue)
{
  NSObject *v2;
  int v3;
  const char *v4;
  ABPropertyType v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "ABPropertyType ABMultiValueGetPropertyType(ABMultiValueRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v5 = objc_msgSend((id)multiValue, "propertyType");
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "ABPropertyType ABMultiValueGetPropertyType(ABMultiValueRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  CFIndex v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v9 = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "CFIndex ABMultiValueGetCount(ABMultiValueRef)";
      v13 = 2112;
      v14 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend((id)multiValue, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "CFIndex ABMultiValueGetCount(ABMultiValueRef)";
      _os_log_impl(&dword_20A301000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  NSObject *v4;
  int v5;
  const char *v6;
  const void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef, CFIndex)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v7 = (const void *)objc_msgSend((id)multiValue, "copyValueAtIndex:", index);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef, CFIndex)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

CFArrayRef ABMultiValueCopyArrayOfAllValues(ABMultiValueRef multiValue)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  const __CFArray *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v9 = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "CFArrayRef ABMultiValueCopyArrayOfAllValues(ABMultiValueRef)";
      v13 = 2112;
      v14 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend((id)multiValue, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = (const __CFArray *)objc_msgSend(v5, "copy");
  else
    v6 = 0;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "CFArrayRef ABMultiValueCopyArrayOfAllValues(ABMultiValueRef)";
      _os_log_impl(&dword_20A301000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  NSObject *v4;
  int v5;
  const char *v6;
  const __CFString *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef, CFIndex)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend((id)multiValue, "labelAtIndex:", index);
  v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef, CFIndex)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef multiValue, ABMultiValueIdentifier identifier)
{
  uint64_t v2;
  NSObject *v4;
  int v5;
  const char *v6;
  CFIndex v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v2 = *(_QWORD *)&identifier;
  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef, ABMultiValueIdentifier)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v7 = objc_msgSend((id)multiValue, "indexForIdentifier:", v2);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef, ABMultiValueIdentifier)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  else
    return v7;
}

ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  NSObject *v4;
  int v5;
  const char *v6;
  ABMultiValueIdentifier v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef, CFIndex)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v7 = objc_msgSend((id)multiValue, "identifierAtIndex:", index);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef, CFIndex)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

CFIndex ABMultiValueGetFirstIndexOfValue(ABMultiValueRef multiValue, CFTypeRef value)
{
  NSObject *v4;
  int v5;
  const char *v6;
  CFIndex v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "CFIndex ABMultiValueGetFirstIndexOfValue(ABMultiValueRef, CFTypeRef)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v7 = objc_msgSend((id)multiValue, "indexOfValue:", value);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "CFIndex ABMultiValueGetFirstIndexOfValue(ABMultiValueRef, CFTypeRef)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  else
    return v7;
}

ABMutableMultiValueRef ABMultiValueCreateMutable(ABPropertyType type)
{
  uint64_t v1;

  v1 = *(_QWORD *)&type;
  if (gABMultiValueRegisteredWithCF != -1)
    dispatch_once(&gABMultiValueRegisteredWithCF, &__block_literal_global_12);
  return -[ABSMultiValue initWithPropertyType:mutable:values:]([ABSMultiValue alloc], "initWithPropertyType:mutable:values:", v1, 1, 0);
}

ABMutableMultiValueRef ABMultiValueCreateMutableCopy(ABMultiValueRef multiValue)
{
  NSObject *v2;
  int v3;
  const char *v4;
  const void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "ABMutableMultiValueRef ABMultiValueCreateMutableCopy(ABMultiValueRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  if (gABMultiValueRegisteredWithCF != -1)
    dispatch_once(&gABMultiValueRegisteredWithCF, &__block_literal_global_12);
  v5 = (const void *)objc_msgSend((id)multiValue, "mutableCopy");
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "ABMutableMultiValueRef ABMultiValueCreateMutableCopy(ABMultiValueRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

BOOL ABMultiValueAddValueAndLabel(ABMutableMultiValueRef multiValue, CFTypeRef value, CFStringRef label, ABMultiValueIdentifier *outIdentifier)
{
  NSObject *v8;
  int v9;
  const char *v10;
  char v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v10 = "NO";
      if (v9)
        v10 = "YES";
      v14 = 136315650;
      v15 = v10;
      v16 = 2080;
      v17 = "_Bool ABMultiValueAddValueAndLabel(ABMutableMultiValueRef, CFTypeRef, CFStringRef, ABMultiValueIdentifier *)";
      v18 = 2112;
      v19 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v14, 0x20u);
    }

  }
  v11 = objc_msgSend((id)multiValue, "addValue:label:outIdentifier:", value, label, outIdentifier);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "_Bool ABMultiValueAddValueAndLabel(ABMutableMultiValueRef, CFTypeRef, CFStringRef, ABMultiValueIdentifier *)";
      _os_log_impl(&dword_20A301000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

BOOL ABMultiValueInsertValueAndLabelAtIndex(ABMutableMultiValueRef multiValue, CFTypeRef value, CFStringRef label, CFIndex index, ABMultiValueIdentifier *outIdentifier)
{
  NSObject *v10;
  int v11;
  const char *v12;
  char v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v12 = "NO";
      if (v11)
        v12 = "YES";
      v16 = 136315650;
      v17 = v12;
      v18 = 2080;
      v19 = "_Bool ABMultiValueInsertValueAndLabelAtIndex(ABMutableMultiValueRef, CFTypeRef, CFStringRef, CFIndex, ABMult"
            "iValueIdentifier *)";
      v20 = 2112;
      v21 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v10, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v16, 0x20u);
    }

  }
  v13 = objc_msgSend((id)multiValue, "insertValue:label:atIndex:outIdentifier:", value, label, index, outIdentifier);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "_Bool ABMultiValueInsertValueAndLabelAtIndex(ABMutableMultiValueRef, CFTypeRef, CFStringRef, CFIndex, ABMult"
            "iValueIdentifier *)";
      _os_log_impl(&dword_20A301000, v14, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v16, 0xCu);
    }

  }
  return v13;
}

BOOL ABMultiValueRemoveValueAndLabelAtIndex(ABMutableMultiValueRef multiValue, CFIndex index)
{
  NSObject *v4;
  int v5;
  const char *v6;
  char v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "_Bool ABMultiValueRemoveValueAndLabelAtIndex(ABMutableMultiValueRef, CFIndex)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v7 = objc_msgSend((id)multiValue, "removeValueAtIndex:", index);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "_Bool ABMultiValueRemoveValueAndLabelAtIndex(ABMutableMultiValueRef, CFIndex)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

BOOL ABMultiValueReplaceValueAtIndex(ABMutableMultiValueRef multiValue, CFTypeRef value, CFIndex index)
{
  NSObject *v6;
  int v7;
  const char *v8;
  char v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      v12 = 136315650;
      v13 = v8;
      v14 = 2080;
      v15 = "_Bool ABMultiValueReplaceValueAtIndex(ABMutableMultiValueRef, CFTypeRef, CFIndex)";
      v16 = 2112;
      v17 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v12, 0x20u);
    }

  }
  v9 = objc_msgSend((id)multiValue, "replaceValue:atIndex:", value, index);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "_Bool ABMultiValueReplaceValueAtIndex(ABMutableMultiValueRef, CFTypeRef, CFIndex)";
      _os_log_impl(&dword_20A301000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v12, 0xCu);
    }

  }
  return v9;
}

BOOL ABMultiValueReplaceLabelAtIndex(ABMutableMultiValueRef multiValue, CFStringRef label, CFIndex index)
{
  NSObject *v6;
  int v7;
  const char *v8;
  char v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      v12 = 136315650;
      v13 = v8;
      v14 = 2080;
      v15 = "_Bool ABMultiValueReplaceLabelAtIndex(ABMutableMultiValueRef, CFStringRef, CFIndex)";
      v16 = 2112;
      v17 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v12, 0x20u);
    }

  }
  v9 = objc_msgSend((id)multiValue, "replaceLabel:atIndex:", label, index);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "_Bool ABMultiValueReplaceLabelAtIndex(ABMutableMultiValueRef, CFStringRef, CFIndex)";
      _os_log_impl(&dword_20A301000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v12, 0xCu);
    }

  }
  return v9;
}

CGImageRef ABImageUtilsCreateImageFromData(const __CFData *a1)
{
  CGImageSource *v1;
  CGImageSource *v2;
  CGImageRef ThumbnailAtIndex;

  if (!a1)
    return 0;
  v1 = CGImageSourceCreateWithData(a1, 0);
  if (!v1)
    return 0;
  v2 = v1;
  if (CGImageSourceGetCount(v1))
  {
    pthread_once(&__thumbnailPropertiesOnce, (void (*)(void))__initializeThumbnailProperties);
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v2, 0, (CFDictionaryRef)__thumbnailProperties);
  }
  else
  {
    ThumbnailAtIndex = 0;
  }
  CFRelease(v2);
  return ThumbnailAtIndex;
}

const __CFData *ABImageUtilsCopyImageSourceAndGetSizeFromData(const __CFData *result, CGImageSource **a2, int *a3, int *a4)
{
  CGImageSource *v7;
  CGImageSource *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFNumber *Value;
  _BOOL4 v12;
  int v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  int valuePtr;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (result)
  {
    v7 = CGImageSourceCreateWithData(result, 0);
    if (v7)
    {
      v8 = v7;
      v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
      if (v9)
      {
        v10 = v9;
        valuePtr = 0;
        Value = (const __CFNumber *)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x24BDD9698]);
        if (Value)
        {
          CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
          v12 = valuePtr > 4;
        }
        else
        {
          v12 = 0;
        }
        v14 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDD96C8]);
        if (v14 && CFNumberGetValue(v14, kCFNumberIntType, &valuePtr))
        {
          if (v12)
          {
            if (a4)
              *a4 = valuePtr;
          }
          else if (a3)
          {
            *a3 = valuePtr;
          }
        }
        v15 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDD96C0]);
        if (v15 && CFNumberGetValue(v15, kCFNumberIntType, &valuePtr))
        {
          if (v12)
          {
            if (a3)
              *a3 = valuePtr;
          }
          else if (a4)
          {
            *a4 = valuePtr;
          }
        }
        CFRelease(v10);
        if (a2)
        {
          *a2 = v8;
          v13 = 1;
          return (const __CFData *)(v13 != 0);
        }
        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
      CFRelease(v8);
      return (const __CFData *)(v13 != 0);
    }
    v13 = 0;
    return (const __CFData *)(v13 != 0);
  }
  return result;
}

double ABImageUtilsCenteredSquareForRect(double result, double a2, double a3, double a4)
{
  if (a3 > a4)
    return result + (a3 - a4) * 0.5;
  return result;
}

double ABImageUtilsCenteredOverflowRectWithFullScreenRatioForRectWithAvailableSize(double result, double a2, double a3, double a4, double a5, double a6)
{
  double v7;
  double v8;
  double v9;
  double v10;

  if (a3 / a4 >= 0.666666667)
  {
    if (ceil(a3 / 0.666666667) > a6)
      return floor(result + (a3 - a6 * 0.666666667) * 0.5);
  }
  else
  {
    v7 = ceil(a4 * 0.666666667);
    if (v7 <= a5)
    {
      v8 = floor(result + (v7 - a3) * -0.5);
      result = 0.0;
      if (v8 > 0.0)
      {
        v9 = v7 + v8 - a5;
        v10 = floor(v8 - v9);
        if (v9 <= 0.0)
          return v8;
        else
          return v10;
      }
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

CGImageRef ABImageUtilsCreateImageFromImageWithCropRect(CGImage *a1, double a2, double a3, double a4, double a5)
{
  CGColorSpace *DeviceRGB;
  double height;
  double x;
  double y;
  double width;
  double v11;
  double v12;
  CGContext *v14;
  CGImageRef v15;
  CGImage *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  if (!a1)
    return 0;
  v25 = CGRectStandardize(*(CGRect *)&a2);
  v26 = CGRectIntegral(v25);
  DeviceRGB = 0;
  if (v26.size.width > 0.0)
  {
    height = v26.size.height;
    if (v26.size.height > 0.0)
    {
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      v11 = (double)CGImageGetWidth(a1);
      v12 = (double)CGImageGetHeight(a1);
      v27.origin.x = 0.0;
      v27.origin.y = 0.0;
      v27.size.width = v11;
      v27.size.height = v12;
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v28 = CGRectIntersection(v27, v39);
      v29 = CGRectStandardize(v28);
      if (v29.size.width >= width && v29.size.height >= height)
      {
        v38.origin.x = x;
        v38.origin.y = y;
        v38.size.width = width;
        v38.size.height = height;
        return CGImageCreateWithImageInRect(a1, v38);
      }
      DeviceRGB = 0;
      if (v29.size.width >= 0.0 && v29.size.height >= 0.0)
      {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        if (DeviceRGB)
        {
          v14 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, vcvtd_n_u64_f64(width, 2uLL), DeviceRGB, 0x2006u);
          CGColorSpaceRelease(DeviceRGB);
          if (v14)
          {
            CGContextSetFillColor(v14, ABImageUtilsCreateImageFromImageWithCropRect_black);
            v30.origin.x = 0.0;
            v30.origin.y = 0.0;
            v30.size.width = width;
            v30.size.height = height;
            CGContextFillRect(v14, v30);
            v31.origin.x = x;
            v31.origin.y = y;
            v31.size.width = width;
            v31.size.height = height;
            v15 = CGImageCreateWithImageInRect(a1, v31);
            if (v15)
            {
              v16 = v15;
              v40.origin.x = -x;
              v40.origin.y = -y;
              v32.origin.x = 0.0;
              v32.origin.y = 0.0;
              v32.size.width = width;
              v32.size.height = height;
              v40.size.width = v11;
              v40.size.height = v12;
              v33 = CGRectIntersection(v32, v40);
              v17 = v33.origin.x;
              v18 = v33.origin.y;
              v19 = v33.size.width;
              v20 = v33.size.height;
              memset(&v24, 0, sizeof(v24));
              CGAffineTransformMakeScale(&v24, 1.0, -1.0);
              memset(&v23, 0, sizeof(v23));
              CGAffineTransformMakeTranslation(&v23, 0.0, height);
              v22 = v24;
              v34.origin.x = v17;
              v34.origin.y = v18;
              v34.size.width = v19;
              v34.size.height = v20;
              v35 = CGRectApplyAffineTransform(v34, &v22);
              v22 = v23;
              v36 = CGRectApplyAffineTransform(v35, &v22);
              v37 = CGRectStandardize(v36);
              CGContextDrawImage(v14, v37, v16);
              DeviceRGB = CGBitmapContextCreateImage(v14);
              CGImageRelease(v16);
            }
            else
            {
              DeviceRGB = 0;
            }
            CFRelease(v14);
            return DeviceRGB;
          }
          return 0;
        }
      }
    }
  }
  return DeviceRGB;
}

CGImageRef ABImageUtilsCreateImageFromImageSourceWithSizeCropRectMaxSize(CGImageSource *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  void *v18;
  double v19;
  const __CFAllocator *v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  CGImage *ThumbnailAtIndex;
  CGImage *v24;
  double v25;
  CGImageRef ImageFromImageWithCropRect;
  double v28;
  unsigned int valuePtr;
  void *values[2];
  CFTypeRef cf;
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  if (!a1 || !CGImageSourceGetCount(a1))
    return 0;
  v28 = a5;
  v18 = (void *)*MEMORY[0x24BDD9778];
  keys[0] = *(void **)MEMORY[0x24BDD9788];
  keys[1] = v18;
  keys[2] = *(void **)MEMORY[0x24BDD9808];
  v19 = fmin(a6 / a8, a7 / a9);
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = values[0];
  valuePtr = vcvtpd_s64_f64(fmax(a3, a2) / v19);
  v20 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  v21 = CFDictionaryCreate(v20, (const void **)keys, (const void **)values, 3, 0, 0);
  if (v21)
  {
    v22 = v21;
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a1, 0, v21);
    if (ThumbnailAtIndex)
    {
      v24 = ThumbnailAtIndex;
      if (v19 >= 1.0)
      {
        a4 = round(a4 / v19);
        v25 = round(v28 / v19);
        a6 = a8;
        a7 = a9;
      }
      else
      {
        v25 = v28;
      }
      ImageFromImageWithCropRect = ABImageUtilsCreateImageFromImageWithCropRect(ThumbnailAtIndex, a4, v25, a6, a7);
      CFRelease(v24);
    }
    else
    {
      ImageFromImageWithCropRect = 0;
    }
    CFRelease(v22);
  }
  else
  {
    ImageFromImageWithCropRect = 0;
  }
  CFRelease(cf);
  return ImageFromImageWithCropRect;
}

__CFData *ABImageUtilsCreateScaledImageData(CGImage *a1, unsigned int a2, const __CFString *a3, _QWORD *a4, double a5, double a6, double a7)
{
  __CFData *ImageData;
  uint32_t v15;
  BOOL v16;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v18;
  double v19;
  double v20;
  size_t Width;
  size_t Height;
  BOOL v23;
  double v24;
  CGContext *v25;
  CGContext *v26;
  CGImage *Image;
  const __CFAllocator *v28;
  const UInt8 *Data;
  size_t BytesPerRow;
  CGRect v32;

  if (a2 != 5 && a2 != 8)
    ABImageUtilsCreateScaledImageData_cold_1();
  ImageData = 0;
  if (a2 == 5)
    v15 = 4102;
  else
    v15 = 8198;
  v16 = a7 <= 0.0 || a1 == 0;
  if (!v16 && a6 > 0.0 && a5 > 0.0)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if (DeviceRGB)
    {
      v18 = DeviceRGB;
      v19 = round(a5 * a7);
      v20 = round(a6 * a7);
      Width = CGImageGetWidth(a1);
      Height = CGImageGetHeight(a1);
      if (a3 && (v19 == (double)Width ? (v23 = v20 == (double)Height) : (v23 = 0), v23))
      {
        ImageData = _ABImageUtilsCreateImageData(a1, a3, a7);
        if (a4)
          *a4 = CFRetain(a1);
      }
      else
      {
        v24 = 4.0;
        if (a2 == 5)
          v24 = 2.0;
        v25 = CGBitmapContextCreate(0, (unint64_t)v19, (unint64_t)v20, a2, (unint64_t)(v19 * v24), v18, v15);
        if (v25)
        {
          v26 = v25;
          v32.origin.x = 0.0;
          v32.origin.y = 0.0;
          v32.size.width = v19;
          v32.size.height = v20;
          CGContextDrawImage(v25, v32, a1);
          if (a3)
          {
            Image = CGBitmapContextCreateImage(v26);
            ImageData = _ABImageUtilsCreateImageData(Image, a3, a7);
            if (a4)
              *a4 = Image;
            else
              CGImageRelease(Image);
          }
          else
          {
            v28 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            Data = (const UInt8 *)CGBitmapContextGetData(v26);
            BytesPerRow = CGBitmapContextGetBytesPerRow(v26);
            ImageData = CFDataCreate(v28, Data, (uint64_t)(v19 * (double)BytesPerRow));
          }
          CFRelease(v26);
        }
        else
        {
          ImageData = 0;
        }
      }
      CGColorSpaceRelease(v18);
    }
    else
    {
      return 0;
    }
  }
  return ImageData;
}

__CFData *_ABImageUtilsCreateImageData(CGImage *a1, const __CFString *a2, double a3)
{
  const __CFAllocator *v6;
  __CFData *Mutable;
  CGImageDestination *v8;
  CGImageDestination *v9;
  CFNumberRef v10;
  void *v11;
  const __CFDictionary *v12;
  double v14;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v8 = CGImageDestinationCreateWithData(Mutable, a2, 1uLL, 0);
  if (v8)
  {
    v9 = v8;
    if (a3 == 1.0)
    {
      CGImageDestinationAddImage(v8, a1, 0);
    }
    else
    {
      v14 = a3 * 72.0;
      v10 = CFNumberCreate(v6, kCFNumberDoubleType, &v14);
      v11 = (void *)*MEMORY[0x24BDD93C0];
      keys[0] = *(void **)MEMORY[0x24BDD93C8];
      keys[1] = v11;
      values[0] = v10;
      values[1] = v10;
      v12 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CGImageDestinationAddImage(v9, a1, v12);
      CFRelease(v12);
      CFRelease(v10);
    }
    CGImageDestinationFinalize(v9);
    CFRelease(v9);
  }
  if (Mutable && !CFDataGetLength(Mutable))
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t ABPersonImageFormatGetPixelWidth(int a1)
{
  if (a1)
    return 0;
  else
    return 320;
}

uint64_t ABPersonImageFormatGetPixelHeight(int a1)
{
  if (a1)
    return 0;
  else
    return 320;
}

float ABPersonImageFormatGetScale()
{
  return 1.0;
}

BOOL ABPersonImageFormatIsLessThanOrEqualToPixelSize(int a1, int a2, int a3)
{
  int v3;

  if (a1)
    v3 = 0;
  else
    v3 = 320;
  return v3 <= a2 && v3 <= a3;
}

__CFData *ABSCreateThumbnailDataAndCropRectFromImageData(const __CFData *a1, double *a2)
{
  __CFData *ScaledImageData;
  int v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  double v19;
  double v20;
  CGImage *ImageFromImageSourceWithSizeCropRectMaxSize;
  CGImage *v22;
  CFTypeRef cf;
  uint64_t v25;

  cf = 0;
  v25 = 0;
  ScaledImageData = 0;
  if (ABImageUtilsCopyImageSourceAndGetSizeFromData(a1, (CGImageSource **)&cf, (int *)&v25 + 1, (int *)&v25))
  {
    v5 = v25;
    v4 = HIDWORD(v25);
    v6 = (double)SHIDWORD(v25);
    v7 = (double)(int)v25;
    if ((double)SHIDWORD(v25) <= (double)(int)v25)
    {
      v9 = 0.0;
      v10 = (double)SHIDWORD(v25);
      v11 = (double)(int)v25;
      v8 = 0.0;
      if (v7 > v6)
      {
        v8 = (v7 - v6) * 0.5 + 0.0;
        if (v8 >= 0.0)
        {
          v10 = (double)SHIDWORD(v25);
          v11 = (double)SHIDWORD(v25);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v7 - v6) * 0.5 + 0.0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v25);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Thumbnail crop rect {{%@, %@}, {%@, %@}} origin y forced to 0 because it was negative (availableHeight = %@)"), v12, v13, v14, v15, v16);

          v10 = v6;
          v11 = v6;
          v8 = 0.0;
        }
      }
    }
    else
    {
      v8 = 0.0;
      v9 = (v6 - v7) * 0.5 + 0.0;
      v10 = (double)(int)v25;
      v11 = (double)(int)v25;
    }
    v17 = v4 > 319;
    v18 = v5 > 319;
    if (v17 && v18)
      v19 = 320.0;
    else
      v19 = v10;
    if (v17 && v18)
      v20 = 320.0;
    else
      v20 = v11;
    ImageFromImageSourceWithSizeCropRectMaxSize = ABImageUtilsCreateImageFromImageSourceWithSizeCropRectMaxSize((CGImageSource *)cf, v6, v7, v9, v8, v10, v11, v19, v20);
    if (ImageFromImageSourceWithSizeCropRectMaxSize)
    {
      v22 = ImageFromImageSourceWithSizeCropRectMaxSize;
      ScaledImageData = ABImageUtilsCreateScaledImageData(ImageFromImageSourceWithSizeCropRectMaxSize, 8u, CFSTR("public.jpeg"), 0, v19, v20, 1.0);
      if (a2)
      {
        *a2 = v9;
        a2[1] = v8;
        a2[2] = v10;
        a2[3] = v11;
      }
      CFRelease(v22);
    }
    else
    {
      ScaledImageData = 0;
    }
  }
  if (cf)
    CFRelease(cf);
  return ScaledImageData;
}

CFDictionaryRef __initializeThumbnailProperties()
{
  void *v0;
  CFDictionaryRef result;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  v0 = (void *)*MEMORY[0x24BDD9778];
  keys[0] = *(void **)MEMORY[0x24BDD9788];
  keys[1] = v0;
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = values[0];
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 2, 0, 0);
  __thumbnailProperties = (uint64_t)result;
  return result;
}

void ABSPersonConstantsInitialize()
{
  kABPersonKindPerson = (const CFNumberRef)&unk_24C2F9EE8;
  kABPersonKindOrganization = (const CFNumberRef)&unk_24C2F9F00;
}

id _createDictionaryFromFile(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleWithIdentifier:", CFSTR("com.apple.AddressBook"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v4);
  return v5;
}

id socialProfileURLForServiceAndUsername(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  if (socialProfileURLForServiceAndUsername_onceToken != -1)
    dispatch_once(&socialProfileURLForServiceAndUsername_onceToken, &__block_literal_global_13);
  v5 = (void *)socialProfileURLForServiceAndUsername_formats;
  if (!v3 || !socialProfileURLForServiceAndUsername_formats)
  {
LABEL_9:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UnknownServiceURLFormat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_7;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  objc_msgSend((id)socialProfileURLForServiceAndUsername_formats, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v5 = (void *)socialProfileURLForServiceAndUsername_formats;
    goto LABEL_9;
  }
  if (!v4)
    goto LABEL_10;
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v9;
}

void __socialProfileURLForServiceAndUsername_block_invoke()
{
  uint64_t v0;
  void *v1;

  _createDictionaryFromFile(CFSTR("SocialServicesURLFormats.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)socialProfileURLForServiceAndUsername_formats;
  socialProfileURLForServiceAndUsername_formats = v0;

}

id socialProfileFromURL(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  id obj;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v25 = a3;
  v30 = a4;
  v27 = v8;
  if (socialProfileFromURL_onceToken != -1)
    dispatch_once(&socialProfileFromURL_onceToken, &__block_literal_global_9_0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)socialProfileFromURL_servicesDict, "allKeys");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x20BD2337C]();
        v36 = 0;
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v13, 1, &v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v36;
        v17 = objc_msgSend(v7, "length");
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __socialProfileFromURL_block_invoke_2;
        v31[3] = &unk_24C2F5108;
        v18 = v7;
        v32 = v18;
        v33 = v29;
        v34 = v30;
        v35 = v13;
        objc_msgSend(v15, "enumerateMatchesInString:options:range:usingBlock:", v18, 0, 0, v17, v31);

        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v10);
  }

  objc_msgSend(v29, "objectForKey:", CFSTR("url"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
    objc_msgSend(v22, "scheme");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v27;
    if (v23)
    {
      objc_msgSend(v29, "setObject:forKey:", v7, CFSTR("url"));
      v20 = v26;
      if (v26 || (_socialProfileUsernameFromURL((uint64_t)v7), (v20 = (id)objc_claimAutoreleasedReturnValue()) != 0))
        objc_msgSend(v29, "setObject:forKey:", v20, CFSTR("username"));
      if (!v27)
      {
        _socialProfileServiceFromURL((uint64_t)v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_24;
      }
    }
    else
    {
      if (!v7 || !v27)
      {
        v20 = v26;
        goto LABEL_24;
      }
      v20 = v7;

      socialProfileURLForServiceAndUsername(v27, v20);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "setObject:forKey:", v7, CFSTR("url"));
      objc_msgSend(v29, "setObject:forKey:", v20, CFSTR("username"));
    }
    objc_msgSend(v29, "setObject:forKey:", v21, CFSTR("service"));
LABEL_24:

    goto LABEL_25;
  }
  v20 = v26;
  v21 = v27;
LABEL_25:

  return v29;
}

void __socialProfileFromURL_block_invoke()
{
  uint64_t v0;
  void *v1;

  _createDictionaryFromFile(CFSTR("SocialServicesURLRegexes.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)socialProfileFromURL_servicesDict;
  socialProfileFromURL_servicesDict = v0;

}

void __socialProfileFromURL_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((unint64_t)objc_msgSend(v10, "numberOfRanges") >= 3)
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(v10, "rangeAtIndex:", 2);
    objc_msgSend(v3, "substringWithRange:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByRemovingPercentEncoding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, CFSTR("username"));
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, CFSTR("identifier"));
  objc_msgSend((id)socialProfileFromURL_servicesDict, "objectForKey:", *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, CFSTR("service"));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("url"));

}

id _socialProfileUsernameFromURL(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("x-apple")) & 1) != 0)
  {
    objc_msgSend(v1, "resourceSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v1, "resourceSpecifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByRemovingPercentEncoding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v5 = 0;
  }

LABEL_7:
  return v5;
}

id _socialProfileServiceFromURL(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("http"));
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "scheme");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "lowercaseString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "isEqualToString:", CFSTR("https")))
    {

      v8 = 0;
      goto LABEL_9;
    }
  }
  objc_msgSend(v3, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) == 0)
  {

  }
  if (!v7)
  {
    v4 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("www.")))
  {
    objc_msgSend(v4, "substringFromIndex:", 4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:

    v4 = (void *)v8;
  }
LABEL_11:

  return v4;
}

id completedSocialProfileFromSocialProfile(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("username"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v2)
  {
    if (v3)
      v7 = v4 == 0;
    else
      v7 = 1;
    if (!v7)
      goto LABEL_26;
    socialProfileFromURL(v2, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v3)
    {
      if (v4)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("service"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v1, "setObject:forKeyedSubscript:", v12, CFSTR("service"));

      if (v4)
        goto LABEL_25;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("username"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v1, "setObject:forKeyedSubscript:", v13, CFSTR("username"));

    goto LABEL_25;
  }
  if (v3)
    v10 = (v4 | v5) == 0;
  else
    v10 = 1;
  if (!v10)
  {
    if (v4)
      v11 = (void *)v4;
    else
      v11 = (void *)v5;
    socialProfileURLForServiceAndUsername(v3, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v1, "setObject:forKeyedSubscript:", v9, CFSTR("url"));
    goto LABEL_25;
  }
LABEL_26:

  return v1;
}

ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef addressBook)
{
  NSObject *v2;
  int v3;
  const char *v4;
  const void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "defaultSource");
  v5 = (const void *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

ABRecordRef ABAddressBookGetSourceWithRecordID(ABAddressBookRef addressBook, ABRecordID sourceID)
{
  uint64_t v2;
  NSObject *v4;
  int v5;
  const char *v6;
  const void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v2 = *(_QWORD *)&sourceID;
  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "ABRecordRef ABAddressBookGetSourceWithRecordID(ABAddressBookRef, ABRecordID)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v7 = (const void *)objc_msgSend((id)addressBook, "sourceWithRecordID:", v2);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "ABRecordRef ABAddressBookGetSourceWithRecordID(ABAddressBookRef, ABRecordID)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

CFArrayRef ABAddressBookCopyArrayOfAllSources(ABAddressBookRef addressBook)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  const __CFArray *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v9 = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "CFArrayRef ABAddressBookCopyArrayOfAllSources(ABAddressBookRef)";
      v13 = 2112;
      v14 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "allSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFArray *)objc_msgSend(v5, "copy");

  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "CFArrayRef ABAddressBookCopyArrayOfAllSources(ABAddressBookRef)";
      _os_log_impl(&dword_20A301000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

uint64_t ABSourceCreate()
{
  NSObject *v0;
  int v1;
  const char *v2;
  ABSSource *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v2 = "NO";
      if (v1)
        v2 = "YES";
      v8 = 136315650;
      v9 = v2;
      v10 = 2080;
      v11 = "ABRecordRef ABSourceCreate(void)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v3 = [ABSSource alloc];
  v4 = objc_alloc_init(MEMORY[0x24BDBAD60]);
  v5 = -[ABSSource initWithMutableContainer:](v3, "initWithMutableContainer:", v4);

  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "ABRecordRef ABSourceCreate(void)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

uint64_t ABAddressBookCopyLocalSource(void *a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "ABRecordRef ABAddressBookCopyLocalSource(ABAddressBookRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  objc_msgSend(a1, "localSource");
  v5 = objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "ABRecordRef ABAddressBookCopyLocalSource(ABAddressBookRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

ABRecordRef ABPersonCreate(void)
{
  NSObject *v0;
  int v1;
  const char *v2;
  ABSPerson *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v2 = "NO";
      if (v1)
        v2 = "YES";
      v6 = 136315650;
      v7 = v2;
      v8 = 2080;
      v9 = "ABRecordRef ABPersonCreate(void)";
      v10 = 2112;
      v11 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }

  }
  ABSRecordGetTypeID();
  v3 = objc_alloc_init(ABSPerson);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "ABRecordRef ABPersonCreate(void)";
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

ABRecordRef ABPersonCreateInSource(ABRecordRef source)
{
  return -[ABSPerson initWithSource:]([ABSPerson alloc], "initWithSource:", source);
}

ABRecordRef ABPersonCopySource(ABRecordRef person)
{
  NSObject *v2;
  int v3;
  const char *v4;
  const void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "ABRecordRef ABPersonCopySource(ABRecordRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  objc_msgSend((id)person, "source");
  v5 = (const void *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "ABRecordRef ABPersonCopySource(ABRecordRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

CFArrayRef ABPersonCopyArrayOfAllLinkedPeople(ABRecordRef person)
{
  NSObject *v2;
  int v3;
  const char *v4;
  const __CFArray *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "CFArrayRef ABPersonCopyArrayOfAllLinkedPeople(ABRecordRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  objc_msgSend((id)person, "linkedPeople");
  v5 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "CFArrayRef ABPersonCopyArrayOfAllLinkedPeople(ABRecordRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

uint64_t ABPersonLinkPerson(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "addressBook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "linkPerson:toPerson:", v4, v3);

  return v6;
}

uint64_t ABPersonUnlink(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_msgSend(v1, "addressBook");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unlinkPerson:", v1);

  return v3;
}

ABPropertyType ABPersonGetTypeOfProperty(ABPropertyID property)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  ABPropertyType v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v1 = *(_QWORD *)&property;
  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "ABPropertyType ABPersonGetTypeOfProperty(ABPropertyID)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v5 = +[ABSPerson typeForProperty:](ABSPerson, "typeForProperty:", v1);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "ABPropertyType ABPersonGetTypeOfProperty(ABPropertyID)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

CFStringRef ABPersonCopyLocalizedPropertyName(ABPropertyID property)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  const __CFString *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v1 = *(_QWORD *)&property;
  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "CFStringRef ABPersonCopyLocalizedPropertyName(ABPropertyID)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  +[ABSPerson localizedNameForProperty:](ABSPerson, "localizedNameForProperty:", v1);
  v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "CFStringRef ABPersonCopyLocalizedPropertyName(ABPropertyID)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

ABPersonCompositeNameFormat ABPersonGetCompositeNameFormat(void)
{
  NSObject *v0;
  int v1;
  const char *v2;
  ABPersonCompositeNameFormat v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v2 = "NO";
      if (v1)
        v2 = "YES";
      v6 = 136315650;
      v7 = v2;
      v8 = 2080;
      v9 = "ABPersonCompositeNameFormat ABPersonGetCompositeNameFormat(void)";
      v10 = 2112;
      v11 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }

  }
  v3 = +[ABSPerson compositeNameFormat](ABSPerson, "compositeNameFormat");
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "ABPersonCompositeNameFormat ABPersonGetCompositeNameFormat(void)";
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

ABPersonCompositeNameFormat ABPersonGetCompositeNameFormatForRecord(ABRecordRef record)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  ABPersonCompositeNameFormat v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      *(_DWORD *)buf = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "ABPersonCompositeNameFormat ABPersonGetCompositeNameFormatForRecord(ABRecordRef)";
      v13 = 2112;
      v14 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  v5 = (id)record;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "compositeNameFormat");
  }
  else
  {
    v6 = +[ABSPerson compositeNameFormat](ABSPerson, "compositeNameFormat");
    if (v5)
      NSLog(CFSTR("Warning! Unexpected type for %@, expected a person, returning default name format…"), v5);
  }
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "ABPersonCompositeNameFormat ABPersonGetCompositeNameFormatForRecord(ABRecordRef)";
      _os_log_impl(&dword_20A301000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v6;
}

CFStringRef ABPersonCopyCompositeNameDelimiterForRecord(ABRecordRef record)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      *(_DWORD *)buf = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "CFStringRef ABPersonCopyCompositeNameDelimiterForRecord(ABRecordRef)";
      v13 = 2112;
      v14 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  v5 = (id)record;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSLog(CFSTR("Warning! Unexpected type for %@, expected a person, returning an empty string…"), v5);
    v6 = &stru_24C2F52F8;
  }
  else
  {
    v6 = +[ABSPerson copyCompositeNameDelimiterForPerson:](ABSPerson, "copyCompositeNameDelimiterForPerson:", v5);
    if (ABSIsAPILogEnabled())
    {
      +[ABSLog apiLog](ABSLog, "apiLog");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "CFStringRef ABPersonCopyCompositeNameDelimiterForRecord(ABRecordRef)";
        _os_log_impl(&dword_20A301000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
      }

    }
  }

  return v6;
}

uint64_t ABPersonSetCompositeNameFormat(uint64_t a1)
{
  return +[ABSPerson setCompositeNameFormat:](ABSPerson, "setCompositeNameFormat:", a1);
}

uint64_t ABPersonCopyCompositeName(void *a1)
{
  objc_msgSend(a1, "compositeName");
  return objc_claimAutoreleasedReturnValue();
}

BOOL ABPersonSetImageData(ABRecordRef person, CFDataRef imageData, CFErrorRef *error)
{
  NSObject *v6;
  int v7;
  const char *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      *(_DWORD *)buf = 136315650;
      v16 = v8;
      v17 = 2080;
      v18 = "_Bool ABPersonSetImageData(ABRecordRef, CFDataRef, CFErrorRef *)";
      v19 = 2112;
      v20 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  v14 = 0;
  v9 = objc_msgSend((id)person, "setImageData:withError:", imageData, &v14);
  v10 = v14;
  v11 = v10;
  if (error && (v9 & 1) == 0)
    *error = (CFErrorRef)v10;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "_Bool ABPersonSetImageData(ABRecordRef, CFDataRef, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v9;
}

CFDataRef ABPersonCopyImageData(ABRecordRef person)
{
  NSObject *v2;
  int v3;
  const char *v4;
  const __CFData *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "CFDataRef ABPersonCopyImageData(ABRecordRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v5 = (const __CFData *)objc_msgSend((id)person, "copyImageData");
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "CFDataRef ABPersonCopyImageData(ABRecordRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

CFDataRef ABPersonCopyImageDataWithFormat(ABRecordRef person, ABPersonImageFormat format)
{
  uint64_t v2;
  NSObject *v4;
  int v5;
  const char *v6;
  const __CFData *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v2 = *(_QWORD *)&format;
  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "CFDataRef ABPersonCopyImageDataWithFormat(ABRecordRef, ABPersonImageFormat)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v7 = (const __CFData *)objc_msgSend((id)person, "copyImageDataWithFormat:", v2);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "CFDataRef ABPersonCopyImageDataWithFormat(ABRecordRef, ABPersonImageFormat)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

BOOL ABPersonHasImageData(ABRecordRef person)
{
  NSObject *v2;
  int v3;
  const char *v4;
  char v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "_Bool ABPersonHasImageData(ABRecordRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v5 = objc_msgSend((id)person, "hasImageData");
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "_Bool ABPersonHasImageData(ABRecordRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

BOOL ABPersonRemoveImageData(ABRecordRef person, CFErrorRef *error)
{
  NSObject *v4;
  int v5;
  const char *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      *(_DWORD *)buf = 136315650;
      v14 = v6;
      v15 = 2080;
      v16 = "_Bool ABPersonRemoveImageData(ABRecordRef, CFErrorRef *)";
      v17 = 2112;
      v18 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }

  }
  v12 = 0;
  v7 = objc_msgSend((id)person, "removeImageDataWithError:", &v12);
  v8 = v12;
  v9 = v8;
  if (error && (v7 & 1) == 0)
    *error = (CFErrorRef)v8;
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "_Bool ABPersonRemoveImageData(ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_20A301000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }

  }
  return v7;
}

CFComparisonResult ABPersonComparePeopleByName(ABRecordRef person1, ABRecordRef person2, ABPersonSortOrdering ordering)
{
  uint64_t v3;
  NSObject *v6;
  int v7;
  const char *v8;
  CFComparisonResult v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&ordering;
  v18 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      v12 = 136315650;
      v13 = v8;
      v14 = 2080;
      v15 = "CFComparisonResult ABPersonComparePeopleByName(ABRecordRef, ABRecordRef, ABPersonSortOrdering)";
      v16 = 2112;
      v17 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v12, 0x20u);
    }

  }
  v9 = objc_msgSend((id)person1, "comparePersonByName:sortOrdering:", person2, v3);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "CFComparisonResult ABPersonComparePeopleByName(ABRecordRef, ABRecordRef, ABPersonSortOrdering)";
      _os_log_impl(&dword_20A301000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v12, 0xCu);
    }

  }
  return v9;
}

CFIndex ABAddressBookGetPersonCount(ABAddressBookRef addressBook)
{
  NSObject *v2;
  int v3;
  const char *v4;
  CFIndex v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "CFIndex ABAddressBookGetPersonCount(ABAddressBookRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v5 = objc_msgSend((id)addressBook, "personCount");
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "CFIndex ABAddressBookGetPersonCount(ABAddressBookRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  uint64_t v2;
  NSObject *v4;
  int v5;
  const char *v6;
  const void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v2 = *(_QWORD *)&recordID;
  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef, ABRecordID)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v7 = (const void *)objc_msgSend((id)addressBook, "personWithRecordID:", v2);
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef, ABRecordID)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

CFArrayRef ABAddressBookCopyArrayOfAllPeople(ABAddressBookRef addressBook)
{
  NSObject *v2;
  int v3;
  const char *v4;
  void *v5;
  const __CFArray *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v9 = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "CFArrayRef ABAddressBookCopyArrayOfAllPeople(ABAddressBookRef)";
      v13 = 2112;
      v14 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "allPeople");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFArray *)objc_msgSend(v5, "copy");

  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "CFArrayRef ABAddressBookCopyArrayOfAllPeople(ABAddressBookRef)";
      _os_log_impl(&dword_20A301000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  NSObject *v4;
  int v5;
  const char *v6;
  const __CFArray *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSource(ABAddressBookRef, ABRecordRef)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "peopleInSource:sortOrder:", source, 0xFFFFFFFFLL);
  v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSource(ABAddressBookRef, ABRecordRef)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(ABAddressBookRef addressBook, ABRecordRef source, ABPersonSortOrdering sortOrdering)
{
  uint64_t v3;
  NSObject *v6;
  int v7;
  const char *v8;
  const __CFArray *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&sortOrdering;
  v18 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v8 = "NO";
      if (v7)
        v8 = "YES";
      v12 = 136315650;
      v13 = v8;
      v14 = 2080;
      v15 = "CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(ABAddressBookRef, ABRecordRef, ABPersonSortOrdering)";
      v16 = 2112;
      v17 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v12, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "peopleInSource:sortOrder:", source, v3);
  v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(ABAddressBookRef, ABRecordRef, ABPersonSortOrdering)";
      _os_log_impl(&dword_20A301000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v12, 0xCu);
    }

  }
  return v9;
}

CFArrayRef ABAddressBookCopyPeopleWithName(ABAddressBookRef addressBook, CFStringRef name)
{
  NSObject *v4;
  int v5;
  const char *v6;
  void *v7;
  const __CFArray *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v11 = 136315650;
      v12 = v6;
      v13 = 2080;
      v14 = "CFArrayRef ABAddressBookCopyPeopleWithName(ABAddressBookRef, CFStringRef)";
      v15 = 2112;
      v16 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v11, 0x20u);
    }

  }
  objc_msgSend((id)addressBook, "peopleMatchingNameString:", name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const __CFArray *)objc_msgSend(v7, "copy");

  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "CFArrayRef ABAddressBookCopyPeopleWithName(ABAddressBookRef, CFStringRef)";
      _os_log_impl(&dword_20A301000, v9, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v11, 0xCu);
    }

  }
  return v8;
}

CFArrayRef ABPersonCreatePeopleInSourceWithVCardRepresentation(ABRecordRef source, CFDataRef vCardData)
{
  NSObject *v4;
  int v5;
  const char *v6;
  const __CFArray *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v6 = "NO";
      if (v5)
        v6 = "YES";
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "CFArrayRef ABPersonCreatePeopleInSourceWithVCardRepresentation(ABRecordRef, CFDataRef)";
      v14 = 2112;
      v15 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }

  }
  +[ABSPerson createPeopleInSource:withVCardRepresentation:](ABSPerson, "createPeopleInSource:withVCardRepresentation:", source, vCardData);
  v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "CFArrayRef ABPersonCreatePeopleInSourceWithVCardRepresentation(ABRecordRef, CFDataRef)";
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

CFDataRef ABPersonCreateVCardRepresentationWithPeople(CFArrayRef people)
{
  NSObject *v2;
  int v3;
  const char *v4;
  const __CFData *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v4 = "NO";
      if (v3)
        v4 = "YES";
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "CFDataRef ABPersonCreateVCardRepresentationWithPeople(CFArrayRef)";
      v12 = 2112;
      v13 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }

  }
  +[ABSPerson vCardRepresentationForPeople:](ABSPerson, "vCardRepresentationForPeople:", people);
  v5 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "CFDataRef ABPersonCreateVCardRepresentationWithPeople(CFArrayRef)";
      _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

ABPersonSortOrdering ABPersonGetSortOrdering(void)
{
  NSObject *v0;
  int v1;
  const char *v2;
  ABPersonSortOrdering v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
      v2 = "NO";
      if (v1)
        v2 = "YES";
      v6 = 136315650;
      v7 = v2;
      v8 = 2080;
      v9 = "ABPersonSortOrdering ABPersonGetSortOrdering(void)";
      v10 = 2112;
      v11 = &stru_24C2F52F8;
      _os_log_impl(&dword_20A301000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }

  }
  v3 = +[ABSPerson sortOrdering](ABSPerson, "sortOrdering");
  if (ABSIsAPILogEnabled())
  {
    +[ABSLog apiLog](ABSLog, "apiLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "ABPersonSortOrdering ABPersonGetSortOrdering(void)";
      _os_log_impl(&dword_20A301000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

void *ABAddressBookFindPersonMatchingURL(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  if (!a2)
    return 0;
  objc_msgSend(a1, "findPersonMatchingURL:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getIdentifier:label:forMultiValueMatchingValue:property:", a3, 0, a2, 22);

  return v5;
}

void *ABAddressBookFindPersonMatchingEmailAddress(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  if (!a2)
    return 0;
  objc_msgSend(a1, "findPersonMatchingEmailAddress:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getIdentifier:label:forMultiValueMatchingValue:property:", a3, 0, a2, 4);

  return v5;
}

void *ABAddressBookFindPersonMatchingPhoneNumber(void *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  return ABAddressBookFindPersonMatchingPhoneNumberWithCountry(a1, a2, 0, a3, a4);
}

void *ABAddressBookFindPersonMatchingPhoneNumberWithCountry(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v15;
  int v16;

  if (!a2)
    return 0;
  objc_msgSend(a1, "findPersonMatchingPhoneNumber:country:", a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 | a5)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDBAD88], "fullyQualifiedStringForStringValue:countryCode:", a2, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v11 = objc_msgSend(v9, "getIdentifier:label:forMultiValueMatchingValue:property:", &v16, &v15, v10, 3);
    v12 = v15;
    v13 = v12;
    if (v11)
    {
      if (a5)
        *(_QWORD *)a5 = v12;
      if (a4)
        *(_DWORD *)a4 = v16;
    }

  }
  return v9;
}

uint64_t ABAddressBookCopyPersonMatchingInternalUUID(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 0;
  v7[0] = a2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "peopleWithCNIdentifiers:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t ABPersonCopyCompositeNameIgnoringOrganization(void *a1, uint64_t a2)
{
  objc_msgSend(a1, "compositeNameIgnoringOrganization:", a2);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t ABPersonCopyShortName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "shortName");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

BOOL ABPersonGetShortNameFormatEnabled()
{
  return +[ABSPerson shortNameFormatEnabled](ABSPerson, "shortNameFormatEnabled");
}

BOOL ABPersonGetShortNamePreferNicknames()
{
  return +[ABSPerson shortNameFormatPrefersNicknames](ABSPerson, "shortNameFormatPrefersNicknames");
}

uint64_t ABPersonCopySoundIdentifierForMultiValueIdentifier(void *a1, uint64_t a2)
{
  objc_msgSend(a1, "soundIdentifierForMultivalueIdentifier:", a2);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t ABPersonSetSoundIdentifierForMultiValueIdentifier(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "setValue:forSoundIdentifier:", a3, a2);
}

void ABAddressBookSave_cold_1(char a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_20A301000, a2, OS_LOG_TYPE_DEBUG, "Did save AddressBook with result %@", (uint8_t *)&v4, 0xCu);

}

void ABAddressBookSave_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20A301000, log, OS_LOG_TYPE_DEBUG, "Will save AddressBook", v1, 2u);
}

void ABImageUtilsCreateScaledImageData_cold_1()
{
  __assert_rtn("ABImageUtilsCreateScaledImageData", "ABSImageUtils.m", 361, "bitsPerComponent == 5 || bitsPerComponent == 8");
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x24BDBD958](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x24BDBDFC8](c, components);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9168](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF080]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CNLinkedOnOrAfter()
{
  return MEMORY[0x24BDBABB8]();
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x24BE04668]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x24BEDD510](lhs, rhs);
}

