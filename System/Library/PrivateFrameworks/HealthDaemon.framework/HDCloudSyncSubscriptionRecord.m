@implementation HDCloudSyncSubscriptionRecord

+ (id)recordIDsWithZoneID:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[HDCloudSyncDataUploadRequestRecord recordIDWithZoneID:](HDCloudSyncDataUploadRequestRecord, "recordIDWithZoneID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isSubscriptionRecord:(id)a3
{
  return +[HDCloudSyncDataUploadRequestRecord isDataUploadRequestRecord:](HDCloudSyncDataUploadRequestRecord, "isDataUploadRequestRecord:", a3);
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a3;
  if (+[HDCloudSyncDataUploadRequestRecord isDataUploadRequestRecord:](HDCloudSyncDataUploadRequestRecord, "isDataUploadRequestRecord:", v6))
  {
    +[HDCloudSyncDataUploadRequestRecord recordWithCKRecord:error:](HDCloudSyncDataUploadRequestRecord, "recordWithCKRecord:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = objc_opt_class();
    objc_msgSend(v6, "recordType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v9, a2, CFSTR("Unexpected record of type (%@)"), v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    v7 = 0;
  }

  return v7;
}

+ (BOOL)hasFutureSchema:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 && objc_msgSend(v3, "integerValue") > 1;

  return v5;
}

+ (id)recordIDWithZoneID:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)recordForZoneID:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Subscription %@\nLast Modified Date: %@\nSchema Version: %@\n"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)printDescription
{
  return &stru_1E6D11BB8;
}

@end
