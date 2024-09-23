@implementation NSValue(ML3NameOrderAdditions)

- (uint64_t)ML3NameOrderValue
{
  id v1;
  _QWORD v3[2];

  v1 = objc_retainAutorelease(a1);
  if (strcmp((const char *)objc_msgSend(v1, "objCType"), "{?=qq}"))
    return 0;
  v3[0] = 0;
  v3[1] = 0;
  objc_msgSend(v1, "getValue:", v3);
  return v3[0];
}

+ (id)valueWithML3NameOrder:()ML3NameOrderAdditions
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBytes:objCType:", v5, "{?=qq}");
}

@end
