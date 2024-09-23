void sub_21B03D954()
{
  IDSHashPersistenceAWDLogging *v0;
  void *v1;

  v0 = objc_alloc_init(IDSHashPersistenceAWDLogging);
  v1 = (void *)qword_253F211D8;
  qword_253F211D8 = (uint64_t)v0;

}

void sub_21B03DBF8(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_metricContainerForMetricType:", 1376268);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v2 = objc_alloc_init((Class)MEMORY[0x22075BF7C](CFSTR("AWDIDSDuplicatedMessage"), CFSTR("WirelessDiagnostics")));
    objc_msgSend(*(id *)(a1 + 32), "_submitAWDMetric:withContainer:", v2, v3);

  }
}

void sub_21B03DC9C(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22075C0C0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id sub_21B03DCD0()
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21B03DD4C;
  block[3] = &unk_24DE299A8;
  block[4] = CFSTR("IDSHashMessageStore");
  if (qword_253F211B0 != -1)
    dispatch_once(&qword_253F211B0, block);
  return (id)qword_253F211B8;
}

void sub_21B03DD4C()
{
  uint64_t v0;
  void *v1;

  v0 = CSDBCreateThreadedRecordStoreWithQOSClassAndLookAsideBufferConfig();
  v1 = (void *)qword_253F211B8;
  qword_253F211B8 = v0;

}

void sub_21B03DD80()
{
  void *v0;
  void *v1;
  void *v2;

  os_unfair_lock_assert_owner(&stru_253F211E8);
  sub_21B03DCD0();
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    v1 = (void *)MEMORY[0x22075C0C0]();
    sub_21B03DCD0();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CSDBThreadedRecordStoreEnsureDatabaseSetupWithProtection();

    objc_autoreleasePoolPop(v1);
  }
}

void sub_21B03DE34()
{
  os_unfair_lock_assert_owner(&stru_253F211E8);
}

void sub_21B03DE40(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  os_unfair_lock_lock(&stru_253F211E8);
  sub_21B03DD80();
  sub_21B03DCD0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CSDBPerformLocked();

  os_unfair_lock_unlock(&stru_253F211E8);
}

void sub_21B03DE9C(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  os_unfair_lock_assert_owner(&stru_253F211E8);
  sub_21B03DD80();
  sub_21B03DCD0();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CSDBPerformUnlockedSectionForQueryForWriting();

}

void sub_21B03DEF8(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  os_unfair_lock_assert_owner(&stru_253F211E8);
  sub_21B03DD80();
  sub_21B03DCD0();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CSDBPerformUnlockedSectionForQueryForReading();

}

void sub_21B03DF54()
{
  NSObject *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[16];

  os_unfair_lock_assert_owner(&stru_253F211E8);
  OSLogHandleForIDSCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B03C000, v0, OS_LOG_TYPE_DEFAULT, "Saving database.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  sub_21B03DCD0();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CSDBPerformLockedSectionForRecordStore();

  sub_21B03DCD0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21B03C000, v3, OS_LOG_TYPE_DEFAULT, "Destroying database.", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
    sub_21B03DCD0();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x22075BF70]();

    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B03C000, v5, OS_LOG_TYPE_DEFAULT, "Closed database.", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
        _IDSLogV();
    }
  }
}

uint64_t sub_21B03E19C()
{
  CSDBRecordSaveStore();
  return CSDBRecordStoreInvalidateCachesWithStore();
}

void sub_21B03E1C4()
{
  id v0;

  os_unfair_lock_assert_owner(&stru_253F211E8);
  sub_21B03DCD0();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  CSDBPerformLockedSectionForRecordStoreWithoutInitialize();

}

uint64_t sub_21B03E204()
{
  return CSDBRecordStoreInvalidateCachesWithStore();
}

uint64_t sub_21B03E20C()
{
  os_unfair_lock_assert_owner(&stru_253F211E8);
  return CSDBSqliteSetDefaultPageCacheSize();
}

uint64_t sub_21B03E238()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v0 = (void *)MEMORY[0x22075C0C0]();
  v1 = CSDBGetMobileUserDirectory();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "processName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ids-hashes-%@.db"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObjects:", v7, CFSTR("/Library/IdentityServices/"), v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathWithComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "fileSystemRepresentation");
    CSDBGetMobileUserUID();
    CSDBGetMobileUserGID();
    CSDBCreateDirectoriesToPath();
    objc_msgSend(v10, "stringByResolvingAndStandardizingPath");
    v1 = objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v0);
  return v1;
}

uint64_t sub_21B03E378()
{
  NSObject *v0;
  uint8_t v2[16];

  CSDBRecordStoreCreateTablesForClass();
  OSLogHandleForIDSCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21B03C000, v0, OS_LOG_TYPE_DEBUG, "Creating indexes on message_hash_data and expiration_date", v2, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  CSDBSqliteConnectionPerformSQL();
  return CSDBSqliteConnectionPerformSQL();
}

