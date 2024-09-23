@implementation EKUIInviteesViewTimeSlotCell

- (EKUIInviteesViewTimeSlotCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIInviteesViewTimeSlotCell *v4;
  EKUIInviteesViewTimeSlotCell *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)EKUIInviteesViewTimeSlotCell;
  v4 = -[EKUIInviteesViewTimeSlotCell initWithStyle:reuseIdentifier:](&v30, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[EKUIInviteesViewTimeSlotCell setAndMoreBoundingRect:](v4, "setAndMoreBoundingRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    objc_msgSend((id)objc_opt_class(), "_leftBuffer");
    -[EKUIInviteesViewTimeSlotCell setSeparatorInset:](v5, "setSeparatorInset:", 0.0, v6, 0.0, 0.0);
    -[EKUIInviteesViewTimeSlotCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell traitCollection](v5, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    TableViewCheckmarkImage(v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v9;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    objc_msgSend((id)objc_opt_class(), "_setRequiredHuggingAndCompression:", v10);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setContentMode:", 4);
    objc_msgSend(v10, "setHidden:", 1);
    objc_msgSend(v7, "addSubview:", v10);
    -[EKUIInviteesViewTimeSlotCell setCheckmarkImageView:](v5, "setCheckmarkImageView:", v10);
    v11 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "addSubview:", v11);
    v28 = v11;
    -[EKUIInviteesViewTimeSlotCell setTopTimeLabel:](v5, "setTopTimeLabel:", v11);
    v12 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "addSubview:", v12);
    v27 = v12;
    -[EKUIInviteesViewTimeSlotCell setBottomTimeLabel:](v5, "setBottomTimeLabel:", v12);
    v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "addSubview:", v13);
    -[EKUIInviteesViewTimeSlotCell setTimeZoneTimeLabel:](v5, "setTimeZoneTimeLabel:", v13);
    v14 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setNumberOfLines:", 4);
    objc_msgSend(v7, "addSubview:", v14);
    -[EKUIInviteesViewTimeSlotCell setProposedByLabel:](v5, "setProposedByLabel:", v14);
    v15 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = v15;
    -[EKUIInviteesViewTimeSlotCell setLabelForTextSizeTesting:](v5, "setLabelForTextSizeTesting:", v15);
    objc_msgSend((id)objc_opt_class(), "_generateParticipantTextView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v16);
    -[EKUIInviteesViewTimeSlotCell setParticipantsTextView:](v5, "setParticipantsTextView:", v16);
    objc_msgSend((id)objc_opt_class(), "_generateParticipantTextView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setTextViewForTextSizeTesting:](v5, "setTextViewForTextSizeTesting:");
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_setRequiredHuggingAndCompression:", v17);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "addTarget:action:forControlEvents:", v5, sel__showPreviewButtonTapped_, 64);
    -[EKUIInviteesViewTimeSlotCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v17);

    -[EKUIInviteesViewTimeSlotCell setShowPreviewButton:](v5, "setShowPreviewButton:", v17);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v5, sel__andMoreTapped_);
    objc_msgSend(v19, "setDelegate:", v5);
    -[EKUIInviteesViewTimeSlotCell contentView](v5, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addGestureRecognizer:", v19);

    -[EKUIInviteesViewTimeSlotCell setTappedMoreRecognizer:](v5, "setTappedMoreRecognizer:", v19);
    +[EKUIDebugPreferences shared](EKUIDebugPreferences, "shared");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "showInviteesAndMoreRegion");

    if (v22)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v16, "addSubview:", v23);
      -[EKUIInviteesViewTimeSlotCell setAndMoreDebugOverlay:](v5, "setAndMoreDebugOverlay:", v23);

    }
    -[EKUIInviteesViewTimeSlotCell _resetFonts](v5, "_resetFonts");
    -[EKUIInviteesViewTimeSlotCell _resetPreferredMaxLayoutWidths](v5, "_resetPreferredMaxLayoutWidths");
    -[EKUIInviteesViewTimeSlotCell setUpdateFontBasedConstraints:](v5, "setUpdateFontBasedConstraints:", 1);
    -[EKUIInviteesViewTimeSlotCell setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EKUIInviteesViewTimeSlotCell tappedMoreRecognizer](self, "tappedMoreRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)EKUIInviteesViewTimeSlotCell;
  -[EKUIInviteesViewTimeSlotCell dealloc](&v4, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[EKUIInviteesViewTimeSlotCell frame](self, "frame");
  v9 = v8;
  v10.receiver = self;
  v10.super_class = (Class)EKUIInviteesViewTimeSlotCell;
  -[EKUIInviteesViewTimeSlotCell setFrame:](&v10, sel_setFrame_, x, y, width, height);
  if (vabdd_f64(v9, width) >= 2.22044605e-16)
    -[EKUIInviteesViewTimeSlotCell _resetPreferredMaxLayoutWidths](self, "_resetPreferredMaxLayoutWidths");
}

- (void)updateConstraints
{
  void *v3;
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
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
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
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  double v136;
  double v137;
  void *v138;
  double v139;
  double v140;
  void *v141;
  double v142;
  double v143;
  void *v144;
  double v145;
  double v146;
  void *v147;
  double v148;
  double v149;
  void *v150;
  void *v151;
  double v152;
  void *v153;
  uint64_t v154;
  double v155;
  double v156;
  void *v157;
  double v158;
  double v159;
  void *v160;
  void *v161;
  double v162;
  void *v163;
  objc_super v164;

  -[EKUIInviteesViewTimeSlotCell persistentConstraints](self, "persistentConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell checkmarkImageView](self, "checkmarkImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 9, 0, v7, 17, 1.0, 20.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell checkmarkImageView](self, "checkmarkImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 10, 0, v11, 10, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    v13 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell checkmarkImageView](self, "checkmarkImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 5, 0, v15, 9, 1.0, 30.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    v17 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_rightBuffer");
    objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 6, 0, v19, 6, 1.0, -v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v21);

    v22 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell bottomTimeLabel](self, "bottomTimeLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 5, 0, v24, 5, 1.0, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v25);

    v26 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell bottomTimeLabel](self, "bottomTimeLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_rightBuffer");
    objc_msgSend(v26, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 6, 0, v28, 6, 1.0, -v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v30);

    v31 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabel](self, "timeZoneTimeLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 5, 0, v33, 5, 1.0, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

    v35 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabel](self, "timeZoneTimeLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_rightBuffer");
    objc_msgSend(v35, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, 6, 0, v37, 6, 1.0, -v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v39);

    v40 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 5, 0, v42, 5, 1.0, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v43);

    v44 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_rightBuffer");
    objc_msgSend(v44, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 6, 0, v46, 6, 1.0, -v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v48);

    v49 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell participantsTextView](self, "participantsTextView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 5, 0, v51, 5, 1.0, 0.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v52);

    v53 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell participantsTextView](self, "participantsTextView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_rightBuffer");
    objc_msgSend(v53, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 6, 0, v55, 6, 1.0, -v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v57);

    v58 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell participantsTextView](self, "participantsTextView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v59, 4, -1, v60, 4, 1.0, 0.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v61);

    v62 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell showPreviewButton](self, "showPreviewButton");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v63, 6, 0, v64, 6, 1.0, -16.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v65);

    v66 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell showPreviewButton](self, "showPreviewButton");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v67, 10, 0, v68, 10, 1.0, 0.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v69);

    v70 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v71, 12, 0, v72, 3, 1.0, 0.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setTopTimeLabelToTopContentViewConstraint:](self, "setTopTimeLabelToTopContentViewConstraint:", v73);

    -[EKUIInviteesViewTimeSlotCell topTimeLabelToTopContentViewConstraint](self, "topTimeLabelToTopContentViewConstraint");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v74);

    v75 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell bottomTimeLabel](self, "bottomTimeLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v76, 12, 0, v77, 11, 1.0, 0.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setBottomTimeLabelToTopTimeLabelConstraint:](self, "setBottomTimeLabelToTopTimeLabelConstraint:", v78);

    -[EKUIInviteesViewTimeSlotCell bottomTimeLabelToTopTimeLabelConstraint](self, "bottomTimeLabelToTopTimeLabelConstraint");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v79);

    v80 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabel](self, "timeZoneTimeLabel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell bottomTimeLabel](self, "bottomTimeLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v81, 12, 0, v82, 11, 1.0, 0.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setTimeZoneTimeLabelToBottomTimeLabelConstraint:](self, "setTimeZoneTimeLabelToBottomTimeLabelConstraint:", v83);

    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabelToBottomTimeLabelConstraint](self, "timeZoneTimeLabelToBottomTimeLabelConstraint");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v84);

    v85 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabel](self, "timeZoneTimeLabel");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v86, 12, 0, v87, 11, 1.0, 0.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setProposedTimeLabelToBottomTimeLabelConstraint:](self, "setProposedTimeLabelToBottomTimeLabelConstraint:", v88);

    -[EKUIInviteesViewTimeSlotCell proposedTimeLabelToBottomTimeLabelConstraint](self, "proposedTimeLabelToBottomTimeLabelConstraint");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v89);

    v90 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell participantsTextView](self, "participantsTextView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v91, 12, 0, v92, 11, 1.0, 0.0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setParticipantsViewToBottomTimeLabelConstraint:](self, "setParticipantsViewToBottomTimeLabelConstraint:", v93);

    -[EKUIInviteesViewTimeSlotCell participantsViewToBottomTimeLabelConstraint](self, "participantsViewToBottomTimeLabelConstraint");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v94);

    v95 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell participantsTextView](self, "participantsTextView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v96, 4, 1, v97, 11, 1.0, 0.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setParticipantsViewToContentViewConstraint:](self, "setParticipantsViewToContentViewConstraint:", v98);

    -[EKUIInviteesViewTimeSlotCell participantsViewToContentViewConstraint](self, "participantsViewToContentViewConstraint");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v99);

    v100 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v101, 8, 1, 0, 0, 1.0, 0.0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setTopTimeLabelHeightConstraint:](self, "setTopTimeLabelHeightConstraint:", v102);

    -[EKUIInviteesViewTimeSlotCell topTimeLabelHeightConstraint](self, "topTimeLabelHeightConstraint");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v103);

    v104 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell bottomTimeLabel](self, "bottomTimeLabel");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v105, 8, 1, 0, 0, 1.0, 0.0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setBottomTimeLabelHeightConstraint:](self, "setBottomTimeLabelHeightConstraint:", v106);

    -[EKUIInviteesViewTimeSlotCell bottomTimeLabelHeightConstraint](self, "bottomTimeLabelHeightConstraint");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v107);

    v108 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabel](self, "timeZoneTimeLabel");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v109, 8, 1, 0, 0, 1.0, 0.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setTimeZoneTimeLabelHeightConstraint:](self, "setTimeZoneTimeLabelHeightConstraint:", v110);

    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabelHeightConstraint](self, "timeZoneTimeLabelHeightConstraint");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v111);

    v112 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v113, 8, 1, 0, 0, 1.0, 0.0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setProposedByMinHeightConstraint:](self, "setProposedByMinHeightConstraint:", v114);

    v115 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v116, 8, -1, 0, 0, 1.0, 0.0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setProposedByMaxHeightConstraint:](self, "setProposedByMaxHeightConstraint:", v117);

    -[EKUIInviteesViewTimeSlotCell proposedByMinHeightConstraint](self, "proposedByMinHeightConstraint");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v118);

    -[EKUIInviteesViewTimeSlotCell proposedByMaxHeightConstraint](self, "proposedByMaxHeightConstraint");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v119);

    -[EKUIInviteesViewTimeSlotCell contentView](self, "contentView");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "addConstraints:", v4);

    -[EKUIInviteesViewTimeSlotCell setPersistentConstraints:](self, "setPersistentConstraints:", v4);
  }
  objc_msgSend((id)objc_opt_class(), "_proposedByFont");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_timeLabelFont");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_participantsTextViewFont");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKUIInviteesViewTimeSlotCell updateFontBasedConstraints](self, "updateFontBasedConstraints"))
  {
    -[EKUIInviteesViewTimeSlotCell setUpdateFontBasedConstraints:](self, "setUpdateFontBasedConstraints:", 0);
    objc_msgSend(v122, "_scaledValueForValue:", 24.0);
    v125 = v124;
    -[EKUIInviteesViewTimeSlotCell topTimeLabelToTopContentViewConstraint](self, "topTimeLabelToTopContentViewConstraint");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setConstant:", v125);

    objc_msgSend(v122, "_scaledValueForValue:", 22.0);
    v128 = v127;
    -[EKUIInviteesViewTimeSlotCell bottomTimeLabelToTopTimeLabelConstraint](self, "bottomTimeLabelToTopTimeLabelConstraint");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setConstant:", v128);

    objc_msgSend(v122, "_scaledValueForValue:", 22.0);
    v131 = v130;
    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabelToBottomTimeLabelConstraint](self, "timeZoneTimeLabelToBottomTimeLabelConstraint");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setConstant:", v131);

    objc_msgSend(v121, "_scaledValueForValue:", 20.0);
    v134 = v133;
    -[EKUIInviteesViewTimeSlotCell proposedTimeLabelToBottomTimeLabelConstraint](self, "proposedTimeLabelToBottomTimeLabelConstraint");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "setConstant:", v134);

    objc_msgSend(v123, "_scaledValueForValue:", 20.0);
    v137 = v136;
    -[EKUIInviteesViewTimeSlotCell participantsViewToBottomTimeLabelConstraint](self, "participantsViewToBottomTimeLabelConstraint");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setConstant:", v137);

    objc_msgSend(v122, "_scaledValueForValue:", 12.0);
    v140 = v139;
    -[EKUIInviteesViewTimeSlotCell participantsViewToContentViewConstraint](self, "participantsViewToContentViewConstraint");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setConstant:", v140);

    objc_msgSend(v122, "lineHeight");
    v143 = v142;
    -[EKUIInviteesViewTimeSlotCell topTimeLabelHeightConstraint](self, "topTimeLabelHeightConstraint");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "setConstant:", v143);

    objc_msgSend(v122, "lineHeight");
    v146 = v145;
    -[EKUIInviteesViewTimeSlotCell bottomTimeLabelHeightConstraint](self, "bottomTimeLabelHeightConstraint");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setConstant:", v146);

  }
  if (-[EKUIInviteesViewTimeSlotCell _shouldDisplayTimeZone](self, "_shouldDisplayTimeZone"))
  {
    objc_msgSend(v122, "lineHeight");
    v149 = v148;
    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabelHeightConstraint](self, "timeZoneTimeLabelHeightConstraint");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = v150;
    v152 = v149;
  }
  else
  {
    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabelHeightConstraint](self, "timeZoneTimeLabelHeightConstraint");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = v150;
    v152 = 0.0;
  }
  objc_msgSend(v150, "setConstant:", v152);

  -[EKUIInviteesViewTimeSlotCell proposedBy](self, "proposedBy");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = objc_msgSend(v153, "count");

  if (v154)
  {
    objc_msgSend(v121, "lineHeight");
    v156 = v155;
    -[EKUIInviteesViewTimeSlotCell proposedByMinHeightConstraint](self, "proposedByMinHeightConstraint");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "setConstant:", v156);

    objc_msgSend(v121, "lineHeight");
    v159 = v158 * 4.0;
    -[EKUIInviteesViewTimeSlotCell proposedByMaxHeightConstraint](self, "proposedByMaxHeightConstraint");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v160;
    v162 = v159;
  }
  else
  {
    -[EKUIInviteesViewTimeSlotCell proposedByMinHeightConstraint](self, "proposedByMinHeightConstraint");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "setConstant:", 0.0);

    -[EKUIInviteesViewTimeSlotCell proposedByMaxHeightConstraint](self, "proposedByMaxHeightConstraint");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v160;
    v162 = 0.0;
  }
  objc_msgSend(v160, "setConstant:", v162);

  v164.receiver = self;
  v164.super_class = (Class)EKUIInviteesViewTimeSlotCell;
  -[EKUIInviteesViewTimeSlotCell updateConstraints](&v164, sel_updateConstraints);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGPoint v17;
  CGRect v18;
  CGRect v19;

  v5 = a4;
  -[EKUIInviteesViewTimeSlotCell andMoreBoundingRect](self, "andMoreBoundingRect");
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  if (CGRectIsNull(v18))
  {
    v10 = 0;
  }
  else
  {
    -[EKUIInviteesViewTimeSlotCell participantsTextView](self, "participantsTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v11);
    v13 = v12;
    v15 = v14;

    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v17.x = v13;
    v17.y = v15;
    v10 = CGRectContainsPoint(v19, v17);
  }

  return v10;
}

