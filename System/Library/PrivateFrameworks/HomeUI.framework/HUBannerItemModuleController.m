@implementation HUBannerItemModuleController

- (id)_defaultCellLayoutOptionsForViewSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  v5 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
    v6 = &unk_1E7040FC0;
  else
    v6 = 0;
  +[HUGridLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", v5, v6, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStatusHidden:", 0);
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentSizeCategory:", v9);

  objc_msgSend(v7, "setEditing:", 0);
  objc_msgSend(v7, "setSectionLeadingMargin:", 0.0);
  objc_msgSend(v7, "setSectionTrailingMargin:", 0.0);

  return v7;
}

- (HUBannerItemModuleController)initWithModule:(id)a3 host:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HUBannerItemModuleController *v17;
  HUBannerItemModuleController *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  HUGridLayoutOptions *layoutOptions;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  v12 = v8;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v12;
    if (v13)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

  }
  v14 = 0;
LABEL_8:

  v30.receiver = self;
  v30.super_class = (Class)HUBannerItemModuleController;
  v17 = -[HUItemModuleController initWithModule:](&v30, sel_initWithModule_, v12);
  v18 = v17;
  if (v17)
  {
    -[HUItemModuleController setHost:](v17, "setHost:", v9);
    -[HUBannerItemModuleController setDelegate:](v18, "setDelegate:", v10);
    -[HUItemModuleController host](v18, "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "presentingViewControllerForModuleController:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    -[HUBannerItemModuleController _defaultCellLayoutOptionsForViewSize:](v18, "_defaultCellLayoutOptionsForViewSize:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    layoutOptions = v18->_layoutOptions;
    v18->_layoutOptions = (HUGridLayoutOptions *)v24;

    objc_msgSend(v12, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "home");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerItemModuleController fetchMediaAccountForHome:](v18, "fetchMediaAccountForHome:", v27);

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addUserObserver:", v18);

  }
  return v18;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)fetchMediaAccountForHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25[2];
  _QWORD v26[4];
  id v27;
  SEL v28;
  id location;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0 && objc_msgSend(v5, "isMultiUserEnabled"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaAccountForHomeIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HUItemModuleController module](self, "module");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bannerItemProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "multiUserTokenFixBannerItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHomeMediaAccount:", v9);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "executeHomeMediaAccountFetchForHome:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerItemModuleController setHomeMediaAccountFuture:](self, "setHomeMediaAccountFuture:", v14);

      -[HUBannerItemModuleController homeMediaAccountFuture](self, "homeMediaAccountFuture");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __57__HUBannerItemModuleController_fetchMediaAccountForHome___block_invoke;
      v26[3] = &unk_1E6F4E568;
      v28 = a2;
      v17 = v5;
      v27 = v17;
      v18 = (id)objc_msgSend(v15, "addFailureBlock:", v26);

      -[HUBannerItemModuleController homeMediaAccountFuture](self, "homeMediaAccountFuture");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reschedule:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v23[0] = v16;
      v23[1] = 3221225472;
      v23[2] = __57__HUBannerItemModuleController_fetchMediaAccountForHome___block_invoke_129;
      v23[3] = &unk_1E6F54F60;
      objc_copyWeak(v25, &location);
      v25[1] = (id)a2;
      v24 = v17;
      v22 = (id)objc_msgSend(v21, "addSuccessBlock:", v23);

      objc_destroyWeak(v25);
      v10 = v27;
    }

    objc_destroyWeak(&location);
  }

}

- (NAFuture)homeMediaAccountFuture
{
  return self->_homeMediaAccountFuture;
}

- (void)setHomeMediaAccountFuture:(id)a3
{
  objc_storeStrong((id *)&self->_homeMediaAccountFuture, a3);
}

