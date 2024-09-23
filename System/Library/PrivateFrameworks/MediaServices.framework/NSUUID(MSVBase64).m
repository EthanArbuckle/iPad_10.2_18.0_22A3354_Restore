@implementation NSUUID(MSVBase64)

+ (id)msv_UUIDWithData:()MSVBase64
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length") == 16)
    v5 = (void *)objc_msgSend([a1 alloc], "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v4), "bytes"));
  else
    v5 = 0;

  return v5;
}

- (id)msv_UUIDData
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)initWithMSVBase64UUIDString:()MSVBase64
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0C99D50];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("=="));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithBase64EncodedString:options:", v7, 0);
  if (objc_msgSend(v8, "length") == 16)
  {
    a1 = (id)objc_msgSend(a1, "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v8), "bytes"));
    v9 = a1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)MSVBase64UUIDString
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "msv_UUIDData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringToIndex:", 22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CFUUIDRef)msv_copyCFUUID
{
  CFUUIDBytes v2;

  *(_QWORD *)&v2.byte0 = 0;
  *(_QWORD *)&v2.byte8 = 0;
  objc_msgSend(a1, "getUUIDBytes:", &v2);
  return CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2);
}

+ (id)uuidWithMSVBase64UUID:()MSVBase64
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMSVBase64UUIDString:", v3);

  return v4;
}

+ (id)msv_uuidWithCFUUID:()MSVBase64
{
  CFUUIDBytes v4;

  v4 = CFUUIDGetUUIDBytes(uuid);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v4);
}

@end
