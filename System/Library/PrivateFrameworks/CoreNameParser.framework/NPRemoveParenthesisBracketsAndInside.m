@implementation NPRemoveParenthesisBracketsAndInside

void ___NPRemoveParenthesisBracketsAndInside_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", *(_QWORD *)(a1 + 32), 1, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_NPRemoveParenthesisBracketsAndInside_regex;
  _NPRemoveParenthesisBracketsAndInside_regex = v1;

}

@end
