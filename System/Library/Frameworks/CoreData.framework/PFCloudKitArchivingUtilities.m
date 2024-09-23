@implementation PFCloudKitArchivingUtilities

- (id)newArchivedDataForSystemFieldsOfRecord:(uint64_t)a1
{
  void *v3;
  id v4;

  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(a2, "encodeSystemFieldsWithCoder:", v3);
  v4 = (id)objc_msgSend(v3, "encodedData");
  objc_msgSend(v3, "finishEncoding");

  return v4;
}

- (id)encodeRecord:(_QWORD *)a3 error:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v20 = 0;
  v5 = (void *)MEMORY[0x18D76B4E4]();
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, &v20);
  if (!v6 || (v7 = (id)objc_msgSend(v6, "compressedDataUsingAlgorithm:error:", 0, &v20)) == 0)
  {
    v9 = v20;
    objc_autoreleasePoolPop(v5);
    v10 = v20;
    if (v10)
    {
      if (a3)
      {
        v8 = 0;
        *a3 = v10;
        goto LABEL_11;
      }
    }
    else
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m");
      v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m";
        v23 = 1024;
        v24 = 55;
        _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v8 = 0;
    goto LABEL_11;
  }
  v8 = v7;
  objc_autoreleasePoolPop(v5);
LABEL_11:

  return v8;
}

- (id)recordFromEncodedData:(_QWORD *)a3 error:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v22 = 0;
  v5 = (void *)MEMORY[0x18D76B4E4]();
  v6 = objc_msgSend(a2, "decompressedDataUsingAlgorithm:error:", 0, &v22);
  if (!v6
    || (v7 = v6,
        v8 = (void *)MEMORY[0x1E0CB3710],
        getCloudKitCKRecordClass[0](),
        (v9 = (id)objc_msgSend(v8, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v22)) == 0))
  {
    v11 = v22;
    objc_autoreleasePoolPop(v5);
    v12 = v22;
    if (v12)
    {
      if (a3)
      {
        v10 = 0;
        *a3 = v12;
        goto LABEL_11;
      }
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m";
        v25 = 1024;
        v26 = 81;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v10 = 0;
    goto LABEL_11;
  }
  v10 = v9;
  objc_autoreleasePoolPop(v5);
LABEL_11:

  return v10;
}

- (void)shareFromEncodedData:(char *)a3 inZoneWithID:(_QWORD *)a4 error:
{
  void *v4;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = a2;
  v37 = 0;
  if (a2)
  {
    v8 = (void *)MEMORY[0x18D76B4E4]();
    v9 = objc_msgSend(v4, "decompressedDataUsingAlgorithm:error:", 0, &v37);
    if (!v9
      || (v10 = v9,
          v11 = (void *)MEMORY[0x1E0CB3710],
          v12 = (void *)MEMORY[0x1E0C99E60],
          getCloudKitCKShareClass[0](),
          (v13 = (id)objc_msgSend(v11, "_strictlyUnarchivedObjectOfClasses:fromData:error:", objc_msgSend(v12, "setWithObject:", objc_opt_class()), v10, &v37)) == 0))
    {
      v25 = v37;
      objc_autoreleasePoolPop(v8);
      v24 = v37;
      goto LABEL_10;
    }
    v4 = v13;
    objc_autoreleasePoolPop(v8);
    if ((objc_msgSend(a3, "isEqual:", objc_msgSend((id)objc_msgSend(v4, "recordID"), "zoneID")) & 1) == 0)
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Decoded share zoneID doesn't match row: %@\n%@\n%@");
      objc_msgSend(v4, "recordID");
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)a3);
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        v36 = objc_msgSend(v4, "recordID");
        *(_DWORD *)buf = 138412802;
        v41 = a3;
        v42 = 2112;
        v43 = v36;
        v44 = 2112;
        v45 = a1;
        _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Decoded share zoneID doesn't match row: %@\n%@\n%@", buf, 0x20u);
      }

      v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v23 = *MEMORY[0x1E0CB28A8];
      v38 = *MEMORY[0x1E0CB2D68];
      v39 = CFSTR("A fatal error has occured trying to decode sharing metadata, please file a bug with a sysdiagnose and attach the application store files if possible.");
      v24 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      v37 = v24;
LABEL_10:
      v26 = v24;
      if (v26)
      {
        if (a4)
        {
          v4 = 0;
          *a4 = v26;
          goto LABEL_16;
        }
      }
      else
      {
        v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m");
        v34 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m";
          v42 = 1024;
          LODWORD(v43) = 130;
          _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      v4 = 0;
    }
  }
LABEL_16:

  return v4;
}

@end