uint64_t sub_21B03E46C()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  uint8_t v4[16];
  uint8_t v5[16];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B03C000, v0, OS_LOG_TYPE_DEBUG, "Enabling auto vacuum.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  CSDBSqliteConnectionPerformSQL();
  OSLogHandleForIDSCategory();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B03C000, v1, OS_LOG_TYPE_DEBUG, "Enabling WAL journal mode.", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  CSDBSqliteConnectionPerformSQL();
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21B03C000, v2, OS_LOG_TYPE_DEBUG, "Enabling Foreign Key support.", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  return CSDBSqliteConnectionPerformSQL();
}

BOOL sub_21B03E698(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _IMWarn();
  if (a3 <= 0x2329)
    _IMWarn();
  return a3 < 0x232A;
}

uint64_t sub_21B03E6F0(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v5;
  BOOL v6;

  if (a3 != 9001)
    return 0;
  v3 = CSDBSqliteConnectionPerformSQL();
  if (v3 != 101 && v3 != 0)
    return 2;
  v5 = v3;
  CSDBSqliteDatabaseSetVersion();
  if (v5)
    v6 = v5 == 101;
  else
    v6 = 1;
  if (v6)
    return 0;
  else
    return 2;
}

uint64_t sub_21B03E76C()
{
  return CSDBThreadedRecordStoreRegisterClass();
}

uint64_t sub_21B03E77C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_21B03E7D8;
  v3[3] = &unk_24DE29B98;
  v3[4] = a2;
  v3[5] = a1;
  sub_21B03DE9C((uint64_t)CFSTR("INSERT INTO message_hash (message_hash_data, creation_date) VALUES (?, ?);"), v3);
  return 1;
}

uint64_t sub_21B03E7D8()
{
  CSDBSqliteBindBlobFromCFData();
  CSDBSqliteBindInt64();
  return CSDBSqliteStatementPerform();
}

BOOL sub_21B03E814(uint64_t a1)
{
  _BOOL8 v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  if (!a1)
    return 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_21B03E8D0;
  v3[3] = &unk_24DE29BC0;
  v3[4] = &v4;
  v3[5] = a1;
  sub_21B03DEF8((uint64_t)CFSTR("SELECT COUNT(1) FROM message_hash WHERE message_hash_data = ? LIMIT 1;"), v3);
  v1 = *((_BYTE *)v5 + 24) != 0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21B03E8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21B03E8D0(uint64_t a1)
{
  uint64_t result;

  CSDBSqliteBindBlobFromCFData();
  result = CSDBSqliteStep();
  if ((_DWORD)result)
  {
    result = CSDBSqliteStatementInteger64ResultColumn();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result > 0;
  }
  return result;
}

void sub_21B03E928(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  if (a2)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = sub_21B03E984;
    v2[3] = &unk_24DE29B98;
    v2[4] = a1;
    v2[5] = a2;
    sub_21B03DE9C((uint64_t)CFSTR("UPDATE message_hash SET creation_date = ? WHERE message_hash_data = ?; "), v2);
  }
}

uint64_t sub_21B03E984()
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindBlobFromCFData();
  return CSDBSqliteStatementPerform();
}

void sub_21B03E9C0(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = sub_21B03EA18;
  v1[3] = &unk_24DE29BE0;
  v1[4] = a1;
  sub_21B03DE9C((uint64_t)CFSTR("UPDATE message_hash SET creation_date = ? WHERE creation_date > ?; "), v1);
}

uint64_t sub_21B03EA18()
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  return CSDBSqliteStatementPerform();
}

void sub_21B03EA54(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = sub_21B03EAAC;
  v1[3] = &unk_24DE29BE0;
  v1[4] = a1;
  sub_21B03DE9C((uint64_t)CFSTR("DELETE from message_hash WHERE creation_date < ?; "), v1);
}

uint64_t sub_21B03EAAC()
{
  CSDBSqliteBindInt64();
  return CSDBSqliteStatementPerform();
}

void sub_21B03EB18()
{
  IDSMessageHashStore *v0;
  void *v1;

  v0 = objc_alloc_init(IDSMessageHashStore);
  v1 = (void *)qword_253F211E0;
  qword_253F211E0 = (uint64_t)v0;

}

