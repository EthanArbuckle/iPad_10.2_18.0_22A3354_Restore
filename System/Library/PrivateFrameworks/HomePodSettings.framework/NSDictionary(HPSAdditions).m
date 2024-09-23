@implementation NSDictionary(HPSAdditions)

- (id)hps_dictionarySwappingKeysWithValues
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__NSDictionary_HPSAdditions__hps_dictionarySwappingKeysWithValues__block_invoke;
  v6[3] = &unk_24F9AF400;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
