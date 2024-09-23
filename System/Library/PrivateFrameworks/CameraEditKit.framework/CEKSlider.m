@implementation CEKSlider

- (CEKSlider)initWithTitle:(id)a3
{
  return -[CEKSlider initWithTitle:tickMarkStyle:](self, "initWithTitle:tickMarkStyle:", a3, 0);
}

- (CEKSlider)initWithTickMarkStyle:(unint64_t)a3
{
  return -[CEKSlider initWithTitle:tickMarkStyle:](self, "initWithTitle:tickMarkStyle:", &stru_1E70A5BC0, a3);
}

- (CEKSlider)initWithTitle:(id)a3 tickMarkStyle:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CEKSlider *v11;
  CEKSlider *v12;
  void *v13;
  UIScrollView *v14;
  UIScrollView *contentScrollView;
  void *v16;
  CEKDynamicTickMarksView *v17;
  CEKDynamicTickMarksView *dynamicTickMarksView;
  CEKSliderTickMarksView *v19;
  CEKTickMarksContainer *tickMarksView;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIView *v25;
  UIView *levelIndicatorView;
  void *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  void *v32;
  UILabel *titleLabel;
  UILabel *v34;
  CEKSelectionFeedbackGenerator *v35;
  CEKSelectionFeedbackGenerator *feedbackGenerator;
  objc_super v38;

  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CEKSlider;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[CEKSlider initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v11->_textOrientation = 0;
    v11->_fontStyle = 0;
    v11->_animationDuration = 0.25;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKSlider setTintColor:](v12, "setTintColor:", v13);

    v14 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    contentScrollView = v12->__contentScrollView;
    v12->__contentScrollView = v14;

    -[UIScrollView setDelegate:](v12->__contentScrollView, "setDelegate:", v12);
    -[UIScrollView setShowsVerticalScrollIndicator:](v12->__contentScrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v12->__contentScrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setDecelerationRate:](v12->__contentScrollView, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    -[UIScrollView panGestureRecognizer](v12->__contentScrollView, "panGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_wantsGESEvents:", 1);

    -[CEKSlider addSubview:](v12, "addSubview:", v12->__contentScrollView);
    v12->__ticksStyle = a4;
    if (a4)
    {
      if (a4 == 1)
      {
        v17 = objc_alloc_init(CEKDynamicTickMarksView);
        dynamicTickMarksView = v12->__dynamicTickMarksView;
        v12->__dynamicTickMarksView = v17;

        objc_storeStrong((id *)&v12->__tickMarksView, v12->__dynamicTickMarksView);
      }
    }
    else
    {
      v19 = objc_alloc_init(CEKSliderTickMarksView);
      tickMarksView = v12->__tickMarksView;
      v12->__tickMarksView = (CEKTickMarksContainer *)v19;

    }
    -[CEKTickMarksContainer setDelegate:](v12->__tickMarksView, "setDelegate:", v12);
    -[CEKTickMarksContainer tickMarksModel](v12->__tickMarksView, "tickMarksModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTickMarkSpacing:", 9.0);

    -[CEKTickMarksContainer tickMarksModel](v12->__tickMarksView, "tickMarksModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTickMarkWidth:", 1.0);

    -[CEKTickMarksContainer tickMarksModel](v12->__tickMarksView, "tickMarksModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMainTickMarkInterval:", 10);

    -[UIScrollView addSubview:](v12->__contentScrollView, "addSubview:", v12->__tickMarksView);
    v12->_tickMarkSize = (CGSize)xmmword_1B9877D90;
    -[CEKTickMarksContainer tickMarksModel](v12->__tickMarksView, "tickMarksModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTickMarksCount:", 41);

    v12->_sliderVerticalAlignment = 0;
    v12->_labelVerticalPadding = 10.0;
    v12->_valueLabelVisibility = 0;
    v12->_levelIndicatorHeight = 26.0;
    if (!v12->__dynamicTickMarksView)
    {
      v25 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      levelIndicatorView = v12->__levelIndicatorView;
      v12->__levelIndicatorView = v25;

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v12->__levelIndicatorView, "setBackgroundColor:", v27);

      -[UIView layer](v12->__levelIndicatorView, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAnchorPoint:", 0.5, 0.0);

      -[CEKSlider addSubview:](v12, "addSubview:", v12->__levelIndicatorView);
    }
    v12->_minimumValue = -1.0;
    v12->_maximumValue = 1.0;
    v12->_markedValue = 1.79769313e308;
    if (objc_msgSend(v6, "length"))
    {
      v29 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v29, "setBackgroundColor:", v30);

      -[UILabel setTextAlignment:](v29, "setTextAlignment:", 4);
      -[UILabel setLineBreakMode:](v29, "setLineBreakMode:", 0);
      -[UILabel setNumberOfLines:](v29, "setNumberOfLines:", 0);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "colorWithAlphaComponent:", 0.6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v29, "setTextColor:", v32);

      -[UILabel setText:](v29, "setText:", v6);
      titleLabel = v12->__titleLabel;
      v12->__titleLabel = v29;
      v34 = v29;

      -[CEKSlider addSubview:](v12, "addSubview:", v12->__titleLabel);
      -[CEKSlider _updateFonts](v12, "_updateFonts");
    }
    if (CEKHapticsAllowed())
    {
      v35 = objc_alloc_init(CEKSelectionFeedbackGenerator);
      feedbackGenerator = v12->__feedbackGenerator;
      v12->__feedbackGenerator = v35;

    }
    v12->_feedbackScope = 2;
  }

  return v12;
}

- (CEKSlider)initWithFrame:(CGRect)a3
{
  return -[CEKSlider initWithTitle:](self, "initWithTitle:", &stru_1E70A5BC0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)_integerFormatter
{
  if (_integerFormatter_onceToken != -1)
    dispatch_once(&_integerFormatter_onceToken, &__block_literal_global_4);
  return (id)_integerFormatter_integerFormatter;
}

void __30__CEKSlider__integerFormatter__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_integerFormatter_integerFormatter;
  _integerFormatter_integerFormatter = (uint64_t)v0;

  objc_msgSend((id)_integerFormatter_integerFormatter, "setPositiveFormat:", CFSTR("0"));
  objc_msgSend((id)_integerFormatter_integerFormatter, "setNegativeFormat:", CFSTR("0"));
  objc_msgSend((id)_integerFormatter_integerFormatter, "setPositivePrefix:", 0);
  objc_msgSend((id)_integerFormatter_integerFormatter, "minusSign");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_integerFormatter_integerFormatter, "setNegativePrefix:", v2);

}

