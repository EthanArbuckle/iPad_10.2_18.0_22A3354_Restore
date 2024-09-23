@implementation NSUUID(HMB)

- (id)data
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hmbEncodeQueryableParameter:()HMB
{
  return objc_msgSend(a3, "data");
}

+ (id)hmbDecodeQueryableParameter:()HMB
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "hmbUUIDFromData:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = v0;

  return v1;
}

+ (id)hmbDescriptionForEncodedQueryableVariable:()HMB
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 16)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hmbUUIDFromData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "UUIDString");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "hmbDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringWithFormat:", CFSTR("<MALFORMED UUID: %@>"), v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hmbUUIDFromData:()HMB
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "length") == 16)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v4), "bytes"));
    else
      v5 = 0;

    return v5;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return (id)+[NSString(HMB) hmbEncodeQueryableParameter:](v7);
  }
}

@end
