@implementation ICDocCamRecropTransitionAnimator

- (ICDocCamRecropTransitionAnimator)initWithImage:(id)a3 unfilteredImage:(id)a4 orientation:(int64_t)a5 indexPath:(id)a6 duration:(double)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  ICDocCamRecropTransitionAnimator *v19;
  ICDocCamRecropTransitionAnimator *v20;
  uint64_t v21;
  id completion;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICDocCamRecropTransitionAnimator;
  v19 = -[ICDocCamRecropTransitionAnimator init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_filteredImage, a3);
    objc_storeStrong((id *)&v20->_unfilteredImage, a4);
    v20->_orientation = a5;
    objc_storeStrong((id *)&v20->_indexPath, a6);
    v20->_duration = a7;
    v21 = MEMORY[0x212B988FC](v18);
    completion = v20->_completion;
    v20->_completion = (id)v21;

  }
  return v20;
}

- (double)transitionDuration:(id)a3
{
  return 0.14;
}

- (void)animateTransition:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *MEMORY[0x24BDF7F90];
  v5 = a3;
  objc_msgSend(v5, "viewControllerForKey:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  -[ICDocCamRecropTransitionAnimator setContainerViewFrame:](self, "setContainerViewFrame:");

  if (-[ICDocCamRecropTransitionAnimator presenting](self, "presenting"))
    -[ICDocCamRecropTransitionAnimator performPushTransitionFromViewController:toViewController:transitionContext:](self, "performPushTransitionFromViewController:toViewController:transitionContext:", v6, v8, v5);
  else
    -[ICDocCamRecropTransitionAnimator performPopTransitionFromViewController:toViewController:transitionContext:](self, "performPopTransitionFromViewController:toViewController:transitionContext:", v6, v8, v5);

}

