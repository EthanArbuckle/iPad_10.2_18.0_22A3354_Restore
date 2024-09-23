@implementation SUUIDividerPageComponent

- (SUUIDividerPageComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUIDividerPageComponent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIDividerPageComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v11, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v8;

    }
  }

  return v5;
}

- (SUUIDividerPageComponent)initWithDividerTitle:(id)a3
{
  id v4;
  SUUIDividerPageComponent *v5;
  uint64_t v6;
  NSString *title;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIDividerPageComponent;
  v5 = -[SUUIDividerPageComponent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v6;

  }
  return v5;
}

- (SUUIDividerPageComponent)initWithViewElement:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIDividerPageComponent;
  return -[SUUIPageComponent initWithViewElement:](&v4, sel_initWithViewElement_, a3);
}

- (int64_t)componentType
{
  return 4;
}

- (NSString)dividerTitle
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
