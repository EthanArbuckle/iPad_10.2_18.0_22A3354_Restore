@implementation CUINamedColor

- (CGColor)cgColor
{
  CGColor *result;
  CGColor *v4;

  result = self->_cgColor;
  if (!result)
  {
    v4 = -[CUIThemeRendition cgColor](-[CUINamedLookup _rendition](self, "_rendition"), "cgColor");
    self->_cgColor = v4;
    CGColorRetain(v4);
    return self->_cgColor;
  }
  return result;
}

- (BOOL)substituteWithSystemColor
{
  return self->_substituteWithSystemColor;
}

- (CUINamedColor)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedColor *v6;
  CUINamedColor *v7;
  CUIThemeRendition *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CUINamedColor;
  v6 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v17, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4, a5);
  v7 = v6;
  if (v6)
  {
    v8 = -[CUINamedLookup _rendition](v6, "_rendition");
    if ((id)-[CUIThemeRendition type](v8, "type") == (id)1009)
    {
      v15 = -[CUIThemeRendition substituteWithSystemColor](v8, "substituteWithSystemColor");
      v7->_substituteWithSystemColor = v15;
      if (v15)
        v7->_colorName = (NSString *)objc_msgSend(-[CUIThemeRendition systemColorName](v8, "systemColorName"), "copy");
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: attempting to lookup a named color '%@' with a name that s not a color type in the AssetCatalog", v9, v10, v11, v12, v13, v14, (uint64_t)a3);

      return 0;
    }
  }
  return v7;
}

- (NSString)systemColorName
{
  return self->_colorName;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cgColor);

  v3.receiver = self;
  v3.super_class = (Class)CUINamedColor;
  -[CUINamedLookup dealloc](&v3, sel_dealloc);
}

@end
