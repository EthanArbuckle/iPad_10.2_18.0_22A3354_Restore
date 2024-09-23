@implementation PKTextInputDebugRadarViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PKTextInputDebugRadarViewController)initWithSharpenerLog:(id)a3
{
  id v5;
  PKTextInputDebugRadarViewController *v6;
  PKTextInputDebugRadarViewController *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *intendedTexts;
  uint64_t v12;
  NSMutableIndexSet *includedEntryIndexes;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTextInputDebugRadarViewController;
  v6 = -[PKTextInputDebugRadarViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharpenerLog, a3);
    objc_msgSend(v5, "logEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    intendedTexts = v7->__intendedTexts;
    v7->__intendedTexts = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    includedEntryIndexes = v7->__includedEntryIndexes;
    v7->__includedEntryIndexes = (NSMutableIndexSet *)v12;

    -[PKTextInputDebugRadarViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTextInputDebugRadarViewController;
  -[PKTextInputDebugRadarViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKTextInputDebugRadarViewController _loadIntendedTexts](self, "_loadIntendedTexts");
  -[PKTextInputDebugRadarViewController _setupViews](self, "_setupViews");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleKeyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleKeyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTextInputDebugRadarViewController;
  -[PKTextInputDebugRadarViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentOffset:", 0.0, -1.0);

}

- (void)_loadIntendedTexts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "resultCommittedText");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (__CFString *)v9;
        else
          v11 = &stru_1E777DEE8;
        v12 = v11;

        -[PKTextInputDebugRadarViewController _intendedTexts](self, "_intendedTexts");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)_setupViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
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
  double v35;
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
  double v53;
  void *v54;
  double v55;
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
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
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
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  _QWORD v203[20];
  _QWORD v204[5];

  v204[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = objc_claimAutoreleasedReturnValue();
  v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancelButton_);
  -[PKTextInputDebugRadarViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v200);

  v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _PencilKitBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Create Radar"), CFSTR("Create Radar"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 2, self, sel__handleSubmitRadarButton_);
  -[PKTextInputDebugRadarViewController set_submitButton:](self, "set_submitButton:", v11);

  -[PKTextInputDebugRadarViewController _submitButton](self, "_submitButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

  _PencilKitBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Report a Problem with Scribble"), CFSTR("Report a Problem with Scribble"), CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", v15);

  v17 = objc_alloc(MEMORY[0x1E0DC3990]);
  v18 = *MEMORY[0x1E0C9D648];
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v202 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], v19, v20, v21);
  _PencilKitBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Surrounding text to include:"), CFSTR("Surrounding text to include:"), CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "setText:", v23);

  objc_msgSend(v202, "setFont:", v5);
  objc_msgSend(v202, "setTextColor:", v6);
  objc_msgSend(v202, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v202, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v202, "setMinimumScaleFactor:", 0.7);
  objc_msgSend(v202, "setLineBreakMode:", 4);
  _PencilKitBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("None"), CFSTR("None"), CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v204[0] = v25;
  _PencilKitBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Minimal"), CFSTR("Minimal"), CFSTR("Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v204[1] = v27;
  _PencilKitBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Full"), CFSTR("Full"), CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v204[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v204, 3);
  v199 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v199);
  -[PKTextInputDebugRadarViewController set_contextDetailControl:](self, "set_contextDetailControl:", v30);

  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSelectedSegmentIndex:", 2);

  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addTarget:action:forControlEvents:", self, sel__handleDetailControlChanged_, 4096);

  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = 1148846080;
  objc_msgSend(v34, "setContentCompressionResistancePriority:forAxis:", 0, v35);

  v201 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v18, v19, v20, v21);
  _PencilKitBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Include Sysdiagnose:"), CFSTR("Include Sysdiagnose:"), CFSTR("Localizable"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "setText:", v37);

  v195 = (void *)v5;
  objc_msgSend(v201, "setFont:", v5);
  v194 = (void *)v6;
  objc_msgSend(v201, "setTextColor:", v6);
  objc_msgSend(v201, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v201, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v201, "setMinimumScaleFactor:", 0.7);
  objc_msgSend(v201, "setLineBreakMode:", 4);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController set_sysdiagnoseButton:](self, "set_sysdiagnoseButton:", v38);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFont:", v40);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBorderWidth:", 1.0);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCornerRadius:", 12.0);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setContentEdgeInsets:", 4.5, 10.0, 4.5, 9.0);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setImageEdgeInsets:", 0.0, -5.0, 0.0, 0.0);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTitleEdgeInsets:", 0.0, 1.0, 0.0, -1.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setBackgroundColor:", v50);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v53) = 1148846080;
  objc_msgSend(v52, "setContentHuggingPriority:forAxis:", 0, v53);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = 1148846080;
  objc_msgSend(v54, "setContentCompressionResistancePriority:forAxis:", 0, v55);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  _PencilKitBundle();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Excluded"), CFSTR("Excluded"), CFSTR("Localizable"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setTitle:forState:", v58, 0);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  _PencilKitBundle();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("Included"), CFSTR("Included"), CFSTR("Localizable"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setTitle:forState:", v61, 4);

  v62 = (void *)MEMORY[0x1E0DC3888];
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "titleLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "font");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "configurationWithFont:", v65);
  v66 = objc_claimAutoreleasedReturnValue();

  v198 = (void *)v66;
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v66);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v66);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setImage:forState:", v197, 0);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setImage:forState:", v196, 4);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setTitleColor:forState:", v70, 0);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setTitleColor:forState:", v72, 4);

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addTarget:action:forControlEvents:", self, sel__toggleSysdiagnoseButton, 64);

  v74 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setBackgroundColor:", v75);

  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v18, v19, v20, v21);
  _PencilKitBundle();
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("Specify the text you intended to write:"), CFSTR("Specify the text you intended to write:"), CFSTR("Localizable"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setText:", v78);

  objc_msgSend(v76, "setFont:", v5);
  objc_msgSend(v76, "setTextColor:", v6);
  objc_msgSend(v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v79 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 80.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "sizeWithWidthDimension:heightDimension:", v80, v81);
  v82 = objc_claimAutoreleasedReturnValue();

  v193 = (void *)v82;
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v82);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:subitem:count:", v82, v192, 1);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "setContentInsets:", 0.0, 20.0, 0.0, 20.0);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v191);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSection:", v190);
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v189, v18, v19, v20, v21);
  -[PKTextInputDebugRadarViewController set_entriesCollectionView:](self, "set_entriesCollectionView:", v83);

  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setDataSource:", self);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setBackgroundColor:", v85);

  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setAlwaysBounceVertical:", 1);

  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("logEntry"));

  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKTextInputDebugRadarViewController view](self, "view");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addSubview:", v202);

  -[PKTextInputDebugRadarViewController view](self, "view");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "addSubview:", v92);

  -[PKTextInputDebugRadarViewController view](self, "view");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "addSubview:", v201);

  -[PKTextInputDebugRadarViewController view](self, "view");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "addSubview:", v95);

  -[PKTextInputDebugRadarViewController view](self, "view");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "addSubview:", v74);

  -[PKTextInputDebugRadarViewController view](self, "view");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addSubview:", v76);

  -[PKTextInputDebugRadarViewController view](self, "view");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addSubview:", v99);

  -[PKTextInputDebugRadarViewController _updateSubmitButton](self, "_updateSubmitButton");
  -[PKTextInputDebugRadarViewController _updateScrollView](self, "_updateScrollView");
  -[PKTextInputDebugRadarViewController set_includeSysdiagnose:](self, "set_includeSysdiagnose:", 1);
  -[PKTextInputDebugRadarViewController _updateSysdiagnoseButton](self, "_updateSysdiagnoseButton");
  -[PKTextInputDebugRadarViewController view](self, "view");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "layoutMarginsGuide");
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v152 = (void *)MEMORY[0x1E0CB3718];
  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "topAnchor");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v101;
  objc_msgSend(v101, "topAnchor");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "constraintEqualToAnchor:constant:", v186, 12.0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v203[0] = v185;
  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "trailingAnchor");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "trailingAnchor");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "constraintEqualToAnchor:constant:", v181, -20.0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v203[1] = v180;
  objc_msgSend(v202, "centerYAnchor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "centerYAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "constraintEqualToAnchor:", v177);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v203[2] = v176;
  objc_msgSend(v202, "leadingAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "leadingAnchor");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "constraintEqualToAnchor:constant:", v173, 20.0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v203[3] = v172;
  objc_msgSend(v202, "trailingAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "leadingAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "constraintLessThanOrEqualToAnchor:", v169);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v203[4] = v168;
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "topAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "bottomAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "constraintEqualToAnchor:constant:", v164, 12.0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v203[5] = v163;
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "trailingAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "trailingAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "constraintEqualToAnchor:constant:", v159, -20.0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v203[6] = v158;
  objc_msgSend(v201, "centerYAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "centerYAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "constraintEqualToAnchor:", v154);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v203[7] = v153;
  objc_msgSend(v201, "leadingAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "leadingAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:constant:", v148, 20.0);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v203[8] = v147;
  objc_msgSend(v201, "trailingAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "leadingAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintLessThanOrEqualToAnchor:", v143);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v203[9] = v142;
  objc_msgSend(v74, "topAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "bottomAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "constraintEqualToAnchor:constant:", v139, 12.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v203[10] = v138;
  objc_msgSend(v74, "heightAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "constraintEqualToConstant:", 1.0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v203[11] = v136;
  objc_msgSend(v74, "leadingAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "leadingAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToAnchor:constant:", v133, 20.0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v203[12] = v132;
  v157 = v74;
  objc_msgSend(v74, "trailingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "trailingAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToAnchor:", v129);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v203[13] = v128;
  objc_msgSend(v76, "topAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "bottomAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:constant:", v126, 12.0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v203[14] = v125;
  v151 = v76;
  objc_msgSend(v76, "leadingAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "leadingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:constant:", v122, 20.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v203[15] = v121;
  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "topAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bottomAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:constant:", v118, 12.0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v203[16] = v117;
  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "bottomAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "bottomAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:", v114);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v203[17] = v113;
  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "leadingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v203[18] = v105;
  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "trailingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "trailingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "constraintEqualToAnchor:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v203[19] = v110;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v203, 20);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "activateConstraints:", v111);

}

- (void)_updateSubmitButton
{
  void *v3;
  _BOOL8 v4;
  id v5;

  -[PKTextInputDebugRadarViewController _includedEntryIndexes](self, "_includedEntryIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  -[PKTextInputDebugRadarViewController _submitButton](self, "_submitButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)_updateScrollView
{
  double v3;

  -[PKTextInputDebugRadarViewController _keyboardVerticalOverlap](self, "_keyboardVerticalOverlap");
  -[UICollectionView setContentInset:](self->__entriesCollectionView, "setContentInset:", 0.0, 0.0, v3, 0.0);
}

- (void)_toggleSysdiagnoseButton
{
  -[PKTextInputDebugRadarViewController set_includeSysdiagnose:](self, "set_includeSysdiagnose:", -[PKTextInputDebugRadarViewController _includeSysdiagnose](self, "_includeSysdiagnose") ^ 1);
  -[PKTextInputDebugRadarViewController _updateSysdiagnoseButton](self, "_updateSysdiagnoseButton");
}

- (void)_updateSysdiagnoseButton
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[PKTextInputDebugRadarViewController _sysdiagnoseButton](self, "_sysdiagnoseButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PKTextInputDebugRadarViewController _includeSysdiagnose](self, "_includeSysdiagnose"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  }
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  objc_msgSend(v8, "setSelected:", -[PKTextInputDebugRadarViewController _includeSysdiagnose](self, "_includeSysdiagnose"));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("logEntry"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _configureCell:atIndexPath:](self, "_configureCell:atIndexPath:", v7, v6);

  return v7;
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = objc_msgSend(a4, "item");
  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v10 = -[PKTextInputDebugRadarViewController _selectedContentLevel](self, "_selectedContentLevel");
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setEntryIndex:", v7);
  objc_msgSend(v6, "setLogEntry:contentLevel:", v14, v10);
  -[PKTextInputDebugRadarViewController _intendedTexts](self, "_intendedTexts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIntendedText:", v12);

  -[PKTextInputDebugRadarViewController _includedEntryIndexes](self, "_includedEntryIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludedEntry:", objc_msgSend(v13, "containsIndex:", v7));

}

- (void)entryCellIncludedEntryDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "includedEntry");
  -[PKTextInputDebugRadarViewController _includedEntryIndexes](self, "_includedEntryIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "entryIndex");

  if (v5)
    objc_msgSend(v6, "addIndex:", v7);
  else
    objc_msgSend(v6, "removeIndex:", v7);

  -[PKTextInputDebugRadarViewController _updateSubmitButton](self, "_updateSubmitButton");
}

- (void)entryCellIntendedTextDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "intendedText");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E777DEE8;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  -[PKTextInputDebugRadarViewController _intendedTexts](self, "_intendedTexts");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "entryIndex");

  objc_msgSend(v10, "setObject:atIndexedSubscript:", v8, v9);
}

- (int64_t)_selectedContentLevel
{
  void *v2;
  uint64_t v3;

  -[PKTextInputDebugRadarViewController _contextDetailControl](self, "_contextDetailControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedSegmentIndex");

  if (v3 == 2)
    return 2;
  else
    return v3 == 1;
}

- (void)_setKeyboardVerticalOverlap:(double)a3
{
  if (self->__keyboardVerticalOverlap != a3)
  {
    self->__keyboardVerticalOverlap = a3;
    -[PKTextInputDebugRadarViewController _updateScrollView](self, "_updateScrollView");
  }
}

- (void)_handleDetailControlChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cellForItemAtIndexPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKTextInputDebugRadarViewController _configureCell:atIndexPath:](self, "_configureCell:atIndexPath:", v12, v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_handleSubmitRadarButton:(id)a3
{
  void *v4;
  uint64_t v5;

  -[PKTextInputDebugRadarViewController _includedEntryIndexes](self, "_includedEntryIndexes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[PKTextInputDebugRadarViewController _launchTTRAndDismiss](self, "_launchTTRAndDismiss");
}

- (void)_handleKeyboardWillShow:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double height;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  objc_msgSend(a3, "userInfo");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4F50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CGRectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[PKTextInputDebugRadarViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugRadarViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertRect:fromView:", v17, v8, v10, v12, v14);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    -[PKTextInputDebugRadarViewController _entriesCollectionView](self, "_entriesCollectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v35.origin.x = v27;
    v35.origin.y = v28;
    v35.size.width = v29;
    v35.size.height = v30;
    v33.origin.x = v19;
    v33.origin.y = v21;
    v33.size.width = v23;
    v33.size.height = v25;
    v34 = CGRectIntersection(v33, v35);
    height = v34.size.height;

    if (height > 0.0)
      -[PKTextInputDebugRadarViewController _setKeyboardVerticalOverlap:](self, "_setKeyboardVerticalOverlap:", height);
  }

}

- (void)_handleKeyboardWillHide:(id)a3
{
  -[PKTextInputDebugRadarViewController _setKeyboardVerticalOverlap:](self, "_setKeyboardVerticalOverlap:", a3, 0.0);
}

- (id)_deviceString
{
  return (id)MGCopyAnswer();
}

- (id)_buildString
{
  return (id)_CFCopySystemVersionDictionaryValue();
}

- (id)_accumulatedLogEntryTextsForRadar
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v3 = -[PKTextInputDebugRadarViewController _selectedContentLevel](self, "_selectedContentLevel");
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PKTextInputDebugRadarViewController__accumulatedLogEntryTextsForRadar__block_invoke;
  v13[3] = &unk_1E777D908;
  v14 = v7;
  v15 = v3;
  v13[4] = self;
  v10 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __72__PKTextInputDebugRadarViewController__accumulatedLogEntryTextsForRadar__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_includedEntryIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsIndex:", a3);

  if (v6)
  {
    objc_msgSend(v16, "referenceSubstringWithTargetContentLevel:", *(_QWORD *)(a1 + 48));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_1E777DEE8;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    objc_msgSend(*(id *)(a1 + 32), "_intendedTexts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "resultCommittedText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("context: \"%@\"; result: \"%@\"; intended: \"%@\"), v10, v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
  }

}

- (id)_loggedMainLocaleDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;

  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "recognitionLocaleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("no locale");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  return v9;
}

- (id)_logEntryTextForRadarTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v33;
  __CFString *obj;
  __CFString *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEntries");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v8 = -[__CFString countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  v9 = &stru_1E777DEE8;
  if (!v8)
  {
    v12 = 0;
    v26 = 0;
    goto LABEL_26;
  }
  v10 = v8;
  obj = v7;
  v35 = 0;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v37;
  v33 = 1 - v5;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v37 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      -[PKTextInputDebugRadarViewController _includedEntryIndexes](self, "_includedEntryIndexes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsIndex:", v11 + i);

      if (v17)
      {
        -[PKTextInputDebugRadarViewController _intendedTexts](self, "_intendedTexts");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v11 + i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "resultCommittedText");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        v22 = &stru_1E777DEE8;
        if (v20)
          v22 = (__CFString *)v20;
        v23 = v22;

        if (objc_msgSend(v19, "isEqualToString:", v23))
        {
          if (v12)
          {
LABEL_14:

            continue;
          }
          if (v33 + v11 + i)
          {
            v12 = 0;
            goto LABEL_14;
          }
        }
        v24 = v15;

        v25 = v19;
        v35 = v25;
        v12 = v24;
        goto LABEL_14;
      }
    }
    v10 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    v11 += i;
  }
  while (v10);

  v9 = &stru_1E777DEE8;
  if (v12)
  {
    v26 = v35;
    if (v35)
      v27 = v35;
    else
      v27 = &stru_1E777DEE8;
    v7 = v27;
    objc_msgSend(v12, "resultCommittedText");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v30 = (__CFString *)v28;
    else
      v30 = &stru_1E777DEE8;
    v31 = v30;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected: \"%@\", Result: \"%@\"), v7, v31);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_26:
  }
  else
  {
    v26 = v35;
  }

  return v9;
}

- (id)_generateLaunchURLWithLogFilename:(id)a3
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
  void *v15;
  void *v16;
  _BOOL4 v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  -[PKTextInputDebugRadarViewController _deviceString](self, "_deviceString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _buildString](self, "_buildString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _accumulatedLogEntryTextsForRadar](self, "_accumulatedLogEntryTextsForRadar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _loggedMainLocaleDescription](self, "_loggedMainLocaleDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController _logEntryTextForRadarTitle](self, "_logEntryTextForRadarTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Intended Text:\n\n%@\n\n\nAdditional comments:\n\n"), v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@: [PencilSharpener] %@ (%@)"), v5, v6, v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = -[PKTextInputDebugRadarViewController _includeSysdiagnose](self, "_includeSysdiagnose");
  v18 = CFSTR("0");
  if (v17)
    v18 = CFSTR("sysdiagnose-only");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=%@&Description=%@&ComponentName=Scribble&ComponentVersion=iOS&ComponentID=1022969&Classification=Other%%20Bug&Reproducibility=Not%%20Applicable&AutoDiagnostics=%@&Attachments=%@"), v15, v22, v18, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_launchTTRAndDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v3 = (void *)MEMORY[0x1E0CB3788];
  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputDebugRadarViewController _includedEntryIndexes](self, "_includedEntryIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeIndexes:", v7);

  v8 = -[PKTextInputDebugRadarViewController _selectedContentLevel](self, "_selectedContentLevel");
  -[PKTextInputDebugRadarViewController sharpenerLog](self, "sharpenerLog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeLogToTemporaryDirectoryWithContentLevel:excludeEntyIndexes:error:", v8, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputDebugRadarViewController _generateLaunchURLWithLogFilename:](self, "_generateLaunchURLWithLogFilename:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRadarViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "windowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__PKTextInputDebugRadarViewController__launchTTRAndDismiss__block_invoke;
  v16[3] = &unk_1E777D930;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "openURL:options:completionHandler:", v11, 0, v16);

}

