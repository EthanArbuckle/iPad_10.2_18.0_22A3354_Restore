@implementation ONOAttributeRegularExpression

void __ONOAttributeRegularExpression_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\[(\\w+)\\]"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ONOAttributeRegularExpression__ONOAttributeRegularExpression;
  ONOAttributeRegularExpression__ONOAttributeRegularExpression = v0;

}

@end
