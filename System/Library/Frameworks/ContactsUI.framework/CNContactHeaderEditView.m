@implementation CNContactHeaderEditView

- (CNContactHeaderEditView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowTakePhotoAction:(BOOL)a5 showingNavBar:(BOOL)a6 monogramOnly:(BOOL)a7 isOutOfProcess:(BOOL)a8 delegate:(id)a9
{
  return -[CNContactHeaderEditView initWithContact:frame:shouldAllowTakePhotoAction:delegate:showingNavBar:monogramOnly:isOutOfProcess:](self, "initWithContact:frame:shouldAllowTakePhotoAction:delegate:showingNavBar:monogramOnly:isOutOfProcess:", a3, a5, a9, a6, a7, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (CNContactHeaderEditView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowTakePhotoAction:(BOOL)a5 delegate:(id)a6 showingNavBar:(BOOL)a7 monogramOnly:(BOOL)a8 isOutOfProcess:(BOOL)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v13;
  double height;
  double width;
  double y;
  double x;
  id v19;
  CNContactHeaderEditView *v20;
  CNContactHeaderEditView *v21;
  void *v22;
  uint64_t v23;
  CNSensitiveContentAnalysisManager *sensitiveContentManager;
  uint64_t v25;
  CNMutableContact *editingWallpaperContact;
  CNContactHeaderEditView *v27;
  objc_super v29;

  v10 = a8;
  v11 = a7;
  v13 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNContactHeaderEditView;
  v20 = -[CNContactHeaderView initWithContact:frame:shouldAllowTakePhotoAction:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](&v29, sel_initWithContact_frame_shouldAllowTakePhotoAction_shouldAllowImageDrops_showingNavBar_monogramOnly_delegate_, v19, v13, 1, v11, v10, a6, x, y, width, height);
  v21 = v20;
  if (v20)
  {
    -[CNContactHeaderView photoView](v20, "photoView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEditing:", 1);

    v21->_allowsEditPhoto = 1;
    v21->_isOutOfProcess = a9;
    +[CNSensitiveContentAnalysisManager defaultManager](CNSensitiveContentAnalysisManager, "defaultManager");
    v23 = objc_claimAutoreleasedReturnValue();
    sensitiveContentManager = v21->_sensitiveContentManager;
    v21->_sensitiveContentManager = (CNSensitiveContentAnalysisManager *)v23;

    -[CNContactHeaderEditView setUpEditButton](v21, "setUpEditButton");
    if (-[CNContactHeaderEditView shouldUseStaticHeader](v21, "shouldUseStaticHeader"))
    {
      v25 = objc_msgSend(v19, "mutableCopy");
      editingWallpaperContact = v21->_editingWallpaperContact;
      v21->_editingWallpaperContact = (CNMutableContact *)v25;

      -[CNContactHeaderEditView setUpPosterView](v21, "setUpPosterView");
    }
    v27 = v21;
  }

  return v21;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderEditView;
  -[CNContactHeaderView reloadDataPreservingChanges:](&v7, sel_reloadDataPreservingChanges_);
  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    if (!a3)
    {
      -[CNContactHeaderEditView mutableContact](self, "mutableContact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");
      -[CNContactHeaderEditView setEditingWallpaperContact:](self, "setEditingWallpaperContact:", v6);

    }
    -[CNContactHeaderEditView updatePosterViewImage](self, "updatePosterViewImage");
    -[CNContactHeaderEditView updatePosterVisibility](self, "updatePosterVisibility");
  }
}

- (void)setUpEditButton
{
  void *v3;
  void *v4;
  void *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *editButton;

  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCornerStyle:", 4);
    objc_msgSend(v3, "setContentInsets:", 8.0, 24.0, 8.0, 24.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBaseForegroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBaseBackgroundColor:", v5);

    objc_msgSend(v3, "setTitleTextAttributesTransformer:", &__block_literal_global_784);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v3, 0);
    v6 = (UIButton *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v6, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 3);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v6, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    -[UIButton titleLabel](v6, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

    -[UIButton setPointerInteractionEnabled:](v6, "setPointerInteractionEnabled:", 1);
  }
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel_editButtonTapped, 64);
  -[CNContactHeaderEditView addSubview:](self, "addSubview:", v6);
  editButton = self->_editButton;
  self->_editButton = v6;

}

- (void)setUpPosterView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _TtC10ContactsUI32CNHostingPosterSnapshotImageView *v8;

  v8 = objc_alloc_init(_TtC10ContactsUI32CNHostingPosterSnapshotImageView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_editPoster);
  -[CNHostingPosterSnapshotImageView view](v8, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  -[CNHostingPosterSnapshotImageView view](v8, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  -[CNHostingPosterSnapshotImageView view](v8, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[CNHostingPosterSnapshotImageView view](v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderEditView addSubview:](self, "addSubview:", v7);

  -[CNContactHeaderEditView setEditingPosterView:](self, "setEditingPosterView:", v8);
}

- (id)posterPlaceholderImage
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  void *v8;
  CGSize v10;
  CGRect v11;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v10.width = v4;
  v10.height = v6;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFill");

  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = v4;
  v11.size.height = v6;
  UIRectFill(v11);
  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v8;
}

- (void)didFinishUsing
{
  if ((CNContactHeaderEditView *)sEditingContactHeaderView == self)
  {
    sEditingContactHeaderView = 0;

  }
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
  -[CNContactHeaderEditView setAllowsEditPhoto:preservingChanges:](self, "setAllowsEditPhoto:preservingChanges:", a3, 0);
}

- (void)setAllowsEditPhoto:(BOOL)a3 preservingChanges:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  if (self->_allowsEditPhoto != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_allowsEditPhoto = a3;
    -[CNContactHeaderView photoView](self, "photoView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditing:preservingChanges:", v5, v4);

    -[CNContactHeaderEditView editButton](self, "editButton");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v5 ^ 1);

  }
}