- (void)performPushTransitionFromViewController:(id)a3 toViewController:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  id v89;
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
  id v103;
  id v104;
  void *v105;
  double v106;
  uint64_t v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  double v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  _QWORD v145[4];
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  ICDocCamRecropTransitionAnimator *v152;
  id v153;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v142 = v10;
  objc_msgSend(v10, "finalFrameForViewController:", v9);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v9, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  objc_msgSend(v9, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNeedsLayout");

  objc_msgSend(v9, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutIfNeeded");

  objc_msgSend(v9, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 0;
  objc_msgSend(v25, "setOpacity:", v26);

  v27 = objc_opt_class();
  DCDynamicCast(v27, (uint64_t)v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_class();
  DCDynamicCast(v29, (uint64_t)v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "quadForOverlay");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamRecropTransitionAnimator indexPath](self, "indexPath");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "recropTargetForIndexPath:", v32);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v34, v36, v38, v40);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v34, v36, v38, v40);
  -[ICDocCamRecropTransitionAnimator setStartView:](self, "setStartView:", v42);
  -[ICDocCamRecropTransitionAnimator setQuadForOverlay:](self, "setQuadForOverlay:", v31);
  -[ICDocCamRecropTransitionAnimator scrollViewTransform:](self, "scrollViewTransform:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamRecropTransitionAnimator scrollViewTransform:](self, "scrollViewTransform:", 1);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamRecropTransitionAnimator imageMeshTransform:](self, "imageMeshTransform:", 0);
  v143 = objc_claimAutoreleasedReturnValue();
  -[ICDocCamRecropTransitionAnimator imageMeshTransform:](self, "imageMeshTransform:", 1);
  v44 = objc_claimAutoreleasedReturnValue();
  v140 = (void *)v44;
  if (v43 && v141 && v143 && v44)
  {
    objc_msgSend(v28, "placard");
    v134 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layer");
    v144 = v28;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = 0;
    objc_msgSend(v46, "setOpacity:", v47);

    objc_msgSend(v144, "scrollView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = 0;
    objc_msgSend(v49, "setOpacity:", v50);

    objc_msgSend(v144, "overlay");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v53) = 0;
    objc_msgSend(v52, "setOpacity:", v53);

    objc_msgSend(v41, "setContentMode:", 0);
    -[ICDocCamRecropTransitionAnimator unfilteredImage](self, "unfilteredImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setImage:", v54);

    objc_msgSend(v142, "containerView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addSubview:", v41);

    objc_msgSend(v42, "setContentMode:", 0);
    -[ICDocCamRecropTransitionAnimator filteredImage](self, "filteredImage");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setImage:", v56);

    objc_msgSend(v142, "containerView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addSubview:", v42);

    objc_msgSend(v30, "bottomToolbar");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "frame");
    v60 = v59;
    objc_msgSend(v58, "frame");
    v62 = v61;
    objc_msgSend(v58, "frame");
    v64 = v63;
    v133 = v58;
    objc_msgSend(v58, "frame");
    v66 = v65;
    objc_msgSend(v30, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "safeAreaInsets");
    v69 = v66 + v68;

    v70 = *MEMORY[0x24BDF7718];
    v71 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v72 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v73 = *(double *)(MEMORY[0x24BDF7718] + 24);
    objc_msgSend(v58, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v64, v69, *MEMORY[0x24BDF7718], v71, v72, v73);
    v138 = v8;
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v128 = v74;
    objc_msgSend(v74, "setFrame:", v60, v62, v64, v69);
    objc_msgSend(v142, "containerView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "addSubview:", v74);

    objc_msgSend(v144, "buttonContainer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "size");
    v78 = v77;
    objc_msgSend(v76, "size");
    v132 = v76;
    objc_msgSend(v76, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v78, v79, v70, v71, v72, v73);
    v136 = v31;
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "frame");
    objc_msgSend(v80, "setFrame:");
    objc_msgSend(v80, "setAccessibilityLabel:", CFSTR("Fake Button Container"));
    objc_msgSend(v142, "containerView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addSubview:", v80);

    objc_msgSend(v144, "buttonContainer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "layer");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v84) = 0;
    objc_msgSend(v83, "setOpacity:", v84);

    objc_msgSend(v80, "layer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v86) = 1.0;
    objc_msgSend(v85, "setOpacity:", v86);

    objc_msgSend(v42, "layer");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v88) = 1.0;
    objc_msgSend(v87, "setOpacity:", v88);

    v89 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v80, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "containerView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "bottomAnchor");
    v137 = v30;
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v92, 0.0);
    v139 = v41;
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "addObject:", v93);

    objc_msgSend(v80, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "containerView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v96, 0.0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "addObject:", v97);

    objc_msgSend(v80, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "containerView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:constant:", v100, 0.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v89;
    objc_msgSend(v89, "addObject:", v101);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v89);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v102 = (void *)MEMORY[0x24BDE57D8];
    v145[0] = MEMORY[0x24BDAC760];
    v145[1] = 3221225472;
    v145[2] = __111__ICDocCamRecropTransitionAnimator_performPushTransitionFromViewController_toViewController_transitionContext___block_invoke;
    v145[3] = &unk_24C5B8070;
    v146 = v142;
    v135 = v42;
    v103 = v42;
    v147 = v103;
    v104 = v139;
    v148 = v104;
    v149 = v128;
    v150 = v80;
    v151 = v144;
    v152 = self;
    v127 = v9;
    v153 = v127;
    v130 = v80;
    v129 = v128;
    objc_msgSend(v102, "setCompletionBlock:", v145);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("meshTransform"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setFromValue:", v143);
    objc_msgSend(v105, "setToValue:", v140);
    -[ICDocCamRecropTransitionAnimator duration](self, "duration");
    objc_msgSend(v105, "setDuration:", v106 + -0.2);
    v107 = *MEMORY[0x24BDE5970];
    objc_msgSend(v105, "setFillMode:", *MEMORY[0x24BDE5970]);
    objc_msgSend(v105, "setRemovedOnCompletion:", 0);
    LODWORD(v108) = 1051361018;
    LODWORD(v109) = 1045220557;
    LODWORD(v110) = 0;
    LODWORD(v111) = 1.0;
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v108, v110, v109, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setTimingFunction:", v112);

    objc_msgSend(v103, "layer");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "addAnimation:forKey:", v105, CFSTR("meshTransform"));

    objc_msgSend(v104, "layer");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "addAnimation:forKey:", v105, CFSTR("meshTransform"));

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setFromValue:", &unk_24C5D80D0);
    objc_msgSend(v115, "setToValue:", &unk_24C5D80B8);
    -[ICDocCamRecropTransitionAnimator duration](self, "duration");
    objc_msgSend(v115, "setDuration:", v116 + -0.2);
    LODWORD(v117) = 1.0;
    objc_msgSend(v115, "setRepeatCount:", v117);
    objc_msgSend(v115, "setRemovedOnCompletion:", 0);
    objc_msgSend(v115, "setFillMode:", v107);
    v118 = *MEMORY[0x24BDE5D20];
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setTimingFunction:", v119);

    objc_msgSend(v103, "layer");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "addAnimation:forKey:", v115, CFSTR("opacity"));

    v41 = v139;
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setFromValue:", &unk_24C5D80B8);
    objc_msgSend(v121, "setToValue:", &unk_24C5D80D0);
    objc_msgSend(v121, "setDuration:", 0.14);
    LODWORD(v122) = 1.0;
    objc_msgSend(v121, "setRepeatCount:", v122);
    objc_msgSend(v121, "setRemovedOnCompletion:", 0);
    objc_msgSend(v121, "setFillMode:", v107);
    v123 = (void *)v143;
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v118);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setTimingFunction:", v124);

    objc_msgSend(v127, "view");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "layer");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v134;
    objc_msgSend(v126, "addAnimation:forKey:", v121, CFSTR("opacity"));

    v8 = v138;
    v28 = v144;
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");

    v42 = v135;
    v30 = v137;

    v31 = v136;
  }
  else
  {
    -[ICDocCamRecropTransitionAnimator performSimpleFadeInFromViewController:toViewController:transitionContext:](self, "performSimpleFadeInFromViewController:toViewController:transitionContext:", v8, v9, v142);
    v123 = (void *)v143;
  }

}

