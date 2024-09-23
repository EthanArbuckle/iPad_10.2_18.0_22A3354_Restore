@implementation MUIAvatarViewController

- (MUIAvatarViewController)initWithContacts:(id)a3
{
  id v4;
  MUIAvatarViewController *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUIAvatarViewController;
  v5 = -[MUIAvatarViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C97470]);
    -[MUIAvatarViewController setAvatarViewController:](v5, "setAvatarViewController:", v6);

    -[MUIAvatarViewController avatarViewController](v5, "avatarViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setThreeDTouchEnabled:", 0);

    -[MUIAvatarViewController updateContacts:](v5, "updateContacts:", v4);
  }

  return v5;
}

+ (id)avatarControllerWithContacts:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContacts:", v4);

  return v5;
}

- (void)updateContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_opt_new();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  -[MUIAvatarViewController avatarViewController](self, "avatarViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContacts:", v5);

  v9 = objc_msgSend(v5, "count") == 0;
  -[MUIAvatarViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

}

- (UIView)view
{
  UIView *view;
  void *v4;
  UIView *v5;
  void *v6;
  UIView *v7;
  UIView *v8;

  view = self->_view;
  -[MUIAvatarViewController avatarViewController](self, "avatarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();

  if (view != v5)
  {
    -[MUIAvatarViewController avatarViewController](self, "avatarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_view;
    self->_view = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_view, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return self->_view;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
