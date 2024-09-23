@implementation NSMapTable(MPCMediaRemoteController)

- (void)commandInfoForCommand:()MPCMediaRemoteController
{
  return NSMapGet(a1, (const void *)(a3 | 0x80000000));
}

- (id)allCommandInfos
{
  void *v2;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMapTable count](a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, a1);
  value = 0;
  for (key = 0;
        NSNextMapEnumeratorPair(&enumerator, &key, &value);
  NSEndMapTableEnumeration(&enumerator);
  return v2;
}

@end
