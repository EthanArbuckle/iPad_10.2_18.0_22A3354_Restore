@implementation NSString(Base64)

- (id)en_base64PaddedString
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;

  if ((objc_msgSend(a1, "length") & 3) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3508], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "mutableCopy");

    v5 = objc_msgSend(v4, "length") | 0xFFFFFFFFFFFFFFFCLL;
    do
      objc_msgSend(v4, "appendString:", CFSTR("="));
    while (!__CFADD__(v5++, 1));
  }
  else
  {
    v4 = a1;
  }
  return v4;
}

@end
