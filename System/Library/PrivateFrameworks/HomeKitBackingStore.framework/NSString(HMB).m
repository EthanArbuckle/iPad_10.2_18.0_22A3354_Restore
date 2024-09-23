@implementation NSString(HMB)

+ (uint64_t)hmbEncodeQueryableParameter:()HMB
{
  return objc_msgSend(a3, "dataUsingEncoding:", 2415919360);
}

+ (id)hmbDecodeQueryableParameter:()HMB
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 2415919360);

  return v5;
}

+ (__CFString)hmbDescriptionForEncodedQueryableVariable:()HMB
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", objc_msgSend(objc_retainAutorelease(v3), "bytes"), 2415919360);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("<NULL STRING>");
  }

  return v4;
}

@end
