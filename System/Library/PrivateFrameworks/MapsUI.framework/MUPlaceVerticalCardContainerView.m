@implementation MUPlaceVerticalCardContainerView

- (MUPlaceVerticalCardContainerView)initWithConfiguration:(id)a3
{
  id v5;
  MUPlaceVerticalCardContainerView *v6;
  MUPlaceVerticalCardContainerView *v7;
  uint64_t v8;
  UILongPressGestureRecognizer *longPressRecognizer;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MUPlaceVerticalCardContainerView;
  v6 = -[MUStackView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[MUStackView setAxis:](v7, "setAxis:", 1);
    if (-[MUPlaceVerticalCardContainerView shouldInvokeCopyOnLongPress](v7, "shouldInvokeCopyOnLongPress"))
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v7, sel__handleLongPress_);
      longPressRecognizer = v7->_longPressRecognizer;
      v7->_longPressRecognizer = (UILongPressGestureRecognizer *)v8;

      -[UILongPressGestureRecognizer setDelegate:](v7->_longPressRecognizer, "setDelegate:", v7);
      -[MUPlaceVerticalCardContainerView addGestureRecognizer:](v7, "addGestureRecognizer:", v7->_longPressRecognizer);
    }
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)-[MUPlaceVerticalCardContainerView registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v11, sel__updateForPlatterAvailability);

  }
  return v7;
}

- (MUPlaceVerticalCardContainerView)initWithShowsSeparators:(BOOL)a3
{
  void *v4;
  MUPlaceVerticalCardContainerView *v5;

  if (a3)
    +[MUPlaceVerticalCardConfiguration separatorConfiguration](MUPlaceVerticalCardConfiguration, "separatorConfiguration");
  else
    +[MUPlaceVerticalCardConfiguration plainConfiguration](MUPlaceVerticalCardConfiguration, "plainConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUPlaceVerticalCardContainerView initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (BOOL)isDeveloperPlaceCard
{
  return -[MUPlaceVerticalCardConfiguration isDeveloperPlaceCard](self->_configuration, "isDeveloperPlaceCard");
}

- (void)setRowViews:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIView _mapsui_isRTL](self, "_mapsui_isRTL");
  -[MUStackView arrangedSubviews](self, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToArray:", v4);

  if ((v7 & 1) == 0)
  {
    v8 = -[MUPlaceVerticalCardConfiguration showSeparators](self->_configuration, "showSeparators");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "reverseObjectEnumerator", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v10)
    {
      v12 = 0;
      goto LABEL_26;
    }
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v23;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v9);
        v15 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v12 || (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "isHidden") & 1) != 0)
        {
          if (v15 != v12 && v8)
          {
            v17 = 0;
            goto LABEL_16;
          }
        }
        else
        {
          v12 = v15;
        }
        v17 = 1;
LABEL_16:
        objc_msgSend(v15, "setBottomHairlineHidden:", v17);
        -[MUPlaceVerticalCardContainerView _resolvedBottomSeparatorInsetsForView:](self, "_resolvedBottomSeparatorInsetsForView:", v15);
        if (v5)
          v20 = v19;
        else
          v20 = v18;
        if (v5)
          v21 = v18;
        else
          v21 = v19;
        objc_msgSend(v15, "setLeftHairlineInset:", v20);
        objc_msgSend(v15, "setRightHairlineInset:", v21);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (!v11)
      {
LABEL_26:

        -[MUStackView setArrangedSubviews:](self, "setArrangedSubviews:", v4);
        break;
      }
    }
  }

}

