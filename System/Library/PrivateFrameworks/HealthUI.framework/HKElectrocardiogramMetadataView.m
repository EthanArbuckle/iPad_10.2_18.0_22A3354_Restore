@implementation HKElectrocardiogramMetadataView

- (HKElectrocardiogramMetadataView)initWithSample:(id)a3 activeAlgorithmVersion:(int64_t)a4 displayGraph:(BOOL)a5 allowExportToPDF:(BOOL)a6 isSharedData:(BOOL)a7 delegate:(id)a8
{
  id v15;
  id v16;
  HKElectrocardiogramMetadataView *v17;
  HKElectrocardiogramMetadataView *v18;
  objc_super v20;

  v15 = a3;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)HKElectrocardiogramMetadataView;
  v17 = -[HKElectrocardiogramMetadataView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v17->_sample, a3);
    v17->_displayGraph = a5;
    v17->_allowExportToPDF = a6;
    v17->_isSharedData = a7;
    objc_storeWeak((id *)&v17->_delegate, v16);
    -[HKElectrocardiogramMetadataView _setupUIWithActiveAlgorithmVersion:](v17, "_setupUIWithActiveAlgorithmVersion:", a4);
  }
  v18 = v17;
LABEL_6:

  return v18;
}

- (void)_setupUIWithActiveAlgorithmVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKElectrocardiogramMetadataHeaderView *v11;
  void *v12;
  void *v13;
  HKElectrocardiogramMetadataHeaderView *v14;
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
  uint64_t v28;
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
  char v45;
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
  uint64_t v63;
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
  void *v75;
  void *v76;
  void *v77;
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
  void *v88;
  void *v89;
  void *v90;
  id v91;

  v91 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setBackgroundColor:", v5);

  -[HKElectrocardiogramMetadataView addSubview:](self, "addSubview:", v91);
  objc_msgSend(v91, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v91, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);
  objc_msgSend(v91, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataView topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[HKElectrocardiogramMetadataView sample](self, "sample");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_localizedClassificationWithActiveAlgorithmVersion:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [HKElectrocardiogramMetadataHeaderView alloc];
  -[HKElectrocardiogramMetadataView sample](self, "sample");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKElectrocardiogramMetadataHeaderView initWithText:date:](v11, "initWithText:date:", v10, v13);

  objc_msgSend(v91, "addSubview:", v14);
  -[HKElectrocardiogramMetadataHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKElectrocardiogramMetadataHeaderView leadingAnchor](v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataView layoutMarginsGuide](self, "layoutMarginsGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 10.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[HKElectrocardiogramMetadataView layoutMarginsGuide](self, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataHeaderView trailingAnchor](v14, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 10.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[HKElectrocardiogramMetadataHeaderView topAnchor](v14, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 16.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[HKElectrocardiogramMetadataHeaderView detailButton](v14, "detailButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel_detailButtonTapped_, 64);

  -[HKElectrocardiogramMetadataView sample](self, "sample");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hk_isClassificationSupported") ^ 1;
  -[HKElectrocardiogramMetadataHeaderView detailButton](v14, "detailButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidden:", v28);

  -[HKElectrocardiogramMetadataHeaderView bottomAnchor](v14, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = -[HKElectrocardiogramMetadataView displayGraph](self, "displayGraph");
  -[HKElectrocardiogramMetadataView _ecgChart](self, "_ecgChart");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if ((_DWORD)v27)
  {
    objc_msgSend(v91, "addSubview:", v31);
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v32, "hk_alignHorizontalConstraintsWithView:margin:", v91, 10.0);
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v30, 8.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v31, "infoView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v91, "addSubview:", v35);
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v35, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramMetadataView layoutMarginsGuide](self, "layoutMarginsGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, 10.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    objc_msgSend(v35, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramMetadataView trailingAnchor](self, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, -10.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    objc_msgSend(v35, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v35;
  }
  objc_msgSend(v34, "setActive:", 1);

  objc_msgSend(v32, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKElectrocardiogramMetadataView sample](self, "sample");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "hk_isSymptomsNotSet");

  if ((v45 & 1) == 0)
  {
    -[HKElectrocardiogramMetadataView _separatorLine](self, "_separatorLine");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addSubview:", v46);
    objc_msgSend(v46, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramMetadataView layoutMarginsGuide](self, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, 10.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    objc_msgSend(v46, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramMetadataView trailingAnchor](self, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setActive:", 1);

    objc_msgSend(v46, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v43);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    objc_msgSend(v46, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKElectrocardiogramMetadataView _bulletedTextView](self, "_bulletedTextView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addSubview:", v57);
    objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v57, "hk_alignHorizontalConstraintsWithView:margin:", v91, 10.0);
    objc_msgSend(v57, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v56);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setActive:", 1);

    objc_msgSend(v57, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[HKElectrocardiogramMetadataView allowExportToPDF](self, "allowExportToPDF"))
  {
    -[HKElectrocardiogramMetadataView _sharePDFControl](self, "_sharePDFControl");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addSubview:", v60);
    objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v60, "hk_alignHorizontalConstraintsWithView:margin:", v91, 0.0);
    objc_msgSend(v60, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v43);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setActive:", 1);

    objc_msgSend(v60, "bottomAnchor");
    v63 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v63;
  }
  -[HKElectrocardiogramMetadataView _separatorLine](self, "_separatorLine");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "addSubview:", v64);
  objc_msgSend(v64, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataView layoutMarginsGuide](self, "layoutMarginsGuide");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v67, 10.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setActive:", 1);

  objc_msgSend(v64, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataView trailingAnchor](self, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setActive:", 1);

  objc_msgSend(v64, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v43);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setActive:", 1);

  objc_msgSend(v64, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKElectrocardiogramMetadataView _footerLabel](self, "_footerLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "addSubview:", v75);
  objc_msgSend(v75, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataView layoutMarginsGuide](self, "layoutMarginsGuide");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v78, 10.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setActive:", 1);

  objc_msgSend(v75, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataView trailingAnchor](self, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v81, -10.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setActive:", 1);

  objc_msgSend(v75, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v74, 10.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setActive:", 1);

  objc_msgSend(v91, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, 16.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setActive:", 1);

  -[HKElectrocardiogramMetadataView bottomAnchor](self, "bottomAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setActive:", 1);

}

- (void)detailButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "electrocardiogramMetadataViewDidTapDetailButton:", self);

}

- (void)sharedPDFControlTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "electrocardiogramMetadataViewDidSelectShareRow:", self);

}

