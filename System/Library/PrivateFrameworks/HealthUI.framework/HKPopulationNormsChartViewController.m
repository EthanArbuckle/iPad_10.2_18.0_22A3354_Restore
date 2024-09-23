@implementation HKPopulationNormsChartViewController

- (HKPopulationNormsChartViewController)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  return -[HKPopulationNormsChartViewController initWithDisplayType:healthStore:shouldEmbedInScrollView:](self, "initWithDisplayType:healthStore:shouldEmbedInScrollView:", a3, a4, 1);
}

- (HKPopulationNormsChartViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 shouldEmbedInScrollView:(BOOL)a5
{
  id v9;
  id v10;
  HKPopulationNormsChartViewController *v11;
  HKPopulationNormsChartViewController *v12;
  uint64_t v13;
  HKPopulationNormsViewModelDataSource *viewModel;
  HKPopulationNormsViewModelDataSource *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HKPopulationNormsChartViewController;
  v11 = -[HKPopulationNormsChartViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    -[HKPopulationNormsChartViewController _viewModelForDisplayType:healthStore:](v11, "_viewModelForDisplayType:healthStore:", v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    viewModel = v12->_viewModel;
    v12->_viewModel = (HKPopulationNormsViewModelDataSource *)v13;

    v12->_shouldEmbedInScrollView = a5;
    v15 = v12->_viewModel;
    if (v15)
    {
      -[HKPopulationNormsViewModelDataSource viewTitle](v15, "viewTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKPopulationNormsChartViewController setTitle:](v12, "setTitle:", v16);

      -[HKPopulationNormsViewModelDataSource hk_UIAutomationIdentifier](v12->_viewModel, "hk_UIAutomationIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("UIA.Health"), "stringByAppendingFormat:", CFSTR(".PopulationNorms.%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKPopulationNormsChartViewController setBaseIdentifier:](v12, "setBaseIdentifier:", v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("HKPopulationNormsChartViewController.m"), 67, CFSTR("Initialized population norms chart with an unsupported display type."));
    }

  }
  return v12;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  UIView *v7;
  UIView *contentView;
  id v9;
  void *v10;
  UISegmentedControl *v11;
  UISegmentedControl *biologicalSexSegmentedControl;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  HKPopulationNormsGraphView *v18;
  void *v19;
  void *v20;
  void *v21;
  HKPopulationNormsGraphView *v22;
  HKPopulationNormsGraphView *populationNormsGraphView;
  void *v24;
  void *v25;
  UILabel *v26;
  UILabel *classificationLevelsTitleLabel;
  void *v28;
  HKPopulationNormsClassificationCollectionViewLayout *v29;
  HKPopulationNormsClassificationCollectionView *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  HKPopulationNormsClassificationCollectionView *v35;
  HKPopulationNormsClassificationCollectionView *classificationCollectionView;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HKPopulationNormsDescriptionView *v42;
  HKPopulationNormsDescriptionView *classificationDescriptionView;
  void *v44;
  UILabel *v45;
  UILabel *attributionLabel;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
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
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  HKPopulationNormsClassificationCollectionViewLayout *v113;
  _QWORD v114[4];
  _QWORD v115[11];

  v115[9] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[HKPopulationNormsChartViewController setView:](self, "setView:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsChartViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  if (self->_shouldEmbedInScrollView)
    v6 = 16.0;
  else
    v6 = 0.0;
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  contentView = self->_contentView;
  self->_contentView = v7;

  -[UIView setHidden:](self->_contentView, "setHidden:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_contentView, "setAccessibilityIdentifier:", self->_baseIdentifier);
  v9 = objc_alloc(MEMORY[0x1E0DC3C58]);
  -[HKPopulationNormsViewModelDataSource localizedBiologicalSexTitles](self->_viewModel, "localizedBiologicalSexTitles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (UISegmentedControl *)objc_msgSend(v9, "initWithItems:", v10);
  biologicalSexSegmentedControl = self->_biologicalSexSegmentedControl;
  self->_biologicalSexSegmentedControl = v11;

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_biologicalSexSegmentedControl, "addTarget:action:forControlEvents:", self, sel_segmentedControlDidChange_, 4096);
  -[NSString stringByAppendingString:](self->_baseIdentifier, "stringByAppendingString:", CFSTR(".BiologicalSex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl setAccessibilityIdentifier:](self->_biologicalSexSegmentedControl, "setAccessibilityIdentifier:", v13);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_biologicalSexSegmentedControl);
  -[UISegmentedControl hk_constrainToSuperviewAlongEdges:constant:](self->_biologicalSexSegmentedControl, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA700, 12.0);
  -[UISegmentedControl hk_constrainToSuperviewAlongEdges:constant:](self->_biologicalSexSegmentedControl, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA718, v6);
  -[HKPopulationNormsViewModelDataSource maximumSampleValueQuantity](self->_viewModel, "maximumSampleValueQuantity");
  v15 = v14;
  -[HKPopulationNormsViewModelDataSource minimumSampleValueQuantity](self->_viewModel, "minimumSampleValueQuantity");
  v17 = v16;
  v18 = [HKPopulationNormsGraphView alloc];
  -[HKPopulationNormsViewModelDataSource quantityUnitTitle](self->_viewModel, "quantityUnitTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsViewModelDataSource ageBucketsTitle](self->_viewModel, "ageBucketsTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsViewModelDataSource seriesHighlightedSegmentColor](self->_viewModel, "seriesHighlightedSegmentColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HKPopulationNormsGraphView initWithMaxYValue:minYValue:YSeriesTitle:XSeriesTitle:highlightedSegmentColor:](v18, "initWithMaxYValue:minYValue:YSeriesTitle:XSeriesTitle:highlightedSegmentColor:", v19, v20, v21, v15, v17);
  populationNormsGraphView = self->_populationNormsGraphView;
  self->_populationNormsGraphView = v22;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_populationNormsGraphView);
  -[UIView hk_constrainToView:fromEdge:toEdge:constant:](self->_populationNormsGraphView, "hk_constrainToView:fromEdge:toEdge:constant:", self->_biologicalSexSegmentedControl, 3, 4, 8.0);
  -[UIView hk_constrainToSuperviewAlongEdges:constant:](self->_populationNormsGraphView, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA730, v6);
  -[HKPopulationNormsChartViewController traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsChartViewController updatePopulationNormsGraphHeightWithTraitCollection:](self, "updatePopulationNormsGraphHeightWithTraitCollection:", v24);

  -[NSString stringByAppendingString:](self->_baseIdentifier, "stringByAppendingString:", CFSTR(".Chart"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsGraphView setAccessibilityIdentifier:](self->_populationNormsGraphView, "setAccessibilityIdentifier:", v25);

  v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  classificationLevelsTitleLabel = self->_classificationLevelsTitleLabel;
  self->_classificationLevelsTitleLabel = v26;

  -[UILabel setNumberOfLines:](self->_classificationLevelsTitleLabel, "setNumberOfLines:", 0);
  -[HKPopulationNormsViewModelDataSource levelsTitle](self->_viewModel, "levelsTitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_classificationLevelsTitleLabel, "setText:", v28);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_classificationLevelsTitleLabel);
  -[UILabel hk_constrainToView:fromEdge:toEdge:constant:](self->_classificationLevelsTitleLabel, "hk_constrainToView:fromEdge:toEdge:constant:", self->_populationNormsGraphView, 3, 4, 11.0);
  -[UILabel hk_constrainToSuperviewAlongEdges:constant:](self->_classificationLevelsTitleLabel, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA748, v6);
  v29 = objc_alloc_init(HKPopulationNormsClassificationCollectionViewLayout);
  v30 = [HKPopulationNormsClassificationCollectionView alloc];
  v31 = *MEMORY[0x1E0C9D648];
  v32 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v34 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v113 = v29;
  v35 = -[HKPopulationNormsClassificationCollectionView initWithFrame:collectionViewLayout:](v30, "initWithFrame:collectionViewLayout:", v29, *MEMORY[0x1E0C9D648], v32, v33, v34);
  classificationCollectionView = self->_classificationCollectionView;
  self->_classificationCollectionView = v35;

  -[HKPopulationNormsClassificationCollectionView registerClass:forCellWithReuseIdentifier:](self->_classificationCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("HKPopulationNormsClassificationCollectionViewCell"));
  -[HKPopulationNormsClassificationCollectionView setShowsHorizontalScrollIndicator:](self->_classificationCollectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[HKPopulationNormsClassificationCollectionView setDataSource:](self->_classificationCollectionView, "setDataSource:", self);
  -[HKPopulationNormsClassificationCollectionView setDelegate:](self->_classificationCollectionView, "setDelegate:", self);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v31, v32, v33, v34);
  -[HKPopulationNormsClassificationCollectionView setBackgroundView:](self->_classificationCollectionView, "setBackgroundView:", v37);

  -[HKPopulationNormsChartViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "backgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsClassificationCollectionView backgroundView](self->_classificationCollectionView, "backgroundView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setBackgroundColor:", v39);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_classificationCollectionView);
  -[UIView hk_constrainToView:fromEdge:toEdge:constant:](self->_classificationCollectionView, "hk_constrainToView:fromEdge:toEdge:constant:", self->_classificationLevelsTitleLabel, 3, 4, 11.0);
  -[UIView hk_constrainToSuperviewAlongEdges:constant:](self->_classificationCollectionView, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA760, 0.0);
  -[NSString stringByAppendingString:](self->_baseIdentifier, "stringByAppendingString:", CFSTR(".Classification"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsClassificationCollectionView setAccessibilityIdentifier:](self->_classificationCollectionView, "setAccessibilityIdentifier:", v41);

  v42 = objc_alloc_init(HKPopulationNormsDescriptionView);
  classificationDescriptionView = self->_classificationDescriptionView;
  self->_classificationDescriptionView = v42;

  -[HKPopulationNormsDescriptionView setUserInteractionEnabled:](self->_classificationDescriptionView, "setUserInteractionEnabled:", 0);
  -[HKPopulationNormsDescriptionView setTranslatesAutoresizingMaskIntoConstraints:](self->_classificationDescriptionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_classificationDescriptionView);
  -[UIView hk_constrainToView:fromEdge:toEdge:constant:](self->_classificationDescriptionView, "hk_constrainToView:fromEdge:toEdge:constant:", self->_classificationCollectionView, 3, 4, 11.0);
  -[UIView hk_constrainToSuperviewAlongEdges:constant:](self->_classificationDescriptionView, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA778, v6);
  -[NSString stringByAppendingString:](self->_baseIdentifier, "stringByAppendingString:", CFSTR(".Classification.Description"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsDescriptionView setAccessibilityIdentifier:](self->_classificationDescriptionView, "setAccessibilityIdentifier:", v44);

  v45 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = v45;

  -[UILabel setNumberOfLines:](self->_attributionLabel, "setNumberOfLines:", 0);
  -[HKPopulationNormsViewModelDataSource footerText](self->_viewModel, "footerText");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_attributionLabel, "setText:", v47);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_attributionLabel, "setTextColor:", v48);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_attributionLabel);
  -[UILabel hk_constrainToView:fromEdge:toEdge:constant:](self->_attributionLabel, "hk_constrainToView:fromEdge:toEdge:constant:", self->_classificationDescriptionView, 3, 4, 6.0);
  -[UILabel hk_constrainToSuperviewAlongEdges:constant:](self->_attributionLabel, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA790, v6);
  -[UILabel hk_constrainToSuperviewAlongEdges:constant:](self->_attributionLabel, "hk_constrainToSuperviewAlongEdges:constant:", &unk_1E9CEA7A8, 11.0);
  -[NSString stringByAppendingString:](self->_baseIdentifier, "stringByAppendingString:", CFSTR(".Attribution"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_attributionLabel, "setAccessibilityIdentifier:", v49);

  -[HKPopulationNormsChartViewController _setupFonts](self, "_setupFonts");
  if (self->_shouldEmbedInScrollView)
  {
    v50 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
    objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKPopulationNormsChartViewController view](self, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addSubview:", v50);

    objc_msgSend(v50, "addSubview:", self->_contentView);
    v99 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v50, "frameLayoutGuide");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "topAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartViewController view](self, "view");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "topAnchor");
    v101 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v101);
    v97 = objc_claimAutoreleasedReturnValue();
    v115[0] = v97;
    objc_msgSend(v50, "frameLayoutGuide");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartViewController view](self, "view");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "leadingAnchor");
    v112 = v52;
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v109;
    objc_msgSend(v50, "frameLayoutGuide");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartViewController view](self, "view");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "trailingAnchor");
    v88 = objc_claimAutoreleasedReturnValue();
    v108 = v53;
    objc_msgSend(v53, "constraintEqualToAnchor:", v88);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v115[2] = v107;
    objc_msgSend(v50, "frameLayoutGuide");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartViewController view](self, "view");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "bottomAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v54;
    objc_msgSend(v54, "constraintEqualToAnchor:", v95);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v115[3] = v94;
    objc_msgSend(v50, "contentLayoutGuide");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "topAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v90);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v115[4] = v89;
    objc_msgSend(v50, "contentLayoutGuide");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v84);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v115[5] = v83;
    objc_msgSend(v50, "contentLayoutGuide");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v115[6] = v79;
    objc_msgSend(v50, "contentLayoutGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v115[7] = v58;
    objc_msgSend(v50, "frameLayoutGuide");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "widthAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_contentView, "widthAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v115[8] = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 9);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "activateConstraints:", v63);

    v64 = v87;
    v65 = v96;

    v66 = (void *)v88;
    v67 = (void *)v97;

    v68 = v102;
    v69 = v100;

    v70 = v93;
    v71 = (void *)v101;

    v72 = v98;
  }
  else
  {
    -[HKPopulationNormsChartViewController view](self, "view");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addSubview:", self->_contentView);

    v104 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v50 = (id)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartViewController view](self, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v65);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = v69;
    -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartViewController view](self, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "safeAreaLayoutGuide");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "leadingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = v111;
    -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
    v74 = objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartViewController view](self, "view");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "trailingAnchor");
    v75 = objc_claimAutoreleasedReturnValue();
    v110 = (void *)v74;
    v76 = (void *)v74;
    v70 = (void *)v75;
    objc_msgSend(v76, "constraintEqualToAnchor:", v75);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v114[2] = v108;
    -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartViewController view](self, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "safeAreaLayoutGuide");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "bottomAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v114[3] = v105;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 4);
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = v104;
    v103 = (void *)v77;
    objc_msgSend(v78, "activateConstraints:");
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKPopulationNormsChartViewController;
  -[HKPopulationNormsChartViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HKPopulationNormsChartViewController _refreshViewModelIfNecessary](self, "_refreshViewModelIfNecessary");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKPopulationNormsChartViewController;
  -[HKPopulationNormsChartViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[HKPopulationNormsViewModelDataSource clearUserCharacteristicCache](self->_viewModel, "clearUserCharacteristicCache");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKPopulationNormsChartViewController;
  -[HKPopulationNormsChartViewController traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKPopulationNormsChartViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKPopulationNormsChartViewController _setupFonts](self, "_setupFonts");
    -[HKPopulationNormsChartViewController traitCollection](self, "traitCollection");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v4)
    {
      -[HKPopulationNormsChartViewController traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKPopulationNormsChartViewController updatePopulationNormsGraphHeightWithTraitCollection:](self, "updatePopulationNormsGraphHeightWithTraitCollection:", v10);

    }
  }
  -[HKPopulationNormsChartViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v12)
    -[HKPopulationNormsChartViewController _refreshViewModelIfNecessary](self, "_refreshViewModelIfNecessary");

}