- (BOOL)shouldShowPoster
{
  int v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[CNContactHeaderView showMonogramsOnly](self, "showMonogramsOnly")
    || !-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader")
    || -[CNContactHeaderView isPad](self, "isPad"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[CNContactHeaderView contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      v6 = *MEMORY[0x1E0D13818];
      -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "wallpaper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "posterArchiveData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v9) ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (BOOL)shouldUseStaticHeader
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFeatureEnabled:", 16);

  return v4;
}

- (double)minHeight
{
  double result;
  objc_super v4;

  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactHeaderEditView staticEditingHeaderHeight](self, "staticEditingHeaderHeight");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CNContactHeaderEditView;
    -[CNContactHeaderView minHeight](&v4, sel_minHeight);
  }
  return result;
}

- (double)maxHeight
{
  double result;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactHeaderEditView staticEditingHeaderHeight](self, "staticEditingHeaderHeight");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNContactHeaderEditView;
    -[CNContactHeaderView maxHeight](&v7, sel_maxHeight);
    v5 = v4;
    -[CNContactHeaderEditView maxButtonSize](self, "maxButtonSize");
    return v5 + v6;
  }
  return result;
}

- (double)defaultMaxHeight
{
  double result;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactHeaderEditView staticEditingHeaderHeight](self, "staticEditingHeaderHeight");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNContactHeaderEditView;
    -[CNContactHeaderView defaultMaxHeight](&v7, sel_defaultMaxHeight);
    v5 = v4;
    -[CNContactHeaderEditView maxButtonSize](self, "maxButtonSize");
    return v5 + v6;
  }
  return result;
}

- (double)staticEditingHeaderHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  char v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  -[CNContactHeaderEditView maxButtonSize](self, "maxButtonSize");
  if (v3 == 0.0)
    -[CNContactHeaderEditView calculateLabelSizesIfNeeded](self, "calculateLabelSizesIfNeeded");
  -[CNContactHeaderEditView staticHeaderPhotoTopMargin](self, "staticHeaderPhotoTopMargin");
  v5 = v4;
  -[CNContactHeaderEditView staticHeaderPhotoHeight](self, "staticHeaderPhotoHeight");
  v7 = v5 + v6;
  -[CNContactHeaderEditView editButton](self, "editButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHidden");

  if ((v9 & 1) == 0)
  {
    -[CNContactHeaderEditView maxButtonSize](self, "maxButtonSize");
    v7 = v7 + v10 + 12.0 + 16.0;
  }
  v11 = -[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster");
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "posterMaxHeight");
    v15 = v14 + 16.0;
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "photoMinBottomMargin");
    v18 = v15 + v17;

  }
  else
  {
    objc_msgSend(v12, "photoMaxBottomMargin");
    v18 = v19;
  }

  return v7 + v18;
}

- (double)staticHeaderPhotoTopMarginOffset
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[CNContactHeaderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBarHeight");
  v5 = v4;

  -[CNContactHeaderView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerViewSafeAreaInsets");
  v8 = v7;

  return v5 + v8;
}

- (double)staticHeaderPhotoTopMargin
{
  double result;

  if (-[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster"))
    -[CNContactHeaderEditView staticHeaderPhotoAvatarAndPosterTopMargin](self, "staticHeaderPhotoAvatarAndPosterTopMargin");
  else
    -[CNContactHeaderEditView staticHeaderPhotoAvatarOnlyTopMargin](self, "staticHeaderPhotoAvatarOnlyTopMargin");
  return result;
}

- (double)staticHeaderPhotoAvatarAndPosterTopMargin
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[CNContactHeaderEditView staticHeaderPhotoTopMarginOffset](self, "staticHeaderPhotoTopMarginOffset");
  v4 = v3;
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoMinTopMargin");
  v7 = v6;

  return v4 + v7;
}

- (double)staticHeaderPhotoAvatarOnlyTopMargin
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[CNContactHeaderEditView staticHeaderPhotoTopMarginOffset](self, "staticHeaderPhotoTopMarginOffset");
  v4 = v3;
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoMaxTopMargin");
  v7 = v6;

  return v4 + v7;
}

- (void)calculateLabelSizesIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderEditView;
  -[CNContactHeaderView calculateLabelSizesIfNeeded](&v3, sel_calculateLabelSizesIfNeeded);
  -[CNContactHeaderEditView updateFontSizes](self, "updateFontSizes");
}

