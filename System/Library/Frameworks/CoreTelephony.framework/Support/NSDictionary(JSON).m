@implementation NSDictionary(JSON)

+ (id)dictionaryWithJSONString:()JSON
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEDCDF0], "objectWithJSONString:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "typecast:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
