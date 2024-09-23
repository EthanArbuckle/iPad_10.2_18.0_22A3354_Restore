@implementation NSDate(HMB)

+ (id)hmbEncodeQueryableParameter:()HMB
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmbEncodeQueryableParameter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)hmbDecodeQueryableParameter:()HMB
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "hmbDecodeQueryableParameter:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v1 = v0;
  else
    v1 = 0;
  v2 = v1;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "doubleValue");
  v5 = v4;

  return objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:", v5);
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

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)bswap64(*v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "hmbDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringWithFormat:", CFSTR("<MALFORMED INTERVAL: %@>"), v6);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
