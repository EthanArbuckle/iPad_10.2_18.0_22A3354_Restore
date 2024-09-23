@implementation MPAddKeepLocalControl

- (MPAddKeepLocalControl)initWithFrame:(CGRect)a3
{
  MPAddKeepLocalControl *v3;
  MPAddKeepLocalControl *v4;
  uint64_t v5;
  UIColor *filledTintColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPAddKeepLocalControl;
  v3 = -[MPAddKeepLocalControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_allowsAddImage = 1;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = objc_claimAutoreleasedReturnValue();
    filledTintColor = v4->_filledTintColor;
    v4->_filledTintColor = (UIColor *)v5;

  }
  -[MPAddKeepLocalControl setScaleImageForAccessibility:](v4, "setScaleImageForAccessibility:", 1);
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_controlStatus.statusType == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)MPAddKeepLocalControl;
  -[MPAddKeepLocalControl dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPAddKeepLocalControl;
  -[MPAddKeepLocalControl didMoveToWindow](&v3, sel_didMoveToWindow);
  if (-[MPAddKeepLocalControl _isInAWindow](self, "_isInAWindow"))
    -[MPAddKeepLocalControl _updateControlImageViewAnimation](self, "_updateControlImageViewAnimation");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  MPAddKeepLocalControl *v5;

  if (-[MPAddKeepLocalControl pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)
    && -[MPAddKeepLocalControl isEnabled](self, "isEnabled"))
  {
    v5 = self;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat width;
  CGFloat height;
  BOOL v11;
  void *v13;
  CGPoint v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  -[MPAddKeepLocalControl bounds](self, "bounds", a4);
  v7 = v15.origin.x;
  v8 = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  if (CGRectIsEmpty(v15))
    return 0;
  v16.origin.x = v7;
  v16.origin.y = v8;
  v16.size.width = width;
  v16.size.height = height;
  v17 = CGRectInset(v16, -16.0, -16.0);
  v14.x = x;
  v14.y = y;
  if (!CGRectContainsPoint(v17, v14))
    return 0;
  if (self->_controlImageView)
    return 1;
  -[UILabel text](self->_controlTitleLabel, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
    v11 = 1;
  else
    v11 = self->_downloadProgressView != 0;

  return v11;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double SafeScaleForValue;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  UIImageView *controlImageView;
  int64_t statusType;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  UIEdgeInsets *p_controlImageEdgeInsets;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  CGFloat v47;
  double x;
  CGFloat v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  double v57;
  double MaxX;
  CGFloat v59;
  double MinX;
  CGFloat height;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  double v74;
  void *v75;
  NSString *v76;
  BOOL IsAccessibilityCategory;
  double v78;
  double v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  void *controlTitleLabel;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  CGFloat v100;
  CGFloat v101;
  double v102;
  double v103;
  double v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  double v111;
  double v112;
  double v113;
  CGFloat v114;
  double v115;
  double v116;
  UIView *backgroundView;
  CGFloat width;
  double v119;
  CGFloat v120;
  CGFloat y;
  CGFloat v122;
  double v123;
  double v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  double v128;
  double v129;
  CGFloat v130;
  double v131;
  double v132;
  double v133;
  CGFloat v134;
  double rect;
  CGFloat v136;
  CGRect v137;
  __objc2_class *v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;

  *(_QWORD *)&v137.size.height = self;
  v138 = MPAddKeepLocalControl;
  -[CGFloat layoutSubviews]((objc_super *)&v137.size.height, sel_layoutSubviews);
  -[MPAddKeepLocalControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MPAddKeepLocalControl traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  SafeScaleForValue = MPFloatGetSafeScaleForValue(v12);

  -[UILabel frame](self->_controlTitleLabel, "frame");
  v137.origin.x = v14;
  v16 = v15;
  -[UILabel sizeThatFits:](self->_controlTitleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v18 = v17;
  v20 = v19;
  v21 = -[MPAddKeepLocalControl contentHorizontalAlignment](self, "contentHorizontalAlignment");
  controlImageView = self->_controlImageView;
  v137.size.width = SafeScaleForValue;
  if (controlImageView)
  {
    statusType = self->_controlStatus.statusType;
    -[UIImageView frame](controlImageView, "frame");
    v137.origin.y = v4;
    -[UILabel text](self->_controlTitleLabel, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    v26 = fmin(v8, 45.0);
    v27 = fmin(v10, 45.0);
    if (!v25)
    {
      v10 = v27;
      v8 = v26;
    }
    -[UIImageView sizeThatFits:](self->_controlImageView, "sizeThatFits:", v8, v10);
    p_controlImageEdgeInsets = &self->_controlImageEdgeInsets;
    v131 = v29;
    v132 = v30;
    UIRectCenteredYInRectScale();
    v127 = v31;
    v33 = v32;
    v136 = v34;
    v134 = v35;
    -[UILabel text](self->_controlTitleLabel, "text", *(_QWORD *)&SafeScaleForValue);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "length");

    if (v37)
    {
      v119 = SafeScaleForValue;
      UIRectCenteredYInRectScale();
      v39 = v38;
      v41 = v40;
      v129 = v42;
      v44 = v43;
      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88], *(_QWORD *)&v119);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_scaledValueForValue:", 8.0);
      v137.origin.x = v6 + 0.0;
      rect = v8 - (v46 + 5.0);

      v125 = v8;
      v126 = v6;
      v133 = v33;
      v130 = v41;
      if (v21 == 2)
      {
        v143.origin.x = v4 + 5.0;
        v143.origin.y = v6 + 0.0;
        v143.size.width = rect;
        v143.size.height = v10;
        MaxX = CGRectGetMaxX(v143);
        v144.origin.x = v39;
        v144.origin.y = v41;
        v144.size.width = v129;
        v144.size.height = v44;
        v59 = MaxX - CGRectGetWidth(v144);
        v145.origin.x = v59;
        v145.origin.y = v41;
        v145.size.width = v129;
        v145.size.height = v44;
        MinX = CGRectGetMinX(v145);
        v146.origin.x = v127;
        v49 = v136;
        v146.size.width = v136;
        v52 = v41;
        v146.origin.y = v133;
        v50 = v134;
        v146.size.height = v134;
        v47 = v44;
        x = MinX - CGRectGetWidth(v146);
        v51 = v59;
        v33 = v133;
      }
      else if (v21 == 1)
      {
        v139.origin.x = v4 + 5.0;
        v139.origin.y = v6 + 0.0;
        v139.size.width = rect;
        v139.size.height = v10;
        v140.origin.x = CGRectGetMinX(v139);
        v47 = v44;
        x = v140.origin.x;
        v140.origin.y = v33;
        v49 = v136;
        v140.size.width = v136;
        v50 = v134;
        v140.size.height = v134;
        v51 = CGRectGetMaxX(v140) + 0.0;
        v52 = v130;
      }
      else
      {
        v147.origin.x = 0.0;
        v147.origin.y = v33;
        v147.size.width = v136;
        v50 = v134;
        v147.size.height = v134;
        v148.origin.x = CGRectGetMaxX(v147) + 0.0;
        v123 = v148.origin.x;
        v164.origin.x = 0.0;
        v148.size.width = v129;
        v52 = v130;
        v148.origin.y = v130;
        v148.size.height = v44;
        v164.origin.y = v33;
        v164.size.width = v136;
        v164.size.height = v134;
        v149 = CGRectUnion(v148, v164);
        y = v149.origin.y;
        v122 = v149.origin.x;
        v47 = v44;
        height = v149.size.height;
        width = v137.size.width;
        v120 = v149.size.width;
        UIRectCenteredXInRectScale();
        v62 = CGRectGetMinX(v150);
        v151.origin.y = y;
        v151.origin.x = v122;
        v151.size.width = v120;
        v49 = v136;
        v151.size.height = height;
        v63 = v62 - CGRectGetMinX(v151);
        v33 = v133;
        v64 = MPFloatGetSafeScaleForValue(v137.size.width);
        v65 = round(v64 * v63) / v64;
        x = v65 + 0.0;
        v51 = v123 + v65;
      }
      v124 = v51;
      v66 = v52;
      v67 = v129;
      v68 = v129;
      v128 = v47;
      v69 = v47;
      v165.origin.x = x;
      v165.origin.y = v33;
      v165.size.width = v49;
      v165.size.height = v50;
      v152 = CGRectUnion(*(CGRect *)&v51, v165);
      v70 = v152.origin.x;
      v71 = v152.origin.y;
      v72 = v152.size.width;
      v73 = v152.size.height;
      v152.origin.x = v137.origin.y + 5.0;
      v152.origin.y = v137.origin.x;
      v152.size.width = rect;
      v152.size.height = v10;
      v74 = CGRectGetWidth(v152);
      -[MPAddKeepLocalControl traitCollection](self, "traitCollection");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "preferredContentSizeCategory");
      v76 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v76);

      if (!IsAccessibilityCategory)
      {
        v153.origin.x = v70;
        v153.origin.y = v71;
        v153.size.width = v72;
        v153.size.height = v73;
        v78 = CGRectGetWidth(v153) - v74;
        if (v78 <= 0.00000011920929)
          v78 = 0.0;
        v67 = v129 - v78;
      }
      v4 = v137.origin.y;
      v6 = v126;
      if (statusType == 1)
      {
        v79 = v133;
        v80 = v134;
        v81 = v136;
      }
      else
      {
        x = x - self->_controlImageEdgeInsets.left;
        v80 = v132;
        v79 = v133 - p_controlImageEdgeInsets->top;
        v81 = v131;
      }
      v82 = x;
      v8 = v125;
      -[UIImageView setFrame:](self->_controlImageView, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v82, v79, v81, v80, v137.origin.y, v126, v125, v10));
      controlTitleLabel = self->_controlTitleLabel;
      v84 = v124;
      v85 = v130;
      v86 = v67;
      v87 = v128;
    }
    else
    {
      if (v21 == 2)
      {
        v157.origin.x = v4;
        v157.origin.y = v6;
        v157.size.width = v8;
        v157.size.height = v10;
        v101 = v33;
        v102 = CGRectGetMaxX(v157);
        v158.origin.x = v127;
        v158.origin.y = v101;
        v158.size.width = v136;
        v158.size.height = v134;
        v57 = v102 - CGRectGetWidth(v158);
        v33 = v101;
      }
      else if (v21 == 1)
      {
        v142.origin.x = v4;
        v142.origin.y = v6;
        v142.size.width = v8;
        v142.size.height = v10;
        v57 = CGRectGetMinX(v142);
      }
      else
      {
        width = SafeScaleForValue;
        UIRectCenteredXInRectScale();
        v33 = v103;
      }
      v84 = v57 - self->_controlImageEdgeInsets.left;
      v85 = v33 - p_controlImageEdgeInsets->top;
      v86 = fmin(v131, 45.0);
      v87 = fmin(v132, 45.0);
      controlTitleLabel = self->_controlImageView;
    }
    v100 = v4;
  }
  else
  {
    -[UILabel text](self->_controlTitleLabel, "text");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "length");

    if (!v54)
      goto LABEL_33;
    if (v21 == 2)
    {
      v154.origin.x = v4;
      v154.origin.y = v6;
      v154.size.width = v8;
      v154.size.height = v10;
      CGRectGetMaxX(v154);
      v55 = *MEMORY[0x1E0DC4A88];
      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "_scaledValueForValue:", 8.0);
      v155.origin.x = v137.origin.x;
      v155.origin.y = v16;
      v155.size.width = v18;
      v155.size.height = v20;
      CGRectGetWidth(v155);

    }
    else if (v21 == 1)
    {
      v141.origin.x = v4;
      v141.origin.y = v6;
      v141.size.width = v8;
      v141.size.height = v10;
      CGRectGetMinX(v141);
      v55 = *MEMORY[0x1E0DC4A88];
      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "_scaledValueForValue:", 8.0);

    }
    else
    {
      UIRectCenteredXInRectScale();
      v55 = *MEMORY[0x1E0DC4A88];
    }
    UIRectCenteredYInRectScale();
    v90 = v89;
    v91 = v4;
    v93 = v92;
    v95 = v94;
    v97 = v96;
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v55, *(_QWORD *)&v137.size.width);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "_scaledValueForValue:", 8.0);

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v55);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "_scaledValueForValue:", 8.0);

    v156.origin.x = v91;
    v156.origin.y = v6;
    v156.size.width = v8;
    v156.size.height = v10;
    CGRectGetHeight(v156);
    controlTitleLabel = self->_controlTitleLabel;
    v84 = v90;
    v85 = v93;
    v4 = v91;
    v86 = v95;
    v87 = v97;
    v100 = v91;
  }
  objc_msgSend(controlTitleLabel, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v84, v85, v86, v87, v100, v6, v8, v10));
