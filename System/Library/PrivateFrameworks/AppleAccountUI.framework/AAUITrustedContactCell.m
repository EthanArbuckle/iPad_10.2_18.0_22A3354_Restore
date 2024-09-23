@implementation AAUITrustedContactCell

- (AAUITrustedContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AAUITrustedContactCell *v4;
  AAUITrustedContactCell *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AAUITrustedContactCell;
  v4 = -[AAUITrustedContactCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAUITrustedContactCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[AAUITrustedContactCell imageView](v5, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 4);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUITrustedContactCell setBackgroundColor:](v5, "setBackgroundColor:", v7);

  }
  return v5;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)AAUITrustedContactCell;
  -[AAUITrustedContactCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v7, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
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
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
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
  v30 = *MEMORY[0x1E0DC1138];
  v31[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v12);

  objc_msgSend(v7, "setAttributedText:", v13);
  objc_msgSend(v5, "detailsText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    objc_msgSend(v5, "detailsText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v5, "handle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (objc_msgSend(v16, "length", self))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v11;
    v29[0] = v21;
    v29[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v22);
    objc_msgSend(v7, "setSecondaryAttributedText:", v23);

  }
  objc_msgSend(v6, "profilePictureForLocalContact:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "imageByPreparingThumbnailOfSize:", 40.0, 40.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v25);

  objc_msgSend(v27, "setContentConfiguration:", v7);
}

@end
