@implementation PKSubheadRegularFontSizeInPoints

void __PKSubheadRegularFontSizeInPoints_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pointSize");
  _MergedGlobals_7 = v0;

}

@end
