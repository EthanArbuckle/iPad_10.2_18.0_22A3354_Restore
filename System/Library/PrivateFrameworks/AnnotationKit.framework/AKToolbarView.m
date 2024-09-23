@implementation AKToolbarView

- (AKToolbarView)initWithFrame:(CGRect)a3
{
  AKToolbarView *v3;
  AKToolbarView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AKToolbarBackgroundView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  AKToolbarBackgroundView *backgroundView;
  _AKNonMinibarToolbar *v17;
  UIToolbar *toolbar;
  void *v19;
  UIToolbar *v20;
  id v21;
  UIToolbar *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  UIBarButtonItem *undoButton;
  void *v28;
  void *v29;
  uint64_t v30;
  UIBarButtonItem *undoRedoFixedSpace;
  _BOOL4 v32;
  double v33;
  id v34;
  void *v35;
  uint64_t v36;
  UIBarButtonItem *redoButton;
  uint64_t v38;
  UIBarButtonItem *shareButton;
  id v40;
  void *v41;
  uint64_t v42;
  UIBarButtonItem *shapesPickerButton;
  uint64_t v44;
  UIBarButtonItem *attributesAddShapeFixedSpace;
  _BOOL4 v46;
  double v47;
  id v48;
  void *v49;
  uint64_t v50;
  UIBarButtonItem *attributesPickerBarButton;
  uint64_t v52;
  AKAttributesPickerButton *attributesPickerButton;
  AKAttributesPickerButton *v54;
  id v55;
  void *v56;
  uint64_t v57;
  NSLayoutConstraint *attributesPickerButtonWidthConstraint;
  void *v59;
  uint64_t v60;
  NSLayoutConstraint *attributesPickerButtonHeigthConstraint;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  uint64_t v73;
  NSLayoutConstraint *toolbarBottomConstraint;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  NSLayoutConstraint *heightConstraint;
  double v80;
  void *v82;
  objc_super v83;
  _QWORD v84[3];
  _QWORD v85[2];
  _QWORD v86[2];

  v86[1] = *MEMORY[0x24BDAC8D0];
  v83.receiver = self;
  v83.super_class = (Class)AKToolbarView;
  v3 = -[AKToolbarView initWithFrame:](&v83, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_undoRedoButtonsHidden = 0;
    v3->_alwaysShowUndoButton = 0;
    v3->_shareButtonHidden = 0;
    v3->_showAttributePicker = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__undoManagerNotification_, *MEMORY[0x24BDD13B8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__undoManagerNotification_, *MEMORY[0x24BDD13B0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__undoManagerNotification_, *MEMORY[0x24BDD13C0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel__annotationSelectionNotification_, off_255A25E08[0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__textEffectsWindowIsHosted_, *MEMORY[0x24BDF7F50], 0);

    v10 = [AKToolbarBackgroundView alloc];
    v11 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v15 = -[AKToolbarBackgroundView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x24BDBF090], v12, v13, v14);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (AKToolbarBackgroundView *)v15;

    -[AKToolbarBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v4->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = -[_AKNonMinibarToolbar initWithFrame:]([_AKNonMinibarToolbar alloc], "initWithFrame:", v11, v12, v13, v14);
    toolbar = v4->_toolbar;
    v4->_toolbar = &v17->super;

    -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](v4->_toolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIToolbar setOpaque:](v4->_toolbar, "setOpaque:", 0);
    -[UIToolbar setTranslucent:](v4->_toolbar, "setTranslucent:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIToolbar setBackgroundColor:](v4->_toolbar, "setBackgroundColor:", v19);

    v20 = v4->_toolbar;
    v21 = objc_alloc_init(MEMORY[0x24BDF6AC8]);
    -[UIToolbar setBackgroundImage:forToolbarPosition:barMetrics:](v20, "setBackgroundImage:forToolbarPosition:barMetrics:", v21, 0, 0);

    v22 = v4->_toolbar;
    v23 = objc_alloc_init(MEMORY[0x24BDF6AC8]);
    -[UIToolbar setShadowImage:forToolbarPosition:](v22, "setShadowImage:forToolbarPosition:", v23, 0);

    v24 = objc_alloc(MEMORY[0x24BDF6860]);
    +[AKToolbarView undoButtonImage](AKToolbarView, "undoButtonImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "initWithImage:style:target:action:", v25, 0, v4, sel__undo_);
    undoButton = v4->_undoButton;
    v4->_undoButton = (UIBarButtonItem *)v26;

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v4, sel__undoLongPress_);
    v86[0] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem _setGestureRecognizers:](v4->_undoButton, "_setGestureRecognizers:", v29);

    v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    undoRedoFixedSpace = v4->_undoRedoFixedSpace;
    v4->_undoRedoFixedSpace = (UIBarButtonItem *)v30;

    v32 = sub_228FDE55C();
    v33 = 10.0;
    if (v32)
      v33 = 19.0;
    -[UIBarButtonItem setWidth:](v4->_undoRedoFixedSpace, "setWidth:", v33);
    v34 = objc_alloc(MEMORY[0x24BDF6860]);
    +[AKToolbarView redoButtonImage](AKToolbarView, "redoButtonImage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "initWithImage:style:target:action:", v35, 0, v4, sel__redo_);
    redoButton = v4->_redoButton;
    v4->_redoButton = (UIBarButtonItem *)v36;

    v38 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 9, 0, 0);
    shareButton = v4->_shareButton;
    v4->_shareButton = (UIBarButtonItem *)v38;

    v40 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "akImageNamed:", CFSTR("AKModern_Add"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "initWithImage:style:target:action:", v41, 0, v4, sel__showShapesPicker_);
    shapesPickerButton = v4->_shapesPickerButton;
    v4->_shapesPickerButton = (UIBarButtonItem *)v42;

    v44 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    attributesAddShapeFixedSpace = v4->_attributesAddShapeFixedSpace;
    v4->_attributesAddShapeFixedSpace = (UIBarButtonItem *)v44;

    v46 = sub_228FDE55C();
    v47 = 37.0;
    if (!v46)
      v47 = 0.0;
    -[UIBarButtonItem setWidth:](v4->_attributesAddShapeFixedSpace, "setWidth:", v47);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("textformat.size"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "akImageNamed:", CFSTR("AKModern_TextAttributes"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "initWithImage:style:target:action:", v49, 0, v4, sel__showTextAttributes_);
    attributesPickerBarButton = v4->_attributesPickerBarButton;
    v4->_attributesPickerBarButton = (UIBarButtonItem *)v50;

    +[AKAttributesPickerButton buttonWithType:](AKAttributesPickerButton, "buttonWithType:", 0);
    v52 = objc_claimAutoreleasedReturnValue();
    attributesPickerButton = v4->_attributesPickerButton;
    v4->_attributesPickerButton = (AKAttributesPickerButton *)v52;

    -[AKAttributesPickerButton addTarget:action:forControlEvents:](v4->_attributesPickerButton, "addTarget:action:forControlEvents:", v4, sel__showTextAttributes_, 64);
    -[AKAttributesPickerButton setImage:forState:](v4->_attributesPickerButton, "setImage:forState:", v82, 0);
    v54 = v4->_attributesPickerButton;
    v55 = objc_alloc_init(MEMORY[0x24BDF6B70]);
    -[AKAttributesPickerButton addInteraction:](v54, "addInteraction:", v55);

    -[AKAttributesPickerButton setShowsLargeContentViewer:](v4->_attributesPickerButton, "setShowsLargeContentViewer:", 1);
    -[AKAttributesPickerButton widthAnchor](v4->_attributesPickerButton, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToConstant:", 36.0);
    v57 = objc_claimAutoreleasedReturnValue();
    attributesPickerButtonWidthConstraint = v4->_attributesPickerButtonWidthConstraint;
    v4->_attributesPickerButtonWidthConstraint = (NSLayoutConstraint *)v57;

    -[AKAttributesPickerButton heightAnchor](v4->_attributesPickerButton, "heightAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToConstant:", 36.0);
    v60 = objc_claimAutoreleasedReturnValue();
    attributesPickerButtonHeigthConstraint = v4->_attributesPickerButtonHeigthConstraint;
    v4->_attributesPickerButtonHeigthConstraint = (NSLayoutConstraint *)v60;

    v62 = (void *)MEMORY[0x24BDD1628];
    v85[0] = v4->_attributesPickerButtonWidthConstraint;
    v85[1] = v4->_attributesPickerButtonHeigthConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "activateConstraints:", v63);

    -[UIView ak_addSubview:withEdgeInsets:](v4, "ak_addSubview:withEdgeInsets:", v4->_backgroundView, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[AKToolbarView addSubview:](v4, "addSubview:", v4->_toolbar);
    -[UIToolbar leftAnchor](v4->_toolbar, "leftAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView leftAnchor](v4, "leftAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIToolbar rightAnchor](v4->_toolbar, "rightAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView rightAnchor](v4, "rightAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIToolbar bottomAnchor](v4->_toolbar, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView bottomAnchor](v4, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView _safeAreaInsetsWithCachingIfNeeded](v4, "_safeAreaInsetsWithCachingIfNeeded");
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, -(v72 + 13.0));
    v73 = objc_claimAutoreleasedReturnValue();
    toolbarBottomConstraint = v4->_toolbarBottomConstraint;
    v4->_toolbarBottomConstraint = (NSLayoutConstraint *)v73;

    v75 = (void *)MEMORY[0x24BDD1628];
    v84[0] = v66;
    v84[1] = v69;
    v84[2] = v4->_toolbarBottomConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 3);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "activateConstraints:", v76);

    -[AKToolbarView heightAnchor](v4, "heightAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToConstant:", 0.0);
    v78 = objc_claimAutoreleasedReturnValue();
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v78;

    LODWORD(v80) = 1144750080;
    -[NSLayoutConstraint setPriority:](v4->_heightConstraint, "setPriority:", v80);
    -[NSLayoutConstraint setActive:](v4->_heightConstraint, "setActive:", 1);
    -[UIBarButtonItem setAccessibilityIdentifier:](v4->_undoButton, "setAccessibilityIdentifier:", CFSTR("undo-button"));
    -[UIBarButtonItem setAccessibilityIdentifier:](v4->_redoButton, "setAccessibilityIdentifier:", CFSTR("redo-button"));
    -[UIBarButtonItem setAccessibilityIdentifier:](v4->_shareButton, "setAccessibilityIdentifier:", CFSTR("share-button"));
    -[UIBarButtonItem setAccessibilityIdentifier:](v4->_shapesPickerButton, "setAccessibilityIdentifier:", CFSTR("shapes-picker-button"));
    -[UIBarButtonItem setAccessibilityIdentifier:](v4->_attributesPickerBarButton, "setAccessibilityIdentifier:", CFSTR("attributes-picker-button"));
    -[AKAttributesPickerButton setAccessibilityIdentifier:](v4->_attributesPickerButton, "setAccessibilityIdentifier:", CFSTR("attributes-picker-button"));

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AKToolbarView;
  -[AKToolbarView dealloc](&v4, sel_dealloc);
}

- (BOOL)useNewFullscreenPalette
{
  return 1;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKToolbarView;
  -[AKToolbarView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[AKToolbarView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (sub_228FE4550() & 1) != 0 || (_UIApplicationIsExtension() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

    if ((v6 & 1) == 0)
      -[AKToolbarView _setupPaletteViewIfNecessary](self, "_setupPaletteViewIfNecessary");
  }
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKToolbarView;
  -[AKToolbarView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3 && (_UIApplicationIsExtension() & 1) == 0)
    -[AKToolbarView _forceToolPickerVisibleForViewStateChange:](self, "_forceToolPickerVisibleForViewStateChange:", 0);
}

- (void)hideModernToolbarView
{
  -[AKToolbarBackgroundView setHidden:](self->_backgroundView, "setHidden:", 1);
  -[UIToolbar setHidden:](self->_toolbar, "setHidden:", 1);
}

- (id)_paletteView
{
  void *v2;
  void *v3;

  -[AKToolbarView toolPicker](self, "toolPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PKToolPicker)toolPicker
{
  PKToolPicker *toolPicker;
  PKToolPicker *v4;
  PKToolPicker *v5;

  toolPicker = self->_toolPicker;
  if (!toolPicker)
  {
    v4 = (PKToolPicker *)objc_alloc_init(MEMORY[0x24BDE33F8]);
    v5 = self->_toolPicker;
    self->_toolPicker = v4;

    -[PKToolPicker setStateAutosaveName:](self->_toolPicker, "setStateAutosaveName:", CFSTR("com.apple.AnnotationKit"));
    -[PKToolPicker _setShowsHandwritingTool:](self->_toolPicker, "_setShowsHandwritingTool:", 0);
    -[PKToolPicker addObserver:](self->_toolPicker, "addObserver:", self);
    -[PKToolPicker setColorUserInterfaceStyle:](self->_toolPicker, "setColorUserInterfaceStyle:", 1);
    -[PKToolPicker setVisible:forFirstResponder:](self->_toolPicker, "setVisible:forFirstResponder:", 1, self);
    toolPicker = self->_toolPicker;
  }
  return toolPicker;
}

- (BOOL)isToolPickerVisible
{
  PKToolPicker *toolPicker;

  toolPicker = self->_toolPicker;
  if (toolPicker)
    LOBYTE(toolPicker) = -[PKToolPicker isVisible](toolPicker, "isVisible");
  return (char)toolPicker;
}

- (id)_toolPickerPopoverConfiguration
{
  return (id)MEMORY[0x24BEDD108](self->_toolPicker, sel__popoverPresentationConfiguration);
}

- (void)_setupPaletteViewIfNecessary
{
  void *v3;
  _BOOL4 didSetupToolPicker;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[AKToolbarView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    didSetupToolPicker = self->_didSetupToolPicker;

    if (!didSetupToolPicker)
    {
      self->_didSetupToolPicker = 1;
      -[AKToolbarView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AKLog(CFSTR("Did successfully set up palette for window: %@"));

      -[AKToolbarView hideModernToolbarView](self, "hideModernToolbarView");
      -[AKToolbarView popoverPresentingController](self, "popoverPresentingController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9
        || (-[AKToolbarView toolPicker](self, "toolPicker"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v5, "_presentationController"),
            v6 = (id)objc_claimAutoreleasedReturnValue(),
            v6,
            v5,
            v9 != v6))
      {
        -[AKToolbarView toolPicker](self, "toolPicker");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setPresentationController:", v9);

      }
      -[AKToolbarView _updatePalette](self, "_updatePalette");

    }
  }
}

- (void)_forceToolPickerVisibleForViewStateChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  AKToolbarView *v6;
  AKToolbarView *v7;
  void *v8;
  AKToolbarView *v9;
  AKToolbarView *v10;

  v3 = a3;
  -[AKToolbarView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstResponder");
  v6 = (AKToolbarView *)objc_claimAutoreleasedReturnValue();

  -[AKToolbarView becomeFirstResponder](self, "becomeFirstResponder");
  if (v6)
  {
    v7 = self;
    if (v6 != self)
    {
      -[AKToolbarView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstResponder");
      v9 = (AKToolbarView *)objc_claimAutoreleasedReturnValue();

      v7 = v9;
    }
  }
  else
  {
    v7 = self;
  }
  v10 = v7;
  -[AKToolbarView _setToolPickerVisible:forResponder:](self, "_setToolPickerVisible:forResponder:", v3, v7);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_setToolPickerVisible:(BOOL)a3 forResponder:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    -[AKToolbarView _setupPaletteViewIfNecessary](self, "_setupPaletteViewIfNecessary");
    -[AKToolbarView updateCurrentOverlaysToolPickerVisibility](self, "updateCurrentOverlaysToolPickerVisibility");
  }
  -[AKToolbarView toolPicker](self, "toolPicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isVisible");

  -[AKToolbarView toolPicker](self, "toolPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVisible:forFirstResponder:", v4, v6);

  -[AKToolbarView _setCurrentOverlaysToolPickerVisible:](self, "_setCurrentOverlaysToolPickerVisible:", v4);
  if (v4)
  {
    -[AKToolbarView _paletteView](self, "_paletteView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = v8;
    else
      v11 = 0;

    if (v11 == 1)
    {
      -[AKToolbarView toolPicker](self, "toolPicker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectedTool");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ink");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolbarView _updateAttributeControllerInk:](self, "_updateAttributeControllerInk:", v14);

    }
  }

  return 1;
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKToolbarView;
  -[AKToolbarView setHidden:](&v4, sel_setHidden_, a3);
  -[AKToolbarView _updatePalette](self, "_updatePalette");
}

- (void)setAlpha:(double)a3
{
  double v5;
  double v6;
  objc_super v7;

  -[AKToolbarView alpha](self, "alpha");
  v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)AKToolbarView;
  -[AKToolbarView setAlpha:](&v7, sel_setAlpha_, a3);
  if (v6 != a3)
    -[AKToolbarView _updatePalette](self, "_updatePalette");
}

- (void)_updateAttributeControllerInk:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  AKMinimalInkChooserUserInterfaceItem *v8;
  id v9;

  v9 = a3;
  -[AKToolbarView annotationController](self, "annotationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalInkChooserUserInterfaceItem alloc], "initWithTag:", 765300);
    -[AKMinimalInkChooserUserInterfaceItem setInk:](v8, "setInk:", v9);
    objc_msgSend(v4, "performActionForSender:", v8);

  }
}

- (BOOL)shouldHide
{
  double v3;

  if ((-[AKToolbarView isHidden](self, "isHidden") & 1) != 0)
    return 1;
  -[AKToolbarView alpha](self, "alpha");
  return v3 < 1.0 || -[AKToolbarView contentsHidden](self, "contentsHidden");
}

- (void)endAnnotationEditing
{
  void *v2;
  id v3;

  -[AKToolbarView annotationController](self, "annotationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "annotationEditingDidEndWithCompletion:", 0);

}

- (void)forceHideRuler
{
  void *v2;
  id v3;

  -[AKToolbarView annotationController](self, "annotationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceHideRuler");

}

- (void)_updatePalette
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  AKToolbarView *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (-[AKToolbarView shouldHide](self, "shouldHide"))
  {
    -[AKToolbarView toolPicker](self, "toolPicker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRulerActive:", 0);

    v4 = os_log_create("com.apple.annotationkit", "AKToolbarView");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_228FC0000, v4, OS_LOG_TYPE_DEFAULT, "AKToolbarView did force hide tool picker due to hidden, alpha, or contentsHidden %@", buf, 0xCu);
    }

    -[AKToolbarView annotationController](self, "annotationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "attributeController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = sub_228FDF08C;
      v18[3] = &unk_24F1A7328;
      v18[4] = self;
      objc_msgSend(v7, "annotationEditingDidEndWithCompletion:", v18);

    }
    else
    {
      -[AKToolbarView toolPicker](self, "toolPicker");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isVisible");

      if (v12)
        -[AKToolbarView _forceToolPickerVisibleForViewStateChange:](self, "_forceToolPickerVisibleForViewStateChange:", 0);
    }

  }
  else
  {
    -[AKToolbarView _setupPaletteViewIfNecessary](self, "_setupPaletteViewIfNecessary");
    -[AKToolbarView updateCurrentOverlaysToolPickerVisibility](self, "updateCurrentOverlaysToolPickerVisibility");
    -[AKToolbarView toolPicker](self, "toolPicker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isVisible");

    if ((v9 & 1) == 0)
    {
      v10 = os_log_create("com.apple.annotationkit", "AKToolbarView");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = self;
        _os_log_impl(&dword_228FC0000, v10, OS_LOG_TYPE_DEFAULT, "ToolPicker: AKToolbarView did force show tool picker due to hidden, alpha, or contentsHidden %@", buf, 0xCu);
      }

      -[AKToolbarView _forceToolPickerVisibleForViewStateChange:](self, "_forceToolPickerVisibleForViewStateChange:", 1);
    }
  }
  -[AKToolbarView toolPicker](self, "toolPicker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setShowsPlusButton:", 1);

  -[AKToolbarView toolPicker](self, "toolPicker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setAnnotationDelegate:", self);

  -[AKToolbarView toolPicker](self, "toolPicker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "set_delegate:", self);

  v16 = os_log_create("com.apple.annotationkit", "AKToolbarView");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[AKToolbarView toolPicker](self, "toolPicker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_228FC0000, v16, OS_LOG_TYPE_DEFAULT, "ToolPicker: AKToolbarView did set annotationDelegate to %@ for toolpicker %@", buf, 0x16u);

  }
  -[AKToolbarView _updatePaletteUI](self, "_updatePaletteUI");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[AKToolbarView toolPicker](self, "toolPicker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_paletteHostView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  v11 = v10;
  v13 = v12;

  -[AKToolbarView toolPicker](self, "toolPicker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_paletteHostView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v15, "pointInside:withEvent:", v7, v11, v13);

  return (char)v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[AKToolbarView contentsHidden](self, "contentsHidden"))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AKToolbarView;
    -[AKToolbarView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)setAnnotationController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AKMinimalColorChooserUserInterfaceItem *v10;
  void *v11;
  uint64_t v12;
  AKMinimalUserInterfaceItem *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_annotationController);
  v17 = v4;
  objc_storeWeak((id *)&self->_annotationController, v17);
  objc_msgSend(WeakRetained, "setModernToolbarView:", 0);
  objc_msgSend(v17, "setModernToolbarView:", self);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "toolController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "toolMode");

    objc_msgSend(WeakRetained, "attributeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "strokeColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalColorChooserUserInterfaceItem alloc], "initWithTag:", 765101);
    -[AKMinimalColorChooserUserInterfaceItem setColor:](v10, "setColor:", v9);
    objc_msgSend(v17, "performActionForSender:", v10);
    objc_msgSend(v17, "toolController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "toolMode");

    if (v7 != v12)
    {
      if (v7 == 4)
      {
        v13 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalUserInterfaceItem alloc], "initWithTag:", 764017);
        objc_msgSend(v17, "performActionForSender:", v13);
      }
      else
      {
        objc_msgSend(v17, "toolController");
        v13 = (AKMinimalUserInterfaceItem *)objc_claimAutoreleasedReturnValue();
        -[AKMinimalUserInterfaceItem resetToDefaultMode](v13, "resetToDefaultMode");
      }

    }
  }
  else
  {
    objc_msgSend(v17, "attributeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDefaultInk");
  }

  -[AKToolbarView toolPicker](self, "toolPicker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectedTool");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ink");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarView _updateAttributeControllerInk:](self, "_updateAttributeControllerInk:", v16);

  -[AKToolbarView updateCurrentOverlaysToolPickerVisibility](self, "updateCurrentOverlaysToolPickerVisibility");
  -[AKToolbarView revalidateItems](self, "revalidateItems");

}

- (void)updateCurrentOverlaysToolPickerVisibility
{
  id v3;

  -[AKToolbarView toolPicker](self, "toolPicker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AKToolbarView _setCurrentOverlaysToolPickerVisible:](self, "_setCurrentOverlaysToolPickerVisible:", objc_msgSend(v3, "isVisible"));

}

- (void)_setCurrentOverlaysToolPickerVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_annotationController);
  objc_msgSend(WeakRetained, "currentPageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarView toolPicker](self, "toolPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateOverlayVisibilityWithToolPicker:visible:", v6, v3);

  v7 = objc_msgSend(WeakRetained, "currentPageIndex") + 1;
  objc_msgSend(WeakRetained, "pageControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 < v9)
  {
    objc_msgSend(WeakRetained, "pageControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(WeakRetained, "currentPageIndex") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKToolbarView toolPicker](self, "toolPicker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_updateOverlayVisibilityWithToolPicker:visible:", v12, v3);

  }
}

- (CGSize)intrinsicContentSize
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[AKToolbarView shouldUseCompactWidth](self, "shouldUseCompactWidth");
  v3 = *MEMORY[0x24BDF7FB8];
  v4 = 75.0;
  if (!v2)
    v4 = *MEMORY[0x24BDF7FB8];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  if (-[AKToolbarView shouldUseCompactWidth](self, "shouldUseCompactWidth", a3.width, a3.height))
    v5 = 75.0;
  else
    v5 = 0.0;
  -[AKToolbarView _safeAreaInsetsWithCachingIfNeeded](self, "_safeAreaInsetsWithCachingIfNeeded");
  v7 = v5 + v6;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (unint64_t)layoutForSize:(CGSize)a3
{
  return -[AKToolbarView shouldUseCompactWidth](self, "shouldUseCompactWidth", a3.width, a3.height);
}

- (void)setWantsClearBackgroundColorInCompactSize:(BOOL)a3
{
  if (self->_wantsClearBackgroundColorInCompactSize != a3)
  {
    self->_wantsClearBackgroundColorInCompactSize = a3;
    -[AKToolbarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIBarButtonItem *v7;
  void *v8;
  UIBarButtonItem *undoRedoFixedSpace;
  UIBarButtonItem *attributesAddShapeFixedSpace;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  UIBarButtonItem *attributesPickerBarButton;
  UIBarButtonItem *shapesPickerButton;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  AKAttributesPickerButton **p_attributesPickerButton;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[5];
  _QWORD v38[7];
  _QWORD v39[4];
  _QWORD v40[4];

  v40[3] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)AKToolbarView;
  -[AKToolbarView layoutSubviews](&v36, sel_layoutSubviews);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  if (!-[AKToolbarView shouldUseCompactWidth](self, "shouldUseCompactWidth"))
  {
    undoRedoFixedSpace = self->_undoRedoFixedSpace;
    if (self->_showAttributePicker)
    {
      v38[0] = self->_undoButton;
      v38[1] = undoRedoFixedSpace;
      v38[2] = self->_redoButton;
      v38[3] = v3;
      attributesAddShapeFixedSpace = self->_attributesAddShapeFixedSpace;
      v38[4] = self->_attributesPickerBarButton;
      v38[5] = attributesAddShapeFixedSpace;
      v38[6] = self->_shapesPickerButton;
      v11 = (void *)MEMORY[0x24BDBCE30];
      v12 = v38;
      v13 = 7;
    }
    else
    {
      v37[0] = self->_undoButton;
      v37[1] = undoRedoFixedSpace;
      v37[2] = self->_redoButton;
      v37[3] = v3;
      v37[4] = self->_shapesPickerButton;
      v11 = (void *)MEMORY[0x24BDBCE30];
      v12 = v37;
      v13 = 5;
    }
    objc_msgSend(v11, "arrayWithObjects:count:", v12, v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 13.0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  if (v6 == 2)
  {
    v7 = self->_undoRedoFixedSpace;
    v40[0] = self->_undoButton;
    v40[1] = v7;
    v40[2] = self->_redoButton;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

    goto LABEL_12;
  }
  if (self->_alwaysShowUndoButton)
  {
    v14 = 432;
LABEL_8:
    objc_msgSend(v4, "addObject:", *(Class *)((char *)&self->super.super.super.isa + v14));
    goto LABEL_12;
  }
  if (!self->_shareButtonHidden)
  {
    v14 = 448;
    goto LABEL_8;
  }
LABEL_12:
  objc_msgSend(v4, "addObject:", v3);
  if (self->_showAttributePicker)
  {
    attributesPickerBarButton = self->_attributesPickerBarButton;
    v39[0] = v3;
    v39[1] = attributesPickerBarButton;
    shapesPickerButton = self->_shapesPickerButton;
    v39[2] = v3;
    v39[3] = shapesPickerButton;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v18);

  }
  else
  {
    objc_msgSend(v4, "addObject:", self->_shapesPickerButton);
  }
  -[AKToolbarView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "horizontalSizeClass");

  v15 = 0.0;
  if (v20 == 2)
    NSLog(CFSTR("Ok, show the undo/redo buttons in the bottom bar"));
LABEL_17:
  if (self->_shareButtonHidden)
  {
    v21 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v21, "removeObject:", self->_shareButton);

    v4 = v21;
  }
  if (self->_undoRedoButtonsHidden && !self->_alwaysShowUndoButton)
  {
    v22 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v22, "removeObject:", self->_undoButton);
    objc_msgSend(v22, "removeObject:", self->_undoRedoFixedSpace);
    objc_msgSend(v22, "removeObject:", self->_redoButton);

    v4 = v22;
  }
  -[AKToolbarView _safeAreaInsetsWithCachingIfNeeded](self, "_safeAreaInsetsWithCachingIfNeeded");
  -[NSLayoutConstraint setConstant:](self->_toolbarBottomConstraint, "setConstant:", -(v15 + v23));
  -[UIToolbar setItems:animated:](self->_toolbar, "setItems:animated:", v4, 0);
  -[UIToolbar layoutIfNeeded](self->_toolbar, "layoutIfNeeded");
  if (-[AKToolbarView shouldUseCompactWidth](self, "shouldUseCompactWidth"))
    v24 = 75.0;
  else
    v24 = 0.0;
  -[AKToolbarView _safeAreaInsetsWithCachingIfNeeded](self, "_safeAreaInsetsWithCachingIfNeeded");
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v24 + v25);
  if (-[AKToolbarView useNewFullscreenPalette](self, "useNewFullscreenPalette"))
  {
    -[AKToolbarView hideModernToolbarView](self, "hideModernToolbarView");
    -[AKToolbarView popoverPresentingController](self, "popoverPresentingController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView toolPicker](self, "toolPicker");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_setPresentationController:", v26);

    v28 = -[AKToolbarView wantsClearBackgroundColorInCompactSize](self, "wantsClearBackgroundColorInCompactSize");
    -[AKToolbarView toolPicker](self, "toolPicker");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_setWantsClearBackgroundColorInCompactSize:", v28);

    -[AKToolbarView traitCollection](self, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "userInterfaceStyle");

    if (v31 == 2)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "systemDarkGrayColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      p_attributesPickerButton = &self->_attributesPickerButton;
      -[AKAttributesPickerButton setBackgroundColor:](self->_attributesPickerButton, "setBackgroundColor:", v32);

      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "systemLightGrayColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      p_attributesPickerButton = &self->_attributesPickerButton;
      -[AKAttributesPickerButton setBackgroundColor:](self->_attributesPickerButton, "setBackgroundColor:", v34);

      objc_msgSend(MEMORY[0x24BDF6950], "systemDarkGrayTintColor");
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAttributesPickerButton setTintColor:](*p_attributesPickerButton, "setTintColor:", v35);

  }
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  objc_super v7;

  if (-[AKToolbarView shouldUseCompactWidth](self, "shouldUseCompactWidth"))
  {
    -[NSLayoutConstraint setConstant:](self->_attributesPickerButtonWidthConstraint, "setConstant:", 28.0);
  }
  else
  {
    -[AKToolbarView _paletteView](self, "_paletteView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paletteScaleFactor");
    -[NSLayoutConstraint setConstant:](self->_attributesPickerButtonWidthConstraint, "setConstant:", v4 * 36.0);

  }
  if (-[AKToolbarView shouldUseCompactWidth](self, "shouldUseCompactWidth"))
  {
    -[NSLayoutConstraint setConstant:](self->_attributesPickerButtonHeigthConstraint, "setConstant:", 28.0);
  }
  else
  {
    -[AKToolbarView _paletteView](self, "_paletteView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paletteScaleFactor");
    -[NSLayoutConstraint setConstant:](self->_attributesPickerButtonHeigthConstraint, "setConstant:", v6 * 36.0);

  }
  v7.receiver = self;
  v7.super_class = (Class)AKToolbarView;
  -[AKToolbarView updateConstraints](&v7, sel_updateConstraints);
}

- (void)_saveCachedSafeAreaInsets
{
  UIEdgeInsets *p_cachedSafeAreaInsets;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  p_cachedSafeAreaInsets = &self->_cachedSafeAreaInsets;
  -[AKToolbarView safeAreaInsets](self, "safeAreaInsets");
  p_cachedSafeAreaInsets->top = v3;
  p_cachedSafeAreaInsets->left = v4;
  p_cachedSafeAreaInsets->bottom = v5;
  p_cachedSafeAreaInsets->right = v6;
}

- (void)_shouldUseCachedSafeAreaInsets:(BOOL)a3
{
  self->_shouldUseCachedSafeAreaInsets = a3;
}

- (UIEdgeInsets)_safeAreaInsetsWithCachingIfNeeded
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if (self->_shouldUseCachedSafeAreaInsets)
  {
    top = self->_cachedSafeAreaInsets.top;
    left = self->_cachedSafeAreaInsets.left;
    bottom = self->_cachedSafeAreaInsets.bottom;
    right = self->_cachedSafeAreaInsets.right;
  }
  else
  {
    -[AKToolbarView safeAreaInsets](self, "safeAreaInsets");
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKToolbarView;
  -[AKToolbarView setBackgroundColor:](&v5, sel_setBackgroundColor_, a3);
  -[AKToolbarView backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarBackgroundView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v4);

}

- (void)setOpaque:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKToolbarView;
  -[AKToolbarView setOpaque:](&v4, sel_setOpaque_, a3);
  -[AKToolbarBackgroundView setOpaque:](self->_backgroundView, "setOpaque:", -[AKToolbarView isOpaque](self, "isOpaque"));
}

