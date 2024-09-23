@implementation FCFaultableRecord

+ (id)readValueFromKeyValuePair:(id)a3
{
  void *v3;
  id v4;
  FCFaultableRecord *v5;
  FCFaultableRecord *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "recordData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  objc_opt_self();
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "recordData != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "+[FCFaultableRecord faultableRecordWithRecordData:]";
    v11 = 2080;
    v12 = "FCFaultableRecord.m";
    v13 = 1024;
    v14 = 47;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = objc_alloc_init(FCFaultableRecord);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_recordData, v3);

  return v6;
}

- (FCFaultableRecord)init
{
  FCFaultableRecord *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCFaultableRecord;
  result = -[FCFaultableRecord init](&v3, sel_init);
  if (result)
    result->_recordLock._os_unfair_lock_opaque = 0;
  return result;
}

+ (FCFaultableRecord)faultableRecordWithRecord:(uint64_t)a1
{
  id v3;
  FCFaultableRecord *v4;
  FCFaultableRecord *v5;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_self();
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "record != nil");
    *(_DWORD *)buf = 136315906;
    v9 = "+[FCFaultableRecord faultableRecordWithRecord:]";
    v10 = 2080;
    v11 = "FCFaultableRecord.m";
    v12 = 1024;
    v13 = 38;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = objc_alloc_init(FCFaultableRecord);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_record, a2);

  return v5;
}

- (id)record
{
  os_unfair_lock_s *v2;
  id v3;
  id v4;
  BOOL v5;
  void *v6;
  int v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v3 = *(id *)(a1 + 16);
    v4 = *(id *)(a1 + 32);
    os_unfair_lock_unlock(v2);
    if (v3)
      v5 = 1;
    else
      v5 = v4 == 0;
    if (v5)
      goto LABEL_20;
    -[FCFaultableRecord recordBase](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "recordType");

    switch(v7)
    {
      case 0:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown type in faultable record"));
          v16 = 136315906;
          v17 = "-[FCFaultableRecord record]";
          v18 = 2080;
          v19 = "FCFaultableRecord.m";
          v20 = 1024;
          v21 = 129;
          v22 = 2114;
          v23 = v15;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);

        }
        goto LABEL_9;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
        v8 = (objc_class *)objc_opt_class();
        break;
      default:
LABEL_9:
        v8 = 0;
        break;
    }
    v9 = objc_msgSend([v8 alloc], "initWithData:", v4);
    v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
      {
        v11 = FCRecordSourceLog;
        if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v16) = 0;
          v12 = "failed to decode record from faultable record";
LABEL_22:
          _os_log_fault_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v16, 2u);
        }
      }
    }
    else
    {
      v11 = FCRecordSourceLog;
      if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v16) = 0;
        v12 = "failed to find record class for faultable record";
        goto LABEL_22;
      }
    }
    os_unfair_lock_lock_with_options();
    v13 = *(void **)(a1 + 16);
    if (v13)
    {
      v3 = v13;
    }
    else
    {
      v3 = v10;
      v10 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v3;
    }

    os_unfair_lock_unlock(v2);
LABEL_20:

    return v3;
  }
  return 0;
}

- (id)recordBase
{
  os_unfair_lock_s *v2;
  id *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v4 = *(void **)(a1 + 24);
    v3 = (id *)(a1 + 24);
    v5 = v4;
    v6 = v3[1];
    v7 = *(v3 - 1);
    os_unfair_lock_unlock(v2);
    if (!v5)
    {
      if (v7)
        objc_msgSend(v7, "base");
      else
        NTPBReadBaseFromRecordData();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock_with_options();
      if (*v3)
      {
        v8 = *v3;

        os_unfair_lock_unlock(v2);
        v5 = v8;
      }
      else
      {
        objc_storeStrong(v3, v5);
        os_unfair_lock_unlock(v2);
        if (!v5)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("faultable record failed to load base"));
            v14 = 136315906;
            v15 = "-[FCFaultableRecord recordBase]";
            v16 = 2080;
            v17 = "FCFaultableRecord.m";
            v18 = 1024;
            v19 = 103;
            v20 = 2114;
            v21 = v13;
            _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingRecordBase) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

          }
          v5 = 0;
          goto LABEL_12;
        }
      }
    }
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("faultable record loaded base without an identifier"));
      v14 = 136315906;
      v15 = "-[FCFaultableRecord recordBase]";
      v16 = 2080;
      v17 = "FCFaultableRecord.m";
      v18 = 1024;
      v19 = 104;
      v20 = 2114;
      v21 = v12;
      _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: CorruptRecordBase) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

    }
LABEL_12:
    v10 = v5;

    return v10;
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordData, 0);
  objc_storeStrong((id *)&self->_recordBase, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

+ (int)keyValuePairType
{
  return 5;
}

- (void)writeToKeyValuePair:(id)a3
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-writeValueToDataWriter should have been used instead"));
    v4 = 136315906;
    v5 = "-[FCFaultableRecord writeToKeyValuePair:]";
    v6 = 2080;
    v7 = "FCFaultableRecord.m";
    v8 = 1024;
    v9 = 256;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);

  }
}

- (void)writeValueToDataWriter:(id)a3
{
  os_unfair_lock_s *p_recordLock;
  id v5;
  NSData *recordData;
  PBCodable *v7;
  NSData *v8;

  p_recordLock = &self->_recordLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  recordData = self->_recordData;
  v7 = self->_record;
  v8 = recordData;
  os_unfair_lock_unlock(p_recordLock);
  if (v8)
    PBDataWriterWriteDataField();
  else
    PBDataWriterWriteSubmessage();

}

@end
