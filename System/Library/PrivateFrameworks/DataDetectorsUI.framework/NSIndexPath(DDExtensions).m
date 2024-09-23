@implementation NSIndexPath(DDExtensions)

- (__CFString)dd_stringValue
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  _BYTE v13[33];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  switch(v2)
  {
    case 0:
      return &stru_1E4259460;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu/%lu"), objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return (__CFString *)v7;
    case 1:
      v3 = objc_msgSend(a1, "indexAtPosition:", 0);
      v4 = 0;
      v13[32] = 0;
      do
      {
        v13[v4 + 31] = v3 % 0xA + 48;
        v5 = v4 - 1;
        if (v3 < 0xA)
          break;
        v3 /= 0xAuLL;
      }
      while (v4-- != -31);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", &v13[v5 + 32], 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return (__CFString *)v7;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(a1, "indexAtPosition:", v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      ++v10;
    }
    while (v10 < objc_msgSend(a1, "length"));
  }
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("/"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v12;
}

@end
