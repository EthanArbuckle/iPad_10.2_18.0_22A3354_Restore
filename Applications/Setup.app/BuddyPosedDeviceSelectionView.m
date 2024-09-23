@implementation BuddyPosedDeviceSelectionView

+ (double)posedDevicesPadding
{
  return 20.0;
}

- (BuddyPosedDeviceSelectionView)initWithLeftView:(id)a3 centerView:(id)a4 rightView:(id)a5
{
  id v7;
  BuddyPosedDeviceSelectionView *v8;
  id v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSArray *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  BuddyPosedDeviceSelectionView *v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  objc_super v66;
  id v67;
  id v68;
  id location[2];
  id v70;
  _QWORD v71[12];

  v70 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v68 = 0;
  objc_storeStrong(&v68, a4);
  v67 = 0;
  objc_storeStrong(&v67, a5);
  v7 = v70;
  v70 = 0;
  v66.receiver = v7;
  v66.super_class = (Class)BuddyPosedDeviceSelectionView;
  v8 = -[BuddyPosedDeviceSelectionView initWithFrame:](&v66, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v70 = v8;
  objc_storeStrong(&v70, v8);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v10 = (void *)*((_QWORD *)v70 + 5);
    *((_QWORD *)v70 + 5) = v9;

    +[BuddyPosedDeviceSelectionView posedDevicesPadding](BuddyPosedDeviceSelectionView, "posedDevicesPadding");
    objc_msgSend(*((id *)v70 + 5), "setSpacing:", v11 / 2.0);
    objc_msgSend(*((id *)v70 + 5), "setDistribution:", 1);
    objc_msgSend(*((id *)v70 + 5), "setAxis:", 0);
    v12 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v13 = (void *)*((_QWORD *)v70 + 6);
    *((_QWORD *)v70 + 6) = v12;

    v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v15 = (void *)*((_QWORD *)v70 + 7);
    *((_QWORD *)v70 + 7) = v14;

    v16 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v17 = (void *)*((_QWORD *)v70 + 8);
    *((_QWORD *)v70 + 8) = v16;

    objc_storeStrong((id *)v70 + 2, location[0]);
    objc_storeStrong((id *)v70 + 3, v68);
    objc_storeStrong((id *)v70 + 4, v67);
    objc_msgSend(*((id *)v70 + 6), "addSubview:", location[0]);
    objc_msgSend(*((id *)v70 + 7), "addSubview:", v68);
    objc_msgSend(*((id *)v70 + 8), "addSubview:", v67);
    v65 = objc_msgSend(location[0], "centerXAnchor");
    v64 = objc_msgSend(*((id *)v70 + 6), "centerXAnchor");
    v63 = objc_msgSend(v65, "constraintEqualToAnchor:");
    v71[0] = v63;
    v62 = objc_msgSend(location[0], "widthAnchor");
    v61 = objc_msgSend(*((id *)v70 + 6), "widthAnchor");
    v60 = objc_msgSend(v62, "constraintEqualToAnchor:");
    v71[1] = v60;
    v59 = objc_msgSend(location[0], "topAnchor");
    v58 = objc_msgSend(*((id *)v70 + 6), "topAnchor");
    v57 = objc_msgSend(v59, "constraintEqualToAnchor:");
    v71[2] = v57;
    v56 = objc_msgSend(*((id *)v70 + 6), "bottomAnchor");
    v55 = objc_msgSend(location[0], "bottomAnchor");
    v54 = objc_msgSend(v56, "constraintEqualToAnchor:");
    v71[3] = v54;
    v53 = objc_msgSend(v68, "centerXAnchor");
    v52 = objc_msgSend(*((id *)v70 + 7), "centerXAnchor");
    v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
    v71[4] = v51;
    v50 = objc_msgSend(v68, "widthAnchor");
    v49 = objc_msgSend(*((id *)v70 + 7), "widthAnchor");
    v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
    v71[5] = v48;
    v47 = objc_msgSend(v68, "topAnchor");
    v46 = objc_msgSend(*((id *)v70 + 7), "topAnchor");
    v45 = objc_msgSend(v47, "constraintEqualToAnchor:");
    v71[6] = v45;
    v44 = objc_msgSend(*((id *)v70 + 7), "bottomAnchor");
    v43 = objc_msgSend(v68, "bottomAnchor");
    v42 = objc_msgSend(v44, "constraintEqualToAnchor:");
    v71[7] = v42;
    v41 = objc_msgSend(v67, "centerXAnchor");
    v40 = objc_msgSend(*((id *)v70 + 8), "centerXAnchor");
    v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
    v71[8] = v39;
    v18 = objc_msgSend(v67, "widthAnchor");
    v19 = objc_msgSend(*((id *)v70 + 8), "widthAnchor");
    v20 = objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v71[9] = v20;
    v21 = objc_msgSend(v67, "topAnchor");
    v22 = objc_msgSend(*((id *)v70 + 8), "topAnchor");
    v23 = objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v71[10] = v23;
    v24 = objc_msgSend(*((id *)v70 + 8), "bottomAnchor");
    v25 = objc_msgSend(v67, "bottomAnchor");
    v26 = objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v71[11] = v26;
    v27 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 12);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

    objc_msgSend(*((id *)v70 + 5), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v70 + 6), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v70 + 7), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v70 + 8), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v70 + 5), "addArrangedSubview:", *((_QWORD *)v70 + 6));
    objc_msgSend(*((id *)v70 + 5), "addArrangedSubview:", *((_QWORD *)v70 + 7));
    objc_msgSend(*((id *)v70 + 5), "addArrangedSubview:", *((_QWORD *)v70 + 8));
    objc_msgSend(v70, "addSubview:", *((_QWORD *)v70 + 5));
    objc_msgSend(*((id *)v70 + 5), "pinToEdges:", v70);
    v28 = objc_alloc((Class)UITapGestureRecognizer);
    v29 = objc_msgSend(v28, "initWithTarget:action:", v70, "tapped:");
    v30 = (void *)*((_QWORD *)v70 + 9);
    *((_QWORD *)v70 + 9) = v29;

    v31 = objc_alloc((Class)UITapGestureRecognizer);
    v32 = objc_msgSend(v31, "initWithTarget:action:", v70, "tapped:");
    v33 = (void *)*((_QWORD *)v70 + 10);
    *((_QWORD *)v70 + 10) = v32;

    v34 = objc_alloc((Class)UITapGestureRecognizer);
    v35 = objc_msgSend(v34, "initWithTarget:action:", v70, "tapped:");
    v36 = (void *)*((_QWORD *)v70 + 11);
    *((_QWORD *)v70 + 11) = v35;

    objc_msgSend(*((id *)v70 + 6), "addGestureRecognizer:", *((_QWORD *)v70 + 9));
    objc_msgSend(*((id *)v70 + 7), "addGestureRecognizer:", *((_QWORD *)v70 + 10));
    objc_msgSend(*((id *)v70 + 8), "addGestureRecognizer:", *((_QWORD *)v70 + 11));
  }
  v37 = (BuddyPosedDeviceSelectionView *)v70;
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v70, 0);
  return v37;
}