void __111__ICDocCamRecropTransitionAnimator_performPushTransitionFromViewController_toViewController_transitionContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(id *);
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;

  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v2 = (void *)MEMORY[0x24BDE57D8];
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __111__ICDocCamRecropTransitionAnimator_performPushTransitionFromViewController_toViewController_transitionContext___block_invoke_2;
  v33 = &unk_24C5B8048;
  v34 = *(id *)(a1 + 40);
  v35 = *(id *)(a1 + 48);
  v36 = *(id *)(a1 + 56);
  v37 = *(id *)(a1 + 64);
  v3 = *(id *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  v38 = v3;
  v39 = v4;
  objc_msgSend(v2, "setCompletionBlock:", &v30);
  objc_msgSend(*(id *)(a1 + 64), "layer", v30, v31, v32, v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setOpacity:", v6);

  objc_msgSend(*(id *)(a1 + 72), "buttonContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1.0;
  objc_msgSend(v8, "setOpacity:", v9);

  objc_msgSend(*(id *)(a1 + 40), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  objc_msgSend(v10, "setOpacity:", v11);

  objc_msgSend(*(id *)(a1 + 88), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1.0;
  objc_msgSend(v13, "setOpacity:", v14);

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", &unk_24C5D80B8);
  objc_msgSend(v15, "setToValue:", &unk_24C5D80D0);
  objc_msgSend(v15, "setDuration:", 0.2);
  LODWORD(v16) = 1.0;
  objc_msgSend(v15, "setRepeatCount:", v16);
  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  v17 = *MEMORY[0x24BDE5970];
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x24BDE5970]);
  v18 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v19);

  objc_msgSend(*(id *)(a1 + 72), "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v15, CFSTR("opacity"));

  objc_msgSend(*(id *)(a1 + 72), "overlay");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAnimation:forKey:", v15, CFSTR("opacity"));

  objc_msgSend(*(id *)(a1 + 72), "placard");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAnimation:forKey:", v15, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFromValue:", &unk_24C5D80D0);
  objc_msgSend(v26, "setToValue:", &unk_24C5D80B8);
  objc_msgSend(v26, "setDuration:", 0.2);
  LODWORD(v27) = 1.0;
  objc_msgSend(v26, "setRepeatCount:", v27);
  objc_msgSend(v26, "setRemovedOnCompletion:", 0);
  objc_msgSend(v26, "setFillMode:", v17);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTimingFunction:", v28);

  objc_msgSend(*(id *)(a1 + 48), "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addAnimation:forKey:", v26, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __111__ICDocCamRecropTransitionAnimator_performPushTransitionFromViewController_toViewController_transitionContext___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void (**v9)(void);

  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "removeFromSuperview");
  objc_msgSend(a1[6], "removeFromSuperview");
  objc_msgSend(a1[7], "removeFromSuperview");
  objc_msgSend(a1[8], "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOpacity:", v4);

  objc_msgSend(a1[8], "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1.0;
  objc_msgSend(v6, "setOpacity:", v7);

  objc_msgSend(a1[9], "completion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1[9], "completion");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
}

- (void)performPopTransitionFromViewController:(id)a3 toViewController:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  id v82;
  double v83;
  double v84;
  void *v85;
  uint64_t v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
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
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  _QWORD v130[4];
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  ICDocCamRecropTransitionAnimator *v139;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  objc_msgSend(v9, "finalFrameForViewController:", v8);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v8, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  objc_msgSend(v8, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNeedsLayout");

  objc_msgSend(v8, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutIfNeeded");

  v24 = objc_opt_class();
  DCDynamicCast(v24, (uint64_t)v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_opt_class();
  DCDynamicCast(v26, (uint64_t)v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "updateFilterViewLayoutIfNeeded");
  objc_msgSend(v27, "resetImageCentering");
  -[ICDocCamRecropTransitionAnimator indexPath](self, "indexPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "recropTargetForIndexPath:", v28);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v30, v32, v34, v36);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v30, v32, v34, v36);
  objc_msgSend(v37, "setAccessibilityLabel:", CFSTR("unfilteredImageView"));
  objc_msgSend(v38, "setAccessibilityLabel:", CFSTR("filteredImageView"));
  -[ICDocCamRecropTransitionAnimator setStartView:](self, "setStartView:", v38);
  v125 = v25;
  objc_msgSend(v25, "finalQuadFromOverlay");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamRecropTransitionAnimator setQuadForOverlay:](self, "setQuadForOverlay:", v39);

  -[ICDocCamRecropTransitionAnimator imageMeshTransform:](self, "imageMeshTransform:", 1);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamRecropTransitionAnimator imageMeshTransform:](self, "imageMeshTransform:", 0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = 0;
  objc_msgSend(v41, "setOpacity:", v42);

  objc_msgSend(v38, "setContentMode:", 0);
  -[ICDocCamRecropTransitionAnimator filteredImage](self, "filteredImage");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setImage:", v43);

  objc_msgSend(v9, "containerView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addSubview:", v38);

  objc_msgSend(v37, "setContentMode:", 0);
  -[ICDocCamRecropTransitionAnimator unfilteredImage](self, "unfilteredImage");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setImage:", v45);

  objc_msgSend(v9, "containerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v37;
  objc_msgSend(v46, "addSubview:", v37);

  objc_msgSend(v27, "pageViewController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = 0;
  objc_msgSend(v49, "setOpacity:", v50);

  objc_msgSend(v27, "bottomToolbar");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "frame");
  v53 = v52;
  objc_msgSend(v51, "frame");
  v55 = v54;
  objc_msgSend(v51, "frame");
  v57 = v56;
  objc_msgSend(v51, "frame");
  v59 = v58;
  objc_msgSend(v27, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "safeAreaInsets");
  v62 = v59 + v61;

  v64 = *MEMORY[0x24BDF7718];
  v63 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v66 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v65 = *(double *)(MEMORY[0x24BDF7718] + 24);
  v124 = v51;
  objc_msgSend(v51, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v57, v62, *MEMORY[0x24BDF7718], v63, v66, v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v67, "setFrame:", v53, v55, v57, v62);
  objc_msgSend(v9, "containerView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addSubview:", v67);

  objc_msgSend(v27, "filterViewController");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v69;
  if (v69)
  {
    objc_msgSend(v69, "scrollView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bounds");
    objc_msgSend(v70, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setAccessibilityLabel:", CFSTR("fakeFilterScrollView"));
    objc_msgSend(v71, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v70, "frame");
    objc_msgSend(v71, "setFrame:");
    objc_msgSend(v71, "setHidden:", objc_msgSend(v70, "isHidden"));
    v72 = v9;
    objc_msgSend(v9, "containerView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addSubview:", v71);
    v74 = 0;
  }
  else
  {
    objc_msgSend(v27, "topToolbar");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "size");
    v76 = v75;
    objc_msgSend(v70, "size");
    objc_msgSend(v70, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v76, v77, v64, v63, v66, v65);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v70, "frame");
    objc_msgSend(v74, "setFrame:");
    v72 = v9;
    objc_msgSend(v9, "containerView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addSubview:", v74);
    v71 = 0;
  }

  objc_msgSend(v8, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "layer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v80) = 0;
  objc_msgSend(v79, "setOpacity:", v80);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v81 = (void *)MEMORY[0x24BDE57D8];
  v130[0] = MEMORY[0x24BDAC760];
  v130[1] = 3221225472;
  v130[2] = __110__ICDocCamRecropTransitionAnimator_performPopTransitionFromViewController_toViewController_transitionContext___block_invoke;
  v130[3] = &unk_24C5B8098;
  v131 = v72;
  v132 = v27;
  v133 = v8;
  v134 = v38;
  v135 = v126;
  v136 = v67;
  v137 = v74;
  v138 = v71;
  v139 = self;
  v122 = v71;
  v121 = v74;
  v120 = v67;
  v82 = v126;
  v117 = v38;
  v127 = v8;
  v119 = v27;
  v118 = v72;
  objc_msgSend(v81, "setCompletionBlock:", v130);
  -[ICDocCamRecropTransitionAnimator duration](self, "duration");
  v84 = v83 + -0.2;
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("meshTransform"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setFromValue:", v129);
  objc_msgSend(v85, "setToValue:", v128);
  objc_msgSend(v85, "setDuration:", v84);
  v86 = *MEMORY[0x24BDE5970];
  objc_msgSend(v85, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v85, "setRemovedOnCompletion:", 0);
  LODWORD(v87) = 1051361018;
  LODWORD(v88) = 1045220557;
  LODWORD(v89) = 0;
  LODWORD(v90) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v87, v89, v88, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setTimingFunction:", v91);

  objc_msgSend(v117, "layer");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addAnimation:forKey:", v85, CFSTR("meshTransform"));

  v93 = v82;
  v116 = v82;
  objc_msgSend(v82, "layer");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "addAnimation:forKey:", v85, CFSTR("meshTransform"));

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setFromValue:", &unk_24C5D80D0);
  objc_msgSend(v95, "setToValue:", &unk_24C5D80B8);
  objc_msgSend(v95, "setDuration:", v84);
  LODWORD(v96) = 1.0;
  objc_msgSend(v95, "setRepeatCount:", v96);
  objc_msgSend(v95, "setRemovedOnCompletion:", 0);
  objc_msgSend(v95, "setFillMode:", v86);
  v97 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setTimingFunction:", v98);

  objc_msgSend(v93, "layer");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "addAnimation:forKey:", v95, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setFromValue:", &unk_24C5D80B8);
  objc_msgSend(v100, "setToValue:", &unk_24C5D80D0);
  objc_msgSend(v100, "setDuration:", 0.14);
  LODWORD(v101) = 1.0;
  objc_msgSend(v100, "setRepeatCount:", v101);
  objc_msgSend(v100, "setRemovedOnCompletion:", 0);
  objc_msgSend(v100, "setFillMode:", v86);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v97);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setTimingFunction:", v102);

  objc_msgSend(v127, "view");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "layer");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "addAnimation:forKey:", v100, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setFromValue:", &unk_24C5D80D0);
  objc_msgSend(v105, "setToValue:", &unk_24C5D80B8);
  objc_msgSend(v105, "setDuration:", 0.14);
  LODWORD(v106) = 1.0;
  objc_msgSend(v105, "setRepeatCount:", v106);
  objc_msgSend(v105, "setRemovedOnCompletion:", 0);
  objc_msgSend(v105, "setFillMode:", v86);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v97);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setTimingFunction:", v107);

  objc_msgSend(v125, "overlay");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "layer");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "addAnimation:forKey:", v105, CFSTR("opacity"));

  objc_msgSend(v125, "placard");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "layer");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addAnimation:forKey:", v105, CFSTR("opacity"));

  objc_msgSend(v125, "backgroundImageView");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "layer");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "addAnimation:forKey:", v105, CFSTR("opacity"));

  objc_msgSend(v125, "imageView");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "layer");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "addAnimation:forKey:", v105, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __110__ICDocCamRecropTransitionAnimator_performPopTransitionFromViewController_toViewController_transitionContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;

  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  objc_msgSend(*(id *)(a1 + 40), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, "setOpacity:", v5);

  objc_msgSend(*(id *)(a1 + 48), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1.0;
  objc_msgSend(v7, "setOpacity:", v8);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v9 = (void *)MEMORY[0x24BDE57D8];
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __110__ICDocCamRecropTransitionAnimator_performPopTransitionFromViewController_toViewController_transitionContext___block_invoke_2;
  v21 = &unk_24C5B8048;
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 64);
  v24 = *(id *)(a1 + 72);
  v25 = *(id *)(a1 + 80);
  v10 = *(id *)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 96);
  v26 = v10;
  v27 = v11;
  objc_msgSend(v9, "setCompletionBlock:", &v18);
  objc_msgSend(*(id *)(a1 + 56), "layer", v18, v19, v20, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 0;
  objc_msgSend(v12, "setOpacity:", v13);

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFromValue:", &unk_24C5D80D0);
  objc_msgSend(v14, "setToValue:", &unk_24C5D80B8);
  objc_msgSend(v14, "setDuration:", 0.2);
  LODWORD(v15) = 1.0;
  objc_msgSend(v14, "setRepeatCount:", v15);
  objc_msgSend(v14, "setRemovedOnCompletion:", 0);
  objc_msgSend(v14, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimingFunction:", v16);

  objc_msgSend(*(id *)(a1 + 56), "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v14, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __110__ICDocCamRecropTransitionAnimator_performPopTransitionFromViewController_toViewController_transitionContext___block_invoke_2(id *a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "removeFromSuperview");
  objc_msgSend(a1[6], "removeFromSuperview");
  objc_msgSend(a1[7], "removeFromSuperview");
  objc_msgSend(a1[8], "removeFromSuperview");
  objc_msgSend(a1[9], "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1[9], "completion");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)performSimpleFadeInFromViewController:(id)a3 toViewController:(id)a4 transitionContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  ICDocCamRecropTransitionAnimator *v23;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  objc_msgSend(v10, "setOpacity:", v11);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v12 = (void *)MEMORY[0x24BDE57D8];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __109__ICDocCamRecropTransitionAnimator_performSimpleFadeInFromViewController_toViewController_transitionContext___block_invoke;
  v20[3] = &unk_24C5B80C0;
  v21 = v8;
  v22 = v7;
  v23 = self;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v12, "setCompletionBlock:", v20);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", &unk_24C5D80B8);
  objc_msgSend(v15, "setToValue:", &unk_24C5D80D0);
  -[ICDocCamRecropTransitionAnimator transitionDuration:](self, "transitionDuration:", v14);
  objc_msgSend(v15, "setDuration:");
  LODWORD(v16) = 1.0;
  objc_msgSend(v15, "setRepeatCount:", v16);
  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v17);

  objc_msgSend(v13, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v15, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __109__ICDocCamRecropTransitionAnimator_performSimpleFadeInFromViewController_toViewController_transitionContext___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void (**v6)(void);

  objc_msgSend(a1[4], "completeTransition:", objc_msgSend(a1[4], "transitionWasCancelled") ^ 1);
  objc_msgSend(a1[5], "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOpacity:", v4);

  objc_msgSend(a1[6], "completion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1[6], "completion");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (id)imageMeshTransform:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  id v75;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE5710], "meshTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    -[ICDocCamRecropTransitionAnimator startView](self, "startView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v86 = 0uLL;
    if (-[ICDocCamRecropTransitionAnimator orientation](self, "orientation"))
    {
      if (-[ICDocCamRecropTransitionAnimator orientation](self, "orientation") == 2)
      {
        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "topRight");
        v18 = v17;
        v20 = v19;

        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bottomRight");
        v81 = v23;
        v82 = v22;

        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "topLeft");
        v79 = v26;
        v80 = v25;

        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bottomLeft");
      }
      else if (-[ICDocCamRecropTransitionAnimator orientation](self, "orientation") == 3)
      {
        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "bottomLeft");
        v18 = v45;
        v20 = v46;

        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "topLeft");
        v81 = v49;
        v82 = v48;

        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "bottomRight");
        v79 = v52;
        v80 = v51;

        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "topRight");
      }
      else
      {
        if (-[ICDocCamRecropTransitionAnimator orientation](self, "orientation") != 1)
        {
          v75 = 0;
          goto LABEL_13;
        }
        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "bottomRight");
        v18 = v54;
        v20 = v55;

        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "bottomLeft");
        v81 = v58;
        v82 = v57;

        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "topRight");
        v79 = v61;
        v80 = v60;

        -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "topLeft");
      }
    }
    else
    {
      -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "topLeft");
      v18 = v36;
      v20 = v37;

      -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "topRight");
      v81 = v40;
      v82 = v39;

      -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "bottomLeft");
      v79 = v43;
      v80 = v42;

      -[ICDocCamRecropTransitionAnimator quadForOverlay](self, "quadForOverlay");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bottomRight");
    }
    v77 = v29;
    v78 = v28;
    v62 = v9 + v13;
    v63 = v11 + v15;

    v64 = (v18 - v9) / v13 + 0.0;
    v65 = (v20 - v11) / v15 + 0.0;
    v66 = (v81 - v11) / v15;
    v67 = v15;
    v68 = (v82 - (v9 + v13)) / v13 + 1.0;
    v69 = v13;
    v70 = v66 + 0.0;
    v71 = (v80 - v9) / v69 + 0.0;
    v72 = (v78 - v62) / v69 + 1.0;
    v83 = xmmword_20CF1B180;
    v73 = (v77 - v63) / v67 + 1.0;
    *(double *)&v84 = v71;
    *((double *)&v84 + 1) = (v79 - v63) / v67 + 1.0;
    v85 = 0;
    objc_msgSend(v6, "addVertex:", &v83);
    __asm { FMOV            V0.2D, #1.0 }
    v83 = _Q0;
    *(double *)&v84 = v72;
    *((double *)&v84 + 1) = v73;
    v85 = 0;
    objc_msgSend(v6, "addVertex:", &v83);
    v83 = xmmword_20CF1B190;
    *(double *)&v84 = v68;
    *((double *)&v84 + 1) = v70;
    v85 = 0;
    objc_msgSend(v6, "addVertex:", &v83);
    v83 = v86;
    *(double *)&v84 = v64;
    *((double *)&v84 + 1) = v65;
    v85 = 0;
  }
  else
  {
    v83 = xmmword_20CF1B180;
    v84 = xmmword_20CF1B180;
    v85 = 0;
    objc_msgSend(v5, "addVertex:", &v83);
    __asm { FMOV            V0.2D, #1.0 }
    v83 = _Q0;
    v84 = _Q0;
    v85 = 0;
    objc_msgSend(v6, "addVertex:", &v83);
    v83 = xmmword_20CF1B190;
    v85 = 0;
    v84 = 0x3FF0000000000000uLL;
    objc_msgSend(v6, "addVertex:", &v83);
    v85 = 0;
    v83 = 0u;
    v84 = 0u;
  }
  objc_msgSend(v6, "addVertex:", &v83, *(_QWORD *)&v77, *(_QWORD *)&v78);
  v84 = 0uLL;
  v83 = xmmword_20CF1B1A0;
  objc_msgSend(v6, "addFace:", &v83);
  objc_msgSend(v6, "setSubdivisionSteps:", 0);
  v75 = v6;
LABEL_13:

  return v75;
}