- (void)setTranslucent:(BOOL)a3
{
  self->_translucent = a3;
  -[AKToolbarBackgroundView setTranslucent:](self->_backgroundView, "setTranslucent:");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AKToolbarView;
  -[AKToolbarView traitCollectionDidChange:](&v20, sel_traitCollectionDidChange_, v4);
  -[AKToolbarView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[AKToolbarView toolPicker](self, "toolPicker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updatePaletteTraitCollection:", v9);

  }
  -[AKToolbarView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "horizontalSizeClass");
  v12 = objc_msgSend(v4, "horizontalSizeClass");

  if (v11 != v12)
  {
    -[AKToolbarView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[AKToolbarView setNeedsLayout](self, "setNeedsLayout");
  }
  -[AKToolbarView presentedViewController](self, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarView _updateTraitCollectionForViewControllerIfNecessary:](self, "_updateTraitCollectionForViewControllerIfNecessary:", v13);

  -[AKToolbarView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v15)
  {
    -[AKToolbarView presentedViewController](self, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[AKToolbarView presentedViewController](self, "presentedViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "popoverPresentationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "traitCollectionDidChange:", v4);

    }
  }

}

- (BOOL)shouldUseCompactWidth
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AKToolbarView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
  {
    -[AKToolbarView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "horizontalSizeClass") == 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)shouldUseCompactHeight
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[AKToolbarView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  return !v4 || v6 == 1;
}

- (void)setContentsHidden:(BOOL)a3
{
  MEMORY[0x24BEDD108](self, sel_setContentsHidden_animated_);
}

- (void)setContentsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13[2];
  id location;

  if (self->_contentsHidden != a3)
  {
    v5 = a4;
    v6 = a3;
    self->_contentsHidden = a3;
    v7 = (double)!a3;
    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_228FE01A0;
    v12[3] = &unk_24F1A75E0;
    objc_copyWeak(v13, &location);
    v13[1] = *(id *)&v7;
    v9 = MEMORY[0x22E2C12D0](v12);
    v10 = (void *)v9;
    if (v5)
    {
      if (v6)
      {
        -[AKToolbarView _saveCachedSafeAreaInsets](self, "_saveCachedSafeAreaInsets");
        -[AKToolbarView _shouldUseCachedSafeAreaInsets:](self, "_shouldUseCachedSafeAreaInsets:", 1);
      }
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = sub_228FE0200;
      v11[3] = &unk_24F1A7608;
      v11[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v10, v11);
    }
    else
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
  -[AKToolbarView _updatePalette](self, "_updatePalette");
}

- (id)selectedAnnotations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AKToolbarView annotationController](self, "annotationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageModelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "selectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createUndoViewController
{
  return (id)MEMORY[0x24BEDD108](self, sel_createUndoViewControllerWithActionHandler_);
}

- (id)createUndoViewControllerWithActionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v33;
  id v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id location;
  _QWORD v45[4];
  id v46;

  v4 = a3;
  -[AKToolbarView annotationController](self, "annotationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "undoManagerForAnnotationController:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModalPresentationStyle:", 7);
  objc_msgSend(v8, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  objc_msgSend(v8, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPermittedArrowDirections:", 3);

  v11 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = sub_228FE06B0;
  v45[3] = &unk_24F1A7630;
  v12 = v4;
  v46 = v12;
  v13 = (void *)MEMORY[0x22E2C12D0](v45);
  objc_initWeak(&location, self);
  v14 = objc_msgSend(v5, "validateUndo:", 0);
  v15 = 0x24BDF6000;
  if (v14)
  {
    +[AKController akBundle](AKController, "akBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Undo"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "undoActionName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v17, v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v19;
    }
    v20 = (void *)MEMORY[0x24BDF67E8];
    v41[0] = v11;
    v41[1] = 3221225472;
    v41[2] = sub_228FE06C4;
    v41[3] = &unk_24F1A7658;
    objc_copyWeak(&v43, &location);
    v35 = v13;
    v21 = v13;
    v42 = v21;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v17, 0, v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v7;
    objc_msgSend(v8, "addAction:", v22);
    v23 = (void *)MEMORY[0x24BDF67E8];
    +[AKController akBundle](AKController, "akBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Undo All"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = sub_228FE0714;
    v38[3] = &unk_24F1A7658;
    objc_copyWeak(&v40, &location);
    v39 = v21;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v38);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v26);
    v13 = v35;

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v43);

    v7 = v33;
    v12 = v34;
    v11 = MEMORY[0x24BDAC760];
    v15 = 0x24BDF6000uLL;
  }
  v27 = *(void **)(v15 + 2024);
  +[AKController akBundle](AKController, "akBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v11;
  v36[1] = 3221225472;
  v36[2] = sub_228FE0764;
  v36[3] = &unk_24F1A7680;
  v30 = v13;
  v37 = v30;
  objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 1, v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v31);

  objc_destroyWeak(&location);
  return v8;
}

- (void)_updatePaletteUI
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char isKindOfClass;
  char v12;
  int v13;
  char *v14;
  const __CFString *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[AKToolbarView annotationController](self, "annotationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPageController");
  v41 = v3;
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v5;
  objc_msgSend(v5, "selectedAnnotations");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          isKindOfClass = 0;
          v12 = 0;
          v14 = sel__showTextAttributes_;
          v13 = 1;
          v15 = CFSTR("textformat.size");
          goto LABEL_15;
        }
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
        {
          v12 = isKindOfClass ^ 1;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v8)
        continue;
      break;
    }
  }
  isKindOfClass = 0;
  v12 = 0;
