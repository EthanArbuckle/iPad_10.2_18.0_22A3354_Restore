@implementation MediaControlsExpandableButton

uint64_t __56__MediaControlsExpandableButton_setSelectedOptionIndex___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_layoutLabels");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_layoutSelectionView");
  return result;
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[MediaControlsExpandableButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelectedOptionIndex:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v4[6];

  if (a4)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__MediaControlsExpandableButton_setSelectedOptionIndex_animated___block_invoke;
    v4[3] = &unk_1E5819110;
    v4[4] = self;
    v4[5] = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "mru_animateUsingType:animations:", 2, v4);
  }
  else
  {
    -[MediaControlsExpandableButton setSelectedOptionIndex:](self, "setSelectedOptionIndex:", a3);
  }
}

- (void)setDisabledSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_disabledSubtitle, a3);
  -[MediaControlsExpandableButton updateSubtitle](self, "updateSubtitle");
  -[MediaControlsExpandableButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  int64_t axis;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *buttons;
  _QWORD *v18;
  CGFloat Height;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  CGFloat x;
  double v35;
  CGFloat y;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  BOOL v61;
  double v62;
  UIView *backgroundView;
  CGFloat Width;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[12];
  _QWORD v70[12];
  objc_super v71;
  _BYTE v72[128];
  uint64_t v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v73 = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)MediaControlsExpandableButton;
  -[MediaControlsExpandableButton layoutSubviews](&v71, sel_layoutSubviews);
  -[MediaControlsExpandableButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MediaControlsExpandableButton traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  axis = self->_axis;
  if (axis)
  {
    if (axis != 1)
      goto LABEL_8;
    v74.origin.x = v4;
    v74.origin.y = v6;
    v74.size.width = v8;
    v74.size.height = v10;
    Width = CGRectGetWidth(v74);
    v75.origin.x = v4;
    v75.origin.y = v6;
    v75.size.width = v8;
    v75.size.height = v10;
    v13 = 0;
    CGRectGetHeight(v75);
    v76.origin.x = v4;
    v76.origin.y = v6;
    v76.size.width = v8;
    v76.size.height = v10;
    CGRectGetHeight(v76);
    UIFloorToScale();
    v15 = v14;
    if ((unint64_t)-[NSMutableArray count](self->_buttons, "count") >= 2)
    {
      -[NSMutableArray count](self->_buttons, "count");
      -[NSMutableArray count](self->_buttons, "count");
      UIFloorToScale();
      v13 = v16;
    }
    buttons = self->_buttons;
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __47__MediaControlsExpandableButton_layoutSubviews__block_invoke_2;
    v69[3] = &unk_1E581B3F8;
    v69[4] = self;
    *(CGFloat *)&v69[5] = v4;
    *(CGFloat *)&v69[6] = v6;
    *(CGFloat *)&v69[7] = v8;
    *(CGFloat *)&v69[8] = v10;
    v69[9] = v15;
    v69[10] = v13;
    *(CGFloat *)&v69[11] = Width;
    v18 = v69;
  }
  else
  {
    v77.origin.x = v4;
    v77.origin.y = v6;
    v77.size.width = v8;
    v77.size.height = v10;
    Height = CGRectGetHeight(v77);
    v78.origin.x = v4;
    v78.origin.y = v6;
    v78.size.width = v8;
    v78.size.height = v10;
    CGRectGetWidth(v78);
    v79.origin.x = v4;
    v79.origin.y = v6;
    v79.size.width = v8;
    v79.size.height = v10;
    CGRectGetWidth(v79);
    UIFloorToScale();
    v21 = v20;
    -[NSArray count](self->_options, "count");
    UIFloorToScale();
    buttons = self->_buttons;
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __47__MediaControlsExpandableButton_layoutSubviews__block_invoke;
    v70[3] = &unk_1E581B3F8;
    v70[4] = self;
    *(CGFloat *)&v70[5] = v4;
    *(CGFloat *)&v70[6] = v6;
    *(CGFloat *)&v70[7] = v8;
    *(CGFloat *)&v70[8] = v10;
    v70[9] = v21;
    v70[10] = v22;
    *(CGFloat *)&v70[11] = Height;
    v18 = v70;
  }
  -[NSMutableArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v18);
LABEL_8:
  -[NSMutableArray firstObject](self->_buttons, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "assetFrame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[NSMutableArray firstObject](self->_buttons, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsExpandableButton convertRect:fromView:](self, "convertRect:fromView:", v32, v25, v27, v29, v31);
  x = v33;
  y = v35;
  v38 = v37;
  v40 = v39;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v41 = self->_buttons;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v66 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v46, "assetFrame");
        -[MediaControlsExpandableButton convertRect:fromView:](self, "convertRect:fromView:", v46);
        v84.origin.x = v47;
        v84.origin.y = v48;
        v84.size.width = v49;
        v84.size.height = v50;
        v80.origin.x = x;
        v80.origin.y = y;
        v80.size.width = v38;
        v80.size.height = v40;
        v81 = CGRectUnion(v80, v84);
        x = v81.origin.x;
        y = v81.origin.y;
        v38 = v81.size.width;
        v40 = v81.size.height;
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    }
    while (v43);
  }

  -[MediaControlsExpandableButton bounds](self, "bounds");
  UIRectCenteredXInRect();
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  v82.origin.x = v52;
  v82.origin.y = v54;
  v82.size.width = v56;
  v82.size.height = v58;
  v59 = CGRectGetWidth(v82);
  v83.origin.x = v52;
  v83.origin.y = v54;
  v83.size.width = v56;
  v83.size.height = v58;
  v60 = CGRectGetHeight(v83);
  v61 = v59 == v60;
  if (v59 < v60)
    v60 = v59;
  v62 = v60 * 0.5;
  backgroundView = self->_backgroundView;
  if (v61)
    -[UIView _setCornerRadius:](backgroundView, "_setCornerRadius:", v62);
  else
    -[UIView _setContinuousCornerRadius:](backgroundView, "_setContinuousCornerRadius:", v62);
  -[MediaControlsExpandableButton _layoutSelectionView](self, "_layoutSelectionView");
  -[MediaControlsExpandableButton _layoutLabels](self, "_layoutLabels");
}

