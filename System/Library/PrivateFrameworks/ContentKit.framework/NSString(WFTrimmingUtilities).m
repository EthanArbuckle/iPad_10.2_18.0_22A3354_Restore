@implementation NSString(WFTrimmingUtilities)

- (__CFString)wf_stringByTrimmingLeadingCharactersInSet:()WFTrimmingUtilities
{
  void *v4;
  uint64_t v5;
  __CFString *v6;

  objc_msgSend(a3, "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v4);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = &stru_24C4E3948;
  }
  else
  {
    objc_msgSend(a1, "substringFromIndex:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (__CFString)wf_stringByTrimmingTrailingCharactersInSet:()WFTrimmingUtilities
{
  void *v4;
  uint64_t v5;
  __CFString *v6;

  objc_msgSend(a3, "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v4, 4);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = &stru_24C4E3948;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", v5 + 1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)wf_stringByTrimmingLeadingWhitespaceAndNewlineCharacters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wf_stringByTrimmingLeadingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wf_stringByTrimmingTrailingWhitespaceAndNewlineCharacters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wf_stringByTrimmingTrailingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wf_stringContainsCharacterInSet:()WFTrimmingUtilities
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)wf_stringByReplacingCharactersInSet:()WFTrimmingUtilities withString:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_objectsPassingTest:", &__block_literal_global_11392);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)wf_stringContainsNewlineCharacters
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "wf_stringContainsCharacterInSet:", v2);

  return v3;
}

- (id)wf_stringByReplacingNewlinesWithSpaces
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wf_stringByReplacingCharactersInSet:withString:", v2, CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