- (void)updateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 busyParticipants:(id)a6 showAllParticipants:(BOOL)a7 checked:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;

  v8 = a8;
  v9 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  -[EKUIInviteesViewTimeSlotCell setStartDate:](self, "setStartDate:", a3);
  -[EKUIInviteesViewTimeSlotCell setEndDate:](self, "setEndDate:", v16);

  -[EKUIInviteesViewTimeSlotCell setTimeZone:](self, "setTimeZone:", v15);
  -[EKUIInviteesViewTimeSlotCell setBusyParticipants:](self, "setBusyParticipants:", v14);

  -[EKUIInviteesViewTimeSlotCell setShowAllParticipants:](self, "setShowAllParticipants:", v9);
  -[EKUIInviteesViewTimeSlotCell setChecked:](self, "setChecked:", v8);
  -[EKUIInviteesViewTimeSlotCell _resetTimeTextIfNeeded](self, "_resetTimeTextIfNeeded");
  -[EKUIInviteesViewTimeSlotCell _resetParticipantsTextIfNeeded](self, "_resetParticipantsTextIfNeeded");
}

- (UIColor)participantsTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIColor)timeTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (void)setProposedBy:(id)a3
{
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
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_storeStrong((id *)&self->_proposedBy, a3);
  if (objc_msgSend(v25, "count") == 1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Proposed by %@"), &stru_1E601DFA8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(v25, "count") == 2)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Proposed by %@ and %@"), &stru_1E601DFA8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v7, v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend(v25, "count") < 3)
    goto LABEL_7;
  EventKitUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Proposed by "), &stru_1E601DFA8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v25, "count") == 1)
  {
    v17 = v16;
  }
  else
  {
    v18 = 0;
    do
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("%@, "), &stru_1E601DFA8, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      ++v18;
      v16 = v17;
    }
    while (v18 < objc_msgSend(v25, "count") - 1);
  }
  objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v25, "count") - 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingString:", v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);
