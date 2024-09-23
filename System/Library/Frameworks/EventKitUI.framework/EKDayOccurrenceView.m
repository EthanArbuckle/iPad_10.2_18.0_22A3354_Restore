@implementation EKDayOccurrenceView

- (double)visibleHeight
{
  return self->_visibleHeight;
}

- (BOOL)usesSmallText
{
  return self->_usesSmallText;
}

- (double)travelTime
{
  return self->_travelTime;
}

- (BOOL)selected
{
  return self->_selected;
}

- (EKEvent)occurrence
{
  return self->_occurrence;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (int64_t)birthdayCount
{
  return self->_birthdayCount;
}

- (int64_t)userInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[EKDayOccurrenceView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  return v3;
}

- (int64_t)horizontalSizeClass
{
  void *v2;
  int64_t v3;

  -[EKDayOccurrenceView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  return v3;
}

- (void)setTopPinningProximity:(double)a3
{
  double topPinningProximity;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  topPinningProximity = self->_topPinningProximity;
  if (a3 >= 1.0 && topPinningProximity < 1.0)
  {
    -[UIImageView layer](self->_eventBackgroundView, "layer", topPinningProximity);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMasksToBounds:", 0);

  }
  else if (a3 < 1.0 && topPinningProximity >= 1.0)
  {
    -[UIImageView layer](self->_eventBackgroundView, "layer", topPinningProximity);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMasksToBounds:", 1);

    -[EKDayOccurrenceView _updateCornerRadius](self, "_updateCornerRadius");
  }
  if (a3 >= 1.0 || a3 <= 0.0)
  {
    -[UIImageView layer](self->_eventBackgroundView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 4.0;
  }
  else
  {
    -[UIImageView layer](self->_eventBackgroundView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = (1.0 - a3) * 4.0;
  }
  objc_msgSend(v10, "setCornerRadius:", v12);

  self->_topPinningProximity = a3;
}

- (void)setBottomPinningProximity:(double)a3
{
  double v4;
  unint64_t bottomPinningState;
  _BOOL4 v6;
  BOOL v7;
  uint64_t v8;
  UIView *v9;
  double v10;
  UIView *pinFadeView;
  UIView *v13;
  UIView *v14;
  UIView *v15;
  void *v16;
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  BOOL v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  double v59;
  _QWORD v60[9];
  CGRect v61;
  CGRect v62;

  v4 = fmin(fmax(a3, 0.0), 1.0);
  bottomPinningState = self->_bottomPinningState;
  v6 = v4 > 0.0;
  if (v4 <= 0.0)
  {
    v8 = 0;
    goto LABEL_8;
  }
  if (v4 < 1.0)
  {
    v7 = bottomPinningState == 1;
    if (bottomPinningState == 1)
      goto LABEL_22;
    if (-[EKDayOccurrenceView isSelectedCopyView](self, "isSelectedCopyView"))
    {
      pinFadeView = self->_pinFadeView;
      if (pinFadeView)
      {
        -[UIView removeFromSuperview](pinFadeView, "removeFromSuperview");
        v13 = self->_pinFadeView;
        self->_pinFadeView = 0;

      }
      goto LABEL_22;
    }
    v14 = (UIView *)objc_opt_new();
    v15 = self->_pinFadeView;
    self->_pinFadeView = v14;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_pinFadeView, "setBackgroundColor:", v16);

    if (bottomPinningState)
    {
      x = self->_unpinnedEventBackgroundFrame.origin.x;
      y = self->_unpinnedEventBackgroundFrame.origin.y;
      width = self->_unpinnedEventBackgroundFrame.size.width;
      height = self->_unpinnedEventBackgroundFrame.size.height;
      v21 = self->_unpinnedTravelBackgroundFrame.size.height;
      if (v21 > 0.0)
      {
        v22 = self->_unpinnedTravelBackgroundFrame.origin.x;
        v23 = self->_unpinnedTravelBackgroundFrame.origin.y;
        v24 = self->_unpinnedTravelBackgroundFrame.size.width;
LABEL_20:
        v61.origin.x = x;
        v61.origin.y = y;
        v61.size.width = width;
        v61.size.height = height;
        v62 = CGRectUnion(v61, *(CGRect *)(&v21 - 3));
        x = v62.origin.x;
        y = v62.origin.y;
        width = v62.size.width;
        height = v62.size.height;
      }
    }
    else
    {
      -[UIImageView frame](self->_eventBackgroundView, "frame");
      x = v25;
      y = v26;
      width = v27;
      height = v28;
      -[UIImageView frame](self->_travelBackgroundView, "frame");
      if (v29 > 0.0)
      {
        -[UIImageView frame](self->_travelBackgroundView, "frame");
        v22 = v30;
        v23 = v31;
        v24 = v32;
        v21 = v33;
        goto LABEL_20;
      }
    }
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __49__EKDayOccurrenceView_setBottomPinningProximity___block_invoke;
    v60[3] = &unk_1E601AA08;
    v60[4] = self;
    *(CGFloat *)&v60[5] = x;
    *(double *)&v60[6] = y + 2.0;
    *(CGFloat *)&v60[7] = width;
    *(double *)&v60[8] = height + -2.0;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v60);
    v7 = bottomPinningState == 1;
LABEL_22:
    -[UIView setAlpha:](self->_pinFadeView, "setAlpha:", v4);
    v10 = 1.0 - v4;
    -[UIImageView layer](self->_travelBackgroundView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCornerRadius:", (1.0 - v4) * 4.0);

    -[UIImageView layer](self->_eventBackgroundView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCornerRadius:", (1.0 - v4) * 4.0);

    v6 = 0;
    v58 = 1;
    v8 = 1;
    goto LABEL_23;
  }
  v8 = 2;
LABEL_8:
  if (bottomPinningState == 1)
  {
    -[UIView removeFromSuperview](self->_pinFadeView, "removeFromSuperview");
    v9 = self->_pinFadeView;
    self->_pinFadeView = 0;

  }
  if (v8 != bottomPinningState)
  {
    v7 = 0;
    v58 = 0;
    v10 = 1.0 - v4;
LABEL_23:
    -[UIImageView setAlpha:](self->_contentView, "setAlpha:", v10);
    -[EKDayOccurrenceTravelTimeView setAlpha:](self->_travelTimeContentView, "setAlpha:", v10);
    objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceView traitCollection](self, "traitCollection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v37);

    if (!-[EKDayOccurrenceView isSelectedCopyView](self, "isSelectedCopyView"))
    {
      v38 = v7;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0.0;
      objc_msgSend(v39, "getWhite:alpha:", &v59, 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v59, v4 * 0.75);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDayOccurrenceView setBackgroundColor:](self, "setBackgroundColor:", v40);

      v7 = v38;
    }
    objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v36);

    if (!v7)
    {
      if (v6)
      {
        -[EKDayOccurrenceView layoutIfNeeded](self, "layoutIfNeeded");
        -[UIImageView frame](self->_eventBackgroundView, "frame");
        self->_unpinnedEventBackgroundFrame.origin.x = v41;
        self->_unpinnedEventBackgroundFrame.origin.y = v42;
        self->_unpinnedEventBackgroundFrame.size.width = v43;
        self->_unpinnedEventBackgroundFrame.size.height = v44;
        -[UIImageView frame](self->_travelBackgroundView, "frame");
        self->_unpinnedTravelBackgroundFrame.origin.x = v45;
        self->_unpinnedTravelBackgroundFrame.origin.y = v46;
        self->_unpinnedTravelBackgroundFrame.size.width = v47;
        self->_unpinnedTravelBackgroundFrame.size.height = v48;
        -[UIImageView frame](self->_travelBackgroundView, "frame");
        if (v49 <= 2.0)
        {
          -[UIImageView frame](self->_eventBackgroundView, "frame");
          -[UIImageView setFrame:](self->_eventBackgroundView, "setFrame:");
          -[EKDayOccurrenceView _updateColorBarFrame](self, "_updateColorBarFrame");
        }
        else
        {
          -[UIImageView frame](self->_travelBackgroundView, "frame");
          -[UIImageView setFrame:](self->_travelBackgroundView, "setFrame:");
        }
        v51 = v58;
        -[UIImageView layer](self->_eventBackgroundView, "layer");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setMasksToBounds:", 0);

        -[UIImageView layer](self->_travelBackgroundView, "layer");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setMasksToBounds:", 0);

      }
      else
      {
        v50 = bottomPinningState == 2;
        v51 = v58;
        if (v50)
        {
          -[UIImageView layer](self->_eventBackgroundView, "layer");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setMasksToBounds:", 1);

          -[UIImageView layer](self->_travelBackgroundView, "layer");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setMasksToBounds:", 1);

          -[UIImageView setFrame:](self->_eventBackgroundView, "setFrame:", self->_unpinnedEventBackgroundFrame.origin.x, self->_unpinnedEventBackgroundFrame.origin.y, self->_unpinnedEventBackgroundFrame.size.width, self->_unpinnedEventBackgroundFrame.size.height);
          -[EKDayOccurrenceView _updateColorBarFrame](self, "_updateColorBarFrame");
          -[UIImageView setFrame:](self->_travelBackgroundView, "setFrame:", self->_unpinnedTravelBackgroundFrame.origin.x, self->_unpinnedTravelBackgroundFrame.origin.y, self->_unpinnedTravelBackgroundFrame.size.width, self->_unpinnedTravelBackgroundFrame.size.height);
          -[EKDayOccurrenceView _updateCornerRadius](self, "_updateCornerRadius");
        }
      }
      if ((v51 & 1) == 0)
      {
        -[UIImageView layer](self->_travelBackgroundView, "layer");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setCornerRadius:", 4.0);

        -[UIImageView layer](self->_eventBackgroundView, "layer");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setCornerRadius:", 4.0);

      }
    }
    bottomPinningState = v8;
  }
  self->_bottomPinningProximity = v4;
  self->_bottomPinningState = bottomPinningState;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setVisibleHeight:(double)a3
{
  if (self->_visibleHeight != a3)
  {
    self->_visibleHeight = a3;
    -[EKDayOccurrenceView _invalidateContentBounds](self, "_invalidateContentBounds");
  }
}

- (void)setTravelTimeSubviewHeightInPoints:(double)a3
{
  self->_travelTimeSubviewHeightInPoints = a3;
}

- (void)setOccurrence:(id)a3
{
  EKEvent *v5;
  EKEvent *v6;
  NSArray *v7;
  NSArray *occurrences;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = (EKEvent *)a3;
  v6 = v5;
  if (v5)
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    occurrences = self->_occurrences;
    self->_occurrences = v7;
  }
  else
  {
    occurrences = self->_occurrences;
    self->_occurrences = (NSArray *)MEMORY[0x1E0C9AA60];
  }

  if (self->_occurrence != v6)
  {
    objc_storeStrong((id *)&self->_occurrence, a3);
    -[EKDayOccurrenceView setupWithOccurrence:](self, "setupWithOccurrence:", v6);
  }

}

- (BOOL)isProposedTime
{
  return self->_isProposedTime;
}

- (void)setBirthday:(BOOL)a3
{
  self->_birthday = a3;
}

- (void)prepareForReuse
{
  EKEvent *occurrence;
  void *v4;
  double v5;
  UIColor *stagedBackgroundColor;
  void *v7;
  void *v8;

  occurrence = self->_occurrence;
  self->_occurrence = 0;

  -[EKDayOccurrenceView setFrame:](self, "setFrame:", *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
  -[EKDayOccurrenceView setAlpha:](self, "setAlpha:", 1.0);
  -[EKDayOccurrenceView setSelected:](self, "setSelected:", 0);
  -[EKDayOccurrenceView setDimmed:](self, "setDimmed:", 0);
  -[EKDayOccurrenceView setTentative:](self, "setTentative:", 0);
  -[EKDayOccurrenceView setDeclined:](self, "setDeclined:", 0);
  -[EKDayOccurrenceView setNeedsReply:](self, "setNeedsReply:", 0);
  -[EKDayOccurrenceView setCancelled:](self, "setCancelled:", 0);
  -[EKDayOccurrenceView setUsesSmallText:](self, "setUsesSmallText:", 0);
  -[EKDayOccurrenceView setOccurrenceIsFirstVisibleDayOfEvent:](self, "setOccurrenceIsFirstVisibleDayOfEvent:", 0);
  -[EKDayOccurrenceView setDrawsResizeHandles:](self, "setDrawsResizeHandles:", 0);
  -[EKDayOccurrenceView setAllDay:](self, "setAllDay:", 0);
  -[EKDayOccurrenceView setAllDayDrawingStyle:](self, "setAllDayDrawingStyle:", 0);
  if (-[EKDayOccurrenceView isHidden](self, "isHidden"))
    -[EKDayOccurrenceView setHidden:](self, "setHidden:", 0);
  -[EKDayOccurrenceView setContentMode:](self, "setContentMode:", 0);
  -[EKDayOccurrenceView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setShadowOpacity:", v5);

  -[EKDayOccurrenceView setCappedColorBarHeight:](self, "setCappedColorBarHeight:", -1.0);
  objc_msgSend((id)objc_opt_class(), "defaultMargin");
  -[EKDayOccurrenceView setMargin:](self, "setMargin:");
  objc_msgSend((id)objc_opt_class(), "defaultPadding");
  -[EKDayOccurrenceView setPadding:](self, "setPadding:");
  -[EKDayOccurrenceView setTravelTime:](self, "setTravelTime:", 0.0);
  -[EKDayOccurrenceView setRoutingMode:](self, "setRoutingMode:", 0);
  -[EKDayOccurrenceView setIsSelectedCopyView:](self, "setIsSelectedCopyView:", 0);
  -[EKDayOccurrenceView setIsProposedTime:](self, "setIsProposedTime:", 0);
  -[EKDayOccurrenceView setBirthdayCount:](self, "setBirthdayCount:", 0);
  -[EKDayOccurrenceView setSelectedCopy:](self, "setSelectedCopy:", 0);
  -[EKDayOccurrenceView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  -[EKDayOccurrenceView setHideBackgroundImage:](self, "setHideBackgroundImage:", 0);
  -[EKDayOccurrenceView setHideText:](self, "setHideText:", 0);
  -[EKDayOccurrenceView setPointerInteractionDisabled:](self, "setPointerInteractionDisabled:", 0);
  -[EKDayOccurrenceView setHasPrecedingDuration:](self, "setHasPrecedingDuration:", 0);
  -[EKDayOccurrenceView setHasTrailingDuration:](self, "setHasTrailingDuration:", 0);
  self->_visibleHeight = 1.79769313e308;
  self->_needsBackgroundImageUpdate = 1;
  self->_needsContentCalc = 1;
  -[UIImageView setAlpha:](self->_contentView, "setAlpha:", 1.0);
  stagedBackgroundColor = self->_stagedBackgroundColor;
  self->_stagedBackgroundColor = 0;

  -[UIImageView layer](self->_eventBackgroundView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMasksToBounds:", 1);

  -[EKDayOccurrenceView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 0);

  -[CUIKOROccurrenceState performChangesWithState:](self->_currentImageState, "performChangesWithState:", self);
  -[UIImageView setImage:](self->_contentView, "setImage:", 0);
  -[UIImageView setImage:](self->_eventBackgroundView, "setImage:", 0);
  -[UIView setHidden:](self->_eventBackgroundColorBar, "setHidden:", 1);
  -[EKDayOccurrenceView setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[EKDayOccurrenceView _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
  if (self->_editMenuInteraction)
    -[EKDayOccurrenceView _addEditMenuInteractionIfNeeded](self, "_addEditMenuInteractionIfNeeded");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[EKDayOccurrenceView bounds](self, "bounds");
  if (width != v9 || height != v8)
  {
    -[EKDayOccurrenceView frame](self, "frame");
    if (vabdd_f64(height, v11) >= 2.22044605e-16)
    {
      self->_visibleHeight = 1.79769313e308;
      self->_visibleHeightLocked = 0;
    }
    self->_needsContentCalc = 1;
    self->_needsBackgroundImageUpdate = 1;
    -[EKDayOccurrenceView _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
    -[EKDayOccurrenceView _invalidateAllImages](self, "_invalidateAllImages");
    -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
  }
  v14.receiver = self;
  v14.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView setFrame:](&v14, sel_setFrame_, x, y, width, height);
  -[EKDayOccurrenceView selectedCopy](self, "selectedCopy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[EKDayOccurrenceView selectedCopy](self, "selectedCopy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", x, y, width, height);

  }
  -[EKDayOccurrenceView _updateResizeHandleLocations](self, "_updateResizeHandleLocations");
}

- (EKDayOccurrenceView)selectedCopy
{
  return (EKDayOccurrenceView *)objc_loadWeakRetained((id *)&self->_selectedCopy);
}

- (void)_updateResizeHandleLocations
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double height;
  CGRect v25;

  -[UIView frame](self->_startResizeHandle, "frame");
  v4 = v3;
  v5 = (v3 + -12.0) * 0.5;
  -[EKDayOccurrenceView frame](self, "frame");
  v7 = v6;
  v9 = v8;
  -[EKDayOccurrenceView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  -[EKDayOccurrenceView bounds](self, "bounds");
  height = v25.size.height;
  v14 = v5 + CGRectGetWidth(v25) - v4 + -10.0;
  if (self->_startResizeHandle)
  {
    v23 = v11;
    if (CalInterfaceIsLeftToRight())
      v15 = v14;
    else
      v15 = 10.0 - v5;
    -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self, "travelTimeSubviewHeightInPoints");
    v17 = v9 + -6.0 - v5 + v16;
    -[UIView frame](self->_startResizeHandle, "frame");
    v18 = CalRoundPointToScreenScale(v7 + v15, v17);
    v11 = v23;
    -[UIView setFrame:](self->_startResizeHandle, "setFrame:", v18);
  }
  if (self->_endResizeHandle)
  {
    if (CalInterfaceIsLeftToRight())
      v19 = 10.0 - v5;
    else
      v19 = v14;
    v20 = v5 + height - v4 + 6.0;
    v21 = v11 + v19;
    v22 = v13 + v20;
    -[UIView frame](self->_endResizeHandle, "frame");
    -[UIView setFrame:](self->_endResizeHandle, "setFrame:", CalRoundPointToScreenScale(v21, v22));
  }
}

- (void)setUsesSmallText:(BOOL)a3
{
  self->_usesSmallText = a3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  -[UIView setUserInteractionEnabled:](self->_startResizeHandle, "setUserInteractionEnabled:", v3);
  -[UIView setUserInteractionEnabled:](self->_endResizeHandle, "setUserInteractionEnabled:", v3);
}

- (void)setTravelTime:(double)a3
{
  if (self->_travelTime != a3)
  {
    self->_travelTime = a3;
    -[EKDayOccurrenceView setShowsTravelTime:](self, "setShowsTravelTime:", a3 > 0.0);
  }
}

- (void)setTentative:(BOOL)a3
{
  if (self->_tentative != a3)
  {
    self->_tentative = a3;
    self->_needsBackgroundImageUpdate = 1;
    -[EKDayOccurrenceView _invalidateContentBounds](self, "_invalidateContentBounds");
  }
}

- (void)setRoutingMode:(int64_t)a3
{
  -[EKDayOccurrenceTravelTimeView setRoutingMode:](self->_travelTimeContentView, "setRoutingMode:", a3);
}

- (void)setNeedsReply:(BOOL)a3
{
  if (self->_needsReply != a3)
  {
    self->_needsReply = a3;
    self->_needsBackgroundImageUpdate = 1;
    -[EKDayOccurrenceView _invalidateContentBounds](self, "_invalidateContentBounds");
  }
}

- (void)setIsSelectedCopyView:(BOOL)a3
{
  self->_isSelectedCopyView = a3;
}

- (void)setIsProposedTime:(BOOL)a3
{
  if (self->_isProposedTime != a3)
  {
    self->_isProposedTime = a3;
    -[EKDayOccurrenceView _invalidateAllImages](self, "_invalidateAllImages");
  }
}

- (void)setHasTrailingDuration:(BOOL)a3
{
  self->_hasTrailingDuration = a3;
}

- (void)setHasPrecedingDuration:(BOOL)a3
{
  self->_hasPrecedingDuration = a3;
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[EKDayOccurrenceView updateAlpha](self, "updateAlpha");
  }
}

- (void)setDeclined:(BOOL)a3
{
  if (self->_declined != a3)
  {
    self->_declined = a3;
    -[EKDayOccurrenceView _invalidateContentBounds](self, "_invalidateContentBounds");
  }
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)setAllDay:(BOOL)a3
{
  if (self->_allDay != a3)
  {
    self->_allDay = a3;
    -[EKDayOccurrenceView _invalidateContentBounds](self, "_invalidateContentBounds");
    -[EKDayOccurrenceView _updateCornerRadius](self, "_updateCornerRadius");
    -[EKDayOccurrenceView requestContentIfNeeded:completion:](self, "requestContentIfNeeded:completion:", 16, 0);
    -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_invalidateCurrentRequest
{
  void *v3;

  if ((self->_currentRequestId & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D0CDB0], "sharedProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", self->_currentRequestId);

    self->_currentRequestId = -1;
  }
}

+ (double)minNaturalTextHeightForEvent:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5
{
  _BOOL8 v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultMargin");
  v9 = v8;
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "defaultPadding");
  v13 = v12;
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0D0CDB8], "minNaturalTextHeightForEvent:usingSmallText:sizeClass:", v7, v6, a5);
  v17 = v16;

  return v17 + v15 + v9 + v11 + v13;
}

+ (UIEdgeInsets)defaultPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 3.5;
  v3 = 5.0;
  v4 = 0.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (UIEdgeInsets)defaultMargin
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 1.0;
  v3 = 0.0;
  v4 = 1.0;
  v5 = 1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setSelectedCopy:(id)a3
{
  objc_storeWeak((id *)&self->_selectedCopy, a3);
}

- (void)setSelected:(BOOL)a3
{
  void *v5;

  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[EKDayOccurrenceView _updateColors](self, "_updateColors");
    -[EKDayOccurrenceView updateAlpha](self, "updateAlpha");
    self->_needsBackgroundImageUpdate = 1;
    -[EKDayOccurrenceView _invalidateAllImages](self, "_invalidateAllImages");
    -[EKDayOccurrenceView setNeedsDisplay](self, "setNeedsDisplay");
    -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
    if (!a3)
    {
      if (self->_occurrence)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "postNotificationName:object:", CFSTR("EKDayOccurrenceViewDidEndSelectionNotification"), self);

      }
    }
    -[EKDayOccurrenceView _updateAppEntityAnnotationState](self, "_updateAppEntityAnnotationState");
  }
}

- (void)setPointerInteractionDisabled:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_pointerInteractionDisabled != a3)
  {
    self->_pointerInteractionDisabled = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __53__EKDayOccurrenceView_setPointerInteractionDisabled___block_invoke;
    v3[3] = &unk_1E6018688;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
  }
}