- (void)_layoutSelectionView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double MidX;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[MediaControlsExpandableButton selectedButton](self, "selectedButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = v3;
    objc_msgSend(v3, "assetFrame");
    -[MediaControlsExpandableButton convertRect:fromView:](self, "convertRect:fromView:", v16);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if (self->_expanded)
    {
      v12 = -[MediaControlsExpandableButton isHighlighted](self, "isHighlighted");
      v13 = 4.0;
      if (v12)
        v13 = 2.0;
      v5 = v5 + v13;
      v7 = v7 + v13;
      v14 = v13 + v13;
      v9 = v9 - v14;
      v11 = v11 - v14;
    }
    UIRectCenteredAboutPoint();
    -[MRUExpandableButtonSelectionView setBounds:](self->_selectionView, "setBounds:");
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    MidX = CGRectGetMidX(v17);
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    -[MRUExpandableButtonSelectionView setCenter:](self->_selectionView, "setCenter:", MidX, CGRectGetMidY(v18));
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    -[MRUExpandableButtonSelectionView _setCornerRadius:](self->_selectionView, "_setCornerRadius:", CGRectGetHeight(v19) * 0.5);
    v3 = v16;
  }

}

- (void)_layoutLabels
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  UILabel *subtitleLabel;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MinY;
  uint64_t v43;
  CGFloat v44;
  CGFloat v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  -[MediaControlsExpandableButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;
  v43 = v4;

  -[MediaControlsExpandableButton bounds](self, "bounds");
  -[MediaControlsExpandableButton backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  CGRectGetMaxY(v46);
  UIRectInset();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, v14);
  v47.origin.x = v8;
  v47.origin.y = v10;
  v47.size.width = v12;
  v47.size.height = v14;
  CGRectGetMinY(v47);
  UIRectCenteredXInRectScale();
  v44 = v16;
  v45 = v15;
  v18 = v17;
  v20 = v19;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v5);
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v12, v14);
  v48.origin.x = v8;
  v48.origin.y = v10;
  v48.size.width = v12;
  v48.size.height = v14;
  CGRectGetMinY(v48);
  UIRectCenteredXInRectScale();
  -[UILabel setFrame:](self->_messageLabel, "setFrame:", v43);
  v49.size.height = v44;
  v49.origin.x = v45;
  v49.origin.y = v18;
  v49.size.width = v20;
  CGRectGetHeight(v49);
  UIRectInset();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[UIImageView sizeThatFits:](self->_subtitleIndicator, "sizeThatFits:", v25, v27);
  v30 = v29;
  subtitleLabel = self->_subtitleLabel;
  v50.origin.x = v22;
  v50.origin.y = v24;
  v50.size.width = v26;
  v50.size.height = v28;
  v32 = CGRectGetWidth(v50) - (v30 + 4.0);
  v51.origin.x = v22;
  v51.origin.y = v24;
  v51.size.width = v26;
  v51.size.height = v28;
  -[UILabel sizeThatFits:](subtitleLabel, "sizeThatFits:", v32, CGRectGetHeight(v51));
  v34 = v33;
  v36 = v35;
  v52.origin.x = v22;
  v52.origin.y = v24;
  v52.size.width = v26;
  v52.size.height = v28;
  CGRectGetWidth(v52);
  UIRectInset();
  x = v53.origin.x;
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  MinX = CGRectGetMinX(v53);
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  MinY = CGRectGetMinY(v54);
  -[MediaControlsExpandableButton bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
  v55.origin.x = MinX;
  v55.origin.y = MinY;
  v55.size.width = v34;
  v55.size.height = v36;
  CGRectGetWidth(v55);
  UIRectInset();
  CGRectGetMinX(v56);
  UIRectCenteredYInRect();
  -[MediaControlsExpandableButton bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIImageView setFrame:](self->_subtitleIndicator, "setFrame:");
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setAxis:(int64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_axis = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_buttons;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAxis:", -[MediaControlsExpandableButton _buttonLayoutAxis](self, "_buttonLayoutAxis", (_QWORD)v9));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[MediaControlsExpandableButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setOptions:(id)a3
{
  uint64_t v5;
  BOOL v6;
  unint64_t i;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  MediaControlsRoundButton *v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v15 = a3;
  objc_storeStrong((id *)&self->_options, a3);
  v5 = objc_msgSend(v15, "count");
  self->_toggleEnabled = v5 == 2;
  v6 = v5 != 2 && self->_expanded;
  self->_expanded = v6;
  for (i = -[NSMutableArray count](self->_buttons, "count", v15); i > objc_msgSend(v16, "count"); --i)
  {
    -[NSMutableArray lastObject](self->_buttons, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_buttons, "removeLastObject");
    objc_msgSend(v8, "removeFromSuperview");

  }
  v9 = -[NSMutableArray count](self->_buttons, "count");
  if (v9 < objc_msgSend(v16, "count"))
  {
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v14 = -[MediaControlsRoundButton initWithFrame:]([MediaControlsRoundButton alloc], "initWithFrame:", v10, v11, v12, v13);
      -[MediaControlsRoundButton addTarget:action:forControlEvents:](v14, "addTarget:action:forControlEvents:", self, sel_didTapButton_, 64);
      -[NSMutableArray addObject:](self->_buttons, "addObject:", v14);
      -[MediaControlsExpandableButton addSubview:](self, "addSubview:", v14);

      ++v9;
    }
    while (v9 < objc_msgSend(v16, "count"));
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__MediaControlsExpandableButton_setOptions___block_invoke;
  v17[3] = &unk_1E581B420;
  v17[4] = self;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);
  -[MediaControlsExpandableButton updateVisualStyling](self, "updateVisualStyling");
  -[MediaControlsExpandableButton setSelectedOptionIndex:](self, "setSelectedOptionIndex:", 0x7FFFFFFFFFFFFFFFLL);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsExpandableButton;
  -[MediaControlsExpandableButton setEnabled:](&v5, sel_setEnabled_);
  -[MediaControlsExpandableButton updateSubtitle](self, "updateSubtitle");
  -[MediaControlsExpandableButton updateVisualStyling](self, "updateVisualStyling");
  -[MediaControlsExpandableButton _updateButtonsVisiblity](self, "_updateButtonsVisiblity");
  -[MediaControlsExpandableButton updateGlyphSelectionState](self, "updateGlyphSelectionState");
  -[MRUExpandableButtonSelectionView setEnabled:](self->_selectionView, "setEnabled:", v3);
  -[MediaControlsExpandableButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelectedOptionIndex:(int64_t)a3
{
  BOOL v4;
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  v4 = self->_selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL;
  self->_selectedOptionIndex = a3;
  -[MediaControlsExpandableButton updateSubtitle](self, "updateSubtitle");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__MediaControlsExpandableButton_setSelectedOptionIndex___block_invoke;
  v6[3] = &unk_1E5818D00;
  v6[4] = self;
  v7 = v4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
  -[MediaControlsExpandableButton selectedOption](self, "selectedOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUExpandableButtonSelectionView setOption:](self->_selectionView, "setOption:", v5);

  -[MediaControlsExpandableButton _updateButtonsVisiblity](self, "_updateButtonsVisiblity");
  -[MediaControlsExpandableButton updateGlyphSelectionState](self, "updateGlyphSelectionState");
  -[MediaControlsExpandableButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateGlyphSelectionState
{
  NSMutableArray *buttons;
  _QWORD v3[5];

  buttons = self->_buttons;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__MediaControlsExpandableButton_updateGlyphSelectionState__block_invoke;
  v3[3] = &unk_1E581B4B8;
  v3[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v3);
}

- (void)_updateButtonsVisiblity
{
  NSMutableArray *buttons;
  _QWORD v3[5];

  buttons = self->_buttons;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__MediaControlsExpandableButton__updateButtonsVisiblity__block_invoke;
  v3[3] = &unk_1E581B4B8;
  v3[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v3);
}

- (MediaControlsExpandableButtonOption)selectedOption
{
  if (self->_selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL)
    return (MediaControlsExpandableButtonOption *)0;
  -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:");
  return (MediaControlsExpandableButtonOption *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)updateVisualStyling
{
  int v3;
  double v4;
  MRUVisualStylingProvider *stylingProvider;
  UILabel *messageLabel;
  double v7;
  UIImageView *subtitleIndicator;
  double v9;
  char v10;

  v3 = -[MediaControlsExpandableButton isEnabled](self, "isEnabled");
  v4 = 0.5;
  if (v3)
    v4 = 1.0;
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v4);
  stylingProvider = self->_stylingProvider;
  if (stylingProvider)
  {
    if (self->_displayMessage)
    {
      -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 0.0);
      -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", 0.0);
      -[UIImageView setAlpha:](self->_subtitleIndicator, "setAlpha:", 0.0);
      -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_messageLabel);
      return;
    }
    if (self->_expanded)
      goto LABEL_23;
    v10 = -[MediaControlsExpandableButton isEnabled](self, "isEnabled");
    stylingProvider = self->_stylingProvider;
    if ((v10 & 1) == 0)
    {
      -[MRUVisualStylingProvider applyStyle:toView:](stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
      -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_subtitleLabel);
      -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_subtitleIndicator);
      -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 0.5);
      -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", 0.5);
      subtitleIndicator = self->_subtitleIndicator;
      v9 = 0.5;
      goto LABEL_18;
    }
    if (stylingProvider)
    {
LABEL_23:
      if (!self->_expanded)
      {
        -[MRUVisualStylingProvider applyStyle:toView:](stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
        -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_subtitleLabel);
        -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_subtitleIndicator);
LABEL_19:
        messageLabel = self->_messageLabel;
        v7 = 0.0;
        goto LABEL_20;
      }
      goto LABEL_12;
    }
LABEL_11:
    if (!self->_expanded)
    {
      -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 1.0);
      -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", 1.0);
      subtitleIndicator = self->_subtitleIndicator;
      v9 = 1.0;
      goto LABEL_18;
    }
LABEL_12:
    -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 0.0);
    -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", 0.0);
    subtitleIndicator = self->_subtitleIndicator;
    v9 = 0.0;
LABEL_18:
    -[UIImageView setAlpha:](subtitleIndicator, "setAlpha:", v9);
    goto LABEL_19;
  }
  if (!self->_displayMessage)
    goto LABEL_11;
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 0.0);
  -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", 0.0);
  -[UIImageView setAlpha:](self->_subtitleIndicator, "setAlpha:", 0.0);
  messageLabel = self->_messageLabel;
  v7 = 1.0;
