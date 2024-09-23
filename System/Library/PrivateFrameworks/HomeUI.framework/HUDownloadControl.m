@implementation HUDownloadControl

- (HUDownloadControl)initWithFrame:(CGRect)a3
{
  HUDownloadControl *v3;
  HUDownloadControl *v4;
  uint64_t v5;
  UIColor *filledTintColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUDownloadControl;
  v3 = -[HUDownloadControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_allowsAddImage = 1;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v5 = objc_claimAutoreleasedReturnValue();
    filledTintColor = v4->_filledTintColor;
    v4->_filledTintColor = (UIColor *)v5;

    v4->_minTitleLength = 0.0;
  }
  -[HUDownloadControl setScaleImageForAccessibility:](v4, "setScaleImageForAccessibility:", 1);
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
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB350], 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)HUDownloadControl;
  -[HUDownloadControl dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUDownloadControl;
  -[HUDownloadControl didMoveToWindow](&v3, sel_didMoveToWindow);
  if (-[HUDownloadControl _isInAWindow](self, "_isInAWindow"))
    -[HUDownloadControl _updateControlImageViewAnimation](self, "_updateControlImageViewAnimation");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  HUDownloadControl *v5;

  if (-[HUDownloadControl pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)
    && -[HUDownloadControl isEnabled](self, "isEnabled")
    && (-[HUDownloadControl isHidden](self, "isHidden") & 1) == 0)
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
  -[HUDownloadControl bounds](self, "bounds", a4);
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
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  UIImageView *controlImageView;
  int64_t statusType;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIEdgeInsets *p_controlImageEdgeInsets;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double x;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  double v62;
  double v63;
  double MaxX;
  CGFloat v65;
  CGFloat v66;
  double MinX;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  double v81;
  void *v82;
  NSString *v83;
  BOOL IsAccessibilityCategory;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  CGFloat v89;
  void *controlTitleLabel;
  double v91;
  void *v92;
  double v93;
  double v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  double v99;
  CGFloat v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  double v121;
  double v122;
  CGFloat v123;
  double v124;
  double v125;
  double v126;
  double v127;
  CGFloat v128;
  CGFloat v129;
  UIView *backgroundView;
  double v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat rect;
  CGFloat recta;
  CGFloat rect_8;
  double rect_8b;
  double rect_8c;
  CGFloat rect_8a;
  CGFloat rect_16;
  double rect_24;
  double v142;
  CGFloat v143;
  double v144;
  CGFloat v145;
  CGFloat v146;
  double v147;
  CGFloat v148;
  CGFloat v149;
  CGFloat r1;
  double r1a;
  CGFloat v152;
  double r2;
  CGFloat r2a;
  double v155;
  double v156;
  CGFloat v157;
  double v158;
  CGFloat v159;
  CGFloat v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;

  *(_QWORD *)&v161.origin.y = self;
  *(_QWORD *)&v161.size.width = HUDownloadControl;
  -[CGFloat layoutSubviews]((objc_super *)&v161.origin.y, sel_layoutSubviews);
  -[HUDownloadControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUDownloadControl traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  SafeScaleForValue = HUFloatGetSafeScaleForValue(v12);

  -[UILabel frame](self->_controlTitleLabel, "frame");
  v143 = v14;
  v16 = v15;
  -[UILabel sizeThatFits:](self->_controlTitleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v148 = v17;
  r1 = v18;
  v19 = *MEMORY[0x1E0C9D628];
  v20 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v155 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v156 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v21 = -[HUDownloadControl contentHorizontalAlignment](self, "contentHorizontalAlignment");
  controlImageView = self->_controlImageView;
  v157 = v6;
  v161.origin.x = v4;
  v147 = SafeScaleForValue;
  if (controlImageView)
  {
    rect_16 = v20;
    v158 = v19;
    statusType = self->_controlStatus.statusType;
    -[UIImageView frame](controlImageView, "frame");
    -[UILabel text](self->_controlTitleLabel, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    v26 = fmin(v8, 45.0);
    v27 = fmin(v10, 45.0);
    if (v25)
      v28 = v10;
    else
      v28 = v27;
    if (v25)
      v29 = v8;
    else
      v29 = v26;
    -[UIImageView sizeThatFits:](self->_controlImageView, "sizeThatFits:", v29, v28);
    p_controlImageEdgeInsets = &self->_controlImageEdgeInsets;
    rect_24 = v31;
    v142 = v32;
    UIRectCenteredYInRectScale();
    rect = v33;
    v152 = v35;
    r2 = v34;
    v146 = v36;
    -[UILabel text](self->_controlTitleLabel, "text", *(_QWORD *)&SafeScaleForValue);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "length");

    if (v38)
    {
      UIRectCenteredYInRectScale();
      rect_8 = v39;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538], *(_QWORD *)&SafeScaleForValue);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "_scaledValueForValue:", 8.0);
      v47 = v6 + 0.0;
      v144 = v29;
      v49 = v29 - (v48 + 5.0);

      v149 = v45;
      r1a = v43;
      v132 = v47;
      v133 = v49;
      if (v21 == 2)
      {
        v166.origin.x = v4 + 5.0;
        v166.origin.y = v47;
        v166.size.width = v49;
        v166.size.height = v28;
        MaxX = CGRectGetMaxX(v166);
        v167.origin.x = rect_8;
        v167.origin.y = v41;
        rect_8b = v28;
        v65 = v43;
        v167.size.width = v43;
        v167.size.height = v45;
        v66 = MaxX - CGRectGetWidth(v167);
        v168.origin.x = v66;
        v168.origin.y = v41;
        v168.size.width = v43;
        v168.size.height = v45;
        MinX = CGRectGetMinX(v168);
        v169.origin.x = rect;
        v52 = v152;
        v51 = r2;
        v169.origin.y = r2;
        v169.size.width = v152;
        v53 = v146;
        v169.size.height = v146;
        x = MinX - CGRectGetWidth(v169);
        v54 = v66;
        v55 = v144;
        v56 = v65;
        v28 = rect_8b;
      }
      else if (v21 == 1)
      {
        v162.origin.x = v4 + 5.0;
        v162.origin.y = v47;
        v162.size.width = v49;
        v162.size.height = v28;
        v163.origin.x = CGRectGetMinX(v162);
        x = v163.origin.x;
        v52 = v152;
        v51 = r2;
        v163.origin.y = r2;
        v163.size.width = v152;
        v53 = v146;
        v163.size.height = v146;
        v54 = CGRectGetMaxX(v163) + 0.0;
        v55 = v144;
        v56 = r1a;
      }
      else
      {
        v170.origin.x = 0.0;
        v170.origin.y = r2;
        v170.size.width = v152;
        v170.size.height = v146;
        v171.origin.x = CGRectGetMaxX(v170) + 0.0;
        rect_8c = v171.origin.x;
        v189.origin.x = 0.0;
        v171.origin.y = v41;
        v171.size.height = v45;
        v171.size.width = v43;
        v189.origin.y = r2;
        v189.size.width = v152;
        v189.size.height = v146;
        v172 = CGRectUnion(v171, v189);
        recta = v172.origin.x;
        y = v172.origin.y;
        width = v172.size.width;
        height = v172.size.height;
        v131 = SafeScaleForValue;
        UIRectCenteredXInRectScale();
        v71 = CGRectGetMinX(v173);
        v174.origin.x = recta;
        v174.origin.y = y;
        v174.size.width = width;
        v51 = r2;
        v174.size.height = height;
        v72 = v71 - CGRectGetMinX(v174);
        v53 = v146;
        v52 = v152;
        v73 = HUFloatGetSafeScaleForValue(SafeScaleForValue);
        v56 = r1a;
        v74 = round(v73 * v72) / v73;
        x = v74 + 0.0;
        v54 = rect_8c + v74;
        v55 = v144;
      }
      rect_8a = v54;
      v145 = v41;
      v75 = v41;
      v76 = v45;
      v190.origin.x = x;
      v190.origin.y = v51;
      v190.size.width = v52;
      v190.size.height = v53;
      v175 = CGRectUnion(*(CGRect *)&v54, v190);
      v77 = v175.origin.x;
      v78 = v175.origin.y;
      v79 = v175.size.width;
      v80 = v175.size.height;
      v175.origin.x = v161.origin.x + 5.0;
      v175.origin.y = v132;
      v175.size.width = v133;
      v175.size.height = v28;
      v81 = CGRectGetWidth(v175);
      -[HUDownloadControl traitCollection](self, "traitCollection");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "preferredContentSizeCategory");
      v83 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v83);

      if (!IsAccessibilityCategory)
      {
        v176.origin.x = v77;
        v176.origin.y = v78;
        v176.size.width = v79;
        v176.size.height = v80;
        v85 = CGRectGetWidth(v176) - v81;
        if (v85 <= 0.00000011920929)
          v85 = 0.0;
        r1a = r1a - v85;
      }
      v4 = v161.origin.x;
      v6 = v157;
      if (statusType == 1)
      {
        v19 = v158;
        v86 = rect_16;
        v88 = v152;
        v87 = r2;
        v89 = v146;
      }
      else
      {
        x = x - self->_controlImageEdgeInsets.left;
        v87 = r2 - p_controlImageEdgeInsets->top;
        v88 = rect_24;
        v89 = v142;
        v19 = v158;
        v86 = rect_16;
      }
      -[UIImageView setFrame:](self->_controlImageView, "setFrame:", HURectByApplyingUserInterfaceLayoutDirectionInRect(x, v87, v88, v89, v161.origin.x, v157, v55, v28));
      controlTitleLabel = self->_controlTitleLabel;
      v91 = HURectByApplyingUserInterfaceLayoutDirectionInRect(rect_8a, v145, r1a, v149, v161.origin.x, v157, v55, v28);
      v20 = v86;
    }
    else
    {
      v61 = 2;
      if (statusType != 3)
        v61 = v21;
      if (v61 == 2)
      {
        v180.origin.x = v4;
        v180.origin.y = v6;
        v180.size.width = v8;
        v180.size.height = v10;
        v108 = CGRectGetMaxX(v180);
        v181.origin.x = rect;
        v181.size.width = v152;
        v62 = r2;
        v181.origin.y = r2;
        v63 = v146;
        v181.size.height = v146;
        v19 = v108 - CGRectGetWidth(v181) - self->_controlImageEdgeInsets.right;
        v55 = v29;
      }
      else
      {
        v55 = v29;
        v62 = r2;
        if (v61 == 1)
        {
          v165.origin.x = v4;
          v165.origin.y = v6;
          v165.size.width = v29;
          v165.size.height = v28;
          v19 = CGRectGetMinX(v165) - self->_controlImageEdgeInsets.left;
          v63 = v146;
        }
        else
        {
          v131 = v147;
          UIRectCenteredXInRectScale();
          v19 = v109;
          v62 = v110;
          v152 = v111;
          v63 = v112;
        }
      }
      controlTitleLabel = self->_controlImageView;
      v91 = HURectByApplyingUserInterfaceLayoutDirectionInRect(v19, v62 - p_controlImageEdgeInsets->top, fmin(rect_24, 45.0), fmin(v142, 45.0), v4, v6, v55, v28);
      v20 = v63;
      v155 = v152;
      v156 = v62;
    }
  }
  else
  {
    -[UILabel text](self->_controlTitleLabel, "text");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "length");

    if (!v58)
      goto LABEL_38;
    if (v21 == 2)
    {
      v177.origin.x = v4;
      v177.origin.y = v6;
      v177.size.width = v8;
      v177.size.height = v10;
      CGRectGetMaxX(v177);
      v59 = *MEMORY[0x1E0CEB538];
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "_scaledValueForValue:", 8.0);
      v178.origin.x = v143;
      v178.origin.y = v16;
      v178.size.width = v148;
      v178.size.height = r1;
      CGRectGetWidth(v178);

    }
    else if (v21 == 1)
    {
      v164.origin.x = v4;
      v164.origin.y = v6;
      v164.size.width = v8;
      v164.size.height = v10;
      CGRectGetMinX(v164);
      v59 = *MEMORY[0x1E0CEB538];
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "_scaledValueForValue:", 8.0);

    }
    else
    {
      UIRectCenteredXInRectScale();
      v59 = *MEMORY[0x1E0CEB538];
    }
    UIRectCenteredYInRectScale();
    v94 = v93;
    v95 = v4;
    v159 = v96;
    v98 = v97;
    v100 = v99;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v59, *(_QWORD *)&v147);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "_scaledValueForValue:", 8.0);
    v103 = v94 - v102;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v59);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "_scaledValueForValue:", 8.0);
    v155 = v98 + v105 * 2.0;

    v179.origin.x = v95;
    v179.origin.y = v6;
    v179.size.width = v8;
    v179.size.height = v10;
    v106 = CGRectGetHeight(v179);
    controlTitleLabel = self->_controlTitleLabel;
    v107 = v94;
    v19 = v103;
    v4 = v95;
    v20 = v106;
    v91 = HURectByApplyingUserInterfaceLayoutDirectionInRect(v107, v159, v98, v100, v4, v6, v8, v10);
    v156 = 0.0;
    v28 = v10;
    v55 = v8;
  }
  objc_msgSend(controlTitleLabel, "setFrame:", v91, *(_QWORD *)&v131);
  v10 = v28;
  v8 = v55;
