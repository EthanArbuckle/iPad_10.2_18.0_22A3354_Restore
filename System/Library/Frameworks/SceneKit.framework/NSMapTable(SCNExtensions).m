@implementation NSMapTable(SCNExtensions)

- (void)scn_enumerateKeysAndValuesUsingBlock:()SCNExtensions
{
  char v4;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, a1);
  value = 0;
  key = 0;
  do
  {
    if (!NSNextMapEnumeratorPair(&enumerator, &key, &value))
      break;
    v4 = 0;
    (*(void (**)(uint64_t, void *, void *, char *))(a3 + 16))(a3, key, value, &v4);
  }
  while (!v4);
  NSEndMapTableEnumeration(&enumerator);
}

@end
