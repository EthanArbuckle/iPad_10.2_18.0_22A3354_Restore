@implementation CDPDBackupIDMSResultsParser

- (id)resultsDictionaryFromRecoveryResult:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  NSObject *v14;
  char isKindOfClass;
  _QWORD *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v23[16];
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(v5, "recoveredInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE17C40]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cdp_unarchivedRoot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "machineID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("prk"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_QWORD *)MEMORY[0x24BE1A340];
  if (v10)
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Parsed a MID\", buf, 2u);
    }

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, *v13);
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v16 = (_QWORD *)MEMORY[0x24BE1A338];
  if ((isKindOfClass & 1) != 0)
  {
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Parsed a PRK\", v23, 2u);
    }

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *v16);
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", *v13);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18
    && (v19 = (void *)v18,
        objc_msgSend(v12, "objectForKeyedSubscript:", *v16),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
    v21 = (void *)objc_msgSend(v12, "copy");
  }
  else if (a4)
  {
    _CDPStateError();
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
