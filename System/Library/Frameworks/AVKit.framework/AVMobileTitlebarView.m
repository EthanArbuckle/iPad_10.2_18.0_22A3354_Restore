@implementation AVMobileTitlebarView

- (AVMobileTitlebarView)initWithStyleSheet:(id)a3
{
  id v5;
  AVMobileTitlebarView *v6;
  AVMobileTitlebarView *v7;
  CAGradientLayer *v8;
  CAGradientLayer *contentContainerViewMask;
  UIView *v10;
  UIView *contentContainerView;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVMobileTitlebarView;
  v6 = -[AVView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_showsContentTag = 1;
    v6->_showsSubtitle = 1;
    v6->_showsTitle = 1;
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    v8 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    contentContainerViewMask = v7->_contentContainerViewMask;
    v7->_contentContainerViewMask = v8;

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentContainerView = v7->_contentContainerView;
    v7->_contentContainerView = v10;

    -[UIView setAutoresizingMask:](v7->_contentContainerView, "setAutoresizingMask:", 0);
    -[UIView layer](v7->_contentContainerView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMask:", v7->_contentContainerViewMask);

    -[AVMobileTitlebarView addSubview:](v7, "addSubview:", v7->_contentContainerView);
    -[AVView setIgnoresTouches:](v7, "setIgnoresTouches:", 1);
  }

  return v7;
}

- (void)setContentTag:(id)a3
{
  AVMobileContentTag *v5;
  AVMobileContentTag **p_contentTag;
  void *v7;
  AVMobileContentTag *v8;
  AVMobileContentTagView *v9;
  AVMobileContentTagView *contentTagView;
  AVMobileContentTag *v11;

  v5 = (AVMobileContentTag *)a3;
  p_contentTag = &self->_contentTag;
  if (self->_contentTag != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_contentTag, a3);
    if (*p_contentTag)
    {
      if (!self->_contentTagView)
      {
        -[AVMobileTitlebarView window](self, "window");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = *p_contentTag;

          if (v8)
          {
            v9 = -[AVMobileContentTagView initWithContentTag:withStyleSheet:]([AVMobileContentTagView alloc], "initWithContentTag:withStyleSheet:", *p_contentTag, self->_styleSheet);
            contentTagView = self->_contentTagView;
            self->_contentTagView = v9;

            -[AVMobileContentTagView setHidden:](self->_contentTagView, "setHidden:", 1);
            -[AVMobileContentTagView setAutoresizingMask:](self->_contentTagView, "setAutoresizingMask:", 0);
            -[UIView addSubview:](self->_contentContainerView, "addSubview:", self->_contentTagView);
          }
        }
      }
      -[AVMobileContentTagView setContentTag:](self->_contentTagView, "setContentTag:", *p_contentTag);
    }
    -[AVMobileTitlebarView setNeedsLayout](self, "setNeedsLayout");
    v5 = v11;
  }

}

