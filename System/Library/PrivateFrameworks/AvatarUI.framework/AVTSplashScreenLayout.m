@implementation AVTSplashScreenLayout

+ (BOOL)isSmallScreen
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4 <= 568.0;
}

+ (CGSize)primaryVideoSize
{
  int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = objc_msgSend(a1, "isSmallScreen");
  v3 = 480.0;
  if (v2)
    v3 = 100.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)secondaryVideoSize
{
  int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = objc_msgSend(a1, "isSmallScreen");
  v3 = 854.0;
  if (v2)
    v3 = 245.0;
  v4 = 238.0;
  if (v2)
    v4 = 50.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (unint64_t)appropriateLabelEdgePaddingStyleForViewSize:(CGSize)a3
{
  return a3.width > 400.0;
}

+ (UIButton)blueButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTUIColorRepository splashScreenButtonNormalTextColor](AVTUIColorRepository, "splashScreenButtonNormalTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleColor:forState:", v3, 0);

  +[AVTUIColorRepository splashScreenButtonHighlightedTextColor](AVTUIColorRepository, "splashScreenButtonHighlightedTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleColor:forState:", v4, 1);

  +[AVTUIFontRepository splashContinueButtonFont](AVTUIFontRepository, "splashContinueButtonFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  +[AVTUIColorRepository splashScreenButtonBackgroundColor](AVTUIColorRepository, "splashScreenButtonBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v7);

  objc_msgSend(v2, "_setContinuousCornerRadius:", 8.0);
  return (UIButton *)v2;
}

+ (UIButton)cancelButton
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTUIFontRepository splashContinueButtonFont](AVTUIFontRepository, "splashContinueButtonFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(v2, "setRole:", 2);
  return (UIButton *)v2;
}

+ (UIFont)titleFont
{
  return (UIFont *)+[AVTUIFontRepository splashTitleFont](AVTUIFontRepository, "splashTitleFont");
}

+ (UIFont)subTitleFont
{
  return (UIFont *)+[AVTUIFontRepository splashSubTitleFont](AVTUIFontRepository, "splashSubTitleFont");
}

+ (UIFont)buttonFont
{
  return (UIFont *)+[AVTUIFontRepository splashContinueButtonFont](AVTUIFontRepository, "splashContinueButtonFont");
}

+ (double)defaultLabelEdgePaddingForLabelEdgePaddingStyle:(unint64_t)a3 contentSizeCategory:(id)a4 numberOfLines:(int64_t)a5
{
  double result;
  _BOOL4 IsAccessibilityCategory;
  int v8;

  result = 24.0;
  if (a3 == 1)
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a4);
    v8 = a5 > 3 || IsAccessibilityCategory;
    result = 74.0;
    if (v8)
      return 44.0;
  }
  return result;
}

