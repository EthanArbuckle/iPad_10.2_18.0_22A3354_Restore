@implementation CKBrowserCell

+ (id)reuseIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKBrowserCell.m"), 50, CFSTR("Please override +reuseIdentifier in your subclass"));

  return NSStringFromClass((Class)a1);
}

+ (Class)classForItemType:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
    _IMWarn();
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (CKBrowserCell)initWithFrame:(CGRect)a3
{
  CKBrowserCell *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  CKBadgeView *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)CKBrowserCell;
  v3 = -[CKBrowserCell initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CKBrowserCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserCell iconView](v3, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    v7 = objc_alloc(MEMORY[0x1E0CEA700]);
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    -[CKBrowserCell setBrowserLabel:](v3, "setBrowserLabel:", v12);

    -[CKBrowserCell browserLabel](v3, "browserLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 1);

    -[CKBrowserCell browserLabel](v3, "browserLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineBreakMode:", 4);

    -[CKBrowserCell browserLabel](v3, "browserLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfLines:", 1);

    -[CKBrowserCell browserLabel](v3, "browserLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsDefaultTighteningForTruncation:", 1);

    -[CKBrowserCell browserLabel](v3, "browserLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "browserCellFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v19);

    -[CKBrowserCell contentView](v3, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserCell browserLabel](v3, "browserLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v21);

    v22 = -[CKBadgeView initWithFrame:]([CKBadgeView alloc], "initWithFrame:", v8, v9, v10, v11);
    -[CKBrowserCell setBadgeView:](v3, "setBadgeView:", v22);

    -[CKBrowserCell contentView](v3, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserCell badgeView](v3, "badgeView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

    v25 = objc_alloc_init(MEMORY[0x1E0CEA658]);
    -[CKBrowserCell setBorderView:](v3, "setBorderView:", v25);

    -[CKBrowserCell borderView](v3, "borderView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "colorWithAlphaComponent:", 0.25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTintColor:", v28);

    -[CKBrowserCell contentView](v3, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserCell borderView](v3, "borderView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

    v3->_shouldShowLabel = 1;
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Width;
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
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGFloat MinX;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double MinY;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  double MidX;
  double v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  double v112;
  double MaxX;
  double v114;
  double v115;
  double v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  double v120;
  CGFloat v121;
  objc_super v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;

  v122.receiver = self;
  v122.super_class = (Class)CKBrowserCell;
  -[CKBrowserCell layoutSubviews](&v122, sel_layoutSubviews);
  -[CKBrowserCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v109 = v5;
  v123.origin.x = v5;
  v123.origin.y = v7;
  v123.size.width = v9;
  v123.size.height = v11;
  Width = CGRectGetWidth(v123);
  -[CKBrowserCell browserCellIconFrame](self, "browserCellIconFrame");
  v14 = v13;
  v120 = v15;
  v17 = v16;
  v19 = v18;
  v20 = v16 + v13 * 2.0;
  -[CKBrowserCell browserLabel](self, "browserLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v114 = Width;
  v110 = v9;
  v111 = v11;
  if (Width <= v20)
  {
    objc_msgSend(v21, "setAlpha:", 0.0);

    -[CKBrowserCell shinyStatusView](self, "shinyStatusView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlpha:", 0.0);

    -[CKBrowserCell badgeView](self, "badgeView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAlpha:", 0.0);

    v25 = v120;
  }
  else
  {
    objc_msgSend(v21, "setAlpha:", 1.0);

    -[CKBrowserCell shinyStatusView](self, "shinyStatusView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlpha:", 1.0);

    -[CKBrowserCell badgeView](self, "badgeView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlpha:", 1.0);

    v14 = 12.0;
    v25 = 5.0;
    v17 = 60.0;
    v19 = 45.0;
  }
  -[CKBrowserCell iconView](self, "iconView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v14, v25, v17, v19);

  -[CKBrowserCell browserCellSelectionBorderOutset](self, "browserCellSelectionBorderOutset");
  v30 = -v29;
  v119 = v14;
  v121 = v25;
  v124.origin.x = v14;
  v124.origin.y = v25;
  v117 = v19;
  v118 = v17;
  v124.size.width = v17;
  v124.size.height = v19;
  v125 = CGRectInset(v124, v30, v30);
  -[CKBrowserCell setSelectionFrame:](self, "setSelectionFrame:", v125.origin.x, v125.origin.y, v125.size.width, v125.size.height);
  -[CKBrowserCell shinyStatusView](self, "shinyStatusView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sizeToFit");
  objc_msgSend(v31, "frame");
  v32 = CGRectGetWidth(v126);
  -[CKBrowserCell contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  v34 = CGRectGetWidth(v127) + -3.0;

  v112 = v32;
  v35 = v32 + 2.0;
  v36 = 0.0;
  if (v31)
    v36 = v32 + 2.0;
  v37 = v34 - v36;
  -[CKBrowserCell browserLabel](self, "browserLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sizeToFit");

  -[CKBrowserCell browserLabel](self, "browserLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserCell iconView](self, "iconView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "frame");
  objc_msgSend(v39, "_setFirstLineBaselineFrameOriginY:", CGRectGetMaxY(v128) + 13.0);

  -[CKBrowserCell browserLabel](self, "browserLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "frame");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;

  v129.origin.x = v43;
  v129.origin.y = v45;
  v129.size.width = v47;
  v129.size.height = v49;
  v50 = CGRectGetWidth(v129);
  if (v37 >= v50)
    v51 = v50;
  else
    v51 = v37;
  v130.origin.x = v43;
  v130.origin.y = v45;
  v130.size.width = v51;
  v130.size.height = v49;
  v52 = CGRectGetWidth(v130);
  if (v31)
  {
    objc_msgSend(v31, "frame");
    v54 = v53;
    v56 = v55;
    if (CKMainScreenScale_once_47 != -1)
      dispatch_once(&CKMainScreenScale_once_47, &__block_literal_global_117);
    v57 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_47 == 0.0)
      v58 = 1.0;
    else
      v58 = *(double *)&CKMainScreenScale_sMainScreenScale_47;
    v59 = v56 * v58;
    v60 = 1.0 / v58;
    v61 = 1.0 / v58 * (v45 * v58 + floor((v49 * v58 - v56 * v58) * 0.5));
    v62 = v54 * v58 * (1.0 / v58);
    v108 = v61;
    if (v114 * 0.5 - (v112 + v52 * 0.5 + 2.0) >= 2.0)
    {
      v107 = v59 * v60;
      v116 = v62;
      v133.origin.x = v109;
      v133.origin.y = v7;
      v133.size.width = v110;
      v133.size.height = v111;
      MidX = CGRectGetMidX(v133);
      v134.origin.x = v109;
      v134.origin.y = v7;
      v134.size.width = v110;
      v134.size.height = v111;
      CGRectGetMidY(v134);
      if (CKMainScreenScale_once_47 != -1)
        dispatch_once(&CKMainScreenScale_once_47, &__block_literal_global_117);
      v76 = *(double *)&CKMainScreenScale_sMainScreenScale_47;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_47 == 0.0)
        v76 = 1.0;
      v71 = MidX - round(v52 * 0.5 * v76) / v76;
      v135.origin.x = v71;
      v135.origin.y = v45;
      v135.size.width = v51;
      v135.size.height = v49;
      MinX = CGRectGetMinX(v135);
      v73 = v116;
      v64 = MinX + -2.0 - v112;
      v74 = v107;
      v72 = v108;
    }
    else
    {
      v63 = fmax((v114 - (v35 + v52)) * 0.5, 2.0);
      if (*(double *)&CKMainScreenScale_sMainScreenScale_47 != 0.0)
        v57 = *(double *)&CKMainScreenScale_sMainScreenScale_47;
      v64 = round(v63 * v57) / v57;
      v65 = v64;
      v66 = v62;
      v67 = v59 * v60;
      v68 = v59 * v60;
      v69 = CGRectGetMaxX(*(CGRect *)(&v61 - 1)) + 2.0;
      if (CKMainScreenScale_once_47 != -1)
        dispatch_once(&CKMainScreenScale_once_47, &__block_literal_global_117);
      v70 = *(double *)&CKMainScreenScale_sMainScreenScale_47;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_47 == 0.0)
        v70 = 1.0;
      v71 = round(v69 * v70) / v70;
      v72 = v108;
      v73 = v66;
      v74 = v67;
    }
    objc_msgSend(v31, "setFrame:", v64, v72, v73, v74);
  }
  else
  {
    v131.origin.x = v109;
    v131.origin.y = v7;
    v131.size.width = v110;
    v131.size.height = v111;
    v115 = CGRectGetMidX(v131);
    v132.origin.x = v109;
    v132.origin.y = v7;
    v132.size.width = v110;
    v132.size.height = v111;
    CGRectGetMidY(v132);
    if (CKMainScreenScale_once_47 != -1)
      dispatch_once(&CKMainScreenScale_once_47, &__block_literal_global_117);
    v75 = *(double *)&CKMainScreenScale_sMainScreenScale_47;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_47 == 0.0)
      v75 = 1.0;
    v71 = v115 - round(v52 * 0.5 * v75) / v75;
  }
  -[CKBrowserCell browserLabel](self, "browserLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setFrame:", v71, v45, v51, v49);

  -[CKBrowserCell badgeView](self, "badgeView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "sizeToFit");

  -[CKBrowserCell badgeView](self, "badgeView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "frame");
  v82 = v81;
  v84 = v83;
  v86 = v85;
  v88 = v87;

  v136.origin.x = v119;
  v136.origin.y = v121;
  v136.size.width = v118;
  v136.size.height = v117;
  MaxX = CGRectGetMaxX(v136);
  v137.origin.x = v82;
  v137.origin.y = v84;
  v137.size.width = v86;
  v137.size.height = v88;
  v89 = CGRectGetWidth(v137);
  v138.origin.x = v119;
  v138.origin.y = v121;
  v138.size.width = v118;
  v138.size.height = v117;
  MinY = CGRectGetMinY(v138);
  if (CKMainScreenScale_once_47 != -1)
    dispatch_once(&CKMainScreenScale_once_47, &__block_literal_global_117);
  v91 = MinY + -1.0;
  v92 = *(double *)&CKMainScreenScale_sMainScreenScale_47;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_47 == 0.0)
    v92 = 1.0;
  v93 = round((MaxX + v89 * -0.5 + -5.0) * v92) / v92;
  v94 = round(v91 * v92) / v92;
  -[CKBrowserCell badgeView](self, "badgeView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setFrame:", v93, v94, v86, v88);

  -[CKBrowserCell iconView](self, "iconView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "frame");
  v98 = v97;
  v100 = v99;
  v102 = v101;
  v104 = v103;
  -[CKBrowserCell borderView](self, "borderView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setFrame:", v98, v100, v102, v104);

}

- (CGRect)browserCellIconFrame
{
  void *v2;
  char v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  CGRect result;

  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_isUsingCompactHeightPredictionBar")
    && (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isAppStripInKeyboard"),
        v2,
        (v3 & 1) != 0))
  {
    v4 = 4.5;
    v5 = 7.0;
    v6 = 28.5;
    v7 = 0x4043000000000000;
  }
  else
  {
    v6 = 30.0;
    v4 = 4.0;
    v5 = 6.0;
    v7 = 0x4044000000000000;
  }
  v8 = *(double *)&v7;
  result.size.height = v6;
  result.size.width = v8;
  result.origin.y = v4;
  result.origin.x = v5;
  return result;
}

- (double)browserCellSelectionBorderOutset
{
  int v2;
  double result;
  void *v4;
  int v5;

  v2 = objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_isUsingCompactHeightPredictionBar");
  result = 3.0;
  if (v2)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", 3.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppStripInKeyboard");

    result = 3.0;
    if (v5)
      return 2.0;
  }
  return result;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKBrowserCell;
  -[CKBrowserCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "showsBorder"))
    {
      if (objc_msgSend(v5, "appStripSize"))
        v6 = 1;
      else
        v6 = 2;
    }
    else
    {
      v6 = 0;
    }
    -[CKBrowserCell setBorderStyle:](self, "setBorderStyle:", v6);

  }
}

- (void)setBorderStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CKBrowserCell_setBorderStyle___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (setBorderStyle__onceToken != -1)
    dispatch_once(&setBorderStyle__onceToken, block);
  if (a3 == 2)
  {
    -[CKBrowserCell borderView](self, "borderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = setBorderStyle__twoPxBorderImage;
LABEL_9:
    objc_msgSend(v8, "setImage:", v10);

    -[CKBrowserCell borderView](self, "borderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1.0;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    -[CKBrowserCell borderView](self, "borderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = setBorderStyle__onePxBorderImage;
    goto LABEL_9;
  }
  if (a3)
    return;
  -[CKBrowserCell borderView](self, "borderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.0;
LABEL_10:
  objc_msgSend(v5, "setAlpha:", v7);

}

void __32__CKBrowserCell_setBorderStyle___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v0 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("BorderPath-1px"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)setBorderStyle__onePxBorderImage;
  setBorderStyle__onePxBorderImage = v3;

  v5 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("BorderPath"), v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)setBorderStyle__twoPxBorderImage;
  setBorderStyle__twoPxBorderImage = v7;

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserCell;
  -[CKBrowserCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKBrowserCell badgeView](self, "badgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:", 0);

}

- (CKBrowserCellDelegate)delegate
{
  return (CKBrowserCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (BOOL)jitter
{
  return self->_jitter;
}

- (void)setJitter:(BOOL)a3
{
  self->_jitter = a3;
}

- (BOOL)shouldShowLabel
{
  return self->_shouldShowLabel;
}

- (void)setShouldShowLabel:(BOOL)a3
{
  self->_shouldShowLabel = a3;
}

- (unint64_t)shinyStatus
{
  return self->_shinyStatus;
}

- (void)setShinyStatus:(unint64_t)a3
{
  self->_shinyStatus = a3;
}

- (CKBrowserSelectionLabelAccessoryView)shinyStatusView
{
  return self->_shinyStatusView;
}

- (void)setShinyStatusView:(id)a3
{
  objc_storeStrong((id *)&self->_shinyStatusView, a3);
}

- (UILabel)browserLabel
{
  return self->_browserLabel;
}

- (void)setBrowserLabel:(id)a3
{
  objc_storeStrong((id *)&self->_browserLabel, a3);
}

- (UIImageView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (CGRect)selectionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_selectionFrame.origin.x;
  y = self->_selectionFrame.origin.y;
  width = self->_selectionFrame.size.width;
  height = self->_selectionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSelectionFrame:(CGRect)a3
{
  self->_selectionFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_browserLabel, 0);
  objc_storeStrong((id *)&self->_shinyStatusView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIView)iconView
{
  return 0;
}

@end
