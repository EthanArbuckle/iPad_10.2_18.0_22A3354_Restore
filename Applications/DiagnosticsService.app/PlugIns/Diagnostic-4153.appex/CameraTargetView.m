@implementation CameraTargetView

- (CameraTargetView)initWithFrame:(CGRect)a3 color:(id)a4 thickness:(double)a5 instructionText:(id)a6 presentationOptions:(int64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  CameraTargetView *v17;
  CameraTargetView *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  UIView *v29;
  UIView *viewfinderOutsideRegionTop;
  double v31;
  double v32;
  UIView *v33;
  UIView *viewfinderOutsideRegionBottom;
  UILabel *v35;
  UILabel *viewfinderInstruction;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  UIButton *cancelButton;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  UIButton *v53;
  void *v54;
  void *v55;
  UIButton *v56;
  void *v57;
  uint64_t v58;
  CUShutterButton *shutterButton;
  CGFloat v60;
  CGFloat v61;
  uint64_t v62;
  CAMFlipButton *flipButton;
  CGFloat v64;
  CGFloat v65;
  CAMFlashButton *v66;
  CAMFlashButton *flashButton;
  void *v69;
  id v70;
  objc_super v71;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  v16 = a6;
  v71.receiver = self;
  v71.super_class = (Class)CameraTargetView;
  v17 = -[CameraTargetView initWithFrame:](&v71, "initWithFrame:", x, y, width, height);
  v18 = v17;
  if (v17)
  {
    v17->_cameraPresentation = a7;
    -[CameraTargetView setOpaque:](v17, "setOpaque:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CameraTargetView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    if ((a7 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
      -[CameraTargetView frame](v18, "frame");
      -[CameraTargetView center](v18, "center");
      objc_msgSend(v20, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView layer](v18, "layer"));
      v22 = objc_retainAutorelease(v20);
      objc_msgSend(v21, "setPath:", objc_msgSend(v22, "CGPath"));
      objc_msgSend(v21, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v15), "CGColor"));
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
      objc_msgSend(v21, "setFillColor:", objc_msgSend(v23, "CGColor"));

      objc_msgSend(v21, "setLineWidth:", a5);
      objc_msgSend(v21, "setLineCap:", kCALineCapRound);
      objc_msgSend(v21, "setLineJoin:", kCALineJoinRound);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    v25 = objc_alloc((Class)UIView);
    v26 = CGRectZero.origin.y;
    v27 = CGRectZero.size.width;
    v28 = CGRectZero.size.height;
    v29 = (UIView *)objc_msgSend(v25, "initWithFrame:", CGRectZero.origin.x, v26, v27, v28);
    viewfinderOutsideRegionTop = v18->_viewfinderOutsideRegionTop;
    v18->_viewfinderOutsideRegionTop = v29;

    -[UIView setOpaque:](v18->_viewfinderOutsideRegionTop, "setOpaque:", 0);
    -[UIView setBackgroundColor:](v18->_viewfinderOutsideRegionTop, "setBackgroundColor:", v24);
    LODWORD(v31) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v18->_viewfinderOutsideRegionTop, "setContentHuggingPriority:forAxis:", 1, v31);
    LODWORD(v32) = 0;
    -[UIView setContentCompressionResistancePriority:forAxis:](v18->_viewfinderOutsideRegionTop, "setContentCompressionResistancePriority:forAxis:", 1, v32);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v18->_viewfinderOutsideRegionTop, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, v26, v27, v28);
    viewfinderOutsideRegionBottom = v18->_viewfinderOutsideRegionBottom;
    v18->_viewfinderOutsideRegionBottom = v33;

    -[UIView setOpaque:](v18->_viewfinderOutsideRegionBottom, "setOpaque:", 0);
    -[UIView setBackgroundColor:](v18->_viewfinderOutsideRegionBottom, "setBackgroundColor:", v24);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v18->_viewfinderOutsideRegionBottom, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v35 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, v26, v27, v28);
    viewfinderInstruction = v18->_viewfinderInstruction;
    v18->_viewfinderInstruction = v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v18->_viewfinderInstruction, "setBackgroundColor:", v37);

    -[UILabel setContentMode:](v18->_viewfinderInstruction, "setContentMode:", 7);
    LODWORD(v38) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v18->_viewfinderInstruction, "setContentHuggingPriority:forAxis:", 0, v38);
    LODWORD(v39) = 0;
    -[UILabel setContentHuggingPriority:forAxis:](v18->_viewfinderInstruction, "setContentHuggingPriority:forAxis:", 1, v39);
    LODWORD(v40) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v18->_viewfinderInstruction, "setContentCompressionResistancePriority:forAxis:", 1, v40);
    -[UILabel setTextAlignment:](v18->_viewfinderInstruction, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v18->_viewfinderInstruction, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v18->_viewfinderInstruction, "setNumberOfLines:", 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
    -[UILabel setFont:](v18->_viewfinderInstruction, "setFont:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v18->_viewfinderInstruction, "setTextColor:", v42);

    v70 = v16;
    -[UILabel setText:](v18->_viewfinderInstruction, "setText:", v16);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v18->_viewfinderInstruction, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
    v44 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v43, 18.0));

    v45 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    cancelButton = v18->_cancelButton;
    v18->_cancelButton = (UIButton *)v45;

    -[UIButton setOpaque:](v18->_cancelButton, "setOpaque:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIButton setBackgroundColor:](v18->_cancelButton, "setBackgroundColor:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v18->_cancelButton, "titleLabel"));
    objc_msgSend(v48, "setContentMode:", 7);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v18->_cancelButton, "titleLabel"));
    objc_msgSend(v49, "setTextAlignment:", 1);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v18->_cancelButton, "titleLabel"));
    objc_msgSend(v50, "setLineBreakMode:", 4);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v18->_cancelButton, "titleLabel"));
    v69 = (void *)v44;
    objc_msgSend(v51, "setFont:", v44);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v18->_cancelButton, "titleLabel"));
    objc_msgSend(v52, "setNumberOfLines:", 1);

    v53 = v18->_cancelButton;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000106F0, 0));
    -[UIButton setTitle:forState:](v53, "setTitle:forState:", v55, 0);

    v56 = v18->_cancelButton;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTitleColor:forState:](v56, "setTitleColor:forState:", v57, 0);

    -[UIButton sizeToFit](v18->_cancelButton, "sizeToFit");
    -[UIButton addTarget:action:forControlEvents:](v18->_cancelButton, "addTarget:action:forControlEvents:", v18, "cancelTapped:", 64);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v18->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if ((a7 & 2) != 0)
    {
      v58 = objc_claimAutoreleasedReturnValue(+[CUShutterButton shutterButton](CUShutterButton, "shutterButton"));
      shutterButton = v18->_shutterButton;
      v18->_shutterButton = (CUShutterButton *)v58;

      -[CUShutterButton setExclusiveTouch:](v18->_shutterButton, "setExclusiveTouch:", 1);
      -[CUShutterButton intrinsicContentSize](v18->_shutterButton, "intrinsicContentSize");
      v18->_shutterButtonIntrinsicContentSize.width = v60;
      v18->_shutterButtonIntrinsicContentSize.height = v61;
      -[CUShutterButton addTarget:action:forControlEvents:](v18->_shutterButton, "addTarget:action:forControlEvents:", v18, "takePicture:", 64);
      -[CUShutterButton setTranslatesAutoresizingMaskIntoConstraints:](v18->_shutterButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    if ((a7 & 4) != 0)
    {
      v62 = objc_claimAutoreleasedReturnValue(+[CAMFlipButton flipButtonOverContent](CAMFlipButton, "flipButtonOverContent"));
      flipButton = v18->_flipButton;
      v18->_flipButton = (CAMFlipButton *)v62;

      -[CAMFlipButton setExclusiveTouch:](v18->_flipButton, "setExclusiveTouch:", 1);
      -[CAMFlipButton intrinsicContentSize](v18->_flipButton, "intrinsicContentSize");
      v18->_flipButtonIntrinsicContentSize.width = v64;
      v18->_flipButtonIntrinsicContentSize.height = v65;
      -[CAMFlipButton addTarget:action:forControlEvents:](v18->_flipButton, "addTarget:action:forControlEvents:", v18, "flipTapped:", 64);
      -[CAMFlipButton setTranslatesAutoresizingMaskIntoConstraints:](v18->_flipButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    if ((a7 & 8) != 0)
    {
      v66 = (CAMFlashButton *)objc_msgSend(objc_alloc((Class)CAMFlashButton), "initWithLayoutStyle:", 4);
      flashButton = v18->_flashButton;
      v18->_flashButton = v66;

      -[CAMFlashButton setExclusiveTouch:](v18->_flashButton, "setExclusiveTouch:", 1);
      -[CAMFlashButton setAllowsAutomaticFlash:](v18->_flashButton, "setAllowsAutomaticFlash:", 0);
      -[CAMFlashButton setFlashMode:](v18->_flashButton, "setFlashMode:", 0);
      -[CAMFlashButton reloadData](v18->_flashButton, "reloadData");
      -[CAMFlashButton addTarget:action:forControlEvents:](v18->_flashButton, "addTarget:action:forControlEvents:", v18, "flashTapped:", 4096);
      -[CAMFlashButton setTranslatesAutoresizingMaskIntoConstraints:](v18->_flashButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    -[CameraTargetView setNeedsUpdateConstraints](v18, "setNeedsUpdateConstraints");
    -[UIView addSubview:](v18->_viewfinderOutsideRegionBottom, "addSubview:", v18->_cancelButton);
    if ((a7 & 2) != 0)
    {
      -[UIView addSubview:](v18->_viewfinderOutsideRegionBottom, "addSubview:", v18->_shutterButton);
      if ((a7 & 4) == 0)
      {
LABEL_12:
        if ((a7 & 8) == 0)
        {
LABEL_14:
          -[CameraTargetView addSubview:](v18, "addSubview:", v18->_viewfinderOutsideRegionTop);
          -[CameraTargetView addSubview:](v18, "addSubview:", v18->_viewfinderOutsideRegionBottom);
          -[CameraTargetView addSubview:](v18, "addSubview:", v18->_viewfinderInstruction);

          v16 = v70;
          goto LABEL_15;
        }
LABEL_13:
        -[UIView addSubview:](v18->_viewfinderOutsideRegionBottom, "addSubview:", v18->_flashButton);
        goto LABEL_14;
      }
    }
    else if ((a7 & 4) == 0)
    {
      goto LABEL_12;
    }
    -[UIView addSubview:](v18->_viewfinderOutsideRegionBottom, "addSubview:", v18->_flipButton);
    if ((a7 & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_15:

  return v18;
}

- (CameraTargetView)initWithFrame:(CGRect)a3 instructionText:(id)a4 presentationOptions:(int64_t)a5
{
  return -[CameraTargetView initWithFrame:color:thickness:instructionText:presentationOptions:](self, "initWithFrame:color:thickness:instructionText:presentationOptions:", 0, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer, a2);
}

- (void)setFlashState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if ((self->_cameraPresentation & 8) != 0)
  {
    v3 = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    objc_msgSend(v4, "setFlashMode:", v3);

  }
}

- (void)setFlashUIEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if ((self->_cameraPresentation & 8) != 0)
  {
    v3 = a3;
    if (!a3)
      -[CameraTargetView setFlashState:](self, "setFlashState:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    objc_msgSend(v5, "setEnabled:", v3);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    objc_msgSend(v6, "setHidden:", v3 ^ 1);

  }
}

- (void)cancelTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CameraTargetView delegate](self, "delegate", a3));
  objc_msgSend(v3, "cancelTapped");

}

- (void)flipTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CameraTargetView delegate](self, "delegate", a3));
  objc_msgSend(v3, "flipTapped");

}