- (void)updateFontSizes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNContactHeaderEditView;
  -[CNContactHeaderView updateFontSizes](&v14, sel_updateFontSizes);
  -[CNContactHeaderView photoView](self, "photoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateFontSizes");

  if (-[CNContactHeaderView needsLabelSizeCalculation](self, "needsLabelSizeCalculation"))
  {
    -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 0);
    if (!-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)sCurrentTaglineFont;
      sCurrentTaglineFont = v4;

      objc_msgSend((id)sCurrentTaglineFont, "_scaledValueForValue:", 16.0);
      objc_msgSend((id)sCurrentTaglineFont, "fontWithSize:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderEditView editButton](self, "editButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFont:", v6);

    }
    -[CNContactHeaderEditView editButton](self, "editButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView bounds](self, "bounds");
    objc_msgSend(v10, "sizeThatFits:", v11, v12);
    -[CNContactHeaderEditView setMaxButtonSize:](self, "setMaxButtonSize:");

    -[CNContactHeaderView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "headerViewDidUpdateLabelSizes");

  }
}

- (void)updatePosterVisibility
{
  int v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster");
  -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v3 == v6)
  {
    v7 = -[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster") ^ 1;
    -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v7);

    -[CNContactHeaderView delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "headerViewDidChangeHeight:", self);

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
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  _QWORD *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  objc_super v73;
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[6];

  v77[4] = *MEMORY[0x1E0C80C00];
  v73.receiver = self;
  v73.super_class = (Class)CNContactHeaderEditView;
  -[CNContactHeaderView updateConstraints](&v73, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CNContactHeaderView activatedConstraints](self, "activatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderView photoView](self, "photoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderEditView centerXAnchor](self, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v5;
  objc_msgSend(v5, "addObject:", v9);

  if (-[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster"))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;

    if (v12 / v15 >= v15 / v12)
      v16 = v12 / v15;
    else
      v16 = v15 / v12;
    -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView photoView](self, "photoView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 16.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v62;
    -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "view");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "centerXAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView centerXAnchor](self, "centerXAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v57;
    -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "posterMaxHeight");
    objc_msgSend(v17, "constraintEqualToConstant:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v19;
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 8, 0, v24, 7, v16, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addObjectsFromArray:", v26);

  }
  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactHeaderEditView staticHeaderPhotoTopMargin](self, "staticHeaderPhotoTopMargin");
    v28 = v27;
    -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setConstant:", v28);

    -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = 1148846080;
    objc_msgSend(v30, "setPriority:", v31);

    -[CNContactHeaderEditView staticHeaderPhotoHeight](self, "staticHeaderPhotoHeight");
    v33 = v32;
    -[CNContactHeaderView photoHeightConstraint](self, "photoHeightConstraint");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setConstant:", v33);

  }
  if (-[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster"))
  {
    -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNContactHeaderView photoView](self, "photoView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v37 = -[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader");
  -[CNContactHeaderEditView editButton](self, "editButton");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderEditView leadingAnchor](self, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v40;
    -[CNContactHeaderEditView editButton](self, "editButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView trailingAnchor](self, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v44;
    v45 = 12.0;
    v46 = v76;
  }
  else
  {
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v40;
    -[CNContactHeaderEditView editButton](self, "editButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView trailingAnchor](self, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v44;
    v45 = 0.0;
    v46 = v75;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addObjectsFromArray:", v47);

  -[CNContactHeaderEditView editButton](self, "editButton");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "centerXAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView photoView](self, "photoView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v50;
  -[CNContactHeaderEditView editButton](self, "editButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v71, v45);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addObjectsFromArray:", v54);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v72);
  -[CNContactHeaderView setActivatedConstraints:](self, "setActivatedConstraints:", v72);

}

- (double)staticHeaderPhotoHeight
{
  double v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v3 = 0.0;
  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    v4 = -[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster");
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "photoMinHeight");
    else
      objc_msgSend(v5, "photoMaxHeight");
    v3 = v7;

    if (-[CNContactHeaderView isPhotoLowQuality](self, "isPhotoLowQuality"))
    {
      -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "photoMaxHeightLowQuality");
      v10 = v9;

      if (v3 >= v10)
        return v10;
    }
  }
  return v3;
}

- (void)updateSizeDependentAttributes
{
  double v3;
  long double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  if (!-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    v12.receiver = self;
    v12.super_class = (Class)CNContactHeaderEditView;
    -[CNContactHeaderView updateSizeDependentAttributes](&v12, sel_updateSizeDependentAttributes);
    -[CNContactHeaderEditView bounds](self, "bounds");
    if (v3 > 0.0)
    {
      -[CNContactHeaderView currentHeightPercentMaximized](self, "currentHeightPercentMaximized");
      v5 = v4;
      v6 = pow(v4, 3.0);
      -[CNContactHeaderEditView editButton](self, "editButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", v6);

      objc_msgSend((id)sCurrentTaglineFont, "_scaledValueForValue:", 16.0);
      objc_msgSend((id)sCurrentTaglineFont, "fontWithSize:", v5 * v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderEditView editButton](self, "editButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFont:", v9);

    }
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNContactHeaderEditView;
  -[CNContactHeaderView layoutSubviews](&v11, sel_layoutSubviews);
  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactHeaderEditView staticHeaderPhotoTopMargin](self, "staticHeaderPhotoTopMargin");
    v4 = v3;
    -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constant");
    v7 = v6;

    if (v7 != v4)
    {
      -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setConstant:", v4);

    }
    if (self->_needsPosterCarouselPreWarming)
    {
      self->_needsPosterCarouselPreWarming = 0;
      CNUILogPosters();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "Pre-warming carousel poster snapshot", v10, 2u);
      }

      -[CNContactHeaderEditView preWarmPosterAndAvatarEditor](self, "preWarmPosterAndAvatarEditor");
    }
  }
}

