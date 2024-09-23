@implementation PKRecognitionDataCollectionViewController

- (PKRecognitionDataCollectionViewController)initWithDrawings:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  PKRecognitionDataCollectionViewController *v7;
  uint64_t v8;
  NSArray *drawings;
  uint64_t v10;
  NSDictionary *metadata;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKRecognitionDataCollectionViewController;
  v5 = a4;
  v6 = a3;
  v7 = -[PKRecognitionDataCollectionViewController init](&v13, sel_init);
  v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  drawings = v7->_drawings;
  v7->_drawings = (NSArray *)v8;

  v10 = objc_msgSend(v5, "copy");
  metadata = v7->_metadata;
  v7->_metadata = (NSDictionary *)v10;

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  objc_class *v71;
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
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
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
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t i;
  void *v142;
  void *v143;
  void *v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  objc_super v149;
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v149.receiver = self;
  v149.super_class = (Class)PKRecognitionDataCollectionViewController;
  -[PKRecognitionDataCollectionViewController viewDidLoad](&v149, sel_viewDidLoad);
  _PencilKitBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Handwriting Feedback"), CFSTR("Handwriting Feedback"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController setTitle:](self, "setTitle:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
  -[PKRecognitionDataCollectionViewController setScrollView:](self, "setScrollView:", v12);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlwaysBounceVertical:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKRecognitionDataCollectionViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frameLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frameLayoutGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leftAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frameLayoutGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "safeAreaLayoutGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frameLayoutGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "safeAreaLayoutGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "frameLayoutGuide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "widthAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "contentLayoutGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
  -[PKRecognitionDataCollectionViewController setDescriptionLabel:](self, "setDescriptionLabel:", v52);

  -[PKRecognitionDataCollectionViewController descriptionLabel](self, "descriptionLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setNumberOfLines:", 0);

  _PencilKitBundle();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("Help us improve handwriting recognition by submitting this drawing to Apple. If you wish to submit only a portion of your drawing, you can cancel and select the relevant region using the lasso tool. Your submission may contain strokes that were previously made in the area shown in the screenshot, but which are no longer visible."), CFSTR("Help us improve handwriting recognition by submitting this drawing to Apple. If you wish to submit only a portion of your drawing, you can cancel and select the relevant region using the lasso tool. Your submission may contain strokes that were previously made in the area shown in the screenshot, but which are no longer visible."), CFSTR("Localizable"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController descriptionLabel](self, "descriptionLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setText:", v55);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController descriptionLabel](self, "descriptionLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setFont:", v57);

  -[PKRecognitionDataCollectionViewController descriptionLabel](self, "descriptionLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController descriptionLabel](self, "descriptionLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addSubview:", v61);

  v62 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v62, "setMinimumLineSpacing:", 20.0);
  objc_msgSend(v62, "setMinimumInteritemSpacing:", 20.0);
  objc_msgSend(v62, "setSectionInset:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v62, "setItemSize:", 240.0, 240.0);
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v62, v8, v9, v10, v11);
  -[PKRecognitionDataCollectionViewController setCollectionView:](self, "setCollectionView:", v63);

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setBackgroundColor:", v65);

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setDataSource:", self);

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setDelegate:", self);

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_opt_class();
  v71 = (objc_class *)objc_opt_class();
  NSStringFromClass(v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "registerClass:forCellWithReuseIdentifier:", v70, v72);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addSubview:", v74);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "contentLayoutGuide");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController descriptionLabel](self, "descriptionLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, -20.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "contentLayoutGuide");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "leftAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController descriptionLabel](self, "descriptionLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "leftAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v85, -20.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "contentLayoutGuide");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "rightAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController descriptionLabel](self, "descriptionLabel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "rightAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v91, 20.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController descriptionLabel](self, "descriptionLabel");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "bottomAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v96, -20.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "contentLayoutGuide");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "leftAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "leftAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v102, -20.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "contentLayoutGuide");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "rightAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "rightAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:constant:", v108, 20.0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "contentLayoutGuide");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "bottomAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "bottomAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:constant:", v114, 20.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "frameLayoutGuide");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "widthAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "contentLayoutGuide");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "widthAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "frameLayoutGuide");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "centerXAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "contentLayoutGuide");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "centerXAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "heightAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToConstant:", 0.0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController setCollectionViewHeightConstraint:](self, "setCollectionViewHeightConstraint:", v132);

  -[PKRecognitionDataCollectionViewController collectionViewHeightConstraint](self, "collectionViewHeightConstraint");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "setActive:", 0);

  v134 = (void *)MEMORY[0x1E0C99DE8];
  -[PKRecognitionDataCollectionViewController drawings](self, "drawings");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "arrayWithCapacity:", objc_msgSend(v135, "count"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  -[PKRecognitionDataCollectionViewController drawings](self, "drawings", 0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v145, v150, 16);
  if (v138)
  {
    v139 = v138;
    v140 = *(_QWORD *)v146;
    do
    {
      for (i = 0; i != v139; ++i)
      {
        if (*(_QWORD *)v146 != v140)
          objc_enumerationMutation(v137);
        -[PKRecognitionDataCollectionViewController synchronousImageForDrawing:](self, "synchronousImageForDrawing:", *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * i));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "addObject:", v142);

      }
      v139 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v145, v150, 16);
    }
    while (v139);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v136);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDataCollectionViewController setDrawingImages:](self, "setDrawingImages:", v143);

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "reloadData");

  -[PKRecognitionDataCollectionViewController adjustCollectionViewHeight](self, "adjustCollectionViewHeight");
}