LABEL_6:

LABEL_7:
  -[EKUIInviteesViewTimeSlotCell updateConstraints](self, "updateConstraints");

}

- (void)setStartDate:(id)a3
{
  NSDate *v5;
  NSDate *startDate;
  BOOL v7;
  NSDate *v8;

  v5 = (NSDate *)a3;
  startDate = self->_startDate;
  if (startDate != v5)
  {
    v8 = v5;
    if (!startDate || (v7 = -[NSDate isEqualToDate:](startDate, "isEqualToDate:", v5), v5 = v8, !v7))
    {
      objc_storeStrong((id *)&self->_startDate, a3);
      -[EKUIInviteesViewTimeSlotCell setUpdateTimeText:](self, "setUpdateTimeText:", 1);
      v5 = v8;
    }
  }

}

- (void)setEndDate:(id)a3
{
  NSDate *v5;
  NSDate *endDate;
  BOOL v7;
  NSDate *v8;

  v5 = (NSDate *)a3;
  endDate = self->_endDate;
  if (endDate != v5)
  {
    v8 = v5;
    if (!endDate || (v7 = -[NSDate isEqualToDate:](endDate, "isEqualToDate:", v5), v5 = v8, !v7))
    {
      objc_storeStrong((id *)&self->_endDate, a3);
      -[EKUIInviteesViewTimeSlotCell setUpdateTimeText:](self, "setUpdateTimeText:", 1);
      v5 = v8;
    }
  }

}

