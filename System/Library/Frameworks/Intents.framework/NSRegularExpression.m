@implementation NSRegularExpression

void __81__NSRegularExpression_Intents___intents_sharedStringsDictFormatRegularExpression__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%#@([a-zA-Z0-9\\_]+)@"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_intents_sharedStringsDictFormatRegularExpression_regularExpression;
  _intents_sharedStringsDictFormatRegularExpression_regularExpression = v0;

}

void __73__NSRegularExpression_Intents___intents_sharedOldFormatRegularExpression__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:\\\\?\\()([a-zA-Z0-9\\_\\.]+)(?:\\))"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_intents_sharedOldFormatRegularExpression_regularExpression;
  _intents_sharedOldFormatRegularExpression_regularExpression = v0;

}

void __72__NSRegularExpression_Intents___intents_sharedFunctionRegularExpression__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\.([a-zA-Z0-9\\\\_]+\\(.*?\\))"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_intents_sharedFunctionRegularExpression_regularExpression;
  _intents_sharedFunctionRegularExpression_regularExpression = v0;

}

void __70__NSRegularExpression_Intents___intents_sharedFormatRegularExpression__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:\\$\\{)(.*?)(?:\\})"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_intents_sharedFormatRegularExpression_regularExpression;
  _intents_sharedFormatRegularExpression_regularExpression = v0;

}

@end
