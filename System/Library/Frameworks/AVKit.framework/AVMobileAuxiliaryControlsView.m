@implementation AVMobileAuxiliaryControlsView

- (AVMobileAuxiliaryControlsView)init
{
  AVMobileAuxiliaryControlsView *v2;
  AVMobileAuxiliaryControlsView *v3;
  NSArray *controls;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileAuxiliaryControlsView;
  v2 = -[AVView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    controls = v2->_controls;
    v2->_controls = (NSArray *)MEMORY[0x1E0C9AA60];

    -[AVView setIgnoresTouches:](v3, "setIgnoresTouches:", 1);
  }
  return v3;
}

- (void)setControls:(id)a3
{
  NSArray *v5;
  NSArray *controls;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  controls = self->_controls;
  if (controls != v5)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = controls;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (!-[NSArray containsObject:](v5, "containsObject:", v12))
          {
            objc_msgSend(v12, "setDelegate:", 0);
            if ((objc_msgSend(v12, "canOnlyAppearInOverflowMenu") & 1) == 0)
            {
              objc_msgSend(v12, "controlView");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "removeFromSuperview");

            }
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v9);
    }

    v14 = self->_controls;
    objc_storeStrong((id *)&self->_controls, a3);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v26 = v5;
    v15 = v5;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v20, "controlView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v20, "controlView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setPointerInteractionEnabled:", 1);
            objc_msgSend(MEMORY[0x1E0DC3658], "avkit_traitCollectionControlsColor");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setTintColor:", v24);

            objc_msgSend(v23, "setAvkit_extendedDynamicRangeGain:", self->_extendedDynamicRangeGain);
          }
          if (!-[NSArray containsObject:](v14, "containsObject:", v20))
          {
            objc_msgSend(v20, "setDelegate:", self);
            if ((objc_msgSend(v20, "canOnlyAppearInOverflowMenu") & 1) == 0)
            {
              objc_msgSend(v20, "controlView");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[AVMobileAuxiliaryControlsView addSubview:](self, "addSubview:", v25);

            }
          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v17);
    }

    -[AVMobileAuxiliaryControlsView _updateHasOverflowOnlyControl](self, "_updateHasOverflowOnlyControl");
    -[AVMobileAuxiliaryControlsView _updatePriorityOrderControlsList](self, "_updatePriorityOrderControlsList");
    -[AVMobileAuxiliaryControlsView updateOverflowMenu](self, "updateOverflowMenu");
    -[AVMobileAuxiliaryControlsView setNeedsLayout](self, "setNeedsLayout");

    v5 = v26;
  }

}

