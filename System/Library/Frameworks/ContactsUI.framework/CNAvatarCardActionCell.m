@implementation CNAvatarCardActionCell

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0, 2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontWithDescriptor:size:", v10, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionCell subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

}

- (void)awakeFromNib
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  UIButton *expandButton;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNAvatarCardActionCell;
  -[CNAvatarCardActionCell awakeFromNib](&v12, sel_awakeFromNib);
  -[CNAvatarCardActionCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[CNAvatarCardActionCell translatingViewLeadingConstraint](self, "translatingViewLeadingConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constant");
  -[CNAvatarCardActionCell setInitialTranslatingViewLeadingConstraintConstant:](self, "setInitialTranslatingViewLeadingConstraintConstant:");

  -[CNAvatarCardActionCell setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 0);
  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[CNAvatarCardActionCell setLayoutMargins:](self, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], v5, v6, v7);
  -[CNAvatarCardActionCell setSeparatorInset:](self, "setSeparatorInset:", v4, v5, v6, v7);
  +[CNUIColorRepository navigationListCellTitleTextColorRegular](CNUIColorRepository, "navigationListCellTitleTextColorRegular");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v8);

  +[CNUIColorRepository navigationListCellSubtitleTextColorRegular](CNUIColorRepository, "navigationListCellSubtitleTextColorRegular");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v9);

  -[CNAvatarCardActionCell _updateFonts](self, "_updateFonts");
  expandButton = self->_expandButton;
  if (expandButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageForNavigationListChevron");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](expandButton, "setImage:forState:", v11, 0);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  -[CNAvatarCardActionCell setHighlighted:animated:](self, "setHighlighted:animated:", a3, 1);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)CNAvatarCardActionCell;
  -[CNAvatarCardActionCell setHighlighted:animated:](&v6, sel_setHighlighted_animated_, a3);
  -[CNAvatarCardActionCell _updateHighlightAnimated:](self, "_updateHighlightAnimated:", v4);
}

- (void)prepareForReuse
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNAvatarCardActionCell;
  -[CNAvatarCardActionCell prepareForReuse](&v4, sel_prepareForReuse);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CNAvatarCardActionCell_prepareForReuse__block_invoke;
  v3[3] = &unk_1E204F648;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