LABEL_13:

  v13 = 0;
  v14 = sel__showShapeAttributes_;
  v15 = CFSTR("square.fill.on.circle.fill");
LABEL_15:
  -[AKToolbarView _paletteView](self, "_paletteView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "paletteScaleFactor");
  if (v17 == 1.0)
  {
    if (-[AKToolbarView shouldUseCompactWidth](self, "shouldUseCompactWidth"))
      v18 = 1;
    else
      v18 = -1;
  }
  else
  {
    v18 = 1;
  }

  objc_msgSend(MEMORY[0x24BDF6A70], "defaultFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDF6AE0];
  objc_msgSend(v19, "pointSize");
  objc_msgSend(v20, "configurationWithPointSize:weight:scale:", 7, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", v15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setAction:](self->_attributesPickerBarButton, "setAction:", v14);
  -[UIBarButtonItem setImage:](self->_attributesPickerBarButton, "setImage:", v22);
  self->_showAttributePicker = (v12 | v13) & (objc_msgSend(v6, "count") != 0);
  if (-[AKToolbarView useNewFullscreenPalette](self, "useNewFullscreenPalette") && self->_showAttributePicker)
  {
    if (v13)
      v23 = 10;
    else
      v23 = 1;
    -[AKToolbarView _paletteView](self, "_paletteView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSelectedAnnotationType:", v23);

    objc_msgSend(v42, "inkPageOverlayController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "inkOverlayView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "canvasView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_selectionInteraction");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setEnabled:", 0);
    -[AKAttributesPickerButton removeTarget:action:forControlEvents:](self->_attributesPickerButton, "removeTarget:action:forControlEvents:", self, sel__showTextAttributes_, 64);
    -[AKAttributesPickerButton removeTarget:action:forControlEvents:](self->_attributesPickerButton, "removeTarget:action:forControlEvents:", self, sel__showShapeAttributes_, 64);
    -[AKAttributesPickerButton addTarget:action:forControlEvents:](self->_attributesPickerButton, "addTarget:action:forControlEvents:", self, v14, 64);
    -[AKAttributesPickerButton setImage:forState:](self->_attributesPickerButton, "setImage:forState:", v22, 0);
    -[AKAttributesPickerButton superview](self->_attributesPickerButton, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView _paletteView](self, "_paletteView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contextualEditingView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 != v31)
      -[AKToolbarView _installAttributesPickerButtonInPaletteContextEditingViewIfNeeded](self, "_installAttributesPickerButtonInPaletteContextEditingViewIfNeeded");
    v32 = v42;
  }
  else
  {
    -[AKToolbarView _paletteView](self, "_paletteView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if ((isKindOfClass & 1) != 0)
      v35 = 11;
    else
      v35 = 0;
    objc_msgSend(v33, "setSelectedAnnotationType:", v35);

    -[AKAttributesPickerButton superview](self->_attributesPickerButton, "superview");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
      -[AKAttributesPickerButton removeFromSuperview](self->_attributesPickerButton, "removeFromSuperview");
    v32 = v42;
    objc_msgSend(v42, "inkPageOverlayController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "inkOverlayView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "canvasView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_selectionInteraction");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setEnabled:", 1);

  }
  -[AKToolbarView setNeedsLayout](self, "setNeedsLayout");
  -[AKToolbarView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)_installAttributesPickerButtonInPaletteContextEditingViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  -[AKToolbarView _paletteView](self, "_paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextualEditingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKAttributesPickerButton removeFromSuperview](self->_attributesPickerButton, "removeFromSuperview");
    objc_msgSend(v4, "addSubview:", self->_attributesPickerButton);
    -[AKAttributesPickerButton setTranslatesAutoresizingMaskIntoConstraints:](self->_attributesPickerButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AKToolbarView toolPicker](self, "toolPicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_palettePosition");

    switch(v6)
    {
      case 1:
      case 3:
        v7 = (void *)MEMORY[0x24BDD1628];
        -[AKAttributesPickerButton leadingAnchor](self->_attributesPickerButton, "leadingAnchor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "leadingAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "constraintEqualToAnchor:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v10;
        -[AKAttributesPickerButton centerYAnchor](self->_attributesPickerButton, "centerYAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "centerYAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17[1] = v13;
        v14 = (void *)MEMORY[0x24BDBCE30];
        v15 = v17;
        goto LABEL_5;
      case 2:
      case 4:
        v7 = (void *)MEMORY[0x24BDD1628];
        -[AKAttributesPickerButton topAnchor](self->_attributesPickerButton, "topAnchor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "topAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "constraintEqualToAnchor:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v10;
        -[AKAttributesPickerButton centerXAnchor](self->_attributesPickerButton, "centerXAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "centerXAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = v13;
        v14 = (void *)MEMORY[0x24BDBCE30];
        v15 = v18;
LABEL_5:
        objc_msgSend(v14, "arrayWithObjects:count:", v15, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "activateConstraints:", v16);

        break;
      default:
        break;
    }
    -[AKToolbarView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[AKToolbarView layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)revalidateItems
{
  void *v3;
  id v4;

  -[AKToolbarView annotationController](self, "annotationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isTornDown") & 1) == 0)
  {
    -[UIBarButtonItem setEnabled:](self->_undoButton, "setEnabled:", objc_msgSend(v4, "validateUndo:", 0));
    -[UIBarButtonItem setEnabled:](self->_redoButton, "setEnabled:", objc_msgSend(v4, "validateRedo:", 0));
    -[AKToolbarView _paletteView](self, "_paletteView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

    -[AKToolbarView _updatePaletteUI](self, "_updatePaletteUI");
    -[AKToolbarView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_undoManagerNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AKToolbarView annotationController](self, "annotationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "undoManagerForAnnotationController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(v13, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD13B8]))
    {

    }
    else
    {
      objc_msgSend(v13, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD13B0]);

      if (!v10)
      {
LABEL_6:
        -[AKToolbarView revalidateItems](self, "revalidateItems");
        goto LABEL_7;
      }
    }
    -[AKToolbarView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "makeKeyWindow");

    -[AKToolbarView toolPicker](self, "toolPicker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_updateToolPickerVisibility");

    goto LABEL_6;
  }
LABEL_7:

}

- (void)_annotationSelectionNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[AKToolbarView annotationController](self, "annotationController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "modelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageModelControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "containsObject:", v7);
  if ((_DWORD)v4)
  {
    -[AKToolbarView revalidateItems](self, "revalidateItems");
    objc_msgSend(v15, "currentPageController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageModelController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "selectedAnnotations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentPageController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inkPageOverlayController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inkOverlayView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "canvasView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count") && objc_msgSend(v14, "_hasSelection"))
      objc_msgSend(v14, "commitSelectionIfNecessaryWithCompletion:", 0);
    -[AKToolbarView _updatePaletteUI](self, "_updatePaletteUI");

  }
}

- (void)_undo:(id)a3
{
  id v3;

  -[AKToolbarView annotationController](self, "annotationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undo:", 0);

}

- (void)_undoAll:(id)a3
{
  id v3;

  -[AKToolbarView annotationController](self, "annotationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "validateUndo:", 0))
  {
    do
      objc_msgSend(v3, "undo:", 0);
    while ((objc_msgSend(v3, "validateUndo:", 0) & 1) != 0);
  }

}

- (void)_cleanupAfterUndoAlert
{
  UIAlertController *undoAlertController;

  undoAlertController = self->_undoAlertController;
  if (undoAlertController)
  {
    self->_undoAlertController = 0;

  }
}

- (void)_undoLongPress:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 1)
  {
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView _showUndoAlertPopover:](self, "_showUndoAlertPopover:", v4);

  }
}

- (void)_redo:(id)a3
{
  id v3;

  -[AKToolbarView annotationController](self, "annotationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "redo:", 0);

}

- (void)_showShapesPicker:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__showMarkupToolsPopover_);
}

- (void)_showTextAttributes:(id)a3
{
  id v4;

  v4 = a3;
  if (sub_228FE1358(self->_textAttributesViewController))
  {
    -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 1, 0);
  }
  else if ((sub_228FE1394(self->_textAttributesViewController) & 1) == 0)
  {
    -[AKToolbarView _showTextStylePopover:](self, "_showTextStylePopover:", v4);
  }

}

- (void)_showShapeAttributes:(id)a3
{
  id v4;

  v4 = a3;
  if (sub_228FE1358(self->_attributePickerViewController))
  {
    -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 1, 0);
  }
  else if ((sub_228FE1394(self->_attributePickerViewController) & 1) == 0)
  {
    -[AKToolbarView _showShapeAttributesPopover:](self, "_showShapeAttributesPopover:", v4);
  }

}

- (void)setUndoRedoButtonsHidden:(BOOL)a3
{
  if (self->_undoRedoButtonsHidden != a3)
  {
    self->_undoRedoButtonsHidden = a3;
    -[AKToolbarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShareButtonHidden:(BOOL)a3
{
  if (self->_shareButtonHidden != a3)
  {
    self->_shareButtonHidden = a3;
    -[AKToolbarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShareButtonAction:(SEL)a3
{
  -[UIBarButtonItem setAction:](self->_shareButton, "setAction:", a3);
}

- (SEL)shareButtonAction
{
  return -[UIBarButtonItem action](self->_shareButton, "action");
}

- (void)setShareButtonTarget:(id)a3
{
  -[UIBarButtonItem setTarget:](self->_shareButton, "setTarget:", a3);
}

- (id)shareButtonTarget
{
  return -[UIBarButtonItem target](self->_shareButton, "target");
}

- (BOOL)isPresentingPopovers
{
  void *v2;
  BOOL v3;

  -[AKToolbarView presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isPresentingPopover
{
  return self->_signaturesAlertController
      || self->_signaturesSheetViewController
      || self->_textAttributesViewController
      || self->_attributePickerViewController
      || self->_undoAlertController
      || self->_signaturesCreationController
      || self->_imageDescriptionViewController != 0;
}

- (void)_clearPresentedPopoverPointers
{
  AKTextAttributesViewController *textAttributesViewController;
  AKSignaturesViewController_iOS *signaturesSheetViewController;
  AKAlertController *signaturesAlertController;
  AKSignatureCreationViewController_iOS *signaturesCreationController;
  AKToolsListViewController *toolsListViewController;
  UIAlertController *undoAlertController;
  AXSSImageDescriptionViewController *imageDescriptionViewController;

  textAttributesViewController = self->_textAttributesViewController;
  self->_textAttributesViewController = 0;

  signaturesSheetViewController = self->_signaturesSheetViewController;
  self->_signaturesSheetViewController = 0;

  signaturesAlertController = self->_signaturesAlertController;
  self->_signaturesAlertController = 0;

  signaturesCreationController = self->_signaturesCreationController;
  self->_signaturesCreationController = 0;

  toolsListViewController = self->_toolsListViewController;
  self->_toolsListViewController = 0;

  undoAlertController = self->_undoAlertController;
  self->_undoAlertController = 0;

  imageDescriptionViewController = self->_imageDescriptionViewController;
  self->_imageDescriptionViewController = 0;

}

- (id)popoverPresentingController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AKToolbarView annotationController](self, "annotationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v4, "popoverPresentingViewControllerForAnnotationController:", v3),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[AKToolbarView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)presentedViewController
{
  void *v3;
  id v4;
  id *p_signaturesAlertController;
  AKAlertController *signaturesAlertController;
  void *v7;
  void *v8;
  UIAlertController *undoAlertController;
  void *v10;
  void *v11;
  AKTextAttributesViewController *textAttributesViewController;
  void *v13;
  void *v14;
  AKToolsListViewController *toolsListViewController;
  void *v16;
  void *v17;
  AKAttributePickerViewController *attributePickerViewController;
  void *v19;
  void *v20;
  AKSignatureCreationViewController_iOS *signaturesCreationController;
  void *v22;
  void *v23;
  AKSignaturesViewController_iOS *signaturesSheetViewController;
  void *v25;
  void *v26;
  AXSSImageDescriptionViewController *imageDescriptionViewController;
  void *v28;

  -[AKToolbarView popoverPresentingController](self, "popoverPresentingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    p_signaturesAlertController = (id *)&self->_signaturesAlertController;
    signaturesAlertController = self->_signaturesAlertController;
    if (signaturesAlertController)
    {
      -[AKAlertController presentationController](signaturesAlertController, "presentationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_18;
    }
    p_signaturesAlertController = (id *)&self->_undoAlertController;
    undoAlertController = self->_undoAlertController;
    if (undoAlertController)
    {
      -[UIAlertController presentationController](undoAlertController, "presentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_18;
    }
    p_signaturesAlertController = (id *)&self->_textAttributesViewController;
    textAttributesViewController = self->_textAttributesViewController;
    if (textAttributesViewController)
    {
      -[AKTextAttributesViewController presentationController](textAttributesViewController, "presentationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentingViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_18;
    }
    p_signaturesAlertController = (id *)&self->_toolsListViewController;
    toolsListViewController = self->_toolsListViewController;
    if (toolsListViewController)
    {
      -[AKToolsListViewController presentationController](toolsListViewController, "presentationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentingViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_18;
    }
    p_signaturesAlertController = (id *)&self->_attributePickerViewController;
    attributePickerViewController = self->_attributePickerViewController;
    if (attributePickerViewController)
    {
      -[AKAttributePickerViewController presentationController](attributePickerViewController, "presentationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentingViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        goto LABEL_18;
    }
    p_signaturesAlertController = (id *)&self->_signaturesCreationController;
    signaturesCreationController = self->_signaturesCreationController;
    if (signaturesCreationController)
    {
      -[AKSignatureCreationViewController_iOS presentationController](signaturesCreationController, "presentationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "presentingViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_18;
    }
    p_signaturesAlertController = (id *)&self->_signaturesSheetViewController;
    signaturesSheetViewController = self->_signaturesSheetViewController;
    if (signaturesSheetViewController)
    {
      -[AKSignaturesViewController_iOS presentationController](signaturesSheetViewController, "presentationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "presentingViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        goto LABEL_18;
    }
    p_signaturesAlertController = (id *)&self->_imageDescriptionViewController;
    imageDescriptionViewController = self->_imageDescriptionViewController;
    if (!imageDescriptionViewController)
    {
      v4 = 0;
      return v4;
    }
    -[AXSSImageDescriptionViewController presentationController](imageDescriptionViewController, "presentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "presentingViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
LABEL_18:
      v4 = *p_signaturesAlertController;
  }
  return v4;
}

- (void)dismissPresentedPopovers
{
  MEMORY[0x24BEDD108](self, sel_dismissPresentedPopoversAnimated_);
}

- (void)dismissPresentedPopoversAnimated:(BOOL)a3
{
  -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", a3, 0);
}

- (void)didDismissPopoverAndRestorePalette
{
  -[AKToolbarView didDismissPopover](self, "didDismissPopover");
  -[AKToolbarView becomeFirstResponder](self, "becomeFirstResponder");
  -[AKToolbarView _setToolPickerVisible:forResponder:](self, "_setToolPickerVisible:forResponder:", 1, self);
}

- (void)didDismissPopover
{
  void *v2;
  id v3;

  -[AKToolbarView annotationController](self, "annotationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "controllerDidDismissPopover:", v3);

}

- (void)_showSignaturesPopover:(id)a3 fromSourceView:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  AKToolbarView *v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  _QWORD v23[5];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  -[AKToolbarView annotationController](self, "annotationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "signatureModelController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "signatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    if (!self->_signaturesSheetViewController)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = sub_228FE1AE0;
      v15[3] = &unk_24F1A76D0;
      v16 = v11;
      v17 = self;
      v18 = v10;
      v19 = x;
      v20 = y;
      v21 = width;
      v22 = height;
      -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v15);

    }
  }
  else
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_228FE1AD4;
    v23[3] = &unk_24F1A7328;
    v23[4] = self;
    -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v23);
  }

}

- (void)_showTextStylePopover:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_228FE1E3C;
  v6[3] = &unk_24F1A76F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v6);

}

- (void)_dismissCurrentlyPresentedPopoverAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_228FE2128;
  v21[3] = &unk_24F1A7720;
  v8 = v6;
  v21[4] = self;
  v22 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x22E2C12D0](v21);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_228FE2168;
  v19 = sub_228FE2178;
  -[AKToolbarView presentedViewController](self, "presentedViewController");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v16[5];
  if (v10 && (objc_msgSend(v10, "isBeingDismissed") & 1) == 0)
  {
    v11 = (void *)v16[5];
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = sub_228FE2180;
    v12[3] = &unk_24F1A7748;
    v14 = &v15;
    v12[4] = self;
    v13 = v9;
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", v4, v12);

  }
  else
  {
    v9[2](v9);
  }
  _Block_object_dispose(&v15, 8);

}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(v12, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setIgnoreBarButtonItemSiblings:", 1);
  -[AKToolbarView _paletteView](self, "_paletteView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AKToolbarView _toolPickerPopoverConfiguration](self, "_toolPickerPopoverConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutSceneMargins");
    objc_msgSend(v8, "setPopoverLayoutMargins:");

  }
  -[AKToolbarView popoverPresentingController](self, "popoverPresentingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v12, v4, 0);

  -[AKToolbarView _updateTraitCollectionForViewControllerIfNecessary:](self, "_updateTraitCollectionForViewControllerIfNecessary:", v12);
}

- (void)_updateTraitCollectionForViewControllerIfNecessary:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "_responderWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isTextEffectsWindow");

  if (v5)
  {
    -[AKToolbarView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOverrideUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

    objc_msgSend(v9, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOverrideTraitCollection:forChildViewController:", v8, v9);

  }
}

- (void)_showMarkupToolsPopover:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_228FE2404;
  v6[3] = &unk_24F1A76F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v6);

}

- (void)endOpacityEditing
{
  id v2;

  -[AKToolbarView _paletteView](self, "_paletteView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOpacityEditing");

}

- (void)_showShapeAttributesPopover:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_228FE268C;
  v6[3] = &unk_24F1A76F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v6);

}

- (void)_showUndoAlertPopover:(id)a3
{
  id v4;
  UIAlertController *v5;
  UIAlertController *undoAlertController;

  v4 = a3;
  -[AKToolbarView createUndoViewController](self, "createUndoViewController");
  v5 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  undoAlertController = self->_undoAlertController;
  self->_undoAlertController = v5;

  -[AKToolbarView _setPopoverPresentationSource:fromSender:](self, "_setPopoverPresentationSource:fromSender:", self->_undoAlertController, v4);
  -[AKToolbarView _presentViewController:animated:](self, "_presentViewController:animated:", self->_undoAlertController, 1);
}

- (void)_setPopoverPresentationSource:(id)a3 fromSender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "bounds");
    -[AKToolbarView _setPopoverPresentationSource:fromSender:sourceRect:](self, "_setPopoverPresentationSource:fromSender:sourceRect:", v8, v7);

  }
  else
  {
    -[AKToolbarView _setPopoverPresentationSource:fromSender:sourceRect:](self, "_setPopoverPresentationSource:fromSender:sourceRect:", v8, v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }

}

- (void)_setPopoverPresentationSource:(id)a3 fromSender:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  id v11;
  CGRect v12;
  CGRect v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  objc_msgSend(a3, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "setSourceView:", v11);
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    v13 = CGRectInset(v12, -5.0, -5.0);
    objc_msgSend(v10, "setSourceRect:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setBarButtonItem:", v11);
  }

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  AKLog(CFSTR("%s %@"));
  -[AKSignatureCreationViewController_iOS popoverPresentationController](self->_signaturesCreationController, "popoverPresentationController", "-[AKToolbarView presentationControllerShouldDismiss:]", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[AKToolbarView annotationController](self, "annotationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "controllerWillDismissSignatureCaptureView:", v6);

  }
  return 1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)signaturesViewControllerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AKSignaturesViewController_iOS *signaturesSheetViewController;
  AKAlertController *signaturesAlertController;
  void *v10;
  AKAlertController *v11;
  _QWORD v13[5];

  AKLog(CFSTR("%s %@"));
  if (self->_signaturesSheetViewController)
  {
    -[AKToolbarView annotationController](self, "annotationController", "-[AKToolbarView signaturesViewControllerDidCancel:]", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "controllerWillDismissSignatureManagerView:", v4);
    -[AKToolbarView popoverPresentingController](self, "popoverPresentingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_228FE2CD8;
    v13[3] = &unk_24F1A7328;
    v13[4] = self;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v13);

    -[AKSignaturesViewController_iOS popoverPresentationController](self->_signaturesSheetViewController, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    signaturesSheetViewController = self->_signaturesSheetViewController;
    self->_signaturesSheetViewController = 0;

  }
  else
  {
    signaturesAlertController = self->_signaturesAlertController;
    if (signaturesAlertController)
    {
      -[AKAlertController popoverPresentationController](signaturesAlertController, "popoverPresentationController", "-[AKToolbarView signaturesViewControllerDidCancel:]", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDelegate:", 0);

      v11 = self->_signaturesAlertController;
      self->_signaturesAlertController = 0;

      -[AKToolbarView didDismissPopoverAndRestorePalette](self, "didDismissPopoverAndRestorePalette");
    }
  }
}

- (void)signaturesViewControllerDidSelectSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AKSignaturesViewController_iOS *signaturesSheetViewController;
  AKAlertController *signaturesAlertController;
  AKMinimalUserInterfaceItem *v12;
  _QWORD v13[5];
  id v14;
  id location;

  v4 = a3;
  AKLog(CFSTR("%s %@"));
  -[AKToolbarView annotationController](self, "annotationController", "-[AKToolbarView signaturesViewControllerDidSelectSignature:]", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_signaturesSheetViewController)
  {
    objc_msgSend(v5, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "controllerWillDismissSignatureManagerView:", v6);
    -[AKToolbarView popoverPresentingController](self, "popoverPresentingController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

    -[AKSignaturesViewController_iOS popoverPresentationController](self->_signaturesSheetViewController, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", 0);

    -[AKSignaturesViewController_iOS setDelegate:](self->_signaturesSheetViewController, "setDelegate:", 0);
    signaturesSheetViewController = self->_signaturesSheetViewController;
    self->_signaturesSheetViewController = 0;

    -[AKToolbarView didDismissPopoverAndRestorePalette](self, "didDismissPopoverAndRestorePalette");
  }
  else if (self->_signaturesAlertController)
  {
    objc_initWeak(&location, self);
    signaturesAlertController = self->_signaturesAlertController;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_228FE2EB8;
    v13[3] = &unk_24F1A7770;
    objc_copyWeak(&v14, &location);
    v13[4] = self;
    -[AKAlertController dismissViewControllerAnimated:completion:](signaturesAlertController, "dismissViewControllerAnimated:completion:", 1, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v12 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalUserInterfaceItem alloc], "initWithTag:", 764019);
  objc_msgSend(v6, "performActionForSender:", v12);

}

- (void)signaturesViewControllerContinueToManageSignatures:(id)a3
{
  id v4;
  AKAlertController *signaturesAlertController;
  void *v6;
  AKAlertController *v7;
  void *v8;
  AKSignaturesViewController_iOS *v9;
  void *v10;
  AKSignaturesViewController_iOS *v11;
  AKSignaturesViewController_iOS *signaturesSheetViewController;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  signaturesAlertController = self->_signaturesAlertController;
  v16 = v4;
  if (signaturesAlertController)
  {
    -[AKAlertController popoverPresentationController](signaturesAlertController, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", 0);

    v7 = self->_signaturesAlertController;
    self->_signaturesAlertController = 0;

    v4 = v16;
  }
  v15 = v4;
  AKLog(CFSTR("%s %@"));
  v8 = v16;
  if (!self->_signaturesSheetViewController)
  {
    v9 = [AKSignaturesViewController_iOS alloc];
    -[AKToolbarView annotationController](self, "annotationController", "-[AKToolbarView signaturesViewControllerContinueToManageSignatures:]", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AKSignaturesViewController_iOS initWithController:](v9, "initWithController:", v10);
    signaturesSheetViewController = self->_signaturesSheetViewController;
    self->_signaturesSheetViewController = v11;

    -[AKSignaturesViewController_iOS setDelegate:](self->_signaturesSheetViewController, "setDelegate:", self);
    -[AKToolbarView _configureCustomDetentPresentationIfNeeded:](self, "_configureCustomDetentPresentationIfNeeded:", self->_signaturesSheetViewController);
    -[AKSignaturesViewController_iOS setModalPresentationStyle:](self->_signaturesSheetViewController, "setModalPresentationStyle:", 2);
    -[AKSignaturesViewController_iOS setModalInPresentation:](self->_signaturesSheetViewController, "setModalInPresentation:", 1);
    -[AKSignaturesViewController_iOS setShowsNavigationBar:](self->_signaturesSheetViewController, "setShowsNavigationBar:", 1);
    -[AKSignaturesViewController_iOS setPresentedInAlert:](self->_signaturesSheetViewController, "setPresentedInAlert:", 0);
    -[AKSignaturesViewController_iOS setAllowsEdits:](self->_signaturesSheetViewController, "setAllowsEdits:", 1);
    -[AKToolbarView annotationController](self, "annotationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "controllerWillShowSignatureManagerView:", v13);
    -[AKToolbarView _presentViewController:animated:](self, "_presentViewController:animated:", self->_signaturesSheetViewController, 1);

    v8 = v16;
  }

}

- (void)signaturesViewControllerContinueToCreateSignature:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  AKLog(CFSTR("%s %@"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_228FE317C;
  v8[3] = &unk_24F1A7328;
  v8[4] = self;
  v4 = MEMORY[0x22E2C12D0](v8);
  v5 = (void *)v4;
  if (self->_signaturesSheetViewController || self->_signaturesAlertController)
  {
    -[AKToolbarView popoverPresentingController](self, "popoverPresentingController", "-[AKToolbarView signaturesViewControllerContinueToCreateSignature:]", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v5);

  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }

}

- (void)_configureCustomDetentPresentationIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "sheetPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AKToolbarView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom"))
    {

    }
    else
    {
      v6 = sub_228FE4550();

      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDF6D98], "customDetentWithIdentifier:resolver:", CFSTR("markupDetentIdentifier"), &unk_24F1A70F8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setDetents:", v8);

        objc_msgSend(v4, "setSelectedDetentIdentifier:", CFSTR("markupDetentIdentifier"));
      }
    }
  }

}

- (void)signatureCreationControllerDidCreateSignature:(id)a3
{
  AKMinimalUserInterfaceItem *v3;
  id v4;

  -[AKToolbarView annotationController](self, "annotationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalUserInterfaceItem alloc], "initWithTag:", 764019);
  objc_msgSend(v4, "performActionForSender:", v3);

}

- (void)toolsList:(id)a3 didSelectToolWithTag:(int64_t)a4
{
  id v6;
  void *v7;
  UIBarButtonItem *shapesPickerButton;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD v13[6];
  _QWORD v14[5];

  v6 = a3;
  v7 = v6;
  if (a4 == 764066)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_228FE359C;
    v14[3] = &unk_24F1A7328;
    v14[4] = self;
    v12 = v14;
LABEL_6:
    -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 1, v12);
    goto LABEL_7;
  }
  if (a4 != 764019)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_228FE35A4;
    v13[3] = &unk_24F1A77B8;
    v13[4] = self;
    v13[5] = a4;
    v12 = v13;
    goto LABEL_6;
  }
  shapesPickerButton = self->_shapesPickerButton;
  objc_msgSend(v6, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceRect");
  -[AKToolbarView _showSignaturesPopover:fromSourceView:sourceRect:](self, "_showSignaturesPopover:fromSourceView:sourceRect:", shapesPickerButton, v10);

LABEL_7:
}

- (void)toolsListDidSelectOpacityItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 1, 0);
  -[AKToolbarView opacityEditingDelegate](self, "opacityEditingDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[AKToolbarView _paletteView](self, "_paletteView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startOpacityEditing");

    -[AKToolbarView _paletteView](self, "_paletteView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "opacityEditingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toolbarDidSelectOpacityOptionWithAccessoryView:", v6);

  }
}

