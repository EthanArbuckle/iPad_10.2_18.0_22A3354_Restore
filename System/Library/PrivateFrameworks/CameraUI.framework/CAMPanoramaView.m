@implementation CAMPanoramaView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMPanoramaView)initWithPanoramaPreviewView:(id)a3 layoutStyle:(int64_t)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CAMPanoramaView *v12;
  CAMPanoramaView *v13;
  CGSize *p_panoramaCaptureSize;
  objc_class *v15;
  CGFloat v16;
  CGSize v17;
  uint64_t v18;
  UIView *stripBackgroundView;
  UIView *v20;
  void *v21;
  uint64_t v22;
  UIView *stripContainerView;
  uint64_t v24;
  UIView *maskingView;
  CAMPanoramaLevelView *v26;
  CAMPanoramaLevelView *levelView;
  CAMPanoramaArrowView *v28;
  CAMPanoramaArrowView *arrowView;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *instructionString;
  uint64_t v36;
  NSString *speedString;
  uint64_t v38;
  NSString *moveUpString;
  uint64_t v40;
  NSString *moveDownString;
  uint64_t v42;
  NSString *arrowString;
  CAMPanoramaLabel *v44;
  CAMPanoramaLabel *instructionLabel;
  CAMPanoramaView *v46;
  objc_super v48;

  v7 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CAMPanoramaView;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[CAMPanoramaView initWithFrame:](&v48, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    v12->_layoutStyle = a4;
    p_panoramaCaptureSize = &v12->_panoramaCaptureSize;
    +[CAMPanoramaUtilities bufferSize](CAMPanoramaUtilities, "bufferSize");
    *(_QWORD *)&p_panoramaCaptureSize->width = v15;
    v13->_panoramaCaptureSize.height = v16;
    v13->_direction = 1;
    v17 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v13->__lastLayoutBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v13->__lastLayoutBounds.size = v17;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    stripBackgroundView = v13->__stripBackgroundView;
    v13->__stripBackgroundView = (UIView *)v18;

    v20 = v13->__stripBackgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.300000012);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    -[CAMPanoramaView addSubview:](v13, "addSubview:", v13->__stripBackgroundView);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    stripContainerView = v13->__stripContainerView;
    v13->__stripContainerView = (UIView *)v22;

    -[UIView addSubview:](v13->__stripBackgroundView, "addSubview:", v13->__stripContainerView);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    maskingView = v13->__maskingView;
    v13->__maskingView = (UIView *)v24;

    -[UIView addSubview:](v13->__stripContainerView, "addSubview:", v13->__maskingView);
    objc_storeStrong((id *)&v13->_previewView, a3);
    -[UIView addSubview:](v13->__maskingView, "addSubview:", v7);
    v26 = -[CAMPanoramaLevelView initWithFrame:]([CAMPanoramaLevelView alloc], "initWithFrame:", v8, v9, v10, v11);
    levelView = v13->__levelView;
    v13->__levelView = v26;

    v28 = -[CAMPanoramaArrowView initWithFrame:]([CAMPanoramaArrowView alloc], "initWithFrame:", v8, v9, v10, v11);
    arrowView = v13->__arrowView;
    v13->__arrowView = v28;

    -[CAMPanoramaArrowView layer](v13->__arrowView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setZPosition:", 100.0);
    -[UIView insertSubview:belowSubview:](v13->__stripBackgroundView, "insertSubview:belowSubview:", v13->__levelView, v13->__stripContainerView);
    -[UIView addSubview:](v13->__stripBackgroundView, "addSubview:", v13->__arrowView);
    v13->__previousSpeeds = (double *)malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "model");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PANO_INSTRUCTIONAL_TEXT_%@"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    CAMLocalizedFrameworkString(v33, &stru_1EA3325A0);
    v34 = objc_claimAutoreleasedReturnValue();
    instructionString = v13->__instructionString;
    v13->__instructionString = (NSString *)v34;

    CAMLocalizedFrameworkString(CFSTR("PANO_SPEED_TEXT"), &stru_1EA3325A0);
    v36 = objc_claimAutoreleasedReturnValue();
    speedString = v13->__speedString;
    v13->__speedString = (NSString *)v36;

    CAMLocalizedFrameworkString(CFSTR("PANO_MOVE_UP_TEXT"), &stru_1EA3325A0);
    v38 = objc_claimAutoreleasedReturnValue();
    moveUpString = v13->__moveUpString;
    v13->__moveUpString = (NSString *)v38;

    CAMLocalizedFrameworkString(CFSTR("PANO_MOVE_DOWN_TEXT"), &stru_1EA3325A0);
    v40 = objc_claimAutoreleasedReturnValue();
    moveDownString = v13->__moveDownString;
    v13->__moveDownString = (NSString *)v40;

    CAMLocalizedFrameworkString(CFSTR("PANO_ARROW_TEXT"), &stru_1EA3325A0);
    v42 = objc_claimAutoreleasedReturnValue();
    arrowString = v13->__arrowString;
    v13->__arrowString = (NSString *)v42;

    v44 = -[CAMInstructionLabel initWithFrame:]([CAMPanoramaLabel alloc], "initWithFrame:", v8, v9, v10, v11);
    instructionLabel = v13->__instructionLabel;
    v13->__instructionLabel = v44;

    -[CAMInstructionLabel setText:](v13->__instructionLabel, "setText:", v13->__instructionString);
    -[CAMPanoramaView addSubview:](v13, "addSubview:", v13->__instructionLabel);
    v46 = v13;

  }
  return v13;
}

