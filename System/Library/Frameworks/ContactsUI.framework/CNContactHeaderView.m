@implementation CNContactHeaderView

- (NSArray)contacts
{
  return self->_contacts;
}

- (BOOL)isOrientationPhoneLandscape
{
  void *v2;
  char v3;

  -[CNContactHeaderView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOrientationPhoneLandscape");

  return v3;
}

- (CNContactHeaderViewDelegate)delegate
{
  return (CNContactHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isPadCompactHorizontalSize
{
  void *v3;
  uint64_t v4;
  BOOL result;

  -[CNContactHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  result = -[CNContactHeaderView isPad](self, "isPad");
  if (v4 != 1)
    return 0;
  return result;
}

- (BOOL)isPad
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3 == 1;
}

- (BOOL)showMonogramsOnly
{
  return self->_showMonogramsOnly;
}

- (void)setPresenterDelegate:(id)a3
{
  CNPresenterDelegate **p_presenterDelegate;
  id v5;

  p_presenterDelegate = &self->_presenterDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_presenterDelegate, v5);
  -[CNContactPhotoView setPresenterDelegate:](self->_photoView, "setPresenterDelegate:", v5);

}

- (void)setAlwaysShowsMonogram:(BOOL)a3
{
  self->_alwaysShowsMonogram = a3;
}

- (NSDictionary)nameTextAttributes
{
  return self->_nameTextAttributes;
}

- (void)photoViewDidUpdate:(id)a3
{
  id v3;

  -[CNContactHeaderView delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerPhotoDidUpdate");

}

- (double)minHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[CNContactHeaderView minTitleOffset](self, "minTitleOffset");
  v4 = v3;
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minHeight");
  v7 = v4 + v6;
  -[CNContactHeaderView safeAreaTop](self, "safeAreaTop");
  v9 = v7 + v8;

  return v9;
}

- (double)safeAreaTop
{
  double v3;
  double v4;
  double v5;

  -[CNContactHeaderView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  -[CNContactHeaderView safeAreaPhotoOffset](self, "safeAreaPhotoOffset");
  return v4 + v5;
}

- (double)minTitleOffset
{
  void *v3;
  double v4;
  double v5;

  if (!-[CNContactHeaderView shouldShowBelowNavigationTitle](self, "shouldShowBelowNavigationTitle"))
    return 0.0;
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minNavbarTitleOffset");
  v5 = v4;

  return v5;
}

- (BOOL)shouldShowBelowNavigationTitle
{
  return self->_shouldShowBelowNavigationTitle;
}

- (BOOL)isAXSize
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
}

- (BOOL)isPadRegularHorizontalSize
{
  void *v3;
  uint64_t v4;
  BOOL result;

  -[CNContactHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  result = -[CNContactHeaderView isPad](self, "isPad");
  if (v4 == 1)
    return 0;
  return result;
}

- (double)safeAreaPhotoOffset
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  -[CNContactHeaderView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoMinHeight");
  v7 = v6;
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoMinTopMargin");
  v10 = v7 + v9;

  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4 >= v10)
  {
    objc_msgSend(v11, "photoMinHeight");
    v16 = -v15;
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "photoMinTopMargin");
    v14 = v16 - v18;

  }
  else
  {
    objc_msgSend(v11, "photoMinTopMargin");
    v14 = -(v4 - v13);
  }

  if (v4 + v14 >= 10.0)
    return v14;
  else
    return -(v4 + -10.0);
}

- (CNContactHeaderViewSizeAttributes)sizeAttributes
{
  return self->_sizeAttributes;
}

- (BOOL)isPhotoLowQuality
{
  void *v2;
  void *v3;
  char v4;

  -[CNContactHeaderView contacts](self, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasLowQualityImage");

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNContactHeaderView;
  -[CNContactHeaderView layoutSubviews](&v9, sel_layoutSubviews);
  -[CNContactHeaderView frame](self, "frame");
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  -[CNContactHeaderView lastViewWidth](self, "lastViewWidth");
  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", -[CNContactHeaderView needsLabelSizeCalculation](self, "needsLabelSizeCalculation") | objc_msgSend(v5, "isDouble:equalToOther:withAccuracy:", v4, v6, 0.5) ^ 1);
  -[CNContactHeaderView setLastViewWidth:](self, "setLastViewWidth:", v4);
  -[CNContactHeaderView maxHeight](self, "maxHeight");
  if (v7 > 0.0)
  {
    -[CNContactHeaderView minHeight](self, "minHeight");
    if (v8 > 0.0)
      -[CNContactHeaderView updateSizeDependentAttributes](self, "updateSizeDependentAttributes");
  }
}

- (void)setNeedsLabelSizeCalculation:(BOOL)a3
{
  self->_needsLabelSizeCalculation = a3;
}

- (BOOL)needsLabelSizeCalculation
{
  return self->_needsLabelSizeCalculation;
}

- (void)setLastViewWidth:(double)a3
{
  self->_lastViewWidth = a3;
}

- (double)lastViewWidth
{
  return self->_lastViewWidth;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (CNContactPhotoView)photoView
{
  return self->_photoView;
}

- (NSLayoutConstraint)photoHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 520, 1);
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
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  -[CNContactHeaderView reloadDataIfNeeded](self, "reloadDataIfNeeded");
  v19.receiver = self;
  v19.super_class = (Class)CNContactHeaderView;
  -[CNContactHeaderView updateConstraints](&v19, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactHeaderView activatedConstraints](self, "activatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView photoView](self, "photoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView safeAreaPhotoOffset](self, "safeAreaPhotoOffset");
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView setPhotoTopConstraint:](self, "setPhotoTopConstraint:", v10);

  -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1148829696;
  objc_msgSend(v11, "setPriority:", v12);

  -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  -[CNContactHeaderView photoView](self, "photoView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "photoMinHeight");
  objc_msgSend(v15, "constraintEqualToConstant:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView setPhotoHeightConstraint:](self, "setPhotoHeightConstraint:", v17);

  -[CNContactHeaderView photoHeightConstraint](self, "photoHeightConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v18);

  -[CNContactHeaderView setActivatedConstraints:](self, "setActivatedConstraints:", v5);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);

}

- (NSLayoutConstraint)photoTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 512, 1);
}

