@implementation CNAvatarViewController_LegacyAvatarView

- (void)didUpdateContentForAvatarView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNAvatarViewController_LegacyAvatarView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAvatarViewController_LegacyAvatarView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didUpdateContentForAvatarViewController:", self);

  }
}

- (NSObject)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setContacts:(id)a3
{
  NSArray *v4;
  NSArray *contacts;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (NSArray *)objc_msgSend(v9, "copy");
  contacts = self->_contacts;
  self->_contacts = v4;

  v6 = v9;
  if (v9)
  {
    v7 = -[CNAvatarViewController_LegacyAvatarView isViewLoaded](self, "isViewLoaded");
    v6 = v9;
    if (v7)
    {
      -[CNAvatarViewController_LegacyAvatarView avatarView](self, "avatarView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContacts:", v9);

      v6 = v9;
    }
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)loadView
{
  CNAvatarView *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNAvatarView *v13;

  v3 = [CNAvatarView alloc];
  -[CNAvatarViewController_LegacyAvatarView imageRenderer](self, "imageRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNAvatarViewController_LegacyAvatarView isThreeDTouchEnabled](self, "isThreeDTouchEnabled");
  -[CNAvatarViewController_LegacyAvatarView contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNAvatarViewController_LegacyAvatarView style](self, "style");
  -[CNAvatarViewController_LegacyAvatarView schedulerProvider](self, "schedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNAvatarView initWithImageRenderer:threeDTouchEnabled:contactStore:style:schedulerProvider:backgroundStyle:](v3, "initWithImageRenderer:threeDTouchEnabled:contactStore:style:schedulerProvider:backgroundStyle:", v4, v5, v6, v7, v8, 0);

  -[CNAvatarViewController_LegacyAvatarView setView:](self, "setView:", v13);
  -[CNAvatarViewController_LegacyAvatarView setAvatarView:](self, "setAvatarView:", v13);
  -[CNAvatarViewController_LegacyAvatarView avatarView](self, "avatarView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[CNAvatarViewController_LegacyAvatarView contacts](self, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CNAvatarViewController_LegacyAvatarView avatarView](self, "avatarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarViewController_LegacyAvatarView contacts](self, "contacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContacts:", v12);

  }
}

- (id)contacts
{
  return self->_contacts;
}

- (CNAvatarView)avatarView
{
  return (CNAvatarView *)objc_loadWeakRetained((id *)&self->_avatarView);
}

- (BOOL)isThreeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setAvatarView:(id)a3
{
  objc_storeWeak((id *)&self->_avatarView, a3);
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUILikenessRendering)imageRenderer
{
  return self->_imageRenderer;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNAvatarViewController_LegacyAvatarView)initWithSettings:(id)a3
{
  id v4;
  CNAvatarViewController_LegacyAvatarView *v5;
  uint64_t v6;
  CNUILikenessRendering *imageRenderer;
  uint64_t v8;
  CNSchedulerProvider *schedulerProvider;
  uint64_t v10;
  CNContactStore *contactStore;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarViewController_LegacyAvatarView;
  v5 = -[CNAvatarViewController initWithSettings:](&v13, sel_initWithSettings_, v4);
  if (v5)
  {
    objc_msgSend(v4, "likenessRenderer");
    v6 = objc_claimAutoreleasedReturnValue();
    imageRenderer = v5->_imageRenderer;
    v5->_imageRenderer = (CNUILikenessRendering *)v6;

    v5->_threeDTouchEnabled = objc_msgSend(v4, "threeDTouchEnabled");
    objc_msgSend(v4, "schedulerProvider");
    v8 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v5->_schedulerProvider;
    v5->_schedulerProvider = (CNSchedulerProvider *)v8;

    v5->_style = objc_msgSend(v4, "style");
    objc_msgSend(v4, "contactStore");
    v10 = objc_claimAutoreleasedReturnValue();
    contactStore = v5->_contactStore;
    v5->_contactStore = (CNContactStore *)v10;

  }
  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)descriptorForRequiredKeys
{
  return +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", -[CNAvatarViewController_LegacyAvatarView isThreeDTouchEnabled](self, "isThreeDTouchEnabled"));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_avatarView);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageRenderer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_threeDTouchEnabled != a3)
  {
    v3 = a3;
    self->_threeDTouchEnabled = a3;
    -[CNAvatarViewController_LegacyAvatarView avatarView](self, "avatarView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setThreeDTouchEnabled:", v3);

  }
}

- (void)updateViewWithGroupIdentity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[CNAvatarViewController_LegacyAvatarView avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "updateViewWithGroupIdentity:", v6);

}

- (void)setAllowStaleRendering:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNAvatarViewController_LegacyAvatarView avatarView](self, "avatarView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowStaleRendering:", v3);

}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  void *v4;
  CNAvatarViewController_LegacyAvatarView *v5;

  -[CNAvatarViewController objectViewControllerDelegate](self, "objectViewControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostingViewControllerForController:", self);
  v5 = (CNAvatarViewController_LegacyAvatarView *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v5 = self;
  return v5;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

@end
