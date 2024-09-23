@implementation SFCapsuleCollectionActionView

- (SFCapsuleCollectionActionView)initWithFrame:(CGRect)a3
{
  SFCapsuleCollectionActionView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFCapsuleCollectionActionView *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SFCapsuleCollectionActionView;
  v3 = -[SFCapsuleCollectionActionView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFCapsuleCollectionActionView addSubview:](v3, "addSubview:", v3->_imageView);
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView centerYAnchor](v3->_imageView, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionActionView centerYAnchor](v3, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    -[UIImageView centerXAnchor](v3->_imageView, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionActionView centerXAnchor](v3, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateConstraints:", v13);

    -[SFCapsuleCollectionActionView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CapsuleCollectionActionView"));
    v14 = v3;
  }

  return v3;
}

- (void)setAction:(id)a3
{
  void *v5;
  UIAction *v6;

  v6 = (UIAction *)a3;
  if (self->_action != v6)
  {
    objc_storeStrong((id *)&self->_action, a3);
    -[UIAction image](v6, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v5);

  }
}

- (UIAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_contentEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