- (void)setMargin:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  int IsLeftToRight;
  double v9;
  double v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  if (IsLeftToRight)
    v9 = left;
  else
    v9 = right;
  if (IsLeftToRight)
    v10 = right;
  else
    v10 = left;
  if (v9 != self->_margin.left
    || top != self->_margin.top
    || v10 != self->_margin.right
    || bottom != self->_margin.bottom)
  {
    self->_margin.top = top;
    self->_margin.left = v9;
    self->_margin.bottom = bottom;
    self->_margin.right = v10;
    self->_needsBackgroundImageUpdate = 1;
    -[EKDayOccurrenceView _invalidateBackgroundImage](self, "_invalidateBackgroundImage");
    -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHideText:(BOOL)a3
{
  self->_hideText = a3;
}

- (void)setHideBackgroundImage:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_hideBackgroundImage != a3)
  {
    v3 = a3;
    self->_hideBackgroundImage = a3;
    -[UIImageView setHidden:](self->_eventBackgroundView, "setHidden:");
    -[UIImageView setHidden:](self->_travelBackgroundView, "setHidden:", v3);
    -[EKDayOccurrenceView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setDrawsResizeHandles:(BOOL)a3
{
  UIView *v4;
  UIView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  UIView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIView *v24;
  UIView *v25;
  UIView *v26;
  UIView *v27;
  UIView *startResizeHandle;
  void *v29;
  UIView *v30;
  UIView *endResizeHandle;
  void *v32;
  UIView *v33;
  uint64_t v34;
  UIView *v35;
  _QWORD v36[4];
  UIView *v37;
  _QWORD v38[4];
  UIView *v39;
  _QWORD v40[5];
  _QWORD v41[5];

  if (self->_drawsResizeHandles != a3)
  {
    self->_drawsResizeHandles = a3;
    if (a3)
    {
      if (-[EKDayOccurrenceView isAllDay](self, "isAllDay") || -[EKDayOccurrenceView isReminder](self, "isReminder"))
      {
        self->_drawsResizeHandles = 0;
      }
      else
      {
        if (!self->_startResizeHandle)
        {
          v27 = -[EKDayOccurrenceView _newResizeHandleView](self, "_newResizeHandleView");
          startResizeHandle = self->_startResizeHandle;
          self->_startResizeHandle = v27;

          -[EKDayOccurrenceView superview](self, "superview");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addSubview:", self->_startResizeHandle);

        }
        if (!self->_endResizeHandle)
        {
          v30 = -[EKDayOccurrenceView _newResizeHandleView](self, "_newResizeHandleView");
          endResizeHandle = self->_endResizeHandle;
          self->_endResizeHandle = v30;

          -[EKDayOccurrenceView superview](self, "superview");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addSubview:", self->_endResizeHandle);

        }
        -[EKDayOccurrenceView _updateResizeHandleLocations](self, "_updateResizeHandleLocations");
        v33 = self->_startResizeHandle;
        v34 = MEMORY[0x1E0C809B0];
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke;
        v41[3] = &unk_1E6018688;
        v41[4] = self;
        CalPopViewIn(v33, v41);
        v35 = self->_endResizeHandle;
        v40[0] = v34;
        v40[1] = 3221225472;
        v40[2] = __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_2;
        v40[3] = &unk_1E6018688;
        v40[4] = self;
        CalPopViewIn(v35, v40);
      }
    }
    else
    {
      v4 = self->_startResizeHandle;
      v5 = self->_endResizeHandle;
      -[UIView frame](v4, "frame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v14 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_3;
      v38[3] = &unk_1E6018688;
      v39 = v4;
      v15 = v4;
      CalScaleViewOut(v15, v38, v7, v9, v11, v13);
      -[UIView frame](v5, "frame");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v36[0] = v14;
      v36[1] = 3221225472;
      v36[2] = __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_4;
      v36[3] = &unk_1E6018688;
      v37 = v5;
      v24 = v5;
      CalScaleViewOut(v24, v36, v17, v19, v21, v23);
      v25 = self->_startResizeHandle;
      self->_startResizeHandle = 0;

      v26 = self->_endResizeHandle;
      self->_endResizeHandle = 0;

    }
  }
}

- (void)setCappedColorBarHeight:(double)a3
{
  self->_cappedColorBarHeight = a3;
}

- (void)setBirthdayCount:(int64_t)a3
{
  self->_birthdayCount = a3;
}

- (void)setAllDayDrawingStyle:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t *v5;
  EKDayOccurrenceView *v6;
  uint64_t v7;
  UIImageView *eventBackgroundView;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  EKDayOccurrenceView *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  EKDayOccurrenceView *v21;

  if (self->_allDayDrawingStyle != a3)
  {
    self->_allDayDrawingStyle = a3;
    if (a4)
    {
      if (a3)
      {
        v17 = MEMORY[0x1E0C809B0];
        v18 = 3221225472;
        v19 = __54__EKDayOccurrenceView_setAllDayDrawingStyle_animated___block_invoke;
        v20 = &unk_1E6018688;
        v21 = self;
        v5 = &v17;
        v6 = self;
        v7 = 5242880;
      }
      else
      {
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __54__EKDayOccurrenceView_setAllDayDrawingStyle_animated___block_invoke_2;
        v15 = &unk_1E6018688;
        v16 = self;
        v5 = &v12;
        v6 = self;
        v7 = 5242881;
      }
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", v6, v7, v5, 0, 0.2, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      -[EKDayOccurrenceView setShowsTravelTime:](self, "setShowsTravelTime:", 0);
      if (self->_allDayDrawingStyle)
      {
        -[UIImageView removeFromSuperview](self->_eventBackgroundView, "removeFromSuperview");
        eventBackgroundView = self->_eventBackgroundView;
        self->_eventBackgroundView = 0;

        -[EKDayOccurrenceView _removeTravelTimeSubviews](self, "_removeTravelTimeSubviews");
      }
      else
      {
        v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v10 = self->_eventBackgroundView;
        self->_eventBackgroundView = v9;

        -[UIImageView setAutoresizingMask:](self->_eventBackgroundView, "setAutoresizingMask:", 16);
        -[UIImageView layer](self->_eventBackgroundView, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setMasksToBounds:", 1);

        -[EKDayOccurrenceView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_eventBackgroundView, 0);
        if (self->_showsTravelTime)
          -[EKDayOccurrenceView _addTravelTimeSubviews](self, "_addTravelTimeSubviews");
      }
      self->_needsBackgroundImageUpdate = 1;
      -[EKDayOccurrenceView _invalidateBackgroundImage](self, "_invalidateBackgroundImage");
      -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setAllDayDrawingStyle:(BOOL)a3
{
  -[EKDayOccurrenceView setAllDayDrawingStyle:animated:](self, "setAllDayDrawingStyle:animated:", a3, 0);
}

- (CUIKOROccurrenceState)currentImageState
{
  return self->_currentImageState;
}

- (void)_updateCornerRadius
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  int IsLeftToRight;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;

  v3 = -[EKDayOccurrenceView isAllDay](self, "isAllDay");
  v4 = -[EKDayOccurrenceView hasPrecedingDuration](self, "hasPrecedingDuration");
  v5 = v4;
  if (v3)
  {
    v6 = !v4 || -[EKDayOccurrenceView multiAllDayRoundCorners](self, "multiAllDayRoundCorners");
    if (-[EKDayOccurrenceView hasTrailingDuration](self, "hasTrailingDuration"))
      v16 = -[EKDayOccurrenceView multiAllDayRoundCorners](self, "multiAllDayRoundCorners");
    else
      v16 = 1;
    IsLeftToRight = CalTimeDirectionIsLeftToRight();
    v18 = 10;
    if (!v6)
      v18 = 0;
    if (v16)
      v18 |= 5uLL;
    v19 = 5;
    if (!v6)
      v19 = 0;
    if (v16)
      v19 |= 0xAuLL;
    if (IsLeftToRight)
      v20 = v19;
    else
      v20 = v18;
    -[EKDayOccurrenceView layer](self, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMasksToBounds:", 1);

    -[EKDayOccurrenceView layer](self, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMaskedCorners:", v20);

    -[EKDayOccurrenceView bounds](self, "bounds");
    v24 = v23 * 0.5;
    -[EKDayOccurrenceView layer](self, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", v24);

    -[UIImageView layer](self->_eventBackgroundView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMaskedCorners:", v20);

    -[EKDayOccurrenceView bounds](self, "bounds");
    v28 = v27 * 0.5;
    -[UIImageView layer](self->_eventBackgroundView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", v28);
  }
  else
  {
    v7 = -[EKDayOccurrenceView hasTrailingDuration](self, "hasTrailingDuration");
    v8 = -[EKDayOccurrenceView showsTravelTime](self, "showsTravelTime");
    v9 = 3;
    if (v8 || v5)
      v9 = 0;
    if (v7)
      v10 = v9;
    else
      v10 = v9 | 0xC;
    -[EKDayOccurrenceView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMaskedCorners:", v10);

    -[EKDayOccurrenceView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 4.0);

    -[UIImageView layer](self->_eventBackgroundView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMaskedCorners:", v10);

    -[UIImageView layer](self->_eventBackgroundView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 4.0);

    -[EKDayOccurrenceView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 0);
  }

  -[EKDayOccurrenceView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)showsTravelTime
{
  return self->_showsTravelTime;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (BOOL)hasTrailingDuration
{
  return self->_hasTrailingDuration;
}

- (BOOL)hasPrecedingDuration
{
  return self->_hasPrecedingDuration;
}

- (BOOL)isSelectedCopyView
{
  return self->_isSelectedCopyView;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  int IsLeftToRight;
  double v9;
  double v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  if (IsLeftToRight)
    v9 = left;
  else
    v9 = right;
  if (IsLeftToRight)
    v10 = right;
  else
    v10 = left;
  if (v9 != self->_padding.left
    || top != self->_padding.top
    || v10 != self->_padding.right
    || bottom != self->_padding.bottom)
  {
    self->_padding.top = top;
    self->_padding.left = v9;
    self->_padding.bottom = bottom;
    self->_padding.right = v10;
    -[EKDayOccurrenceTravelTimeView setNeedsLayout](self->_travelTimeContentView, "setNeedsLayout");
    -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)forceUpdateContentWithPayload:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  UIView **p_eventBackgroundColorBar;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  UIColor *stagedBackgroundColor;
  _QWORD v15[5];

  v4 = a3;
  objc_msgSend(v4, "requestOptions");
  if (!_bitmaskContainsOption())
    goto LABEL_5;
  -[UIImageView image](self->_eventBackgroundView, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (-[EKDayOccurrenceView _contentViewHasContent](self, "_contentViewHasContent"))
    goto LABEL_5;
  -[EKDayOccurrenceView setAlpha:](self, "setAlpha:", 0.0);
  v6 = 1;
LABEL_6:
  if (_bitmaskContainsOption())
  {
    objc_msgSend(v4, "backgroundImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_eventBackgroundView, "setImage:", v7);

    -[CUIKOROccurrenceState colorBarColor](self->_currentImageState, "colorBarColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    p_eventBackgroundColorBar = &self->_eventBackgroundColorBar;
    -[UIView setBackgroundColor:](self->_eventBackgroundColorBar, "setBackgroundColor:", v8);

    if ((-[CUIKOROccurrenceState isReminder](self->_currentImageState, "isReminder") & 1) == 0)
    {
      v10 = -[CUIKOROccurrenceState isAllDay](self->_currentImageState, "isAllDay");
      goto LABEL_11;
    }
  }
  else
  {
    -[UIImageView setImage:](self->_eventBackgroundView, "setImage:", 0);
    p_eventBackgroundColorBar = &self->_eventBackgroundColorBar;
  }
  v10 = 1;
LABEL_11:
  -[UIView setHidden:](*p_eventBackgroundColorBar, "setHidden:", v10);
  if (_bitmaskContainsOption())
  {
    objc_msgSend(v4, "textImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_contentView, "setImage:", v11);

  }
  else
  {
    -[UIImageView setImage:](self->_contentView, "setImage:", 0);
  }
  if (_bitmaskContainsOption())
  {
    objc_msgSend(v4, "travelTimeImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_travelBackgroundView, "setImage:", v12);

    objc_msgSend(v4, "travelTimeString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView setTravelTimeString:](self->_travelTimeContentView, "setTravelTimeString:", v13);

  }
  if (!-[EKDayOccurrenceView _isTimedOccurrenceDrawingStyle](self, "_isTimedOccurrenceDrawingStyle"))
  {
    -[EKDayOccurrenceView _updateColors](self, "_updateColors");
    self->_needsBackgroundImageUpdate = 1;
  }
  stagedBackgroundColor = self->_stagedBackgroundColor;
  if (!stagedBackgroundColor)
  {
    -[EKDayOccurrenceView _updateColors](self, "_updateColors");
    stagedBackgroundColor = self->_stagedBackgroundColor;
  }
  -[EKDayOccurrenceView setBackgroundColor:](self, "setBackgroundColor:", stagedBackgroundColor);
  if (v6)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__EKDayOccurrenceView_forceUpdateContentWithPayload___block_invoke;
    v15[3] = &unk_1E6018688;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v15, 0, 0.300000012, 0.0);
  }
  self->_needsContentCalc = 1;
  -[EKDayOccurrenceView _updateContentImageViewIfNeeded](self, "_updateContentImageViewIfNeeded");

}

- (void)_updateColors
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIColor *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIColor *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  UIColor *stagedBackgroundColor;
  void *v31;
  UIColor *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL4 v48;

  -[EKDayOccurrenceView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v3);

  if (!-[EKDayOccurrenceView _isTimedOccurrenceDrawingStyle](self, "_isTimedOccurrenceDrawingStyle"))
  {
    if (_updateColors_onceToken != -1)
      dispatch_once(&_updateColors_onceToken, &__block_literal_global_66);
    v11 = self->_selected && !self->_dimmed;
    -[EKDayOccurrenceView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceStyle");

    v14 = CFSTR("dark");
    v47 = v13;
    if (v13 == 1)
      v14 = CFSTR("light");
    v15 = v14;
    v7 = v15;
    if (v11)
    {
      -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", CFSTR("Selected"));
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v16;
    }
    if (self->_tentative)
    {
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("Tentative"));
      v17 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v17;
    }
    if (self->_needsReply)
    {
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("NeedsReply"));
      v18 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v18;
    }
    if (self->_declined)
    {
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("Declined"));
      v19 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v19;
    }
    if (-[EKDayOccurrenceView isCancelled](self, "isCancelled"))
    {
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("Canceled"));
      v20 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v20;
    }
    v48 = v11;
    -[CUIKOROccurrenceState displayColor](self->_currentImageState, "displayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v21 = (void *)_updateColors___backgroundColorCache;
      -[CUIKOROccurrenceState displayColor](self->_currentImageState, "displayColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v9 = (void *)objc_opt_new();
        v23 = (void *)_updateColors___backgroundColorCache;
        -[CUIKOROccurrenceState displayColor](self->_currentImageState, "displayColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v9, v24);

      }
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v25 = (UIColor *)objc_claimAutoreleasedReturnValue();
    if (v25)
      goto LABEL_36;
    -[CUIKOROccurrenceState baseColor](self->_currentImageState, "baseColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EKDayOccurrenceView isCancelled](self, "isCancelled") || self->_declined)
    {
      v27 = (void *)MEMORY[0x1E0DC3658];
      CUIKBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
        v29 = CFSTR("selectedAllDayCancelledDeclinedBGColor");
      else
        v29 = CFSTR("allDayCancelledDeclinedBGColor");
      objc_msgSend(v27, "colorNamed:inBundle:compatibleWithTraitCollection:", v29, v28, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
      v32 = v31;
      v25 = v32;
LABEL_35:
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, v7);

LABEL_36:
      stagedBackgroundColor = self->_stagedBackgroundColor;
      self->_stagedBackgroundColor = v25;
LABEL_37:

      goto LABEL_38;
    }
    if (self->_needsReply)
    {
      v33 = (void *)MEMORY[0x1E0DC3658];
      if (v48)
      {
        CUIKBundle();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("selectedAllDayNeedsReplyBGColor"), v34, 0);
        v32 = (UIColor *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)MEMORY[0x1E0DC3658];
        CUIKBundle();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = CFSTR("selectedAllDayNeedsReplyStripeColor");
      }
      else
      {
        if (v47 != 1)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
          v32 = (UIColor *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_58;
        }
        CUIKBundle();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("allDayNeedsReplyBGColor"), v42, 0);
        v32 = (UIColor *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)MEMORY[0x1E0DC3658];
        CUIKBundle();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = CFSTR("allDayNeedsReplyStripeColor");
      }
      objc_msgSend(v35, "colorNamed:inBundle:compatibleWithTraitCollection:", v37, v36, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_58:
      EKUIScaleFactor();
      CUIKCreateStripedUIImage();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithPatternImage:", v44);
      v25 = (UIColor *)objc_claimAutoreleasedReturnValue();

      goto LABEL_35;
    }
    if (!self->_tentative)
    {
      if (self->_hideBackgroundImage)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v43 = objc_claimAutoreleasedReturnValue();
      }
      else if (v48)
      {
        -[CUIKOROccurrenceState baseColor](self->_currentImageState, "baseColor");
        v43 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v47 == 1)
          CUIKColorLightenedToPercentageWithFinalAlpha();
        else
          CUIKColorDarkenedToPercentageWithFinalAlpha();
        v43 = objc_claimAutoreleasedReturnValue();
      }
      v31 = (void *)v43;
      goto LABEL_34;
    }
    if (v48)
    {
      v38 = (void *)MEMORY[0x1E0DC3658];
      CUIKBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("selectedAllDayTentativeStripeColor"), v39, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47 == 1)
      {
        objc_msgSend(v26, "colorWithAlphaComponent:", 1.0);
        v41 = objc_claimAutoreleasedReturnValue();
LABEL_57:
        v32 = (UIColor *)v41;
        goto LABEL_58;
      }
    }
    else
    {
      if (v47 == 1)
      {
        CUIKColorLightenedToPercentageWithFinalAlpha();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        CUIKColorLightenedToPercentageWithFinalAlpha();
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_57;
      }
      CUIKColorDarkenedToPercentageWithFinalAlpha();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CUIKColorDarkenedToPercentageWithFinalAlpha();
    v41 = objc_claimAutoreleasedReturnValue();
    goto LABEL_57;
  }
  -[EKDayOccurrenceView setBackgroundColor:](self, "setBackgroundColor:", 0);
  if (self->_showsTravelTime)
  {
    -[EKDayOccurrenceView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    -[CUIKOROccurrenceState displayColor](self->_currentImageState, "displayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKColorBarColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUIKOROccurrenceState displayColor](self->_currentImageState, "displayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v5;
    LOBYTE(v45) = self->_birthday;
    CUIKOccurrenceSecondaryTextColor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_selected)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v7, "cuik_colorWithAlphaScaled:", 0.5, v45, v46);
      v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    stagedBackgroundColor = v10;
    -[EKDayOccurrenceTravelTimeView setColorBarColor:](self->_travelTimeContentView, "setColorBarColor:", v7, v45);
    -[EKDayOccurrenceTravelTimeView setLineColor:](self->_travelTimeContentView, "setLineColor:", stagedBackgroundColor);
    -[EKDayOccurrenceTravelTimeView setElementColor:](self->_travelTimeContentView, "setElementColor:", v9);
    goto LABEL_37;
  }
LABEL_38:
  -[EKDayOccurrenceView _invalidateAllImages](self, "_invalidateAllImages");
}

- (BOOL)_isTimedOccurrenceDrawingStyle
{
  return !self->_allDayDrawingStyle;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double MaxY;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  objc_super v60;
  CGRect v61;

  v60.receiver = self;
  v60.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView layoutSubviews](&v60, sel_layoutSubviews);
  -[CUIKOROccurrenceState performChangesWithState:](self->_currentImageState, "performChangesWithState:", self);
  if (!self->_needsBackgroundImageUpdate)
  {
    if (!self->_needsContentCalc)
      return;
    -[EKDayOccurrenceView _updateColors](self, "_updateColors");
    goto LABEL_13;
  }
  -[EKDayOccurrenceView _updateColors](self, "_updateColors");
  if (-[EKDayOccurrenceView _isTimedOccurrenceDrawingStyle](self, "_isTimedOccurrenceDrawingStyle"))
  {
    -[EKDayOccurrenceView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[EKDayOccurrenceView margin](self, "margin");
    -[EKDayOccurrenceView _frameMutatedForProximityToHourLine:](self, "_frameMutatedForProximityToHourLine:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self, "travelTimeSubviewHeightInPoints");
    v24 = v23 + v18;
    -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self, "travelTimeSubviewHeightInPoints");
    v26 = v22 - v25;
    -[UIImageView setFrame:](self->_eventBackgroundView, "setFrame:", CalRoundRectToScreenScale(v16, v24, v20, v22 - v25));
    -[EKDayOccurrenceView _updateColorBarFrame](self, "_updateColorBarFrame");
    if (self->_showsTravelTime)
    {
      -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self, "travelTimeSubviewHeightInPoints");
      if (v27 > 0.0)
      {
        -[EKDayOccurrenceView bounds](self, "bounds");
        v29 = v28;
        v31 = v30;
        v33 = v32;
        v35 = v34;
        -[EKDayOccurrenceView margin](self, "margin");
        -[EKDayOccurrenceView _frameMutatedForProximityToHourLine:](self, "_frameMutatedForProximityToHourLine:", v29 + v39, v31 + v36, v33 - (v39 + v37), v35 - (v36 + v38));
        v41 = v40;
        v43 = v42;
        v45 = v44;
        -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self, "travelTimeSubviewHeightInPoints");
        v47 = v46;
        -[EKDayOccurrenceView margin](self, "margin");
        v49 = fmax(v47 - v48, 0.0);
        -[UIImageView setFrame:](self->_travelBackgroundView, "setFrame:", CalRoundRectToScreenScale(v41, v43, v45, v49));
        v61.origin.x = v41;
        v61.origin.y = v43;
        v61.size.width = v45;
        v61.size.height = v49;
        MaxY = CGRectGetMaxY(v61);
        -[UIImageView setFrame:](self->_eventBackgroundView, "setFrame:", CalRoundRectToScreenScale(v16, MaxY, v20, v26));
        -[EKDayOccurrenceView _updateColorBarFrame](self, "_updateColorBarFrame");
      }
    }
    if (self->_bottomPinningState == 2)
    {
      -[UIImageView frame](self->_eventBackgroundView, "frame");
      self->_unpinnedEventBackgroundFrame.origin.x = v51;
      self->_unpinnedEventBackgroundFrame.origin.y = v52;
      self->_unpinnedEventBackgroundFrame.size.width = v53;
      self->_unpinnedEventBackgroundFrame.size.height = v54;
      -[UIImageView frame](self->_travelBackgroundView, "frame");
      self->_unpinnedTravelBackgroundFrame.origin.x = v55;
      self->_unpinnedTravelBackgroundFrame.origin.y = v56;
      self->_unpinnedTravelBackgroundFrame.size.width = v57;
      self->_unpinnedTravelBackgroundFrame.size.height = v58;
      -[UIImageView frame](self->_travelBackgroundView, "frame");
      if (v59 <= 2.0)
      {
        -[UIImageView frame](self->_eventBackgroundView, "frame");
        -[UIImageView setFrame:](self->_eventBackgroundView, "setFrame:");
        -[EKDayOccurrenceView _updateColorBarFrame](self, "_updateColorBarFrame");
      }
      else
      {
        -[UIImageView frame](self->_travelBackgroundView, "frame");
        -[UIImageView setFrame:](self->_travelBackgroundView, "setFrame:");
      }
    }
  }
  self->_needsBackgroundImageUpdate = 0;
  if (self->_needsContentCalc)
LABEL_13:
    -[EKDayOccurrenceView _updateContentImageViewIfNeeded](self, "_updateContentImageViewIfNeeded");
}

- (double)travelTimeSubviewHeightInPoints
{
  return self->_travelTimeSubviewHeightInPoints;
}

- (void)_invalidateTravelTimeImage
{
  if (self->_showsTravelTime)
    self->_invalidatedRequestOptions |= 4uLL;
}

- (void)_invalidateAllImages
{
  -[EKDayOccurrenceView _invalidateBackgroundImage](self, "_invalidateBackgroundImage");
  -[EKDayOccurrenceView _invalidateTextImage](self, "_invalidateTextImage");
  -[EKDayOccurrenceView _invalidateTravelTimeImage](self, "_invalidateTravelTimeImage");
}

- (void)_invalidateTextImage
{
  self->_invalidatedRequestOptions |= 2uLL;
}

- (void)_invalidateBackgroundImage
{
  self->_invalidatedRequestOptions |= 1uLL;
}

- (void)_updateContentImageViewIfNeeded
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Height;
  double v12;
  double MinX;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  if (self->_needsContentCalc)
  {
    if (self->_allDayDrawingStyle)
    {
      -[UIImageView frame](self->_contentView, "frame");
      v4 = v3;
      v6 = v5;
      -[EKDayOccurrenceView _contentViewContentSize](self, "_contentViewContentSize");
      v8 = v7;
      v10 = v9;
      -[EKDayOccurrenceView bounds](self, "bounds");
      Height = CGRectGetHeight(v17);
      v18.origin.x = v4;
      v18.origin.y = v6;
      v18.size.width = v8;
      v18.size.height = v10;
      v12 = (Height - CGRectGetHeight(v18)) * 0.5;
      -[EKDayOccurrenceView _frameForText](self, "_frameForText");
      MinX = CGRectGetMinX(v19);
    }
    else
    {
      if (self->_needsBackgroundImageUpdate)
      {
        -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
        return;
      }
      -[EKDayOccurrenceView _frameForText](self, "_frameForText");
      v12 = v14;
      v8 = v15;
      v10 = v16;
    }
    -[UIImageView setFrame:](self->_contentView, "setFrame:", MinX, v12, v8, v10);
    if (self->_showsTravelTime)
    {
      -[UIImageView frame](self->_travelBackgroundView, "frame");
      -[EKDayOccurrenceTravelTimeView setFrame:](self->_travelTimeContentView, "setFrame:");
      -[EKDayOccurrenceView bringSubviewToFront:](self, "bringSubviewToFront:", self->_travelTimeContentView);
      -[EKDayOccurrenceTravelTimeView setNeedsLayout](self->_travelTimeContentView, "setNeedsLayout");
    }
    self->_needsContentCalc = 0;
    -[EKDayOccurrenceView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (UIEdgeInsets)margin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margin.top;
  left = self->_margin.left;
  bottom = self->_margin.bottom;
  right = self->_margin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)_frameMutatedForProximityToHourLine:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CalRoundToScreenScale(0.5);
  v8 = y + v7;
  CalRoundToScreenScale(0.5);
  v10 = height - v9;
  v11 = x;
  v12 = v8;
  v13 = width;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_contentViewHasContent
{
  void *v2;
  BOOL v3;

  -[UIImageView image](self->_contentView, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CGRect)_frameForText
{
  double v3;
  CGFloat x;
  double v5;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  double height;
  double v12;
  double v13;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[CUIKOROccurrenceState estimatedTextFrame](self->_currentImageState, "estimatedTextFrame");
  x = v3;
  y = v5;
  v8 = v7;
  v10 = v9;
  if (self->_bottomPinningState)
  {
    height = self->_unpinnedEventBackgroundFrame.size.height;
  }
  else
  {
    -[UIImageView frame](self->_eventBackgroundView, "frame");
    height = v12;
  }
  if (-[EKDayOccurrenceView _contentViewHasContent](self, "_contentViewHasContent"))
  {
    -[EKDayOccurrenceView _contentViewContentSize](self, "_contentViewContentSize");
    if (v13 >= 3.0 && height >= 3.0)
    {
      if (self->_reduceLayoutProcessingForAnimation)
      {
        x = self->_contentLocationDuringReducedProcessing.x;
        y = self->_contentLocationDuringReducedProcessing.y;
        v10 = height - y;
      }
      else
      {
        -[EKDayOccurrenceView _contentViewContentSize](self, "_contentViewContentSize");
        v16 = v15;
        -[EKDayOccurrenceView occurrences](self, "occurrences");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        v19 = 3;
        if (v18 < 3)
          v19 = v18;
        v20 = CalFloorToScreenScale((height - ((double)(unint64_t)(v19 - 1) + (double)(unint64_t)(v19 - 1)))
                                  * 0.5 - v16 * 0.5);
        -[UIImageView frame](self->_eventBackgroundView, "frame");
        if (y >= v20 + v21)
          y = v20 + v21;
        if (v10 < v16)
          v10 = v16;
      }
    }
  }
  v22 = x;
  v23 = y;
  v24 = v8;
  v25 = v10;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGSize)_contentViewContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIImageView image](self->_contentView, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (double)barToBarGapWidth
{
  double result;

  objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
  return result;
}

- (EKDayOccurrenceView)initWithFrame:(CGRect)a3
{
  EKDayOccurrenceView *v3;
  EKDayOccurrenceView *v4;
  UIImageView *v5;
  UIImageView *eventBackgroundView;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  UIView *v11;
  UIView *eventBackgroundColorBar;
  double v13;
  double v14;
  void *v15;
  UIImageView *v16;
  UIImageView *contentView;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CUIKOROccurrenceState *v26;
  CUIKOROccurrenceState *currentImageState;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)EKDayOccurrenceView;
  v3 = -[EKDayOccurrenceView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_visibleHeight = 1.79769313e308;
    -[EKDayOccurrenceView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    -[EKDayOccurrenceView setOpaque:](v4, "setOpaque:", 0);
    v4->_isMiniPreviewInEventDetail = 0;
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    eventBackgroundView = v4->_eventBackgroundView;
    v4->_eventBackgroundView = v5;

    -[UIImageView setAccessibilityIdentifier:](v4->_eventBackgroundView, "setAccessibilityIdentifier:", CFSTR("_eventBackgroundView"));
    -[EKDayOccurrenceView addSubview:](v4, "addSubview:", v4->_eventBackgroundView);
    -[UIImageView layer](v4->_eventBackgroundView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 4.0);

    -[UIImageView layer](v4->_eventBackgroundView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMasksToBounds:", 1);

    v9 = *MEMORY[0x1E0CD2DF0];
    -[UIImageView layer](v4->_eventBackgroundView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMinificationFilter:", v9);

    v4->_needsBackgroundImageUpdate = 1;
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    eventBackgroundColorBar = v4->_eventBackgroundColorBar;
    v4->_eventBackgroundColorBar = v11;

    -[UIView setAccessibilityIdentifier:](v4->_eventBackgroundColorBar, "setAccessibilityIdentifier:", CFSTR("_eventBackgroundColorBar"));
    objc_msgSend(MEMORY[0x1E0D0CDA0], "colorBarThickness");
    v14 = v13 * 0.5;
    -[UIView layer](v4->_eventBackgroundColorBar, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", v14);

    -[UIView setHidden:](v4->_eventBackgroundColorBar, "setHidden:", 1);
    -[EKDayOccurrenceView addSubview:](v4, "addSubview:", v4->_eventBackgroundColorBar);
    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    contentView = v4->_contentView;
    v4->_contentView = v16;

    -[UIImageView setContentMode:](v4->_contentView, "setContentMode:", 9);
    -[UIImageView setClipsToBounds:](v4->_contentView, "setClipsToBounds:", 1);
    -[UIImageView setAccessibilityIdentifier:](v4->_contentView, "setAccessibilityIdentifier:", CFSTR("_contentView"));
    -[EKDayOccurrenceView addSubview:](v4, "addSubview:", v4->_contentView);
    v4->_needsContentCalc = 1;
    v4->_cappedColorBarHeight = -1.0;
    v4->_originalXBeforeOffset = -1.0;
    objc_msgSend((id)objc_opt_class(), "defaultMargin");
    v4->_margin.top = v18;
    v4->_margin.left = v19;
    v4->_margin.bottom = v20;
    v4->_margin.right = v21;
    objc_msgSend((id)objc_opt_class(), "defaultPadding");
    v4->_padding.top = v22;
    v4->_padding.left = v23;
    v4->_padding.bottom = v24;
    v4->_padding.right = v25;
    v4->_currentRequestId = -1;
    v26 = (CUIKOROccurrenceState *)objc_alloc_init(MEMORY[0x1E0D0CDA8]);
    currentImageState = v4->_currentImageState;
    v4->_currentImageState = v26;

    v4->_contentLocationDuringReducedProcessing = (CGPoint)*MEMORY[0x1E0C9D538];
    -[EKDayOccurrenceView _setUpInteractions](v4, "_setUpInteractions");
  }
  return v4;
}

- (void)_setUpInteractions
{
  UIPointerInteraction *v3;
  UIPointerInteraction *pointerInteraction;
  UIPointerInteraction *v5;
  UIEditMenuInteraction *v6;
  UIEditMenuInteraction *editMenuInteraction;

  v3 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
  -[EKDayOccurrenceView addInteraction:](self, "addInteraction:", v3);
  pointerInteraction = self->_pointerInteraction;
  self->_pointerInteraction = v3;
  v5 = v3;

  v6 = (UIEditMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", self);
  editMenuInteraction = self->_editMenuInteraction;
  self->_editMenuInteraction = v6;

  -[EKDayOccurrenceView _addEditMenuInteractionIfNeeded](self, "_addEditMenuInteractionIfNeeded");
}

+ (EKDayOccurrenceView)occurrenceViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "_viewCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    if (!CGRectIsEmpty(v11))
      objc_msgSend(v9, "setFrame:", x, y, width, height);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFrame:", x, y, width, height);
  }
  objc_msgSend(v9, "prepareForReuse");

  return (EKDayOccurrenceView *)v9;
}

- (void)_addEditMenuInteractionIfNeeded
{
  void *v3;
  char v4;

  -[EKDayOccurrenceView interactions](self, "interactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self->_editMenuInteraction);

  if ((v4 & 1) == 0)
    -[EKDayOccurrenceView addInteraction:](self, "addInteraction:", self->_editMenuInteraction);
}

+ (id)_viewCache
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_viewCache___NormalOccurrenceViewCache;
  if (!_viewCache___NormalOccurrenceViewCache)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)_viewCache___NormalOccurrenceViewCache;
    _viewCache___NormalOccurrenceViewCache = (uint64_t)v3;

    v2 = (void *)_viewCache___NormalOccurrenceViewCache;
  }
  return v2;
}

+ (double)minimumHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4 isAllDay:(BOOL)a5 usesSmallText:(BOOL)a6
{
  double result;
  double v7;
  double v8;
  double v9;

  if (a5)
  {
    objc_msgSend(a1, "heightForAllDayOccurrenceForSizeClass:usesSmallText:", a3, a6);
  }
  else
  {
    +[EKDayTimeView hourHeightForSizeClass:orientation:](EKDayTimeView, "hourHeightForSizeClass:orientation:", a3, a4, a5, a6);
    v8 = round(v7 * 0.5);
    +[EKDayOccurrenceView bottomShadowMargin](EKDayOccurrenceView, "bottomShadowMargin");
    return v8 + v9;
  }
  return result;
}

+ (double)minimumHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4 isAllDay:(BOOL)a5
{
  double result;

  objc_msgSend((id)objc_opt_class(), "minimumHeightForSizeClass:orientation:isAllDay:usesSmallText:", a3, a4, a5, 0);
  return result;
}

- (void)didMoveToSuperview
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[EKDayOccurrenceView arrayOfResizeHandles](self, "arrayOfResizeHandles", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v7);
        -[EKDayOccurrenceView superview](self, "superview");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "superview");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "frame");
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v18 = v17;
          -[EKDayOccurrenceView superview](self, "superview");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "convertRect:toView:", v19, v12, v14, v16, v18);
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;

          -[EKDayOccurrenceView superview](self, "superview");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addSubview:", v8);

          -[EKDayOccurrenceView superview](self, "superview");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "bringSubviewToFront:", v8);

          objc_msgSend(v8, "setFrame:", v21, v23, v25, v27);
        }
        else
        {
          objc_msgSend(v8, "removeFromSuperview");
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v5);
  }

}

- (id)arrayOfResizeHandles
{
  void *v2;

  if (self->_startResizeHandle)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_endResizeHandle, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (void)_clearViewCache
{
  id v2;

  objc_msgSend(a1, "_viewCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (void)clearCaches
{
  objc_msgSend(0, "removeAllObjects");
}

- (void)setOccurrenceIsFirstVisibleDayOfEvent:(BOOL)a3
{
  self->_occurrenceIsFirstVisibleDayOfEvent = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[EKDayOccurrenceView frame](self, "frame");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:");
  -[EKDayOccurrenceView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v6);

  -[EKDayOccurrenceView occurrences](self, "occurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOccurrences:", v7);

  objc_msgSend(v5, "setOccurrenceDateIndex:", -[EKDayOccurrenceView occurrenceDateIndex](self, "occurrenceDateIndex"));
  objc_msgSend(v5, "setDimmed:", -[EKDayOccurrenceView dimmed](self, "dimmed"));
  objc_msgSend(v5, "setHideText:", -[EKDayOccurrenceView hideText](self, "hideText"));
  objc_msgSend(v5, "setHidden:", -[EKDayOccurrenceView isHidden](self, "isHidden"));
  -[EKDayOccurrenceView alpha](self, "alpha");
  objc_msgSend(v5, "setAlpha:");
  objc_msgSend(v5, "setSelected:", -[EKDayOccurrenceView selected](self, "selected"));
  objc_msgSend(v5, "setTentative:", -[EKDayOccurrenceView isTentative](self, "isTentative"));
  objc_msgSend(v5, "setDeclined:", -[EKDayOccurrenceView isDeclined](self, "isDeclined"));
  objc_msgSend(v5, "setNeedsReply:", -[EKDayOccurrenceView needsReply](self, "needsReply"));
  objc_msgSend(v5, "setCancelled:", -[EKDayOccurrenceView isCancelled](self, "isCancelled"));
  objc_msgSend(v5, "setUsesSmallText:", -[EKDayOccurrenceView usesSmallText](self, "usesSmallText"));
  objc_msgSend(v5, "setOccurrenceIsFirstVisibleDayOfEvent:", -[EKDayOccurrenceView occurrenceIsFirstVisibleDayOfEvent](self, "occurrenceIsFirstVisibleDayOfEvent"));
  objc_msgSend(v5, "setDrawsResizeHandles:", -[EKDayOccurrenceView drawsResizeHandles](self, "drawsResizeHandles"));
  -[EKDayOccurrenceView margin](self, "margin");
  objc_msgSend(v5, "setMargin:");
  -[EKDayOccurrenceView padding](self, "padding");
  objc_msgSend(v5, "setPadding:");
  objc_msgSend(v5, "setAllDay:", -[EKDayOccurrenceView isAllDay](self, "isAllDay"));
  objc_msgSend(v5, "setAllDayDrawingStyle:", -[EKDayOccurrenceView allDayDrawingStyle](self, "allDayDrawingStyle"));
  objc_msgSend(v5, "setIsProposedTime:", -[EKDayOccurrenceView isProposedTime](self, "isProposedTime"));
  objc_msgSend(v5, "setContentMode:", -[EKDayOccurrenceView contentMode](self, "contentMode"));
  objc_msgSend(v5, "setBirthday:", -[EKDayOccurrenceView isBirthday](self, "isBirthday"));
  objc_msgSend(v5, "setShowsTravelTime:", -[EKDayOccurrenceView showsTravelTime](self, "showsTravelTime"));
  -[EKDayOccurrenceView travelTime](self, "travelTime");
  objc_msgSend(v5, "setTravelTime:");
  -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self, "travelTimeSubviewHeightInPoints");
  objc_msgSend(v5, "setTravelTimeSubviewHeightInPoints:");
  objc_msgSend(v5, "setRoutingMode:", -[EKDayOccurrenceView routingMode](self, "routingMode"));
  objc_msgSend(v5, "setIsSelectedCopyView:", -[EKDayOccurrenceView isSelectedCopyView](self, "isSelectedCopyView"));
  -[EKDayOccurrenceView selectedCopy](self, "selectedCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedCopy:", v8);

  objc_msgSend(v5, "setHasPrecedingDuration:", -[EKDayOccurrenceView hasPrecedingDuration](self, "hasPrecedingDuration"));
  objc_msgSend(v5, "setHasTrailingDuration:", -[EKDayOccurrenceView hasTrailingDuration](self, "hasTrailingDuration"));
  return v5;
}

+ (double)minimumHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  double result;

  objc_msgSend((id)objc_opt_class(), "minimumHeightForSizeClass:orientation:isAllDay:", a3, a4, 0);
  return result;
}

+ (double)heightForAllDayOccurrenceForSizeClass:(int64_t)a3 usesSmallText:(BOOL)a4
{
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (a3 == 2)
    v6 = 22.0;
  else
    v6 = 17.0;
  if (a3 != 2 && !a4)
  {
    CalRoundToScreenScale(23.5);
    v6 = v7;
  }
  if (a4)
    objc_msgSend(MEMORY[0x1E0D0CD98], "defaultOccurrenceSmallPrimaryTextFontForSizeClass:", a3);
  else
    objc_msgSend(MEMORY[0x1E0D0CD98], "defaultOccurrencePrimaryTextFontForSizeClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lineHeight");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
  CalRoundToScreenScale(v10 + v11 * 2.0);
  if (v6 < v12)
    v6 = v12;

  return v6;
}

+ (double)bottomShadowMargin
{
  return 0.0;
}

+ (CGRect)contentStretchRectForFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = 2.0 / a3.size.height;
  v4 = (a3.size.height + -4.0) / a3.size.height;
  v5 = 0.0;
  v6 = 1.0;
  result.size.height = v4;
  result.size.width = v6;
  result.origin.y = v3;
  result.origin.x = v5;
  return result;
}

+ (id)viewForExternalDragOperationFromEvent:(id)a3 visiblePath:(id *)a4
{
  id v5;
  __objc2_class *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v5 = a3;
  if (objc_msgSend(v5, "isReminderIntegrationEvent"))
  {
    v6 = EKUIListViewReminderCell;
  }
  else
  {
    if (!objc_msgSend(v5, "isAllDay"))
    {
      v7 = -[EKUIListViewTimedEventCell initForDragPreview]([EKUIListViewTimedEventCell alloc], "initForDragPreview");
      objc_msgSend(v5, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateWithEvent:isMultiday:occurrenceStartDate:dimmed:", v5, 0, v10, 0);

      goto LABEL_7;
    }
    v6 = EKUIListViewAllDayEventCell;
  }
  v7 = (id)objc_msgSend([v6 alloc], "initForDragPreview");
  objc_msgSend(v7, "updateWithEvent:dimmed:", v5, 0);
LABEL_7:
  LODWORD(v8) = 1148846080;
  LODWORD(v9) = 1.0;
  objc_msgSend(v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 300.0, 200.0, v8, v9);
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v11, v12);
  v13 = (void *)objc_opt_class();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v13, "pathForBackgroundForRect:allDay:", objc_msgSend(v5, "isAllDay"), v14, v15, v16, v17);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateColorBarFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int IsLeftToRight;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double MinX;
  double v18;
  double v19;
  double MaxX;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MinY;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[UIImageView frame](self->_eventBackgroundView, "frame");
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v7 = CGRectGetHeight(v29);
  objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0D0CDA0], "colorBarThickness");
  v11 = v10 + v10;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  if (IsLeftToRight)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v13);
    objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
    v19 = MinX + v18;
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v13);
    objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
    v22 = MaxX - v21;
    objc_msgSend(MEMORY[0x1E0D0CDA0], "colorBarThickness");
    v19 = v22 - v23;
  }
  if (v7 <= v11)
  {
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    MinY = CGRectGetMinY(v31);
    v11 = v7;
  }
  else
  {
    v24 = v7 + v9 * -2.0;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v25 = CGRectGetMinY(v30);
    if (v24 >= v11)
    {
      objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
      MinY = v25 + v27;
      v11 = v24;
    }
    else
    {
      MinY = (v7 - v11) * 0.5 + v25;
    }
  }
  objc_msgSend(MEMORY[0x1E0D0CDA0], "colorBarThickness");
  -[UIView setFrame:](self->_eventBackgroundColorBar, "setFrame:", v19, MinY, v28, v11);
}

- (void)dealloc
{
  objc_super v3;

  -[UIView removeFromSuperview](self->_startResizeHandle, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_endResizeHandle, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  id v3;
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
  objc_super v21;
  NSRect v22;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v21.receiver = self;
  v21.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[EKDayOccurrenceView occurrence](self, "occurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("title:     %@\n"), v6);

  -[EKDayOccurrenceView occurrence](self, "occurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("location:  %@\n"), v8);

  -[EKDayOccurrenceView occurrence](self, "occurrence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("calendar:  %@\n"), v11);

  -[EKDayOccurrenceView occurrence](self, "occurrence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startCalendarDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("startDate: %@\n"), v13);

  -[EKDayOccurrenceView occurrence](self, "occurrence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endCalendarDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("endDate:   %@\n"), v15);

  -[EKDayOccurrenceView frame](self, "frame");
  NSStringFromRect(v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("frame:     %@\n"), v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[EKDayOccurrenceView isSelectedCopyView](self, "isSelectedCopyView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("isSelectedCopyView:     %@\n"), v17);

  -[EKDayOccurrenceView selectedCopy](self, "selectedCopy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("selectedCopy:     %@\n"), v18);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (void)forceUpdateColors
{
  self->_needsContentCalc = 1;
  self->_needsBackgroundImageUpdate = 1;
  -[EKDayOccurrenceView _updateColors](self, "_updateColors");
  -[EKDayOccurrenceView requestContentIfNeeded:completion:](self, "requestContentIfNeeded:completion:", 16, 0);
  -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
  -[EKDayOccurrenceView updateAlpha](self, "updateAlpha");
}

- (void)_updateAppEntityAnnotationIfNeeded
{
  if (CalendarLinkLibraryCore())
  {
    if (self->_occurrence
      && -[EKDayOccurrenceView _shouldActuallyAnnotateAppEntities](self, "_shouldActuallyAnnotateAppEntities"))
    {
      -[EKDayOccurrenceView Cal_annotateWithEvent:](self, "Cal_annotateWithEvent:", self->_occurrence);
      *((_BYTE *)self + 496) |= 0x10u;
      -[EKDayOccurrenceView _updateAppEntityAnnotationState](self, "_updateAppEntityAnnotationState");
    }
    else if ((*((_BYTE *)self + 496) & 0x10) != 0)
    {
      -[EKDayOccurrenceView Cal_annotateWithEvent:](self, "Cal_annotateWithEvent:", 0);
      *((_BYTE *)self + 496) &= ~0x10u;
    }
  }
}

- (void)setShouldAnnotateAppEntities:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 496);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *((_BYTE *)self + 496) = v3 & 0xF7 | v4;
    -[EKDayOccurrenceView _updateAppEntityAnnotationIfNeeded](self, "_updateAppEntityAnnotationIfNeeded");
  }
}

- (BOOL)shouldAnnotateAppEntities
{
  return (*((unsigned __int8 *)self + 496) >> 3) & 1;
}

- (BOOL)_shouldActuallyAnnotateAppEntities
{
  if ((*((_BYTE *)self + 496) & 8) != 0)
    return !-[EKDayOccurrenceView isBirthday](self, "isBirthday");
  else
    return 0;
}

- (void)_updateAppEntityAnnotationState
{
  if (CalendarLinkLibraryCore())
  {
    if ((*((_BYTE *)self + 496) & 0x10) != 0)
      -[EKDayOccurrenceView Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:](self, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", -[EKDayOccurrenceView isSelected](self, "isSelected"), 0, 0, 0, 0, 0);
  }
}

- (void)_addTravelTimeSubviews
{
  EKDayOccurrenceTravelTimeView *travelTimeContentView;
  _BOOL4 v4;
  EKDayOccurrenceTravelTimeView *v5;
  EKDayOccurrenceTravelTimeView *v6;
  UIImageView *v7;
  UIImageView *travelBackgroundView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  travelTimeContentView = self->_travelTimeContentView;
  v4 = travelTimeContentView == 0;
  if (!travelTimeContentView)
  {
    v5 = objc_alloc_init(EKDayOccurrenceTravelTimeView);
    v6 = self->_travelTimeContentView;
    self->_travelTimeContentView = v5;

  }
  if (!self->_travelBackgroundView)
  {
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    travelBackgroundView = self->_travelBackgroundView;
    self->_travelBackgroundView = v7;

    -[UIImageView layer](self->_travelBackgroundView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 4.0);

    -[UIImageView layer](self->_travelBackgroundView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 1;
    objc_msgSend(v10, "setMasksToBounds:", 1);

    -[UIImageView layer](self->_travelBackgroundView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMaskedCorners:", 3);

  }
  -[EKDayOccurrenceTravelTimeView superview](self->_travelTimeContentView, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[EKDayOccurrenceTravelTimeView setAccessibilityIdentifier:](self->_travelTimeContentView, "setAccessibilityIdentifier:", CFSTR("_travelTimeContentView"));
    -[EKDayOccurrenceView addSubview:](self, "addSubview:", self->_travelTimeContentView);
    v4 = 1;
  }
  -[UIImageView superview](self->_travelBackgroundView, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[EKDayOccurrenceTravelTimeView setAccessibilityIdentifier:](self->_travelTimeContentView, "setAccessibilityIdentifier:", CFSTR("_travelBackgroundView"));
    -[EKDayOccurrenceView addSubview:](self, "addSubview:", self->_travelBackgroundView);
    goto LABEL_11;
  }
  if (v4)
  {
LABEL_11:
    self->_needsContentCalc = 1;
    self->_needsBackgroundImageUpdate = 1;
    -[EKDayOccurrenceView _updateColors](self, "_updateColors");
  }
}

- (void)_removeTravelTimeSubviews
{
  -[EKDayOccurrenceTravelTimeView removeFromSuperview](self->_travelTimeContentView, "removeFromSuperview");
  -[UIImageView removeFromSuperview](self->_travelBackgroundView, "removeFromSuperview");
  self->_needsContentCalc = 1;
  self->_needsBackgroundImageUpdate = 1;
}

- (void)setShowsTravelTime:(BOOL)a3
{
  if (self->_showsTravelTime != a3)
  {
    self->_showsTravelTime = a3;
    if (a3)
      -[EKDayOccurrenceView _addTravelTimeSubviews](self, "_addTravelTimeSubviews");
    else
      -[EKDayOccurrenceView _removeTravelTimeSubviews](self, "_removeTravelTimeSubviews");
    -[EKDayOccurrenceView _invalidateTravelTimeImage](self, "_invalidateTravelTimeImage");
    -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
    -[EKDayOccurrenceView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)routingMode
{
  return -[EKDayOccurrenceTravelTimeView routingMode](self->_travelTimeContentView, "routingMode");
}

- (void)setupWithOccurrence:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  UIColor *stagedBackgroundColor;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "travelRoutingMode");
    -[EKDayOccurrenceView setAllDay:](self, "setAllDay:", objc_msgSend(v4, "isAllDay"));
    -[EKDayOccurrenceView setIsReminder:](self, "setIsReminder:", objc_msgSend(v4, "isIntegrationEvent"));
    -[EKDayOccurrenceView setCancelled:](self, "setCancelled:", objc_msgSend(v4, "status") == 3);
    -[EKDayOccurrenceView setTentative:](self, "setTentative:", CUIKEventDisplaysAsTentative());
    -[EKDayOccurrenceView setDeclined:](self, "setDeclined:", CUIKEventDisplaysAsDeclined());
    -[EKDayOccurrenceView setNeedsReply:](self, "setNeedsReply:", CUIKEventDisplaysAsNeedsReply());
    -[EKDayOccurrenceView setBirthday:](self, "setBirthday:", objc_msgSend(v5, "type") == 4);
    objc_msgSend(v4, "travelTime");
    v8 = v7;

    -[EKDayOccurrenceView setTravelTime:](self, "setTravelTime:", v8);
    -[EKDayOccurrenceView setRoutingMode:](self, "setRoutingMode:", v6);
    -[CUIKOROccurrenceState performChangesWithState:](self->_currentImageState, "performChangesWithState:", self);
    -[EKDayOccurrenceView _invalidateAllImages](self, "_invalidateAllImages");
    stagedBackgroundColor = self->_stagedBackgroundColor;
    self->_stagedBackgroundColor = 0;

  }
  -[EKDayOccurrenceView _updateAppEntityAnnotationIfNeeded](self, "_updateAppEntityAnnotationIfNeeded");
}

- (id)sortOccurrences:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingFunction:context:", MEMORY[0x1E0D0C958], 0);
}

- (void)setOccurrences:(id)a3
{
  NSArray *v4;
  NSArray *occurrences;
  EKEvent *v6;
  EKEvent *occurrence;

  -[EKDayOccurrenceView sortOccurrences:](self, "sortOccurrences:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  occurrences = self->_occurrences;
  self->_occurrences = v4;

  -[NSArray firstObject](self->_occurrences, "firstObject");
  v6 = (EKEvent *)objc_claimAutoreleasedReturnValue();
  occurrence = self->_occurrence;
  self->_occurrence = v6;

  -[EKDayOccurrenceView setupWithOccurrence:](self, "setupWithOccurrence:", self->_occurrence);
}

- (EKCalendarDate)occurrenceDate
{
  void *v3;
  void *v4;
  void *v5;

  -[EKDayOccurrenceView occurrence](self, "occurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startCalendarDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarDateByAddingDays:", -[EKDayOccurrenceView occurrenceDateIndex](self, "occurrenceDateIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKCalendarDate *)v5;
}

- (void)_invalidateContentBounds
{
  self->_needsContentCalc = 1;
  -[EKDayOccurrenceView _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
  -[EKDayOccurrenceView _invalidateTextImage](self, "_invalidateTextImage");
  -[EKDayOccurrenceView setNeedsLayout](self, "setNeedsLayout");
}

- (NSNumber)allDayOverride
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allDay);
}

- (void)setIsReminder:(BOOL)a3
{
  if (self->_isReminder != a3)
    self->_isReminder = a3;
}

- (BOOL)isReminderStack
{
  return -[NSArray count](self->_occurrences, "count") > 1;
}

uint64_t __54__EKDayOccurrenceView_setAllDayDrawingStyle_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 424);
  *(_QWORD *)(v2 + 424) = 0;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeTravelTimeSubviews");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 465) = 1;
  return result;
}

uint64_t __54__EKDayOccurrenceView_setAllDayDrawingStyle_animated___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BYTE *v7;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = objc_msgSend(v2, "initWithFrame:");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 424);
  *(_QWORD *)(v4 + 424) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAutoresizingMask:", 16);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 1);

  objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), 0);
  v7 = *(_BYTE **)(a1 + 32);
  if (v7[716])
  {
    objc_msgSend(v7, "_addTravelTimeSubviews");
    v7 = *(_BYTE **)(a1 + 32);
  }
  v7[465] = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBackgroundImage");
}

void __36__EKDayOccurrenceView__updateColors__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_updateColors___backgroundColorCache;
  _updateColors___backgroundColorCache = v0;

}

- (void)removeFromSuperview
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend((id)objc_opt_class(), "_viewCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((unint64_t)objc_msgSend(v3, "count") <= 9)
    {
      -[EKDayOccurrenceView superview](self, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        objc_msgSend(v4, "addObject:", self);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView removeFromSuperview](&v6, sel_removeFromSuperview);

}

- (void)animateToFrame:(CGRect)a3 isAllDay:(BOOL)a4 beginFromCurrentState:(BOOL)a5 whenFinished:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;
  BOOL v25;
  _QWORD v26[9];
  BOOL v27;
  CGRect v28;
  CGRect v29;

  v6 = a5;
  v7 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  -[EKDayOccurrenceView frame](self, "frame");
  v29.origin.x = v14;
  v29.origin.y = v15;
  v29.size.width = v16;
  v29.size.height = v17;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  if (!CGRectEqualToRect(v28, v29))
  {
    v18 = -[EKDayOccurrenceView drawsResizeHandles](self, "drawsResizeHandles");
    if (v7)
      -[EKDayOccurrenceView setDrawsResizeHandles:](self, "setDrawsResizeHandles:", 0);
    v19 = !v6;
    v20 = (void *)MEMORY[0x1E0DC3F10];
    if (v19)
      v21 = 0;
    else
      v21 = 4;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __82__EKDayOccurrenceView_animateToFrame_isAllDay_beginFromCurrentState_whenFinished___block_invoke;
    v26[3] = &unk_1E601C8C8;
    v26[4] = self;
    *(CGFloat *)&v26[5] = x;
    *(CGFloat *)&v26[6] = y;
    *(CGFloat *)&v26[7] = width;
    *(CGFloat *)&v26[8] = height;
    v27 = v7;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __82__EKDayOccurrenceView_animateToFrame_isAllDay_beginFromCurrentState_whenFinished___block_invoke_2;
    v22[3] = &unk_1E601C8F0;
    v24 = v7;
    v22[4] = self;
    v25 = v18;
    v23 = v13;
    objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", v21, v26, v22, 0.2, 0.0);

  }
}

uint64_t __82__EKDayOccurrenceView_animateToFrame_isAllDay_beginFromCurrentState_whenFinished___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAllDay:", *(unsigned __int8 *)(a1 + 72));
}

uint64_t __82__EKDayOccurrenceView_animateToFrame_isAllDay_beginFromCurrentState_whenFinished___block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "alpha");
    if (v2 > 0.0 && (objc_msgSend(*(id *)(a1 + 32), "isHidden") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setDrawsResizeHandles:", *(unsigned __int8 *)(a1 + 49));
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_newResizeHandleView
{
  EKDayOccurrenceResizeHandleView *v3;

  v3 = -[EKDayOccurrenceResizeHandleView initWithFrame:occurrenceView:]([EKDayOccurrenceResizeHandleView alloc], "initWithFrame:occurrenceView:", self, 0.0, 0.0, 61.0, 61.0);
  -[EKDayOccurrenceResizeHandleView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", -[EKDayOccurrenceView isUserInteractionEnabled](self, "isUserInteractionEnabled"));
  return v3;
}

uint64_t __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "frame");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrame:", CalRoundRectToScreenScale(v2, v3, v4, v5));
}

uint64_t __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "frame");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setFrame:", CalRoundRectToScreenScale(v2, v3, v4, v5));
}

uint64_t __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __45__EKDayOccurrenceView_setDrawsResizeHandles___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (CGRect)frameOfOpaqueContent
{
  UIImageView *eventBackgroundView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  eventBackgroundView = self->_eventBackgroundView;
  if (eventBackgroundView
    && (-[UIImageView superview](eventBackgroundView, "superview"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[UIImageView bounds](self->_eventBackgroundView, "bounds");
    -[EKDayOccurrenceView convertRect:fromView:](self, "convertRect:fromView:", self->_eventBackgroundView);
  }
  else
  {
    -[EKDayOccurrenceView frame](self, "frame");
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)requestContentIfNeeded:(unint64_t)a3 completion:(id)a4
{
  char v4;
  id v6;
  unint64_t invalidatedRequestOptions;
  _BOOL4 drawsResizeHandles;
  void *v9;
  uint64_t v10;
  CUIKOROccurrenceState *currentImageState;
  int64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  v6 = a4;
  if (self->_invalidatedRequestOptions)
  {
    -[CUIKOROccurrenceState performChangesWithState:](self->_currentImageState, "performChangesWithState:", self);
    -[EKDayOccurrenceView _updateContentImageViewIfNeeded](self, "_updateContentImageViewIfNeeded");
    invalidatedRequestOptions = self->_invalidatedRequestOptions;
    drawsResizeHandles = self->_drawsResizeHandles;
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D0CDB0], "sharedProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (drawsResizeHandles)
      v10 = invalidatedRequestOptions | v4 & 0x18 | 0x20;
    else
      v10 = invalidatedRequestOptions | v4 & 0x18;
    currentImageState = self->_currentImageState;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__EKDayOccurrenceView_requestContentIfNeeded_completion___block_invoke;
    v13[3] = &unk_1E601C918;
    objc_copyWeak(&v15, &location);
    v14 = v6;
    v12 = objc_msgSend(v9, "requestPayloadForState:requestOptions:resultHandler:", currentImageState, v10, v13);

    if ((v12 & 0x8000000000000000) == 0)
    {
      self->_currentRequestId = v12;
      self->_invalidatedRequestOptions = 0;
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

uint64_t __57__EKDayOccurrenceView_requestContentIfNeeded_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t result;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_updateContentWithPayload:", v4);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateContentWithPayload:(id)a3
{
  char v4;
  int64_t currentRequestId;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "requestOptions");
  currentRequestId = self->_currentRequestId;
  v6 = objc_msgSend(v7, "requestId");
  if ((v4 & 0x10) != 0 || currentRequestId == v6)
    -[EKDayOccurrenceView forceUpdateContentWithPayload:](self, "forceUpdateContentWithPayload:", v7);

}

uint64_t __53__EKDayOccurrenceView_forceUpdateContentWithPayload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __49__EKDayOccurrenceView_setBottomPinningProximity___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608));
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIView *startResizeHandle;
  BOOL v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EKDayOccurrenceView;
  v9 = 1;
  if (!-[EKDayOccurrenceView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    startResizeHandle = self->_startResizeHandle;
    if (!startResizeHandle
      || !-[UIView pointInside:withEvent:](startResizeHandle, "pointInside:withEvent:", v7, x, y)
      && !-[UIView pointInside:withEvent:](self->_endResizeHandle, "pointInside:withEvent:", v7, x, y))
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  -[EKDayOccurrenceView setTouchesAreBeingTracked:](self, "setTouchesAreBeingTracked:", 1);
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView touchesBegan:withEvent:](&v15, sel_touchesBegan_withEvent_, v6, v7);
  if (v8)
  {
    objc_msgSend(v8, "locationInView:", self);
    v10 = v9;
    v12 = v11;
    if (-[EKDayOccurrenceView pointInside:withEvent:](self, "pointInside:withEvent:", v7))
    {
      if (-[EKDayOccurrenceView isReminder](self, "isReminder")
        && (-[EKDayOccurrenceView frame](self, "frame"), v13 > 60.0))
      {
        if (-[EKDayOccurrenceView pointInsideReminderCheckbox:](self, "pointInsideReminderCheckbox:", v10, v12))
          v14 = 2;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      *((_BYTE *)self + 496) = *((_BYTE *)self + 496) & 0xFD | v14;
      *((_BYTE *)self + 496) |= 1u;
    }
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView touchesMoved:withEvent:](&v9, sel_touchesMoved_withEvent_, v6, v7);
  if (v8)
  {
    objc_msgSend(v8, "locationInView:", self);
    if (!-[EKDayOccurrenceView pointInside:withEvent:](self, "pointInside:withEvent:", v7))
      *((_BYTE *)self + 496) &= ~1u;
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  char v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v27.receiver = self;
  v27.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView touchesEnded:withEvent:](&v27, sel_touchesEnded_withEvent_, v6, v7);
  if (-[EKDayOccurrenceView touchesAreBeingTracked](self, "touchesAreBeingTracked"))
  {
    if (v8)
    {
      objc_msgSend(v8, "locationInView:", self);
      v10 = v9;
      v12 = v11;
      if (!-[EKDayOccurrenceView isReminder](self, "isReminder")
        || (*((_BYTE *)self + 496) & 2) == 0
        || -[EKDayOccurrenceView isReminderStack](self, "isReminderStack"))
      {
        if (!-[EKDayOccurrenceView pointInside:withEvent:](self, "pointInside:withEvent:", v7, v10, v12))
          goto LABEL_23;
        if ((*((_BYTE *)self + 496) & 1) == 0)
          goto LABEL_23;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) == 0)
          goto LABEL_23;
        v15 = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject dayOccurrenceViewSelected:source:](v15, "dayOccurrenceViewSelected:source:", self, 0);
        goto LABEL_22;
      }
      if (-[EKDayOccurrenceView pointInsideReminderCheckbox:](self, "pointInsideReminderCheckbox:", v10, v12))
      {
        -[EKDayOccurrenceView occurrence](self, "occurrence");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "CUIK_reminderShouldBeEditable");

        if (v17)
        {
          -[EKDayOccurrenceView occurrence](self, "occurrence");
          v15 = objc_claimAutoreleasedReturnValue();
          -[NSObject setCompleted:](v15, "setCompleted:", -[NSObject completed](v15, "completed") ^ 1);
          -[UIResponder EKUI_editor](self, "EKUI_editor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          v19 = objc_msgSend(v18, "saveEvent:span:error:", v15, 0, &v26);
          v20 = v26;

          if ((v19 & 1) != 0)
            goto LABEL_21;
          v21 = kEKUILogHandle;
          if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
            goto LABEL_21;
          *(_DWORD *)buf = 138412290;
          v29 = v20;
          v22 = "Error saving completion state: %@";
          v23 = v21;
          v24 = OS_LOG_TYPE_ERROR;
LABEL_20:
          _os_log_impl(&dword_1AF84D000, v23, v24, v22, buf, 0xCu);
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
        v25 = (void *)kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          v15 = v25;
          -[EKDayOccurrenceView occurrence](self, "occurrence");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v20;
          v22 = "Tapped reminder isn't editable: %@";
          v23 = v15;
          v24 = OS_LOG_TYPE_DEBUG;
          goto LABEL_20;
        }
      }
    }
LABEL_23:
    -[EKDayOccurrenceView setTouchesAreBeingTracked:](self, "setTouchesAreBeingTracked:", 0);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  *((_BYTE *)self + 496) &= ~1u;
  v6 = a4;
  v7 = a3;
  -[EKDayOccurrenceView setTouchesAreBeingTracked:](self, "setTouchesAreBeingTracked:", 0);
  v8.receiver = self;
  v8.super_class = (Class)EKDayOccurrenceView;
  -[EKDayOccurrenceView touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v7, v6);

}

- (BOOL)pointInsideReminderCheckbox:(CGPoint)a3
{
  double x;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double MinX;
  double v21;
  BOOL v22;
  double MaxX;
  double v24;

  x = a3.x;
  -[CUIKOROccurrenceState leadingIcon](self->_currentImageState, "leadingIcon", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView frame](self->_contentView, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0D0CD78], "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "interfaceIsLeftToRight");

  v16 = v7;
  v17 = v9;
  v18 = v11;
  v19 = v13;
  if (v15)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v16);
    objc_msgSend(v5, "size");
    v22 = x < MinX + v21 + 5.0;
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v16);
    objc_msgSend(v5, "size");
    v22 = x > MaxX - v24 + -5.0;
  }

  return v22;
}

