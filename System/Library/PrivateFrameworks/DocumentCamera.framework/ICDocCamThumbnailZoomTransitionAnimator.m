@implementation ICDocCamThumbnailZoomTransitionAnimator

- (ICDocCamThumbnailZoomTransitionAnimator)initWithImage:(id)a3 indexPath:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  ICDocCamThumbnailZoomTransitionAnimator *v14;
  ICDocCamThumbnailZoomTransitionAnimator *v15;
  uint64_t v16;
  id completion;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICDocCamThumbnailZoomTransitionAnimator;
  v14 = -[ICDocCamThumbnailZoomTransitionAnimator init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_thumbnailImage, a3);
    objc_storeStrong((id *)&v15->_indexPath, a4);
    v15->_duration = a5;
    v16 = MEMORY[0x212B988FC](v13);
    completion = v15->_completion;
    v15->_completion = (id)v16;

  }
  return v15;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  id v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
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
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  ICDocCamThumbnailZoomTransitionAnimator *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  id v118;
  id v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  BOOL v124;
  double v125;
  void *v126;
  void *v127;
  id v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  double v133;
  double v134;
  id v135;
  void *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  void *v147;
  id v148;
  void *v149;
  void *v150;
  id v151;
  _QWORD v152[4];
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD v158[4];
  id v159;
  ICDocCamThumbnailZoomTransitionAnimator *v160;
  id v161;
  id v162;
  id v163;
  _QWORD v164[5];
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  _QWORD *v172;
  _QWORD v173[3];
  int v174;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  objc_msgSend(v5, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNeedsLayout");

  objc_msgSend(v5, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutIfNeeded");

  LODWORD(v20) = -[ICDocCamThumbnailZoomTransitionAnimator presenting](self, "presenting");
  v21 = objc_opt_class();
  if ((_DWORD)v20)
  {
    DCDynamicCast(v21, (uint64_t)v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    DCDynamicCast(v23, (uint64_t)v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailZoomTransitionAnimator indexPath](self, "indexPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = v24;
    objc_msgSend(v24, "zoomTargetForIndexPath:", v25);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

    -[ICDocCamThumbnailZoomTransitionAnimator indexPath](self, "indexPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v22;
  }
  else
  {
    DCDynamicCast(v21, (uint64_t)v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_opt_class();
    DCDynamicCast(v36, (uint64_t)v5);
    v37 = objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailZoomTransitionAnimator indexPath](self, "indexPath");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "zoomTargetForIndexPath:", v38);
    v27 = v39;
    v29 = v40;
    v31 = v41;
    v33 = v42;

    -[ICDocCamThumbnailZoomTransitionAnimator indexPath](self, "indexPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = (void *)v37;
    v35 = (void *)v37;
  }
  objc_msgSend(v35, "zoomTargetForIndexPath:", v34);
  v140 = v44;
  v141 = v43;
  v138 = v46;
  v139 = v45;

  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v27, v29, v31, v33);
  objc_msgSend(v47, "setContentMode:", 2);
  -[ICDocCamThumbnailZoomTransitionAnimator thumbnailImage](self, "thumbnailImage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setImage:", v48);

  objc_msgSend(v47, "setClipsToBounds:", 1);
  objc_msgSend(v4, "containerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addSubview:", v47);

  v149 = v5;
  v150 = v4;
  v142 = v6;
  v143 = v29;
  v144 = v27;
  v145 = v33;
  v146 = v31;
  if (-[ICDocCamThumbnailZoomTransitionAnimator presenting](self, "presenting"))
  {
    v50 = 0;
    v51 = 0;
    v52 = *MEMORY[0x24BDF7718];
    v53 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v55 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v54 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  else
  {
    objc_msgSend(v4, "containerView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if ((objc_msgSend(v22, "statusBarWasHiddenWhenDoneTapped") & 1) != 0)
    {
      v51 = 0;
      v58 = 0.0;
    }
    else
    {
      objc_msgSend(v22, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "window");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "windowScene");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "statusBarManager");
      v62 = v56;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "statusBarFrame");
      v65 = v64;
      v67 = v66;
      v69 = v68;
      v58 = v70;

      v56 = v62;
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v65, v67, v69, v58);
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setBackgroundColor:", v71);

      objc_msgSend(v150, "containerView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "addSubview:", v51);

      objc_msgSend(v51, "leadingAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "leadingAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, 0.0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addObject:", v75);

      objc_msgSend(v51, "trailingAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "trailingAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, 0.0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addObject:", v78);

      objc_msgSend(v51, "topAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "topAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, 0.0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addObject:", v81);

      v4 = v150;
      objc_msgSend(v51, "heightAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "constraintEqualToConstant:", v58);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addObject:", v83);

    }
    objc_msgSend(v22, "navigationItem");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "navigationBar");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v85, "size");
    v87 = v86;
    objc_msgSend(v85, "size");
    v52 = *MEMORY[0x24BDF7718];
    v53 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v55 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v54 = *(double *)(MEMORY[0x24BDF7718] + 24);
    objc_msgSend(v85, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v87, v88, *MEMORY[0x24BDF7718], v53, v55, v54);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v85, "size");
    v90 = v89;
    objc_msgSend(v85, "size");
    objc_msgSend(v50, "setFrame:", 0.0, v58, v90, v91);
    objc_msgSend(v4, "containerView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addSubview:", v50);

    v4 = v150;
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v57);

  }
  objc_msgSend(v22, "bottomToolbar");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "frame");
  v95 = v94;
  objc_msgSend(v93, "frame");
  v97 = v96;
  objc_msgSend(v93, "frame");
  v99 = v98;
  objc_msgSend(v93, "frame");
  v101 = v100;
  objc_msgSend(v22, "view");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "safeAreaInsets");
  v104 = v101 + v103;

  objc_msgSend(v93, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v99, v104, v52, v53, v55, v54);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v105, "setFrame:", v95, v97, v99, v104);
  objc_msgSend(v4, "containerView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "addSubview:", v105);

  objc_msgSend(v22, "pageViewController");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "view");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setHidden:", 1);

  if (!-[ICDocCamThumbnailZoomTransitionAnimator presenting](self, "presenting"))
  {
    v136 = v50;
    v109 = self;
    v110 = v47;
    v111 = v51;
    objc_msgSend(v22, "indexPathForCurrentDocument");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "thumbnailViewController");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "collectionView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "cellForItemAtIndexPath:", v112);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "documentCount") == 1)
    {
      objc_msgSend(v115, "setAlpha:", 0.0);
    }
    else
    {
      objc_msgSend(v115, "layer");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v117) = 0;
      objc_msgSend(v116, "setOpacity:", v117);

    }
    v51 = v111;
    v47 = v110;
    self = v109;
    v50 = v136;
  }
  v173[0] = 0;
  v173[1] = v173;
  v173[2] = 0x2020000000;
  v174 = 0;
  v164[0] = MEMORY[0x24BDAC760];
  v164[1] = 3221225472;
  v164[2] = __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke;
  v164[3] = &unk_24C5B90B0;
  v164[4] = self;
  v172 = v173;
  v118 = v47;
  v165 = v118;
  v119 = v105;
  v166 = v119;
  v137 = v22;
  v167 = v137;
  v151 = v150;
  v168 = v151;
  v120 = v51;
  v169 = v120;
  v121 = v50;
  v170 = v121;
  v148 = v147;
  v171 = v148;
  v122 = (void *)MEMORY[0x212B988FC](v164);
  objc_msgSend(v149, "view");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setAlpha:", 0.0);

  v124 = -[ICDocCamThumbnailZoomTransitionAnimator presenting](self, "presenting");
  v125 = 0.0;
  v126 = v119;
  if (!v124)
  {
    v125 = 1.0;
    objc_msgSend(v119, "setAlpha:", 1.0);
    objc_msgSend(v120, "setAlpha:", 1.0);
    v126 = v121;
  }
  objc_msgSend(v126, "setAlpha:", v125);
  v127 = (void *)MEMORY[0x24BDF6F90];
  v158[0] = MEMORY[0x24BDAC760];
  v158[1] = 3221225472;
  v158[2] = __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_16;
  v158[3] = &unk_24C5B90D8;
  v128 = v149;
  v159 = v128;
  v160 = self;
  v129 = v119;
  v161 = v129;
  v130 = v120;
  v162 = v130;
  v131 = v121;
  v163 = v131;
  objc_msgSend(v127, "animateWithDuration:delay:options:animations:completion:", 0, v158, v122, 0.14, 0.0);
  objc_msgSend(v118, "setFrame:", v144, v143, v146, v145);
  v132 = (void *)MEMORY[0x24BDF6F90];
  -[ICDocCamThumbnailZoomTransitionAnimator duration](self, "duration");
  v134 = v133;
  v152[0] = MEMORY[0x24BDAC760];
  v152[1] = 3221225472;
  v152[2] = __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_2_17;
  v152[3] = &unk_24C5B9100;
  v135 = v118;
  v153 = v135;
  v154 = v141;
  v155 = v140;
  v156 = v139;
  v157 = v138;
  objc_msgSend(v132, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v152, v122, v134, 0.0, 0.8, 0.0);

  _Block_object_dispose(v173, 8);
}

