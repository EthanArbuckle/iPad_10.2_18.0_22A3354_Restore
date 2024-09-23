@implementation CPSAvatarViewController

- (CPSAvatarViewController)initWithEntity:(id)a3
{
  CPSAvatarViewController *v3;
  CPSAvatarViewController *v5;
  CPSAvatarViewController *v6;
  objc_super v7;
  id location[2];
  CPSAvatarViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)CPSAvatarViewController;
  v6 = -[CPSAvatarViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0);
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
    objc_storeStrong((id *)&v9->_entity, location[0]);
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)updateWithEntity:(id)a3
{
  id location[2];
  CPSAvatarViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSAvatarViewController setEntity:](v4, "setEntity:", location[0]);
  -[CPSAvatarViewController updateViews](v4, "updateViews");
  -[CPSAvatarViewController resetLayoutConstraints](v4, "resetLayoutConstraints");
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSAvatarViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSAvatarViewController;
  -[CPSAvatarViewController viewDidLoad](&v2, sel_viewDidLoad);
  -[CPSAvatarViewController setupViews](v4, "setupViews");
  -[CPSAvatarViewController updateViews](v4, "updateViews");
}

- (void)setupViews
{
  UIImageView *v2;
  UIImageView *avatarImageView;
  id v4;
  id v5;
  id v6;
  CPEntityImageProviding *v7;
  UIImageView *v8;
  UIImageView *v9;
  UIImageView *v10;
  id v11;

  v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
  v7 = -[CPSAvatarViewController entity](self, "entity");
  v6 = (id)-[CPEntityImageProviding imageSet](v7, "imageSet");
  v5 = (id)objc_msgSend(v6, "image");
  v2 = (UIImageView *)objc_msgSend(v4, "initWithImage:");
  avatarImageView = self->_avatarImageView;
  self->_avatarImageView = v2;

  v8 = -[CPSAvatarViewController avatarImageView](self, "avatarImageView");
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = -[CPSAvatarViewController avatarImageView](self, "avatarImageView");
  -[UIImageView setIsAccessibilityElement:](v9, "setIsAccessibilityElement:", 0);

  v11 = (id)-[CPSAvatarViewController view](self, "view");
  v10 = -[CPSAvatarViewController avatarImageView](self, "avatarImageView");
  objc_msgSend(v11, "addSubview:");

}

- (void)updateViews
{
  id v2;
  id v3;
  CPEntityImageProviding *v4;

  v4 = -[CPSAvatarViewController entity](self, "entity");
  v3 = (id)-[CPEntityImageProviding imageSet](v4, "imageSet");
  v2 = (id)objc_msgSend(v3, "image");
  -[UIImageView setImage:](self->_avatarImageView, "setImage:");

}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v3;
  id v4;
  UIImageView *v5;
  id v6;
  objc_super v7;
  id location[2];
  CPSAvatarViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)CPSAvatarViewController;
  -[CPSAvatarViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, location[0]);
  -[CPSAvatarViewController resetLayoutConstraints](v9, "resetLayoutConstraints");
  v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v3 = objc_msgSend(objc_retainAutorelease(v6), "CGColor");
  v5 = -[CPSAvatarViewController avatarImageView](v9, "avatarImageView");
  v4 = (id)-[UIImageView layer](v5, "layer");
  objc_msgSend(v4, "setBorderColor:", v3);

  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  void *v2;
  NSArray *v3;
  id v4;
  NSArray *v5;
  uint64_t v6;

  v5 = -[CPSAvatarViewController layoutConstraints](self, "layoutConstraints");
  v6 = -[NSArray count](v5, "count");

  if (v6)
  {
    v2 = (void *)MEMORY[0x24BDD1628];
    v3 = -[CPSAvatarViewController layoutConstraints](self, "layoutConstraints");
    objc_msgSend(v2, "deactivateConstraints:");

    -[CPSAvatarViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
    v4 = (id)-[CPSAvatarViewController view](self, "view");
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
}

- (void)updateViewConstraints
{
  NSArray *v2;
  BOOL v3;
  objc_super v4;
  SEL v5;
  CPSAvatarViewController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSAvatarViewController;
  -[CPSAvatarViewController updateViewConstraints](&v4, sel_updateViewConstraints);
  v2 = -[CPSAvatarViewController layoutConstraints](v6, "layoutConstraints");
  v3 = -[NSArray count](v2, "count") != 0;

  if (!v3)
    -[CPSAvatarViewController setupLayoutConstraints](v6, "setupLayoutConstraints");
}

- (void)setupLayoutConstraints
{
  id v2;
  id v3;
  UIImageView *v4;
  id v5;
  id v6;
  UIImageView *v7;
  id v8;
  id v9;
  UIImageView *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  UIImageView *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSArray *v20;
  id v21;
  id v22[2];
  CPSAvatarViewController *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23 = self;
  v22[1] = (id)a2;
  v22[0] = (id)objc_opt_new();
  v17 = (id)-[CPSAvatarViewController view](v23, "view");
  v16 = (id)objc_msgSend(v17, "centerXAnchor");
  v15 = -[CPSAvatarViewController avatarImageView](v23, "avatarImageView");
  v14 = (id)-[UIImageView centerXAnchor](v15, "centerXAnchor");
  v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v24[0] = v13;
  v12 = (id)-[CPSAvatarViewController view](v23, "view");
  v11 = (id)objc_msgSend(v12, "topAnchor");
  v10 = -[CPSAvatarViewController avatarImageView](v23, "avatarImageView");
  v9 = (id)-[UIImageView topAnchor](v10, "topAnchor");
  v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  v24[1] = v8;
  v7 = -[CPSAvatarViewController avatarImageView](v23, "avatarImageView");
  v6 = (id)-[UIImageView widthAnchor](v7, "widthAnchor");
  v5 = (id)objc_msgSend(v6, "constraintEqualToConstant:", *(double *)&CPSAvatarSize);
  v24[2] = v5;
  v4 = -[CPSAvatarViewController avatarImageView](v23, "avatarImageView");
  v3 = (id)-[UIImageView heightAnchor](v4, "heightAnchor");
  v2 = (id)objc_msgSend(v3, "constraintEqualToConstant:", *(double *)&CPSAvatarSize);
  v24[3] = v2;
  v21 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);

  objc_msgSend(v22[0], "addObjectsFromArray:", v21);
  v18 = (id)objc_msgSend(v22[0], "copy");
  -[CPSAvatarViewController setLayoutConstraints:](v23, "setLayoutConstraints:");

  v19 = (void *)MEMORY[0x24BDD1628];
  v20 = -[CPSAvatarViewController layoutConstraints](v23, "layoutConstraints");
  objc_msgSend(v19, "activateConstraints:");

  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
}

- (id)preferredFocusEnvironments
{
  return MEMORY[0x24BDBD1A8];
}

- (CPEntityImageProviding)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
