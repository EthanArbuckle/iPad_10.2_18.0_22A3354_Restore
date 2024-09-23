@implementation NSURL(ParsecExtras)

+ (uint64_t)parsec_hostAndPortRangeFromURLString:()ParsecExtras
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("://"), 2);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v4;
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invertedSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v10, 2, 0, v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = objc_msgSend(v3, "length");
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/?#"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v7 + v8;
      v14 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v12, 2, v13, v11 - v13);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        v15 = v11;
      else
        v15 = v14;
      v16 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("@"), 2, v13, v15 - v13);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        v6 = v13;
      else
        v6 = v16 + v17;

    }
  }

  return v6;
}

@end
