@implementation NSData(ManagedConfiguration)

+ (id)MCDataFromFile:()ManagedConfiguration
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = v3;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Could not read data from path %{public}@: %{public}@", buf, 0x16u);
    }
    if (MCIsDaemonProcess)
    {
      if (objc_msgSend(v5, "code") == 257)
      {
        objc_msgSend(v5, "domain");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

        if (v8)
          MCLogUnexpectedFileAccessError(v3, v5);
      }
    }
  }

  return v4;
}

- (id)MCHexString
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
      *v5 = MCHexString_digits[(unint64_t)v6 >> 4];
      v4 = v5 + 2;
      v5[1] = MCHexString_digits[v6 & 0xF];
      v5 += 2;
      --v2;
    }
    while (v2);
  }
  *v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)MCDataWithHexString:()ManagedConfiguration
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  char v10;
  char v11;
  char v12;
  char v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  v14 = 0;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = objc_msgSend(v3, "characterAtIndex:", v7);
      v10 = v9 - 48;
      if ((v9 - 65) <= 5)
        v11 = v9 - 55;
      else
        v11 = 0;
      if ((v9 - 97) <= 5)
        v12 = v9 - 87;
      else
        v12 = v11;
      if ((unsigned __int16)(v9 - 48) > 9u)
        v10 = v12;
      if ((v8 & 1) != 0)
      {
        v14 = 16 * v10;
      }
      else
      {
        v14 |= v10;
        objc_msgSend(v4, "appendBytes:length:", &v14, 1);
      }
      v8 ^= 1u;
      ++v7;
    }
    while (v6 != v7);
  }

  return v4;
}

+ (uint64_t)MCDataWithCFData:()ManagedConfiguration
{
  void *v4;
  const UInt8 *BytePtr;

  v4 = (void *)MEMORY[0x1E0C99D50];
  BytePtr = CFDataGetBytePtr(theData);
  return objc_msgSend(v4, "dataWithBytes:length:", BytePtr, CFDataGetLength(theData));
}

- (id)MCSHA256Hash
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

@end
