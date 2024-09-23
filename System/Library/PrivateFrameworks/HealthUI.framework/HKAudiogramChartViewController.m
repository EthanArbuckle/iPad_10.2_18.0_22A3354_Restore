@implementation HKAudiogramChartViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v13;
  id v14;
  void *v15;

  v13 = a10;
  v14 = a5;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithApplicationItems:factorDisplayTypes:chartHeight:", v14, v13, 350.0);

  objc_msgSend(v15, "queryForAudiograms");
  return v15;
}

- (HKAudiogramChartViewController)initWithApplicationItems:(id)a3 factorDisplayTypes:(id)a4 chartHeight:(double)a5
{
  id v9;
  id v10;
  HKAudiogramChartViewController *v11;
  HKAudiogramChartViewController *v12;
  NSMutableArray *audiograms;
  HKInteractiveChartAnnotationView *currentValueView;
  HKAudiogramCurrentValueViewDataSource *currentValueViewDataSource;
  HKAudiogramAnnotationViewDataSource *annotationViewDataSource;
  NSArray *sections;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HKAudiogramChartViewController;
  v11 = -[HKAudiogramChartViewController init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_applicationItems, a3);
    v12->_chartHeight = a5;
    audiograms = v12->_audiograms;
    v12->_audiograms = 0;

    v12->_currentAudiogramIndex = -1;
    currentValueView = v12->_currentValueView;
    v12->_currentValueView = 0;

    currentValueViewDataSource = v12->_currentValueViewDataSource;
    v12->_currentValueViewDataSource = 0;

    annotationViewDataSource = v12->_annotationViewDataSource;
    v12->_annotationViewDataSource = 0;

    v12->_selectedOverlayEar = 0;
    sections = v12->_sections;
    v12->_sections = 0;

    v12->_audiogramsFetched = 0;
    -[HKAudiogramChartViewController navigationItem](v12, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLargeTitleDisplayMode:", 2);

    objc_storeStrong((id *)&v12->_factorDisplayTypes, a4);
  }

  return v12;
}

- (HKAudiogramChartViewController)initWithUnitController:(id)a3 sampleTypeUpdateController:(id)a4 minimumAudiogramHeight:(double)a5
{
  id v8;
  id v9;
  HKOverlayRoomApplicationItems *v10;
  void *v11;
  id v12;
  HKAudiogramChartViewController *v13;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(HKOverlayRoomApplicationItems);
  -[HKOverlayRoomApplicationItems setUnitController:](v10, "setUnitController:", v9);

  -[HKOverlayRoomApplicationItems setSampleTypeUpdateController:](v10, "setSampleTypeUpdateController:", v8);
  +[HKDisplayTypeController sharedInstance](HKDisplayTypeController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setDisplayTypeController:](v10, "setDisplayTypeController:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0CB6780]);
  -[HKOverlayRoomApplicationItems setHealthStore:](v10, "setHealthStore:", v12);

  v13 = -[HKAudiogramChartViewController initWithApplicationItems:factorDisplayTypes:chartHeight:](self, "initWithApplicationItems:factorDisplayTypes:chartHeight:", v10, 0, a5);
  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HKAudiogramChartViewController _updateController](self, "_updateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B00], "audiogramSampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forType:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)HKAudiogramChartViewController;
  -[HKAudiogramChartViewController dealloc](&v5, sel_dealloc);
}

- (void)setAudiograms:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[HKAudiogramChartViewController _setAudiograms:](self, "_setAudiograms:", v4);

}

