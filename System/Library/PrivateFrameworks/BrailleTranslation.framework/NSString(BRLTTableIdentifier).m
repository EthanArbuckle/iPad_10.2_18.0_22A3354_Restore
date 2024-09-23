@implementation NSString(BRLTTableIdentifier)

- (id)brl_serviceIdentifier
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "_brl_rangeOfLastDot");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)brl_language
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v2, 4);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "substringFromIndex:", v3 + 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)brl_variant
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v2, 4);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "substringFromIndex:", v3 + 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)brl_languageAndVariant
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v2, 4);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringFromIndex:", v3 + 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)brl_tableIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(a1, "_brl_rangeOfLastDot");
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

- (uint64_t)_brl_rangeOfLastDot
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v2, 4);

  return v3;
}

@end