void __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) == 2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "presenting"))
    {
      objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
      objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
      objc_msgSend(*(id *)(a1 + 56), "pageViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 0);

      objc_msgSend(*(id *)(a1 + 64), "completeTransition:", objc_msgSend(*(id *)(a1 + 64), "transitionWasCancelled") ^ 1);
      objc_msgSend(*(id *)(a1 + 32), "completion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "completion");
        v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v6[2]();

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
      objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
      objc_msgSend(*(id *)(a1 + 80), "removeFromSuperview");
      v7 = objc_msgSend(*(id *)(a1 + 56), "documentCount");
      v8 = *(void **)(a1 + 56);
      if (v7 == 1)
      {
        objc_msgSend(v8, "indexPathForCurrentDocument");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 88), "thumbnailViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cellForItemAtIndexPath:", v9);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setAlpha:", 1.0);
        objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
        objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
        objc_msgSend(*(id *)(a1 + 64), "completeTransition:", objc_msgSend(*(id *)(a1 + 64), "transitionWasCancelled") ^ 1);
      }
      else
      {
        objc_msgSend(v8, "indexPathForCurrentDocument");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 88), "thumbnailViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cellForItemAtIndexPath:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        v16 = (void *)MEMORY[0x24BDE57D8];
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_2;
        v27[3] = &unk_24C5B80C0;
        v28 = *(id *)(a1 + 40);
        v12 = v15;
        v29 = v12;
        v30 = *(id *)(a1 + 64);
        objc_msgSend(v16, "setCompletionBlock:", v27);
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFromValue:", &unk_24C5D8328);
        objc_msgSend(v17, "setToValue:", &unk_24C5D8340);
        objc_msgSend(v17, "setDuration:", 0.05);
        LODWORD(v18) = 1.0;
        objc_msgSend(v17, "setRepeatCount:", v18);
        objc_msgSend(v17, "setRemovedOnCompletion:", 0);
        v19 = *MEMORY[0x24BDE5970];
        objc_msgSend(v17, "setFillMode:", *MEMORY[0x24BDE5970]);
        v20 = *MEMORY[0x24BDE5D20];
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTimingFunction:", v21);

        objc_msgSend(v12, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAnimation:forKey:", v17, CFSTR("opacity"));

        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setBeginTime:", CACurrentMediaTime() + 0.05);
        objc_msgSend(v23, "setFromValue:", &unk_24C5D8340);
        objc_msgSend(v23, "setToValue:", &unk_24C5D8328);
        objc_msgSend(v23, "setDuration:", 0.2);
        LODWORD(v24) = 1.0;
        objc_msgSend(v23, "setRepeatCount:", v24);
        objc_msgSend(v23, "setRemovedOnCompletion:", 0);
        objc_msgSend(v23, "setFillMode:", v19);
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTimingFunction:", v25);

        objc_msgSend(*(id *)(a1 + 40), "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addAnimation:forKey:", v23, CFSTR("opacity"));

        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      }

    }
  }
  objc_sync_exit(v2);

}

uint64_t __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_2(id *a1)
{
  void *v2;
  double v3;

  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setOpacity:", v3);

  return objc_msgSend(a1[6], "completeTransition:", objc_msgSend(a1[6], "transitionWasCancelled") ^ 1);
}

uint64_t __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_16(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  v3 = objc_msgSend(*(id *)(a1 + 40), "presenting");
  v4 = *(void **)(a1 + 48);
  if (v3)
  {
    v5 = 1.0;
  }
  else
  {
    objc_msgSend(v4, "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 0.0);
    v4 = *(void **)(a1 + 64);
    v5 = 0.0;
  }
  return objc_msgSend(v4, "setAlpha:", v5);
}

uint64_t __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_2_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_shouldCrossFadeNavigationBar
{
  return 1;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

@end
