@implementation NSDictionary(Foundation_Extensions)

- (id)muDeepMutableCopy
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__NSDictionary_Foundation_Extensions__muDeepMutableCopy__block_invoke;
  v5[3] = &unk_24E5D4810;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);

  return v3;
}

@end