- (void)attributePicker:(id)a3 didSelectToolWithTag:(int64_t)a4 attributeTag:(int64_t)a5
{
  void *v8;
  void *v9;
  AKMinimalColorChooserUserInterfaceItem *v10;
  AKMinimalColorChooserUserInterfaceItem *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char **v15;
  uint64_t v16;
  char **v17;
  void *v18;
  AKMinimalUserInterfaceItem *v19;
  AKMinimalUserInterfaceItem *v20;
  void *v21;
  void *v22;
  AKAttributePickerViewController *attributePickerViewController;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  -[AKToolbarView annotationController](self, "annotationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPageController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pageModelController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "selectedAnnotations");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalColorChooserUserInterfaceItem alloc], "initWithTag:", 765102);
  v11 = v10;
  if (a4 == 765102)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v25;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v31;
      v15 = &selRef_setTitleLabel_;
LABEL_4:
      v16 = 0;
      v17 = v15;
      while (1)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          break;
        if (v13 == ++v16)
        {
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          v15 = v17;
          if (v13)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v18, "strokeColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        goto LABEL_16;
    }
    else
    {
LABEL_10:

    }
    objc_msgSend(v8, "attributeController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "strokeColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    -[AKMinimalColorChooserUserInterfaceItem setColor:](v11, "setColor:", v21);
    objc_msgSend(v8, "performActionForSender:", v11);

  }
  else
  {
    -[AKMinimalColorChooserUserInterfaceItem setColor:](v10, "setColor:", 0);
    objc_msgSend(v8, "performActionForSender:", v11);
    v19 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalUserInterfaceItem alloc], "initWithTag:", a4);
    objc_msgSend(v8, "performActionForSender:", v19);
    if (a5 != 763000)
    {
      v20 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalUserInterfaceItem alloc], "initWithTag:", a5);

      objc_msgSend(v8, "performActionForSender:", v20);
      v19 = v20;
    }

  }
  if (self->_attributePickerViewController)
  {
    objc_initWeak(&location, self);
    attributePickerViewController = self->_attributePickerViewController;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_228FE39B8;
    v27[3] = &unk_24F1A77E0;
    objc_copyWeak(&v28, &location);
    -[AKAttributePickerViewController dismissViewControllerAnimated:completion:](attributePickerViewController, "dismissViewControllerAnimated:completion:", 1, v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

}

- (void)setSupportsOpacityEditing:(BOOL)a3
{
  self->_supportsOpacityEditing = a3;
  -[AKToolbarView _updatePalette](self, "_updatePalette");
}

- (BOOL)supportsOpacityEditing
{
  return self->_supportsOpacityEditing;
}

- (BOOL)_hasSelectedAnnotations
{
  void *v2;
  BOOL v3;

  -[AKToolbarView selectedAnnotations](self, "selectedAnnotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setInk:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  AKMinimalUserInterfaceItem *v7;
  id v8;

  v4 = a3;
  -[AKToolbarView annotationController](self, "annotationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AKToolbarView _updateAttributeControllerInk:](self, "_updateAttributeControllerInk:", v4);

  objc_msgSend(v8, "toolController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "toolMode");

  if (v6 != 4 && objc_msgSend(v8, "annotationEditingEnabled"))
  {
    v7 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalUserInterfaceItem alloc], "initWithTag:", 764017);
    objc_msgSend(v8, "performActionForSender:", v7);

  }
}

- (id)paletteViewSelectedAnnotationColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AKToolbarView annotationController](self, "annotationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarView selectedAnnotations](self, "selectedAnnotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "valueForKey:", CFSTR("strokeColor"));
  else
    objc_msgSend(v5, "strokeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)paletteViewDidSelectPlusButton:(id)a3
{
  void *v4;
  id v5;
  AKToolsListViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AKToolsListViewController *toolsListViewController;
  AKToolsListViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  id v24;
  CGRect v25;
  CGRect v26;

  v4 = (void *)MEMORY[0x24BDF6CA8];
  v5 = a3;
  objc_msgSend(v4, "_setAlwaysAllowPopoverPresentations:", 1);
  v6 = objc_alloc_init(AKToolsListViewController);
  -[AKToolsListViewController setSupportsOpacityEditing:](v6, "setSupportsOpacityEditing:", -[AKToolbarView supportsOpacityEditing](self, "supportsOpacityEditing"));
  -[AKToolbarView annotationController](self, "annotationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolsListViewController setSupportsImageDescriptionEditing:](v6, "setSupportsImageDescriptionEditing:", objc_msgSend(v7, "supportsImageDescriptionEditing"));

  -[AKToolsListViewController setDelegate:](v6, "setDelegate:", self);
  -[AKToolsListViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 7);
  -[AKToolsListViewController popoverPresentationController](v6, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolsListViewController popoverPresentationController](v6, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  toolsListViewController = self->_toolsListViewController;
  self->_toolsListViewController = v6;
  v12 = v6;

  -[AKToolsListViewController popoverPresentationController](v12, "popoverPresentationController");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_setShouldDisableInteractionDuringTransitions:", 0);
  -[AKToolbarView _toolPickerPopoverConfiguration](self, "_toolPickerPopoverConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "passthroughViews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPassthroughViews:", v14);

  -[AKToolbarView _toolPickerPopoverConfiguration](self, "_toolPickerPopoverConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPermittedArrowDirections:", objc_msgSend(v15, "permittedArrowDirections"));

  objc_msgSend(v24, "setSourceView:", v5);
  objc_msgSend(v5, "plusButtonFrame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v25.origin.x = v17;
  v25.origin.y = v19;
  v25.size.width = v21;
  v25.size.height = v23;
  v26 = CGRectInset(v25, -5.0, -5.0);
  objc_msgSend(v24, "setSourceRect:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  objc_msgSend(v24, "_setIgnoresKeyboardNotifications:", 1);
  -[AKToolbarView _presentViewController:animated:](self, "_presentViewController:animated:", v12, 1);

}

- (id)_toolPickerUndoManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[AKToolbarView annotationController](self, "annotationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_toolPicker:(id)a3 shouldChangeSelectedToolColor:(id)a4
{
  return !-[AKToolbarView _hasSelectedAnnotations](self, "_hasSelectedAnnotations", a3, a4);
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKToolbarView _updatePaletteUI](self, "_updatePaletteUI");
  -[AKToolbarView annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateGestureDependencyPriority");
  objc_msgSend(v5, "toolPickerVisibilityDidChange:", v4);

}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "selectedTool");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarView setInk:](self, "setInk:", v4);

}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AKToolbarView annotationController](self, "annotationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRulerActive");

  objc_msgSend(v8, "attributeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "forceShowRuler");
  else
    objc_msgSend(v6, "forceHideRuler");

}

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  AKMinimalTextColorUserInterfaceItem *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  AKMinimalTextColorUserInterfaceItem *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (-[AKToolbarView _hasSelectedAnnotations](self, "_hasSelectedAnnotations"))
  {
    -[AKToolbarView annotationController](self, "annotationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[AKToolbarUtilities attributeTagForCurrentSelectionState:](AKToolbarUtilities, "attributeTagForCurrentSelectionState:", v7);
    if (v8 == 765106)
    {
      v9 = [AKMinimalTextColorUserInterfaceItem alloc];
      v10 = 765106;
    }
    else
    {
      if (v8 != 765101)
      {
        NSLog(CFSTR("%s called with incorrect colorAttributeTag %ld"), "-[AKToolbarView _toolPicker:didChangeColor:]", v8);
        goto LABEL_9;
      }
      v9 = [AKMinimalColorChooserUserInterfaceItem alloc];
      v10 = 765101;
    }
    v15 = -[AKMinimalUserInterfaceItem initWithTag:](v9, "initWithTag:", v10);
    -[AKMinimalColorChooserUserInterfaceItem setColor:](v15, "setColor:", v6);
    objc_msgSend(v7, "performActionForSender:", v15);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_annotationController);
    objc_msgSend(WeakRetained, "currentPageController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "inkPageOverlayController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inkOverlayView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "canvasView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_toolPicker:didChangeColor:", v16, v6);
  }
LABEL_9:

}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  -[AKToolbarView _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 1, a3);
}

- (void)setBackgroundImage:(id)a3 forToolbarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  NSLog(CFSTR("MarkupViewController UIToolbar has been removed. It is now a UIView."), a2, a3, a4, a5);
}

- (void)setShadowImage:(id)a3 forToolbarPosition:(int64_t)a4
{
  NSLog(CFSTR("MarkupViewController UIToolbar has been removed. It is now a UIView."), a2, a3, a4);
}

+ (id)undoButtonImageWithStyle:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
    v3 = CFSTR("AKModern_Undo_Bold");
  else
    v3 = CFSTR("AKModern_Undo");
  return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "akImageNamed:", v3);
}

