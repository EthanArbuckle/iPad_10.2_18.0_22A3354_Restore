@implementation DOCHorizontalTagDotPicker

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[DOCTagAppearance makerUI](DOCTagAppearance, "makerUI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowOfTagsDotSize");
  v4 = v3;
  objc_msgSend(v2, "rowOfTagsContentInsets");
  v6 = v4 + v5;
  objc_msgSend(v2, "rowOfTagsContentInsets");
  v8 = v6 + v7;

  v9 = 500.0;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (DOCHorizontalTagDotPicker)initWithFrame:(CGRect)a3
{
  DOCHorizontalTagDotPicker *v3;
  DOCHorizontalTagDotPicker *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *dotViews;
  UIGestureRecognizer *v15;
  UIGestureRecognizer *changeColorPanGestureRecognizer;
  UIGestureRecognizer *v17;
  UIGestureRecognizer *changeColorTapGestureRecognizer;
  UIStackView *v19;
  UIStackView *stackView;
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
  UIGestureRecognizer *v51;
  UIGestureRecognizer *v52;
  objc_super v53;
  _QWORD v54[5];
  _QWORD v55[10];

  v55[8] = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)DOCHorizontalTagDotPicker;
  v3 = -[DOCHorizontalTagDotPicker initWithFrame:](&v53, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_selectedTagColor = -1;
    dotViewForColor(0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v5;
    dotViewForColor(6, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v6;
    dotViewForColor(7, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v7;
    dotViewForColor(5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v8;
    dotViewForColor(2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v55[4] = v9;
    dotViewForColor(4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v55[5] = v10;
    dotViewForColor(3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55[6] = v11;
    dotViewForColor(1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v55[7] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 8);
    v13 = objc_claimAutoreleasedReturnValue();
    dotViews = v4->_dotViews;
    v4->_dotViews = (NSArray *)v13;

    v15 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", v4, sel_handleChangeColor_);
    -[UIGestureRecognizer setMinimumNumberOfTouches:](v15, "setMinimumNumberOfTouches:", 1);
    -[UIGestureRecognizer setMaximumNumberOfTouches:](v15, "setMaximumNumberOfTouches:", 1);
    -[UIGestureRecognizer _setCanPanVertically:](v15, "_setCanPanVertically:", 0);
    -[UIGestureRecognizer _setHysteresis:](v15, "_setHysteresis:", 0.0);
    changeColorPanGestureRecognizer = v4->_changeColorPanGestureRecognizer;
    v4->_changeColorPanGestureRecognizer = v15;
    v52 = v15;

    v17 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", v4, sel_handleChangeColor_);
    -[UIGestureRecognizer setMinimumPressDuration:](v17, "setMinimumPressDuration:", 0.0);
    changeColorTapGestureRecognizer = v4->_changeColorTapGestureRecognizer;
    v4->_changeColorTapGestureRecognizer = v17;
    v51 = v17;

    v19 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = v4->_stackView;
    v4->_stackView = v19;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_stackView, "setAxis:", 0);
    -[UIStackView doc_addFlexiblySpacedArrangedSubviews:minSpacing:maxSpacing:](v4->_stackView, "doc_addFlexiblySpacedArrangedSubviews:minSpacing:maxSpacing:", v4->_dotViews, 1.0, 35.0);
    -[DOCHorizontalTagDotPicker setSelectedTagColor:](v4, "setSelectedTagColor:", 0);
    -[DOCHorizontalTagDotPicker stackView](v4, "stackView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCHorizontalTagDotPicker addSubview:](v4, "addSubview:", v21);

    -[DOCHorizontalTagDotPicker changeColorTapGestureRecognizer](v4, "changeColorTapGestureRecognizer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCHorizontalTagDotPicker addGestureRecognizer:](v4, "addGestureRecognizer:", v22);

    -[DOCHorizontalTagDotPicker changeColorPanGestureRecognizer](v4, "changeColorPanGestureRecognizer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCHorizontalTagDotPicker addGestureRecognizer:](v4, "addGestureRecognizer:", v23);

    -[DOCHorizontalTagDotPicker changeColorPanGestureRecognizer](v4, "changeColorPanGestureRecognizer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCHorizontalTagDotPicker changeColorTapGestureRecognizer](v4, "changeColorTapGestureRecognizer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "requireGestureRecognizerToFail:", v25);

    v39 = (void *)MEMORY[0x24BDD1628];
    -[DOCHorizontalTagDotPicker stackView](v4, "stackView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCHorizontalTagDotPicker layoutMarginsGuide](v4, "layoutMarginsGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v46;
    -[DOCHorizontalTagDotPicker stackView](v4, "stackView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCHorizontalTagDotPicker layoutMarginsGuide](v4, "layoutMarginsGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v41;
    -[DOCHorizontalTagDotPicker stackView](v4, "stackView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCHorizontalTagDotPicker centerXAnchor](v4, "centerXAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v36;
    -[DOCHorizontalTagDotPicker stackView](v4, "stackView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCHorizontalTagDotPicker topAnchor](v4, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v29;
    -[DOCHorizontalTagDotPicker stackView](v4, "stackView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCHorizontalTagDotPicker bottomAnchor](v4, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54[4] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v34);

  }
  return v4;
}

- (void)setSelectedTagColor:(int64_t)a3
{
  void *v5;
  id v6;

  if (self->_selectedTagColor != a3)
  {
    -[DOCHorizontalTagDotPicker selectedTagDotView](self, "selectedTagDotView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChecked:", 0);

    self->_selectedTagColor = a3;
    -[DOCHorizontalTagDotPicker selectedTagDotView](self, "selectedTagDotView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setChecked:", 1);

  }
}

- (id)selectedTagDotView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  switch(-[DOCHorizontalTagDotPicker selectedTagColor](self, "selectedTagColor"))
  {
    case 0:
      -[DOCHorizontalTagDotPicker dotViews](self, "dotViews");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 0;
      goto LABEL_11;
    case 1:
      -[DOCHorizontalTagDotPicker dotViews](self, "dotViews");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 7;
      goto LABEL_11;
    case 2:
      -[DOCHorizontalTagDotPicker dotViews](self, "dotViews");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 4;
      goto LABEL_11;
    case 3:
      -[DOCHorizontalTagDotPicker dotViews](self, "dotViews");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 6;
      goto LABEL_11;
    case 4:
      -[DOCHorizontalTagDotPicker dotViews](self, "dotViews");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 5;
      goto LABEL_11;
    case 5:
      -[DOCHorizontalTagDotPicker dotViews](self, "dotViews");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 3;
      goto LABEL_11;
    case 6:
      -[DOCHorizontalTagDotPicker dotViews](self, "dotViews");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 1;
      goto LABEL_11;
    case 7:
      -[DOCHorizontalTagDotPicker dotViews](self, "dotViews");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 2;
LABEL_11:
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (void)handleChangeColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  switch(objc_msgSend(v8, "state"))
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DOCHorizontalTagDotPicker selectedTagColor](self, "selectedTagColor"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCHorizontalTagDotPicker setPreviousSelectedTagColor:](self, "setPreviousSelectedTagColor:", v4);

      goto LABEL_3;
    case 2:
LABEL_3:
      -[DOCHorizontalTagDotPicker stackView](self, "stackView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "locationInView:", v5);
      -[DOCHorizontalTagDotPicker setSelectedTagColorForLocation:](self, "setSelectedTagColorForLocation:");

      goto LABEL_7;
    case 3:
      goto LABEL_6;
    case 4:
      -[DOCHorizontalTagDotPicker previousSelectedTagColor](self, "previousSelectedTagColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_7;
      -[DOCHorizontalTagDotPicker previousSelectedTagColor](self, "previousSelectedTagColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCHorizontalTagDotPicker setSelectedTagColor:](self, "setSelectedTagColor:", objc_msgSend(v7, "integerValue"));

LABEL_6:
      -[DOCHorizontalTagDotPicker setPreviousSelectedTagColor:](self, "setPreviousSelectedTagColor:", 0);
LABEL_7:

      return;
    default:
      goto LABEL_7;
  }
}

- (void)setSelectedTagColorForLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGPoint v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DOCHorizontalTagDotPicker dotViews](self, "dotViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "frame");
        v18.x = x;
        v18.y = y;
        if (CGRectContainsPoint(v19, v18))
        {
          -[DOCHorizontalTagDotPicker setSelectedTagColor:](self, "setSelectedTagColor:", objc_msgSend(v11, "tagColor"));
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (int64_t)selectedTagColor
{
  return self->_selectedTagColor;
}

- (UIGestureRecognizer)changeColorTapGestureRecognizer
{
  return self->_changeColorTapGestureRecognizer;
}

- (UIGestureRecognizer)changeColorPanGestureRecognizer
{
  return self->_changeColorPanGestureRecognizer;
}

- (NSArray)dotViews
{
  return self->_dotViews;
}

- (NSNumber)previousSelectedTagColor
{
  return self->_previousSelectedTagColor;
}

- (void)setPreviousSelectedTagColor:(id)a3
{
  objc_storeStrong((id *)&self->_previousSelectedTagColor, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_previousSelectedTagColor, 0);
  objc_storeStrong((id *)&self->_dotViews, 0);
  objc_storeStrong((id *)&self->_changeColorPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_changeColorTapGestureRecognizer, 0);
}

@end
