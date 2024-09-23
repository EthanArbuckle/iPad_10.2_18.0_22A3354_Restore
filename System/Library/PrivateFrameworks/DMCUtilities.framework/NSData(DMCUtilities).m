@implementation NSData(DMCUtilities)

- (id)DMCHexString
{
  uint64_t v2;
  unsigned __int8 *v3;
  _BYTE *v4;
  char *v5;
  unsigned int v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  v3 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v4 = (char *)v8 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
  if (v2)
  {
    v5 = (char *)v8 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
    do
    {
      v6 = *v3++;
      *v5 = DMCHexString_digits[(unint64_t)v6 >> 4];
      v4 = v5 + 2;
      v5[1] = DMCHexString_digits[v6 & 0xF];
      v5 += 2;
      --v2;
    }
    while (v2);
  }
  *v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)DMCSHA256Hash
{
  id v1;
  unsigned __int8 md[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)DMCAtomicWriteToPath:()DMCUtilities error:
{
  id v6;
  void *v7;
  int v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v28;
  void *v29;
  char v30;
  NSObject *v31;
  id v33;
  id v34;
  id v35;
  unsigned __int8 v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, &v36);
  v9 = v36;

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "substringToIndex:", 8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR(".temp-%@-%@"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    LOBYTE(v15) = objc_msgSend(a1, "writeToURL:options:error:", v19, 0, &v35);
    v20 = v35;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v20;
      v22 = objc_msgSend(v21, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v11, v19, 0, 1, 0, &v34);
      v23 = v34;

      v24 = *DMCLogObjects();
      if ((v22 & 1) != 0)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v38 = v11;
          _os_log_impl(&dword_1A4951000, v24, OS_LOG_TYPE_DEBUG, "Wrote file atomically in-place: %{public}@", buf, 0xCu);
        }
        v25 = 1;
        v20 = v23;
        goto LABEL_28;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v23;
        _os_log_impl(&dword_1A4951000, v24, OS_LOG_TYPE_ERROR, "Failed to replace original file: %{public}@", buf, 0xCu);
      }
      if (a4)
        *a4 = objc_retainAutorelease(v23);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v23;
      v30 = objc_msgSend(v29, "removeItemAtURL:error:", v19, &v33);
      v20 = v33;

      if ((v30 & 1) == 0)
      {
        v31 = *DMCLogObjects();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v38 = v20;
          _os_log_impl(&dword_1A4951000, v31, OS_LOG_TYPE_ERROR, "Failed to remove temporary file: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      v28 = *DMCLogObjects();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v20;
        _os_log_impl(&dword_1A4951000, v28, OS_LOG_TYPE_ERROR, "Failed to write temporary file: %{public}@", buf, 0xCu);
      }
      if (a4)
      {
        v20 = objc_retainAutorelease(v20);
        v25 = 0;
        *a4 = v20;
LABEL_28:

        goto LABEL_29;
      }
    }
    v25 = 0;
    goto LABEL_28;
  }
  v26 = *DMCLogObjects();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v6;
    _os_log_impl(&dword_1A4951000, v26, OS_LOG_TYPE_ERROR, "Failed to write temporary file since a directory is present: %{public}@", buf, 0xCu);
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "_DMCCreateFolderExistError");
    v25 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_29:

  return v25;
}

- (uint64_t)DMCAtomicWriteToURL:()DMCUtilities error:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "DMCAtomicWriteToPath:error:", v6, a4);

  return v7;
}

+ (uint64_t)DMCDataWithCFData:()DMCUtilities
{
  void *v4;
  const UInt8 *BytePtr;

  v4 = (void *)MEMORY[0x1E0C99D50];
  BytePtr = CFDataGetBytePtr(theData);
  return objc_msgSend(v4, "dataWithBytes:length:", BytePtr, CFDataGetLength(theData));
}

+ (id)_DMCCreateFolderExistError
{
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  DMCErrorArray(CFSTR("ERROR_DIRECTORY_EXIST_AT_DESTINATION"), a2, a3, a4, a5, a6, a7, a8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCInternalErrorDomain"), 5, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