- (id)formattedIntegerStringFromNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_integerFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_integerFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromNumber:", &unk_1E70B46E0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", v8))
  {
    objc_msgSend((id)objc_opt_class(), "_integerFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromNumber:", &unk_1E70B3BE0);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  CEKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredLocalizations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider _valueLabel](self, "_valueLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pointSize");
  v18 = v17;

  if (CEKIsCustomKerningSupportedForLocale(v14))
  {
    v23 = *MEMORY[0x1E0DC32B0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18 * 100.0 / 1000.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v20);

  return v21;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $4A49232648DE8070DB28DCCC238A96A2 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToWillBeginScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidScroll = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillEndScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidEndScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillUpdateValue = objc_opt_respondsToSelector() & 1;
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  objc_super v18;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v18.receiver = self;
  v18.super_class = (Class)CEKSlider;
  -[CEKSlider hitTest:withEvent:](&v18, sel_hitTest_withEvent_, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (-[CEKSlider interactiveWhenHidden](self, "interactiveWhenHidden"))
  {
    v20.origin.x = v9;
    v20.origin.y = v11;
    v20.size.width = v13;
    v20.size.height = v15;
    v19.x = x;
    v19.y = y;
    if (CGRectContainsPoint(v20, v19))
    {
      -[CEKSlider _contentScrollView](self, "_contentScrollView");
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v16;
    }
  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  int64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double MaxY;
  double v55;
  double v56;
  void *v57;
  double x;
  double y;
  double width;
  double height;
  void *v62;
  void *v63;
  double MinX;
  double v65;
  double MaxX;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v75;
  int64_t v76;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  double v88;
  double v89;
  CGFloat v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  double v95;
  double v96;
  CGFloat recta;
  double rect;
  double v99;
  double v100;
  double v101;
  double v102;
  CGAffineTransform v103;
  CGAffineTransform v104;
  objc_super v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v105.receiver = self;
  v105.super_class = (Class)CEKSlider;
  -[CEKSlider layoutSubviews](&v105, sel_layoutSubviews);
  -[CEKSlider tickMarkSize](self, "tickMarkSize");
  v4 = v3;
  v6 = v5;
  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tickMarksModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTickMarkWidth:", v4);

  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tickMarksModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requiredWidth");
  v12 = v11;

  -[CEKSlider bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[CEKSlider sliderVerticalAlignment](self, "sliderVerticalAlignment");
  v100 = v20;
  if (v21 == 2)
  {
    -[CEKSlider levelIndicatorHeight](self, "levelIndicatorHeight");
    v29 = v28 + 33.0 - v6;
    -[CEKSlider sliderVerticalOffset](self, "sliderVerticalOffset");
    v22 = v30 + v29;
LABEL_7:
    v24 = 0.0;
    goto LABEL_8;
  }
  if (v21 == 1)
  {
    v106.origin.x = v14;
    v106.origin.y = v16;
    v106.size.width = v18;
    v106.size.height = v20;
    v31 = CGRectGetMaxY(v106) - v6;
    -[CEKSlider sliderVerticalOffset](self, "sliderVerticalOffset");
    v22 = v31 - v32;
    goto LABEL_7;
  }
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  if (!v21)
  {
    v94 = 0;
    UIRectCenteredYInRectScale();
    v24 = v23;
    v22 = v25;
    v12 = v26;
    v6 = v27;
LABEL_8:
    v33 = v14;
    v34 = v16;
    goto LABEL_10;
  }
  v33 = v14;
  v34 = v16;
  v24 = *MEMORY[0x1E0C9D648];
LABEL_10:
  recta = v22;
  v101 = v18;
  v102 = v33;
  -[CEKSlider _dynamicTickMarksView](self, "_dynamicTickMarksView", v94);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider bounds](self, "bounds");
  -[CEKSlider convertRect:toView:](self, "convertRect:toView:", v35);
  objc_msgSend(v35, "setVisibleBounds:");
  v95 = CEKPixelWidthForView(self);
  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "frameForAlignmentRect:", v24, v22, v12, v6);
  v38 = v37;
  v39 = v6;
  v41 = v40;
  v42 = v24;
  v44 = v43;
  v46 = v45;

  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v38, v41, v44, v46);

  -[CEKSlider levelIndicatorHeight](self, "levelIndicatorHeight");
  v99 = v34;
  UIRectCenteredXInRectScale();
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v107.origin.x = v42;
  v107.origin.y = recta;
  v96 = v12;
  rect = v39;
  v107.size.width = v12;
  v107.size.height = v39;
  MaxY = CGRectGetMaxY(v107);
  -[CEKSlider levelIndicatorHeight](self, "levelIndicatorHeight", 0);
  v56 = MaxY - v55;
  if (!-[CEKSlider _isAnimating](self, "_isAnimating"))
  {
    -[CEKSlider _levelIndicatorView](self, "_levelIndicatorView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setFrame:", v49, v56, v51, v53);

  }
  v108.origin.x = v49;
  v108.origin.y = v56;
  v108.size.width = v51;
  v108.size.height = v53;
  v109 = CGRectInset(v108, -v95, -v95);
  x = v109.origin.x;
  y = v109.origin.y;
  width = v109.size.width;
  height = v109.size.height;
  -[CEKSlider _levelIndicatorBackgroundView](self, "_levelIndicatorBackgroundView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", x, y, width, height);

  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setFrame:", v102, v99, v101, v100);

  v110.origin.x = v49;
  v110.origin.y = v56;
  v110.size.width = v51;
  v110.size.height = v53;
  MinX = CGRectGetMinX(v110);
  v111.origin.x = v102;
  v111.origin.y = v99;
  v111.size.width = v101;
  v111.size.height = v100;
  v65 = MinX - CGRectGetMinX(v111);
  v112.origin.x = v102;
  v112.origin.y = v99;
  v112.size.width = v101;
  v112.size.height = v100;
  MaxX = CGRectGetMaxX(v112);
  v113.origin.x = v49;
  v113.origin.y = v56;
  v113.size.width = v51;
  v113.size.height = v53;
  v67 = MaxX - CGRectGetMaxX(v113);
  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setContentInset:", 0.0, v65, 0.0, v67);

  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setContentSize:", v96, rect);

  if (-[CEKSlider _markedValueWithinRange](self, "_markedValueWithinRange"))
  {
    -[CEKSlider _xOffsetForMarkedValue](self, "_xOffsetForMarkedValue");
    v71 = v70 + -4.0;
    -[CEKSlider _dotView](self, "_dotView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setFrame:", v71, v56, 8.0, 8.0);

  }
  -[CEKSlider _titleLabel](self, "_titleLabel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider _valueLabel](self, "_valueLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v104.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v104.c = v75;
  *(_OWORD *)&v104.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v76 = -[CEKSlider textOrientation](self, "textOrientation");
  if (v76 == 1)
  {
    v78 = -1.57079633;
  }
  else
  {
    v77 = 18.0;
    if (v76 != 2)
      goto LABEL_19;
    v78 = 1.57079633;
  }
  CGAffineTransformMakeRotation(&v104, v78);
  v77 = 28.0;
LABEL_19:
  v103 = v104;
  objc_msgSend(v74, "setTransform:", &v103);
  v103 = v104;
  objc_msgSend(v73, "setTransform:", &v103);
  -[CEKSlider labelVerticalPadding](self, "labelVerticalPadding");
  v80 = v79;
  objc_msgSend(v73, "setFrame:", 10.0, v79, v101 + -20.0, 18.0);
  objc_msgSend(v74, "setFrame:", 0.0, v80, v101, v77);
  -[CEKSlider _edgeGradientView](self, "_edgeGradientView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if (v81)
  {
    v84 = *MEMORY[0x1E0DC49E8];
    v83 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v86 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v85 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v87 = objc_msgSend(v81, "edgeGradientStyle");
    if (v87 != 2)
    {
      if (v87 == 1)
      {
        v114.origin.x = v49;
        v114.origin.y = v56;
        v114.size.width = v51;
        v114.size.height = v53;
        v90 = CGRectGetMaxY(v114);
        v89 = v100;
        v86 = v100 - v90;
        v83 = 0.0;
        v84 = v56;
        v85 = 0.0;
        v88 = v99;
        goto LABEL_26;
      }
      if (v87)
      {
        v88 = v99;
        v89 = v100;
        goto LABEL_26;
      }
    }
    v88 = v56;
    v89 = v53;
LABEL_26:
    objc_msgSend(v82, "setFrame:", v102, v88, v101, v89);
    objc_msgSend(v82, "setContentInsets:", v84, v83, v86, v85);
    -[CEKSlider gradientInsets](self, "gradientInsets");
    v92 = v91;
    -[CEKSlider gradientInsets](self, "gradientInsets");
    objc_msgSend(v82, "setGradientDimensions:", v92, v101 * 0.1, v101 * 0.1, v93);
  }
  -[CEKSlider _updateScrollViewPosition](self, "_updateScrollViewPosition");
  -[CEKSlider _updateMagneticTickIndexes](self, "_updateMagneticTickIndexes");

}

- (void)resetToDefault
{
  -[CEKSlider defaultValue](self, "defaultValue");
  -[CEKSlider setValue:](self, "setValue:");
}

- (void)setValue:(double)a3
{
  -[CEKSlider _setValue:shouldSendActions:shouldUpdateScrollPosition:](self, "_setValue:shouldSendActions:shouldUpdateScrollPosition:", 0, 1, a3);
}

- (void)_clampValuesAndUpdateScrollPosition:(BOOL)a3
{
  _BOOL4 v3;
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

  v3 = a3;
  -[CEKSlider minimumValue](self, "minimumValue");
  v6 = v5;
  -[CEKSlider defaultValue](self, "defaultValue");
  v8 = v7;
  -[CEKSlider maximumValue](self, "maximumValue");
  if (v8 < v9)
    v9 = v8;
  if (v6 >= v9)
    v9 = v6;
  self->_defaultValue = v9;
  -[CEKSlider minimumValue](self, "minimumValue");
  v11 = v10;
  -[CEKSlider value](self, "value");
  v13 = v12;
  -[CEKSlider maximumValue](self, "maximumValue");
  if (v13 < v14)
    v14 = v13;
  if (v11 >= v14)
    v14 = v11;
  self->_value = v14;
  if (v3)
    -[CEKSlider _updateScrollViewPosition](self, "_updateScrollViewPosition");
}

- (void)setDefaultValue:(double)a3
{
  if (self->_defaultValue != a3)
  {
    self->_defaultValue = a3;
    -[CEKSlider _clampValuesAndUpdateScrollPosition:](self, "_clampValuesAndUpdateScrollPosition:", 1);
  }
}

- (void)setMinimumValue:(double)a3
{
  if (self->_minimumValue != a3)
  {
    self->_minimumValue = a3;
    -[CEKSlider _clampValuesAndUpdateScrollPosition:](self, "_clampValuesAndUpdateScrollPosition:", 1);
    -[CEKSlider _updateMagneticTickIndexes](self, "_updateMagneticTickIndexes");
  }
}

- (void)setMaximumValue:(double)a3
{
  if (self->_maximumValue != a3)
  {
    self->_maximumValue = a3;
    -[CEKSlider _clampValuesAndUpdateScrollPosition:](self, "_clampValuesAndUpdateScrollPosition:", 1);
    -[CEKSlider _updateMagneticTickIndexes](self, "_updateMagneticTickIndexes");
  }
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[CEKSlider _titleLabel](self, "_titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CEKSlider _titleLabel](self, "_titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[CEKSlider _titleLabel](self, "_titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v8);

    -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMarkedValue:(double)a3
{
  -[CEKSlider setMarkedValue:animated:](self, "setMarkedValue:animated:", 0, a3);
}

- (void)setMarkedValue:(double)a3 animated:(BOOL)a4
{
  if (self->_markedValue != a3)
  {
    self->_markedValue = a3;
    -[CEKSlider _updateMarkedViewAnimated:](self, "_updateMarkedViewAnimated:", a4);
    -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_markedValueWithinRange
{
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;
  double v9;

  -[CEKSlider minimumValue](self, "minimumValue");
  v4 = v3;
  -[CEKSlider markedValue](self, "markedValue");
  if (v4 > v5)
    return 0;
  -[CEKSlider markedValue](self, "markedValue");
  v8 = v7;
  -[CEKSlider maximumValue](self, "maximumValue");
  return v8 <= v9;
}

- (void)_updateMarkedViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  CEKSliderDotView *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  CEKSliderDotView *v21;
  _QWORD v22[4];
  CEKSliderDotView *v23;
  double v24;

  v3 = a3;
  -[CEKSlider _dotView](self, "_dotView");
  v5 = (CEKSliderDotView *)objc_claimAutoreleasedReturnValue();
  v6 = -[CEKSlider _markedValueWithinRange](self, "_markedValueWithinRange");
  if (!v6 && !v5)
    return;
  -[CEKSlider markedValue](self, "markedValue");
  v8 = v7;
  -[CEKSlider value](self, "value");
  v10 = 0.0;
  if (v6)
  {
    v11 = v8 - v9;
    v12 = v11 >= 0.0 ? v11 : -v11;
    if (-[CEKSlider _isActive](self, "_isActive") || v12 > 0.01)
    {
      v13 = -[CEKSlider _isDimmed](self, "_isDimmed");
      if (v13 || v5)
      {
        if (v13)
          goto LABEL_14;
      }
      else
      {
        v5 = objc_alloc_init(CEKSliderDotView);
        -[CEKSlider tickMarksConfiguration](self, "tickMarksConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSliderDotView setUseLegibilityShadow:](v5, "setUseLegibilityShadow:", objc_msgSend(v14, "useTickMarkLegibilityShadows"));

        -[CEKSliderDotView setAlpha:](v5, "setAlpha:", 0.0);
        objc_storeStrong((id *)&self->__dotView, v5);
        -[CEKSlider _contentScrollView](self, "_contentScrollView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSlider _tickMarksView](self, "_tickMarksView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "insertSubview:aboveSubview:", v5, v16);

        -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
      }
      v10 = 1.0;
    }
  }
LABEL_14:
  if (!v3 || (-[CEKSliderDotView alpha](v5, "alpha"), v17 == v10))
  {
    -[CEKSliderDotView setAlpha:](v5, "setAlpha:", v10);
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0DC3F10];
    -[CEKSlider animationDuration](self, "animationDuration");
    v20 = v19;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __39__CEKSlider__updateMarkedViewAnimated___block_invoke;
    v22[3] = &unk_1E70A4E38;
    v23 = v5;
    v24 = v10;
    v21 = v5;
    objc_msgSend(v18, "animateWithDuration:animations:completion:", v22, 0, v20);

  }
}

uint64_t __39__CEKSlider__updateMarkedViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (CEKTickMarksConfiguration)tickMarksConfiguration
{
  void *v2;
  void *v3;

  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tickMarksModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CEKTickMarksConfiguration *)v3;
}

- (void)_updateLegibilityBackground
{
  double v3;
  UIView *v4;
  UIView *levelIndicatorBackgroundView;
  void *v6;
  UIView *v7;
  void *v8;
  id v9;

  v3 = 0.0;
  if (-[CEKSlider useTickMarkLegibilityShadows](self, "useTickMarkLegibilityShadows"))
  {
    v3 = 1.0;
    if (!self->__levelIndicatorBackgroundView)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      levelIndicatorBackgroundView = self->__levelIndicatorBackgroundView;
      self->__levelIndicatorBackgroundView = v4;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->__levelIndicatorBackgroundView, "setBackgroundColor:", v6);

      v7 = self->__levelIndicatorBackgroundView;
      -[CEKSlider _levelIndicatorView](self, "_levelIndicatorView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKSlider insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v7, v8);

    }
  }
  -[CEKSlider _levelIndicatorView](self, "_levelIndicatorView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v3);

}

- (void)setUseTickMarkLegibilityShadows:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[CEKSlider _dotView](self, "_dotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUseLegibilityShadow:", v3);

  -[CEKSlider tickMarksConfiguration](self, "tickMarksConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseTickMarkLegibilityShadows:", v3);

  -[CEKSlider _updateLegibilityBackground](self, "_updateLegibilityBackground");
}

- (BOOL)useTickMarkLegibilityShadows
{
  void *v2;
  char v3;

  -[CEKSlider tickMarksConfiguration](self, "tickMarksConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useTickMarkLegibilityShadows");

  return v3;
}

- (void)setTickMarkCount:(int64_t)a3
{
  void *v4;
  id v5;

  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tickMarksModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTickMarksCount:", a3);

}

- (int64_t)tickMarkCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tickMarksModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tickMarksCount");

  return v4;
}

- (void)setLogarithmic:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tickMarksModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLogarithmic:", v3);

}

- (BOOL)logarithmic
{
  void *v2;
  void *v3;
  char v4;

  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tickMarksModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "logarithmic");

  return v4;
}

- (void)setTickMarkSize:(CGSize)a3
{
  if (self->_tickMarkSize.width != a3.width || self->_tickMarkSize.height != a3.height)
  {
    self->_tickMarkSize = a3;
    -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_createGradientIfNeeded
{
  void *v3;
  CEKEdgeGradientView *v4;

  -[CEKSlider _edgeGradientView](self, "_edgeGradientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(CEKEdgeGradientView);
    -[CEKSlider _setEdgeGradientView:](self, "_setEdgeGradientView:", v4);

  }
}

- (void)setTransparentGradients
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CEKSlider _createGradientIfNeeded](self, "_createGradientIfNeeded");
  -[CEKSlider _edgeGradientView](self, "_edgeGradientView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEdgeGradientStyleBlack");
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", v3);

  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, v5);

}

