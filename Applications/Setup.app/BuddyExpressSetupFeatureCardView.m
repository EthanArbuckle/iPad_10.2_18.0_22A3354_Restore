@implementation BuddyExpressSetupFeatureCardView

- (BuddyExpressSetupFeatureCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v7;
  UIColor *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSArray *v25;
  BuddyExpressSetupFeatureCardPrimaryCell *v26;
  BuddyExpressSetupFeatureCardPrimaryCell *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  NSArray *v36;
  id v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BuddyExpressSetupFeatureCardView *v44;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  id v54;
  id v55;
  id location[2];
  id v57;
  id v58;
  _QWORD v59[4];

  v57 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v55 = 0;
  objc_storeStrong(&v55, a4);
  v54 = 0;
  objc_storeStrong(&v54, a5);
  v7 = v57;
  v57 = 0;
  v53.receiver = v7;
  v53.super_class = (Class)BuddyExpressSetupFeatureCardView;
  v57 = -[BuddyExpressSetupFeatureCardView initWithFrame:](&v53, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&v57, v57);
  if (v57)
  {
    v8 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
    objc_msgSend(v57, "setBackgroundColor:", v8);

    objc_msgSend(v57, "_setContinuousCornerRadius:", 10.0);
    v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = (void *)*((_QWORD *)v57 + 4);
    *((_QWORD *)v57 + 4) = v9;

    v11 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v12 = (void *)*((_QWORD *)v57 + 2);
    *((_QWORD *)v57 + 2) = v11;

    objc_msgSend(*((id *)v57 + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v57 + 2), "setAxis:", 1);
    objc_msgSend(*((id *)v57 + 2), "setSpacing:", 16.0);
    objc_msgSend(v57, "addSubview:", *((_QWORD *)v57 + 2));
    v13 = objc_msgSend(v57, "bottomAnchor");
    v14 = objc_msgSend(*((id *)v57 + 2), "bottomAnchor");
    v15 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 0.0);
    v16 = (void *)*((_QWORD *)v57 + 5);
    *((_QWORD *)v57 + 5) = v15;

    v17 = v57;
    v47 = objc_msgSend(*((id *)v57 + 2), "topAnchor");
    v46 = objc_msgSend(v57, "topAnchor");
    v18 = objc_msgSend(v47, "constraintEqualToAnchor:");
    v59[0] = v18;
    v59[1] = *((_QWORD *)v57 + 5);
    v19 = objc_msgSend(*((id *)v57 + 2), "leadingAnchor");
    v20 = objc_msgSend(v57, "leadingAnchor");
    v21 = objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v59[2] = v21;
    v22 = objc_msgSend(v57, "trailingAnchor");
    v23 = objc_msgSend(*((id *)v57 + 2), "trailingAnchor");
    v24 = objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v59[3] = v24;
    v25 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 4);
    objc_msgSend(v17, "addConstraints:", v25);

    v26 = [BuddyExpressSetupFeatureCardPrimaryCell alloc];
    v27 = -[BuddyExpressSetupFeatureCardPrimaryCell initWithTitle:subtitle:icon:](v26, "initWithTitle:subtitle:icon:", location[0], v55, v54);
    v28 = (void *)*((_QWORD *)v57 + 6);
    *((_QWORD *)v57 + 6) = v27;

    objc_msgSend(*((id *)v57 + 6), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    *(_QWORD *)&v51 = sub_10019B5EC();
    *((double *)&v51 + 1) = v29;
    *(double *)&v52 = v30;
    *((double *)&v52 + 1) = v31;
    v32 = (void *)*((_QWORD *)v57 + 6);
    v50 = v52;
    v49 = v51;
    objc_msgSend(v32, "setDirectionalLayoutMargins:", *(double *)&v51, v29, v30, v31);
    objc_msgSend(*((id *)v57 + 6), "setChevronHidden:", 1);
    objc_msgSend(*((id *)v57 + 2), "addArrangedSubview:", *((_QWORD *)v57 + 6));
    v33 = v57;
    v34 = objc_msgSend(*((id *)v57 + 6), "heightAnchor");
    v35 = objc_msgSend(v34, "constraintGreaterThanOrEqualToConstant:", 60.0);
    v58 = v35;
    v36 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1);
    objc_msgSend(v33, "addConstraints:", v36);

    v37 = objc_alloc((Class)UITapGestureRecognizer);
    v48 = objc_msgSend(v37, "initWithTarget:action:", v57, "_toggleExpanded");
    objc_msgSend(*((id *)v57 + 6), "addGestureRecognizer:", v48);
    v38 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v39 = (void *)*((_QWORD *)v57 + 3);
    *((_QWORD *)v57 + 3) = v38;

    objc_msgSend(*((id *)v57 + 3), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v57 + 3), "setAxis:", 1);
    objc_msgSend(*((id *)v57 + 3), "setSpacing:", 16.0);
    objc_msgSend(*((id *)v57 + 3), "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(*((id *)v57 + 6), "directionalLayoutMargins");
    objc_msgSend(*((id *)v57 + 3), "setDirectionalLayoutMargins:", v40, v41, v42, v43);
    objc_storeStrong(&v48, 0);
  }
  v44 = (BuddyExpressSetupFeatureCardView *)v57;
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v57, 0);
  return v44;
}

