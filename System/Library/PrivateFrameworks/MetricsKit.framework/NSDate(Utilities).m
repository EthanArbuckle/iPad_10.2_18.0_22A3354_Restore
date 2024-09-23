@implementation NSDate(Utilities)

+ (uint64_t)mt_longMillisecondsSince1970
{
  void *v0;
  void *v1;
  double v2;
  uint64_t v3;

  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSince1970");
  v3 = (uint64_t)(v2 * 1000.0);

  return v3;
}

+ (uint64_t)mt_millisecondsSince1970
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a1, "mt_longMillisecondsSince1970"));
}

- (uint64_t)mt_millisecondsSince1970
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a1, "mt_longMillisecondsSince1970"));
}

- (uint64_t)mt_longMillisecondsSince1970
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return (uint64_t)(v1 * 1000.0);
}

@end
