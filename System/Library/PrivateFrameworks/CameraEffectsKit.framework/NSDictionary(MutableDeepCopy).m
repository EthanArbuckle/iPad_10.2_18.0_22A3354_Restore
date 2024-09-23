@implementation NSDictionary(MutableDeepCopy)

- (id)mutableDeepCopy
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(a1, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableDeepCopy");

      objc_msgSend(v2, "setObject:forKey:", v7, v5);
      objc_msgSend(v3, "nextObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
    while (v8);
  }

  return v2;
}

@end
