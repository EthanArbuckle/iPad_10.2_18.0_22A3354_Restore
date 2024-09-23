@implementation NSDate(CDMJSONSerialization)

- (id)_cdm_safeJSONString
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZ"));
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  objc_msgSend(v2, "stringFromDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
