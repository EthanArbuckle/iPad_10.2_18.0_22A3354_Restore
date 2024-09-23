@implementation CKContextUIClasses

+ (void)lookupClasses
{
  classWKWebView = (uint64_t)objc_lookUpClass("WKWebView");
  classPDFView = (uint64_t)objc_lookUpClass("PDFView");
  classSFSafariView = (uint64_t)objc_lookUpClass("SFSafariView");
}

+ (BOOL)isWKWebView:(id)a3
{
  char isKindOfClass;

  if (classWKWebView)
    isKindOfClass = objc_opt_isKindOfClass();
  else
    isKindOfClass = 0;
  return isKindOfClass & 1;
}

+ (BOOL)isPDFView:(id)a3
{
  char isKindOfClass;

  if (classPDFView)
    isKindOfClass = objc_opt_isKindOfClass();
  else
    isKindOfClass = 0;
  return isKindOfClass & 1;
}

+ (BOOL)isSFSafariView:(id)a3
{
  char isKindOfClass;

  if (classSFSafariView)
    isKindOfClass = objc_opt_isKindOfClass();
  else
    isKindOfClass = 0;
  return isKindOfClass & 1;
}

@end
