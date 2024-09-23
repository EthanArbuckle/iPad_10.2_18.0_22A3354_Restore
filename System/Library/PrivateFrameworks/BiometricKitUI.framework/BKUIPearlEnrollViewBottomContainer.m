@implementation BKUIPearlEnrollViewBottomContainer

- (BKUIPearlEnrollViewBottomContainer)initWithFrame:(CGRect)a3 inBuddy:(BOOL)a4 scrollView:(id)a5 overlapScrollView:(id)a6 delegate:(id)a7 squareNeedsPositionLayout:(BOOL)a8
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  BKUIPearlEnrollViewBottomContainer *v21;
  BKUIPearlEnrollViewBottomContainer *v22;
  id *p_scrollview;
  id *p_overlappingScrollview;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSMutableDictionary *customInstructionStrings;
  uint64_t v43;
  NSMutableDictionary *customDetailStrings;
  void *v45;
  void *v46;
  uint64_t v47;
  objc_super v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v49.receiver = self;
  v49.super_class = (Class)BKUIPearlEnrollViewBottomContainer;
  v21 = -[BKUIPearlEnrollViewBottomContainer initWithFrame:](&v49, sel_initWithFrame_, x, y, width, height);
  v22 = v21;
  if (v21)
  {
    p_scrollview = (id *)&v21->_scrollview;
    objc_storeStrong((id *)&v21->_scrollview, a5);
    p_overlappingScrollview = (id *)&v22->_overlappingScrollview;
    objc_storeStrong((id *)&v22->_overlappingScrollview, a6);
    v22->_squareNeedsPositionLayout = a8;
    objc_msgSend(*p_scrollview, "buttonTray");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "willUseActionDelegate");

    if ((v26 & 1) == 0)
    {
      objc_msgSend(*p_scrollview, "buttonTray");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "nextStateButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addTarget:action:forControlEvents:", v22, sel_nextStateButtonWasPressed_, 0x2000);

      objc_msgSend(*p_scrollview, "buttonTray");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bottomLinkButton");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addTarget:action:forControlEvents:", v22, sel_escapeHatchButtonWasPressed_, 0x2000);

      objc_msgSend(*p_scrollview, "buttonTray");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "topLinkButton");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addTarget:action:forControlEvents:", v22, sel_retryWasPressed_, 0x2000);

    }
    objc_msgSend(*p_overlappingScrollview, "buttonTray");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "willUseActionDelegate");

    if ((v34 & 1) == 0)
    {
      objc_msgSend(*p_overlappingScrollview, "buttonTray");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "nextStateButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addTarget:action:forControlEvents:", v22, sel_nextStateButtonWasPressed_, 0x2000);

      objc_msgSend(*p_overlappingScrollview, "buttonTray");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bottomLinkButton");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addTarget:action:forControlEvents:", v22, sel_escapeHatchButtonWasPressed_, 0x2000);

      objc_msgSend(*p_overlappingScrollview, "buttonTray");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "topLinkButton");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addTarget:action:forControlEvents:", v22, sel_retryWasPressed_, 0x2000);

    }
    v22->_inBuddy = a4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v41 = objc_claimAutoreleasedReturnValue();
    customInstructionStrings = v22->_customInstructionStrings;
    v22->_customInstructionStrings = (NSMutableDictionary *)v41;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = objc_claimAutoreleasedReturnValue();
    customDetailStrings = v22->_customDetailStrings;
    v22->_customDetailStrings = (NSMutableDictionary *)v43;

    objc_storeWeak((id *)&v22->_delegate, v20);
    v22->_overlapValue = 47.0;
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v45, "isZoomEnabled") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "userInterfaceIdiom");

      if (!v47)
        v22->_overlapValue = v22->_overlapValue * 0.800000012;
    }
    else
    {

    }
  }

  return v22;
}

