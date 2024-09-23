@implementation NSString(CUByteCodable)

- (const)encodedBytesAndReturnLength:()CUByteCodable error:
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v15;

  v6 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v13 = v6;
  if (v6)
  {
    *a3 = strlen(v6);
  }
  else if (a4)
  {
    NSErrorWithOSStatusF(4294960596, (uint64_t)"UTF-8 conversion failed", v7, v8, v9, v10, v11, v12, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (id)encodedDataAndReturnError:()CUByteCodable
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v14;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  if (v4)
  {
    v12 = v4;
  }
  else if (a3)
  {
    NSErrorWithOSStatusF(4294960596, (uint64_t)"UTF-8 conversion failed", v5, v6, v7, v8, v9, v10, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)createWithBytesNoCopy:()CUByteCodable length:error:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3, a4, 4, 1);
  v13 = v6;
  if (v6)
  {
    v14 = v6;
  }
  else if (a5)
  {
    NSErrorWithOSStatusF(4294960554, (uint64_t)"Bad UTF-8", v7, v8, v9, v10, v11, v12, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

@end