LABEL_38:
  if (!self->_downloadProgressView)
    goto LABEL_51;
  v160 = v19;
  v182.origin.x = v4;
  v182.origin.y = v6;
  v182.size.width = v8;
  v182.size.height = v10;
  v113 = CGRectGetWidth(v182);
  v183.origin.x = v4;
  v183.origin.y = v6;
  v183.size.width = v8;
  v183.size.height = v10;
  v114 = CGRectGetHeight(v183);
  if (v113 >= v114)
    v115 = v114;
  else
    v115 = v113;
  -[HUDownloadProgressView frame](self->_downloadProgressView, "frame");
  v117 = v116;
  v119 = v118;
  r2a = v10;
  if (v21 == 2)
  {
    v185.origin.x = v4;
    v120 = v156;
    v185.origin.y = v6;
    v185.size.width = v8;
    v185.size.height = v10;
    v122 = CGRectGetMaxX(v185);
    v186.origin.x = v117;
    v186.origin.y = v119;
    v186.size.width = v115;
    v186.size.height = v115;
    v121 = v122 - CGRectGetWidth(v186);
  }
  else
  {
    v120 = v156;
    if (v21 != 1)
    {
      UIRectCenteredIntegralRectScale();
      v121 = v124;
      v119 = v125;
      v115 = v126;
      v123 = v127;
      goto LABEL_48;
    }
    v184.origin.x = v161.origin.x;
    v184.origin.y = v6;
    v184.size.width = v8;
    v184.size.height = v10;
    v121 = CGRectGetMinX(v184);
  }
  v123 = v115;
