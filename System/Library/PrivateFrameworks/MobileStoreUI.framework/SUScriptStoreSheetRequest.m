@implementation SUScriptStoreSheetRequest

- (id)newNativeStorePageRequest
{
  id v3;
  void *v4;
  uint64_t v5;
  WebScriptObject *productParameters;
  BOOL v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDEA6D8]);
  -[SUScriptObject webFrame](self, "webFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "globalContext");

  -[SUScriptObject lock](self, "lock");
  objc_msgSend(v3, "setProductPageStyle:", self->_pageStyle);
  productParameters = self->_productParameters;
  if (productParameters)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = (void *)-[WebScriptObject copyArrayOrDictionaryWithContext:](productParameters, "copyArrayOrDictionaryWithContext:", v5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "setProductParameters:", v8);

  }
  if (self->_productURL)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", self->_productURL);
    objc_msgSend(v3, "setProductURL:", v9);

  }
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesStoreSheetRequest");
}

- (int64_t)productPageStyle
{
  int64_t pageStyle;

  -[SUScriptObject lock](self, "lock");
  pageStyle = self->_pageStyle;
  -[SUScriptObject unlock](self, "unlock");
  return pageStyle;
}

- (WebScriptObject)productParameters
{
  WebScriptObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_productParameters;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)productURL
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_productURL;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setProductPageStyle:(int64_t)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_pageStyle = a3;
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setProductParameters:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  WebScriptObject *obj;

  v4 = a3;
  v5 = SUUIWebCoreFramework();
  v6 = SUUIWeakLinkedClassForString(CFSTR("WebScriptObject"), v5);
  -[SUScriptStoreSheetRequest _safeValueForValue:](self, "_safeValueForValue:", v4);
  obj = (WebScriptObject *)objc_claimAutoreleasedReturnValue();

  if (obj && (objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v6, "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    -[SUScriptObject lock](self, "lock");
    if (self->_productParameters != obj)
      objc_storeStrong((id *)&self->_productParameters, obj);
    -[SUScriptObject unlock](self, "unlock");
  }

}

- (void)setProductURL:(id)a3
{
  uint64_t v4;
  NSString *obj;

  -[SUScriptStoreSheetRequest _safeValueForValue:](self, "_safeValueForValue:", a3);
  obj = (NSString *)objc_claimAutoreleasedReturnValue();
  if (obj && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = SUUIWebCoreFramework();
    objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("WebScriptObject"), v4), "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    -[SUScriptObject lock](self, "lock");
    if (self->_productURL != obj)
      objc_storeStrong((id *)&self->_productURL, obj);
    -[SUScriptObject unlock](self, "unlock");
  }

}

- (int64_t)productPageStyleAutomatic
{
  return 0;
}

- (int64_t)productPageStyleBanner
{
  return 1;
}

- (int64_t)productPageStylePad
{
  return 3;
}

- (int64_t)productPageStylePhone
{
  return 2;
}

- (id)_safeValueForValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (v4 = SUUIWebCoreFramework(),
        SUUIWeakLinkedClassForString(CFSTR("WebUndefined"), v4),
        v5 = v3,
        (objc_opt_isKindOfClass() & 1) != 0))
  {

    v5 = 0;
  }

  return v5;
}

+ (id)webScriptNameForKey:(const char *)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3);
  objc_msgSend((id)__KeyMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SUScriptStoreSheetRequest;
    objc_msgSendSuper2(&v8, sel_webScriptNameForKey_, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptStoreSheetRequest;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptStoreSheetRequest;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("sheetStyle"), CFSTR("productPageStyle"), CFSTR("productParameters"), CFSTR("productParameters"), CFSTR("productURL"), CFSTR("productURL"), CFSTR("SHEET_STYLE_AUTOMATIC"), CFSTR("productPageStyleAutomatic"), CFSTR("SHEET_STYLE_BANNER"), CFSTR("productPageStyleBanner"), CFSTR("SHEET_STYLE_PAD"), CFSTR("productPageStylePad"), CFSTR("SHEET_STYLE_PHONE"), CFSTR("productPageStylePhone"), 0);
    v3 = (void *)__KeyMapping;
    __KeyMapping = v2;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productParameters, 0);
}

@end
