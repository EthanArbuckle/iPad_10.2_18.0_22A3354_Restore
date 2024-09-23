@implementation SUUIAccountButtonsComponent

- (SUUIAccountButtonsComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUIAccountButtonsComponent *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIAccountButtonsComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v9, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("hideTerms"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_hidesTermsAndConditions = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (SUUIAccountButtonsComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6;
  SUUIAccountButtonsComponent *v7;
  void *v8;
  void *v9;
  SUUILink *v10;
  SUUILink *ecommerceLink;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIAccountButtonsComponent;
  v7 = -[SUUIPageComponent initWithFeaturedContentContext:kind:](&v13, sel_initWithFeaturedContentContext_kind_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "componentDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("ecommerceLink"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SUUILink initWithLinkDictionary:]([SUUILink alloc], "initWithLinkDictionary:", v9);
      ecommerceLink = v7->_ecommerceLink;
      v7->_ecommerceLink = v10;

    }
  }

  return v7;
}

- (SUUIAccountButtonsComponent)initWithViewElement:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIAccountButtonsComponent;
  return -[SUUIPageComponent initWithViewElement:](&v4, sel_initWithViewElement_, a3);
}

- (int64_t)componentType
{
  return 1;
}

- (SUUILink)ECommerceLink
{
  return self->_ecommerceLink;
}

- (void)setECommerceLink:(id)a3
{
  objc_storeStrong((id *)&self->_ecommerceLink, a3);
}

- (BOOL)hidesTermsAndConditions
{
  return self->_hidesTermsAndConditions;
}

- (void)setHidesTermsAndConditions:(BOOL)a3
{
  self->_hidesTermsAndConditions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecommerceLink, 0);
}

@end
