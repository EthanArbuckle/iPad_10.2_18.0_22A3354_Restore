@implementation HUClipScrubberView

- (HUClipScrubberView)initWithFrame:(CGRect)a3
{
  HUClipScrubberView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUClipScrubberView;
  v3 = -[HUClipScrubberView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[HUClipScrubberView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUClipScrubberView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberView addSubview:](v3, "addSubview:", v5);

    -[HUClipScrubberView playheadView](v3, "playheadView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberView addSubview:](v3, "addSubview:", v6);

    -[HUClipScrubberView _addConstraints](v3, "_addConstraints");
  }
  return v3;
}

- (void)_addConstraints
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
  _QWORD v134[34];

  v134[32] = *MEMORY[0x1E0C80C00];
  -[HUClipScrubberView contentView](self, "contentView");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "heightAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "constraintEqualToConstant:", 94.0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v131;
  -[HUClipScrubberView contentView](self, "contentView");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "leftAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView leftAnchor](self, "leftAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintEqualToAnchor:", v128);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v127;
  -[HUClipScrubberView contentView](self, "contentView");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "rightAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView rightAnchor](self, "rightAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:", v124);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v123;
  -[HUClipScrubberView contentView](self, "contentView");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "bottomAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView bottomAnchor](self, "bottomAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v120);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v134[3] = v119;
  -[HUClipScrubberView contentBackgroundView](self, "contentBackgroundView");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "heightAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToConstant:", 47.0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v134[4] = v116;
  -[HUClipScrubberView contentBackgroundView](self, "contentBackgroundView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "leftAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView contentView](self, "contentView");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "leftAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v112);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v134[5] = v111;
  -[HUClipScrubberView contentBackgroundView](self, "contentBackgroundView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "rightAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView contentView](self, "contentView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "rightAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v134[6] = v106;
  -[HUClipScrubberView contentBackgroundView](self, "contentBackgroundView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "bottomAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView contentView](self, "contentView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "bottomAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v134[7] = v101;
  -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "heightAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToConstant:", 94.0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v134[8] = v98;
  -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "leftAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView contentView](self, "contentView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "leftAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v94, 54.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v134[9] = v93;
  -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "rightAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView contentView](self, "contentView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "rightAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:constant:", v89, -54.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v134[10] = v88;
  -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView bottomAnchor](self, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v85);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v134[11] = v84;
  -[HUClipScrubberView backgroundPlayheadView](self, "backgroundPlayheadView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "bottomAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v134[12] = v79;
  -[HUClipScrubberView backgroundPlayheadView](self, "backgroundPlayheadView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "centerXAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "centerXAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v134[13] = v74;
  -[HUClipScrubberView backgroundPlayheadView](self, "backgroundPlayheadView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "widthAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToConstant:", 24.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v134[14] = v71;
  -[HUClipScrubberView backgroundPlayheadView](self, "backgroundPlayheadView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "heightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToConstant:", 55.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v134[15] = v68;
  -[HUClipScrubberView playheadView](self, "playheadView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView bottomAnchor](self, "bottomAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v134[16] = v64;
  -[HUClipScrubberView playheadView](self, "playheadView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "centerXAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView centerXAnchor](self, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v134[17] = v60;
  -[HUClipScrubberView playheadView](self, "playheadView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToConstant:", 24.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v134[18] = v56;
  -[HUClipScrubberView playheadView](self, "playheadView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "heightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToConstant:", 55.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v134[19] = v53;
  -[HUClipScrubberView playPauseButton](self, "playPauseButton");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "widthAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToConstant:", 54.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v134[20] = v50;
  -[HUClipScrubberView playPauseButton](self, "playPauseButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leftAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leftAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v134[21] = v45;
  -[HUClipScrubberView playPauseButton](self, "playPauseButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v134[22] = v40;
  -[HUClipScrubberView playPauseButton](self, "playPauseButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToConstant:", 47.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v134[23] = v37;
  -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leftAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v134[24] = v32;
  -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v134[25] = v27;
  -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", 47.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v134[26] = v24;
  -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v134[27] = v19;
  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", 54.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v134[28] = v16;
  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v134[29] = v4;
  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v134[30] = v9;
  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", 47.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v134[31] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 32);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v57);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUClipScrubberView;
  -[HUClipScrubberView layoutSubviews](&v5, sel_layoutSubviews);
  -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

}

- (id)playOrPauseImageForEngineMode:(unint64_t)a3
{
  void *v4;

  if (a3 && -[HUClipScrubberView isPlayingMedia](self, "isPlayingMedia"))
  {
    -[HUClipScrubberView _pauseImage](self, "_pauseImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUClipScrubberView _playImage](self, "_playImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)activateLiveButtonDisplay
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

}

- (void)deactivateLiveButtonDisplay
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

}

- (void)didUpdatePlaybackEngine:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "timeControlStatus");
  v6 = objc_msgSend(v4, "engineMode");
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "timeControlStatusDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberView displayModeDescription](self, "displayModeDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "engineModeDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Scrubber didUpdate timeControlStatus:%@  displayMode:%@ engineMode:%@.", (uint8_t *)&v11, 0x20u);

  }
  switch(v5)
  {
    case 0:
      -[HUClipScrubberView setIsPlayingMedia:](self, "setIsPlayingMedia:", 0);
      -[HUClipScrubberView deactivateLiveButtonDisplay](self, "deactivateLiveButtonDisplay");
      break;
    case 2:
      if (v6)
        -[HUClipScrubberView deactivateLiveButtonDisplay](self, "deactivateLiveButtonDisplay");
      else
        -[HUClipScrubberView activateLiveButtonDisplay](self, "activateLiveButtonDisplay");
      goto LABEL_12;
    case 1:
      -[HUClipScrubberView deactivateLiveButtonDisplay](self, "deactivateLiveButtonDisplay");
      if (v6 == 1)
LABEL_12:
        -[HUClipScrubberView setIsPlayingMedia:](self, "setIsPlayingMedia:", 1);
      break;
  }
  -[HUClipScrubberView updateAccessoryButtonsForPlaybackEngine:](self, "updateAccessoryButtonsForPlaybackEngine:", v4);

}

- (void)updateAccessoryButtonsForPlaybackEngine:(id)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    if (objc_msgSend(v8, "engineMode"))
      -[HUClipScrubberView deactivateLiveButtonDisplay](self, "deactivateLiveButtonDisplay");
    else
      -[HUClipScrubberView activateLiveButtonDisplay](self, "activateLiveButtonDisplay");
  }
  v4 = objc_msgSend(v8, "timelineState") == 2;
  -[HUClipScrubberView playPauseButton](self, "playPauseButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  if (objc_msgSend(v8, "timelineState") == 2)
    -[HUClipScrubberView playOrPauseImageForEngineMode:](self, "playOrPauseImageForEngineMode:", objc_msgSend(v8, "engineMode"));
  else
    -[HUClipScrubberView _playImage](self, "_playImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView playPauseButton](self, "playPauseButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forState:", v6, 0);

}

- (BOOL)_isDataSourceUpdating
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;

  objc_opt_class();
  -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(v6, "isUpdating");
  return v7;
}

- (void)navigateToLivePosition
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  if (!-[HUClipScrubberView _isDataSourceUpdating](self, "_isDataSourceUpdating"))
  {
    -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentOffset");
    v5 = v4;

    -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentSize");
    v8 = v7;
    -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v8 - v10;

    -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentOffset:", v11, v5);

  }
}

- (void)navigateToOffset:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  if (!-[HUClipScrubberView _isDataSourceUpdating](self, "_isDataSourceUpdating"))
  {
    -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    v7 = v6;

    -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = a3 + v9 * -0.5;

    -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentOffset:", v10, v7);

  }
}

- (void)updateDisplayMode:(unint64_t)a3
{
  if (-[HUClipScrubberView displayMode](self, "displayMode") != a3)
  {
    if (a3 == 1)
    {
      -[HUClipScrubberView displayEditInterface](self, "displayEditInterface");
    }
    else if (!a3)
    {
      -[HUClipScrubberView hideEditInterface](self, "hideEditInterface");
    }
  }
  -[HUClipScrubberView setDisplayMode:](self, "setDisplayMode:", a3);
}

- (void)displayEditInterface
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", 0, 0);

  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedTitle:forState:", 0, 0);

  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberView _deleteImage](self, "_deleteImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v6, 0);

  -[HUClipScrubberView deactivateLiveButtonDisplay](self, "deactivateLiveButtonDisplay");
  -[HUClipScrubberView playheadView](self, "playheadView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEditing:", 1);

}

- (void)hideEditInterface
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", 0, 0);

  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentEdgeInsets:", 0.0, 4.0, 0.0, 4.0);

  -[HUClipScrubberView rightActionButton](self, "rightActionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraLive"), CFSTR("HUCameraLive"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);

  -[HUClipScrubberView deactivateLiveButtonDisplay](self, "deactivateLiveButtonDisplay");
  -[HUClipScrubberView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "hu_hasExtendedWidth");

  if ((_DWORD)v6)
  {
    -[HUClipScrubberView leftBlendedSeparator](self, "leftBlendedSeparator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    -[HUClipScrubberView rightBlendedSeparator](self, "rightBlendedSeparator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

  }
  -[HUClipScrubberView playheadView](self, "playheadView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEditing:", 0);

}

- (UICollectionView)clipCollectionView
{
  UICollectionView *clipCollectionView;
  double v4;
  double v5;
  id v6;
  UICollectionView *v7;
  void *v8;
  void *v9;
  UICollectionView *v10;

  clipCollectionView = self->_clipCollectionView;
  if (!clipCollectionView)
  {
    -[UIView bounds](self->_contentView, "bounds");
    v5 = v4 + -108.0;
    v6 = objc_alloc_init(MEMORY[0x1E0CEA450]);
    objc_msgSend(v6, "setScrollDirection:", 1);
    v7 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA410]), "initWithFrame:collectionViewLayout:", v6, 54.0, 0.0, v5, 47.0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUClipScrubberCollectionViewAccessibilityLabel"), CFSTR("HUClipScrubberCollectionViewAccessibilityLabel"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setAccessibilityLabel:](v7, "setAccessibilityLabel:", v8);

    -[UICollectionView setSemanticContentAttribute:](v7, "setSemanticContentAttribute:", 3);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v7, "setBackgroundColor:", v9);

    -[UICollectionView setClipsToBounds:](v7, "setClipsToBounds:", 0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("HUCameraEventRecordingCellIdentifier"));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("HUCameraEventReachabilityCellIdentifier"));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("HUCameraEventSpacerCellIdentifier"));
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0CEB3B8], CFSTR("header"));
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0CEB3B0], CFSTR("footer"));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("liveSpacer"));
    -[UICollectionView setShowsHorizontalScrollIndicator:](v7, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = self->_clipCollectionView;
    self->_clipCollectionView = v7;

    clipCollectionView = self->_clipCollectionView;
  }
  return clipCollectionView;
}

