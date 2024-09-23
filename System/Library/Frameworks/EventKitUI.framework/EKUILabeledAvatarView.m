@implementation EKUILabeledAvatarView

- (EKUILabeledAvatarView)init
{
  return -[EKUILabeledAvatarView initWithContact:placement:options:](self, "initWithContact:placement:options:", 0, 0, 0);
}

- (EKUILabeledAvatarView)initWithPlacement:(unint64_t)a3 options:(unint64_t)a4
{
  return -[EKUILabeledAvatarView initWithContact:placement:options:](self, "initWithContact:placement:options:", 0, a3, a4);
}

- (EKUILabeledAvatarView)initWithIdentity:(id)a3 placement:(unint64_t)a4 options:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  EKUILabeledAvatarView *v15;

  v7 = a3;
  objc_msgSend(v7, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v7, "emailAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "contactKeysToFetch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ContactsUtils contactForAddress:fullName:firstName:lastName:keysToFetch:](ContactsUtils, "contactForAddress:fullName:firstName:lastName:keysToFetch:", v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  v15 = -[EKUILabeledAvatarView initWithContact:placement:options:](self, "initWithContact:placement:options:", v14, a4, a5);

  return v15;
}

- (EKUILabeledAvatarView)initWithEmail:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6 placement:(unint64_t)a7 options:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  EKUILabeledAvatarView *v20;

  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend((id)objc_opt_class(), "contactKeysToFetch");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ContactsUtils contactForAddress:fullName:firstName:lastName:keysToFetch:](ContactsUtils, "contactForAddress:fullName:firstName:lastName:keysToFetch:", v17, v16, v15, v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[EKUILabeledAvatarView initWithContact:placement:options:](self, "initWithContact:placement:options:", v19, a7, a8);
  return v20;
}

- (EKUILabeledAvatarView)initWithContact:(id)a3 placement:(unint64_t)a4 options:(unint64_t)a5
{
  id v8;
  EKUILabeledAvatarView *v9;
  uint64_t v10;
  CNAvatarView *avatar;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKUILabeledAvatarView;
  v9 = -[EKUILabeledAvatarView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "_createAvatarView");
    v10 = objc_claimAutoreleasedReturnValue();
    avatar = v9->_avatar;
    v9->_avatar = (CNAvatarView *)v10;

    v9->_labelPlacement = a4;
    v9->_options = a5;
    if (v8)
      -[CNAvatarView setContact:](v9->_avatar, "setContact:", v8);
    -[EKUILabeledAvatarView setup](v9, "setup");
  }

  return v9;
}

+ (id)contactKeysToFetch
{
  if (contactKeysToFetch_onceToken != -1)
    dispatch_once(&contactKeysToFetch_onceToken, &__block_literal_global_28);
  return (id)contactKeysToFetch_keysToFetch;
}

void __43__EKUILabeledAvatarView_contactKeysToFetch__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)EKWeakLinkClass(), "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)EKWeakLinkClass(), "descriptorForRequiredKeys", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend((id)EKWeakLinkClass(), "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)contactKeysToFetch_keysToFetch;
  contactKeysToFetch_keysToFetch = v3;

}

+ (id)_createAvatarView
{
  void *v2;
  void *v3;

  EKWeakLinkClass();
  v2 = (void *)objc_opt_new();
  EKWeakLinkClass();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "setContact:", v3);

  objc_msgSend(v2, "setShowsContactOnTap:", 0);
  objc_msgSend(v2, "setThreeDTouchEnabled:", 0);
  return v2;
}