- (void)setActivatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConstraints, a3);
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setPhotoTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (void)setPhotoHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (void)reloadDataIfNeeded
{
  if (self->_needsReload)
    -[CNContactHeaderView reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
}

uint64_t __37__CNContactHeaderView_setNeedsReload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataIfNeeded");
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (UIImageView)posterView
{
  return self->_posterView;
}

- (id)backgroundGradientDefaultGrayColors
{
  void *v2;
  uint64_t v3;

  -[CNContactHeaderView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    objc_msgSend(MEMORY[0x1E0D13CD8], "defaultDarkGrayColors");
  else
    objc_msgSend(MEMORY[0x1E0D13CD8], "defaultGrayColors");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)descriptorForRequiredKeys
{
  return (id)objc_msgSend(a1, "descriptorForRequiredKeysIncludingAvatarViewDescriptors:", 1);
}

+ (id)descriptorForRequiredKeysIncludingAvatarViewDescriptors:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[28];

  v3 = a3;
  v28[27] = *MEMORY[0x1E0C80C00];
  +[CNMonogrammer descriptorForRequiredKeysIncludingImage:](CNMonogrammer, "descriptorForRequiredKeysIncludingImage:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactPhotoView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNContactPhotoView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v5;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C96790];
  v28[2] = v6;
  v28[3] = v7;
  v8 = *MEMORY[0x1E0C96780];
  v28[4] = *MEMORY[0x1E0C966D0];
  v28[5] = v8;
  v9 = *MEMORY[0x1E0C96820];
  v28[6] = *MEMORY[0x1E0C966C0];
  v28[7] = v9;
  v10 = *MEMORY[0x1E0C967A0];
  v28[8] = *MEMORY[0x1E0C96798];
  v28[9] = v10;
  v11 = *MEMORY[0x1E0C967E0];
  v28[10] = *MEMORY[0x1E0C967D8];
  v28[11] = v11;
  v12 = *MEMORY[0x1E0C96830];
  v28[12] = *MEMORY[0x1E0C967D0];
  v28[13] = v12;
  v13 = *MEMORY[0x1E0C96668];
  v28[14] = *MEMORY[0x1E0C96828];
  v28[15] = v13;
  v14 = *MEMORY[0x1E0C967E8];
  v28[16] = *MEMORY[0x1E0C967B8];
  v28[17] = v14;
  v15 = *MEMORY[0x1E0C96698];
  v28[18] = *MEMORY[0x1E0C96898];
  v28[19] = v15;
  v16 = *MEMORY[0x1E0C96700];
  v28[20] = *MEMORY[0x1E0C96758];
  v28[21] = v16;
  v17 = *MEMORY[0x1E0C96860];
  v28[22] = *MEMORY[0x1E0C96890];
  v28[23] = v17;
  objc_msgSend(MEMORY[0x1E0C97310], "descriptorForRequiredKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C966A0];
  v28[24] = v18;
  v28[25] = v19;
  objc_msgSend(MEMORY[0x1E0C97240], "descriptorForRequiredKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[26] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayByAddingObject:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v23;
  }
  v24 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactHeaderView descriptorForRequiredKeysIncludingAvatarViewDescriptors:]");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "descriptorWithKeyDescriptors:description:", v21, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)setPosterView:(id)a3
{
  objc_storeStrong((id *)&self->_posterView, a3);
}

- (void)updateWithNewContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView updateWithContacts:](self, "updateWithContacts:", v6);

  }
  else
  {
    -[CNContactHeaderView updateWithContacts:](self, "updateWithContacts:", MEMORY[0x1E0C9AA60]);
  }

}