- (void)setBusyParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_busyParticipants, a3);
  -[EKUIInviteesViewTimeSlotCell setUpdateParticipantsText:](self, "setUpdateParticipantsText:", 1);
}

- (void)setShowAllParticipants:(BOOL)a3
{
  if (self->_showAllParticipants != a3)
  {
    self->_showAllParticipants = a3;
    -[EKUIInviteesViewTimeSlotCell setUpdateParticipantsText:](self, "setUpdateParticipantsText:", 1);
  }
}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_checked != a3)
  {
    self->_checked = a3;
    v3 = !a3;
    -[EKUIInviteesViewTimeSlotCell checkmarkImageView](self, "checkmarkImageView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)setAndMoreBoundingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_andMoreBoundingRect;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_andMoreBoundingRect = &self->_andMoreBoundingRect;
  if (!CGRectEqualToRect(self->_andMoreBoundingRect, a3))
  {
    p_andMoreBoundingRect->origin.x = x;
    p_andMoreBoundingRect->origin.y = y;
    p_andMoreBoundingRect->size.width = width;
    p_andMoreBoundingRect->size.height = height;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    if (CGRectIsNull(v19))
    {
      v9 = *MEMORY[0x1E0C9D648];
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      -[EKUIInviteesViewTimeSlotCell andMoreDebugOverlay](self, "andMoreDebugOverlay");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v13;
      v14 = v9;
      v15 = v10;
      v16 = v11;
      v17 = v12;
    }
    else
    {
      -[EKUIInviteesViewTimeSlotCell andMoreDebugOverlay](self, "andMoreDebugOverlay");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v13;
      v14 = x;
      v15 = y;
      v16 = width;
      v17 = height;
    }
    objc_msgSend(v13, "setFrame:", v14, v15, v16, v17);

  }
}

- (void)_showPreviewButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *, void *);

  -[EKUIInviteesViewTimeSlotCell showPreviewOfEventAtTime](self, "showPreviewOfEventAtTime", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EKUIInviteesViewTimeSlotCell showPreviewOfEventAtTime](self, "showPreviewOfEventAtTime");
    v7 = (void (**)(id, void *, void *))objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell endDate](self, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v5, v6);

  }
}

- (void)_andMoreTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  -[EKUIInviteesViewTimeSlotCell setShowAllParticipants:](self, "setShowAllParticipants:", 1);
  -[EKUIInviteesViewTimeSlotCell _tableView](self, "_tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  -[EKUIInviteesViewTimeSlotCell _resetParticipantsTextIfNeeded](self, "_resetParticipantsTextIfNeeded");
  -[EKUIInviteesViewTimeSlotCell _tableView](self, "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endUpdates");

  -[EKUIInviteesViewTimeSlotCell showAllConflictedParticipantsTapped](self, "showAllConflictedParticipantsTapped");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EKUIInviteesViewTimeSlotCell showAllConflictedParticipantsTapped](self, "showAllConflictedParticipantsTapped");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
}

+ (id)_timeLabelFont
{
  return +[EKUIConstrainedFontUtilities constrainedBodyBoldTextLabelFont](EKUIConstrainedFontUtilities, "constrainedBodyBoldTextLabelFont");
}

+ (id)_proposedByFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (id)_participantsTextViewFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (double)_leftBuffer
{
  return 66.0;
}

+ (double)_rightBuffer
{
  return 47.0;
}

- (double)_preferredMaxLayoutWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  objc_msgSend((id)objc_opt_class(), "_leftBuffer");
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "_rightBuffer");
  v6 = v4 + v5;
  -[EKUIInviteesViewTimeSlotCell frame](self, "frame");
  CalRoundToScreenScale(v7 - v6);
  return result;
}