- (void)setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  id v33;
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
  const __CFString *v48;
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
  const __CFString *v71;
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
  double v84;
  void *v85;
  void *v86;
  uint64_t v87;
  EKUILabeledAvatarView *v88;
  uint64_t v89;
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
  _QWORD v130[2];
  _QWORD v131[2];
  const __CFString *v132;
  _QWORD v133[2];

  v133[1] = *MEMORY[0x1E0C80C00];
  self->_selectionState = 0;
  if ((self->_options & 4) != 0)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTap);
    -[EKUILabeledAvatarView addGestureRecognizer:](self, "addGestureRecognizer:", v3);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_didLongPress);
    -[EKUILabeledAvatarView addGestureRecognizer:](self, "addGestureRecognizer:", v4);

  }
  -[EKUILabeledAvatarView avatar](self, "avatar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[EKUILabeledAvatarView avatar](self, "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUILabeledAvatarView addSubview:](self, "addSubview:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[EKUILabeledAvatarView setPressedAccentOverlay:](self, "setPressedAccentOverlay:", v7);

  -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 22.0);

  -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMasksToBounds:", 1);

  CalendarAppTintColor();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorWithAlphaComponent:", 0.3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 1);

  -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUILabeledAvatarView addSubview:](self, "addSubview:", v17);

  v18 = objc_alloc(MEMORY[0x1E0C99E08]);
  v132 = CFSTR("avatar");
  -[EKUILabeledAvatarView avatar](self, "avatar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, &v132, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithDictionary:", v20);

  if (-[EKUILabeledAvatarView labelPlacement](self, "labelPlacement"))
  {
    v22 = (void *)objc_opt_new();
    -[EKUILabeledAvatarView setLabel:](self, "setLabel:", v22);

    -[EKUILabeledAvatarView label](self, "label");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[EKUILabeledAvatarView label](self, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUILabeledAvatarView addSubview:](self, "addSubview:", v24);

    -[EKUILabeledAvatarView label](self, "label");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1148846080;
    objc_msgSend(v25, "setContentHuggingPriority:forAxis:", 1, v26);

    -[EKUILabeledAvatarView label](self, "label");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1148846080;
    objc_msgSend(v27, "setContentHuggingPriority:forAxis:", 0, v28);

    -[EKUILabeledAvatarView label](self, "label");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 1148846080;
    objc_msgSend(v29, "setContentCompressionResistancePriority:forAxis:", 1, v30);

    -[EKUILabeledAvatarView label](self, "label");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = 1148846080;
    objc_msgSend(v31, "setContentCompressionResistancePriority:forAxis:", 0, v32);

    v33 = objc_alloc(MEMORY[0x1E0C99E08]);
    v130[0] = CFSTR("avatar");
    -[EKUILabeledAvatarView avatar](self, "avatar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v130[1] = CFSTR("label");
    v131[0] = v34;
    -[EKUILabeledAvatarView label](self, "label");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v131[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v131, v130, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v33, "initWithDictionary:", v36);

    switch(-[EKUILabeledAvatarView labelPlacement](self, "labelPlacement"))
    {
      case 1uLL:
        -[EKUILabeledAvatarView label](self, "label");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setTextAlignment:", 2);

        v39 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 7, 0, v41, 8, 1.0, 0.0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setActive:", 1);

        v43 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView label](self, "label");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, 8, 0, v45, 8, 1.0, 0.0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setActive:", 1);

        v47 = (void *)MEMORY[0x1E0CB3718];
        v48 = CFSTR("H:|-(>=0)-[label]-[avatar]|");
        goto LABEL_8;
      case 2uLL:
        -[EKUILabeledAvatarView label](self, "label");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setTextAlignment:", 0);

        v61 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v62, 7, 0, v63, 8, 1.0, 0.0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setActive:", 1);

        v65 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView label](self, "label");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v66, 8, 0, v67, 8, 1.0, 0.0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setActive:", 1);

        v47 = (void *)MEMORY[0x1E0CB3718];
        v48 = CFSTR("H:|[avatar]-[label]-(>=0)-|");
LABEL_8:
        objc_msgSend(v47, "constraintsWithVisualFormat:options:metrics:views:", v48, 1024, 0, v37);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "activateConstraints:", v69);

        v70 = (void *)MEMORY[0x1E0CB3718];
        v71 = CFSTR("V:|-(>=0)-[avatar]-(>=0)-|");
        goto LABEL_10;
      case 3uLL:
        -[EKUILabeledAvatarView label](self, "label");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setTextAlignment:", 4);

        v73 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v74, 7, 0, v75, 8, 1.0, 0.0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setActive:", 1);

        v77 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[avatar]-[label]|"), 1024, 0, v37);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "activateConstraints:", v78);

        v70 = (void *)MEMORY[0x1E0CB3718];
        v71 = CFSTR("V:|-[avatar]-|");
