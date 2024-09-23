@implementation HUICCMenuTextView

- (HUICCMenuTextView)initWithModule:(unint64_t)a3 andDelegate:(id)a4
{
  id v6;
  HUICCMenuTextView *v7;
  HUICCMenuTextView *v8;
  HACCStackView *v9;
  HACCStackView *stackView;
  HACCCapsuleTitleView *v11;
  HACCCapsuleTitleView *titleView;
  _HUIDarkTextView *v13;
  _HUIDarkTextView *textView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *titleViewHeightLayout;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  objc_super v38;
  _QWORD v39[7];

  v39[5] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)HUICCMenuTextView;
  v7 = -[HUICCMenuTextView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8 = v7;
  if (v7)
  {
    -[HUICCMenuTextView setModule:](v7, "setModule:", a3);
    -[HUICCMenuTextView setDelegate:](v8, "setDelegate:", v6);
    v9 = objc_alloc_init(HACCStackView);
    v37 = v6;
    stackView = v8->_stackView;
    v8->_stackView = v9;

    -[HACCStackView setAxis:](v8->_stackView, "setAxis:", 1);
    -[HACCStackView setAlignment:](v8->_stackView, "setAlignment:", 0);
    -[HACCStackView setTranslatesAutoresizingMaskIntoConstraints:](v8->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUICCMenuTextView addSubview:](v8, "addSubview:", v8->_stackView);
    v11 = objc_alloc_init(HACCCapsuleTitleView);
    titleView = v8->_titleView;
    v8->_titleView = v11;

    -[HACCCapsuleTitleView setTranslatesAutoresizingMaskIntoConstraints:](v8->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = objc_alloc_init(_HUIDarkTextView);
    textView = v8->_textView;
    v8->_textView = v13;

    -[_HUIDarkTextView setTranslatesAutoresizingMaskIntoConstraints:](v8->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8->_isSubModule = -[HUICCMenuTextView _updateIsSubModule](v8, "_updateIsSubModule");
    -[HUICCMenuTextView _setupTitleView](v8, "_setupTitleView");
    v30 = (void *)MEMORY[0x24BDD1628];
    -[HACCStackView leadingAnchor](v8->_stackView, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuTextView leadingAnchor](v8, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v34;
    -[HACCStackView trailingAnchor](v8->_stackView, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuTextView trailingAnchor](v8, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v31;
    -[HACCStackView topAnchor](v8->_stackView, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuTextView topAnchor](v8, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v16;
    -[HACCStackView bottomAnchor](v8->_stackView, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuTextView bottomAnchor](v8, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v19;
    -[HUICCMenuTextView textView](v8, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToConstant:", 52.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v23);

    v6 = v37;
    -[HACCCapsuleTitleView heightAnchor](v8->_titleView, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintGreaterThanOrEqualToConstant:", 52.0);
    v25 = objc_claimAutoreleasedReturnValue();
    titleViewHeightLayout = v8->_titleViewHeightLayout;
    v8->_titleViewHeightLayout = (NSLayoutConstraint *)v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v8, sel__handleTapGestureRecognizer_);
    objc_msgSend(v27, "setDelegate:", v8);
    -[_HUIDarkTextView addGestureRecognizer:](v8->_textView, "addGestureRecognizer:", v27);

  }
  return v8;
}

- (BOOL)providesOwnSeparator
{
  unint64_t v2;

  v2 = -[HUICCMenuTextView module](self, "module");
  return v2 == 16 || v2 == 19;
}

- (BOOL)_updateIsSubModule
{
  _BOOL4 v3;
  unint64_t v4;
  void *v5;

  v3 = -[HUICCMenuTextView providesOwnSeparator](self, "providesOwnSeparator");
  if (v3)
  {
    v4 = -[HUICCMenuTextView module](self, "module") - 1;
    -[HUICCMenuTextView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "shouldDisplayControlForModule:", v4);

    LOBYTE(v3) = v4;
  }
  return v3;
}

- (void)setIsSubModule:(BOOL)a3
{
  if (self->_isSubModule != a3)
  {
    self->_isSubModule = a3;
    -[HUICCMenuTextView _setupTitleView](self, "_setupTitleView");
  }
}

- (void)_setupTitleView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[HUICCMenuTextView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUICCMenuTextView titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeArrangedSubview:", v4);

  -[HUICCMenuTextView stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUICCMenuTextView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeArrangedSubview:", v6);

  LODWORD(v6) = -[HUICCMenuTextView isSubModule](self, "isSubModule");
  -[HUICCMenuTextView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v6)
  {
    -[HUICCMenuTextView textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addArrangedSubview:withPartialSeparator:withDarkBackground:", v8, 1, 1);

    -[HUICCMenuTextView titleViewHeightLayout](self, "titleViewHeightLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v9, "isActive");

    if (!(_DWORD)v8)
      return;
    -[HUICCMenuTextView titleViewHeightLayout](self, "titleViewHeightLayout");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 0);
  }
  else
  {
    -[HUICCMenuTextView titleView](self, "titleView");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addArrangedSubview:withSeparator:", v10, -[HUICCMenuTextView providesOwnSeparator](self, "providesOwnSeparator"));

    -[HUICCMenuTextView titleViewHeightLayout](self, "titleViewHeightLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v11, "isActive");

    if ((v10 & 1) == 0)
    {
      -[HUICCMenuTextView titleViewHeightLayout](self, "titleViewHeightLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setActive:", 1);

    }
    -[HUICCMenuTextView stackView](self, "stackView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuTextView textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addArrangedSubview:withSeparator:", v13, 1);

  }
}

- (void)setIsLargeText:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isLargeText != a3)
  {
    v3 = a3;
    self->_isLargeText = a3;
    -[HUICCMenuTextView textView](self, "textView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateLayout:", v3);

  }
}

- (void)updateValue
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HUICCMenuTextView_updateValue__block_invoke;
  block[3] = &unk_24DD60E68;
  block[4] = self;
  dispatch_async(v4, block);

}

void __32__HUICCMenuTextView_updateValue__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentHearingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(*(id *)(a1 + 32), "module"))
  {
    case 15:
      hearingLocString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "leftSelectedProgram");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 16:
    case 17:
      hearingLocString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "rightSelectedProgram");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v9 = v7;
      goto LABEL_11;
    case 18:
      hearingLocString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "leftSelectedStreamingProgram");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 19:
    case 20:
      hearingLocString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "rightSelectedStreamingProgram");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = v10;
      if (objc_msgSend(v10, "isMixingStream") && (objc_msgSend(v9, "isSelected") & 1) != 0)
      {
        v7 = v9;
LABEL_11:
        objc_msgSend(v7, "name");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        hearingLocString();
        v11 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_14;
    case 21:
      hearingLocString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredInputEar");
      inputOptionFromHearingEar();
      hearingInputRouteStringForOption();
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v8 = (void *)v11;

      break;
    default:
      v8 = 0;
      v6 = 0;
      v5 = 0;
      v4 = 0;
      break;
  }
  v16 = v4;
  v17 = v5;
  v18 = v6;
  v12 = v8;
  v13 = v6;
  v14 = v5;
  v15 = v4;
  AXPerformBlockOnMainThread();

}

uint64_t __32__HUICCMenuTextView_updateValue__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", *(_QWORD *)(a1 + 64));

  objc_msgSend(*(id *)(a1 + 32), "setIsSubModule:", objc_msgSend(*(id *)(a1 + 32), "_updateIsSubModule"));
  return objc_msgSend(*(id *)(a1 + 32), "setIsLargeText:", HUICCLargeTextEnabled());
}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[HUICCMenuTextView _showMenuViewController](self, "_showMenuViewController");
}

