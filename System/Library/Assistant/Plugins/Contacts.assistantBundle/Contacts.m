void sub_21633EC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21633EC78(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend_addObject_(*(void **)(a1 + 32), v4, (uint64_t)v3);
  if ((int)objc_msgSend_iOSLegacyIdentifier(v3, v5, v6) <= *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v9 = *MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
      sub_216344AF0(v9, (uint64_t)v7, v8, v10, v11, v12, v13, v14);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend_iOSLegacyIdentifier(v3, v7, v8);

}

void sub_21633F040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21633F064(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21633F074(uint64_t a1)
{

}

void sub_21633F07C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21633F31C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_21633F354(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21633F364(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_21633F61C(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_contact(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = *MEMORY[0x24BDBA2D8];
  if (v4 && (objc_msgSend_isKeyAvailable_(v4, v5, *MEMORY[0x24BDBA2D8]) & 1) != 0)
  {
    v10 = 0;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend_contactIdentifier(a1, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v15, (uint64_t)v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v11, v17, (uint64_t)v14, v16, &v22);
    v18 = objc_claimAutoreleasedReturnValue();
    v10 = v22;

    v6 = (void *)v18;
    if (!v18)
      goto LABEL_8;
  }
  if (!v10)
  {
    v19 = objc_msgSend_iOSLegacyIdentifier(v6, v8, v9);
    goto LABEL_11;
  }
LABEL_8:
  v20 = *MEMORY[0x24BE08FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
    sub_216344CFC((uint64_t)v10, v20);
  v19 = 0xFFFFFFFFLL;
LABEL_11:

  return v19;
}

void sub_21633FBD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_21633FF64(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v8 = objc_msgSend_count(a1, v6, v7);
  objc_msgSend_arrayWithCapacity_(v5, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_216340030;
  v17[3] = &unk_24D5290B0;
  v19 = v4;
  v11 = v10;
  v18 = v11;
  v12 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v13, (uint64_t)v17);
  v14 = v18;
  v15 = v11;

  return v15;
}

void sub_216340030(uint64_t a1)
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

id sub_216340080(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v8 = objc_msgSend_count(a1, v6, v7);
  objc_msgSend_arrayWithCapacity_(v5, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_21634014C;
  v17[3] = &unk_24D5290B0;
  v19 = v4;
  v11 = v10;
  v18 = v11;
  v12 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v13, (uint64_t)v17);
  v14 = v18;
  v15 = v11;

  return v15;
}

void sub_21634014C(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;

  v4 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend_addObject_(*(void **)(a1 + 32), v3, (uint64_t)v4);

}

BOOL sub_216340964(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_contactType(a2, (const char *)a2, a3) == 1;
}

uint64_t sub_216340CD0(uint64_t a1, const char *a2)
{
  return objc_msgSend_personFromContact_(MEMORY[0x24BE19118], a2, (uint64_t)a2);
}

uint64_t sub_216340EF0(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_identifier(a2, (const char *)a2, a3);
}

uint64_t sub_216340EF8(uint64_t a1, const char *a2)
{
  return objc_msgSend_personFromContact_(MEMORY[0x24BE19118], a2, (uint64_t)a2);
}

void sub_216341774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2163417B4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2163417C4(uint64_t a1)
{

}

void sub_2163417CC(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v3 = (objc_class *)MEMORY[0x24BE810A0];
  v4 = a2;
  v5 = [v3 alloc];
  v17 = (id)objc_msgSend_initWithDictionary_(v5, v6, (uint64_t)v4);

  objc_msgSend_refId(*(void **)(a1 + 32), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRefId_(v17, v10, (uint64_t)v9);

  objc_msgSend_addObject_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11, (uint64_t)v17);
  objc_msgSend_results(v17, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend_count(v14, v15, v16);

}

void sub_216343650(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id sub_216343668(id a1)
{
  return a1;
}

uint64_t sub_2163436A8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2163436B4(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;

  return objc_msgSend_syncIndex(v3, a2, a3);
}

uint64_t sub_2163436C0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;

  return objc_msgSend_syncCount(v3, a2, a3);
}

id sub_2163436CC(id a1)
{
  return a1;
}

uint64_t sub_216343ABC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BE19118], sel_personFromContact_useABPerson_, a2);
}

void sub_216344970(void *a1, void *a2)
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8[10];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend_changeHistoryClientIdentifier(a2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315650;
  sub_21633F328();
  sub_21633F31C(&dword_21633D000, v3, v7, "%s Failed to get latest consumed change history anchor for %@, error = %@", (uint8_t *)v8);

  sub_21633F344();
}

void sub_216344A14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_21633F37C();
  sub_21633F364(&dword_21633D000, v0, v1, "%s Failed to enumerate all contacts, error = %@", v2, v3, v4, v5, 2u);
  sub_21633F374();
}

void sub_216344A80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s failed to enumerate all contacts", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_216344AF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s ERROR: contacts for full sync are not sorted in monotonically increasing order.", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_216344B60(void *a1, void *a2)
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8[10];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend_changeHistoryClientIdentifier(a2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315650;
  sub_21633F328();
  sub_21633F31C(&dword_21633D000, v3, v7, "%s Failed to fetch change history for %@, error = %@", (uint8_t *)v8);

  sub_21633F344();
}

void sub_216344C04(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[ABAssistantSyncPeople newSADomainObjectFromCNContactWithIdentifier:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  sub_21633F31C(&dword_21633D000, a3, (uint64_t)a3, "%s failed to fetch contact with identifier = %@, error = %@", (uint8_t *)&v3);
}

void sub_216344C90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_21633F37C();
  sub_21633F364(&dword_21633D000, v0, v1, "%s failed to fetch contact with identifier = %@", v2, v3, v4, v5, 2u);
  sub_21633F374();
}

void sub_216344CFC(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[CNChangeHistoryContactChange(CNAssistantAdditions) iOSLegacyIdentifier]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_21633D000, a2, OS_LOG_TYPE_DEBUG, "%s Error retrieving contact for iOS legacy identifier: %@", (uint8_t *)&v2, 0x16u);
}

void sub_216344D84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_21633F37C();
  sub_21633FBD4(&dword_21633D000, v0, v1, "%s Error writing sync info dictionary: %@", v2, v3, v4, v5, 2u);
}

void sub_216344DF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_21633F37C();
  sub_21633FBD4(&dword_21633D000, v0, v1, "%s Cannot write sync info dictionary to path %@", v2, v3, v4, v5, 2u);
}

