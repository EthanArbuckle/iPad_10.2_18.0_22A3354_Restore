@implementation BCSLiveViewController

- (BCSLiveViewController)initWithPreviewLayer:(id)a3
{
  id v5;
  BCSLiveViewController *v6;
  BCSLiveViewController *v7;
  BCSActionCoordinator *v8;
  BCSActionCoordinator *actionCoordinator;
  BCSLiveViewController *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSLiveViewController;
  v6 = -[BCSLiveViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_previewLayer, a3);
    v8 = objc_alloc_init(BCSActionCoordinator);
    actionCoordinator = v7->_actionCoordinator;
    v7->_actionCoordinator = v8;

    -[BCSActionCoordinator setDelegate:](v7->_actionCoordinator, "setDelegate:", v7);
    v10 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  BCSPreviewContainerView *v3;
  BCSPreviewContainerView *previewContainerView;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v7;
  BCSSubjectIndicatorView *v8;
  BCSSubjectIndicatorView *v9;
  BCSSubjectIndicatorView *focusIndicator;
  double v11;
  double v12;
  void *v13;
  void *v14;
  BCSTorchButtonView *v15;
  BCSTorchButtonView *torchButtonView;
  void *v17;
  void *v18;
  BCSCoachingMessageView *v19;
  BCSCoachingMessageView *coachingMessageView;
  void *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *coachingMessageTopAnchorConstraint;
  void *v26;
  UIView *v27;
  UIView *focusIndicatorInsetView;
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
  objc_super v65;
  _QWORD v66[12];

  v66[10] = *MEMORY[0x24BDAC8D0];
  v65.receiver = self;
  v65.super_class = (Class)BCSLiveViewController;
  -[BCSLiveViewController viewDidLoad](&v65, sel_viewDidLoad);
  v3 = objc_alloc_init(BCSPreviewContainerView);
  previewContainerView = self->_previewContainerView;
  self->_previewContainerView = v3;

  -[BCSPreviewContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_previewContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BCSPreviewContainerView setAccessibilityIgnoresInvertColors:](self->_previewContainerView, "setAccessibilityIgnoresInvertColors:", 1);
  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__liveViewTapped);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v5;

  -[BCSPreviewContainerView addGestureRecognizer:](self->_previewContainerView, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[BCSLiveViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_previewContainerView);

  -[BCSPreviewContainerView setPreviewLayer:](self->_previewContainerView, "setPreviewLayer:", self->_previewLayer);
  v8 = [BCSSubjectIndicatorView alloc];
  v9 = -[BCSSubjectIndicatorView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  focusIndicator = self->_focusIndicator;
  self->_focusIndicator = v9;

  -[BCSSubjectIndicatorView setInactive:](self->_focusIndicator, "setInactive:", 1);
  -[BCSSubjectIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_focusIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BCSSubjectIndicatorView sizeThatFits:](self->_focusIndicator, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[BCSSubjectIndicatorView setBounds:](self->_focusIndicator, "setBounds:", 0.0, 0.0, v11, v12);
  -[BCSLiveViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "center");
  -[BCSSubjectIndicatorView setCenter:](self->_focusIndicator, "setCenter:");

  -[BCSLiveViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_focusIndicator);

  v15 = objc_alloc_init(BCSTorchButtonView);
  torchButtonView = self->_torchButtonView;
  self->_torchButtonView = v15;

  -[BCSTorchButtonView setTranslatesAutoresizingMaskIntoConstraints:](self->_torchButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BCSTorchButtonView setDelegate:](self->_torchButtonView, "setDelegate:", self);
  -[BCSLiveViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSTorchButtonView setHidden:](self->_torchButtonView, "setHidden:", objc_msgSend(v17, "liveViewControllerTorchModeSupported:", self) ^ 1);

  -[BCSLiveViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", self->_torchButtonView);

  v19 = objc_alloc_init(BCSCoachingMessageView);
  coachingMessageView = self->_coachingMessageView;
  self->_coachingMessageView = v19;

  -[BCSCoachingMessageView setTranslatesAutoresizingMaskIntoConstraints:](self->_coachingMessageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BCSCoachingMessageView topAnchor](self->_coachingMessageView, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSLiveViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, 80.0);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  coachingMessageTopAnchorConstraint = self->_coachingMessageTopAnchorConstraint;
  self->_coachingMessageTopAnchorConstraint = v24;

  -[BCSLiveViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", self->_coachingMessageView);

  v27 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  focusIndicatorInsetView = self->_focusIndicatorInsetView;
  self->_focusIndicatorInsetView = v27;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_focusIndicatorInsetView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BCSLiveViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", self->_focusIndicatorInsetView);

  v53 = (void *)MEMORY[0x24BDD1628];
  v66[0] = self->_coachingMessageTopAnchorConstraint;
  -[BCSCoachingMessageView centerXAnchor](self->_coachingMessageView, "centerXAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSLiveViewController view](self, "view");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "centerXAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v61;
  -[BCSCoachingMessageView bottomAnchor](self->_coachingMessageView, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSSubjectIndicatorView topAnchor](self->_focusIndicator, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintLessThanOrEqualToAnchor:constant:", v59, -10.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v58;
  -[BCSCoachingMessageView widthAnchor](self->_coachingMessageView, "widthAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSLiveViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v54;
  -[BCSSubjectIndicatorView centerXAnchor](self->_focusIndicator, "centerXAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSLiveViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v49;
  -[BCSSubjectIndicatorView centerYAnchor](self->_focusIndicator, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSLiveViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v45;
  -[UIView centerXAnchor](self->_focusIndicatorInsetView, "centerXAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSSubjectIndicatorView centerXAnchor](self->_focusIndicator, "centerXAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v42;
  -[UIView centerYAnchor](self->_focusIndicatorInsetView, "centerYAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSSubjectIndicatorView centerYAnchor](self->_focusIndicator, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v30;
  -[UIView widthAnchor](self->_focusIndicatorInsetView, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSSubjectIndicatorView widthAnchor](self->_focusIndicator, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:multiplier:", v32, 0.8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v33;
  -[UIView heightAnchor](self->_focusIndicatorInsetView, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSSubjectIndicatorView heightAnchor](self->_focusIndicator, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:multiplier:", v35, 0.8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v66[9] = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "activateConstraints:", v37);

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  -[BCSPreviewContainerView setBounds:](self->_previewContainerView, "setBounds:");

  -[BCSLiveViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  UIRectGetCenter();
  -[BCSPreviewContainerView setCenter:](self->_previewContainerView, "setCenter:");

  -[BCSPreviewContainerView setNeedsLayout](self->_previewContainerView, "setNeedsLayout");
  -[BCSSubjectIndicatorView setBouncing:](self->_focusIndicator, "setBouncing:", 1);
}

- (void)resetUIAndStartCapturing:(BOOL)a3
{
  _BOOL8 v3;
  UIImageView *targetQRImage;
  BCSScanningAnimator *animator;
  BCSScanningAnimator *v7;
  void *v8;
  BCSSubjectIndicatorView *focusIndicator;
  __int128 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _OWORD v15[3];

  v3 = a3;
  -[UIImageView removeFromSuperview](self->_targetQRImage, "removeFromSuperview");
  targetQRImage = self->_targetQRImage;
  self->_targetQRImage = 0;

  animator = self->_animator;
  if (v3)
  {
    -[BCSScanningAnimator reset](animator, "reset");
    v7 = self->_animator;
    self->_animator = 0;

    -[BCSSubjectIndicatorView _removeAllAnimations:](self->_focusIndicator, "_removeAllAnimations:", 1);
    -[BCSSubjectIndicatorView layer](self->_focusIndicator, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMeshTransform:", 0);

    focusIndicator = self->_focusIndicator;
    v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v15[0] = *MEMORY[0x24BDBD8B8];
    v15[1] = v10;
    v15[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[BCSSubjectIndicatorView setTransform:](focusIndicator, "setTransform:", v15);
    -[BCSLiveViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "liveViewControllerDidResetCapture:", self);

  }
  else
  {
    -[BCSScanningAnimator showCoverView](animator, "showCoverView");
  }
  -[BCSSubjectIndicatorView setBouncing:](self->_focusIndicator, "setBouncing:", v3);
  v12 = v3 ^ 1;
  -[BCSCoachingMessageView setContentHidden:](self->_coachingMessageView, "setContentHidden:", v12);
  if ((v12 & 1) == 0)
  {
    _BCSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSLiveViewController _updateCoacheMessageWithString:](self, "_updateCoacheMessageWithString:", v13);

  }
  -[BCSLiveViewController parentViewController](self, "parentViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsStatusBarAppearanceUpdate");

}

- (void)_liveViewTapped
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  -[UIImageView superview](self->_targetQRImage, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[UITapGestureRecognizer locationInView:](self->_tapGestureRecognizer, "locationInView:", self->_previewContainerView);
    -[BCSLiveViewController _convertPointToCaptureDeviceLocation:](self, "_convertPointToCaptureDeviceLocation:");
    v5 = v4;
    v7 = v6;
    -[BCSLiveViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "liveViewController:didTapAtDevicePoint:", self, v5, v7);

  }
  -[BCSLiveViewController resetUIAndStartCapturing:](self, "resetUIAndStartCapturing:", 1);
}

- (void)_updateCoacheMessageWithString:(id)a3
{
  BCSCoachingMessageView *coachingMessageView;
  id v5;

  coachingMessageView = self->_coachingMessageView;
  v5 = a3;
  -[BCSCoachingMessageView setContentHidden:](coachingMessageView, "setContentHidden:", 0);
  -[BCSCoachingMessageView setMessage:](self->_coachingMessageView, "setMessage:", v5);

}

- (void)updateQRCodeAvailability:(int64_t)a3
{
  id v4;

  if (a3 == 2 || !a3)
  {
    _BCSLocalizedString();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BCSLiveViewController _updateCoacheMessageWithString:](self, "_updateCoacheMessageWithString:", v4);

  }
}

- (void)didCaptureVisualCode:(id)a3 image:(id)a4 shouldAnimate:(BOOL)a5
{
  id v7;
  id v8;
  BCSImageQuad *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BCSImageQuad *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  BCSImageQuad *v48;
  uint64_t v49;
  UIImageView *v50;
  UIImageView *targetQRImage;
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
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  BCSImageQuad *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  void *v87;
  CGFloat Height;
  double x;
  double y;
  double width;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  __int128 v107;
  UIImageView *v108;
  void *v109;
  void *v110;
  BCSScanningAnimator *animator;
  BCSScanningAnimator *v112;
  BCSScanningAnimator *v113;
  BCSImageQuad *v114;
  uint64_t v115;
  NSObject *v116;
  id v117;
  id v118;
  void *v119;
  uint64_t v120;
  BCSScanningAnimator *v121;
  id *v122;
  id *v123;
  id v124;
  id v125;
  CGFloat v126;
  double v127;
  double v128;
  double v129;
  BCSImageQuad *v130;
  void *v131;
  _BOOL4 v132;
  double v133;
  double v134;
  double v135;
  BCSImageQuad *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  _QWORD v141[5];
  id v142;
  void *v143;
  _QWORD v144[5];
  id v145;
  void *v146;
  _QWORD aBlock[4];
  id v148;
  id v149;
  BCSLiveViewController *v150;
  _QWORD v151[5];
  _QWORD v152[5];
  CGAffineTransform v153;
  CGAffineTransform v154;
  CGAffineTransform v155;
  CGAffineTransform v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;

  v132 = a5;
  v7 = a3;
  v8 = a4;
  -[BCSActionCoordinator startParsingVisualCode:](self->_actionCoordinator, "startParsingVisualCode:", v7);
  v9 = [BCSImageQuad alloc];
  objc_msgSend(v7, "topLeft");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "topRight");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v7, "bottomRight");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v7, "bottomLeft");
  v24 = -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v9, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v11, v13, v15, v17, v19, v21, v22, v23);
  -[BCSImageQuad boundingBox](v24, "boundingBox");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(v8, "extent");
  CGAffineTransformMakeScale(&v156, v33, v34);
  v157.origin.x = v26;
  v157.origin.y = v28;
  v157.size.width = v30;
  v157.size.height = v32;
  v158 = CGRectApplyAffineTransform(v157, &v156);
  objc_msgSend(v8, "imageByCroppingToRect:", v158.origin.x, v158.origin.y, v158.size.width, v158.size.height);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSImageQuad normalize](v24, "normalize");
  objc_msgSend(v35, "extent");
  -[BCSImageQuad topLeft](v24, "topLeft");
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  v137 = v37;
  v139 = v36;
  -[BCSImageQuad topRight](v24, "topRight");
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  v39 = v38;
  v41 = v40;
  -[BCSImageQuad bottomRight](v24, "bottomRight");
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  v43 = v42;
  v45 = v44;
  -[BCSImageQuad bottomLeft](v24, "bottomLeft");
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  v48 = -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([BCSImageQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v139, v137, v39, v41, v43, v45, v46, v47);
  -[BCSImageQuad adjustOrientationInImageSpace:](v48, "adjustOrientationInImageSpace:", 1);
  v131 = v35;
  -[BCSLiveViewController _perspectiveCorrectedImage:imageQuad:](self, "_perspectiveCorrectedImage:imageQuad:", v35, v48);
  v49 = objc_claimAutoreleasedReturnValue();
  -[UIImageView removeFromSuperview](self->_targetQRImage, "removeFromSuperview");
  v50 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v49);
  targetQRImage = self->_targetQRImage;
  self->_targetQRImage = v50;

  -[AVCaptureVideoPreviewLayer rectForMetadataOutputRectOfInterest:](self->_previewLayer, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v59 = v58;
  -[BCSLiveViewController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "convertRect:fromView:", self->_previewContainerView, v53, v55, v57, v59);

  objc_msgSend(v7, "topLeft");
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  v138 = v61;
  v140 = v62;
  objc_msgSend(v7, "topRight");
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  v64 = v63;
  v66 = v65;
  objc_msgSend(v7, "bottomRight");
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  v68 = v67;
  v70 = v69;
  objc_msgSend(v7, "bottomLeft");
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  v72 = v71;
  v74 = v73;
  v75 = [BCSImageQuad alloc];
  v134 = v66;
  v135 = v64;
  v76 = v66;
  v77 = v68;
  v78 = v72;
  v133 = v74;
  v136 = -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v75, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v138, v140, v64, v76, v77, v70, v72, v74);
  -[BCSImageQuad boundingBox](v136, "boundingBox");
  v80 = v79;
  v82 = v81;
  v84 = v83;
  v86 = v85;
  -[BCSLiveViewController view](self, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "bounds");
  Height = CGRectGetHeight(v159);

  v155.b = 0.0;
  v155.c = 0.0;
  v155.a = 1.0;
  *(_OWORD *)&v155.d = xmmword_236DFDCA0;
  v155.ty = Height;
  v160.origin.x = v80;
  v160.origin.y = v82;
  v160.size.width = v84;
  v160.size.height = v86;
  v161 = CGRectApplyAffineTransform(v160, &v155);
  x = v161.origin.x;
  y = v161.origin.y;
  width = v161.size.width;
  v92 = v161.size.height;
  _bcs_roundRectToPixels();
  -[UIImageView setFrame:](self->_targetQRImage, "setFrame:");
  if (objc_msgSend(v7, "codeType") == 1)
  {
    -[UIImageView bounds](self->_targetQRImage, "bounds");
    v93 = CGRectGetWidth(v162);
    -[UIImageView bounds](self->_targetQRImage, "bounds");
    v94 = CGRectGetHeight(v163);
    v95 = v93 / v94;
    v128 = y;
    v129 = v70;
    if (v93 > v94)
      v95 = 1.0;
    v126 = v95;
    v127 = v77;
    if (v93 > v94)
      v96 = v94 / v93;
    else
      v96 = 1.0;
    if (v93 <= v94)
      v93 = v94;
    -[UIImageView position](self->_targetQRImage, "position");
    v97 = v92;
    v98 = v78;
    v100 = v99;
    v101 = width;
    v102 = x;
    v104 = v103;
    -[UIImageView setFrame:](self->_targetQRImage, "setFrame:", 0.0, 0.0, v93, v93);
    v105 = v100;
    v78 = v98;
    v92 = v97;
    -[UIImageView setPosition:](self->_targetQRImage, "setPosition:", v105, v104);
    -[UIImageView layer](self->_targetQRImage, "layer");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    x = v102;
    width = v101;
    objc_msgSend(v106, "setCornerRadius:", v93 * 0.5);

    v107 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v155.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v155.c = v107;
    *(_OWORD *)&v155.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    y = v128;
    v70 = v129;
    *(double *)&v107 = v96;
    v77 = v127;
    CGAffineTransformScale(&v154, &v155, v126, *(CGFloat *)&v107);
    v108 = self->_targetQRImage;
    v153 = v154;
    -[UIImageView setTransform:](v108, "setTransform:", &v153);
    -[UIImageView layer](self->_targetQRImage, "layer");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setMasksToBounds:", 1);

    -[UIImageView setClipsToBounds:](self->_targetQRImage, "setClipsToBounds:", 1);
  }
  v130 = v48;
  v110 = (void *)v49;
  animator = self->_animator;
  if (!animator)
  {
    v112 = objc_alloc_init(BCSScanningAnimator);
    v113 = self->_animator;
    self->_animator = v112;

    animator = self->_animator;
  }
  -[BCSScanningAnimator setFocusIndicator:](animator, "setFocusIndicator:", self->_focusIndicator);
  v114 = -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([BCSImageQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v138, v140, v135, v134, v77, v70, v78, v133);
  -[BCSImageQuad setBounds:](v114, "setBounds:", x, y, width, v92);
  -[BCSImageQuad normalize](v114, "normalize");
  -[BCSImageQuad flip](v114, "flip");
  -[BCSScanningAnimator setImageQuad:](self->_animator, "setImageQuad:", v114);
  -[BCSScanningAnimator setTargetQRImage:](self->_animator, "setTargetQRImage:", self->_targetQRImage);
  -[BCSScanningAnimator setTargetCode:](self->_animator, "setTargetCode:", v7);
  -[BCSSubjectIndicatorView setBouncing:](self->_focusIndicator, "setBouncing:", 0);
  v115 = MEMORY[0x24BDAC760];
  v151[4] = self;
  v152[0] = MEMORY[0x24BDAC760];
  v152[1] = 3221225472;
  v152[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke;
  v152[3] = &unk_250863730;
  v152[4] = self;
  v151[0] = MEMORY[0x24BDAC760];
  v151[1] = 3221225472;
  v151[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2;
  v151[3] = &unk_2508637B8;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v152, v151, 0.25);
  v116 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v116))
  {
    LOWORD(v155.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_236DE2000, v116, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "pushAnimationStarts", "start QR code animation", (uint8_t *)&v155, 2u);
  }
  aBlock[0] = v115;
  aBlock[1] = 3221225472;
  aBlock[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_27;
  aBlock[3] = &unk_250863808;
  v117 = v7;
  v148 = v117;
  v118 = v8;
  v149 = v118;
  v150 = self;
  v119 = _Block_copy(aBlock);
  v120 = objc_msgSend(v117, "codeType");
  v121 = self->_animator;
  if (v120 == 1)
  {
    v144[0] = v115;
    v144[1] = 3221225472;
    v144[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_36;
    v144[3] = &unk_250863858;
    v144[4] = self;
    v122 = &v145;
    v123 = &v146;
    v145 = v117;
    v146 = v119;
    v124 = v119;
    -[BCSScanningAnimator animateAppClipCodeBounceWithCompletion:shouldAnimate:](v121, "animateAppClipCodeBounceWithCompletion:shouldAnimate:", v144, v132);
  }
  else
  {
    v141[0] = v115;
    v141[1] = 3221225472;
    v141[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_3;
    v141[3] = &unk_250863858;
    v141[4] = self;
    v122 = &v142;
    v123 = &v143;
    v142 = v117;
    v143 = v119;
    v125 = v119;
    -[BCSScanningAnimator animatePushWithCompletion:shouldAnimate:](v121, "animatePushWithCompletion:shouldAnimate:", v141, v132);
  }

}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 0.0);
}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setContentHidden:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 1.0);
}

BOOL __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_27(_QWORD *a1)
{
  _BOOL8 v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[8];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v2 = +[BCSSecureCaptureSession hasActiveSession](BCSSecureCaptureSession, "hasActiveSession");
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1960]);
    v4 = (void *)objc_msgSend(v3, "initWithActivityType:", *MEMORY[0x24BDDAA78]);
    v12[0] = CFSTR("detectedCode");
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", a1[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = CFSTR("detectedImage");
    v13[0] = v5;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInfo:", v7);

    v8 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236DE2000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "captureExtensionCodePayload", "created Capture Extension code payload", buf, 2u);
    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_32;
    v10[3] = &unk_2508637E0;
    v10[4] = a1[6];
    +[BCSSecureCaptureSession authenticateWithUserActivity:completionHandler:](BCSSecureCaptureSession, "authenticateWithUserActivity:completionHandler:", v4, v10);

  }
  return v2;
}

void __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2_33;
    block[3] = &unk_250863730;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v4 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_32_cold_1(v4, v3);
  }

}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetUIAndStartCapturing:", 1);
}

