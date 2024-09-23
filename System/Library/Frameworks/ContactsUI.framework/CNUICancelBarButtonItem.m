@implementation CNUICancelBarButtonItem

- (CNUICancelBarButtonItem)initWithDidTapHandler:(id)a3
{
  id v4;
  CNUICancelBarButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  id didTapHandler;
  CNUICancelBarButtonItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNUICancelBarButtonItem;
  v5 = -[UIBarItem init](&v12, sel_init);
  if (v5)
  {
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICancelBarButtonItem setTitle:](v5, "setTitle:", v7);

    -[CNUICancelBarButtonItem setStyle:](v5, "setStyle:", 2);
    -[CNUICancelBarButtonItem setTarget:](v5, "setTarget:", v5);
    -[CNUICancelBarButtonItem setAction:](v5, "setAction:", sel_didTap_);
    v8 = _Block_copy(v4);
    didTapHandler = v5->_didTapHandler;
    v5->_didTapHandler = v8;

    v10 = v5;
  }

  return v5;
}

- (void)didTap:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[CNUICancelBarButtonItem didTapHandler](self, "didTapHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNUICancelBarButtonItem didTapHandler](self, "didTapHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)didTapHandler
{
  return self->_didTapHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didTapHandler, 0);
}

@end
