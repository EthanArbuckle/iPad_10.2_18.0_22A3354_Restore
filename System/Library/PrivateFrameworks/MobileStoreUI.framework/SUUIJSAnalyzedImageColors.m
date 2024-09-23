@implementation SUUIJSAnalyzedImageColors

- (SUUIJSAnalyzedImageColors)initWithAppContext:(id)a3 analyzedImageColors:(id)a4
{
  id v6;
  id v7;
  SUUIJSAnalyzedImageColors *v8;
  SUUIJSColor *v9;
  void *v10;
  uint64_t v11;
  SUUIJSColor *backgroundColor;
  SUUIJSColor *v13;
  void *v14;
  uint64_t v15;
  SUUIJSColor *textPrimaryColor;
  SUUIJSColor *v17;
  void *v18;
  uint64_t v19;
  SUUIJSColor *textSecondaryColor;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SUUIJSAnalyzedImageColors;
  v8 = -[IKJSObject initWithAppContext:](&v22, sel_initWithAppContext_, v6);
  if (v8)
  {
    v9 = [SUUIJSColor alloc];
    objc_msgSend(v7, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SUUIJSColor initWithAppContext:color:](v9, "initWithAppContext:color:", v6, v10);
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (SUUIJSColor *)v11;

    v13 = [SUUIJSColor alloc];
    objc_msgSend(v7, "textPrimaryColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SUUIJSColor initWithAppContext:color:](v13, "initWithAppContext:color:", v6, v14);
    textPrimaryColor = v8->_textPrimaryColor;
    v8->_textPrimaryColor = (SUUIJSColor *)v15;

    v17 = [SUUIJSColor alloc];
    objc_msgSend(v7, "textSecondaryColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SUUIJSColor initWithAppContext:color:](v17, "initWithAppContext:color:", v6, v18);
    textSecondaryColor = v8->_textSecondaryColor;
    v8->_textSecondaryColor = (SUUIJSColor *)v19;

    v8->_isBackgroundLight = objc_msgSend(v7, "isBackgroundLight");
  }

  return v8;
}

- (SUUIJSColor)backgroundColor
{
  return self->_backgroundColor;
}

- (SUUIJSColor)textPrimaryColor
{
  return self->_textPrimaryColor;
}

- (SUUIJSColor)textSecondaryColor
{
  return self->_textSecondaryColor;
}

- (BOOL)isBackgroundLight
{
  return self->_isBackgroundLight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSecondaryColor, 0);
  objc_storeStrong((id *)&self->_textPrimaryColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
