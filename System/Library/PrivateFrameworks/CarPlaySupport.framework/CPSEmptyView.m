@implementation CPSEmptyView

- (CPSEmptyView)initWithFrame:(CGRect)a3
{
  CPSAbridgableLabel *v3;
  CPSEmptyView *v5;
  id v6;
  double *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  CPSEmptyView *v32;
  CPSAbridgableLabel *v33;
  CPSAbridgableLabel *v34;
  objc_super v35;
  SEL v36;
  CPSEmptyView *v37;
  CGRect v38;
  _QWORD v39[7];

  v39[6] = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v36 = a2;
  v37 = 0;
  v35.receiver = self;
  v35.super_class = (Class)CPSEmptyView;
  v32 = -[CPSEmptyView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v37 = v32;
  objc_storeStrong((id *)&v37, v32);
  if (v32)
  {
    -[CPSEmptyView setTranslatesAutoresizingMaskIntoConstraints:](v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v3 = [CPSAbridgableLabel alloc];
    v7 = (double *)MEMORY[0x24BDBF090];
    v34 = -[CPSAbridgableLabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[CPSAbridgableLabel setTranslatesAutoresizingMaskIntoConstraints:](v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSAbridgableLabel setTextAlignment:](v34, "setTextAlignment:");
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[CPSAbridgableLabel setTextColor:](v34, "setTextColor:");

    -[CPSAbridgableLabel setNumberOfLines:](v34, "setNumberOfLines:", 1);
    -[CPSEmptyView addSubview:](v37, "addSubview:", v34);
    -[CPSEmptyView setTitleLabel:](v37, "setTitleLabel:", v34);
    v33 = -[CPSAbridgableLabel initWithFrame:]([CPSAbridgableLabel alloc], "initWithFrame:", *v7, v7[1], v7[2], v7[3]);
    -[CPSAbridgableLabel setTranslatesAutoresizingMaskIntoConstraints:](v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSAbridgableLabel setTextAlignment:](v33, "setTextAlignment:", 1);
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[CPSAbridgableLabel setTextColor:](v33, "setTextColor:");

    -[CPSAbridgableLabel setNumberOfLines:](v33, "setNumberOfLines:", 2);
    -[CPSEmptyView addSubview:](v37, "addSubview:", v33);
    -[CPSEmptyView setSubtitleLabel:](v37, "setSubtitleLabel:", v33);
    v9 = (void *)MEMORY[0x24BDD1628];
    v31 = (id)-[CPSAbridgableLabel topAnchor](v34, "topAnchor");
    v30 = (id)-[CPSEmptyView safeAreaLayoutGuide](v37, "safeAreaLayoutGuide");
    v29 = (id)objc_msgSend(v30, "topAnchor");
    v28 = (id)objc_msgSend(v31, "constraintEqualToAnchor:constant:", 5.0);
    v39[0] = v28;
    v27 = (id)-[CPSAbridgableLabel leftAnchor](v34, "leftAnchor");
    v26 = (id)-[CPSEmptyView safeAreaLayoutGuide](v37, "safeAreaLayoutGuide");
    v25 = (id)objc_msgSend(v26, "leftAnchor");
    v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:constant:", 12.0);
    v39[1] = v24;
    v23 = (id)-[CPSAbridgableLabel rightAnchor](v34, "rightAnchor");
    v22 = (id)-[CPSEmptyView safeAreaLayoutGuide](v37, "safeAreaLayoutGuide");
    v21 = (id)objc_msgSend(v22, "rightAnchor");
    v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", -12.0);
    v39[2] = v20;
    v19 = (id)-[CPSAbridgableLabel firstBaselineAnchor](v33, "firstBaselineAnchor");
    v18 = (id)-[CPSAbridgableLabel bottomAnchor](v34, "bottomAnchor");
    v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", 30.0);
    v39[3] = v17;
    v16 = (id)-[CPSAbridgableLabel leftAnchor](v33, "leftAnchor");
    v15 = (id)-[CPSAbridgableLabel leftAnchor](v34, "leftAnchor");
    v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
    v39[4] = v14;
    v13 = (id)-[CPSAbridgableLabel rightAnchor](v33, "rightAnchor");
    v12 = (id)-[CPSAbridgableLabel rightAnchor](v34, "rightAnchor");
    v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
    v39[5] = v11;
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 6);
    objc_msgSend(v9, "activateConstraints:");

    -[CPSEmptyView _updateLabelTraits](v37, "_updateLabelTraits");
    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong((id *)&v34, 0);
  }
  v5 = v37;
  objc_storeStrong((id *)&v37, 0);
  return v5;
}

- (void)setTitleVariants:(id)a3
{
  CPSAbridgableLabel *v3;
  id location[2];
  CPSEmptyView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSEmptyView titleLabel](v5, "titleLabel");
  -[CPSAbridgableLabel setTextVariants:](v3, "setTextVariants:", location[0]);

  objc_storeStrong(location, 0);
}

- (NSArray)titleVariants
{
  CPSAbridgableLabel *v3;
  NSArray *v4;

  v3 = -[CPSEmptyView titleLabel](self, "titleLabel");
  v4 = -[CPSAbridgableLabel textVariants](v3, "textVariants");

  return v4;
}

- (void)setSubtitleVariants:(id)a3
{
  CPSAbridgableLabel *v3;
  id location[2];
  CPSEmptyView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSEmptyView subtitleLabel](v5, "subtitleLabel");
  -[CPSAbridgableLabel setTextVariants:](v3, "setTextVariants:", location[0]);

  objc_storeStrong(location, 0);
}

