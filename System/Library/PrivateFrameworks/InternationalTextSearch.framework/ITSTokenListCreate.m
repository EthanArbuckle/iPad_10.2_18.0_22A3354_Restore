@implementation ITSTokenListCreate

void __ITSTokenListCreate_block_invoke()
{
  void *v0;

  v0 = (void *)MEMORY[0x20BD06E94]();
  ITSTokenListCreate_sharedSubtokenRegex = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("[[:script=Hiragana:][:script=Katakana:]]+|[^[[:script=Hiragana:][:script=Katakana:]]]{1}"), 1, 0);
  objc_autoreleasePoolPop(v0);
}

@end
