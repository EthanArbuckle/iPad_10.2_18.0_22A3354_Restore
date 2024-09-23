@implementation INSharedFormatRegularExpression

void __INSharedFormatRegularExpression_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?<!%)%([0-9]+\\$)?@"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)INSharedFormatRegularExpression_regularExpression;
  INSharedFormatRegularExpression_regularExpression = v0;

}

@end