- (NSArray)subtitleVariants
{
  CPSAbridgableLabel *v3;
  NSArray *v4;

  v3 = -[CPSEmptyView subtitleLabel](self, "subtitleLabel");
  v4 = -[CPSAbridgableLabel textVariants](v3, "textVariants");

  return v4;
}

- (void)_updateLabelTraits
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  CPSAbridgableLabel *v10;
  id v11;
  uint64_t v12;
  void *v13;
  CPSAbridgableLabel *v14;
  id v15;
  id v16;
  id v17;
  id v18[2];
  CPSEmptyView *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v19 = self;
  v18[1] = (id)a2;
  v5 = (void *)MEMORY[0x24BDF6A78];
  v4 = *MEMORY[0x24BDF7850];
  v6 = (id)-[CPSEmptyView traitCollection](self, "traitCollection");
  v18[0] = (id)objc_msgSend(v5, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v4);

  v22 = *MEMORY[0x24BDF78A0];
  v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
  v23[0] = v7;
  v17 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22);

  v8 = v18[0];
  v20 = *MEMORY[0x24BDF7770];
  v21 = v17;
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v2 = (id)objc_msgSend(v8, "fontDescriptorByAddingAttributes:");
  v3 = v18[0];
  v18[0] = v2;

  v11 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v18[0], 0.0);
  v10 = -[CPSEmptyView titleLabel](v19, "titleLabel");
  -[CPSAbridgableLabel setFont:](v10, "setFont:", v11);

  v13 = (void *)MEMORY[0x24BDF6A70];
  v12 = *MEMORY[0x24BDF77B8];
  v16 = (id)-[CPSEmptyView traitCollection](v19, "traitCollection");
  v15 = (id)objc_msgSend(v13, "preferredFontForTextStyle:compatibleWithTraitCollection:", v12);
  v14 = -[CPSEmptyView subtitleLabel](v19, "subtitleLabel");
  -[CPSAbridgableLabel setFont:](v14, "setFont:", v15);

  -[CPSEmptyView setNeedsDisplay](v19, "setNeedsDisplay");
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSEmptyView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSEmptyView;
  -[CPSEmptyView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSEmptyView _updateLabelTraits](v5, "_updateLabelTraits");
  objc_storeStrong(location, 0);
}

- (CPSAbridgableLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (CPSAbridgableLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
