@implementation NSMapTable(FCAdditions)

- (id)fc_objectsForKeys:()FCAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__NSMapTable_FCAdditions__fc_objectsForKeys___block_invoke;
  v4[3] = &unk_1E463C7F0;
  v4[4] = a1;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fc_addObjectsFromMapTable:()FCAdditions
{
  NSMapTable *v4;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  v4 = a3;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, v4);
  value = 0;
  for (key = 0; NSNextMapEnumeratorPair(&enumerator, &key, &value); objc_msgSend(a1, "setObject:forKey:", value, key))
    ;
  NSEndMapTableEnumeration(&enumerator);

}

@end