- (void)updateAlpha
{
  double v3;
  void *v4;
  uint64_t v5;

  v3 = 1.0;
  if (self->_dimmed && !self->_selected)
  {
    -[EKDayOccurrenceView currentImageState](self, "currentImageState", 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    v3 = 0.65;
    if (v5 != 2)
      v3 = 0.5;
  }
  -[EKDayOccurrenceView setAlpha:](self, "setAlpha:", v3);
}

- (int)dragTypeFromPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  int IsLeftToRight;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v16;
  double v17;
  double v18;
  BOOL v19;

  y = a3.y;
  x = a3.x;
  -[EKDayOccurrenceView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  if (IsLeftToRight)
    v11 = v7 + -40.0;
  else
    v11 = 0.0;
  if (IsLeftToRight)
    v12 = v7;
  else
    v12 = 40.0;
  if (IsLeftToRight)
    v13 = 0.0;
  else
    v13 = v7 + -40.0;
  if (IsLeftToRight)
    v7 = 40.0;
  if (!self->_startResizeHandle && !self->_endResizeHandle)
    return 1;
  -[EKDayOccurrenceView travelTime](self, "travelTime");
  v16 = v14 <= 0.0 || v11 >= x || x > v12;
  if (v16
    || (-[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self, "travelTimeSubviewHeightInPoints"), y >= v17 + 40.0)
    || (-[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self, "travelTimeSubviewHeightInPoints"), y <= v18 + -40.0))
  {
    v19 = v11 >= x || x > v12;
    if (v19 || y >= 40.0)
    {
      if (v13 <= x && x < v7 && y > v9 + -40.0)
        return 2;
      return 1;
    }
  }
  return 0;
}

- (void)bringResizeHandlesToFront
{
  void *v3;
  id v4;

  if (-[EKDayOccurrenceView drawsResizeHandles](self, "drawsResizeHandles"))
  {
    -[EKDayOccurrenceView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bringSubviewToFront:", self->_startResizeHandle);

    -[EKDayOccurrenceView superview](self, "superview");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bringSubviewToFront:", self->_endResizeHandle);

  }
}

- (double)viewMaxNaturalTextHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[CUIKOROccurrenceState minimumNaturalHeightAllText](self->_currentImageState, "minimumNaturalHeightAllText");
  v4 = v3;
  -[EKDayOccurrenceView margin](self, "margin");
  v6 = v5;
  -[EKDayOccurrenceView _verticalContentInset](self, "_verticalContentInset");
  v8 = v4 + v6 + v7;
  if (self->_showsTravelTime)
  {
    -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self, "travelTimeSubviewHeightInPoints");
    return v8 + v9;
  }
  return v8;
}

