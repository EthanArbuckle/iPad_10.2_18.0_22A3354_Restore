@implementation CUINamedVectorImage

- (double)scale
{
  return (double)-[CUIRenditionKey themeScale](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeScale");
}

- (CGPDFDocument)pdfDocument
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  _CUILog(4, (uint64_t)"CoreUI: attempting to get a pdfDocumement from a CUINamedVectorImage use the subclasses instead", v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars0;

  _CUILog(4, (uint64_t)"-[CUINamedVectorImage rasterizeImageUsingScaleFactor:forTargetSize:] called in the abstract class", v4, v5, v6, v7, v8, v9, vars0);
  return 0;
}

@end
