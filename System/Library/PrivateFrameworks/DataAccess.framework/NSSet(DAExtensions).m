@implementation NSSet(DAExtensions)

- (id)DACompactDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = 1;
    do
    {
      if ((v6 & 1) == 0)
        objc_msgSend(v2, "appendString:", CFSTR(", "));
      objc_msgSend(v5, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendString:", v7);

      objc_msgSend(v3, "nextObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = 0;
      v5 = (void *)v8;
    }
    while (v8);
  }
  objc_msgSend(v2, "appendString:", CFSTR("]"));

  return v2;
}

@end