- (void)updateWithContacts:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray **p_contacts;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[NSArray _cn_isIdenticalToArray:](self->_contacts, "_cn_isIdenticalToArray:", v5) & 1) == 0)
  {
    p_contacts = &self->_contacts;
    v15 = a3;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys", p_contacts, v15, (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "assertKeysAreAvailable:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v8);
    }

    objc_storeStrong((id *)p_contacts, v15);
    -[CNContactPhotoView setContacts:](self->_photoView, "setContacts:", v6);
    -[CNContactHeaderView setHidden:](self, "setHidden:", objc_msgSend(v6, "count") == 0);
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
  }

}

- (void)setNeedsReload
{
  const __CFAllocator *v2;
  CFRunLoopObserverRef v3;
  __CFRunLoopObserver *v4;
  __CFRunLoop *Main;
  _QWORD block[5];

  if (!self->_needsReload)
  {
    self->_needsReload = 1;
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__CNContactHeaderView_setNeedsReload__block_invoke;
    block[3] = &unk_1E2049698;
    block[4] = self;
    v3 = CFRunLoopObserverCreateWithHandler(v2, 0x20uLL, 0, 0, block);
    if (v3)
    {
      v4 = v3;
      Main = CFRunLoopGetMain();
      CFRunLoopAddObserver(Main, v4, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      CFRelease(v4);
    }
  }
}

- (id)contactViewCache
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNContactHeaderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactHeaderView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactViewCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (CNContactHeaderView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowTakePhotoAction:(BOOL)a5 shouldAllowImageDrops:(BOOL)a6 showingNavBar:(BOOL)a7 monogramOnly:(BOOL)a8 delegate:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  CNContactHeaderView *v20;
  void *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *backgroundColorCacheQueue;
  uint64_t v24;
  CNContactPhotoView *photoView;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  objc_super v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v38[2] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)CNContactHeaderView;
  v18 = a9;
  v19 = a3;
  v20 = -[CNContactHeaderView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  objc_storeWeak((id *)&v20->_delegate, v18);

  -[CNContactHeaderView setShowMonogramsOnly:](v20, "setShowMonogramsOnly:", v9);
  -[CNContactHeaderView setShouldShowBelowNavigationTitle:](v20, "setShouldShowBelowNavigationTitle:", v10);
  objc_msgSend((id)objc_opt_class(), "sizeAttributesShowingNavBar:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView setSizeAttributes:](v20, "setSizeAttributes:", v21);

  v22 = dispatch_queue_create("com.apple.contact.backgroundColorCaching", 0);
  backgroundColorCacheQueue = v20->_backgroundColorCacheQueue;
  v20->_backgroundColorCacheQueue = (OS_dispatch_queue *)v22;

  objc_msgSend((id)objc_opt_class(), "makePhotoViewWithShouldAllowTakePhotoAction:shouldAllowImageDrops:monogramOnly:", v12, v11, v9);
  v24 = objc_claimAutoreleasedReturnValue();
  photoView = v20->_photoView;
  v20->_photoView = (CNContactPhotoView *)v24;

  -[CNContactPhotoView setTranslatesAutoresizingMaskIntoConstraints:](v20->_photoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNContactPhotoView setDelegate:](v20->_photoView, "setDelegate:", v20);
  -[CNContactHeaderView addSubview:](v20, "addSubview:", v20->_photoView);
  v38[0] = *MEMORY[0x1E0DC4B50];
  v26 = v38[0];
  v27 = *MEMORY[0x1E0DC1140];
  v37[0] = CFSTR("ABTextStyleAttributeName");
  v37[1] = v27;
  -[CNContactHeaderView contactStyle](v20, "contactStyle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "textColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView setNameTextAttributes:](v20, "setNameTextAttributes:", v30);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v26);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)sCurrentNameFont;
  sCurrentNameFont = v31;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)sCurrentTaglineFont;
  sCurrentTaglineFont = v33;

  -[CNContactHeaderView setNeedsUpdateConstraints](v20, "setNeedsUpdateConstraints");
  -[CNContactHeaderView setNeedsLayout](v20, "setNeedsLayout");
  -[CNContactHeaderView updateWithNewContact:](v20, "updateWithNewContact:", v19);

  return v20;
}