- (void)didMoveToSuperview
{
  BuddyPosedDeviceSelectionView *v2;
  UIView *v3;
  BuddyPosedDeviceSelectionItemView *v4;
  BuddyPosedDeviceSelectionView *v5;
  UIView *v6;
  BuddyPosedDeviceSelectionItemView *v7;
  BuddyPosedDeviceSelectionView *v8;
  UIView *v9;
  BuddyPosedDeviceSelectionItemView *v10;
  objc_super v11;
  SEL v12;
  BuddyPosedDeviceSelectionView *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyPosedDeviceSelectionView;
  -[BuddyPosedDeviceSelectionView didMoveToSuperview](&v11, "didMoveToSuperview");
  v2 = v13;
  v3 = -[BuddyPosedDeviceSelectionView leftContainer](v13, "leftContainer");
  v4 = -[BuddyPosedDeviceSelectionView leftPosedView](v13, "leftPosedView");
  -[BuddyPosedDeviceSelectionView _updateViewContainerForAccessibilityOptions:contents:](v2, "_updateViewContainerForAccessibilityOptions:contents:", v3, v4);

  v5 = v13;
  v6 = -[BuddyPosedDeviceSelectionView centerContainer](v13, "centerContainer");
  v7 = -[BuddyPosedDeviceSelectionView centerPosedView](v13, "centerPosedView");
  -[BuddyPosedDeviceSelectionView _updateViewContainerForAccessibilityOptions:contents:](v5, "_updateViewContainerForAccessibilityOptions:contents:", v6, v7);

  v8 = v13;
  v9 = -[BuddyPosedDeviceSelectionView rightContainer](v13, "rightContainer");
  v10 = -[BuddyPosedDeviceSelectionView rightPosedView](v13, "rightPosedView");
  -[BuddyPosedDeviceSelectionView _updateViewContainerForAccessibilityOptions:contents:](v8, "_updateViewContainerForAccessibilityOptions:contents:", v9, v10);

}

