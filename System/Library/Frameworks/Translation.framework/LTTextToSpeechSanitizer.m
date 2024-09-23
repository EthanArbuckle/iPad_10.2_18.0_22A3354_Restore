@implementation LTTextToSpeechSanitizer

void __46___LTTextToSpeechSanitizer__regularExpression__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([\\p{L}']*[*]+[\\p{L}']*)+"), 1, &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)_regularExpression_regularExpression;
  _regularExpression_regularExpression = v0;

  if (v1)
  {
    v3 = _LTOSLogTTS();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __46___LTTextToSpeechSanitizer__regularExpression__block_invoke_cold_1((uint64_t)v1, v3);
  }

}

void __46___LTTextToSpeechSanitizer__regularExpression__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_235438000, a2, OS_LOG_TYPE_FAULT, "Failed to create regular expression to find censored speech: %@", (uint8_t *)&v2, 0xCu);
}

@end
