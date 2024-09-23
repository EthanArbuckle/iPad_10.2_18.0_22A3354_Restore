@implementation NSError(MetricKit)

+ (id)_defaultDescriptionForMXErrorCode:()MetricKit
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 > 5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", off_24DDCFD40[a3], &stru_24DDD0C20, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)errorWithMXErrorCode:()MetricKit
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = [a1 alloc];
  v10 = *MEMORY[0x24BDD0FC8];
  -[objc_class _defaultDescriptionForMXErrorCode:](a1, "_defaultDescriptionForMXErrorCode:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("MXErrorDomain"), a3, v7);

  return v8;
}

@end