- (void)updatePopulationNormsGraphHeightWithTraitCollection:(id)a3
{
  NSLayoutConstraint *previousPopulationNormsGraphHeightConstraint;
  unint64_t v5;
  void *v6;
  NSLayoutConstraint *v7;
  void *v8;
  double v9;
  double v10;
  NSLayoutConstraint *v11;
  id v12;

  v12 = a3;
  previousPopulationNormsGraphHeightConstraint = self->_previousPopulationNormsGraphHeightConstraint;
  if (previousPopulationNormsGraphHeightConstraint)
    -[NSLayoutConstraint setActive:](previousPopulationNormsGraphHeightConstraint, "setActive:", 0);
  v5 = objc_msgSend(v12, "horizontalSizeClass");
  if (v5 < 2)
  {
    -[HKPopulationNormsGraphView heightAnchor](self->_populationNormsGraphView, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintLessThanOrEqualToConstant:", 400.0);
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = self->_previousPopulationNormsGraphHeightConstraint;
    self->_previousPopulationNormsGraphHeightConstraint = v7;

    -[NSLayoutConstraint setActive:](self->_previousPopulationNormsGraphHeightConstraint, "setActive:", 1);
    goto LABEL_8;
  }
  if (v5 == 2)
  {
    -[HKPopulationNormsChartViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9 * 0.5;

    -[HKPopulationNormsGraphView heightAnchor](self->_populationNormsGraphView, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", fmax(v10, 400.0));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_refreshViewModelIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HKPopulationNormsViewModelDataSource *viewModel;
  id v8;
  _QWORD v9[4];
  id v10;
  HKPopulationNormsChartViewController *v11;

  -[HKPopulationNormsClassificationCollectionView indexPathsForSelectedItems](self->_classificationCollectionView, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HKPopulationNormsClassificationCollectionView indexPathsForSelectedItems](self->_classificationCollectionView, "indexPathsForSelectedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  viewModel = self->_viewModel;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HKPopulationNormsChartViewController__refreshViewModelIfNecessary__block_invoke;
  v9[3] = &unk_1E9C3FC50;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[HKPopulationNormsViewModelDataSource prepareUserCharacteristicCacheWithHandler:](viewModel, "prepareUserCharacteristicCacheWithHandler:", v9);

}

void __68__HKPopulationNormsChartViewController__refreshViewModelIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_deselectClassificationCellAtIndexPath:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "setSelectedSegmentIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 984), "currentBiologicalSexSegmentIndex"));
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 984), "currentClassificationIndex"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "collectionView:didSelectItemAtIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1024), v6);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 1008);
  objc_msgSend(*(id *)(v2 + 984), "userAgeBucketIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 984), "userLatestSampleValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithUserAgeBucketIndex:userLatestSampleValue:", v4, v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 976), "setHidden:", 0);
}

- (void)_setupFonts
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B58], 32770, *MEMORY[0x1E0DC48D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_classificationLevelsTitleLabel, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_attributionLabel, "setFont:", v4);

}

- (id)_viewModelForDisplayType:(id)a3 healthStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HKCardioFitnessPopulationNormsViewModel *v9;

  v5 = a4;
  objc_msgSend(a3, "objectType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0CB5DA0];

  if (v7 == v8)
    v9 = -[HKPopulationNormsAbstractViewModel initWithHealthStore:]([HKCardioFitnessPopulationNormsViewModel alloc], "initWithHealthStore:", v5);
  else
    v9 = 0;

  return v9;
}

- (void)segmentedControlDidChange:(id)a3
{
  HKPopulationNormsGraphView *populationNormsGraphView;
  id v5;

  -[HKPopulationNormsViewModelDataSource setBiologicalSexSegmentIndex:](self->_viewModel, "setBiologicalSexSegmentIndex:", objc_msgSend(a3, "selectedSegmentIndex"));
  populationNormsGraphView = self->_populationNormsGraphView;
  -[HKPopulationNormsViewModelDataSource currentDataForBiologicalSex](self->_viewModel, "currentDataForBiologicalSex");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsGraphView updateWithFlattenedLevelsByAgeBucket:currentClassificationIndex:](populationNormsGraphView, "updateWithFlattenedLevelsByAgeBucket:currentClassificationIndex:", v5, -[HKPopulationNormsViewModelDataSource currentClassificationIndex](self->_viewModel, "currentClassificationIndex"));

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[HKPopulationNormsViewModelDataSource numberOfClassifications](self->_viewModel, "numberOfClassifications", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("HKPopulationNormsClassificationCollectionViewCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsViewModelDataSource seriesHighlightedColor](self->_viewModel, "seriesHighlightedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlightColor:", v8);

  if (-[HKPopulationNormsViewModelDataSource isCurrentClassificationAvailable](self->_viewModel, "isCurrentClassificationAvailable"))
  {
    v9 = -[HKPopulationNormsViewModelDataSource currentClassificationIndex](self->_viewModel, "currentClassificationIndex");
    v10 = v9 == objc_msgSend(v6, "row");
  }
  else
  {
    v10 = 0;
  }
  -[HKPopulationNormsViewModelDataSource localizedClassificationTitleForIndex:](self->_viewModel, "localizedClassificationTitleForIndex:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsViewModelDataSource classificationIdentifierForIndex:](self->_viewModel, "classificationIdentifierForIndex:", objc_msgSend(v6, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:classificationIdentifier:highlighted:", v11, v12, v10);

  return v7;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  -[HKPopulationNormsClassificationCollectionView cellForItemAtIndexPath:](self->_classificationCollectionView, "cellForItemAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setSoftHighlightState:", 1);
    v4 = v5;
  }

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  -[HKPopulationNormsClassificationCollectionView cellForItemAtIndexPath:](self->_classificationCollectionView, "cellForItemAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setSoftHighlightState:", 0);
    v4 = v5;
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  HKPopulationNormsViewModelDataSource *viewModel;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB36B0];
  viewModel = self->_viewModel;
  v7 = a4;
  objc_msgSend(v5, "indexPathForRow:inSection:", -[HKPopulationNormsViewModelDataSource currentClassificationIndex](viewModel, "currentClassificationIndex"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsChartViewController _deselectClassificationCellAtIndexPath:](self, "_deselectClassificationCellAtIndexPath:", v8);
  -[HKPopulationNormsViewModelDataSource setClassificationIndex:](self->_viewModel, "setClassificationIndex:", objc_msgSend(v7, "row"));
  -[HKPopulationNormsChartViewController _selectClassificationCellAtIndexPath:](self, "_selectClassificationCellAtIndexPath:", v7);

}

- (void)_deselectClassificationCellAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HKPopulationNormsClassificationCollectionView cellForItemAtIndexPath:](self->_classificationCollectionView, "cellForItemAtIndexPath:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HKPopulationNormsViewModelDataSource localizedClassificationTitleForIndex:](self->_viewModel, "localizedClassificationTitleForIndex:", objc_msgSend(v7, "item"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsViewModelDataSource classificationIdentifierForIndex:](self->_viewModel, "classificationIdentifierForIndex:", objc_msgSend(v7, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:classificationIdentifier:highlighted:", v5, v6, 0);

    -[HKPopulationNormsClassificationCollectionView deselectItemAtIndexPath:animated:](self->_classificationCollectionView, "deselectItemAtIndexPath:animated:", v7, 1);
  }

}