- (void)_showMenuViewController
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  HACCMenuModuleViewController *v10;

  -[HUICCMenuTextView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HUICCMenuTextView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19B20]), "initWithAnchoringViewController:", v5);
    -[HUICCMenuTextView setDetailTransitioningDelegate:](self, "setDetailTransitioningDelegate:", v6);

  }
  v10 = objc_alloc_init(HACCMenuModuleViewController);
  -[HUICCMenuTextView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCMenuModuleViewController setDelegate:](v10, "setDelegate:", v7);

  -[CCUIButtonModuleViewController setExpanded:](v10, "setExpanded:", 1);
  -[CCUIMenuModuleViewController setShouldProvideOwnPlatter:](v10, "setShouldProvideOwnPlatter:", 1);
  -[CCUIMenuModuleViewController setIndentation:](v10, "setIndentation:", 1);
  -[CCUIMenuModuleViewController setUseTrailingCheckmarkLayout:](v10, "setUseTrailingCheckmarkLayout:", 1);
  -[HACCMenuModuleViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 4);
  -[HACCMenuModuleViewController setTransitioningDelegate:](v10, "setTransitioningDelegate:", self->_detailTransitioningDelegate);
  -[HUICCMenuTextView _updateMenuItemsForViewController:](self, "_updateMenuItemsForViewController:", v10);
  -[HUICCMenuTextView presentVCBlock](self, "presentVCBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUICCMenuTextView presentVCBlock](self, "presentVCBlock");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, HACCMenuModuleViewController *))v9)[2](v9, v10);

  }
}