- (void)tapped:(id)a3
{
  id v3;
  id v4;
  double v5;
  double v6;
  BuddyPosedDeviceSelectionItemView *v7;
  double v8;
  double v9;
  UIView *v10;
  UIView *v11;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  UIView *v15;
  id location[2];
  BuddyPosedDeviceSelectionView *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = objc_msgSend(location[0], "view");
  objc_msgSend(v3, "locationInView:", v4);
  v6 = v5;
  v7 = -[BuddyPosedDeviceSelectionView leftPosedView](v17, "leftPosedView");
  -[BuddyPosedDeviceSelectionItemView contentContainerHeight](v7, "contentContainerHeight");
  v9 = v8;

  if (v6 >= v9)
  {
    v10 = (UIView *)objc_msgSend(location[0], "view");
    v11 = -[BuddyPosedDeviceSelectionView leftContainer](v17, "leftContainer");

    if (v10 == v11)
    {
      -[BuddyPosedDeviceSelectionView selectSegment:](v17, "selectSegment:", 0);
    }
    else
    {
      v12 = (UIView *)objc_msgSend(location[0], "view");
      v13 = -[BuddyPosedDeviceSelectionView centerContainer](v17, "centerContainer");

      if (v12 == v13)
      {
        -[BuddyPosedDeviceSelectionView selectSegment:](v17, "selectSegment:", 1);
      }
      else
      {
        v14 = (UIView *)objc_msgSend(location[0], "view");
        v15 = -[BuddyPosedDeviceSelectionView rightContainer](v17, "rightContainer");

        if (v14 == v15)
          -[BuddyPosedDeviceSelectionView selectSegment:](v17, "selectSegment:", 2);
      }
    }
  }
  objc_storeStrong(location, 0);
}

- (void)selectSegment:(int64_t)a3
{
  BuddyPosedDeviceSelectionItemView *v3;
  BuddyPosedDeviceSelectionItemView *v4;
  BuddyPosedDeviceSelectionItemView *v5;
  UIView *v6;
  BuddyPosedDeviceSelectionItemView *v7;
  UIView *v8;
  BuddyPosedDeviceSelectionItemView *v9;
  UIView *v10;
  BuddyPosedDeviceSelectionItemView *v11;
  BuddyPosedDeviceSelectionDelegate *v12;

  v3 = -[BuddyPosedDeviceSelectionView leftPosedView](self, "leftPosedView");
  -[BuddyPosedDeviceSelectionItemView setSelected:](v3, "setSelected:", a3 == 0);

  v4 = -[BuddyPosedDeviceSelectionView centerPosedView](self, "centerPosedView");
  -[BuddyPosedDeviceSelectionItemView setSelected:](v4, "setSelected:", a3 == 1);

  v5 = -[BuddyPosedDeviceSelectionView rightPosedView](self, "rightPosedView");
  -[BuddyPosedDeviceSelectionItemView setSelected:](v5, "setSelected:", a3 == 2);

  v6 = -[BuddyPosedDeviceSelectionView leftContainer](self, "leftContainer");
  v7 = -[BuddyPosedDeviceSelectionView leftPosedView](self, "leftPosedView");
  -[BuddyPosedDeviceSelectionView _updateViewContainerForAccessibilityOptions:contents:](self, "_updateViewContainerForAccessibilityOptions:contents:", v6, v7);

  v8 = -[BuddyPosedDeviceSelectionView centerContainer](self, "centerContainer");
  v9 = -[BuddyPosedDeviceSelectionView centerPosedView](self, "centerPosedView");
  -[BuddyPosedDeviceSelectionView _updateViewContainerForAccessibilityOptions:contents:](self, "_updateViewContainerForAccessibilityOptions:contents:", v8, v9);

  v10 = -[BuddyPosedDeviceSelectionView rightContainer](self, "rightContainer");
  v11 = -[BuddyPosedDeviceSelectionView rightPosedView](self, "rightPosedView");
  -[BuddyPosedDeviceSelectionView _updateViewContainerForAccessibilityOptions:contents:](self, "_updateViewContainerForAccessibilityOptions:contents:", v10, v11);

  v12 = -[BuddyPosedDeviceSelectionView delegate](self, "delegate");
  -[BuddyPosedDeviceSelectionDelegate didSelectSegment:](v12, "didSelectSegment:", a3);

}

