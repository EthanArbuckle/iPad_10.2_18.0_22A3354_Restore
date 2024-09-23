@implementation MUExpandableBlurbView

- (MUExpandableBlurbView)initWithFrame:(CGRect)a3
{
  MUExpandableBlurbView *v3;
  MUExpandableBlurbView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUExpandableBlurbView;
  v3 = -[MUExpandableBlurbView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUExpandableBlurbView _setupLabel](v3, "_setupLabel");
    -[MUExpandableBlurbView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("ExpandableBlurb"));
  }
  return v4;
}

- (void)_setupLabel
{
  int64_t v3;
  double v4;
  MUExpandingLabel *v5;
  MUExpandingLabel *v6;
  MUExpandingLabel *expandingLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MUExpandingLabel *v12;
  MUEdgeLayout *v13;
  MUExpandingLabel *v14;
  void *v15;
  MUEdgeLayout *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[MUExpandableBlurbView setInsetsLayoutMarginsFromSafeArea:](self, "setInsetsLayoutMarginsFromSafeArea:", 0);
  v3 = +[MUInfoCardStyle containerStyle](MUInfoCardStyle, "containerStyle");
  v4 = 16.0;
  if (v3 == 1)
    v4 = 0.0;
  -[MUExpandableBlurbView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v4, 16.0, v4, 16.0);
  v5 = [MUExpandingLabel alloc];
  v6 = -[MUExpandingLabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  expandingLabel = self->_expandingLabel;
  self->_expandingLabel = v6;

  -[MUExpandingLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_expandingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setFont:](self->_expandingLabel, "setFont:", v8);

  +[MUInfoCardStyle textColor](MUInfoCardStyle, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setTextColor:](self->_expandingLabel, "setTextColor:", v9);

  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setShowMoreTextColor:](self->_expandingLabel, "setShowMoreTextColor:", v10);

  _MULocalizedStringFromThisBundle(CFSTR("More [See All Blurb View]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setShowMoreText:](self->_expandingLabel, "setShowMoreText:", v11);

  -[MUExpandingLabel setNumberOfLinesWhenCollapsed:](self->_expandingLabel, "setNumberOfLinesWhenCollapsed:", 5);
  objc_initWeak(&location, self);
  v12 = self->_expandingLabel;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __36__MUExpandableBlurbView__setupLabel__block_invoke;
  v23 = &unk_1E2E01DA8;
  objc_copyWeak(&v24, &location);
  -[MUExpandingLabel setLabelResizedBlock:](v12, "setLabelResizedBlock:", &v20);
  -[MUExpandableBlurbView addSubview:](self, "addSubview:", self->_expandingLabel, v20, v21, v22, v23);
  v13 = [MUEdgeLayout alloc];
  v14 = self->_expandingLabel;
  -[MUExpandableBlurbView layoutMarginsGuide](self, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MUEdgeLayout initWithItem:container:](v13, "initWithItem:container:", v14, v15);

  v17 = (void *)MEMORY[0x1E0CB3718];
  v26[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_mapsui_activateLayouts:", v18);

  -[UIView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, sel__expand);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __36__MUExpandableBlurbView__setupLabel__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  char v3;
  char v4;
  void *v5;
  void (**v6)(void);
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v3 = objc_msgSend(WeakRetained[52], "isExpanded");
    v2 = v7;
    if ((v3 & 1) != 0 || (v4 = objc_msgSend(v7[52], "isShowingExpanded"), v2 = v7, (v4 & 1) == 0))
    {
      objc_msgSend(v2, "resizeBlock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v7;
      if (v5)
      {
        objc_msgSend(v7, "resizeBlock");
        v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v6[2]();

        v2 = v7;
      }
    }
  }

}

- (void)setNumberOfLinesWhenCollapsed:(unint64_t)a3
{
  -[MUExpandingLabel setNumberOfLinesWhenCollapsed:](self->_expandingLabel, "setNumberOfLinesWhenCollapsed:", a3);
}

- (void)setText:(id)a3
{
  -[MUExpandingLabel setText:](self->_expandingLabel, "setText:", a3);
}

- (NSString)text
{
  return -[MUExpandingLabel text](self->_expandingLabel, "text");
}

- (void)_contentSizeDidChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setFont:](self->_expandingLabel, "setFont:", v3);

}

- (void)_expand
{
  void (**moreAction)(id);

  moreAction = (void (**)(id))self->_moreAction;
  if (moreAction)
    moreAction[2](self->_moreAction);
  else
    -[MUExpandingLabel setExpanded:](self->_expandingLabel, "setExpanded:", 1);
}

- (void)infoCardThemeChanged
{
  id v3;

  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setShowMoreTextColor:](self->_expandingLabel, "setShowMoreTextColor:", v3);

}

- (id)moreAction
{
  return self->_moreAction;
}

- (void)setMoreAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (id)resizeBlock
{
  return self->_resizeBlock;
}

- (void)setResizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resizeBlock, 0);
  objc_storeStrong(&self->_moreAction, 0);
  objc_storeStrong((id *)&self->_expandingLabel, 0);
}

@end