- (void)setupInitialUI
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
  _QWORD v49[10];

  v49[8] = *MEMORY[0x1E0C80C00];
  -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer addSubview:](self, "addSubview:", v3);

  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer addSubview:](self, "addSubview:", v4);

  -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTopToSuperViewConstraint:", v8);

  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer topAnchor](self, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTopToSuperViewConstraint:", v13);

  v36 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topToSuperViewConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v47;
  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer bottomAnchor](self, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v43;
  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer leadingAnchor](self, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v39;
  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer trailingAnchor](self, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v34;
  -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topToSuperViewConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v32;
  -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer bottomAnchor](self, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v28;
  -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer leadingAnchor](self, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v18;
  -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer trailingAnchor](self, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v23);

  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer setOnScreenScrollview:](self, "setOnScreenScrollview:", v24);

  -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer setOffScreenScrollview:](self, "setOffScreenScrollview:", v25);

  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "instructionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer _configureInstructionView:forState:substate:](self, "_configureInstructionView:forState:substate:", v27, 2, 0);

}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6 parentView:(id)a7
{
  -[BKUIPearlEnrollViewBottomContainer prepareForAnimationToState:fromState:subState:advancing:tagAlong:parentView:](self, "prepareForAnimationToState:fromState:subState:advancing:tagAlong:parentView:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, 0, a7);
}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6 tagAlong:(id)a7 parentView:(id)a8
{
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  BKUIScrollableContainer *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSArray *v42;
  NSArray *onscreenScrollViewConstraints;
  void *v44;
  BKUIScrollableContainer *onScreenScrollview;
  void *v46;
  id v47;
  void *v49;
  void *v50;
  id v51;

  v9 = a6;
  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a3;
  v51 = a7;
  v13 = a8;
  -[BKUIPearlEnrollViewBottomContainer _targetScrollViewForState:](self, "_targetScrollViewForState:", v11);
  v14 = (BKUIScrollableContainer *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer instructionView](self, "instructionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "instruction");
  v16 = objc_claimAutoreleasedReturnValue();

  -[BKUIPearlEnrollViewBottomContainer instructionView](self, "instructionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "detail");
  v18 = objc_claimAutoreleasedReturnValue();

  -[BKUIScrollableContainer instructionView](v14, "instructionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer instructionView](self, "instructionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDarkMode:", objc_msgSend(v20, "darkMode"));

  -[BKUIPearlEnrollViewBottomContainer _configureInstructionView:forState:substate:](self, "_configureInstructionView:forState:substate:", v19, v11, v10);
  objc_msgSend(v19, "instruction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v18;
  v50 = (void *)v16;
  if ((objc_msgSend(v21, "isEqualToString:", v16) & 1) != 0)
  {
    objc_msgSend(v19, "detail");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v18;
    v24 = v22;
    v25 = objc_msgSend(v22, "isEqualToString:", v23);

    if ((v25 & 1) != 0)
    {
      -[BKUIScrollableContainer layoutIfNeeded](v14, "layoutIfNeeded");
      -[BKUIScrollableContainer instructionView](v14, "instructionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "layoutIfNeeded");

      objc_msgSend(v13, "setNeedsLayout");
      objc_msgSend(v13, "layoutIfNeeded");
      v27 = v49;
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (v9)
    v28 = 2;
  else
    v28 = 0;
  v29 = v10;
  if (v9)
    v30 = 0;
  else
    v30 = 2;
  -[BKUIPearlEnrollViewBottomContainer _updateTopPaddingAndReturnHorizontalConstraintsForScrollView:state:position:](self, "_updateTopPaddingAndReturnHorizontalConstraintsForScrollView:state:position:", v14, v11, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIScrollableContainer horizontalConstraint](v14, "horizontalConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 0);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v31);
  -[BKUIScrollableContainer setContentOffset:animated:](v14, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[BKUIScrollableContainer layoutIfNeeded](v14, "layoutIfNeeded");
  -[BKUIScrollableContainer instructionView](v14, "instructionView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutIfNeeded");

  -[BKUIPearlEnrollViewBottomContainer _updateButtonVisibilityForScrollView:state:subState:](self, "_updateButtonVisibilityForScrollView:state:subState:", v14, v11, v29);
  -[BKUIScrollableContainer buttonTray](v14, "buttonTray");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer _topPaddingForButtonTray:](self, "_topPaddingForButtonTray:", v34);
  v36 = v35;
  -[BKUIScrollableContainer buttonTrayTopAnchor](v14, "buttonTrayTopAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setConstant:", v36);

  objc_msgSend(v13, "setNeedsLayout");
  v47 = v13;
  objc_msgSend(v13, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v31);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_onscreenScrollViewConstraints);
  v38 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v30;
  -[BKUIPearlEnrollViewBottomContainer _updateTopPaddingAndReturnHorizontalConstraintsForScrollView:state:position:](self, "_updateTopPaddingAndReturnHorizontalConstraintsForScrollView:state:position:", v39, a4, v30);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v41);

  -[BKUIPearlEnrollViewBottomContainer _updateTopPaddingAndReturnHorizontalConstraintsForScrollView:state:position:](self, "_updateTopPaddingAndReturnHorizontalConstraintsForScrollView:state:position:", v14, v11, 1);
  v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
  onscreenScrollViewConstraints = self->_onscreenScrollViewConstraints;
  self->_onscreenScrollViewConstraints = v42;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_onscreenScrollViewConstraints);
  if (v51)
  {
    -[BKUIPearlEnrollViewBottomContainer _horizontalConstraintsForTagAlongTransitionView:state:position:](self, "_horizontalConstraintsForTagAlongTransitionView:state:position:", v51, a4, v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

  }
  onScreenScrollview = self->_onScreenScrollview;
  v27 = v49;
  if (v14 != onScreenScrollview)
  {
    objc_storeStrong((id *)&self->_offScreenScrollview, onScreenScrollview);
    objc_storeStrong((id *)&self->_onScreenScrollview, v14);
  }
  -[BKUIScrollableContainer horizontalConstraint](v14, "horizontalConstraint");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  v13 = v47;
LABEL_16:
  if ((_DWORD)v11 == 10)
  {
    -[BKUIScrollableContainer setIndicatorStyle:](self->_overlappingScrollview, "setIndicatorStyle:", 1);
    -[BKUIScrollableContainer setIndicatorStyle:](self->_scrollview, "setIndicatorStyle:", 1);
  }

}

- (id)_horizontalConstraintsForTagAlongTransitionView:(id)a3 state:(int)a4 position:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = v7;
  if (a5 == 2)
  {
    objc_msgSend(v7, "leftAnchor");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v9 = (void *)v11;
    -[BKUIPearlEnrollViewBottomContainer rightAnchor](self, "rightAnchor");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a5 == 1)
  {
    objc_msgSend(v7, "rightAnchor");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a5)
  {
    v13 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v7, "rightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer leftAnchor](self, "leftAnchor");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v12 = (void *)v10;
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v13;
}

- (id)_updateTopPaddingAndReturnHorizontalConstraintsForScrollView:(id)a3 state:(int)a4 position:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "horizontalConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 0);

  if (a5 == 1)
  {
    objc_msgSend(v8, "scrollContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightAnchor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a5)
    {
      objc_msgSend(v8, "scrollContentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rightAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollViewBottomContainer leftAnchor](self, "leftAnchor");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v8, "scrollContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftAnchor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v13;
  -[BKUIPearlEnrollViewBottomContainer rightAnchor](self, "rightAnchor");
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v14 = (void *)v12;
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHorizontalConstraint:", v15);
  v16 = -[BKUIPearlEnrollViewBottomContainer squareNeedsPositionLayout](self, "squareNeedsPositionLayout");
  if ((a4 - 5) < 0xFFFFFFFE || v16)
    v18 = 0.0;
  else
    v18 = 47.0;
  objc_msgSend(v8, "topToSuperViewConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConstant:", v18);

  if (a4 == 10)
  {
    objc_msgSend(v8, "topToSuperViewConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setConstant:", 0.0);

  }
  v23[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)updateInstructionViewContentForState:(int)a3 substate:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *onscreenScrollViewConstraints;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BKUIPearlEnrollViewBottomContainer *v17;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[BKUIPearlEnrollViewBottomContainer instructionView](self, "instructionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer _configureInstructionView:forState:substate:](self, "_configureInstructionView:forState:substate:", v7, v5, v4);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_onscreenScrollViewConstraints);
  -[BKUIPearlEnrollViewBottomContainer _updateTopPaddingAndReturnHorizontalConstraintsForScrollView:state:position:](self, "_updateTopPaddingAndReturnHorizontalConstraintsForScrollView:state:position:", v8, v5, 1);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  onscreenScrollViewConstraints = self->_onscreenScrollViewConstraints;
  self->_onscreenScrollViewConstraints = v9;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v11 = (void *)MEMORY[0x1E0CD28B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__BKUIPearlEnrollViewBottomContainer_updateInstructionViewContentForState_substate___block_invoke;
  v14[3] = &unk_1EA27FCA0;
  v15 = v7;
  v16 = v8;
  v17 = self;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v11, "setCompletionBlock:", v14);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_onscreenScrollViewConstraints);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[BKUIPearlEnrollViewBottomContainer setNeedsLayout](self, "setNeedsLayout");

}

void __84__BKUIPearlEnrollViewBottomContainer_updateInstructionViewContentForState_substate___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1[4], "setNeedsLayout");
  objc_msgSend(a1[5], "setNeedsLayout");
  objc_msgSend(a1[6], "updateButtonLayout");
  objc_msgSend(a1[6], "layoutIfNeeded");
  objc_msgSend(a1[6], "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  objc_msgSend(a1[6], "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)_configureInstructionView:(id)a3 forState:(int)a4 substate:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *customInstructionStrings;
  void *v9;
  id v10;
  void *v11;
  NSMutableDictionary *customDetailStrings;
  void *v13;
  void *v14;
  id v15;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  customInstructionStrings = self->_customInstructionStrings;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithUnsignedInt:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customInstructionStrings, "objectForKeyedSubscript:", v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[BKUIPearlEnrollViewBottomContainer _instructionTextForState:substate:](self, "_instructionTextForState:substate:", v6, v5);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  customDetailStrings = self->_customDetailStrings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customDetailStrings, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[BKUIPearlEnrollViewBottomContainer _detailTextForState:substate:](self, "_detailTextForState:substate:", v6, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setInstruction:", v15);
  objc_msgSend(v10, "setDetail:", v14);

}

- (id)_instructionTextForState:(int)a3 substate:(int)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *customInstructionStrings;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSTRUCTION_SUBSTATE_%i"), *(_QWORD *)&a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 11)
    {
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentOperationHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bkIdentities");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSTRUCTION_TWO_ENROLLMENTS_SUBSTATE_%i"), 11);
        v23 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v23;
      }
    }
    else
    {
      if (a4 != 15)
        goto LABEL_13;
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentOperationHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEnrollmentAugmentationOnly");

      if (!v9)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSTRUCTION_SUBSTATE_AUGMENTATION_%i"), 15);
      v10 = v6;
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", v6, &stru_1EA281248, CFSTR("Pearl-periocular"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "userInterfaceIdiom");

    if ((v26 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
LABEL_17:

      return v14;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v6, &stru_1EA281248, CFSTR("Pearl-j3xx"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v11 = *(_QWORD *)&a3;
  customInstructionStrings = self->_customInstructionStrings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customInstructionStrings, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[BKUIPearlEnrollViewBottomContainer _locStateNameForState:](self, "_locStateNameForState:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v14 = 0;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSTRUCTION_STATE_%@"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", v15, &stru_1EA281248, CFSTR("Pearl-periocular"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceIdiom");

    if ((v19 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1EA281248, CFSTR("Pearl-j3xx"));
    v20 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v20;
LABEL_15:

LABEL_16:
    v14 = v17;
    goto LABEL_17;
  }
  return v14;
}

- (id)_detailTextForState:(int)a3 substate:(int)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *customDetailStrings;
  void *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  if (!a4)
  {
    v11 = *(_QWORD *)&a3;
    customDetailStrings = self->_customDetailStrings;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](customDetailStrings, "objectForKeyedSubscript:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return v6;
    -[BKUIPearlEnrollViewBottomContainer _locStateDetailedLabelNameForState:](self, "_locStateDetailedLabelNameForState:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v6 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSTRUCTION_DETAIL_STATE_%@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", v9, &stru_1EA281248, CFSTR("Pearl-periocular"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v9, &stru_1EA281248, CFSTR("Pearl-j3xx"));
    v19 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v19;
LABEL_4:

LABEL_5:
    v6 = v10;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSTRUCTION_DETAIL_SUBSTATE_%i"), *(_QWORD *)&a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1EA281248, CFSTR("Pearl-periocular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v4, &stru_1EA281248, CFSTR("Pearl-j3xx"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
LABEL_6:

  return v6;
}

- (void)setCustomInstructionString:(id)a3 forState:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *customInstructionStrings;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  customInstructionStrings = self->_customInstructionStrings;
  if (!customInstructionStrings)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    v8 = self->_customInstructionStrings;
    self->_customInstructionStrings = v7;

    customInstructionStrings = self->_customInstructionStrings;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](customInstructionStrings, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)setCustomDetailString:(id)a3 forState:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *customDetailStrings;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  customDetailStrings = self->_customDetailStrings;
  if (!customDetailStrings)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    v8 = self->_customDetailStrings;
    self->_customDetailStrings = v7;

    customDetailStrings = self->_customDetailStrings;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](customDetailStrings, "setObject:forKeyedSubscript:", v10, v9);

}

- (id)_locStateDetailedLabelNameForState:(int)a3
{
  __CFString *v4;

  -[BKUIPearlEnrollViewBottomContainer _locStateNameForState:](self, "_locStateNameForState:");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a3 == 9)
  {

    v4 = CFSTR("PARTIAL_CAPTURE");
  }
  return v4;
}

- (id)_locStateNameForState:(int)a3
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  __CFString *v61;

  switch(a3)
  {
    case 1:
    case 2:
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "enrollmentConfiguration");

      if (v5 == 4)
        v6 = 0;
      else
        v6 = CFSTR("TUTORIAL");
      return v6;
    case 3:
    case 4:
      v6 = CFSTR("POSITIONING");
      return v6;
    case 5:
      goto LABEL_28;
    case 6:
      goto LABEL_50;
    case 7:
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentOperationHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEnrollmentAugmentationOnly") & 1) != 0)
      {
        -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isFinalEnrollment");

        if (!v19)
          goto LABEL_28;
      }
      else
      {

      }
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "enrollmentConfiguration");

      if (v33 == 4)
      {
LABEL_28:
        v6 = CFSTR("FIRST_SCAN");
        return v6;
      }
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v34, "isFinalEnrollment") & 1) == 0)
        goto LABEL_63;
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "currentOperationHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "currentOperationHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "centerBinComplete");

        v6 = CFSTR("SECOND_SCAN");
        if (v39)
        {
          -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "currentOperationHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isEnrollmentAugmentationOnly");

          v43 = CFSTR("THIRD_SCAN");
LABEL_56:
          if (!v42)
            v6 = (__CFString *)v43;
        }
      }
      else
      {

LABEL_63:
        v6 = CFSTR("SECOND_SCAN");
      }
      return v6;
    case 8:
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentOperationHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isEnrollmentAugmentationOnly"))
      {
        -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isFinalEnrollment"))
        {
          -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "isFinalEnrollment"))
          {
            -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "currentOperationHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "enrollOperation");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26 == 0;

          }
          else
          {
            v27 = 0;
          }

        }
        else
        {
          v27 = 1;
        }

      }
      else
      {
        v27 = 0;
      }

      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "currentOperationHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "isEnrollmentAugmentationOnly"))
      {
        -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "currentOperationHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "glassesFound") ^ 1;

      }
      else
      {
        v48 = 0;
      }

      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "enrollmentConfiguration");

      if (v50 == 4)
      {
        v6 = CFSTR("FACEID_SCAN_COMPLETE");
        return v6;
      }
      if (((v48 | v27) & 1) != 0)
      {
LABEL_50:
        v6 = CFSTR("FIRST_SCAN_COMPLETE");
        return v6;
      }
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v52, "isFinalEnrollment") & 1) == 0)
        goto LABEL_65;
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "currentOperationHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_65:
        v6 = CFSTR("SECOND_SCAN_COMPLETE");
        return v6;
      }
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "currentOperationHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "centerBinComplete");

      v6 = CFSTR("SECOND_SCAN_COMPLETE");
      if (!v57)
        return v6;
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "currentOperationHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v59, "isEnrollmentAugmentationOnly");

      v43 = CFSTR("THIRD_SCAN_COMPLETE");
      goto LABEL_56;
    case 9:
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "currentOperationHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = objc_msgSend(v29, "enrollmentType");
      if (v30 == 3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = 0;
          switch(objc_msgSend(v29, "enrollmentConfiguration"))
          {
            case 0:
              -[BKUIPearlEnrollViewBottomContainer _locStateNameForState:].cold.1();
            case 1:
              v6 = CFSTR("THIRD_SCAN_COMPLETE");
              break;
            case 3:
              v6 = CFSTR("SECOND_SCAN_COMPLETE");
              break;
            case 4:
              v6 = CFSTR("FIRST_SCAN_COMPLETE");
              break;
            default:
              break;
          }
        }
        else
        {
          v60 = objc_msgSend(v29, "isEnrollmentAugmentationOnly");
          v61 = CFSTR("SECOND_SCAN_COMPLETE");
          if (v60)
            v61 = CFSTR("FIRST_SCAN_COMPLETE");
          v6 = v61;
        }
      }
      else
      {
        v31 = CFSTR("FIRST_SCAN_COMPLETE");
        if (v30 != 1)
          v31 = 0;
        if (v30 == 2)
          v6 = CFSTR("SECOND_SCAN_COMPLETE");
        else
          v6 = (__CFString *)v31;
      }

      return v6;
    case 10:
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentOperationHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "supportsPeriocularEnrollment")
        || !-[BKUIPearlEnrollViewBottomContainer inBuddy](self, "inBuddy"))
      {
        goto LABEL_39;
      }
      -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentOperationHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "hasPeriocularEnrollment"))
      {
        -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentOperationHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "canAddPeriocularEnrollment");

        if ((v15 & 1) != 0)
        {
          v6 = CFSTR("PERIOCULAR_ENROLL_FINISHED_BUDDY");
          return v6;
        }
      }
      else
      {

LABEL_39:
      }
      v6 = CFSTR("ENROLL_FINISHED");
      return v6;
    default:
      v6 = 0;
      return v6;
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKUIPearlEnrollViewBottomContainer;
  -[BKUIPearlEnrollViewBottomContainer layoutSubviews](&v4, sel_layoutSubviews);
  -[BKUIPearlEnrollViewBottomContainer instructionView](self, "instructionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (double)_topPaddingForButtonTray:(id)a3
{
  double v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  switch(objc_msgSend(v4, "displayState"))
  {
    case 1:
    case 3:
      objc_msgSend(v4, "nextStateButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alpha");
      if (v6 == 0.0)
        v3 = 25.0;
      else
        v3 = 0.0;
      goto LABEL_6;
    case 2:
      objc_msgSend(v4, "bottomLinkButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "origin");
      v3 = v7;
LABEL_6:

      break;
    case 4:
      objc_msgSend(v4, "size");
      v3 = v8;
      break;
    default:
      break;
  }

  return v3;
}

- (void)finalizeInstructionAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[BKUIPearlEnrollViewBottomContainer buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateButtonLayout");

  -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 0);

  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);

  -[BKUIPearlEnrollViewBottomContainer instructionView](self, "instructionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer bringSubviewToFront:](self, "bringSubviewToFront:", v7);
  -[BKUIPearlEnrollViewBottomContainer setNeedsLayout](self, "setNeedsLayout");
  -[BKUIPearlEnrollViewBottomContainer layoutIfNeeded](self, "layoutIfNeeded");
  objc_msgSend(v7, "contentSize");
  v9 = v8;
  objc_msgSend(v7, "bounds");
  if (v9 > v10)
  {
    objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 1);
    objc_msgSend(v7, "flashScrollIndicators");
  }

}