+ (id)redoButtonImageWithStyle:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
    v3 = CFSTR("AKModern_Redo_Bold");
  else
    v3 = CFSTR("AKModern_Redo");
  return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "akImageNamed:", v3);
}

+ (id)undoButtonImage
{
  return (id)MEMORY[0x24BEDD108](a1, sel_undoButtonImageWithStyle_);
}

+ (id)redoButtonImage
{
  return (id)MEMORY[0x24BEDD108](a1, sel_redoButtonImageWithStyle_);
}

- (CGRect)frameObscuredInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[AKToolbarView toolPicker](self, "toolPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameObscuredInView:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[AKToolbarView isHidden](self, "isHidden"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[AKToolbarView alpha](self, "alpha");
  v6 = v5;
  if (-[AKToolbarView contentsHidden](self, "contentsHidden"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<AKToolbarView: %p, hidden: %@, alpha:%f, contentsHidden:%@>"), self, v4, v6, v7);
}

- (AKController)annotationController
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_annotationController);
}

- (void)setToolPicker:(id)a3
{
  objc_storeStrong((id *)&self->_toolPicker, a3);
}

- (BOOL)undoRedoButtonsHidden
{
  return self->_undoRedoButtonsHidden;
}

- (BOOL)alwaysShowUndoButton
{
  return self->_alwaysShowUndoButton;
}

