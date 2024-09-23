@implementation CUITextStyle

- (CUITextStyle)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUITextStyle *v6;
  CUITextStyle *v7;
  CUIThemeRendition *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float *v15;
  float v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CUITextStyle;
  v6 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v18, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4, a5);
  v7 = v6;
  if (v6)
  {
    v8 = -[CUINamedLookup _rendition](v6, "_rendition");
    if ((id)-[CUIThemeRendition type](v8, "type") == (id)1015)
    {
      v15 = -[CUIThemeRendition csiTextStyle](v8, "csiTextStyle");
      v7->_fontName = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15 + 8);
      v16 = v15[4];
      v7->_fontSize = v15[3];
      v7->_maxPointSize = v16;
      v7->_minPointSize = v15[5];
      v7->_scalingStyle = *((unsigned int *)v15 + 2);
      v7->_alignment = *((unsigned int *)v15 + 6);
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: attempting to lookup a text style '%@' with a name that is not a text style in the AssetCatalog", v9, v10, v11, v12, v13, v14, (uint64_t)a3);

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUITextStyle;
  -[CUINamedLookup dealloc](&v3, sel_dealloc);
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (double)maxPointSize
{
  return self->_maxPointSize;
}

- (double)minPointSize
{
  return self->_minPointSize;
}

- (int64_t)scalingStyle
{
  return self->_scalingStyle;
}

- (int64_t)alignment
{
  return self->_alignment;
}

@end