- (id)_ecgChart
{
  HKElectrocardiogramChartMetadataView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = -[HKElectrocardiogramChartMetadataView initWithGridSize:]([HKElectrocardiogramChartMetadataView alloc], "initWithGridSize:", 6.0, 6.0);
  -[HKElectrocardiogramChartMetadataView chartView](v3, "chartView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataView sample](self, "sample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayElectrocardiogram:allowsScrolling:", v5, 1);

  -[HKElectrocardiogramChartMetadataView chartView](v3, "chartView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEdgeMaskEnabled:", 1);

  -[HKElectrocardiogramMetadataView sample](self, "sample");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_localizedAverageBPM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView infoView](v3, "infoView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeartRateText:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[HKElectrocardiogramMetadataView sample](self, "sample");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "electrocardiogramMetadataView:regulatedBodyTextForSample:", self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView infoView](v3, "infoView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBodyText:", v12);

  objc_msgSend(CFSTR("SessionDetails"), "stringByAppendingString:", CFSTR(".Waveform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartMetadataView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v15);

  return v3;
}

- (id)_bulletedTextView
{
  HKElectrocardiogramBulletedTextView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(HKElectrocardiogramBulletedTextView);
  HKHealthKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SYMPTOMS_TITLE"), &stru_1E9C4C428, CFSTR("Localizable-Cinnamon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView setTitleText:](v3, "setTitleText:", v6);

  -[HKElectrocardiogramMetadataView sample](self, "sample");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_localizedSymptoms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView setDetailTextWithBullets:](v3, "setDetailTextWithBullets:", v8);

  objc_msgSend(CFSTR("SessionDetails"), "stringByAppendingString:", CFSTR(".Symptoms"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v10);

  return v3;
}

- (id)_sharePDFControl
{
  HKExportPDFControl *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKExportPDFControl *v8;

  v3 = [HKExportPDFControl alloc];
  HKHealthKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ECG_SHARE_PDF_TITLE"), &stru_1E9C4C428, CFSTR("Localizable-Cinnamon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("SessionDetails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKExportPDFControl initWithText:layoutMargins:accessibilityIdentifierPrefix:](v3, "initWithText:layoutMargins:accessibilityIdentifierPrefix:", v6, v7, 10.0, 10.0, 10.0, 10.0);

  -[HKExportPDFControl addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", self, sel_sharedPDFControlTapped_, 64);
  return v8;
}

- (id)_footerLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(self) = -[HKElectrocardiogramMetadataView isSharedData](self, "isSharedData");
  HKHealthKitFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)self)
    v7 = CFSTR("ECG_IN_CASE_OF_EMERGENCY_SHARED_SUMMARY");
  else
    v7 = CFSTR("ECG_IN_CASE_OF_EMERGENCY");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("Localizable-Cinnamon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v9);

  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v10);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 0x8000, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v12);

  objc_msgSend(CFSTR("SessionDetails"), "stringByAppendingString:", CFSTR(".HeartAttackWarning"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v14);

  return v3;
}

- (id)_separatorLine
{
  HKSeparatorLineView *v2;
  void *v3;

  v2 = objc_alloc_init(HKSeparatorLineView);
  -[HKSeparatorLineView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSeparatorLineView setColor:](v2, "setColor:", v3);

  -[HKSeparatorLineView setSeparatorThickness:](v2, "setSeparatorThickness:", HKUIFloorToScreenScale(0.5));
  return v2;
}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (BOOL)displayGraph
{
  return self->_displayGraph;
}

- (BOOL)allowExportToPDF
{
  return self->_allowExportToPDF;
}

- (BOOL)isSharedData
{
  return self->_isSharedData;
}

- (HKElectrocardiogramMetadataViewDelegate)delegate
{
  return (HKElectrocardiogramMetadataViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
