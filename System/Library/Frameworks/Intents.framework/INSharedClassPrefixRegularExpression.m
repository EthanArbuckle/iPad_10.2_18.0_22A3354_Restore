@implementation INSharedClassPrefixRegularExpression

void ___INSharedClassPrefixRegularExpression_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([a-zA-Z]+):"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_INSharedClassPrefixRegularExpression_regularExpression;
  _INSharedClassPrefixRegularExpression_regularExpression = v0;

}

@end
