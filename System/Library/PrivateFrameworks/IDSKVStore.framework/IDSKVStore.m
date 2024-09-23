void sub_20AC2B570(uint64_t a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  double v4;
  int64_t v5;
  NSObject *v6;
  dispatch_time_t v7;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(v3 + 24) - Current + 30.0;
  if (v4 <= 0.0)
  {
    MEMORY[0x24BEDD108](v3, sel___closeDatabaseOnIvarQueue);
  }
  else
  {
    v5 = (uint64_t)(v4 * 1000000000.0);
    v6 = *(NSObject **)(v3 + 16);
    v7 = dispatch_time(0, v5);
    dispatch_source_set_timer(v6, v7, 0x7FFFFFFFFFFFFFFFuLL, v5 / 10);
  }
}

void sub_20AC2B5F8(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AC2A000, v2, OS_LOG_TYPE_DEFAULT, "Saving database.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  CSDBPerformLockedSectionForRecordStore();
  if (*(_QWORD *)(a1 + 32))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "storeName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_20AC2A000, v3, OS_LOG_TYPE_DEFAULT, "%@ Destroying database.", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend(*(id *)(a1 + 40), "storeName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    objc_msgSend(*(id *)(a1 + 40), "messageStore", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x20BD2E5D8]();

    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "storeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_20AC2A000, v6, OS_LOG_TYPE_DEFAULT, "%@ Closed database.", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
      {
        objc_msgSend(*(id *)(a1 + 40), "storeName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV();

      }
    }
  }
}

void sub_20AC2B88C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20AC2B808);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20AC2B8D4()
{
  CSDBSqliteConnectionPerformSQL();
  CSDBSqliteConnectionPerformSQL();
  return CSDBSqliteConnectionPerformSQL();
}

uint64_t sub_20AC2B91C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
  return CSDBPerformLockedSectionForQueryForWriting();
}

uint64_t sub_20AC2B99C(uint64_t a1)
{
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  CSDBGetMobileUserUID();
  CSDBGetMobileUserGID();
  CSDBCreateDirectoriesToPath();
  objc_msgSend(*(id *)(a1 + 32), "stringByResolvingAndStandardizingPath");
  return objc_claimAutoreleasedReturnValue();
}

uint64_t sub_20AC2BDF8(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__performInitialHousekeepingOnIvarQueue);
}

void sub_20AC2BF3C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");

  v3 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  CSDBPerformLockedSectionForQueryForWriting();

}

uint64_t sub_20AC2BFF8()
{
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindBlobFromCFData();
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  return CSDBSqliteStatementPerform();
}

void sub_20AC2C170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20AC2C188(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20AC2C198(uint64_t a1)
{

}

void sub_20AC2C1A0(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  CSDBPerformLockedSectionForQueryForReading();

}

void sub_20AC2C224(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindInt64();
  v2 = CSDBSqliteStatementCopyDataResult();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_20AC2C3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20AC2C3D8()
{
  return CSDBPerformLockedSectionForQueryForReading();
}

uint64_t sub_20AC2C44C(uint64_t a1)
{
  const CFArrayCallBacks *v2;
  uint64_t result;
  const void *v4;
  __CFArray *v5;

  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  v2 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  while (1)
  {
    result = CSDBSqliteStatementCopyDataResult();
    if (!result)
      break;
    v4 = (const void *)result;
    v5 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (!v5)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v2);
      v5 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
    CFArrayAppendValue(v5, v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CSDBSqliteStatementInteger64ResultColumn();
    CFRelease(v4);
  }
  return result;
}

uint64_t sub_20AC2C5B0()
{
  return CSDBPerformLockedSectionForQueryForWriting();
}

uint64_t sub_20AC2C618()
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  return CSDBSqliteStatementPerform();
}

uint64_t sub_20AC2C728()
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  return CSDBSqliteStatementPerform();
}