- (CAMPanoramaView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (CAMPanoramaView)initWithCoder:(id)a3
{

  return 0;
}

- (void)dealloc
{
  double *previousSpeeds;
  objc_super v4;

  previousSpeeds = self->__previousSpeeds;
  if (previousSpeeds)
  {
    free(previousSpeeds);
    self->__previousSpeeds = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMPanoramaView;
  -[CAMPanoramaView dealloc](&v4, sel_dealloc);
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMPanoramaView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIView)instructionView
{
  return (UIView *)self->__instructionLabel;
}

- (CGSize)_previewSizeForBounds:(CGRect)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  +[CAMPanoramaUtilities panoramaViewPreviewStripInsetsForLayoutStyle:](CAMPanoramaUtilities, "panoramaViewPreviewStripInsetsForLayoutStyle:", -[CAMPanoramaView layoutStyle](self, "layoutStyle", a3.origin.x, a3.origin.y));
  v7 = width - v5 - v6;
  v10 = height - v8 - v9;
  v11 = v7;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int64_t v46;
  void *v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  void *v59;
  CGFloat x;
  CGFloat y;
  CGFloat v62;
  CGFloat height;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  id v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  _BOOL4 v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  CGFloat v117;
  uint64_t v118;
  double v119;
  double Width;
  CGFloat rect2;
  CGFloat rect2a;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  _QWORD v135[4];
  id v136;
  double v137;
  uint64_t v138;
  double v139;
  double v140;
  _QWORD v141[4];
  id v142;
  double v143;
  uint64_t v144;
  double v145;
  CGFloat v146;
  objc_super v147;
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

  v147.receiver = self;
  v147.super_class = (Class)CAMPanoramaView;
  -[CAMPanoramaView layoutSubviews](&v147, sel_layoutSubviews);
  -[CAMPanoramaView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMPanoramaView _previewSizeForBounds:](self, "_previewSizeForBounds:");
  v119 = v11;
  v13 = v12;
  +[CAMPanoramaUtilities singlePreviewFrameWidthForPreviewHeight:](CAMPanoramaUtilities, "singlePreviewFrameWidthForPreviewHeight:", v12);
  v123 = v14;
  -[CAMPanoramaView _lastLayoutBounds](self, "_lastLayoutBounds");
  v16 = v15;
  rect2 = v17;
  v19 = v18;
  v21 = v20;
  v148.origin.x = v4;
  v148.origin.y = v6;
  v148.size.width = v8;
  v148.size.height = v10;
  v129 = v13;
  v22 = v13 + 4.0;
  v118 = 0;
  Width = CGRectGetWidth(v148);
  UIRectCenteredIntegralRectScale();
  v133 = v24;
  v134 = v23;
  v131 = v26;
  v132 = v25;
  v125 = v6;
  v126 = v4;
  v149.origin.x = v4;
  v149.origin.y = v6;
  v127 = v10;
  v128 = v8;
  v149.size.width = v8;
  v149.size.height = v10;
  v157.origin.x = v16;
  v157.origin.y = rect2;
  v157.size.width = v19;
  v157.size.height = v21;
  if (!CGRectEqualToRect(v149, v157))
  {
    -[CAMPanoramaView _stripBackgroundView](self, "_stripBackgroundView", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    UIRectGetCenter();
    v28 = v22;
    v30 = v29;
    v32 = v31;
    objc_msgSend(v27, "setBounds:", 0.0, 0.0, Width, v28);
    objc_msgSend(v27, "setCenter:", v30, v32);
    -[CAMPanoramaView _stripContainerView](self, "_stripContainerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    UIRectCenteredIntegralRectScale();
    UIRectGetCenter();
    v35 = v34;
    v37 = v36;
    objc_msgSend(v33, "setBounds:", 0.0, 0.0, v119, v129, 0);
    objc_msgSend(v33, "setCenter:", v35, v37);
    -[CAMPanoramaView _levelView](self, "_levelView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "intrinsicContentSize");
    v40 = v39;
    v150.origin.x = 0.0;
    v150.origin.y = 0.0;
    v150.size.width = Width;
    v150.size.height = v28;
    v41 = CGRectGetWidth(v150);
    UIRectCenteredIntegralRectScale();
    UIRectGetCenter();
    v43 = v42;
    v45 = v44;
    objc_msgSend(v38, "setBounds:", 0.0, 0.0, v41, v40, 0);
    objc_msgSend(v38, "setCenter:", v43, v45);

  }
  v46 = -[CAMPanoramaView direction](self, "direction", v118);
  -[CAMPanoramaView _currentPaintingStatus](self, "_currentPaintingStatus");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "cropRectangle");
  rect2a = v48;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  +[CAMPanoramaUtilities bufferSize](CAMPanoramaUtilities, "bufferSize");
  v56 = v55;
  -[CAMPanoramaView panoramaCaptureSize](self, "panoramaCaptureSize");
  v58 = v52 * (v56 / v57);
  -[CAMPanoramaView _stripContainerView](self, "_stripContainerView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "bounds");
  x = v151.origin.x;
  y = v151.origin.y;
  v62 = v151.size.width;
  height = v151.size.height;
  v64 = CGRectGetWidth(v151);
  v152.origin.x = x;
  v152.origin.y = y;
  v152.size.width = v62;
  v152.size.height = height;
  v65 = CGRectGetHeight(v152);
  v153.origin.x = rect2a;
  v153.origin.y = v50;
  v153.size.width = v58;
  v153.size.height = v54;
  v66 = CGRectGetWidth(v153);
  if (v123 >= v66)
    v67 = v123;
  else
    v67 = v66;
  v68 = v64 - v123;
  if (v64 - v123 >= v64 - v67)
    v68 = v64 - v67;
  if (v46 == 2)
    v69 = v68;
  else
    v69 = 0.0;
  -[CAMPanoramaView _maskingView](self, "_maskingView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)MEMORY[0x1E0DC3F10];
  v72 = MEMORY[0x1E0C809B0];
  v141[0] = MEMORY[0x1E0C809B0];
  v141[1] = 3221225472;
  v141[2] = __33__CAMPanoramaView_layoutSubviews__block_invoke;
  v141[3] = &unk_1EA328D90;
  v73 = v70;
  v142 = v73;
  v143 = v69;
  v144 = 0;
  v145 = v67;
  v146 = v65;
  objc_msgSend(v71, "performWithoutAnimation:", v141);
  v74 = v65;
  v75 = 0.0;
  objc_msgSend(v59, "convertRect:toView:", v73, v69, 0.0, v67, v74);
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = v82;
  +[CAMPanoramaUtilities bufferSize](CAMPanoramaUtilities, "bufferSize");
  v86 = v129 * (v84 / v85);
  if (v46 == 2)
  {
    v154.origin.x = v77;
    v154.origin.y = v79;
    v154.size.width = v81;
    v154.size.height = v83;
    v75 = CGRectGetWidth(v154) - v86;
  }
  -[CAMPanoramaView previewView](self, "previewView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)MEMORY[0x1E0DC3F10];
  v135[0] = v72;
  v135[1] = 3221225472;
  v135[2] = __33__CAMPanoramaView_layoutSubviews__block_invoke_2;
  v135[3] = &unk_1EA328D90;
  v136 = v87;
  v137 = v75;
  v138 = 0;
  v139 = v86;
  v140 = v129;
  v89 = v87;
  objc_msgSend(v88, "performWithoutAnimation:", v135);
  objc_msgSend(v73, "size");
  -[CAMPanoramaView _frameForArrowViewWithDirection:offset:](self, "_frameForArrowViewWithDirection:offset:", v46);
  v91 = v90;
  v93 = v92;
  v95 = v94;
  v97 = v96;
  UIRectGetCenter();
  v99 = v98;
  if (-[CAMPanoramaView isPainting](self, "isPainting"))
  {
    -[CAMPanoramaView _currentAverageSpeed](self, "_currentAverageSpeed");
    if (v100 < 1.0)
    {
      -[CAMPanoramaView _initialArrowCenter](self, "_initialArrowCenter");
      v102 = v99 - v101;
      v103 = vabdd_f64(v99, v101);
      -[CAMPanoramaView _stripBackgroundView](self, "_stripBackgroundView");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "frame");
      -[CAMPanoramaView convertRect:toView:](self, "convertRect:toView:", v104);
      v105 = CGRectGetHeight(v155);
      v106 = -[CAMPanoramaView _isCurrentlyShowingMoveInstructions](self, "_isCurrentlyShowingMoveInstructions");
      if (v103 <= v105 * 0.25)
      {
        if (v103 <= v105 * 0.125)
        {
          if (v106)
          {
            -[CAMPanoramaView _cancelDelayedMoveInstructions](self, "_cancelDelayedMoveInstructions");
            -[CAMPanoramaView _hideInstructionLabel](self, "_hideInstructionLabel");
          }
        }
        else if (v102 <= 0.0)
        {
          -[CAMPanoramaView _showMoveDownInstructionsAfterDelay](self, "_showMoveDownInstructionsAfterDelay");
        }
        else
        {
          -[CAMPanoramaView _showMoveUpInstructionsAfterDelay](self, "_showMoveUpInstructionsAfterDelay");
        }
      }
      else if (v102 <= 0.0)
      {
        -[CAMPanoramaView _showMoveDownInstructions](self, "_showMoveDownInstructions");
      }
      else
      {
        -[CAMPanoramaView _showMoveUpInstructions](self, "_showMoveUpInstructions");
      }

    }
  }
  -[CAMPanoramaView _arrowView](self, "_arrowView");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewSetBoundsAndCenterForFrame(v107, v91, v93, v95, v97);

  -[CAMPanoramaView _instructionLabel](self, "_instructionLabel");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "sizeThatFits:", v128, v127);
  v130 = v109;
  v111 = v110;
  v112 = *MEMORY[0x1E0C9D538];
  v113 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  UIRectCenteredIntegralRectScale();
  v115 = v114;
  UIRectGetCenter();
  v124 = v116;
  v156.origin.y = v133;
  v156.origin.x = v134;
  v156.size.height = v131;
  v156.size.width = v132;
  v117 = CGRectGetMaxY(v156) + v115 * 0.5 + 10.0;
  objc_msgSend(v108, "setBounds:", v112, v113, v130, v111, 0);
  objc_msgSend(v108, "setCenter:", v124, v117);
  -[CAMPanoramaView _setLastLayoutBounds:](self, "_setLastLayoutBounds:", v126, v125, v128, v127);

}

uint64_t __33__CAMPanoramaView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __33__CAMPanoramaView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGRect)_frameForArrowViewWithDirection:(int64_t)a3 offset:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
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
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  -[CAMPanoramaView _stripBackgroundView](self, "_stripBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaView _arrowView](self, "_arrowView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  objc_msgSend(v6, "bounds");
  UIRectCenteredIntegralRectScale();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  UIRectGetCenter();
  if (a3 == 1 || a3 == 2)
  {
    objc_msgSend(v6, "bounds", 0);
    CGRectGetWidth(v28);
  }
  UIRoundToViewScale();
  -[CAMPanoramaView bounds](self, "bounds");
  -[CAMPanoramaView _previewSizeForBounds:](self, "_previewSizeForBounds:");
  -[CAMPanoramaView _filteredNormalizedBaselineOffset](self, "_filteredNormalizedBaselineOffset");
  CEKClamp();
  v29.origin.x = v9;
  v29.origin.y = v11;
  v29.size.width = v13;
  v29.size.height = v15;
  CGRectGetMidY(v29);
  UIRectCenteredAboutPointScale();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  void *v6;
  __int128 v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CAMPanoramaView;
  v5 = *(_OWORD *)&a3->c;
  v19 = *(_OWORD *)&a3->a;
  v20 = v5;
  v21 = *(_OWORD *)&a3->tx;
  -[CAMPanoramaView setTransform:](&v22, sel_setTransform_, &v19);
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  CGAffineTransformMakeRotation(&v18, 3.14159265);
  UIIntegralTransform();
  -[CAMPanoramaView _instructionLabel](self, "_instructionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = 3221225472;
  v7 = *(_OWORD *)&a3->c;
  v12 = *(_OWORD *)&a3->a;
  v13 = v7;
  v14 = *(_OWORD *)&a3->tx;
  v15 = v19;
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __32__CAMPanoramaView_setTransform___block_invoke;
  v10[3] = &unk_1EA32DD08;
  v16 = v20;
  v17 = v21;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performWithoutAnimation:", v10);

}

uint64_t __32__CAMPanoramaView_setTransform___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  _BOOL4 v4;
  void *v5;
  _OWORD *v6;
  __int128 v7;
  CGAffineTransform v9;
  CGAffineTransform t1;

  v2 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&t1.c = v2;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 72);
  v3 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)&v9.a = *(_OWORD *)(a1 + 88);
  *(_OWORD *)&v9.c = v3;
  *(_OWORD *)&v9.tx = *(_OWORD *)(a1 + 120);
  v4 = CGAffineTransformEqualToTransform(&t1, &v9);
  v5 = *(void **)(a1 + 32);
  if (v4)
    v6 = (_OWORD *)(a1 + 88);
  else
    v6 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  v7 = v6[1];
  *(_OWORD *)&t1.a = *v6;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tx = v6[2];
  return objc_msgSend(v5, "setTransform:", &t1);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    -[CAMPanoramaView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setPanoramaCaptureSize:(CGSize)a3
{
  if (self->_panoramaCaptureSize.width != a3.width || self->_panoramaCaptureSize.height != a3.height)
  {
    self->_panoramaCaptureSize = a3;
    -[CAMPanoramaView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)startPainting
{
  id v3;

  -[CAMPanoramaView _resetPaintingUIAnimated:](self, "_resetPaintingUIAnimated:", 0);
  -[CAMPanoramaView layoutIfNeeded](self, "layoutIfNeeded");
  -[CAMPanoramaView _setPainting:](self, "_setPainting:", 1);
  -[CAMPanoramaView _setArrowUpdateFrame:](self, "_setArrowUpdateFrame:", 0);
  -[CAMPanoramaView _arrowView](self, "_arrowView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  -[CAMPanoramaView _setInitialArrowCenter:](self, "_setInitialArrowCenter:");
  -[CAMPanoramaView _showArrowInstructions](self, "_showArrowInstructions");
  -[CAMPanoramaView _hideArrowInstructionsAfterDelay](self, "_hideArrowInstructionsAfterDelay");
  -[CAMPanoramaView _setCurrentlyShowingMoveInstructions:](self, "_setCurrentlyShowingMoveInstructions:", 0);
  -[CAMPanoramaView _setCurrentlyMovingTooFast:](self, "_setCurrentlyMovingTooFast:", 0);
  -[CAMPanoramaView setNeedsLayout](self, "setNeedsLayout");

}

- (void)updatePaintingWithStatus:(id)a3
{
  double v4;
  uint64_t v5;
  double *previousSpeeds;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "speed");
  v5 = 0;
  previousSpeeds = self->__previousSpeeds;
  v7 = 0.0;
  do
  {
    v8 = previousSpeeds[v5 + 1];
    previousSpeeds[v5] = v8;
    v7 = v7 + v8;
    ++v5;
  }
  while (v5 != 3);
  previousSpeeds[3] = v4;
  v9 = (v4 + v7) * 0.25;
  -[CAMPanoramaView _currentAverageSpeed](self, "_currentAverageSpeed");
  if (v9 >= 1.0 && v10 < 1.0)
  {
    -[CAMPanoramaView _setCurrentlyMovingTooFast:](self, "_setCurrentlyMovingTooFast:", 1);
    -[CAMPanoramaView _showSpeedInstructions](self, "_showSpeedInstructions");
  }
  else if (v9 < 1.0 && v10 >= 1.0)
  {
    -[CAMPanoramaView _setCurrentlyMovingTooFast:](self, "_setCurrentlyMovingTooFast:", 0);
    -[CAMPanoramaView _hideSpeedInstructionsAfterDelay](self, "_hideSpeedInstructionsAfterDelay");
  }
  v13 = -[CAMPanoramaView _arrowUpdateFrame](self, "_arrowUpdateFrame");
  if (v13 == 5)
  {
    -[CAMPanoramaView _setArrowUpdateFrame:](self, "_setArrowUpdateFrame:", 0);
    -[CAMPanoramaView _arrowView](self, "_arrowView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "animateWithNormalizedSpeed:duration:", v9, 0.166666667);

  }
  else
  {
    -[CAMPanoramaView _setArrowUpdateFrame:](self, "_setArrowUpdateFrame:", v13 + 1);
  }
  -[CAMPanoramaView _setCurrentAverageSpeed:](self, "_setCurrentAverageSpeed:", v9);
  -[CAMPanoramaView _setCurrentPaintingStatus:](self, "_setCurrentPaintingStatus:", v18);
  objc_msgSend(v18, "normalizedBaselineOffset");
  v16 = v15;
  -[CAMPanoramaView _filteredNormalizedBaselineOffset](self, "_filteredNormalizedBaselineOffset");
  -[CAMPanoramaView _setFilteredNormalizedBaselineOffset:](self, "_setFilteredNormalizedBaselineOffset:", v17 * 0.8 + v16 * 0.2);
  -[CAMPanoramaView setNeedsLayout](self, "setNeedsLayout");

}

- (void)stopPainting
{
  -[CAMPanoramaView _setPainting:](self, "_setPainting:", 0);
}

- (void)setDirection:(int64_t)a3
{
  -[CAMPanoramaView setDirection:animated:](self, "setDirection:animated:", a3, 0);
}

- (void)setDirection:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  _QWORD v31[6];
  _QWORD v32[5];
  id v33;
  int64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  if (self->_direction != a3)
  {
    v4 = a4;
    self->_direction = a3;
    if (a3 == 2)
      v7 = 3.14159265;
    else
      v7 = 0.0;
    -[CAMPanoramaView _arrowView](self, "_arrowView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (a3 == 2)
        v10 = 10.0;
      else
        v10 = -10.0;
      -[CAMPanoramaView _stripContainerView](self, "_stripContainerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0DC3F10];
      v13 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke;
      v36[3] = &unk_1EA328868;
      v37 = v11;
      v32[0] = v13;
      v32[1] = 3221225472;
      v32[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke_2;
      v32[3] = &unk_1EA32E080;
      v34 = a3;
      v35 = 6;
      v32[4] = self;
      v33 = v37;
      v30 = v37;
      objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 6, v36, v32, 0.3, 0.0);
      v31[0] = v13;
      v31[1] = 3221225472;
      v31[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke_5;
      v31[3] = &unk_1EA328B18;
      v31[4] = self;
      v31[5] = a3;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v31, 0, 0.4, 0.0);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setKeyTimes:", &unk_1EA3B3950);
      objc_msgSend(v14, "setValues:", &unk_1EA3B3968);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.translation.x"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setKeyTimes:", &unk_1EA3B3980);
      v39[0] = &unk_1EA3B1AD0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v16;
      v39[2] = &unk_1EA3B1AD0;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValues:", v17);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentationLayer");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (void *)v19;
      else
        v21 = v9;
      v22 = v21;

      objc_msgSend(v22, "valueForKeyPath:", CFSTR("transform.rotation.y"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFromValue:", v23);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setToValue:", v24);

      objc_msgSend(v18, "setDuration:", 0.4);
      v25 = *MEMORY[0x1E0CD2B58];
      objc_msgSend(v18, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v18;
      v38[1] = v14;
      v38[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAnimations:", v27);

      objc_msgSend(v26, "setDuration:", 0.4);
      objc_msgSend(v9, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      objc_msgSend(v26, "setBeginTime:", v28 + 0.2);
      objc_msgSend(v26, "setFillMode:", v25);
      objc_msgSend(v9, "addAnimation:forKey:", v26, CFSTR("panoramaDirectionChange"));

    }
    else
    {
      -[CAMPanoramaView setNeedsLayout](self, "setNeedsLayout");
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKeyPath:", v29, CFSTR("transform.rotation.y"));

  }
}

uint64_t __41__CAMPanoramaView_setDirection_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __41__CAMPanoramaView_setDirection_animated___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke_3;
  v10[3] = &unk_1EA328868;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "panoramaViewDidRequestSynchronizedDirectionChange:toDirection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v7 = *(_QWORD *)(a1 + 56);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke_4;
    v8[3] = &unk_1EA328868;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", v7, v8, 0, 0.3, 0.0);

  }
}

uint64_t __41__CAMPanoramaView_setDirection_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __41__CAMPanoramaView_setDirection_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __41__CAMPanoramaView_setDirection_animated___block_invoke_5(uint64_t a1)
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
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_stripContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  +[CAMPanoramaUtilities singlePreviewFrameWidthForPreviewHeight:](CAMPanoramaUtilities, "singlePreviewFrameWidthForPreviewHeight:", v3);
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "_frameForArrowViewWithDirection:offset:", *(_QWORD *)(a1 + 40), v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "_arrowView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  CAMViewSetBoundsAndCenterForFrame(v14, v7, v9, v11, v13);

}

- (void)startProcessingPanorama
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  -[CAMPanoramaView _instructionLabel](self, "_instructionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaView _arrowView](self, "_arrowView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaView _levelView](self, "_levelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__CAMPanoramaView_startProcessingPanorama__block_invoke;
  v10[3] = &unk_1EA329360;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  v7 = v5;
  v8 = v4;
  v9 = v3;
  objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 2, v10, 0, 0.1, 0.0);

}

uint64_t __42__CAMPanoramaView_startProcessingPanorama__block_invoke(id *a1)
{
  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[5], "setAlpha:", 0.0);
  return objc_msgSend(a1[6], "setAlpha:", 0.0);
}

- (void)finishedProcessingPanorama
{
  if (!-[CAMPanoramaView isPainting](self, "isPainting"))
    -[CAMPanoramaView _resetPaintingUIAnimated:](self, "_resetPaintingUIAnimated:", 1);
}

- (void)_resetPaintingUIAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;

  v3 = a3;
  -[CAMPanoramaView _updateInstructionLabelForInstruction:](self, "_updateInstructionLabelForInstruction:", 1);
  -[CAMPanoramaView _setCurrentlyShowingMoveInstructions:](self, "_setCurrentlyShowingMoveInstructions:", 0);
  -[CAMPanoramaView _setCurrentlyMovingTooFast:](self, "_setCurrentlyMovingTooFast:", 0);
  -[CAMPanoramaView _setCurrentAverageSpeed:](self, "_setCurrentAverageSpeed:", 0.0);
  -[CAMPanoramaView _setArrowUpdateFrame:](self, "_setArrowUpdateFrame:", 0);
  -[CAMPanoramaView _instructionLabel](self, "_instructionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaView _arrowView](self, "_arrowView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaView _levelView](self, "_levelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CAMPanoramaView__resetPaintingUIAnimated___block_invoke;
  aBlock[3] = &unk_1EA329360;
  v8 = v5;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v9, "reset");
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v11, 0, 0.1, 0.0);
  else
    v11[2](v11);
  -[CAMPanoramaView _setCurrentPaintingStatus:](self, "_setCurrentPaintingStatus:", 0);
  -[CAMPanoramaView _setFilteredNormalizedBaselineOffset:](self, "_setFilteredNormalizedBaselineOffset:", 0.0);
  -[CAMPanoramaView setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __44__CAMPanoramaView__resetPaintingUIAnimated___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "setAlpha:", 1.0);
  objc_msgSend(a1[5], "setAlpha:", 1.0);
  return objc_msgSend(a1[6], "setAlpha:", 1.0);
}

- (void)_hideInstructionLabel
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  if (!-[CAMPanoramaView _isCurrentlyMovingTooFast](self, "_isCurrentlyMovingTooFast"))
  {
    -[CAMPanoramaView _instructionLabel](self, "_instructionLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__CAMPanoramaView__hideInstructionLabel__block_invoke;
    v6[3] = &unk_1EA328868;
    v7 = v3;
    v5 = v3;
    objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.5, 0.0);

  }
}

uint64_t __40__CAMPanoramaView__hideInstructionLabel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)_updateInstructionLabelForInstruction:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  __CFString *v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  -[CAMPanoramaView _instructionLabel](self, "_instructionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1:
      -[CAMPanoramaView _instructionString](self, "_instructionString");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[CAMPanoramaView _arrowString](self, "_arrowString");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[CAMPanoramaView _speedString](self, "_speedString");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      -[CAMPanoramaView _moveUpString](self, "_moveUpString");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5:
      -[CAMPanoramaView _moveDownString](self, "_moveDownString");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v7 = (__CFString *)v6;
      break;
    default:
      v7 = &stru_1EA3325A0;
      break;
  }
  objc_msgSend(v5, "setText:", v7);
  objc_msgSend(v5, "alpha");
  if (v8 < 1.0)
  {
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__CAMPanoramaView__updateInstructionLabelForInstruction___block_invoke;
    v11[3] = &unk_1EA328868;
    v12 = v5;
    objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 2, v11, 0, 0.5, 0.0);

  }
  -[CAMPanoramaView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "panoramaView:didUpdateInstruction:", self, a3);

}

