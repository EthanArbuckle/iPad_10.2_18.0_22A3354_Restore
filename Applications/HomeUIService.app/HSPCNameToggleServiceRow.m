@implementation HSPCNameToggleServiceRow

+ (id)_reuseIdentifier
{
  return CFSTR("HSPCNameToggleServiceRow");
}

- (HSPCNameToggleServiceRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HSPCNameToggleServiceRow *v4;
  HSPCNameToggleServiceRow *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HSPCNameToggleServiceRow;
  v4 = -[HSPCNameServiceRow initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](v4, "leftView"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](v5, "leftView"));
      objc_msgSend(v7, "removeFromSuperview");

    }
    v8 = objc_alloc((Class)UIImageView);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle")));
    v10 = objc_msgSend(v8, "initWithImage:highlightedImage:", v9, 0);

    objc_msgSend(v10, "setUserInteractionEnabled:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameToggleServiceRow contentView](v5, "contentView"));
    objc_msgSend(v11, "addSubview:", v10);

    -[HSPCRow setLeftView:](v5, "setLeftView:", v10);
  }
  return v5;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HSPCNameToggleServiceRow;
  -[HSPCNameToggleServiceRow setSelected:](&v14, "setSelected:");
  v6 = objc_opt_class(UIImageView, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle.fill")));
    objc_msgSend(v9, "setImage:", v10);

    v11 = objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle")));
    objc_msgSend(v9, "setImage:", v12);

    v11 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  }
  v13 = (void *)v11;
  objc_msgSend(v9, "setTintColor:", v11);

}

- (void)setFrozen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
  objc_msgSend(v4, "setHidden:", v3);

}

@end
