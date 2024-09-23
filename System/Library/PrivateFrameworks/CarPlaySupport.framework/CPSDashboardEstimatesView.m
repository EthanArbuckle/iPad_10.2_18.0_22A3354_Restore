@implementation CPSDashboardEstimatesView

- (CPSDashboardEstimatesView)initWithFrame:(CGRect)a3
{
  CPSTravelEstimatesStringFormatter *v3;
  CPSTravelEstimatesStringFormatter *travelEstimatesStringFormatter;
  id v5;
  uint64_t v6;
  UILabel *etaLabel;
  uint64_t v8;
  UILabel *timeRemainingLabel;
  uint64_t v10;
  UILabel *distanceRemainingLabel;
  uint64_t v12;
  UIStackView *stackView;
  CPSDashboardEstimatesView *v15;
  UILabel *v16;
  id v17;
  UILabel *v18;
  id v19;
  UILabel *v20;
  id v21;
  double *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;
  SEL v36;
  CPSDashboardEstimatesView *v37;
  CGRect v38;
  _QWORD v39[4];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v36 = a2;
  v37 = 0;
  v35.receiver = self;
  v35.super_class = (Class)CPSDashboardEstimatesView;
  v37 = -[CPSDashboardEstimatesView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v37, v37);
  if (v37)
  {
    v3 = objc_alloc_init(CPSTravelEstimatesStringFormatter);
    travelEstimatesStringFormatter = v37->_travelEstimatesStringFormatter;
    v37->_travelEstimatesStringFormatter = v3;

    v34 = -[CPSDashboardEstimatesView _labelFont](v37, "_labelFont");
    v5 = objc_alloc(MEMORY[0x24BDF6B68]);
    v22 = (double *)MEMORY[0x24BDBF090];
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    etaLabel = v37->_etaLabel;
    v37->_etaLabel = (UILabel *)v6;

    v16 = v37->_etaLabel;
    v17 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[UILabel setTextColor:](v16, "setTextColor:");

    -[UILabel setFont:](v37->_etaLabel, "setFont:", v34);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v37->_etaLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", *v22, v22[1], v22[2], v22[3]);
    timeRemainingLabel = v37->_timeRemainingLabel;
    v37->_timeRemainingLabel = (UILabel *)v8;

    v18 = v37->_timeRemainingLabel;
    v19 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[UILabel setTextColor:](v18, "setTextColor:");

    -[UILabel setFont:](v37->_timeRemainingLabel, "setFont:", v34);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v37->_timeRemainingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", *v22, v22[1], v22[2], v22[3]);
    distanceRemainingLabel = v37->_distanceRemainingLabel;
    v37->_distanceRemainingLabel = (UILabel *)v10;

    v20 = v37->_distanceRemainingLabel;
    v21 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[UILabel setTextColor:](v20, "setTextColor:");

    -[UILabel setFont:](v37->_distanceRemainingLabel, "setFont:", v34);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v37->_distanceRemainingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", *v22, v22[1], v22[2], v22[3]);
    stackView = v37->_stackView;
    v37->_stackView = (UIStackView *)v12;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v37->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v37->_stackView, "setAxis:", 0);
    -[UIStackView setSpacing:](v37->_stackView, "setSpacing:", 12.0);
    -[CPSDashboardEstimatesView addSubview:](v37, "addSubview:", v37->_stackView);
    -[UIStackView addArrangedSubview:](v37->_stackView, "addArrangedSubview:", v37->_etaLabel);
    -[UIStackView addArrangedSubview:](v37->_stackView, "addArrangedSubview:", v37->_timeRemainingLabel);
    -[UIStackView addArrangedSubview:](v37->_stackView, "addArrangedSubview:", v37->_distanceRemainingLabel);
    v23 = (void *)MEMORY[0x24BDD1628];
    v33 = (id)-[CPSDashboardEstimatesView topAnchor](v37, "topAnchor");
    v32 = (id)-[UIStackView topAnchor](v37->_stackView, "topAnchor");
    v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
    v39[0] = v31;
    v30 = (id)-[CPSDashboardEstimatesView bottomAnchor](v37, "bottomAnchor");
    v29 = (id)-[UIStackView bottomAnchor](v37->_stackView, "bottomAnchor");
    v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
    v39[1] = v28;
    v27 = (id)-[CPSDashboardEstimatesView centerXAnchor](v37, "centerXAnchor");
    v26 = (id)-[UIStackView centerXAnchor](v37->_stackView, "centerXAnchor");
    v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
    v39[2] = v25;
    v24 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 3);
    objc_msgSend(v23, "activateConstraints:");

    objc_storeStrong(&v34, 0);
  }
  v15 = v37;
  objc_storeStrong((id *)&v37, 0);
  return v15;
}