void __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_36(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "actionForVisualCode:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2_37;
    v8[3] = &unk_250863830;
    v6 = *(id *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = v4;
    objc_msgSend(v5, "requestDeviceUnlockIfNeededWithCompletion:", v8);

  }
}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2_37(_QWORD *a1, char a2)
{
  uint64_t result;
  void *v5;
  void *v6;

  result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if ((result & 1) == 0)
  {
    v5 = (void *)a1[4];
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "liveViewControllerWillPerformAction:", a1[4]);

      return objc_msgSend(*(id *)(a1[4] + 1064), "performAction:", a1[5]);
    }
    else
    {
      return objc_msgSend(v5, "resetUIAndStartCapturing:", 1);
    }
  }
  return result;
}

void __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_3(uint64_t a1)
{
  void *v2;
  int64_t v3;
  dispatch_time_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "actionForVisualCode:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = 100000000;
  else
    v3 = 1000000000;
  v4 = dispatch_time(0, v3);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_4;
  block[3] = &unk_250863880;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v5;
  block[4] = v6;
  v9 = v7;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_continueToPopAnimationForDetectedCode:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_continueToPopAnimationForDetectedCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BCSActionCoordinator *actionCoordinator;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  -[BCSActionCoordinator actionForVisualCode:](self->_actionCoordinator, "actionForVisualCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    actionCoordinator = self->_actionCoordinator;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke;
    v8[3] = &unk_250863998;
    v8[4] = self;
    v9 = v5;
    v10 = v4;
    -[BCSActionCoordinator requestDeviceUnlockIfNeededWithCompletion:](actionCoordinator, "requestDeviceUnlockIfNeededWithCompletion:", v8);

  }
  else
  {
    -[BCSLiveViewController resetUIAndStartCapturing:](self, "resetUIAndStartCapturing:", 1);
  }

}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke(id *a1, char a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  uint8_t buf[16];
  _QWORD v24[5];
  id v25;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(a1[5], "actionPickerItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 == 1)
    {
      v5 = a1[4];
      v6 = a1[5];
      v7 = (void *)v5[133];
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_2;
      v24[3] = &unk_2508638F8;
      v24[4] = v5;
      v25 = a1[6];
      objc_msgSend(v7, "showFirstTimePromptIfNecessary:completion:", v6, v24);
      v8 = v25;
    }
    else
    {
      v9 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_236DE2000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "startShowingAlertForUserChoice", "show alert for multiple action items", buf, 2u);
      }
      objc_msgSend(a1[5], "actionPickerItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "_bcs_isUPIURL");

      v14 = a1[4];
      if (v13)
      {
        v15 = (void *)v14[127];
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_39;
        v22[3] = &unk_250863920;
        v22[4] = v14;
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_2_40;
        v20[3] = &unk_2508638D0;
        v20[4] = v14;
        v21 = a1[5];
        objc_msgSend(v15, "animatePopWithAppImageBlock:completion:", v22, v20);
        v8 = v21;
      }
      else
      {
        v16 = (void *)v14[133];
        v17 = a1[5];
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_4_43;
        v18[3] = &unk_250863948;
        v18[4] = v14;
        v19 = v17;
        objc_msgSend(v16, "showItemsWithAction:completion:", v19, v18);
        v8 = v19;
      }
    }

  }
  else
  {
    objc_msgSend(a1[4], "resetUIAndStartCapturing:", 1);
  }
}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 1016);
  v9[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_3;
  v9[3] = &unk_2508638A8;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[4] = v2;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_4;
  v7[3] = &unk_2508638D0;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v4, "animatePopWithAppImageBlock:completion:", v9, v7);

}