+ (id)selectionItemWithImageName:(id)a3 symbolName:(id)a4 segment:(int64_t)a5 text:(id)a6 hostViewLayoutMargins:(NSDirectionalEdgeInsets)a7 posedDevicesPadding:(double)a8
{
  BuddyPosedDeviceSelectionItemAccessoryView *v12;
  BuddyPosedDeviceSelectionItemView *v13;
  BuddyPosedDeviceSelectionItemView *v14;
  id v16;
  id v17[2];
  id v18;
  int64_t v19;
  id v20;
  id location[3];
  NSDirectionalEdgeInsets v22;

  v22 = a7;
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = a5;
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v17[1] = *(id *)&a8;
  v12 = [BuddyPosedDeviceSelectionItemAccessoryView alloc];
  v17[0] = -[BuddyPosedDeviceSelectionItemAccessoryView initWithSymbol:text:](v12, "initWithSymbol:text:", v20, v18);
  v16 = +[UIImage imageNamed:](UIImage, "imageNamed:", location[0]);
  v13 = [BuddyPosedDeviceSelectionItemView alloc];
  v14 = -[BuddyPosedDeviceSelectionItemView initWithContentImage:selectionSegment:accessoryView:hostViewLayoutMargins:posedDevicesPadding:](v13, "initWithContentImage:selectionSegment:accessoryView:hostViewLayoutMargins:posedDevicesPadding:", v16, v19, v17[0], v22.top, v22.leading, v22.bottom, v22.trailing, a8);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v14;
}

- (void)_updateViewContainerForAccessibilityOptions:(id)a3 contents:(id)a4
{
  id v5;
  unint64_t v6;
  id v7;
  id v8;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  objc_msgSend(location[0], "setIsAccessibilityElement:", 1);
  objc_msgSend(location[0], "setAccessibilityTraits:", UIAccessibilityTraitButton);
  if ((objc_msgSend(v8, "selected") & 1) != 0)
  {
    v5 = location[0];
    v6 = (unint64_t)objc_msgSend(location[0], "accessibilityTraits");
    objc_msgSend(v5, "setAccessibilityTraits:", v6 | UIAccessibilityTraitSelected);
  }
  v7 = objc_msgSend(v8, "title");
  objc_msgSend(location[0], "setAccessibilityLabel:", v7);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (BuddyPosedDeviceSelectionDelegate)delegate
{
  return (BuddyPosedDeviceSelectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyPosedDeviceSelectionItemView)leftPosedView
{
  return self->_leftPosedView;
}

- (void)setLeftPosedView:(id)a3
{
  objc_storeStrong((id *)&self->_leftPosedView, a3);
}

- (BuddyPosedDeviceSelectionItemView)centerPosedView
{
  return self->_centerPosedView;
}

- (void)setCenterPosedView:(id)a3
{
  objc_storeStrong((id *)&self->_centerPosedView, a3);
}

- (BuddyPosedDeviceSelectionItemView)rightPosedView
{
  return self->_rightPosedView;
}

- (void)setRightPosedView:(id)a3
{
  objc_storeStrong((id *)&self->_rightPosedView, a3);
}

- (UIStackView)mainContainer
{
  return self->_mainContainer;
}

- (void)setMainContainer:(id)a3
{
  objc_storeStrong((id *)&self->_mainContainer, a3);
}

- (UIView)leftContainer
{
  return self->_leftContainer;
}

- (void)setLeftContainer:(id)a3
{
  objc_storeStrong((id *)&self->_leftContainer, a3);
}

- (UIView)centerContainer
{
  return self->_centerContainer;
}

- (void)setCenterContainer:(id)a3
{
  objc_storeStrong((id *)&self->_centerContainer, a3);
}

- (UIView)rightContainer
{
  return self->_rightContainer;
}

- (void)setRightContainer:(id)a3
{
  objc_storeStrong((id *)&self->_rightContainer, a3);
}

- (UITapGestureRecognizer)leftTap
{
  return self->_leftTap;
}

- (void)setLeftTap:(id)a3
{
  objc_storeStrong((id *)&self->_leftTap, a3);
}

- (UITapGestureRecognizer)centerTap
{
  return self->_centerTap;
}

- (void)setCenterTap:(id)a3
{
  objc_storeStrong((id *)&self->_centerTap, a3);
}

- (UITapGestureRecognizer)rightTap
{
  return self->_rightTap;
}

- (void)setRightTap:(id)a3
{
  objc_storeStrong((id *)&self->_rightTap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightTap, 0);
  objc_storeStrong((id *)&self->_centerTap, 0);
  objc_storeStrong((id *)&self->_leftTap, 0);
  objc_storeStrong((id *)&self->_rightContainer, 0);
  objc_storeStrong((id *)&self->_centerContainer, 0);
  objc_storeStrong((id *)&self->_leftContainer, 0);
  objc_storeStrong((id *)&self->_mainContainer, 0);
  objc_storeStrong((id *)&self->_rightPosedView, 0);
  objc_storeStrong((id *)&self->_centerPosedView, 0);
  objc_storeStrong((id *)&self->_leftPosedView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
