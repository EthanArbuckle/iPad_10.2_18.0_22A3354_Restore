@implementation ICAttributionView

- (ICAttributionView)initWithConfiguration:(id)a3
{
  id v5;
  ICAttributionView *v6;
  ICAttributionView *v7;
  id v8;
  uint64_t v9;
  UIView *attributionClippingView;
  void *v11;
  id v12;
  uint64_t v13;
  UILabel *attributionLabel;
  id v15;
  uint64_t v16;
  UILabel *timestampLabel;
  id v18;
  uint64_t v19;
  UIImageView *disclosureImageView;
  void *v21;
  id v22;
  uint64_t v23;
  UIImageView *statusImageView;
  uint64_t v25;
  NSMapTable *childAttributionViews;
  uint64_t v27;
  NSMapTable *highlightViews;
  objc_super v30;

  v5 = a3;
  objc_msgSend(v5, "adjustedFrame");
  v30.receiver = self;
  v30.super_class = (Class)ICAttributionView;
  v6 = -[ICAttributionView initWithFrame:](&v30, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(v5, "attributionFrame");
    objc_msgSend(v5, "attributionFrame");
    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[ICAttributionView frame](v7, "frame");
    v9 = objc_msgSend(v8, "initWithFrame:", 0.0, 0.0);
    attributionClippingView = v7->_attributionClippingView;
    v7->_attributionClippingView = (UIView *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_attributionClippingView, "setBackgroundColor:", v11);

    -[ICAttributionView insertSubview:atIndex:](v7, "insertSubview:atIndex:", v7->_attributionClippingView, 0);
    v12 = objc_alloc(MEMORY[0x1E0DC3990]);
    objc_msgSend(v5, "attributionFrame");
    v13 = objc_msgSend(v12, "initWithFrame:");
    attributionLabel = v7->_attributionLabel;
    v7->_attributionLabel = (UILabel *)v13;

    -[UILabel setTextAlignment:](v7->_attributionLabel, "setTextAlignment:", 2);
    -[UILabel setLineBreakMode:](v7->_attributionLabel, "setLineBreakMode:", 5);
    -[ICAttributionView addSubview:](v7, "addSubview:", v7->_attributionLabel);
    v15 = objc_alloc(MEMORY[0x1E0DC3990]);
    objc_msgSend(v5, "adjustedFormattedTimestampFrame");
    v16 = objc_msgSend(v15, "initWithFrame:");
    timestampLabel = v7->_timestampLabel;
    v7->_timestampLabel = (UILabel *)v16;

    -[UILabel setTextAlignment:](v7->_timestampLabel, "setTextAlignment:", 2);
    -[ICAttributionView insertSubview:atIndex:](v7, "insertSubview:atIndex:", v7->_timestampLabel, 0);
    v18 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v5, "disclosureImageFrame");
    v19 = objc_msgSend(v18, "initWithFrame:");
    disclosureImageView = v7->_disclosureImageView;
    v7->_disclosureImageView = (UIImageView *)v19;

    -[UIImageView setContentMode:](v7->_disclosureImageView, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v7->_disclosureImageView, "setTintColor:", v21);

    -[ICAttributionView addSubview:](v7, "addSubview:", v7->_disclosureImageView);
    v22 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v5, "statusImageFrame");
    v23 = objc_msgSend(v22, "initWithFrame:");
    statusImageView = v7->_statusImageView;
    v7->_statusImageView = (UIImageView *)v23;

    -[UIImageView setContentMode:](v7->_statusImageView, "setContentMode:", 4);
    -[ICAttributionView addSubview:](v7, "addSubview:", v7->_statusImageView);
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 5);
    v25 = objc_claimAutoreleasedReturnValue();
    childAttributionViews = v7->_childAttributionViews;
    v7->_childAttributionViews = (NSMapTable *)v25;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 5);
    v27 = objc_claimAutoreleasedReturnValue();
    highlightViews = v7->_highlightViews;
    v7->_highlightViews = (NSMapTable *)v27;

    -[ICAttributionView updateContentAnimated:](v7, "updateContentAnimated:", 0);
  }

  return v7;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  -[ICAttributionView updateContentAnimated:](self, "updateContentAnimated:", 0);
  -[ICAttributionView updatePositionAndVisibility](self, "updatePositionAndVisibility");
}