- (HUBannerItemModuleController)initWithModule:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModule_host_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUBannerItemModuleController.m"), 51, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUBannerItemModuleController initWithModule:]",
    v6);

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUBannerItemModuleController homeMediaAccountFuture](self, "homeMediaAccountFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)HUBannerItemModuleController;
  -[HUBannerItemModuleController dealloc](&v4, sel_dealloc);
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad", a3, a4) & 1) != 0)
  {
    objc_opt_class();
    -[HUItemModuleController host](self, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v8, "orientation") - 1) >= 2)
      v9 = 0.75;
    else
      v9 = 0.67;

    objc_msgSend(v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    objc_msgSend(v7, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "bounds");
    v15 = v12 / v14;

    v16 = (void *)MEMORY[0x1E0CEA1C0];
    if (v15 >= v9)
    {
      v17 = 0;
      v18 = 0.5;
      goto LABEL_12;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CEA1C0];
  }
  v18 = 1.0;
  v17 = 1;
LABEL_12:
  objc_msgSend(v16, "fractionalWidthDimension:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 160.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeWithWidthDimension:heightDimension:", v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "heightDimension");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeWithWidthDimension:heightDimension:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0CEA1D0];
  if (v17)
  {
    v48[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "horizontalGroupWithLayoutSize:subitems:", v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:subitem:count:", v27, v23, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)MEMORY[0x1E0CEA1F8];
  -[HUBannerItemModuleController layoutOptions](self, "layoutOptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "columnSpacing");
  objc_msgSend(v31, "fixedSpacing:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setInterItemSpacing:", v33);

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerItemModuleController layoutOptions](self, "layoutOptions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rowSpacing");
  objc_msgSend(v34, "setInterGroupSpacing:");

  -[HUBannerItemModuleController layoutOptions](self, "layoutOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sectionTopMargin");
  v38 = v37;
  -[HUBannerItemModuleController layoutOptions](self, "layoutOptions");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sectionLeadingMargin");
  v41 = v40;
  -[HUBannerItemModuleController layoutOptions](self, "layoutOptions");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sectionBottomMargin");
  v44 = v43;
  -[HUBannerItemModuleController layoutOptions](self, "layoutOptions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sectionTrailingMargin");
  objc_msgSend(v34, "setContentInsets:", v38, v41, v44, v46);

  return v34;
}

- (Class)collectionCellClassForItem:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_9:
    v4 = (void *)objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  objc_super v37;

  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HUBannerItemModuleController;
  -[HUItemModuleController configureCell:forItem:](&v37, sel_configureCell_forItem_, v6, v7);
  -[HUBannerItemModuleController layoutOptions](self, "layoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = objc_opt_class();
      v21 = v6;
      if (v21)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
        v12 = v21;
        if (v22)
          goto LABEL_19;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v20, objc_opt_class());

      }
      v12 = 0;
LABEL_19:

      objc_msgSend(v12, "setDelegate:", self);
      objc_msgSend(v7, "latestResults");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccessibilityIdentifier:", v26);

      objc_msgSend(v8, "welcomeUIBannerCellOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLayoutOptions:", v17);
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_22;
    v27 = objc_opt_class();
    v28 = v6;
    if (v28)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
      v12 = v28;
      if (v29)
        goto LABEL_31;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v27, objc_opt_class());

    }
    v12 = 0;
LABEL_31:

    objc_msgSend(v12, "setDelegate:", self);
    objc_msgSend(v8, "bannerCellOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLayoutOptions:", v32);

    objc_msgSend(v7, "latestResults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0D30BA0];
    objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", v35);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    objc_msgSend(v12, "bannerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setDisableHighlighting:", 1);

    objc_msgSend(v7, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v34;
    goto LABEL_10;
  }
  v9 = objc_opt_class();
  v10 = v6;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v10;
    if (v11)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v9, objc_opt_class());

  }
  v12 = 0;