- (void)setOpaqueGradientsWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CEKSlider _createGradientIfNeeded](self, "_createGradientIfNeeded");
  -[CEKSlider _edgeGradientView](self, "_edgeGradientView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomEdgeGradientStyleWithColor:", v4);

  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", 0);

  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v7, v6);

}

- (void)removeGradients
{
  void *v3;

  -[CEKSlider _edgeGradientView](self, "_edgeGradientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CEKSlider _setEdgeGradientView:](self, "_setEdgeGradientView:", 0);
}

- (void)setGradientInsets:(id)a3
{
  double var1;
  double var0;
  $EA4D17EC7EF19748977D62946CF719EB *p_gradientInsets;

  var1 = a3.var1;
  var0 = a3.var0;
  p_gradientInsets = &self->_gradientInsets;
  if (!CEKEdgeInsetsEqualToInsets(a3.var0, a3.var1, self->_gradientInsets.startInset, self->_gradientInsets.endInset))
  {
    p_gradientInsets->startInset = var0;
    p_gradientInsets->endInset = var1;
    -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  -[CEKSlider setEnabled:dimmed:animated:](self, "setEnabled:dimmed:animated:", a3, !a3, a4);
}

- (void)setEnabled:(BOOL)a3 dimmed:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (-[CEKSlider isEnabled](self, "isEnabled") != a3 || -[CEKSlider _isDimmed](self, "_isDimmed") != v6)
  {
    -[CEKSlider setEnabled:](self, "setEnabled:", v7);
    -[CEKSlider _setDimmed:animated:](self, "_setDimmed:animated:", v6, v5);
  }
}

- (void)_setDimmed:(BOOL)a3
{
  -[CEKSlider _setDimmed:animated:](self, "_setDimmed:animated:", a3, 0);
}

- (void)_setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__dimmed != a3)
  {
    self->__dimmed = a3;
    -[CEKSlider _updateEnableAppearanceStateAnimated:](self, "_updateEnableAppearanceStateAnimated:", a4);
  }
}

