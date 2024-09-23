@implementation NSArray(JSON)

+ (id)arrayWithJSONString:()JSON
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEDCDF0], "objectWithJSONString:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "typecast:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
