@implementation NSString(CRKAdditions)

- (id)crk_stringBySanitizingFileName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/\\?%*|\"<>:,&"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", &stru_24D9CB490);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", &stru_24D9CB490);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)crk_stringWithIPAddress:()CRKAdditions
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", inet_ntoa(a3));
}

- (id)crk_sha1Hash
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "crk_sha1Hash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)crk_stringByRemovingPrefix:()CRKAdditions
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "hasPrefix:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(a1, "copy");
  }
  v6 = (void *)v5;

  return v6;
}

- (id)crk_stringByRemovingSuffix:()CRKAdditions
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "hasSuffix:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(a1, "copy");
  }
  v6 = (void *)v5;

  return v6;
}

- (uint64_t)crk_isFourDigitPasscode
{
  unint64_t v2;
  unsigned int v3;
  _BOOL8 v4;

  if (objc_msgSend(a1, "length") != 4)
    return 0;
  if (!objc_msgSend(a1, "length"))
    return 1;
  v2 = 0;
  do
  {
    v3 = (objc_msgSend(a1, "characterAtIndex:", v2) << 24) - 788529153;
    v4 = v3 < 0xAFFFFFF;
    if (v3 >= 0xAFFFFFF)
      break;
    ++v2;
  }
  while (v2 < objc_msgSend(a1, "length"));
  return v4;
}

- (id)crk_substringAfterString:()CRKAdditions
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(a1, "rangeOfString:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "substringFromIndex:", v2 + v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)crk_hasCaseInsensitivePrefix:()CRKAdditions
{
  id v4;
  unint64_t v5;
  _BOOL8 v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "length")
    && (v5 = objc_msgSend(a1, "length"), v5 >= objc_msgSend(v4, "length"))
    && objc_msgSend(a1, "rangeOfString:options:range:", v4, 1, 0, objc_msgSend(v4, "length")) == 0;

  return v6;
}

@end
