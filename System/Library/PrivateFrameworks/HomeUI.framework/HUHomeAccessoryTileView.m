@implementation HUHomeAccessoryTileView

- (HUHomeAccessoryTileView)initWithFrame:(CGRect)a3 item:(id)a4 iconOnlyTile:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  HUHomeAccessoryTileView *v12;
  HUHomeAccessoryTileView *v13;
  id v14;
  void *v15;
  uint64_t v16;
  UIImageView *homeView;
  HUGridServiceCell *v18;
  HUGridServiceCell *tileView;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  id (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  id v44;
  objc_super v45;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HUHomeAccessoryTileView;
  v12 = -[HUHomeAccessoryTileView initWithFrame:](&v45, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v12->_iconOnlyTile = v5;
    v14 = objc_alloc(MEMORY[0x1E0CEA658]);
    HUImageNamed(CFSTR("home"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithImage:", v15);
    homeView = v13->_homeView;
    v13->_homeView = (UIImageView *)v16;

    -[UIImageView setContentMode:](v13->_homeView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v13->_homeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUHomeAccessoryTileView addSubview:](v13, "addSubview:", v13->_homeView);
    v18 = objc_alloc_init(HUGridServiceCell);
    tileView = v13->_tileView;
    v13->_tileView = v18;

    v20 = v11;
    v21 = &unk_1EF2AC470;
    if (objc_msgSend(v20, "conformsToProtocol:", v21))
      v22 = v20;
    else
      v22 = 0;
    v23 = v22;

    if (v23)
    {
      v24 = objc_alloc(MEMORY[0x1E0D31920]);
      v39 = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __59__HUHomeAccessoryTileView_initWithFrame_item_iconOnlyTile___block_invoke;
      v42 = &unk_1E6F4E628;
      v43 = v23;
      v44 = v20;
      v25 = (void *)objc_msgSend(v24, "initWithSourceItem:transformationBlock:", v44, &v39);
      -[HUGridServiceCell setItem:](v13->_tileView, "setItem:", v25, v39, v40, v41, v42);

    }
    else
    {
      -[HUGridServiceCell setItem:](v13->_tileView, "setItem:", v20);
    }
    +[HUGridServiceCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridServiceCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContentColorStyle:", 1);
    objc_msgSend(v26, "setShowIconOnly:", v5);
    objc_msgSend(v26, "setShowDescription:", 0);
    if (v5)
      objc_msgSend(v26, "setCellCornerRadius:", 6.0);
    -[HUGridCell setLayoutOptions:](v13->_tileView, "setLayoutOptions:", v26);
    -[HUGridServiceCell setShouldShowRoomName:](v13->_tileView, "setShouldShowRoomName:", 0);
    -[HUGridServiceCell setShouldColorDescription:](v13->_tileView, "setShouldColorDescription:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridServiceCell setDefaultDescriptionColor:](v13->_tileView, "setDefaultDescriptionColor:", v27);

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "CGColor");
    -[HUGridServiceCell layer](v13->_tileView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setShadowColor:", v29);

    v31 = *MEMORY[0x1E0C9D820];
    v32 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[HUGridServiceCell layer](v13->_tileView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setShadowOffset:", v31, v32);

    -[HUGridServiceCell layer](v13->_tileView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = 0.25;
    objc_msgSend(v34, "setShadowOpacity:", v35);

    -[HUGridServiceCell layer](v13->_tileView, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setShadowRadius:", 10.0);

    -[HUGridServiceCell layer](v13->_tileView, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMasksToBounds:", 0);

    -[HUHomeAccessoryTileView updateUIWithAnimation:](v13, "updateUIWithAnimation:", 0);
    -[HUHomeAccessoryTileView addSubview:](v13, "addSubview:", v13->_tileView);

  }
  return v13;
}

id __59__HUHomeAccessoryTileView_initWithFrame_item_iconOnlyTile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = objc_alloc(MEMORY[0x1E0D317E8]);
  objc_msgSend(*(id *)(a1 + 32), "homeKitObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_opt_class();
    v7 = v5;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v7;
      if (v8)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

    }
    v9 = 0;
LABEL_9:

    objc_msgSend(v9, "hf_userFriendlyLocalizedCapitalizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_opt_class();
    v14 = v5;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v9 = v14;
      if (v15)
        goto LABEL_18;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v13, objc_opt_class());

    }
    v9 = 0;
LABEL_18:

    v18 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(v9, "category");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "categoryType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_userFriendlyLocalizedCapitalizedDescription:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  v12 = 0;
LABEL_21:

  v21 = (void *)objc_msgSend(v4, "initWithRawServiceName:rawRoomName:", v12, 0);
  objc_msgSend(v3, "na_safeSetObject:forKey:", v21, *MEMORY[0x1E0D30CD8]);
  objc_msgSend(v3, "setObject:forKey:", &unk_1E7041608, *MEMORY[0x1E0D30E20]);
  objc_opt_class();
  v22 = *(id *)(a1 + 40);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  if (v24)
  {
    objc_msgSend(v24, "accessory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D317C8], "iconDescriptorForAccessory:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D30C60]);

  }
  return v3;
}

- (HUHomeAccessoryTileView)initWithFrame:(CGRect)a3 categoryType:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HUHomeAccessoryTileView *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18[2] = *MEMORY[0x1E0C80C00];
  v9 = (objc_class *)MEMORY[0x1E0D31840];
  v10 = a4;
  v11 = [v9 alloc];
  v17[0] = *MEMORY[0x1E0D30C60];
  objc_msgSend(MEMORY[0x1E0D317C8], "iconDescriptorForAccessoryCategoryOrServiceType:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = *MEMORY[0x1E0D30E20];
  v18[0] = v12;
  v18[1] = &unk_1E7041608;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithResults:", v13);

  v15 = -[HUHomeAccessoryTileView initWithFrame:item:iconOnlyTile:](self, "initWithFrame:item:iconOnlyTile:", v14, 1, x, y, width, height);
  return v15;
}

- (HFServiceLikeItem)item
{
  void *v2;
  void *v3;
  void *v4;
  HFServiceLikeItem *v5;

  -[HUHomeAccessoryTileView tileView](self, "tileView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC470))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (double)aspectRatio
{
  return 0.9;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;

  objc_initWeak(&location, self);
  -[HUHomeAccessoryTileView tileView](self, "tileView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__HUHomeAccessoryTileView_updateUIWithAnimation___block_invoke;
  v9[3] = &unk_1E6F5B978;
  objc_copyWeak(&v10, &location);
  v11 = a3;
  v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__HUHomeAccessoryTileView_updateUIWithAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tileView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateUIWithAnimation:", *(unsigned __int8 *)(a1 + 40));

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat MidX;
  CGFloat MidY;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  _BOOL4 v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat MaxY;
  double v35;
  void *v36;
  double v37;
  double v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v39.receiver = self;
  v39.super_class = (Class)HUHomeAccessoryTileView;
  -[HUHomeAccessoryTileView layoutSubviews](&v39, sel_layoutSubviews);
  -[HUHomeAccessoryTileView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[HUHomeAccessoryTileView iconOnlyTile](self, "iconOnlyTile"))
  {
    v11 = HURoundToScreenScale(v10 * 0.9);
    v12 = v10;
  }
  else
  {
    v12 = HURoundToScreenScale(v8 / 0.9);
    v11 = v8;
  }
  v40.origin.x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  MidX = CGRectGetMidX(v40);
  v38 = HURoundToScreenScale(MidX - v11 * 0.5);
  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  MidY = CGRectGetMidY(v41);
  v37 = HURoundToScreenScale(MidY - v12 * 0.5);
  -[HUHomeAccessoryTileView iconOnlyTile](self, "iconOnlyTile");
  v15 = HURoundToScreenScale(v11);
  v16 = HURoundToScreenScale(v15 / 1.08);
  -[HUHomeAccessoryTileView homeView](self, "homeView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v38, v37, v15, v16);

  -[HUHomeAccessoryTileView homeView](self, "homeView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = -[HUHomeAccessoryTileView iconOnlyTile](self, "iconOnlyTile");
  v28 = 2.7;
  if (v27)
    v28 = 2.48;
  v29 = v12;
  v30 = HURoundToScreenScale(v11 / v28);
  v31 = HURoundToScreenScale(v30);
  v42.origin.x = v20;
  v42.origin.y = v22;
  v42.size.width = v24;
  v42.size.height = v26;
  v32 = CGRectGetMidX(v42);
  v33 = HURoundToScreenScale(v32 - v30 * 0.5);
  v43.origin.y = v37;
  v43.origin.x = v38;
  v43.size.width = v11;
  v43.size.height = v29;
  MaxY = CGRectGetMaxY(v43);
  v35 = HURoundToScreenScale(MaxY - v31);
  -[HUHomeAccessoryTileView tileView](self, "tileView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v33, v35, v30, v31);

}

- (UIImageView)homeView
{
  return self->_homeView;
}

- (HUGridServiceCell)tileView
{
  return self->_tileView;
}

- (BOOL)iconOnlyTile
{
  return self->_iconOnlyTile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileView, 0);
  objc_storeStrong((id *)&self->_homeView, 0);
}

@end
