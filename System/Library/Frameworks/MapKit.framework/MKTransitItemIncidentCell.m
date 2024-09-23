@implementation MKTransitItemIncidentCell

- (MKTransitItemIncidentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MKTransitItemIncidentCell *v4;
  MKTransitItemIncidentCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKTransitItemIncidentCell;
  v4 = -[MKCustomSeparatorCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[MKTransitItemIncidentCell _configureViews](v4, "_configureViews");
  return v5;
}

- (MKTransitItemIncidentCell)initWithReuseIdentifier:(id)a3
{
  MKTransitItemIncidentCell *v3;
  MKTransitItemIncidentCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentCell;
  v3 = -[MKCustomSeparatorCell initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v4 = v3;
  if (v3)
    -[MKTransitItemIncidentCell _configureViews](v3, "_configureViews");
  return v4;
}

- (void)_configureViews
{
  MKTransitItemIncidentView *v3;
  void *v4;
  MKTransitItemIncidentView *v5;
  MKTransitItemIncidentView *incidentView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  -[MKTransitItemIncidentCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[MKTransitItemIncidentCell setSeparatorHidden:](self, "setSeparatorHidden:", 1);
  v3 = [MKTransitItemIncidentView alloc];
  -[MKTransitItemIncidentCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[MKTransitItemIncidentView initWithFrame:](v3, "initWithFrame:");
  incidentView = self->_incidentView;
  self->_incidentView = v5;

  -[MKTransitItemIncidentView setTranslatesAutoresizingMaskIntoConstraints:](self->_incidentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKTransitItemIncidentCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_incidentView);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[MKTransitItemIncidentView topAnchor](self->_incidentView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  -[MKTransitItemIncidentView leadingAnchor](self->_incidentView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  -[MKTransitItemIncidentCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentView trailingAnchor](self->_incidentView, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v11;
  -[MKTransitItemIncidentCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentView bottomAnchor](self->_incidentView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v16);

  -[MKTransitItemIncidentCell _updateIncidentViewBottomOffset](self, "_updateIncidentViewBottomOffset");
}

- (void)setLeadingSeparatorInset:(double)a3
{
  double v5;
  objc_super v6;

  -[MKTransitItemIncidentView contentInsets](self->_incidentView, "contentInsets");
  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentCell;
  -[MKCustomSeparatorCell setLeadingSeparatorInset:](&v6, sel_setLeadingSeparatorInset_, v5 + a3);
}

- (void)setTrailingSeparatorInset:(double)a3
{
  double v5;
  objc_super v6;

  -[MKTransitItemIncidentView contentInsets](self->_incidentView, "contentInsets");
  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentCell;
  -[MKCustomSeparatorCell setTrailingSeparatorInset:](&v6, sel_setTrailingSeparatorInset_, v5 + a3);
}

- (void)setSeparatorHidden:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[MKCustomSeparatorCell isSeparatorHidden](self, "isSeparatorHidden");
  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentCell;
  -[MKCustomSeparatorCell setSeparatorHidden:](&v6, sel_setSeparatorHidden_, v3);
  if (v5 != v3)
    -[MKTransitItemIncidentCell _updateIncidentViewBottomOffset](self, "_updateIncidentViewBottomOffset");
}

- (void)_updateIncidentViewBottomOffset
{
  BOOL v3;
  double v4;
  double v5;

  v3 = -[MKCustomSeparatorCell isSeparatorHidden](self, "isSeparatorHidden");
  v4 = 0.0;
  if (!v3)
  {
    -[MKCustomSeparatorCell _separatorFrame](self, "_separatorFrame", 0.0);
    v4 = -v5;
  }
  -[MKTransitItemIncidentView _updateBottomConstraintWithOffset:](self->_incidentView, "_updateBottomConstraintWithOffset:", v4);
}

- (void)configureWithIncident:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  -[MKTransitItemIncidentView configureWithIncident:referenceDate:shouldShowImage:inSiri:](self->_incidentView, "configureWithIncident:referenceDate:shouldShowImage:inSiri:", a3, a4, a5, a6);
}

- (void)configureWithIncidentMessage:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  -[MKTransitItemIncidentView configureWithIncidentMessage:referenceDate:shouldShowImage:inSiri:](self->_incidentView, "configureWithIncidentMessage:referenceDate:shouldShowImage:inSiri:", a3, a4, a5, a6);
}

- (void)configureWithMessage:(id)a3 incident:(id)a4 referenceDate:(id)a5 shouldShowImage:(BOOL)a6 inSiri:(BOOL)a7
{
  -[MKTransitItemIncidentView configureWithMessage:incident:referenceDate:shouldShowImage:inSiri:](self->_incidentView, "configureWithMessage:incident:referenceDate:shouldShowImage:inSiri:", a3, a4, a5, a6, a7);
}

- (BOOL)padBottom
{
  return -[MKTransitItemIncidentView padBottom](self->_incidentView, "padBottom");
}

- (void)setPadBottom:(BOOL)a3
{
  -[MKTransitItemIncidentView setPadBottom:](self->_incidentView, "setPadBottom:", a3);
}

- (int64_t)cellPosition
{
  return -[MKTransitItemIncidentView cellPosition](self->_incidentView, "cellPosition");
}

- (void)setCellPosition:(int64_t)a3
{
  -[MKTransitItemIncidentView setCellPosition:](self->_incidentView, "setCellPosition:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentView, 0);
}

@end