void sub_20AC2C824(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  CSDBPerformLockedSectionForQueryForWriting();

}

uint64_t sub_20AC2C8A4()
{
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindInt64();
  return CSDBSqliteStatementPerform();
}

void sub_20AC2C9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20AC2C9E4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
  return CSDBPerformLockedSectionForQueryForReading();
}

uint64_t sub_20AC2CA58(uint64_t a1)
{
  const CFArrayCallBacks *v2;
  uint64_t result;
  const void *v4;
  __CFArray *v5;

  CSDBSqliteBindInt64();
  v2 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  while (1)
  {
    result = CSDBSqliteStatementCopyStringResult();
    if (!result)
      break;
    v4 = (const void *)result;
    v5 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (!v5)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v2);
      v5 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
    CFArrayAppendValue(v5, v4);
    CFRelease(v4);
  }
  return result;
}

uint64_t sub_20AC2CBA4(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__onIvarQueue_persistSerializedValue_forKey_valueType_);
}

void sub_20AC2CC8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_serializedValueForKey:valueType:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_20AC2CD84(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_serializedValuesUpToLimit:valueType:deleteContext:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_20AC2CE98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_storedKeysAfter:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t sub_20AC2CED4(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__onIvarQueue_deleteDatesBefore_after_);
}

uint64_t sub_20AC2CF74(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rowIDCutoff");
  objc_msgSend(*(id *)(a1 + 40), "valueType");
  return MEMORY[0x24BEDD108](v2, sel__onIvarQueue_deleteUpToRowID_valueType_);
}

uint64_t sub_20AC2D010()
{
  return CSDBRecordStoreInvalidateCachesWithStore();
}

uint64_t sub_20AC2D0A4(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AC2A000, v2, OS_LOG_TYPE_DEBUG, "Performing initial database housekeeping", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20AC2A000, v3, OS_LOG_TYPE_DEBUG, "  => Setting cache size", v7, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  CSDBSqliteSetDefaultPageCacheSize();
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20AC2A000, v4, OS_LOG_TYPE_DEBUG, "  => Invalidating caches", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  return objc_msgSend((id)objc_opt_class(), "_invalidateCachesForMessageStore:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_20AC2D2B8()
{
  CSDBRecordStoreCreateTablesForClass();
  return CSDBSqliteConnectionPerformSQL();
}

BOOL sub_20AC2D2F0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v4;

  _IMWarn();
  v4 = a3 >> 3;
  if (v4 <= 0x658)
    _IMWarn();
  return v4 < 0x659;
}

uint64_t sub_20AC2D348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  int v19;
  BOOL v20;
  int v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint8_t v28[16];
  uint8_t buf[16];
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t v33[16];

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = a3;
  v27 = 13000;
  _IMWarn();
  CSDBSqliteConnectionCommit();
  if ((CSDBSqliteDatabaseCheckIntegrity() & 1) != 0)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AC2A000, v5, OS_LOG_TYPE_DEFAULT, "Initial integrity check success", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
LABEL_34:
      _IDSLogV();
  }
  else
  {
    v6 = CSDBSqliteConnectionPerformSQL();
    if ((_DWORD)v6 != 101 && (_DWORD)v6)
    {
      v26 = v6;
      _IMWarn();
    }
    else
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_20AC2A000, v7, OS_LOG_TYPE_DEFAULT, "Reindexing the KV Store worked.", v33, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
    }
    if ((CSDBSqliteDatabaseCheckIntegrity() & 1) != 0)
    {
      OSLogHandleForIDSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_20AC2A000, v8, OS_LOG_TYPE_DEFAULT, "Post-reindex integrity check success", v30, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        goto LABEL_34;
    }
    else
    {
      v9 = CSDBSqliteDatabaseVacuum();
      if (v9 != 101 && v9)
      {
        _IMWarn();
      }
      else
      {
        OSLogHandleForIDSCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_20AC2A000, v10, OS_LOG_TYPE_DEFAULT, "Database vacuum success", v32, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          _IDSLogV();
      }
      if ((CSDBSqliteDatabaseCheckIntegrity() & 1) != 0)
      {
        OSLogHandleForIDSCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_20AC2A000, v11, OS_LOG_TYPE_DEFAULT, "Final integrity check success", v31, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          goto LABEL_34;
      }
      else
      {
        _IMWarn();
      }
    }
  }
  CSDBSqliteConnectionBegin();
  if (a3 > 0x32C8)
  {
    _IMWarn();
    v23 = 2;
  }
  else
  {
    CSDBSqliteConnectionBeginTransactionType();
    if (a3 >> 4 >= 0x271)
    {
      CSDBSqliteDatabaseSetVersion();
      OSLogHandleForIDSCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_20AC2A000, v12, OS_LOG_TYPE_DEFAULT, "Add date column to kvtable", v28, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@ %@;"),
                      CFSTR("kvtable"),
                      CFSTR("date"),
                      CFSTR("INTEGER DEFAULT 0"));
      v14 = CSDBSqliteConnectionPerformSQL();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSince1970");
      v17 = (uint64_t)v16;

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("UPDATE %@ SET %@ = %ld;"),
                      CFSTR("kvtable"),
                      CFSTR("date"),
                      v17);
      v19 = CSDBSqliteConnectionPerformSQL();
      if (v19)
        v20 = v19 == 101;
      else
        v20 = 1;
      v21 = v20;
      v22 = v14 == 101 || v14 == 0;
      if (!v22 || !v21)
      {

        CSDBSqliteConnectionCommit();
        v23 = 2;
        goto LABEL_59;
      }
      CSDBSqliteDatabaseSetVersion();

    }
    CSDBSqliteConnectionCommit();
    CSDBSqliteConnectionPerformSQL();
    v23 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date", v26, v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceDate:", v4);
  _IMWarn();

