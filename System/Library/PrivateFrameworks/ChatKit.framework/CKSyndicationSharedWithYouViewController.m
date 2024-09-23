@implementation CKSyndicationSharedWithYouViewController

- (void)loadView
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKSyndicationSharedWithYouViewController;
  -[CKSyndicationSharedWithYouViewController loadView](&v15, sel_loadView);
  objc_msgSend(MEMORY[0x1E0D39AE8], "onboardingAppBundleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationSharedWithYouViewController setDefaultAppBundleIDs:](self, "setDefaultAppBundleIDs:", v3);

  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  -[CKSyndicationSharedWithYouViewController setView:](self, "setView:", v9);

  -[CKSyndicationSharedWithYouViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA410]), "initWithFrame:collectionViewLayout:", v11, v5, v6, v7, v8);
  -[CKSyndicationSharedWithYouViewController setCollectionView:](self, "setCollectionView:", v12);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setDataSource:", self);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v12, "setClipsToBounds:", 0);
  objc_msgSend(v12, "setSemanticContentAttribute:", 3);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKSyndicationSharedWithYouViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v12);

}

- (void)setMaxContentSize:(CGSize)a3
{
  void *v5;
  void *v6;
  id v7;

  if (a3.width != self->_maxContentSize.width || a3.height != self->_maxContentSize.height)
  {
    self->_maxContentSize = a3;
    -[CKSyndicationSharedWithYouViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateLayout");

    -[CKSyndicationSharedWithYouViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsUpdateConstraints");

  }
}

- (void)updateViewConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  objc_super v34;
  _QWORD v35[7];

  v35[5] = *MEMORY[0x1E0C80C00];
  -[CKSyndicationSharedWithYouViewController constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[CKSyndicationSharedWithYouViewController constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

  }
  -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
  v8 = v7;
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    v9 = 0.45;
  }
  else
  {
    v9 = 0.75;
    if (!CKIsRunningInMacCatalyst())
    {
      v10 = v8 * 0.8;
      goto LABEL_9;
    }
  }
  -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
  v10 = v11 * v9;
LABEL_9:
  -[CKSyndicationSharedWithYouViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", v10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v31;
  -[CKSyndicationSharedWithYouViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v28;
  -[CKSyndicationSharedWithYouViewController collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v25;
  -[CKSyndicationSharedWithYouViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v14;
  -[CKSyndicationSharedWithYouViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationSharedWithYouViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationSharedWithYouViewController setConstraints:](self, "setConstraints:", v20);

  -[CKSyndicationSharedWithYouViewController constraints](self, "constraints");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0CB3718];
    -[CKSyndicationSharedWithYouViewController constraints](self, "constraints");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v24);

  }
  v34.receiver = self;
  v34.super_class = (Class)CKSyndicationSharedWithYouViewController;
  -[CKSyndicationSharedWithYouViewController updateViewConstraints](&v34, sel_updateViewConstraints);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CKSyndicationSharedWithYouViewController defaultAppBundleIDs](self, "defaultAppBundleIDs", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;

  v5 = a4;
  -[CKSyndicationSharedWithYouViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  +[CKAppIconCollectionViewCell reuseIdentifier](CKAppIconCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  -[CKSyndicationSharedWithYouViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAppIconCollectionViewCell reuseIdentifier](CKAppIconCollectionViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSyndicationSharedWithYouViewController defaultAppBundleIDs](self, "defaultAppBundleIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "item");

  objc_msgSend(v12, "objectAtIndex:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[CKSyndicationSharedWithYouViewController _appIconNameForBundleID:](self, "_appIconNameForBundleID:", v14);
  if (v15 != -1)
    objc_msgSend(v11, "configureWithAppName:", v15);

  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v11 = v13 / 15.0;
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v12 = v14 / 15.0;
  }
  else
  {
    v6 = CKIsRunningInMacCatalyst();
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v8 = v7;
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    if (v6)
      v10 = 8.5;
    else
      v10 = 7.0;
    v11 = v8 / v10;
    v12 = v9 / v10;
  }
  v15 = v11;
  result.height = v12;
  result.width = v15;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  int v6;
  double v7;
  double v8;
  double v10;

  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    return v10 / 25.0;
  }
  else
  {
    v6 = CKIsRunningInMacCatalyst();
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    if (v6)
      v8 = 35.0;
    else
      v8 = 14.5;
    return v7 / v8;
  }
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  int v6;
  double v7;
  double result;
  double v9;
  double v10;

  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    return v10 / 25.0;
  }
  else
  {
    v6 = CKIsRunningInMacCatalyst();
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    result = v7 / 14.5;
    v9 = v7 / 10.0;
    if (v6)
      return v9;
  }
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v8 = v17 / 15.0;
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v15 = v18 / 20.0;
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v12 = v19 / 15.0;
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v16 = v20 / 20.0;
  }
  else
  {
    v6 = CKIsRunningInMacCatalyst();
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v8 = v7 / 7.0;
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v10 = v9;
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    v12 = v11 / 7.0;
    -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
    if (v6)
      v14 = 10.0;
    else
      v14 = 15.0;
    v15 = v10 / v14;
    v16 = v13 / v14;
  }
  v21 = v8;
  v22 = v15;
  v23 = v12;
  result.right = v16;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v6 = a3;
  if (!IMSharedHelperDeviceIsiPad() || CKIsRunningInMacCatalyst())
    CKIsRunningInMacCatalyst();
  objc_msgSend(v6, "frame");
  v8 = v7;
  -[CKSyndicationSharedWithYouViewController maxContentSize](self, "maxContentSize");
  v10 = v9 / 40.0;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)_appIconNameForBundleID:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0)
    {
      v4 = 3;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0)
    {
      v4 = 5;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
    {
      v4 = 2;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.tv")) & 1) != 0)
    {
      v4 = 4;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
    {
      v4 = 0;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Music")))
    {
      v4 = 1;
    }
    else
    {
      v4 = -1;
    }
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (CGSize)maxContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxContentSize.width;
  height = self->_maxContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSArray)defaultAppBundleIDs
{
  return self->_defaultAppBundleIDs;
}

- (void)setDefaultAppBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAppBundleIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