LABEL_9:

  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v8, "bannerCellOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayoutOptions:", v15);

  objc_msgSend(v7, "latestResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = *MEMORY[0x1E0D30BA0];
LABEL_10:
  objc_msgSend(v16, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", v19);

LABEL_20:
LABEL_21:

LABEL_22:
}

- (void)bannerView:(id)a3 dismissButtonTapped:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  HUBannerItemModuleController *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v33 = self;
    v34 = 2080;
    v35 = "-[HUBannerItemModuleController bannerView:dismissButtonTapped:]";
    v36 = 2112;
    v37 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped dismiss button for %@", buf, 0x20u);
  }

  v7 = objc_alloc(MEMORY[0x1E0D31988]);
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentUser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v7, "initWithHome:user:nameStyle:", v10, v14, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = (id)objc_msgSend(v15, "setDismissedWelcomeUIBanner:", 1);
  v17 = (void *)MEMORY[0x1E0D314C0];
  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "item");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_setWithSafeObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestToUpdateItems:senderSelector:", v20, a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "itemUpdater");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "performItemUpdateRequest:", v21);

  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "item");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@-dismiss"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "item");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerItemModuleController _sendBannerInteractionforItem:tappedBannerItemOverrideClassName:](self, "_sendBannerInteractionforItem:tappedBannerItemOverrideClassName:", v30, v29);

}

