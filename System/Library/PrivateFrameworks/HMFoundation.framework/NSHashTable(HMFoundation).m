@implementation NSHashTable(HMFoundation)

- (void)hmf_enumerateWithAutoreleasePoolUsingBlock:()HMFoundation
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC355C]();
  v10 = 0;
  objc_msgSend(a1, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  while (1)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x1A1AC355C]();
    objc_msgSend(v6, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    v4[2](v4, v7, &v10);
    objc_autoreleasePoolPop(v9);
    if (v10)
      goto LABEL_6;
  }
  objc_autoreleasePoolPop(v9);
LABEL_6:

  objc_autoreleasePoolPop(v5);
}

@end