- (void)_resetFonts
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
  id v12;

  objc_msgSend((id)objc_opt_class(), "_timeLabelFont");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v12);

  -[EKUIInviteesViewTimeSlotCell bottomTimeLabel](self, "bottomTimeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v12);

  -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabel](self, "timeZoneTimeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v12);

  objc_msgSend((id)objc_opt_class(), "_proposedByFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[EKUIInviteesViewTimeSlotCell labelForTextSizeTesting](self, "labelForTextSizeTesting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v12);

  objc_msgSend((id)objc_opt_class(), "_participantsTextViewFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewTimeSlotCell participantsTextView](self, "participantsTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[EKUIInviteesViewTimeSlotCell textViewForTextSizeTesting](self, "textViewForTextSizeTesting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v9);

  -[EKUIInviteesViewTimeSlotCell setUpdateTimeText:](self, "setUpdateTimeText:", 1);
  -[EKUIInviteesViewTimeSlotCell _resetTimeTextIfNeeded](self, "_resetTimeTextIfNeeded");
  -[EKUIInviteesViewTimeSlotCell setUpdateParticipantsText:](self, "setUpdateParticipantsText:", 1);
  -[EKUIInviteesViewTimeSlotCell _resetParticipantsTextIfNeeded](self, "_resetParticipantsTextIfNeeded");
  -[EKUIInviteesViewTimeSlotCell setUpdateFontBasedConstraints:](self, "setUpdateFontBasedConstraints:", 1);
  -[EKUIInviteesViewTimeSlotCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)_resetPreferredMaxLayoutWidths
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[EKUIInviteesViewTimeSlotCell _preferredMaxLayoutWidth](self, "_preferredMaxLayoutWidth");
  v4 = v3;
  -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredMaxLayoutWidth:", v4);

  -[EKUIInviteesViewTimeSlotCell bottomTimeLabel](self, "bottomTimeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredMaxLayoutWidth:", v4);

  -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabel](self, "timeZoneTimeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredMaxLayoutWidth:", v4);

  -[EKUIInviteesViewTimeSlotCell proposedByLabel](self, "proposedByLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredMaxLayoutWidth:", v4);

  -[EKUIInviteesViewTimeSlotCell participantsTextView](self, "participantsTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setPreferredMaxLayoutWidth:", v4);

  -[EKUIInviteesViewTimeSlotCell setUpdateTimeText:](self, "setUpdateTimeText:", 1);
  -[EKUIInviteesViewTimeSlotCell _resetTimeTextIfNeeded](self, "_resetTimeTextIfNeeded");
  -[EKUIInviteesViewTimeSlotCell setUpdateParticipantsText:](self, "setUpdateParticipantsText:", 1);
  -[EKUIInviteesViewTimeSlotCell _resetParticipantsTextIfNeeded](self, "_resetParticipantsTextIfNeeded");
  -[EKUIInviteesViewTimeSlotCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (BOOL)_shouldDisplayTimeZone
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[EKUIInviteesViewTimeSlotCell timeZone](self, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[EKUIInviteesViewTimeSlotCell timeZone](self, "timeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEquivalentTo:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_resetTimeTextIfNeeded
{
  void (**v3)(void *, void *, void *, id *, id *);
  void *v4;
  void *v5;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[5];

  if (-[EKUIInviteesViewTimeSlotCell updateTimeText](self, "updateTimeText"))
  {
    -[EKUIInviteesViewTimeSlotCell setUpdateTimeText:](self, "setUpdateTimeText:", 0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__EKUIInviteesViewTimeSlotCell__resetTimeTextIfNeeded__block_invoke;
    aBlock[3] = &unk_1E601B3E8;
    aBlock[4] = self;
    v3 = (void (**)(void *, void *, void *, id *, id *))_Block_copy(aBlock);
    -[EKUIInviteesViewTimeSlotCell startDate](self, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell endDate](self, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = 0;
    v3[2](v3, v4, v5, &v31, &v30);
    v6 = v31;
    v7 = v30;

    v8 = 0;
    if (-[EKUIInviteesViewTimeSlotCell _shouldDisplayTimeZone](self, "_shouldDisplayTimeZone"))
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIInviteesViewTimeSlotCell timeZone](self, "timeZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTimeZone:", v10);

      -[EKUIInviteesViewTimeSlotCell startDate](self, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "components:fromDate:", 252, v11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKUIInviteesViewTimeSlotCell endDate](self, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "components:fromDate:", 252, v12);
      v28 = v6;
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      CUIKCalendar();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateFromComponents:", v26);
      v27 = v7;
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      CUIKCalendar();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateFromComponents:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = 0;
      v3[2](v3, v15, v17, 0, &v29);
      v18 = v29;
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[EKUIInviteesViewTimeSlotCell timeZone](self, "timeZone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKShortTZString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (%@)"), v18, v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v27;
      v6 = v28;

    }
    -[EKUIInviteesViewTimeSlotCell topTimeLabel](self, "topTimeLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell bottomTimeLabel](self, "bottomTimeLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell timeZoneTimeLabel](self, "timeZoneTimeLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v6);
    objc_msgSend(v23, "setText:", v7);
    objc_msgSend(v24, "setText:", v8);
    -[EKUIInviteesViewTimeSlotCell timeTextColor](self, "timeTextColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v25);
    objc_msgSend(v23, "setTextColor:", v25);
    objc_msgSend(v24, "setTextColor:", v25);

  }
}

void __54__EKUIInviteesViewTimeSlotCell__resetTimeTextIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a2;
  v9 = a3;
  if (v29)
  {
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "frame");
      if (fabs(v10) >= 2.22044605e-16)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CUIKCalendar();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isDate:equalToDate:toUnitGranularity:", v29, v11, 4);

        CUIKCalendar();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isDate:inSameDayAsDate:", v29, v9);

        if (!v15)
        {
          EventKitUIBundle();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("%@ -"), &stru_1E601DFA8, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (a4)
            v22 = v13;
          else
            v22 = 1;
          if (v22 == 1)
          {
            CUIKLongStringForDateAndTime();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            CUIKLongStringForDateAndTime();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (a4)
            {
              *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v21, v23);
              CUIKLongStringForDateAndTime();
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else if (a5)
            {
              EventKitUIBundle();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("%@ - %@"), &stru_1E601DFA8, 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v28, v23, v24);
            }

          }
          else
          {
            CUIKStringMonthDayYearTime();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v21, v23);
            if (a5)
            {
              CUIKStringMonthDayYearTime();
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
          }

          goto LABEL_29;
        }
        if (a4)
        {
          if (v13)
          {
            CUIKStringForWeekdayNoYear();
            v16 = (id)objc_claimAutoreleasedReturnValue();
            *a4 = v16;
            if ((objc_msgSend(*(id *)(a1 + 32), "_textWillFit:", v16) & 1) == 0)
            {
              CUIKLongDayStringForDateNoYear();
              v17 = (id)objc_claimAutoreleasedReturnValue();
              *a4 = v17;
              if ((objc_msgSend(*(id *)(a1 + 32), "_textWillFit:", v17) & 1) == 0)
              {
                CUIKStringForDateAndDayOfWeekInCalendarTimezone();
                v18 = (id)objc_claimAutoreleasedReturnValue();
                *a4 = v18;
                if ((objc_msgSend(*(id *)(a1 + 32), "_textWillFit:", v18) & 1) == 0)
                {
                  CUIKStringForDate();
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
                  *a4 = v19;
                }
              }
            }
          }
          else
          {
            CUIKLongDayStringForDate();
            v25 = (id)objc_claimAutoreleasedReturnValue();
            *a4 = v25;
            if ((objc_msgSend(*(id *)(a1 + 32), "_textWillFit:", v25) & 1) == 0)
            {
              CUIKStringForDateAndDayOfWeekInCalendarTimezone();
              v26 = (id)objc_claimAutoreleasedReturnValue();
              *a4 = v26;
              if ((objc_msgSend(*(id *)(a1 + 32), "_textWillFit:", v26) & 1) == 0)
              {
                CUIKStringMonthDayYearWithComma();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_22;
              }
            }
          }
        }
        if (a5)
        {
          CUIKTimeIntervalStringForDates();
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_29:

      }
    }
  }

}

- (void)_resetParticipantsTextIfNeeded
{
  double v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (-[EKUIInviteesViewTimeSlotCell updateParticipantsText](self, "updateParticipantsText"))
  {
    -[EKUIInviteesViewTimeSlotCell setUpdateParticipantsText:](self, "setUpdateParticipantsText:", 0);
    -[EKUIInviteesViewTimeSlotCell setAndMoreBoundingRect:](self, "setAndMoreBoundingRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[EKUIInviteesViewTimeSlotCell frame](self, "frame");
    if (fabs(v3) < 2.22044605e-16 || -[EKUIInviteesViewTimeSlotCell searchInProgress](self, "searchInProgress"))
    {
      v4 = 0;
    }
    else
    {
      if (-[EKUIInviteesViewTimeSlotCell _everyoneCanAttend](self, "_everyoneCanAttend"))
      {
        v5 = objc_alloc(MEMORY[0x1E0CB3498]);
        EventKitUIBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Everyone can attend"), &stru_1E601DFA8, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = *MEMORY[0x1E0DC1140];
        -[EKUIInviteesViewTimeSlotCell participantsTextColor](self, "participantsTextColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v8;
        v13[1] = *MEMORY[0x1E0DC1138];
        objc_msgSend((id)objc_opt_class(), "_participantsTextViewFont");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)objc_msgSend(v5, "initWithString:attributes:", v7, v10);

      }
      else
      {
        -[EKUIInviteesViewTimeSlotCell busyParticipants](self, "busyParticipants");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_44);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[EKUIInviteesViewTimeSlotCell showAllParticipants](self, "showAllParticipants"))
          -[EKUIInviteesViewTimeSlotCell _generateStringForAllParticipants:](self, "_generateStringForAllParticipants:", v6);
        else
          -[EKUIInviteesViewTimeSlotCell _generateStringForSomeParticipantsAndStampMoreBoundingRect:](self, "_generateStringForSomeParticipantsAndStampMoreBoundingRect:", v6);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    -[EKUIInviteesViewTimeSlotCell participantsTextView](self, "participantsTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", v4);

  }
}

uint64_t __62__EKUIInviteesViewTimeSlotCell__resetParticipantsTextIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_generateStringForAllParticipants:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  EKUIInviteesViewTimeSlotCell *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3778];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[EKUIInviteesViewTimeSlotCell participantsTextColor](self, "participantsTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_interParticipantSpacing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__EKUIInviteesViewTimeSlotCell__generateStringForAllParticipants___block_invoke;
  v17[3] = &unk_1E601B410;
  v9 = v6;
  v18 = v9;
  v19 = v8;
  v20 = self;
  v21 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);

  v22 = *MEMORY[0x1E0DC1138];
  objc_msgSend((id)objc_opt_class(), "_participantsTextViewFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttributes:range:", v13, 0, objc_msgSend(v9, "length"));

  v14 = v21;
  v15 = v9;

  return v15;
}

void __66__EKUIInviteesViewTimeSlotCell__generateStringForAllParticipants___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_textForParticipant:color:", v6, *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v5);

}

- (id)_generateStringForSomeParticipantsAndStampMoreBoundingRect:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  EKUIInviteesViewTimeSlotCell *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  -[EKUIInviteesViewTimeSlotCell participantsTextColor](self, "participantsTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_interParticipantSpacing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_andMoreLeftSpacing");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v38, "count");
  -[EKUIInviteesViewTimeSlotCell textViewForTextSizeTesting](self, "textViewForTextSizeTesting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewTimeSlotCell _preferredMaxLayoutWidth](self, "_preferredMaxLayoutWidth");
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v8, 0.0);
  v66 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "layoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__15;
  v62 = __Block_byref_object_dispose__15;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__15;
  v56 = __Block_byref_object_dispose__15;
  v57 = 0;
  v12 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __91__EKUIInviteesViewTimeSlotCell__generateStringForSomeParticipantsAndStampMoreBoundingRect___block_invoke;
  v39[3] = &unk_1E601B438;
  v36 = v12;
  v40 = v36;
  v35 = v5;
  v41 = v35;
  v42 = self;
  v34 = v4;
  v43 = v34;
  v50 = v6 - 1;
  v51 = v6;
  v13 = v10;
  v44 = v13;
  v14 = v37;
  v45 = v14;
  v15 = v7;
  v46 = v15;
  v16 = v11;
  v47 = v16;
  v48 = &v52;
  v49 = &v58;
  objc_msgSend(v38, "enumerateObjectsUsingBlock:", v39);
  v17 = (void *)v53[5];
  v64 = *MEMORY[0x1E0DC1138];
  objc_msgSend((id)objc_opt_class(), "_participantsTextViewFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAttributes:range:", v19, 0, objc_msgSend((id)v53[5], "length"));

  objc_msgSend(v15, "setAttributedText:", v53[5]);
  v20 = *MEMORY[0x1E0C9D628];
  v21 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v22 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v23 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v6 >= 2 && v59[5])
  {
    v24 = objc_msgSend((id)v53[5], "length");
    v25 = objc_msgSend(v16, "glyphIndexForCharacterAtIndex:", v24 - objc_msgSend((id)v59[5], "length"));
    v26 = objc_msgSend(v16, "numberOfGlyphs");
    objc_msgSend(v15, "textContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "boundingRectForGlyphRange:inTextContainer:", v25, v26 - v25, v27);
    v20 = v28;
    v21 = v29;
    v22 = v30;
    v23 = v31;

  }
  -[EKUIInviteesViewTimeSlotCell setAndMoreBoundingRect:](self, "setAndMoreBoundingRect:", v20, v21, v22, v23);
  v32 = (id)v53[5];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v32;
}

