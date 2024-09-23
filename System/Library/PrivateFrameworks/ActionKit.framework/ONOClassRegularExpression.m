@implementation ONOClassRegularExpression

void __ONOClassRegularExpression_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\.([^\\.]+)"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ONOClassRegularExpression__ONOClassRegularExpression;
  ONOClassRegularExpression__ONOClassRegularExpression = v0;

}

@end