LABEL_20:
  -[UILabel setAlpha:](messageLabel, "setAlpha:", v7);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)updateSubtitle
{
  NSString *disabledSubtitle;
  void *v4;
  NSString *v5;

  if ((-[MediaControlsExpandableButton isEnabled](self, "isEnabled") & 1) != 0
    || (disabledSubtitle = self->_disabledSubtitle) == 0)
  {
    -[MediaControlsExpandableButton selectedOption](self, "selectedOption");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](self->_subtitleLabel, "setText:", v5);
  }
  else
  {
    v5 = disabledSubtitle;
    -[UILabel setText:](self->_subtitleLabel, "setText:", v5);
  }
  -[MediaControlsExpandableButton _layoutLabels](self, "_layoutLabels");

}

+ (id)optionsForListeningModes:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  MediaControlsExpandableButtonOption *v13;
  void *v14;
  void *v15;
  MediaControlsExpandableButtonOption *v16;
  void *v17;
  void *v18;
  MediaControlsExpandableButtonOption *v19;
  void *v20;
  void *v21;
  MediaControlsExpandableButtonOption *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v28 = *(_QWORD *)v30;
    v7 = *MEMORY[0x1E0C8AB60];
    v8 = *MEMORY[0x1E0C8AB78];
    v9 = *MEMORY[0x1E0C8AB70];
    v10 = *MEMORY[0x1E0C8AB68];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqual:", v7))
        {
          v13 = objc_alloc_init(MediaControlsExpandableButtonOption);
          -[MediaControlsExpandableButtonOption setIdentifier:](v13, "setIdentifier:", v7);
          +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", CFSTR("ListeningModeNoiseCancellation"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setAsset:](v13, "setAsset:", v14);

          +[MRUStringsProvider listeningModeNoiseCancellation](MRUStringsProvider, "listeningModeNoiseCancellation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setTitle:](v13, "setTitle:", v15);

          -[MediaControlsExpandableButtonOption setSelectedState:](v13, "setSelectedState:", CFSTR("on"));
          -[MediaControlsExpandableButtonOption setSelectedBackground:](v13, "setSelectedBackground:", 2);
          objc_msgSend(v4, "addObject:", v13);

        }
        if (objc_msgSend(v12, "isEqual:", v8))
        {
          v16 = objc_alloc_init(MediaControlsExpandableButtonOption);
          -[MediaControlsExpandableButtonOption setIdentifier:](v16, "setIdentifier:", v8);
          +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", CFSTR("ListeningModeOff"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setAsset:](v16, "setAsset:", v17);

          +[MRUStringsProvider listeningModeOff](MRUStringsProvider, "listeningModeOff");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setTitle:](v16, "setTitle:", v18);

          -[MediaControlsExpandableButtonOption setSelectedState:](v16, "setSelectedState:", CFSTR("on"));
          objc_msgSend(v4, "addObject:", v16);

        }
        if (objc_msgSend(v12, "isEqual:", v9))
        {
          v19 = objc_alloc_init(MediaControlsExpandableButtonOption);
          -[MediaControlsExpandableButtonOption setIdentifier:](v19, "setIdentifier:", v9);
          +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", CFSTR("ListeningModeAuto"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setAsset:](v19, "setAsset:", v20);

          +[MRUStringsProvider listeningModeAutomatic](MRUStringsProvider, "listeningModeAutomatic");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setTitle:](v19, "setTitle:", v21);

          -[MediaControlsExpandableButtonOption setSelectedState:](v19, "setSelectedState:", CFSTR("on"));
          -[MediaControlsExpandableButtonOption setSelectedBackground:](v19, "setSelectedBackground:", 1);
          objc_msgSend(v4, "addObject:", v19);

        }
        if (objc_msgSend(v12, "isEqual:", v10))
        {
          v22 = objc_alloc_init(MediaControlsExpandableButtonOption);
          -[MediaControlsExpandableButtonOption setIdentifier:](v22, "setIdentifier:", v10);
          +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", CFSTR("ListeningModeTransparency"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setAsset:](v22, "setAsset:", v23);

          +[MRUStringsProvider listeningModeTransparency](MRUStringsProvider, "listeningModeTransparency");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setTitle:](v22, "setTitle:", v24);

          -[MediaControlsExpandableButtonOption setSelectedState:](v22, "setSelectedState:", CFSTR("on"));
          -[MediaControlsExpandableButtonOption setSelectedBackground:](v22, "setSelectedBackground:", 2);
          objc_msgSend(v4, "addObject:", v22);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v6);
  }

  v25 = (void *)objc_msgSend(v4, "copy");
  return v25;
}