- (void)setControlSpacing:(double)a3
{
  if (self->_controlSpacing != a3)
  {
    self->_controlSpacing = a3;
    -[AVMobileAuxiliaryControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeFittingControls:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 hasOverflowOnlyControl;
  double v7;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  double controlSpacing;
  double v28;
  double v29;
  int v30;
  _BOOL4 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGSize result;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  hasOverflowOnlyControl = self->_hasOverflowOnlyControl;
  v7 = 0.0;
  if (!v4 || !objc_msgSend(v4, "count"))
  {
    v13 = 0;
    v15 = 0.0;
    if (!hasOverflowOnlyControl)
      goto LABEL_21;
    goto LABEL_18;
  }
  v31 = hasOverflowOnlyControl;
  v8 = self->_controlsInPriorityOrder;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v8;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v33;
    v15 = 0.0;
LABEL_5:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v14)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v16);
      if (objc_msgSend(v17, "isIncluded") && (objc_msgSend(v17, "canOnlyAppearInOverflowMenu") & 1) == 0)
      {
        objc_msgSend(v17, "controlView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "intrinsicContentSize");
        v20 = v19;
        v22 = v21;

        v15 = v15 + v20;
        if (v7 < v22)
          v7 = v22;
        ++v13;
      }
      objc_msgSend(v9, "removeObject:", v17);
      if (!objc_msgSend(v9, "count"))
        break;
      if (v12 == ++v16)
      {
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v12)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v13 = 0;
    v15 = 0.0;
  }

  v30 = v31 | (v13 < -[NSArray count](v10, "count"));
  if (v30)
  {
LABEL_18:
    -[AVMobileAuxiliaryControlsView _overflowControl](self, "_overflowControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "intrinsicContentSize");
    v15 = v15 + v25;
    if (v7 < v24)
      v7 = v24;
    ++v13;

  }
LABEL_21:
  if (v13 <= 1)
    v26 = 1;
  else
    v26 = v13;
  controlSpacing = self->_controlSpacing;

  v28 = v15 + controlSpacing * (double)(v26 - 1);
  v29 = v7;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)updateOverflowMenu
{
  -[AVControlOverflowButton updateContextMenu](self->_overflowControl, "updateContextMenu");
}

- (void)auxiliaryControlDidChangeState:(id)a3
{
  -[AVMobileAuxiliaryControlsView _updateHasOverflowOnlyControl](self, "_updateHasOverflowOnlyControl", a3);
  -[AVMobileAuxiliaryControlsView setNeedsLayout](self, "setNeedsLayout");
  -[AVMobileAuxiliaryControlsView updateOverflowMenu](self, "updateOverflowMenu");
}

- (void)overflowButtonDidHideContextMenu:(id)a3
{
  id v4;

  -[AVMobileAuxiliaryControlsView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "auxiliaryControlsViewDidEndShowingOverflowMenu:", self);

}

- (void)overflowButtonWillShowContextMenu:(id)a3
{
  id v4;

  -[AVMobileAuxiliaryControlsView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "auxiliaryControlsViewWillBeginShowingOverflowMenu:", self);

}

- (id)overflowMenuItemsForControlOverflowButton:(id)a3
{
  void *v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_controls, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_controlsInPriorityOrder;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "isIncluded"))
        {
          v11 = objc_msgSend(v10, "canOnlyAppearInOverflowMenu");
          if ((v11 & 1) == 0)
          {
            objc_msgSend(v10, "controlView");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v3;
            if (!objc_msgSend(v3, "isHidden"))
              goto LABEL_14;
          }
          -[AVMobileAuxiliaryControlsView delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_respondsToSelector();

          if ((v11 & 1) == 0)
          if ((v14 & 1) != 0)
          {
            -[AVMobileAuxiliaryControlsView delegate](self, "delegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "auxiliaryControlsView:menuElementForControl:", self, v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
              objc_msgSend(v18, "addObject:", v12);
LABEL_14:

            continue;
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v18;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_hasOverflowOnlyControl)
  {
    -[AVButton intrinsicContentSize](self->_overflowControl, "intrinsicContentSize");
    v4 = fmax(v3, 0.0);
    v6 = v5 + 0.0;
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v6 = 0.0;
    v4 = 0.0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_controls;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v13, "isIncluded", (_QWORD)v21)
          && (objc_msgSend(v13, "canOnlyAppearInOverflowMenu") & 1) == 0)
        {
          objc_msgSend(v13, "controlView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "intrinsicContentSize");
          v16 = v15;
          v18 = v17;

          if (v4 < v18)
            v4 = v18;
          v6 = v6 + v16;
          ++v7;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v19 = v6 + (double)(unint64_t)(v7 - 1) * self->_controlSpacing;
  v20 = v4;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  BOOL v19;
  float v20;
  float v21;
  float v22;
  BOOL v23;
  uint64_t v24;
  AVControlOverflowButton *overflowControl;
  double extendedDynamicRangeGain;
  char v27;
  double v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  float v36;
  float v37;
  float v38;
  float v40;
  float v41;
  uint64_t v43;
  uint64_t v44;
  char v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  objc_super v51;

  -[AVMobileAuxiliaryControlsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[AVMobileAuxiliaryControlsView _requiresOverflowControl](self, "_requiresOverflowControl");
  -[AVMobileAuxiliaryControlsView intrinsicContentSize](self, "intrinsicContentSize");
  if (v8 >= v6)
    v9 = v6;
  else
    v9 = v8;
  v10 = v6 + v9 * -0.5;
  v11 = -[AVMobileAuxiliaryControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[AVMobileAuxiliaryControlsView _controlsWithViewsInPriorityOrder](self, "_controlsWithViewsInPriorityOrder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[AVMobileAuxiliaryControlsView _overflowControl](self, "_overflowControl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intrinsicContentSize");
    v15 = v14;
    v17 = v16;
    *(float *)&v14 = v14;
    *(float *)&v16 = v4;
    v18 = vabds_f32(*(float *)&v14, *(float *)&v16);
    v19 = *(float *)&v14 < *(float *)&v16 || v18 < 0.00000011921;
    if (v19
      && ((v20 = v17, v21 = v6, v22 = vabds_f32(v20, v21), v20 >= v21) ? (v23 = v22 < 0.00000011921) : (v23 = 1), v23))
    {
      v4 = v4 - v15;
      -[UIView avkit_setFrame:inLayoutDirection:](self->_overflowControl, "avkit_setFrame:inLayoutDirection:", v11, v4, v10 + v17 * -0.5);
      v24 = 0;
    }
    else
    {
      v24 = 1;
    }

  }
  else
  {
    v24 = 1;
  }
  overflowControl = self->_overflowControl;
  if (!overflowControl || (_DWORD)v24 == -[AVControlOverflowButton isHidden](overflowControl, "isHidden"))
  {
    v27 = 0;
    if ((v24 & 1) == 0)
    {
LABEL_24:
      v28 = fmax(v4 - self->_controlSpacing, 0.0);
      goto LABEL_27;
    }
  }
  else
  {
    -[AVControlOverflowButton setHidden:](self->_overflowControl, "setHidden:", v24);
    extendedDynamicRangeGain = 0.0;
    if ((v24 & 1) == 0)
      extendedDynamicRangeGain = self->_extendedDynamicRangeGain;
    -[UIView setAvkit_extendedDynamicRangeGain:](self->_overflowControl, "setAvkit_extendedDynamicRangeGain:", extendedDynamicRangeGain);
    v27 = 1;
    if ((v24 & 1) == 0)
      goto LABEL_24;
  }
  v28 = v4;
  if (v7)
  {
LABEL_43:
    v31 = -1;
    goto LABEL_45;
  }
LABEL_27:
  if (!objc_msgSend(v12, "count"))
    goto LABEL_43;
  v29 = 0;
  v30 = v6;
  v31 = -1;
  while (1)
  {
    objc_msgSend(v12, "objectAtIndex:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "isIncluded"))
      break;
LABEL_41:

    if (++v29 >= (unint64_t)objc_msgSend(v12, "count"))
      goto LABEL_45;
  }
  objc_msgSend(v32, "controlView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "intrinsicContentSize");
  v36 = v34;
  v37 = v28;
  v38 = vabds_f32(v36, v37);
  if (v36 < v37 || v38 < 0.00000011921)
  {
    v40 = v35;
    v41 = vabds_f32(v40, v30);
    if (v40 < v30 || v41 < 0.00000011921)
    {
      v28 = fmax(v28 - (v34 + self->_controlSpacing), 0.0);

      v31 = v29;
      goto LABEL_41;
    }
  }

LABEL_45:
  v43 = objc_msgSend(v12, "count");
  if (v43 - 1 >= 0)
  {
    v44 = v43;
    v45 = v24 ^ 1;
    while (1)
    {
      objc_msgSend(v12, "objectAtIndex:", --v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "controlView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v46, "isIncluded"))
        break;
      objc_msgSend(v47, "intrinsicContentSize");
      if (v44 <= v31)
      {
        v4 = v4 - v48;
        if ((v45 & 1) != 0)
          v4 = v4 - self->_controlSpacing;
        objc_msgSend(v47, "avkit_setFrame:inLayoutDirection:", v11, v4, v10 + v49 * -0.5, v48);
        if ((objc_msgSend(v47, "isHidden") & 1) != 0)
        {
          v50 = 0;
LABEL_56:
          v45 = 1;
LABEL_57:
          objc_msgSend(v47, "setHidden:", v50);
          goto LABEL_58;
        }
      }
      else if (!objc_msgSend(v47, "isHidden"))
      {
        v50 = 1;
        goto LABEL_56;
      }
      v45 = 1;
      if ((v27 & 1) == 0)
      {
        v27 = 0;
        goto LABEL_59;
      }
LABEL_58:
      -[AVMobileAuxiliaryControlsView _updateOverflowControlContextMenu](self, "_updateOverflowControlContextMenu");
      v27 = 1;
LABEL_59:

      if (v44 <= 0)
        goto LABEL_63;
    }
    v50 = 1;
    goto LABEL_57;
  }
LABEL_63:
  v51.receiver = self;
  v51.super_class = (Class)AVMobileAuxiliaryControlsView;
  -[AVView layoutSubviews](&v51, sel_layoutSubviews);

}

- (double)avkit_extendedDynamicRangeGain
{
  return self->_extendedDynamicRangeGain;
}

- (void)setAvkit_extendedDynamicRangeGain:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_extendedDynamicRangeGain != a3)
  {
    self->_extendedDynamicRangeGain = a3;
    if ((-[AVControlOverflowButton isHidden](self->_overflowControl, "isHidden") & 1) == 0)
      -[UIView setAvkit_extendedDynamicRangeGain:](self->_overflowControl, "setAvkit_extendedDynamicRangeGain:", self->_extendedDynamicRangeGain);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_controls;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v9, "controlView", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v9, "controlView");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setAvkit_extendedDynamicRangeGain:", self->_extendedDynamicRangeGain);

          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  id v4;

  -[AVMobileAuxiliaryControlsView setNeedsLayout](self, "setNeedsLayout", a3);
  -[AVMobileAuxiliaryControlsView superview](self, "superview");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

}

- (void)setHasOverflowOnlyControl:(BOOL)a3
{
  if (self->_hasOverflowOnlyControl != a3)
  {
    self->_hasOverflowOnlyControl = a3;
    -[AVMobileAuxiliaryControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_controlsWithViewsInPriorityOrder
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_controls, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_controlsInPriorityOrder;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "canOnlyAppearInOverflowMenu", (_QWORD)v11) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_overflowControl
{
  AVControlOverflowButton *overflowControl;
  AVControlOverflowButton *v4;
  void *v5;
  void *v6;
  AVControlOverflowButton *v7;
  AVControlOverflowButton *v8;

  overflowControl = self->_overflowControl;
  if (!overflowControl)
  {
    +[AVControlOverflowButton secondGenerationButton](AVControlOverflowButton, "secondGenerationButton");
    v4 = (AVControlOverflowButton *)objc_claimAutoreleasedReturnValue();
    -[AVControlOverflowButton setPointerInteractionEnabled:](v4, "setPointerInteractionEnabled:", 1);
    -[AVControlOverflowButton setAutoresizingMask:](v4, "setAutoresizingMask:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B60], *MEMORY[0x1E0DC1430]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setInlineFont:](v4, "setInlineFont:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "avkit_traitCollectionControlsColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVControlOverflowButton setTintColor:](v4, "setTintColor:", v6);

    -[AVControlOverflowButton setDelegate:](v4, "setDelegate:", self);
    -[AVControlOverflowButton setHidden:](v4, "setHidden:", 1);
    v7 = self->_overflowControl;
    self->_overflowControl = v4;
    v8 = v4;

    -[AVMobileAuxiliaryControlsView addSubview:](self, "addSubview:", self->_overflowControl);
    overflowControl = self->_overflowControl;
  }
  return overflowControl;
}

- (BOOL)_requiresOverflowControl
{
  double v4;
  double v5;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_hasOverflowOnlyControl)
    return 1;
  -[AVMobileAuxiliaryControlsView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_controls;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v10 = 0;
  if (v9)
  {
    v11 = *(_QWORD *)v22;
    v12 = 0.0;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v14, "isIncluded", (_QWORD)v21)
          && (objc_msgSend(v14, "canOnlyAppearInOverflowMenu") & 1) == 0)
        {
          objc_msgSend(v14, "controlView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "intrinsicContentSize");
          v17 = v16;
          v19 = v18;

          if (v19 > v7)
          {
            LOBYTE(v9) = 1;
            goto LABEL_17;
          }
          v12 = v12 + v17;
          ++v10;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0.0;
  }
LABEL_17:

  if (v10 <= 1)
    v20 = 1;
  else
    v20 = v10;
  if (v12 + (double)(v20 - 1) * self->_controlSpacing > v5)
    return 1;
  else
    return v9;
}

- (void)_updateHasOverflowOnlyControl
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_controls;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isIncluded", (_QWORD)v8)
          && (objc_msgSend(v7, "canOnlyAppearInOverflowMenu") & 1) != 0)
        {
          v4 = 1;
          goto LABEL_12;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  -[AVMobileAuxiliaryControlsView setHasOverflowOnlyControl:](self, "setHasOverflowOnlyControl:", v4);
}

- (void)_updateOverflowControlContextMenu
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__AVMobileAuxiliaryControlsView__updateOverflowControlContextMenu__block_invoke;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_updatePriorityOrderControlsList
{
  void *v3;
  NSArray *controls;
  void *v5;
  NSArray *v6;
  NSArray *controlsInPriorityOrder;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("displayPriority"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  controls = self->_controls;
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray sortedArrayUsingDescriptors:](controls, "sortedArrayUsingDescriptors:", v5);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  controlsInPriorityOrder = self->_controlsInPriorityOrder;
  self->_controlsInPriorityOrder = v6;

}

- (NSArray)controls
{
  return self->_controls;
}

- (double)controlSpacing
{
  return self->_controlSpacing;
}

- (BOOL)hasOverflowOnlyControl
{
  return self->_hasOverflowOnlyControl;
}

- (AVMobileAuxiliaryControlsViewDelegate)delegate
{
  return (AVMobileAuxiliaryControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_controlsInPriorityOrder, 0);
  objc_storeStrong((id *)&self->_overflowControl, 0);
}

void __66__AVMobileAuxiliaryControlsView__updateOverflowControlContextMenu__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[58], "updateContextMenu");
    WeakRetained = v2;
  }

}

@end
