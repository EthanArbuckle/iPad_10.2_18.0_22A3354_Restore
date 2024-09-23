@implementation MKIncidentExtendedDetailCell

- (MKIncidentExtendedDetailCell)initWithReuseIdentifier:(id)a3
{
  MKIncidentExtendedDetailCell *v3;
  MKIncidentExtendedDetailCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MKIncidentDetailContentView *v9;
  uint64_t v10;
  MKIncidentDetailContentView *incidentContentView;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)MKIncidentExtendedDetailCell;
  v3 = -[MKIncidentExtendedDetailCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v4 = v3;
  if (v3)
  {
    -[MKIncidentExtendedDetailCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOpaque:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKIncidentExtendedDetailCell setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[MKIncidentExtendedDetailCell setOpaque:](v4, "setOpaque:", 0);
    -[MKIncidentExtendedDetailCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[MKIncidentExtendedDetailCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("MKIncidentExtendedDetailCell"));
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKIncidentExtendedDetailCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    v9 = [MKIncidentDetailContentView alloc];
    v10 = -[MKIncidentDetailContentView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    incidentContentView = v4->_incidentContentView;
    v4->_incidentContentView = (MKIncidentDetailContentView *)v10;

    -[MKIncidentDetailContentView setTranslatesAutoresizingMaskIntoConstraints:](v4->_incidentContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKIncidentExtendedDetailCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_incidentContentView);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[MKIncidentDetailContentView leadingAnchor](v4->_incidentContentView, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKIncidentExtendedDetailCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    -[MKIncidentDetailContentView trailingAnchor](v4->_incidentContentView, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKIncidentExtendedDetailCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v23;
    -[MKIncidentDetailContentView topAnchor](v4->_incidentContentView, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKIncidentExtendedDetailCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v16;
    -[MKIncidentDetailContentView bottomAnchor](v4->_incidentContentView, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKIncidentExtendedDetailCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v21);

  }
  return v4;
}

- (void)configureWithAdvisories:(id)a3 artwork:(id)a4
{
  -[MKIncidentDetailContentView configureWithAdvisories:artwork:](self->_incidentContentView, "configureWithAdvisories:artwork:", a3, a4);
}

- (void)setDelegate:(id)a3
{
  -[MKIncidentDetailContentView setDelegate:](self->_incidentContentView, "setDelegate:", a3);
}

- (MKIncidentDetailDelegate)delegate
{
  return -[MKIncidentDetailContentView delegate](self->_incidentContentView, "delegate");
}

- (void)configureWithAdvisoryItem:(id)a3
{
  -[MKIncidentDetailContentView configureWithAdvisoryItem:](self->_incidentContentView, "configureWithAdvisoryItem:", a3);
}

- (void)configureWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 image:(id)a6
{
  -[MKIncidentDetailContentView configureWithTitle:subtitle:body:image:](self->_incidentContentView, "configureWithTitle:subtitle:body:image:", a3, a4, a5, a6);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKIncidentExtendedDetailCell;
  -[MKIncidentExtendedDetailCell prepareForReuse](&v3, sel_prepareForReuse);
  -[MKIncidentDetailContentView reset](self->_incidentContentView, "reset");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentContentView, 0);
}

@end