- (void)_selectClassificationCellAtIndexPath:(id)a3
{
  HKPopulationNormsGraphView *populationNormsGraphView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKPopulationNormsDescriptionView *classificationDescriptionView;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  populationNormsGraphView = self->_populationNormsGraphView;
  -[HKPopulationNormsViewModelDataSource currentDataForBiologicalSex](self->_viewModel, "currentDataForBiologicalSex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsGraphView updateWithFlattenedLevelsByAgeBucket:currentClassificationIndex:](populationNormsGraphView, "updateWithFlattenedLevelsByAgeBucket:currentClassificationIndex:", v5, -[HKPopulationNormsViewModelDataSource currentClassificationIndex](self->_viewModel, "currentClassificationIndex"));

  -[HKPopulationNormsClassificationCollectionView cellForItemAtIndexPath:](self->_classificationCollectionView, "cellForItemAtIndexPath:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HKPopulationNormsViewModelDataSource currentLocalizedClassificationTitle](self->_viewModel, "currentLocalizedClassificationTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsViewModelDataSource classificationIdentifierForIndex:](self->_viewModel, "classificationIdentifierForIndex:", objc_msgSend(v13, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:classificationIdentifier:highlighted:", v7, v8, 1);

  }
  -[HKPopulationNormsClassificationCollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_classificationCollectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v13, 16, -[UIView isHidden](self->_contentView, "isHidden") ^ 1);
  classificationDescriptionView = self->_classificationDescriptionView;
  v10 = -[HKPopulationNormsViewModelDataSource shouldShowClassificationTitle](self->_viewModel, "shouldShowClassificationTitle");
  if (v10)
  {
    -[HKPopulationNormsViewModelDataSource currentLocalizedClassificationName](self->_viewModel, "currentLocalizedClassificationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[HKPopulationNormsViewModelDataSource currentLocalizedClassificationDescription](self->_viewModel, "currentLocalizedClassificationDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsDescriptionView updateWithTitle:description:](classificationDescriptionView, "updateWithTitle:description:", v11, v12);

  if (v10)
}

- (UIView)contentView
{
  return self->_contentView;
}

- (HKPopulationNormsViewModelDataSource)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (UILabel)chartTitleLabel
{
  return self->_chartTitleLabel;
}

- (void)setChartTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_chartTitleLabel, a3);
}

- (UISegmentedControl)biologicalSexSegmentedControl
{
  return self->_biologicalSexSegmentedControl;
}

- (void)setBiologicalSexSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_biologicalSexSegmentedControl, a3);
}