- (void)setAvailableListeningModes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "optionsForListeningModes:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[MediaControlsExpandableButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutDirection");

  if (v6 == 1)
  {
    objc_msgSend(v10, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v8;
  }
  else
  {
    v9 = v10;
  }
  v11 = v9;
  -[MediaControlsExpandableButton setOptions:](self, "setOptions:", v9);

}

- (void)setSelectedListeningMode:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  v6 = a3;
  -[MediaControlsExpandableButton options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__MediaControlsExpandableButton_MRUListeningMode__setSelectedListeningMode_animated___block_invoke;
  v10[3] = &unk_1E581ACD0;
  v11 = v6;
  v9 = v6;
  v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v10);

  -[MediaControlsExpandableButton setSelectedOptionIndex:animated:](self, "setSelectedOptionIndex:animated:", v8, v4);
}

uint64_t __85__MediaControlsExpandableButton_MRUListeningMode__setSelectedListeningMode_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)initForControlCenter
{
  MediaControlsExpandableButton *v2;
  void *v3;

  v2 = -[MediaControlsExpandableButton initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterDarkMaterial");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsExpandableButton setBackgroundView:](v2, "setBackgroundView:", v3);

    v2->_isControlCenter = 1;
  }
  return v2;
}

- (MediaControlsExpandableButton)initWithFrame:(CGRect)a3
{
  MediaControlsExpandableButton *v3;
  uint64_t v4;
  NSMutableArray *buttons;
  uint64_t v6;
  MediaControlsHapticPlayer *hapticPlayer;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIView *backgroundView;
  void *v15;
  MRUExpandableButtonSelectionView *v16;
  MRUExpandableButtonSelectionView *selectionView;
  uint64_t v18;
  UILabel *titleLabel;
  double v20;
  void *v21;
  uint64_t v22;
  UILabel *subtitleLabel;
  double v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  UIImageView *subtitleIndicator;
  uint64_t v30;
  UILabel *messageLabel;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)MediaControlsExpandableButton;
  v3 = -[MediaControlsExpandableButton initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    buttons = v3->_buttons;
    v3->_buttons = (NSMutableArray *)v4;

    v3->_selectedOptionIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[MediaControlsExpandableButton setContentVerticalAlignment:](v3, "setContentVerticalAlignment:", 0);
    v6 = objc_opt_new();
    hapticPlayer = v3->_hapticPlayer;
    v3->_hapticPlayer = (MediaControlsHapticPlayer *)v6;

    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIView *)v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundView, "setBackgroundColor:", v15);

    -[MediaControlsExpandableButton addSubview:](v3, "addSubview:", v3->_backgroundView);
    v16 = -[MRUExpandableButtonSelectionView initWithFrame:]([MRUExpandableButtonSelectionView alloc], "initWithFrame:", v9, v10, v11, v12);
    selectionView = v3->_selectionView;
    v3->_selectionView = v16;

    -[MediaControlsExpandableButton addSubview:](v3, "addSubview:", v3->_selectionView);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v9, v10, v11, v12);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v18;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    LODWORD(v20) = 1051931443;
    -[UILabel _setHyphenationFactor:](v3->_titleLabel, "_setHyphenationFactor:", v20);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v21);

    -[MediaControlsExpandableButton addSubview:](v3, "addSubview:", v3->_titleLabel);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v9, v10, v11, v12);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v22;

    -[UILabel setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 2);
    LODWORD(v24) = 1051931443;
    -[UILabel _setHyphenationFactor:](v3->_subtitleLabel, "_setHyphenationFactor:", v24);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v25);

    -[MediaControlsExpandableButton addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    v26 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.up.chevron.down"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithImage:", v27);
    subtitleIndicator = v3->_subtitleIndicator;
    v3->_subtitleIndicator = (UIImageView *)v28;

    -[MediaControlsExpandableButton addSubview:](v3, "addSubview:", v3->_subtitleIndicator);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v9, v10, v11, v12);
    messageLabel = v3->_messageLabel;
    v3->_messageLabel = (UILabel *)v30;

    -[UILabel setNumberOfLines:](v3->_messageLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v3->_messageLabel, "setTextAlignment:", 1);
    LODWORD(v32) = 1051931443;
    -[UILabel _setHyphenationFactor:](v3->_messageLabel, "_setHyphenationFactor:", v32);
    -[UILabel setAlpha:](v3->_messageLabel, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_messageLabel, "setTextColor:", v33);

    -[MediaControlsExpandableButton addSubview:](v3, "addSubview:", v3->_messageLabel);
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    -[MediaControlsExpandableButton addInteraction:](v3, "addInteraction:", v34);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MediaControlsExpandableButton updateContentSizeCategory](v3, "updateContentSizeCategory");
  }
  return v3;
}

