@implementation NSMutableString(CRTT)

- (void)cr_replaceStorageInRange:()CRTT withStorage:fromRange:
{
  id v10;

  objc_msgSend(a5, "substringWithRange:", a6, a7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replaceCharactersInRange:withString:", a3, a4);

}

- (void)cr_appendStorage:()CRTT fromRange:
{
  id v8;

  v8 = a3;
  objc_msgSend(a1, "cr_replaceStorageInRange:withStorage:fromRange:", objc_msgSend(a1, "length"), 0, v8, a4, a5);

}

- (id)cr_storageFromRange:()CRTT
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "substringWithRange:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  return v2;
}

- (id)cr_emptyCopy
{
  return objc_alloc_init(MEMORY[0x1E0CB37A0]);
}

@end