- (void)updateContentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  double *v10;
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
  uint64_t v21;
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  uint64_t v53;
  ICAttributionView *v54;
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
  char v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  void *v80;
  ICAttributionHighlightView *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t n;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[5];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v3 = a3;
  v122 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[ICAttributionView configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attribution");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttributionView attributionLabel](self, "attributionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToAttributedString:", v8);

    v10 = (double *)MEMORY[0x1E0D648E0];
    if (v9)
    {
      v11 = *MEMORY[0x1E0D648E0];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTimingFunction:", v13);

      objc_msgSend(v12, "setType:", *MEMORY[0x1E0CD3170]);
      v11 = *v10;
      objc_msgSend(v12, "setDuration:", *v10);
      -[ICAttributionView attributionLabel](self, "attributionLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAnimation:forKey:", v12, CFSTR("kCATransitionFade"));

    }
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = __43__ICAttributionView_updateContentAnimated___block_invoke;
    v116[3] = &unk_1EA7DD2D8;
    v116[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v116, v11);
  }
  else
  {
    -[ICAttributionView updateVisibility](self, "updateVisibility");
  }
  -[ICAttributionView configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", objc_msgSend(v16, "isBlurred") ^ 1);

  -[ICAttributionView configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attribution");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionView attributionLabel](self, "attributionLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAttributedText:", v18);

  -[ICAttributionView configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "formattedTimestamp");
  v21 = objc_claimAutoreleasedReturnValue();

  -[ICAttributionView timestampLabel](self, "timestampLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (void *)v21;
  objc_msgSend(v22, "setAttributedText:", v21);

  -[ICAttributionView configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "disclosureImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionView disclosureImageView](self, "disclosureImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setImage:", v24);

  -[ICAttributionView configuration](self, "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "statusImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionView statusImageView](self, "statusImageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setImage:", v27);

  -[ICAttributionView childAttributionViews](self, "childAttributionViews");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectEnumerator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "ic_map:", &__block_literal_global_10);
  v32 = objc_claimAutoreleasedReturnValue();

  v94 = (void *)v32;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0C99E60];
  -[ICAttributionView configuration](self, "configuration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "childConfigurations");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v33, "isEqualToSet:", v37);

  if ((v38 & 1) == 0)
  {
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    -[ICAttributionView childAttributionViews](self, "childAttributionViews");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectEnumerator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "allObjects");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v113 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * i), "removeFromSuperview");
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
      }
      while (v43);
    }

    -[ICAttributionView childAttributionViews](self, "childAttributionViews");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "removeAllObjects");

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    -[ICAttributionView configuration](self, "configuration");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "childConfigurations");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v109;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v109 != v51)
            objc_enumerationMutation(v48);
          v53 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * j);
          v54 = -[ICAttributionView initWithConfiguration:]([ICAttributionView alloc], "initWithConfiguration:", v53);
          -[ICAttributionView insertSubview:atIndex:](self, "insertSubview:atIndex:", v54, 0);
          -[ICAttributionView childAttributionViews](self, "childAttributionViews");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKey:", v54, v53);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
      }
      while (v50);
    }

  }
  -[ICAttributionView highlightViews](self, "highlightViews");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectEnumerator");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "allObjects");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "ic_map:", &__block_literal_global_20);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)MEMORY[0x1E0C99E60];
  -[ICAttributionView configuration](self, "configuration");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "highlightConfigurations");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setWithArray:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v60, "isEqualToSet:", v64);

  if ((v65 & 1) == 0)
  {
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    -[ICAttributionView highlightViews](self, "highlightViews");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "objectEnumerator");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "allObjects");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v105;
      do
      {
        for (k = 0; k != v70; ++k)
        {
          if (*(_QWORD *)v105 != v71)
            objc_enumerationMutation(v68);
          objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * k), "removeFromSuperview");
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
      }
      while (v70);
    }
    v93 = v59;

    -[ICAttributionView highlightViews](self, "highlightViews");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "removeAllObjects");

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    -[ICAttributionView configuration](self, "configuration");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "highlightConfigurations");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v101;
      do
      {
        for (m = 0; m != v77; ++m)
        {
          if (*(_QWORD *)v101 != v78)
            objc_enumerationMutation(v75);
          v80 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * m);
          v81 = -[ICAttributionHighlightView initWithConfiguration:]([ICAttributionHighlightView alloc], "initWithConfiguration:", v80);
          objc_msgSend(v80, "alpha");
          -[ICAttributionHighlightView setAlpha:](v81, "setAlpha:");
          -[ICAttributionView addSubview:](self, "addSubview:", v81);
          -[ICAttributionView highlightViews](self, "highlightViews");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setObject:forKey:", v81, v80);

        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
      }
      while (v77);
    }

    v59 = v93;
  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[ICAttributionView childAttributionViews](self, "childAttributionViews");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "objectEnumerator");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "allObjects");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v96, v117, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v97;
    do
    {
      for (n = 0; n != v87; ++n)
      {
        if (*(_QWORD *)v97 != v88)
          objc_enumerationMutation(v85);
        objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * n), "updateContentAnimated:", v3);
      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v96, v117, 16);
    }
    while (v87);
  }

  if (-[ICAttributionView ic_isRTL](self, "ic_isRTL"))
    v90 = 0;
  else
    v90 = 2;
  -[ICAttributionView attributionLabel](self, "attributionLabel");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setTextAlignment:", v90);

  -[ICAttributionView timestampLabel](self, "timestampLabel");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setTextAlignment:", v90);

}

