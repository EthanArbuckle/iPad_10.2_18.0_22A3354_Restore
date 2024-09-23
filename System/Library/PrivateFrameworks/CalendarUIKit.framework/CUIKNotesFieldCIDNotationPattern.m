@implementation CUIKNotesFieldCIDNotationPattern

void ___CUIKNotesFieldCIDNotationPattern_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\[cid:[^\\]]*\\]"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_CUIKNotesFieldCIDNotationPattern_cidNotationPattern;
  _CUIKNotesFieldCIDNotationPattern_cidNotationPattern = v0;

}

@end