LABEL_33:
  if (!self->_downloadProgressView)
    goto LABEL_44;
  v159.origin.x = v4;
  v159.origin.y = v6;
  v159.size.width = v8;
  v159.size.height = v10;
  v104 = CGRectGetWidth(v159);
  v160.origin.x = v4;
  v160.origin.y = v6;
  v160.size.width = v8;
  v160.size.height = v10;
  v105 = CGRectGetHeight(v160);
  if (v104 >= v105)
    v106 = v105;
  else
    v106 = v104;
  -[MPDownloadProgressView frame](self->_downloadProgressView, "frame", *(_QWORD *)&width);
  v108 = v107;
  v110 = v109;
  if (v21 == 2)
  {
    v162.origin.x = v4;
    v162.origin.y = v6;
    v162.size.width = v8;
    v162.size.height = v10;
    v112 = v4;
    v113 = CGRectGetMaxX(v162);
    v163.origin.x = v108;
    v163.origin.y = v110;
    v163.size.width = v106;
    v163.size.height = v106;
    v111 = v113 - CGRectGetWidth(v163);
    v4 = v112;
  }
  else
  {
    if (v21 != 1)
    {
      UIRectCenteredIntegralRectScale();
      v110 = v115;
      v106 = v116;
      goto LABEL_43;
    }
    v161.origin.x = v4;
    v161.origin.y = v6;
    v161.size.width = v8;
    v161.size.height = v10;
    v111 = CGRectGetMinX(v161);
  }
  v114 = v106;