- (id)scrollViewTransform:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  double MinX;
  double MaxY;
  double MaxX;
  double v18;
  double v19;
  double MinY;
  double v21;
  CGFloat v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  int32x4_t v30;
  int32x4_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v35;
  float64x2_t v36;
  id v37;
  int32x4_t v39;
  float32x4_t v40;
  __int128 v41;
  float32x4_t v42;
  float64x2_t v43;
  float32x4_t v44;
  int32x4_t v45;
  CGFloat rect;
  float64x2_t recta;
  float64_t x;
  float64x2_t v49;
  float64_t y;
  CGFloat width;
  float64x2_t v52;
  char v53;
  __int128 v54;
  float64x2_t v55;
  uint64_t v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE5710], "meshTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    v54 = xmmword_20CF1B180;
    v55 = (float64x2_t)xmmword_20CF1B180;
    v56 = 0;
    objc_msgSend(v5, "addVertex:", &v54);
    __asm { FMOV            V0.2D, #1.0 }
    v54 = _Q0;
    v55 = (float64x2_t)_Q0;
    v56 = 0;
    objc_msgSend(v6, "addVertex:", &v54);
    v54 = xmmword_20CF1B190;
    v56 = 0;
    v55 = (float64x2_t)0x3FF0000000000000uLL;
    objc_msgSend(v6, "addVertex:", &v54);
    v56 = 0;
    v54 = 0u;
    v55 = 0u;
  }
  else
  {
    v53 = 0;
    -[ICDocCamRecropTransitionAnimator matrixTransformingQuadForOverlayToImageView:](self, "matrixTransformingQuadForOverlayToImageView:", &v53);
    if (!v53)
    {
      v37 = 0;
      goto LABEL_7;
    }
    v42 = v13;
    v44 = v14;
    v40 = v12;
    -[ICDocCamRecropTransitionAnimator containerViewFrame](self, "containerViewFrame");
    x = v57.origin.x;
    y = v57.origin.y;
    width = v57.size.width;
    rect = v57.size.height;
    MinX = CGRectGetMinX(v57);
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = rect;
    MaxY = CGRectGetMaxY(v58);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = rect;
    MaxX = CGRectGetMaxX(v59);
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = rect;
    v18 = CGRectGetMaxY(v60);
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = rect;
    v19 = CGRectGetMaxX(v61);
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = rect;
    MinY = CGRectGetMinY(v62);
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = rect;
    v21 = CGRectGetMinX(v63);
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = rect;
    v22 = CGRectGetMinY(v64);
    v23 = MinX;
    v24 = MaxY;
    v25 = MaxX;
    v26 = v18;
    v27 = v19;
    v28 = MinY;
    v29 = v21;
    *(float *)&v22 = v22;
    v30 = (int32x4_t)vaddq_f32(v44, vmlaq_n_f32(vmulq_n_f32(v40, v23), v42, v24));
    v31 = (int32x4_t)vaddq_f32(v44, vmlaq_n_f32(vmulq_n_f32(v40, v25), v42, v26));
    v39 = (int32x4_t)vaddq_f32(v44, vmlaq_n_f32(vmulq_n_f32(v40, v27), v42, v28));
    v45 = (int32x4_t)vaddq_f32(v44, vmlaq_n_f32(vmulq_n_f32(v40, v29), v42, *(float *)&v22));
    v32.f64[0] = width;
    v32.f64[1] = rect;
    v56 = 0;
    v33.f64[0] = x;
    v33.f64[1] = y;
    recta = v33;
    v52 = v32;
    __asm { FMOV            V7.2D, #1.0 }
    v41 = (__int128)_Q7;
    v43 = vaddq_f64(v33, v32);
    v35.f64[1] = v43.f64[1];
    v35.f64[0] = x;
    v49 = vaddq_f64(vdivq_f64(vsubq_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v31.i8, (float32x2_t)vdup_laneq_s32(v31, 2))), v43), v32), _Q7);
    v54 = xmmword_20CF1B180;
    v55 = vaddq_f64(vdivq_f64(vsubq_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v30.i8, (float32x2_t)vdup_laneq_s32(v30, 2))), v35), v32), (float64x2_t)xmmword_20CF1B180);
    objc_msgSend(v6, "addVertex:", &v54);
    v54 = v41;
    v55 = v49;
    v56 = 0;
    objc_msgSend(v6, "addVertex:", &v54);
    v36.f64[0] = v43.f64[0];
    v36.f64[1] = y;
    v54 = xmmword_20CF1B190;
    v55 = vaddq_f64(vdivq_f64(vsubq_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v39.i8, (float32x2_t)vdup_laneq_s32(v39, 2))), v36), v52), (float64x2_t)xmmword_20CF1B190);
    v56 = 0;
    objc_msgSend(v6, "addVertex:", &v54);
    v54 = 0uLL;
    v55 = vaddq_f64(vdivq_f64(vsubq_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v45.i8, (float32x2_t)vdup_laneq_s32(v45, 2))), recta), v52), (float64x2_t)0);
    v56 = 0;
  }
  objc_msgSend(v6, "addVertex:", &v54);
  v55 = 0uLL;
  v54 = xmmword_20CF1B1A0;
  objc_msgSend(v6, "addFace:", &v54);
  objc_msgSend(v6, "setSubdivisionSteps:", 0);
  v37 = v6;