- (id)_targetScrollViewForState:(int)a3
{
  if (a3 == 2)
    -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  else
    -[BKUIPearlEnrollViewBottomContainer offScreenScrollview](self, "offScreenScrollview");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)buttonTray
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateButtonLayout
{
  id v3;

  -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer _updateButtonVisibilityForScrollView:](self, "_updateButtonVisibilityForScrollView:", v3);

}

- (id)bottomLinkButton
{
  void *v2;
  void *v3;
  void *v4;

  -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomLinkButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextStateButton
{
  void *v2;
  void *v3;
  void *v4;

  -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextStateButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buttonTrayTopAnchor
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTrayTopAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BKUIPearlInstructionView)instructionView
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewBottomContainer onScreenScrollview](self, "onScreenScrollview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instructionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BKUIPearlInstructionView *)v3;
}

- (void)nextStateButtonWasPressed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextStateButtonPressed:", v4);

}

- (void)escapeHatchButtonWasPressed:(id)a3
{
  id v3;

  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "escapeHatchButtonPressed");

}

- (void)retryWasPressed:(id)a3
{
  id v3;

  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retryPressed");

}

- (void)updateButtonVisibility
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BKUIPearlEnrollViewBottomContainer instructionView](self, "instructionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instructionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v5)
    -[BKUIPearlEnrollViewBottomContainer overlappingScrollview](self, "overlappingScrollview");
  else
    -[BKUIPearlEnrollViewBottomContainer scrollview](self, "scrollview");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[BKUIPearlEnrollViewBottomContainer _updateButtonVisibilityForScrollView:](self, "_updateButtonVisibilityForScrollView:", v6);
}