LABEL_10:
        objc_msgSend(v70, "constraintsWithVisualFormat:options:metrics:views:", v71, 0, 0, v37);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "activateConstraints:", v79);

        v80 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[label]-(>=0)-|"), 0, 0, v37);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "activateConstraints:", v81);

        v82 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 1.0;
        v85 = v82;
        v86 = v83;
        v87 = 10;
        v88 = self;
        v89 = 10;
        goto LABEL_12;
      case 4uLL:
        v90 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v91, 7, 0, v92, 8, 1.0, 0.0);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setActive:", 1);

        v94 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[label][avatar]|"), 512, 0, v37);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "activateConstraints:", v95);

        v96 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[avatar]-(>=0)-|"), 0, 0, v37);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "activateConstraints:", v97);

        v98 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[label]-(>=0)-|"), 0, 0, v37);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "activateConstraints:", v99);

        v100 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 1.0;
        v85 = v100;
        v86 = v83;
        v87 = 9;
        v88 = self;
        v89 = 9;
LABEL_12:
        objc_msgSend(v85, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v86, v87, 0, v88, v89, v84, 0.0);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "setActive:", 1);
        goto LABEL_14;
      case 5uLL:
        -[EKUILabeledAvatarView label](self, "label");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "setTextAlignment:", 1);

        v103 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v104, 7, 0, v105, 8, 1.0, 0.0);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "setActive:", 1);

        v107 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[avatar][label]|"), 512, &unk_1E606FB88, v37);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "activateConstraints:", v108);

        v109 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[avatar]-(>=0)-|"), 0, &unk_1E606FB88, v37);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "activateConstraints:", v110);

        v111 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[label]-(>=0)-|"), 0, &unk_1E606FB88, v37);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "activateConstraints:", v112);

        v113 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v114, 9, 0, self, 9, 1.0, 0.0);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setActive:", 1);

        v116 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v117, 5, 0, v118, 5, 1.0, 0.0);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "setActive:", 1);

        v120 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v121, 6, 0, v122, 6, 1.0, 0.0);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "setActive:", 1);

        v124 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v125, 3, 0, v126, 3, 1.0, 0.0);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "setActive:", 1);

        v128 = (void *)MEMORY[0x1E0CB3718];
        -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v83, 4, 0, v101, 4, 1.0, 0.0);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "setActive:", 1);

LABEL_14:
        break;
      default:
        break;
    }
    -[EKUILabeledAvatarView updateLabel](self, "updateLabel");
  }
  else
  {
    v49 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[avatar]|"), 0, 0, v21);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activateConstraints:", v50);

    v51 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[avatar]-(0@999)-|"), 0, 0, v21);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "activateConstraints:", v52);

    v53 = (void *)MEMORY[0x1E0CB3718];
    -[EKUILabeledAvatarView avatar](self, "avatar");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 8, 0, self, 8, 1.0, 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    v56 = (void *)MEMORY[0x1E0CB3718];
    -[EKUILabeledAvatarView avatar](self, "avatar");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUILabeledAvatarView avatar](self, "avatar");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 7, 0, v58, 8, 1.0, 0.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setActive:", 1);

    v37 = v21;
  }

}

- (CNContact)contact
{
  void *v2;
  void *v3;

  -[EKUILabeledAvatarView avatar](self, "avatar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v3;
}

- (void)setContact:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKUILabeledAvatarView avatar](self, "avatar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContact:", v4);

  -[EKUILabeledAvatarView updateLabel](self, "updateLabel");
}