LABEL_43:
  -[MPDownloadProgressView setFrame:](self->_downloadProgressView, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v111, v110, v106, v114, v4, v6, v8, v10));
LABEL_44:
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView setFrame:](backgroundView, "setFrame:", v4, v6, v8, v10);
    -[MPAddKeepLocalControl _updateBackgroundViewCornerRadius](self, "_updateBackgroundViewCornerRadius");
  }
}

- (CGSize)maximumSizeWithPreferredHeight:(double)a3
{
  void *v5;
  double v6;
  double SafeScaleForValue;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  CGSize result;

  -[MPAddKeepLocalControl traitCollection](self, "traitCollection", 0, 1, 2, 3, 4, 5, 6, *MEMORY[0x1E0C80C00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  SafeScaleForValue = MPFloatGetSafeScaleForValue(v6);

  v8 = 0;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  do
  {
    v11 = *(_QWORD *)((char *)&v21 + v8);
    v12 = (void *)objc_opt_class();
    -[MPAddKeepLocalControl titleForControlStatusType:](self, "titleForControlStatusType:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_allowsAddImage || self->_controlStatus.statusType != 1;
    objc_msgSend(v12, "_expectedSizeForControlStatusType:controlTitle:hasControlImage:displayScale:preferredHeight:", v11, v13, v14, MPFloatGetSafeScaleForValue(SafeScaleForValue), a3);
    v16 = v15;
    v18 = v17;

    if (v9 < v16)
      v9 = v16;
    if (v10 < v18)
      v10 = v18;
    v8 += 8;
  }
  while (v8 != 56);
  v19 = v9;
  v20 = v10;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  void *v5;
  int64_t statusType;
  void *v7;
  _BOOL8 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  v5 = (void *)objc_opt_class();
  statusType = self->_controlStatus.statusType;
  -[MPAddKeepLocalControl titleForControlStatusType:](self, "titleForControlStatusType:", statusType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_allowsAddImage || self->_controlStatus.statusType != 1;
  -[MPAddKeepLocalControl traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  objc_msgSend(v5, "_expectedSizeForControlStatusType:controlTitle:hasControlImage:displayScale:preferredHeight:", statusType, v7, v8, MPFloatGetSafeScaleForValue(v10), height);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPAddKeepLocalControl;
  -[MPAddKeepLocalControl tintColorDidChange](&v4, sel_tintColorDidChange);
  -[MPAddKeepLocalControl tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_displayStyle == 1)
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v3);
  -[MPAddKeepLocalControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
  if (self->_controlStatus.statusType == 2 && self->_traitCollectionDidChangeWasCalled)
    -[MPAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPAddKeepLocalControl;
  -[MPAddKeepLocalControl traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[MPAddKeepLocalControl traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  if (vabdd_f64(v8, v7) >= 0.00000011920929
    || (objc_msgSend(v5, "preferredContentSizeCategory"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "preferredContentSizeCategory"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 != v10))
  {
    -[MPAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }
  self->_traitCollectionDidChangeWasCalled = 1;

}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  uint64_t v5;
  objc_super v6;

  v5 = -[MPAddKeepLocalControl contentHorizontalAlignment](self, "contentHorizontalAlignment");
  v6.receiver = self;
  v6.super_class = (Class)MPAddKeepLocalControl;
  -[MPAddKeepLocalControl setContentHorizontalAlignment:](&v6, sel_setContentHorizontalAlignment_, a3);
  if (v5 != -[MPAddKeepLocalControl contentHorizontalAlignment](self, "contentHorizontalAlignment"))
    -[MPAddKeepLocalControl setNeedsLayout](self, "setNeedsLayout");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPAddKeepLocalControl;
  -[MPAddKeepLocalControl touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  self->_hadFirstTouchHighlight = 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPAddKeepLocalControl;
  -[MPAddKeepLocalControl touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  self->_hadFirstTouchHighlight = 0;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  int v6;
  char v7;
  double v8;
  _QWORD v9[5];
  char v10;
  _QWORD v11[6];
  objc_super v12;

  v3 = a3;
  v5 = -[MPAddKeepLocalControl isHighlighted](self, "isHighlighted");
  v12.receiver = self;
  v12.super_class = (Class)MPAddKeepLocalControl;
  -[MPAddKeepLocalControl setHighlighted:](&v12, sel_setHighlighted_, v3);
  v6 = -[MPAddKeepLocalControl isHighlighted](self, "isHighlighted");
  if (v5 != v6)
  {
    v7 = v6;
    v8 = 1.0;
    if (v6)
    {
      -[MPAddKeepLocalControl _beginTransientContentViewTransaction](self, "_beginTransientContentViewTransaction", 1.0);
      v8 = 0.2;
    }
    if (self->_hadFirstTouchHighlight)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __40__MPAddKeepLocalControl_setHighlighted___block_invoke;
      v11[3] = &unk_1E3161620;
      v11[4] = self;
      *(double *)&v11[5] = v8;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __40__MPAddKeepLocalControl_setHighlighted___block_invoke_2;
      v9[3] = &unk_1E3156998;
      v10 = v7;
      v9[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v11, v9, 0.47, 0.0);
    }
    else
    {
      self->_hadFirstTouchHighlight = 1;
      -[UIView setAlpha:](self->_transientContentView, "setAlpha:", v8);
      if ((v7 & 1) == 0)
        -[MPAddKeepLocalControl _endTransientContentViewTransaction](self, "_endTransientContentViewTransaction");
    }
  }
}

- (void)setAllowsAddImage:(BOOL)a3
{
  if (self->_allowsAddImage != a3)
  {
    self->_allowsAddImage = a3;
    if (self->_controlStatus.statusType == 1)
      -[MPAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }
}

- (void)setDisplayStyle:(int64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    -[MPAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
    -[MPAddKeepLocalControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
  }
}

- (void)setControlStatus:(MPAddKeepLocalControlStatus)a3
{
  -[MPAddKeepLocalControl setControlStatus:animated:](self, "setControlStatus:animated:", a3.statusType, *(_QWORD *)&a3.downloadProgress, 0);
}

- (void)setControlStatus:(MPAddKeepLocalControlStatus)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  MPAddKeepLocalControlStatus *p_controlStatus;
  int64_t statusType;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  _QWORD v16[6];
  char v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a4;
  p_controlStatus = &self->_controlStatus;
  statusType = self->_controlStatus.statusType;
  if (statusType == a3.statusType
    && vabdd_f64(self->_controlStatus.downloadProgress, a3.downloadProgress) <= 0.00000011920929)
  {
    return;
  }
  p_controlStatus->statusType = a3.statusType;
  self->_controlStatus.downloadProgress = a3.downloadProgress;
  v8 = self->_controlStatusRevision + 1;
  self->_controlStatusRevision = v8;
  if (a3.statusType == 4 && statusType == 4)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke;
    v19[3] = &unk_1E3163508;
    v19[4] = self;
    v9 = MEMORY[0x19403A810](v19, a2);
    v10 = (void *)v9;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 134, v9, 0, 0.25, 0.0);
    else
      (*(void (**)(uint64_t))(v9 + 16))(v9);

    return;
  }
  if (a3.statusType == 3)
  {
    if (statusType == 3)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x1E0DC4860], 0);
  }
  else
  {
    if (statusType != 3)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);
  }

LABEL_13:
  -[MPAddKeepLocalControl traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DC4938]);

  v15 = statusType != 4 || !v4;
  if (v15 || p_controlStatus->statusType != 5)
  {
    if ((v14 & 1) == 0)
      -[MPAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_2;
    v18[3] = &unk_1E3163508;
    v18[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_3;
    v16[3] = &unk_1E31569C0;
    v16[4] = self;
    v16[5] = v8;
    v17 = v14 ^ 1;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 134, v18, v16, 0.25, 0.0);
  }
}

- (void)setFilledTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_filledTintColor, a3);
  if (self->_displayStyle == 1)
  {
    -[MPAddKeepLocalControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
    -[MPAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }
}

- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4
{
  void *v6;
  NSMutableDictionary *controlStatusTypeToTitle;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  if (v11)
  {
    if (!controlStatusTypeToTitle)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = v8;

      controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
    }
    -[NSMutableDictionary setObject:forKey:](controlStatusTypeToTitle, "setObject:forKey:", v11, v6);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](controlStatusTypeToTitle, "removeObjectForKey:", v6);
    if (!-[NSMutableDictionary count](self->_controlStatusTypeToTitle, "count"))
    {
      v10 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = 0;

    }
  }
  if (self->_controlStatus.statusType == a4)
    -[MPAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");

}

- (id)titleForControlStatusType:(int64_t)a3
{
  NSMutableDictionary *controlStatusTypeToTitle;
  void *v4;
  void *v5;

  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](controlStatusTypeToTitle, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_beginTransientContentViewTransaction
{
  int64_t transientContentViewTransactionCount;
  id v4;
  UIView *v5;
  UIView *transientContentView;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIView *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  transientContentViewTransactionCount = self->_transientContentViewTransactionCount;
  self->_transientContentViewTransactionCount = transientContentViewTransactionCount + 1;
  if (!transientContentViewTransactionCount)
  {
    if (!self->_transientContentView)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[MPAddKeepLocalControl bounds](self, "bounds");
      v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      transientContentView = self->_transientContentView;
      self->_transientContentView = v5;

      -[MPAddKeepLocalControl insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_transientContentView, 0);
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[MPAddKeepLocalControl subviews](self, "subviews", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = self->_transientContentView;
          if (*(UIView **)(*((_QWORD *)&v14 + 1) + 8 * v12) != v13)
            -[UIView addSubview:](v13, "addSubview:");
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)_endTransientContentViewTransaction
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  UIView *transientContentView;
  UIView *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  --self->_transientContentViewTransactionCount;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIView subviews](self->_transientContentView, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        transientContentView = *(UIView **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if (transientContentView != self->_transientContentView)
        {
          -[MPAddKeepLocalControl addSubview:](self, "addSubview:");
          transientContentView = self->_transientContentView;
        }
        -[UIView removeFromSuperview](transientContentView, "removeFromSuperview");
        v10 = self->_transientContentView;
        self->_transientContentView = 0;

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)_currentContentSuperview
{
  if (self->_transientContentViewTransactionCount >= 1)
    self = (MPAddKeepLocalControl *)self->_transientContentView;
  return self;
}

- (void)_updateControlTitleLabelVisualProperties
{
  UILabel *controlTitleLabel;
  uint64_t v3;
  id v4;

  if (self->_controlStatus.statusType == 5)
  {
    controlTitleLabel = self->_controlTitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    controlTitleLabel = self->_controlTitleLabel;
    if (self->_displayStyle == 1)
      -[MPAddKeepLocalControl filledTintColor](self, "filledTintColor");
    else
      -[MPAddKeepLocalControl tintColor](self, "tintColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  -[UILabel setTextColor:](controlTitleLabel, "setTextColor:");

}

- (void)_updateBackgroundViewCornerRadius
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  id v10;
  CGRect v11;
  CGRect v12;

  -[UIView bounds](self->_backgroundView, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetWidth(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetHeight(v12);
  if (v7 < v8)
    v8 = v7;
  v9 = v8 * 0.5;
  -[UIView layer](self->_backgroundView, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v9);

}

- (void)_updateControlStatusProperties
{
  double v3;
  double v4;
  double v5;
  void *v7;
  char v8;
  int64_t statusType;
  MPDownloadProgressView *downloadProgressView;
  void *v11;
  MPDownloadProgressView *v12;
  MPDownloadProgressView *v13;
  MPDownloadProgressView *v14;
  MPDownloadProgressView *v15;
  void *v16;
  void *v17;
  MPDownloadProgressView *v18;
  id v19;
  UIView *v20;
  UIView *v21;
  UIView *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  UIView *backgroundView;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  int v36;
  UIImageView *controlImageView;
  id v38;
  UIImageView *v39;
  UIImageView *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  UILabel *controlTitleLabel;
  UILabel *v45;
  UILabel *v46;
  void *v47;
  UILabel *v48;
  void *v49;
  UILabel *v50;
  id v51;

  -[MPAddKeepLocalControl traitCollection](self, "traitCollection");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "displayScale");
  v4 = v3;
  v5 = vabdd_f64(0.0, v3);
  if (v4 < 0.0 || v5 < 0.00000011920929)
    goto LABEL_50;
  objc_msgSend(v51, "preferredContentSizeCategory", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC4938]);

  if ((v8 & 1) != 0)
    goto LABEL_50;
  statusType = self->_controlStatus.statusType;
  downloadProgressView = self->_downloadProgressView;
  if (statusType == 4)
  {
    if (!downloadProgressView)
    {
      objc_msgSend((id)objc_opt_class(), "_imageNamed:compatibleWithTraitCollection:", CFSTR("UniversalDownloadProgressStopButton"), v51);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [MPDownloadProgressView alloc];
      -[MPAddKeepLocalControl bounds](self, "bounds");
      v13 = -[MPDownloadProgressView initWithFrame:](v12, "initWithFrame:");
      v14 = self->_downloadProgressView;
      self->_downloadProgressView = v13;

      -[MPDownloadProgressView setCenterImage:](self->_downloadProgressView, "setCenterImage:", v11);
      v15 = self->_downloadProgressView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPDownloadProgressView setOuterRingColor:](v15, "setOuterRingColor:", v16);

      -[MPAddKeepLocalControl _currentContentSuperview](self, "_currentContentSuperview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", self->_downloadProgressView);

      downloadProgressView = self->_downloadProgressView;
    }
    -[MPDownloadProgressView setDownloadProgress:](downloadProgressView, "setDownloadProgress:", self->_controlStatus.downloadProgress);
    goto LABEL_15;
  }
  -[MPDownloadProgressView removeFromSuperview](downloadProgressView, "removeFromSuperview");
  v18 = self->_downloadProgressView;
  self->_downloadProgressView = 0;

  if (statusType != 1 || self->_displayStyle != 1)
  {
LABEL_15:
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    v26 = *MEMORY[0x1E0DC49E8];
    v25 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v28 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    switch(statusType)
    {
      case 1:
        goto LABEL_16;
      case 2:
        v32 = (void *)objc_opt_class();
        v33 = CFSTR("UniversalAddControlDownloadable");
        goto LABEL_25;
      case 3:
        v32 = (void *)objc_opt_class();
        v33 = CFSTR("UniversalAddControlWaiting");
        goto LABEL_25;
      case 5:
        -[MPAddKeepLocalControl titleForControlStatusType:](self, "titleForControlStatusType:", 5);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "length"))
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "BOOLForKey:", CFSTR("MPKeepLocalControlShouldShowDownloadedIndicator"));

          if (!v36)
            goto LABEL_34;
        }
        objc_msgSend((id)objc_opt_class(), "_imageNamed:compatibleWithTraitCollection:", CFSTR("UniversalAddControlDownloaded"), v51);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (vabdd_f64(2.0, v4) >= 0.00000011920929)
          v25 = -2.0;
        else
          v25 = -1.5;
        if (self->_displayStyle == 1)
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        else
          objc_msgSend((id)objc_opt_class(), "systemLightGrayColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0.0;
        v27 = -3.0;
        v26 = 0.0;
        break;
      case 6:
        v32 = (void *)objc_opt_class();
        v33 = CFSTR("UniversalAddControlError");
        goto LABEL_25;
      case 7:
        v32 = (void *)objc_opt_class();
        v33 = CFSTR("UniversalAddControlPaused");
LABEL_25:
        objc_msgSend(v32, "_imageNamed:compatibleWithTraitCollection:", v33, v51);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        goto LABEL_37;
      default:
        goto LABEL_34;
    }
    goto LABEL_37;
  }
  if (!self->_backgroundView)
  {
    v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[MPAddKeepLocalControl bounds](self, "bounds");
    v20 = (UIView *)objc_msgSend(v19, "initWithFrame:");
    v21 = self->_backgroundView;
    self->_backgroundView = v20;

    v22 = self->_backgroundView;
    -[MPAddKeepLocalControl tintColor](self, "tintColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
    -[MPAddKeepLocalControl _updateBackgroundViewCornerRadius](self, "_updateBackgroundViewCornerRadius");
    -[MPAddKeepLocalControl _currentContentSuperview](self, "_currentContentSuperview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "insertSubview:atIndex:", self->_backgroundView, 0);

  }
  v26 = *MEMORY[0x1E0DC49E8];
  v25 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v28 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v27 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
LABEL_16:
  if (!self->_allowsAddImage)
  {
LABEL_34:
    v31 = 0;
    self->_controlImageEdgeInsets.top = v26;
    self->_controlImageEdgeInsets.left = v25;
    self->_controlImageEdgeInsets.bottom = v28;
    self->_controlImageEdgeInsets.right = v27;
    goto LABEL_43;
  }
  objc_msgSend((id)objc_opt_class(), "_imageNamed:compatibleWithTraitCollection:", CFSTR("UniversalAddControlAdd"), v51);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 3.0;
  if (self->_displayStyle == 1)
  {
    -[MPAddKeepLocalControl filledTintColor](self, "filledTintColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  v28 = 3.0;
  v25 = 3.0;
  v26 = 3.0;
LABEL_37:
  self->_controlImageEdgeInsets.top = v26;
  self->_controlImageEdgeInsets.left = v25;
  self->_controlImageEdgeInsets.bottom = v28;
  self->_controlImageEdgeInsets.right = v27;
  if (v30)
  {
    controlImageView = self->_controlImageView;
    if (!controlImageView)
    {
      v38 = objc_alloc(MEMORY[0x1E0DC3890]);
      v39 = (UIImageView *)objc_msgSend(v38, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v40 = self->_controlImageView;
      self->_controlImageView = v39;

      -[MPAddKeepLocalControl _currentContentSuperview](self, "_currentContentSuperview");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addSubview:", self->_controlImageView);

      controlImageView = self->_controlImageView;
    }
    -[UIImageView setTintColor:](controlImageView, "setTintColor:", v31);
    -[UIImageView setImage:](self->_controlImageView, "setImage:", v30);
    if (-[MPAddKeepLocalControl scaleImageForAccessibility](self, "scaleImageForAccessibility"))
      -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](self->_controlImageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    -[MPAddKeepLocalControl _updateControlImageViewAnimation](self, "_updateControlImageViewAnimation");
    goto LABEL_44;
  }
LABEL_43:
  -[UIImageView removeFromSuperview](self->_controlImageView, "removeFromSuperview");
  v30 = self->_controlImageView;
  self->_controlImageView = 0;
LABEL_44:

  -[MPAddKeepLocalControl titleForControlStatusType:](self, "titleForControlStatusType:", statusType);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "length");
  controlTitleLabel = self->_controlTitleLabel;
  if (v43)
  {
    if (!controlTitleLabel)
    {
      v45 = (UILabel *)objc_msgSend((id)objc_opt_class(), "_newControlTitleLabel");
      v46 = self->_controlTitleLabel;
      self->_controlTitleLabel = v45;

      -[MPAddKeepLocalControl _currentContentSuperview](self, "_currentContentSuperview");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addSubview:", self->_controlTitleLabel);

    }
    -[MPAddKeepLocalControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
    v48 = self->_controlTitleLabel;
    objc_msgSend((id)objc_opt_class(), "controlTitleFontForControlStatusType:", statusType);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v48, "setFont:", v49);

    -[UILabel setText:](self->_controlTitleLabel, "setText:", v42);
  }
  else
  {
    -[UILabel removeFromSuperview](controlTitleLabel, "removeFromSuperview");
    v50 = self->_controlTitleLabel;
    self->_controlTitleLabel = 0;

  }
  -[MPAddKeepLocalControl setNeedsLayout](self, "setNeedsLayout");

LABEL_50:
}

- (void)_updateControlImageViewAnimation
{
  UIImageView *controlImageView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  double v12;
  CFTimeInterval v13;
  long double v14;
  id v15;

  controlImageView = self->_controlImageView;
  if (controlImageView)
  {
    -[UIImageView layer](controlImageView, "layer");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_controlStatus.statusType == 3)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "presentationLayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v6 = v5;
      else
        v6 = v15;
      objc_msgSend(v4, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForKeyPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setFromValue:", v8);
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "floatValue");
      objc_msgSend(v9, "numberWithDouble:", (double)(fmod(v10, 6.28318531) + 6.28318531));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setToValue:", v11);

      objc_msgSend(v4, "setRemovedOnCompletion:", 0);
      LODWORD(v12) = 2139095040;
      objc_msgSend(v4, "setRepeatCount:", v12);
      objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v4, "setDuration:", 1.0);
      objc_msgSend(v4, "setBeginTimeMode:", *MEMORY[0x1E0CD2918]);
      v13 = CACurrentMediaTime();
      objc_msgSend(v4, "duration");
      objc_msgSend(v4, "setBeginTime:", (double)(v13 - fmod(v13, v14)));
      objc_msgSend(v15, "addAnimation:forKey:", v4, CFSTR("_MPAddKeepLocalControlWaitingSpinnerAnimationKey"));

    }
    else
    {
      objc_msgSend(v15, "removeAnimationForKey:", CFSTR("_MPAddKeepLocalControlWaitingSpinnerAnimationKey"));
    }

  }
}

- (BOOL)allowsAddImage
{
  return self->_allowsAddImage;
}

- (MPAddKeepLocalControlStatus)controlStatus
{
  MPAddKeepLocalControlStatus *p_controlStatus;
  int64_t statusType;
  double downloadProgress;
  MPAddKeepLocalControlStatus result;

  p_controlStatus = &self->_controlStatus;
  statusType = self->_controlStatus.statusType;
  downloadProgress = p_controlStatus->downloadProgress;
  result.downloadProgress = downloadProgress;
  result.statusType = statusType;
  return result;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (BOOL)scaleImageForAccessibility
{
  return self->_scaleImageForAccessibility;
}

- (void)setScaleImageForAccessibility:(BOOL)a3
{
  self->_scaleImageForAccessibility = a3;
}

- (UIColor)filledTintColor
{
  return self->_filledTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledTintColor, 0);
  objc_storeStrong((id *)&self->_transientContentView, 0);
  objc_storeStrong((id *)&self->_downloadProgressView, 0);
  objc_storeStrong((id *)&self->_controlStatusTypeToTitle, 0);
  objc_storeStrong((id *)&self->_controlImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_controlTitleLabel, 0);
}

uint64_t __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setDownloadProgress:", *(double *)(*(_QWORD *)(a1 + 32) + 600));
}

uint64_t __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setDownloadProgress:", 1.0);
}

void __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  _QWORD block[6];
  char v5;

  v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_4;
  block[3] = &unk_1E315ED60;
  v3 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v3;
  v5 = *(_BYTE *)(a1 + 48);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

_QWORD *__51__MPAddKeepLocalControl_setControlStatus_animated___block_invoke_4(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[62] == *(_QWORD *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 48))
      return (_QWORD *)objc_msgSend(result, "_updateControlStatusProperties");
  }
  return result;
}

uint64_t __40__MPAddKeepLocalControl_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __40__MPAddKeepLocalControl_setHighlighted___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_endTransientContentViewTransaction");
  return result;
}

+ (CGSize)_expectedSizeForControlStatusType:(int64_t)a3 controlTitle:(id)a4 hasControlImage:(BOOL)a5 displayScale:(double)a6 preferredHeight:(double)a7
{
  _BOOL4 v9;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double SafeScaleForValue;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  v9 = a5;
  v12 = a4;
  v13 = v12;
  v15 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3)
  {
    if (objc_msgSend(v12, "length"))
    {
      v16 = (void *)objc_msgSend(a1, "_newControlTitleLabel");
      objc_msgSend(a1, "controlTitleFontForControlStatusType:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v17);

      objc_msgSend(v16, "setText:", v13);
      objc_msgSend(v16, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v19 = v18;
      v21 = v20;
      SafeScaleForValue = MPFloatGetSafeScaleForValue(a6);
      v23 = ceil(SafeScaleForValue * v19) / SafeScaleForValue;
      if (v9)
      {
        v14 = fmax(v21, 28.0);
        objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_scaledValueForValue:", 8.0);
        v26 = v15 + v23 + 5.0 + v25;

        v15 = v14 + 0.0 + v26;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_scaledValueForValue:", 8.0);
        v15 = v15 + v23 + v28 * 2.0;

      }
      if (v14 <= a7)
        v14 = a7;

    }
    else
    {
      if (a7 >= 28.0)
        v14 = a7;
      else
        v14 = 28.0;
      v15 = v14;
    }
  }

  v29 = v15;
  v30 = v14;
  result.height = v30;
  result.width = v29;
  return result;
}

+ (id)_newControlTitleLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3990]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  return v3;
}

+ (id)controlTitleFontForControlStatusType:(int64_t)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(MEMORY[0x1E0DC37E8], "smallSystemFontSize", a3);
  return (id)objc_msgSend(v3, "boldSystemFontOfSize:");
}

+ (id)_imageNamed:(id)a3 compatibleWithTraitCollection:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