- (void)_updateButtonVisibilityForScrollView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "state");
  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer _updateButtonVisibilityForScrollView:state:subState:](self, "_updateButtonVisibilityForScrollView:state:subState:", v4, v5, objc_msgSend(v6, "substate"));

}

- (void)_updateButtonVisibilityForScrollView:(id)a3 state:(int)a4 subState:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v38 = a3;
  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_nextStateButtonTitleForState:subState:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "state");

  if (v9)
    v12 = v11 != 2;
  else
    v12 = 0;
  if (v11 == 2 && v9)
  {
    -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentOperationHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "canStartEnrollmentOperation");

  }
  objc_msgSend(v38, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nextStateButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v9)
    v18 = 1.0;
  else
    v18 = 0.0;
  objc_msgSend(v16, "setAlpha:", v18);

  objc_msgSend(v38, "buttonTray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "nextStateButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEnabled:", v12);

  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_escapeHatchTitleForState:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "buttonTray");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomLinkButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
    v25 = 1.0;
  else
    v25 = 0.0;
  objc_msgSend(v24, "setAlpha:", v25);

  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "state") != 3)
  {

    objc_msgSend(v38, "buttonTray");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topLinkButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlpha:", 0.0);

    v34 = v38;
LABEL_20:
    objc_msgSend(v34, "buttonTray");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "updateButtonLayout");

    goto LABEL_21;
  }
  -[BKUIPearlEnrollViewBottomContainer delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "currentOperationHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "shouldShowRetryUI");

  objc_msgSend(v38, "buttonTray");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topLinkButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v29)
    v33 = 1.0;
  else
    v33 = 0.0;
  objc_msgSend(v31, "setAlpha:", v33);

  v34 = v38;
  if (!v29)
    goto LABEL_20;
  -[BKUIPearlEnrollViewBottomContainer _updateButtonLayoutForScrollView:](self, "_updateButtonLayoutForScrollView:", v38);
