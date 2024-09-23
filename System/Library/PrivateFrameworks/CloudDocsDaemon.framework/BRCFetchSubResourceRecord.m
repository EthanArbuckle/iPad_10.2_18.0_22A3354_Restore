@implementation BRCFetchSubResourceRecord

- (BRCFetchSubResourceRecord)initWithChangedRecord:(id)a3 recordIDNeedingFetch:(id)a4 xattrSignatureNeedingFetch:(id)a5 recordIDBlockingSave:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BRCFetchSubResourceRecord *v15;
  uint64_t v16;
  CKRecordID *recordID;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BRCFetchSubResourceRecord;
  v15 = -[BRCFetchSubResourceRecord init](&v19, sel_init);
  if (v15)
  {
    objc_msgSend(v11, "recordID");
    v16 = objc_claimAutoreleasedReturnValue();
    recordID = v15->_recordID;
    v15->_recordID = (CKRecordID *)v16;

    objc_storeStrong((id *)&v15->_record, a3);
    v15->_recordType = -[BRCFetchSubResourceRecord resolveRecordType](v15, "resolveRecordType");
    objc_storeStrong((id *)&v15->_recordIDNeedingFetch, a4);
    objc_storeStrong((id *)&v15->_xattrSignature, a5);
    objc_storeStrong((id *)&v15->_recordIDBlockingSave, a6);
  }

  return v15;
}

- (BRCFetchSubResourceRecord)initWithRecordIDNeedingFetch:(id)a3 recordType:(int64_t)a4
{
  id v7;
  BRCFetchSubResourceRecord *v8;
  BRCFetchSubResourceRecord *v9;
  void *v10;
  NSObject *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCFetchSubResourceRecord;
  v8 = -[BRCFetchSubResourceRecord init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recordIDNeedingFetch, a3);
    objc_storeStrong((id *)&v9->_recordID, a3);
    if (!a4)
      a4 = -[BRCFetchSubResourceRecord resolveRecordType](v9, "resolveRecordType");
    v9->_recordType = a4;
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCFetchSubResourceRecord initWithRecordIDNeedingFetch:recordType:].cold.1(&v9->_recordID);

  }
  return v9;
}

- (int64_t)resolveRecordType
{
  void *v3;
  int64_t v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;

  -[CKRecordID recordName](self->_recordID, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("documentContent/")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("documentStructure/")) & 1) != 0
         || (objc_msgSend(v3, "hasPrefix:", CFSTR("directory/")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CKRecord recordType](self->_record, "recordType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C94A20]);

    if ((v6 & 1) == 0)
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BRCFetchSubResourceRecord resolveRecordType].cold.1();

    }
    v4 = 3;
  }

  return v4;
}

- (BOOL)isWaitingOnShareIDFetch
{
  CKRecordID *recordIDNeedingFetch;

  recordIDNeedingFetch = self->_recordIDNeedingFetch;
  if (recordIDNeedingFetch)
    LOBYTE(recordIDNeedingFetch) = -[CKRecordID isEqual:](recordIDNeedingFetch, "isEqual:", self->_recordID) ^ 1;
  return (char)recordIDNeedingFetch;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = "Y";
  if (!self->_record)
    v5 = "N";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ id:%@ hr:%s xattr:%@ rtf:%@ bs:%@ type:%ld>"), v4, self->_recordID, v5, self->_xattrSignature, self->_recordIDNeedingFetch, self->_recordIDBlockingSave, self->_recordType);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecord)record
{
  return self->_record;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void)setXattrSignature:(id)a3
{
  objc_storeStrong((id *)&self->_xattrSignature, a3);
}

- (CKRecordID)recordIDNeedingFetch
{
  return self->_recordIDNeedingFetch;
}

- (void)setRecordIDNeedingFetch:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDNeedingFetch, a3);
}

- (CKRecordID)recordIDBlockingSave
{
  return self->_recordIDBlockingSave;
}

- (void)setRecordIDBlockingSave:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDBlockingSave, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDBlockingSave, 0);
  objc_storeStrong((id *)&self->_recordIDNeedingFetch, 0);
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

- (void)initWithRecordIDNeedingFetch:(_QWORD *)a1 recordType:.cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] initWithRecordIDNeedingFetch: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)resolveRecordType
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: Unsuported record type %@%@", v1);
  OUTLINED_FUNCTION_2();
}

@end