void __59__PKTextInputDebugRadarViewController__launchTTRAndDismiss__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_dismiss");
  v2 = dispatch_time(0, 300000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKTextInputDebugRadarViewController__launchTTRAndDismiss__block_invoke_2;
  block[3] = &unk_1E7778020;
  v4 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

void __59__PKTextInputDebugRadarViewController__launchTTRAndDismiss__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  objc_msgSend(v2, "removeItemAtURL:error:", v3, &v7);
  v4 = v7;

  if (v4)
  {
    v5 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "Couldn't cleanup PencilSharpener log at %@; error = %@",
        buf,
        0x16u);
    }

  }
}

- (void)_dismiss
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__PKTextInputDebugRadarViewController__dismiss__block_invoke;
  v2[3] = &unk_1E7778020;
  v2[4] = self;
  -[PKTextInputDebugRadarViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

void __47__PKTextInputDebugRadarViewController__dismiss__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugRadarViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

}

- (PKTextInputDebugSharpenerLog)sharpenerLog
{
  return self->_sharpenerLog;
}

- (PKTextInputDebugRadarViewControllerDelegate)delegate
{
  return (PKTextInputDebugRadarViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISegmentedControl)_contextDetailControl
{
  return self->__contextDetailControl;
}

- (void)set_contextDetailControl:(id)a3
{
  objc_storeStrong((id *)&self->__contextDetailControl, a3);
}

- (UIBarButtonItem)_submitButton
{
  return self->__submitButton;
}

- (void)set_submitButton:(id)a3
{
  objc_storeStrong((id *)&self->__submitButton, a3);
}

- (UICollectionView)_entriesCollectionView
{
  return self->__entriesCollectionView;
}

- (void)set_entriesCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->__entriesCollectionView, a3);
}