uint64_t sub_21B03EF90(uint64_t a1)
{
  BOOL v2;

  v2 = (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || sub_21B03E814(*(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  sub_21B03E1C4();
  return objc_msgSend(*(id *)(a1 + 32), "_setDatabaseCloseTimerOnIvarQueue");
}

uint64_t sub_21B03F0A8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  if ((unint64_t)objc_msgSend(v2, "count") >= 0xA)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeFirstObject");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  OSLogHandleForIDSCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_21B03C000, v6, OS_LOG_TYPE_DEBUG, "Storing temporarily %@", buf, 0xCu);
  }

  result = os_log_shim_legacy_logging_enabled();
  if ((_DWORD)result)
  {
    result = _IDSShouldLog();
    if ((_DWORD)result)
      return _IDSLogV();
  }
  return result;
}

void sub_21B03F20C(int8x16_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_21B03C000, v2, OS_LOG_TYPE_DEFAULT, "Adding message hash %@ to the database", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_21B03F374;
  v6[3] = &unk_24DE29C50;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  sub_21B03DE40(v6);

}

uint64_t sub_21B03F374(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  sub_21B03E77C(objc_msgSend(*(id *)(a1 + 32), "_currentLocalTime"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = 0;

  }
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21B03C000, v4, OS_LOG_TYPE_DEBUG, "Updating local cache %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  sub_21B03E1C4();
  return objc_msgSend(*(id *)(a1 + 32), "_setDatabaseCloseTimerOnIvarQueue");
}

void sub_21B03F548(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_21B03F5AC;
  v2[3] = &unk_24DE29C50;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  sub_21B03DE40(v2);

}

uint64_t sub_21B03F5AC(uint64_t a1)
{
  sub_21B03E928(objc_msgSend(*(id *)(a1 + 32), "_currentLocalTime"), *(_QWORD *)(a1 + 40));
  sub_21B03E1C4();
  return objc_msgSend(*(id *)(a1 + 32), "_setDatabaseCloseTimerOnIvarQueue");
}

void sub_21B03F690()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  uint8_t v3[16];
  uint8_t v4[16];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B03C000, v0, OS_LOG_TYPE_DEBUG, "Performing initial database housekeeping", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  OSLogHandleForIDSCategory();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21B03C000, v1, OS_LOG_TYPE_DEBUG, "  => Setting cache size", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  sub_21B03E20C();
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21B03C000, v2, OS_LOG_TYPE_DEBUG, "  => Invalidating caches", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  sub_21B03E1C4();
}

void sub_21B03F964(uint64_t a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  double v4;
  int64_t v5;
  NSObject *v6;
  dispatch_time_t v7;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(v3 + 40) - Current + 600.0;
  if (v4 <= 0.0)
  {
    MEMORY[0x24BEDD108](v3, sel_closeDatabase);
  }
  else
  {
    v5 = (uint64_t)(v4 * 1000000000.0);
    v6 = *(NSObject **)(v3 + 32);
    v7 = dispatch_time(0, v5);
    dispatch_source_set_timer(v6, v7, 0x7FFFFFFFFFFFFFFFuLL, v5 / 10);
  }
}

void sub_21B03FAEC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
  sub_21B03DF54();
}

uint64_t sub_21B03FC9C(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__runCleanup);
}

void sub_21B03FDA0(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  double v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  sub_21B03E9C0(objc_msgSend(*(id *)(a1 + 32), "_currentLocalTime"));
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "_currentLocalTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -2592000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21B03C000, v4, OS_LOG_TYPE_DEBUG, "Removing messages older than %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v6 = v3;
    _IDSLogV();
  }
  objc_msgSend(v3, "timeIntervalSince1970", v6);
  sub_21B03EA54((uint64_t)v5);
  sub_21B03E1C4();
  objc_msgSend(*(id *)(a1 + 32), "_setDatabaseCloseTimerOnIvarQueue");

}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t CSDBCreateDirectoriesToPath()
{
  return MEMORY[0x24BE27F00]();
}

uint64_t CSDBCreateThreadedRecordStoreWithQOSClassAndLookAsideBufferConfig()
{
  return MEMORY[0x24BE27F10]();
}

uint64_t CSDBGetMobileUserDirectory()
{
  return MEMORY[0x24BE27F18]();
}

uint64_t CSDBGetMobileUserGID()
{
  return MEMORY[0x24BE27F20]();
}

uint64_t CSDBGetMobileUserUID()
{
  return MEMORY[0x24BE27F28]();
}

uint64_t CSDBPerformLocked()
{
  return MEMORY[0x24BE27F38]();
}

uint64_t CSDBPerformLockedSectionForRecordStore()
{
  return MEMORY[0x24BE27F50]();
}

uint64_t CSDBPerformLockedSectionForRecordStoreWithoutInitialize()
{
  return MEMORY[0x24BE27F58]();
}

uint64_t CSDBPerformUnlockedSectionForQueryForReading()
{
  return MEMORY[0x24BE27F60]();
}

uint64_t CSDBPerformUnlockedSectionForQueryForWriting()
{
  return MEMORY[0x24BE27F68]();
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

uint64_t CSDBSqliteConnectionPerformSQL()
{
  return MEMORY[0x24BE27FB8]();
}

uint64_t CSDBSqliteDatabaseSetVersion()
{
  return MEMORY[0x24BE27FC8]();
}

uint64_t CSDBSqliteSetDefaultPageCacheSize()
{
  return MEMORY[0x24BE27FE0]();
}

uint64_t CSDBSqliteStatementInteger64ResultColumn()
{
  return MEMORY[0x24BE27FF8]();
}

uint64_t CSDBSqliteStatementPerform()
{
  return MEMORY[0x24BE28000]();
}

uint64_t CSDBSqliteStep()
{
  return MEMORY[0x24BE28008]();
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

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x24BE50840]();
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x24BE508F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _IDSLogV()
{
  return MEMORY[0x24BE4FEB8]();
}

uint64_t _IDSShouldLog()
{
  return MEMORY[0x24BE4FEC0]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x24BDAF388]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

