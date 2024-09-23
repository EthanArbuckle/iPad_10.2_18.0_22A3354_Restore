@implementation AAUISuggestedContactCell

- (AAUISuggestedContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AAUISuggestedContactCell *v4;
  uint64_t v5;
  UIImageView *accessoryImageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AAUISuggestedContactCell;
  v4 = -[AAUISuggestedContactCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = (UIImageView *)v5;

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v4->_accessoryImageView, "setImage:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4->_accessoryImageView, "setTintColor:", v8);

    -[UIImageView setContentMode:](v4->_accessoryImageView, "setContentMode:", 1);
    -[AAUISuggestedContactCell setAccessoryView:](v4, "setAccessoryView:", v4->_accessoryImageView);
    -[AAUISuggestedContactCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[AAUISuggestedContactCell imageView](v4, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentMode:", 4);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISuggestedContactCell setBackgroundColor:](v4, "setBackgroundColor:", v10);

  }
  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)AAUISuggestedContactCell;
  -[AAUISuggestedContactCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v7, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  if (v6 < 58.0)
    v6 = 58.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)updateWithContact:(id)a3 pictureStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC1448]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v5, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC1138];
  v28 = *MEMORY[0x1E0DC1138];
  v29[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v12);

  objc_msgSend(v7, "setAttributedText:", v13);
  objc_msgSend(v5, "detailsText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v11;
    v27[0] = v17;
    v27[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v5, "detailsText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v18);

    objc_msgSend(v7, "setSecondaryAttributedText:", v21);
  }
  objc_msgSend(v6, "profilePictureForLocalContact:", v5, self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageByPreparingThumbnailOfSize:", 40.0, 40.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v23);

  objc_msgSend(v25, "setContentConfiguration:", v7);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  UIImageView **p_accessoryImageView;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AAUISuggestedContactCell;
  -[AAUISuggestedContactCell setSelected:animated:](&v10, sel_setSelected_animated_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_accessoryImageView = &self->_accessoryImageView;
    -[UIImageView setImage:](self->_accessoryImageView, "setImage:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    p_accessoryImageView = &self->_accessoryImageView;
    -[UIImageView setImage:](self->_accessoryImageView, "setImage:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](*p_accessoryImageView, "setTintColor:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
}

@end