+ (CGRect)buttonFrameForString:(id)a3 containerSize:(CGSize)a4 edgeInsets:(UIEdgeInsets)a5
{
  double bottom;
  double height;
  double width;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  _QWORD v21[2];
  CGRect result;

  bottom = a5.bottom;
  height = a4.height;
  width = a4.width;
  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a4.width + -48.0;
  if (v9 <= 325.0)
    v10 = v9;
  else
    v10 = 325.0;
  v20 = *MEMORY[0x1E0CEA098];
  v11 = a3;
  objc_msgSend(a1, "buttonFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 0, v13, 0, v10 + -32.0, 1.79769313e308);
  v15 = v14;

  v16 = fmax(v15 + 28.0, 50.0);
  v17 = (width - v10) * 0.5;
  v18 = height - fmax(bottom + 44.0, 44.0) - v16;
  v19 = v10;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

+ (CGRect)titleFrameForString:(id)a3 yOrigin:(double)a4 containerSize:(CGSize)a5 labelEdgePadding:(double)a6
{
  CGFloat v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  _QWORD v26[2];
  CGRect result;

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a5.width - a6 * 2.0;
  v10 = a3;
  objc_msgSend(a1, "titleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lineHeight");
  v13 = ceil(v12);
  objc_msgSend(a1, "titleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leading");
  v16 = v15 + v13 * 2.0;
  v25 = *MEMORY[0x1E0CEA098];
  objc_msgSend(a1, "titleFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, v9, v16);
  v20 = v19;

  v21 = ceil(v20);
  v22 = a6;
  v23 = a4;
  v24 = v9;
  result.size.height = v21;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGRect)subTitleFrameForString:(id)a3 titleFrame:(CGRect)a4 buttonFrame:(CGRect)a5 wantsSecondaryVideo:(BOOL)a6 containerSize:(CGSize)a7 labelEdgePadding:(double)a8
{
  _BOOL4 v8;
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat x;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double MaxY;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double y;
  uint64_t v39;
  _QWORD v40[2];
  double v41;
  CGRect v42;
  CGRect result;

  v8 = a6;
  y = a5.origin.y;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  x = a4.origin.x;
  v40[1] = *MEMORY[0x1E0C80C00];
  v39 = *MEMORY[0x1E0CEA098];
  v14 = a3;
  objc_msgSend(a1, "subTitleFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v16, 0, a8 + v41 * -2.0, 1.79769313e308);
  v18 = v17;

  objc_msgSend(a1, "subTitleFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_scaledValueForValue:", 32.0);
  v21 = v20;

  v42.origin.x = x;
  v42.origin.y = v11;
  v42.size.width = width;
  v42.size.height = height;
  MaxY = CGRectGetMaxY(v42);
  objc_msgSend(a1, "titleFont");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "descender");
  v25 = MaxY + v24;
  objc_msgSend(a1, "subTitleFont");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ascender");
  v28 = v25 + v21 - v27;

  objc_msgSend((id)objc_opt_class(), "primaryVideoSize");
  v30 = y + -40.0 + v29 * -0.3 + -40.0 - v28;
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "secondaryVideoSize");
    v30 = v30 + v31 * -0.3;
  }
  v32 = ceil(v18);
  if (v30 >= 0.0)
    v33 = v30;
  else
    v33 = v18;
  if (v32 >= v33)
    v34 = v33;
  else
    v34 = v32;
  v35 = v41;
  v36 = v28;
  v37 = a8 + v41 * -2.0;
  result.size.height = v34;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

+ (CGRect)primaryVideoFrameForContentFrame:(CGRect)a3 wantsSecondaryVideo:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = CGRectGetHeight(a3);
  if (v4)
    v10 = v9 * 0.7;
  else
    v10 = v9;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v11 = CGRectGetWidth(v17);
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v13 = x + (CGRectGetWidth(v18) - v12) * 0.5;
  v14 = y + (v10 - v12) * 0.5;
  v15 = v12;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (CGRect)secondaryVideoFrameForContentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetHeight(a3);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = v7 + CGRectGetHeight(v14) * -0.7;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v9 = CGRectGetMaxY(v15) - v8;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v10 = CGRectGetWidth(v16);
  v11 = x;
  v12 = v9;
  v13 = v8;
  result.size.height = v13;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (AVTSplashScreenLayout)initWithContainerSize:(CGSize)a3 edgeInsets:(UIEdgeInsets)a4 wantsSecondaryVideo:(BOOL)a5 labelEdgePaddingStyle:(unint64_t)a6
{
  _BOOL8 v7;
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  void *v15;
  void *v16;
  AVTSplashScreenLayout *v17;

  v7 = a5;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredContentSizeCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AVTSplashScreenLayout initWithContainerSize:edgeInsets:wantsSecondaryVideo:labelEdgePaddingStyle:currentContentSizeCategory:](self, "initWithContainerSize:edgeInsets:wantsSecondaryVideo:labelEdgePaddingStyle:currentContentSizeCategory:", v7, a6, v16, width, height, top, left, bottom, right);

  return v17;
}

- (AVTSplashScreenLayout)initWithContainerSize:(CGSize)a3 edgeInsets:(UIEdgeInsets)a4 wantsSecondaryVideo:(BOOL)a5 labelEdgePaddingStyle:(unint64_t)a6 currentContentSizeCategory:(id)a7
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  id v16;
  AVTSplashScreenLayout *v17;
  AVTSplashScreenLayout *v18;
  uint64_t v19;
  NSString *currentContentSizeCategory;
  void *v21;
  objc_super v23;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AVTSplashScreenLayout;
  v17 = -[AVTSplashScreenLayout init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_containerSize.width = width;
    v17->_containerSize.height = height;
    v17->_labelEdgePaddingStyle = a6;
    v17->_edgeInsets.top = top;
    v17->_edgeInsets.left = left;
    v17->_edgeInsets.bottom = bottom;
    v17->_edgeInsets.right = right;
    v17->_wantsSecondaryVideo = a5;
    v19 = objc_msgSend(v16, "copy");
    currentContentSizeCategory = v18->_currentContentSizeCategory;
    v18->_currentContentSizeCategory = (NSString *)v19;

    v18->_needsLayout = 1;
    v18->_constrainToContainer = objc_msgSend((id)objc_opt_class(), "isSmallScreen") ^ 1;
    v18->_unconstrainedContentSize = (CGSize)*MEMORY[0x1E0C9D820];
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v18, sel_didChangeContentSizeCategory_, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AVTSplashScreenLayout;
  -[AVTSplashScreenLayout dealloc](&v4, sel_dealloc);
}

- (void)calculateLayoutWithTitleString:(id)a3 subTitleString:(id)a4 buttonTitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  unint64_t v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
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
  void *v73;
  _BOOL8 v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double MinY;
  double v86;
  void *v87;
  double v88;
  double v89;
  CGFloat v90;
  void *v91;
  double v92;
  CGFloat v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  _BOOL8 v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  double v119;
  _BOOL4 v120;
  int v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  _BOOL4 v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  CGFloat v158;
  CGFloat MaxY;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  CGFloat v169;
  double v170;
  double v171;
  double v172;
  double rect;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  uint64_t v179;
  _QWORD v180[2];
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;

  v180[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[AVTSplashScreenLayout labelEdgePaddingStyle](self, "labelEdgePaddingStyle") == 1)
  {
    -[AVTSplashScreenLayout containerSize](self, "containerSize");
    v12 = v11 + -148.0;
    v179 = *MEMORY[0x1E0CEA098];
    objc_msgSend((id)objc_opt_class(), "subTitleFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v180[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v180, &v179, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v14, 0, v12, 1.79769313e308);
    v16 = v15;

    objc_msgSend((id)objc_opt_class(), "subTitleFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lineHeight");
    v19 = vcvtmd_s64_f64(ceil(v16) / v18);

  }
  else
  {
    v19 = 0;
  }
  if (!-[AVTSplashScreenLayout needsLayout](self, "needsLayout"))
    goto LABEL_39;
  v20 = (void *)objc_opt_class();
  -[AVTSplashScreenLayout containerSize](self, "containerSize");
  v22 = v21;
  v24 = v23;
  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  objc_msgSend(v20, "buttonFrameForString:containerSize:edgeInsets:", v10, v22, v24, v25, v26, v27, v28);
  v170 = v30;
  v171 = v29;
  v176 = v31;
  v33 = v32;
  -[AVTSplashScreenLayout containerSize](self, "containerSize");
  v35 = v34;
  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  v37 = v36;
  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  v39 = v35 - (v37 + v38);
  objc_msgSend((id)objc_opt_class(), "primaryVideoSize");
  v41 = v40 + 80.0;
  if (v39 < v40 + 80.0)
    v41 = v39;
  v177 = v41;
  v169 = v33;
  if (self->_wantsSecondaryVideo)
  {
    objc_msgSend((id)objc_opt_class(), "secondaryVideoSize");
    v43 = v42;
    v45 = v44;
    -[AVTSplashScreenLayout containerSize](self, "containerSize");
    v47 = v46;
    -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
    v49 = v48;
    -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
    v51 = v47 - (v49 + v50 + 80.0);
    if (v43 < v51)
      v51 = v43;
    v177 = v177 + v45 * v51 / v43;
  }
  v52 = (void *)objc_opt_class();
  v53 = -[AVTSplashScreenLayout labelEdgePaddingStyle](self, "labelEdgePaddingStyle");
  -[AVTSplashScreenLayout currentContentSizeCategory](self, "currentContentSizeCategory");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "defaultLabelEdgePaddingForLabelEdgePaddingStyle:contentSizeCategory:numberOfLines:", v53, v54, v19);
  v56 = v55;

  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  v58 = v57 + 96.0;
  objc_msgSend((id)objc_opt_class(), "titleFont");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "ascender");
  v61 = v58 - v60;

  v62 = (void *)objc_opt_class();
  -[AVTSplashScreenLayout containerSize](self, "containerSize");
  objc_msgSend(v62, "titleFrameForString:yOrigin:containerSize:labelEdgePadding:", v8, v61, v63, v64, v56);
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v73 = (void *)objc_opt_class();
  v74 = -[AVTSplashScreenLayout wantsSecondaryVideo](self, "wantsSecondaryVideo");
  -[AVTSplashScreenLayout containerSize](self, "containerSize");
  v163 = v56;
  v165 = v72;
  v167 = v68;
  v168 = v66;
  v166 = v70;
  objc_msgSend(v73, "subTitleFrameForString:titleFrame:buttonFrame:wantsSecondaryVideo:containerSize:labelEdgePadding:", v9, v74, v66, v68, v70, v72, v171, v176, v170, v33, v75, v76, *(_QWORD *)&v56);
  v78 = v77;
  v80 = v79;
  v82 = v81;
  v84 = v83;
  v181.origin.x = v171;
  v181.origin.y = v176;
  v181.size.width = v170;
  v181.size.height = v33;
  MinY = CGRectGetMinY(v181);
  v182.origin.x = v78;
  v174 = v82;
  v175 = v80;
  v182.origin.y = v80;
  v182.size.width = v82;
  rect = v84;
  v182.size.height = v84;
  v86 = MinY - CGRectGetMaxY(v182);
  if (v86 < v177)
  {
    objc_msgSend((id)objc_opt_class(), "titleFont");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "_scaledValueForValue:", v86 - v177 + 96.0);
    v89 = v88;

    v90 = self->_edgeInsets.top + fmax(v89, 58.0);
    objc_msgSend((id)objc_opt_class(), "titleFont");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "ascender");
    v93 = v90 - v92;

    v94 = (void *)objc_opt_class();
    -[AVTSplashScreenLayout containerSize](self, "containerSize");
    objc_msgSend(v94, "titleFrameForString:yOrigin:containerSize:labelEdgePadding:", v8, v93, v95, v96, v163);
    v98 = v97;
    v100 = v99;
    v102 = v101;
    v103 = v33;
    v105 = v104;
    v106 = (void *)objc_opt_class();
    v107 = -[AVTSplashScreenLayout wantsSecondaryVideo](self, "wantsSecondaryVideo");
    -[AVTSplashScreenLayout containerSize](self, "containerSize");
    v167 = v100;
    v168 = v98;
    v165 = v105;
    v166 = v102;
    objc_msgSend(v106, "subTitleFrameForString:titleFrame:buttonFrame:wantsSecondaryVideo:containerSize:labelEdgePadding:", v9, v107, v98, v100, v102, v105, v171, v176, v170, v103, v108, v109, *(_QWORD *)&v163);
    v111 = v110;
    v113 = v112;
    v115 = v114;
    v117 = v116;
    v183.origin.x = v171;
    v183.origin.y = v176;
    v183.size.width = v170;
    v183.size.height = v103;
    v78 = v111;
    v118 = CGRectGetMinY(v183);
    v184.origin.x = v78;
    v174 = v115;
    v175 = v113;
    v184.origin.y = v113;
    v184.size.width = v115;
    rect = v117;
    v184.size.height = v117;
    v86 = v118 - CGRectGetMaxY(v184);
  }
  if (v86 >= v177)
  {
    v119 = v171;
    v121 = 0;
  }
  else
  {
    v119 = v171;
    v120 = -[AVTSplashScreenLayout constrainToContainer](self, "constrainToContainer");
    v121 = !v120;
    if (!v120)
      v86 = v177;
  }
  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  v123 = v122 + 40.0;
  v185.origin.x = v78;
  v185.size.width = v174;
  v185.origin.y = v175;
  v185.size.height = rect;
  v124 = CGRectGetMaxY(v185) + 40.0;
  -[AVTSplashScreenLayout containerSize](self, "containerSize");
  v126 = v125;
  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  v128 = v127;
  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  v130 = v126 - (v128 + v129 + 80.0);
  v131 = v86 + -80.0;
  objc_msgSend((id)objc_opt_class(), "primaryVideoFrameForContentFrame:wantsSecondaryVideo:", -[AVTSplashScreenLayout wantsSecondaryVideo](self, "wantsSecondaryVideo"), v123, v124, v130, v86 + -80.0);
  v133 = v132;
  v135 = v134;
  v178 = v136;
  v172 = v137;
  if (-[AVTSplashScreenLayout wantsSecondaryVideo](self, "wantsSecondaryVideo"))
  {
    objc_msgSend((id)objc_opt_class(), "secondaryVideoFrameForContentFrame:", v123, v124, v130, v131);
    v139 = v138;
    v141 = v140;
    v143 = v142;
    v145 = v144;
    if (!v121)
      goto LABEL_35;
LABEL_22:
    v146 = -[AVTSplashScreenLayout wantsSecondaryVideo](self, "wantsSecondaryVideo");
    if (v146)
      v147 = v145;
    else
      v147 = v172;
    if (v146)
      v148 = v143;
    else
      v148 = v178;
    if (v146)
      v149 = v141;
    else
      v149 = v135;
    if (v146)
      v150 = v139;
    else
      v150 = v133;
    v176 = CGRectGetMaxY(*(CGRect *)(&v147 - 3)) + 40.0;
    goto LABEL_35;
  }
  v139 = *MEMORY[0x1E0C9D648];
  v141 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v143 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v145 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (v121)
    goto LABEL_22;
