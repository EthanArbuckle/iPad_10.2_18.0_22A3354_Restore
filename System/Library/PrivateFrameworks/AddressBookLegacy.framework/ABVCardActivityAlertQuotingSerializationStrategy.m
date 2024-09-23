@implementation ABVCardActivityAlertQuotingSerializationStrategy

+ (BOOL)strategyWouldAlterString:(id)a3
{
  return objc_msgSend(a3, "rangeOfString:", CFSTR(" ")) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)serializeString:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend((id)objc_msgSend(a1, "regex"), "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(a3, "length"), CFSTR("\\\\$1"));
  objc_msgSend(v5, "insertString:atIndex:", CFSTR("\"), 0);
  objc_msgSend(v5, "appendString:", CFSTR("\"));
  return v5;
}

+ (id)regex
{
  if (regex_onceToken != -1)
    dispatch_once(&regex_onceToken, &__block_literal_global_16);
  return (id)regex_sRegEx;
}

uint64_t __57__ABVCardActivityAlertQuotingSerializationStrategy_regex__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("([\"])"), 0, 0);
  regex_sRegEx = result;
  return result;
}

@end