- (void)setNameTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (id)contactStyle
{
  return +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
}

- (void)setSizeAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_sizeAttributes, a3);
}

- (void)setShowMonogramsOnly:(BOOL)a3
{
  self->_showMonogramsOnly = a3;
}

- (void)setShouldShowBelowNavigationTitle:(BOOL)a3
{
  self->_shouldShowBelowNavigationTitle = a3;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  CNContactPhotoView *photoView;

  photoView = self->_photoView;
  if (a3)
    -[CNContactPhotoView updatePhoto](photoView, "updatePhoto");
  else
    -[CNContactPhotoView resetPhoto](photoView, "resetPhoto");
  self->_needsReload = 0;
  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
}

- (void)setSensitiveContentBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_sensitiveContentBlurView, a3);
}

- (CNSensitiveContentBlurView)sensitiveContentBlurView
{
  return self->_sensitiveContentBlurView;
}

- (id)descriptorForRequiredKeys
{
  return (id)objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
}

- (void)updateForShowingNavBar:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactHeaderView setShouldShowBelowNavigationTitle:](self, "setShouldShowBelowNavigationTitle:");
  objc_msgSend((id)objc_opt_class(), "sizeAttributesShowingNavBar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView setSizeAttributes:](self, "setSizeAttributes:", v5);

  -[CNContactHeaderView updateSizeDependentAttributes](self, "updateSizeDependentAttributes");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNContactHeaderView;
  -[CNContactHeaderView dealloc](&v4, sel_dealloc);
}

- (double)maxHeight
{
  double v3;
  double v4;
  double result;

  if (-[CNContactHeaderView shouldUseConstrainedMaxHeight](self, "shouldUseConstrainedMaxHeight"))
  {
    -[CNContactHeaderView constrainedMaxHeight](self, "constrainedMaxHeight");
    v4 = v3;
    -[CNContactHeaderView defaultMaxBaseHeight](self, "defaultMaxBaseHeight");
    if (v4 < result)
      return v4;
  }
  else
  {
    -[CNContactHeaderView defaultMaxBaseHeight](self, "defaultMaxBaseHeight");
  }
  return result;
}

- (double)defaultMaxBaseHeight
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = 0.0;
  if (-[CNContactHeaderView shouldShowBelowNavigationTitle](self, "shouldShowBelowNavigationTitle"))
  {
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxNavbarTitleOffset");
    v3 = v5;

  }
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxHeight");
  v8 = v3 + v7;
  -[CNContactHeaderView safeAreaTop](self, "safeAreaTop");
  v10 = v8 + v9;

  return v10;
}

- (void)setConstrainedMaxHeight:(double)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[CNContactHeaderView setConstrainedMaxHeight:](self, "setConstrainedMaxHeight:", a3);
  -[CNContactHeaderView setShouldUseConstrainedMaxHeight:](self, "setShouldUseConstrainedMaxHeight:", v4);
  -[CNContactHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateFontSizes
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sCurrentNameFont;
  sCurrentNameFont = v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)sCurrentTaglineFont;
  sCurrentTaglineFont = v5;

  v10 = *MEMORY[0x1E0DC1138];
  v7 = (void *)sCurrentNameFont;
  objc_msgSend((id)sCurrentNameFont, "_scaledValueForValue:", 30.0);
  objc_msgSend(v7, "fontWithSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v9);

}

