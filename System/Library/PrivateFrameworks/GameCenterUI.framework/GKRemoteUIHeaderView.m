@implementation GKRemoteUIHeaderView

- (GKRemoteUIHeaderView)initWithAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  GKRemoteUIHeaderView *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  GKLabel *v21;
  GKLabel *textLabel;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  double v27;
  void *v28;
  void *v29;
  float v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  GKRemoteUIHeaderView *v36;
  objc_super v38;
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)GKRemoteUIHeaderView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[GKRemoteUIHeaderView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  if (v9)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GKLayoutStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GKApplyTheme"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    v14 = CFSTR("settingsHeader");
    if (v13)
      v14 = CFSTR("remoteUISectionHeader");
    v15 = (void *)MEMORY[0x1E0D25B28];
    v16 = v14;
    objc_msgSend(v15, "textStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headerStyle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "styleWithName:fallback:layoutMode:", v18, v16, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "lineBreakMode:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v5, v6, v7, v8);
    textLabel = v9->_textLabel;
    v9->_textLabel = v21;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("header"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLabel setText:](v9->_textLabel, "setText:", v23);

    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setNumberOfLines:](v9->_textLabel, "setNumberOfLines:", 0);
    if (v20)
      -[GKLabel applyTextStyle:](v9->_textLabel, "applyTextStyle:", v20);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headerHeight"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "floatValue");
      v27 = v26;
    }
    else
    {
      v27 = 45.0;
    }
    v9->_height = v27;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headerBottomMargin"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "floatValue");
      v31 = v30;
    }
    else
    {
      v31 = 10.0;
    }
    v9->_bottomMargin = v31;
    -[GKRemoteUIHeaderView addSubview:](v9, "addSubview:", v9->_textLabel);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_textLabel, 11, 0, v9, 4, 1.0, -v9->_bottomMargin);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_textLabel, 1, 0, v9, 1, 1.0, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_textLabel, 2, 0, v9, 2, 1.0, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v32;
    v39[1] = v33;
    v39[2] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKRemoteUIHeaderView addConstraints:](v9, "addConstraints:", v35);

    v36 = v9;
  }

  return v9;
}

- (void)setSectionIsFirst:(BOOL)a3
{
  if (self->_isFirstSection != a3)
    self->_isFirstSection = a3;
}

- (double)headerHeightForWidth:(double)a3 inTableView:(id)a4
{
  return self->_height + self->_bottomMargin;
}

- (BOOL)isFirstSection
{
  return self->_isFirstSection;
}

- (void)setIsFirstSection:(BOOL)a3
{
  self->_isFirstSection = a3;
}

- (GKLabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
