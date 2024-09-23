@implementation BKUIContainerScrollView

- (BKUIContainerScrollView)initWithFrame:(CGRect)a3 buttonTray:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  BKUIContainerScrollView *v11;
  id v12;
  uint64_t v13;
  UIView *scrollContentView;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *horizontalConstraint;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BKUIPearlInstructionView *v26;
  BKUIPearlInstructionView *instructionView;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *instructionViewTopConstraint;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *buttonTrayTopAnchor;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSLayoutConstraint *pinButtonTrayToScrollViewBottomConstraint;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id obj;
  id v67;
  objc_super v68;
  objc_super v69;
  objc_super v70;
  objc_super v71;
  objc_super v72;
  _QWORD v73[5];
  _QWORD v74[3];
  _QWORD v75[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v75[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v72.receiver = self;
  v72.super_class = (Class)BKUIContainerScrollView;
  v11 = -[BKUIContainerScrollView initWithFrame:](&v72, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    scrollContentView = v11->_scrollContentView;
    v11->_scrollContentView = (UIView *)v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_scrollContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIContainerScrollView addSubview:](v11, "addSubview:", v11->_scrollContentView);
    -[UIView centerXAnchor](v11->_scrollContentView, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIContainerScrollView centerXAnchor](v11, "centerXAnchor");
    obj = a4;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    horizontalConstraint = v11->_horizontalConstraint;
    v11->_horizontalConstraint = (NSLayoutConstraint *)v17;

    v57 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v11->_scrollContentView, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIContainerScrollView topAnchor](v11, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v61);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v59;
    -[UIView widthAnchor](v11->_scrollContentView, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIContainerScrollView widthAnchor](v11, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v21;
    -[UIView bottomAnchor](v11->_scrollContentView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIContainerScrollView bottomAnchor](v11, "bottomAnchor");
    v67 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2] = v24;
    v75[3] = v11->_horizontalConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v25);

    v26 = objc_alloc_init(BKUIPearlInstructionView);
    instructionView = v11->_instructionView;
    v11->_instructionView = v26;

    -[BKUIPearlInstructionView setTranslatesAutoresizingMaskIntoConstraints:](v11->_instructionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v11->_scrollContentView, "addSubview:", v11->_instructionView);
    -[BKUIPearlInstructionView topAnchor](v11->_instructionView, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v11->_scrollContentView, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    instructionViewTopConstraint = v11->_instructionViewTopConstraint;
    v11->_instructionViewTopConstraint = (NSLayoutConstraint *)v30;

    objc_storeStrong((id *)&v11->_buttonTray, obj);
    -[BKUIButtonTray setTranslatesAutoresizingMaskIntoConstraints:](v11->_buttonTray, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIPearlInstructionView bottomAnchor](v11->_instructionView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray topAnchor](v11->_buttonTray, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:constant:", v33, -25.0);
    v34 = objc_claimAutoreleasedReturnValue();
    buttonTrayTopAnchor = v11->_buttonTrayTopAnchor;
    v11->_buttonTrayTopAnchor = (NSLayoutConstraint *)v34;

    v64 = (void *)MEMORY[0x1E0CB3718];
    v74[0] = v11->_instructionViewTopConstraint;
    -[BKUIPearlInstructionView leadingAnchor](v11->_instructionView, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v11->_scrollContentView, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v38;
    -[BKUIPearlInstructionView trailingAnchor](v11->_instructionView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v11->_scrollContentView, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "activateConstraints:", v42);

    -[UIView addSubview:](v11->_scrollContentView, "addSubview:", v11->_buttonTray);
    -[UIView heightAnchor](v11->_scrollContentView, "heightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIContainerScrollView heightAnchor](v11, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintGreaterThanOrEqualToAnchor:", v62);
    v43 = objc_claimAutoreleasedReturnValue();
    pinButtonTrayToScrollViewBottomConstraint = v11->_pinButtonTrayToScrollViewBottomConstraint;
    v11->_pinButtonTrayToScrollViewBottomConstraint = (NSLayoutConstraint *)v43;

    v58 = (void *)MEMORY[0x1E0CB3718];
    -[BKUIButtonTray bottomAnchor](v11->_buttonTray, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v11->_scrollContentView, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v46;
    v73[1] = v11->_pinButtonTrayToScrollViewBottomConstraint;
    -[BKUIButtonTray leadingAnchor](v11->_buttonTray, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v11->_scrollContentView, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v49;
    -[BKUIButtonTray trailingAnchor](v11->_buttonTray, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v11->_scrollContentView, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v52;
    v73[4] = v11->_buttonTrayTopAnchor;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "activateConstraints:", v53);

    v10 = v67;
    v71.receiver = v11;
    v71.super_class = (Class)BKUIContainerScrollView;
    -[BKUIContainerScrollView setTranslatesAutoresizingMaskIntoConstraints:](&v71, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v54 = *MEMORY[0x1E0C9D820];
    v55 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v70.receiver = v11;
    v70.super_class = (Class)BKUIContainerScrollView;
    -[BKUIContainerScrollView setContentSize:](&v70, sel_setContentSize_, v54, v55);
    v69.receiver = v11;
    v69.super_class = (Class)BKUIContainerScrollView;
    -[BKUIContainerScrollView setIndicatorStyle:](&v69, sel_setIndicatorStyle_, 2);
    v68.receiver = v11;
    v68.super_class = (Class)BKUIContainerScrollView;
    -[BKUIContainerScrollView setContentInsetAdjustmentBehavior:](&v68, sel_setContentInsetAdjustmentBehavior_, 2);
  }

  return v11;
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (void)setScrollContentView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollContentView, a3);
}

- (BKUIPearlInstructionView)instructionView
{
  return self->_instructionView;
}

- (void)setInstructionView:(id)a3
{
  objc_storeStrong((id *)&self->_instructionView, a3);
}

- (BKUIPearlInstructionView)animatingInstructionView
{
  return self->_animatingInstructionView;
}

- (void)setAnimatingInstructionView:(id)a3
{
  objc_storeStrong((id *)&self->_animatingInstructionView, a3);
}

- (BKUIButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTray, a3);
}

- (NSLayoutConstraint)pinButtonTrayToScrollViewBottomConstraint
{
  return self->_pinButtonTrayToScrollViewBottomConstraint;
}

- (void)setPinButtonTrayToScrollViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pinButtonTrayToScrollViewBottomConstraint, a3);
}

- (NSLayoutConstraint)horizontalConstraint
{
  return self->_horizontalConstraint;
}

- (void)setHorizontalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalConstraint, a3);
}

- (NSLayoutConstraint)instructionViewTopConstraint
{
  return self->_instructionViewTopConstraint;
}

- (void)setInstructionViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_instructionViewTopConstraint, a3);
}

- (NSLayoutConstraint)buttonTrayTopAnchor
{
  return self->_buttonTrayTopAnchor;
}

- (void)setButtonTrayTopAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTrayTopAnchor, a3);
}

- (NSLayoutConstraint)topToSuperViewConstraint
{
  return self->_topToSuperViewConstraint;
}

- (void)setTopToSuperViewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topToSuperViewConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topToSuperViewConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTrayTopAnchor, 0);
  objc_storeStrong((id *)&self->_instructionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalConstraint, 0);
  objc_storeStrong((id *)&self->_pinButtonTrayToScrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_animatingInstructionView, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_scrollContentView, 0);
}

@end