- (id)colorExtractionContext
{
  CIContext *colorExtractionContext;
  CIContext *v4;
  CIContext *v5;

  colorExtractionContext = self->_colorExtractionContext;
  if (!colorExtractionContext)
  {
    objc_msgSend(MEMORY[0x1E0D13CD8], "ciContextWithHighPriority:", 1);
    v4 = (CIContext *)objc_claimAutoreleasedReturnValue();
    v5 = self->_colorExtractionContext;
    self->_colorExtractionContext = v4;

    colorExtractionContext = self->_colorExtractionContext;
  }
  return colorExtractionContext;
}

- (void)fetchColorsForContactImageData:(id)a3 bitmapFormat:(id)a4 isPoster:(BOOL)a5 forContact:(id)a6 cacheResult:(BOOL)a7 withCompletionHandler:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *);
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  CNContactHeaderView *v37;
  id v38;
  void (**v39)(id, void *);
  BOOL v40;
  BOOL v41;

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = (void (**)(id, void *))a8;
  -[CNContactHeaderView contactMiniCache](self, "contactMiniCache");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v16)
  {
    -[CNContactHeaderView colorsMiniCache](self, "colorsMiniCache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v11)
      objc_msgSend(v29, "contactPoster");
    else
      objc_msgSend(v29, "contactImage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v31);

  }
  else
  {
    v32 = a7;
    v19 = v15;
    v20 = v14;
    -[CNContactHeaderView xpcContactStore](self, "xpcContactStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C972A0]);
      objc_msgSend(v22, "setUseOutOfProcessMapperExclusively:", 1);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v22);
      -[CNContactHeaderView setXpcContactStore:](self, "setXpcContactStore:", v23);

    }
    -[CNContactHeaderView xpcContactStore](self, "xpcContactStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "defaultSchedulerProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "backgroundScheduler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke;
    v33[3] = &unk_1E2049040;
    v39 = v17;
    v34 = v24;
    v35 = v20;
    v36 = v19;
    v37 = self;
    v40 = v32;
    v38 = v16;
    v41 = v11;
    v28 = v24;
    objc_msgSend(v27, "performBlock:", v33);

    v14 = v20;
    v15 = v19;

  }
}

- (id)dataForBackgroundColorService:(id)a3
{
  id v3;
  void *v4;
  size_t v5;
  NSObject *v6;
  dispatch_data_t v7;

  v3 = a3;
  v4 = mmap(0, objc_msgSend(v3, "length"), 3, 4097, -1, 0);
  objc_msgSend(v3, "getBytes:length:", v4, objc_msgSend(v3, "length"));
  v5 = objc_msgSend(v3, "length");

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_data_create(v4, v5, v6, (dispatch_block_t)*MEMORY[0x1E0C80CE8]);

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (double)currentHeightPercentMaximized
{
  double result;

  -[CNContactHeaderView maxHeight](self, "maxHeight");
  -[CNContactHeaderView currentHeightPercentMaximizedForMaxHeight:](self, "currentHeightPercentMaximizedForMaxHeight:");
  return result;
}

- (double)currentHeightPercentMaximizedForPhoto
{
  double result;

  -[CNContactHeaderView defaultMaxHeight](self, "defaultMaxHeight");
  -[CNContactHeaderView currentHeightPercentMaximizedForMaxHeight:](self, "currentHeightPercentMaximizedForMaxHeight:");
  return result;
}

- (double)currentHeightPercentMaximizedForMaxHeight:(double)a3
{
  double v5;
  double v6;
  double result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[CNContactHeaderView minHeight](self, "minHeight");
  v6 = a3 - v5;
  result = 1.0;
  if (v6 > 0.0)
  {
    -[CNContactHeaderView bounds](self, "bounds", 1.0);
    v9 = v8;
    -[CNContactHeaderView minHeight](self, "minHeight");
    v11 = v9 - v10;
    -[CNContactHeaderView minHeight](self, "minHeight");
    result = v11 / (a3 - v12);
    if (result < 0.0)
      result = 0.0;
    if (result > 1.0)
      return 1.0;
  }
  return result;
}

- (void)updateSizeDependentAttributes
{
  double v3;
  double v4;
  long double v5;
  double v6;
  void *v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  id v27;

  -[CNContactHeaderView bounds](self, "bounds");
  if (v3 > 0.0)
  {
    -[CNContactHeaderView currentHeightPercentMaximizedForPhoto](self, "currentHeightPercentMaximizedForPhoto");
    v5 = v4;
    v6 = 0.0;
    if (-[CNContactHeaderView shouldShowBelowNavigationTitle](self, "shouldShowBelowNavigationTitle"))
    {
      -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navbarTitleOffsetWithPercentMax:", (double)v5);
      v6 = v8;

    }
    v9 = -[CNContactHeaderView isSiri](self, "isSiri");
    -[CNContactHeaderView safeAreaPhotoOffset](self, "safeAreaPhotoOffset");
    v11 = v6 + v10;
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      objc_msgSend(v12, "photoMinTopMargin");
      v15 = v11 + v14;
      -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConstant:", v15);
    }
    else
    {
      objc_msgSend(v12, "photoTopMarginWithPercentMax:", (double)v5);
      v18 = v11 + v17;
      -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "photoMinTopMargin");
      v20 = v18 - v19;
      -[CNContactHeaderView photoTopConstraint](self, "photoTopConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setConstant:", v20);

    }
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "photoHeightWithPercentMax:", (double)v5);
    v24 = v23;
    -[CNContactHeaderView photoHeightConstraint](self, "photoHeightConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConstant:", v24);

    v26 = pow(v5, 3.0);
    -[CNContactHeaderView photoView](self, "photoView");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setLabelAlpha:", v26);

  }
}