LABEL_35:
  v161 = v145;
  v162 = v78;
  v164 = v135;
  if (-[AVTSplashScreenLayout constrainToContainer](self, "constrainToContainer"))
  {
    v152 = v169;
    v151 = v170;
    v153 = v176;
  }
  else
  {
    -[AVTSplashScreenLayout containerSize](self, "containerSize");
    v160 = v143;
    v154 = v141;
    v155 = v139;
    v156 = v133;
    v158 = v157;
    v186.origin.x = v119;
    v153 = v176;
    v186.origin.y = v176;
    v152 = v169;
    v151 = v170;
    v186.size.width = v170;
    v186.size.height = v169;
    MaxY = CGRectGetMaxY(v186);
    self->_unconstrainedContentSize.width = v158;
    self->_unconstrainedContentSize.height = MaxY + 44.0;
    v133 = v156;
    v139 = v155;
    v141 = v154;
    v143 = v160;
  }
  -[AVTSplashScreenLayout setTitleFrame:](self, "setTitleFrame:", v168, v167, v166, v165);
  -[AVTSplashScreenLayout setSubTitleFrame:](self, "setSubTitleFrame:", v162, v175, v174, rect);
  -[AVTSplashScreenLayout setPrimaryVideoFrame:](self, "setPrimaryVideoFrame:", v133, v164, v178, v172);
  -[AVTSplashScreenLayout setSecondaryVideoFrame:](self, "setSecondaryVideoFrame:", v139, v141, v143, v161);
  -[AVTSplashScreenLayout setButtonFrame:](self, "setButtonFrame:", v119, v153, v151, v152);
  -[AVTSplashScreenLayout setNeedsLayout:](self, "setNeedsLayout:", 0);