uint64_t __57__CAMPanoramaView__updateInstructionLabelForInstruction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_showMoveDownInstructions
{
  if (-[CAMPanoramaView isPainting](self, "isPainting"))
  {
    -[CAMPanoramaView _updateInstructionLabelForInstruction:](self, "_updateInstructionLabelForInstruction:", 5);
    -[CAMPanoramaView _setCurrentlyShowingMoveInstructions:](self, "_setCurrentlyShowingMoveInstructions:", 1);
  }
}

- (void)_showMoveUpInstructions
{
  if (-[CAMPanoramaView isPainting](self, "isPainting"))
  {
    -[CAMPanoramaView _updateInstructionLabelForInstruction:](self, "_updateInstructionLabelForInstruction:", 4);
    -[CAMPanoramaView _setCurrentlyShowingMoveInstructions:](self, "_setCurrentlyShowingMoveInstructions:", 1);
  }
}

- (void)_cancelDelayedMoveInstructions
{
  +[CAMPanoramaView cancelPreviousPerformRequestsWithTarget:selector:object:](CAMPanoramaView, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showMoveDownInstructions, 0);
  +[CAMPanoramaView cancelPreviousPerformRequestsWithTarget:selector:object:](CAMPanoramaView, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showMoveUpInstructions, 0);
}