LABEL_48:
  v187.origin.x = v160;
  v187.origin.y = v120;
  v187.size.width = v155;
  v187.size.height = v20;
  if (!CGRectIsNull(v187))
  {
    v188.origin.x = v160;
    v188.origin.y = v120;
    v188.size.width = v155;
    v188.size.height = v20;
    v191.origin.x = v121;
    v191.origin.y = v119;
    v191.size.width = v115;
    v191.size.height = v123;
    CGRectUnion(v188, v191);
  }
  v128 = v121;
  v129 = v123;
  v4 = v161.origin.x;
  v6 = v157;
  v10 = r2a;
  -[HUDownloadProgressView setFrame:](self->_downloadProgressView, "setFrame:", HURectByApplyingUserInterfaceLayoutDirectionInRect(v128, v119, v115, v129, v161.origin.x, v157, v8, r2a));
LABEL_51:
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView setFrame:](backgroundView, "setFrame:", v4, v6, v8, v10);
    -[HUDownloadControl _updateBackgroundViewCornerRadius](self, "_updateBackgroundViewCornerRadius");
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
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  CGSize result;

  -[HUDownloadControl traitCollection](self, "traitCollection", 0, 1, 2, 3, 4, 5, 6, *MEMORY[0x1E0C80C00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  SafeScaleForValue = HUFloatGetSafeScaleForValue(v6);

  v8 = 0;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  do
  {
    v11 = *(_QWORD *)((char *)&v24 + v8);
    v12 = (void *)objc_opt_class();
    -[HUDownloadControl titleForControlStatusType:](self, "titleForControlStatusType:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_allowsAddImage || v11 != 1;
    v16 = HUFloatGetSafeScaleForValue(SafeScaleForValue);
    -[HUDownloadControl minTitleLength](self, "minTitleLength");
    objc_msgSend(v12, "_expectedSizeForControlStatusType:controlTitle:hasControlImage:displayScale:preferredHeight:minTitleLength:", v11, v13, v15, v16, a3, v17);
    v19 = v18;
    v21 = v20;

    if (v9 < v19)
      v9 = v19;
    if (v10 < v21)
      v10 = v21;
    v8 += 8;
  }
  while (v8 != 56);
  v22 = v9;
  v23 = v10;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)intrinsicContentSize
{
  int64_t statusType;
  void *v4;
  double v5;
  double SafeScaleForValue;
  void *v7;
  void *v8;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  BOOL v18;
  double v19;
  double v20;
  CGSize result;

  statusType = self->_controlStatus.statusType;
  -[HUDownloadControl traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  SafeScaleForValue = HUFloatGetSafeScaleForValue(v5);

  -[HUDownloadControl titleForControlStatusType:](self, "titleForControlStatusType:", statusType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  v10 = self->_allowsAddImage || statusType != 1;
  v11 = HUFloatGetSafeScaleForValue(SafeScaleForValue);
  -[HUDownloadControl minTitleLength](self, "minTitleLength");
  objc_msgSend(v8, "_expectedSizeForControlStatusType:controlTitle:hasControlImage:displayScale:preferredHeight:minTitleLength:", statusType, v7, v10, v11, 28.0, v12);
  v14 = v13;
  v16 = v15;
  v17 = -[HUDownloadControl displayStyle](self, "displayStyle");
  if (v7)
    v18 = v17 == 1;
  else
    v18 = 0;
  if (v18)
    v14 = v14 + 6.0;

  v19 = v14;
  v20 = v16;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUDownloadControl;
  -[HUDownloadControl tintColorDidChange](&v4, sel_tintColorDidChange);
  -[HUDownloadControl tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_displayStyle == 1)
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v3);
  -[HUDownloadControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
  if (self->_controlStatus.statusType == 2 && self->_traitCollectionDidChangeWasCalled)
    -[HUDownloadControl _updateControlStatusProperties](self, "_updateControlStatusProperties");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUDownloadControl;
  -[HUDownloadControl traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[HUDownloadControl traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  *(float *)&v8 = v8;
  if (vabds_f32(v7, *(float *)&v8) >= 0.00000011921
    || (objc_msgSend(v5, "preferredContentSizeCategory"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "preferredContentSizeCategory"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 != v10))
  {
    -[HUDownloadControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }
  self->_traitCollectionDidChangeWasCalled = 1;

}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  uint64_t v5;
  objc_super v6;

  v5 = -[HUDownloadControl contentHorizontalAlignment](self, "contentHorizontalAlignment");
  v6.receiver = self;
  v6.super_class = (Class)HUDownloadControl;
  -[HUDownloadControl setContentHorizontalAlignment:](&v6, sel_setContentHorizontalAlignment_, a3);
  if (v5 != -[HUDownloadControl contentHorizontalAlignment](self, "contentHorizontalAlignment"))
    -[HUDownloadControl setNeedsLayout](self, "setNeedsLayout");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUDownloadControl;
  -[HUDownloadControl touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  self->_hadFirstTouchHighlight = 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUDownloadControl;
  -[HUDownloadControl touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
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
  v5 = -[HUDownloadControl isHighlighted](self, "isHighlighted");
  v12.receiver = self;
  v12.super_class = (Class)HUDownloadControl;
  -[HUDownloadControl setHighlighted:](&v12, sel_setHighlighted_, v3);
  v6 = -[HUDownloadControl isHighlighted](self, "isHighlighted");
  if (v5 != v6)
  {
    v7 = v6;
    v8 = 1.0;
    if (v6)
    {
      -[HUDownloadControl _beginTransientContentViewTransaction](self, "_beginTransientContentViewTransaction", 1.0);
      v8 = 0.2;
    }
    if (self->_hadFirstTouchHighlight)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __36__HUDownloadControl_setHighlighted___block_invoke;
      v11[3] = &unk_1E6F4CE48;
      v11[4] = self;
      *(double *)&v11[5] = v8;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __36__HUDownloadControl_setHighlighted___block_invoke_2;
      v9[3] = &unk_1E6F54C58;
      v10 = v7;
      v9[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 327684, v11, v9, 0.47, 0.0);
    }
    else
    {
      self->_hadFirstTouchHighlight = 1;
      -[UIView setAlpha:](self->_transientContentView, "setAlpha:", v8);
      if ((v7 & 1) == 0)
        -[HUDownloadControl _endTransientContentViewTransaction](self, "_endTransientContentViewTransaction");
    }
  }
}

uint64_t __36__HUDownloadControl_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __36__HUDownloadControl_setHighlighted___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_endTransientContentViewTransaction");
  return result;
}

- (void)setAllowsAddImage:(BOOL)a3
{
  if (self->_allowsAddImage != a3)
  {
    self->_allowsAddImage = a3;
    if (self->_controlStatus.statusType == 1)
      -[HUDownloadControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }
}

- (void)setDisplayStyle:(int64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    -[HUDownloadControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
    -[HUDownloadControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
  }
}

- (void)setControlStatus:(HUDownloadControlStatus)a3
{
  -[HUDownloadControl setControlStatus:animated:](self, "setControlStatus:animated:", a3.statusType, *(_QWORD *)&a3.downloadProgress, 0);
}

- (void)setControlStatus:(HUDownloadControlStatus)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  HUDownloadControlStatus *p_controlStatus;
  int64_t statusType;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  _QWORD v16[6];
  char v17;
  _QWORD v18[5];
  _QWORD aBlock[5];

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
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__HUDownloadControl_setControlStatus_animated___block_invoke;
    aBlock[3] = &unk_1E6F4D988;
    aBlock[4] = self;
    v9 = _Block_copy(aBlock);
    v10 = v9;
    if (v4)
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 134, v9, 0, 0.25, 0.0);
    else
      (*((void (**)(void *))v9 + 2))(v9);

    return;
  }
  if (a3.statusType == 3)
  {
    if (statusType == 3)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x1E0CEB350], 0);
  }
  else
  {
    if (statusType != 3)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB350], 0);
  }

LABEL_13:
  -[HUDownloadControl traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CEB440]);

  v15 = statusType != 4 || !v4;
  if (v15 || p_controlStatus->statusType != 5)
  {
    if ((v14 & 1) == 0)
      -[HUDownloadControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__HUDownloadControl_setControlStatus_animated___block_invoke_2;
    v18[3] = &unk_1E6F4D988;
    v18[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__HUDownloadControl_setControlStatus_animated___block_invoke_3;
    v16[3] = &unk_1E6F54CA8;
    v16[4] = self;
    v16[5] = v8;
    v17 = v14 ^ 1;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 134, v18, v16, 0.25, 0.0);
  }
}

uint64_t __47__HUDownloadControl_setControlStatus_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setDownloadProgress:", *(double *)(*(_QWORD *)(a1 + 32) + 608));
}

uint64_t __47__HUDownloadControl_setControlStatus_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setDownloadProgress:", 1.0);
}