LABEL_21:

}

- (void)_updateButtonLayoutForScrollView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateButtonLayout");

  objc_msgSend(v4, "instructionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  objc_msgSend(v4, "buttonTray");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewBottomContainer _topPaddingForButtonTray:](self, "_topPaddingForButtonTray:", v10);
  v8 = v7;
  objc_msgSend(v4, "buttonTrayTopAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setConstant:", v8);
}

- (void)setInstructionView:(id)a3
{
  objc_storeStrong((id *)&self->_instructionView, a3);
}

- (NSArray)onscreenScrollViewConstraints
{
  return self->_onscreenScrollViewConstraints;
}

- (void)setOnscreenScrollViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_onscreenScrollViewConstraints, a3);
}

- (double)overlapValue
{
  return self->_overlapValue;
}

- (void)setOverlapValue:(double)a3
{
  self->_overlapValue = a3;
}

- (UILayoutGuide)instructionBaselineLayoutGuide
{
  return self->_instructionBaselineLayoutGuide;
}

- (void)setInstructionBaselineLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_instructionBaselineLayoutGuide, a3);
}

- (BKUIScrollableContainer)onScreenScrollview
{
  return self->_onScreenScrollview;
}

- (void)setOnScreenScrollview:(id)a3
{
  objc_storeStrong((id *)&self->_onScreenScrollview, a3);
}

