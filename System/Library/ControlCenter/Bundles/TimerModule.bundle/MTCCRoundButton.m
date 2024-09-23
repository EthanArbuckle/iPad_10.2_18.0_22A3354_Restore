@implementation MTCCRoundButton

- (MTCCRoundButton)init
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  void *v35;
  id v36;
  const char *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  id v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  const char *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  objc_super v114;
  void *v115;
  uint8_t buf[4];
  id v117;
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v114.receiver = self;
  v114.super_class = (Class)MTCCRoundButton;
  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v6 = -[MTCCRoundButton initWithFrame:](&v114, sel_initWithFrame_, *MEMORY[0x24BDBF090], v3, v4, v5);
  if (v6)
  {
    MTLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v117 = v6;
      _os_log_impl(&dword_23102D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }

    v8 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend_bounds(v6, v9, v10);
    v13 = objc_msgSend_initWithFrame_(v8, v11, v12);
    v14 = (void *)*((_QWORD *)v6 + 58);
    *((_QWORD *)v6 + 58) = v13;

    objc_msgSend_setAutoresizingMask_(*((void **)v6 + 58), v15, 18);
    objc_msgSend_clearColor(MEMORY[0x24BDF6950], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundColor_(*((void **)v6 + 58), v19, (uint64_t)v18);

    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 58), v20, 0);
    objc_msgSend_addSubview_(v6, v21, *((_QWORD *)v6 + 58));
    v22 = objc_alloc(MEMORY[0x24BDF6FC8]);
    objc_msgSend_bounds(v6, v23, v24);
    v27 = (void *)objc_msgSend_initWithFrame_(v22, v25, v26);
    objc_msgSend_effectWithStyle_(MEMORY[0x24BDF6878], v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v29;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v30, (uint64_t)&v115, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundEffects_(v27, v32, (uint64_t)v31);

    objc_msgSend_setAutoresizingMask_(v27, v33, 18);
    objc_msgSend_setUserInteractionEnabled_(v27, v34, 0);
    v35 = (void *)*((_QWORD *)v6 + 59);
    *((_QWORD *)v6 + 59) = v27;
    v36 = v27;

    objc_msgSend_addSubview_(*((void **)v6 + 58), v37, *((_QWORD *)v6 + 59));
    v38 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend_bounds(v6, v39, v40);
    v43 = objc_msgSend_initWithFrame_(v38, v41, v42);
    v44 = (void *)*((_QWORD *)v6 + 60);
    *((_QWORD *)v6 + 60) = v43;

    objc_msgSend_setAutoresizingMask_(*((void **)v6 + 60), v45, 18);
    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 60), v46, 0);
    objc_msgSend_addSubview_(*((void **)v6 + 58), v47, *((_QWORD *)v6 + 60));
    v48 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend_bounds(v6, v49, v50);
    v53 = objc_msgSend_initWithFrame_(v48, v51, v52);
    v54 = (void *)*((_QWORD *)v6 + 61);
    *((_QWORD *)v6 + 61) = v53;

    objc_msgSend_setAutoresizingMask_(*((void **)v6 + 61), v55, 18);
    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 61), v56, 0);
    objc_msgSend_setAlpha_(*((void **)v6 + 61), v57, v58, 0.0);
    objc_msgSend_addSubview_(*((void **)v6 + 58), v59, *((_QWORD *)v6 + 61));
    v60 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend_bounds(v6, v61, v62);
    v65 = objc_msgSend_initWithFrame_(v60, v63, v64);
    v66 = (void *)*((_QWORD *)v6 + 62);
    *((_QWORD *)v6 + 62) = v65;

    objc_msgSend_setAutoresizingMask_(*((void **)v6 + 62), v67, 18);
    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 62), v68, 0);
    objc_msgSend_setAlpha_(*((void **)v6 + 62), v69, v70, 0.0);
    objc_msgSend_addSubview_(*((void **)v6 + 58), v71, *((_QWORD *)v6 + 62));
    v72 = objc_alloc(MEMORY[0x24BDF6B68]);
    v75 = objc_msgSend_initWithFrame_(v72, v73, v74, v2, v3, v4, v5);
    v76 = (void *)*((_QWORD *)v6 + 63);
    *((_QWORD *)v6 + 63) = v75;

    objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(MEMORY[0x24BDF6A78], v77, *MEMORY[0x24BDF7808], 2, 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend_pointSize(v78, v80, v81);
    objc_msgSend_fontWithDescriptor_size_(v79, v82, (uint64_t)v78);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFont_(*((void **)v6 + 63), v84, (uint64_t)v83);

    objc_msgSend_whiteColor(MEMORY[0x24BDF6950], v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextColor_(*((void **)v6 + 63), v88, (uint64_t)v87);

    objc_msgSend_setTextAlignment_(*((void **)v6 + 63), v89, 1);
    objc_msgSend_setClipsToBounds_(*((void **)v6 + 63), v90, 0);
    objc_msgSend_setAdjustsFontSizeToFitWidth_(*((void **)v6 + 63), v91, 1);
    objc_msgSend_setBaselineAdjustment_(*((void **)v6 + 63), v92, 1);
    objc_msgSend_addSubview_(*((void **)v6 + 58), v93, *((_QWORD *)v6 + 63));
    v94 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v97 = objc_msgSend_initWithFrame_(v94, v95, v96, v2, v3, v4, v5);
    v98 = (void *)*((_QWORD *)v6 + 64);
    *((_QWORD *)v6 + 64) = v97;

    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 64), v99, 0);
    objc_msgSend_addSubview_(*((void **)v6 + 58), v100, *((_QWORD *)v6 + 64));
    objc_msgSend_addTarget_action_forControlEvents_(v6, v101, (uint64_t)v6, sel__touchDown_, 1);
    objc_msgSend_addTarget_action_forControlEvents_(v6, v102, (uint64_t)v6, sel__touchUpInside_, 64);
    objc_msgSend_addTarget_action_forControlEvents_(v6, v103, (uint64_t)v6, sel__touchUpOutside_, 128);
    objc_msgSend_addTarget_action_forControlEvents_(v6, v104, (uint64_t)v6, sel__dragEnter_, 16);
    objc_msgSend_addTarget_action_forControlEvents_(v6, v105, (uint64_t)v6, sel__dragExit_, 32);
    objc_msgSend_addObserver_forKeyPath_options_context_(v6, v106, (uint64_t)v6, CFSTR("enabled"), 0, 0);
    objc_msgSend_addObserver_forKeyPath_options_context_(v6, v107, (uint64_t)v6, CFSTR("highlighted"), 0, 0);
    objc_msgSend_addObserver_forKeyPath_options_context_(v6, v108, (uint64_t)v6, CFSTR("selected"), 0, 0);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v111, v112, (uint64_t)v6, sel_handleContentSizeChange_, *MEMORY[0x24BDF7670], 0);

  }
  return (MTCCRoundButton *)v6;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  objc_super v7;
  uint8_t buf[4];
  MTCCRoundButton *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  MTLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_23102D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing", buf, 0xCu);
  }

  objc_msgSend_removeObserver_forKeyPath_(self, v4, (uint64_t)self, CFSTR("enabled"));
  objc_msgSend_removeObserver_forKeyPath_(self, v5, (uint64_t)self, CFSTR("highlighted"));
  objc_msgSend_removeObserver_forKeyPath_(self, v6, (uint64_t)self, CFSTR("selected"));
  v7.receiver = self;
  v7.super_class = (Class)MTCCRoundButton;
  -[MTCCRoundButton dealloc](&v7, sel_dealloc);
}

