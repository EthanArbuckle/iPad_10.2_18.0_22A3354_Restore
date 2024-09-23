@implementation MFBarButtonItem

- (MFBarButtonItem)initWithImage:(id)a3 disabledImage:(id)a4 style:(int64_t)a5 target:(id)a6 action:(SEL)a7
{
  id v13;
  id v14;
  MFBarButtonItem *v15;
  MFBarButtonItem *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MFBarButtonItem;
  v15 = -[MFBarButtonItem initWithImage:style:target:action:](&v18, sel_initWithImage_style_target_action_, v13, a5, a6, a7);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_enabledImage, a3);
    objc_storeStrong((id *)&v16->_disabledImage, a4);
  }

  return v16;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFBarButtonItem;
  -[MFBarButtonItem setEnabled:](&v7, sel_setEnabled_);
  -[MFBarButtonItem disabledImage](self, "disabledImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
      -[MFBarButtonItem enabledImage](self, "enabledImage");
    else
      -[MFBarButtonItem disabledImage](self, "disabledImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFBarButtonItem setImage:](self, "setImage:", v6);

  }
}

- (UIImage)enabledImage
{
  return self->_enabledImage;
}

- (void)setEnabledImage:(id)a3
{
  objc_storeStrong((id *)&self->_enabledImage, a3);
}

- (UIImage)disabledImage
{
  return self->_disabledImage;
}

- (void)setDisabledImage:(id)a3
{
  objc_storeStrong((id *)&self->_disabledImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledImage, 0);
  objc_storeStrong((id *)&self->_enabledImage, 0);
}

@end