- (BOOL)hasTapActionForItem:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "latestResults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B98]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v3, "latestResults");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v8 == 0;

      }
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  HUHomeControlServiceContext *v97;
  void *v98;
  HUHomeControlServiceContext *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void (**v117)(void *, void *, const __CFString *);
  void *v118;
  __CFString *v119;
  _QWORD v120[4];
  id v121;
  id v122;
  id v123;
  id v124[2];
  _QWORD aBlock[5];
  id v126;
  uint64_t v127;
  uint8_t buf[4];
  HUBannerItemModuleController *v129;
  __int16 v130;
  const char *v131;
  __int16 v132;
  id v133;
  __int16 v134;
  __CFString *v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v129 = self;
    v130 = 2080;
    v131 = "-[HUBannerItemModuleController didSelectItem:]";
    v132 = 2112;
    v133 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped %@", buf, 0x20u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HFResultSetupBannerType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v5, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HFResultKeyPathsForUnfinishedOnboardingFlows"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" for flows %@"), v11);
      v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v119 = &stru_1E6F60E80;
    }
    HFLogForCategory();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v129 = self;
      v130 = 2080;
      v131 = "-[HUBannerItemModuleController didSelectItem:]";
      v132 = 2112;
      v133 = v5;
      v134 = 2112;
      v135 = v119;
      _os_log_impl(&dword_1B8E1E000, v47, OS_LOG_TYPE_DEFAULT, "(%@:%s) User tapped Setup Banner %@ %@", buf, 0x2Au);
    }

    if (v9 != 1)
    {
      if (v9)
      {
LABEL_62:

        goto LABEL_63;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("OnboardingDisplayOption_OnboardingFromUserInput"));
      v127 = *MEMORY[0x1E0D306A0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v11, "isEqualToArray:", v49);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v51, CFSTR("OnboardingDisplayOption_OnboardingFromNaturalLightingReminder"));

      -[HUItemModuleController module](self, "module");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "context");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "home");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemModuleController host](self, "host");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = +[HUHomeFeatureOnboardingUtilities home:onboardFeaturesForKeyPaths:presentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardFeaturesForKeyPaths:presentingViewController:usageOptions:", v53, v11, v54, v48);

LABEL_61:
      goto LABEL_62;
    }
    objc_msgSend(v5, "latestResults");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("HFResultSetupBannerAccessorySetupFlowsKey"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v129 = self;
      v130 = 2080;
      v131 = "-[HUBannerItemModuleController didSelectItem:]";
      v132 = 2112;
      v133 = v57;
      _os_log_impl(&dword_1B8E1E000, v58, OS_LOG_TYPE_DEFAULT, "(%@:%s) Status banner type is Accessory Setup. accessorySetupFlows = %@", buf, 0x20u);
    }

    objc_msgSend(v57, "na_firstObjectPassingTest:", &__block_literal_global_119);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__HUBannerItemModuleController_didSelectItem___block_invoke_2;
    aBlock[3] = &unk_1E6F54E30;
    aBlock[4] = self;
    v48 = v57;
    v126 = v48;
    v117 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
    objc_msgSend(v48, "na_firstObjectPassingTest:", &__block_literal_global_107);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "na_firstObjectPassingTest:", &__block_literal_global_109_0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v118)
    {
      -[HUItemModuleController module](self, "module");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "context");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "home");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "homeKitObjects");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "na_map:", &__block_literal_global_113_1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUHomeUIServiceLaunchUserInfo userInfoForResumeAccessorySetupInHome:accessoryUUIDs:](HUHomeUIServiceLaunchUserInfo, "userInfoForResumeAccessorySetupInHome:accessoryUUIDs:", v61, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v117[2](v117, v64, &stru_1E6F60E80);
    }
    else if (v116)
    {
      -[HUItemModuleController module](self, "module");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "context");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "home");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUHomeUIServiceLaunchUserInfo userInfoForSafetyAndSecurityInHome:](HUHomeUIServiceLaunchUserInfo, "userInfoForSafetyAndSecurityInHome:", v69);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v117[2](v117, v64, &stru_1E6F60E80);
    }
    else if (v115)
    {
      -[HUItemModuleController module](self, "module");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "context");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "home");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUHomeUIServiceLaunchUserInfo userInfoForSiriEndpointInHome:](HUHomeUIServiceLaunchUserInfo, "userInfoForSiriEndpointInHome:", v74);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v117[2](v117, v64, &stru_1E6F60E80);
    }
    else if (objc_msgSend(v48, "na_any:", &__block_literal_global_114))
    {
      -[HUItemModuleController module](self, "module");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "context");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "home");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUHomeUIServiceLaunchUserInfo userInfoForLockAccessFirmwareUpgradeSetupInHome:](HUHomeUIServiceLaunchUserInfo, "userInfoForLockAccessFirmwareUpgradeSetupInHome:", v83);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v117[2](v117, v64, &stru_1E6F60E80);
    }
    else if (objc_msgSend(v48, "na_any:", &__block_literal_global_115_0))
    {
      -[HUItemModuleController module](self, "module");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "context");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "home");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUHomeUIServiceLaunchUserInfo userInfoForLockAccessWalletKeySetupInHome:](HUHomeUIServiceLaunchUserInfo, "userInfoForLockAccessWalletKeySetupInHome:", v104);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v117[2](v117, v64, &stru_1E6F60E80);
    }
    else
    {
      if (!objc_msgSend(v48, "na_any:", &__block_literal_global_116))
      {
LABEL_60:

        goto LABEL_61;
      }
      -[HUItemModuleController module](self, "module");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "context");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "home");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUHomeUIServiceLaunchUserInfo userInfoForLockAccessPinCodeSetupInHome:](HUHomeUIServiceLaunchUserInfo, "userInfoForLockAccessPinCodeSetupInHome:", v107);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "homeManager");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "launchHomeUIServiceToResumeSetupWithUserInfo:completionHandler:", v64, &__block_literal_global_117);

    }
    goto LABEL_60;
  }
  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bannerItemProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "multiUserTokenFixBannerItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "isEqual:", v14);

  if (v15)
  {
    -[HUItemModuleController module](self, "module");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bannerItemProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "multiUserTokenFixBannerItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "homeMediaAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc(MEMORY[0x1E0CFDED0]);
    -[HUItemModuleController module](self, "module");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemModuleController host](self, "host");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v20, "initWithAccount:homeIdentifier:viewController:", v19, v24, v25);
    -[HUBannerItemModuleController setMultiUserTokenFixTask:](self, "setMultiUserTokenFixTask:", v26);

    -[HUBannerItemModuleController multiUserTokenFixTask](self, "multiUserTokenFixTask");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "performTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemModuleController module](self, "module");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bannerItemProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "multiUserTokenFixBannerItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setForceHidden:", 1);

    v32 = (void *)MEMORY[0x1E0D314C0];
    v33 = (void *)MEMORY[0x1E0C99E60];
    -[HUItemModuleController module](self, "module");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bannerItemProvider");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "multiUserTokenFixBannerItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "na_setWithSafeObject:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "requestToUpdateItems:senderSelector:", v37, a2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemModuleController module](self, "module");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "itemUpdater");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (id)objc_msgSend(v40, "performItemUpdateRequest:", v38);
    objc_initWeak((id *)buf, self);
    v120[0] = MEMORY[0x1E0C809B0];
    v120[1] = 3221225472;
    v120[2] = __46__HUBannerItemModuleController_didSelectItem___block_invoke_8;
    v120[3] = &unk_1E6F54F38;
    objc_copyWeak(v124, (id *)buf);
    v124[1] = (id)a2;
    v42 = v19;
    v121 = v42;
    v43 = v40;
    v122 = v43;
    v44 = v38;
    v123 = v44;
    objc_msgSend(v28, "addFinishBlock:", v120);

    objc_destroyWeak(v124);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      HFLogForCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v129 = self;
        _os_log_impl(&dword_1B8E1E000, v45, OS_LOG_TYPE_DEFAULT, "%@: User tapped See home hubs", buf, 0xCu);
      }

      -[HUBannerItemModuleController delegate](self, "delegate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "didSelectUnreachableResidentsBanner:", self);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        HFLogForCategory();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v129 = self;
          _os_log_impl(&dword_1B8E1E000, v65, OS_LOG_TYPE_DEFAULT, "%@: User tapped WelcomeUIBanner", buf, 0xCu);
        }

        -[HUBannerItemModuleController delegate](self, "delegate");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "didSelectWelcomeBanner:", self);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          HFLogForCategory();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v129 = self;
            _os_log_impl(&dword_1B8E1E000, v70, OS_LOG_TYPE_DEFAULT, "%@: User tapped HomeHubMigrationBanner", buf, 0xCu);
          }

          -[HUBannerItemModuleController delegate](self, "delegate");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "didSelectHomeHubMigrationBanner:", self);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            HFLogForCategory();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v129 = self;
              _os_log_impl(&dword_1B8E1E000, v75, OS_LOG_TYPE_DEFAULT, "%@: User tapped Media Service Error Banner", buf, 0xCu);
            }

            objc_msgSend(v5, "latestResults");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("HFResultMediaServiceBundleIdentifierKey"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99E98], "hf_appStoreURLForBundleIdentifier:", v77);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = (id)objc_msgSend(v79, "openURL:", v78);

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              HFLogForCategory();
              v84 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v129 = self;
                _os_log_impl(&dword_1B8E1E000, v84, OS_LOG_TYPE_DEFAULT, "%@: User tapped DropIn Banner", buf, 0xCu);
              }

              objc_opt_class();
              v85 = v5;
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v86 = v85;
              else
                v86 = 0;
              v87 = v86;

              objc_msgSend(v87, "device");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              -[HUItemModuleController module](self, "module");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "context");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "home");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "homeKitIdentifier");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "hf_accessoryWithIdentifier:", v92);
              v93 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              -[HUItemModuleController host](self, "host");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v95 = v94;
              else
                v95 = 0;
              v96 = v95;

              v97 = [HUHomeControlServiceContext alloc];
              objc_msgSend(v93, "home");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = -[HUHomeControlServiceContext initWithServiceType:home:accessory:presentingViewController:](v97, "initWithServiceType:home:accessory:presentingViewController:", 2, v98, v93, v96);

              HFLogForCategory();
              v100 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v129 = self;
                v130 = 2112;
                v131 = (const char *)v93;
                _os_log_impl(&dword_1B8E1E000, v100, OS_LOG_TYPE_DEFAULT, "%@: Launching dropin session for accessory: %@", buf, 0x16u);
              }

              +[HUHomeControlServiceManager sharedInstance](HUHomeControlServiceManager, "sharedInstance");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "launchServiceWithContext:", v99);

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[HUBannerItemModuleController upgradeCameraSelected](self, "upgradeCameraSelected");
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v5, "latestResults");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v111, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B98]);
                  v112 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v112)
                  {
                    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
                    v113 = (void *)objc_claimAutoreleasedReturnValue();
                    v114 = (id)objc_msgSend(v113, "openURL:", v112);

                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_63:
  -[HUBannerItemModuleController _sendBannerInteractionforItem:tappedBannerItemOverrideClassName:](self, "_sendBannerInteractionforItem:tappedBannerItemOverrideClassName:", v5, 0);

  return 0;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", HFAccessorySetupFlowTypeResume);

  return v3;
}