- (void)_updateEnableAppearanceStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD aBlock[5];
  BOOL v11;

  v3 = a3;
  v5 = -[CEKSlider _isDimmed](self, "_isDimmed");
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__CEKSlider__updateEnableAppearanceStateAnimated___block_invoke;
  aBlock[3] = &unk_1E70A52D8;
  aBlock[4] = self;
  v11 = v5;
  v7 = _Block_copy(aBlock);
  v8 = v7;
  if (v3)
  {
    -[CEKSlider _setAnimating:](self, "_setAnimating:", 1);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __50__CEKSlider__updateEnableAppearanceStateAnimated___block_invoke_2;
    v9[3] = &unk_1E70A4B88;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v8, v9, 0.25);
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }
  -[CEKSlider _updateMarkedViewAnimated:](self, "_updateMarkedViewAnimated:", v3);

}

void __50__CEKSlider__updateEnableAppearanceStateAnimated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  id v14;

  v2 = 0.33;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_levelIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "levelIndicatorHeight");
    v10 = v11;
  }
  objc_msgSend(*(id *)(a1 + 32), "_levelIndicatorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v10);

  if (*(_BYTE *)(a1 + 40))
    v13 = 0.0;
  else
    v13 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "_levelIndicatorView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v13);

}

uint64_t __50__CEKSlider__updateEnableAppearanceStateAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAnimating:", 0);
}

- (void)setMagneticRange:(id)a3
{
  CEKDiscreteFloatRange *v5;
  CEKDiscreteFloatRange *v6;

  v5 = (CEKDiscreteFloatRange *)a3;
  if (self->_magneticRange != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_magneticRange, a3);
    -[CEKSlider _updateMagneticTickIndexes](self, "_updateMagneticTickIndexes");
    v5 = v6;
  }

}

- (void)_updateMagneticTickIndexes
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[CEKSlider magneticRange](self, "magneticRange");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tickMarksModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v17, "valueAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      -[CEKSlider minimumValue](self, "minimumValue");
      v11 = v10;
      -[CEKSlider maximumValue](self, "maximumValue");
      objc_msgSend(v5, "xOffsetForNormalizedValue:", CEKProgress(v9, v11, v12));
      v14 = objc_msgSend(v5, "floorTickMarkIndexForXOffset:", v13 + 0.001);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        v15 = 0;
      else
        v15 = v14;
      objc_msgSend(v3, "addIndex:", v15);
      ++v6;
    }
    while (v6 < objc_msgSend(v17, "count"));
  }
  -[CEKSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMagneticTickMarkIndexes:", v3);

}

- (void)_resetSnapped
{
  -[CEKSlider _setSnapped:](self, "_setSnapped:", 0);
  -[CEKSlider _setSnappedOffset:](self, "_setSnappedOffset:", 0.0);
  -[CEKSlider _setUnsnappingProgress:](self, "_setUnsnappingProgress:", 0.0);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CEKSlider;
  -[CEKSlider tintColorDidChange](&v3, sel_tintColorDidChange);
  -[CEKSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[5];
  id v14;
  id v15;

  v3 = a3;
  if (-[CEKSlider _isActive](self, "_isActive"))
    -[CEKSlider tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CEKSlider _isActive](self, "_isActive")
    && -[CEKSlider valueLabelVisibility](self, "valueLabelVisibility") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__CEKSlider__updateColorsAnimated___block_invoke;
  aBlock[3] = &unk_1E70A5300;
  aBlock[4] = self;
  v8 = v5;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (v3)
  {
    v12 = (void *)MEMORY[0x1E0DC3F10];
    -[CEKSlider animationDuration](self, "animationDuration");
    objc_msgSend(v12, "animateWithDuration:animations:", v11);
  }
  else
  {
    (*((void (**)(void *))v10 + 2))(v10);
  }

}

void __35__CEKSlider__updateColorsAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_levelIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_valueLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

}

- (void)_setActive:(BOOL)a3
{
  -[CEKSlider _setActive:animated:](self, "_setActive:animated:", a3, 0);
}

- (void)_setActive:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  if (self->__active != a3)
  {
    v4 = a4;
    v5 = a3;
    self->__active = a3;
    if (-[CEKSlider valueLabelVisibility](self, "valueLabelVisibility") == 1)
      -[CEKSlider _setShowValueLabel:animated:](self, "_setShowValueLabel:animated:", v5, v4);
    -[CEKSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", v4);
    -[CEKSlider _updateMarkedViewAnimated:](self, "_updateMarkedViewAnimated:", v4);
  }
}

- (double)_xOffsetForMarkedValue
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[CEKSlider markedValue](self, "markedValue");
  -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
  v4 = v3;
  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = v4 + v6;

  return v7;
}

- (double)xOffsetForValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double result;

  -[CEKSlider minimumValue](self, "minimumValue");
  v6 = v5;
  -[CEKSlider maximumValue](self, "maximumValue");
  v8 = CEKProgress(a3, v6, v7);
  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tickMarksModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "xOffsetForNormalizedValue:", v8);
  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInset");

  UIRoundToViewScale();
  return result;
}

- (void)_updateScrollViewPosition
{
  double v3;
  double v4;
  double v5;
  id v6;

  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CEKSlider value](self, "value");
  -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
  v5 = v4;
  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentOffset:animated:", 0, v5, v3);

}