- (UIView)collectionViewContainer
{
  UIView *collectionViewContainer;
  UIView *v4;
  void *v5;
  void *v6;
  UIView *v7;

  collectionViewContainer = self->_collectionViewContainer;
  if (!collectionViewContainer)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[HUClipScrubberView backgroundPlayheadView](self, "backgroundPlayheadView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v5);

    -[HUClipScrubberView clipCollectionView](self, "clipCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v6);

    v7 = self->_collectionViewContainer;
    self->_collectionViewContainer = v4;

    collectionViewContainer = self->_collectionViewContainer;
  }
  return collectionViewContainer;
}

- (AVBackgroundView)contentBackgroundView
{
  AVBackgroundView *contentBackgroundView;
  id v4;
  AVBackgroundView *v5;

  contentBackgroundView = self->_contentBackgroundView;
  if (!contentBackgroundView)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C8B3F8]);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_contentBackgroundView;
    self->_contentBackgroundView = (AVBackgroundView *)v4;

    contentBackgroundView = self->_contentBackgroundView;
  }
  return contentBackgroundView;
}

- (UIView)contentView
{
  UIView *contentView;
  id v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUClipScrubberView contentBackgroundView](self, "contentBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v5, "addSubview:", v6);

    -[HUClipScrubberView collectionViewContainer](self, "collectionViewContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v5, "addSubview:", v7);

    -[HUClipScrubberView playPauseButton](self, "playPauseButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v5, "addSubview:", v8);

    -[HUClipScrubberView rightActionButton](self, "rightActionButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v5, "addSubview:", v9);

    v10 = self->_contentView;
    self->_contentView = v5;

    contentView = self->_contentView;
  }
  return contentView;
}

- (HUClipScrubberPlayheadView)playheadView
{
  HUClipScrubberPlayheadView *playheadView;
  HUClipScrubberPlayheadView *v4;
  HUClipScrubberPlayheadView *v5;

  playheadView = self->_playheadView;
  if (!playheadView)
  {
    v4 = objc_alloc_init(HUClipScrubberPlayheadView);
    -[HUClipScrubberPlayheadView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_playheadView;
    self->_playheadView = v4;

    playheadView = self->_playheadView;
  }
  return playheadView;
}

- (HUClipScrubberPlayheadView)backgroundPlayheadView
{
  HUClipScrubberPlayheadView *backgroundPlayheadView;
  HUClipScrubberPlayheadView *v4;
  HUClipScrubberPlayheadView *v5;

  backgroundPlayheadView = self->_backgroundPlayheadView;
  if (!backgroundPlayheadView)
  {
    v4 = objc_alloc_init(HUClipScrubberPlayheadView);
    -[HUClipScrubberPlayheadView setDrawsUpperContent:](v4, "setDrawsUpperContent:", 1);
    -[HUClipScrubberPlayheadView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_backgroundPlayheadView;
    self->_backgroundPlayheadView = v4;

    backgroundPlayheadView = self->_backgroundPlayheadView;
  }
  return backgroundPlayheadView;
}

- (UIButton)playPauseButton
{
  UIButton *playPauseButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  HUBlendedSeparatorView *v8;
  HUBlendedSeparatorView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  playPauseButton = self->_playPauseButton;
  if (!playPauseButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4, "setTintColor:", v5);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUClipScrubberView _playImage](self, "_playImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v4, "setImage:forState:", v6, 0);

    -[UIButton imageView](v4, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentMode:", 4);

    v8 = [HUBlendedSeparatorView alloc];
    v9 = -[HUBlendedSeparatorView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUClipScrubberView setLeftBlendedSeparator:](self, "setLeftBlendedSeparator:", v9);
    -[HUBlendedSeparatorView setOpaque:](v9, "setOpaque:", 0);
    -[HUBlendedSeparatorView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addSubview:](v4, "addSubview:", v9);
    -[HUBlendedSeparatorView topAnchor](v9, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v4, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    -[HUBlendedSeparatorView bottomAnchor](v9, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton bottomAnchor](v4, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v10;
    -[HUBlendedSeparatorView widthAnchor](v9, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v12;
    -[HUBlendedSeparatorView rightAnchor](v9, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton rightAnchor](v4, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
    v17 = self->_playPauseButton;
    self->_playPauseButton = v4;

    playPauseButton = self->_playPauseButton;
  }
  return playPauseButton;
}

- (UIButton)rightActionButton
{
  UIButton *rightActionButton;
  UIButton *v4;
  void *v5;
  void *v6;
  HUBlendedSeparatorView *v7;
  HUBlendedSeparatorView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIButton *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  rightActionButton = self->_rightActionButton;
  if (!rightActionButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_clipScrubberLiveButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 16.0);
    -[UIButton layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaskedCorners:", 10);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = [HUBlendedSeparatorView alloc];
    v8 = -[HUBlendedSeparatorView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUClipScrubberView setRightBlendedSeparator:](self, "setRightBlendedSeparator:", v8);
    -[HUBlendedSeparatorView setOpaque:](v8, "setOpaque:", 0);
    -[HUBlendedSeparatorView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addSubview:](v4, "addSubview:", v8);
    -[HUBlendedSeparatorView topAnchor](v8, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v4, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v20;
    -[HUBlendedSeparatorView bottomAnchor](v8, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton bottomAnchor](v4, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v9;
    -[HUBlendedSeparatorView widthAnchor](v8, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v11;
    -[HUBlendedSeparatorView leftAnchor](v8, "leftAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leftAnchor](v4, "leftAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
    v16 = self->_rightActionButton;
    self->_rightActionButton = v4;

    rightActionButton = self->_rightActionButton;
  }
  return rightActionButton;
}

- (id)_playImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("play.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_pauseImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("pause.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_deleteImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("trash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)displayModeDescription
{
  if (-[HUClipScrubberView displayMode](self, "displayMode"))
    return CFSTR("Editing");
  else
    return CFSTR("Default");
}

- (void)setPlayPauseButton:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseButton, a3);
}

- (void)setRightActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightActionButton, a3);
}

- (void)setPlayheadView:(id)a3
{
  objc_storeStrong((id *)&self->_playheadView, a3);
}

- (void)setClipCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_clipCollectionView, a3);
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void)setContentBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_contentBackgroundView, a3);
}

- (void)setBackgroundPlayheadView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPlayheadView, a3);
}

- (void)setCollectionViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewContainer, a3);
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (HUBlendedSeparatorView)leftBlendedSeparator
{
  return self->_leftBlendedSeparator;
}

- (void)setLeftBlendedSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_leftBlendedSeparator, a3);
}

- (HUBlendedSeparatorView)rightBlendedSeparator
{
  return self->_rightBlendedSeparator;
}

- (void)setRightBlendedSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_rightBlendedSeparator, a3);
}

- (BOOL)isPlayingMedia
{
  return self->_isPlayingMedia;
}

- (void)setIsPlayingMedia:(BOOL)a3
{
  self->_isPlayingMedia = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBlendedSeparator, 0);
  objc_storeStrong((id *)&self->_leftBlendedSeparator, 0);
  objc_storeStrong((id *)&self->_collectionViewContainer, 0);
  objc_storeStrong((id *)&self->_backgroundPlayheadView, 0);
  objc_storeStrong((id *)&self->_contentBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_clipCollectionView, 0);
  objc_storeStrong((id *)&self->_playheadView, 0);
  objc_storeStrong((id *)&self->_rightActionButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
}

@end
