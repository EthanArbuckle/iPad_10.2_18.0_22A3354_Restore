@implementation CurvedParagraphStyle

void ___CurvedParagraphStyle_block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setAlignment:", 0);
  objc_msgSend(v0, "setCompositionLanguage:", 1);
  v1 = (void *)_CurvedParagraphStyle_paragraphStyle;
  _CurvedParagraphStyle_paragraphStyle = (uint64_t)v0;

}

@end