- (void)setExpanded:(BOOL)a3
{
  BuddyExpressSetupFeatureCardPrimaryCell *v3;
  NSLayoutConstraint *v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  UIStackView *v9;
  UIStackView *v10;
  UIStackView *v11;
  NSLayoutConstraint *v12;
  NSMutableArray *v13;
  id v14;
  uint64_t v15;
  unint64_t j;
  UIStackView *v17;
  UIStackView *v18;
  UIStackView *v19;
  UIStackView *v20;
  _QWORD v21[8];
  id v22;
  _QWORD __b[8];
  uint64_t v24;
  BOOL v25;
  SEL v26;
  BuddyExpressSetupFeatureCardView *v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v27 = self;
  v26 = a2;
  v25 = a3;
  self->_expanded = a3;
  v3 = -[BuddyExpressSetupFeatureCardView primaryCell](v27, "primaryCell");
  -[BuddyExpressSetupFeatureCardPrimaryCell setExpanded:](v3, "setExpanded:", v25);

  if (v25)
  {
    v4 = -[BuddyExpressSetupFeatureCardView bottomStackViewConstraint](v27, "bottomStackViewConstraint");
    -[NSLayoutConstraint setConstant:](v4, "setConstant:", 20.0);

    memset(__b, 0, sizeof(__b));
    v5 = -[BuddyExpressSetupFeatureCardView cells](v27, "cells");
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
    if (v6)
    {
      v7 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(_QWORD *)__b[2] != v7)
            objc_enumerationMutation(v5);
          v24 = *(_QWORD *)(__b[1] + 8 * i);
          v9 = -[BuddyExpressSetupFeatureCardView secondaryStackView](v27, "secondaryStackView");
          -[UIStackView addArrangedSubview:](v9, "addArrangedSubview:", v24);

        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
      }
      while (v6);
    }

    v10 = -[BuddyExpressSetupFeatureCardView stackView](v27, "stackView");
    v11 = -[BuddyExpressSetupFeatureCardView secondaryStackView](v27, "secondaryStackView");
    -[UIStackView addArrangedSubview:](v10, "addArrangedSubview:", v11);

  }
  else
  {
    v12 = -[BuddyExpressSetupFeatureCardView bottomStackViewConstraint](v27, "bottomStackViewConstraint");
    -[NSLayoutConstraint setConstant:](v12, "setConstant:", 0.0);

    memset(v21, 0, sizeof(v21));
    v13 = -[BuddyExpressSetupFeatureCardView cells](v27, "cells");
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", v21, v28, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v21[2];
      do
      {
        for (j = 0; j < (unint64_t)v14; ++j)
        {
          if (*(_QWORD *)v21[2] != v15)
            objc_enumerationMutation(v13);
          v22 = *(id *)(v21[1] + 8 * j);
          v17 = -[BuddyExpressSetupFeatureCardView secondaryStackView](v27, "secondaryStackView");
          -[UIStackView removeArrangedSubview:](v17, "removeArrangedSubview:", v22);

          objc_msgSend(v22, "removeFromSuperview");
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", v21, v28, 16);
      }
      while (v14);
    }

    v18 = -[BuddyExpressSetupFeatureCardView stackView](v27, "stackView");
    v19 = -[BuddyExpressSetupFeatureCardView secondaryStackView](v27, "secondaryStackView");
    -[UIStackView removeArrangedSubview:](v18, "removeArrangedSubview:", v19);

    v20 = -[BuddyExpressSetupFeatureCardView secondaryStackView](v27, "secondaryStackView");
    -[UIStackView removeFromSuperview](v20, "removeFromSuperview");

  }
}