- (void)_refreshDynamicInsets
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  id v30;

  -[HKAudiogramChartViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "valueForNSIntegerTrait:", objc_opt_class());

  +[HKCollectionViewLayoutEngineDefaults edgeInsetsForWidthDesignation:](HKCollectionViewLayoutEngineDefaults, "edgeInsetsForWidthDesignation:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v9, "isiPad");

  if ((_DWORD)v4)
  {
    +[HKScalarGraphViewController hardLeftMarginWidth](HKScalarGraphViewController, "hardLeftMarginWidth");
    v11 = v10;
    -[HKAudiogramChartViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hk_isLeftToRight");

    -[HKAudiogramChartViewController leadingMarginConstraint](self, "leadingMarginConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v14, "setConstant:", v6 - v11);

      v15 = -v8;
    }
    else
    {
      objc_msgSend(v14, "setConstant:", v6);

      v15 = v11 - v8;
    }
  }
  else
  {
    -[HKAudiogramChartViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutMargins");
    v18 = v17;
    v20 = v19;

    if (v18 + -16.0 >= 0.0)
      v21 = v18 + -16.0;
    else
      v21 = 0.0;
    -[HKAudiogramChartViewController leadingMarginConstraint](self, "leadingMarginConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setConstant:", v21);

    v15 = fmin(-(v20 + -16.0), 0.0);
  }
  -[HKAudiogramChartViewController trailingMarginConstraint](self, "trailingMarginConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setConstant:", v15);

  -[HKAudiogramChartViewController leadingMarginConstraint](self, "leadingMarginConstraint");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constant");
  v25 = v6 - v24;
  -[HKAudiogramChartViewController trailingMarginConstraint](self, "trailingMarginConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constant");
  v28 = v8 + v27;
  -[HKAudiogramChartViewController contextStackView](self, "contextStackView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDirectionalLayoutMargins:", 0.0, v25, 0.0, v28);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  -[HKAudiogramChartViewController _refreshDynamicInsets](self, "_refreshDynamicInsets");
  v3.receiver = self;
  v3.super_class = (Class)HKAudiogramChartViewController;
  -[HKAudiogramChartViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  UIStackView *v6;
  UIStackView *stackView;
  HKAudiogramCurrentValueViewDataSource *v8;
  void *v9;
  HKAudiogramCurrentValueViewDataSource *v10;
  HKInteractiveChartAnnotationView *v11;
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
  HKScalarGraphCollectionViewController *v22;
  double v23;
  double v24;
  void *v25;
  HKScalarGraphCollectionViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *stackViewHeightConstraint;
  void *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  double v52;
  UIStackView *v53;
  void *v54;
  void *v55;
  HKAudiogramAnnotationViewDataSource *v56;
  void *v57;
  HKAudiogramAnnotationViewDataSource *v58;
  HKLollipopController *v59;
  void *v60;
  void *v61;
  HKLollipopController *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)HKAudiogramChartViewController;
  -[HKAudiogramChartViewController viewDidLoad](&v67, sel_viewDidLoad);
  -[HKAudiogramChartViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v6 = (UIStackView *)objc_msgSend(v5, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  stackView = self->_stackView;
  self->_stackView = v6;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 0);
  v8 = [HKAudiogramCurrentValueViewDataSource alloc];
  -[HKAudiogramChartViewController applicationItems](self, "applicationItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKAudiogramCurrentValueViewDataSource initWithApplicationItems:](v8, "initWithApplicationItems:", v9);
  -[HKAudiogramChartViewController setCurrentValueViewDataSource:](self, "setCurrentValueViewDataSource:", v10);

  v11 = -[HKInteractiveChartAnnotationView initWithContext:]([HKInteractiveChartAnnotationView alloc], "initWithContext:", 0);
  -[HKAudiogramChartViewController setCurrentValueView:](self, "setCurrentValueView:", v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartAccessibilityIdentifier:", CFSTR("ValueView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController currentValueView](self, "currentValueView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", v12);

  -[HKAudiogramChartViewController currentValueView](self, "currentValueView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  -[HKAudiogramChartViewController currentValueViewDataSource](self, "currentValueViewDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController currentValueView](self, "currentValueView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDataSource:", v15);

  -[HKAudiogramChartViewController stackView](self, "stackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController currentValueView](self, "currentValueView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addArrangedSubview:", v18);

  -[HKAudiogramChartViewController currentValueView](self, "currentValueView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", 90.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  v22 = [HKScalarGraphCollectionViewController alloc];
  -[HKAudiogramChartViewController chartHeight](self, "chartHeight");
  v24 = v23;
  -[HKAudiogramChartViewController _unitController](self, "_unitController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HKScalarGraphCollectionViewController initWithMinimumHeight:unitController:](v22, "initWithMinimumHeight:unitController:", v25, v24);
  -[HKAudiogramChartViewController setScalarGraphCollectionController:](self, "setScalarGraphCollectionController:", v26);

  -[HKAudiogramChartViewController scalarGraphCollectionController](self, "scalarGraphCollectionController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController chartHeight](self, "chartHeight");
  objc_msgSend(v29, "constraintEqualToConstant:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[HKAudiogramChartViewController scalarGraphCollectionController](self, "scalarGraphCollectionController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController _addControllerAsChildController:](self, "_addControllerAsChildController:", v31);

  -[HKAudiogramChartViewController stackView](self, "stackView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController scalarGraphCollectionController](self, "scalarGraphCollectionController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addArrangedSubview:", v34);

  -[HKAudiogramChartViewController scalarGraphCollectionController](self, "scalarGraphCollectionController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDelegate:", self);

  -[HKAudiogramChartViewController _addContextView](self, "_addContextView");
  -[HKAudiogramChartViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", self->_stackView);

  -[HKAudiogramChartViewController stackView](self, "stackView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController chartHeight](self, "chartHeight");
  v40 = v39;
  -[HKAudiogramChartViewController currentValueView](self, "currentValueView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "frame");
  objc_msgSend(v38, "constraintGreaterThanOrEqualToConstant:", v40 + v42);
  v43 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewHeightConstraint = self->_stackViewHeightConstraint;
  self->_stackViewHeightConstraint = v43;

  -[NSLayoutConstraint setActive:](self->_stackViewHeightConstraint, "setActive:", 1);
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v46)
  {
    v48 = v46;
    v49 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v64 != v49)
          objc_enumerationMutation(v45);
        v51 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        LODWORD(v47) = 1148846080;
        objc_msgSend(v51, "setContentCompressionResistancePriority:forAxis:", 1, v47);
        LODWORD(v52) = 1148846080;
        objc_msgSend(v51, "setContentHuggingPriority:forAxis:", 1, v52);
      }
      v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v48);
  }

  v53 = self->_stackView;
  -[HKAudiogramChartViewController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "safeAreaLayoutGuide");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController _pinView:toParentGuide:](self, "_pinView:toParentGuide:", v53, v55);

  v56 = [HKAudiogramAnnotationViewDataSource alloc];
  -[HKAudiogramChartViewController applicationItems](self, "applicationItems");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[HKAudiogramAnnotationViewDataSource initWithApplicationItems:](v56, "initWithApplicationItems:", v57);
  -[HKAudiogramChartViewController setAnnotationViewDataSource:](self, "setAnnotationViewDataSource:", v58);

  v59 = [HKLollipopController alloc];
  -[HKAudiogramChartViewController annotationViewDataSource](self, "annotationViewDataSource");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController stackView](self, "stackView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[HKLollipopController initWithAnnotationDataSource:parentView:delegate:](v59, "initWithAnnotationDataSource:parentView:delegate:", v60, v61, self);
  -[HKAudiogramChartViewController setLollipopController:](self, "setLollipopController:", v62);

  if (self->_audiogramsFetched)
    -[HKAudiogramChartViewController _setupInitialUI](self, "_setupInitialUI");
}

- (void)_setupInitialUI
{
  -[HKScalarGraphCollectionViewController reload](self->_scalarGraphCollectionController, "reload");
  -[HKAudiogramChartViewController _updateOverlayPillsAndHeaderWithSample:](self, "_updateOverlayPillsAndHeaderWithSample:", 0);
  if (-[HKAudiogramChartViewController currentAudiogramIndex](self, "currentAudiogramIndex") == -1)
  {
    if (-[NSMutableArray count](self->_audiograms, "count"))
      self->_currentAudiogramIndex = -[NSMutableArray count](self->_audiograms, "count") - 1;
    -[HKScalarGraphCollectionViewController resetToMostRecent](self->_scalarGraphCollectionController, "resetToMostRecent");
  }
  else
  {
    -[HKScalarGraphCollectionViewController resetToIndex:](self->_scalarGraphCollectionController, "resetToIndex:", -[HKAudiogramChartViewController currentAudiogramIndex](self, "currentAudiogramIndex"));
  }
}

- (void)_addContextView
{
  HKDisplayTypeSectionedContextView *v3;
  HKDisplayTypeSectionedContextView *contextView;
  void *v5;
  id v6;
  void *v7;
  UIStackView *v8;
  UIStackView *contextStackView;
  HKDisplayTypeSectionedContextView *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = -[HKDisplayTypeSectionedContextView initWithStyle:]([HKDisplayTypeSectionedContextView alloc], "initWithStyle:", 2);
  contextView = self->_contextView;
  self->_contextView = v3;

  -[HKDisplayTypeSectionedContextView setUseBottomInsets:](self->_contextView, "setUseBottomInsets:", 1);
  -[HKDisplayTypeSectionedContextView setTranslatesAutoresizingMaskIntoConstraints:](self->_contextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKDisplayTypeSectionedContextView setDelegate:](self->_contextView, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeSectionedContextView setBackgroundColor:](self->_contextView, "setBackgroundColor:", v5);

  v6 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v12[0] = self->_contextView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UIStackView *)objc_msgSend(v6, "initWithArrangedSubviews:", v7);
  contextStackView = self->_contextStackView;
  self->_contextStackView = v8;

  -[UIStackView setAxis:](self->_contextStackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_contextStackView, "setDistribution:", 2);
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_contextStackView, "setLayoutMarginsRelativeArrangement:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_contextStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_contextStackView);
  -[HKDisplayTypeSectionedContextView setSemanticContentAttribute:](self->_contextView, "setSemanticContentAttribute:", 3);
  v10 = self->_contextView;
  -[HKAudiogramChartViewController _sectionsFromAudiogram:](self, "_sectionsFromAudiogram:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeSectionedContextView setDisplayTypeContextSections:](v10, "setDisplayTypeContextSections:", v11);

}

- (void)queryForAudiograms
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E48], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  objc_msgSend(MEMORY[0x1E0CB6B00], "audiogramSampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__HKAudiogramChartViewController_queryForAudiograms__block_invoke;
  v11[3] = &unk_1E9C3FA18;
  v11[4] = self;
  v7 = (void *)objc_msgSend(v5, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v6, 0, 0, v4, v11);

  -[HKAudiogramChartViewController _updateController](self, "_updateController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B00], "audiogramSampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forType:", self, v9);

  -[HKAudiogramChartViewController _healthStore](self, "_healthStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executeQuery:", v7);

}

uint64_t __52__HKAudiogramChartViewController_queryForAudiograms__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudiogramSamples:error:");
}

- (void)_updateAudiogramSamples:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__HKAudiogramChartViewController__updateAudiogramSamples_error___block_invoke;
    v9[3] = &unk_1E9C3FC50;
    v9[4] = self;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB52E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E0], OS_LOG_TYPE_ERROR))
      -[HKAudiogramChartViewController _updateAudiogramSamples:error:].cold.1((uint64_t)self, (uint64_t)v7, v8);
  }

}

void __64__HKAudiogramChartViewController__updateAudiogramSamples_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 968) = 1;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB6B00], "audiogramSampleType");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateController:didReceiveUpdateForType:samplesAdded:objectsRemoved:recoveringFromError:", 0, v3, *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], 0);

}