- (double)enoughHeightForOneLine
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_opt_class();
  -[EKDayOccurrenceView occurrences](self, "occurrences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enoughHeightForOneLineForEvents:usingSmallText:sizeClass:", v4, -[EKDayOccurrenceView usesSmallText](self, "usesSmallText"), EKUIWidthSizeClassForViewHierarchy(self));
  v6 = v5;

  return v6;
}

+ (double)enoughHeightForOneLineForEvents:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isIntegrationEvent"))
  {
    objc_msgSend(MEMORY[0x1E0D0CDB8], "naturalHeightForPrimaryTextUsingSmallText:sizeClass:", v6, a5);
    v10 = v9 * 1.43;
    v11 = objc_msgSend(v7, "count");
    v12 = 3;
    if (v11 < 3)
      v12 = v11;
    v13 = v10 + (double)(unint64_t)(v12 - 1) * 2.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0CDB8], "minimumNaturalHeightForPrimaryTextUsingSmallText:sizeClass:", v6, a5);
    v13 = v14;
  }
  if ((objc_msgSend(v8, "isAllDay") & 1) == 0)
  {
    objc_msgSend(v8, "startCalendarDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "minute");

    if (v16)
    {
      CalRoundToScreenScale(0.5);
      v13 = v13 - v17;
    }
  }
  objc_msgSend((id)objc_opt_class(), "defaultMargin");
  v19 = v18;
  v21 = v20;
  objc_msgSend((id)objc_opt_class(), "defaultPadding");
  CalRoundToScreenScale(v13 + v23 + v19 + v21 + v22);
  v25 = v24;

  return v25;
}

