@implementation PKHandwritingDataCollectionViewController

- (_QWORD)initWithDrawings:(void *)a3 metadata:
{
  id v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)PKHandwritingDataCollectionViewController;
  v4 = a3;
  v5 = a2;
  v6 = objc_msgSendSuper2(&v12, sel_init);
  v7 = objc_msgSend(v5, "copy", v12.receiver, v12.super_class);

  v8 = (void *)v6[125];
  v6[125] = v7;

  v9 = objc_msgSend(v4, "copy");
  v10 = (void *)v6[126];
  v6[126] = v9;

  return v6;
}

- (void)segmentChanged:(id)a3
{
  void *v4;
  PKHandwritingDataCollecting *currentDataCollector;
  void *v6;
  void *v7;
  PKHandwritingDataCollecting *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  PKHandwritingDataCollecting *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  PKHandwritingDataCollecting *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PKHandwritingDataCollecting *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a3;
  if (self)
  {
    -[PKHandwritingDataCollecting viewController](self->_currentDataCollector, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willMoveToParentViewController:", 0);

    currentDataCollector = self->_currentDataCollector;
  }
  else
  {
    objc_msgSend(0, "viewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "willMoveToParentViewController:", 0);

    currentDataCollector = 0;
  }
  -[PKHandwritingDataCollecting viewController](currentDataCollector, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  if (self)
    v8 = self->_currentDataCollector;
  else
    v8 = 0;
  -[PKHandwritingDataCollecting viewController](v8, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromParentViewController");

  v10 = objc_msgSend(v34, "selectedSegmentIndex");
  if (self)
  {
    v11 = 5;
    if (!v10)
      v11 = 4;
    objc_storeStrong((id *)&self->_currentDataCollector, *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKHandwritingDataCollectionViewController__drawings[v11]));
    v12 = self->_currentDataCollector;
  }
  else
  {
    v12 = 0;
  }
  -[PKHandwritingDataCollecting viewController](v12, "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHandwritingDataCollectionViewController addChildViewController:](self, "addChildViewController:", v13);

  -[PKHandwritingDataCollectionViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  if (self)
    v23 = self->_currentDataCollector;
  else
    v23 = 0;
  -[PKHandwritingDataCollecting viewController](v23, "viewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v16, v18, v20, v22);

  -[PKHandwritingDataCollectionViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[PKHandwritingDataCollecting viewController](self->_currentDataCollector, "viewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v28);

    v29 = self->_currentDataCollector;
  }
  else
  {
    objc_msgSend(0, "viewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v33);

    v29 = 0;
  }
  -[PKHandwritingDataCollecting viewController](v29, "viewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "didMoveToParentViewController:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKRecognitionDataCollectionViewController *v14;
  NSArray *v15;
  NSDictionary *metadata;
  NSDictionary *v17;
  PKRecognitionDataCollectionViewController *v18;
  PKAutorefineDataCollectionViewController *v19;
  id *p_isa;
  NSArray *v21;
  id *v22;
  PKHandwritingDataCollecting *currentDataCollector;
  PKHandwritingDataCollecting *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  PKHandwritingDataCollecting *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PKHandwritingDataCollecting *v41;
  PKHandwritingDataCollecting *v42;
  void *v43;
  void *v44;
  UISegmentedControl *segmentControl;
  UISegmentedControl *v46;
  void *v47;
  UISegmentedControl *v48;
  void *v49;
  void *v50;
  UISegmentedControl *v51;
  UISegmentedControl *v52;
  void *v53;
  UISegmentedControl *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  UISegmentedControl *v59;
  UISegmentedControl *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  UISegmentedControl *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  UISegmentedControl *v77;
  objc_super v78;
  _QWORD v79[5];

  v79[3] = *MEMORY[0x1E0C80C00];
  v78.receiver = self;
  v78.super_class = (Class)PKHandwritingDataCollectionViewController;
  -[PKHandwritingDataCollectionViewController viewDidLoad](&v78, sel_viewDidLoad);
  _PencilKitBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Handwriting Feedback"), CFSTR("Handwriting Feedback"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHandwritingDataCollectionViewController setTitle:](self, "setTitle:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHandwritingDataCollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped_);
  -[PKHandwritingDataCollectionViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _PencilKitBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Submit"), CFSTR("Submit"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 2, self, sel_sendRadarButtonTapped_);
  -[PKHandwritingDataCollectionViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

  if (os_variant_has_internal_diagnostics())
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E77ECA48);
    -[PKHandwritingDataCollectionViewController setSegmentControl:]((uint64_t)self, v44);

    if (self)
    {
      -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentControl, "setSelectedSegmentIndex:", 0);
      segmentControl = self->_segmentControl;
    }
    else
    {
      objc_msgSend(0, "setSelectedSegmentIndex:", 0);
      segmentControl = 0;
    }
    -[UISegmentedControl addTarget:action:forControlEvents:](segmentControl, "addTarget:action:forControlEvents:", self, sel_segmentChanged_, 4096);
    if (self)
    {
      v46 = self->_segmentControl;
      -[PKHandwritingDataCollectionViewController navigationItem](self, "navigationItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setTitleView:", v46);

      v48 = self->_segmentControl;
    }
    else
    {
      objc_msgSend(0, "navigationItem");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setTitleView:", 0);

      v48 = 0;
    }
    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKHandwritingDataCollectionViewController view](self, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (self)
      v51 = self->_segmentControl;
    else
      v51 = 0;
    objc_msgSend(v49, "addSubview:", v51);

    if (self)
      v52 = self->_segmentControl;
    else
      v52 = 0;
    v71 = (void *)MEMORY[0x1E0CB3718];
    v77 = v52;
    -[UISegmentedControl topAnchor](v77, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHandwritingDataCollectionViewController view](self, "view");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "safeAreaLayoutGuide");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "topAnchor");
    v76 = v53;
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", 8.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v72;
    if (self)
      v54 = self->_segmentControl;
    else
      v54 = 0;
    v70 = v54;
    -[UISegmentedControl leadingAnchor](v70, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHandwritingDataCollectionViewController view](self, "view");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v55;
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, 16.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v58;
    if (self)
      v59 = self->_segmentControl;
    else
      v59 = 0;
    v60 = v59;
    -[UISegmentedControl trailingAnchor](v60, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHandwritingDataCollectionViewController view](self, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v63, -16.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "activateConstraints:", v65);

  }
  v14 = [PKRecognitionDataCollectionViewController alloc];
  if (self)
  {
    v15 = self->_drawings;
    metadata = self->_metadata;
  }
  else
  {
    v15 = 0;
    metadata = 0;
  }
  v17 = metadata;
  v18 = -[PKRecognitionDataCollectionViewController initWithDrawings:metadata:](v14, "initWithDrawings:metadata:", v15, v17);
  if (self)
    objc_storeStrong((id *)&self->_handwritingDataCollector, v18);

  v19 = [PKAutorefineDataCollectionViewController alloc];
  p_isa = (id *)&v19->super.super.super.isa;
  if (self)
  {
    v21 = self->_drawings;
    v22 = -[PKAutorefineDataCollectionViewController initWithDrawings:](p_isa, v21);
    objc_storeStrong((id *)&self->_autorefineDataCollector, v22);

    objc_storeStrong((id *)&self->_currentDataCollector, self->_handwritingDataCollector);
    currentDataCollector = self->_currentDataCollector;
  }
  else
  {

    currentDataCollector = 0;
  }
  v24 = currentDataCollector;
  -[PKHandwritingDataCollecting viewController](v24, "viewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHandwritingDataCollectionViewController addChildViewController:](self, "addChildViewController:", v25);

  -[PKHandwritingDataCollectionViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  if (self)
    v35 = self->_currentDataCollector;
  else
    v35 = 0;
  -[PKHandwritingDataCollecting viewController](v35, "viewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v28, v30, v32, v34);

  -[PKHandwritingDataCollectionViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[PKHandwritingDataCollecting viewController](self->_currentDataCollector, "viewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v40);

    v41 = self->_currentDataCollector;
  }
  else
  {
    objc_msgSend(0, "viewController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v67);

    v41 = 0;
  }
  v42 = v41;
  -[PKHandwritingDataCollecting viewController](v42, "viewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "didMoveToParentViewController:", self);

}

- (void)setSegmentControl:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 968), a2);
}

- (void)cancelButtonTapped:(id)a3
{
  -[PKHandwritingDataCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)sendRadarButtonTapped:(id)a3
{
  PKHandwritingDataCollectionViewController *v3;

  v3 = self;
  if (self)
    self = (PKHandwritingDataCollectionViewController *)self->_currentDataCollector;
  -[PKHandwritingDataCollectionViewController submitFeedback](self, "submitFeedback", a3);
  -[PKHandwritingDataCollectionViewController dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_drawings, 0);
  objc_storeStrong((id *)&self->_autorefineDataCollector, 0);
  objc_storeStrong((id *)&self->_handwritingDataCollector, 0);
  objc_storeStrong((id *)&self->_currentDataCollector, 0);
  objc_storeStrong((id *)&self->_segmentControl, 0);
}

@end