- (void)flashTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CameraTargetView delegate](self, "delegate", a3));
  objc_msgSend(v3, "flashTapped");

}

- (void)takePicture:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  if ((self->_cameraPresentation & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView shutterButton](self, "shutterButton", a3));
    objc_msgSend(v4, "setEnabled:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView delegate](self, "delegate"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100008138;
    v6[3] = &unk_100010348;
    v6[4] = self;
    objc_msgSend(v5, "takePictureWithHandler:", v6);

  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  double v5;
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
  double v16;
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
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int64_t cameraPresentation;
  void *v61;
  void *v62;
  void *v63;
  double v64;
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
  double v80;
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
  double v95;
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
  objc_super v108;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionTop](self, "viewfinderOutsideRegionTop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionTop](self, "viewfinderOutsideRegionTop"));
  -[CameraTargetView frame](self, "frame");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, 0, 0, 1.0, v5));
  objc_msgSend(v3, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionTop](self, "viewfinderOutsideRegionTop"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionTop](self, "viewfinderOutsideRegionTop"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 8, 1, 0, 0, 1.0, 85.0));
  objc_msgSend(v7, "addConstraint:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionTop](self, "viewfinderOutsideRegionTop"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 9, 0, self, 9, 1.0, 0.0));
  -[CameraTargetView addConstraint:](self, "addConstraint:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionTop](self, "viewfinderOutsideRegionTop"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 3, 0, self, 3, 1.0, 0.0));
  -[CameraTargetView addConstraint:](self, "addConstraint:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  -[CameraTargetView frame](self, "frame");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 7, 0, 0, 0, 1.0, v16));
  objc_msgSend(v14, "addConstraint:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 8, 0, 0, 0, 1.0, 85.0));
  objc_msgSend(v18, "addConstraint:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 9, 0, self, 9, 1.0, 0.0));
  -[CameraTargetView addConstraint:](self, "addConstraint:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 4, 0, self, 4, 1.0, 0.0));
  -[CameraTargetView addConstraint:](self, "addConstraint:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderInstruction](self, "viewfinderInstruction"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionTop](self, "viewfinderOutsideRegionTop"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 5, 0, v26, 5, 1.0, 15.0));
  -[CameraTargetView addConstraint:](self, "addConstraint:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionTop](self, "viewfinderOutsideRegionTop"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderInstruction](self, "viewfinderInstruction"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 6, 0, v29, 6, 1.0, 15.0));
  -[CameraTargetView addConstraint:](self, "addConstraint:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderInstruction](self, "viewfinderInstruction"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 0.0));
  objc_msgSend(v35, "setActive:", 1);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionTop](self, "viewfinderOutsideRegionTop"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderInstruction](self, "viewfinderInstruction"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, 4, 0, v37, 4, 1.0, 5.0));

  LODWORD(v39) = 1144750080;
  objc_msgSend(v38, "setPriority:", v39);
  -[CameraTargetView addConstraint:](self, "addConstraint:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderInstruction](self, "viewfinderInstruction"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 9, 0, self, 9, 1.0, 0.0));
  -[CameraTargetView addConstraint:](self, "addConstraint:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView cancelButton](self, "cancelButton"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView cancelButton](self, "cancelButton"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView cancelButton](self, "cancelButton"));
  objc_msgSend(v44, "frame");
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 7, 0, 0, 0, 1.0, v45));
  objc_msgSend(v42, "addConstraint:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView cancelButton](self, "cancelButton"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView cancelButton](self, "cancelButton"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView cancelButton](self, "cancelButton"));
  objc_msgSend(v49, "frame");
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 8, 0, 0, 0, 1.0, v50));
  objc_msgSend(v47, "addConstraint:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView cancelButton](self, "cancelButton"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v53, 5, 0, v54, 5, 1.0, 15.0));
  objc_msgSend(v52, "addConstraint:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView cancelButton](self, "cancelButton"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 10, 0, v58, 10, 1.0, 0.0));
  objc_msgSend(v56, "addConstraint:", v59);

  cameraPresentation = self->_cameraPresentation;
  if ((cameraPresentation & 2) == 0)
  {
    if ((cameraPresentation & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flipButton](self, "flipButton"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flipButton](self, "flipButton"));
    -[CameraTargetView flipButtonIntrinsicContentSize](self, "flipButtonIntrinsicContentSize");
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v94, 7, 0, 0, 0, 1.0, v95));
    objc_msgSend(v93, "addConstraint:", v96);

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flipButton](self, "flipButton"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flipButton](self, "flipButton"));
    -[CameraTargetView flipButtonIntrinsicContentSize](self, "flipButtonIntrinsicContentSize");
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v98, 8, 0, 0, 0, 1.0));
    objc_msgSend(v97, "addConstraint:", v99);

    v100 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flipButton](self, "flipButton"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v101, 9, 0, v102, 9, 1.0, 0.0));
    objc_msgSend(v100, "addConstraint:", v103);

    v104 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flipButton](self, "flipButton"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v105, 10, 0, v106, 10, 1.0, 0.0));
    objc_msgSend(v104, "addConstraint:", v107);

    if ((self->_cameraPresentation & 8) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView shutterButton](self, "shutterButton"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView shutterButton](self, "shutterButton"));
  -[CameraTargetView shutterButtonIntrinsicContentSize](self, "shutterButtonIntrinsicContentSize");
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v79, 7, 0, 0, 0, 1.0, v80));
  objc_msgSend(v78, "addConstraint:", v81);

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView shutterButton](self, "shutterButton"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView shutterButton](self, "shutterButton"));
  -[CameraTargetView shutterButtonIntrinsicContentSize](self, "shutterButtonIntrinsicContentSize");
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v83, 8, 0, 0, 0, 1.0));
  objc_msgSend(v82, "addConstraint:", v84);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView shutterButton](self, "shutterButton"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v86, 9, 0, v87, 9, 1.0, 0.0));
  objc_msgSend(v85, "addConstraint:", v88);

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView shutterButton](self, "shutterButton"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v90, 10, 0, v91, 10, 1.0, 0.0));
  objc_msgSend(v89, "addConstraint:", v92);

  cameraPresentation = self->_cameraPresentation;
  if ((cameraPresentation & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((cameraPresentation & 8) != 0)
  {
LABEL_4:
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    objc_msgSend(v63, "intrinsicContentSize");
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v62, 7, 0, 0, 0, 1.0, v64));
    objc_msgSend(v61, "addConstraint:", v65);

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    objc_msgSend(v68, "intrinsicContentSize");
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v67, 8, 0, 0, 0, 1.0));
    objc_msgSend(v66, "addConstraint:", v69);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v71, 6, 0, v72, 6, 1.0, -15.0));
    objc_msgSend(v70, "addConstraint:", v73);

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView flashButton](self, "flashButton"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CameraTargetView viewfinderOutsideRegionBottom](self, "viewfinderOutsideRegionBottom"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v75, 10, 0, v76, 10, 1.0, 0.0));
    objc_msgSend(v74, "addConstraint:", v77);

  }
