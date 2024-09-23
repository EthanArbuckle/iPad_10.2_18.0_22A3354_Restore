@implementation UIFont

void __57__UIFont_FocusUIAdditions__fcui_excessiveLineHeightChars__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v1 = (void *)fcui_excessiveLineHeightChars___excessiveLineHeightChars;
  fcui_excessiveLineHeightChars___excessiveLineHeightChars = v0;

}

@end
