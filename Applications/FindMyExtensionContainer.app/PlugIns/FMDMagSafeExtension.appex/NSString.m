@implementation NSString

+ (NSString)stringWithFourCC:(unsigned int)a3
{
  _BYTE v4[2];
  __int16 v5;
  char v6;

  v5 = bswap32(a3) >> 16;
  v4[1] = BYTE2(a3);
  v4[0] = HIBYTE(a3);
  v6 = 0;
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v4, 4));
}

+ (id)sanitizedHexString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("01234567890ABCDEFabcdef")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "invertedSet"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", &stru_100025AC8));

  return v7;
}

@end
