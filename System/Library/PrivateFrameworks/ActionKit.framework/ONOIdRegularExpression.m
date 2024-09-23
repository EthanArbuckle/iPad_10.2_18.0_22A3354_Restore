@implementation ONOIdRegularExpression

void __ONOIdRegularExpression_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\#([\\w-_]+)"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ONOIdRegularExpression__ONOIdRegularExpression;
  ONOIdRegularExpression__ONOIdRegularExpression = v0;

}

@end
