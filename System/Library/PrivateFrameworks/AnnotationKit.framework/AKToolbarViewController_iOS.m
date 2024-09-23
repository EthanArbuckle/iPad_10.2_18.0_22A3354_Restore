@implementation AKToolbarViewController_iOS

- (BOOL)_legacyDoodlesEnabled
{
  if (qword_255A27040 != -1)
    dispatch_once(&qword_255A27040, &unk_24F1A7158);
  return byte_255A27038;
}

- (unint64_t)_workaroundToolbarPopoverPositioningBug26744300
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;

  -[AKToolbarViewController_iOS undoButton](self, "undoButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    NSLog(CFSTR("Undo button must have a custom view!"));
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v3);
  v6 = v5;

  objc_msgSend(v3, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  if (v6 < v9 * 0.5)
    v10 = 1;
  else
    v10 = 2;

  return v10;
}

- (AKToolbarViewController_iOS)initWithController:(id)a3
{
  id v4;
  AKToolbarViewController_iOS *v5;
  AKToolbarViewController_iOS *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AKToolbarViewController_iOS;
  v5 = -[AKToolbarViewController initWithController:](&v19, sel_initWithController_, v4);
  v6 = v5;
  if (v5)
  {
    -[AKToolbarViewController_iOS _buildBasicItems](v5, "_buildBasicItems");
    objc_msgSend(v4, "undoController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDD13B8];
    objc_msgSend(v7, "undoManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel__undoManagerNotification_, v9, v10);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDD13B0];
    objc_msgSend(v7, "undoManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__undoManagerNotification_, v12, v13);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDD13A8];
    objc_msgSend(v7, "undoManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel__undoManagerNotification_, v15, v16);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel__peripheralAvailabilityDidUpdate_, CFSTR("AKPeripheralAvailabilityManagerAvailabilityNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_dismissAttributeToolbarForSelectedAnnotations, 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[AKToolbarViewController_iOS _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)AKToolbarViewController_iOS;
  -[AKToolbarViewController_iOS dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x24BDF6F10]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  -[AKToolbarViewController_iOS setView:](self, "setView:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v4, v5, v6, v7);
  -[AKToolbarViewController_iOS setFloatingAttributeToolbarContainer:](self, "setFloatingAttributeToolbarContainer:", v9);

  -[AKToolbarViewController_iOS floatingAttributeToolbarContainer](self, "floatingAttributeToolbarContainer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 1);

}

- (void)_buildBasicItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (-[AKToolbarViewController_iOS _legacyDoodlesEnabled](self, "_legacyDoodlesEnabled"))
    v3 = 0;
  else
    v3 = 13;
  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setSketchButton:](self, "setSketchButton:", v4);

  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setInkButton:](self, "setInkButton:", v5);

  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setSignatureButton:](self, "setSignatureButton:", v6);

  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setLoupeButton:](self, "setLoupeButton:", v7);

  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setTextButton:](self, "setTextButton:", v8);

  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setUndoButton:](self, "setUndoButton:", v9);

  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setRedoButton:](self, "setRedoButton:", v10);

  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setTextStyleButton:](self, "setTextStyleButton:", v11);

  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setLineStyleButton:](self, "setLineStyleButton:", v12);

  -[AKToolbarViewController_iOS _barButtonForToolbarType:](self, "_barButtonForToolbarType:", 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS setStrokeColorButton:](self, "setStrokeColorButton:", v13);

  -[AKToolbarViewController_iOS _layoutToolbarForTraitCollection:](self, "_layoutToolbarForTraitCollection:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKToolbarViewController_iOS;
  v4 = a3;
  -[AKToolbarViewController_iOS traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[AKToolbarViewController_iOS traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_22901C098(v5, v4);

  if (!v6)
  {
    -[AKToolbarViewController_iOS traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS _layoutToolbarForTraitCollection:](self, "_layoutToolbarForTraitCollection:", v7);

    -[AKToolbarViewController_iOS revalidateItems](self, "revalidateItems");
  }
}

- (void)_layoutToolbarForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
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
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[7];
  _QWORD v41[2];
  _QWORD v42[17];

  v42[15] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKToolbarViewController_iOS view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v37, "setWidth:", 8.0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  objc_setAssociatedObject(v5, sel_akToolbarButtonItemType, &unk_24F1CFA38, (void *)0x303);
  v6 = sub_22901C04C(v4);
  -[AKToolbarViewController_iOS floatingAttributeToolbarContainer](self, "floatingAttributeToolbarContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  v8 = (void *)MEMORY[0x24BDBCEB8];
  -[AKToolbarViewController_iOS inkButton](self, "inkButton");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v6)
  {
    v40[0] = v9;
    v40[1] = v5;
    -[AKToolbarViewController_iOS loupeButton](self, "loupeButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v21;
    v40[3] = v5;
    -[AKToolbarViewController_iOS textButton](self, "textButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[4] = v22;
    v40[5] = v5;
    -[AKToolbarViewController_iOS signatureButton](self, "signatureButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[6] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[AKToolbarViewController_iOS _legacyDoodlesEnabled](self, "_legacyDoodlesEnabled"))
      goto LABEL_8;
    -[AKToolbarViewController_iOS sketchButton](self, "sketchButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v18;
    v39[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertObjects:atIndexes:", v19, v20);
    goto LABEL_6;
  }
  v36 = v4;
  v42[0] = v9;
  v42[1] = v5;
  -[AKToolbarViewController_iOS loupeButton](self, "loupeButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v35;
  v42[3] = v5;
  -[AKToolbarViewController_iOS textButton](self, "textButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v11;
  v42[5] = v5;
  -[AKToolbarViewController_iOS signatureButton](self, "signatureButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v12;
  v42[7] = v5;
  v42[8] = v5;
  v42[9] = v5;
  -[AKToolbarViewController_iOS strokeColorButton](self, "strokeColorButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[10] = v13;
  v42[11] = v5;
  -[AKToolbarViewController_iOS lineStyleButton](self, "lineStyleButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[12] = v14;
  v42[13] = v5;
  -[AKToolbarViewController_iOS textStyleButton](self, "textStyleButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[14] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AKToolbarViewController_iOS _legacyDoodlesEnabled](self, "_legacyDoodlesEnabled"))
  {
    -[AKToolbarViewController_iOS sketchButton](self, "sketchButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v18;
    v41[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertObjects:atIndexes:", v19, v20);
    v4 = v36;
LABEL_6:

    goto LABEL_8;
  }
  v4 = v36;
LABEL_8:
  -[AKToolbarViewController_iOS setStaticToolbarItems:](self, "setStaticToolbarItems:", v17);

  -[AKToolbarViewController_iOS barTintColor](self, "barTintColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "toolbar");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBarTintColor:", v25);

  if (-[AKToolbarViewController_iOS _legacyDoodlesEnabled](self, "_legacyDoodlesEnabled"))
  {
    -[AKToolbarViewController_iOS sketchButton](self, "sketchButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS _updateToggleButton:withTraitCollection:](self, "_updateToggleButton:withTraitCollection:", v28, v4);

  }
  -[AKToolbarViewController_iOS inkButton](self, "inkButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS _updateToggleButton:withTraitCollection:](self, "_updateToggleButton:withTraitCollection:", v29, v4);

  -[AKToolbarViewController_iOS signatureButton](self, "signatureButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS _updateToggleButton:withTraitCollection:](self, "_updateToggleButton:withTraitCollection:", v30, v4);

  -[AKToolbarViewController_iOS staticToolbarItems](self, "staticToolbarItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController controller](self, "controller");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v33, "controller:willSetToolbarItems:", v32, v31);
    v34 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v34;
  }
  objc_msgSend(v38, "setItems:animated:", v31, 0);

}

- (void)_updateToggleButton:(id)a3 withTraitCollection:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(a3, "customView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS barTintColor](self, "barTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "akIsEqualToColor:", v6),
        v6,
        !v7))
  {
    objc_msgSend(v17, "setShouldTintNormalImage:", 1);
    objc_msgSend(v17, "setShowsBackgroundColor:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v11);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v17, "setShouldTintNormalImage:", 1);
    objc_msgSend(v17, "setShowsBackgroundColor:", 1);
    -[AKToolbarViewController_iOS view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v9);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;
  objc_msgSend(v17, "setSelectedColor:", v10);

  if (objc_msgSend(v17, "tag") == 764015)
  {
    -[AKToolbarViewController_iOS _doodleModeToolbarImage](self, "_doodleModeToolbarImage");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v17, "tag") == 764016)
    {
      v14 = (void *)objc_opt_class();
      v15 = 1;
    }
    else if (objc_msgSend(v17, "tag") == 764017)
    {
      v14 = (void *)objc_opt_class();
      v15 = 13;
    }
    else
    {
      if (objc_msgSend(v17, "tag") != 764022)
      {
        objc_msgSend(v17, "tag");
        goto LABEL_15;
      }
      v14 = (void *)objc_opt_class();
      v15 = 3;
    }
    objc_msgSend(v14, "imageForToolbarButtonItemOfType:", v15);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v13;
  objc_msgSend(v17, "setTemplateImage:", v13);
  objc_msgSend(v17, "setImage:forState:", v16, 0);

LABEL_15:
}

- (void)revalidateItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  char v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  -[AKToolbarViewController controller](self, "controller");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isTornDown") & 1) == 0)
  {
    if (-[AKToolbarViewController_iOS _legacyDoodlesEnabled](self, "_legacyDoodlesEnabled"))
    {
      -[AKToolbarViewController_iOS sketchButton](self, "sketchButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "customView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "validateSender:", v4);

    }
    -[AKToolbarViewController_iOS inkButton](self, "inkButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "validateSender:", v6);

    -[AKToolbarViewController_iOS signatureButton](self, "signatureButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "validateSender:", v8);

    if (-[AKToolbarViewController_iOS _legacyDoodlesEnabled](self, "_legacyDoodlesEnabled"))
    {
      -[AKToolbarViewController_iOS richSketchButton](self, "richSketchButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[AKToolbarViewController_iOS richSketchButton](self, "richSketchButton");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "customView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "validateSender:", v11);

      }
    }
    v12 = objc_msgSend(v31, "validateUndo:", 0);
    v13 = objc_msgSend(v31, "validateRedo:", 0);
    -[AKToolbarViewController_iOS undoButton](self, "undoButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", v12);

    -[AKToolbarViewController_iOS redoButton](self, "redoButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", v13);

    objc_msgSend(v31, "toolController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "currentPageController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pageModelController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "selectedAnnotations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = sub_22901C04C(v20);

    if (v21)
    {
      if (objc_msgSend(v19, "count") == 1)
      {
        objc_msgSend(v19, "anyObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v23 = objc_opt_isKindOfClass() ^ 1;

      }
      else
      {
        v23 = 1;
      }
      -[AKToolbarViewController_iOS lineStyleButton](self, "lineStyleButton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v23 & 1;
      objc_msgSend(v25, "setEnabled:", v26);

      -[AKToolbarViewController_iOS textStyleButton](self, "textStyleButton");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setEnabled:", v26);

      -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "viewIfLoaded");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "superview");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        -[AKToolbarViewController_iOS dismissAttributeToolbarImmediately](self, "dismissAttributeToolbarImmediately");
    }
    else
    {
      v24 = objc_msgSend(v16, "toolMode");
      if (objc_msgSend(v19, "count") || v24 <= 5 && ((1 << v24) & 0x36) != 0)
        -[AKToolbarViewController_iOS showAttributeToolbarForSelectedAnnotations:andToolMode:](self, "showAttributeToolbarForSelectedAnnotations:andToolMode:", v19, v24);
      else
        -[AKToolbarViewController_iOS performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_dismissAttributeToolbarForSelectedAnnotations, 0, 0.0);
    }
    -[AKToolbarViewController_iOS syncUIToSelectedColor](self, "syncUIToSelectedColor");

  }
}

- (void)syncUIToSelectedColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[AKToolbarViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageModelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "selectedAnnotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1
    && (objc_msgSend(v7, "anyObject"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v7, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "typingAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDF6600]);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v7, "count") != 1)
      goto LABEL_8;
    objc_msgSend(v7, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
      goto LABEL_8;
    objc_msgSend(v7, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performSelector:", sel_strokeColor);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (!v18)
  {
LABEL_8:
    objc_msgSend(v4, "strokeColor");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColor:", v18);

  -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setColor:", v18);

  -[AKToolbarViewController_iOS strokeColorButton](self, "strokeColorButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "customView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setColor:", v18);
}

- (id)_barButtonForToolbarType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[AKToolbarViewController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  switch(a3)
  {
    case 0uLL:
      -[AKToolbarViewController_iOS _doodleModeToolbarImage](self, "_doodleModeToolbarImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 764015;
      goto LABEL_15;
    case 1uLL:
      objc_msgSend((id)objc_opt_class(), "imageForToolbarButtonItemOfType:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 764016;
      goto LABEL_15;
    case 2uLL:
    case 8uLL:
    case 0xCuLL:
      break;
    case 3uLL:
      objc_msgSend((id)objc_opt_class(), "imageForToolbarButtonItemOfType:", 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolbarViewController_iOS _createNewToggleToolbarButtonWithImage:tag:target:selector:autoUpdatesColor:](self, "_createNewToggleToolbarButtonWithImage:tag:target:selector:autoUpdatesColor:", v6, 764022, self, sel__showSignaturesPopover_, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      v10 = 764019;
      goto LABEL_11;
    case 4uLL:
      objc_msgSend((id)objc_opt_class(), "imageForToolbarButtonItemOfType:", 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v6, 0, v5, sel_performActionForSender_);
      v7 = v9;
      v10 = 764014;
      goto LABEL_11;
    case 5uLL:
      objc_msgSend((id)objc_opt_class(), "imageForToolbarButtonItemOfType:", 5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = sel__showTextStylePopover_;
      goto LABEL_8;
    case 6uLL:
      objc_msgSend((id)objc_opt_class(), "imageForToolbarButtonItemOfType:", 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = sel__showLineStylePopover_;
LABEL_8:
      -[AKToolbarViewController_iOS _createNewCustomViewToolbarButtonWithImage:target:selector:](self, "_createNewCustomViewToolbarButtonWithImage:target:selector:", v6, self, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 7uLL:
      -[AKToolbarViewController_iOS _createNewColorPickerToolbarButtonWithTarget:selector:](self, "_createNewColorPickerToolbarButtonWithTarget:selector:", self, sel__showColorPickerPopover_);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      goto LABEL_17;
    case 9uLL:
      +[AKAnnotationImageHelper imageForShapeTag:](AKAnnotationImageHelper, "imageForShapeTag:", 764020);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v6, 0, v5, sel_performActionForSender_);
      v7 = v9;
      v10 = 764020;
LABEL_11:
      objc_msgSend(v9, "setTag:", v10);
      goto LABEL_17;
    case 0xAuLL:
      objc_msgSend((id)objc_opt_class(), "imageForToolbarButtonItemOfType:", 10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v6, 0, v5, sel_undo_);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__undoLongPressAction_);
      v17[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setGestureRecognizers:", v14);

      goto LABEL_17;
    case 0xBuLL:
      objc_msgSend((id)objc_opt_class(), "imageForToolbarButtonItemOfType:", 11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v6, 0, v5, sel_redo_);
      goto LABEL_16;
    case 0xDuLL:
      objc_msgSend((id)objc_opt_class(), "imageForToolbarButtonItemOfType:", 13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 764017;
LABEL_15:
      -[AKToolbarViewController_iOS _createNewToggleToolbarButtonWithImage:tag:target:selector:autoUpdatesColor:](self, "_createNewToggleToolbarButtonWithImage:tag:target:selector:autoUpdatesColor:", v6, v8, v5, sel_performActionForSender_, 1);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v7 = (void *)v12;
LABEL_17:
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setAssociatedObject(v7, sel_akToolbarButtonItemType, v15, (void *)0x303);

      }
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (void)_deleteSelectedItems:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AKToolbarViewController controller](self, "controller", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentPageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageModelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v3, "pageModelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mutableArrayValueForKey:", CFSTR("annotations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "removeObjectsInArray:", v6);
  }

}

- (id)_toolbarButtonItemOfType:(unint64_t)a3
{
  void *v3;
  id result;

  switch(a3)
  {
    case 0uLL:
      -[AKToolbarViewController_iOS sketchButton](self, "sketchButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 1uLL:
      -[AKToolbarViewController_iOS richSketchButton](self, "richSketchButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 3uLL:
      -[AKToolbarViewController_iOS signatureButton](self, "signatureButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4uLL:
      -[AKToolbarViewController_iOS textButton](self, "textButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 5uLL:
      -[AKToolbarViewController_iOS textStyleButton](self, "textStyleButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 6uLL:
      -[AKToolbarViewController_iOS lineStyleButton](self, "lineStyleButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 7uLL:
      -[AKToolbarViewController_iOS strokeColorButton](self, "strokeColorButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 9uLL:
      -[AKToolbarViewController_iOS loupeButton](self, "loupeButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 0xAuLL:
      -[AKToolbarViewController_iOS undoButton](self, "undoButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 0xBuLL:
      -[AKToolbarViewController_iOS redoButton](self, "redoButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 0xDuLL:
      -[AKToolbarViewController_iOS inkButton](self, "inkButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      result = v3;
      break;
    default:
      NSLog(CFSTR("toolbarButtonItemOfType %d unsupported"), a2, a3);
      result = 0;
      break;
  }
  return result;
}

- (id)_createNewToggleToolbarButtonWithImage:(id)a3 tag:(int64_t)a4 target:(id)a5 selector:(SEL)a6 autoUpdatesColor:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  AKToggleButton *v14;
  AKToggleButton *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = [AKToggleButton alloc];
  v15 = -[AKToggleButton initWithFrame:templateImage:autoUpdatesColor:](v14, "initWithFrame:templateImage:autoUpdatesColor:", v12, v7, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AKToolbarViewController_iOS traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = sub_22901C04C(v16);

  -[AKToggleButton setShouldTintNormalImage:](v15, "setShouldTintNormalImage:", 1);
  if (v17)
  {
    -[AKToggleButton setShowsBackgroundColor:](v15, "setShowsBackgroundColor:", 1);
    -[AKToolbarViewController_iOS view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tintColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToggleButton setTintColor:](v15, "setTintColor:", v19);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  }
  else
  {
    -[AKToggleButton setShowsBackgroundColor:](v15, "setShowsBackgroundColor:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToggleButton setTintColor:](v15, "setTintColor:", v20);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToggleButton setSelectedColor:](v15, "setSelectedColor:", v21);

  -[AKToggleButton setFrame:](v15, "setFrame:", 0.0, 0.0, 29.0, 29.0);
  -[AKToggleButton layer](v15, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", 3.0);

  -[AKToggleButton setTag:](v15, "setTag:", a4);
  -[AKToggleButton setImage:forState:](v15, "setImage:forState:", v12, 0);
  -[AKToggleButton addTarget:action:forControlEvents:](v15, "addTarget:action:forControlEvents:", v13, a6, 64);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v15);
  return v23;
}

- (id)_createNewColorPickerToolbarButtonWithTarget:(id)a3 selector:(SEL)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[AKColorPaletteButton buttonWithType:](AKColorPaletteButton, "buttonWithType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, 19.0, 19.0);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", v5, a4, 64);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v6);
  return v7;
}

- (id)_createNewCustomViewToolbarButtonWithImage:(id)a3 target:(id)a4 selector:(SEL)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x24BDF6880];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "buttonWithType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v10, "addTarget:action:forControlEvents:", v8, a5, 64);

  objc_msgSend(v10, "setImage:forState:", v9, 0);
  objc_msgSend(v10, "sizeToFit");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v10);

  return v11;
}

- (id)_doodleModeToolbarImage
{
  void *v2;
  unsigned int v3;

  -[AKToolbarViewController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDrawVariableStrokeDoodles");

  objc_msgSend((id)objc_opt_class(), "imageForToolbarButtonItemOfType:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)heightIncludingAdditionalVisibleBars
{
  void *v3;
  double Height;
  double v5;
  double v6;
  CGRect v8;

  -[AKToolbarViewController_iOS view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v8);
  -[AKToolbarViewController_iOS visibleHeightOfAttributeBar](self, "visibleHeightOfAttributeBar");
  v6 = Height + v5;

  return v6;
}

- (double)visibleHeightOfAttributeBar
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double height;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (v3)
  {
    v5 = (void *)v3;
    -[AKToolbarViewController_iOS floatingAttributeToolbarContainer](self, "floatingAttributeToolbarContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AKToolbarViewController_iOS view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolbarViewController_iOS view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[AKToolbarViewController_iOS floatingAttributeToolbarContainer](self, "floatingAttributeToolbarContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      objc_msgSend(v9, "convertRect:toView:", 0);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v10, "frame");
      objc_msgSend(v9, "convertRect:toView:", 0);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v29.origin.x = v12;
      v29.origin.y = v14;
      v29.size.width = v16;
      v29.size.height = v18;
      v32.origin.x = v20;
      v32.origin.y = v22;
      v32.size.width = v24;
      v32.size.height = v26;
      v30 = CGRectIntersection(v29, v32);
      height = v30.size.height;
      v4 = 0.0;
      if (!CGRectIsNull(v30))
      {
        v31.origin.x = v20;
        v31.origin.y = v22;
        v31.size.width = v24;
        v31.size.height = v26;
        v4 = CGRectGetHeight(v31) - height;
      }

    }
  }
  return v4;
}

- (int64_t)_attributeTagForCurrentSelectionState
{
  int64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;

  v2 = 765101;
  -[AKToolbarViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectedAnnotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v2 = 765106;
  }

  return v2;
}

- (void)setBarTintColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_barTintColor, a3);
  v5 = a3;
  -[AKToolbarViewController_iOS view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarTintColor:", v5);

}

- (void)setTintColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_tintColor, a3);
  v5 = a3;
  -[AKToolbarViewController_iOS view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (BOOL)isPresentingPopover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  -[AKToolbarViewController_iOS lineStylesViewController](self, "lineStylesViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  -[AKToolbarViewController_iOS textAttributesViewController](self, "textAttributesViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 1;
  -[AKToolbarViewController_iOS undoAlertController](self, "undoAlertController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9 != 0;
}

- (void)_undoManagerNotification:(id)a3
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3))
  {
    -[AKToolbarViewController_iOS revalidateItems](self, "revalidateItems");
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2290044A8;
    block[3] = &unk_24F1A7328;
    block[4] = self;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)_undoLongPressAction:(id)a3
{
  void *v4;
  char isKindOfClass;
  id v6;

  v6 = a3;
  -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    -[AKToolbarViewController_iOS _showUndoAlert:](self, "_showUndoAlert:", v6);

}

- (void)_undoButtonAction:(id)a3
{
  id v3;

  -[AKToolbarViewController controller](self, "controller", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undo:", 0);

}

- (void)_redoButtonAction:(id)a3
{
  id v3;

  -[AKToolbarViewController controller](self, "controller", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "redo:", 0);

}

- (void)_undoAllButtonAction:(id)a3
{
  id v3;

  -[AKToolbarViewController controller](self, "controller", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "validateUndo:", 0))
  {
    do
      objc_msgSend(v3, "undo:", 0);
    while ((objc_msgSend(v3, "validateUndo:", 0) & 1) != 0);
  }

}

- (void)_showUndoAlert:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AKToolbarViewController_iOS _buildUndoAlertController](self, "_buildUndoAlertController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AKToolbarViewController_iOS undoButton](self, "undoButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarButtonItem:", v4);

  objc_msgSend(v6, "setModalPresentationStyle:", 7);
  -[AKToolbarViewController_iOS presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (id)_buildUndoAlertController
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  -[AKToolbarViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = objc_msgSend(v3, "validateUndo:", 0);
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[AKController akBundle](AKController, "akBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Undo"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "undoController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "undoManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "undoActionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v7, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    v12 = (void *)MEMORY[0x24BDF67E8];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_229004994;
    v25[3] = &unk_24F1A7A60;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v12, "actionWithTitle:style:handler:", v7, 0, v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v13);
    v14 = (void *)MEMORY[0x24BDF67E8];
    +[AKController akBundle](AKController, "akBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Undo All"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_2290049C4;
    v23[3] = &unk_24F1A7A60;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addAction:", v17);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v26);
  }
  v18 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v21);

  objc_destroyWeak(&location);
  return v5;
}

- (BOOL)_validateUndoButton
{
  void *v2;
  char v3;

  -[AKToolbarViewController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "validateUndo:", 0);

  return v3;
}

- (BOOL)isPresentingPopovers
{
  void *v2;
  BOOL v3;

  -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)dismissPresentedPopovers
{
  -[AKToolbarViewController_iOS _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, 0);
}

- (void)_showSignaturesPopover:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  AKToolbarViewController_iOS *v14;
  _QWORD v15[5];

  -[AKToolbarViewController controller](self, "controller", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signatureModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "toolMode");

  if (v7 == 5)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setTag:", 764022);
    objc_msgSend(v4, "performActionForSender:", v8);

  }
  objc_msgSend(v5, "signatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = sub_229004BE0;
      v12[3] = &unk_24F1A76F8;
      v13 = v4;
      v14 = self;
      -[AKToolbarViewController_iOS _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v12);

    }
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_229004BD4;
    v15[3] = &unk_24F1A7328;
    v15[4] = self;
    -[AKToolbarViewController_iOS _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v15);
  }

}

- (void)_showLineStylePopover:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AKToolbarViewController_iOS lineStylesViewController](self, "lineStylesViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_2290051A0;
    v5[3] = &unk_24F1A7328;
    v5[4] = self;
    -[AKToolbarViewController_iOS _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v5);
  }
}

- (void)_showTextStylePopover:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AKToolbarViewController_iOS textAttributesViewController](self, "textAttributesViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_229005484;
    v5[3] = &unk_24F1A7328;
    v5[4] = self;
    -[AKToolbarViewController_iOS _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v5);
  }
}

- (void)_showColorPickerPopover:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_229005768;
    v5[3] = &unk_24F1A7328;
    v5[4] = self;
    -[AKToolbarViewController_iOS _dismissCurrentlyPresentedPopoverAnimated:withCompletion:](self, "_dismissCurrentlyPresentedPopoverAnimated:withCompletion:", 0, v5);
  }
}

- (void)_dismissCurrentlyPresentedPopoverAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v4 = a3;
  v30 = a4;
  -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "popoverPresentationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setDelegate:", 0);

      -[AKToolbarViewController_iOS setSignaturesSheetViewController:](self, "setSignaturesSheetViewController:", 0);
    }
    else
    {
      -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolbarViewController_iOS lineStylesViewController](self, "lineStylesViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v10)
      {
        -[AKToolbarViewController_iOS lineStylesViewController](self, "lineStylesViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "popoverPresentationController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setDelegate:", 0);

        -[AKToolbarViewController_iOS setLineStylesViewController:](self, "setLineStylesViewController:", 0);
      }
      else
      {
        -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKToolbarViewController_iOS undoAlertController](self, "undoAlertController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
        {
          -[AKToolbarViewController_iOS undoAlertController](self, "undoAlertController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "popoverPresentationController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setDelegate:", 0);

          -[AKToolbarViewController_iOS setUndoAlertController:](self, "setUndoAlertController:", 0);
        }
        else
        {
          -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKToolbarViewController_iOS textAttributesViewController](self, "textAttributesViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v14)
          {
            -[AKToolbarViewController_iOS textAttributesViewController](self, "textAttributesViewController");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "popoverPresentationController");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setDelegate:", 0);

            -[AKToolbarViewController_iOS setTextAttributesViewController:](self, "setTextAttributesViewController:", 0);
          }
          else
          {
            -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15 == v16)
            {
              -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "removeObserver:forKeyPath:", self, CFSTR("color"));

              -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "popoverPresentationController");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setDelegate:", 0);

              -[AKToolbarViewController_iOS setColorPickerPopoverViewController:](self, "setColorPickerPopoverViewController:", 0);
            }
          }
        }
      }
    }
    -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dismissViewControllerAnimated:completion:", v4, v30);

    objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 0);
    goto LABEL_15;
  }
  v20 = v30;
  if (v30)
  {
    (*((void (**)(id))v30 + 2))(v30);
LABEL_15:
    v20 = v30;
  }

}

- (void)_setupPassthroughViewsForViewController:(id)a3
{
  AKLineStylesViewController *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v4 = (AKLineStylesViewController *)a3;
  -[AKLineStylesViewController popoverPresentationController](v4, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passthroughViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v22 = v5;
  objc_msgSend(v5, "_setIgnoreBarButtonItemSiblings:", 1);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AKToolbarViewController_iOS lineStyleButton](self, "lineStyleButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  -[AKToolbarViewController_iOS strokeColorButton](self, "strokeColorButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  -[AKToolbarViewController_iOS textStyleButton](self, "textStyleButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "customView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v14);

  if ((AKLineStylesViewController *)self->_colorPickerPopoverViewController == v4)
  {
    -[AKToolbarViewController_iOS strokeColorButton](self, "strokeColorButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((AKLineStylesViewController *)self->_textAttributesViewController == v4)
  {
    -[AKToolbarViewController_iOS textStyleButton](self, "textStyleButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_lineStylesViewController != v4)
      goto LABEL_10;
    -[AKToolbarViewController_iOS lineStyleButton](self, "lineStyleButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  objc_msgSend(v15, "customView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v17);

LABEL_10:
  -[AKToolbarViewController controller](self, "controller");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentPageController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "overlayView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v7, "addObject:", v20);
  objc_msgSend(v22, "setPassthroughViews:", v7);

}

- (void)_layoutAttributeContainer
{
  void *v3;
  void *v4;
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
  double Height;
  void *v16;
  void *v17;
  id firstValue;
  CGRect v19;

  -[AKToolbarViewController_iOS floatingAttributeToolbarContainer](self, "floatingAttributeToolbarContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[AKToolbarViewController_iOS floatingAttributeToolbarContainer](self, "floatingAttributeToolbarContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AKToolbarViewController_iOS floatingAttributeToolbarContainer](self, "floatingAttributeToolbarContainer");
    firstValue = (id)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKToolbarViewController_iOS view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v7, "insertSubview:belowSubview:", firstValue, v8);
      _NSDictionaryOfVariableBindings(CFSTR("attributeToolbarContainer, toolbar"), firstValue, v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[attributeToolbarContainer]|"), 0, 0, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activateConstraints:", v11);

      v12 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[attributeToolbarContainer(44@999)]"), 0, 0, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activateConstraints:", v13);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", firstValue, 4, 0, v8, 3, 1.0, 0.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolbarViewController_iOS setAttributeToolbarViewControllerConstraint:](self, "setAttributeToolbarViewControllerConstraint:", v14);

      objc_msgSend(v8, "frame");
      Height = CGRectGetHeight(v19);
      -[AKToolbarViewController_iOS attributeToolbarViewControllerConstraint](self, "attributeToolbarViewControllerConstraint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConstant:", Height);

      -[AKToolbarViewController_iOS attributeToolbarViewControllerConstraint](self, "attributeToolbarViewControllerConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setActive:", 1);

      objc_msgSend(v7, "layoutIfNeeded");
    }

  }
}

- (void)showAttributeToolbarForSelectedAnnotations:(id)a3 andToolMode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  AKFloatingAttributePickerViewController *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  double Height;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int64_t v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  void *v45;
  _QWORD v46[2];
  CGRect v47;

  v46[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[AKToolbarViewController_iOS _layoutAttributeContainer](self, "_layoutAttributeContainer");
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_dismissAttributeToolbarForSelectedAnnotations, 0);
  -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[AKToolbarViewController controller](self, "controller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AKFloatingAttributePickerViewController initWithController:]([AKFloatingAttributePickerViewController alloc], "initWithController:", v7);
    -[AKToolbarViewController_iOS setAttributeToolbarViewController:](self, "setAttributeToolbarViewController:", v8);

    -[AKToolbarViewController_iOS floatingAttributeToolbarContainer](self, "floatingAttributeToolbarContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v11);

    -[AKToolbarViewController_iOS barTintColor](self, "barTintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toolbar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBarTintColor:", v12);

    -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _NSDictionaryOfVariableBindings(CFSTR("attributeToolbar"), v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[attributeToolbar]|"), 0, 0, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v19);

    v20 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[attributeToolbar]|"), 0, 0, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v21);

    -[AKToolbarViewController_iOS view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKToolbarViewController_iOS view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    Height = CGRectGetHeight(v47);
    -[AKToolbarViewController_iOS attributeToolbarViewControllerConstraint](self, "attributeToolbarViewControllerConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConstant:", Height);

    -[AKToolbarViewController_iOS attributeToolbarViewControllerConstraint](self, "attributeToolbarViewControllerConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    objc_msgSend(v23, "layoutIfNeeded");
    v28 = (void *)MEMORY[0x24BDF6F90];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = sub_2290066E4;
    v42[3] = &unk_24F1A7AB8;
    v42[4] = self;
    v43 = v23;
    v44 = v7;
    v29 = v7;
    v30 = v23;
    objc_msgSend(v28, "animateWithDuration:animations:completion:", v42, 0, 0.1);

  }
  if (objc_msgSend(v5, "count") != 1)
  {
    -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS lineStyleButton](self, "lineStyleButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v31;
    v36 = v33;
LABEL_16:
    objc_msgSend(v35, "setRightButtonItems:animated:", v36, 1);
    goto LABEL_17;
  }
  objc_msgSend(v5, "anyObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS textStyleButton](self, "textStyleButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setRightButtonItems:animated:", v34, 1);

LABEL_17:
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AKToolbarViewController_iOS textStyleButton](self, "textStyleButton");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v37);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AKToolbarViewController_iOS lineStyleButton](self, "lineStyleButton");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v38);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v31, "pathIsPrestroked"))
        {
          -[AKToolbarViewController_iOS lineStyleButton](self, "lineStyleButton");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "removeObject:", v39);

        }
      }
    }
    -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v35;
    v36 = v32;
    goto LABEL_16;
  }
  -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setRightButtonItems:animated:", 0, 1);
LABEL_18:

  v40 = -[AKToolbarViewController_iOS _attributeTagForCurrentSelectionState](self, "_attributeTagForCurrentSelectionState");
  -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setColorAttributeTag:", v40);

  -[AKToolbarViewController_iOS syncUIToSelectedColor](self, "syncUIToSelectedColor");
}

- (void)dismissAttributeToolbarForSelectedAnnotations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  id v13;

  -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKToolbarViewController_iOS view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKToolbarViewController_iOS view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDF6F90];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_229006860;
    v11[3] = &unk_24F1A7AB8;
    v11[4] = self;
    v12 = v6;
    v13 = v5;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_2290068B4;
    v10[3] = &unk_24F1A7608;
    v10[4] = self;
    v8 = v5;
    v9 = v6;
    objc_msgSend(v7, "animateWithDuration:animations:completion:", v11, v10, 0.1);

  }
}

- (void)dismissAttributeToolbarImmediately
{
  double Height;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CGRect v8;

  -[AKToolbarViewController_iOS view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  Height = CGRectGetHeight(v8);
  -[AKToolbarViewController_iOS attributeToolbarViewControllerConstraint](self, "attributeToolbarViewControllerConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", Height);

  -[AKToolbarViewController_iOS attributeToolbarViewController](self, "attributeToolbarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[AKToolbarViewController_iOS setAttributeToolbarViewController:](self, "setAttributeToolbarViewController:", 0);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  AKLog(CFSTR("%s %@"));
  -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS presentationControllerShouldDismiss:]", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "popoverPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setSignaturesSheetViewController:](self, "setSignaturesSheetViewController:", 0);
    goto LABEL_14;
  }
  -[AKToolbarViewController_iOS lineStylesViewController](self, "lineStylesViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    -[AKToolbarViewController_iOS lineStylesViewController](self, "lineStylesViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "popoverPresentationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setLineStylesViewController:](self, "setLineStylesViewController:", 0);
LABEL_13:
    objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 0);
    goto LABEL_14;
  }
  -[AKToolbarViewController_iOS undoAlertController](self, "undoAlertController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "popoverPresentationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
    -[AKToolbarViewController_iOS undoAlertController](self, "undoAlertController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "popoverPresentationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setUndoAlertController:](self, "setUndoAlertController:", 0);
    goto LABEL_13;
  }
  -[AKToolbarViewController_iOS textAttributesViewController](self, "textAttributesViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "popoverPresentationController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    -[AKToolbarViewController_iOS textAttributesViewController](self, "textAttributesViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "popoverPresentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setTextAttributesViewController:](self, "setTextAttributesViewController:", 0);
    goto LABEL_13;
  }
  -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "popoverPresentationController");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v4)
  {
    -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeObserver:forKeyPath:", self, CFSTR("color"));

    -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "popoverPresentationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setColorPickerPopoverViewController:](self, "setColorPickerPopoverViewController:", 0);
    goto LABEL_13;
  }
  -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "popoverPresentationController");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v4)
  {
    -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setSignaturesAlertController:](self, "setSignaturesAlertController:", 0);
  }
LABEL_14:

  return 1;
}

- (void)signaturesViewControllerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  AKLog(CFSTR("%s %@"));
  -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS signaturesViewControllerDidCancel:]", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKToolbarViewController controller](self, "controller");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "controllerWillDismissSignatureManagerView:", v12);
    -[AKToolbarViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setSignaturesSheetViewController:](self, "setSignaturesSheetViewController:", 0);
  }
  else
  {
    -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "popoverPresentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDelegate:", 0);

      -[AKToolbarViewController_iOS setSignaturesAlertController:](self, "setSignaturesAlertController:", 0);
    }
  }
}