uint64_t __47__MediaControlsExpandableButton_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v3;
  double v4;
  double *v5;
  double v6;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 464))
  {
    v3 = *(double *)(a1 + 80);
    v4 = *(double *)(a1 + 72) + v3 * (double)a3;
    v5 = (double *)(a1 + 88);
    v6 = 0.0;
  }
  else
  {
    v4 = *(double *)(a1 + 40);
    v6 = *(double *)(a1 + 48);
    v5 = (double *)(a1 + 64);
    v3 = *(double *)(a1 + 56);
  }
  return objc_msgSend(a2, "setFrame:", v4, v6, v3, *v5);
}

uint64_t __47__MediaControlsExpandableButton_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3;
  double v4;
  double v5;
  double *v6;
  double v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 464))
  {
    v4 = *(double *)(v3 + 624);
    v5 = *(double *)(a1 + 72) + (*(double *)(a1 + 80) + v4) * (double)a3;
    v6 = (double *)(a1 + 88);
    v7 = 0.0;
  }
  else
  {
    v7 = *(double *)(a1 + 40);
    v5 = *(double *)(a1 + 48);
    v6 = (double *)(a1 + 56);
    v4 = *(double *)(a1 + 64);
  }
  return objc_msgSend(a2, "setFrame:", v7, v5, *v6, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self->_axis && self->_expanded)
  {
    v5 = self->_maximumExpandedSize.height;
    if (v5 <= 0.0)
    {
      v6 = self->_buttonImageSize.height;
      v5 = v6 * (double)(unint64_t)-[NSMutableArray count](self->_buttons, "count");
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "collapsedHeightWithImageHeight:maximumHeight:", self->_buttonImageSize.height, a3.height);
    v5 = v7 + 0.0;
  }
  if (v5 >= height)
    v8 = height;
  else
    v8 = v5;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

+ (double)collapsedHeightWithImageHeight:(double)a3 maximumHeight:(double)a4
{
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v5 = a3 + 8.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_volumeButtonTitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  UICeilToScale();
  v9 = v5 + v8;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_volumeButtonSubtitleFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");
  UICeilToScale();
  v12 = v9 + v11;

  if (v12 >= a4)
    return a4;
  else
    return v12;
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  v7 = v5;
  if (backgroundView != v5)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[MediaControlsExpandableButton insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);
  }

}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MediaControlsExpandableButton updateVisualStyling](self, "updateVisualStyling");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_buttons;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setStylingProvider:", v5, (_QWORD)v12);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

void __44__MediaControlsExpandableButton_setOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v7);

  objc_msgSend(v6, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAsset:", v8);
  objc_msgSend(v9, "setStylingProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
  objc_msgSend(v9, "setAssetSize:", *(double *)(*(_QWORD *)(a1 + 32) + 616), *(double *)(*(_QWORD *)(a1 + 32) + 624));
  objc_msgSend(v9, "setAxis:", objc_msgSend(*(id *)(a1 + 32), "_buttonLayoutAxis"));
  objc_msgSend(v9, "setContentVerticalAlignment:", objc_msgSend(*(id *)(a1 + 32), "contentVerticalAlignment"));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 467))
    objc_msgSend(v9, "controlCenterApplyPrimaryContentShadow");

}

