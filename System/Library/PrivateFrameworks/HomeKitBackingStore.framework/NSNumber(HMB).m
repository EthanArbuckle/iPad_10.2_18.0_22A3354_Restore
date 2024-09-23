@implementation NSNumber(HMB)

+ (id)hmbEncodeQueryableParameter:()HMB
{
  id v3;
  void *v4;
  unint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "integerValue") < 0)
  {

    v3 = &unk_1E89477A8;
  }
  v6 = bswap64(objc_msgSend(v3, "unsignedIntegerValue"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v6, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hmbDecodeQueryableParameter:()HMB
{
  id v3;
  unint64_t *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 8)
  {
    v4 = (unint64_t *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", bswap64(*v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)hmbDescriptionForEncodedQueryableVariable:()HMB
{
  id v3;
  id v4;
  unint64_t *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 8)
  {
    v4 = objc_retainAutorelease(v3);
    v5 = (unint64_t *)objc_msgSend(v4, "bytes");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", bswap64(*v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "hmbDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringWithFormat:", CFSTR("<MALFORMED NUMBER: %@>"), v6);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