- (void)_updateMenuItemsForViewController:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  int v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id location;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HUICCMenuTextView delegate](self, "delegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "currentHearingDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUICCMenuTextView module](self, "module");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  switch(v6)
  {
    case 0xFuLL:
      objc_msgSend(v5, "leftSelectedProgram");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v64 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = (void *)MEMORY[0x24BDBD1A8];
      }
      hearingLocString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leftPrograms");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "indexesOfObjectsPassingTest:", &__block_literal_global_2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "leftPrograms");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectsAtIndexes:", v24);
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 0x10uLL:
      objc_msgSend(v5, "rightSelectedProgram");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v63 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = (void *)MEMORY[0x24BDBD1A8];
      }
      hearingLocString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rightPrograms");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "indexesOfObjectsPassingTest:", &__block_literal_global_129);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "rightPrograms");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectsAtIndexes:", v24);
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 0x11uLL:
      objc_msgSend(v5, "selectedPrograms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v62 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = (void *)MEMORY[0x24BDBD1A8];
      }
      hearingLocString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "combinedPrograms");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "indexesOfObjectsPassingTest:", &__block_literal_global_130);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "combinedPrograms");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectsAtIndexes:", v24);
      v32 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 0x12uLL:
      objc_msgSend(v5, "leftSelectedStreamingProgram");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v61 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = (void *)MEMORY[0x24BDBD1A8];
      }
      hearingLocString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leftPrograms");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "indexesOfObjectsPassingTest:", &__block_literal_global_131);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "leftPrograms");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectsAtIndexes:", v24);
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_22:
      v11 = (void *)v26;
      v12 = 2;
      goto LABEL_31;
    case 0x13uLL:
      objc_msgSend(v5, "rightSelectedStreamingProgram");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v60 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = (void *)MEMORY[0x24BDBD1A8];
      }
      hearingLocString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rightPrograms");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "indexesOfObjectsPassingTest:", &__block_literal_global_132);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "rightPrograms");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectsAtIndexes:", v24);
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v11 = (void *)v28;
      v12 = 4;
      goto LABEL_31;
    case 0x14uLL:
      objc_msgSend(v5, "rightSelectedStreamingProgram");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v59 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = (void *)MEMORY[0x24BDBD1A8];
      }
      hearingLocString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "combinedPrograms");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "indexesOfObjectsPassingTest:", &__block_literal_global_133);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "combinedPrograms");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectsAtIndexes:", v24);
      v32 = objc_claimAutoreleasedReturnValue();
LABEL_30:
      v11 = (void *)v32;
      v12 = 6;
LABEL_31:

      goto LABEL_32;
    case 0x15uLL:
      hearingLocString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", &unk_24DD6AF60);
      hearingInputRouteStringForOption();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v19);

      objc_msgSend(v11, "addObject:", &unk_24DD6AF78);
      hearingInputRouteStringForOption();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v20);

      objc_initWeak(&location, self);
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke;
      v54[3] = &unk_24DD61510;
      v55 = v8;
      objc_copyWeak(&v57, &location);
      v56 = v40;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v54);
      objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "preferredInputEar");
      inputOptionFromHearingEar();
      hearingInputRouteStringForOption();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v57);
      objc_destroyWeak(&location);
      goto LABEL_34;
    default:
      v11 = 0;
      v36 = 0;
      v37 = 0;
      v12 = 0;
LABEL_32:
      if (objc_msgSend(v11, "count"))
      {
        objc_initWeak(&location, self);
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_7;
        v47[3] = &unk_24DD61640;
        v48 = v7;
        v49 = v5;
        v53 = v12;
        objc_copyWeak(&v52, &location);
        v50 = v40;
        v51 = v8;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v47);

        objc_destroyWeak(&v52);
        objc_destroyWeak(&location);
      }
