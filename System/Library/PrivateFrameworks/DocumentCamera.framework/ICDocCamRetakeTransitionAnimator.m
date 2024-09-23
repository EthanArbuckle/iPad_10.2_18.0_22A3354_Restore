@implementation ICDocCamRetakeTransitionAnimator

- (ICDocCamRetakeTransitionAnimator)initWithImage:(id)a3 indexPath:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  ICDocCamRetakeTransitionAnimator *v14;
  ICDocCamRetakeTransitionAnimator *v15;
  uint64_t v16;
  id completion;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICDocCamRetakeTransitionAnimator;
  v14 = -[ICDocCamRetakeTransitionAnimator init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_retakeImage, a3);
    objc_storeStrong((id *)&v15->_indexPath, a4);
    v15->_duration = a5;
    v16 = MEMORY[0x212B988FC](v13);
    completion = v15->_completion;
    v15->_completion = (id)v16;

  }
  return v15;
}

- (id)makeUIImageFromCIImage:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CGImage *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBF648];
  v11 = *MEMORY[0x24BDBF818];
  v12[0] = MEMORY[0x24BDBD1C0];
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "extent");
  v8 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:", v5);

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v8);

  return v9;
}

- (void)animateTransition:(id)a3
{
  id v4;
  NSObject *v5;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  double x;
  double y;
  double width;
  double height;
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
  double v49;
  double v50;
  void *v51;
  char v52;
  void *v53;
  double v54;
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
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  double v113;
  void *v114;
  void *v115;
  double v116;
  void *v117;
  void *v118;
  double v119;
  void *v120;
  double v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  void *v134;
  void *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  void *v139;
  void *v140;
  double v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  void *v152;
  uint64_t v153;
  id v154;
  ICDocCamRetakeTransitionAnimator *v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  CATransform3D v164;
  CATransform3D v165;
  _QWORD v166[4];
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  ICDocCamRetakeTransitionAnimator *v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t (*v177)(uint64_t, uint64_t);
  void (*v178)(uint64_t);
  id v179;
  _QWORD v180[2];
  _QWORD v181[3];
  void *v182;
  void *v183;
  _QWORD v184[2];
  _QWORD v185[5];
  CGRect v186;
  CGRect v187;

  v185[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v155 = self;
  if (-[ICDocCamRetakeTransitionAnimator presenting](self, "presenting"))
  {
    v5 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICDocCamRetakeTransitionAnimator animateTransition:].cold.1(v5);

  }
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F90]);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSubview:belowSubview:", v7, v8);

  objc_msgSend(v159, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v160, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  objc_msgSend(v160, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNeedsLayout");

  objc_msgSend(v160, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutIfNeeded");

  v21 = objc_opt_class();
  DCDynamicCast(v21, (uint64_t)v159);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamRetakeTransitionAnimator indexPath](v155, "indexPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "zoomTargetForIndexPath:", v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = objc_msgSend(v31, "_graphicsQuality");

  -[ICDocCamRetakeTransitionAnimator retakeImage](v155, "retakeImage");
  v154 = (id)objc_claimAutoreleasedReturnValue();
  if (v153 != 100)
  {
    v32 = objc_alloc(MEMORY[0x24BDBF660]);
    v33 = objc_retainAutorelease(v154);
    v34 = (void *)objc_msgSend(v32, "initWithCGImage:", objc_msgSend(v33, "CGImage"));
    objc_msgSend(v34, "extent");
    v187 = CGRectIntegral(v186);
    x = v187.origin.x;
    y = v187.origin.y;
    width = v187.size.width;
    height = v187.size.height;
    objc_msgSend(v34, "imageByCroppingToRect:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "imageByClampingToExtent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "extent");
    objc_msgSend(v40, "imageBySettingAlphaOneInExtent:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = (void *)MEMORY[0x24BDBF658];
    v184[0] = *MEMORY[0x24BDBF960];
    v184[1] = CFSTR("inputRadius");
    v185[0] = v41;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 40.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v185[1] = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v185, v184, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "filterWithName:withInputParameters:", CFSTR("CIGaussianBlur"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "outputImage");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "imageByCroppingToRect:", x, y, width, height);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamRetakeTransitionAnimator makeUIImageFromCIImage:](v155, "makeUIImageFromCIImage:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "size");
    v50 = v49;
    objc_msgSend(v33, "size");
    objc_msgSend(v48, "dc_scaledImageWithSize:scale:", v50);
    v154 = (id)objc_claimAutoreleasedReturnValue();

  }
  v174 = 0;
  v175 = &v174;
  v176 = 0x3032000000;
  v177 = __Block_byref_object_copy__9;
  v178 = __Block_byref_object_dispose__9;
  v179 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v24, v26, v28, v30);
  objc_msgSend((id)v175[5], "setContentMode:", 2);
  objc_msgSend((id)v175[5], "setImage:", v154);
  objc_msgSend((id)v175[5], "setClipsToBounds:", 1);
  objc_msgSend(v4, "containerView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addSubview:", v175[5]);

  objc_msgSend(v4, "containerView");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v52 = objc_msgSend(v162, "statusBarWasHiddenWhenDoneTapped");
  if ((v52 & 1) != 0)
  {
    v53 = 0;
    v54 = 0.0;
  }
  else
  {
    objc_msgSend(v162, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "window");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "windowScene");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "statusBarManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "statusBarFrame");
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v54 = v65;

    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v60, v62, v64, v54);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setBackgroundColor:", v66);

    objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "containerView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addSubview:", v53);

    objc_msgSend(v53, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, 0.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "addObject:", v70);

    objc_msgSend(v53, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, 0.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "addObject:", v73);

    objc_msgSend(v53, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 0.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "addObject:", v76);

    objc_msgSend(v53, "heightAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToConstant:", v54);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "addObject:", v78);

  }
  objc_msgSend(v162, "navigationItem");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "navigationBar");
  v161 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v161, "size");
  v81 = v80;
  objc_msgSend(v161, "size");
  v82 = *MEMORY[0x24BDF7718];
  v83 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v84 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v85 = *(double *)(MEMORY[0x24BDF7718] + 24);
  objc_msgSend(v161, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v81, v86, *MEMORY[0x24BDF7718], v83, v84, v85);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v161, "size");
  v89 = v88;
  objc_msgSend(v161, "size");
  objc_msgSend(v87, "setFrame:", 0.0, v54, v89, v90);
  objc_msgSend(v4, "containerView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "addSubview:", v87);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v158);
  objc_msgSend(v162, "bottomToolbar");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "size");
  v93 = v92;
  objc_msgSend(v157, "size");
  objc_msgSend(v157, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v93, v94, v82, v83, v84, v85);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v157, "frame");
  objc_msgSend(v95, "setFrame:");
  objc_msgSend(v4, "containerView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "addSubview:", v95);

  objc_msgSend(v162, "pageViewController");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "view");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setHidden:", 1);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v99 = (void *)MEMORY[0x24BDE57D8];
  v166[0] = MEMORY[0x24BDAC760];
  v166[1] = 3221225472;
  v166[2] = __54__ICDocCamRetakeTransitionAnimator_animateTransition___block_invoke;
  v166[3] = &unk_24C5B9178;
  v147 = v4;
  v167 = v147;
  v173 = &v174;
  v150 = v95;
  v168 = v150;
  v148 = v53;
  v169 = v148;
  v149 = v87;
  v170 = v149;
  v151 = v162;
  v171 = v151;
  v172 = v155;
  objc_msgSend(v99, "setCompletionBlock:", v166);
  LODWORD(v100) = 1051361018;
  LODWORD(v101) = 1045220557;
  LODWORD(v102) = 0;
  LODWORD(v103) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v100, v102, v101, v103);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setFromValue:", &unk_24C5D8358);
  objc_msgSend(v104, "setToValue:", &unk_24C5D8370);
  objc_msgSend(v104, "setDuration:", 0.12);
  LODWORD(v105) = 1.0;
  objc_msgSend(v104, "setRepeatCount:", v105);
  objc_msgSend(v104, "setRemovedOnCompletion:", 0);
  v106 = *MEMORY[0x24BDE5970];
  objc_msgSend(v104, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v104, "setTimingFunction:", v163);
  objc_msgSend(v151, "view");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "layer");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "addAnimation:forKey:", v104, CFSTR("opacity"));
  v156 = v104;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setFromValue:", &unk_24C5D8358);
  objc_msgSend(v109, "setToValue:", &unk_24C5D8370);
  objc_msgSend(v109, "setDuration:", 0.12);
  LODWORD(v110) = 1.0;
  objc_msgSend(v109, "setRepeatCount:", v110);
  objc_msgSend(v109, "setRemovedOnCompletion:", 0);
  objc_msgSend(v109, "setFillMode:", v106);
  objc_msgSend(v109, "setTimingFunction:", v163);
  objc_msgSend(v150, "layer");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addAnimation:forKey:", v109, CFSTR("opacity"));

  if ((v52 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setFromValue:", &unk_24C5D8358);
    objc_msgSend(v112, "setToValue:", &unk_24C5D8370);
    objc_msgSend(v112, "setDuration:", 0.12);
    LODWORD(v113) = 1.0;
    objc_msgSend(v112, "setRepeatCount:", v113);
    objc_msgSend(v112, "setRemovedOnCompletion:", 0);
    objc_msgSend(v112, "setFillMode:", v106);
    objc_msgSend(v112, "setTimingFunction:", v163);
    objc_msgSend(v148, "layer");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "addAnimation:forKey:", v112, CFSTR("opacity"));

  }
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setFromValue:", &unk_24C5D8358);
  objc_msgSend(v115, "setToValue:", &unk_24C5D8370);
  objc_msgSend(v115, "setDuration:", 0.12);
  LODWORD(v116) = 1.0;
  objc_msgSend(v115, "setRepeatCount:", v116);
  objc_msgSend(v115, "setRemovedOnCompletion:", 0);
  objc_msgSend(v115, "setFillMode:", v106);
  objc_msgSend(v115, "setTimingFunction:", v163);
  objc_msgSend(v149, "layer");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "addAnimation:forKey:", v115, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setFromValue:", &unk_24C5D8358);
  objc_msgSend(v118, "setToValue:", &unk_24C5D8060);
  objc_msgSend(v118, "setDuration:", 0.28);
  LODWORD(v119) = 1.0;
  objc_msgSend(v118, "setRepeatCount:", v119);
  objc_msgSend(v118, "setRemovedOnCompletion:", 0);
  objc_msgSend(v118, "setFillMode:", v106);
  objc_msgSend(v118, "setTimingFunction:", v163);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setBeginTime:", 0.08);
  objc_msgSend(v120, "setFromValue:", &unk_24C5D8358);
  objc_msgSend(v120, "setToValue:", &unk_24C5D8370);
  objc_msgSend(v120, "setDuration:", 0.15);
  LODWORD(v121) = 1.0;
  objc_msgSend(v120, "setRepeatCount:", v121);
  objc_msgSend(v120, "setRemovedOnCompletion:", 0);
  objc_msgSend(v120, "setFillMode:", v106);
  v122 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setTimingFunction:", v123);

  if (v153 == 100)
  {
    v146 = *MEMORY[0x24BDE5A78];
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setEnabled:", 1);
    objc_msgSend(v124, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v124, "setValue:forKey:", &unk_24C5D8370, CFSTR("inputRadius"));
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v125, "_graphicsQuality") == 100)
      v126 = CFSTR("default");
    else
      v126 = CFSTR("low");
    objc_msgSend(v124, "setValue:forKey:", v126, CFSTR("inputQuality"));

    objc_msgSend((id)v175[5], "layer");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = v124;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v183, 1);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setFilters:", v128);

    objc_msgSend((id)v175[5], "layer");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setShouldRasterize:", 1);

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v175[5], "layer");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setFromValue:", v132);

    objc_msgSend(v130, "setToValue:", &unk_24C5D8388);
    objc_msgSend(v130, "setDuration:", 0.15);
    LODWORD(v133) = 1.0;
    objc_msgSend(v130, "setRepeatCount:", v133);
    objc_msgSend(v130, "setRemovedOnCompletion:", 0);
    objc_msgSend(v130, "setFillMode:", v106);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v122);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setTimingFunction:", v134);

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v146);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "setEnabled:", 1);
    objc_msgSend(v135, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v135, "setValue:forKey:", &unk_24C5D8388, CFSTR("inputRadius"));
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v136, "_graphicsQuality") == 100)
      v137 = CFSTR("default");
    else
      v137 = CFSTR("low");
    objc_msgSend(v135, "setValue:forKey:", v137, CFSTR("inputQuality"));

    objc_msgSend((id)v175[5], "layer");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = v135;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v182, 1);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setFilters:", v139);

  }
  else
  {
    v130 = 0;
  }
  objc_msgSend((id)v175[5], "layer");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v141) = 0;
  objc_msgSend(v140, "setOpacity:", v141);

  CATransform3DMakeScale(&v165, 0.5, 0.5, 0.5);
  objc_msgSend((id)v175[5], "layer");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v165;
  objc_msgSend(v142, "setTransform:", &v164);

  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "setDuration:", 0.28);
  if (v153 == 100 && v130)
  {
    v181[0] = v118;
    v181[1] = v120;
    v181[2] = v130;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v181, 3);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setAnimations:", v144);
  }
  else
  {
    v180[0] = v118;
    v180[1] = v120;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v180, 2);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setAnimations:", v144);
  }

  objc_msgSend((id)v175[5], "layer");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "addAnimation:forKey:", v143, CFSTR("animGroup"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  _Block_object_dispose(&v174, 8);

}

void __54__ICDocCamRetakeTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(void);

  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 64), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 72), "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 72), "completion");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (UIImage)retakeImage
{
  return self->_retakeImage;
}

- (void)setRetakeImage:(id)a3
{
  objc_storeStrong((id *)&self->_retakeImage, a3);
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
  objc_storeStrong((id *)&self->_retakeImage, 0);
}

- (void)animateTransition:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "Custom view controller transition only used for pop, not push.", v1, 2u);
}

@end