- (id)_currentAudiogramSample
{
  unint64_t currentAudiogramIndex;
  void *v4;

  currentAudiogramIndex = self->_currentAudiogramIndex;
  if ((currentAudiogramIndex & 0x8000000000000000) != 0
    || currentAudiogramIndex >= -[NSMutableArray count](self->_audiograms, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_audiograms, "objectAtIndex:", self->_currentAudiogramIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_hasAudiogramData
{
  NSMutableArray *audiograms;
  unint64_t currentAudiogramIndex;

  audiograms = self->_audiograms;
  if (audiograms)
  {
    currentAudiogramIndex = self->_currentAudiogramIndex;
    LOBYTE(audiograms) = (currentAudiogramIndex & 0x8000000000000000) == 0
                      && currentAudiogramIndex < -[NSMutableArray count](audiograms, "count");
  }
  return (char)audiograms;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSMutableArray *audiograms;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  id v31;
  uint64_t v32;
  int64_t v33;
  NSMutableArray *v34;
  NSMutableArray *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v13;
  audiograms = self->_audiograms;
  if (audiograms && -[NSMutableArray count](audiograms, "count"))
  {
    v37 = v14;
    -[HKAudiogramChartViewController _currentAudiogramSample](self, "_currentAudiogramSample");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v36 = v15;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    v19 = MEMORY[0x1E0C809B0];
    v38 = v11;
    if (v18)
    {
      v20 = v18;
      v21 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v24 = self->_audiograms;
          v42[0] = v19;
          v42[1] = 3221225472;
          v42[2] = __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_2;
          v42[3] = &unk_1E9C46078;
          v42[4] = v23;
          -[NSMutableArray hk_firstObjectPassingTest:](v24, "hk_firstObjectPassingTest:", v42);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            -[NSMutableArray insertObject:atIndex:](self->_audiograms, "insertObject:atIndex:", v23, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_audiograms, "indexOfObject:inSortedRange:options:usingComparator:", v23, 0, -[NSMutableArray count](self->_audiograms, "count"), 1024, &__block_literal_global_82));
            if (-[HKAudiogramChartViewController shouldScrollToSample:](self, "shouldScrollToSample:", v23))
            {
              v26 = v23;

              v39 = v26;
            }
          }
        }
        v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v20);
    }

    v27 = (void *)MEMORY[0x1E0C99E60];
    v14 = v37;
    objc_msgSend(v37, "hk_map:", &__block_literal_global_310_0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = self->_audiograms;
    v40[0] = v19;
    v40[1] = 3221225472;
    v40[2] = __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_4;
    v40[3] = &unk_1E9C46078;
    v31 = v29;
    v41 = v31;
    -[NSMutableArray hk_removeObjectsPassingTest:](v30, "hk_removeObjectsPassingTest:", v40);
    v11 = v38;
    v15 = v36;
    if (self->_audiogramsFetched)
    {
      if (v39)
      {
        v32 = -[NSMutableArray indexOfObject:](self->_audiograms, "indexOfObject:", v39);
        if (v32 == 0x7FFFFFFFFFFFFFFFLL)
          v33 = -1;
        else
          v33 = v32;
      }
      else
      {
        v33 = -1;
      }
      self->_currentAudiogramIndex = v33;
      -[HKAudiogramChartViewController _setupInitialUI](self, "_setupInitialUI");
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v15);
    v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v35 = self->_audiograms;
    self->_audiograms = v34;

    self->_currentAudiogramIndex = -1;
    -[HKAudiogramChartViewController _setupInitialUI](self, "_setupInitialUI");
  }

}

