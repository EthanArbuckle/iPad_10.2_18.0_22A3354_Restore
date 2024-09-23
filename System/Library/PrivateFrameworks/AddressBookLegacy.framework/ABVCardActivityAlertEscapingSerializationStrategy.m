@implementation ABVCardActivityAlertEscapingSerializationStrategy

+ (BOOL)strategyWouldAlterString:(id)a3
{
  return objc_msgSend(a3, "rangeOfCharacterFromSet:", objc_msgSend(a1, "charactersToTriggerStrategy")) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)charactersToTriggerStrategy
{
  if (charactersToTriggerStrategy_onceToken != -1)
    dispatch_once(&charactersToTriggerStrategy_onceToken, &__block_literal_global_64);
  return (id)charactersToTriggerStrategy_sCharSet;
}

id __80__ABVCardActivityAlertEscapingSerializationStrategy_charactersToTriggerStrategy__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("=,\\\"));
  charactersToTriggerStrategy_sCharSet = (uint64_t)result;
  return result;
}

+ (id)serializeString:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "regex"), "stringByReplacingMatchesInString:options:range:withTemplate:", a3, 0, 0, objc_msgSend(a3, "length"), CFSTR("\\\\$1"));
}

+ (id)regex
{
  if (regex_onceToken_69 != -1)
    dispatch_once(&regex_onceToken_69, &__block_literal_global_70);
  return (id)regex_sRegEx_68;
}

uint64_t __58__ABVCardActivityAlertEscapingSerializationStrategy_regex__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("([=,\\\\\"])"), 0, 0);
  regex_sRegEx_68 = result;
  return result;
}

@end