void __47__HUDownloadControl_setControlStatus_animated___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  _QWORD block[6];
  char v5;

  v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HUDownloadControl_setControlStatus_animated___block_invoke_4;
  block[3] = &unk_1E6F54C80;
  v3 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v3;
  v5 = *(_BYTE *)(a1 + 48);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

_QWORD *__47__HUDownloadControl_setControlStatus_animated___block_invoke_4(uint64_t a1)
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

- (void)setFilledTintColor:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[HUDownloadControl filledTintColor](self, "filledTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_filledTintColor, a3);
    if (self->_displayStyle == 1)
    {
      -[HUDownloadControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
      -[HUDownloadControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
    }
  }

}

- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4
{
  void *v6;
  NSMutableDictionary *controlStatusTypeToTitle;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  if (v12)
  {
    if (!controlStatusTypeToTitle)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = v8;

      controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](controlStatusTypeToTitle, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
    {

      goto LABEL_12;
    }
    -[NSMutableDictionary setObject:forKey:](self->_controlStatusTypeToTitle, "setObject:forKey:", v12, v6);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](controlStatusTypeToTitle, "removeObjectForKey:", v6);
    if (-[NSMutableDictionary count](self->_controlStatusTypeToTitle, "count"))
      goto LABEL_10;
    v11 = self->_controlStatusTypeToTitle;
    self->_controlStatusTypeToTitle = 0;
  }

LABEL_10:
  if (self->_controlStatus.statusType == a4)
    -[HUDownloadControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
LABEL_12:

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

+ (CGSize)_expectedSizeForControlStatusType:(int64_t)a3 controlTitle:(id)a4 hasControlImage:(BOOL)a5 displayScale:(double)a6 preferredHeight:(double)a7 minTitleLength:(double)a8
{
  _BOOL4 v11;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double SafeScaleForValue;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  v11 = a5;
  v14 = a4;
  v15 = v14;
  v17 = *MEMORY[0x1E0C9D820];
  v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3)
  {
    if (objc_msgSend(v14, "length"))
    {
      v18 = (void *)objc_msgSend(a1, "_newControlTitleLabel");
      objc_msgSend(a1, "controlTitleFontForControlStatusType:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFont:", v19);

      objc_msgSend(v18, "setText:", v15);
      objc_msgSend(v18, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v21 = v20;
      v23 = v22;
      SafeScaleForValue = HUFloatGetSafeScaleForValue(a6);
      v25 = ceil(SafeScaleForValue * v21) / SafeScaleForValue;
      if (v25 >= a8)
        a8 = v25;
      if (v11)
      {
        v16 = fmax(v23, 28.0);
        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_scaledValueForValue:", 8.0);
        v28 = v17 + a8 + 5.0 + v27;

        v17 = v16 + 0.0 + v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_scaledValueForValue:", 8.0);
        v17 = v17 + a8 + v30 * 2.0;

      }
      if (v16 <= a7)
        v16 = a7;

    }
    else
    {
      if (a7 >= 28.0)
        v16 = a7;
      else
        v16 = 28.0;
      v17 = v16;
    }
  }

  v31 = v17;
  v32 = v16;
  result.height = v32;
  result.width = v31;
  return result;
}

+ (id)_newControlTitleLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEA700]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  return v3;
}

