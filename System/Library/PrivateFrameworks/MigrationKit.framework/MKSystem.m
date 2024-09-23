@implementation MKSystem

+ (id)version
{
  void *v2;
  void *v3;

  v2 = (void *)_CFCopySystemVersionDictionary();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