- (double)_verticalContentInset
{
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;

  v3 = 0.0;
  if (-[EKDayOccurrenceView _isTimedOccurrenceDrawingStyle](self, "_isTimedOccurrenceDrawingStyle"))
  {
    -[EKDayOccurrenceView occurrence](self, "occurrence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startCalendarDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "minute");

    if (v6)
    {
      CalRoundToScreenScale(0.5);
      return 0.0 - v7;
    }
  }
  return v3;
}

+ (double)barToBarHorizontalDistanceIncludingBarWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "barToBarGapWidth");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0D0CDA0], "colorBarThickness");
  v6 = v4 + v5;
  objc_msgSend(a1, "barToBarGapWidth");
  return v6 + v7;
}

- (void)fadeInContentViewAt:(double)a3 minWidth:(double)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double v9;
  double v10;
  UIImageView *contentView;
  _QWORD v12[5];

  v5 = a5;
  -[UIImageView frame](self->_contentView, "frame");
  if (v10 - (a3 - v9) >= a4 - (self->_margin.right + self->_padding.right))
  {
    if ((*((_BYTE *)self + 496) & 4) == 0)
    {
      self->_originalXBeforeOffset = v9;
      *((_BYTE *)self + 496) |= 4u;
    }
    -[UIImageView setFrame:](self->_contentView, "setFrame:", self->_originalXBeforeOffset + a3);
    -[UIImageView setHidden:](self->_contentView, "setHidden:", 0);
    -[UIImageView setNeedsDisplay](self->_contentView, "setNeedsDisplay");
    contentView = self->_contentView;
    if (v5)
    {
      -[UIImageView setAlpha:](contentView, "setAlpha:", 0.0);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__EKDayOccurrenceView_fadeInContentViewAt_minWidth_animated___block_invoke;
      v12[3] = &unk_1E6018688;
      v12[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.15);
    }
    else
    {
      -[UIImageView setAlpha:](contentView, "setAlpha:", 1.0);
    }
  }
}

