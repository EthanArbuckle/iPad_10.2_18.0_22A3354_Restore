@implementation HDCloudSyncDataUploadRequestRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 0;
}

+ (id)recordType
{
  return CFSTR("CloudSyncDataUploadRequestRecord");
}

+ (id)recordIDWithZoneID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C95070];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRecordName:zoneID:", CFSTR("CloudSyncDataUploadRequest"), v4);

  return v5;
}

+ (BOOL)isDataUploadRequestRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncDataUploadRequestRecord"));

  return v4;
}

+ (id)recordForZoneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncDataUploadRequestRecord"), v5);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCKRecord:schemaVersion:", v6, 1);

  return v7;
}

+ (HDCloudSyncDataUploadRequestRecord)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v7 = a3;
  objc_msgSend(v7, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("CloudSyncDataUploadRequestRecord"));

  if ((v9 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = objc_opt_class();
    objc_msgSend(v7, "recordType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v13, a2, CFSTR("record has type (%@), but expected (%@)"), v10, CFSTR("CloudSyncDataUploadRequestRecord"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    goto LABEL_9;
  }
  objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("Version"), objc_opt_class(), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCKRecord:schemaVersion:", v7, objc_msgSend(v10, "integerValue"));
LABEL_10:

  return (HDCloudSyncDataUploadRequestRecord *)v11;
}

- (id)serializeUnderlyingMessage
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncRecord record](self, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DataUploadRequest %@\nLast Modified Date: %@\nSchema Version: %@\n"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)printDescription
{
  return &stru_1E6D11BB8;
}

@end