void sub_216344E64(void *a1, void *a2)
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend_absoluteString(a2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315394;
  v8 = "-[CNAssistantCommandCancelPerson removeUpdatesFromCache]";
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_21633D000, v3, OS_LOG_TYPE_DEBUG, "%s Failed to remove updates from cache for identifer %@", (uint8_t *)&v7, 0x16u);

}

void sub_216344F1C(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[CNAssistantCommandClear clearAceDomainObjects]";
  _os_log_debug_impl(&dword_21633D000, log, OS_LOG_TYPE_DEBUG, "%s Failed to remove the updates cache file.", (uint8_t *)&v1, 0xCu);
}

void sub_216344F9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s AddressBook database is not available to sync with.", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_21634500C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s < beginSyncWithAnchor", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_21634507C(void *a1)
{
  NSObject *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6[6];

  sub_216343668(a1);
  v2 = (void *)sub_2163436A8();
  objc_msgSend_syncCount(v2, v3, v4);
  v6[0] = 136315394;
  sub_2163436D4();
  sub_216343650(&dword_21633D000, v1, v5, "%s change sync cached %li contacts", (uint8_t *)v6);

  sub_21634365C();
}

void sub_216345104(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s change sync trying to cache changed contacts", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_216345174()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v0, v1, "%s full sync has no contacts to sync, synthesizing end anchor = %@", (uint8_t *)v2);
  sub_21633F374();
}

void sub_2163451E4(void *a1, void *a2, int a3)
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8[5];
  __int16 v9;
  int v10;

  v5 = sub_2163436CC(a1);
  objc_msgSend_syncIndex(a2, v6, v7);
  v8[0] = 136315650;
  sub_2163436D4();
  v9 = 1024;
  v10 = a3;
  _os_log_debug_impl(&dword_21633D000, v5, OS_LOG_TYPE_DEBUG, "%s full sync resuming previous full sync, self.syncIndex = %li, contactLegacyIdentifier = %d", (uint8_t *)v8, 0x1Cu);

  sub_21633F344();
}

void sub_21634528C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s full sync failed to resume previous full sync", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_2163452FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s full sync trying to resume previous full sync", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_21634536C(void *a1, char *a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v5 = a1;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_syncCount(a1, a2, a3);
  v11 = objc_msgSend_syncCount(v5, v7, v8);
  if (v11)
  {
    objc_msgSend_allContacts(v5, v9, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v5, v13, v14);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v3, v15, v16);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("n/a");
  }
  v17 = 136315650;
  v18 = "-[ABAssistantSyncWorker beginSyncWithAnchor:validity:forKey:beginInfo:]";
  v19 = 2048;
  v20 = v6;
  v21 = 2112;
  v22 = v12;
  sub_21633F31C(&dword_21633D000, a2, v10, "%s full sync cached %li contacts, max contactIdentifier = %@", (uint8_t *)&v17);
  if (v11)
  {

  }
}

void sub_216345478(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s full sync trying to cache all contacts", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_2163454E8(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[ABAssistantSyncWorker beginSyncWithAnchor:validity:forKey:beginInfo:]";
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl(&dword_21633D000, a2, OS_LOG_TYPE_DEBUG, "%s full sync database snapshot, sequenceNumber = %i", (uint8_t *)&v2, 0x12u);
  sub_21633F374();
}