void __91__EKUIInviteesViewTimeSlotCell__generateStringForSomeParticipantsAndStampMoreBoundingRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_textForParticipant:color:", v7, *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v8);
  if (*(_QWORD *)(a1 + 112) == a3)
  {
    v9 = *(id *)(a1 + 32);
    v10 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_generateAndMoreStringWithCount:attributes:", *(_QWORD *)(a1 + 120) + ~a3, *(_QWORD *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v9, "appendAttributedString:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v9, "appendAttributedString:", v10);
  }
  v22 = *MEMORY[0x1E0DC1138];
  objc_msgSend((id)objc_opt_class(), "_participantsTextViewFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttributes:range:", v12, 0, objc_msgSend(v9, "length"));

  objc_msgSend(*(id *)(a1 + 80), "setAttributedText:", v9);
  if (objc_msgSend((id)objc_opt_class(), "_layoutManagerReportsExcessLines:", *(_QWORD *)(a1 + 88)))
  {
    *a4 = 1;
    if (*(_QWORD *)(a1 + 120) == 1)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v9);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = 0;
    }
    else
    {
      if (a3)
        goto LABEL_11;
      v17 = objc_alloc(MEMORY[0x1E0CB3778]);
      EventKitUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Show All…"), &stru_1E601DFA8, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithString:attributes:", v19, *(_QWORD *)(a1 + 64));

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v20);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v14 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v9);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v16 = v10;
    v14 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
  }

