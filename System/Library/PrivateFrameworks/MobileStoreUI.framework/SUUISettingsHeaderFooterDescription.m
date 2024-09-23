@implementation SUUISettingsHeaderFooterDescription

- (SUUISettingsHeaderFooterDescription)initWithViewElement:(id)a3
{
  id v5;
  SUUISettingsHeaderFooterDescription *v6;
  SUUISettingsHeaderFooterDescription *v7;

  v5 = a3;
  v6 = -[SUUISettingsHeaderFooterDescription init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewElement, a3);

  return v7;
}

+ (id)settingsHeaderFooterDescriptionWithViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  if (v5 == 41)
  {
    objc_msgSend(a1, "_settingsHeaderFooterDescriptionWithFooterElement:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 48)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "_settingsHeaderFooterDescriptionWithHeaderElement:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

+ (Class)viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return (Class)objc_msgSend(a3, "_viewClassForSettingsHeaderFooterDescription:");
}

- (id)viewElement
{
  return self->_viewElement;
}

+ (id)_settingsHeaderFooterDescriptionWithFooterElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __objc2_class **v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "elementType");
    if (v6 == 138)
    {
      v7 = off_2511F3178;
      goto LABEL_7;
    }
    if (v6 == 12)
    {
      v7 = off_2511F2BB0;
LABEL_7:
      v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithViewElement:", v3);
      goto LABEL_8;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

+ (id)_settingsHeaderFooterDescriptionWithHeaderElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  SUUITextHeaderSettingsHeaderFooterDescription *v6;

  v3 = a3;
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "elementType") == 138)
    v6 = -[SUUISettingsHeaderFooterDescription initWithViewElement:]([SUUITextHeaderSettingsHeaderFooterDescription alloc], "initWithViewElement:", v3);
  else
    v6 = 0;

  return v6;
}

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end
