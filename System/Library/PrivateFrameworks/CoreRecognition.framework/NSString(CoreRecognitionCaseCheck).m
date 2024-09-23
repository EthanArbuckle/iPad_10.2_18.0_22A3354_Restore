@implementation NSString(CoreRecognitionCaseCheck)

- (uint64_t)isLowercase
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqualToString:", v2);

  return v3;
}

- (uint64_t)isUppercase
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "uppercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqualToString:", v2);

  return v3;
}

- (uint64_t)isCaseApplicable
{
  if (objc_msgSend(a1, "isUppercase"))
    return objc_msgSend(a1, "isLowercase") ^ 1;
  else
    return 1;
}

@end