- (void)setAlwaysShowUndoButton:(BOOL)a3
{
  self->_alwaysShowUndoButton = a3;
}

- (BOOL)isShareButtonHidden
{
  return self->_shareButtonHidden;
}

- (BOOL)isTranslucent
{
  return self->_translucent;
}

- (BOOL)contentsHidden
{
  return self->_contentsHidden;
}

- (AKToolbarViewOpacityEditingDelegate)opacityEditingDelegate
{
  return (AKToolbarViewOpacityEditingDelegate *)objc_loadWeakRetained((id *)&self->_opacityEditingDelegate);
}

- (void)setOpacityEditingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_opacityEditingDelegate, a3);
}

- (BOOL)wantsClearBackgroundColorInCompactSize
{
  return self->_wantsClearBackgroundColorInCompactSize;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_opacityEditingDelegate);
  objc_storeStrong((id *)&self->_toolPicker, 0);
  objc_destroyWeak((id *)&self->_annotationController);
  objc_storeStrong((id *)&self->_imageDescriptionViewController, 0);
  objc_storeStrong((id *)&self->_attributesPickerButtonHeigthConstraint, 0);
  objc_storeStrong((id *)&self->_attributesPickerButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_attributesPickerButton, 0);
  objc_storeStrong((id *)&self->_attributePickerViewController, 0);
  objc_storeStrong((id *)&self->_toolsListViewController, 0);
  objc_storeStrong((id *)&self->_signaturesCreationController, 0);
  objc_storeStrong((id *)&self->_signaturesSheetViewController, 0);
  objc_storeStrong((id *)&self->_textAttributesViewController, 0);
  objc_storeStrong((id *)&self->_undoAlertController, 0);
  objc_storeStrong((id *)&self->_signaturesAlertController, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_attributesAddShapeFixedSpace, 0);
  objc_storeStrong((id *)&self->_undoRedoFixedSpace, 0);
  objc_storeStrong((id *)&self->_attributesPickerBarButton, 0);
  objc_storeStrong((id *)&self->_shapesPickerButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
}