- (void)signaturesViewControllerDidSelectSignature:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  AKLog(CFSTR("%s %@"));
  -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS signaturesViewControllerDidSelectSignature:]", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKToolbarViewController controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "controllerWillDismissSignatureManagerView:", v5);
    -[AKToolbarViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", 0);

    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setSignaturesSheetViewController:](self, "setSignaturesSheetViewController:", 0);
  }
  else
  {
    -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[AKToolbarViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "popoverPresentationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:", 0);

      -[AKToolbarViewController_iOS setSignaturesAlertController:](self, "setSignaturesAlertController:", 0);
    }
  }
  -[AKToolbarViewController controller](self, "controller");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDF6880]);
  v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v14, "setTag:", 764019);
  objc_msgSend(v16, "performActionForSender:", v14);

}

- (void)signaturesViewControllerContinueToManageSignatures:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AKSignaturesViewController_iOS *v10;
  void *v11;
  AKSignaturesViewController_iOS *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[AKToolbarViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setSignaturesAlertController:](self, "setSignaturesAlertController:", 0);
  }
  AKLog(CFSTR("%s %@"));
  -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS signaturesViewControllerContinueToManageSignatures:]", v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v23;
  if (!v8)
  {
    v10 = [AKSignaturesViewController_iOS alloc];
    -[AKToolbarViewController controller](self, "controller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AKSignaturesViewController_iOS initWithController:](v10, "initWithController:", v11);
    -[AKToolbarViewController_iOS setSignaturesSheetViewController:](self, "setSignaturesSheetViewController:", v12);

    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "userInterfaceIdiom") == 1)
      v15 = 5;
    else
      v15 = 0;
    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setModalPresentationStyle:", v15);

    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShowsNavigationBar:", 1);

    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPresentedInAlert:", 0);

    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsEdits:", 1);

    -[AKToolbarViewController controller](self, "controller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v21, "controllerWillShowSignatureManagerView:", v20);
    -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);

    v9 = v23;
  }

}

- (void)signaturesViewControllerEnterSignatureMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKToolbarViewController_iOS presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[AKToolbarViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    -[AKToolbarViewController_iOS setSignaturesAlertController:](self, "setSignaturesAlertController:", 0);
  }
  -[AKToolbarViewController controller](self, "controller");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setTag:", 764022);
  objc_msgSend(v9, "performActionForSender:", v8);

}

- (void)signaturesViewControllerContinueToCreateSignature:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  _QWORD v8[5];

  AKLog(CFSTR("%s %@"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_229007394;
  v8[3] = &unk_24F1A7328;
  v8[4] = self;
  v4 = (void (**)(_QWORD))MEMORY[0x22E2C12D0](v8);
  -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS signaturesViewControllerContinueToCreateSignature:]", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    || (-[AKToolbarViewController_iOS signaturesAlertController](self, "signaturesAlertController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    -[AKToolbarViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
  }
  else
  {
    v4[2](v4);
  }

}

- (void)signatureCreationControllerDidCreateSignature:(id)a3
{
  id v3;
  void *v4;
  id v5;

  -[AKToolbarViewController controller](self, "controller", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDF6880]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setTag:", 764019);
  objc_msgSend(v5, "performActionForSender:", v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("color")))
  {
    -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v13)
    {
      -[AKToolbarViewController_iOS strokeColorButton](self, "strokeColorButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "customView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[AKToolbarViewController_iOS colorPickerPopoverViewController](self, "colorPickerPopoverViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "color");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setColor:", v12);

    }
  }

}

