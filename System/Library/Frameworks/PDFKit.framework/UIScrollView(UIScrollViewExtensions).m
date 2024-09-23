@implementation UIScrollView(UIScrollViewExtensions)

- (uint64_t)PDFKitDocumentVisibleRectIncludingContentInsets
{
  objc_msgSend(a1, "contentOffset");
  objc_msgSend(a1, "contentOffset");
  objc_msgSend(a1, "contentSize");
  objc_msgSend(a1, "contentSize");
  return objc_msgSend(a1, "contentInset");
}

@end
