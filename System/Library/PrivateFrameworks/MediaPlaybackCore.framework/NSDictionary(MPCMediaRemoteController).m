@implementation NSDictionary(MPCMediaRemoteController)

- (void)commandInfoForCommand:()MPCMediaRemoteController
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allCommandInfos
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__NSDictionary_MPCMediaRemoteController__allCommandInfos__block_invoke;
  v5[3] = &unk_24CAB9880;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);

  return v3;
}

@end
