@implementation NSString

void __51__NSString_CSUserQuery__normalizeForSemanticSearch__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)normalizeForSemanticSearch_sRegex;
  normalizeForSemanticSearch_sRegex = v0;

}

void __36__NSString_CSUserQuery__containsCJK__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(\\p{script=Han})|(\\p{script=Hangul})"), 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)containsCJK_sRegex;
  containsCJK_sRegex = v0;

}

@end
