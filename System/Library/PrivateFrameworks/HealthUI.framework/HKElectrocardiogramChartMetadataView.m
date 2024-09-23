@implementation HKElectrocardiogramChartMetadataView

- (HKElectrocardiogramChartMetadataView)initWithGridSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  HKElectrocardiogramChartMetadataView *v9;
  uint64_t v10;
  UIScrollView *scrollView;
  HKElectrocardiogramChartView *v12;
  HKElectrocardiogramChartView *chartView;
  HKElectrocardiogramAxisView *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  HKElectrocardiogramAxisView *axisView;
  HKElectrocardiogramInfoView *v25;
  HKElectrocardiogramInfoView *infoView;
  objc_super v28;

  height = a3.height;
  width = a3.width;
  v28.receiver = self;
  v28.super_class = (Class)HKElectrocardiogramChartMetadataView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[HKElectrocardiogramChartMetadataView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", v5, v6, v7, v8);
    scrollView = v9->_scrollView;
    v9->_scrollView = (UIScrollView *)v10;

    v12 = -[HKElectrocardiogramChartView initWithGridSize:]([HKElectrocardiogramChartView alloc], "initWithGridSize:", width, height);
    chartView = v9->_chartView;
    v9->_chartView = v12;

    v14 = [HKElectrocardiogramAxisView alloc];
    -[HKElectrocardiogramChartView pointsPerSecond](v9->_chartView, "pointsPerSecond");
    v16 = v15;
    -[HKElectrocardiogramChartView gridOptions](v9->_chartView, "gridOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lineColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramChartView gridOptions](v9->_chartView, "gridOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lineWidth");
    v23 = -[HKElectrocardiogramAxisView initWithAxisSpacing:lineColor:lineWidth:](v14, "initWithAxisSpacing:lineColor:lineWidth:", v19, v16, v22);
    axisView = v9->_axisView;
    v9->_axisView = (HKElectrocardiogramAxisView *)v23;

    v25 = objc_alloc_init(HKElectrocardiogramInfoView);
    infoView = v9->_infoView;
    v9->_infoView = v25;

    -[HKElectrocardiogramChartMetadataView _setUpUI](v9, "_setUpUI");
  }
  return v9;
}

- (void)_setUpUI
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[9];

  v39[7] = *MEMORY[0x1E0C80C00];
  -[HKElectrocardiogramChartMetadataView _setUpScrollViewContent](self, "_setUpScrollViewContent");
  -[HKElectrocardiogramChartMetadataView infoView](self, "infoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView addSubview:](self, "addSubview:", v4);

  -[HKElectrocardiogramChartMetadataView infoView](self, "infoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView addSubview:](self, "addSubview:", v5);

  v25 = (void *)MEMORY[0x1E0CB3718];
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView topAnchor](self, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v35;
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView infoView](self, "infoView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v30;
  -[HKElectrocardiogramChartMetadataView infoView](self, "infoView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView bottomAnchor](self, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v26;
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leftAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView leftAnchor](self, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v21;
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView rightAnchor](self, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v17;
  -[HKElectrocardiogramChartMetadataView layoutMarginsGuide](self, "layoutMarginsGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView infoView](self, "infoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v8;
  -[HKElectrocardiogramChartMetadataView infoView](self, "infoView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView layoutMarginsGuide](self, "layoutMarginsGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v14);

  -[HKElectrocardiogramChartMetadataView _updateMargins](self, "_updateMargins");
}

- (void)_setUpScrollViewContent
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
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
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
  void *v74;
  id v75;

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView axisView](self, "axisView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", 0);

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartMetadataView axisView](self, "axisView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsHorizontalScrollIndicator:", 0);

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", 11);
  v75 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v15);

  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "gridSize");
  v19 = v18;
  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "gridOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19 * (double)(unint64_t)objc_msgSend(v22, "unitMultiple");

  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frameLayoutGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "contentLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leftAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "contentLayoutGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[HKElectrocardiogramChartMetadataView axisView](self, "axisView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "frameLayoutGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView axisView](self, "axisView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  -[HKElectrocardiogramChartMetadataView axisView](self, "axisView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leftAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "contentLayoutGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leftAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setActive:", 1);

  -[HKElectrocardiogramChartMetadataView axisView](self, "axisView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "rightAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "contentLayoutGuide");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "contentLayoutGuide");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "heightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "frameLayoutGuide");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "heightAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:multiplier:", v73, 1.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setActive:", 1);

}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramChartMetadataView;
  -[HKElectrocardiogramChartMetadataView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[HKElectrocardiogramChartMetadataView _updateMargins](self, "_updateMargins");
}

- (void)_updateMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;

  -[HKElectrocardiogramChartMetadataView directionalLayoutMargins](self, "directionalLayoutMargins");
  v9 = v8;
  -[HKElectrocardiogramChartMetadataView directionalLayoutMargins](self, "directionalLayoutMargins");
  v11 = v10;
  -[HKElectrocardiogramChartMetadataView scrollView](self, "scrollView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentInset:", v5, v9, v7, v11);

}

- (CGSize)gridSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HKElectrocardiogramChartMetadataView chartView](self, "chartView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (HKElectrocardiogramChartView)chartView
{
  return self->_chartView;
}

- (void)setChartView:(id)a3
{
  objc_storeStrong((id *)&self->_chartView, a3);
}

- (HKElectrocardiogramInfoView)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_infoView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (HKElectrocardiogramAxisView)axisView
{
  return self->_axisView;
}

- (void)setAxisView:(id)a3
{
  objc_storeStrong((id *)&self->_axisView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_chartView, 0);
}

@end