- (HKPopulationNormsGraphView)populationNormsGraphView
{
  return self->_populationNormsGraphView;
}

- (void)setPopulationNormsGraphView:(id)a3
{
  objc_storeStrong((id *)&self->_populationNormsGraphView, a3);
}

- (UILabel)classificationLevelsTitleLabel
{
  return self->_classificationLevelsTitleLabel;
}

- (void)setClassificationLevelsTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_classificationLevelsTitleLabel, a3);
}

- (HKPopulationNormsClassificationCollectionView)classificationCollectionView
{
  return self->_classificationCollectionView;
}

- (void)setClassificationCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_classificationCollectionView, a3);
}

- (HKPopulationNormsDescriptionView)classificationDescriptionView
{
  return self->_classificationDescriptionView;
}

- (void)setClassificationDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_classificationDescriptionView, a3);
}

- (UILabel)attributionLabel
{
  return self->_attributionLabel;
}

- (void)setAttributionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_attributionLabel, a3);
}

- (NSLayoutConstraint)previousPopulationNormsGraphHeightConstraint
{
  return self->_previousPopulationNormsGraphHeightConstraint;
}

- (void)setPreviousPopulationNormsGraphHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_previousPopulationNormsGraphHeightConstraint, a3);
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (BOOL)shouldEmbedInScrollView
{
  return self->_shouldEmbedInScrollView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong((id *)&self->_previousPopulationNormsGraphHeightConstraint, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_classificationDescriptionView, 0);
  objc_storeStrong((id *)&self->_classificationCollectionView, 0);
  objc_storeStrong((id *)&self->_classificationLevelsTitleLabel, 0);
  objc_storeStrong((id *)&self->_populationNormsGraphView, 0);
  objc_storeStrong((id *)&self->_biologicalSexSegmentedControl, 0);
  objc_storeStrong((id *)&self->_chartTitleLabel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
