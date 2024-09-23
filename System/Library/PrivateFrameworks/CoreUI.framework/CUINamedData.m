@implementation CUINamedData

- (NSString)utiType
{
  CUIThemeRendition *v2;

  v2 = -[CUINamedLookup _rendition](self, "_rendition");
  if ((id)-[CUIThemeRendition type](v2, "type") == (id)1000)
    return (NSString *)-[CUIThemeRendition utiType](v2, "utiType");
  else
    return (NSString *)CFSTR("com.adobe.pdf");
}

- (CUINamedData)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedData *v6;
  CUIThemeRendition *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CUINamedData;
  v6 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v15, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4, a5);
  v7 = -[CUINamedLookup _rendition](v6, "_rendition");
  if ((id)-[CUIThemeRendition type](v7, "type") != (id)1000 && (id)-[CUIThemeRendition type](v7, "type") != (id)9)
  {
    _CUILog(4, (uint64_t)"CoreUI: attempting to lookup a named data '%@' with a type that is not a data type in the AssetCatalog", v8, v9, v10, v11, v12, v13, (uint64_t)a3);

    return 0;
  }
  return v6;
}

- (NSData)data
{
  CUIThemeRendition *v2;
  CGDataProvider *DataProvider;

  v2 = -[CUINamedLookup _rendition](self, "_rendition");
  if ((id)-[CUIThemeRendition type](v2, "type") == (id)1000)
    return (NSData *)-[CUIThemeRendition data](v2, "data");
  DataProvider = (CGDataProvider *)CGPDFDocumentGetDataProvider(-[CUIThemeRendition pdfDocument](v2, "pdfDocument"));
  return (NSData *)CGDataProviderCopyData(DataProvider);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  id v5;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  if (self)
    v5 = -[CUIThemeRendition name](-[CUINamedLookup _rendition](self, "_rendition"), "name");
  else
    v5 = 0;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p> name:'%@' uti:'%@' data:%@>"), v4, self, v5, -[CUINamedData utiType](self, "utiType"), -[CUINamedData data](self, "data"));
}

@end