- (void)updateWithContacts:(id)a3
{
  id v4;
  void *v5;
  CNMutableContact *v6;
  CNMutableContact *editingWallpaperContact;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNContactHeaderEditView;
  -[CNContactHeaderView updateWithContacts:](&v8, sel_updateWithContacts_, v4);
  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader") && objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CNMutableContact *)objc_msgSend(v5, "mutableCopy");
    editingWallpaperContact = self->_editingWallpaperContact;
    self->_editingWallpaperContact = v6;

    -[CNContactHeaderEditView updatePosterViewImageWithNewPosterConfiguration:](self, "updatePosterViewImageWithNewPosterConfiguration:", 1);
  }
  -[CNContactHeaderEditView updateEditButtonTitle](self, "updateEditButtonTitle");

}

- (void)setPresenterDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactHeaderEditView;
  v4 = a3;
  -[CNContactHeaderView setPresenterDelegate:](&v5, sel_setPresenterDelegate_, v4);
  -[CNSNaPSetupFlowManager setPresenterDelegate:](self->_flowManager, "setPresenterDelegate:", v4, v5.receiver, v5.super_class);

}

- (void)updatePosterViewImage
{
  -[CNContactHeaderEditView updatePosterViewImageWithNewPosterConfiguration:](self, "updatePosterViewImageWithNewPosterConfiguration:", 0);
}

- (void)updatePosterViewImageWithNewPosterConfiguration:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNPRSPosterConfiguration *v19;
  id v20;
  CNPRSPosterConfiguration *cachedPosterConfiguration;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  CNPRUISPosterSnapshotController *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  CNPRUISIncomingCallPosterContext *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!-[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster"))
  {
    -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setImage:", 0);

    return;
  }
  -[CNContactHeaderEditView posterPlaceholderImage](self, "posterPlaceholderImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  -[CNMutableContact wallpaper](self->_editingWallpaperContact, "wallpaper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posterArchiveData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13818] + 16))();

  if ((v9 & 1) != 0)
    return;
  -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wallpaper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "contentIsSensitive");

  -[CNContactHeaderEditView sensitiveContentManager](self, "sensitiveContentManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldShowUIForPosterWithSensitiveContent:forContact:", v12, v10);

  -[CNContactHeaderEditView editingPosterView](self, "editingPosterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIsSensitiveContent:", v14);

  self->_needsPosterCarouselPreWarming = 1;
  if (a3
    || (-[CNContactHeaderEditView cachedPosterConfiguration](self, "cachedPosterConfiguration"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        !v16))
  {
    -[CNMutableContact wallpaper](self->_editingWallpaperContact, "wallpaper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "posterArchiveData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", v18, &v46);
    v19 = (CNPRSPosterConfiguration *)objc_claimAutoreleasedReturnValue();
    v20 = v46;
    cachedPosterConfiguration = self->_cachedPosterConfiguration;
    self->_cachedPosterConfiguration = v19;

    if (!self->_cachedPosterConfiguration)
    {
      CNUILogPosters();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v20, "localizedDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v36;
        _os_log_error_impl(&dword_18AC56000, v22, OS_LOG_TYPE_ERROR, "Unable to unarchive poster configuration from data, %@", buf, 0xCu);

      }
    }

  }
  -[CNContactHeaderEditView cachedPosterConfiguration](self, "cachedPosterConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v38 = -[CNPRUISIncomingCallPosterContext initWithContact:showName:]([CNPRUISIncomingCallPosterContext alloc], "initWithContact:showName:", self->_editingWallpaperContact, 0);
    +[CNPRUISIncomingCallSnapshotDefinition contentsOnlySnapshotDefinitionWithContext:attachmentIdentifiers:](CNPRUISIncomingCallSnapshotDefinition, "contentsOnlySnapshotDefinitionWithContext:attachmentIdentifiers:", v38, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPRUISPosterSnapshotRequest requestForConfiguration:definition:interfaceOrientation:](CNPRUISPosterSnapshotRequest, "requestForConfiguration:definition:interfaceOrientation:", v23, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init(CNPRUISPosterSnapshotController);
    v45 = 0;
    -[CNPRUISPosterSnapshotController latestSnapshotBundleForRequest:error:](v26, "latestSnapshotBundleForRequest:error:", v25, &v45);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v45;
    if (v27)
    {
      objc_msgSend(v24, "levelSets", v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "snapshotForLevelSet:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      CNUILogPosters();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18AC56000, v31, OS_LOG_TYPE_DEBUG, "Returning cached snapshot", buf, 2u);
      }

      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke;
        v43[3] = &unk_1E2050400;
        v43[4] = self;
        v44 = v30;
        v33 = v30;
        objc_msgSend(v32, "performBlock:", v43);

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
      CNUILogPosters();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v34, OS_LOG_TYPE_DEFAULT, "No snapshot found in cache", buf, 2u);
      }

    }
    CNUILogPosters();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v35, OS_LOG_TYPE_DEFAULT, "Requesting poster snapshot", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke_792;
    v40[3] = &unk_1E20491E0;
    objc_copyWeak(&v42, (id *)buf);
    v41 = v24;
    -[CNPRUISPosterSnapshotController executeSnapshotRequest:completion:](v26, "executeSnapshotRequest:completion:", v25, v40);

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);
    goto LABEL_23;
  }