- (void)updateLabel
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (-[EKUILabeledAvatarView labelPlacement](self, "labelPlacement"))
  {
    if ((-[EKUILabeledAvatarView options](self, "options") & 1) == 0)
    {
      v3 = -[EKUILabeledAvatarView options](self, "options");
      -[EKUILabeledAvatarView avatar](self, "avatar");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contact");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if ((v3 & 2) != 0)
      {
        objc_msgSend(v4, "nickname");
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = (void *)v6;
          -[EKUILabeledAvatarView avatar](self, "avatar");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "contact");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "nickname");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", &stru_1E601DFA8);

          if ((v11 & 1) == 0)
          {
            -[EKUILabeledAvatarView avatar](self, "avatar");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "contact");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "nickname");
            v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
            v14 = (void *)v12;
            -[EKUILabeledAvatarView label](self, "label");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setText:", v14);

            return;
          }
        }
        else
        {

        }
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "contact");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
      }
      objc_msgSend(v4, "givenName");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v13 = (void *)EKWeakLinkClass();
    -[EKUILabeledAvatarView avatar](self, "avatar");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromContact:style:", v5, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
}

- (void)updateWithAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  -[EKUILabeledAvatarView updateAvatarViewWithAddress:fullName:firstName:lastName:](self, "updateAvatarViewWithAddress:fullName:firstName:lastName:", a3, a4, a5, a6);
  -[EKUILabeledAvatarView updateLabel](self, "updateLabel");
}

- (void)updateWithParticipant:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(v13, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUILabeledAvatarView updateAvatarViewWithAddress:fullName:firstName:lastName:](self, "updateAvatarViewWithAddress:fullName:firstName:lastName:", v6, v7, v8, v9);

  if (!v5)
  {

  }
  -[EKUILabeledAvatarView updateLabel](self, "updateLabel");
  if ((self->_options & 8) != 0)
  {
    v10 = objc_msgSend(v13, "participantStatus");
    v11 = 0.3;
    if (v10 == 2)
      v11 = 1.0;
    -[EKUILabeledAvatarView setAlpha:](self, "setAlpha:", v11);
  }
  -[EKUILabeledAvatarView avatar](self, "avatar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

}

- (void)updateWithContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[EKUILabeledAvatarView avatar](self, "avatar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContacts:", v4);

  -[EKUILabeledAvatarView updateLabel](self, "updateLabel");
  -[EKUILabeledAvatarView avatar](self, "avatar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)updateAvatarViewWithAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  id v28;
  id v29;
  EKUILabeledAvatarView *v30;
  _QWORD *v31;
  BOOL v32;
  _QWORD v33[5];
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__10;
  v33[4] = __Block_byref_object_dispose__10;
  v34 = 0;
  v14 = -[EKUILabeledAvatarView loadContactsAsynchronously](self, "loadContactsAsynchronously");
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke;
  aBlock[3] = &unk_1E601A978;
  v31 = v33;
  v16 = v10;
  v26 = v16;
  v17 = v11;
  v27 = v17;
  v18 = v12;
  v28 = v18;
  v19 = v13;
  v29 = v19;
  v30 = self;
  v32 = v14;
  v20 = _Block_copy(aBlock);
  v21 = v20;
  if (v14)
  {
    dispatch_get_global_queue(0, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke_3;
    v23[3] = &unk_1E6018D30;
    v24 = v21;
    dispatch_async(v22, v23);

  }
  else
  {
    (*((void (**)(void *))v20 + 2))(v20);
  }

  _Block_object_dispose(v33, 8);
}

void __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  __int128 v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend((id)objc_opt_class(), "contactKeysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ContactsUtils contactForAddress:fullName:firstName:lastName:keysToFetch:](ContactsUtils, "contactForAddress:fullName:firstName:lastName:keysToFetch:", v2, v3, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_BYTE *)(a1 + 80))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke_2;
    block[3] = &unk_1E601A950;
    v14 = *(_OWORD *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v10 = *(void **)(a1 + 64);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(v10, "avatar");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContact:", v11);

  }
}

void __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "avatar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContact:", v1);

}