- (void)photoView:(id)a3 didAcceptDropOfImageData:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNContactHeaderView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerView:didAcceptDropOfImageData:", self, v5);

}

- (id)viewControllerForPhotoView:(id)a3
{
  void *v4;
  void *v5;

  -[CNContactHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForHeaderView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNPresenterDelegate)presenterDelegate
{
  return (CNPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presenterDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSiri
{
  return self->_isSiri;
}

- (void)setIsSiri:(BOOL)a3
{
  self->_isSiri = a3;
}

- (CNContactStore)xpcContactStore
{
  return self->_xpcContactStore;
}

- (void)setXpcContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_xpcContactStore, a3);
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (double)constrainedMaxHeight
{
  return self->_constrainedMaxHeight;
}

- (void)setConstrainedMaxHeight:(double)a3
{
  self->_constrainedMaxHeight = a3;
}

- (BOOL)shouldUseConstrainedMaxHeight
{
  return self->_shouldUseConstrainedMaxHeight;
}

- (void)setShouldUseConstrainedMaxHeight:(BOOL)a3
{
  self->_shouldUseConstrainedMaxHeight = a3;
}

- (OS_dispatch_queue)backgroundColorCacheQueue
{
  return self->_backgroundColorCacheQueue;
}

- (void)setBackgroundColorCacheQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorCacheQueue, a3);
}

- (CNContact)contactMiniCache
{
  return self->_contactMiniCache;
}

- (void)setContactMiniCache:(id)a3
{
  objc_storeStrong((id *)&self->_contactMiniCache, a3);
}

- (CNUIBackgroundColors)colorsMiniCache
{
  return self->_colorsMiniCache;
}

- (void)setColorsMiniCache:(id)a3
{
  objc_storeStrong((id *)&self->_colorsMiniCache, a3);
}

- (BOOL)alwaysShowsMonogram
{
  return self->_alwaysShowsMonogram;
}

- (BOOL)visibleToScrollViews
{
  return self->_visibleToScrollViews;
}

- (void)setVisibleToScrollViews:(BOOL)a3
{
  self->_visibleToScrollViews = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_colorsMiniCache, 0);
  objc_storeStrong((id *)&self->_contactMiniCache, 0);
  objc_storeStrong((id *)&self->_backgroundColorCacheQueue, 0);
  objc_storeStrong((id *)&self->_sizeAttributes, 0);
  objc_storeStrong((id *)&self->_photoHeightConstraint, 0);
  objc_storeStrong((id *)&self->_photoTopConstraint, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_sensitiveContentBlurView, 0);
  objc_storeStrong((id *)&self->_posterView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_xpcContactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_storeStrong((id *)&self->_nameTextAttributes, 0);
  objc_storeStrong((id *)&self->_colorExtractionContext, 0);
}

