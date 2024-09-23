@implementation ABTokenListCreate

void __ABTokenListCreate_block_invoke()
{
  void *v0;

  v0 = (void *)MEMORY[0x1A1ACC34C]();
  ABTokenListCreate_sharedSubtokenRegex = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[[:script=Hiragana:][:script=Katakana:]]+|[^[[:script=Hiragana:][:script=Katakana:]]]{1}"), 1, 0);
  objc_autoreleasePoolPop(v0);
}

@end