- (void)_updateHighlightAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  char v13;

  v3 = a3;
  -[CNAvatarCardActionCell defaultHighlightView](self, "defaultHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:animated:", -[CNAvatarCardActionCell isHighlighted](self, "isHighlighted"), v3);

  -[CNAvatarCardActionCell action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isBackAction");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__CNAvatarCardActionCell__updateHighlightAnimated___block_invoke;
  v12[3] = &unk_1E204C4D0;
  v13 = v7;
  v12[4] = self;
  v8 = _Block_copy(v12);
  v9 = v8;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.2);
  else
    (*((void (**)(void *))v8 + 2))(v8);
  if (-[CNAvatarCardActionCell isHighlighted](self, "isHighlighted"))
    v10 = -[CNAvatarCardActionCell moreHighlighted](self, "moreHighlighted") | v7;
  else
    v10 = 0;
  -[CNAvatarCardActionCell expandButton](self, "expandButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHighlighted:", v10);

}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
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
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[3];

  v56[2] = *MEMORY[0x1E0C80C00];
  if (-[CNAvatarCardActionCell context](self, "context") == 3)
  {
    -[CNAvatarCardActionCell actionImageView](self, "actionImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", 0);
  }
  else
  {
    -[CNAvatarCardActionCell action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionCell actionImageView](self, "actionImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v5);

    +[CNUIColorRepository navigationListActionIconFillColorRegular](CNUIColorRepository, "navigationListActionIconFillColorRegular");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionCell actionImageView](self, "actionImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v3);

  }
  if (-[CNAvatarCardActionCell context](self, "context") == 3
    && (-[CNAvatarCardActionCell action](self, "action"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isBackAction"),
        v8,
        !v9))
  {
    -[CNAvatarCardActionCell action](self, "action");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "titleForContext:", -[CNAvatarCardActionCell context](self, "context"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionCell titleLabel](self, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setText:", v32);

    -[CNAvatarCardActionCell action](self, "action");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "subtitleForContext:", -[CNAvatarCardActionCell context](self, "context"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v55[0] = *MEMORY[0x1E0DC1138];
    -[CNAvatarCardActionCell titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v11;
    v12 = *MEMORY[0x1E0DC1140];
    v55[1] = *MEMORY[0x1E0DC1140];
    -[CNAvatarCardActionCell titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
    v15 = objc_claimAutoreleasedReturnValue();

    -[CNAvatarCardActionCell action](self, "action");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "titleForContext:", -[CNAvatarCardActionCell context](self, "context"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAvatarCardActionCell action](self, "action");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subtitleForContext:", -[CNAvatarCardActionCell context](self, "context"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v17;
    v54 = (void *)v15;
    if (objc_msgSend(v19, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %@"), v20, v19, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v21, v15);
      -[CNAvatarCardActionCell subtitleLabel](self, "subtitleLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "textColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addAttribute:value:range:", v12, v24, objc_msgSend(v20, "length") + objc_msgSend(CFSTR("%@  %@"), "length") - 4, objc_msgSend(v19, "length"));

    }
    else
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v20, v15);
      v21 = v20;
    }
    objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
    v26 = v25;
    -[CNAvatarCardActionCell titleLabel](self, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 <= 0.0
      || (objc_msgSend(v28, "animationForKey:", CFSTR("kCATransitionFade")),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          v29,
          v29))
    {
      if (v26 == 0.0)
      {
        objc_msgSend(v28, "animationForKey:", CFSTR("kCATransitionFade"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          objc_msgSend(v28, "removeAnimationForKey:", CFSTR("kCATransitionFade"));
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTimingFunction:", v37);

      objc_msgSend(v36, "setType:", *MEMORY[0x1E0CD3170]);
      objc_msgSend(v36, "setDuration:", v26);
      objc_msgSend(v28, "addAnimation:forKey:", v36, CFSTR("kCATransitionFade"));

    }
    -[CNAvatarCardActionCell titleLabel](self, "titleLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAttributedText:", v22);

    v35 = 0;
  }
  -[CNAvatarCardActionCell subtitleLabel](self, "subtitleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setText:", v35);

  -[CNAvatarCardActionCell pageControl](self, "pageControl");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setNumberOfPages:", 1);

  -[CNAvatarCardActionCell action](self, "action");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isBackAction");

  if (v42)
  {
    +[CNUIColorRepository orbActionCellBackgroundColor](CNUIColorRepository, "orbActionCellBackgroundColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionCell setBackgroundColor:](self, "setBackgroundColor:", v43);

  }
  else
  {
    -[CNAvatarCardActionCell setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  v44 = (void *)objc_opt_class();
  -[CNAvatarCardActionCell action](self, "action");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v45;
  else
    v46 = 0;

  if (v46)
  {
    v47 = 0;
  }
  else
  {
    -[CNAvatarCardActionCell action](self, "action");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v44, "isBackAction") ^ 1;
  }
  -[CNAvatarCardActionCell expandButton](self, "expandButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHidden:", v47);

  if (!v46)
  -[CNAvatarCardActionCell expandButton](self, "expandButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "isHidden");

  -[CNAvatarCardActionCell expandButtonWidthConstraint](self, "expandButtonWidthConstraint");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  v53 = 66.0;
  if (v50)
    v53 = 20.0;
  objc_msgSend(v51, "setConstant:", v53);

}

- (void)startTrackingWithGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addTarget:action:", self, sel_trackHighlight_);
  -[CNAvatarCardActionCell trackHighlight:](self, "trackHighlight:", v4);

  -[CNAvatarCardActionCell reloadData](self, "reloadData");
}

- (void)stopTrackingWithGestureRecognizer:(id)a3
{
  objc_msgSend(a3, "removeTarget:action:", self, sel_trackHighlight_);
}

- (void)trackHighlight:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGFloat y;
  CGFloat height;
  _BOOL8 v10;
  id v11;
  CGPoint v12;
  CGRect v13;
  CGRect v14;

  v11 = a3;
  if (objc_msgSend(v11, "state") == 1 || objc_msgSend(v11, "state") == 2)
  {
    objc_msgSend(v11, "locationInView:", self);
    v5 = v4;
    v7 = v6;
    -[CNAvatarCardActionCell bounds](self, "bounds");
    y = v13.origin.y;
    height = v13.size.height;
    v14.origin.x = CGRectGetMaxX(v13) + -120.0;
    v14.size.width = 120.0;
    v14.origin.y = y;
    v14.size.height = height;
    v12.x = v5;
    v12.y = v7;
    v10 = CGRectContainsPoint(v14, v12);
    if (v10 != -[CNAvatarCardActionCell moreHighlighted](self, "moreHighlighted"))
    {
      -[CNAvatarCardActionCell setMoreHighlighted:](self, "setMoreHighlighted:", v10);
      -[CNAvatarCardActionCell _updateHighlightAnimated:](self, "_updateHighlightAnimated:", 1);
    }
  }

}

- (CNQuickAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (BOOL)swipped
{
  return self->_swipped;
}

- (void)setSwipped:(BOOL)a3
{
  self->_swipped = a3;
}

- (BOOL)moreHighlighted
{
  return self->_moreHighlighted;
}

- (void)setMoreHighlighted:(BOOL)a3
{
  self->_moreHighlighted = a3;
}

- (UIImageView)actionImageView
{
  return self->_actionImageView;
}

- (void)setActionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_actionImageView, a3);
}

- (CNAvatarCardHighlightView)defaultHighlightView
{
  return self->_defaultHighlightView;
}

- (void)setDefaultHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_defaultHighlightView, a3);
}

- (CNAvatarCardHighlightView)moreHighlightView
{
  return self->_moreHighlightView;
}

- (void)setMoreHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_moreHighlightView, a3);
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

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (UILabel)moreLabel
{
  return self->_moreLabel;
}

- (void)setMoreLabel:(id)a3
{
  objc_storeStrong((id *)&self->_moreLabel, a3);
}

- (UIView)translatingView
{
  return self->_translatingView;
}

- (void)setTranslatingView:(id)a3
{
  objc_storeStrong((id *)&self->_translatingView, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UIButton)expandButton
{
  return self->_expandButton;
}

- (void)setExpandButton:(id)a3
{
  objc_storeStrong((id *)&self->_expandButton, a3);
}

- (NSLayoutConstraint)punchOutLeftConstraint
{
  return self->_punchOutLeftConstraint;
}

- (void)setPunchOutLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_punchOutLeftConstraint, a3);
}

- (NSLayoutConstraint)translatingViewLeadingConstraint
{
  return self->_translatingViewLeadingConstraint;
}

- (void)setTranslatingViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_translatingViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)pageControlLeadingConstraint
{
  return self->_pageControlLeadingConstraint;
}

- (void)setPageControlLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageControlLeadingConstraint, a3);
}

- (NSLayoutConstraint)expandButtonWidthConstraint
{
  return self->_expandButtonWidthConstraint;
}

- (void)setExpandButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_expandButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)moreHighlightViewHiddingConstraint
{
  return self->_moreHighlightViewHiddingConstraint;
}

- (void)setMoreHighlightViewHiddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_moreHighlightViewHiddingConstraint, a3);
}

- (double)initialTranslatingViewLeadingConstraintConstant
{
  return self->_initialTranslatingViewLeadingConstraintConstant;
}

- (void)setInitialTranslatingViewLeadingConstraintConstant:(double)a3
{
  self->_initialTranslatingViewLeadingConstraintConstant = a3;
}

- (unint64_t)lastScrollDirection
{
  return self->_lastScrollDirection;
}

- (void)setLastScrollDirection:(unint64_t)a3
{
  self->_lastScrollDirection = a3;
}

- (double)lastScrollDirectionTimestamp
{
  return self->_lastScrollDirectionTimestamp;
}

- (void)setLastScrollDirectionTimestamp:(double)a3
{
  self->_lastScrollDirectionTimestamp = a3;
}

- (BOOL)gestureActivated
{
  return self->_gestureActivated;
}

- (void)setGestureActivated:(BOOL)a3
{
  self->_gestureActivated = a3;
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreHighlightViewHiddingConstraint, 0);
  objc_storeStrong((id *)&self->_expandButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_pageControlLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_translatingViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_punchOutLeftConstraint, 0);
  objc_storeStrong((id *)&self->_expandButton, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_translatingView, 0);
  objc_storeStrong((id *)&self->_moreLabel, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_moreHighlightView, 0);
  objc_storeStrong((id *)&self->_defaultHighlightView, 0);
  objc_storeStrong((id *)&self->_actionImageView, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

void __51__CNAvatarCardActionCell__updateHighlightAnimated___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  double v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v2 = *MEMORY[0x1E0C9BAA8];
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v11.c = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v11.tx = v4;
  if (*(_BYTE *)(a1 + 40))
  {
    *(_OWORD *)&v10.a = v2;
    *(_OWORD *)&v10.c = v3;
    *(_OWORD *)&v10.tx = v4;
    CGAffineTransformRotate(&v11, &v10, 3.14149265);
  }
  v9 = v11;
  objc_msgSend(*(id *)(a1 + 32), "expandButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v5, "setTransform:", &v8);

  if (objc_msgSend(*(id *)(a1 + 32), "isHighlighted"))
    v6 = 0.75;
  else
    v6 = 0.55;
  objc_msgSend(*(id *)(a1 + 32), "actionImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

}

uint64_t __41__CNAvatarCardActionCell_prepareForReuse__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFonts");
}

+ (id)cellNibForActions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CNAvatarCardActionCell_cellNibForActions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cellNibForActions_onceToken != -1)
    dispatch_once(&cellNibForActions_onceToken, block);
  return (id)cellNibForActions_nib;
}

+ (id)cellNibForContacts
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CNAvatarCardActionCell_cellNibForContacts__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cellNibForContacts_onceToken != -1)
    dispatch_once(&cellNibForContacts_onceToken, block);
  return (id)cellNibForContacts_nib;
}

void __44__CNAvatarCardActionCell_cellNibForContacts__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3A50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "nibWithNibName:bundle:", CFSTR("CNAvatarCardActionCell-Contact-OrbHW"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cellNibForContacts_nib;
  cellNibForContacts_nib = v1;

}

void __43__CNAvatarCardActionCell_cellNibForActions__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3A50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "nibWithNibName:bundle:", CFSTR("CNAvatarCardActionCell-Expand-OrbHW"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cellNibForActions_nib;
  cellNibForActions_nib = v1;

}

@end
