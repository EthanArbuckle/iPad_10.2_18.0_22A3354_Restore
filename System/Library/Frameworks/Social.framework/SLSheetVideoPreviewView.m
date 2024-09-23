@implementation SLSheetVideoPreviewView

- (SLSheetVideoPreviewView)initWithFrame:(CGRect)a3
{
  SLSheetVideoPreviewView *v3;
  SLSheetVideoPreviewView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  UIView *infoBar;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIImageView *videoGlyphView;
  void *v23;
  uint64_t v24;
  UILabel *durationLabel;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SLSheetVideoPreviewView;
  v3 = -[SLSheetImagePreviewView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SLSheetVideoPreviewView intrinsicContentSize](v3, "intrinsicContentSize");
    v6 = v5;
    v8 = v7;
    -[SLSheetVideoPreviewView setBounds:](v4, "setBounds:", 0.0, 0.0, v5, v7);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", 0.0, 0.0, v6, v8);
    -[SLSheetImagePreviewView setImageView:](v4, "setImageView:", v9);

    -[SLSheetImagePreviewView imageView](v4, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentMode:", 2);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetImagePreviewView imageView](v4, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    -[SLSheetImagePreviewView imageView](v4, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetVideoPreviewView addSubview:](v4, "addSubview:", v13);

    v14 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    infoBar = v4->_infoBar;
    v4->_infoBar = (UIView *)v15;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.699999988);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_infoBar, "setBackgroundColor:", v17);

    v18 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "socialFrameworkImageNamed:", CFSTR("SLSheetVideoGlyph"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithRenderingMode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "initWithImage:", v20);
    videoGlyphView = v4->_videoGlyphView;
    v4->_videoGlyphView = (UIImageView *)v21;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4->_videoGlyphView, "setTintColor:", v23);

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", 0.0, 0.0, 40.0, 22.0);
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = (UILabel *)v24;

    v26 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_scaledValueForValue:", 12.0);
    objc_msgSend(v26, "systemFontOfSize:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_durationLabel, "setFont:", v28);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_durationLabel, "setTextColor:", v29);

    -[UIView addSubview:](v4->_infoBar, "addSubview:", v4->_videoGlyphView);
    -[UIView addSubview:](v4->_infoBar, "addSubview:", v4->_durationLabel);
    -[SLSheetVideoPreviewView addSubview:](v4, "addSubview:", v4->_infoBar);
    -[SLSheetVideoPreviewView _applyConstraints](v4, "_applyConstraints");
    -[SLSheetVideoPreviewView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  CGSize result;

  -[SLSheetVideoPreviewView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "verticalSizeClass") == 1)
  {

    v4 = 60.0;
    v5 = 89.0;
  }
  else
  {
    -[SLSheetVideoPreviewView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "horizontalSizeClass");

    v4 = 60.0;
    if (v7 != 1)
      v4 = 61.0;
    v5 = dbl_1BCDBBE40[v7 == 1];
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SLSheetVideoPreviewView;
  -[SLSheetImagePreviewView traitCollectionDidChange:](&v16, sel_traitCollectionDidChange_, v4);
  -[SLSheetVideoPreviewView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "verticalSizeClass") == 1)
  {
    v6 = 1;
  }
  else
  {
    -[SLSheetVideoPreviewView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "horizontalSizeClass") == 1;

  }
  v8 = objc_msgSend(v4, "verticalSizeClass") == 1 || objc_msgSend(v4, "horizontalSizeClass") == 1;
  if (v6 != v8)
    -[SLSheetVideoPreviewView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[SLSheetVideoPreviewView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_scaledValueForValue:", 12.0);
    objc_msgSend(v13, "systemFontOfSize:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_durationLabel, "setFont:", v15);

  }
}

- (void)setVideoDuration:(double)a3
{
  signed int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (a3 > 86400.0 || a3 < 0.0)
  {
    -[UILabel setText:](self->_durationLabel, "setText:", &stru_1E7592238);
  }
  else
  {
    v4 = llround(a3);
    v5 = (int)(((__int16)((34953 * (v4 % 3600)) >> 16) >> 5)
             + (((v4 % 3600 + ((-30583 * (v4 % 3600)) >> 16)) & 0x8000) >> 15));
    v6 = (__int16)(v4 % 3600
                 - 60
                 * (((__int16)((34953 * (v4 % 3600)) >> 16) >> 5)
                  + (((v4 % 3600 + ((-30583 * (v4 % 3600)) >> 16)) & 0x8000) >> 15)));
    if ((v4 + 3599) > 0x1C1E)
    {
      v10 = v4 / 3600;
      v11 = (void *)MEMORY[0x1E0CB3940];
      SLSocialFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHEET_PREVIEW_VIDEO_DURATION_LONG"), &stru_1E7592238, CFSTR("Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v9, v10, v5, v6);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      SLSocialFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHEET_PREVIEW_VIDEO_DURATION_SHORT"), &stru_1E7592238, CFSTR("Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v9, v5, v6, v12);
    }
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](self->_durationLabel, "setText:", v13);
    -[UILabel invalidateIntrinsicContentSize](self->_durationLabel, "invalidateIntrinsicContentSize");

  }
}

- (void)_applyConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *infoBar;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  UIView *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_videoGlyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_durationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_infoBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_videoGlyphView, 1, 0, self->_infoBar, 1, 1.0, 6.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_durationLabel, 2, 0, self->_infoBar, 2, 1.0, -6.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_videoGlyphView, 10, 0, self->_infoBar, 10, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_durationLabel, 10, 0, self->_infoBar, 10, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[UIView addConstraints:](self->_infoBar, "addConstraints:", v3);
  v8 = (void *)objc_opt_new();
  v9 = (void *)MEMORY[0x1E0CB3718];
  infoBar = self->_infoBar;
  v19 = CFSTR("infoBar");
  v20[0] = infoBar;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[infoBar]|"), 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  v14 = self->_infoBar;
  v17 = CFSTR("infoBar");
  v18 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[infoBar(==22@999)]|"), 0, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v16);

  -[SLSheetVideoPreviewView addConstraints:](self, "addConstraints:", v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_videoGlyphView, 0);
  objc_storeStrong((id *)&self->_infoBar, 0);
}

@end
