@implementation EKEventDetailSuggestedLocationCell

- (EKEventDetailSuggestedLocationCell)initWithFrame:(CGRect)a3
{
  EKEventDetailSuggestedLocationCell *v3;
  EKEventDetailSuggestedLocationCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventDetailSuggestedLocationCell;
  v3 = -[EKEventDetailSuggestedLocationCell initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
    -[EKEventDetailSuggestedLocationCell commonInit](v3, "commonInit");
  return v4;
}

- (EKEventDetailSuggestedLocationCell)initWithInlineStyle:(BOOL)a3
{
  EKEventDetailSuggestedLocationCell *v4;
  EKEventDetailSuggestedLocationCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKEventDetailSuggestedLocationCell;
  v4 = -[EKEventDetailSuggestedLocationCell initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_inlineStyle = a3;
    -[EKEventDetailSuggestedLocationCell commonInit](v4, "commonInit");
  }
  return v5;
}

- (void)commonInit
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  _QWORD v27[5];
  _QWORD v28[5];

  EKWeakLinkClass();
  v3 = (objc_class *)EKWeakLinkClass();
  v4 = (void *)EKWeakLinkClass();
  v5 = (void *)objc_opt_new();
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Suggested Location"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(v5, "setAccessoryType:", 1);
  objc_msgSend(v5, "setActionButtonType:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_inlineStyle)
  {
    EKHalfSystemGroupedBackgroundColor();
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v8 = (void *)v9;
  }
  else
  {
    v10 = 3;
  }
  +[EKUIClearButton trailingOffsetToMarginForTextFieldClearButtonAlignment](EKUIClearButton, "trailingOffsetToMarginForTextFieldClearButtonAlignment");
  if (self->_inlineStyle)
    objc_msgSend(v5, "setCloseButtonXAnchorOffset:");
  objc_msgSend(v5, "setBackgroundColor:", v8);
  v11 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithPosition:color:", v10, v12);
  objc_msgSend(v5, "setBannerDivider:", v13);

  EventKitUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Title for suggested location banner primary action button"), CFSTR("Add"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setActionTitle:", v15);
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __48__EKEventDetailSuggestedLocationCell_commonInit__block_invoke;
  v28[3] = &unk_1E60193F8;
  v28[4] = self;
  objc_msgSend(v4, "actionWithTitle:handler:", v15, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryAction:", v17);
  EventKitUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Dismiss"), &stru_1E601DFA8, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __48__EKEventDetailSuggestedLocationCell_commonInit__block_invoke_2;
  v27[3] = &unk_1E60193F8;
  v27[4] = self;
  objc_msgSend(v4, "actionWithTitle:handler:", v19, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDismissAction:", v20);
  -[EKEventDetailSuggestedLocationCell setBanner:](self, "setBanner:", v5);
  -[EKEventDetailSuggestedLocationCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v5);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _NSDictionaryOfVariableBindings(CFSTR("bannerView"), v5, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[bannerView]|"), 0, 0, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v24);

  v25 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[bannerView]|"), 0, 0, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v26);

  objc_msgSend(v5, "reload");
}

uint64_t __48__EKEventDetailSuggestedLocationCell_commonInit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAction");
}

uint64_t __48__EKEventDetailSuggestedLocationCell_commonInit__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAction");
}

- (CGRect)bannerPopoverSourceRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[EKEventDetailSuggestedLocationCell banner](self, "banner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "popoverSourceRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setEvent:(id)a3
{
  id v5;
  EKStructuredLocation *v6;
  EKStructuredLocation *location;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_event, a3);
  v5 = a3;
  objc_msgSend(v5, "preferredLocation");
  v6 = (EKStructuredLocation *)objc_claimAutoreleasedReturnValue();
  location = self->_location;
  self->_location = v6;

  -[EKEventDetailSuggestedLocationCell _setIcon](self, "_setIcon");
  objc_msgSend(MEMORY[0x1E0D0CD88], "locationStringForEvent:options:", v5, 25);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailSuggestedLocationCell banner](self, "banner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSubtitle:", v8);

}

