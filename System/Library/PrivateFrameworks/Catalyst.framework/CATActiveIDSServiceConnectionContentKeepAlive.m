@implementation CATActiveIDSServiceConnectionContentKeepAlive

- (int64_t)contentType
{
  return 2;
}

- (NSDictionary)dictionaryValue
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

+ (id)instanceWithDictionary:(id)a3
{
  return (id)objc_opt_new();
}

@end