LABEL_5:
  v108.receiver = self;
  v108.super_class = (Class)CameraTargetView;
  -[CameraTargetView updateConstraints](&v108, "updateConstraints");

}

- (CameraTargetViewDelegate)delegate
{
  return (CameraTargetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)flashUIEnabled
{
  return self->_flashUIEnabled;
}

- (int64_t)cameraPresentation
{
  return self->_cameraPresentation;
}

- (void)setCameraPresentation:(int64_t)a3
{
  self->_cameraPresentation = a3;
}

- (UILabel)viewfinderInstruction
{
  return self->_viewfinderInstruction;
}

- (void)setViewfinderInstruction:(id)a3
{
  objc_storeStrong((id *)&self->_viewfinderInstruction, a3);
}

- (UIView)viewfinderOutsideRegionTop
{
  return self->_viewfinderOutsideRegionTop;
}

- (void)setViewfinderOutsideRegionTop:(id)a3
{
  objc_storeStrong((id *)&self->_viewfinderOutsideRegionTop, a3);
}

- (UIView)viewfinderOutsideRegionBottom
{
  return self->_viewfinderOutsideRegionBottom;
}

- (void)setViewfinderOutsideRegionBottom:(id)a3
{
  objc_storeStrong((id *)&self->_viewfinderOutsideRegionBottom, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (void)setFlipButton:(id)a3
{
  objc_storeStrong((id *)&self->_flipButton, a3);
}

- (CAMFlashButton)flashButton
{
  return self->_flashButton;
}

- (void)setFlashButton:(id)a3
{
  objc_storeStrong((id *)&self->_flashButton, a3);
}

- (CAMFlashStatusIndicator)flashIndicator
{
  return self->_flashIndicator;
}

- (void)setFlashIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_flashIndicator, a3);
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (void)setShutterButton:(id)a3
{
  objc_storeStrong((id *)&self->_shutterButton, a3);
}

- (CGSize)flipButtonIntrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_flipButtonIntrinsicContentSize.width;
  height = self->_flipButtonIntrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFlipButtonIntrinsicContentSize:(CGSize)a3
{
  self->_flipButtonIntrinsicContentSize = a3;
}

- (CGSize)shutterButtonIntrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_shutterButtonIntrinsicContentSize.width;
  height = self->_shutterButtonIntrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShutterButtonIntrinsicContentSize:(CGSize)a3
{
  self->_shutterButtonIntrinsicContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->_flashIndicator, 0);
  objc_storeStrong((id *)&self->_flashButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_viewfinderOutsideRegionBottom, 0);
  objc_storeStrong((id *)&self->_viewfinderOutsideRegionTop, 0);
  objc_storeStrong((id *)&self->_viewfinderInstruction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