- (void)_showMoveDownInstructionsAfterDelay
{
  if (!-[CAMPanoramaView _isCurrentlyShowingMoveInstructions](self, "_isCurrentlyShowingMoveInstructions"))
  {
    -[CAMPanoramaView _cancelDelayedMoveInstructions](self, "_cancelDelayedMoveInstructions");
    -[CAMPanoramaView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showMoveDownInstructions, 0, 2.0);
  }
}

- (void)_showMoveUpInstructionsAfterDelay
{
  if (!-[CAMPanoramaView _isCurrentlyShowingMoveInstructions](self, "_isCurrentlyShowingMoveInstructions"))
  {
    -[CAMPanoramaView _cancelDelayedMoveInstructions](self, "_cancelDelayedMoveInstructions");
    -[CAMPanoramaView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showMoveUpInstructions, 0, 2.0);
  }
}

- (void)_hideSpeedInstructionsAfterDelay
{
  -[CAMPanoramaView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideInstructionLabel, 0, 0.5);
}

- (void)_showSpeedInstructions
{
  +[CAMPanoramaView cancelPreviousPerformRequestsWithTarget:selector:object:](CAMPanoramaView, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideInstructionLabel, 0);
  -[CAMPanoramaView _cancelDelayedMoveInstructions](self, "_cancelDelayedMoveInstructions");
  -[CAMPanoramaView _updateInstructionLabelForInstruction:](self, "_updateInstructionLabelForInstruction:", 3);
  -[CAMPanoramaView _setCurrentlyShowingMoveInstructions:](self, "_setCurrentlyShowingMoveInstructions:", 0);
}