LABEL_59:
  return v23;
}

uint64_t sub_20AC2D970()
{
  return CSDBThreadedRecordStoreRegisterClass();
}

uint64_t sub_20AC2DA04()
{
  CSDBRecordSaveStore();
  return CSDBRecordStoreInvalidateCachesWithStore();
}

uint64_t sub_20AC2DAF0(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_clearDatabaseCloseTimerOnIvarQueue");
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_20AC2DB60;
  v4[3] = &unk_24C383AE8;
  v4[4] = v2;
  return objc_msgSend(v2, "_onIvarQueue_performBlock:initializeStore:waitUntilDone:", v4, 0, 1);
}

uint64_t sub_20AC2DB60(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel___closeDatabaseOnIvarQueue);
}

uint64_t sub_20AC2DBD0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "path");
  return CSDBSqliteDeleteDatabase();
}

void sub_20AC2DCEC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[9];

  block[8] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 68))
    objc_msgSend((id)objc_opt_class(), "_initializeMessageStoreIfNeeded:path:dataProtectionClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend((id)objc_opt_class(), "_invalidateCachesForMessageStore:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20AC2DEDC;
  block[3] = &unk_24C383AE8;
  block[4] = v2;
  dispatch_async(v3, block);
}

void sub_20AC2DDBC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf)
{
  id v15;
  NSObject *v16;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(a1);
    OSLogHandleForIDSCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_20AC2A000, v16, OS_LOG_TYPE_ERROR, "Exception performing database block %@", (uint8_t *)&buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }

    objc_end_catch();
    JUMPOUT(0x20AC2DD8CLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20AC2DEDC(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__setDatabaseCloseTimerOnIvarQueue);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CSDBCreateDirectoriesToPath()
{
  return MEMORY[0x24BE27F00]();
}

uint64_t CSDBCreateThreadedRecordStore()
{
  return MEMORY[0x24BE27F08]();
}

uint64_t CSDBGetMobileUserGID()
{
  return MEMORY[0x24BE27F20]();
}

uint64_t CSDBGetMobileUserUID()
{
  return MEMORY[0x24BE27F28]();
}

uint64_t CSDBPerformBlock()
{
  return MEMORY[0x24BE27F30]();
}

uint64_t CSDBPerformLockedSectionForQueryForReading()
{
  return MEMORY[0x24BE27F40]();
}

uint64_t CSDBPerformLockedSectionForQueryForWriting()
{
  return MEMORY[0x24BE27F48]();
}

uint64_t CSDBPerformLockedSectionForRecordStore()
{
  return MEMORY[0x24BE27F50]();
}

uint64_t CSDBPerformLockedSectionForRecordStoreWithoutInitialize()
{
  return MEMORY[0x24BE27F58]();
}

uint64_t CSDBRecordSaveStore()
{
  return MEMORY[0x24BE27F70]();
}

uint64_t CSDBRecordStoreCreateTablesForClass()
{
  return MEMORY[0x24BE27F78]();
}

uint64_t CSDBRecordStoreInvalidateCachesWithStore()
{
  return MEMORY[0x24BE27F80]();
}

uint64_t CSDBSqliteBindBlobFromCFData()
{
  return MEMORY[0x24BE27F88]();
}

uint64_t CSDBSqliteBindInt64()
{
  return MEMORY[0x24BE27F90]();
}

uint64_t CSDBSqliteBindTextFromCFString()
{
  return MEMORY[0x24BE27F98]();
}

uint64_t CSDBSqliteConnectionBegin()
{
  return MEMORY[0x24BE27FA0]();
}

uint64_t CSDBSqliteConnectionBeginTransactionType()
{
  return MEMORY[0x24BE27FA8]();
}

uint64_t CSDBSqliteConnectionCommit()
{
  return MEMORY[0x24BE27FB0]();
}

uint64_t CSDBSqliteConnectionPerformSQL()
{
  return MEMORY[0x24BE27FB8]();
}

uint64_t CSDBSqliteDatabaseCheckIntegrity()
{
  return MEMORY[0x24BE27FC0]();
}

uint64_t CSDBSqliteDatabaseSetVersion()
{
  return MEMORY[0x24BE27FC8]();
}

uint64_t CSDBSqliteDatabaseVacuum()
{
  return MEMORY[0x24BE27FD0]();
}

uint64_t CSDBSqliteDeleteDatabase()
{
  return MEMORY[0x24BE27FD8]();
}

uint64_t CSDBSqliteSetDefaultPageCacheSize()
{
  return MEMORY[0x24BE27FE0]();
}

uint64_t CSDBSqliteStatementCopyDataResult()
{
  return MEMORY[0x24BE27FE8]();
}

uint64_t CSDBSqliteStatementCopyStringResult()
{
  return MEMORY[0x24BE27FF0]();
}

uint64_t CSDBSqliteStatementInteger64ResultColumn()
{
  return MEMORY[0x24BE27FF8]();
}

uint64_t CSDBSqliteStatementPerform()
{
  return MEMORY[0x24BE28000]();
}

uint64_t CSDBThreadedRecordStoreEnsureDatabaseSetupWithProtection()
{
  return MEMORY[0x24BE28010]();
}

uint64_t CSDBThreadedRecordStoreRegisterClass()
{
  return MEMORY[0x24BE28018]();
}

uint64_t CSDBThreadedRecordStoreTeardownDatabase()
{
  return MEMORY[0x24BE28020]();
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x24BE508F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _IDSLogTransport()
{
  return MEMORY[0x24BE4FEB0]();
}

uint64_t _IDSLogV()
{
  return MEMORY[0x24BE4FEB8]();
}

uint64_t _IDSShouldLog()
{
  return MEMORY[0x24BE4FEC0]();
}

uint64_t _IDSWarnV()
{
  return MEMORY[0x24BE4FEC8]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x24BE509B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x24BDAF388]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

