@implementation NSUUID(HMFoundation)

+ (id)hmf_zeroUUID
{
  if (qword_1ED0131F8 != -1)
    dispatch_once(&qword_1ED0131F8, &__block_literal_global_38);
  return (id)_MergedGlobals_70;
}

- (id)shortDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringToIndex:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hmf_isEqualToUUID:()HMFoundation
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = v4;
  if (a1 == v4)
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = objc_msgSend(a1, "isEqual:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)hmf_UUIDWithBytesAsData:()HMFoundation
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 16)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v3), "bytes"));
  else
    v4 = 0;

  return v4;
}

- (id)hmf_bytesAsData
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hmf_isEqualToUUIDString:()HMFoundation
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  if (v6)
    v7 = objc_msgSend(a1, "hmf_isEqualToUUID:", v6);
  else
    v7 = 0;

  return v7;
}

+ (NSString)shortDescription
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end
