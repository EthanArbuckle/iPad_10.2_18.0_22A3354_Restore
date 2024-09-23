@implementation NSSet(MutableDeepCopy)

- (id)mutableDeepCopy
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(a1, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = (void *)objc_msgSend(v5, "mutableDeepCopy");

      objc_msgSend(v2, "addObject:", v6);
      objc_msgSend(v3, "nextObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v5);
  }

  return v2;
}

@end