LABEL_39:

}

- (void)didChangeContentSizeCategory:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[AVTSplashScreenLayout setTitleFrame:](self, "setTitleFrame:", a3, *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[AVTSplashScreenLayout setSubTitleFrame:](self, "setSubTitleFrame:", v4, v5, v6, v7);
  -[AVTSplashScreenLayout setPrimaryVideoFrame:](self, "setPrimaryVideoFrame:", v4, v5, v6, v7);
  -[AVTSplashScreenLayout setSecondaryVideoFrame:](self, "setSecondaryVideoFrame:", v4, v5, v6, v7);
  -[AVTSplashScreenLayout setButtonFrame:](self, "setButtonFrame:", v4, v5, v6, v7);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[AVTSplashScreenLayout setCurrentContentSizeCategory:](self, "setCurrentContentSizeCategory:", v10);

  -[AVTSplashScreenLayout setNeedsLayout:](self, "setNeedsLayout:", 1);
  -[AVTSplashScreenLayout delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "splashScreenLayoutDidChange:", self);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  -[AVTSplashScreenLayout containerSize](self, "containerSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "containerSize");
  if (v7 != v11 || v9 != v10)
    goto LABEL_6;
  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v5, "edgeInsets");
  v13 = 0;
  if (v18 != v26 || v16 != v23 || v22 != v25 || v20 != v24)
    goto LABEL_7;
  v27 = -[AVTSplashScreenLayout wantsSecondaryVideo](self, "wantsSecondaryVideo");
  if (v27 == objc_msgSend(v5, "wantsSecondaryVideo"))
  {
    -[AVTSplashScreenLayout currentContentSizeCategory](self, "currentContentSizeCategory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentContentSizeCategory");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v28, "isEqualToString:", v29);

  }
  else
  {
LABEL_6:
    v13 = 0;
  }
