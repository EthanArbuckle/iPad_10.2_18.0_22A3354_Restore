@implementation UIFont(CNAutocompleteUI)

- (double)cn_originPointFromBaselinePoint:()CNAutocompleteUI
{
  objc_msgSend(a1, "pointSize");
  return a2;
}

- (double)cn_baselinePointFromOriginPoint:()CNAutocompleteUI
{
  objc_msgSend(a1, "pointSize");
  return a2;
}

- (double)cn_originPointFromCaplinePoint:()CNAutocompleteUI
{
  objc_msgSend(a1, "pointSize");
  objc_msgSend(a1, "capHeight");
  return a2;
}

- (double)cn_caplinePointFromOriginPoint:()CNAutocompleteUI
{
  objc_msgSend(a1, "pointSize");
  objc_msgSend(a1, "capHeight");
  return a2;
}

- (double)cn_baselinePointFromCaplinePoint:()CNAutocompleteUI
{
  objc_msgSend(a1, "capHeight");
  return a2;
}

- (double)cn_caplinePointFromBaselinePoint:()CNAutocompleteUI
{
  objc_msgSend(a1, "capHeight");
  return a2;
}

- (double)cn_originPointFromMidlinePoint:()CNAutocompleteUI
{
  objc_msgSend(a1, "capHeight");
  objc_msgSend(a1, "pointSize");
  return a2;
}

@end