- (void)_peripheralAvailabilityDidUpdate:(id)a3
{
  void *v4;
  void *v5;

  if (-[AKToolbarViewController_iOS _legacyDoodlesEnabled](self, "_legacyDoodlesEnabled", a3))
  {
    -[AKToolbarViewController_iOS sketchButton](self, "sketchButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarViewController_iOS _updateToggleButton:withTraitCollection:](self, "_updateToggleButton:withTraitCollection:", v4, v5);

  }
  -[AKToolbarViewController_iOS revalidateItems](self, "revalidateItems");
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIView)floatingAttributeToolbarContainer
{
  return self->_floatingAttributeToolbarContainer;
}

- (void)setFloatingAttributeToolbarContainer:(id)a3
{
  objc_storeStrong((id *)&self->_floatingAttributeToolbarContainer, a3);
}

- (UIBarButtonItem)richSketchButton
{
  return self->_richSketchButton;
}

- (void)setRichSketchButton:(id)a3
{
  objc_storeStrong((id *)&self->_richSketchButton, a3);
}

- (UIBarButtonItem)sketchButton
{
  return self->_sketchButton;
}

- (void)setSketchButton:(id)a3
{
  objc_storeStrong((id *)&self->_sketchButton, a3);
}

- (UIBarButtonItem)inkButton
{
  return self->_inkButton;
}

- (void)setInkButton:(id)a3
{
  objc_storeStrong((id *)&self->_inkButton, a3);
}

- (UIBarButtonItem)textButton
{
  return self->_textButton;
}

- (void)setTextButton:(id)a3
{
  objc_storeStrong((id *)&self->_textButton, a3);
}

- (UIBarButtonItem)loupeButton
{
  return self->_loupeButton;
}

- (void)setLoupeButton:(id)a3
{
  objc_storeStrong((id *)&self->_loupeButton, a3);
}

- (UIBarButtonItem)signatureButton
{
  return self->_signatureButton;
}

- (void)setSignatureButton:(id)a3
{
  objc_storeStrong((id *)&self->_signatureButton, a3);
}

- (UIBarButtonItem)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
  objc_storeStrong((id *)&self->_undoButton, a3);
}

