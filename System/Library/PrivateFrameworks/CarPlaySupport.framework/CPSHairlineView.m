@implementation CPSHairlineView

+ (id)grayHairlineViewAlongAxis:(int64_t)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_alloc((Class)a1);
  v5 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.4, 0.4, 0.4, 1.0);
  v6 = (id)objc_msgSend(v4, "initWithAxis:color:", a3);

  return v6;
}

- (CPSHairlineView)initWithAxis:(int64_t)a3 color:(id)a4
{
  CPSHairlineView *v4;
  double v5;
  id v6;
  CPSHairlineView *v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id location;
  int64_t v16;
  SEL v17;
  CPSHairlineView *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v18;
  v18 = 0;
  v18 = -[CPSHairlineView init](v4, "init");
  objc_storeStrong((id *)&v18, v18);
  if (v18)
  {
    -[CPSHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[CPSHairlineView setContentHuggingPriority:forAxis:](v18, "setContentHuggingPriority:forAxis:", v16, v5);
    -[CPSHairlineView setBackgroundColor:](v18, "setBackgroundColor:", location);
    -[CPSHairlineView setAxis:](v18, "setAxis:", v16);
    v12 = 0;
    v10 = 0;
    if (v16)
    {
      v11 = (id)-[CPSHairlineView widthAnchor](v18, "widthAnchor");
      v10 = 1;
      v6 = v11;
    }
    else
    {
      v13 = (id)-[CPSHairlineView heightAnchor](v18, "heightAnchor");
      v12 = 1;
      v6 = v13;
    }
    v14 = v6;
    if ((v10 & 1) != 0)

    if ((v12 & 1) != 0)
    v9 = (id)objc_msgSend(v14, "constraintEqualToConstant:", 1.0);
    -[CPSHairlineView setStrokeThicknessConstraint:](v18, "setStrokeThicknessConstraint:", v9);
    -[CPSHairlineView addConstraint:](v18, "addConstraint:", v9);
    -[CPSHairlineView _updateStrokeThickness](v18, "_updateStrokeThickness");
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v14, 0);
  }
  v8 = v18;
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  id location[2];
  CPSHairlineView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSHairlineView _updateStrokeThickness](v4, "_updateStrokeThickness");
  objc_storeStrong(location, 0);
}

- (void)_updateStrokeThickness
{
  double v2;
  double v3;
  NSLayoutConstraint *v4;
  id v5;
  double v6;
  double v7;

  v5 = (id)-[CPSHairlineView traitCollection](self, "traitCollection");
  objc_msgSend(v5, "displayScale");
  v6 = v2;

  if (v6 > 0.0)
  {
    UIRoundToScale();
    v7 = v3;
    v4 = -[CPSHairlineView strokeThicknessConstraint](self, "strokeThicknessConstraint");
    -[NSLayoutConstraint setConstant:](v4, "setConstant:", v7);

  }
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (NSLayoutConstraint)strokeThicknessConstraint
{
  return self->_strokeThicknessConstraint;
}

- (void)setStrokeThicknessConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_strokeThicknessConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeThicknessConstraint, 0);
}

@end