- (void)traitCollectionDidChange:(id)a3
{
  UILabel *v3;
  UILabel *v4;
  UILabel *v5;
  id v6;
  objc_super v7;
  id location[2];
  CPSDashboardEstimatesView *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)CPSDashboardEstimatesView;
  -[CPSDashboardEstimatesView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, location[0]);
  v6 = -[CPSDashboardEstimatesView _labelFont](v9, "_labelFont");
  v3 = -[CPSDashboardEstimatesView etaLabel](v9, "etaLabel");
  -[UILabel setFont:](v3, "setFont:", v6);

  v4 = -[CPSDashboardEstimatesView timeRemainingLabel](v9, "timeRemainingLabel");
  -[UILabel setFont:](v4, "setFont:", v6);

  v5 = -[CPSDashboardEstimatesView distanceRemainingLabel](v9, "distanceRemainingLabel");
  -[UILabel setFont:](v5, "setFont:", v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  double v11;
  UILabel *v12;
  UILabel *v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  UILabel *v18;
  double v19;
  UILabel *v20;
  double v21;
  UILabel *v22;
  UILabel *v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  SEL v28;
  CPSDashboardEstimatesView *v29;

  v29 = self;
  v28 = a2;
  v27.receiver = self;
  v27.super_class = (Class)CPSDashboardEstimatesView;
  -[CPSDashboardEstimatesView layoutSubviews](&v27, sel_layoutSubviews);
  -[CPSDashboardEstimatesView bounds](v29, "bounds");
  v26 = v2;
  v13 = -[CPSDashboardEstimatesView etaLabel](v29, "etaLabel");
  -[UILabel setHidden:](v13, "setHidden:", 0);

  v14 = -[CPSDashboardEstimatesView timeRemainingLabel](v29, "timeRemainingLabel");
  -[UILabel setHidden:](v14, "setHidden:", 0);

  v15 = -[CPSDashboardEstimatesView distanceRemainingLabel](v29, "distanceRemainingLabel");
  -[UILabel setHidden:](v15, "setHidden:", 0);

  v16 = -[CPSDashboardEstimatesView etaLabel](v29, "etaLabel");
  -[UILabel sizeToFit](v16, "sizeToFit");

  v17 = -[CPSDashboardEstimatesView timeRemainingLabel](v29, "timeRemainingLabel");
  -[UILabel sizeToFit](v17, "sizeToFit");

  v18 = -[CPSDashboardEstimatesView distanceRemainingLabel](v29, "distanceRemainingLabel");
  -[UILabel sizeToFit](v18, "sizeToFit");

  v23 = -[CPSDashboardEstimatesView etaLabel](v29, "etaLabel");
  -[UILabel intrinsicContentSize](v23, "intrinsicContentSize");
  v19 = v3 + 12.0;
  v22 = -[CPSDashboardEstimatesView timeRemainingLabel](v29, "timeRemainingLabel");
  -[UILabel intrinsicContentSize](v22, "intrinsicContentSize");
  v21 = v19 + v4 + 12.0;
  v20 = -[CPSDashboardEstimatesView distanceRemainingLabel](v29, "distanceRemainingLabel");
  -[UILabel intrinsicContentSize](v20, "intrinsicContentSize");
  v24 = v21 + v5;

  v25 = v24;
  if (v24 > v26)
  {
    v9 = -[CPSDashboardEstimatesView distanceRemainingLabel](v29, "distanceRemainingLabel", v24);
    -[UILabel setHidden:](v9, "setHidden:", 1);

    v12 = -[CPSDashboardEstimatesView etaLabel](v29, "etaLabel");
    -[UILabel intrinsicContentSize](v12, "intrinsicContentSize");
    v11 = v6 + 12.0;
    v10 = -[CPSDashboardEstimatesView timeRemainingLabel](v29, "timeRemainingLabel");
    -[UILabel intrinsicContentSize](v10, "intrinsicContentSize");
    v25 = v11 + v7;

  }
  if (v25 > v26)
  {
    v8 = -[CPSDashboardEstimatesView timeRemainingLabel](v29, "timeRemainingLabel", v25);
    -[UILabel setHidden:](v8, "setHidden:", 1);

  }
}