void __46__HUBannerItemModuleController_didSelectItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__HUBannerItemModuleController_didSelectItem___block_invoke_3;
  v12[3] = &unk_1E6F54E08;
  v9 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "launchHomeUIServiceToResumeSetupWithUserInfo:completionHandler:", v11, v12);

}

void __46__HUBannerItemModuleController_didSelectItem___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = a1[7];
    v9 = 138413570;
    v10 = v5;
    v11 = 2080;
    v12 = "-[HUBannerItemModuleController didSelectItem:]_block_invoke_3";
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v3;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Launched home ui service to resume setup with user info %@. accessorySetupFlows = %@. error = %@. %@", (uint8_t *)&v9, 0x3Eu);
  }

}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_106(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", HFAccessorySetupFlowTypeSafetyAndSecurity);

  return v3;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_2_108(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", HFAccessorySetupFlowTypeSiriEndpoint);

  return v3;
}

id __46__HUBannerItemModuleController_didSelectItem___block_invoke_3_111(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessFirmwareUpdatePinCode) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessFirmwareUpdateAll) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v2, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessFirmwareUpdateWalletKey);

    }
  }

  return v4;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessAll) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessWalletKey) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v2, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessWalletKeyUWB);

    }
  }

  return v4;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessPinCode);

  return v3;
}

