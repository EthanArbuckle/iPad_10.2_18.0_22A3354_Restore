@implementation ATXTimeGlyphPresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *symbolName;
  id v5;

  symbolName = self->_symbolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", symbolName, CFSTR("symbolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_colorName, CFSTR("colorName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("options"));

}

- (ATXTimeGlyphPresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ATXTimeGlyphPresentation *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));

  v9 = -[ATXTimeGlyphPresentation initWithSymbolName:colorName:title:options:](self, "initWithSymbolName:colorName:title:options:", v5, v6, v7, v8);
  return v9;
}

- (ATXTimeGlyphPresentation)initWithSymbolName:(id)a3 colorName:(id)a4 title:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  ATXTimeGlyphPresentation *v13;
  uint64_t v14;
  NSString *symbolName;
  uint64_t v16;
  NSString *colorName;
  uint64_t v18;
  NSString *title;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXTimeGlyphPresentation;
  v13 = -[ATXTimeGlyphPresentation init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    symbolName = v13->_symbolName;
    v13->_symbolName = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    colorName = v13->_colorName;
    v13->_colorName = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v18;

    v13->_options = a6;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_symbolName, "hash");
  return -[NSString hash](self->_colorName, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXTimeGlyphPresentation *v4;
  ATXTimeGlyphPresentation *v5;
  BOOL v6;

  v4 = (ATXTimeGlyphPresentation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXTimeGlyphPresentation isEqualToATXTimeGlyphPresentation:](self, "isEqualToATXTimeGlyphPresentation:", v5);

  return v6;
}

- (BOOL)isEqualToATXTimeGlyphPresentation:(id)a3
{
  id *v4;
  NSString *symbolName;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSString *v11;
  NSString *v12;

  v4 = (id *)a3;
  symbolName = self->_symbolName;
  v6 = (NSString *)v4[1];
  if (symbolName == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = symbolName;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_colorName;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[NSString isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
