@implementation FCUserEventHistorySession

+ (id)dateFromSessionID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 6)
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__FCUserEventHistorySession_dateFromSessionID___block_invoke;
    v9[3] = &unk_1E463B350;
    v10 = v3;
    __47__FCUserEventHistorySession_dateFromSessionID___block_invoke((uint64_t)v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
  }

  return v7;
}

uint64_t __47__FCUserEventHistorySession_dateFromSessionID___block_invoke(uint64_t a1)
{
  void *v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Attempted to create a session with an invalid ID %@"), *(_QWORD *)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    v5 = "+[FCUserEventHistorySession dateFromSessionID:]_block_invoke";
    v6 = 2080;
    v7 = "FCUserEventHistorySession.m";
    v8 = 1024;
    v9 = 29;
    v10 = 2114;
    v11 = v3;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidUserEventHistorySessionID) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return 0;
}

- (FCUserEventHistorySession)initWithSessionID:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  FCUserEventHistorySession *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCUserEventHistorySession;
  v8 = -[FCUserEventHistorySession init](&v12, sel_init);
  if (v8)
  {
    +[FCUserEventHistorySession dateFromSessionID:](FCUserEventHistorySession, "dateFromSessionID:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[FCUserEventHistorySession setFileName:](v8, "setFileName:", v6);
      -[FCUserEventHistorySession setIdentifier:](v8, "setIdentifier:", v6);
      -[FCUserEventHistorySession setDate:](v8, "setDate:", v10);
      -[FCUserEventHistorySession setPath:](v8, "setPath:", v7);
    }
    else
    {
      v10 = v8;
      v8 = 0;
    }

  }
  return v8;
}

- (int64_t)size
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[FCUserEventHistorySession sizeNumber](self, "sizeNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCUserEventHistorySession sizeNumber](self, "sizeNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E98];
    -[FCUserEventHistorySession path](self, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v11 = objc_msgSend(v7, "fc_sizeOfItemAtURL:error:", v10, &v17);
    v12 = v17;

    if (v12)
    {
      v13 = (void *)FCUserEventsLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_ERROR))
      {
        v15 = v13;
        -[FCUserEventHistorySession path](self, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v16;
        _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, "Error getting size of sessions at %{public}@", buf, 0xCu);

      }
      v11 = -1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCUserEventHistorySession setSizeNumber:](self, "setSizeNumber:", v14);

    }
    return v11;
  }
}

- (NSData)data
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  -[FCUserEventHistorySession compressedData](self, "compressedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "decompressedDataUsingAlgorithm:error:", 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__FCUserEventHistorySession_data__block_invoke;
    v9[3] = &unk_1E463B350;
    v9[4] = self;
    __33__FCUserEventHistorySession_data__block_invoke((uint64_t)v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return (NSData *)v7;
}

uint64_t __33__FCUserEventHistorySession_data__block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Error decompressing compressed data for session %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)compressedData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99D50];
  -[FCUserEventHistorySession path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "dataWithContentsOfFile:options:error:", v4, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__FCUserEventHistorySession_compressedData__block_invoke;
    v10[3] = &unk_1E463B350;
    v10[4] = self;
    __43__FCUserEventHistorySession_compressedData__block_invoke((uint64_t)v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

uint64_t __43__FCUserEventHistorySession_compressedData__block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Error compressing data for session %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FCUserEventHistorySession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistorySession date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[FCUserEventHistorySession size](self, "size"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Session %@, on %@, size %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSNumber)sizeNumber
{
  return self->_sizeNumber;
}

- (void)setSizeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_sizeNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeNumber, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