- (void)_setIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("mappin.and.ellipse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, 28.0, 28.0);
  objc_msgSend(v5, "setImage:", v4);
  objc_msgSend(v5, "setContentMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailSuggestedLocationCell banner](self, "banner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImageSGViews:", v7);

  -[EKEventDetailSuggestedLocationCell banner](self, "banner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reload");

}

- (void)_disambiguateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  NSObject *v34;
  dispatch_time_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD block[4];
  id v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD aBlock[5];
  id v50;
  id v51;
  _QWORD v52[3];
  char v53;
  _QWORD v54[4];
  NSObject *v55;
  id v56;
  id v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[4];
  NSObject *v63;
  id v64;
  id v65;
  id v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD v69[3];
  char v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  -[EKEventDetailSuggestedLocationCell window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      objc_msgSend(v4, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v6;
    }
    while (v7);
  }
  else
  {
    v6 = v4;
  }
  -[EKStructuredLocation geoLocation](self->_location, "geoLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinate");
  v10 = v9;
  v12 = v11;

  -[EKStructuredLocation radius](self->_location, "radius");
  v14 = v13;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v70 = 0;
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v16 = (void *)objc_opt_new();
  v17 = EKWeakLinkClass();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27568]), "initWithCoordinate:radius:categories:", 0, v10, v12, fmax(v14 * 1.5, 25.0));
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ticketForSpatialLookupParameters:traits:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke;
  v62[3] = &unk_1E6019498;
  v67 = v69;
  v23 = v15;
  v63 = v23;
  v64 = v21;
  v39 = v18;
  v65 = v39;
  v68 = v17;
  v24 = v16;
  v66 = v24;
  v40 = v64;
  objc_msgSend(v64, "submitWithHandler:networkActivity:", v62, 0);
  dispatch_group_enter(v23);
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__1;
  v60[4] = __Block_byref_object_dispose__1;
  v61 = 0;
  v25 = (void *)MEMORY[0x1E0D0C328];
  -[EKStructuredLocation title](self->_location, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation address](self->_location, "address");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fullDisplayStringWithTitle:address:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D0C300];
  v54[0] = v22;
  v54[1] = 3221225472;
  v54[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_52;
  v54[3] = &unk_1E60194E8;
  v30 = v23;
  v55 = v30;
  v58 = v69;
  v31 = v28;
  v56 = v31;
  v59 = v60;
  v32 = v24;
  v57 = v32;
  objc_msgSend(v29, "geocodeLocationString:withCompletionBlock:", v31, v54);
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v53 = 0;
  aBlock[0] = v22;
  aBlock[1] = 3221225472;
  aBlock[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_55;
  aBlock[3] = &unk_1E6018660;
  aBlock[4] = self;
  v50 = v32;
  v51 = v6;
  v38 = v6;
  v37 = v32;
  block[0] = v22;
  block[1] = 3221225472;
  block[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_4;
  block[3] = &unk_1E6019560;
  v47 = v69;
  v48 = v52;
  v33 = _Block_copy(aBlock);
  v46 = v33;
  v34 = MEMORY[0x1E0C80D38];
  dispatch_group_notify(v30, MEMORY[0x1E0C80D38], block);
  v35 = dispatch_time(0, 1000000000);
  v41[0] = v22;
  v41[1] = 3221225472;
  v41[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_5;
  v41[3] = &unk_1E6019560;
  v43 = v52;
  v44 = v69;
  v42 = v33;
  v36 = v33;
  dispatch_after(v35, v34, v41);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(v69, 8);
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2;
  block[3] = &unk_1E6019470;
  v13 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 72);
  v11 = v4;
  v14 = v5;
  v12 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v2 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 40);
      v4 = v2;
      objc_msgSend(v3, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v5;
      _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_ERROR, "Failed to run spacial lookup for suggested location disambiguation: %@", buf, 0xCu);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "mapItemsForParameters:", *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)objc_opt_new();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(*(id *)(a1 + 48), "mapItemsForParameters:", *(_QWORD *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "_identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v11);
      }

      objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ticketForIdentifiers:traits:", v8, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_41;
      v21[3] = &unk_1E6019448;
      v17 = *(id *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 80);
      v22 = v17;
      v24 = v18;
      v20 = *(_OWORD *)(a1 + 64);
      v19 = (id)v20;
      v23 = v20;
      objc_msgSend(v16, "submitWithHandler:networkActivity:", v21, 0);

    }
  }
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_42;
  block[3] = &unk_1E6019420;
  v13 = *(id *)(a1 + 32);
  v14 = v6;
  v7 = *(_QWORD *)(a1 + 56);
  v15 = v5;
  v17 = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v16 = v11;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_42(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = (void *)kEKUILogHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        return;
      v3 = *(void **)(a1 + 40);
      v4 = v2;
      objc_msgSend(v3, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_ERROR, "Failed to run place lookup for suggested location disambiguation: %@", buf, 0xCu);

    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v4 = *(id *)(a1 + 48);
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v4);
            v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
            v11 = objc_alloc(*(Class *)(a1 + 72));
            v12 = (void *)objc_msgSend(v11, "initWithGeoMapItem:isPlaceHolderPlace:", v10, 0, (_QWORD)v14);
            objc_msgSend(MEMORY[0x1E0CAA158], "locationWithMapItem:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v13);

            ++v9;
          }
          while (v7 != v9);
          v7 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }
    }

  }
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_53;
  block[3] = &unk_1E60194C0;
  v7 = *(id *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 56);
  v11 = v7;
  v12 = v6;
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v17 = *(_QWORD *)(a1 + 64);
  v15 = *(id *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_53(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = (void *)kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        v3 = *(void **)(a1 + 40);
        v4 = *(_QWORD *)(a1 + 48);
        v5 = v2;
        objc_msgSend(v3, "localizedDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v4;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_ERROR, "Error geocoding %@: %@", (uint8_t *)&v10, 0x16u);

      }
    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0CAA158], "locationWithMapItem:");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    }
  }
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_55(uint64_t a1)
{
  EKEventDetailLocationDisambiguationViewController *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  EKEventDetailLocationDisambiguationViewController *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, char, void *);
  void *v11;
  id v12;
  uint64_t v13;

  v2 = [EKEventDetailLocationDisambiguationViewController alloc];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_57;
  v11 = &unk_1E6019538;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v7 = -[EKEventDetailLocationDisambiguationViewController initWithLocation:pois:completionBlock:](v2, "initWithLocation:pois:completionBlock:", v4, v3, &v8);
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v7, 1, 0, v8, v9, v10, v11);

}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_57(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  char v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_3;
  v8[3] = &unk_1E6019510;
  v10 = a2;
  v6 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);

}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_3(uint64_t a1)
{
  id v2;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didTapAddSuggestedLocationCell:disambiguatedLocation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

_QWORD *__59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_4(_QWORD *result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 1;
    return (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  return result;
}

uint64_t __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_5(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = 1;
    v2 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_ERROR, "Timed out fetching POIs for location disambiguation", v3, 2u);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)dismissAction
{
  id v3;

  -[EKEventDetailSuggestedLocationCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didTapDismissSuggestedLocationCell:", self);

}

- (EKEventDetailSuggestedLocationCellDelegate)delegate
{
  return (EKEventDetailSuggestedLocationCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SGBannerProtocol)banner
{
  return self->_banner;
}

- (void)setBanner:(id)a3
{
  objc_storeStrong((id *)&self->_banner, a3);
}

- (BOOL)inlineStyle
{
  return self->_inlineStyle;
}

- (void)setInlineStyle:(BOOL)a3
{
  self->_inlineStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_banner, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
