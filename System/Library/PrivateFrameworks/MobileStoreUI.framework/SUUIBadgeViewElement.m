@implementation SUUIBadgeViewElement

- (SUUIBadgeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIBadgeViewElement *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSURL *resourceName;
  NSURL *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  float v21;
  CGFloat v22;
  float v23;
  objc_super v25;

  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUUIBadgeViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v25, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v10);
      objc_msgSend(v11, "scheme");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("resource"));

      if (v13)
      {
        objc_msgSend(v11, "host");
        v14 = objc_claimAutoreleasedReturnValue();
        resourceName = (NSURL *)v9->_resourceName;
        v9->_resourceName = (NSString *)v14;
      }
      else
      {
        v16 = v11;
        resourceName = v9->_url;
        v9->_url = v16;
      }

    }
    if (!v9->_resourceName && !v9->_url)
    {
      objc_msgSend(v8, "getAttribute:", CFSTR("content"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "length"))
      {
        objc_msgSend(v8, "getAttribute:", CFSTR("text"));
        v18 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v18;
      }
      if (objc_msgSend(v17, "length"))
        objc_storeStrong((id *)&v9->_text, v17);

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("height"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("width"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length") && objc_msgSend(v20, "length"))
    {
      objc_msgSend(v20, "floatValue");
      v22 = v21;
      objc_msgSend(v19, "floatValue");
      v9->_size.width = v22;
      v9->_size.height = v23;
    }

  }
  return v9;
}

- (NSAttributedString)attributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  if (self->_text)
  {
    -[SUUIBadgeViewElement style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementFontWithStyle(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "ikColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setLineBreakMode:", 4);
    v9 = objc_alloc(MEMORY[0x24BDBCE70]);
    v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v4, *MEMORY[0x24BEBB360], v8, *MEMORY[0x24BEBB3A8], v6, *MEMORY[0x24BEBB368], 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", self->_text, v10);

  }
  else
  {
    v11 = 0;
  }
  return (NSAttributedString *)v11;
}

- (int64_t)badgeType
{
  void *v3;

  -[SUUIBadgeViewElement fallbackImage](self, "fallbackImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && !self->_resourceName)
    return self->_url == 0;

  return 0;
}

- (id)accessibilityText
{
  void *v3;
  NSString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIBadgeViewElement;
  -[SUUIBadgeViewElement accessibilityText](&v6, sel_accessibilityText);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    v4 = self->_text;

    v3 = v4;
  }
  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIBadgeViewElement *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIImage *v8;
  UIImage *fallbackImage;
  UIImage *v10;
  NSString *v11;
  NSString *resourceName;
  CGFloat v13;
  CGFloat v14;
  NSURL *v15;
  NSURL *url;
  objc_super v18;

  v4 = (SUUIBadgeViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUIBadgeViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v18, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == self)
  {
    v7 = objc_msgSend(v5, "updateType");
    if (!v4 || !v7)
      goto LABEL_10;
  }
  else if (!v4)
  {
    goto LABEL_10;
  }
  if (v4->_hasValidFallbackImage)
  {
    -[SUUIBadgeViewElement fallbackImage](v4, "fallbackImage");
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    fallbackImage = self->_fallbackImage;
    self->_fallbackImage = v8;

    self->_hasValidFallbackImage = 1;
  }
  else
  {
    self->_hasValidFallbackImage = 0;
    v10 = self->_fallbackImage;
    self->_fallbackImage = 0;

  }
  -[SUUIBadgeViewElement resourceName](v4, "resourceName");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  resourceName = self->_resourceName;
  self->_resourceName = v11;

  -[SUUIBadgeViewElement size](v4, "size");
  self->_size.width = v13;
  self->_size.height = v14;
  objc_storeStrong((id *)&self->_text, v4->_text);
  -[SUUIBadgeViewElement URL](v4, "URL");
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v15;

LABEL_10:
  return v6;
}

- (UIImage)fallbackImage
{
  void *v3;
  void *v4;
  int v5;
  NSString *v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *fallbackImage;
  void *v11;
  UIImage *v12;
  UIImage *v13;

  if (!self->_hasValidFallbackImage)
  {
    self->_hasValidFallbackImage = 1;
    -[SUUIBadgeViewElement style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "badgeTreatment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("rect"));

    if (v5)
    {
      v6 = self->_text;
      objc_msgSend(v3, "ikColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        SUUIBadgeImageFromText(v6, v8, 1);
        v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
        fallbackImage = self->_fallbackImage;
        self->_fallbackImage = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.62745098, 1.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SUUIBadgeImageFromText(v6, v11, 1);
        v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v13 = self->_fallbackImage;
        self->_fallbackImage = v12;

        fallbackImage = (UIImage *)v6;
        v6 = (NSString *)v11;
      }

    }
  }
  return self->_fallbackImage;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
}

@end