- (void)adjustCollectionViewHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[PKRecognitionDataCollectionViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  -[PKRecognitionDataCollectionViewController collectionViewHeightConstraint](self, "collectionViewHeightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[PKRecognitionDataCollectionViewController collectionView](self, "collectionView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentSize");
  v9 = v8;
  -[PKRecognitionDataCollectionViewController collectionViewHeightConstraint](self, "collectionViewHeightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

}

- (id)saveDataForDrawings:(id)a3 baseURL:(id)a4 shouldSaveRecognitionData:(BOOL)a5
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  UIImage *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v65;
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
  _BOOL4 v78;
  unint64_t v80;
  void *v81;
  UIImage *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;

  v78 = a5;
  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v85 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    v65 = v6;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serializeWithVersion:", 2);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/drawing_%d.drawing"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "URLByAppendingPathComponent:", v10);
      v11 = v6;
      v12 = objc_claimAutoreleasedReturnValue();

      v83 = (void *)v9;
      v13 = (void *)v9;
      v14 = (void *)v12;
      objc_msgSend(v13, "writeToURL:atomically:", v12, 1);
      objc_msgSend(v81, "addObject:", v12);
      -[PKRecognitionDataCollectionViewController drawingImages](self, "drawingImages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
      v16 = (UIImage *)objc_claimAutoreleasedReturnValue();

      v82 = v16;
      UIImagePNGRepresentation(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/image_%d.png"), v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "URLByAppendingPathComponent:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "writeToURL:atomically:", v19, 1);
      v6 = v11;
      objc_msgSend(v81, "addObject:", v19);
      if (v78)
      {
        v84 = v8;
        objc_msgSend(v8, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKRecognitionSessionCache recognitionSessionForUUID:]((uint64_t)PKRecognitionSessionCache, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKRecognitionSessionManager session](v21);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22
          || objc_msgSend(v8, "recognitionEnabled")
          && (objc_msgSend(v8, "recognitionSession"), (v22 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v74 = v21;
          v75 = v19;
          v76 = v17;
          v77 = v14;
          v73 = (void *)v22;
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16810]), "initWithRecognitionSession:", v22);
          objc_msgSend(v23, "start");
          objc_msgSend(v23, "waitForPendingUpdates");
          objc_msgSend(v23, "indexableContent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "indexableTextRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dataUsingEncoding:", 4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v80 = v7;
          v27 = v7;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/indexableText_%d.txt"), v7);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "URLByAppendingPathComponent:", v28);
          v29 = objc_claimAutoreleasedReturnValue();

          v71 = v26;
          objc_msgSend(v26, "writeToURL:atomically:", v29, 1);
          v70 = (void *)v29;
          objc_msgSend(v81, "addObject:", v29);
          v72 = v23;
          objc_msgSend(v23, "indexableContent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "presentableTextRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "dataUsingEncoding:", 4);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/presentableText_%d.txt"), v27);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "URLByAppendingPathComponent:", v33);
          v34 = objc_claimAutoreleasedReturnValue();

          v69 = v32;
          objc_msgSend(v32, "writeToURL:atomically:", v34, 1);
          v68 = (void *)v34;
          objc_msgSend(v81, "addObject:", v34);
          v35 = objc_alloc(MEMORY[0x1E0D168B8]);
          objc_msgSend(v8, "recognitionSession");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v35, "initWithRecognitionSession:", v36);

          objc_msgSend(v37, "setStatusReportingEnabled:", 1);
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = 0u;
          v89 = 0u;
          v90 = 0u;
          v91 = 0u;
          objc_msgSend(MEMORY[0x1E0D168B8], "availableRecognitionSessionStatusKeys");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v89;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v89 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0D168B8], "localizedNameForRecognitionSessionStatusKey:", v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setEnabled:forVisualizationIdentifier:", 1, v44);
                objc_msgSend(v37, "valueForRecognitionStatusKey:", v44);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "appendFormat:", CFSTR("*%@*\n"), v45);
                if (v46)
                  objc_msgSend(v38, "appendFormat:", CFSTR("%@\n\n"), v46);
                else
                  objc_msgSend(v38, "appendString:", CFSTR("\n"));

              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
            }
            while (v41);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/visualizationManager_%d.txt"), v80);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "URLByAppendingPathComponent:", v47);
          v48 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "dataUsingEncoding:", 4);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "writeToURL:atomically:", v48, 1);
          v67 = (void *)v48;
          objc_msgSend(v81, "addObject:", v48);
          objc_msgSend(v84, "uuid");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          CacheFileURLForUUID(v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "path");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v48) = objc_msgSend(v51, "fileExistsAtPath:", v52);

          v14 = v77;
          v19 = v75;
          if ((_DWORD)v48)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/drawing_%d.sessionCache"), v80);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "URLByAppendingPathComponent:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = 0;
            v56 = objc_msgSend(v55, "copyItemAtURL:toURL:error:", v50, v54, &v87);

            if (v56)
              objc_msgSend(v81, "addObject:", v54);

          }
          v6 = v65;
          v7 = v80;
          v17 = v76;
          v21 = v74;
        }

        v8 = v84;
      }

      ++v7;
    }
    while (v7 < objc_msgSend(v6, "count"));
  }
  v57 = v6;
  v58 = (void *)MEMORY[0x1E0CB36D8];
  -[PKRecognitionDataCollectionViewController metadata](self, "metadata");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0;
  objc_msgSend(v58, "dataWithJSONObject:options:error:", v59, 0, &v86);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v86;

  if (!v60)
    NSLog(CFSTR("Error saving metadata %@"), v61);
  objc_msgSend(v85, "URLByAppendingPathComponent:", CFSTR("/metadata.txt"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "writeToURL:atomically:", v62, 1);
  objc_msgSend(v81, "addObject:", v62);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v81);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  return v63;
}