- (NSDirectionalEdgeInsets)_resolvedBottomSeparatorInsetsForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  -[MUPlaceVerticalCardConfiguration bottomSeparatorInset](self->_configuration, "bottomSeparatorInset", a3);
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  char v3;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  if (self->_longPressRecognizer == a3)
  {
    objc_msgSend(a3, "locationInView:", self);
    v5 = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:");
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 0;
    }
    else
    {
      v7 = v5;
      -[MUStackView arrangedSubviews](self, "arrangedSubviews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 <= objc_msgSend(v8, "count"))
      {
        -[MUStackView arrangedSubviews](self, "arrangedSubviews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }

    }
    v3 = objc_opt_respondsToSelector();

  }
  else
  {
    v3 = 1;
  }
  return v3 & 1;
}

- (void)_handleLongPress:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 1)
  {
    objc_msgSend(v6, "locationInView:", self);
    -[MUPlaceVerticalCardContainerView _rowAt:](self, "_rowAt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_selectedRow, v4);
    if (-[UIView conformsToProtocol:](self->_selectedRow, "conformsToProtocol:", &unk_1EE251C00))
      -[UIView setSelected:animated:](self->_selectedRow, "setSelected:animated:", 1, 1);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", 0);
  -[MUPlaceVerticalCardContainerView addInteraction:](self, "addInteraction:", v5);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[MUPlaceVerticalCardContainerView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "touchesForWindow:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "anyObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "tapCount") == 1)
  {
    objc_msgSend(v8, "locationInView:", self);
    self->_trackingSelectForRow = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:");
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->_trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_trackingSelectForRow != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = a4;
    -[MUPlaceVerticalCardContainerView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "touchesForWindow:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "anyObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "locationInView:", self);
    v8 = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:");
    if (v8 == self->_trackingSelectForRow)
    {
      v9 = v8;
      -[MUStackView arrangedSubviews](self, "arrangedSubviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v9 < v11)
      {
        -[MUStackView arrangedSubviews](self, "arrangedSubviews");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlaceVerticalCardContainerView _handleSelectedRowView:atIndex:](self, "_handleSelectedRowView:atIndex:", v13, v9);

        self->_trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
      }
    }

  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  double MidX;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v6 = a3;
  v7 = a4;
  -[MUPlaceVerticalCardContainerView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  if (objc_msgSend(v10, "keyCode") != 40)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[MUStackView arrangedSubviews](self, "arrangedSubviews"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "containsObject:", v12),
        v13,
        !v14))
  {
LABEL_10:

LABEL_11:
    v22.receiver = self;
    v22.super_class = (Class)MUPlaceVerticalCardContainerView;
    -[MUPlaceVerticalCardContainerView pressesEnded:withEvent:](&v22, sel_pressesEnded_withEvent_, v6, v7);
    goto LABEL_12;
  }
  v15 = v12;
  objc_msgSend(v15, "frame");
  MidX = CGRectGetMidX(v23);
  objc_msgSend(v15, "frame");
  v17 = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:", MidX, CGRectGetMidY(v24));
  -[MUStackView arrangedSubviews](self, "arrangedSubviews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v17 >= v19)
  {

    goto LABEL_10;
  }
  -[MUStackView arrangedSubviews](self, "arrangedSubviews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceVerticalCardContainerView _handleSelectedRowView:atIndex:](self, "_handleSelectedRowView:atIndex:", v21, v17);

LABEL_12:
}

- (void)_handleSelectedRowView:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[MUPlaceVerticalCardContainerView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "verticalCardContainerView:didSelectRow:atIndex:", self, v6, a4);

}

- (void)removeArrangedSubview:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUPlaceVerticalCardContainerView;
  -[MUStackView removeArrangedSubview:](&v7, sel_removeArrangedSubview_, a3);
  -[MUStackView arrangedSubviews](self, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (-[MUPlaceVerticalCardConfiguration showSeparators](self->_configuration, "showSeparators"))
      objc_msgSend(v6, "setBottomHairlineHidden:", 1);

  }
}

- (unint64_t)_indexOfRowAt:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  unint64_t v6;
  _QWORD v8[6];

  y = a3.y;
  x = a3.x;
  -[MUStackView arrangedSubviews](self, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__MUPlaceVerticalCardContainerView__indexOfRowAt___block_invoke;
  v8[3] = &__block_descriptor_48_e23_B32__0__UIView_8Q16_B24l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v8);

  return v6;
}

uint64_t __50__MUPlaceVerticalCardContainerView__indexOfRowAt___block_invoke(CGPoint *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  CGRect v9;

  v6 = a2;
  objc_msgSend(v6, "frame");
  if (CGRectContainsPoint(v9, a1[2]) && (objc_msgSend(v6, "isHidden") & 1) == 0)
    *a4 = 1;
  v7 = *a4;

  return v7;
}

- (id)_rowAt:(CGPoint)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:", a3.x, a3.y);
  -[MUStackView arrangedSubviews](self, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 >= v6)
  {
    v8 = 0;
  }
  else
  {
    -[MUStackView arrangedSubviews](self, "arrangedSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)shouldInvokeCopyOnLongPress
{
  return MUIdiomInTraitEnvironment(self) != 5;
}

- (MUPlaceVerticalCardContainerViewDelegate)delegate
{
  return (MUPlaceVerticalCardContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedRow, 0);
}

@end