LABEL_7:

  return v37;
}

- (uint64_t)matrixTransformingQuadForOverlayToImageView:(_BYTE *)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t result;
  simd_float3x3 v35;
  float32x4_t v36;
  CGFloat v37;
  double v38;
  double v39;
  double MinY;
  double v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  uint64_t v45;
  double MaxX;
  double MaxY;
  double MinX;
  simd_float3 v49;
  simd_float3 v50;
  simd_float3 v51;
  _OWORD v52[3];
  _OWORD v53[3];
  double v54[8];
  _QWORD v55[10];
  simd_float3x3 v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v55[8] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "startView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(a1, "quadForOverlay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topLeft");
  v16 = v15;
  objc_msgSend(a1, "quadForOverlay");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topLeft");
  v55[0] = v16;
  v55[1] = v18;
  objc_msgSend(a1, "quadForOverlay");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topRight");
  v21 = v20;
  objc_msgSend(a1, "quadForOverlay");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topRight");
  v55[2] = v21;
  v55[3] = v23;
  objc_msgSend(a1, "quadForOverlay");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomRight");
  v26 = v25;
  objc_msgSend(a1, "quadForOverlay");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomRight");
  v55[4] = v26;
  v55[5] = v28;
  objc_msgSend(a1, "quadForOverlay");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomLeft");
  v31 = v30;
  objc_msgSend(a1, "quadForOverlay");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomLeft");
  v55[6] = v31;
  v55[7] = v33;

  objc_msgSend(a1, "sortPoints:sorted:", v55, v54);
  result = objc_msgSend(a1, "matrixTransformingToUnitSquareWithPoints:y0:x1:y1:x2:y2:x3:y3:", v54[0], v54[1], v54[2], v54[3], v54[4], v54[5], v54[6], v54[7]);
  v36 = vmulq_f32((float32x4_t)v35.columns[0], vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v35.columns[2], (int8x16_t)v35.columns[2], 0xCuLL), (int8x16_t)v35.columns[2], 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35.columns[1], (int32x4_t)v35.columns[1]), (int8x16_t)v35.columns[1], 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35.columns[2], (int32x4_t)v35.columns[2]), (int8x16_t)v35.columns[2], 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v35.columns[1], (int8x16_t)v35.columns[1], 0xCuLL), (int8x16_t)v35.columns[1], 8uLL)));
  if (fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).f32[0]) >= 0.01)
  {
    v56 = __invert_f3(v35);
    v50 = v56.columns[1];
    v51 = v56.columns[0];
    v49 = v56.columns[2];
    *(CGFloat *)v56.columns[0].i64 = v7;
    *(CGFloat *)v56.columns[1].i64 = v9;
    *(CGFloat *)v56.columns[2].i64 = v11;
    v37 = v13;
    MinX = CGRectGetMinX(*(CGRect *)v56.columns[0].f32);
    v57.origin.x = v7;
    v57.origin.y = v9;
    v57.size.width = v11;
    v57.size.height = v13;
    MaxY = CGRectGetMaxY(v57);
    v58.origin.x = v7;
    v58.origin.y = v9;
    v58.size.width = v11;
    v58.size.height = v13;
    MaxX = CGRectGetMaxX(v58);
    v59.origin.x = v7;
    v59.origin.y = v9;
    v59.size.width = v11;
    v59.size.height = v13;
    v38 = CGRectGetMaxY(v59);
    v60.origin.x = v7;
    v60.origin.y = v9;
    v60.size.width = v11;
    v60.size.height = v13;
    v39 = CGRectGetMaxX(v60);
    v61.origin.x = v7;
    v61.origin.y = v9;
    v61.size.width = v11;
    v61.size.height = v13;
    MinY = CGRectGetMinY(v61);
    v62.origin.x = v7;
    v62.origin.y = v9;
    v62.size.width = v11;
    v62.size.height = v13;
    v41 = CGRectGetMinX(v62);
    v63.origin.x = v7;
    v63.origin.y = v9;
    v63.size.width = v11;
    v63.size.height = v13;
    result = objc_msgSend(a1, "matrixTransformingToUnitSquareWithPoints:y0:x1:y1:x2:y2:x3:y3:", MinX, MaxY, MaxX, v38, v39, MinY, v41, CGRectGetMinY(v63));
    v45 = 0;
    v52[0] = v51;
    v52[1] = v50;
    v52[2] = v49;
    memset(v53, 0, sizeof(v53));
    do
    {
      v53[v45] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, COERCE_FLOAT(v52[v45])), v43, *(float32x2_t *)&v52[v45], 1), v44, (float32x4_t)v52[v45], 2);
      ++v45;
    }
    while (v45 != 3);
    *a3 = 1;
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