+ (id)controlTitleFontForControlStatusType:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB5A0], 2);
}

+ (id)_imageNamed:(id)a3 compatibleWithTraitCollection:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
      v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
      -[HUDownloadControl bounds](self, "bounds");
      v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      transientContentView = self->_transientContentView;
      self->_transientContentView = v5;

      -[HUDownloadControl insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_transientContentView, 0);
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[HUDownloadControl subviews](self, "subviews", 0);
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
          -[HUDownloadControl addSubview:](self, "addSubview:");
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
    self = (HUDownloadControl *)self->_transientContentView;
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
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    controlTitleLabel = self->_controlTitleLabel;
    if (self->_displayStyle == 1)
      -[HUDownloadControl filledTintColor](self, "filledTintColor");
    else
      -[HUDownloadControl tintColor](self, "tintColor");
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
  float v3;
  double v4;
  void *v6;
  char v7;
  int64_t statusType;
  HUDownloadProgressView *downloadProgressView;
  HUDownloadProgressView *v10;
  HUDownloadProgressView *v11;
  HUDownloadProgressView *v12;
  HUDownloadProgressView *v13;
  void *v14;
  void *v15;
  void *v16;
  HUDownloadProgressView *v17;
  id v18;
  UIView *v19;
  UIView *v20;
  UIView *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  UIView *backgroundView;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  int v35;
  UIImageView *controlImageView;
  id v37;
  UIImageView *v38;
  UIImageView *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  UILabel *controlTitleLabel;
  UILabel *v44;
  UILabel *v45;
  void *v46;
  UILabel *v47;
  void *v48;
  UILabel *v49;
  id v50;

  -[HUDownloadControl traitCollection](self, "traitCollection");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "displayScale");
  v3 = v4;
  *(float *)&v4 = fabsf(v3);
  if (v3 < 0.0 || *(float *)&v4 < 0.00000011921)
    goto LABEL_52;
  objc_msgSend(v50, "preferredContentSizeCategory", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB440]);

  if ((v7 & 1) != 0)
    goto LABEL_52;
  statusType = self->_controlStatus.statusType;
  downloadProgressView = self->_downloadProgressView;
  if (statusType == 4)
  {
    if (!downloadProgressView)
    {
      v10 = [HUDownloadProgressView alloc];
      -[HUDownloadControl bounds](self, "bounds");
      v11 = -[HUDownloadProgressView initWithFrame:](v10, "initWithFrame:");
      v12 = self->_downloadProgressView;
      self->_downloadProgressView = v11;

      v13 = self->_downloadProgressView;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDownloadProgressView setOuterRingColor:](v13, "setOuterRingColor:", v14);

      if (-[HUDownloadControl showStopImageWhenDownloading](self, "showStopImageWhenDownloading"))
      {
        objc_msgSend((id)objc_opt_class(), "_imageNamed:compatibleWithTraitCollection:", CFSTR("UniversalDownloadProgressStopButton"), v50);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDownloadProgressView setCenterImage:](self->_downloadProgressView, "setCenterImage:", v15);

      }
      -[HUDownloadControl _currentContentSuperview](self, "_currentContentSuperview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", self->_downloadProgressView);

      downloadProgressView = self->_downloadProgressView;
    }
    -[HUDownloadProgressView setDownloadProgress:](downloadProgressView, "setDownloadProgress:", self->_controlStatus.downloadProgress);
    goto LABEL_17;
  }
  -[HUDownloadProgressView removeFromSuperview](downloadProgressView, "removeFromSuperview");
  v17 = self->_downloadProgressView;
  self->_downloadProgressView = 0;

  if (statusType != 1 || self->_displayStyle != 1)
  {
LABEL_17:
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    v25 = *MEMORY[0x1E0CEB4B0];
    v24 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v27 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v26 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    switch(statusType)
    {
      case 1:
        goto LABEL_18;
      case 2:
        v31 = (void *)objc_opt_class();
        v32 = CFSTR("UniversalAddControlDownloadable");
        goto LABEL_27;
      case 3:
        v31 = (void *)objc_opt_class();
        v32 = CFSTR("UniversalAddControlWaiting");
        goto LABEL_27;
      case 5:
        -[HUDownloadControl titleForControlStatusType:](self, "titleForControlStatusType:", 5);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "length"))
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "BOOLForKey:", CFSTR("HUDownloadControlShouldShowDownloadedIndicator"));

          if (!v35)
            goto LABEL_36;
        }
        objc_msgSend((id)objc_opt_class(), "_imageNamed:compatibleWithTraitCollection:", CFSTR("UniversalAddControlDownloaded"), v50);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (fabsf(v3 + -2.0) >= 0.00000011921)
          v24 = -2.0;
        else
          v24 = -1.5;
        if (self->_displayStyle == 1)
          objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
        else
          objc_msgSend((id)objc_opt_class(), "systemLightGrayColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0.0;
        v26 = -3.0;
        v25 = 0.0;
        break;
      case 6:
        v31 = (void *)objc_opt_class();
        v32 = CFSTR("UniversalAddControlError");
        goto LABEL_27;
      case 7:
        v31 = (void *)objc_opt_class();
        v32 = CFSTR("UniversalAddControlPaused");
LABEL_27:
        objc_msgSend(v31, "_imageNamed:compatibleWithTraitCollection:", v32, v50);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        goto LABEL_39;
      default:
        goto LABEL_36;
    }
    goto LABEL_39;
  }
  if (!self->_backgroundView)
  {
    v18 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[HUDownloadControl bounds](self, "bounds");
    v19 = (UIView *)objc_msgSend(v18, "initWithFrame:");
    v20 = self->_backgroundView;
    self->_backgroundView = v19;

    v21 = self->_backgroundView;
    -[HUDownloadControl tintColor](self, "tintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
    -[HUDownloadControl _updateBackgroundViewCornerRadius](self, "_updateBackgroundViewCornerRadius");
    -[HUDownloadControl _currentContentSuperview](self, "_currentContentSuperview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "insertSubview:atIndex:", self->_backgroundView, 0);

  }
  v25 = *MEMORY[0x1E0CEB4B0];
  v24 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v27 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v26 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
LABEL_18:
  if (!self->_allowsAddImage)
  {
LABEL_36:
    v30 = 0;
    self->_controlImageEdgeInsets.top = v25;
    self->_controlImageEdgeInsets.left = v24;
    self->_controlImageEdgeInsets.bottom = v27;
    self->_controlImageEdgeInsets.right = v26;
    goto LABEL_45;
  }
  objc_msgSend((id)objc_opt_class(), "_imageNamed:compatibleWithTraitCollection:", CFSTR("UniversalAddControlAdd"), v50);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 3.0;
  if (self->_displayStyle == 1)
  {
    -[HUDownloadControl filledTintColor](self, "filledTintColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  v27 = 3.0;
  v24 = 3.0;
  v25 = 3.0;
LABEL_39:
  self->_controlImageEdgeInsets.top = v25;
  self->_controlImageEdgeInsets.left = v24;
  self->_controlImageEdgeInsets.bottom = v27;
  self->_controlImageEdgeInsets.right = v26;
  if (v29)
  {
    controlImageView = self->_controlImageView;
    if (!controlImageView)
    {
      v37 = objc_alloc(MEMORY[0x1E0CEA658]);
      v38 = (UIImageView *)objc_msgSend(v37, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v39 = self->_controlImageView;
      self->_controlImageView = v38;

      -[HUDownloadControl _currentContentSuperview](self, "_currentContentSuperview");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addSubview:", self->_controlImageView);

      controlImageView = self->_controlImageView;
    }
    -[UIImageView setTintColor:](controlImageView, "setTintColor:", v30);
    -[UIImageView setImage:](self->_controlImageView, "setImage:", v29);
    if (-[HUDownloadControl scaleImageForAccessibility](self, "scaleImageForAccessibility"))
      -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](self->_controlImageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    -[HUDownloadControl _updateControlImageViewAnimation](self, "_updateControlImageViewAnimation");
    goto LABEL_46;
  }
LABEL_45:
  -[UIImageView removeFromSuperview](self->_controlImageView, "removeFromSuperview");
  v29 = self->_controlImageView;
  self->_controlImageView = 0;
LABEL_46:

  -[HUDownloadControl titleForControlStatusType:](self, "titleForControlStatusType:", statusType);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "length");
  controlTitleLabel = self->_controlTitleLabel;
  if (v42)
  {
    if (!controlTitleLabel)
    {
      v44 = (UILabel *)objc_msgSend((id)objc_opt_class(), "_newControlTitleLabel");
      v45 = self->_controlTitleLabel;
      self->_controlTitleLabel = v44;

      -[HUDownloadControl _currentContentSuperview](self, "_currentContentSuperview");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addSubview:", self->_controlTitleLabel);

    }
    -[HUDownloadControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
    v47 = self->_controlTitleLabel;
    objc_msgSend((id)objc_opt_class(), "controlTitleFontForControlStatusType:", statusType);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v47, "setFont:", v48);

    -[UILabel setText:](self->_controlTitleLabel, "setText:", v41);
  }
  else
  {
    -[UILabel removeFromSuperview](controlTitleLabel, "removeFromSuperview");
    v49 = self->_controlTitleLabel;
    self->_controlTitleLabel = 0;

  }
  -[HUDownloadControl setNeedsLayout](self, "setNeedsLayout");

LABEL_52:
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
      objc_msgSend(v15, "addAnimation:forKey:", v4, CFSTR("_HUDownloadControlWaitingSpinnerAnimationKey"));

    }
    else
    {
      objc_msgSend(v15, "removeAnimationForKey:", CFSTR("_HUDownloadControlWaitingSpinnerAnimationKey"));
    }

  }
}

- (BOOL)allowsAddImage
{
  return self->_allowsAddImage;
}

- (HUDownloadControlStatus)controlStatus
{
  HUDownloadControlStatus *p_controlStatus;
  int64_t statusType;
  double downloadProgress;
  HUDownloadControlStatus result;

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

- (BOOL)showStopImageWhenDownloading
{
  return self->_showStopImageWhenDownloading;
}

- (void)setShowStopImageWhenDownloading:(BOOL)a3
{
  self->_showStopImageWhenDownloading = a3;
}

- (UIColor)filledTintColor
{
  return self->_filledTintColor;
}

- (double)minTitleLength
{
  return self->_minTitleLength;
}

- (void)setMinTitleLength:(double)a3
{
  self->_minTitleLength = a3;
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

@end