void sub_21634556C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s full sync should be performed", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_2163455DC(void *a1)
{
  NSObject *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7[6];

  sub_216343668(a1);
  v2 = (void *)sub_2163436A8();
  objc_msgSend_shortDescription(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v1, v6, "%s clearing change history up to %@", (uint8_t *)v7);

  sub_21634365C();
}

void sub_216345670()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v0, v1, "%s calling [beginInfo resetWithValidity:%@], because syncAnchor.shouldResetSync", (uint8_t *)v2);
  sub_21633F374();
}

void sub_2163456E0(void *a1)
{
  NSObject *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7[6];

  sub_216343668(a1);
  v2 = (void *)sub_2163436A8();
  objc_msgSend_shortDescription(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v1, v6, "%s calling [syncAnchor resetSync], sync anchor is older than last cleared change sync anchor of %@", (uint8_t *)v7);

  sub_21634365C();
}

void sub_216345774()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v0, v1, "%s syncAnchor: %@", (uint8_t *)v2);
  sub_21633F374();
}

void sub_2163457E4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v0, v1, "%s calling [beginInfo resetWithValidity:%@], because validity not current", (uint8_t *)v2);
  sub_21633F374();
}

void sub_216345854(void *a1)
{
  NSObject *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7[6];

  sub_216343668(a1);
  v2 = (void *)sub_2163436A8();
  objc_msgSend_internalGUID(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v1, v6, "%s Redacting Me contact, saPerson.internalGUID=%@", (uint8_t *)v7);

  sub_21634365C();
}

void sub_2163458E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s < getChangeAfterAnchor", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_216345958(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s change sync failed to find any contacts to sync", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_2163459C8(void *a1)
{
  NSObject *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9[10];

  v2 = sub_2163436CC(a1);
  v5 = sub_2163436B4((uint64_t)v2, v3, v4);
  sub_2163436C0(v5, v6, v7);
  v9[0] = 136315650;
  sub_21634368C();
  sub_21633F31C(&dword_21633D000, v1, v8, "%s change sync trying to find next contact to sync, self.syncIndex=%li, self.syncCount=%li", (uint8_t *)v9);

  sub_21633F344();
}

void sub_216345A54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s full sync failed to find any contacts to sync", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_216345AC4(void *a1)
{
  NSObject *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9[10];

  v2 = sub_2163436CC(a1);
  v5 = sub_2163436B4((uint64_t)v2, v3, v4);
  sub_2163436C0(v5, v6, v7);
  v9[0] = 136315650;
  sub_21634368C();
  sub_21633F31C(&dword_21633D000, v1, v8, "%s full sync trying to find next contact to sync, self.syncIndex=%li, self.syncCount=%li", (uint8_t *)v9);

  sub_21633F344();
}

void sub_216345B50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s no more changes coming", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_216345BC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s < getChangeAfterAnchor - sync is not available", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_216345C30()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v0, v1, "%s > getChangeAfterAnchor:%@", (uint8_t *)v2);
  sub_21633F374();
}

void sub_216345CA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21633F354(&dword_21633D000, a1, a3, "%s > syncDidEnd", a5, a6, a7, a8, 2u);
  sub_21633F374();
}

void sub_216345D10(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend_validity(a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(a3, v9, v10);
  objc_msgSend_anchor(a3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 136316162;
  v16 = "-[ABAssistantSyncWorker syncSnapshotForKey:]";
  v17 = 2112;
  v18 = a1;
  v19 = 2112;
  v20 = v8;
  v21 = 2048;
  v22 = v11;
  v23 = 2112;
  v24 = v14;
  _os_log_debug_impl(&dword_21633D000, v5, OS_LOG_TYPE_DEBUG, "%s syncSnapshotForKey:%@, validity=%@, count=%li, anchor=\"%@\"", (uint8_t *)&v15, 0x34u);

}

void sub_216345E18()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v0, v1, "%s Failed to get the store identifier, error = %@", (uint8_t *)v2);
  sub_21633F374();
}

void sub_216345E88(void *a1)
{
  NSObject *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7[6];

  sub_216343668(a1);
  v2 = (void *)sub_2163436A8();
  objc_msgSend_expectedSyncKeyPrefix(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315394;
  sub_21633F37C();
  sub_216343650(&dword_21633D000, v1, v6, "%s raising an exception because key is wrong, was expecting key with prefix \"%@\"", (uint8_t *)v7);

  sub_21634365C();
}

void sub_216345F1C()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  sub_216343670();
  sub_21633F31C(&dword_21633D000, v0, (uint64_t)v0, "%s Failed to register %@ for contacts change history, error = %@", (uint8_t *)v1);
}

void sub_216345F94()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  sub_216343670();
  sub_21633F31C(&dword_21633D000, v0, (uint64_t)v0, "%s Failed to unregister %@ for contacts change history, error = %@", (uint8_t *)v1);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

uint64_t _AFRedactedCopyPerson()
{
  return MEMORY[0x24BE09458]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

