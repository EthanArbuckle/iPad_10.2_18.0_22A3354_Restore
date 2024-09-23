@implementation DSGeneralLogFile

- (DSGeneralLogFile)initWithURL:(id)a3
{
  id v5;
  DSGeneralLogFile *v6;
  DSGeneralLogFile *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSGeneralLogFile;
  v6 = -[DSGeneralLogFile init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    if (!-[DSGeneralLogFile parseDetailsWithURL:](v7, "parseDetailsWithURL:", v5))
    {

      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)parseDetailsWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  id v10;
  id location;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSTextFile textFileWithPath:](DSTextFile, "textFileWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__DSGeneralLogFile_parseDetailsWithURL___block_invoke;
    v9[3] = &unk_24E44A5A0;
    objc_copyWeak(&v10, &location);
    v9[4] = &v12;
    objc_msgSend(v6, "enumerateUsingBlock:", v9);
    v7 = *((_BYTE *)v13 + 24) != 0;
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __40__DSGeneralLogFile_parseDetailsWithURL___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  _QWORD *WeakRetained;
  id v10;
  DSLogLine *v11;
  DSLogLine *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a4 == 2)
    {
      v11 = -[DSLogLine initWithLine:]([DSLogLine alloc], "initWithLine:", v7);
      v12 = v11;
      if (v11)
      {
        -[DSLogLine date](v11, "date");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)WeakRetained[5];
        WeakRetained[5] = v13;

      }
      else
      {
        DiagnosticLogHandleForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = WeakRetained[2];
          v17 = 138412290;
          v18 = v16;
          _os_log_impl(&dword_21F54F000, v15, OS_LOG_TYPE_DEFAULT, "Log appears to be empty: %@", (uint8_t *)&v17, 0xCu);
        }

      }
    }
    else if (a4 == 1)
    {
      v10 = objc_loadWeakRetained((id *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v10, "parseHeadersWithLine:", v7);

    }
    else
    {
      objc_msgSend(v8, "end");
    }
  }

}

- (BOOL)parseHeadersWithLine:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSDate *v17;
  NSDate *restoreDate;
  NSString *v19;
  NSString *hardwareModel;
  NSString *v21;
  NSString *currentOSVersion;
  NSString *v23;
  NSString *serialNumber;
  void *v25;
  void *v26;
  void *v27;
  NSDate *v28;
  NSDate *updateDate;
  id v31;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v31;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", CFSTR("installed"), CFSTR("model"), CFSTR("os_build"), CFSTR("serial"), CFSTR("updated"), CFSTR("version"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v5, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject minusSet:](v7, "minusSet:", v10);
    v11 = -[NSObject count](v7, "count");
    v12 = v11 == 0;
    if (v11)
    {
      DiagnosticLogHandleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[DSGeneralLogFile parseHeadersWithLine:].cold.2((uint64_t)self, v13);
    }
    else
    {
      +[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "formatterWithType:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("installed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateFromString:", v16);
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      restoreDate = self->_restoreDate;
      self->_restoreDate = v17;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("model"));
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      hardwareModel = self->_hardwareModel;
      self->_hardwareModel = v19;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("os_build"));
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      currentOSVersion = self->_currentOSVersion;
      self->_currentOSVersion = v21;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serial"));
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      serialNumber = self->_serialNumber;
      self->_serialNumber = v23;

      +[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "formatterWithType:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updated"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dateFromString:", v27);
      v28 = (NSDate *)objc_claimAutoreleasedReturnValue();
      updateDate = self->_updateDate;
      self->_updateDate = v28;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
      v13 = objc_claimAutoreleasedReturnValue();
      self->_logVersion = -[NSObject intValue](v13, "intValue");
    }

  }
  else
  {
    DiagnosticLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DSGeneralLogFile parseHeadersWithLine:].cold.1((uint64_t)self, (uint64_t)v6, v7);
    v12 = 0;
  }

  return v12;
}

- (BOOL)enumerateLogLinesWithIDs:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[DSGeneralLogFile url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSTextFile textFileWithPath:](DSTextFile, "textFileWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__DSGeneralLogFile_enumerateLogLinesWithIDs_usingBlock___block_invoke;
  v14[3] = &unk_24E44A5C8;
  v11 = v6;
  v15 = v11;
  v17 = &v18;
  v12 = v7;
  v16 = v12;
  objc_msgSend(v10, "enumerateUsingBlock:", v14);
  LOBYTE(v8) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v8;
}

void __56__DSGeneralLogFile_enumerateLogLinesWithIDs_usingBlock___block_invoke(_QWORD *a1, void *a2, void *a3, unint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  DSLogLine *v10;
  DSLogLine *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = objc_msgSend(v14, "length");
  if (a4 >= 2 && v8)
  {
    v9 = (void *)MEMORY[0x2207CA484]();
    v10 = -[DSLogLine initWithLine:]([DSLogLine alloc], "initWithLine:", v14);
    v11 = v10;
    if (v10)
    {
      v12 = (void *)a1[4];
      -[DSLogLine type](v10, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v12, "containsObject:", v13);

      if ((_DWORD)v12)
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
    }

    objc_autoreleasePoolPop(v9);
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    objc_msgSend(v7, "end");

}

- (NSURL)url
{
  return self->_url;
}

- (NSDate)restoreDate
{
  return self->_restoreDate;
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (NSDate)logStartDate
{
  return self->_logStartDate;
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (NSString)currentOSVersion
{
  return self->_currentOSVersion;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (int)logVersion
{
  return self->_logVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_currentOSVersion, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_logStartDate, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_restoreDate, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)parseHeadersWithLine:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 16);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_21F54F000, log, OS_LOG_TYPE_ERROR, "Could not parse header for %@ error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)parseHeadersWithLine:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21F54F000, a2, OS_LOG_TYPE_ERROR, "One or more required keys are missing in the header for %@", (uint8_t *)&v3, 0xCu);
}

@end