- (void)sortPoints:(CGPoint *)a3 sorted:(CGPoint *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  _BOOL8 v25;
  uint64_t v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  _QWORD v53[5];

  v53[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a3->x, a3->y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v6;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a3[1].x, a3[1].y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v7;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a3[2].x, a3[2].y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a3[3].x, a3[3].y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CGPointValue");
  v14 = v13;

  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CGPointValue");
  v17 = v16;

  v18 = 2;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "CGPointValue");
  v21 = v20;

  objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "CGPointValue");
  v24 = v23;

  v25 = v14 < v17;
  if (v24 >= v21)
    v26 = 2;
  else
    v26 = 3;
  if (v24 >= v21)
    v18 = 3;
  objc_msgSend(v11, "objectAtIndexedSubscript:", v14 >= v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "CGPointValue");
  v29 = v28;
  v31 = v30;

  objc_msgSend(v11, "objectAtIndexedSubscript:", v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "CGPointValue");
  v34 = v33;
  v36 = v35;

  objc_msgSend(v11, "objectAtIndexedSubscript:", v18);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "CGPointValue");
  v39 = v38;
  v41 = v40;

  objc_msgSend(v11, "objectAtIndexedSubscript:", v25);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "CGPointValue");
  v44 = v43;
  v46 = v45;

  if (v41 < v31 && v39 < v34)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v18);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "CGPointValue");
    v34 = v48;
    v36 = v49;

    objc_msgSend(v11, "objectAtIndexedSubscript:", v26);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "CGPointValue");
    v39 = v51;
    v41 = v52;

  }
  a4->x = v44;
  a4->y = v46;
  a4[1].x = v39;
  a4[1].y = v41;
  a4[2].x = v34;
  a4[2].y = v36;
  a4[3].x = v29;
  a4[3].y = v31;

}

