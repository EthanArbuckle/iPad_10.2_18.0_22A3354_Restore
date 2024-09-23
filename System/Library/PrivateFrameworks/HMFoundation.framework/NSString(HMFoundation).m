@implementation NSString(HMFoundation)

- (BOOL)hmf_isInteger
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("+-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v10) == 0x7FFFFFFFFFFFFFFFLL;
  return v11;
}

- (id)hmf_stringWithSmallestEncoding
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "cStringUsingEncoding:", 1);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(v1, "smallestEncoding");
    v7 = objc_retainAutorelease(v1);
    v8 = objc_msgSend(v7, "cStringUsingEncoding:", v6);
    if (!v8)
    {
      v9 = v7;
      return v9;
    }
    v3 = v8;
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v6;
  }
  objc_msgSend(v4, "stringWithCString:encoding:", v3, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  return v9;
}

@end