uint64_t __61__EKDayOccurrenceView_fadeInContentViewAt_minWidth_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
}

- (BOOL)resetContentViewToOriginalState:(BOOL)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  if ((*((_BYTE *)self + 496) & 4) != 0)
  {
    if (a3)
    {
      v4[4] = self;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke;
      v5[3] = &unk_1E6018688;
      v5[4] = self;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke_2;
      v4[3] = &unk_1E6018638;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, v4, 0.2);
      return 1;
    }
    -[EKDayOccurrenceView _resetContentViewPosition](self, "_resetContentViewPosition");
  }
  return 0;
}

uint64_t __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
}

uint64_t __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke_2(uint64_t a1)
{
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_resetContentViewPosition");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke_3;
  v3[3] = &unk_1E6018688;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.2);
}

uint64_t __55__EKDayOccurrenceView_resetContentViewToOriginalState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
}

- (void)_resetContentViewPosition
{
  double v3;

  if ((*((_BYTE *)self + 496) & 4) != 0)
  {
    -[UIImageView frame](self->_contentView, "frame");
    -[UIImageView setFrame:](self->_contentView, "setFrame:", v3 + self->_originalXBeforeOffset - v3);
    *((_BYTE *)self + 496) &= ~4u;
    self->_originalXBeforeOffset = -1.0;
    -[UIImageView setNeedsDisplay](self->_contentView, "setNeedsDisplay");
  }
}

