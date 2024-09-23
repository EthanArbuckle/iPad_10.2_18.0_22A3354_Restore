@implementation NSCharacterSet

void __77__NSCharacterSet_ECMessageBodyParser__ec_whitespaceNewlineAndTagCharacterSet__block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"), "mutableCopy");
  objc_msgSend(v0, "addCharactersInString:", CFSTR("\uE0020"));
  ec_whitespaceNewlineAndTagCharacterSet_result = objc_msgSend(v0, "copy");

}

void __63__NSCharacterSet_ECMessageBodyParser__ec_zeroWidthCharacterSet__block_invoke()
{
  id v0;

  v0 = (id)objc_opt_new();
  objc_msgSend(v0, "addCharactersInString:", CFSTR("​"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR("‌"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR("‍"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR("⁠"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR("⁣"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR("﻿"));
  ec_zeroWidthCharacterSet_result = objc_msgSend(v0, "copy");

}

void __63__NSCharacterSet_ECMessageBodyParser__ec_ignorableCharacterSet__block_invoke()
{
  id v0;

  v0 = (id)objc_opt_new();
  objc_msgSend(v0, "addCharactersInString:", CFSTR("͏"));
  ec_ignorableCharacterSet_result = objc_msgSend(v0, "copy");

}

void __63__NSCharacterSet_SubjectParser__ec_prefixDelimiterCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":："));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ec_prefixDelimiterCharacterSet_prefixDelimiterCharacterSet;
  ec_prefixDelimiterCharacterSet_prefixDelimiterCharacterSet = v0;

}

@end