LABEL_24:

}

- (void)updateEditButtonTitle
{
  BOOL v3;
  void *v4;
  const __CFString *v5;
  BOOL v6;
  void *v7;
  id v8;

  if (!-[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster"))
  {
    v6 = -[CNContactHeaderEditView hasPhoto](self, "hasPhoto");
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v5 = CFSTR("PHOTO_ADD_LABEL");
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v3 = -[CNContactHeaderEditView hasWallpaper](self, "hasWallpaper");
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_5:
    v5 = CFSTR("PHOTO_EDIT_LABEL");
    goto LABEL_7;
  }
  v5 = CFSTR("WALLPAPER_ADD_LABEL");
LABEL_7:
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1E20507A8, CFSTR("Localized"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderEditView editButton](self, "editButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

}

- (BOOL)hasPhoto
{
  void *v2;
  char v3;

  -[CNContactHeaderView photoView](self, "photoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPhoto");

  return v3;
}

- (BOOL)hasWallpaper
{
  void *v2;
  BOOL v3;

  -[CNMutableContact wallpaper](self->_editingWallpaperContact, "wallpaper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)photoIsModified
{
  void *v2;
  char v3;

  -[CNContactHeaderView photoView](self, "photoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "modified");

  return v3;
}

- (BOOL)wallpaperIsModified
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactHeaderEditView mutableContact](self, "mutableContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wallpaper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (-[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "wallpaper"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CNContactHeaderEditView mutableContact](self, "mutableContact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "wallpaper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "wallpaper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isEqual:", v10) ^ 1;

      if (v6)
      {
LABEL_9:

        return v11;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }

    goto LABEL_9;
  }
  LOBYTE(v11) = 0;
  return v11;
}

- (id)mutableContact
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[CNContactHeaderView contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)saveContactPhoto
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[CNContactHeaderEditView wallpaperIsModified](self, "wallpaperIsModified"))
    goto LABEL_7;
  CNUILogContactCard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Contact wallpaper modified, will save edits", (uint8_t *)&v21, 2u);
  }

  -[CNContactHeaderEditView mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedPhotoDisplayPreference:", 2);

  v5 = (void *)MEMORY[0x1E0C97240];
  -[CNContactHeaderEditView mutableContact](self, "mutableContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateMutableContact:withWallpaperPropertiesFromContact:", v6, self->_editingWallpaperContact);

  CNUILogContactCard();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[CNMutableContact wallpaper](self->_editingWallpaperContact, "wallpaper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "posterArchiveData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");
    -[CNMutableContact watchWallpaperImageData](self->_editingWallpaperContact, "watchWallpaperImageData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");
    v21 = 134218240;
    v22 = v18;
    v23 = 2048;
    v24 = v20;
    _os_log_debug_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEBUG, "[Likeness Update] Wallpaper updated to archive data of length %ld, watch snapshot of length %ld", (uint8_t *)&v21, 0x16u);

  }
  v8 = *MEMORY[0x1E0D13818];
  -[CNMutableContact imageData](self->_editingWallpaperContact, "imageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if ((v8 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0C97240];
    -[CNContactHeaderEditView mutableContact](self, "mutableContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateMutableContact:withImagePropertiesFromContact:", v14, self->_editingWallpaperContact);
  }
  else
  {
LABEL_7:
    -[CNContactHeaderView photoView](self, "photoView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "modified");

    if (!v11)
      return;
    CNUILogContactCard();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Contact image modified, will save edits", (uint8_t *)&v21, 2u);
    }

    -[CNContactHeaderView photoView](self, "photoView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveEdits");

    -[CNContactHeaderEditView mutableContact](self, "mutableContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSharedPhotoDisplayPreference:", 2);
  }

}

- (void)presentAvatarPickerWithImageData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactHeaderView photoView](self, "photoView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentPhotoPickerWithImageData:", v4);

}

- (void)updateContactWithEditedPropertyItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactHeaderEditView updatePendingWallpaperContactWithEditedPropertyItem:](self, "updatePendingWallpaperContactWithEditedPropertyItem:", v4);
  -[CNContactHeaderView photoView](self, "photoView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePendingContactWithEditedPropertyItem:", v4);

}

