@implementation CUINamedMultisizeImageSet

- (CUINamedMultisizeImageSet)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedMultisizeImageSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CUINamedMultisizeImageSet;
  v6 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v14, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4, a5);
  if ((id)-[CUIThemeRendition type](-[CUINamedLookup _rendition](v6, "_rendition"), "type") != (id)1010)
  {
    _CUILog(4, (uint64_t)"CoreUI: attempting to lookup a named image multisize image set '%@' buts its a '%d' instead", v7, v8, v9, v10, v11, v12, (uint64_t)a3);

    return 0;
  }
  return v6;
}

- (id)sizeIndexes
{
  return -[CUIThemeRendition sizeIndexes](-[CUINamedLookup _rendition](self, "_rendition"), "sizeIndexes");
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUINamedMultisizeImageSet;
  return objc_msgSend(-[CUINamedMultisizeImageSet debugDescription](&v3, sel_debugDescription), "stringByAppendingString:", objc_msgSend(-[CUINamedMultisizeImageSet sizeIndexes](self, "sizeIndexes"), "debugDescription"));
}

@end