- (UIBarButtonItem)redoButton
{
  return self->_redoButton;
}

- (void)setRedoButton:(id)a3
{
  objc_storeStrong((id *)&self->_redoButton, a3);
}

- (UIBarButtonItem)textStyleButton
{
  return self->_textStyleButton;
}

- (void)setTextStyleButton:(id)a3
{
  objc_storeStrong((id *)&self->_textStyleButton, a3);
}

- (UIBarButtonItem)lineStyleButton
{
  return self->_lineStyleButton;
}

- (void)setLineStyleButton:(id)a3
{
  objc_storeStrong((id *)&self->_lineStyleButton, a3);
}

- (UIBarButtonItem)strokeColorButton
{
  return self->_strokeColorButton;
}

- (void)setStrokeColorButton:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColorButton, a3);
}

- (NSArray)staticToolbarItems
{
  return self->_staticToolbarItems;
}

- (void)setStaticToolbarItems:(id)a3
{
  objc_storeStrong((id *)&self->_staticToolbarItems, a3);
}

- (UIAlertController)signaturesAlertController
{
  return self->_signaturesAlertController;
}

- (void)setSignaturesAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_signaturesAlertController, a3);
}

- (UIAlertController)undoAlertController
{
  return self->_undoAlertController;
}

- (void)setUndoAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_undoAlertController, a3);
}

