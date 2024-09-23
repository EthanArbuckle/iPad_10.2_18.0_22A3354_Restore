@implementation CKLocationShareBalloonView

- (CKLocationShareBalloonView)initWithFrame:(CGRect)a3
{
  CKLocationShareBalloonView *v3;
  CKLocationShareBalloonView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKLocationShareBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKLocationShareBalloonView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[CKLocationShareBalloonView setContentMode:](v4, "setContentMode:", 5);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MaxY;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  objc_super v89;
  CGRect v90;
  CGRect v91;

  v89.receiver = self;
  v89.super_class = (Class)CKLocationShareBalloonView;
  -[CKImageBalloonView layoutSubviews](&v89, sel_layoutSubviews);
  -[CKLocationShareBalloonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationShareBalloonButtonHeight");
  v9 = v8;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationShareBalloonLabelMaxHeightForOfferState:", -[CKLocationShareBalloonView offerState](self, "offerState"));
  v12 = v9 + v11;

  -[CKLocationShareBalloonView effectView](self, "effectView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, v6 - v12, v4, v12);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "balloonMaskTailSizeForTailShape:", 1);
  v16 = v15;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "locationShareBalloonButtonHeight");
  v19 = v18;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "locationShareBalloonLabelMaxHeightForOfferState:", -[CKLocationShareBalloonView offerState](self, "offerState"));
  v22 = v21;

  -[CKLocationShareBalloonView bounds](self, "bounds");
  v24 = v23 - v16 + -20.0;
  v25 = v16 + 10.0;
  if (-[CKLocationShareBalloonView offerState](self, "offerState"))
  {
    if (-[CKLocationShareBalloonView offerState](self, "offerState") == 1)
    {
      -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sizeThatFits:", v24, v22);
      v28 = v27;
      v30 = v29;

      -[CKLocationShareBalloonView bounds](self, "bounds");
      v32 = v22 - v30 + v31 - v19;
      -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setFrame:", v25, v32, v28, v30);

      -[CKLocationShareBalloonView locationLabel](self, "locationLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sizeThatFits:", v24, v22);
      v36 = v35;
      v38 = v37;

      v90.origin.x = v25;
      v90.origin.y = v32;
      v90.size.width = v28;
      v90.size.height = v30;
      MaxY = CGRectGetMaxY(v90);
      -[CKLocationShareBalloonView locationLabel](self, "locationLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFrame:", v25, MaxY, v36, v38);

      -[CKLocationShareBalloonView chevron](self, "chevron");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "image");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "size");
      v44 = v43;
      v46 = v45;

      -[CKLocationShareBalloonView bounds](self, "bounds");
      v47 = CGRectGetMaxX(v91) - v44 + -10.0;
      -[CKLocationShareBalloonView bounds](self, "bounds");
      v49 = v48 - v19;
      v50 = (v19 - v46) * 0.5;
      if (CKMainScreenScale_once_8 != -1)
        dispatch_once(&CKMainScreenScale_once_8, &__block_literal_global_18);
      v51 = *(double *)&CKMainScreenScale_sMainScreenScale_8;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_8 == 0.0)
        v51 = 1.0;
      v52 = v49 + ceil(v50 * v51) / v51;
      v53 = v41;
      v54 = v47;
      v55 = v44;
      v56 = v46;
    }
    else
    {
      if (-[CKLocationShareBalloonView offerState](self, "offerState") != 2)
        return;
      -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "sizeThatFits:", v24, v22);
      v84 = v83;
      v86 = v85;

      -[CKLocationShareBalloonView bounds](self, "bounds");
      v88 = v87 - v22;
      -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v53;
      v54 = v25;
      v52 = v88;
      v55 = v84;
      v56 = v86;
    }
  }
  else
  {
    v57 = v22 + -6.0;
    -[CKLocationShareBalloonView bounds](self, "bounds");
    v59 = v58 - v19 - v22 + 3.0;
    -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setFrame:", v16 + 10.0, v59, v24, v57);

    -[CKLocationShareBalloonView bounds](self, "bounds");
    v62 = (v61 - v16) * 0.5;
    if (CKMainScreenScale_once_8 != -1)
      dispatch_once(&CKMainScreenScale_once_8, &__block_literal_global_18);
    v63 = *(double *)&CKMainScreenScale_sMainScreenScale_8;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_8 == 0.0)
      v63 = 1.0;
    v64 = ceil(v62 * v63) / v63;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "locationShareBalloonButtonHeight");
    v67 = v66;

    -[CKLocationShareBalloonView bounds](self, "bounds");
    v69 = v68 - v19;
    -[CKLocationShareBalloonView ignoreButton](self, "ignoreButton");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setFrame:", v16, v69, v64, v67);

    v71 = v16 + v64;
    -[CKLocationShareBalloonView startSharingButton](self, "startSharingButton");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setFrame:", v16 + v64, v69, v64, v67);

    -[CKLocationShareBalloonView bounds](self, "bounds");
    v74 = v73 - v19;
    -[CKLocationShareBalloonView bounds](self, "bounds");
    v76 = v75 - v16;
    if (CKMainScreenScale_once_8 != -1)
      dispatch_once(&CKMainScreenScale_once_8, &__block_literal_global_18);
    v77 = *(double *)&CKMainScreenScale_sMainScreenScale_8;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_8 == 0.0)
      v77 = 1.0;
    v78 = ceil(v77 * 0.5) / v77;
    -[CKLocationShareBalloonView horizontalSeparator](self, "horizontalSeparator");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setFrame:", v16, v74, v76, v78);

    if (CKMainScreenScale_once_8 != -1)
      dispatch_once(&CKMainScreenScale_once_8, &__block_literal_global_18);
    v80 = *(double *)&CKMainScreenScale_sMainScreenScale_8;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_8 == 0.0)
      v80 = 1.0;
    v81 = ceil(v80 * 0.5) / v80;
    -[CKLocationShareBalloonView verticalSeparator](self, "verticalSeparator");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v53;
    v54 = v71;
    v52 = v74;
    v55 = v81;
    v56 = v19;
  }
  objc_msgSend(v53, "setFrame:", v54, v52, v55, v56);

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a4, a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKImageBalloonView image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v9 = v8;

  if (width >= v9)
    width = v9;
  objc_msgSend(v6, "locationShareBalloonSizeForWidth:offerState:", -[CKLocationShareBalloonView offerState](self, "offerState"), width);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)addFilter:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKLocationShareBalloonView;
  -[CKImageBalloonView addFilter:](&v5, sel_addFilter_, a3);
  -[CKLocationShareBalloonView effectView](self, "effectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)clearFilters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKLocationShareBalloonView;
  -[CKImageBalloonView clearFilters](&v4, sel_clearFilters);
  -[CKLocationShareBalloonView effectView](self, "effectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)prepareForDisplay
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  objc_super v82;

  v82.receiver = self;
  v82.super_class = (Class)CKLocationShareBalloonView;
  -[CKImageBalloonView prepareForDisplay](&v82, sel_prepareForDisplay);
  -[CKLocationShareBalloonView effectView](self, "effectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);
    -[CKLocationShareBalloonView setEffectView:](self, "setEffectView:", v6);

    -[CKLocationShareBalloonView effectView](self, "effectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareBalloonView addSubview:](self, "addSubview:", v7);

  }
  -[CKLocationShareBalloonView effectView](self, "effectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationShareBalloonView sendSubviewToBack:](self, "sendSubviewToBack:", v8);

  -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CEA700]);
    v11 = (void *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v11, "setOpaque:", 0);
    objc_msgSend(v11, "setBackgroundColor:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "previewTitleFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v13);

    objc_msgSend(v11, "setTextAlignment:", 4);
    -[CKLocationShareBalloonView titleString](self, "titleString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v14);

    -[CKLocationShareBalloonView setTitleLabel:](self, "setTitleLabel:", v11);
  }
  -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationShareBalloonView titleString](self, "titleString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v16);

  -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationShareBalloonView addSubview:](self, "addSubview:", v17);

  if (-[CKLocationShareBalloonView offerState](self, "offerState"))
  {
    if (-[CKLocationShareBalloonView offerState](self, "offerState") == 1)
    {
      -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLineBreakMode:", 4);

      -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setNumberOfLines:", 1);

      -[CKLocationShareBalloonView locationLabel](self, "locationLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v21 = objc_alloc(MEMORY[0x1E0CEA700]);
        v22 = (void *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        objc_msgSend(v22, "setOpaque:", 0);
        objc_msgSend(v22, "setBackgroundColor:", 0);
        -[CKLocationShareBalloonView locationString](self, "locationString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setText:", v23);

        objc_msgSend(v22, "setAlpha:", 0.400000006);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "previewTitleFont");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFont:", v25);

        -[CKLocationShareBalloonView setLocationLabel:](self, "setLocationLabel:", v22);
      }
      -[CKLocationShareBalloonView chevron](self, "chevron");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v27 = objc_alloc(MEMORY[0x1E0CEA658]);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "chevronImageForColorType:", 0xFFFFFFFFLL);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v27, "initWithImage:", v29);

        objc_msgSend(v30, "setContentMode:", 4);
        -[CKLocationShareBalloonView setChevron:](self, "setChevron:", v30);

      }
      -[CKLocationShareBalloonView locationLabel](self, "locationLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLocationShareBalloonView locationString](self, "locationString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setText:", v32);

      -[CKLocationShareBalloonView locationLabel](self, "locationLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLocationShareBalloonView addSubview:](self, "addSubview:", v33);

      -[CKLocationShareBalloonView chevron](self, "chevron");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLocationShareBalloonView addSubview:](self, "addSubview:", v34);

      -[CKLocationShareBalloonView startSharingButton](self, "startSharingButton");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeFromSuperview");

      -[CKLocationShareBalloonView ignoreButton](self, "ignoreButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "removeFromSuperview");

      -[CKLocationShareBalloonView horizontalSeparator](self, "horizontalSeparator");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "removeFromSuperview");

      -[CKLocationShareBalloonView verticalSeparator](self, "verticalSeparator");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    if (-[CKLocationShareBalloonView offerState](self, "offerState") != 2)
      return;
    -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setLineBreakMode:", 4);

    -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setNumberOfLines:", 1);

    -[CKLocationShareBalloonView startSharingButton](self, "startSharingButton");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "removeFromSuperview");

    -[CKLocationShareBalloonView ignoreButton](self, "ignoreButton");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "removeFromSuperview");

    -[CKLocationShareBalloonView horizontalSeparator](self, "horizontalSeparator");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "removeFromSuperview");

    -[CKLocationShareBalloonView verticalSeparator](self, "verticalSeparator");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "removeFromSuperview");
  }
  else
  {
    -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setLineBreakMode:", 0);

    -[CKLocationShareBalloonView titleLabel](self, "titleLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setNumberOfLines:", 0);

    -[CKLocationShareBalloonView startSharingButton](self, "startSharingButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addTarget:action:forControlEvents:", self, sel__shareButtonHit_, 64);
      CKFrameworkBundle();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("SHARE_BUTTON_START"), &stru_1E276D870, CFSTR("ChatKit"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setTitle:forState:", v44, 0);

      objc_msgSend(v42, "titleLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setTextAlignment:", 1);

      objc_msgSend(v42, "titleLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "locationBoldButtonFont");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFont:", v48);

      objc_msgSend(v42, "titleLabel");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setTextColor:", v50);

      -[CKBalloonView delegate](self, "delegate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "sharingMenu");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setMenu:", v52);

      objc_msgSend(v42, "setContextMenuIsPrimary:", 1);
      objc_msgSend(v42, "setEnabled:", 1);
      -[CKLocationShareBalloonView setStartSharingButton:](self, "setStartSharingButton:", v42);

    }
    -[CKLocationShareBalloonView ignoreButton](self, "ignoreButton");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v53)
    {
      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addTarget:action:forControlEvents:", self, sel__ignoreButtonHit_, 64);
      CKFrameworkBundle();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("SHARE_BUTTON_IGNORE"), &stru_1E276D870, CFSTR("ChatKit"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setTitle:forState:", v56, 0);

      objc_msgSend(v54, "titleLabel");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setTextAlignment:", 1);

      objc_msgSend(v54, "titleLabel");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "locationButtonFont");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setFont:", v60);

      objc_msgSend(v54, "titleLabel");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setTextColor:", v62);

      -[CKLocationShareBalloonView setIgnoreButton:](self, "setIgnoreButton:", v54);
    }
    -[CKLocationShareBalloonView horizontalSeparator](self, "horizontalSeparator");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v63)
    {
      v64 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v65 = (void *)objc_msgSend(v64, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(MEMORY[0x1E0CEA478], "opaqueSeparatorColor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setBackgroundColor:", v66);

      -[CKLocationShareBalloonView setHorizontalSeparator:](self, "setHorizontalSeparator:", v65);
    }
    -[CKLocationShareBalloonView verticalSeparator](self, "verticalSeparator");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v67)
    {
      v68 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v69 = (void *)objc_msgSend(v68, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(MEMORY[0x1E0CEA478], "opaqueSeparatorColor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setBackgroundColor:", v70);

      -[CKLocationShareBalloonView setVerticalSeparator:](self, "setVerticalSeparator:", v69);
    }
    -[CKLocationShareBalloonView startSharingButton](self, "startSharingButton");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareBalloonView addSubview:](self, "addSubview:", v71);

    -[CKLocationShareBalloonView ignoreButton](self, "ignoreButton");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareBalloonView addSubview:](self, "addSubview:", v72);

    -[CKLocationShareBalloonView horizontalSeparator](self, "horizontalSeparator");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareBalloonView addSubview:](self, "addSubview:", v73);

    -[CKLocationShareBalloonView verticalSeparator](self, "verticalSeparator");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareBalloonView addSubview:](self, "addSubview:", v74);
  }

  -[CKLocationShareBalloonView locationLabel](self, "locationLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "removeFromSuperview");

  -[CKLocationShareBalloonView chevron](self, "chevron");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
  v81 = v38;
  objc_msgSend(v38, "removeFromSuperview");

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v5;
  int v6;

  objc_msgSend(a4, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", self->_startSharingButton) & 1) != 0)
    LOBYTE(v6) = 0;
  else
    v6 = objc_msgSend(v5, "isEqual:", self->_ignoreButton) ^ 1;

  return v6;
}

- (void)setOfferState:(int64_t)a3
{
  if (self->_offerState != a3)
  {
    self->_offerState = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setTitleString:(id)a3
{
  NSString *v4;
  NSString *titleString;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_titleString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    titleString = self->_titleString;
    self->_titleString = v4;

    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }

}

- (void)setLocationString:(id)a3
{
  NSString *v4;
  NSString *locationString;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_locationString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    locationString = self->_locationString;
    self->_locationString = v4;

    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKLocationShareBalloonView;
  v4 = a3;
  -[CKBalloonView setDelegate:](&v7, sel_setDelegate_, v4);
  -[CKLocationShareBalloonView startSharingButton](self, "startSharingButton", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharingMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMenu:", v6);
}

- (void)_ignoreButtonHit:(id)a3
{
  id v4;

  -[CKBalloonView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationShareBalloonViewIgnoreButtonTapped:", self);

}

- (int64_t)offerState
{
  return self->_offerState;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)locationString
{
  return self->_locationString;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationLabel, a3);
}

- (UIButton)startSharingButton
{
  return self->_startSharingButton;
}

- (void)setStartSharingButton:(id)a3
{
  objc_storeStrong((id *)&self->_startSharingButton, a3);
}

- (UIButton)ignoreButton
{
  return self->_ignoreButton;
}

- (void)setIgnoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreButton, a3);
}

- (UIView)horizontalSeparator
{
  return self->_horizontalSeparator;
}

- (void)setHorizontalSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalSeparator, a3);
}