- (void)_setValue:(double)a3 shouldSendActions:(BOOL)a4 shouldUpdateScrollPosition:(BOOL)a5
{
  _BOOL4 v5;

  if (self->_value != a3)
  {
    v5 = a4;
    self->_value = a3;
    -[CEKSlider _clampValuesAndUpdateScrollPosition:](self, "_clampValuesAndUpdateScrollPosition:", a5);
    -[CEKSlider _updateMarkedViewAnimated:](self, "_updateMarkedViewAnimated:", 1);
    -[CEKSlider _updateValueLabel](self, "_updateValueLabel");
    if (v5)
      -[CEKSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (double)_valueForScrollViewXOffset:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = v6;
  v8 = (v6 + a3) / CEKScrollableDistanceInScrollView(v5);
  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tickMarksModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CEKSlider magneticRange](self, "magneticRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider minimumValue](self, "minimumValue");
  v13 = v12;
  -[CEKSlider maximumValue](self, "maximumValue");
  v15 = v14;
  objc_msgSend(v10, "absoluteValueForNormalizedValue:inAbsoluteRangeSize:", v8, v14 - v13);
  v17 = v13 + v16;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "valueAtIndex:", objc_msgSend(v11, "indexOfValueClosestToValue:", v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(v10, "xOffsetForNormalizedValue:", CEKProgress(v20, v13, v15));
    v22 = v21 - v7;
    v23 = CEKPixelWidthForView(self) * 0.5;
    if (vabdd_f64(v22, a3) > v23)
    {
      objc_msgSend(v10, "xOffsetForNormalizedValue:", 1.0);
      v20 = v17;
      if (v24 - v7 - a3 < v23)
      {
        -[CEKSlider maximumValue](self, "maximumValue");
        v20 = v25;
      }
    }
  }
  else
  {
    v20 = v17;
  }

  return v20;
}

- (void)setValueLabelVisibility:(int64_t)a3
{
  _BOOL8 v4;

  if (self->_valueLabelVisibility != a3)
  {
    self->_valueLabelVisibility = a3;
    if (a3 == 2)
      v4 = 1;
    else
      v4 = a3 == 1 && -[CEKSlider _isActive](self, "_isActive");
    -[CEKSlider _setShowValueLabel:animated:](self, "_setShowValueLabel:animated:", v4, 0);
  }
}

- (void)_setShowValueLabel:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  UILabel *v12;
  void *v13;
  UILabel *valueLabel;
  UILabel *v15;
  void *v16;
  _QWORD v17[6];

  v4 = a4;
  v5 = a3;
  v7 = 0.0;
  if (a3)
  {
    -[CEKSlider _valueLabel](self, "_valueLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 1.0;
    if (!v8)
    {
      v11 = objc_alloc(MEMORY[0x1E0DC3990]);
      v12 = (UILabel *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[UILabel setTextAlignment:](v12, "setTextAlignment:", 1);
      -[UILabel setLineBreakMode:](v12, "setLineBreakMode:", 4);
      -[UILabel setNumberOfLines:](v12, "setNumberOfLines:", 1);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      valueLabel = self->__valueLabel;
      self->__valueLabel = v12;
      v15 = v12;

      -[CEKSlider addSubview:](self, "addSubview:", self->__valueLabel);
      -[CEKSlider _updateFonts](self, "_updateFonts");
      if (v4)
        goto LABEL_4;
LABEL_9:
      -[CEKSlider _valueLabel](self, "_valueLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAlpha:", v7);

      goto LABEL_10;
    }
  }
  if (!v4)
    goto LABEL_9;
LABEL_4:
  if (v5)
    v9 = 0x10000;
  else
    v9 = 0x20000;
  v10 = (void *)MEMORY[0x1E0DC3F10];
  -[CEKSlider animationDuration](self, "animationDuration");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__CEKSlider__setShowValueLabel_animated___block_invoke;
  v17[3] = &unk_1E70A4E38;
  v17[4] = self;
  *(double *)&v17[5] = v7;
  objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", v9, v17, 0);
LABEL_10:
  -[CEKSlider _updateColorsAnimated:](self, "_updateColorsAnimated:", v4);
  -[CEKSlider _updateValueLabel](self, "_updateValueLabel");
  -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
}

void __41__CEKSlider__setShowValueLabel_animated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_valueLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_updateValueLabel
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[CEKSlider _valueLabel](self, "_valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4;

  if (v5 <= 0.0)
  {
    -[CEKSlider _valueLabel](self, "_valueLabel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedText:", 0);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[CEKSlider value](self, "value");
    objc_msgSend(v6, "numberWithDouble:", v7 * 100.0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CEKSlider formattedIntegerStringFromNumber:](self, "formattedIntegerStringFromNumber:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKSlider _valueLabel](self, "_valueLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedText:", v8);

  }
}

- (void)setFontStyle:(unint64_t)a3
{
  if (self->_fontStyle != a3)
  {
    self->_fontStyle = a3;
    -[CEKSlider _updateFonts](self, "_updateFonts");
  }
}

- (void)_updateFonts
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[CEKSlider fontStyle](self, "fontStyle");
  CEKFontOfSizeAndStyle(v3, 14.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider _titleLabel](self, "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  CEKMonospacedStylisticNumeralFontOfSizeAndStyle(v3, 14.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKSlider _valueLabel](self, "_valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

}

- (void)setSelectionFeedbackProfile:(int64_t)a3
{
  id v4;

  -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProfile:", a3);

}

- (int64_t)selectionFeedbackProfile
{
  void *v2;
  int64_t v3;

  -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "profile");

  return v3;
}

- (void)setTextOrientation:(int64_t)a3
{
  -[CEKSlider setTextOrientation:animated:](self, "setTextOrientation:animated:", a3, 0);
}

- (void)setTextOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_textOrientation != a3)
  {
    if (a4)
    {
      -[CEKSlider layoutIfNeeded](self, "layoutIfNeeded");
      self->_textOrientation = a3;
      -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __41__CEKSlider_setTextOrientation_animated___block_invoke;
      v6[3] = &unk_1E70A4B18;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v6, 0, 0.25, 0.0);
    }
    else
    {
      self->_textOrientation = a3;
      -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __41__CEKSlider_setTextOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (int64_t)titleAlignment
{
  void *v2;
  int64_t v3;

  -[CEKSlider _titleLabel](self, "_titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textAlignment");

  return v3;
}

- (void)setTitleAlignment:(int64_t)a3
{
  id v4;

  -[CEKSlider _titleLabel](self, "_titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", a3);

}

- (void)setSliderVerticalOffset:(double)a3
{
  if (self->_sliderVerticalOffset != a3)
  {
    self->_sliderVerticalOffset = a3;
    -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLabelVerticalPadding:(double)a3
{
  if (self->_labelVerticalPadding != a3)
  {
    self->_labelVerticalPadding = a3;
    -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSliderVerticalAlignment:(int64_t)a3
{
  if (self->_sliderVerticalAlignment != a3)
  {
    self->_sliderVerticalAlignment = a3;
    -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLevelIndicatorHeight:(double)a3
{
  if (self->_levelIndicatorHeight != a3)
  {
    self->_levelIndicatorHeight = a3;
    -[CEKSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)frameForTitleLabel
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
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CEKSlider _titleLabel](self, "_titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)frameForValueLabel
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
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CEKSlider _valueLabel](self, "_valueLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)frameForLevelIndicator
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
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CEKSlider _levelIndicatorView](self, "_levelIndicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)frameForTicksView
{
  void *v3;
  void *v4;
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
  CGRect result;

  -[CEKSlider _contentScrollView](self, "_contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "convertRect:toView:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int64_t v29;
  int64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  _BOOL8 v41;
  void *v42;
  int v43;
  uint64_t v44;
  double v45;
  double v46;

  v4 = a3;
  -[CEKSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider bounds](self, "bounds");
  -[CEKSlider convertRect:toView:](self, "convertRect:toView:", v5);
  objc_msgSend(v5, "setVisibleBounds:");
  if (-[CEKSlider _isreAdjustingOffsets](self, "_isreAdjustingOffsets"))
    goto LABEL_32;
  objc_msgSend(v4, "contentOffset");
  v45 = v6;
  v46 = v7;
  if (self->_delegateFlags.respondsToWillUpdateValue)
  {
    objc_msgSend(v4, "panGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "velocityInView:", self);
    v10 = v9;

    -[CEKSlider delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "slider:willUpdateValue:withVelocity:", self, &v45, v10);

    -[CEKSlider set_reAdjustingOffsets:](self, "set_reAdjustingOffsets:", 1);
    objc_msgSend(v4, "setContentOffset:", v45, v46);
    -[CEKSlider set_reAdjustingOffsets:](self, "set_reAdjustingOffsets:", 0);
  }
  v12 = -[CEKSlider _isExternallyScrolling](self, "_isExternallyScrolling")
     || -[CEKSlider _isScrollExternallyAnimating](self, "_isScrollExternallyAnimating");
  if ((objc_msgSend(v4, "isTracking") & 1) != 0)
  {
    v13 = 1;
LABEL_10:
    objc_msgSend(v4, "contentOffset");
    -[CEKSlider _valueForScrollViewXOffset:](self, "_valueForScrollViewXOffset:");
    v14 = 1;
    -[CEKSlider _setValue:shouldSendActions:shouldUpdateScrollPosition:](self, "_setValue:shouldSendActions:shouldUpdateScrollPosition:", 1, 0);
    goto LABEL_12;
  }
  v13 = objc_msgSend(v4, "isDecelerating");
  if ((v13 | v12) == 1)
    goto LABEL_10;
  v14 = 0;
  v13 = 0;
LABEL_12:
  if (self->_delegateFlags.respondsToDidScroll)
  {
    -[CEKSlider delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sliderDidScroll:", self);

  }
  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tickMarksModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CEKSlider value](self, "value");
  v19 = v18;
  -[CEKSlider minimumValue](self, "minimumValue");
  v21 = v20;
  -[CEKSlider maximumValue](self, "maximumValue");
  objc_msgSend(v17, "xOffsetForNormalizedValue:", CEKProgress(v19, v21, v22));
  v24 = v23;
  -[CEKSlider _tickMarksView](self, "_tickMarksView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "tickMarksModel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "floorTickMarkIndexForXOffset:", v24 + 0.001);

  if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_26;
  if (-[CEKSlider _tickMarkIndex](self, "_tickMarkIndex") == v27)
    goto LABEL_26;
  -[CEKSlider _setTickMarkIndex:](self, "_setTickMarkIndex:", v27);
  -[CEKSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSelectedTickMarkIndex:animated:", v27, 1);

  if (!v14)
    goto LABEL_26;
  v29 = -[CEKSlider feedbackScope](self, "feedbackScope");
  if ((unint64_t)(v29 - 1) > 1)
    goto LABEL_26;
  v30 = v29;
  v44 = objc_msgSend(v17, "tickMarksCount");
  v43 = objc_msgSend(v17, "isMainTickMarkAtIndex:", v27);
  -[CEKSlider _dynamicTickMarksView](self, "_dynamicTickMarksView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "magneticTickMarkIndexes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "containsIndex:", v27);

  if (!v27 || v27 == v44 - 1)
  {
    -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "performFeedback");

    -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "playEndTickSound");
    goto LABEL_25;
  }
  if ((v43 | v33) == 1)
  {
    -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "performFeedback");

    -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "playMajorTickSound");
LABEL_25:

    goto LABEL_26;
  }
  if (v30 == 2)
  {
    -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "performFeedback");

    -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "playMinorTickSound");
    goto LABEL_25;
  }
LABEL_26:
  objc_msgSend(v4, "contentInset");
  v39 = v38;
  v40 = CEKScrollableDistanceInScrollView(v4) - v38;
  v41 = v45 > v40 + 20.0 || v45 < -20.0 - v39;
  -[CEKSlider _setOverscrolling:](self, "_setOverscrolling:", v41);
  if (v13)
  {
    -[CEKSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "invalidate");

    -[CEKSlider _setExternalScrollOffsetAnimator:](self, "_setExternalScrollOffsetAnimator:", 0);
    -[CEKSlider contactEndedWithAction:](self, "contactEndedWithAction:", 0);
    -[CEKSlider _resetSnapped](self, "_resetSnapped");
  }

LABEL_32:
}

- (void)_setOverscrolling:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  id v6;

  if (self->__overscrolling != a3)
  {
    v3 = a3;
    self->__overscrolling = a3;
    v5 = -[CEKSlider feedbackScope](self, "feedbackScope");
    if (v3)
    {
      if (v5)
      {
        -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "playOverscrollTickSound");

      }
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  id v5;

  -[CEKSlider _feedbackGenerator](self, "_feedbackGenerator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareFeedback");

  -[CEKSlider _setActive:animated:](self, "_setActive:animated:", 1, 1);
  if (self->_delegateFlags.respondsToWillBeginScrolling)
  {
    -[CEKSlider delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sliderWillBeginScrolling:", self);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;

  if (self->_delegateFlags.respondsToWillEndScrolling)
  {
    y = a4.y;
    x = a4.x;
    -[CEKSlider delegate](self, "delegate", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sliderWillEndScrolling:withVelocity:targetContentOffset:", self, a5, x, y);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[CEKSlider _sliderDidEndScrolling](self, "_sliderDidEndScrolling", a3);
}

- (void)_sliderDidEndScrolling
{
  id v3;

  -[CEKSlider _setActive:animated:](self, "_setActive:animated:", 0, 1);
  if (self->_delegateFlags.respondsToDidEndScrolling)
  {
    -[CEKSlider delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sliderDidEndScrolling:", self);

  }
}

- (CEKSliderPositionDriver)_sliderDriver
{
  CEKSliderPositionDriver *sliderDriver;
  CEKSliderPositionDriver *v4;
  CEKSliderPositionDriver *v5;

  sliderDriver = self->__sliderDriver;
  if (!sliderDriver)
  {
    CEKDefaultSliderPositionDriver();
    v4 = (CEKSliderPositionDriver *)objc_claimAutoreleasedReturnValue();
    v5 = self->__sliderDriver;
    self->__sliderDriver = v4;

    sliderDriver = self->__sliderDriver;
  }
  return sliderDriver;
}

- (void)contactBeganWithAction:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  if (!-[CEKSlider _isExternalScrollingAllowed](self, "_isExternalScrollingAllowed"))
  {
    -[CEKSlider _setExternalScrollingAllowed:](self, "_setExternalScrollingAllowed:", 1);
    -[CEKSlider _setExternalOverScroll:](self, "_setExternalOverScroll:", 0.0);
    -[CEKSlider _sliderDriver](self, "_sliderDriver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactBeganWithAction:", v8);

    -[CEKSlider _contentScrollView](self, "_contentScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    objc_msgSend(v5, "setContentOffset:animated:", 0);
    -[CEKSlider _applyExternalTarget:mode:](self, "_applyExternalTarget:mode:", 2, v7);

  }
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
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
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  BOOL v41;
  BOOL v42;
  double v43;
  double v44;
  double v45;
  char v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  double v57;
  uint64_t v58;

  v4 = a3;
  if (-[CEKSlider _isExternalScrollingAllowed](self, "_isExternalScrollingAllowed"))
  {
    -[CEKSlider _contentScrollView](self, "_contentScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CEKSlider _isExternallyScrolling](self, "_isExternallyScrolling"))
    {
      -[CEKSlider _setExternallyScrolling:](self, "_setExternallyScrolling:", 1);
      -[CEKSlider scrollViewWillBeginDragging:](self, "scrollViewWillBeginDragging:", v5);
    }
    -[CEKSlider _createExternalScrollAnimatorIfNeeded](self, "_createExternalScrollAnimatorIfNeeded");
    -[CEKSlider _sliderDriver](self, "_sliderDriver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "distanceTraveled");
    v8 = v7;
    objc_msgSend(v6, "contactUpdatedWithAction:", v4);
    objc_msgSend(v6, "distanceTraveled");
    v10 = v9 - v8;
    -[CEKSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v13 = v12;

    v14 = v10 + v13;
    -[CEKSlider minimumValue](self, "minimumValue");
    -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
    v16 = v15;
    -[CEKSlider maximumValue](self, "maximumValue");
    -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
    v18 = v17;
    -[CEKSlider _externalOverScroll](self, "_externalOverScroll");
    if (v10 + v13 <= v18)
    {
      v20 = 0.0;
      if (v14 >= v16)
        goto LABEL_13;
      if (v19 == 0.0)
        v20 = v14 - v16;
      else
        v20 = v10 + v19;
    }
    else if (v19 == 0.0)
    {
      v20 = v14 - v18;
    }
    else
    {
      v20 = v10 + v19;
    }
    -[CEKSlider bounds](self, "bounds");
    v55 = v16;
    LOBYTE(v56) = 1;
    *(_DWORD *)((char *)&v56 + 1) = 0;
    HIDWORD(v56) = 0;
    v57 = v18;
    LOBYTE(v58) = 1;
    *(_DWORD *)((char *)&v58 + 1) = 0;
    HIDWORD(v58) = 0;
    BSUIConstrainValueToIntervalWithRubberBand();
    v14 = v21;
LABEL_13:
    -[CEKSlider _setExternalOverScroll:](self, "_setExternalOverScroll:", v20, *(_QWORD *)&v55, v56, *(_QWORD *)&v57, v58);
    if (-[CEKSlider _snapped](self, "_snapped"))
    {
      -[CEKSlider _unsnappingProgress](self, "_unsnappingProgress");
      if (v22 > 0.0 && v10 < 0.0 || v22 < 0.0 && v10 > 0.0)
        v22 = 0.0;
      if (fabs(v10 + v22) <= 10.0)
      {
        -[CEKSlider _setUnsnappingProgress:](self, "_setUnsnappingProgress:");
        -[CEKSlider _snappedOffset](self, "_snappedOffset");
        v32 = v44;
      }
      else
      {
        -[CEKSlider _snappedOffset](self, "_snappedOffset");
        -[CEKSlider _valueForScrollViewXOffset:](self, "_valueForScrollViewXOffset:");
        v23 = os_log_create("com.apple.camera", "CameraEditKit");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[CEKSlider contactUpdatedWithAction:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

        -[CEKSlider _snappedOffset](self, "_snappedOffset");
        v32 = v10 + v31;
        -[CEKSlider _resetSnapped](self, "_resetSnapped");
      }
      goto LABEL_35;
    }
    -[CEKSlider magneticRange](self, "magneticRange");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_32;
    -[CEKSlider value](self, "value");
    v34 = objc_msgSend(v33, "indexOfValueClosestToValue:");
    if (v34 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_32;
    objc_msgSend(v33, "valueAtIndex:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    v37 = v36;

    -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:", v37);
    -[CEKSlider traitCollection](self, "traitCollection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "displayScale");
    UIRoundToScale();
    v32 = v39;

    v41 = 0;
    if (v10 > 0.0 && v13 < v32)
    {
      v40 = v14 + 0.3;
      v41 = v14 + 0.3 >= v32;
    }
    v42 = 1;
    if (v10 < 0.0 && v13 > v32)
    {
      v40 = v14 + -0.3;
      v42 = v14 + -0.3 > v32;
    }
    -[CEKSlider minimumValue](self, "minimumValue", v40);
    if (v37 == v43)
      goto LABEL_32;
    -[CEKSlider maximumValue](self, "maximumValue");
    if (v41)
    {
      if (v37 != v45)
      {
LABEL_44:
        v47 = os_log_create("com.apple.camera", "CameraEditKit");
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          -[CEKSlider contactUpdatedWithAction:].cold.2(v47, v48, v49, v50, v51, v52, v53, v54);

        -[CEKSlider _setSnappedOffset:](self, "_setSnappedOffset:", v32);
        -[CEKSlider _setUnsnappingProgress:](self, "_setUnsnappingProgress:", dbl_1B9877DA0[v10 > 0.0] + v14 - v32);
        -[CEKSlider _setSnapped:](self, "_setSnapped:", 1);
        goto LABEL_33;
      }
    }
    else
    {
      v46 = v37 == v45 || v42;
      if ((v46 & 1) == 0)
        goto LABEL_44;
    }
LABEL_32:
    v32 = v14;
LABEL_33:

LABEL_35:
    -[CEKSlider _applyExternalTarget:mode:](self, "_applyExternalTarget:mode:", 5, v32);

  }
}

- (void)contactEndedWithAction:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
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
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  _QWORD v58[5];
  uint8_t buf[4];
  double v60;
  __int16 v61;
  double v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CEKSlider _isExternalScrollingAllowed](self, "_isExternalScrollingAllowed"))
    goto LABEL_27;
  -[CEKSlider _resetSnapped](self, "_resetSnapped");
  -[CEKSlider _setExternalScrollingAllowed:](self, "_setExternalScrollingAllowed:", 0);
  -[CEKSlider _setExternallyScrolling:](self, "_setExternallyScrolling:", 0);
  -[CEKSlider _sliderDriver](self, "_sliderDriver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactEndedWithAction:", v4);
  objc_msgSend(v5, "velocity");
  v7 = v6;
  objc_msgSend(v5, "distanceToDecelerate");
  v9 = v8;
  -[CEKSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v12 = v11;

  -[CEKSlider traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  UIRoundToScale();
  v15 = v14;

  -[CEKSlider minimumValue](self, "minimumValue");
  -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
  v17 = v16;
  -[CEKSlider maximumValue](self, "maximumValue");
  -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
  v19 = v18;
  v20 = fmax(v17, fmin(v18, v15));
  -[CEKSlider magneticRange](self, "magneticRange");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[CEKSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "value");
    -[CEKSlider _valueForScrollViewXOffset:](self, "_valueForScrollViewXOffset:");
    v24 = v23;

    v25 = objc_msgSend(v21, "indexOfValueClosestToValue:", v24);
    v26 = objc_msgSend(v21, "indexOfValueGreaterThanValue:", v24);
    v27 = objc_msgSend(v21, "indexOfValueLessThanValue:", v24);
    if (v20 != v12 || v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v7 <= 20.0 || v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v7 >= -20.0 || v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v35 = os_log_create("com.apple.camera", "CameraEditKit");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            -[CEKSlider contactEndedWithAction:].cold.1(v35, v50, v51, v52, v53, v54, v55, v56);
          goto LABEL_22;
        }
        objc_msgSend(v21, "valueAtIndex:", v27);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "doubleValue");
        v31 = v46;

        -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:", v31);
        -[CEKSlider traitCollection](self, "traitCollection");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "displayScale");
        UIRoundToScale();
        v49 = v48;

        v20 = fmax(v17, fmin(v19, v49));
        v35 = os_log_create("com.apple.camera", "CameraEditKit");
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          goto LABEL_22;
      }
      else
      {
        objc_msgSend(v21, "valueAtIndex:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v31 = v30;

        -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:", v31);
        -[CEKSlider traitCollection](self, "traitCollection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "displayScale");
        UIRoundToScale();
        v34 = v33;

        v20 = fmax(v17, fmin(v19, v34));
        v35 = os_log_create("com.apple.camera", "CameraEditKit");
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          goto LABEL_22;
      }
      *(_DWORD *)buf = 134218496;
      v60 = v24;
      v61 = 2048;
      v62 = v31;
      v63 = 2048;
      v64 = v7;
      v42 = "ScrollDiagnostic: Decelerating from %.3f to magnetic value %.3f with velocity %.3f";
      v43 = v35;
      v44 = 32;
      goto LABEL_19;
    }
    objc_msgSend(v21, "valueAtIndex:", v25);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValue");
    v38 = v37;

    if (vabdd_f64(v38, v24) < 0.1)
    {
      -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:", v38);
      -[CEKSlider traitCollection](self, "traitCollection");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "displayScale");
      UIRoundToScale();
      v41 = v40;

      v20 = fmax(v17, fmin(v19, v41));
      v35 = os_log_create("com.apple.camera", "CameraEditKit");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        v60 = v24;
        v61 = 2048;
        v62 = v38;
        v63 = 2048;
        v64 = v9;
        v65 = 2048;
        v66 = v7;
        v42 = "ScrollDiagnostic: Decelerating from %.3f to magnetic value %.3f due to proximity and deceleration %.3f (velocity %.3f)";
        v43 = v35;
        v44 = 42;
LABEL_19:
        _os_log_debug_impl(&dword_1B9835000, v43, OS_LOG_TYPE_DEBUG, v42, buf, v44);
      }
LABEL_22:

    }
  }
  if (v20 == v12)
  {
    -[CEKSlider _sliderDidEndScrolling](self, "_sliderDidEndScrolling");
  }
  else
  {
    -[CEKSlider _contentScrollView](self, "_contentScrollView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKSlider scrollViewDidEndDragging:willDecelerate:](self, "scrollViewDidEndDragging:willDecelerate:", v57, 1);

    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __36__CEKSlider_contactEndedWithAction___block_invoke;
    v58[3] = &unk_1E70A4ED8;
    v58[4] = self;
    -[CEKSlider _applyExternalTarget:mode:completion:](self, "_applyExternalTarget:mode:completion:", 3, v58, v20);
  }

LABEL_27:
}

uint64_t __36__CEKSlider_contactEndedWithAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isScrollExternallyAnimating");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_isExternalScrollingAllowed");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "_sliderDidEndScrolling");
  }
  return result;
}

- (CEKFluidBehaviorSettings)_externalScrollSettings
{
  CEKFluidBehaviorSettings *externalScrollSettings;
  CEKFluidBehaviorSettings *v4;
  CEKFluidBehaviorSettings *v5;

  externalScrollSettings = self->__externalScrollSettings;
  if (!externalScrollSettings)
  {
    v4 = objc_alloc_init(CEKFluidBehaviorSettings);
    v5 = self->__externalScrollSettings;
    self->__externalScrollSettings = v4;

    -[CEKFluidBehaviorSettings setDefaultCriticallyDampedValues](self->__externalScrollSettings, "setDefaultCriticallyDampedValues");
    -[CEKFluidBehaviorSettings setDampingRatio:](self->__externalScrollSettings, "setDampingRatio:", 1.0);
    -[CEKFluidBehaviorSettings setResponse:](self->__externalScrollSettings, "setResponse:", 0.4);
    externalScrollSettings = self->__externalScrollSettings;
  }
  return externalScrollSettings;
}

- (BOOL)_isScrollExternallyAnimating
{
  void *v2;
  char v3;

  -[CEKSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  objc_msgSend(v2, "value");
  v3 = BSFloatEqualToFloat() ^ 1;

  return v3;
}

- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4
{
  -[CEKSlider _applyExternalTarget:mode:completion:](self, "_applyExternalTarget:mode:completion:", a4, 0, a3);
}

- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v7 = a5;
  -[CEKSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v10 = v9;
  if (!v8 || (objc_msgSend(v8, "value"), v10 != v11))
  {
    -[CEKSlider _createExternalScrollAnimatorIfNeeded](self, "_createExternalScrollAnimatorIfNeeded");
    v12 = (void *)MEMORY[0x1E0DC3F10];
    -[CEKSlider _externalScrollSettings](self, "_externalScrollSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__CEKSlider__applyExternalTarget_mode_completion___block_invoke;
    v14[3] = &unk_1E70A4E38;
    v14[4] = self;
    *(double *)&v14[5] = v10;
    objc_msgSend(v12, "cek_animateWithSettings:mode:animations:completion:", v13, a4, v14, v7);

  }
}

void __50__CEKSlider__applyExternalTarget_mode_completion___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_externalScrollOffsetAnimator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:", v1);

}

- (void)_createExternalScrollAnimatorIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[CEKSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
    -[CEKSlider _setExternalScrollOffsetAnimator:](self, "_setExternalScrollOffsetAnimator:", v4);
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v16[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __50__CEKSlider__createExternalScrollAnimatorIfNeeded__block_invoke;
    v13 = &unk_1E70A4F00;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v6, &v10);

    -[CEKSlider _contentScrollView](self, "_contentScrollView", v10, v11, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentOffset");
    v9 = v8;

    objc_msgSend(v4, "setValue:", v9);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __50__CEKSlider__createExternalScrollAnimatorIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleExternalScrollAnimated");

}

- (void)_handleExternalScrollAnimated
{
  void *v3;
  id v4;

  -[CEKSlider _externalScrollOffsetAnimator](self, "_externalScrollOffsetAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CEKSlider _contentScrollView](self, "_contentScrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentOffset");
    objc_msgSend(v4, "presentationValue");
    objc_msgSend(v3, "setContentOffset:");

  }
}

- (double)labelVerticalPadding
{
  return self->_labelVerticalPadding;
}

- (BOOL)interactiveWhenHidden
{
  return self->_interactiveWhenHidden;
}

- (void)setInteractiveWhenHidden:(BOOL)a3
{
  self->_interactiveWhenHidden = a3;
}

- (int64_t)sliderVerticalAlignment
{
  return self->_sliderVerticalAlignment;
}

- (double)sliderVerticalOffset
{
  return self->_sliderVerticalOffset;
}

- (double)levelIndicatorHeight
{
  return self->_levelIndicatorHeight;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets
{
  double startInset;
  double endInset;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  startInset = self->_gradientInsets.startInset;
  endInset = self->_gradientInsets.endInset;
  result.var1 = endInset;
  result.var0 = startInset;
  return result;
}

- (int64_t)textOrientation
{
  return self->_textOrientation;
}

- (unint64_t)fontStyle
{
  return self->_fontStyle;
}

- (int64_t)feedbackScope
{
  return self->_feedbackScope;
}

- (void)setFeedbackScope:(int64_t)a3
{
  self->_feedbackScope = a3;
}

- (CEKSliderDelegate)delegate
{
  return (CEKSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)value
{
  return self->_value;
}

- (double)defaultValue
{
  return self->_defaultValue;
}

- (double)markedValue
{
  return self->_markedValue;
}

- (CEKDiscreteFloatRange)magneticRange
{
  return self->_magneticRange;
}

- (CGSize)tickMarkSize
{
  double width;
  double height;
  CGSize result;

  width = self->_tickMarkSize.width;
  height = self->_tickMarkSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)valueLabelVisibility
{
  return self->_valueLabelVisibility;
}

- (UIScrollView)_contentScrollView
{
  return self->__contentScrollView;
}

- (CEKTickMarksContainer)_tickMarksView
{
  return self->__tickMarksView;
}

- (CEKDynamicTickMarksView)_dynamicTickMarksView
{
  return self->__dynamicTickMarksView;
}

- (unint64_t)_ticksStyle
{
  return self->__ticksStyle;
}

- (UIView)_levelIndicatorView
{
  return self->__levelIndicatorView;
}

- (CEKSliderDotView)_dotView
{
  return self->__dotView;
}

- (CEKEdgeGradientView)_edgeGradientView
{
  return self->__edgeGradientView;
}

- (void)_setEdgeGradientView:(id)a3
{
  objc_storeStrong((id *)&self->__edgeGradientView, a3);
}

- (BOOL)_isAnimating
{
  return self->__animating;
}

- (void)_setAnimating:(BOOL)a3
{
  self->__animating = a3;
}

- (BOOL)_isOverscrolling
{
  return self->__overscrolling;
}

- (unint64_t)_tickMarkIndex
{
  return self->__tickMarkIndex;
}

- (void)_setTickMarkIndex:(unint64_t)a3
{
  self->__tickMarkIndex = a3;
}

- (CEKSelectionFeedbackGenerator)_feedbackGenerator
{
  return self->__feedbackGenerator;
}

- (BOOL)_isActive
{
  return self->__active;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)set_titleLabel:(id)a3
{
  objc_storeStrong((id *)&self->__titleLabel, a3);
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (void)set_valueLabel:(id)a3
{
  objc_storeStrong((id *)&self->__valueLabel, a3);
}

- (BOOL)_isreAdjustingOffsets
{
  return self->__reAdjustingOffsets;
}

- (void)set_reAdjustingOffsets:(BOOL)a3
{
  self->__reAdjustingOffsets = a3;
}

- (BOOL)_isDimmed
{
  return self->__dimmed;
}

- (UIView)_levelIndicatorBackgroundView
{
  return self->__levelIndicatorBackgroundView;
}

- (void)set_levelIndicatorBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->__levelIndicatorBackgroundView, a3);
}

- (BOOL)_isExternalScrollingAllowed
{
  return self->__externalScrollingAllowed;
}

- (void)_setExternalScrollingAllowed:(BOOL)a3
{
  self->__externalScrollingAllowed = a3;
}

- (BOOL)_isExternallyScrolling
{
  return self->__externallyScrolling;
}

- (void)_setExternallyScrolling:(BOOL)a3
{
  self->__externallyScrolling = a3;
}

- (double)_externalOverScroll
{
  return self->__externalOverScroll;
}

- (void)_setExternalOverScroll:(double)a3
{
  self->__externalOverScroll = a3;
}

- (UIViewFloatAnimatableProperty)_externalScrollOffsetAnimator
{
  return self->__externalScrollOffsetAnimator;
}

- (void)_setExternalScrollOffsetAnimator:(id)a3
{
  objc_storeStrong((id *)&self->__externalScrollOffsetAnimator, a3);
}

- (BOOL)_snapped
{
  return self->__snapped;
}

- (void)_setSnapped:(BOOL)a3
{
  self->__snapped = a3;
}

- (double)_snappedOffset
{
  return self->__snappedOffset;
}

- (void)_setSnappedOffset:(double)a3
{
  self->__snappedOffset = a3;
}

- (double)_unsnappingProgress
{
  return self->__unsnappingProgress;
}

- (void)_setUnsnappingProgress:(double)a3
{
  self->__unsnappingProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__externalScrollOffsetAnimator, 0);
  objc_storeStrong((id *)&self->__levelIndicatorBackgroundView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__feedbackGenerator, 0);
  objc_storeStrong((id *)&self->__edgeGradientView, 0);
  objc_storeStrong((id *)&self->__dotView, 0);
  objc_storeStrong((id *)&self->__levelIndicatorView, 0);
  objc_storeStrong((id *)&self->__dynamicTickMarksView, 0);
  objc_storeStrong((id *)&self->__tickMarksView, 0);
  objc_storeStrong((id *)&self->__contentScrollView, 0);
  objc_storeStrong((id *)&self->_magneticRange, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__externalScrollSettings, 0);
  objc_storeStrong((id *)&self->__sliderDriver, 0);
}

- (void)contactUpdatedWithAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9835000, a1, a3, "ScrollDiagnostic: Un-snapping while scrolling from magnetic value %.3f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)contactUpdatedWithAction:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9835000, a1, a3, "ScrollDiagnostic: Snapping while scrolling to magnetic value %.3f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)contactEndedWithAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9835000, a1, a3, "ScrollDiagnostic: Not decelerating to magnetic value (velocity %.3f)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
