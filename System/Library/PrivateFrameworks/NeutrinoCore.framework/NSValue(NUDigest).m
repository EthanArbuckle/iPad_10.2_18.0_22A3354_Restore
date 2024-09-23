@implementation NSValue(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  id v4;
  id v5;
  const char *v6;
  char *v7;
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x1E0C80C00];
  sizep[0] = 0;
  v4 = objc_retainAutorelease(a1);
  v5 = a3;
  v6 = (const char *)objc_msgSend(v4, "objCType");
  NSGetSizeAndAlignment(v6, sizep, 0);
  v7 = (char *)sizep - ((sizep[0] + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v4, "getValue:", v7);
  objc_msgSend(v5, "addCString:", v6);
  objc_msgSend(v5, "addCString:", ":");
  objc_msgSend(v5, "addBytes:length:", v7, sizep[0]);

}

@end
