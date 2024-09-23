@implementation WFOverlayImageEditorViewController

- (WFOverlayImageEditorViewController)initWithFileRepresentations:(id)a3 overlayImage:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFOverlayImageEditorViewController *v11;
  uint64_t v12;
  NSArray *fileRepresentations;
  void *v14;
  id completionHandler;
  uint64_t v16;
  NSMapTable *transforms;
  WFOverlayImageEditorViewController *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFOverlayImageEditorViewController;
  v11 = -[WFOverlayImageEditorViewController init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    fileRepresentations = v11->_fileRepresentations;
    v11->_fileRepresentations = (NSArray *)v12;

    v14 = _Block_copy(v10);
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = v14;

    objc_storeStrong((id *)&v11->_overlayImage, a4);
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    transforms = v11->_transforms;
    v11->_transforms = (NSMapTable *)v16;

    -[WFOverlayImageEditorViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 0);
    v18 = v11;
  }

  return v11;
}

- (void)loadView
{
  void *v3;
  void *v4;
  WFOverlayImageEditorOptionsView *v5;
  void *v6;
  void *v7;
  WFOpacitySliderView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WFOverlayImageEditorViewController;
  -[WFOverlayImageEditorViewController loadView](&v25, sel_loadView);
  -[WFOverlayImageEditorViewController editorBackgroundColor](self, "editorBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc_init(WFOverlayImageEditorOptionsView);
  -[WFOverlayImageEditorViewController editorBackgroundColor](self, "editorBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorOptionsView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[WFOverlayImageEditorOptionsView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFOverlayImageEditorOptionsView setDelegate:](v5, "setDelegate:", self);
  -[WFOverlayImageEditorViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  objc_storeWeak((id *)&self->_optionsView, v5);
  v8 = objc_alloc_init(WFOpacitySliderView);
  -[WFOpacitySliderView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFOpacitySliderView addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", self, sel_didChangeOpacity_, 4096);
  -[WFOverlayImageEditorViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertSubview:belowSubview:", v8, v5);

  objc_storeWeak((id *)&self->_opacityView, v8);
  _NSDictionaryOfVariableBindings(CFSTR("optionsView, opacitySliderView"), v5, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 3, 0, v5, 3, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorViewController setOpacityViewVerticalConstraint:](self, "setOpacityViewVerticalConstraint:", v11);

  -[WFOverlayImageEditorViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorViewController opacityViewVerticalConstraint](self, "opacityViewVerticalConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraint:", v13);

  -[WFOverlayImageEditorViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[opacitySliderView]|"), 0, 0, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConstraints:", v15);

  -[WFOverlayImageEditorViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD1628];
  WeakRetained = objc_loadWeakRetained((id *)&self->_opacityView);
  objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", WeakRetained, 8, 0, 0, 0, 1.0, 90.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addConstraint:", v19);

  -[WFOverlayImageEditorViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[optionsView]|"), 0, 0, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addConstraints:", v21);

  -[WFOverlayImageEditorViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[optionsView]|"), 0, 0, v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addConstraints:", v23);

  -[NSArray firstObject](self->_fileRepresentations, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorViewController setCurrentFile:](self, "setCurrentFile:", v24);

}

- (void)viewDidLoad
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFOverlayImageEditorViewController;
  -[WFOverlayImageEditorViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[WFOverlayImageEditorViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[WFOverlayImageEditorViewController fileRepresentations](self, "fileRepresentations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[WFOverlayImageEditorViewController optionsView](self, "optionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 2)
    v7 = CFSTR("Next");
  else
    v7 = CFSTR("Done");
  WFLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v8, 0);

}

- (id)editorBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.149019608, 0.196078431, 0.219607843, 1.0);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setCurrentFile:(id)a3
{
  id v5;
  const void *v6;
  void *v7;
  void *v8;
  WFOverlayImageEditorCanvasView *v9;
  void *v10;
  void *v11;
  WFOverlayImageEditorCanvasView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id WeakRetained;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  _QWORD v75[4];
  id v76;
  WFOverlayImageEditorViewController *v77;
  id v78;
  id v79;
  WFOverlayImageEditorCanvasView *v80;
  _QWORD v81[5];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  const __CFString *v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_currentFile, a3);
  v6 = (const void *)WFImageSourceCreateFromFile();
  WFImageAtIndexFromImageSource();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00FE0]), "initForCenteringImage:inBackgroundImage:", self->_overlayImage, v7);
  v9 = [WFOverlayImageEditorCanvasView alloc];
  objc_msgSend(v7, "UIImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFImage UIImage](self->_overlayImage, "UIImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFOverlayImageEditorCanvasView initWithBackgroundImage:overlayImage:transform:](v9, "initWithBackgroundImage:overlayImage:transform:", v10, v11, v8);

  -[WFOverlayImageEditorCanvasView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFOverlayImageEditorViewController canvasView](self, "canvasView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[WFOverlayImageEditorViewController view](self, "view");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "insertSubview:atIndex:", v12, 0);

    v61 = objc_storeWeak((id *)&self->_canvasView, v12);
    WeakRetained = objc_loadWeakRetained((id *)&self->_optionsView);
    _NSDictionaryOfVariableBindings(CFSTR("_canvasView, _optionsView"), v12, WeakRetained, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFOverlayImageEditorViewController view](self, "view");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_canvasView][_optionsView]"), 0, 0, v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addConstraints:", v65);

    -[WFOverlayImageEditorViewController view](self, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_canvasView]|"), 0, 0, v63);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addConstraints:", v67);

    -[WFOverlayImageEditorViewController view](self, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setNeedsLayout");

    goto LABEL_16;
  }
  v72 = v8;
  v73 = v7;
  v74 = v5;
  -[WFOverlayImageEditorViewController canvasView](self, "canvasView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserInteractionEnabled:", 0);
  -[WFOverlayImageEditorViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertSubview:aboveSubview:", v12, v14);

  v87 = CFSTR("offset");
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[WFOverlayImageEditorViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  objc_msgSend(v16, "numberWithDouble:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD1628];
  -[WFOverlayImageEditorViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 1, 0, v21, 1, 1.0, v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BDD1628];
  -[WFOverlayImageEditorViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 7, 0, 0, 0, 1.0, v27);
  v28 = objc_claimAutoreleasedReturnValue();

  -[WFOverlayImageEditorViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)v24;
  objc_msgSend(v29, "addConstraint:", v24);

  -[WFOverlayImageEditorViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)v28;
  objc_msgSend(v30, "addConstraint:", v28);

  -[WFOverlayImageEditorViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x24BDD1628];
  v33 = objc_loadWeakRetained((id *)&self->_optionsView);
  _NSDictionaryOfVariableBindings(CFSTR("newCanvasView, _optionsView"), v12, v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[newCanvasView][_optionsView]"), 0, 0, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addConstraints:", v35);

  -[WFOverlayImageEditorViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setNeedsLayout");

  -[WFOverlayImageEditorViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "layoutIfNeeded");

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[WFOverlayImageEditorViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraints");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
  if (!v40)
    goto LABEL_14;
  v41 = v40;
  v42 = *(_QWORD *)v83;
  do
  {
    for (i = 0; i != v41; ++i)
    {
      if (*(_QWORD *)v83 != v42)
        objc_enumerationMutation(v39);
      v44 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
      objc_msgSend(v44, "firstItem");
      v45 = objc_claimAutoreleasedReturnValue();
      if ((void *)v45 == v14)
      {

      }
      else
      {
        v46 = (void *)v45;
        objc_msgSend(v44, "secondItem");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47 != v14)
          continue;
      }
      -[WFOverlayImageEditorViewController view](self, "view");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "removeConstraint:", v44);

    }
    v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
  }
  while (v41);
LABEL_14:

  v49 = objc_loadWeakRetained((id *)&self->_optionsView);
  _NSDictionaryOfVariableBindings(CFSTR("oldCanvasView, _optionsView"), v14, v49, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFOverlayImageEditorViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[oldCanvasView][_optionsView]"), 0, 0, v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addConstraints:", v52);

  -[WFOverlayImageEditorViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[oldCanvasView(==offset)]-(offset)-|"), 0, v71, v50);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addConstraints:", v54);

  objc_msgSend(v70, "setConstant:", 0.0);
  -[WFOverlayImageEditorViewController optionsView](self, "optionsView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setUserInteractionEnabled:", 0);

  v56 = (void *)MEMORY[0x24BEBDB00];
  v81[0] = MEMORY[0x24BDAC760];
  v81[1] = 3221225472;
  v81[2] = __53__WFOverlayImageEditorViewController_setCurrentFile___block_invoke;
  v81[3] = &unk_24E343958;
  v81[4] = self;
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __53__WFOverlayImageEditorViewController_setCurrentFile___block_invoke_2;
  v75[3] = &unk_24E342B58;
  v76 = v14;
  v77 = self;
  v78 = v70;
  v79 = v69;
  v80 = v12;
  v57 = v69;
  v58 = v70;
  v59 = v14;
  objc_msgSend(v56, "animateWithDuration:animations:completion:", v81, v75, 0.3);

  v7 = v73;
  v5 = v74;
  v8 = v72;
LABEL_16:

}

- (void)didChangeOpacity:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a3;
  -[WFOverlayImageEditorViewController canvasView](self, "canvasView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "opacity");
  v6 = v5;

  objc_msgSend(v7, "setOverlayImageOpacity:", v6);
}

- (BOOL)opacitySliderVisible
{
  void *v2;
  double v3;
  BOOL v4;

  -[WFOverlayImageEditorViewController opacityViewVerticalConstraint](self, "opacityViewVerticalConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constant");
  v4 = v3 == 0.0;

  return v4;
}

- (void)setOpacitySliderVisible:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  double v6;
  double v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  if (a3)
  {
    -[WFOverlayImageEditorViewController opacityView](self, "opacityView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v7 = -v6;
  }
  else
  {
    v7 = 0.0;
  }
  -[WFOverlayImageEditorViewController opacityViewVerticalConstraint](self, "opacityViewVerticalConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

  if (v4)
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__WFOverlayImageEditorViewController_setOpacitySliderVisible___block_invoke;
  v9[3] = &unk_24E343958;
  v9[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v9, 0, 0.25);
}

- (BOOL)rotationEnabled
{
  void *v2;
  char v3;

  -[WFOverlayImageEditorViewController canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRotationEnabled");

  return v3;
}

- (void)setRotationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFOverlayImageEditorViewController canvasView](self, "canvasView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRotationEnabled:", v3);

}

- (void)resetOverlayImageViewTransformations
{
  id v2;

  -[WFOverlayImageEditorViewController canvasView](self, "canvasView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (void)finishEditingImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  WFOverlayImageEditorProcessingView *v20;
  void *v21;
  WFOverlayImageEditorProcessingView *v22;
  void *v23;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[5];

  -[WFOverlayImageEditorViewController transforms](self, "transforms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorViewController canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorViewController currentFile](self, "currentFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, v6);

  -[WFOverlayImageEditorViewController fileRepresentations](self, "fileRepresentations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorViewController currentFile](self, "currentFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  -[WFOverlayImageEditorViewController fileRepresentations](self, "fileRepresentations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 + 1 >= v11)
  {
    v20 = [WFOverlayImageEditorProcessingView alloc];
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[WFOverlayImageEditorProcessingView initWithEffect:](v20, "initWithEffect:", v21);

    -[WFOverlayImageEditorProcessingView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFOverlayImageEditorViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v22);

    -[WFOverlayImageEditorViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD1628];
    WeakRetained = objc_loadWeakRetained((id *)&self->_optionsView);
    _NSDictionaryOfVariableBindings(CFSTR("processingView, _optionsView"), v22, WeakRetained, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[processingView][_optionsView]"), 0, 0, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addConstraints:", v28);

    -[WFOverlayImageEditorViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("processingView"), v22, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[processingView]|"), 0, 0, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addConstraints:", v32);

    -[WFOverlayImageEditorViewController fileRepresentations](self, "fileRepresentations");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = self;
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke;
    v36[3] = &unk_24E342BA8;
    v36[4] = self;
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_3;
    v35[3] = &unk_24E343B20;
    objc_msgSend(v33, "if_mapAsynchronously:completionHandler:", v36, v35);

  }
  else
  {
    -[WFOverlayImageEditorViewController fileRepresentations](self, "fileRepresentations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v9 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOverlayImageEditorViewController setCurrentFile:](self, "setCurrentFile:", v13);

    -[WFOverlayImageEditorViewController optionsView](self, "optionsView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nextButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", 1);

    -[WFOverlayImageEditorViewController fileRepresentations](self, "fileRepresentations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count") - 2;

    if (v9 == v17)
    {
      -[WFOverlayImageEditorViewController optionsView](self, "optionsView");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "nextButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Done"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:forState:", v19, 0);

    }
  }
}

- (void)cancelEditingImage
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;

  -[WFOverlayImageEditorViewController completionHandler](self, "completionHandler");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v4);

  -[WFOverlayImageEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (WFImage)overlayImage
{
  return self->_overlayImage;
}

- (void)setOverlayImage:(id)a3
{
  objc_storeStrong((id *)&self->_overlayImage, a3);
}

- (NSArray)fileRepresentations
{
  return self->_fileRepresentations;
}

- (void)setFileRepresentations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (WFFileRepresentation)currentFile
{
  return self->_currentFile;
}

- (NSMapTable)transforms
{
  return self->_transforms;
}

- (void)setTransforms:(id)a3
{
  objc_storeStrong((id *)&self->_transforms, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (WFOverlayImageEditorOptionsView)optionsView
{
  return (WFOverlayImageEditorOptionsView *)objc_loadWeakRetained((id *)&self->_optionsView);
}

- (void)setOptionsView:(id)a3
{
  objc_storeWeak((id *)&self->_optionsView, a3);
}

- (WFOverlayImageEditorCanvasView)canvasView
{
  return (WFOverlayImageEditorCanvasView *)objc_loadWeakRetained((id *)&self->_canvasView);
}

- (void)setCanvasView:(id)a3
{
  objc_storeWeak((id *)&self->_canvasView, a3);
}

- (WFOpacitySliderView)opacityView
{
  return (WFOpacitySliderView *)objc_loadWeakRetained((id *)&self->_opacityView);
}

- (void)setOpacityView:(id)a3
{
  objc_storeWeak((id *)&self->_opacityView, a3);
}

- (NSLayoutConstraint)opacityViewVerticalConstraint
{
  return self->_opacityViewVerticalConstraint;
}

- (void)setOpacityViewVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_opacityViewVerticalConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacityViewVerticalConstraint, 0);
  objc_destroyWeak((id *)&self->_opacityView);
  objc_destroyWeak((id *)&self->_canvasView);
  objc_destroyWeak((id *)&self->_optionsView);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_currentFile, 0);
  objc_storeStrong((id *)&self->_fileRepresentations, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
}

void __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "transforms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_2;
  v13[3] = &unk_24E342B80;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v10, "applyToImageFile:withOverlayImage:completionHandler:", v8, v11, v13);

}

void __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_4;
  v10[3] = &unk_24E3433F8;
  v10[4] = v7;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v10);

}

void __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__WFOverlayImageEditorViewController_setOpacitySliderVisible___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __53__WFOverlayImageEditorViewController_setCurrentFile___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __53__WFOverlayImageEditorViewController_setCurrentFile___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeConstraint:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraint:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("newCanvasView"), *(id *)(a1 + 64), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[newCanvasView]|"), 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraints:", v7);

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 1016), *(id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "optionsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 40), "opacityView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reset");

}

@end