void __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(void *, void *);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v2 = MEMORY[0x1E0C809B0];
  v34 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E204B5E8;
  v31 = *(id *)(a1 + 72);
  v3 = (void (**)(void *, void *))_Block_copy(aBlock);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v29 = 0;
  objc_msgSend(v4, "getBackgroundColorOnImageData:bitmapFormat:error:", v5, v6, &v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v29;
  v9 = *MEMORY[0x1E0D137F8];
  if (!(*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], v7))
  {
    objc_msgSend(MEMORY[0x1E0D13C90], "colorsFromDictionaries:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v11) & 1) != 0 || !*(_BYTE *)(a1 + 80))
    {
      CNUILogContactCard();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "Failed to read colors from dictionary", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 56), "backgroundGradientDefaultGrayColors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v12);
      goto LABEL_18;
    }
    v12 = (void *)objc_msgSend(*(id *)(a1 + 64), "mutableCopy");
    v13 = objc_alloc(MEMORY[0x1E0D13C88]);
    objc_msgSend(v12, "imageBackgroundColorsData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithData:", v14);

    if (*(_BYTE *)(a1 + 81))
      objc_msgSend(v15, "setContactPoster:", v11);
    else
      objc_msgSend(v15, "setContactImage:", v11);
    objc_msgSend(v15, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImageBackgroundColorsData:", v17);

    objc_msgSend(*(id *)(a1 + 56), "setContactMiniCache:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 56), "setColorsMiniCache:", v15);
    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "headerViewShouldCacheContactBackgroundColor:", *(_QWORD *)(a1 + 56)))
    {
      v19 = objc_msgSend(v12, "hasBeenPersisted");

      if (!v19)
      {
LABEL_17:
        v3[2](v3, v11);

LABEL_18:
        goto LABEL_19;
      }
      objc_msgSend(*(id *)(a1 + 56), "backgroundColorCacheQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = v2;
      block[1] = 3221225472;
      block[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_29;
      block[3] = &unk_1E204FAA0;
      v21 = v12;
      v22 = *(_QWORD *)(a1 + 56);
      v23 = *(void **)(a1 + 64);
      v26 = v21;
      v27 = v22;
      v28 = v23;
      dispatch_async(v20, block);

      v18 = v26;
    }

    goto LABEL_17;
  }
  CNUILogContactCard();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v24;
    _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Failed to generate colors dictionary, error: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 56), "backgroundGradientDefaultGrayColors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v11);
LABEL_19:

}

void __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E204F9B0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_29(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  CNUILogContactCard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_18AC56000, v2, OS_LOG_TYPE_INFO, "Attempting to cache background colors for contact %@", buf, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v4, "setSuppressChangeNotifications:", 1);
  objc_msgSend(v4, "updateContact:", a1[4]);
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inProcessContactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v7 = objc_msgSend(v6, "executeSaveRequest:error:", v4, &v15);
  v8 = v15;
  if ((v7 & 1) == 0)
  {
    CNUILogPosters();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = a1[4];
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v8;
      _os_log_error_impl(&dword_18AC56000, v9, OS_LOG_TYPE_ERROR, "Failed to save background colors to contact %@ with error %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_32;
  v13[3] = &unk_1E2050400;
  v11 = (void *)a1[6];
  v13[4] = a1[5];
  v14 = v11;
  objc_msgSend(v10, "performBlock:", v13);

}

void __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "contactMiniCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setContactMiniCache:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setColorsMiniCache:", 0);
  }
}

uint64_t __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (CGSize)defaultPhotoSize
{
  double v2;
  double v3;
  CGSize result;

  +[CNContactPhotoView defaultSize](CNContactPhotoView, "defaultSize");
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5
{
  id v5;
  id v6;

  v5 = a1;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  return +[CNContactHeaderViewSizeAttributes displayAttributes](CNContactHeaderViewSizeAttributes, "displayAttributes", a3);
}

@end
