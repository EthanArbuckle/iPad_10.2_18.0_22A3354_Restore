@implementation NSString(NNMKAdditions)

- (id)nnmk_base64String
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)nnmk_sanitizedFileNameString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/\\?%*|\"<>:"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)isString:()NNMKAdditions equalToNullableString:
{
  if (a3)
    return objc_msgSend(a3, "isEqualToString:", a4);
  else
    return a4 == 0;
}

@end
