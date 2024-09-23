@implementation _MKRightImageButton

- (_MKRightImageButton)initWithFrame:(CGRect)a3
{
  _MKRightImageButton *v3;
  _MKUILabel *v4;
  _MKUILabel *titleLabel;
  id v6;
  uint64_t v7;
  UIImageView *imageView;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *titleOnlyConstraints;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *titleAndImageConstraints;
  objc_super v27;
  _QWORD v28[3];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)_MKRightImageButton;
  v3 = -[_MKRightImageButton initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_MKUILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[_MKUILabel setAdjustsFontSizeToFitWidth:](v3->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKRightImageButton addSubview:](v3, "addSubview:", v3->_titleLabel);
    v6 = objc_alloc(MEMORY[0x1E0CEA658]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](v3->_imageView, "setHidden:", 1);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[UIImageView leadingAnchor](v3->_imageView, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 4.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = 1148829696;
    objc_msgSend(v11, "setPriority:", v12);
    -[_MKUILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKRightImageButton trailingAnchor](v3, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    titleOnlyConstraints = v3->_titleOnlyConstraints;
    v3->_titleOnlyConstraints = (NSArray *)v16;

    v28[0] = v11;
    -[UIImageView centerYAnchor](v3->_imageView, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel centerYAnchor](v3->_titleLabel, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v20;
    -[UIImageView trailingAnchor](v3->_imageView, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKRightImageButton trailingAnchor](v3, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v24 = objc_claimAutoreleasedReturnValue();
    titleAndImageConstraints = v3->_titleAndImageConstraints;
    v3->_titleAndImageConstraints = (NSArray *)v24;

    -[_MKUILabel set_mapkit_themeColorProvider:](v3->_titleLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_54);
    -[UIView _mapkit_setNeedsUpdateConstraints](v3, "_mapkit_setNeedsUpdateConstraints");

  }
  return v3;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  UITapGestureRecognizer *gestureRecognizer;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *v11;
  id v12;

  v6 = a3;
  v7 = v6;
  gestureRecognizer = self->_gestureRecognizer;
  if (v6 && a4)
  {
    v12 = v6;
    if (!gestureRecognizer)
    {
      v9 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEAA88]);
      v10 = self->_gestureRecognizer;
      self->_gestureRecognizer = v9;

      -[_MKRightImageButton addGestureRecognizer:](self, "addGestureRecognizer:", self->_gestureRecognizer);
      v7 = v12;
      gestureRecognizer = self->_gestureRecognizer;
    }
    -[UITapGestureRecognizer addTarget:action:](gestureRecognizer, "addTarget:action:", v7, a4);
    goto LABEL_8;
  }
  if (gestureRecognizer)
  {
    v12 = v6;
    -[_MKRightImageButton removeGestureRecognizer:](self, "removeGestureRecognizer:");
    v11 = self->_gestureRecognizer;
    self->_gestureRecognizer = 0;

LABEL_8:
    v7 = v12;
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _MKUILabel *titleLabel;
  void *v4;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    titleLabel = self->_titleLabel;
    if (a3)
      v4 = &__block_literal_global_4;
    else
      v4 = &__block_literal_global_5_0;
    -[_MKUILabel set_mapkit_themeColorProvider:](titleLabel, "set_mapkit_themeColorProvider:", v4);
  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!self->_titleConstraintsAdded)
  {
    self->_titleConstraintsAdded = 1;
    v3 = (void *)MEMORY[0x1E0CB3718];
    -[_MKUILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKRightImageButton leadingAnchor](self, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    -[_MKUILabel centerYAnchor](self->_titleLabel, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKRightImageButton centerYAnchor](self, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activateConstraints:", v10);

  }
  v11 = -[UIImageView isHidden](self->_imageView, "isHidden");
  if (v11)
    v12 = 3;
  else
    v12 = 2;
  if (v11)
    v13 = 2;
  else
    v13 = 3;
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____MKRightImageButton__titleLabel[v12]));
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____MKRightImageButton__titleLabel[v13]));
  v14.receiver = self;
  v14.super_class = (Class)_MKRightImageButton;
  -[_MKRightImageButton updateConstraints](&v14, sel_updateConstraints);
}

- (NSString)title
{
  return (NSString *)-[_MKUILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[_MKUILabel setText:](self->_titleLabel, "setText:", a3);
  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:");
  -[UIImageView setHidden:](self->_imageView, "setHidden:", a3 == 0);
  -[_MKUILabel setText:](self->_titleLabel, "setText:", 0);
  if (-[UIImageView isHidden](self->_imageView, "isHidden"))
    -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
  else
    -[_MKRightImageButton addSubview:](self, "addSubview:", self->_imageView);
  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
}

- (id)viewForLastBaselineLayout
{
  return self->_titleLabel;
}

- (CGSize)intrinsicContentSize
{
  _MKUILabel *titleLabel;
  UIImageView *imageView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  titleLabel = self->_titleLabel;
  imageView = self->_imageView;
  if (!titleLabel)
    goto LABEL_9;
  if (!imageView)
  {
    imageView = (UIImageView *)titleLabel;
LABEL_9:
    -[UIImageView intrinsicContentSize](imageView, "intrinsicContentSize");
    goto LABEL_10;
  }
  -[_MKUILabel intrinsicContentSize](titleLabel, "intrinsicContentSize");
  v6 = v5;
  v8 = v7;
  -[UIImageView intrinsicContentSize](self->_imageView, "intrinsicContentSize");
  if (v6 > v9)
    v9 = v6;
  if (v8 > v10)
    v10 = v8;
LABEL_10:
  result.height = v10;
  result.width = v9;
  return result;
}

- (_MKUILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleAndImageConstraints, 0);
  objc_storeStrong((id *)&self->_titleOnlyConstraints, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end