- (id)selectedButton
{
  void *v3;

  if (self->_selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t)-[NSMutableArray count](self->_buttons, "count") <= self->_selectedOptionIndex)
  {
    v3 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t __65__MediaControlsExpandableButton_setSelectedOptionIndex_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSelectedOptionIndex:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setSelectedOptionIndexWithValueChanged:(unint64_t)a3
{
  _QWORD v4[6];

  if (self->_selectedOptionIndex != a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__MediaControlsExpandableButton_setSelectedOptionIndexWithValueChanged___block_invoke;
    v4[3] = &unk_1E5819110;
    v4[4] = self;
    v4[5] = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 0.25);
    -[MediaControlsExpandableButton updateGlyphSelectionState](self, "updateGlyphSelectionState");
    -[MediaControlsExpandableButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

uint64_t __72__MediaControlsExpandableButton_setSelectedOptionIndexWithValueChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedOptionIndex:", *(_QWORD *)(a1 + 40));
}

- (void)toggleSelectedOption
{
  -[MediaControlsExpandableButton setSelectedOptionIndexWithValueChanged:](self, "setSelectedOptionIndexWithValueChanged:", self->_selectedOptionIndex == 0);
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MediaControlsExpandableButton;
  -[MediaControlsExpandableButton setContentVerticalAlignment:](&v13, sel_setContentVerticalAlignment_, a3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_buttons;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setContentVerticalAlignment:", -[MediaControlsExpandableButton contentVerticalAlignment](self, "contentVerticalAlignment", (_QWORD)v9));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void)setButtonImageSize:(CGSize)a3
{
  double height;
  double width;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  height = a3.height;
  width = a3.width;
  v16 = *MEMORY[0x1E0C80C00];
  self->_buttonImageSize = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_buttons;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setAssetSize:", width, height, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[MediaControlsExpandableButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];

  if (self->_expanded != a3 && !self->_toggleEnabled)
  {
    v4 = a3;
    self->_expanded = a3;
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__MediaControlsExpandableButton_setExpanded___block_invoke;
    v9[3] = &unk_1E5818C88;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
    {
      v7[0] = v5;
      v7[1] = 3221225472;
      v7[2] = __45__MediaControlsExpandableButton_setExpanded___block_invoke_2;
      v7[3] = &unk_1E5818D00;
      v7[4] = self;
      v8 = v4;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 96, v7, 0, 0.25, 0.0);
    }
    else
    {
      -[MediaControlsExpandableButton _updateButtonsVisiblity](self, "_updateButtonsVisiblity");
      -[MediaControlsExpandableButton updateVisualStyling](self, "updateVisualStyling");
      -[MediaControlsExpandableButton selectionView](self, "selectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setExpanded:", v4);

    }
    -[MediaControlsExpandableButton setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __45__MediaControlsExpandableButton_setExpanded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetMessageAnimated:", 0);
}

void __45__MediaControlsExpandableButton_setExpanded___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateButtonsVisiblity");
  objc_msgSend(*(id *)(a1 + 32), "updateVisualStyling");
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "selectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExpanded:", v2);

}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsExpandableButton;
  -[MediaControlsExpandableButton setHighlighted:](&v5, sel_setHighlighted_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MediaControlsExpandableButton_setHighlighted___block_invoke;
  v4[3] = &unk_1E5818C88;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 0.15);
}

uint64_t __48__MediaControlsExpandableButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutSelectionView");
}

- (void)showMessage:(id)a3
{
  NSTimer *v4;
  NSTimer *messageTimer;
  _QWORD v6[5];

  -[UILabel setText:](self->_messageLabel, "setText:", a3);
  -[MediaControlsExpandableButton _layoutLabels](self, "_layoutLabels");
  -[NSTimer invalidate](self->_messageTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_resetMessage, 0, 0, 2.25);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  messageTimer = self->_messageTimer;
  self->_messageTimer = v4;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MediaControlsExpandableButton_showMessage___block_invoke;
  v6[3] = &unk_1E5818C88;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.25);
}

uint64_t __45__MediaControlsExpandableButton_showMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayMessage:", 1);
}

- (void)setDisplayMessage:(BOOL)a3
{
  self->_displayMessage = a3;
  -[MediaControlsExpandableButton _updateButtonsVisiblity](self, "_updateButtonsVisiblity");
  -[MediaControlsExpandableButton updateVisualStyling](self, "updateVisualStyling");
}

- (void)playValueChangedEventHaptic
{
  if (-[MediaControlsExpandableButton isTracking](self, "isTracking"))
    -[MediaControlsHapticPlayer expandedButtonChanged](self->_hapticPlayer, "expandedButtonChanged");
}

- (void)playFailedValueChangedEventHaptic
{
  AudioServicesPlaySystemSound(0x5F1u);
}

