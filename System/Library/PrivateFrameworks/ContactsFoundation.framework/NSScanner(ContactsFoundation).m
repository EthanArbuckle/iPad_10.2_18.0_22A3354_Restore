@implementation NSScanner(ContactsFoundation)

- (uint64_t)_cn_scanHexChar:()ContactsFoundation
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;

  if ((objc_msgSend(a1, "isAtEnd") & 1) != 0)
    return 0;
  v5 = objc_msgSend(a1, "scanLocation");
  objc_msgSend(a1, "scanString:intoString:", CFSTR("0x"), 0);
  if (objc_msgSend(a1, "isAtEnd"))
  {
    objc_msgSend(a1, "setScanLocation:", v5);
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "characterAtIndex:", objc_msgSend(a1, "scanLocation"));

  v6 = objc_msgSend(v7, "characterIsMember:", v9);
  if ((_DWORD)v6)
  {
    v10 = (void *)objc_opt_new();
    if (objc_msgSend(v7, "characterIsMember:", v9))
    {
      do
      {
        if ((unint64_t)objc_msgSend(v10, "length") > 1)
          break;
        objc_msgSend(v10, "appendFormat:", CFSTR("%c"), (unsigned __int16)v9);
        objc_msgSend(a1, "setScanLocation:", objc_msgSend(a1, "scanLocation") + 1);
        if ((objc_msgSend(a1, "isAtEnd") & 1) != 0)
          break;
        objc_msgSend(a1, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v11, "characterAtIndex:", objc_msgSend(a1, "scanLocation"));

      }
      while ((objc_msgSend(v7, "characterIsMember:", v9) & 1) != 0);
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v12, "scanHexInt:", &v14);
      *a3 = v14;

    }
  }

  return v6;
}

@end