- (void)setTitle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend_titleLabel(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setText_(v7, v8, (uint64_t)v4);

  objc_msgSend_setNeedsLayout(self, v9, v10);
}

- (NSString)title
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_titleLabel(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_text(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  char *v6;
  int *v7;
  char *v8;

  v6 = (char *)a3;
  switch(a4)
  {
    case 0uLL:
      v7 = &OBJC_IVAR___MTCCRoundButton__normalStateBackgroundView;
      goto LABEL_7;
    case 4uLL:
      v7 = &OBJC_IVAR___MTCCRoundButton__selectedStateBackgroundView;
      goto LABEL_7;
    case 1uLL:
      v7 = &OBJC_IVAR___MTCCRoundButton__highlightView;
LABEL_7:
      v8 = v6;
      objc_msgSend_setBackgroundColor_(*(void **)((char *)&self->super.super.super.super.isa + *v7), v6, (uint64_t)v6);
      v6 = v8;
      break;
  }

}

- (void)setBackgroundMaterialView:(id)a3 forState:(unint64_t)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  id v22;

  v7 = a3;
  if (v7)
  {
    switch(a4)
    {
      case 4uLL:
        v22 = v7;
        objc_msgSend_removeFromSuperview(self->_selectedStateBackgroundView, v8, v9);
        objc_storeStrong((id *)&self->_selectedStateBackgroundView, a3);
        objc_msgSend_setAutoresizingMask_(self->_selectedStateBackgroundView, v14, 18);
        objc_msgSend_setUserInteractionEnabled_(self->_selectedStateBackgroundView, v15, 0);
        objc_msgSend_setAlpha_(self->_selectedStateBackgroundView, v16, v17, 0.0);
        objc_msgSend_insertSubview_aboveSubview_(self->_containerView, v18, (uint64_t)self->_selectedStateBackgroundView, self->_normalStateBackgroundView);
        goto LABEL_8;
      case 1uLL:
        v22 = v7;
        objc_msgSend_removeFromSuperview(self->_normalStateBackgroundView, v8, v9);
        objc_storeStrong((id *)&self->_normalStateBackgroundView, a3);
        objc_msgSend_setAutoresizingMask_(self->_normalStateBackgroundView, v19, 18);
        objc_msgSend_setUserInteractionEnabled_(self->_normalStateBackgroundView, v20, 0);
        objc_msgSend_insertSubview_aboveSubview_(self->_containerView, v21, (uint64_t)self->_normalStateBackgroundView, self->_backgroundView);
        goto LABEL_8;
      case 0uLL:
        v22 = v7;
        objc_msgSend_removeFromSuperview(self->_backgroundView, v8, v9);
        objc_storeStrong((id *)&self->_backgroundView, a3);
        objc_msgSend_setAutoresizingMask_(self->_backgroundView, v10, 18);
        objc_msgSend_setUserInteractionEnabled_(self->_backgroundView, v11, 0);
        objc_msgSend_addSubview_(self->_containerView, v12, (uint64_t)self->_backgroundView);
        objc_msgSend_sendSubviewToBack_(self->_containerView, v13, (uint64_t)self->_backgroundView);
LABEL_8:
        v7 = v22;
        break;
    }
  }

}