id __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "actionForVisualCode:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "homeScreenAppIconForAction:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_4(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "actionForVisualCode:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v6 = v4;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "liveViewControllerWillPerformAction:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "performAction:", v6);
    v4 = v6;
  }

}

uint64_t __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "image");
}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_2_40(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(v2 + 1064);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_3_41;
    v5[3] = &unk_250863948;
    v5[4] = v2;
    v6 = v3;
    objc_msgSend(v4, "showItemsWithAction:completion:", v6, v5);

  }
}

uint64_t __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_3_41(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "liveViewControllerWillPerformAction:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v4, "performAction");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "logActivatedEventForAction:", *(_QWORD *)(a1 + 40));
}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_4_43(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "actionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1016);
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_5;
    v11[3] = &unk_250863970;
    v11[4] = v5;
    v12 = v3;
    v13 = *(id *)(a1 + 40);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_6;
    v8[3] = &unk_250863998;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v12;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v6, "animatePopWithAppImageBlock:completion:", v11, v8);

  }
  else if (objc_msgSend(v3, "isCopyActionItem"))
  {
    objc_msgSend(v3, "performAction");
    objc_msgSend(*(id *)(a1 + 32), "resetUIAndStartCapturing:", 1);
  }

}

id __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
  objc_msgSend(*(id *)(a1 + 40), "targetApplicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "homeScreenAppIconWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "defaultActionTargetApplicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "homeScreenAppIconWithIdentifier:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_6(uint64_t result, int a2)
{
  _QWORD *v2;
  void *v3;

  if (a2)
  {
    v2 = (_QWORD *)result;
    objc_msgSend(*(id *)(result + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "liveViewControllerWillPerformAction:", v2[4]);

    objc_msgSend(*(id *)(v2[4] + 1064), "performActionPickerItem:", v2[5]);
    return objc_msgSend(*(id *)(v2[4] + 1064), "logActivatedEventForAction:", v2[6]);
  }
  return result;
}

- (CGPoint)_normalize:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = (a3.x - a4.origin.x) / a4.size.width;
  v5 = (a3.y - a4.origin.y) / a4.size.height;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_convertLogicalPoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a4.origin.x + a3.x * a4.size.width;
  v5 = a4.origin.y + a3.y * a4.size.height;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)_perspectiveCorrectedImage:(id)a3 imageQuad:(id)a4
{
  id v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBF658];
  v7 = a4;
  objc_msgSend(v6, "filterWithName:", CFSTR("CIPerspectiveCorrection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBF690];
  objc_msgSend(v7, "topLeft");
  objc_msgSend(v9, "vectorWithCGPoint:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("inputTopLeft"));

  v11 = (void *)MEMORY[0x24BDBF690];
  objc_msgSend(v7, "topRight");
  objc_msgSend(v11, "vectorWithCGPoint:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("inputTopRight"));

  v13 = (void *)MEMORY[0x24BDBF690];
  objc_msgSend(v7, "bottomLeft");
  objc_msgSend(v13, "vectorWithCGPoint:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v14, CFSTR("inputBottomLeft"));

  v15 = (void *)MEMORY[0x24BDBF690];
  objc_msgSend(v7, "bottomRight");
  v17 = v16;
  v19 = v18;

  objc_msgSend(v15, "vectorWithCGPoint:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v20, CFSTR("inputBottomRight"));

  objc_msgSend(v8, "setValue:forKey:", v5, *MEMORY[0x24BDBF960]);
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x24BDBF9C8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BEBD640];
  _bcs_mainScreenScale();
  objc_msgSend(v22, "imageWithCIImage:scale:orientation:", v21, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (CGPoint)_pointFromNormalizedPoint:(CGPoint)a3
{
  double y;
  double x;
  AVCaptureVideoPreviewLayer *previewLayer;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  previewLayer = self->_previewLayer;
  -[BCSLiveViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCaptureVideoPreviewLayer convertPoint:toLayer:](previewLayer, "convertPoint:toLayer:", v7, x, y);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)_convertPointToCaptureDeviceLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[BCSLiveViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toLayer:", self->_previewLayer, x, y);
  v9 = v8;
  v11 = v10;

  -[AVCaptureVideoPreviewLayer captureDevicePointOfInterestForPoint:](self->_previewLayer, "captureDevicePointOfInterestForPoint:", v9, v11);
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)_convertPointFromCaptureDeviceLocation:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  -[AVCaptureVideoPreviewLayer pointForCaptureDevicePointOfInterest:](self->_previewLayer, "pointForCaptureDevicePointOfInterest:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[BCSLiveViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromLayer:", self->_previewLayer, v5, v7);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)cameraDeviceDidChange
{
  id v3;

  -[BCSLiveViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BCSTorchButtonView setHidden:](self->_torchButtonView, "setHidden:", objc_msgSend(v3, "liveViewControllerTorchModeSupported:", self) ^ 1);

}

- (void)torchAvailabilityChangedTo:(BOOL)a3
{
  -[BCSTorchButtonView torchAvailabilityChangedTo:](self->_torchButtonView, "torchAvailabilityChangedTo:", a3);
}

- (void)torchActivenessChangedTo:(BOOL)a3
{
  -[BCSTorchButtonView torchActivenessChangedTo:](self->_torchButtonView, "torchActivenessChangedTo:", a3);
}

- (void)_applyTorchButtonRotationForDeviceOrientation
{
  void *v3;
  uint64_t v4;
  CGFloat v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientation");

  v5 = 0.0;
  if ((unint64_t)(v4 - 2) <= 2)
    v5 = dbl_236DFDCB8[v4 - 2];
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeRotation(&v7, v5);
  v6 = v7;
  -[BCSTorchButtonView setTransform:](self->_torchButtonView, "setTransform:", &v6);
}

- (void)_setTorchButtonPosition
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;

  -[BCSLiveViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  -[BCSLiveViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  if (v11 > v9)
    v12 = 1;
  else
    v12 = v6;
  if (v12 == 3)
  {
    v16 = v9 + -116.0;
    -[BCSLiveViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "center");
    v15 = v18;

  }
  else if (v12 == 4)
  {
    -[BCSLiveViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "center");
    v15 = v14;

    v16 = 116.0;
  }
  else
  {
    -[BCSLiveViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "center");
    v16 = v20;

    v15 = v11 + -116.0;
  }
  -[BCSTorchButtonView setCenter:](self->_torchButtonView, "setCenter:", v16, v15);
}

- (void)compensateForVideoRotationAngleInLiveView:(double)a3
{
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  self->_videoRotationAngle = a3;
  v5 = fabs(remainder(a3, 3.14159265));
  -[BCSLiveViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  if (v5 <= 0.001)
    v11 = v10;
  else
    v11 = v8;
  if (v5 <= 0.001)
    v12 = v8;
  else
    v12 = v10;
  -[BCSLiveViewController _layOutWithPreviewSize:angle:isPortrait:](self, "_layOutWithPreviewSize:angle:isPortrait:", v8 < v10, v12, v11, a3);
}

- (void)compensateForInterfaceOrientationInLiveView:(int64_t)a3 referenceSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  double v15;

  height = a4.height;
  width = a4.width;
  -[BCSLiveViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = width >= height && v10 < v12;
  if (v13 || width < height && v10 > v12)
  {
    width = v12;
    height = v10;
  }
  switch(a3)
  {
    case 2:
      v14 = 1;
      v15 = 3.14159265;
      break;
    case 3:
      v14 = 0;
      v15 = -1.57079633;
      break;
    case 4:
      v14 = 0;
      v15 = 1.57079633;
      break;
    default:
      v14 = 1;
      v15 = 0.0;
      break;
  }
  -[BCSLiveViewController _layOutWithPreviewSize:angle:isPortrait:](self, "_layOutWithPreviewSize:angle:isPortrait:", v14, width, height, v15);
}

- (void)_layOutWithPreviewSize:(CGSize)a3 angle:(double)a4 isPortrait:(BOOL)a5
{
  void *v8;
  double v9;
  int IsPad;
  double v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  -[BCSPreviewContainerView setBounds:](self->_previewContainerView, "setBounds:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), a3.width, a3.height);
  -[BCSLiveViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  UIRectGetCenter();
  -[BCSPreviewContainerView setCenter:](self->_previewContainerView, "setCenter:");

  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeRotation(&v13, a4);
  v12 = v13;
  -[BCSPreviewContainerView setTransform:](self->_previewContainerView, "setTransform:", &v12);
  if (a5)
  {
    v9 = 80.0;
  }
  else
  {
    IsPad = _bcs_deviceIsPad();
    v9 = 10.0;
    if (IsPad)
      v9 = 20.0;
  }
  -[NSLayoutConstraint setConstant:](self->_coachingMessageTopAnchorConstraint, "setConstant:", v9);
  LODWORD(v11) = 1144733696;
  -[NSLayoutConstraint setPriority:](self->_coachingMessageTopAnchorConstraint, "setPriority:", v11);
  -[BCSLiveViewController _setTorchButtonPosition](self, "_setTorchButtonPosition");
  -[BCSCoachingMessageView setNeedsLayout](self->_coachingMessageView, "setNeedsLayout");
}

- (void)viewDidLayoutSubviews
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  if (_os_feature_enabled_impl())
  {
    -[BCSLiveViewController compensateForVideoRotationAngleInLiveView:](self, "compensateForVideoRotationAngleInLiveView:", self->_videoRotationAngle);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "statusBarOrientation");
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_referenceBounds");
    -[BCSLiveViewController compensateForInterfaceOrientationInLiveView:referenceSize:](self, "compensateForInterfaceOrientationInLiveView:referenceSize:", v3, v5, v6);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)rotationAnimationWillStart
{
  -[BCSTorchButtonView rotationAnimationWillStart](self->_torchButtonView, "rotationAnimationWillStart");
}

- (void)rotationAnimationDidFinish
{
  -[BCSTorchButtonView rotationAnimationDidFinish](self->_torchButtonView, "rotationAnimationDidFinish");
}

- (void)actionCoordinator:(id)a3 willDismissViewController:(id)a4
{
  -[BCSLiveViewController resetUIAndStartCapturing:](self, "resetUIAndStartCapturing:", 1, a4);
}

- (id)actionCoordinatorViewForContextMenu:(id)a3
{
  return self->_focusIndicatorInsetView;
}

- (void)actionCoordinator:(id)a3 didFinishPerformingAction:(id)a4
{
  -[BCSLiveViewController resetUIAndStartCapturing:](self, "resetUIAndStartCapturing:", 1, a4);
}

- (void)actionCoordinator:(id)a3 didParseCode:(id)a4 withAction:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  BCSLiveViewController *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "codeType");
  if (v8 && v9 == 1)
  {
    -[BCSActionCoordinator centerGlyphImageForAction:](self->_actionCoordinator, "centerGlyphImageForAction:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v7 && v10)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__BCSLiveViewController_actionCoordinator_didParseCode_withAction___block_invoke;
      block[3] = &unk_2508639C0;
      v13 = v7;
      v14 = self;
      v15 = v11;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

void __67__BCSLiveViewController_actionCoordinator_didParseCode_withAction___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 1016), "targetCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(a1[5] + 1016), "prepareCenterGlyphWithImage:", a1[6]);
}

- (void)torchButtonView:(id)a3 torchModeChangedTo:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[BCSLiveViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "liveViewController:torchModeChangedTo:", self, v4);

}

- (void)sessionControlsDidBecomeActive:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__BCSLiveViewController_sessionControlsDidBecomeActive___block_invoke;
  block[3] = &unk_250863730;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __56__BCSLiveViewController_sessionControlsDidBecomeActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setObscuredByOverlay:", 1);
}

- (void)sessionControlsDidBecomeInactive:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__BCSLiveViewController_sessionControlsDidBecomeInactive___block_invoke;
  block[3] = &unk_250863730;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __58__BCSLiveViewController_sessionControlsDidBecomeInactive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setObscuredByOverlay:", 0);
}

- (BCSLiveViewControllerDelegate)delegate
{
  return (BCSLiveViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BCSActionCoordinator)actionCoordinator
{
  return self->_actionCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coachingMessageTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_targetQRImage, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_torchButtonView, 0);
  objc_storeStrong((id *)&self->_focusIndicatorInsetView, 0);
  objc_storeStrong((id *)&self->_focusIndicator, 0);
  objc_storeStrong((id *)&self->_coachingMessageView, 0);
  objc_storeStrong((id *)&self->_previewContainerView, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
}

void __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_32_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_236DE2000, v3, OS_LOG_TYPE_ERROR, "BCSLiveViewController: capture extension authentication failed with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