- (void)setShowsInfoAffordance:(BOOL)a3
{
  if (self->_showsInfoAffordance != a3)
  {
    self->_showsInfoAffordance = a3;
    -[AVMobileTitlebarView _setUpInfoAffordanceIfNeeded]((uint64_t)self);
    -[AVMobileTitlebarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStyleSheet:(id)a3
{
  AVMobileChromelessControlsStyleSheet *v5;
  AVMobileChromelessControlsStyleSheet *v6;

  v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  if (self->_styleSheet != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_styleSheet, a3);
    -[AVMobileTitlebarView _updateFonts]((uint64_t)self);
    -[AVMobileTitlebarView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setSubtitle:(id)a3
{
  NSAttributedString **p_subtitle;
  NSMutableAttributedString *v6;
  NSMutableAttributedString *subtitleLabelString;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableAttributedString *v12;
  id v13;

  p_subtitle = &self->_subtitle;
  v13 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](*p_subtitle, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    v6 = (NSMutableAttributedString *)-[NSAttributedString mutableCopy](*p_subtitle, "mutableCopy");
    subtitleLabelString = self->_subtitleLabelString;
    self->_subtitleLabelString = v6;

    -[NSMutableAttributedString mutableString](self->_subtitleLabelString, "mutableString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableAttributedString string](self->_subtitleLabelString, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setString:", v11);

    if (!-[NSMutableAttributedString length](self->_subtitleLabelString, "length"))
    {
      v12 = self->_subtitleLabelString;
      self->_subtitleLabelString = 0;

    }
    -[AVMobileTitlebarView _setUpSubtitleLabelIfNeeded]((uint64_t)self);
    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", self->_subtitleLabelString);
    -[AVMobileTitlebarView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitle:(id)a3
{
  NSAttributedString **p_title;
  NSMutableAttributedString *v6;
  NSMutableAttributedString *titleLabelString;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableAttributedString *v12;
  id v13;

  p_title = &self->_title;
  v13 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](*p_title, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    v6 = (NSMutableAttributedString *)-[NSAttributedString mutableCopy](*p_title, "mutableCopy");
    titleLabelString = self->_titleLabelString;
    self->_titleLabelString = v6;

    -[NSMutableAttributedString mutableString](self->_titleLabelString, "mutableString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableAttributedString string](self->_titleLabelString, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setString:", v11);

    if (!-[NSMutableAttributedString length](self->_titleLabelString, "length"))
    {
      v12 = self->_titleLabelString;
      self->_titleLabelString = 0;

    }
    -[AVMobileTitlebarView _setUpTitleLabelIfNeeded]((uint64_t)self);
    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", self->_titleLabelString);
    -[AVMobileTitlebarView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (double)titleLabelCenterYOffset
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGRect v9;

  -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[AVMobileTitlebarView intrinsicContentSize](self, "intrinsicContentSize");
  v9.origin.y = v7 - v6;
  v9.origin.x = 0.0;
  v9.size.width = v4;
  v9.size.height = v6;
  return CGRectGetMidY(v9);
}

- (void)didMoveToWindow
{
  -[AVMobileTitlebarView _setUpTitleLabelIfNeeded]((uint64_t)self);
  -[AVMobileTitlebarView _setUpSubtitleLabelIfNeeded]((uint64_t)self);
  -[AVMobileTitlebarView _setUpInfoAffordanceIfNeeded]((uint64_t)self);
  -[AVMobileTitlebarView _updateFonts]((uint64_t)self);
}

- (CGSize)intrinsicContentSize
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
  AVMobileContentTag *contentTag;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  -[AVMobileContentTagView intrinsicContentSize](self->_contentTagView, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;
  -[UILabel intrinsicContentSize](self->_subtitleLabel, "intrinsicContentSize");
  v12 = v11;
  v14 = v13;
  -[AVButton intrinsicContentSize](self->_infoAffordance, "intrinsicContentSize");
  v16 = v15;
  v18 = v17;
  contentTag = self->_contentTag;
  if (contentTag && !-[AVMobileContentTag placement](contentTag, "placement"))
  {
    if (v14 < v6)
      v14 = v6;
    if (v12 <= 0.0)
      v12 = v4 + v12;
    else
      v12 = v4 + v12 + 5.0;
  }
  if (v12 >= v8)
    v8 = v12;
  if (v10 <= 0.0 || v14 <= 0.0)
    v21 = v10 + v14;
  else
    v21 = v10 + v14 + 2.0;
  if (self->_contentTagView)
  {
    v22 = -[AVMobileContentTag placement](self->_contentTag, "placement");
    v23 = v21 >= v6 ? v21 : v6;
    if (v22 == 1)
    {
      v21 = v23;
      v8 = v4 + 5.0 + 2.0 + v8;
    }
  }
  if (self->_titleLabelString || self->_subtitleLabelString || self->_contentTag)
  {
    if (v21 >= v18)
      v24 = v21;
    else
      v24 = v18;
    if (self->_showsInfoAffordance)
    {
      v21 = v24;
      v8 = v16 + 4.0 + v8;
    }
  }
  v25 = v8;
  v26 = v21;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  unint64_t v14;
  AVMobileContentTagView *contentTagView;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  int v21;
  double v22;
  char v23;
  double v24;
  double v25;
  double v26;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  int v38;
  char v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  float v61;
  double v62;
  void *v63;
  void *v64;
  unint64_t v65;
  double v66;
  NSObject *v67;
  double v68;
  unint64_t v69;
  NSObject *v70;
  unint64_t v71;
  unint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  unsigned int v84;
  double v85;
  unsigned int v86;
  double v87;
  objc_super v88;
  __int128 buf;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v88.receiver = self;
  v88.super_class = (Class)AVMobileTitlebarView;
  -[AVView layoutSubviews](&v88, sel_layoutSubviews);
  -[AVMobileTitlebarView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v3;
  v8 = -[AVMobileTitlebarView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = -[AVMobileTitlebarView showsContentTag](self, "showsContentTag");
  v12 = -[AVMobileTitlebarView showsSubtitle](self, "showsSubtitle");
  v13 = -[AVMobileTitlebarView showsTitle](self, "showsTitle");
  v14 = 0x1EEC7D000uLL;
  if (v11 && self->_contentTag && (contentTagView = self->_contentTagView) != 0)
  {
    -[AVMobileContentTagView intrinsicContentSize](contentTagView, "intrinsicContentSize");
    v18 = v16;
    v19 = v17;
    v20 = v17 > v6;
    if (v16 <= v4 + -15.0)
    {
      if (v17 <= v6)
      {
        v82 = v16 + 5.0;
        v69 = -[AVMobileContentTag placement](self->_contentTag, "placement");
        if (v69)
        {
          if (v69 == 1)
          {
            v20 = 0;
            v21 = 0;
            v7 = v4 - (v82 + 2.0);
            v22 = v7;
            v87 = 0.0;
            v82 = v82 + 2.0;
            v83 = v82;
            v78 = v19;
            goto LABEL_7;
          }
          _AVLog();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            v72 = -[AVMobileContentTag placement](self->_contentTag, "placement");
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v72;
            _os_log_error_impl(&dword_1AC4B1000, v70, OS_LOG_TYPE_ERROR, "Error: Unrecognized content tag placement - %ld", (uint8_t *)&buf, 0xCu);
          }

        }
        v78 = 0.0;
        v20 = 0;
        v21 = 0;
        v22 = v4 - v82;
        v83 = 0.0;
        v87 = v19;
        goto LABEL_7;
      }
      v78 = 0.0;
      v21 = 0;
      v20 = 1;
    }
    else
    {
      v78 = 0.0;
      v21 = 1;
    }
    v82 = 0.0;
    v83 = 0.0;
    v22 = v7;
    v87 = 0.0;
  }
  else
  {
    v78 = 0.0;
    v20 = 0;
    v21 = 0;
    v82 = 0.0;
    v83 = 0.0;
    v22 = v7;
    v87 = 0.0;
    v19 = v10;
    v18 = v9;
  }
LABEL_7:
  if (v12 && (!self->_subtitleLabelString ? (v23 = 1) : (v23 = v21), (v23 & 1) == 0))
  {
    -[UILabel intrinsicContentSize](self->_subtitleLabel, "intrinsicContentSize");
    v25 = v87;
    if (v87 >= v24)
      v26 = v87;
    else
      v26 = v24;
    v74 = v24;
    if (v24 <= v6 && v22 >= 30.0)
      v25 = v26;
    v87 = v25;
  }
  else
  {
    v74 = v10;
  }
  v86 = !v11;
  v84 = !v12;
  v80 = v19;
  v77 = v4;
  v75 = v18;
  if (v13)
  {
    if (self->_titleLabelString)
      v28 = v20;
    else
      v28 = 1;
    v29 = v10;
    v30 = v9;
    if (((v21 | v28) & 1) == 0)
    {
      -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize", v9);
      v29 = v31;
    }
    v73 = v30;
    v85 = 2.0;
    if (self->_showsInfoAffordance)
    {
      -[AVButton intrinsicContentSize](self->_infoAffordance, "intrinsicContentSize");
      v10 = v32;
      v76 = v33;
      v34 = v33 + 4.0;
      v35 = v22 - v34;
      v36 = v7 - v34;
      v37 = v10 <= v6;
      if (v35 < 30.0)
        v37 = 0;
      v38 = v37 && v36 >= 30.0;
      if (v38)
      {
        v7 = v36;
        v22 = v35;
      }
      v81 = v22;
      v39 = v38 ^ 1;
    }
    else
    {
      v81 = v22;
      v76 = v9;
      v39 = 1;
    }
  }
  else
  {
    v81 = v22;
    v40 = 30.0;
    v39 = 1;
    v85 = 0.0;
    v76 = v9;
    v73 = v9;
    v29 = v10;
    v41 = 1;
    v42 = 1;
    v43 = 0.0;
    v44 = 0.0;
    v45 = 0.0;
    if (!v11 && !v12)
    {
      if (v11)
        goto LABEL_62;
      goto LABEL_72;
    }
  }
  v46 = 0.0;
  v47 = v10;
  if ((v84 & v86) != 0)
    v48 = 0.0;
  else
    v48 = v85;
  v49 = v48 + v87 + v29;
  if (v82 + v81 >= v83 + v7)
    v50 = v82 + v81;
  else
    v50 = v83 + v7;
  if (v78 >= v49)
    v49 = v78;
  v79 = v47;
  if (v49 >= v47)
    v43 = v49;
  else
    v43 = v47;
  v85 = v6 - v43;
  v51 = v8;
  -[UIView avkit_setFrame:inLayoutDirection:](self->_contentContainerView, "avkit_setFrame:inLayoutDirection:", v8, 0.0, *(_QWORD *)&v73);
  v52 = -[AVMobileTitlebarView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v53, "CGColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v55, "CGColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self->_contentContainerView, "bounds");
  v58 = v57;
  v60 = v59;
  v61 = 15.0 / v57;
  v62 = v61;
  if (v52)
  {
    *(_QWORD *)&buf = v56;
    v63 = v54;
  }
  else
  {
    v46 = 1.0 - v62;
    *(_QWORD *)&buf = v54;
    v63 = v56;
    v62 = 1.0;
  }
  *((_QWORD *)&buf + 1) = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CAGradientLayer setStartPoint:](self->_contentContainerViewMask, "setStartPoint:", v46, 0.5);
  -[CAGradientLayer setEndPoint:](self->_contentContainerViewMask, "setEndPoint:", v62, 0.5);
  -[CAGradientLayer setColors:](self->_contentContainerViewMask, "setColors:", v64);
  -[CAGradientLayer setFrame:](self->_contentContainerViewMask, "setFrame:", 0.0, 0.0, v58, v60);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  v45 = v43 - v87 - v48;
  v44 = v43 - v29;
  if (v13)
  {
    v8 = v51;
    v10 = v79;
    if (((v12 | v86) & 1) == 0 && -[AVMobileContentTag placement](self->_contentTag, "placement") == 1)
      v44 = v44 + (v80 - v29) * -0.5;
    v14 = 0x1EEC7D000;
    v45 = v45 - v29;
  }
  else
  {
    v8 = v51;
    v10 = v79;
    if (v11 && -[AVMobileContentTag placement](self->_contentTag, "placement") == 1)
      v45 = (v80 - v87) * 0.5 + v43 - v80;
    v14 = 0x1EEC7D000uLL;
  }
  v41 = !v13;
  v42 = 0;
  v40 = v50 + 30.0;
  if (v11)
  {
LABEL_62:
    v65 = -[AVMobileContentTag placement](self->_contentTag, "placement", *(_QWORD *)&v73);
    if (v65)
    {
      if (v65 == 1)
      {
        v66 = v43 - v80 + (v43 - v80) * -0.25;
        if (((v41 | v84) & 1) != 0)
          v66 = v43 - v80;
        goto LABEL_71;
      }
      _AVLog();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v71 = -[AVMobileContentTag placement](self->_contentTag, "placement");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v71;
        _os_log_error_impl(&dword_1AC4B1000, v67, OS_LOG_TYPE_ERROR, "Error: Unrecognized content tag placement - %ld", (uint8_t *)&buf, 0xCu);
      }

    }
    v66 = (v87 - v80) * 0.5 + v45;
LABEL_71:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v14 + 1396)), "avkit_setFrame:inLayoutDirection:", v8, 0.0, v66, v75);
  }
LABEL_72:
  if (v12)
  {
    -[UILabel setPreferredMaxLayoutWidth:](self->_subtitleLabel, "setPreferredMaxLayoutWidth:", v81);
    -[UILabel avkit_setFrame:inLayoutDirection:](self->_subtitleLabel, "avkit_setFrame:inLayoutDirection:", v8, v82, (v87 - v74) * 0.5 + v45, v40);
  }
  if (v13)
    -[UILabel avkit_setFrame:inLayoutDirection:](self->_titleLabel, "avkit_setFrame:inLayoutDirection:", v8, v83, v44, v40, v29);
  if ((v39 & 1) == 0)
  {
    v68 = v83 + v73 + 4.0;
    if (v68 >= v77 - v76)
      v68 = v77 - v76;
    -[UIView avkit_setFrame:inLayoutDirection:](self->_infoAffordance, "avkit_setFrame:inLayoutDirection:", v8, v68, v85 + v44 + (v10 - v29) * -0.5 + 1.0, v76, v10, *(_QWORD *)&v73);
  }
  -[UIView setHidden:](self->_contentContainerView, "setHidden:", v42, *(_QWORD *)&v73);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v14 + 1396)), "setHidden:", v86);
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", v84);
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", v41);
  -[AVButton setHidden:](self->_infoAffordance, "setHidden:", v39 & 1);
}

- (void)_infoAffordancePressed:(id)a3
{
  id v4;

  -[AVMobileTitlebarView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleBarViewInfoAffordanceWasPressed:", self);

}

- (AVMobileContentTag)contentTag
{
  return self->_contentTag;
}

- (BOOL)showsInfoAffordance
{
  return self->_showsInfoAffordance;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (AVMobileTitlebarViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (BOOL)showsTitle
{
  return self->_showsTitle;
}

- (void)setShowsTitle:(BOOL)a3
{
  self->_showsTitle = a3;
}

- (BOOL)showsSubtitle
{
  return self->_showsSubtitle;
}

- (void)setShowsSubtitle:(BOOL)a3
{
  self->_showsSubtitle = a3;
}

- (BOOL)showsContentTag
{
  return self->_showsContentTag;
}

- (void)setShowsContentTag:(BOOL)a3
{
  self->_showsContentTag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_contentTag, 0);
  objc_storeStrong((id *)&self->_subtitleLabelString, 0);
  objc_storeStrong((id *)&self->_titleLabelString, 0);
  objc_storeStrong((id *)&self->_infoAffordance, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentTagView, 0);
  objc_storeStrong((id *)&self->_contentContainerViewMask, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

- (void)_setUpTitleLabelIfNeeded
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 488))
    {
      objc_msgSend((id)a1, "window");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        v3 = *(_QWORD *)(a1 + 512);

        if (v3)
        {
          v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
          v5 = *(void **)(a1 + 488);
          *(_QWORD *)(a1 + 488) = v4;

          objc_msgSend(*(id *)(a1 + 488), "setAccessibilityIdentifier:", CFSTR("Title"));
          v6 = *(void **)(a1 + 488);
          AVLocalizedString(CFSTR("Title"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setAccessibilityLabel:", v7);

          objc_msgSend(*(id *)(a1 + 488), "setIsAccessibilityElement:", 1);
          objc_msgSend(*(id *)(a1 + 488), "setLineBreakMode:", 2);
          objc_msgSend(*(id *)(a1 + 488), "setAutoresizingMask:", 0);
          objc_msgSend(*(id *)(a1 + 488), "setHidden:", 1);
          objc_msgSend(*(id *)(a1 + 488), "setAttributedText:", *(_QWORD *)(a1 + 512));
          v8 = *(void **)(a1 + 488);
          objc_msgSend(*(id *)(a1 + 544), "titleFont");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setFont:", v9);

          v10 = *(void **)(a1 + 488);
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTextColor:", v11);

          objc_msgSend(*(id *)(a1 + 464), "addSubview:", *(_QWORD *)(a1 + 488));
        }
      }
    }
  }
}

- (void)_setUpSubtitleLabelIfNeeded
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 496))
    {
      objc_msgSend((id)a1, "window");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        v3 = *(_QWORD *)(a1 + 520);

        if (v3)
        {
          v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
          v5 = *(void **)(a1 + 496);
          *(_QWORD *)(a1 + 496) = v4;

          objc_msgSend(*(id *)(a1 + 496), "setAccessibilityIdentifier:", CFSTR("Sub-title"));
          v6 = *(void **)(a1 + 496);
          AVLocalizedString(CFSTR("Sub-title"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setAccessibilityLabel:", v7);

          objc_msgSend(*(id *)(a1 + 496), "setIsAccessibilityElement:", 1);
          objc_msgSend(*(id *)(a1 + 496), "setAutoresizingMask:", 0);
          objc_msgSend(*(id *)(a1 + 496), "setHidden:", 1);
          objc_msgSend(*(id *)(a1 + 496), "setAttributedText:", *(_QWORD *)(a1 + 520));
          v8 = *(void **)(a1 + 496);
          objc_msgSend(*(id *)(a1 + 544), "subtitleFont");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setFont:", v9);

          v10 = *(void **)(a1 + 496);
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTextColor:", v11);

          objc_msgSend(*(id *)(a1 + 496), "setNumberOfLines:", 2);
          objc_msgSend(*(id *)(a1 + 496), "setLineBreakMode:", 0);
          objc_msgSend(*(id *)(a1 + 464), "addSubview:", *(_QWORD *)(a1 + 496));
        }
      }
    }
  }
}