- (void)setImage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_imageView(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImage_(v8, v7, (uint64_t)v4);

}

- (UIImage)image
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_imageView(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_image(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

- (void)layoutSubviews
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  NSString *v36;
  _BOOL4 IsAccessibilityCategory;
  const char *v38;
  uint64_t v39;
  double v40;
  double v41;
  double Width;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double MidX;
  double MidY;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  objc_super v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v68.receiver = self;
  v68.super_class = (Class)MTCCRoundButton;
  -[MTCCRoundButton layoutSubviews](&v68, sel_layoutSubviews);
  objc_msgSend__updateCornerRadius(self, v3, v4);
  objc_msgSend_bounds(self, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend_titleLabel(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sizeToFit(v17, v18, v19);

  objc_msgSend_titleLabel(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v22, v23, v24);
  v66 = v26;
  v67 = v25;
  v28 = v27;
  v30 = v29;

  objc_msgSend_traitCollection(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredContentSizeCategory(v33, v34, v35);
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v36);

  if (IsAccessibilityCategory)
  {
    objc_msgSend_frame(self, v38, v39);
    v41 = v40 + -48.0;
  }
  else
  {
    v69.size.height = v66;
    v69.origin.x = v67;
    v69.origin.y = v28;
    v69.size.width = v30;
    Width = CGRectGetWidth(v69);
    v70.origin.x = v8;
    v70.origin.y = v10;
    v70.size.width = v12;
    v70.size.height = v14;
    v41 = fmin(Width, CGRectGetWidth(v70));
  }
  v71.origin.x = v8;
  v71.origin.y = v10;
  v71.size.width = v12;
  v71.size.height = v14;
  CGRectGetMidX(v71);
  v65 = v8;
  v72.origin.x = v67;
  v72.origin.y = v28;
  v72.size.width = v41;
  v72.size.height = v66;
  CGRectGetWidth(v72);
  v73.size.width = v12;
  v73.origin.x = v8;
  v73.origin.y = v10;
  v73.size.height = v14;
  CGRectGetMidY(v73);
  v43 = v10;
  v74.origin.x = v67;
  v74.origin.y = v28;
  v74.size.width = v41;
  v74.size.height = v66;
  CGRectGetHeight(v74);
  UIPointIntegral();
  v45 = v44;
  v47 = v46;
  objc_msgSend_titleLabel(self, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v50, v51, v52, v45, v47, v41, v66);

  objc_msgSend_imageView(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sizeToFit(v55, v56, v57);

  v75.origin.x = v65;
  v75.origin.y = v43;
  v75.size.width = v12;
  v75.size.height = v14;
  MidX = CGRectGetMidX(v75);
  v76.origin.x = v65;
  v76.origin.y = v43;
  v76.size.width = v12;
  v76.size.height = v14;
  MidY = CGRectGetMidY(v76);
  objc_msgSend_imageView(self, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCenter_(v62, v63, v64, MidX, MidY);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 80.0;
  v4 = 80.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  ((void (*)(MTCCRoundButton *, char *))MEMORY[0x24BEDD108])(self, sel_sizeThatFits_);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  MTCCRoundButton *v9;
  void *v10;
  const char *v11;
  char isDescendantOfView;

  v4 = a3;
  objc_msgSend_view(v4, v5, v6);
  v9 = (MTCCRoundButton *)objc_claimAutoreleasedReturnValue();
  if (v9 == self)
  {
    isDescendantOfView = 1;
  }
  else
  {
    objc_msgSend_view(v4, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isDescendantOfView = objc_msgSend_isDescendantOfView_(v10, v11, (uint64_t)self);

  }
  return isDescendantOfView;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  const char *v8;
  MTCCRoundButton *v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v9 = (MTCCRoundButton *)a4;
  if (v9 == self
    && ((objc_msgSend_isEqualToString_(v12, v8, (uint64_t)CFSTR("selected")) & 1) != 0
     || (objc_msgSend_isEqualToString_(v12, v10, (uint64_t)CFSTR("enabled")) & 1) != 0
     || objc_msgSend_isEqualToString_(v12, v10, (uint64_t)CFSTR("highlighted"))))
  {
    objc_msgSend__updateForStateChange(v9, v10, v11);
  }

}

- (void)handleContentSizeChange:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(MEMORY[0x24BDF6A78], a2, *MEMORY[0x24BDF7808], 2, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend_pointSize(v15, v5, v6);
  objc_msgSend_fontWithDescriptor_size_(v4, v7, (uint64_t)v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_titleLabel(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(v11, v12, (uint64_t)v8);

  objc_msgSend_setNeedsLayout(self, v13, v14);
}

- (void)_updateCornerRadius
{
  uint64_t v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  id v55;
  CGRect v56;
  CGRect v57;

  objc_msgSend_bounds(self, a2, v2);
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  v8 = CGRectGetWidth(v56);
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v9 = CGRectGetHeight(v57);
  v10 = fmin(v8, v9) * 0.5;
  objc_msgSend_containerView(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  if (v8 == v9)
  {
    objc_msgSend__setCornerRadius_(v13, v14, v15, v10);

    objc_msgSend_backgroundView(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setCornerRadius_(v19, v20, v21, v10);

    objc_msgSend_normalStateBackgroundView(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setCornerRadius_(v24, v25, v26, v10);

    objc_msgSend_selectedStateBackgroundView(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setCornerRadius_(v29, v30, v31, v10);

    objc_msgSend_highlightView(self, v32, v33);
    v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setCornerRadius_(v55, v34, v35, v10);
  }
  else
  {
    objc_msgSend__setContinuousCornerRadius_(v13, v14, v15, v10);

    objc_msgSend_backgroundView(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v38, v39, v40, v10);

    objc_msgSend_normalStateBackgroundView(self, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v43, v44, v45, v10);

    objc_msgSend_selectedStateBackgroundView(self, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v48, v49, v50, v10);

    objc_msgSend_highlightView(self, v51, v52);
    v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v55, v53, v54, v10);
  }

}

- (void)_touchDown:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setHighlighted_, 1);
}

- (void)_touchUpInside:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setHighlighted_, 0);
}

- (void)_touchUpOutside:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setHighlighted_, 0);
}

- (void)_dragEnter:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setHighlighted_, 1);
}

- (void)_dragExit:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setHighlighted_, 0);
}

- (void)_updateForStateChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_231030D60;
  v2[3] = &unk_24FFE64D0;
  v2[4] = self;
  objc_msgSend_animateWithDuration_animations_(MEMORY[0x24BDF6F90], a2, (uint64_t)v2, 0.25);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)normalStateBackgroundView
{
  return self->_normalStateBackgroundView;
}

- (void)setNormalStateBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_normalStateBackgroundView, a3);
}

- (UIView)selectedStateBackgroundView
{
  return self->_selectedStateBackgroundView;
}

- (void)setSelectedStateBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStateBackgroundView, a3);
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_selectedStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_normalStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