- (void)_askAnnotationControllerDelegateToEnterFullScreen:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[AKToolbarView annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "controllerWillShowSignatureCaptureView:", v5);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "controllerWillDismissSignatureCaptureView:", v5);
  }

}

- (void)_presentImageDescriptionViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  AXSSImageDescriptionViewController *v8;
  AXSSImageDescriptionViewController *imageDescriptionViewController;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (!self->_imageDescriptionViewController)
  {
    -[AKToolbarView _askAnnotationControllerDelegateToEnterFullScreen:](self, "_askAnnotationControllerDelegateToEnterFullScreen:", 1);
    -[AKToolbarView annotationController](self, "annotationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "performSelector:", sel_contentSnapshot);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v6 = (void *)qword_255A26FC8;
    v17 = qword_255A26FC8;
    if (!qword_255A26FC8)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FF0148;
      v13[3] = &unk_24F1A7890;
      v13[4] = &v14;
      sub_228FF0148((uint64_t)v13);
      v6 = (void *)v15[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v14, 8);
    v8 = (AXSSImageDescriptionViewController *)objc_msgSend([v7 alloc], "initWithContentSnapshot:", v5);
    imageDescriptionViewController = self->_imageDescriptionViewController;
    self->_imageDescriptionViewController = v8;

    +[AKController akBundle](AKController, "akBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Image Description"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController setTitle:](self->_imageDescriptionViewController, "setTitle:", v11);

    -[AXSSImageDescriptionViewController setModalPresentationStyle:](self->_imageDescriptionViewController, "setModalPresentationStyle:", 2);
    -[AXSSImageDescriptionViewController setModalInPresentation:](self->_imageDescriptionViewController, "setModalInPresentation:", 0);
    -[AXSSImageDescriptionViewController setDelegate:](self->_imageDescriptionViewController, "setDelegate:", self);
    objc_msgSend(v3, "originalOrModifiedImageDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController setImageDescription:](self->_imageDescriptionViewController, "setImageDescription:", v12);

    -[AKToolbarView _configureCustomDetentPresentationIfNeeded:](self, "_configureCustomDetentPresentationIfNeeded:", self->_imageDescriptionViewController);
    -[AKToolbarView _presentViewController:animated:](self, "_presentViewController:animated:", self->_imageDescriptionViewController, 1);

  }
}

- (void)_dismissImageDescriptionViewController
{
  void *v3;
  AXSSImageDescriptionViewController *imageDescriptionViewController;
  _QWORD v5[5];

  -[AKToolbarView popoverPresentingController](self, "popoverPresentingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_228FF0030;
  v5[3] = &unk_24F1A7328;
  v5[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v5);

  imageDescriptionViewController = self->_imageDescriptionViewController;
  self->_imageDescriptionViewController = 0;

}

- (void)imageDescriptionViewControllerDidCancel:(id)a3
{
  if (self->_imageDescriptionViewController)
    MEMORY[0x24BEDD108](self, sel__dismissImageDescriptionViewController);
}

- (void)imageDescriptionViewControllerDidSave:(id)a3
{
  void *v4;
  void *v5;

  if (self->_imageDescriptionViewController)
  {
    objc_msgSend(a3, "imageDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarView annotationController](self, "annotationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setModifiedImageDescription:", v4);

    MEMORY[0x24BEDD108](self, sel__dismissImageDescriptionViewController);
  }
}

- (void)imageDescriptionViewControllerDidDismiss:(id)a3
{
  AXSSImageDescriptionViewController *imageDescriptionViewController;

  if (self->_imageDescriptionViewController)
  {
    -[AKToolbarView _askAnnotationControllerDelegateToEnterFullScreen:](self, "_askAnnotationControllerDelegateToEnterFullScreen:", 0);
    -[AKToolbarView becomeFirstResponder](self, "becomeFirstResponder");
    imageDescriptionViewController = self->_imageDescriptionViewController;
    self->_imageDescriptionViewController = 0;

  }
}

@end
