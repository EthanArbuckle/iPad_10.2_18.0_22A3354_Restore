@implementation NSAttributedString(DataDetectorsSupport)

- (id)dd_attributedSubstringFromRange:()DataDetectorsSupport
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "attributedSubstringFromRange:"), "mutableCopy");
  objc_msgSend(v4, "dd_offsetResultsBy:", -a3);
  objc_msgSend(v4, "dd_chopResults");
  return v4;
}

- (id)dd_attributedStringByAppendingAttributedString:()DataDetectorsSupport
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "dd_appendAttributedString:", a3);
  return v4;
}

@end