uint64_t __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

BOOL __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

uint64_t __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

uint64_t __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)shouldScrollToSample:(id)a3
{
  id v4;
  double Current;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  int v11;
  HKAudiogramChartViewController *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v4, "_creationTimestamp");
  v7 = v6;

  v8 = vabdd_f64(Current, v7);
  if (v8 > 5.0)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = self;
      v13 = 2048;
      v14 = Current - v7;
      _os_log_impl(&dword_1D7813000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Omitting incoming sample with timeDifference %f", (uint8_t *)&v11, 0x16u);
    }
  }
  return v8 <= 5.0;
}

- (id)_audiogramDisplayType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HKAudiogramChartViewController applicationItems](self, "applicationItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayTypeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B00], "audiogramSampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayTypeForObjectType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_healthStore
{
  void *v2;
  void *v3;

  -[HKAudiogramChartViewController applicationItems](self, "applicationItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_unitController
{
  void *v2;
  void *v3;

  -[HKAudiogramChartViewController applicationItems](self, "applicationItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unitController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_updateController
{
  void *v2;
  void *v3;

  -[HKAudiogramChartViewController applicationItems](self, "applicationItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleTypeUpdateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sectionsFromAudiogram:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HKAudiogramChartViewController _averageSectionFromAudiogram:](self, "_averageSectionFromAudiogram:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_averageSectionFromAudiogram:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _HKDisplayTypeAudiogramContextItemSection *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hearingLevelSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftEarMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController _buildContextItemForEar:metrics:](self, "_buildContextItemForEar:metrics:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hearingLevelSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "rightEarMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController _buildContextItemForEar:metrics:](self, "_buildContextItemForEar:metrics:", 2, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(_HKDisplayTypeAudiogramContextItemSection);
  -[_HKDisplayTypeAudiogramContextItemSection setTitle:](v11, "setTitle:", 0);
  v14[0] = v7;
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKDisplayTypeAudiogramContextItemSection setItems:](v11, "setItems:", v12);

  return v11;
}

- (id)_buildContextItemForEar:(int64_t)a3 metrics:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HKDisplayTypeContextAudiogramItem *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a4;
  objc_msgSend(v5, "secondarySystemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKUIMetricColors hearingHealthColors](HKUIMetricColors, "hearingHealthColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(HKDisplayTypeContextAudiogramItem);
  -[HKDisplayTypeContextItem setInfoHidden:](v10, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setMetricColors:](v10, "setMetricColors:", v8);
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v10, "setSelectedMetricColors:", v9);
  -[HKDisplayTypeContextAudiogramItem setEar:](v10, "setEar:", a3);
  if (a3 == 1)
    v11 = CFSTR("LeftAverage");
  else
    v11 = CFSTR("RightAverage");
  if (a3 == 1)
    v12 = CFSTR("LEFT_AVERAGE_HEARING");
  else
    v12 = CFSTR("RIGHT_AVERAGE_HEARING");
  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", v13);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", v12, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v10, "setTitle:", v15);

  objc_msgSend(v6, "averageSensitivity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    HKIntegerFormatter();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_unit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValueForUnit:", v18);
    v20 = v19;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromNumber:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("DECIBELS_HEARING_NUMBERLESS_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKDisplayTypeContextItem setValue:](v10, "setValue:", v22);
    -[HKDisplayTypeContextItem setUnit:](v10, "setUnit:", v24);

  }
  else
  {
    HKUILocalizedString(CFSTR("NO_DATA"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setValue:](v10, "setValue:", v17);
  }

  return v10;
}

- (void)_updateOverlayPillsAndHeaderWithSample:(id)a3
{
  HKDisplayTypeSectionedContextView *contextView;
  void *v5;

  contextView = self->_contextView;
  if (contextView)
  {
    -[HKAudiogramChartViewController _sectionsFromAudiogram:](self, "_sectionsFromAudiogram:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeSectionedContextView setDisplayTypeContextSections:](contextView, "setDisplayTypeContextSections:", v5);

  }
  -[HKAudiogramChartViewController _updateHeaderState](self, "_updateHeaderState", a3);
}

- (void)_updateHeaderState
{
  void *v3;
  void *v4;
  id v5;

  if (-[HKAudiogramChartViewController _hasAudiogramData](self, "_hasAudiogramData"))
  {
    -[HKAudiogramChartViewController currentValueViewDataSource](self, "currentValueViewDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAudiogramChartViewController _currentAudiogramSample](self, "_currentAudiogramSample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateWithAudiogram:", v4);

    -[HKAudiogramChartViewController currentValueView](self, "currentValueView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");
  }
  else
  {
    -[HKAudiogramChartViewController currentValueView](self, "currentValueView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showNoDataStatus");
  }

}

- (void)contextView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v7 = a4;
  -[HKAudiogramChartViewController audiograms](self, "audiograms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || -[HKAudiogramChartViewController currentAudiogramIndex](self, "currentAudiogramIndex") < 0)
  {

    goto LABEL_10;
  }
  v9 = -[HKAudiogramChartViewController currentAudiogramIndex](self, "currentAudiogramIndex");
  -[HKAudiogramChartViewController audiograms](self, "audiograms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 >= v11)
  {
LABEL_10:
    self->_selectedOverlayEar = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v7, "section"))
  {
    objc_msgSend(v21, "displayTypeContextSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v7, "row"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    v17 = objc_opt_class();

    if (v16 != v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAudiogramChartViewController.m"), 700, CFSTR("We initialized audiogram items, and should get those back"));

    }
    objc_msgSend(v13, "items");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v7, "row"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    self->_selectedOverlayEar = objc_msgSend(v19, "ear");
  }
  -[HKScalarGraphCollectionViewController redrawCurrentCell](self->_scalarGraphCollectionController, "redrawCurrentCell");
LABEL_11:

}

- (void)_resetCurrentGraph
{
  self->_selectedOverlayEar = 0;
  -[HKScalarGraphCollectionViewController redrawCurrentCell](self->_scalarGraphCollectionController, "redrawCurrentCell");
}

- (int64_t)numberOfItemsInCollection
{
  if (-[NSMutableArray count](self->_audiograms, "count"))
    return -[NSMutableArray count](self->_audiograms, "count");
  else
    return 1;
}

- (id)graphViewControllerForIndex:(int64_t)a3
{
  _HKAudiogramFrequencyAxisDimension *v4;
  HKNumericAxisConfiguration *v5;
  HKScalarGraphViewController *v6;
  HKScalarGraphViewController *v7;
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

  v4 = objc_alloc_init(_HKAudiogramFrequencyAxisDimension);
  v5 = objc_alloc_init(HKNumericAxisConfiguration);
  -[HKAxisConfiguration setMaxLabels:](v5, "setMaxLabels:", 10);
  v6 = [HKScalarGraphViewController alloc];
  -[HKAudiogramChartViewController chartHeight](self, "chartHeight");
  v7 = -[HKScalarGraphViewController initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:](v6, "initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:", v4, 3, v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewController graphView](v7, "graphView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xAxis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_roundedSystemFontWithSize:weight:", 12.0, *MEMORY[0x1E0DC1438]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", v8, v12, 1, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLabelStyle:", v13);

  -[HKGraphViewController graphView](v7, "graphView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "xAxis");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFillOuterPadding:", 0.0);

  -[HKGraphViewController graphView](v7, "graphView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMultiSeriesSelection:", 1);

  -[HKGraphViewController graphView](v7, "graphView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAxisInset:", 0.0, 0.0, 0.0, 0.0);

  -[HKGraphViewController graphView](v7, "graphView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController _setupFixedFrequencyAxisForGraphView:](self, "_setupFixedFrequencyAxisForGraphView:", v19);

  return v7;
}

- (id)graphSeriesForIndex:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[NSMutableArray count](self->_audiograms, "count");
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    -[HKAudiogramChartViewController audiograms](self, "audiograms");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKAudiogramChartViewController _setupSeriesForAudiogramSample:](self, "_setupSeriesForAudiogramSample:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)graphCollectionView:(id)a3 didChangeVisibleIndex:(int64_t)a4
{
  id v6;
  NSMutableArray *audiograms;
  int v8;
  void *v9;
  void *v10;
  HKDisplayTypeSectionedContextView *contextView;
  id v12;

  v6 = a3;
  audiograms = self->_audiograms;
  if (audiograms)
  {
    v12 = v6;
    v8 = -[NSMutableArray count](audiograms, "count");
    v6 = v12;
    if (v8 - 1 >= a4)
    {
      self->_currentAudiogramIndex = a4;
      -[NSMutableArray objectAtIndexedSubscript:](self->_audiograms, "objectAtIndexedSubscript:", -[HKAudiogramChartViewController currentAudiogramIndex](self, "currentAudiogramIndex"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAudiogramChartViewController _updateOverlayPillsAndHeaderWithSample:](self, "_updateOverlayPillsAndHeaderWithSample:", v9);

      -[HKAudiogramChartViewController _indexPathForCurrentSelections](self, "_indexPathForCurrentSelections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      contextView = self->_contextView;
      if (contextView)
      {
        if (v10)
        {
          -[HKDisplayTypeSectionedContextView selectItemAtIndexPath:animated:scrollPosition:](contextView, "selectItemAtIndexPath:animated:scrollPosition:", v10, 0, 0);
          -[HKAudiogramChartViewController contextView:didSelectItemAtIndexPath:](self, "contextView:didSelectItemAtIndexPath:", self->_contextView, v10);
        }
        else
        {
          -[HKDisplayTypeSectionedContextView deselectAllItemsAnimated:](contextView, "deselectAllItemsAnimated:", 0);
          -[HKAudiogramChartViewController _resetCurrentGraph](self, "_resetCurrentGraph");
        }
      }

      v6 = v12;
    }
  }

}

- (id)_setupSeriesForAudiogramSample:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "sensitivityPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController _audiogramSeriesWithSensitivityPoints:seriesEar:](self, "_audiogramSeriesWithSensitivityPoints:seriesEar:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_addNonNilObject:", v7);

  objc_msgSend(v4, "sensitivityPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController _audiogramSeriesWithSensitivityPoints:seriesEar:](self, "_audiogramSeriesWithSensitivityPoints:seriesEar:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_addNonNilObject:", v9);

  if (self->_selectedOverlayEar)
  {
    -[HKAudiogramChartViewController _averageLevelOverlaySeriesWithAudiogram:selectedEar:](self, "_averageLevelOverlaySeriesWithAudiogram:selectedEar:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_addNonNilObject:", v10);

  }
  return v5;
}

- (id)_audiogramSeriesWithSensitivityPoints:(id)a3 seriesEar:(int64_t)a4
{
  void *v6;
  _BOOL8 v7;
  void *v8;
  HKAudiogramDataSource *v9;
  _QWORD v11[4];
  BOOL v12;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__HKAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar___block_invoke;
  v11[3] = &__block_descriptor_33_e37_B16__0__HKAudiogramSensitivityPoint_8l;
  v12 = a4 == 1;
  objc_msgSend(a3, "hk_filter:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = a4 == 1;
    +[HKAudiogramLineSeries audiogramLineSeriesForSeriesEar:selectedEar:disableConnectionLines:](HKAudiogramLineSeries, "audiogramLineSeriesForSeriesEar:selectedEar:disableConnectionLines:", a4, self->_selectedOverlayEar, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKAudiogramDataSource initWithSensitivityData:forLeftEar:]([HKAudiogramDataSource alloc], "initWithSensitivityData:forLeftEar:", v6, v7);
    objc_msgSend(v8, "setDataSource:", v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __82__HKAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  if (*(_BYTE *)(a1 + 32))
    objc_msgSend(a2, "leftEarSensitivity");
  else
    objc_msgSend(a2, "rightEarSensitivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (id)_averageLevelOverlaySeriesWithAudiogram:(id)a3 selectedEar:(int64_t)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HKAudiogramAverageSensitivityDataSource *v9;

  v4 = a4 == 1;
  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v5, "hk_hearingHealthAudiogramAverageLineColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAudiogramAverageLevelSeries audiogramAverageLevelSeriesWithColor:](HKAudiogramAverageLevelSeries, "audiogramAverageLevelSeriesWithColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKAudiogramAverageSensitivityDataSource initWithAudiogramSample:isLeftEar:]([HKAudiogramAverageSensitivityDataSource alloc], "initWithAudiogramSample:isLeftEar:", v6, v4);
  objc_msgSend(v8, "setDataSource:", v9);

  return v8;
}

- (void)_setupFixedFrequencyAxisForGraphView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CED6A8, &unk_1E9CED6B8);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", v4, v4, v4);

}

- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4
{
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = self->_selectedOverlayEar != 0;
  v6 = a4;
  -[HKAudiogramChartViewController _currentAudiogramSample](self, "_currentAudiogramSample");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HKAudiogramChartViewController annotationViewDataSource](self, "annotationViewDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithPointSelectionContexts:date:isAverage:", v6, v9, v5);

}

- (id)lollipopAnnotationColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopBackgroundColor");
}

- (id)lollipopFieldColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
}

- (double)lollipopExtensionLength
{
  return 14.0;
}

- (void)_addControllerAsChildController:(id)a3
{
  id v4;

  v4 = a3;
  -[HKAudiogramChartViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "didMoveToParentViewController:", self);

}

- (void)_pinView:(id)a3 toParentGuide:(id)a4
{
  id v6;
  id v7;
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
  id v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController setLeadingMarginConstraint:](self, "setLeadingMarginConstraint:", v10);

  -[HKAudiogramChartViewController leadingMarginConstraint](self, "leadingMarginConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v7, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudiogramChartViewController setTrailingMarginConstraint:](self, "setTrailingMarginConstraint:", v14);

  -[HKAudiogramChartViewController trailingMarginConstraint](self, "trailingMarginConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v7, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(v7, "bottomAnchor");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

}

- (id)_findNavigationController
{
  void *v3;
  void *v4;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  -[HKAudiogramChartViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKAudiogramChartViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKAudiogramChartViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v4;
          objc_msgSend(v7, "navigationController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v7, "navigationController");
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            return v4;
          }

        }
        objc_msgSend(v4, "nextResponder");
        v9 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v9;
      }
      while (v9);
    }
  }
  return v4;
}

- (id)_indexPathForCurrentSelections
{
  int64_t selectedOverlayEar;
  uint64_t v3;
  void *v4;

  selectedOverlayEar = self->_selectedOverlayEar;
  if (selectedOverlayEar == 2)
  {
    v3 = 1;
  }
  else
  {
    if (selectedOverlayEar != 1)
    {
      v4 = 0;
      return v4;
    }
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (void)setApplicationItems:(id)a3
{
  objc_storeStrong((id *)&self->_applicationItems, a3);
}

- (NSMutableArray)audiograms
{
  return self->_audiograms;
}

- (void)_setAudiograms:(id)a3
{
  objc_storeStrong((id *)&self->_audiograms, a3);
}

- (int64_t)currentAudiogramIndex
{
  return self->_currentAudiogramIndex;
}

- (void)setCurrentAudiogramIndex:(int64_t)a3
{
  self->_currentAudiogramIndex = a3;
}

- (double)chartHeight
{
  return self->_chartHeight;
}

- (void)setChartHeight:(double)a3
{
  self->_chartHeight = a3;
}

- (HKScalarGraphCollectionViewController)scalarGraphCollectionController
{
  return self->_scalarGraphCollectionController;
}

- (void)setScalarGraphCollectionController:(id)a3
{
  objc_storeStrong((id *)&self->_scalarGraphCollectionController, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)stackViewHeightConstraint
{
  return self->_stackViewHeightConstraint;
}

- (void)setStackViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewHeightConstraint, a3);
}

- (UIStackView)contextStackView
{
  return self->_contextStackView;
}

- (void)setContextStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contextStackView, a3);
}

- (HKDisplayTypeSectionedContextView)contextView
{
  return self->_contextView;
}

- (void)setContextView:(id)a3
{
  objc_storeStrong((id *)&self->_contextView, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (HKInteractiveChartAnnotationView)currentValueView
{
  return self->_currentValueView;
}

- (void)setCurrentValueView:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueView, a3);
}

- (HKAudiogramCurrentValueViewDataSource)currentValueViewDataSource
{
  return self->_currentValueViewDataSource;
}

- (void)setCurrentValueViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueViewDataSource, a3);
}

- (HKAudiogramAnnotationViewDataSource)annotationViewDataSource
{
  return self->_annotationViewDataSource;
}

- (void)setAnnotationViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_annotationViewDataSource, a3);
}

