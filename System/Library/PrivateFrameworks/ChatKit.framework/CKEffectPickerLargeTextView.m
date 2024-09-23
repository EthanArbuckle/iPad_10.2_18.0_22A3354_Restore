@implementation CKEffectPickerLargeTextView

- (CKEffectPickerLargeTextView)initWithFrame:(CGRect)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 composition:(id)a6 color:(char)a7
{
  CKEffectPickerLargeTextView *result;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  v8.receiver = self;
  v8.super_class = (Class)CKEffectPickerLargeTextView;
  result = -[CKEffectPickerView initWithFrame:sendButtonFrame:balloonViewOrigin:composition:color:](&v8, sel_initWithFrame_sendButtonFrame_balloonViewOrigin_composition_color_, *(_QWORD *)&a5.x, *(_QWORD *)&a5.y, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v9, v10);
  if (result)
    result->_finishedInitializing = 1;
  return result;
}

- (void)activateTextSizeDependentConstraintsForSendButtonFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKEffectPickerLargeTextView;
  -[CKEffectPickerView activateTextSizeDependentConstraintsForSendButtonFrame:](&v21, sel_activateTextSizeDependentConstraintsForSendButtonFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView closeButton](self, "closeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 4, 0, self, 4, 1.0, -20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerLargeTextView addConstraint:](self, "addConstraint:", v6);
  -[CKEffectPickerView setCloseButtonBottomConstraint:](self, "setCloseButtonBottomConstraint:", v6);
  -[CKEffectPickerView balloonView](self, "balloonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  -[CKEffectPickerView closeButton](self, "closeButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = -(v9 - v11);

  v13 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView closeButton](self, "closeButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 3, 0, v15, 3, 1.0, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerLargeTextView addConstraint:](self, "addConstraint:", v16);
  -[CKEffectPickerView setRoundedContainerViewTopConstraint:](self, "setRoundedContainerViewTopConstraint:", v16);
  v17 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView sendMomentButton](self, "sendMomentButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView closeButton](self, "closeButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 4, 0, v19, 3, 1.0, -36.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerLargeTextView addConstraint:](self, "addConstraint:", v20);
}

- (void)addEffect:(id)a3 withDescriptiveText:(id)a4 withIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKEffectPickerLargeTextView;
  v8 = a3;
  -[CKEffectPickerView addEffect:withDescriptiveText:withIdentifier:](&v11, sel_addEffect_withDescriptiveText_withIdentifier_, v8, a4, a5);
  -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels", v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setText:", v8);
}

- (double)marginBetweenPickerDotButtons
{
  void *v2;
  double v3;
  double v4;

  -[CKEffectPickerView effectLabelFont](self, "effectLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  v4 = v3 * 1.75;

  return v4;
}

- (void)_updateRoundedContainerView
{
  void *v3;
  unint64_t v4;
  double v5;
  float v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[CKEffectPickerLargeTextView marginBetweenPickerDotButtons](self, "marginBetweenPickerDotButtons");
  v6 = (double)v4 * 9.0 + 36.0 + v5 * (double)(v4 - 1);
  -[CKEffectPickerView roundedContainerViewTopConstraint](self, "roundedContainerViewTopConstraint");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView balloonView](self, "balloonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  -[CKEffectPickerView closeButton](self, "closeButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  objc_msgSend(v12, "setConstant:", -(v9 - v11 + v6));

}

- (CGRect)_updateBalloonViewOrigin:(CGRect)a3 forButtonFrame:(CGRect)a4
{
  double height;
  double y;
  double v6;
  double width;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  height = a4.size.height;
  y = a4.origin.y;
  v6 = a3.size.height;
  width = a3.size.width;
  -[CKEffectPickerView closeButton](self, "closeButton", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[CKEffectPickerView typeSegmentedControl](self, "typeSegmentedControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "selectedSegmentIndex");

  if (v13)
  {
    -[CKEffectPickerView sendMomentButton](self, "sendMomentButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;

    y = v16 + v18 + 24.0 - v6;
  }
  else if (-[CKEffectPickerView selectedIndex](self, "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    y = y - (v6 - height);
  }
  else if (-[CKEffectPickerView selectedIndex](self, "selectedIndex"))
  {
    v19 = -[CKEffectPickerView selectedIndex](self, "selectedIndex");
    -[CKEffectPickerView effectLabels](self, "effectLabels");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count") - 1;

    if (v19 != v21)
    {
      -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", -[CKEffectPickerView selectedIndex](self, "selectedIndex"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "bounds");
      objc_msgSend(v23, "frame");
      UIRoundToViewScale();
      y = v24;

    }
  }
  else
  {
    -[CKEffectPickerView closeButton](self, "closeButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    y = v26 + -14.0 - v6;

  }
  v27 = v11 - (width + 20.0);
  v28 = y;
  v29 = width;
  v30 = v6;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)cancelImpactSelection
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKEffectPickerLargeTextView;
  -[CKEffectPickerView cancelImpactSelection](&v4, sel_cancelImpactSelection);
  -[CKEffectPickerView resetDotConstraintsToDefault](self, "resetDotConstraintsToDefault");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__CKEffectPickerLargeTextView_cancelImpactSelection__block_invoke;
  v3[3] = &unk_1E274A208;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.25);
}

uint64_t __52__CKEffectPickerLargeTextView_cancelImpactSelection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_touchUpInsideDotButton:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  objc_super v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKEffectPickerView selectedIndex](self, "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKEffectPickerView closeButton](self, "closeButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6 + -28.0;
    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v7 - v9;

  }
  else
  {
    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v10 = v11;
  }

  -[CKEffectPickerView resetDotConstraintsToDefault](self, "resetDotConstraintsToDefault");
  -[CKEffectPickerView effectIdentifiers](self, "effectIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView effectDotButtons](self, "effectDotButtons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "indexOfObject:", v4));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerView effectDotConstraintsThatChange](self, "effectDotConstraintsThatChange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (objc_msgSend(v16, "count") == 1)
  {
    -[CKEffectPickerLargeTextView marginBetweenPickerDotButtons](self, "marginBetweenPickerDotButtons");
    v20 = v10 - round(v19 + v19 + (double)(v18 + 1) * 9.0 + 19.0);
  }
  else
  {
    -[CKEffectPickerLargeTextView marginBetweenPickerDotButtons](self, "marginBetweenPickerDotButtons");
    v20 = (v10 - round(v21 + (double)v18 * 9.0 + 19.0)) * 0.5;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = v16;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    v26 = -v20;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "setConstant:", v26);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v24);
  }

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __55__CKEffectPickerLargeTextView__touchUpInsideDotButton___block_invoke;
  v29[3] = &unk_1E274A208;
  v29[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v29, 0.25);
  v28.receiver = self;
  v28.super_class = (Class)CKEffectPickerLargeTextView;
  -[CKEffectPickerView _touchUpInsideDotButton:](&v28, sel__touchUpInsideDotButton_, v4);

}

