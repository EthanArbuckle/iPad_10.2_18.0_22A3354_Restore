@implementation AAUIProfilePhotoView

- (AAUIProfilePhotoView)initWithPhoto:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  AAUIProfilePhotoView *v10;
  void *v11;
  uint64_t v12;
  UIImageView *photoView;
  uint64_t v14;
  UIButton *editButton;
  UIButton *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AAUIProfilePhotoView;
  v10 = -[AAUIProfilePhotoView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIProfilePhotoView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    photoView = v10->_photoView;
    v10->_photoView = (UIImageView *)v12;

    -[AAUIProfilePhotoView addSubview:](v10, "addSubview:", v10->_photoView);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v14 = objc_claimAutoreleasedReturnValue();
    editButton = v10->_editButton;
    v10->_editButton = (UIButton *)v14;

    v16 = v10->_editButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("EDIT_PROFILE_PHOTO_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v16, "setTitle:forState:", v18, 0);

    -[UIButton addTarget:action:forControlEvents:](v10->_editButton, "addTarget:action:forControlEvents:", v9, a5, 64);
    v19 = v10->_editButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v19, "setTitleColor:forState:", v20, 0);

    if (v10->_isEditing)
      -[AAUIProfilePhotoView addSubview:](v10, "addSubview:", v10->_editButton);
  }

  return v10;
}

- (void)setEditing:(BOOL)a3
{
  if (self->_isEditing != a3)
  {
    self->_isEditing = a3;
    if (a3)
      -[AAUIProfilePhotoView addSubview:](self, "addSubview:", self->_editButton);
    else
      -[UIButton removeFromSuperview](self->_editButton, "removeFromSuperview");
    -[AAUIProfilePhotoView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AAUIProfilePhotoView;
  -[AAUIProfilePhotoView layoutSubviews](&v12, sel_layoutSubviews);
  -[UIImageView frame](self->_photoView, "frame");
  -[AAUIProfilePhotoView frame](self, "frame");
  v4 = v3;
  -[AAUIProfilePhotoView frame](self, "frame");
  v6 = v5;
  -[UIImageView setFrame:](self->_photoView, "setFrame:", 0.0, 0.0, v4, v5);
  if (self->_isEditing)
  {
    -[UIButton sizeToFit](self->_editButton, "sizeToFit");
    -[UIButton frame](self->_editButton, "frame");
    v8 = v7;
    v10 = v9;
    -[AAUIProfilePhotoView frame](self, "frame");
    -[UIButton setFrame:](self->_editButton, "setFrame:", ceil((v11 - v8) * 0.5), v6 + 0.0, v8, v10);
  }
}

- (double)desiredHeightForWidth:(double)result
{
  if (self->_isEditing)
    return result + 30.0;
  return result;
}

- (UIImage)photo
{
  return -[UIImageView image](self->_photoView, "image");
}

- (void)setPhoto:(id)a3
{
  -[UIImageView setImage:](self->_photoView, "setImage:", a3);
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
}

@end
