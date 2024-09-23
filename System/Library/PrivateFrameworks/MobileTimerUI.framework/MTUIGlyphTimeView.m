@implementation MTUIGlyphTimeView

- (MTUIGlyphTimeView)initWithFont:(id)a3 textColor:(id)a4 glyphName:(id)a5 style:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  MTUIGlyphTimeView *v13;
  MTUIGlyphTimeView *v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTUIGlyphTimeView;
  v13 = -[MTUIGlyphTimeView init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[MTUIGlyphTimeView setGlyphName:](v13, "setGlyphName:", v12);
    -[MTUIGlyphTimeView setStyle:](v14, "setStyle:", a6);
    -[MTUIGlyphTimeView setupTimeLabelWithFont:textColor:style:](v14, "setupTimeLabelWithFont:textColor:style:", v10, v11, a6);
    objc_msgSend(v10, "capHeight");
    -[MTUIGlyphTimeView setupGlyphName:size:glyphColor:](v14, "setupGlyphName:size:glyphColor:", v12, v11, v15 * 1.2);
    -[MTUIGlyphTimeView setupConstraints](v14, "setupConstraints");
  }

  return v14;
}

- (void)setupTimeLabelWithFont:(id)a3 textColor:(id)a4 style:(unint64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;

  v8 = (objc_class *)MEMORY[0x24BDF6B68];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  -[MTUIGlyphTimeView setTimeLabel:](self, "setTimeLabel:", v11);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v9);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShadowColor:", v16);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v10);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextAlignment:", 1);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBaselineAdjustment:", 1);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLineBreakMode:", 2);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAdjustsFontSizeToFitWidth:", 1);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView addSubview:](self, "addSubview:", v23);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAdjustsFontForContentSizeCategory:", 1);

  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v26 = *MEMORY[0x24BDF7678];
    -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setMaximumContentSizeCategory:", v26);

  }
}

- (void)setupGlyphName:(id)a3 size:(double)a4 glyphColor:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDF6AC8], "mtui_imageWithSymbolName:pointSize:color:", a3, a5, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v9);
  -[MTUIGlyphTimeView setGlyphImageView:](self, "setGlyphImageView:", v6);

  -[MTUIGlyphTimeView glyphImageView](self, "glyphImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView addSubview:](self, "addSubview:", v7);

  -[MTUIGlyphTimeView glyphImageView](self, "glyphImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)setupConstraints
{
  void *v3;
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
  unint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = (id)objc_opt_new();
  -[MTUIGlyphTimeView glyphImageView](self, "glyphImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView leadingAnchor](self, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v6);

  -[MTUIGlyphTimeView glyphImageView](self, "glyphImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView centerYAnchor](self, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v10);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView glyphImageView](self, "glyphImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MTUIGlyphTimeView style](self, "style");
  v16 = 2.0;
  if (v15 == 1)
    v16 = 5.0;
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v17);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView topAnchor](self, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v21);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView bottomAnchor](self, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v25);

  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView trailingAnchor](self, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v29);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v30);
}

- (void)setComponentColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v4 = a3;
  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)MEMORY[0x24BDF6AC8];
  -[MTUIGlyphTimeView glyphName](self, "glyphName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIGlyphTimeView timeLabel](self, "timeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "capHeight");
  objc_msgSend(v6, "mtui_imageWithSymbolName:pointSize:color:", v7, v4, v10 * 1.2);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[MTUIGlyphTimeView glyphImageView](self, "glyphImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v12);

}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setGlyphImageView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphImageView, a3);
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (void)setGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_glyphName, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end
