@implementation AXCCTextSizeSliderBackgroundViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  UILabel *v8;
  UILabel *textSizeLabel;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  UILabel *v18;
  UILabel *textPercentageLabel;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  UILabel *v29;
  UILabel *defaultLabel;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  AXCCExpandableButton *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  AXCCExpandableButton *v44;
  AXCCExpandableButton *perAppModeSwitcher;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  NSMutableArray *v61;
  NSMutableArray *switcherOptions;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  AXCCExpandableButtonOption *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  objc_super v110;

  v110.receiver = self;
  v110.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  -[AXCCTextSizeSliderBackgroundViewController viewDidLoad](&v110, sel_viewDidLoad);
  AXCCLocalizedString(CFSTR("text.size.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__attachmentAttributedString_withSystemImage_(self, v4, (uint64_t)v3, (uint64_t)CFSTR("textformat.size"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__labelSubviewWithAttributedText_(self, v6, (uint64_t)v5, v7);
  v8 = (UILabel *)objc_claimAutoreleasedReturnValue();
  textSizeLabel = self->_textSizeLabel;
  self->_textSizeLabel = v8;

  objc_msgSend_view(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v13, v14, (uint64_t)self->_textSizeLabel, v15);

  objc_msgSend__labelSubviewWithText_(self, v16, (uint64_t)&stru_24FFC4800, v17);
  v18 = (UILabel *)objc_claimAutoreleasedReturnValue();
  textPercentageLabel = self->_textPercentageLabel;
  self->_textPercentageLabel = v18;

  objc_msgSend_view(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v23, v24, (uint64_t)self->_textPercentageLabel, v25);

  AXCCLocalizedString(CFSTR("default.label"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__labelSubviewWithText_(self, v27, (uint64_t)v26, v28);
  v29 = (UILabel *)objc_claimAutoreleasedReturnValue();
  defaultLabel = self->_defaultLabel;
  self->_defaultLabel = v29;

  objc_msgSend_setAlpha_(self->_defaultLabel, v31, v32, v33, 0.0);
  objc_msgSend_view(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v37, v38, (uint64_t)self->_defaultLabel, v39);

  v40 = [AXCCExpandableButton alloc];
  v44 = (AXCCExpandableButton *)objc_msgSend_initForControlCenter(v40, v41, v42, v43);
  perAppModeSwitcher = self->_perAppModeSwitcher;
  self->_perAppModeSwitcher = v44;

  objc_msgSend_addTarget_action_forControlEvents_(self->_perAppModeSwitcher, v46, (uint64_t)self, (uint64_t)sel__togglePerAppButton_, 4096);
  objc_msgSend_setButtonImageSize_(self->_perAppModeSwitcher, v47, v48, v49, 54.0, 54.0);
  objc_msgSend_setMaximumExpandedSize_(self->_perAppModeSwitcher, v50, v51, v52, 0.0, 228.0);
  objc_msgSend_setExpanded_(self->_perAppModeSwitcher, v53, 1, v54);
  objc_msgSend_view(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v58, v59, (uint64_t)self->_perAppModeSwitcher, v60);

  v61 = (NSMutableArray *)objc_opt_new();
  switcherOptions = self->_switcherOptions;
  self->_switcherOptions = v61;

  v66 = 0;
  while (v66 < objc_msgSend_count(&unk_24FFC8888, v63, v64, v65))
  {
    v69 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend_objectAtIndexedSubscript_(&unk_24FFC8888, v67, v66, v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_systemImageNamed_(v69, v71, (uint64_t)v70, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = objc_alloc_init(AXCCExpandableButtonOption);
    objc_msgSend_systemWhiteColor(MEMORY[0x24BEBD4B8], v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSelectedBackgroundColor_(v74, v79, (uint64_t)v78, v80);

    objc_msgSend_setImage_(v74, v81, (uint64_t)v73, v82);
    objc_msgSend_addObject_(self->_switcherOptions, v83, (uint64_t)v74, v84);

    if (++v66 == 4)
      goto LABEL_8;
  }
  AXLogCommon();
  v85 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    sub_230F8C3F4(v85, v86, v87, v88, v89, v90, v91, v92);

LABEL_8:
  objc_msgSend_lastObject(self->_switcherOptions, v63, v64, v65);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  AXCCLocalizedString(CFSTR("global.label"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v93, v95, (uint64_t)v94, v96);

  objc_msgSend__updateLabelFonts(self, v97, v98, v99);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v103, v104, (uint64_t)self, (uint64_t)sel__contentSizeCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v105, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v108, v109, (uint64_t)self, (uint64_t)sel__contentSizeCategoryDidChangeInternally_, CFSTR("AXCCInternalTextSizeDidUpdate"), 0);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  AXCCVisualStylingProvider *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  -[AXCCTextSizeSliderBackgroundViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v19, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
  {
    objc_msgSend_view(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_visualStylingProviderForCategory_(v9, v10, 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [AXCCVisualStylingProvider alloc];
    v16 = (void *)objc_msgSend_initWithVisualStylingProvider_(v13, v14, (uint64_t)v12, v15);
    objc_msgSend_setStylingProvider_(self->_perAppModeSwitcher, v17, (uint64_t)v16, v18);

  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  -[AXCCTextSizeSliderBackgroundViewController dealloc](&v8, sel_dealloc);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BEBD848], sel_systemPointerStyle, a3, a4);
}

- (void)moduleDidExpand
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  objc_msgSend__updatePerAppControls(self, a2, v2, v3);
  objc_msgSend__contentSizeCategoryDidChange_(self, v5, 0, v6);
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  -[AXCCTextSizeSliderBackgroundViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  objc_msgSend__updatePerAppControls(self, v4, v5, v6);
  objc_msgSend__contentSizeCategoryDidChange_(self, v7, 0, v8);
}

- (void)_updateDefaultLabelPercentageForContentSizeCategory:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;

  AXTextSizePercentage();
  AXFormatFloatWithPercentage();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setText_(self->_textPercentageLabel, v4, (uint64_t)v6, v5);

}

- (void)_updateDefaultLabelVisibilityForContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBDB00];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_230F838CC;
  v9[3] = &unk_24FFC4340;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend_animateWithDuration_animations_(v5, v7, (uint64_t)v9, v8, 0.1);

}

- (id)_labelSubviewWithText:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = (objc_class *)MEMORY[0x24BEBD708];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = (void *)objc_msgSend_initWithFrame_(v5, v6, v7, v8, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend_whiteColor(MEMORY[0x24BEBD4B8], v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextColor_(v9, v14, (uint64_t)v13, v15);

  objc_msgSend_setText_(v9, v16, (uint64_t)v4, v17);
  objc_msgSend_controlCenterApplyPrimaryContentShadow(v9, v18, v19, v20);
  return v9;
}

- (id)_labelSubviewWithAttributedText:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = (objc_class *)MEMORY[0x24BEBD708];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = (void *)objc_msgSend_initWithFrame_(v5, v6, v7, v8, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend_whiteColor(MEMORY[0x24BEBD4B8], v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextColor_(v9, v14, (uint64_t)v13, v15);

  objc_msgSend_setAttributedText_(v9, v16, (uint64_t)v4, v17);
  objc_msgSend_controlCenterApplyPrimaryContentShadow(v9, v18, v19, v20);
  return v9;
}

- (id)_attachmentAttributedString:(id)a3 withSystemImage:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;

  v5 = (objc_class *)MEMORY[0x24BEBB4B8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend_configurationWithTextStyle_(MEMORY[0x24BEBD660], v9, *MEMORY[0x24BEBE240], v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x24BEBD640], v12, (uint64_t)v6, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_whiteColor(MEMORY[0x24BEBD4B8], v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithTintColor_(v13, v18, (uint64_t)v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImage_(v8, v21, (uint64_t)v20, v22);

  objc_msgSend_attributedStringWithAttachment_(MEMORY[0x24BDD1688], v23, (uint64_t)v8, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc(MEMORY[0x24BDD1688]);
  v29 = (void *)objc_msgSend_initWithString_(v26, v27, (uint64_t)v7, v28);

  objc_msgSend_insertAttributedString_atIndex_(v29, v30, (uint64_t)v25, 0);
  return v29;
}

- (id)_preferredCategoryWithPerAppSettings
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_categoryName(self->_helper, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = objc_msgSend_state(self->_helper, v7, v8, v9);
    objc_msgSend_numberWithUnsignedInt_(v10, v12, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v5;
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_230F7C000, v6, OS_LOG_TYPE_INFO, "Preferrefed category: %@ = %@", (uint8_t *)&v16, 0x16u);

  }
  return v5;
}

- (void)_updateLabelFonts
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  UILabel *textSizeLabel;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  id v39;

  objc_msgSend__preferredCategoryWithPerAppSettings(self, a2, v2, v3);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x24BEBDAB0], v5, (uint64_t)v39, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  textSizeLabel = self->_textSizeLabel;
  AXCCLocalizedString(CFSTR("text.size.label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__attachmentAttributedString_withSystemImage_(self, v10, (uint64_t)v9, (uint64_t)CFSTR("textformat.size"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttributedText_(textSizeLabel, v12, (uint64_t)v11, v13);

  objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(MEMORY[0x24BEBB520], v14, *MEMORY[0x24BEBE240], (uint64_t)v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(self->_textSizeLabel, v16, (uint64_t)v15, v17);

  objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(MEMORY[0x24BEBB520], v18, *MEMORY[0x24BEBE228], (uint64_t)v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(self->_textPercentageLabel, v20, (uint64_t)v19, v21);

  objc_msgSend__preferredCategoryWithPerAppSettings(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateDefaultLabelPercentageForContentSizeCategory_(self, v26, (uint64_t)v25, v27);

  objc_msgSend_defaultFontDescriptorWithTextStyle_addingSymbolicTraits_options_(MEMORY[0x24BEBB528], v28, *MEMORY[0x24BEBE1D0], 2, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend_pointSize(v29, v31, v32, v33);
  objc_msgSend_fontWithDescriptor_size_(v30, v34, (uint64_t)v29, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(self->_defaultLabel, v37, (uint64_t)v36, v38);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  objc_msgSend__updateLabelFonts(self, a2, (uint64_t)a3, v3);
  objc_msgSend__preferredCategoryWithPerAppSettings(self, v5, v6, v7);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateDefaultLabelPercentageForContentSizeCategory_(self, v8, (uint64_t)v19, v9);
  objc_msgSend__updateDefaultLabelVisibilityForContentSizeCategory_(self, v10, (uint64_t)v19, v11);
  objc_msgSend_view(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNeedsLayout(v15, v16, v17, v18);

}

- (void)_contentSizeCategoryDidChangeInternally:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
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
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;

  objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  v43 = (char *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_state(self->_helper, v5, v6, v7) == 3)
  {
    v11 = v43;
  }
  else
  {
    objc_msgSend_categoryName(self->_helper, v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (const char *)v12;
  }
  v44 = (char *)v11;
  objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x24BEBDAB0], v11, (uint64_t)v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_font(self->_textSizeLabel, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection_(v17, v18, (uint64_t)v13, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(self->_textSizeLabel, v21, (uint64_t)v20, v22);

  objc_msgSend_font(self->_textPercentageLabel, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection_(v26, v27, (uint64_t)v13, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(self->_textPercentageLabel, v30, (uint64_t)v29, v31);

  objc_msgSend__updateDefaultLabelPercentageForContentSizeCategory_(self, v32, (uint64_t)v44, v33);
  objc_msgSend__updateDefaultLabelVisibilityForContentSizeCategory_(self, v34, (uint64_t)v44, v35);
  objc_msgSend_view(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNeedsLayout(v39, v40, v41, v42);

}

- (void)_updatePerAppControls
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int isPerAppAvailable;
  AXCCExpandableButton *perAppModeSwitcher;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  char isEqualToString;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  unsigned int v99;
  const char *v100;
  uint64_t v101;
  id obj;
  uint64_t v103;
  void *v104;
  int v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_refreshAppInfo(self->_helper, a2, v2, v3);
  objc_msgSend_refreshCategoryName(self->_helper, v5, v6, v7);
  if (self->_perAppModeSwitcher)
  {
    isPerAppAvailable = objc_msgSend_isPerAppAvailable(self->_helper, v8, v9, v10);
    perAppModeSwitcher = self->_perAppModeSwitcher;
    if (isPerAppAvailable)
    {
      objc_msgSend_setHidden_(perAppModeSwitcher, v11, 0, v12);
      v15 = (void *)objc_opt_new();
      objc_msgSend_appsNames(self->_helper, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appsIdentifiers(self->_helper, v20, v21, v22);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = v19;
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v106, (uint64_t)v110, 16);
      if (v24)
      {
        v28 = v24;
        v105 = 0;
        v103 = *(_QWORD *)v107;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v107 != v103)
              objc_enumerationMutation(obj);
            v30 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i);
            if (objc_msgSend_count(self->_switcherOptions, v25, v26, v27) - 1 <= (unint64_t)(v105 + i))
            {
              AXLogCommon();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                sub_230F8C428(v63, v64, v65, v66, v67, v68, v69, v70);

              goto LABEL_19;
            }
            v33 = v15;
            v34 = (v105 + i);
            objc_msgSend_objectAtIndex_(self->_switcherOptions, v31, v34, v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)MEMORY[0x24BDD17C8];
            AXCCLocalizedString(CFSTR("perapp.label"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_localizedStringWithFormat_(v36, v38, (uint64_t)v37, v39, v30);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setTitle_(v35, v41, (uint64_t)v40, v42);

            objc_msgSend_objectAtIndexedSubscript_(v104, v43, v34, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v45, v46, (uint64_t)CFSTR("com.apple.springboard"), v47);

            v51 = (void *)MEMORY[0x24BEBD640];
            if ((isEqualToString & 1) != 0)
            {
              objc_msgSend_systemImageNamed_(MEMORY[0x24BEBD640], v49, (uint64_t)CFSTR("square.3.stack.3d.top.fill"), v50);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setImage_(v35, v53, (uint64_t)v52, v54);
            }
            else
            {
              objc_msgSend_objectAtIndexedSubscript_(v104, v49, v34, v50);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend__applicationIconImageForBundleIdentifier_format_(v51, v55, (uint64_t)v52, 0);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setImage_(v35, v57, (uint64_t)v56, v58);

            }
            v15 = v33;
            objc_msgSend_addObject_(v33, v59, (uint64_t)v35, v60);

          }
          v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v106, (uint64_t)v110, 16);
          v105 += i;
          if (v28)
            continue;
          break;
        }
      }
LABEL_19:

      if (objc_msgSend_count(v15, v71, v72, v73))
      {
        objc_msgSend_lastObject(self->_switcherOptions, v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v15, v78, (uint64_t)v77, v79);

        objc_msgSend_setOptions_(self->_perAppModeSwitcher, v80, (uint64_t)v15, v81);
        objc_msgSend_setExpanded_(self->_perAppModeSwitcher, v82, 1, v83);
        if (objc_msgSend_state(self->_helper, v84, v85, v86) == 3)
        {
          objc_msgSend_options(self->_perAppModeSwitcher, v87, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend_count(v90, v91, v92, v93);
          objc_msgSend_setSelectedOptionIndex_(self->_perAppModeSwitcher, v95, v94 - 1, v96);

        }
        else
        {
          v99 = objc_msgSend_state(self->_helper, v87, v88, v89);
          objc_msgSend_setSelectedOptionIndex_(self->_perAppModeSwitcher, v100, v99, v101);
        }
      }
      else
      {
        objc_msgSend_setOptions_(self->_perAppModeSwitcher, v74, 0, v76);
        objc_msgSend_setHidden_(self->_perAppModeSwitcher, v97, 1, v98);
      }

    }
    else
    {
      objc_msgSend_setOptions_(perAppModeSwitcher, v11, 0, v12);
      objc_msgSend_setHidden_(self->_perAppModeSwitcher, v61, 1, v62);
    }
  }
}

- (void)_togglePerAppButton:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  v5 = objc_msgSend_selectedOptionIndex(self->_perAppModeSwitcher, a2, (uint64_t)a3, v3);
  objc_msgSend_options(self->_perAppModeSwitcher, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v9, v10, v11, v12) - 1;

  if (v5 == v13)
  {
    objc_msgSend_setState_(self->_helper, v14, 3, v16);
  }
  else
  {
    v19 = objc_msgSend_selectedOptionIndex(self->_perAppModeSwitcher, v14, v15, v16);
    objc_msgSend_setState_(self->_helper, v20, v19, v21);
  }
  objc_msgSend__contentSizeCategoryDidChange_(self, v17, 0, v18);
}

- (void)_layoutPerAppControls
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double Width;
  double Height;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  objc_msgSend_view(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v5, v6, v7, v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  if ((CCUIIsPortrait() & 1) != 0
    || (objc_msgSend_currentDevice(MEMORY[0x24BEBD538], v17, v18, v19),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend_userInterfaceIdiom(v20, v21, v22, v23),
        v20,
        v24 == 1))
  {
    objc_msgSend_setAxis_(self->_perAppModeSwitcher, v17, 0, v19);
    v43.origin.x = v10;
    v43.origin.y = v12;
    v43.size.width = v14;
    v43.size.height = v16;
    Width = CGRectGetWidth(v43);
    v44.origin.x = v10;
    v44.origin.y = v12;
    v44.size.width = v14;
    v44.size.height = v16;
    Height = CGRectGetHeight(v44);
    CCUISliderExpandedContentModuleHeight();
    v28 = (Height - v27) * 0.5;
    v45.origin.x = v10;
    v45.origin.y = v12;
    v45.size.width = v14;
    v45.size.height = v16;
    v29 = (CGRectGetWidth(v45) - Width) * 0.5;
    v46.origin.x = v10;
    v46.origin.y = v12;
    v46.size.width = v14;
    v46.size.height = v16;
    v30 = CGRectGetHeight(v46) - (v28 + v28) * 0.5;
    objc_msgSend_setFrame_(self->_perAppModeSwitcher, v31, v32, v33, v29, v30, Width, v28);
  }
  else
  {
    objc_msgSend_setAxis_(self->_perAppModeSwitcher, v17, 1, v19);
    v47.origin.x = v10;
    v47.origin.y = v12;
    v47.size.width = v14;
    v47.size.height = v16;
    v34 = CGRectGetWidth(v47);
    CCUISliderExpandedContentModuleWidth();
    v36 = (v34 - v35) * 0.5;
    v48.origin.x = v10;
    v48.origin.y = v12;
    v48.size.width = v14;
    v48.size.height = v16;
    v37 = CGRectGetHeight(v48);
    v49.origin.x = v10;
    v49.origin.y = v12;
    v49.size.width = v14;
    v49.size.height = v16;
    v38 = CGRectGetWidth(v49) - (v36 + v36) * 0.5;
    v50.origin.x = v10;
    v50.origin.y = v12;
    v50.size.width = v14;
    v50.size.height = v16;
    v42 = (CGRectGetHeight(v50) - v37) * 0.5;
    objc_msgSend_setFrame_(self->_perAppModeSwitcher, v39, v40, v41, v38, v42, v36, v37);
  }
}

- (void)viewWillLayoutSubviews
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Width;
  double v24;
  double v25;
  double Height;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  UILabel *textSizeLabel;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  UILabel *textPercentageLabel;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  UILabel *defaultLabel;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  objc_super v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v131.receiver = self;
  v131.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  -[AXCCTextSizeSliderBackgroundViewController viewWillLayoutSubviews](&v131, sel_viewWillLayoutSubviews);
  objc_msgSend_setNumberOfLines_(self->_textSizeLabel, v3, 1, v4);
  objc_msgSend_sizeToFit(self->_textSizeLabel, v5, v6, v7);
  objc_msgSend_view(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v11, v12, v13, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v132.origin.x = v16;
  v132.origin.y = v18;
  v132.size.width = v20;
  v132.size.height = v22;
  Width = CGRectGetWidth(v132);
  CCUISliderExpandedContentModuleWidth();
  v25 = v24;
  v133.origin.x = v16;
  v133.origin.y = v18;
  v133.size.width = v20;
  v133.size.height = v22;
  Height = CGRectGetHeight(v133);
  CCUISliderExpandedContentModuleHeight();
  v28 = v27;
  if ((CCUIIsPortrait() & 1) != 0
    || (objc_msgSend_currentDevice(MEMORY[0x24BEBD538], v29, v30, v31),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v36 = objc_msgSend_userInterfaceIdiom(v32, v33, v34, v35),
        v32,
        v36 == 1))
  {
    v37 = (Height - v28) * 0.5;
    objc_msgSend_frame(self->_textSizeLabel, v29, v30, v31);
    if (v41 > v20)
    {
      objc_msgSend_frame(self->_textSizeLabel, v38, v39, v40);
      objc_msgSend_setFrame_(self->_textSizeLabel, v42, v43, v44);
    }
    v134.origin.x = v16;
    v134.origin.y = v18;
    v134.size.width = v20;
    v134.size.height = v22;
    CGRectGetMidX(v134);
  }
  else
  {
    v45 = (Width - v25) * 0.5;
    v135.origin.x = v16;
    v135.origin.y = v18;
    v135.size.width = v20;
    v135.size.height = v22;
    v37 = CGRectGetHeight(v135);
    objc_msgSend_frame(self->_textSizeLabel, v46, v47, v48);
    if (v51 > v45)
    {
      objc_msgSend_setNumberOfLines_(self->_textSizeLabel, v49, 0, v50);
      objc_msgSend_frame(self->_textSizeLabel, v52, v53, v54);
      objc_msgSend_setFrame_(self->_textSizeLabel, v55, v56, v57);
      objc_msgSend_sizeToFit(self->_textSizeLabel, v58, v59, v60);
      objc_msgSend_frame(self->_textSizeLabel, v61, v62, v63);
      if (v67 > v22)
      {
        objc_msgSend_frame(self->_textSizeLabel, v64, v65, v66);
        objc_msgSend_setFrame_(self->_textSizeLabel, v68, v69, v70);
      }
    }
    v136.origin.x = v16;
    v136.origin.y = v18;
    v136.size.width = v20;
    v136.size.height = v22;
    CGRectGetMidY(v136);
    objc_msgSend_frame(self->_textSizeLabel, v71, v72, v73);
  }
  UIPointRoundToViewScale();
  objc_msgSend_setCenter_(self->_textSizeLabel, v74, v75, v76);
  textSizeLabel = self->_textSizeLabel;
  objc_msgSend_frame(textSizeLabel, v78, v79, v80);
  UIRectIntegralWithScale();
  objc_msgSend_setFrame_(textSizeLabel, v81, v82, v83);
  objc_msgSend_sizeToFit(self->_textPercentageLabel, v84, v85, v86);
  objc_msgSend_frame(self->_textPercentageLabel, v87, v88, v89);
  objc_msgSend_center(self->_textSizeLabel, v90, v91, v92);
  objc_msgSend_frame(self->_textSizeLabel, v93, v94, v95);
  CGRectGetMaxY(v137);
  textPercentageLabel = self->_textPercentageLabel;
  UIRectIntegralWithScale();
  objc_msgSend_setFrame_(textPercentageLabel, v97, v98, v99);
  objc_msgSend_sizeToFit(self->_defaultLabel, v100, v101, v102);
  objc_msgSend_frame(self->_defaultLabel, v103, v104, v105);
  objc_msgSend_center(self->_textSizeLabel, v106, v107, v108);
  objc_msgSend_frame(self->_textPercentageLabel, v109, v110, v111);
  CGRectGetMaxY(v138);
  defaultLabel = self->_defaultLabel;
  UIRectIntegralWithScale();
  objc_msgSend_setFrame_(defaultLabel, v113, v114, v115);
  objc_msgSend_frame(self->_textPercentageLabel, v116, v117, v118);
  if (CGRectGetMaxY(v139) - v37 + 5.0 > 0.0)
  {
    objc_msgSend_frame(self->_textSizeLabel, v119, v120, v121);
    objc_msgSend_setFrame_(self->_textSizeLabel, v122, v123, v124);
    objc_msgSend_frame(self->_textPercentageLabel, v125, v126, v127);
    objc_msgSend_setFrame_(self->_textPercentageLabel, v128, v129, v130);
  }
  objc_msgSend__layoutPerAppControls(self, v119, v120, v121);
}

- (AXCCTextSizeHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
  objc_storeStrong((id *)&self->_helper, a3);
}

- (UILabel)textSizeLabel
{
  return self->_textSizeLabel;
}

- (void)setTextSizeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textSizeLabel, a3);
}

- (UILabel)textPercentageLabel
{
  return self->_textPercentageLabel;
}

- (void)setTextPercentageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textPercentageLabel, a3);
}

- (UILabel)defaultLabel
{
  return self->_defaultLabel;
}

- (void)setDefaultLabel:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLabel, a3);
}

- (NSMutableArray)switcherOptions
{
  return self->_switcherOptions;
}

- (void)setSwitcherOptions:(id)a3
{
  objc_storeStrong((id *)&self->_switcherOptions, a3);
}

- (AXCCExpandableButton)perAppModeSwitcher
{
  return self->_perAppModeSwitcher;
}

- (void)setPerAppModeSwitcher:(id)a3
{
  objc_storeStrong((id *)&self->_perAppModeSwitcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perAppModeSwitcher, 0);
  objc_storeStrong((id *)&self->_switcherOptions, 0);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
  objc_storeStrong((id *)&self->_textPercentageLabel, 0);
  objc_storeStrong((id *)&self->_textSizeLabel, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

@end