- (BKUIScrollableContainer)offScreenScrollview
{
  return self->_offScreenScrollview;
}

- (void)setOffScreenScrollview:(id)a3
{
  objc_storeStrong((id *)&self->_offScreenScrollview, a3);
}

- (BOOL)squareNeedsPositionLayout
{
  return self->_squareNeedsPositionLayout;
}

- (void)setSquareNeedsPositionLayout:(BOOL)a3
{
  self->_squareNeedsPositionLayout = a3;
}

- (BKUIPearlBottomContainerDelegate)delegate
{
  return (BKUIPearlBottomContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (BKUIPearlInstructionView)animatingInstructionView
{
  return self->_animatingInstructionView;
}

- (void)setAnimatingInstructionView:(id)a3
{
  objc_storeStrong((id *)&self->_animatingInstructionView, a3);
}

- (NSMutableDictionary)customInstructionStrings
{
  return self->_customInstructionStrings;
}

- (void)setCustomInstructionStrings:(id)a3
{
  objc_storeStrong((id *)&self->_customInstructionStrings, a3);
}

- (NSMutableDictionary)customDetailStrings
{
  return self->_customDetailStrings;
}

- (void)setCustomDetailStrings:(id)a3
{
  objc_storeStrong((id *)&self->_customDetailStrings, a3);
}

- (BKUIScrollableContainer)scrollview
{
  return self->_scrollview;
}

- (void)setScrollview:(id)a3
{
  objc_storeStrong((id *)&self->_scrollview, a3);
}

- (BKUIScrollableContainer)overlappingScrollview
{
  return self->_overlappingScrollview;
}

- (void)setOverlappingScrollview:(id)a3
{
  objc_storeStrong((id *)&self->_overlappingScrollview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlappingScrollview, 0);
  objc_storeStrong((id *)&self->_scrollview, 0);
  objc_storeStrong((id *)&self->_customDetailStrings, 0);
  objc_storeStrong((id *)&self->_customInstructionStrings, 0);
  objc_storeStrong((id *)&self->_animatingInstructionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_offScreenScrollview, 0);
  objc_storeStrong((id *)&self->_onScreenScrollview, 0);
  objc_storeStrong((id *)&self->_instructionBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_onscreenScrollViewConstraints, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
}

- (void)_locStateNameForState:.cold.1()
{
  __assert_rtn("-[BKUIPearlEnrollViewBottomContainer _locStateNameForState:]", "BKUIPearlEnrollViewBottomContainer.m", 436, "0");
}

@end
