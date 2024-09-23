@implementation HUActivityLoadingView

- (HUActivityLoadingView)initWithFrame:(CGRect)a3 activityIndicatorStyle:(int64_t)a4
{
  HUActivityLoadingView *v5;
  UILabel *v6;
  UILabel *textLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  UILabel *detailTextLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  uint64_t v22;
  UIActivityIndicatorView *activityIndicatorView;
  id v24;
  void *v25;
  uint64_t v26;
  UIStackView *titleSpinnerStackView;
  id v28;
  void *v29;
  uint64_t v30;
  UIStackView *mainStackView;
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
  objc_super v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)HUActivityLoadingView;
  v5 = -[HUActivityLoadingView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    textLabel = v5->_textLabel;
    v5->_textLabel = v6;

    v8 = v5->_textLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    v10 = v5->_textLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = v5->_textLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel setLineBreakMode:](v5->_textLabel, "setLineBreakMode:", 0);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    detailTextLabel = v5->_detailTextLabel;
    v5->_detailTextLabel = v14;

    v16 = v5->_detailTextLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16, "setFont:", v17);

    v18 = v5->_detailTextLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v18, "setBackgroundColor:", v19);

    v20 = v5->_detailTextLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    -[UILabel setNumberOfLines:](v5->_detailTextLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v5->_detailTextLabel, "setLineBreakMode:", 0);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", a4);
    activityIndicatorView = v5->_activityIndicatorView;
    v5->_activityIndicatorView = (UIActivityIndicatorView *)v22;

    -[UIActivityIndicatorView startAnimating](v5->_activityIndicatorView, "startAnimating");
    v24 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v45[0] = v5->_activityIndicatorView;
    v45[1] = v5->_textLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "initWithArrangedSubviews:", v25);
    titleSpinnerStackView = v5->_titleSpinnerStackView;
    v5->_titleSpinnerStackView = (UIStackView *)v26;

    -[UIStackView setAxis:](v5->_titleSpinnerStackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v5->_titleSpinnerStackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v5->_titleSpinnerStackView, "setSpacing:", 8.0);
    v28 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v44[0] = v5->_titleSpinnerStackView;
    v44[1] = v5->_detailTextLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "initWithArrangedSubviews:", v29);
    mainStackView = v5->_mainStackView;
    v5->_mainStackView = (UIStackView *)v30;

    -[UIStackView setAxis:](v5->_mainStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v5->_mainStackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v5->_mainStackView, "setSpacing:", 4.0);
    -[UIStackView setAutoresizingMask:](v5->_mainStackView, "setAutoresizingMask:", 18);
    -[HUActivityLoadingView addSubview:](v5, "addSubview:", v5->_mainStackView);
    -[HUActivityLoadingView mainStackView](v5, "mainStackView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUActivityLoadingView activityIndicatorView](v5, "activityIndicatorView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setActive:", 1);

    -[HUActivityLoadingView mainStackView](v5, "mainStackView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "widthAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUActivityLoadingView activityIndicatorView](v5, "activityIndicatorView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "widthAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    -[HUActivityLoadingView bounds](v5, "bounds");
    -[UIStackView setFrame:](v5->_mainStackView, "setFrame:");
    -[HUActivityLoadingView _watchLabelsForContentAndResizeIfNecessary](v5, "_watchLabelsForContentAndResizeIfNecessary");
  }
  return v5;
}

- (HUActivityLoadingView)initWithFrame:(CGRect)a3
{
  return -[HUActivityLoadingView initWithFrame:activityIndicatorStyle:](self, "initWithFrame:activityIndicatorStyle:", 100, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HUActivityLoadingView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v3;
  -[HUActivityLoadingView detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend((id)objc_opt_class(), "watchedKeyPaths");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v10, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

  v16.receiver = self;
  v16.super_class = (Class)HUActivityLoadingView;
  -[HUActivityLoadingView dealloc](&v16, sel_dealloc);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUActivityLoadingView mainStackView](self, "mainStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUActivityLoadingView mainStackView](self, "mainStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_watchLabelsForContentAndResizeIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HUActivityLoadingView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  -[HUActivityLoadingView detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend((id)objc_opt_class(), "watchedKeyPaths");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v17;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v17 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), 1, 0);
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HUActivityLoadingView textLabel](self, "textLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v11)
  {
    -[HUActivityLoadingView detailTextLabel](self, "detailTextLabel");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14 != v11)
    {

LABEL_8:
      v17.receiver = self;
      v17.super_class = (Class)HUActivityLoadingView;
      -[HUActivityLoadingView observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_9;
    }
  }
  objc_msgSend((id)objc_opt_class(), "watchedKeyPaths");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v10);

  if (v13 == v11)
  {
    if (!v16)
      goto LABEL_8;
  }
  else
  {

    if ((v16 & 1) == 0)
      goto LABEL_8;
  }
  objc_msgSend(v11, "invalidateIntrinsicContentSize");
  -[HUActivityLoadingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[HUActivityLoadingView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
LABEL_9:

}

+ (id)watchedKeyPaths
{
  if (_MergedGlobals_2_0 != -1)
    dispatch_once(&_MergedGlobals_2_0, &__block_literal_global_11_4);
  return (id)qword_1EF226B40;
}

void __40__HUActivityLoadingView_watchedKeyPaths__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("text"), CFSTR("attributedText"), CFSTR("font"), CFSTR("numberOfLines"), CFSTR("preferredMaxLayoutWidth"), CFSTR("adjustsFontSizeToFitWidth"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF226B40;
  qword_1EF226B40 = v0;

}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (UIStackView)titleSpinnerStackView
{
  return self->_titleSpinnerStackView;
}

- (UIStackView)mainStackView
{
  return self->_mainStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_titleSpinnerStackView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

@end
