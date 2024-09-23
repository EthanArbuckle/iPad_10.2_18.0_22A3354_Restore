@implementation HKElectrocardiogramChartTableViewCell

- (HKElectrocardiogramChartTableViewCell)initWithGridSize:(CGSize)a3 reuseIdentifier:(id)a4
{
  double height;
  double width;
  HKElectrocardiogramChartTableViewCell *v6;
  id v7;
  uint64_t v8;
  UIScrollView *scrollView;
  HKElectrocardiogramChartView *v10;
  HKElectrocardiogramChartView *chartView;
  HKElectrocardiogramAxisView *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  HKElectrocardiogramAxisView *axisView;
  HKElectrocardiogramInfoView *v23;
  HKElectrocardiogramInfoView *infoView;
  objc_super v26;

  height = a3.height;
  width = a3.width;
  v26.receiver = self;
  v26.super_class = (Class)HKElectrocardiogramChartTableViewCell;
  v6 = -[HKElectrocardiogramChartTableViewCell initWithStyle:reuseIdentifier:](&v26, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC3C28]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    scrollView = v6->_scrollView;
    v6->_scrollView = (UIScrollView *)v8;

    v10 = -[HKElectrocardiogramChartView initWithGridSize:]([HKElectrocardiogramChartView alloc], "initWithGridSize:", width, height);
    chartView = v6->_chartView;
    v6->_chartView = v10;

    v12 = [HKElectrocardiogramAxisView alloc];
    -[HKElectrocardiogramChartView pointsPerSecond](v6->_chartView, "pointsPerSecond");
    v14 = v13;
    -[HKElectrocardiogramChartView gridOptions](v6->_chartView, "gridOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lineColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramChartView gridOptions](v6->_chartView, "gridOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lineWidth");
    v21 = -[HKElectrocardiogramAxisView initWithAxisSpacing:lineColor:lineWidth:](v12, "initWithAxisSpacing:lineColor:lineWidth:", v17, v14, v20);
    axisView = v6->_axisView;
    v6->_axisView = (HKElectrocardiogramAxisView *)v21;

    v23 = objc_alloc_init(HKElectrocardiogramInfoView);
    infoView = v6->_infoView;
    v6->_infoView = v23;

    -[HKElectrocardiogramChartTableViewCell _setUpUI](v6, "_setUpUI");
  }
  return v6;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[9];

  v47[7] = *MEMORY[0x1E0C80C00];
  -[HKElectrocardiogramChartTableViewCell _setUpScrollViewContent](self, "_setUpScrollViewContent");
  -[HKElectrocardiogramChartTableViewCell infoView](self, "infoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell infoView](self, "infoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v30 = (void *)MEMORY[0x1E0CB3718];
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 20.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v42;
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell infoView](self, "infoView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v37;
  -[HKElectrocardiogramChartTableViewCell infoView](self, "infoView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v32;
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leftAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v26;
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v21;
  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell infoView](self, "infoView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v9;
  -[HKElectrocardiogramChartTableViewCell infoView](self, "infoView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutMarginsGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v16);

  -[HKElectrocardiogramChartTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[HKElectrocardiogramChartTableViewCell _updateMargins](self, "_updateMargins");
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
  id v74;

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell axisView](self, "axisView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", 0);

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartTableViewCell axisView](self, "axisView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsHorizontalScrollIndicator:", 0);

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appTintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v15);

  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "gridSize");
  v19 = v18;
  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "gridOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19 * (double)(unint64_t)objc_msgSend(v22, "unitMultiple");

  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frameLayoutGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "contentLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leftAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "contentLayoutGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[HKElectrocardiogramChartTableViewCell axisView](self, "axisView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "frameLayoutGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell axisView](self, "axisView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  -[HKElectrocardiogramChartTableViewCell axisView](self, "axisView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leftAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "contentLayoutGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leftAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setActive:", 1);

  -[HKElectrocardiogramChartTableViewCell axisView](self, "axisView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "rightAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "contentLayoutGuide");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v74 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "contentLayoutGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "heightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "frameLayoutGuide");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:multiplier:", v72, 1.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setActive:", 1);

}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramChartTableViewCell;
  -[HKElectrocardiogramChartTableViewCell layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[HKElectrocardiogramChartTableViewCell _updateMargins](self, "_updateMargins");
}

- (void)_updateMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;

  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "directionalLayoutMargins");
  v10 = v9;

  -[HKElectrocardiogramChartTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "directionalLayoutMargins");
  v13 = v12;

  -[HKElectrocardiogramChartTableViewCell scrollView](self, "scrollView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentInset:", v5, v10, v7, v13);

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

  -[HKElectrocardiogramChartTableViewCell chartView](self, "chartView");
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
