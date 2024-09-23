@implementation GKContactSkipControl

- (GKContactSkipControl)initWithFrame:(CGRect)a3
{
  GKContactSkipControl *v3;
  GKContactSkipControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKContactSkipControl;
  v3 = -[GKContactSkipControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[GKContactSkipControl setupButtonView](v3, "setupButtonView");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKContactSkipControl;
  -[GKContactSkipControl awakeFromNib](&v3, sel_awakeFromNib);
  -[GKContactSkipControl setupButtonView](self, "setupButtonView");
}

- (void)setupButtonView
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  UIView *centeringView;
  void *v14;
  UIView *buttonView;
  void *v16;
  UIView *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if (!self->_buttonView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[GKContactSkipControl bounds](self, "bounds");
    v4 = (void *)objc_msgSend(v3, "initWithFrame:");
    -[GKContactSkipControl setButtonView:](self, "setButtonView:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_buttonView, "setBackgroundColor:", v5);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKContactSkipControl addSubview:](self, "addSubview:", self->_buttonView);
    v6 = *MEMORY[0x1E0DC49E8];
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintsForView:withinView:insets:", self->_buttonView, self, *MEMORY[0x1E0DC49E8], v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKContactSkipControl addConstraints:](self, "addConstraints:", v10);

    v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[UIView bounds](self->_buttonView, "bounds");
    v12 = (void *)objc_msgSend(v11, "initWithFrame:");
    -[GKContactSkipControl setCenteringView:](self, "setCenteringView:", v12);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_centeringView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_buttonView, "addSubview:", self->_centeringView);
    centeringView = self->_centeringView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", centeringView, 7, 0, 0, 0, 1.0, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](centeringView, "addConstraint:", v14);

    buttonView = self->_buttonView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_centeringView, 1, 0, buttonView, 1, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](buttonView, "addConstraint:", v16);

    v17 = self->_buttonView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_centeringView, 10, 0, v17, 10, 1.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v17, "addConstraint:", v18);

    -[UIView setHidden:](self->_centeringView, "setHidden:", 1);
    v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[GKContactSkipControl bounds](self, "bounds");
    v24 = (id)objc_msgSend(v19, "initWithFrame:");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", v20);

    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_determineButtonFromGesture_);
    objc_msgSend(v24, "addGestureRecognizer:", v21);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_determineButtonFromGesture_);
    objc_msgSend(v24, "addGestureRecognizer:", v22);

    -[GKContactSkipControl addSubview:](self, "addSubview:", v24);
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintsForView:withinView:insets:", v24, self, v6, v7, v8, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKContactSkipControl addConstraints:](self, "addConstraints:", v23);

  }
}

- (void)setValues:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToArray:", self->_values) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_values, a3);
    -[GKContactSkipControl setupValueButtons](self, "setupValueButtons");
  }

}

- (id)compactPhoneValues:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)-[NSArray count](self->_values, "count") + -1.0;
  if (v6 > 0.0)
  {
    v7 = 0.0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", llround(v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      objc_msgSend(v5, "addObject:", CFSTR("•"));
      v7 = v6 / (double)a3 + v7;
    }
    while (v7 < v6);
  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("#")))
  {
    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("•"));

    if (v10)
      objc_msgSend(v5, "removeLastObject");
  }
  else if (-[NSArray count](self->_values, "count"))
  {
    -[NSArray lastObject](self->_values, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)nextTitleFollowingValue:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  void *v6;

  v4 = -[NSArray indexOfObject:](self->_values, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v5 = v4 + 1, v4 + 1 >= -[NSArray count](self->_values, "count")))
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (int64_t)valueButtonCountThatFitsHeight:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  int64_t v16;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  -[UIView frame](self->_buttonView, "frame");
  objc_msgSend(v5, "setFrame:", v7, v9);
  v10 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "smallSystemFontSize");
  objc_msgSend(v10, "systemFontOfSize:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  objc_msgSend(v5, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v5, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextAlignment:", 1);

  objc_msgSend(v5, "setTitle:forState:", CFSTR("A"), 0);
  objc_msgSend(v5, "setTitleEdgeInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v5, "setContentEdgeInsets:", -1.0, 0.0, -1.0, 0.0);
  objc_msgSend(v5, "sizeToFit");
  objc_msgSend(v5, "bounds");
  v16 = (uint64_t)(a3 / v15);

  return v16;
}