- (id)synchronousImageForDrawing:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  double v5;
  double v6;
  double v7;
  double MaxY;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  PKImageRenderer *v16;
  void *v17;
  double v18;
  PKImageRenderer *v19;
  NSObject *v20;
  id v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  CGRect v32;

  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__28;
  v30 = __Block_byref_object_dispose__28;
  v31 = 0;
  objc_msgSend(v3, "_canvasBounds");
  v7 = v6;
  MaxY = v5;
  if (v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v3, "bounds");
    MaxY = CGRectGetMaxY(v32);
    v7 = 768.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  if (v12 < v7)
    v7 = v12;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;

  if (v15 < MaxY)
    MaxY = v15;
  v16 = [PKImageRenderer alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = -[PKImageRenderer initWithSize:scale:](v16, "initWithSize:scale:", v7, MaxY, v18);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72__PKRecognitionDataCollectionViewController_synchronousImageForDrawing___block_invoke;
  v23[3] = &unk_1E7779240;
  v25 = &v26;
  v20 = v4;
  v24 = v20;
  -[PKImageRenderer renderDrawing:completion:](v19, "renderDrawing:completion:", v3, v23);
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  v21 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v21;
}

void __72__PKRecognitionDataCollectionViewController_synchronousImageForDrawing___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  PKRecognitionDrawingPreviewViewController *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[PKRecognitionDataCollectionViewController drawingImages](self, "drawingImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[PKRecognitionDrawingPreviewViewController initWithDrawingImage:]([PKRecognitionDrawingPreviewViewController alloc], "initWithDrawingImage:", v10);
  -[PKRecognitionDataCollectionViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v8, 1);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subviews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v18++), "removeFromSuperview", (_QWORD)v31);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v16);
  }

  -[PKRecognitionDataCollectionViewController drawingImages](self, "drawingImages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v20);
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMinificationFilter:", *MEMORY[0x1E0CD2EF8]);

  objc_msgSend(v21, "setContentMode:", 1);
  objc_msgSend(v10, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v21);

  objc_msgSend(v10, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  objc_msgSend(v21, "setFrame:");

  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = objc_msgSend(v25, "CGColor");
  objc_msgSend(v10, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBorderColor:", v26);

  objc_msgSend(v10, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBorderWidth:", 0.5);

  objc_msgSend(v10, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCornerRadius:", 8.0);

  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PKRecognitionDataCollectionViewController drawingImages](self, "drawingImages", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)submitFeedback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v18 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v18);
  v11 = v18;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("PKShouldForceFeedbackAssistant"));

    v15 = (v14 & 1) == 0 && (os_variant_has_internal_diagnostics() & 1) != 0;
    -[PKRecognitionDataCollectionViewController drawings](self, "drawings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionDataCollectionViewController saveDataForDrawings:baseURL:shouldSaveRecognitionData:](self, "saveDataForDrawings:baseURL:shouldSaveRecognitionData:", v16, v8, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKHandwritingDebugUtility submitFeedbackWithAttachments:title:](PKHandwritingDebugUtility, "submitFeedbackWithAttachments:title:", v17, CFSTR("Handwriting Feedback: "));
  }
  else
  {
    NSLog(CFSTR("ERROR: %@"), v11);
  }

}

- (NSArray)drawings
{
  return self->_drawings;
}

- (void)setDrawings:(id)a3
{
  objc_storeStrong((id *)&self->_drawings, a3);
}

- (NSArray)drawingImages
{
  return self->_drawingImages;
}

- (void)setDrawingImages:(id)a3
{
  objc_storeStrong((id *)&self->_drawingImages, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_drawingImages, 0);
  objc_storeStrong((id *)&self->_drawings, 0);
}

@end