- (AKSignaturesViewController_iOS)signaturesSheetViewController
{
  return self->_signaturesSheetViewController;
}

- (void)setSignaturesSheetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_signaturesSheetViewController, a3);
}

- (AKLineStylesViewController)lineStylesViewController
{
  return self->_lineStylesViewController;
}

- (void)setLineStylesViewController:(id)a3
{
  objc_storeStrong((id *)&self->_lineStylesViewController, a3);
}

- (AKTextAttributesViewController)textAttributesViewController
{
  return self->_textAttributesViewController;
}

- (void)setTextAttributesViewController:(id)a3
{
  objc_storeStrong((id *)&self->_textAttributesViewController, a3);
}

- (AKColorPickerViewController)colorPickerPopoverViewController
{
  return self->_colorPickerPopoverViewController;
}

- (void)setColorPickerPopoverViewController:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerPopoverViewController, a3);
}

- (AKFloatingAttributePickerViewController)attributeToolbarViewController
{
  return self->_attributeToolbarViewController;
}

- (void)setAttributeToolbarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_attributeToolbarViewController, a3);
}

- (NSLayoutConstraint)attributeToolbarViewControllerConstraint
{
  return self->_attributeToolbarViewControllerConstraint;
}

- (void)setAttributeToolbarViewControllerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_attributeToolbarViewControllerConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeToolbarViewControllerConstraint, 0);
  objc_storeStrong((id *)&self->_attributeToolbarViewController, 0);
  objc_storeStrong((id *)&self->_colorPickerPopoverViewController, 0);
  objc_storeStrong((id *)&self->_textAttributesViewController, 0);
  objc_storeStrong((id *)&self->_lineStylesViewController, 0);
  objc_storeStrong((id *)&self->_signaturesSheetViewController, 0);
  objc_storeStrong((id *)&self->_undoAlertController, 0);
  objc_storeStrong((id *)&self->_signaturesAlertController, 0);
  objc_storeStrong((id *)&self->_staticToolbarItems, 0);
  objc_storeStrong((id *)&self->_strokeColorButton, 0);
  objc_storeStrong((id *)&self->_lineStyleButton, 0);
  objc_storeStrong((id *)&self->_textStyleButton, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_signatureButton, 0);
  objc_storeStrong((id *)&self->_loupeButton, 0);
  objc_storeStrong((id *)&self->_textButton, 0);
  objc_storeStrong((id *)&self->_inkButton, 0);
  objc_storeStrong((id *)&self->_sketchButton, 0);
  objc_storeStrong((id *)&self->_richSketchButton, 0);
  objc_storeStrong((id *)&self->_floatingAttributeToolbarContainer, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
}

@end
