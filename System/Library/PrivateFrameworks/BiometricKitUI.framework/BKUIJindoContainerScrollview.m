@implementation BKUIJindoContainerScrollview

- (BKUIJindoContainerScrollview)initWithFrame:(CGRect)a3 buttonTray:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  BKUIJindoContainerScrollview *v11;
  uint64_t v12;
  UIScrollView *scrollview;
  id v14;
  uint64_t v15;
  UIView *scrollContentView;
  void *v17;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *horizontalConstraint;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BKUIPearlInstructionView *v29;
  BKUIPearlInstructionView *instructionView;
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
  uint64_t v42;
  NSLayoutConstraint *buttonTrayTopAnchor;
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
  id obj;
  id obja;
  id v75;
  objc_super v76;
  _QWORD v77[7];
  _QWORD v78[4];
  _QWORD v79[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v79[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v76.receiver = self;
  v76.super_class = (Class)BKUIJindoContainerScrollview;
  v11 = -[BKUIJindoContainerScrollview initWithFrame:](&v76, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA970]), "initWithFrame:", x, y, width, height);
    scrollview = v11->_scrollview;
    v11->_scrollview = (UIScrollView *)v12;

    -[UIScrollView setContentInsetAdjustmentBehavior:](v11->_scrollview, "setContentInsetAdjustmentBehavior:", 2);
    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v11->_scrollview, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIJindoContainerScrollview addSubview:](v11, "addSubview:", v11->_scrollview);
    v14 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    scrollContentView = v11->_scrollContentView;
    v11->_scrollContentView = (UIView *)v15;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_scrollContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView addSubview:](v11->_scrollview, "addSubview:", v11->_scrollContentView);
    -[UIView centerXAnchor](v11->_scrollContentView, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIJindoContainerScrollview centerXAnchor](v11, "centerXAnchor");
    v75 = v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    obj = a4;
    horizontalConstraint = v11->_horizontalConstraint;
    v11->_horizontalConstraint = (NSLayoutConstraint *)v19;

    v64 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v11->_scrollContentView, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView topAnchor](v11->_scrollview, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v67);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v21;
    -[UIView widthAnchor](v11->_scrollContentView, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView widthAnchor](v11->_scrollview, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v24;
    -[UIView bottomAnchor](v11->_scrollContentView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView bottomAnchor](v11->_scrollview, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v27;
    v79[3] = v11->_horizontalConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "activateConstraints:", v28);

    v29 = objc_alloc_init(BKUIPearlInstructionView);
    instructionView = v11->_instructionView;
    v11->_instructionView = v29;

    -[BKUIPearlInstructionView setTranslatesAutoresizingMaskIntoConstraints:](v11->_instructionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v11->_scrollContentView, "addSubview:", v11->_instructionView);
    v60 = (void *)MEMORY[0x1E0CB3718];
    -[BKUIPearlInstructionView topAnchor](v11->_instructionView, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v11->_scrollContentView, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v68);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v65;
    -[BKUIPearlInstructionView leadingAnchor](v11->_instructionView, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v11->_scrollContentView, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v32;
    -[BKUIPearlInstructionView trailingAnchor](v11->_instructionView, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v11->_scrollContentView, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v35;
    -[BKUIPearlInstructionView bottomAnchor](v11->_instructionView, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v11->_scrollContentView, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "activateConstraints:", v39);

    objc_storeStrong((id *)&v11->_buttonTray, obj);
    -[BKUIButtonTray setTranslatesAutoresizingMaskIntoConstraints:](v11->_buttonTray, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIJindoContainerScrollview addSubview:](v11, "addSubview:", v11->_buttonTray);
    -[UIScrollView bottomAnchor](v11->_scrollview, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray topAnchor](v11->_buttonTray, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = objc_claimAutoreleasedReturnValue();
    buttonTrayTopAnchor = v11->_buttonTrayTopAnchor;
    v11->_buttonTrayTopAnchor = (NSLayoutConstraint *)v42;

    v58 = (void *)MEMORY[0x1E0CB3718];
    -[UIScrollView topAnchor](v11->_scrollview, "topAnchor");
    obja = (id)objc_claimAutoreleasedReturnValue();
    -[BKUIJindoContainerScrollview topAnchor](v11, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obja, "constraintEqualToAnchor:", v72);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v69;
    -[UIScrollView leadingAnchor](v11->_scrollview, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIJindoContainerScrollview leadingAnchor](v11, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v63);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v61;
    -[UIScrollView trailingAnchor](v11->_scrollview, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIJindoContainerScrollview trailingAnchor](v11, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v56;
    v77[3] = v11->_buttonTrayTopAnchor;
    -[BKUIButtonTray bottomAnchor](v11->_buttonTray, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIJindoContainerScrollview bottomAnchor](v11, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v77[4] = v45;
    -[BKUIButtonTray leadingAnchor](v11->_buttonTray, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v11->_scrollContentView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v77[5] = v48;
    -[BKUIButtonTray trailingAnchor](v11->_buttonTray, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v11->_scrollContentView, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v77[6] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 7);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "activateConstraints:", v52);

    v10 = v75;
    -[UIScrollView setContentSize:](v11->_scrollview, "setContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[UIScrollView setIndicatorStyle:](v11->_scrollview, "setIndicatorStyle:", 2);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v11->_scrollview, "setContentInsetAdjustmentBehavior:", 2);
    -[BKUIJindoContainerScrollview setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIJindoContainerScrollview layer](v11, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setMasksToBounds:", 1);

  }
  return v11;
}

- (void)setIndicatorStyle:(int64_t)a3
{
  id v4;

  -[BKUIJindoContainerScrollview scrollview](self, "scrollview");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIndicatorStyle:", a3);

}

- (int64_t)indicatorStyle
{
  void *v2;
  int64_t v3;

  -[BKUIJindoContainerScrollview scrollview](self, "scrollview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indicatorStyle");

  return v3;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[BKUIJindoContainerScrollview scrollview](self, "scrollview");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", v3);

}

- (BOOL)showsVerticalScrollIndicator
{
  void *v2;
  char v3;

  -[BKUIJindoContainerScrollview scrollview](self, "scrollview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsVerticalScrollIndicator");

  return v3;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  id v7;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[BKUIJindoContainerScrollview scrollview](self, "scrollview");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:animated:", v4, x, y);

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

- (UIScrollView)scrollview
{
  return self->_scrollview;
}

- (void)setScrollview:(id)a3
{
  objc_storeStrong((id *)&self->_scrollview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollview, 0);
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