LABEL_7:

LABEL_9:
  return v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  v3 = (void *)MEMORY[0x1E0CB3B18];
  -[AVTSplashScreenLayout containerSize](self, "containerSize");
  objc_msgSend(v3, "valueWithCGSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[AVTSplashScreenLayout containerSize](self, "containerSize");
  objc_msgSend(v6, "valueWithCGSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v9 + 1) = v5;
  *(_QWORD *)&v9 = objc_msgSend(v7, "hash");
  v8 = v9 >> 48;
  v10 = (void *)MEMORY[0x1E0CB3B18];
  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  objc_msgSend(v10, "valueWithUIEdgeInsets:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = (void *)MEMORY[0x1E0CB3B18];
  -[AVTSplashScreenLayout edgeInsets](self, "edgeInsets");
  objc_msgSend(v13, "valueWithUIEdgeInsets:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v9 + 1) = v12;
  *(_QWORD *)&v9 = objc_msgSend(v14, "hash");
  v15 = (v9 >> 43) ^ v8;
  if (-[AVTSplashScreenLayout wantsSecondaryVideo](self, "wantsSecondaryVideo"))
    v16 = 0x100000000;
  else
    v16 = 0;
  -[AVTSplashScreenLayout wantsSecondaryVideo](self, "wantsSecondaryVideo");
  -[AVTSplashScreenLayout currentContentSizeCategory](self, "currentContentSizeCategory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15 ^ v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (AVTSplashScreenLayoutDelegate)delegate
{
  return (AVTSplashScreenLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unint64_t)labelEdgePaddingStyle
{
  return self->_labelEdgePaddingStyle;
}

- (CGRect)titleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_titleFrame.origin.x;
  y = self->_titleFrame.origin.y;
  width = self->_titleFrame.size.width;
  height = self->_titleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTitleFrame:(CGRect)a3
{
  self->_titleFrame = a3;
}

- (CGRect)subTitleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_subTitleFrame.origin.x;
  y = self->_subTitleFrame.origin.y;
  width = self->_subTitleFrame.size.width;
  height = self->_subTitleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSubTitleFrame:(CGRect)a3
{
  self->_subTitleFrame = a3;
}

- (CGRect)primaryVideoFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_primaryVideoFrame.origin.x;
  y = self->_primaryVideoFrame.origin.y;
  width = self->_primaryVideoFrame.size.width;
  height = self->_primaryVideoFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPrimaryVideoFrame:(CGRect)a3
{
  self->_primaryVideoFrame = a3;
}

- (CGRect)secondaryVideoFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_secondaryVideoFrame.origin.x;
  y = self->_secondaryVideoFrame.origin.y;
  width = self->_secondaryVideoFrame.size.width;
  height = self->_secondaryVideoFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSecondaryVideoFrame:(CGRect)a3
{
  self->_secondaryVideoFrame = a3;
}

- (CGRect)buttonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_buttonFrame.origin.x;
  y = self->_buttonFrame.origin.y;
  width = self->_buttonFrame.size.width;
  height = self->_buttonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setButtonFrame:(CGRect)a3
{
  self->_buttonFrame = a3;
}

- (CGSize)unconstrainedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_unconstrainedContentSize.width;
  height = self->_unconstrainedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)wantsSecondaryVideo
{
  return self->_wantsSecondaryVideo;
}

- (void)setWantsSecondaryVideo:(BOOL)a3
{
  self->_wantsSecondaryVideo = a3;
}

- (BOOL)constrainToContainer
{
  return self->_constrainToContainer;
}

- (void)setConstrainToContainer:(BOOL)a3
{
  self->_constrainToContainer = a3;
}

- (NSString)currentContentSizeCategory
{
  return self->_currentContentSizeCategory;
}

- (void)setCurrentContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (void)setNeedsLayout:(BOOL)a3
{
  self->_needsLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContentSizeCategory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