void __46__HUBannerItemModuleController_didSelectItem___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bannerItemProvider");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "multiUserTokenFixBannerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setForceHidden:", 0);

  LOBYTE(v9) = objc_msgSend(v6, "BOOLValue");
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "module");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@ Successfully fixed MultiUser Token for MediaAccount [%@] in Home [%@]", buf, 0x20u);

    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __46__HUBannerItemModuleController_didSelectItem___block_invoke_119;
    v23[3] = &unk_1E6F4C638;
    v24 = *(id *)(a1 + 40);
    v25 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v23);

    v12 = v24;
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "module");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v27 = v18;
    v28 = 2112;
    v29 = v19;
    v30 = 2112;
    v31 = v22;
    v32 = 2112;
    v33 = v5;
    _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "%@ Error in fixing MultiUser Token for MediaAccount [%@] in Home [%@] - %@", buf, 0x2Au);

  }
}

id __46__HUBannerItemModuleController_didSelectItem___block_invoke_119(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "performItemUpdateRequest:", *(_QWORD *)(a1 + 40));
}

void __57__HUBannerItemModuleController_fetchMediaAccountForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "%@ Error fetching media account for home with identifier [%@] - [%@]", (uint8_t *)&v8, 0x20u);

  }
}

void __57__HUBannerItemModuleController_fetchMediaAccountForHome___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412546;
    v28 = v6;
    v29 = 2112;
    v30 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting media account for home with identifier [%@]", (uint8_t *)&v27, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bannerItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "multiUserTokenFixBannerItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHomeMediaAccount:", v9);

  objc_msgSend(WeakRetained, "module");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemUpdater");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstFullItemUpdateFuture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isFinished");

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0D314C0];
    v18 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(WeakRetained, "module");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bannerItemProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "multiUserTokenFixBannerItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "na_setWithSafeObject:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requestToUpdateItems:senderSelector:", v22, *(_QWORD *)(a1 + 48));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "module");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "itemUpdater");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v25, "performItemUpdateRequest:", v23);

  }
}

- (void)user:(id)a3 didUpdateNeedsiTunesMultiUserRepair:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v6 = (void *)MEMORY[0x1E0D314C0];
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HUItemModuleController module](self, "module", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bannerItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "multiUserTokenFixBannerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_setWithSafeObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestToUpdateItems:senderSelector:", v11, a2);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itemUpdater");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "performItemUpdateRequest:", v15);

}