LABEL_34:

      if (objc_msgSend(v7, "count"))
      {
        v34 = objc_msgSend(v7, "count");
        if (v34 == objc_msgSend(v8, "count"))
        {
          objc_msgSend(v4, "setTitle:", v37);
          v35 = objc_msgSend(v38, "count");
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_9;
          v41[3] = &unk_24DD61258;
          v42 = v8;
          v46 = v35;
          v43 = v38;
          v44 = v36;
          v45 = v39;
          objc_msgSend(v7, "enumerateObjectsUsingBlock:", v41);

        }
      }
      objc_msgSend(v4, "loadViewIfNeeded");
      objc_msgSend(v4, "setMenuItems:", v39);

      return;
  }
}

void __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_2;
  v7[3] = &unk_24DD614E8;
  v5 = v3;
  v8 = v5;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v9 = *(id *)(a1 + 40);
  v6 = (void *)MEMORY[0x22074CEE8](v7);
  objc_msgSend(v4, "addObject:", v6);

  objc_destroyWeak(&v10);
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_2(id *a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "unsignedIntValue");
  objc_msgSend(v2, "setPreferredInputEar:", hearingEarFromInputOption());

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_updatePresentedMenuViewControllerIfNecessary");

  return objc_msgSend(a1[5], "updateViewForProperties:", &unk_24DD6B338);
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_126(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMixingStream") ^ 1;
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_2_128(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMixingStream") ^ 1;
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMixingStream") ^ 1;
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMixingStream");
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMixingStream");
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMixingStream");
}

void __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_8;
  v10[3] = &unk_24DD61618;
  v6 = v3;
  v11 = v6;
  v12 = *(id *)(a1 + 40);
  v15 = *(_DWORD *)(a1 + 72);
  objc_copyWeak(&v14, (id *)(a1 + 64));
  v13 = *(id *)(a1 + 48);
  v7 = (void *)MEMORY[0x22074CEE8](v10);
  v8 = *(void **)(a1 + 56);
  v9 = (void *)MEMORY[0x22074CEE8]();
  objc_msgSend(v8, "addObject:", v9);

  objc_destroyWeak(&v14);
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setIsSelected:", objc_msgSend(*(id *)(a1 + 32), "isSelected") ^ 1);
  objc_msgSend(*(id *)(a1 + 40), "selectProgram:forEar:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updatePresentedMenuViewControllerIfNecessary");

  return objc_msgSend(*(id *)(a1 + 48), "updateView");
}

void __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_9(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  unint64_t v14;

  v5 = a2;
  v6 = objc_alloc(MEMORY[0x24BE19B60]);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_10;
  v12 = &unk_24DD61230;
  v13 = *(id *)(a1 + 32);
  v14 = a3;
  v7 = (void *)objc_msgSend(v6, "initWithTitle:identifier:handler:", v5, v5, &v9);
  if (*(_QWORD *)(a1 + 64) > a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3, v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitle:", v8);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v5, v9, v10, v11, v12))
    objc_msgSend(v7, "setSelected:", 1);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);

}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);

  return 0;
}

- (void)_updatePresentedMenuViewControllerIfNecessary
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;

  -[HUICCMenuTextView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HUICCMenuTextView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expandedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HUICCMenuTextView _updateMenuItemsForViewController:](self, "_updateMenuItemsForViewController:", v6);

  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[HUICCMenuTextView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[HUICCMenuTextView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[HUICCMenuTextView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityHint
{
  return (id)hearingLocString();
}

- (HACCContentModuleDelegate)delegate
{
  return (HACCContentModuleDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (id)presentVCBlock
{
  return self->_presentVCBlock;
}

- (void)setPresentVCBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (HACCStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (HACCCapsuleTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (_HUIDarkTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (BOOL)isSubModule
{
  return self->_isSubModule;
}

- (BOOL)isLargeText
{
  return self->_isLargeText;
}

- (NSLayoutConstraint)titleViewHeightLayout
{
  return self->_titleViewHeightLayout;
}

- (void)setTitleViewHeightLayout:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewHeightLayout, a3);
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (CCUIContentModuleDetailTransitioningDelegate)detailTransitioningDelegate
{
  return self->_detailTransitioningDelegate;
}

- (void)setDetailTransitioningDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_titleViewHeightLayout, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong(&self->_presentVCBlock, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