- (void)playFailedValueChangedEventHapticWithMessage:(id)a3
{
  if (a3)
    -[MediaControlsExpandableButton showMessage:](self, "showMessage:");
  -[MediaControlsExpandableButton playFailedValueChangedEventHaptic](self, "playFailedValueChangedEventHaptic");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  CGPoint v12;
  CGPoint v13;
  CGPoint v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  -[MediaControlsExpandableButton backgroundView](self, "backgroundView", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v12.x = x;
  v12.y = y;
  if (CGRectContainsPoint(v15, v12))
  {
    v8 = 1;
  }
  else
  {
    -[MediaControlsExpandableButton titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v13.x = x;
    v13.y = y;
    if (CGRectContainsPoint(v16, v13))
    {
      v8 = 1;
    }
    else
    {
      -[MediaControlsExpandableButton subtitleLabel](self, "subtitleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v14.x = x;
      v14.y = y;
      v8 = CGRectContainsPoint(v17, v14);

    }
  }

  return v8;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  void *v4;

  if (self->_expanded)
  {
    -[MediaControlsHapticPlayer prepare](self->_hapticPlayer, "prepare", a3, a4);
  }
  else
  {
    -[MediaControlsExpandableButton selectedButton](self, "selectedButton", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHighlighted:", 1);

  }
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  char v6;
  int64_t axis;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSMutableArray *buttons;
  uint64_t v14;
  uint64_t v15;
  int64_t selectedOptionIndex;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD v27[7];
  BOOL v28;
  BOOL v29;
  _QWORD v30[7];

  v5 = a3;
  v6 = objc_msgSend(v5, "_isPointerTouch");
  if ((v6 & 1) == 0 && self->_expanded)
  {
    axis = self->_axis;
    if (axis)
    {
      -[MRUExpandableButtonSelectionView center](self->_selectionView, "center");
      v9 = v8;
      objc_msgSend(v5, "locationInView:", self);
    }
    else
    {
      objc_msgSend(v5, "locationInView:", self);
      v9 = v11;
      -[MRUExpandableButtonSelectionView center](self->_selectionView, "center");
    }
    v12 = v10;
    buttons = self->_buttons;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __69__MediaControlsExpandableButton_continueTrackingWithTouch_withEvent___block_invoke;
    v30[3] = &__block_descriptor_48_e41_B32__0__MediaControlsRoundButton_8Q16_B24l;
    *(double *)&v30[4] = v9;
    *(double *)&v30[5] = v10;
    v14 = -[NSMutableArray indexOfObjectPassingTest:](buttons, "indexOfObjectPassingTest:", v30);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = v14;
      selectedOptionIndex = self->_selectedOptionIndex;
      v17 = v14 != selectedOptionIndex;
      v18 = -[NSMutableArray count](self->_buttons, "count");
      if ((selectedOptionIndex & (unint64_t)~(selectedOptionIndex >> 63)) >= v18 - 1)
        v19 = v18 - 1;
      else
        v19 = selectedOptionIndex & ~(selectedOptionIndex >> 63);
      -[NSMutableArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "center");
      v22 = v21;
      v24 = v23;

      v25 = v12 - v24;
      v27[0] = MEMORY[0x1E0C809B0];
      if (!axis)
        v25 = v9 - v22;
      v27[1] = 3221225472;
      v27[2] = __69__MediaControlsExpandableButton_continueTrackingWithTouch_withEvent___block_invoke_2;
      v27[3] = &unk_1E581B468;
      v27[4] = self;
      v28 = axis == 0;
      *(double *)&v27[5] = v25;
      v29 = v17;
      v27[6] = v15;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v27, 0.1);
      if (v15 != selectedOptionIndex)
        -[MediaControlsExpandableButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    }
  }

  return v6 ^ 1;
}

uint64_t __69__MediaControlsExpandableButton_continueTrackingWithTouch_withEvent___block_invoke(CGPoint *a1, void *a2)
{
  id v3;
  uint64_t v4;
  CGRect v6;

  v3 = a2;
  objc_msgSend(v3, "frame");
  if (CGRectContainsPoint(v6, a1[2]))
    v4 = objc_msgSend(v3, "isEnabled");
  else
    v4 = 0;

  return v4;
}

uint64_t __69__MediaControlsExpandableButton_continueTrackingWithTouch_withEvent___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  uint64_t result;
  CGAffineTransform v6;
  CGAffineTransform v7;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = 0.0;
    v3 = *(double *)(a1 + 40) / 6.0;
  }
  else
  {
    v3 = 0.0;
    v2 = *(double *)(a1 + 40) / 6.0;
  }
  CGAffineTransformMakeTranslation(&v7, v3, v2);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
  v6 = v7;
  result = objc_msgSend(v4, "setTransform:", &v6);
  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedOptionIndex:", *(_QWORD *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 32), "updateGlyphSelectionState");
  }
  return result;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsExpandableButton;
  -[MediaControlsExpandableButton endTrackingWithTouch:withEvent:](&v9, sel_endTrackingWithTouch_withEvent_, v6, v7);
  if (self->_expanded)
  {
    -[MediaControlsExpandableButton _resetSelectionView](self, "_resetSelectionView");
    -[MediaControlsExpandableButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x40000);
    -[MediaControlsHapticPlayer tearDown](self->_hapticPlayer, "tearDown");
  }
  else
  {
    -[MediaControlsExpandableButton selectedButton](self, "selectedButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighlighted:", 0);

    objc_msgSend(v6, "locationInView:", self);
    if (-[MediaControlsExpandableButton pointInside:withEvent:](self, "pointInside:withEvent:", v7))
    {
      if (self->_toggleEnabled)
        -[MediaControlsExpandableButton toggleSelectedOption](self, "toggleSelectedOption");
      else
        -[MediaControlsExpandableButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
    }
  }

}

- (void)cancelTrackingWithEvent:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsExpandableButton;
  -[MediaControlsExpandableButton cancelTrackingWithEvent:](&v5, sel_cancelTrackingWithEvent_, a3);
  -[MediaControlsExpandableButton _resetSelectionView](self, "_resetSelectionView");
  -[MediaControlsHapticPlayer tearDown](self->_hapticPlayer, "tearDown");
  if (!self->_expanded)
  {
    -[MediaControlsExpandableButton selectedButton](self, "selectedButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHighlighted:", 0);

  }
}