- (double)_keyboardVerticalOverlap
{
  return self->__keyboardVerticalOverlap;
}

- (UIButton)_sysdiagnoseButton
{
  return self->__sysdiagnoseButton;
}

- (void)set_sysdiagnoseButton:(id)a3
{
  objc_storeStrong((id *)&self->__sysdiagnoseButton, a3);
}

- (NSMutableArray)_intendedTexts
{
  return self->__intendedTexts;
}

- (void)set_intendedTexts:(id)a3
{
  objc_storeStrong((id *)&self->__intendedTexts, a3);
}

- (NSMutableIndexSet)_includedEntryIndexes
{
  return self->__includedEntryIndexes;
}

- (void)set_includedEntryIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__includedEntryIndexes, a3);
}

- (BOOL)_includeSysdiagnose
{
  return self->__includeSysdiagnose;
}

- (void)set_includeSysdiagnose:(BOOL)a3
{
  self->__includeSysdiagnose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__includedEntryIndexes, 0);
  objc_storeStrong((id *)&self->__intendedTexts, 0);
  objc_storeStrong((id *)&self->__sysdiagnoseButton, 0);
  objc_storeStrong((id *)&self->__entriesCollectionView, 0);
  objc_storeStrong((id *)&self->__submitButton, 0);
  objc_storeStrong((id *)&self->__contextDetailControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharpenerLog, 0);
}

@end
