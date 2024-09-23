@implementation NSFileManager(Size)

- (uint64_t)mk_fileSizeAtPath:()Size
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(a1, "attributesOfItemAtPath:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0;
  if (!v8)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD0D08]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "unsignedLongLongValue");

  }
  return v5;
}

@end
