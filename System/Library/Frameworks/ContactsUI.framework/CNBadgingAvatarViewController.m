@implementation CNBadgingAvatarViewController

- (id)descriptorForRequiredKeys
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[CNBadgingAvatarViewController avatarViewController](self, "avatarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNBadgingAvatarViewController.m"), 336, CFSTR("CNBadgingAvatarViewController - Avatar View Controller required to get descriptorsForRequiredKeys"));

  }
  -[CNBadgingAvatarViewController avatarViewController](self, "avatarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNBadgingAvatarViewController)initWithSettings:(id)a3
{
  id v4;
  CNBadgingAvatarViewController *v5;
  CNAvatarViewController *v6;
  CNAvatarViewController *avatarViewController;
  CNBadgingAvatarView *v8;
  CNBadgingAvatarView *badgingAvatarView;
  CNBadgingAvatarViewController *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNBadgingAvatarViewController;
  v5 = -[CNBadgingAvatarViewController init](&v12, sel_init);
  if (v5)
  {
    v6 = -[CNAvatarViewController initWithSettings:]([CNAvatarViewController alloc], "initWithSettings:", v4);
    avatarViewController = v5->_avatarViewController;
    v5->_avatarViewController = v6;

    -[CNAvatarViewController setObjectViewControllerDelegate:](v5->_avatarViewController, "setObjectViewControllerDelegate:", v5);
    v8 = -[CNBadgingAvatarView initWithAvatarViewController:]([CNBadgingAvatarView alloc], "initWithAvatarViewController:", v5->_avatarViewController);
    badgingAvatarView = v5->_badgingAvatarView;
    v5->_badgingAvatarView = v8;

    v10 = v5;
  }

  return v5;
}

- (CNBadgingAvatarViewController)init
{
  void *v3;
  CNBadgingAvatarViewController *v4;

  +[CNAvatarViewControllerSettings defaultSettings](CNAvatarViewControllerSettings, "defaultSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNBadgingAvatarViewController initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (void)setContacts:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNBadgingAvatarViewController avatarViewController](self, "avatarViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContacts:", v4);

}

- (NSArray)contacts
{
  void *v2;
  void *v3;

  -[CNBadgingAvatarViewController avatarViewController](self, "avatarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (UIView)view
{
  -[CNBadgingAvatarViewController setupContainerViewIfNeeded](self, "setupContainerViewIfNeeded");
  return -[CNBadgingAvatarViewController containerView](self, "containerView");
}

- (void)setupContainerViewIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  -[CNBadgingAvatarViewController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNBadgingAvatarViewController setContainerView:](self, "setContainerView:", v5);

    -[CNBadgingAvatarViewController containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNBadgingAvatarViewController badgingAvatarView](self, "badgingAvatarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[CNBadgingAvatarViewController containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CNBadgingAvatarViewController badgingAvatarView](self, "badgingAvatarView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    -[CNBadgingAvatarViewController badgingAvatarView](self, "badgingAvatarView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 18);

  }
}

- (void)setBadgeImage:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_badgeImage, a3);
  v5 = a3;
  -[CNBadgingAvatarViewController badgingAvatarView](self, "badgingAvatarView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBadgeImage:", v5);

}

- (void)setBadgeStyleSettings:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_badgeStyleSettings, a3);
  v5 = a3;
  -[CNBadgingAvatarViewController badgingAvatarView](self, "badgingAvatarView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBadgeStyleSettings:", v5);

}

- (id)hostingViewControllerForController:(id)a3
{
  void *v4;
  void *v5;

  -[CNBadgingAvatarViewController objectViewControllerDelegate](self, "objectViewControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostingViewControllerForController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNUIObjectViewControllerDelegate)objectViewControllerDelegate
{
  return (CNUIObjectViewControllerDelegate *)objc_loadWeakRetained((id *)&self->objectViewControllerDelegate);
}

- (void)setObjectViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->objectViewControllerDelegate, a3);
}

- (UIImage)badgeImage
{
  return self->_badgeImage;
}

- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings
{
  return self->_badgeStyleSettings;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (CNBadgingAvatarView)badgingAvatarView
{
  return self->_badgingAvatarView;
}

- (void)setBadgingAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_badgingAvatarView, a3);
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewController, a3);
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (void)setMediaContextBadge:(id)a3
{
  objc_storeStrong((id *)&self->_mediaContextBadge, a3);
}

- (BOOL)isMarkedForSyndication
{
  return self->_isMarkedForSyndication;
}

- (void)setIsMarkedForSyndication:(BOOL)a3
{
  self->_isMarkedForSyndication = a3;
}

- (BOOL)isDoNotDisturb
{
  return self->_isDoNotDisturb;
}

- (void)setIsDoNotDisturb:(BOOL)a3
{
  self->_isDoNotDisturb = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_badgingAvatarView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_badgeStyleSettings, 0);
  objc_storeStrong((id *)&self->_badgeImage, 0);
  objc_destroyWeak((id *)&self->objectViewControllerDelegate);
}

@end
