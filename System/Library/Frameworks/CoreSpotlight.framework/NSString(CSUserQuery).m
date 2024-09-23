@implementation NSString(CSUserQuery)

- (id)normalizeForSemanticSearch
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = normalizeForSemanticSearch_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&normalizeForSemanticSearch_onceToken, &__block_literal_global_26);
  objc_msgSend((id)normalizeForSemanticSearch_sRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)isAllNumbersOrSpaces
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("^[0-9.\\s]+$"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "evaluateWithObject:", a1);

  return v3;
}

- (BOOL)containsCJK
{
  if (containsCJK_onceToken != -1)
    dispatch_once(&containsCJK_onceToken, &__block_literal_global_45);
  return objc_msgSend((id)containsCJK_sRegex, "numberOfMatchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0;
}

@end