uint64_t __55__CKEffectPickerLargeTextView__touchUpInsideDotButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (double)offsetYForLabelAtIndex:(int64_t)a3 withInitialY:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[CKEffectPickerView effectDescriptiveLabels](self, "effectDescriptiveLabels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
      -[CKEffectPickerView closeButton](self, "closeButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      -[CKEffectPickerView balloonView](self, "balloonView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      objc_msgSend(v6, "bounds");

      goto LABEL_9;
    }
  }
  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") - 1;

  if (v9 == a3)
  {
    -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerView effectSendButtons](self, "effectSendButtons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    objc_msgSend(v10, "convertRect:toView:", self);

    objc_msgSend(v6, "bounds");
  }
  else
  {
    -[CKEffectPickerView balloonView](self, "balloonView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    objc_msgSend(v6, "bounds");

    objc_msgSend(v6, "bounds");
  }
LABEL_9:
  UIRoundToViewScale();
  v17 = v16;

  return v17;
}

- (BOOL)shouldAnimatePreviousLabelForCancel:(id)a3
{
  return 0;
}

- (void)effectTypeDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;
  _QWORD v9[5];

  v4 = a3;
  if (-[CKEffectPickerLargeTextView finishedInitializing](self, "finishedInitializing"))
  {
    if (objc_msgSend(v4, "selectedSegmentIndex"))
    {
      if (objc_msgSend(v4, "selectedSegmentIndex") != 1)
      {
LABEL_7:
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __51__CKEffectPickerLargeTextView_effectTypeDidChange___block_invoke;
        v9[3] = &unk_1E274A208;
        v9[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v9, 0.25);
        goto LABEL_8;
      }
      -[CKEffectPickerView closeButtonBottomConstraint](self, "closeButtonBottomConstraint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = -178.0;
    }
    else
    {
      -[CKEffectPickerView closeButtonBottomConstraint](self, "closeButtonBottomConstraint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = -20.0;
    }
    objc_msgSend(v5, "setConstant:", v7);

    goto LABEL_7;
  }
LABEL_8:
  v8.receiver = self;
  v8.super_class = (Class)CKEffectPickerLargeTextView;
  -[CKEffectPickerView effectTypeDidChange:](&v8, sel_effectTypeDidChange_, v4);

}

uint64_t __51__CKEffectPickerLargeTextView_effectTypeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)finishedInitializing
{
  return self->_finishedInitializing;
}

- (void)setFinishedInitializing:(BOOL)a3
{
  self->_finishedInitializing = a3;
}

@end
