@implementation NSString(HMUAdditions)

- (BOOL)hmu_isPhoneNumber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(MEMORY[0x24BDD1690], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("+()-"));
  objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v4);

  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", &stru_24D219F70);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length") == 0;
  return v7;
}

- (uint64_t)hmu_isEmail
{
  if (hmu_isEmail_onceToken != -1)
    dispatch_once(&hmu_isEmail_onceToken, &__block_literal_global);
  return objc_msgSend((id)hmu_isEmail_emailPredicate, "evaluateWithObject:", a1);
}

@end