- (void)updatePendingWallpaperContactWithEditedPropertyItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C966D0]);
  v7 = (uint64_t *)MEMORY[0x1E0C967C0];
  if ((v6 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v4, "property");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966C0]) & 1) != 0)
  {
LABEL_7:

LABEL_8:
    v11 = *v7;
    goto LABEL_9;
  }
  objc_msgSend(v4, "property");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v4, "property");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *v7;
  if ((objc_msgSend(v10, "isEqualToString:", *v7) & 1) != 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v4, "property");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0C967B8]);

  if ((v23 & 1) == 0)
    goto LABEL_20;
LABEL_9:
  objc_msgSend(v4, "property");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", v11) & 1) == 0)
  {

LABEL_13:
    objc_msgSend(v4, "property");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0)
    {
      objc_msgSend(v4, "labeledValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "labeledValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v15;
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = &v24;
        goto LABEL_16;
      }
    }
    else
    {

    }
    -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editingStringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "property");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v15, v20);
    goto LABEL_19;
  }
  objc_msgSend(v4, "labeledValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_13;
  -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labeledValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v16 = (void *)MEMORY[0x1E0C99D20];
  v17 = (void **)v25;
LABEL_16:
  objc_msgSend(v16, "arrayWithObjects:count:", v17, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "property");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v20, v21);

LABEL_19:
LABEL_20:

}

- (void)editButtonTapped
{
  -[CNContactHeaderEditView editButtonTappedWhileEditing:](self, "editButtonTappedWhileEditing:", 1);
}

- (void)editButtonTappedWhileEditing:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CNContactHeaderEditView shouldShowPoster](self, "shouldShowPoster")
    || -[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactHeaderEditView presentPosterAndAvatarEditorWithMode:isEditing:](self, "presentPosterAndAvatarEditorWithMode:isEditing:", 1, v3);
  }
  else
  {
    -[CNContactHeaderEditView editAvatar](self, "editAvatar");
  }
}

- (void)editAvatar
{
  id v2;

  -[CNContactHeaderView photoView](self, "photoView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentPhotoPicker");

}

- (void)editPoster
{
  if (-[CNContactHeaderEditView allowsEditPhoto](self, "allowsEditPhoto"))
    -[CNContactHeaderEditView presentPosterAndAvatarEditorWithMode:isEditing:](self, "presentPosterAndAvatarEditorWithMode:isEditing:", 1, 1);
}

- (void)presentPosterAndAvatarEditorWithMode:(int64_t)a3 isEditing:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  CNSNaPSetupFlowManager *v10;
  void *v11;
  CNSNaPSetupFlowManager *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a4;
  if (-[CNContactHeaderEditView isOutOfProcess](self, "isOutOfProcess")
    && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "userInterfaceIdiom"),
        v7,
        (v8 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    -[CNContactHeaderEditView _presentRemotePosterAndAvatarEditorWithMode:isEditing:](self, "_presentRemotePosterAndAvatarEditorWithMode:isEditing:", a3, v4);
  }
  else
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inProcessContactStore");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v10 = [CNSNaPSetupFlowManager alloc];
    -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNSNaPSetupFlowManager initWithPresenterDelegate:contactStore:mode:](v10, "initWithPresenterDelegate:contactStore:mode:", v11, v16, a3);
    -[CNContactHeaderEditView setFlowManager:](self, "setFlowManager:", v12);

    -[CNContactHeaderEditView flowManager](self, "flowManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    -[CNContactHeaderEditView flowManager](self, "flowManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startContactCardFlowForContact:isEditing:", v15, v4);

  }
}

- (void)preWarmPosterAndAvatarEditor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *v11;
  void *v12;
  id v13;

  -[CNContactHeaderEditView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1 && v13 != 0)
  {
    -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nicknameProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nicknameAsContactForContact:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[CNAvatarPosterPairCollectionPreWarmer initWithContact:contactForSharedProfile:]([_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer alloc], "initWithContact:contactForSharedProfile:", v7, v10);
    -[CNContactHeaderEditView setCarouselPreWarmer:](self, "setCarouselPreWarmer:", v11);

    -[CNContactHeaderEditView carouselPreWarmer](self, "carouselPreWarmer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preWarmFirstPosterSnapshotIn:", v13);

  }
}

- (void)_presentRemotePosterAndAvatarEditorWithMode:(int64_t)a3 isEditing:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[3];
  _QWORD v27[3];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.ContactsUI.Carousel"), CFSTR("CNContactPhotoCarouselRemoteAlertViewController"));
  v8 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  v9 = objc_alloc(MEMORY[0x1E0D01698]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__CNContactHeaderEditView__presentRemotePosterAndAvatarEditorWithMode_isEditing___block_invoke;
  v25[3] = &unk_1E2049208;
  v25[4] = self;
  objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithInfo:responder:", 0, v10);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActions:", v12);

  v13 = (void *)MEMORY[0x1E0CB36F8];
  -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;

  if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v7, v8);
    -[CNContactHeaderEditView setRemoteAlertHandle:](self, "setRemoteAlertHandle:", v19);

    v17 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
    -[NSObject setReason:](v17, "setReason:", CFSTR("EditButtonTapped"));
    v26[0] = CFSTR("mode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v20;
    v27[1] = v15;
    v26[1] = CFSTR("contactData");
    v26[2] = CFSTR("isEditing");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setUserInfo:](v17, "setUserInfo:", v22);

    -[CNContactHeaderEditView remoteAlertHandle](self, "remoteAlertHandle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerObserver:", self);

    -[CNContactHeaderEditView remoteAlertHandle](self, "remoteAlertHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateWithContext:", v17);
    goto LABEL_5;
  }
  CNUILogRemoteAlert();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v16, "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v18;
    _os_log_error_impl(&dword_18AC56000, v17, OS_LOG_TYPE_ERROR, "Could not archive editing wallpaper contact: %@", buf, 0xCu);