uint64_t __54__ICDocCamRecropTransitionAnimator_sortPoints_sorted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "CGPointValue");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "CGPointValue");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (double)matrixTransformingToUnitSquareWithPoints:(double)a1 y0:(double)a2 x1:(double)a3 y1:(double)a4 x2:(double)a5 y2:(double)a6 x3:(double)a7 y3:(double)a8
{
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  double v19;
  float v20;

  v8 = a1 - a3 + a5 - a7;
  v9 = a2 - a4 + a6 - a8;
  if (v8 == 0.0 && v9 == 0.0)
  {
    v10 = a3 - a1;
    v11 = a4 - a2;
  }
  else
  {
    v12 = v8;
    v13 = v9;
    v14 = a7 - a5;
    v15 = a8 - a6;
    v16 = a3 - a5;
    v17 = a4 - a6;
    v18 = (float)((float)((float)(v12 * v15) - (float)(v13 * v14)) / (float)((float)(v16 * v15) - (float)(v17 * v14)));
    v10 = a3 - a1 + v18 * a3;
    v11 = a4 - a2 + v18 * a4;
  }
  *(float *)&v19 = v10;
  v20 = v11;
  *((float *)&v19 + 1) = v20;
  __asm { FMOV            V2.4S, #1.0 }
  return v19;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (UIImage)filteredImage
{
  return self->_filteredImage;
}

- (void)setFilteredImage:(id)a3
{
  objc_storeStrong((id *)&self->_filteredImage, a3);
}

- (UIImage)unfilteredImage
{
  return self->_unfilteredImage;
}

- (void)setUnfilteredImage:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredImage, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (CGRect)containerViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerViewFrame.origin.x;
  y = self->_containerViewFrame.origin.y;
  width = self->_containerViewFrame.size.width;
  height = self->_containerViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainerViewFrame:(CGRect)a3
{
  self->_containerViewFrame = a3;
}

- (UIView)startView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_startView);
}

- (void)setStartView:(id)a3
{
  objc_storeWeak((id *)&self->_startView, a3);
}

- (ICDocCamImageQuad)quadForOverlay
{
  return self->_quadForOverlay;
}

- (void)setQuadForOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_quadForOverlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadForOverlay, 0);
  objc_destroyWeak((id *)&self->_startView);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_unfilteredImage, 0);
  objc_storeStrong((id *)&self->_filteredImage, 0);
}

@end
