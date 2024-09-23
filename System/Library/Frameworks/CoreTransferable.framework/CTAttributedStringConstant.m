@implementation CTAttributedStringConstant

+ (NSString)documentType
{
  id *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (id *)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
  v8 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
  if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr)
  {
    v3 = (void *)UIFoundationLibrary();
    v2 = (id *)dlsym(v3, "NSDocumentTypeDocumentAttribute");
    v6[3] = (uint64_t)v2;
    getNSDocumentTypeDocumentAttributeSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    +[CTAttributedStringConstant documentType].cold.1();
  return (NSString *)*v2;
}

+ (NSString)rtf
{
  id *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (id *)getNSRTFTextDocumentTypeSymbolLoc_ptr;
  v8 = getNSRTFTextDocumentTypeSymbolLoc_ptr;
  if (!getNSRTFTextDocumentTypeSymbolLoc_ptr)
  {
    v3 = (void *)UIFoundationLibrary();
    v2 = (id *)dlsym(v3, "NSRTFTextDocumentType");
    v6[3] = (uint64_t)v2;
    getNSRTFTextDocumentTypeSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    +[CTAttributedStringConstant documentType].cold.1();
  return (NSString *)*v2;
}

+ (NSString)rtfd
{
  id *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (id *)getNSRTFDTextDocumentTypeSymbolLoc_ptr;
  v8 = getNSRTFDTextDocumentTypeSymbolLoc_ptr;
  if (!getNSRTFDTextDocumentTypeSymbolLoc_ptr)
  {
    v3 = (void *)UIFoundationLibrary();
    v2 = (id *)dlsym(v3, "NSRTFDTextDocumentType");
    v6[3] = (uint64_t)v2;
    getNSRTFDTextDocumentTypeSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    +[CTAttributedStringConstant documentType].cold.1();
  return (NSString *)*v2;
}

+ (NSString)html
{
  id *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (id *)getNSHTMLTextDocumentTypeSymbolLoc_ptr;
  v8 = getNSHTMLTextDocumentTypeSymbolLoc_ptr;
  if (!getNSHTMLTextDocumentTypeSymbolLoc_ptr)
  {
    v3 = (void *)UIFoundationLibrary();
    v2 = (id *)dlsym(v3, "NSHTMLTextDocumentType");
    v6[3] = (uint64_t)v2;
    getNSHTMLTextDocumentTypeSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    +[CTAttributedStringConstant documentType].cold.1();
  return (NSString *)*v2;
}

+ (void)documentType
{
  dlerror();
  abort_report_np();
  JSONDecoder.init()();
}

@end
