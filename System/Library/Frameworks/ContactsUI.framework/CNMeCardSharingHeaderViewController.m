@implementation CNMeCardSharingHeaderViewController

- (CNMeCardSharingHeaderViewController)initWithAvatarViewController:(id)a3 name:(id)a4 layoutAttributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNMeCardSharingHeaderViewController *v12;
  CNMeCardSharingHeaderViewController *v13;
  CNMeCardSharingHeaderViewController *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNMeCardSharingHeaderViewController;
  v12 = -[CNMeCardSharingHeaderViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarViewController, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_layoutAttributes, a5);
    v14 = v13;
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  UILabel *v6;
  UILabel *nameLabel;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNMeCardSharingHeaderViewController;
  -[CNMeCardSharingHeaderViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[CNMeCardSharingHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingAvatarViewController view](self->_avatarViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[CNMeCardSharingHeaderViewController addChildViewController:](self, "addChildViewController:", self->_avatarViewController);
  -[CNMeCardSharingAvatarViewController didMoveToParentViewController:](self->_avatarViewController, "didMoveToParentViewController:", self);
  v5 = objc_alloc(MEMORY[0x1E0DC3990]);
  v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  nameLabel = self->_nameLabel;
  self->_nameLabel = v6;

  -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", 1);
  -[CNMeCardSharingPickerLayoutAttributes headerFont](self->_layoutAttributes, "headerFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_nameLabel, "setFont:", v8);

  -[UILabel setAutoresizingMask:](self->_nameLabel, "setAutoresizingMask:", 2);
  -[UILabel setText:](self->_nameLabel, "setText:", self->_name);
  -[CNMeCardSharingHeaderViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_nameLabel);

}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double MaxY;
  double v11;
  double v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)CNMeCardSharingHeaderViewController;
  -[CNMeCardSharingHeaderViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[CNMeCardSharingPickerLayoutAttributes topToAvatarPadding](self->_layoutAttributes, "topToAvatarPadding");
  v4 = v3;
  -[CNMeCardSharingHeaderViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  -[CNMeCardSharingAvatarViewController view](self->_avatarViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", 0.0, v4, v7, 100.0);

  -[CNMeCardSharingAvatarViewController view](self->_avatarViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  MaxY = CGRectGetMaxY(v15);
  -[CNMeCardSharingPickerLayoutAttributes avatarViewToNamePadding](self->_layoutAttributes, "avatarViewToNamePadding");
  v12 = MaxY + v11;
  -[CNMeCardSharingHeaderViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", 0.0, v12);

}

- (double)desiredHeight
{
  return 180.0;
}

- (CNMeCardSharingAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewController, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_layoutAttributes, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

@end