- (UIView)verticalSeparator
{
  return self->_verticalSeparator;
}

- (void)setVerticalSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_verticalSeparator, a3);
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
  objc_storeStrong((id *)&self->_chevron, a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_verticalSeparator, 0);
  objc_storeStrong((id *)&self->_horizontalSeparator, 0);
  objc_storeStrong((id *)&self->_ignoreButton, 0);
  objc_storeStrong((id *)&self->_startSharingButton, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

- (void)configureForLocationShareOfferChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CKBalloonView setOrientation:](self, "setOrientation:", objc_msgSend(v4, "balloonOrientation"));
  -[CKImageBalloonView setHasTail:](self, "setHasTail:", objc_msgSend(v4, "hasTail"));
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", objc_msgSend(v4, "balloonCorners"));
  objc_msgSend(v4, "textAlignmentInsets");
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:");
  -[CKLocationShareBalloonView setOfferState:](self, "setOfferState:", objc_msgSend(v4, "offerState"));
  objc_msgSend(v4, "titleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationShareBalloonView setTitleString:](self, "setTitleString:", v5);

  objc_msgSend(v4, "locationText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationShareBalloonView setLocationString:](self, "setLocationString:", v6);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapPreviewMaxWidth");
  objc_msgSend(v4, "previewForWidth:orientation:", -[CKBalloonView orientation](self, "orientation"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKImageBalloonView setImage:](self, "setImage:", v8);
}

@end