LABEL_11:
}

+ (BOOL)_layoutManagerReportsExcessLines:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  _QWORD v7[6];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = objc_msgSend(v3, "numberOfGlyphs");
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__EKUIInviteesViewTimeSlotCell__layoutManagerReportsExcessLines___block_invoke;
  v7[3] = &unk_1E601B460;
  v7[4] = v8;
  v7[5] = &v9;
  objc_msgSend(v3, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v4, v7);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

uint64_t __65__EKUIInviteesViewTimeSlotCell__layoutManagerReportsExcessLines___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) >= 3uLL)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (id)_textForParticipant:(id)a3 color:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[EKUIInviteesViewTimeSlotCell _busyImageAttributedStringForColor:](self, "_busyImageAttributedStringForColor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v8);
  v10 = (void *)objc_opt_class();
  objc_msgSend(v7, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_replaceSpacesWithNonBreakingSpaces:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "_nonBreakingSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@%@"), v14, v12);

  v16 = objc_alloc(MEMORY[0x1E0CB3498]);
  v20 = *MEMORY[0x1E0DC1140];
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v16, "initWithString:attributes:", v15, v17);
  objc_msgSend(v9, "appendAttributedString:", v18);

  return v9;
}

- (id)_busyImageAttributedStringForColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[EKUIInviteesViewTimeSlotCell colorToBusyImageAttributedString](self, "colorToBusyImageAttributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[EKUIInviteesViewTimeSlotCell setColorToBusyImageAttributedString:](self, "setColorToBusyImageAttributedString:", v6);

  }
  -[EKUIInviteesViewTimeSlotCell colorToBusyImageAttributedString](self, "colorToBusyImageAttributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithTintColor:renderingMode:", v4, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell colorToBusyImageAttributedString](self, "colorToBusyImageAttributedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v8, v4);

  }
  return v8;
}

- (BOOL)_textWillFit:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[EKUIInviteesViewTimeSlotCell labelForTextSizeTesting](self, "labelForTextSizeTesting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "sizeToFit");
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[EKUIInviteesViewTimeSlotCell _preferredMaxLayoutWidth](self, "_preferredMaxLayoutWidth");
  LOBYTE(self) = v7 <= v8;

  return (char)self;
}

+ (id)_generateAndMoreStringWithCount:(unint64_t)a3 attributes:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  CUIKLocalizedStringForInteger();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("& %@ more…"), &stru_1E601DFA8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_replaceSpacesWithNonBreakingSpaces:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v10, v4);

  return v11;
}

+ (id)_replaceSpacesWithNonBreakingSpaces:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_nonBreakingSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_nonBreakingSpace
{
  return CFSTR(" ");
}

+ (id)_interParticipantSpacing
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("   "));
}

+ (id)_andMoreLeftSpacing
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
}

- (BOOL)_everyoneCanAttend
{
  void *v2;
  void *v3;
  BOOL v4;

  -[EKUIInviteesViewTimeSlotCell busyParticipants](self, "busyParticipants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "count") == 0;
  else
    v4 = 1;

  return v4;
}

+ (id)_generateParticipantTextView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:textContainer:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "layoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLimitsLayoutForSuspiciousContents:", 1);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  objc_msgSend(v3, "setScrollEnabled:", 0);
  objc_msgSend(v3, "setSelectable:", 0);
  objc_msgSend(v3, "setEditable:", 0);
  objc_msgSend(v3, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  return v3;
}

+ (void)_setRequiredHuggingAndCompression:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  LODWORD(v3) = 1148846080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v3);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 1, v4);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v6);

}

- (id)showPreviewOfEventAtTime
{
  return self->_showPreviewOfEventAtTime;
}

- (void)setShowPreviewOfEventAtTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (id)showAllConflictedParticipantsTapped
{
  return self->_showAllConflictedParticipantsTapped;
}

- (void)setShowAllConflictedParticipantsTapped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (BOOL)checked
{
  return self->_checked;
}

- (NSDictionary)andMoreStringCache
{
  return self->_andMoreStringCache;
}

- (void)setAndMoreStringCache:(id)a3
{
  objc_storeStrong((id *)&self->_andMoreStringCache, a3);
}

- (NSArray)proposedBy
{
  return self->_proposedBy;
}

- (BOOL)searchInProgress
{
  return self->_searchInProgress;
}

- (void)setSearchInProgress:(BOOL)a3
{
  self->_searchInProgress = a3;
}

- (UILabel)labelForTextSizeTesting
{
  return self->_labelForTextSizeTesting;
}

- (void)setLabelForTextSizeTesting:(id)a3
{
  objc_storeStrong((id *)&self->_labelForTextSizeTesting, a3);
}

- (UITextView)textViewForTextSizeTesting
{
  return self->_textViewForTextSizeTesting;
}

- (void)setTextViewForTextSizeTesting:(id)a3
{
  objc_storeStrong((id *)&self->_textViewForTextSizeTesting, a3);
}

- (UILabel)topTimeLabel
{
  return self->_topTimeLabel;
}

- (void)setTopTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_topTimeLabel, a3);
}

- (UILabel)bottomTimeLabel
{
  return self->_bottomTimeLabel;
}

- (void)setBottomTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bottomTimeLabel, a3);
}

- (UILabel)timeZoneTimeLabel
{
  return self->_timeZoneTimeLabel;
}

- (void)setTimeZoneTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneTimeLabel, a3);
}

- (UILabel)proposedByLabel
{
  return self->_proposedByLabel;
}

- (void)setProposedByLabel:(id)a3
{
  objc_storeStrong((id *)&self->_proposedByLabel, a3);
}

- (UIView)andMoreDebugOverlay
{
  return self->_andMoreDebugOverlay;
}

- (void)setAndMoreDebugOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_andMoreDebugOverlay, a3);
}