uint64_t __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSelectionState:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  if (self->_selectionState != a3)
  {
    self->_selectionState = a3;
    switch(a3)
    {
      case 2uLL:
        -[EKUILabeledAvatarView setAlpha:](self, "setAlpha:", 0.3);
        break;
      case 1uLL:
        -[EKUILabeledAvatarView setAlpha:](self, "setAlpha:", 1.0);
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAlpha:", 0.5);

        -[EKUILabeledAvatarView label](self, "label");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v5;
        v6 = 0.5;
        goto LABEL_9;
      case 0uLL:
        -[EKUILabeledAvatarView setAlpha:](self, "setAlpha:", 1.0);
        -[EKUILabeledAvatarView avatar](self, "avatar");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setAlpha:", 1.0);

        -[EKUILabeledAvatarView label](self, "label");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v5;
        v6 = 1.0;
LABEL_9:
        objc_msgSend(v5, "setAlpha:", v6);

        return;
    }
    -[EKUILabeledAvatarView setAlpha:](self, "setAlpha:", 1.0);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if ((-[EKUILabeledAvatarView options](self, "options") & 4) != 0)
  {
    -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EKUILabeledAvatarView;
    -[EKUILabeledAvatarView touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v6, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if ((-[EKUILabeledAvatarView options](self, "options") & 4) != 0)
  {
    -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EKUILabeledAvatarView;
    -[EKUILabeledAvatarView touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v6, v7);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if ((-[EKUILabeledAvatarView options](self, "options") & 4) != 0)
  {
    -[EKUILabeledAvatarView pressedAccentOverlay](self, "pressedAccentOverlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EKUILabeledAvatarView;
    -[EKUILabeledAvatarView touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v6, v7);
  }

}

- (void)didTap
{
  uint64_t v3;
  void *v4;
  char v5;
  id v6;

  if (-[EKUILabeledAvatarView selectionState](self, "selectionState"))
  {
    if (-[EKUILabeledAvatarView selectionState](self, "selectionState") != 1)
      goto LABEL_6;
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  -[EKUILabeledAvatarView setSelectionState:](self, "setSelectionState:", v3);
LABEL_6:
  -[EKUILabeledAvatarView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKUILabeledAvatarView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarViewTapped:", self);

  }
}

- (void)didLongPress
{
  void *v3;
  char v4;
  id v5;

  -[EKUILabeledAvatarView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKUILabeledAvatarView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avatarViewLongPressed:", self);

  }
}

+ (id)sortedAvatarListFromParticipants:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  EKUILabeledAvatarView *v11;
  EKUILabeledAvatarView *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [EKUILabeledAvatarView alloc];
        v12 = -[EKUILabeledAvatarView initWithIdentity:placement:options:](v11, "initWithIdentity:placement:options:", v10, 5, 0, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_64);
  return v4;
}

uint64_t __58__EKUILabeledAvatarView_sortedAvatarListFromParticipants___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (EKUILabeledAvatarViewDelegate)delegate
{
  return (EKUILabeledAvatarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)selectionState
{
  return self->_selectionState;
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (BOOL)loadContactsAsynchronously
{
  return self->_loadContactsAsynchronously;
}

- (void)setLoadContactsAsynchronously:(BOOL)a3
{
  self->_loadContactsAsynchronously = a3;
}

- (CNAvatarView)avatar
{
  return (CNAvatarView *)objc_getProperty(self, a2, 456, 1);
}

- (void)setAvatar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (UIView)pressedAccentOverlay
{
  return (UIView *)objc_getProperty(self, a2, 464, 1);
}

- (void)setPressedAccentOverlay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (unint64_t)labelPlacement
{
  return self->_labelPlacement;
}

- (void)setLabelPlacement:(unint64_t)a3
{
  self->_labelPlacement = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressedAccentOverlay, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