- (void)dismissCameraUpgradeBanner
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17[2];
  id buf[2];

  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing camera upgrade banner.", (uint8_t *)buf, 2u);
  }

  v5 = objc_alloc(MEMORY[0x1E0D31988]);
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithHome:user:nameStyle:", v8, v12, 0);

  objc_initWeak(buf, self);
  objc_msgSend(v13, "setDismissCameraUpgradeBanner:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__HUBannerItemModuleController_dismissCameraUpgradeBanner__block_invoke;
  v16[3] = &unk_1E6F519F8;
  objc_copyWeak(v17, buf);
  v17[1] = (id)a2;
  v15 = (id)objc_msgSend(v14, "addCompletionBlock:", v16);

  objc_destroyWeak(v17);
  objc_destroyWeak(buf);

}

void __58__HUBannerItemModuleController_dismissCameraUpgradeBanner__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D314C0];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bannerItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraUpgradeOfferBannerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_setWithSafeObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToUpdateItems:senderSelector:", v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemUpdater");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "performItemUpdateRequest:", v8);

}

- (void)upgradeCameraSelected
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56[2];
  _QWORD v57[3];
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  -[HUItemModuleController module](self, "module");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_allCameraProfilesSupportingRecording");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v5, "count");

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v59 = v45;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Upgrade camera selected. Number of cameras supporting recording %lu", buf, 0xCu);
  }

  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bannerItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraUpgradeOfferBannerItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sheetActionText");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = objc_alloc_init(MEMORY[0x1E0D83148]);
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bannerItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cameraUpgradeOfferBannerItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sheetTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setTitle:", v13);

  -[HUItemModuleController module](self, "module");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bannerItemProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cameraUpgradeOfferBannerItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sheetMessage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setSubtitle:", v17);

  objc_msgSend(v51, "setDismissalType:", 3);
  v18 = objc_alloc(MEMORY[0x1E0CEA658]);
  HUImageNamed(CFSTR("Onboarding-Camera"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v18, "initWithImage:", v19);

  objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v51, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v49);

  objc_msgSend(v51, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mainContentGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v49, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v24;
  objc_msgSend(v49, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v27;
  objc_msgSend(v49, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v31);

  objc_initWeak((id *)buf, self);
  v32 = (void *)MEMORY[0x1E0D83140];
  v33 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke;
  v55[3] = &unk_1E6F54FB0;
  objc_copyWeak(v56, (id *)buf);
  v56[1] = v45;
  objc_msgSend(v32, "actionWithTitle:style:handler:", v46, 0, v55);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_msgSend(v51, "addAction:", v34);

  v36 = (void *)MEMORY[0x1E0D83140];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSetupLater"), CFSTR("HUSetupLater"), 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v33;
  v52[1] = 3221225472;
  v52[2] = __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke_158;
  v52[3] = &unk_1E6F54F88;
  objc_copyWeak(&v54, (id *)buf);
  v38 = v51;
  v53 = v38;
  objc_msgSend(v36, "actionWithTitle:style:handler:", v37, 1, v52);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend(v38, "addAction:", v39);

  objc_opt_class();
  -[HUItemModuleController host](self, "host");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v42 = v41;
  else
    v42 = 0;
  v43 = v42;

  objc_msgSend(v43, "presentProxCardFlowWithDelegate:initialViewController:", self, v38);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerItemModuleController setProxCardNavigationController:](self, "setProxCardNavigationController:", v44);

  objc_destroyWeak(&v54);
  objc_destroyWeak(v56);
  objc_destroyWeak((id *)buf);

}