LABEL_5:

  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  CNUILogRemoteAlert();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Remote alert handle did activate", v4, 2u);
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  CNUILogRemoteAlert();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Remote alert handle did deactivate", v4, 2u);
  }

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  CNUILogRemoteAlert();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_error_impl(&dword_18AC56000, v5, OS_LOG_TYPE_ERROR, "Remote alert handle did invalidate: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)didTapPhotoViewWhileEditing:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CNContactHeaderEditView allowsEditPhoto](self, "allowsEditPhoto"))
  {
    if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      -[CNContactHeaderEditView presentPosterAndAvatarEditorWithMode:isEditing:](self, "presentPosterAndAvatarEditorWithMode:isEditing:", 1, v3);
    else
      -[CNContactHeaderEditView editAvatar](self, "editAvatar");
  }
}

- (void)discardPendingAvatarPosterEdits
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C97240];
  -[CNContactHeaderEditView editingWallpaperContact](self, "editingWallpaperContact");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderEditView mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateMutableContact:withImageAndWallpaperPropertiesFromContact:", v5, v4);

}

- (void)avatarPosterEditorFromFlowManager:(id)a3 didUpdateContact:(id)a4 withVisualIdentity:(id)a5
{
  id v6;
  void *v7;

  v6 = a4;
  -[CNContactHeaderEditView updatePosterViewImageWithNewPosterConfiguration:](self, "updatePosterViewImageWithNewPosterConfiguration:", 1);
  -[CNContactHeaderView photoView](self, "photoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatePendingContactWithEditedContact:", v6);

  -[CNContactHeaderEditView updatePosterVisibility](self, "updatePosterVisibility");
  -[CNContactHeaderEditView setFlowManager:](self, "setFlowManager:", 0);
}

- (void)avatarPosterEditorFromFlowManagerDidCancel:(id)a3
{
  -[CNContactHeaderEditView setFlowManager:](self, "setFlowManager:", 0);
  -[CNContactHeaderEditView discardPendingAvatarPosterEdits](self, "discardPendingAvatarPosterEdits");
}

- (BOOL)allowsEditPhoto
{
  return self->_allowsEditPhoto;
}

- (CGSize)maxButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxButtonSize.width;
  height = self->_maxButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxButtonSize:(CGSize)a3
{
  self->_maxButtonSize = a3;
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (_TtC10ContactsUI32CNHostingPosterSnapshotImageView)editingPosterView
{
  return self->_editingPosterView;
}

- (void)setEditingPosterView:(id)a3
{
  objc_storeStrong((id *)&self->_editingPosterView, a3);
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, a3);
}

- (CNSNaPSetupFlowManager)flowManager
{
  return self->_flowManager;
}

- (void)setFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_flowManager, a3);
}

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)carouselPreWarmer
{
  return self->_carouselPreWarmer;
}

- (void)setCarouselPreWarmer:(id)a3
{
  objc_storeStrong((id *)&self->_carouselPreWarmer, a3);
}

- (CNPRSPosterConfiguration)cachedPosterConfiguration
{
  return self->_cachedPosterConfiguration;
}

- (void)setCachedPosterConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPosterConfiguration, a3);
}

- (CNMutableContact)editingWallpaperContact
{
  return self->_editingWallpaperContact;
}

- (void)setEditingWallpaperContact:(id)a3
{
  objc_storeStrong((id *)&self->_editingWallpaperContact, a3);
}

- (BOOL)isOutOfProcess
{
  return self->_isOutOfProcess;
}

- (void)setIsOutOfProcess:(BOOL)a3
{
  self->_isOutOfProcess = a3;
}

- (CNSensitiveContentAnalysisManager)sensitiveContentManager
{
  return self->_sensitiveContentManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveContentManager, 0);
  objc_storeStrong((id *)&self->_editingWallpaperContact, 0);
  objc_storeStrong((id *)&self->_cachedPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_carouselPreWarmer, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_editingPosterView, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
}

