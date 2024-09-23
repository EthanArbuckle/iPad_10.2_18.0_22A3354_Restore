@implementation AFUIRegularExpressionForEmail

void __AFUIRegularExpressionForEmail_block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!AFUIRegularExpressionForEmail_regEx)
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"), 1, 0);
    v1 = (void *)AFUIRegularExpressionForEmail_regEx;
    AFUIRegularExpressionForEmail_regEx = v0;

  }
}

@end