- (int64_t)selectedOverlayEar
{
  return self->_selectedOverlayEar;
}

- (void)setSelectedOverlayEar:(int64_t)a3
{
  self->_selectedOverlayEar = a3;
}

- (HKLollipopController)lollipopController
{
  return self->_lollipopController;
}

- (void)setLollipopController:(id)a3
{
  objc_storeStrong((id *)&self->_lollipopController, a3);
}

- (BOOL)audiogramsFetched
{
  return self->_audiogramsFetched;
}

- (void)setAudiogramsFetched:(BOOL)a3
{
  self->_audiogramsFetched = a3;
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingMarginConstraint, a3);
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, a3);
}

- (NSArray)factorDisplayTypes
{
  return self->_factorDisplayTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorDisplayTypes, 0);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_lollipopController, 0);
  objc_storeStrong((id *)&self->_annotationViewDataSource, 0);
  objc_storeStrong((id *)&self->_currentValueViewDataSource, 0);
  objc_storeStrong((id *)&self->_currentValueView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_contextView, 0);
  objc_storeStrong((id *)&self->_contextStackView, 0);
  objc_storeStrong((id *)&self->_stackViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scalarGraphCollectionController, 0);
  objc_storeStrong((id *)&self->_audiograms, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
}

+ (BOOL)testChartPointCreation:(id)a3 leftEarSeries:(BOOL)a4 expectedChartPoints:(id)a5 failureMessage:(id *)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  BOOL v37;
  uint64_t v39;
  uint64_t v40;
  id *v41;
  void *v42;
  id v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v7 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  +[HKAudiogramChartPoint chartPointsFromSensitivityPoints:isLeftEar:](HKAudiogramChartPoint, "chartPointsFromSensitivityPoints:isLeftEar:", a3, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v11, "setNumberStyle:", 1);
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(";"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13 != objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected point count doesn't match actual point count: %ld != %ld"), objc_msgSend(v12, "count"), objc_msgSend(v10, "count"));
    v37 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (!v14)
  {
    v37 = 1;
    goto LABEL_19;
  }
  v15 = v14;
  v41 = a6;
  v16 = 0;
  v17 = *(_QWORD *)v46;
  v42 = v12;
  v43 = v9;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v46 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(","));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count") != 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Point does not have two coordinates: '%@'"), v19, v39, v40);
LABEL_18:
        *v41 = (id)objc_claimAutoreleasedReturnValue();

        v37 = 0;
        v12 = v42;
        v9 = v43;
        goto LABEL_19;
      }
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberFromString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberFromString:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;

      objc_msgSend(v10, "objectAtIndexedSubscript:", v16 + i);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "xValueAsGenericType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      v32 = v31;

      objc_msgSend(v10, "objectAtIndexedSubscript:", v16 + i);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "yValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v36 = v35;

      if (vabdd_f64(v24, v32) > 0.000001)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X value mismatch (slot %ld): %lg != %lg"), v16 + i, *(_QWORD *)&v24, *(_QWORD *)&v32);
        goto LABEL_18;
      }
      if (vabdd_f64(v28, v36) > 0.000001)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Y value mismatch (slot %ld: %lg != %lg"), v16 + i, *(_QWORD *)&v28, *(_QWORD *)&v36);
        goto LABEL_18;
      }

    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    v16 += i;
    v37 = 1;
    v12 = v42;
    v9 = v43;
    if (v15)
      continue;
    break;
  }
LABEL_19:

LABEL_20:
  return v37;
}

- (void)_updateAudiogramSamples:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve audiograms: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