- (void)addCardCell:(id)a3
{
  BuddyExpressSetupFeatureCardPrimaryCell *v3;
  NSMutableArray *v4;
  id location[2];
  BuddyExpressSetupFeatureCardView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyExpressSetupFeatureCardView primaryCell](v6, "primaryCell");
  -[BuddyExpressSetupFeatureCardPrimaryCell setChevronHidden:](v3, "setChevronHidden:", 0);

  v4 = -[BuddyExpressSetupFeatureCardView cells](v6, "cells");
  -[NSMutableArray addObject:](v4, "addObject:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setNumberOfLinesForSubtitle:(int64_t)a3
{
  BuddyExpressSetupFeatureCardPrimaryCell *v3;

  v3 = -[BuddyExpressSetupFeatureCardView primaryCell](self, "primaryCell");
  -[BuddyExpressSetupFeatureCardPrimaryCell setNumberOfLinesForSubtitle:](v3, "setNumberOfLinesForSubtitle:", a3);

}

+ (id)formattedSubtitleStringForComponents:(id)a3
{
  NSBundle *v3;
  NSString *v4;
  id v5;
  id v6;
  id location[3];
  id v9;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((unint64_t)objc_msgSend(location[0], "count") <= 2)
  {
    v9 = +[NSListFormatter localizedStringByJoiningStrings:](NSListFormatter, "localizedStringByJoiningStrings:", location[0]);
  }
  else
  {
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("EXPRESS_SETUP_FEATURE_CARD_AND_MORE"), &stru_100284738, CFSTR("Localizable"));
    v5 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 0);
    v6 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 1);
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v5, v6);

  }
  objc_storeStrong(location, 0);
  return v9;
}

- (void)_toggleExpanded
{
  NSMutableArray *v2;
  id v3;

  v2 = -[BuddyExpressSetupFeatureCardView cells](self, "cells", a2);
  v3 = -[NSMutableArray count](v2, "count");

  if (v3)
    -[BuddyExpressSetupFeatureCardView setExpanded:](self, "setExpanded:", !-[BuddyExpressSetupFeatureCardView isExpanded](self, "isExpanded"));
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIStackView)secondaryStackView
{
  return self->_secondaryStackView;
}

- (void)setSecondaryStackView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStackView, a3);
}

- (NSMutableArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
  objc_storeStrong((id *)&self->_cells, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (NSLayoutConstraint)bottomStackViewConstraint
{
  return self->_bottomStackViewConstraint;
}

- (void)setBottomStackViewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStackViewConstraint, a3);
}

- (BuddyExpressSetupFeatureCardPrimaryCell)primaryCell
{
  return self->_primaryCell;
}

- (void)setPrimaryCell:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryCell, 0);
  objc_storeStrong((id *)&self->_bottomStackViewConstraint, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_secondaryStackView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
