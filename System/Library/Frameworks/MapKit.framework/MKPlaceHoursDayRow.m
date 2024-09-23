@implementation MKPlaceHoursDayRow

- (MKPlaceHoursDayRow)initWithBusinessHours:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  MKPlaceHoursView *v11;
  void *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKPlaceHoursDayRow;
  v10 = -[MKPlaceSectionItemView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = -[MKPlaceHoursView initWithBusinessHours:]([MKPlaceHoursView alloc], "initWithBusinessHours:", v9);
    v12 = (void *)*((_QWORD *)v10 + 58);
    *((_QWORD *)v10 + 58) = v11;

    objc_msgSend(*((id *)v10 + 58), "setHoursDelegate:", v10);
    objc_msgSend(v10, "_setUpViewsForPlaceHoursDayRow");
  }

  return (MKPlaceHoursDayRow *)v10;
}

- (void)_setUpViewsForPlaceHoursDayRow
{
  -[MKPlaceHoursDayRow setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  -[MKPlaceHoursDayRow setClipsToBounds:](self, "setClipsToBounds:", 0);
  objc_msgSend(*(id *)&self->super._selected, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKPlaceHoursDayRow addSubview:](self, "addSubview:", *(_QWORD *)&self->super._selected);
  -[MKPlaceHoursDayRow _setUpConstraints](self, "_setUpConstraints");
}

- (void)_setUpConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  MKPlaceHoursView *v10;
  MKPlaceHoursView *hoursView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = (id)objc_opt_new();
  objc_msgSend(*(id *)&self->super._selected, "topLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 8.0);
  v6 = v5;

  -[MKPlaceHoursDayRow topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&self->super._selected, "topLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstBaselineAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, -v6);
  v10 = (MKPlaceHoursView *)objc_claimAutoreleasedReturnValue();
  hoursView = self->_hoursView;
  self->_hoursView = v10;

  objc_msgSend(v21, "addObject:", self->_hoursView);
  -[MKPlaceHoursDayRow bottomAnchor](self, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&self->super._selected, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v14);

  -[MKPlaceHoursDayRow leftAnchor](self, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&self->super._selected, "leftAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v17);

  -[MKPlaceHoursDayRow rightAnchor](self, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&self->super._selected, "rightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v20);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v21);
}

- (void)hoursViewDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  MKPlaceHoursView *v13;
  MKPlaceHoursView *hoursView;
  void *v15;
  void *v16;
  MKPlaceHoursView *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (*(id *)&self->super._selected == a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    v18[0] = self->_hoursView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    objc_msgSend(*(id *)&self->super._selected, "topLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_mapkit_scaledValueForValue:", 8.0);
    v9 = v8;

    -[MKPlaceHoursDayRow topAnchor](self, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)&self->super._selected, "topLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstBaselineAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -v9);
    v13 = (MKPlaceHoursView *)objc_claimAutoreleasedReturnValue();
    hoursView = self->_hoursView;
    self->_hoursView = v13;

    v15 = (void *)MEMORY[0x1E0CB3718];
    v17 = self->_hoursView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

  }
}

- (MKPlaceHoursView)hoursView
{
  return *(MKPlaceHoursView **)&self->super._selected;
}

- (void)setHoursView:(id)a3
{
  objc_storeStrong((id *)&self->super._selected, a3);
}

- (NSLayoutConstraint)topAnchorToTopLabelBaseline
{
  return (NSLayoutConstraint *)self->_hoursView;
}

- (void)setTopAnchorToTopLabelBaseline:(id)a3
{
  objc_storeStrong((id *)&self->_hoursView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoursView, 0);
  objc_storeStrong((id *)&self->super._selected, 0);
}

@end