- (void)_setUpInfoAffordanceIfNeeded
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 504))
    {
      objc_msgSend((id)a1, "window");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        v3 = *(unsigned __int8 *)(a1 + 528);

        if (v3)
        {
          +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("More Info"), 1);
          v4 = objc_claimAutoreleasedReturnValue();
          v5 = *(void **)(a1 + 504);
          *(_QWORD *)(a1 + 504) = v4;

          objc_msgSend(*(id *)(a1 + 504), "setAutoresizingMask:", 0);
          v6 = *(void **)(a1 + 504);
          objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setTintColor:", v7);

          objc_msgSend(*(id *)(a1 + 504), "setHidden:", 1);
          v8 = *(void **)(a1 + 504);
          objc_msgSend(*(id *)(a1 + 544), "infoAffordanceButtonFont");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setInlineFont:", v9);

          objc_msgSend(*(id *)(a1 + 504), "setImageName:", CFSTR("chevron.right"));
          objc_msgSend(*(id *)(a1 + 504), "addTarget:action:forControlEvents:", a1, sel__infoAffordancePressed_, 64);
          objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 504));
        }
      }
    }
  }
}

- (void)_updateFonts
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    v2 = *(void **)(a1 + 488);
    objc_msgSend(*(id *)(a1 + 544), "titleFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFont:", v3);

    v4 = *(void **)(a1 + 496);
    objc_msgSend(*(id *)(a1 + 544), "subtitleFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

  }
}

@end
