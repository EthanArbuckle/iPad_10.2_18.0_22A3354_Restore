@implementation CNMeCardSharingOnboardingHeaderViewController

- (CNMeCardSharingOnboardingHeaderViewController)initWithAvatarCarouselViewController:(id)a3 headerTitle:(id)a4 layoutAttributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNMeCardSharingOnboardingHeaderViewController *v12;
  CNMeCardSharingOnboardingHeaderViewController *v13;
  CNMeCardSharingOnboardingHeaderViewController *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNMeCardSharingOnboardingHeaderViewController;
  v12 = -[CNMeCardSharingOnboardingHeaderViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarCarouselController, a3);
    objc_storeStrong((id *)&v13->_headerTitle, a4);
    objc_storeStrong((id *)&v13->_layoutAttributes, a5);
    v14 = v13;
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  UILabel *v6;
  UILabel *headerLabel;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNMeCardSharingOnboardingHeaderViewController;
  -[CNMeCardSharingOnboardingHeaderViewController viewDidLoad](&v10, sel_viewDidLoad);
  if (self->_avatarCarouselController)
  {
    -[CNMeCardSharingOnboardingHeaderViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self->_avatarCarouselController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v4);

  }
  v5 = objc_alloc(MEMORY[0x1E0DC3990]);
  v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerLabel = self->_headerLabel;
  self->_headerLabel = v6;

  -[UILabel setNumberOfLines:](self->_headerLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_headerLabel, "setTextAlignment:", 1);
  -[CNMeCardSharingPickerLayoutAttributes headerFont](self->_layoutAttributes, "headerFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_headerLabel, "setFont:", v8);

  -[UILabel setAutoresizingMask:](self->_headerLabel, "setAutoresizingMask:", 2);
  -[UILabel setText:](self->_headerLabel, "setText:", self->_headerTitle);
  -[CNMeCardSharingOnboardingHeaderViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_headerLabel);

}

- (void)viewWillLayoutSubviews
{
  NSString *headerTitle;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double MaxY;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;
  uint64_t v23;
  _QWORD v24[2];
  CGRect v25;

  v24[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CNMeCardSharingOnboardingHeaderViewController;
  -[CNMeCardSharingOnboardingHeaderViewController viewWillLayoutSubviews](&v22, sel_viewWillLayoutSubviews);
  headerTitle = self->_headerTitle;
  -[CNMeCardSharingOnboardingHeaderViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5 + -40.0;
  v23 = *MEMORY[0x1E0DC1138];
  -[CNMeCardSharingPickerLayoutAttributes headerFont](self->_layoutAttributes, "headerFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString boundingRectWithSize:options:attributes:context:](headerTitle, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v6, 1.79769313e308);
  v10 = v9;

  -[CNMeCardSharingPickerLayoutAttributes topToAvatarPadding](self->_layoutAttributes, "topToAvatarPadding");
  v12 = v11;
  -[CNMeCardSharingOnboardingHeaderViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", 20.0, v12, v14 + -40.0, v10);

  -[UILabel frame](self->_headerLabel, "frame");
  MaxY = CGRectGetMaxY(v25);
  -[CNMeCardSharingPickerLayoutAttributes avatarViewToNamePadding](self->_layoutAttributes, "avatarViewToNamePadding");
  v17 = MaxY + v16;
  -[CNMeCardSharingOnboardingHeaderViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self->_avatarCarouselController, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", 0.0, v17, v20, 220.0);

}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (CNMeCardSharingOnboardingAvatarCarouselViewController)avatarCarouselController
{
  return self->_avatarCarouselController;
}

- (void)setAvatarCarouselController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarCarouselController, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_layoutAttributes, a3);
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_avatarCarouselController, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

+ (double)heightForHeaderWithContainerSize:(CGSize)a3 withTitle:(id)a4 layoutAttributes:(id)a5 hasAvatar:(BOOL)a6
{
  _BOOL4 v6;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v19;
  _QWORD v20[2];

  v6 = a6;
  width = a3.width;
  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v19 = *MEMORY[0x1E0DC1138];
  v10 = a4;
  objc_msgSend(v9, "headerFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, width + -40.0, 1.79769313e308);
  v14 = v13;

  objc_msgSend(v9, "topToAvatarPadding");
  v16 = v14 + v15 + 20.0;
  if (v6)
  {
    objc_msgSend(v9, "avatarViewToNamePadding");
    v16 = v16 + v17 + 220.0;
  }

  return v16;
}

@end