- (UITextView)participantsTextView
{
  return self->_participantsTextView;
}

- (void)setParticipantsTextView:(id)a3
{
  objc_storeStrong((id *)&self->_participantsTextView, a3);
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkImageView, a3);
}

- (UIButton)showPreviewButton
{
  return self->_showPreviewButton;
}

- (void)setShowPreviewButton:(id)a3
{
  objc_storeStrong((id *)&self->_showPreviewButton, a3);
}

- (NSArray)persistentConstraints
{
  return self->_persistentConstraints;
}

- (void)setPersistentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_persistentConstraints, a3);
}

- (NSMutableDictionary)colorToBusyImageAttributedString
{
  return self->_colorToBusyImageAttributedString;
}

- (void)setColorToBusyImageAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_colorToBusyImageAttributedString, a3);
}

- (NSLayoutConstraint)topTimeLabelToTopContentViewConstraint
{
  return self->_topTimeLabelToTopContentViewConstraint;
}

- (void)setTopTimeLabelToTopContentViewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topTimeLabelToTopContentViewConstraint, a3);
}

- (NSLayoutConstraint)bottomTimeLabelToTopTimeLabelConstraint
{
  return self->_bottomTimeLabelToTopTimeLabelConstraint;
}

- (void)setBottomTimeLabelToTopTimeLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomTimeLabelToTopTimeLabelConstraint, a3);
}

- (NSLayoutConstraint)timeZoneTimeLabelToBottomTimeLabelConstraint
{
  return self->_timeZoneTimeLabelToBottomTimeLabelConstraint;
}

- (void)setTimeZoneTimeLabelToBottomTimeLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneTimeLabelToBottomTimeLabelConstraint, a3);
}

- (NSLayoutConstraint)proposedTimeLabelToBottomTimeLabelConstraint
{
  return self->_proposedTimeLabelToBottomTimeLabelConstraint;
}

- (void)setProposedTimeLabelToBottomTimeLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_proposedTimeLabelToBottomTimeLabelConstraint, a3);
}

- (NSLayoutConstraint)participantsViewToBottomTimeLabelConstraint
{
  return self->_participantsViewToBottomTimeLabelConstraint;
}

- (void)setParticipantsViewToBottomTimeLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_participantsViewToBottomTimeLabelConstraint, a3);
}

- (NSLayoutConstraint)participantsViewToContentViewConstraint
{
  return self->_participantsViewToContentViewConstraint;
}

- (void)setParticipantsViewToContentViewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_participantsViewToContentViewConstraint, a3);
}

- (NSLayoutConstraint)topTimeLabelHeightConstraint
{
  return self->_topTimeLabelHeightConstraint;
}

- (void)setTopTimeLabelHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topTimeLabelHeightConstraint, a3);
}

- (NSLayoutConstraint)bottomTimeLabelHeightConstraint
{
  return self->_bottomTimeLabelHeightConstraint;
}

- (void)setBottomTimeLabelHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomTimeLabelHeightConstraint, a3);
}

- (NSLayoutConstraint)timeZoneTimeLabelHeightConstraint
{
  return self->_timeZoneTimeLabelHeightConstraint;
}

- (void)setTimeZoneTimeLabelHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneTimeLabelHeightConstraint, a3);
}

- (NSLayoutConstraint)proposedByMinHeightConstraint
{
  return self->_proposedByMinHeightConstraint;
}

- (void)setProposedByMinHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_proposedByMinHeightConstraint, a3);
}

- (NSLayoutConstraint)proposedByMaxHeightConstraint
{
  return self->_proposedByMaxHeightConstraint;
}

- (void)setProposedByMaxHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_proposedByMaxHeightConstraint, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (BOOL)updateFontBasedConstraints
{
  return self->_updateFontBasedConstraints;
}

- (void)setUpdateFontBasedConstraints:(BOOL)a3
{
  self->_updateFontBasedConstraints = a3;
}

- (BOOL)updateTimeText
{
  return self->_updateTimeText;
}

- (void)setUpdateTimeText:(BOOL)a3
{
  self->_updateTimeText = a3;
}

- (BOOL)updateParticipantsText
{
  return self->_updateParticipantsText;
}

- (void)setUpdateParticipantsText:(BOOL)a3
{
  self->_updateParticipantsText = a3;
}

- (BOOL)showAllParticipants
{
  return self->_showAllParticipants;
}

- (NSArray)busyParticipants
{
  return self->_busyParticipants;
}

- (UITapGestureRecognizer)tappedMoreRecognizer
{
  return self->_tappedMoreRecognizer;
}

- (void)setTappedMoreRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tappedMoreRecognizer, a3);
}

- (CGRect)andMoreBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_andMoreBoundingRect.origin.x;
  y = self->_andMoreBoundingRect.origin.y;
  width = self->_andMoreBoundingRect.size.width;
  height = self->_andMoreBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tappedMoreRecognizer, 0);
  objc_storeStrong((id *)&self->_busyParticipants, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_proposedByMaxHeightConstraint, 0);
  objc_storeStrong((id *)&self->_proposedByMinHeightConstraint, 0);
  objc_storeStrong((id *)&self->_timeZoneTimeLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomTimeLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_topTimeLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewToContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewToBottomTimeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_proposedTimeLabelToBottomTimeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_timeZoneTimeLabelToBottomTimeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_bottomTimeLabelToTopTimeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_topTimeLabelToTopContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_colorToBusyImageAttributedString, 0);
  objc_storeStrong((id *)&self->_persistentConstraints, 0);
  objc_storeStrong((id *)&self->_showPreviewButton, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_participantsTextView, 0);
  objc_storeStrong((id *)&self->_andMoreDebugOverlay, 0);
  objc_storeStrong((id *)&self->_proposedByLabel, 0);
  objc_storeStrong((id *)&self->_timeZoneTimeLabel, 0);
  objc_storeStrong((id *)&self->_bottomTimeLabel, 0);
  objc_storeStrong((id *)&self->_topTimeLabel, 0);
  objc_storeStrong((id *)&self->_textViewForTextSizeTesting, 0);
  objc_storeStrong((id *)&self->_labelForTextSizeTesting, 0);
  objc_storeStrong((id *)&self->_proposedBy, 0);
  objc_storeStrong((id *)&self->_andMoreStringCache, 0);
  objc_storeStrong(&self->_showAllConflictedParticipantsTapped, 0);
  objc_storeStrong(&self->_showPreviewOfEventAtTime, 0);
}

@end