void __81__CNContactHeaderEditView__presentRemotePosterAndAvatarEditorWithMode_isEditing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
  {
    CNUILogRemoteAlert();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v5, OS_LOG_TYPE_ERROR, "Response data returned from the remote Contacts carousel was empty", buf, 2u);
    }
  }
  else
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v6)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__CNContactHeaderEditView__presentRemotePosterAndAvatarEditorWithMode_isEditing___block_invoke_811;
      block[3] = &unk_1E2050400;
      block[4] = *(_QWORD *)(a1 + 32);
      v10 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      CNUILogRemoteAlert();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[NSObject localizedDescription](v5, "localizedDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_error_impl(&dword_18AC56000, v7, OS_LOG_TYPE_ERROR, "Contact returned from the remote Contacts carousel could not be decoded: %@", buf, 0xCu);

      }
    }

  }
}

uint64_t __81__CNContactHeaderEditView__presentRemotePosterAndAvatarEditorWithMode_isEditing___block_invoke_811(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "wallpaper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setWallpaper:", v2);

  objc_msgSend(*(id *)(a1 + 32), "photoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePendingContactWithEditedContact:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "updatePosterViewImageWithNewPosterConfiguration:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "updatePosterVisibility");
}

void __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "editingPosterView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

void __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke_792(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "snapshotBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "levelSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotForLevelSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke_2;
      v13[3] = &unk_1E2050400;
      v13[4] = WeakRetained;
      v14 = v9;
      objc_msgSend(v10, "performBlock:", v13);

    }
    else
    {
      CNUILogPosters();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Snapshot result returned a nil image", v12, 2u);
      }

    }
  }
  else
  {
    CNUILogPosters();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_18AC56000, WeakRetained, OS_LOG_TYPE_ERROR, "Snapshot request returned no result", v12, 2u);
    }
  }

}

void __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "editingPosterView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

id __42__CNContactHeaderEditView_setUpEditButton__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 16.0);
  objc_msgSend(v3, "fontWithSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1138]);
  return v2;
}

+ (id)contactHeaderViewWithContact:(id)a3 shouldAllowTakePhotoAction:(BOOL)a4 monogramOnly:(BOOL)a5 isOutOfProcess:(BOOL)a6 delegate:(id)a7
{
  return (id)objc_msgSend(a1, "contactHeaderViewWithContact:shouldAllowTakePhotoAction:showingNavBar:monogramOnly:isOutOfProcess:delegate:", a3, a4, 0, a5, a6, a7);
}

+ (id)contactHeaderViewWithContact:(id)a3 shouldAllowTakePhotoAction:(BOOL)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 isOutOfProcess:(BOOL)a7 delegate:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v21;
  uint64_t v22;
  void *v23;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v14 = a3;
  v15 = a8;
  objc_msgSend((id)sEditingContactHeaderView, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc((Class)a1);
    v18 = (id)objc_msgSend(v17, "initWithContact:frame:shouldAllowTakePhotoAction:delegate:showingNavBar:monogramOnly:isOutOfProcess:", v14, v12, v15, v11, v10, v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  else
  {
    if (sEditingContactHeaderView)
    {
      v19 = (id)sEditingContactHeaderView;
      objc_msgSend(v19, "setDelegate:", v15);
      objc_msgSend(v19, "prepareForReuse");
      objc_msgSend(v19, "updateForShowingNavBar:", v11);
      objc_msgSend(v19, "updateWithNewContact:", v14);
      goto LABEL_6;
    }
    v21 = objc_alloc((Class)a1);
    v22 = objc_msgSend(v21, "initWithContact:frame:shouldAllowTakePhotoAction:delegate:showingNavBar:monogramOnly:isOutOfProcess:", v14, v12, v15, v11, v10, v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v23 = (void *)sEditingContactHeaderView;
    sEditingContactHeaderView = v22;

    v18 = (id)sEditingContactHeaderView;
  }
  v19 = v18;
  objc_msgSend(v18, "updateEditButtonTitle");
LABEL_6:

  return v19;
}

+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CNContactPhotoView *v16;
  void *v17;
  CNContactPhotoView *v18;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D13D48]);
  objc_msgSend(v8, "inProcessContactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultSchedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithContactStore:schedulerProvider:", v10, v11);

  objc_msgSend(v12, "setProhibitedSources:", 8);
  if (v5)
  {
    objc_msgSend(v8, "cachingMonogramRenderer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D13D28];
    objc_msgSend(v8, "defaultSchedulerProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rendererWithLikenessResolver:schedulerProvider:", v12, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = [CNContactPhotoView alloc];
  objc_msgSend(v8, "inProcessContactStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:allowStaleRendering:](v16, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:allowStaleRendering:", v7, 1, v17, v6, v13, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v18;
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFeatureEnabled:", 16);

  if (v6)
  {
    if (a3)
      +[CNContactHeaderViewSizeAttributes staticEditingAttributesWithNavBar](CNContactHeaderViewSizeAttributes, "staticEditingAttributesWithNavBar");
    else
      +[CNContactHeaderViewSizeAttributes staticEditingAttributes](CNContactHeaderViewSizeAttributes, "staticEditingAttributes");
  }
  else if (a3)
  {
    +[CNContactHeaderViewSizeAttributes editingAttributesWithNavBar](CNContactHeaderViewSizeAttributes, "editingAttributesWithNavBar");
  }
  else
  {
    +[CNContactHeaderViewSizeAttributes editingAttributes](CNContactHeaderViewSizeAttributes, "editingAttributes");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

@end