- (void)setHideText:(BOOL)a3 animate:(BOOL)a4
{
  double v6;
  double v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[6];

  if (self->_hideText != a3)
  {
    v6 = 1.0;
    if (a3)
      v7 = 0.0;
    else
      v7 = 1.0;
    if (a4)
    {
      if (!a3)
        v6 = 0.0;
      -[UIImageView setAlpha:](self->_contentView, "setAlpha:", v6);
      -[EKDayOccurrenceView setHideText:](self, "setHideText:", 0);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __43__EKDayOccurrenceView_setHideText_animate___block_invoke;
      v10[3] = &unk_1E6018FC8;
      v10[4] = self;
      *(double *)&v10[5] = v7;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __43__EKDayOccurrenceView_setHideText_animate___block_invoke_2;
      v8[3] = &unk_1E601C940;
      v8[4] = self;
      v9 = a3;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v10, v8, 0.3);
    }
    else
    {
      -[UIImageView setAlpha:](self->_contentView, "setAlpha:", v7);
      self->_hideText = a3;
    }
  }
}

uint64_t __43__EKDayOccurrenceView_setHideText_animate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __43__EKDayOccurrenceView_setHideText_animate___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 704) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isPinned
{
  return self->_bottomPinningProximity >= 1.0;
}

- (int64_t)compareOccurrenceViewForTabOrdering:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[EKDayOccurrenceView _compareOccurrenceViewTopToBottomLeftToRight:](self, "_compareOccurrenceViewTopToBottomLeftToRight:", v4);
  if (!v5)
    v5 = -[EKDayOccurrenceView _compareOccurrenceViewForSelectedCopyOrdering:](self, "_compareOccurrenceViewForSelectedCopyOrdering:", v4);

  return v5;
}

