@implementation NSMutableDictionary(Utilities)

- (uint64_t)setObject:()Utilities forKey:objectIfNil:
{
  if (!a3)
    a3 = a5;
  return objc_msgSend(a1, "setObject:forKey:", a3);
}

- (void)copyToKey:()Utilities fromKey:inDictionary:objectIfNil:
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a3;
  objc_msgSend(a5, "objectForKey:", a4);
  v12 = objc_claimAutoreleasedReturnValue();
  v14 = (id)v12;
  if (v12)
    v13 = (id)v12;
  else
    v13 = v10;
  objc_msgSend(a1, "setObject:forKey:", v13, v11);

}

+ (id)dictionaryOfChangesBetween:()Utilities and:
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryOfChangesBetween:and:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithDictionary:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