- (void)didTapButton:(id)a3
{
  uint64_t v4;

  v4 = -[NSMutableArray indexOfObject:](self->_buttons, "indexOfObject:", a3);
  if (self->_toggleEnabled)
  {
    -[MediaControlsExpandableButton toggleSelectedOption](self, "toggleSelectedOption");
  }
  else if (self->_expanded && self->_selectedOptionIndex != v4)
  {
    -[MediaControlsExpandableButton setSelectedOptionIndexWithValueChanged:](self, "setSelectedOptionIndexWithValueChanged:", v4);
  }
  else
  {
    -[MediaControlsExpandableButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  MediaControlsExpandableButton *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (MediaControlsExpandableButton *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1)
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "numberOfTapsRequired");

  if (v6 != 1)
  {
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  NSMutableArray *buttons;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v6 = a4;
  buttons = self->_buttons;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83__MediaControlsExpandableButton_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
  v24[3] = &unk_1E581B490;
  v8 = v6;
  v25 = v8;
  v9 = -[NSMutableArray indexOfObjectPassingTest:](buttons, "indexOfObjectPassingTest:", v24);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || (v10 = v9, v9 == self->_selectedOptionIndex) && self->_expanded)
  {
    v11 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetFrame");
    -[MediaControlsExpandableButton convertRect:fromView:](self, "convertRect:fromView:", v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = (void *)MEMORY[0x1E0DC3B28];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "regionWithRect:identifier:", v22, v14, v16, v18, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

BOOL __83__MediaControlsExpandableButton_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGPoint v14;
  CGRect v15;

  objc_msgSend(a2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "location");
  v14.x = v11;
  v14.y = v12;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  return CGRectContainsPoint(v15, v14);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (self->_toggleEnabled || !self->_expanded)
  {
    v8 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v5, "rect");
    objc_msgSend(v8, "bezierPathWithOvalInRect:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    objc_msgSend(v10, "setShadowPath:", v9);
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v10);
    objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithPath:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7 == self->_selectedOptionIndex)
    {
      v14 = 0;
      goto LABEL_4;
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v9, "assetFrame");
    objc_msgSend(v16, "bezierPathWithOvalInRect:");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    objc_msgSend(v11, "setShadowPath:", v10);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v9, v11);
    objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithPath:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v13, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:

  return v14;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  -[MRUExpandableButtonSelectionView setClipsToBounds:](self->_selectionView, "setClipsToBounds:", 0, a4, a5);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  -[MRUExpandableButtonSelectionView setClipsToBounds:](self->_selectionView, "setClipsToBounds:", 1, a4, a5);
}

void __56__MediaControlsExpandableButton__updateButtonsVisiblity__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  double v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 464))
  {
    objc_msgSend(v11, "setUserInteractionEnabled:", 1);
    v10 = 0.0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) == a3)
      v10 = 1.0;
    objc_msgSend(v11, "setAlpha:", v10);
    objc_msgSend(v11, "setSelected:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) == a3);
    objc_msgSend(v11, "setLabelHidden:", 1);
    v8 = *(void **)(a1 + 32);
    goto LABEL_7;
  }
  objc_msgSend(v11, "setUserInteractionEnabled:", *(_QWORD *)(v6 + 480) != a3);
  objc_msgSend(v11, "setAlpha:", 1.0);
  objc_msgSend(v11, "setSelected:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) == a3);
  objc_msgSend(v11, "setLabelHidden:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 466));
  v7 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
  v8 = v5;
  if ((v7 & 1) != 0)
  {
LABEL_7:
    v9 = objc_msgSend(v8, "isEnabled");
    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:
  objc_msgSend(v11, "setEnabled:", v9);

}

void __58__MediaControlsExpandableButton_updateGlyphSelectionState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) == a3)
  {
    objc_msgSend(v5, "selectedState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGlyphState:", v7);

  }
  else
  {
    objc_msgSend(v8, "setGlyphState:", 0);
  }

}

- (void)_resetSelectionView
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__MediaControlsExpandableButton__resetSelectionView__block_invoke;
  v2[3] = &unk_1E5818C88;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "mru_animateUsingType:animations:", 2, v2);
}

uint64_t __52__MediaControlsExpandableButton__resetSelectionView__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "_layoutSelectionView");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

- (void)resetMessage
{
  -[MediaControlsExpandableButton resetMessageAnimated:](self, "resetMessageAnimated:", 1);
}

- (void)resetMessageAnimated:(BOOL)a3
{
  _BOOL4 v3;
  NSTimer *messageTimer;
  _QWORD v6[5];

  v3 = a3;
  -[NSTimer invalidate](self->_messageTimer, "invalidate");
  messageTimer = self->_messageTimer;
  self->_messageTimer = 0;

  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__MediaControlsExpandableButton_resetMessageAnimated___block_invoke;
    v6[3] = &unk_1E5818C88;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.25);
  }
  else
  {
    -[MediaControlsExpandableButton setDisplayMessage:](self, "setDisplayMessage:", 0);
  }
}

uint64_t __54__MediaControlsExpandableButton_resetMessageAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayMessage:", 0);
}

- (int64_t)_buttonLayoutAxis
{
  if (self->_toggleEnabled)
    return 0;
  else
    return self->_axis;
}

- (void)updateContentSizeCategory
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_volumeButtonTitleFont");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "mru_volumeButtonSubtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v3);
  -[UILabel setFont:](self->_messageLabel, "setFont:", v5);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setSymbolConfiguration:](self->_subtitleIndicator, "setSymbolConfiguration:", v4);

  -[MediaControlsExpandableButton setNeedsLayout](self, "setNeedsLayout");
}

- (NSArray)options
{
  return self->_options;
}

- (int64_t)selectedOptionIndex
{
  return self->_selectedOptionIndex;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)disabledSubtitle
{
  return self->_disabledSubtitle;
}

- (int64_t)axis
{
  return self->_axis;
}

- (CGSize)maximumExpandedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumExpandedSize.width;
  height = self->_maximumExpandedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumExpandedSize:(CGSize)a3
{
  self->_maximumExpandedSize = a3;
}

- (CGSize)buttonImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_buttonImageSize.width;
  height = self->_buttonImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (MediaControlsHapticPlayer)hapticPlayer
{
  return self->_hapticPlayer;
}

- (void)setHapticPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_hapticPlayer, a3);
}

- (MRUExpandableButtonSelectionView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIImageView)subtitleIndicator
{
  return self->_subtitleIndicator;
}

- (void)setSubtitleIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleIndicator, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (NSTimer)messageTimer
{
  return self->_messageTimer;
}

- (void)setMessageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_messageTimer, a3);
}

- (BOOL)toggleEnabled
{
  return self->_toggleEnabled;
}

- (void)setToggleEnabled:(BOOL)a3
{
  self->_toggleEnabled = a3;
}

- (BOOL)displayMessage
{
  return self->_displayMessage;
}

- (BOOL)isControlCenter
{
  return self->_isControlCenter;
}

- (void)setIsControlCenter:(BOOL)a3
{
  self->_isControlCenter = a3;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void)setVisualStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_visualStylingProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_subtitleIndicator, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_hapticPlayer, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_disabledSubtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