- (void)_hideArrowInstructionsAfterDelay
{
  -[CAMPanoramaView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideInstructionLabel, 0, 2.0);
}

- (void)_showArrowInstructions
{
  -[CAMPanoramaView _updateInstructionLabelForInstruction:](self, "_updateInstructionLabelForInstruction:", 2);
  -[CAMPanoramaView setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)direction
{
  return self->_direction;
}

- (CAMPanoramaViewDelegate)delegate
{
  return (CAMPanoramaViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAMPanoramaPreviewView)previewView
{
  return self->_previewView;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CGSize)panoramaCaptureSize
{
  double width;
  double height;
  CGSize result;

  width = self->_panoramaCaptureSize.width;
  height = self->_panoramaCaptureSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isPainting
{
  return self->_painting;
}

- (void)_setPainting:(BOOL)a3
{
  self->_painting = a3;
}

- (UIView)_stripBackgroundView
{
  return self->__stripBackgroundView;
}

- (UIView)_stripContainerView
{
  return self->__stripContainerView;
}

- (UIView)_maskingView
{
  return self->__maskingView;
}

- (CAMPanoramaArrowView)_arrowView
{
  return self->__arrowView;
}

- (CAMPanoramaLevelView)_levelView
{
  return self->__levelView;
}

- (CAMPanoramaLabel)_instructionLabel
{
  return self->__instructionLabel;
}

- (NSString)_speedString
{
  return self->__speedString;
}

- (NSString)_moveUpString
{
  return self->__moveUpString;
}

- (NSString)_moveDownString
{
  return self->__moveDownString;
}

- (NSString)_arrowString
{
  return self->__arrowString;
}

- (NSString)_instructionString
{
  return self->__instructionString;
}

- (CGPoint)_initialArrowCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->__initialArrowCenter.x;
  y = self->__initialArrowCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setInitialArrowCenter:(CGPoint)a3
{
  self->__initialArrowCenter = a3;
}

- (CGRect)_lastLayoutBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__lastLayoutBounds.origin.x;
  y = self->__lastLayoutBounds.origin.y;
  width = self->__lastLayoutBounds.size.width;
  height = self->__lastLayoutBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setLastLayoutBounds:(CGRect)a3
{
  self->__lastLayoutBounds = a3;
}

- (CAMPanoramaPaintingStatus)_currentPaintingStatus
{
  return self->__currentPaintingStatus;
}

- (void)_setCurrentPaintingStatus:(id)a3
{
  objc_storeStrong((id *)&self->__currentPaintingStatus, a3);
}

- (double)_filteredNormalizedBaselineOffset
{
  return self->__filteredNormalizedBaselineOffset;
}

- (void)_setFilteredNormalizedBaselineOffset:(double)a3
{
  self->__filteredNormalizedBaselineOffset = a3;
}

- (BOOL)_isCurrentlyShowingMoveInstructions
{
  return self->__currentlyShowingMoveInstructions;
}

- (void)_setCurrentlyShowingMoveInstructions:(BOOL)a3
{
  self->__currentlyShowingMoveInstructions = a3;
}

- (double)_previousSpeeds
{
  return self->__previousSpeeds;
}

- (BOOL)_isCurrentlyMovingTooFast
{
  return self->__currentlyMovingTooFast;
}

- (void)_setCurrentlyMovingTooFast:(BOOL)a3
{
  self->__currentlyMovingTooFast = a3;
}

- (double)_currentAverageSpeed
{
  return self->__currentAverageSpeed;
}

- (void)_setCurrentAverageSpeed:(double)a3
{
  self->__currentAverageSpeed = a3;
}

- (unint64_t)_arrowUpdateFrame
{
  return self->__arrowUpdateFrame;
}

- (void)_setArrowUpdateFrame:(unint64_t)a3
{
  self->__arrowUpdateFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentPaintingStatus, 0);
  objc_storeStrong((id *)&self->__instructionString, 0);
  objc_storeStrong((id *)&self->__arrowString, 0);
  objc_storeStrong((id *)&self->__moveDownString, 0);
  objc_storeStrong((id *)&self->__moveUpString, 0);
  objc_storeStrong((id *)&self->__speedString, 0);
  objc_storeStrong((id *)&self->__instructionLabel, 0);
  objc_storeStrong((id *)&self->__levelView, 0);
  objc_storeStrong((id *)&self->__arrowView, 0);
  objc_storeStrong((id *)&self->__maskingView, 0);
  objc_storeStrong((id *)&self->__stripContainerView, 0);
  objc_storeStrong((id *)&self->__stripBackgroundView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