- (int64_t)_compareOccurrenceViewForSelectedCopyOrdering:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (-[EKDayOccurrenceView isSelectedCopyView](self, "isSelectedCopyView"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isSelectedCopyView") << 63 >> 63;

  return v5;
}

- (int64_t)_compareOccurrenceViewTopToBottomLeftToRight:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[EKDayOccurrenceView _compareOccurrenceViewTopToBottom:](self, "_compareOccurrenceViewTopToBottom:", v4);
  if (!v5)
    v5 = -[EKDayOccurrenceView _compareOccurrenceViewLeftToRight:](self, "_compareOccurrenceViewLeftToRight:", v4);

  return v5;
}

- (int64_t)_compareOccurrenceViewTopToBottom:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;

  v4 = a3;
  -[EKDayOccurrenceView occurrence](self, "occurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v7 = v6 * 0.25;

  objc_msgSend(v4, "occurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  v10 = v9 * 0.25;

  if (v7 >= v10)
    v11 = v10;
  else
    v11 = v7;
  if (v11 <= 300.0)
    v12 = v11;
  else
    v12 = 300.0;
  if (-[EKDayOccurrenceView _isBelowOccurrenceView:overlapToIgnore:](self, "_isBelowOccurrenceView:overlapToIgnore:", v4, v12))
  {
    v13 = 1;
  }
  else
  {
    v13 = -[EKDayOccurrenceView _isAboveOccurrenceView:overlapToIgnore:](self, "_isAboveOccurrenceView:overlapToIgnore:", v4, v12) << 63 >> 63;
  }

  return v13;
}

- (BOOL)_isAboveOccurrenceView:(id)a3 overlapToIgnore:(double)a4
{
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v6 = a3;
  objc_msgSend(v6, "occurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAllDay");

  if (v8)
  {
    v9 = -[EKDayOccurrenceView _isAboveAllDayOccurrenceView:](self, "_isAboveAllDayOccurrenceView:", v6);
  }
  else
  {
    objc_msgSend(v6, "occurrence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceView occurrence](self, "occurrence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endDateUnadjustedForLegacyClients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v13);
    v9 = v14 >= -a4;

    v6 = v10;
  }

  return v9;
}

- (BOOL)_isAboveAllDayOccurrenceView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;

  v4 = a3;
  -[EKDayOccurrenceView occurrence](self, "occurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "occurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compareDateIgnoringTimeComponents:inCalendar:", v8, v9);

  if (v10 == -1)
  {
    v11 = 1;
  }
  else if (v10 == 1)
  {
    v11 = 0;
  }
  else
  {
    -[EKDayOccurrenceView frame](self, "frame");
    v13 = v12;
    objc_msgSend(v4, "frame");
    v11 = v13 < v14;
  }

  return v11;
}

- (BOOL)_isBelowOccurrenceView:(id)a3 overlapToIgnore:(double)a4
{
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v6 = a3;
  objc_msgSend(v6, "occurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAllDay");

  if (v8)
  {
    v9 = -[EKDayOccurrenceView _isBelowAllDayOccurrenceView:](self, "_isBelowAllDayOccurrenceView:", v6);
  }
  else
  {
    -[EKDayOccurrenceView occurrence](self, "occurrence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "occurrence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endDateUnadjustedForLegacyClients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v13);
    v9 = v14 >= -a4;

  }
  return v9;
}

- (BOOL)_isBelowAllDayOccurrenceView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;

  v4 = a3;
  -[EKDayOccurrenceView occurrence](self, "occurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "occurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compareDateIgnoringTimeComponents:inCalendar:", v8, v9);

  if (v10 == -1)
  {
    v11 = 0;
  }
  else if (v10 == 1)
  {
    v11 = 1;
  }
  else
  {
    -[EKDayOccurrenceView frame](self, "frame");
    v13 = v12;
    objc_msgSend(v4, "frame");
    v11 = v13 > v14;
  }

  return v11;
}

- (int64_t)_compareOccurrenceViewLeftToRight:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[EKDayOccurrenceView frame](self, "frame");
  v6 = v5;
  objc_msgSend(v4, "frame");
  if (v6 >= v7)
  {
    -[EKDayOccurrenceView frame](self, "frame");
    v10 = v9;
    objc_msgSend(v4, "frame");
    v8 = v10 > v11;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (void)setReduceLayoutProcessingForAnimation:(BOOL)a3
{
  CGFloat v5;
  CGFloat v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_reduceLayoutProcessingForAnimation != a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__EKDayOccurrenceView_setReduceLayoutProcessingForAnimation___block_invoke;
    v7[3] = &unk_1E6019F18;
    v7[4] = self;
    v8 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
    self->_reduceLayoutProcessingForAnimation = a3;
    -[UIImageView frame](self->_contentView, "frame");
    self->_contentLocationDuringReducedProcessing.x = v5;
    self->_contentLocationDuringReducedProcessing.y = v6;
  }
}

uint64_t __61__EKDayOccurrenceView_setReduceLayoutProcessingForAnimation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    v3 = 0;
  else
    v3 = *(_BYTE *)(v2 + 718) == 0;
  objc_msgSend(*(id *)(v2 + 680), "setEnabled:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "invalidate");
}

uint64_t __53__EKDayOccurrenceView_setPointerInteractionDisabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 717))
    v3 = 0;
  else
    v3 = *(_BYTE *)(v2 + 718) == 0;
  objc_msgSend(*(id *)(v2 + 680), "setEnabled:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "invalidate");
}

- (void)_removeEditMenuInteractionIfNeeded
{
  void *v3;
  int v4;

  -[EKDayOccurrenceView interactions](self, "interactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self->_editMenuInteraction);

  if (v4)
    -[EKDayOccurrenceView removeInteraction:](self, "removeInteraction:", self->_editMenuInteraction);
}

- (void)_setEditingMenuEnabled:(BOOL)a3
{
  if (a3)
    -[EKDayOccurrenceView _addEditMenuInteractionIfNeeded](self, "_addEditMenuInteractionIfNeeded");
  else
    -[EKDayOccurrenceView _removeEditMenuInteractionIfNeeded](self, "_removeEditMenuInteractionIfNeeded");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double top;
  double left;
  double bottom;
  double right;
  double v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGPoint v24;
  CGRect v25;

  v6 = a4;
  -[EKDayOccurrenceView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (!-[EKDayOccurrenceView isAllDay](self, "isAllDay"))
  {
    top = self->_margin.top;
    left = self->_margin.left;
    bottom = self->_margin.bottom;
    right = self->_margin.right;
    v19 = top + CalOnePixelInPoints();
    v8 = v8 + left;
    v10 = v10 + v19;
    v12 = v12 - (left + right);
    v14 = v14 - (bottom + v19);
  }
  objc_msgSend(v6, "location");
  v24.x = v20;
  v24.y = v21;
  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  if (CGRectContainsPoint(v25, v24))
  {
    objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0, v8, v10, v12, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  EKDayOccurrenceView *v5;
  id v6;
  void *v7;
  char v8;
  EKDayOccurrenceView *v9;
  void *v10;
  void *v11;
  id v12;
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
  void *v23;
  void *v24;
  void *v25;

  v5 = self;
  v6 = a4;
  -[EKDayOccurrenceView delegate](v5, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  v9 = v5;
  if ((v8 & 1) != 0)
  {
    -[EKDayOccurrenceView delegate](v5, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedCopyViewForDayOccurrenceView:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v5;
    if (v11)
    {
      v9 = v11;

    }
  }
  v12 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(v6, "rect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[EKDayOccurrenceView convertRect:fromView:](v9, "convertRect:fromView:", v5, v14, v16, v18, v20);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVisiblePath:", v21);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v22);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v9, v12);
  objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPreferredTintMode:", 1);
  objc_msgSend(v24, "setPrefersShadow:", 0);
  objc_msgSend(v24, "setPrefersScaledContent:", 0);
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  EKDayOccurrenceViewDelegate **p_delegate;
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL8 editMenuPresented;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  p_delegate = &self->_delegate;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "dayOccurrenceViewSelected:source:", self, 1);

  v9 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v9, "selectedEventsForEditMenu");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v11, "presentationControllerForEditMenu");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  editMenuPresented = self->_editMenuPresented;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__EKDayOccurrenceView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
  v18[3] = &unk_1E601C968;
  v18[4] = self;
  +[EKUIContextMenuActions menuForEvents:presentationController:isEditMenu:overrideActionBlock:completionBlock:](EKUIContextMenuActions, "menuForEvents:presentationController:isEditMenu:overrideActionBlock:completionBlock:", v10, v12, editMenuPresented, v18, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count") + 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v7);

  objc_msgSend(v15, "addObject:", v14);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __81__EKDayOccurrenceView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 672));
  objc_msgSend(WeakRetained, "endForcedStartAndUndim");

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 672), 0);
  return 0;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  self->_editMenuPresented = 0;
}

- (void)presentEditingMenuFromGestureController:(id)a3
{
  void *v4;
  double MidX;
  void *v6;
  id obj;
  CGRect v8;
  CGRect v9;

  obj = a3;
  -[EKDayOccurrenceView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_storeWeak((id *)&self->_gestureController, obj);
    self->_editMenuPresented = 1;
    -[EKDayOccurrenceView _setEditingMenuEnabled:](self, "_setEditingMenuEnabled:", 1);
    -[EKDayOccurrenceView bounds](self, "bounds");
    MidX = CGRectGetMidX(v8);
    -[EKDayOccurrenceView bounds](self, "bounds");
    objc_msgSend(MEMORY[0x1E0DC3798], "configurationWithIdentifier:sourcePoint:", 0, MidX, CGRectGetMinY(v9));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v6);

  }
}

- (void)dismissEditingMenu
{
  -[EKDayOccurrenceView _setEditingMenuEnabled:](self, "_setEditingMenuEnabled:", 0);
  objc_storeWeak((id *)&self->_gestureController, 0);
  self->_editMenuPresented = 0;
}

- (EKDayOccurrenceViewDelegate)delegate
{
  return (EKDayOccurrenceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)visibleHeightLocked
{
  return self->_visibleHeightLocked;
}

- (NSArray)occurrences
{
  return self->_occurrences;
}

- (int64_t)occurrenceDateIndex
{
  return self->_occurrenceDateIndex;
}

- (void)setOccurrenceDateIndex:(int64_t)a3
{
  self->_occurrenceDateIndex = a3;
}

- (BOOL)occurrenceIsFirstVisibleDayOfEvent
{
  return self->_occurrenceIsFirstVisibleDayOfEvent;
}

- (BOOL)allDayDrawingStyle
{
  return self->_allDayDrawingStyle;
}

- (BOOL)drawsResizeHandles
{
  return self->_drawsResizeHandles;
}

- (BOOL)hideBackgroundImage
{
  return self->_hideBackgroundImage;
}

- (BOOL)hideText
{
  return self->_hideText;
}

- (BOOL)isMiniPreviewInEventDetail
{
  return self->_isMiniPreviewInEventDetail;
}

- (void)setIsMiniPreviewInEventDetail:(BOOL)a3
{
  self->_isMiniPreviewInEventDetail = a3;
}

- (BOOL)multiAllDayRoundCorners
{
  return self->_multiAllDayRoundCorners;
}

- (void)setMultiAllDayRoundCorners:(BOOL)a3
{
  self->_multiAllDayRoundCorners = a3;
}

- (BOOL)isTentative
{
  return self->_tentative;
}

- (BOOL)isDeclined
{
  return self->_declined;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (BOOL)needsReply
{
  return self->_needsReply;
}

- (BOOL)isBirthday
{
  return self->_birthday;
}

- (BOOL)isReminder
{
  return self->_isReminder;
}

- (double)cappedColorBarHeight
{
  return self->_cappedColorBarHeight;
}

- (BOOL)reduceLayoutProcessingForAnimation
{
  return self->_reduceLayoutProcessingForAnimation;
}

- (double)topPinningProximity
{
  return self->_topPinningProximity;
}

- (double)bottomPinningProximity
{
  return self->_bottomPinningProximity;
}

- (BOOL)pointerInteractionDisabled
{
  return self->_pointerInteractionDisabled;
}

- (BOOL)touchesAreBeingTracked
{
  return self->_touchesAreBeingTracked;
}

- (void)setTouchesAreBeingTracked:(BOOL)a3
{
  self->_touchesAreBeingTracked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrences, 0);
  objc_storeStrong((id *)&self->_occurrence, 0);
  objc_destroyWeak((id *)&self->_selectedCopy);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_gestureController);
  objc_storeStrong((id *)&self->_stagedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_currentImageState, 0);
  objc_storeStrong((id *)&self->_pinFadeView, 0);
  objc_storeStrong((id *)&self->_endResizeHandle, 0);
  objc_storeStrong((id *)&self->_startResizeHandle, 0);
  objc_storeStrong((id *)&self->_travelTimeContentView, 0);
  objc_storeStrong((id *)&self->_travelBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_eventBackgroundColorBar, 0);
  objc_storeStrong((id *)&self->_eventBackgroundView, 0);
}

@end