- (void)updateTripEstimates:(id)a3
{
  CPSTravelEstimatesStringFormatter *v3;
  void *v4;
  id v5;
  id v6;
  UILabel *v7;
  void *v8;
  id v9;
  id v10;
  UILabel *v11;
  void *v12;
  id v13;
  id v14;
  UILabel *v15;
  UILabel *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location[2];
  CPSDashboardEstimatesView *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSDashboardEstimatesView travelEstimatesStringFormatter](v23, "travelEstimatesStringFormatter");
  v21 = -[CPSTravelEstimatesStringFormatter generateTravelEstimatesStringsForTravelEstimates:](v3, "generateTravelEstimatesStringsForTravelEstimates:", location[0]);

  v4 = (void *)MEMORY[0x24BDD17C8];
  v6 = (id)objc_msgSend(v21, "arrivalTimeString");
  v5 = CPSLocalizedStringForKey(CFSTR("ETA"));
  v20 = (id)objc_msgSend(v4, "stringWithFormat:", v6, v5);

  v7 = -[CPSDashboardEstimatesView etaLabel](v23, "etaLabel");
  -[UILabel setText:](v7, "setText:", v20);

  v8 = (void *)MEMORY[0x24BDD17C8];
  v10 = (id)objc_msgSend(v21, "timeRemainingString");
  v9 = (id)objc_msgSend(v21, "localizedTimeRemainingUnit");
  v19 = (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v10, v9);

  v11 = -[CPSDashboardEstimatesView timeRemainingLabel](v23, "timeRemainingLabel");
  -[UILabel setText:](v11, "setText:", v19);

  v12 = (void *)MEMORY[0x24BDD17C8];
  v14 = (id)objc_msgSend(v21, "distanceRemainingString");
  v13 = (id)objc_msgSend(v21, "localizedDistanceRemainingUnit");
  v18 = (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@"), v14, v13);

  v15 = -[CPSDashboardEstimatesView distanceRemainingLabel](v23, "distanceRemainingLabel");
  -[UILabel setText:](v15, "setText:", v18);

  v17 = (id)objc_msgSend(MEMORY[0x24BDB7A88], "timeRemainingColorForColor:", objc_msgSend(location[0], "timeRemainingColor"));
  v16 = -[CPSDashboardEstimatesView timeRemainingLabel](v23, "timeRemainingLabel");
  -[UILabel setTextColor:](v16, "setTextColor:", v17);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (id)_labelFont
{
  id v2;
  id v3;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14[3];
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v14[2] = self;
  v14[1] = (id)a2;
  v6 = (void *)MEMORY[0x24BDF6A78];
  v5 = *MEMORY[0x24BDF77D0];
  v7 = (id)-[CPSDashboardEstimatesView traitCollection](self, "traitCollection");
  v14[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

  v17 = *MEMORY[0x24BDF78A0];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7890]);
  v18[0] = v8;
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17);

  v9 = v14[0];
  v15 = *MEMORY[0x24BDF7770];
  v16 = v13;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
  v3 = v14[0];
  v14[0] = v2;

  v12 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v14[0], 0.0);
  v11 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  return v11;
}

- (UILabel)etaLabel
{
  return self->_etaLabel;
}

- (void)setEtaLabel:(id)a3
{
  objc_storeStrong((id *)&self->_etaLabel, a3);
}

- (UILabel)timeRemainingLabel
{
  return self->_timeRemainingLabel;
}

- (void)setTimeRemainingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeRemainingLabel, a3);
}

- (UILabel)distanceRemainingLabel
{
  return self->_distanceRemainingLabel;
}

- (void)setDistanceRemainingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_distanceRemainingLabel, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (CPSTravelEstimatesStringFormatter)travelEstimatesStringFormatter
{
  return self->_travelEstimatesStringFormatter;
}

- (void)setTravelEstimatesStringFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_travelEstimatesStringFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelEstimatesStringFormatter, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_distanceRemainingLabel, 0);
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
}

@end