void __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  HUCameraRecordingOptionsTableViewController *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  HUMultiCameraRecordingOptionsTableViewController *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t buf[16];

  v47 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "camera upgrade - continue tapped. Present camera upgrade sheet", buf, 2u);
  }

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissCameraUpgradeBanner");
  if (*(_QWORD *)(a1 + 40) == 1)
  {
    objc_msgSend(WeakRetained, "module");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_allCameraProfilesSupportingRecording");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0D31228]);
    objc_msgSend(WeakRetained, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_characteristicValueManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "initWithProfile:valueSource:", v10, v15);

    v17 = (id)objc_msgSend(v16, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
    v18 = -[HUCameraRecordingOptionsTableViewController initWithServiceLikeItem:]([HUCameraRecordingOptionsTableViewController alloc], "initWithServiceLikeItem:", v16);
    -[HUCameraRecordingOptionsTableViewController setDisplayStyle:](v18, "setDisplayStyle:", 2);
    objc_msgSend(v10, "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUProximityCardNamedCameraSetupCardSubtitle"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = [HUMultiCameraRecordingOptionsTableViewController alloc];
    objc_msgSend(WeakRetained, "module");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "home");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HUMultiCameraRecordingOptionsTableViewController initWithHome:](v28, "initWithHome:", v31);

    _HULocalizedStringWithDefaultValue(CFSTR("HUProximityCardAllCamerasSetupCardSubtitle"), CFSTR("HUProximityCardAllCamerasSetupCardSubtitle"), 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUCameraRecordingOptionsTableViewController view](v18, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUCameraRecordingOptionsTableViewController tableView](v18, "tableView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83158]), "initWithCardStyle:scrollView:", 0, v33);
  objc_msgSend(v33, "_setTopPadding:", 0.0);
  objc_msgSend(v33, "_setBottomPadding:", 0.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v35);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "backgroundView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBackgroundColor:", v36);

  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83148]), "initWithContentView:", v34);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSetup_Title"), CFSTR("HUCameraRecordingSetup_Title"), 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTitle:", v39);

  objc_msgSend(v38, "setSubtitle:", v27);
  objc_msgSend(v38, "addChildViewController:", v18);
  -[HUCameraRecordingOptionsTableViewController didMoveToParentViewController:](v18, "didMoveToParentViewController:", v38);
  objc_msgSend(v38, "setDismissalType:", 3);
  v40 = (void *)MEMORY[0x1E0D83140];
  _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke_153;
  v48[3] = &unk_1E6F54F88;
  objc_copyWeak(&v50, v4);
  v42 = v38;
  v49 = v42;
  objc_msgSend(v40, "actionWithTitle:style:handler:", v41, 0, v48);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (id)objc_msgSend(v42, "addAction:", v43);

  objc_msgSend(WeakRetained, "proxCardNavigationController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (id)objc_msgSend(v45, "hu_pushPreloadableViewController:animated:", v42, 1);

  objc_destroyWeak(&v50);
}

void __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke_153(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "camera upgrade - done tapped", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[HUViewControllerDismissalRequest requestWithViewController:](HUViewControllerDismissalRequest, "requestWithViewController:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "moduleController:dismissViewControllerForRequest:", WeakRetained, v4);

}

void __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke_158(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t v11[16];

  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "camera upgrade - setup later tapped", v11, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissCameraUpgradeBanner");
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  +[HUViewControllerDismissalRequest requestWithViewController:](HUViewControllerDismissalRequest, "requestWithViewController:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "moduleController:dismissViewControllerForRequest:", WeakRetained, v8);

}

- (void)_sendBannerInteractionforItem:(id)a3 tappedBannerItemOverrideClassName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v12 = v9;

  v10 = (void *)MEMORY[0x1E0D31170];
  objc_msgSend(v12, "hiddenBanners");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendBannerInteractionforItem:tappedBannerItemOverrideClassName:hiddenBannerEvents:", v7, v6, v11);

}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (AMSUIUpdateMultiUserTokenTask)multiUserTokenFixTask
{
  return self->_multiUserTokenFixTask;
}

- (void)setMultiUserTokenFixTask:(id)a3
{
  objc_storeStrong((id *)&self->_multiUserTokenFixTask, a3);
}

- (UINavigationController)proxCardNavigationController
{
  return self->_proxCardNavigationController;
}

- (void)setProxCardNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_proxCardNavigationController, a3);
}

- (HUBannerItemModuleControllerDelegate)delegate
{
  return (HUBannerItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxCardNavigationController, 0);
  objc_storeStrong((id *)&self->_multiUserTokenFixTask, 0);
  objc_storeStrong((id *)&self->_homeMediaAccountFuture, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