uint64_t __43__ICAttributionView_updateContentAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

uint64_t __43__ICAttributionView_updateContentAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "configuration");
}

uint64_t __43__ICAttributionView_updateContentAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "configuration");
}

- (void)updatePositionAndVisibility
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[ICAttributionView configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedFrame");
  -[ICAttributionView setFrame:](self, "setFrame:");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[ICAttributionView configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v9);
        -[ICAttributionView childAttributionViews](self, "childAttributionViews");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "adjustedFrame");
        objc_msgSend(v12, "setFrame:");
        objc_msgSend(v10, "adjustedFormattedTimestampFrame");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(v12, "timestampLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[ICAttributionView configuration](self, "configuration", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "highlightConfigurations");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v27);
        -[ICAttributionView highlightViews](self, "highlightViews");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "adjustedFrame");
        objc_msgSend(v30, "setFrame:");

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v25);
  }

  -[ICAttributionView updateVisibility](self, "updateVisibility");
}

- (void)updateVisibility
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[ICAttributionView configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(objc_msgSend(v3, "isAttributionHidden") ^ 1);
  -[ICAttributionView attributionLabel](self, "attributionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  -[ICAttributionView configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)(objc_msgSend(v6, "isAttributionHidden") ^ 1);
  -[ICAttributionView attributionClippingView](self, "attributionClippingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  -[ICAttributionView configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)(objc_msgSend(v9, "isTimestampHidden") ^ 1);
  -[ICAttributionView timestampLabel](self, "timestampLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v10);

  -[ICAttributionView configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (double)(objc_msgSend(v12, "isStatusImageHidden") ^ 1);
  -[ICAttributionView statusImageView](self, "statusImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v13);

  -[ICAttributionView configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (double)(objc_msgSend(v15, "isDisclosureImageHidden") ^ 1);
  -[ICAttributionView disclosureImageView](self, "disclosureImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", v16);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ICAttributionView configuration](self, "configuration", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "highlightConfigurations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v24, "alpha");
        v26 = v25;
        -[ICAttributionView highlightViews](self, "highlightViews");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setAlpha:", v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v21);
  }

}

- (ICAttributionViewConfiguration)configuration
{
  return self->_configuration;
}

- (UILabel)attributionLabel
{
  return self->_attributionLabel;
}

- (void)setAttributionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_attributionLabel, a3);
}

- (UIView)attributionClippingView
{
  return self->_attributionClippingView;
}

- (void)setAttributionClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionClippingView, a3);
}

- (UILabel)timestampLabel
{
  return self->_timestampLabel;
}

- (void)setTimestampLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timestampLabel, a3);
}

- (UIImageView)disclosureImageView
{
  return self->_disclosureImageView;
}

- (void)setDisclosureImageView:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureImageView, a3);
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (void)setStatusImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusImageView, a3);
}

- (NSMapTable)childAttributionViews
{
  return self->_childAttributionViews;
}

- (void)setChildAttributionViews:(id)a3
{
  objc_storeStrong((id *)&self->_childAttributionViews, a3);
}

- (NSMapTable)highlightViews
{
  return self->_highlightViews;
}

- (void)setHighlightViews:(id)a3
{
  objc_storeStrong((id *)&self->_highlightViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightViews, 0);
  objc_storeStrong((id *)&self->_childAttributionViews, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_disclosureImageView, 0);
  objc_storeStrong((id *)&self->_timestampLabel, 0);
  objc_storeStrong((id *)&self->_attributionClippingView, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