- (void)setupValueButtons
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSArray *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  UIView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  UIView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  NSMutableDictionary *buttonsToTitles;
  void *v34;
  UIView *buttonView;
  void *v36;
  UIView *v37;
  void *v38;
  UIView *v39;
  double v40;
  UIView *v41;
  UIView *centeringView;
  uint64_t v43;
  void *v44;
  UIView *v45;
  void *v46;
  NSArray *obj;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v3 = self->_buttons;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v57 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "removeFromSuperview");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_values, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKContactSkipControl setButtonsToTitles:](self, "setButtonsToTitles:", v8);

  v9 = self->_values;
  -[UIView frame](self->_buttonView, "frame");
  v11 = -[GKContactSkipControl valueButtonCountThatFitsHeight:](self, "valueButtonCountThatFitsHeight:", v10);
  if (v11 < -[NSArray count](self->_values, "count"))
  {
    if (v11 >= 0)
      v12 = v11;
    else
      v12 = v11 + 1;
    -[GKContactSkipControl compactPhoneValues:](self, "compactPhoneValues:", v12 >> 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (NSArray *)v13;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v9, "count"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v15 = v9;
  v50 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  v16 = 0;
  if (!v50)
  {
    v46 = v15;
    goto LABEL_29;
  }
  v48 = *(_QWORD *)v53;
  v17 = *MEMORY[0x1E0DC49E8];
  v18 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v51 = 1;
  v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  obj = v15;
  do
  {
    v21 = 0;
    v22 = v16;
    do
    {
      if (*(_QWORD *)v53 != v48)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v21);
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
      v16 = (UIView *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend(MEMORY[0x1E0DC1350], "smallSystemFontSize");
      objc_msgSend(v24, "systemFontOfSize:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView titleLabel](v16, "titleLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFont:", v25);

      -[UIView titleLabel](v16, "titleLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAdjustsFontSizeToFitWidth:", 1);

      -[UIView titleLabel](v16, "titleLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTextAlignment:", 1);

      -[GKContactSkipControl tintColor](self, "tintColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTitleColor:forState:](v16, "setTitleColor:forState:", v29, 0);

      -[UIView setTitle:forState:](v16, "setTitle:forState:", v23, 0);
      -[UIView setTitleEdgeInsets:](v16, "setTitleEdgeInsets:", v17, v18, v19, v20);
      -[UIView setContentEdgeInsets:](v16, "setContentEdgeInsets:", -1.0, 0.0, -1.0, 0.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v30);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v31 = v23;
      if (objc_msgSend(v31, "isEqualToString:", CFSTR("•")))
      {
        -[GKContactSkipControl nextTitleFollowingValue:](self, "nextTitleFollowingValue:", v14);
        v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = v31;
        v31 = v14;
        v14 = v32;
      }

      -[UIView setTag:](v16, "setTag:", v51 + v21);
      buttonsToTitles = self->_buttonsToTitles;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UIView tag](v16, "tag"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](buttonsToTitles, "setObject:forKey:", v32, v34);

      objc_msgSend(v49, "addObject:", v16);
      -[UIView addSubview:](self->_buttonView, "addSubview:", v16);
      buttonView = self->_buttonView;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 1, 0, buttonView, 1, 1.0, 0.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](buttonView, "addConstraint:", v36);

      v37 = self->_buttonView;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 2, 0, v37, 2, 1.0, 0.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v37, "addConstraint:", v38);

      v39 = self->_buttonView;
      if (v22)
      {
        v40 = 1.0;
        v41 = v16;
        centeringView = v22;
        v43 = 4;
      }
      else
      {
        centeringView = self->_centeringView;
        v40 = 1.0;
        v41 = v16;
        v43 = 3;
      }
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 3, 0, centeringView, v43, v40, 0.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v39, "addConstraint:", v44);

      ++v21;
      v22 = v16;
    }
    while (v50 != v21);
    v15 = obj;
    v50 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    v51 += v21;
  }
  while (v50);

  if (v16)
  {
    v45 = self->_buttonView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 4, 0, self->_centeringView, 4, 1.0, 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v45, "addConstraint:", v46);
LABEL_29:

  }
  -[GKContactSkipControl setButtons:](self, "setButtons:", v49);

}

- (void)determineButtonFromGesture:(id)a3
{
  id v4;

  objc_msgSend(a3, "locationInView:", self->_buttonView);
  -[UIView hitTest:withEvent:](self->_buttonView, "hitTest:withEvent:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[GKContactSkipControl valueSelected:](self, "valueSelected:", v4);

}

- (void)valueSelected:(id)a3
{
  NSMutableDictionary *buttonsToTitles;
  uint64_t v5;
  void *v6;
  id v7;

  buttonsToTitles = self->_buttonsToTitles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "tag"));
  v5 = objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonsToTitles, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[GKContactSkipControl lastSelectedValue](self, "lastSelectedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v5 & 1) == 0)
  {
    -[GKContactSkipControl setLastSelectedValue:](self, "setLastSelectedValue:", v7);
    -[GKContactSkipControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }

}

- (NSArray)values
{
  return self->_values;
}

- (NSString)lastSelectedValue
{
  return self->_lastSelectedValue;
}

- (void)setLastSelectedValue:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedValue, a3);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (UIView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonView, a3);
}

- (UIView)centeringView
{
  return self->_centeringView;
}

- (void)setCenteringView:(id)a3
{
  objc_storeStrong((id *)&self->_centeringView, a3);
}

- (NSMutableDictionary)buttonsToTitles
{
  return self->_buttonsToTitles;
}

- (void)setButtonsToTitles:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsToTitles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsToTitles, 0);
  objc_storeStrong((id *)&self->_centeringView, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_lastSelectedValue, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
