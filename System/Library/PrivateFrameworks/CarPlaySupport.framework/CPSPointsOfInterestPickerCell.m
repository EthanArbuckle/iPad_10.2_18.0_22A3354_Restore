@implementation CPSPointsOfInterestPickerCell

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CPSPointsOfInterestPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CPSPointsOfInterestPickerCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CPSPointsOfInterestPickerCell *v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;
  id location[3];
  CPSPointsOfInterestPickerCell *v16;

  v16 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4 = v16;
  v16 = 0;
  v14.receiver = v4;
  v14.super_class = (Class)CPSPointsOfInterestPickerCell;
  v16 = -[CPSPointsOfInterestPickerCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, 3, location[0]);
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    -[CPSPointsOfInterestPickerCell setSelectionStyle:](v16, "setSelectionStyle:", 3);
    v11 = objc_alloc(MEMORY[0x24BDF6F90]);
    v12 = (id)-[CPSPointsOfInterestPickerCell contentView](v16, "contentView");
    objc_msgSend(v12, "frame");
    v13 = (id)objc_msgSend(v11, "initWithFrame:", v5, v6, v7, v8);

    -[CPSPointsOfInterestPickerCell setBackgroundView:](v16, "setBackgroundView:", v13);
    -[CPSPointsOfInterestPickerCell setupViews](v16, "setupViews");
    objc_storeStrong(&v13, 0);
  }
  v10 = v16;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v10;
}

- (void)setupViews
{
  id v2;
  id v3;
  id v4;
  id v5;

  v3 = +[CPSEntityStyles pickerCellPrimaryFont](CPSEntityStyles, "pickerCellPrimaryFont");
  v2 = (id)-[CPSPointsOfInterestPickerCell textLabel](self, "textLabel");
  objc_msgSend(v2, "setFont:", v3);

  v5 = +[CPSEntityStyles pickerCellSecondaryFont](CPSEntityStyles, "pickerCellSecondaryFont");
  v4 = (id)-[CPSPointsOfInterestPickerCell detailTextLabel](self, "detailTextLabel");
  objc_msgSend(v4, "setFont:", v5);

}

- (void)prepareForReuse
{
  objc_super v2;
  SEL v3;
  CPSPointsOfInterestPickerCell *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestPickerCell;
  -[CPSPointsOfInterestPickerCell prepareForReuse](&v2, sel_prepareForReuse);
  -[CPSPointsOfInterestPickerCell setChosen:](v4, "setChosen:", 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  id v4;
  id v5;
  char v6;
  id v7;

  -[CPSPointsOfInterestPickerCell setHighlighted:](self, "setHighlighted:", a3);
  v6 = 0;
  if (-[CPSPointsOfInterestPickerCell chosen](self, "chosen"))
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
    v6 = 1;
    v5 = v7;
  }
  else
  {
    v5 = 0;
  }
  v4 = (id)-[CPSPointsOfInterestPickerCell backgroundView](self, "backgroundView");
  objc_msgSend(v4, "setBackgroundColor:", v5);

  if ((v6 & 1) != 0)
}

- (BOOL)isSelected
{
  return -[CPSPointsOfInterestPickerCell chosen](self, "chosen", a2, self);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CPSPointsOfInterestPickerCell *v5;
  CPSPointsOfInterestPickerCell *v6;
  CPSPointsOfInterestPickerCell *v7;
  id v8;
  id location[2];
  CPSPointsOfInterestPickerCell *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v6 = v10;
  v5 = v10;
  v7 = (CPSPointsOfInterestPickerCell *)(id)objc_msgSend(location[0], "nextFocusedItem");
  -[CPSPointsOfInterestPickerCell setHighlighted:](v6, "setHighlighted:", v5 == v7);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  char v8;
  objc_super v9;
  BOOL v10;
  SEL v11;
  CPSPointsOfInterestPickerCell *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSPointsOfInterestPickerCell;
  -[CPSPointsOfInterestPickerCell setHighlighted:](&v9, sel_setHighlighted_, a3);
  v8 = 1;
  if (!-[CPSPointsOfInterestPickerCell chosen](v12, "chosen"))
    v8 = v10;
  v6 = +[CPSEntityStyles pickerCellPrimaryFontColor:](CPSEntityStyles, "pickerCellPrimaryFontColor:", v8 & 1);
  v5 = (id)-[CPSPointsOfInterestPickerCell textLabel](v12, "textLabel");
  objc_msgSend(v5, "setTextColor:", v6);

  v7 = 1;
  if (!-[CPSPointsOfInterestPickerCell chosen](v12, "chosen"))
    v7 = v10;
  v4 = +[CPSEntityStyles pickerCellSecondaryFontColor:](CPSEntityStyles, "pickerCellSecondaryFontColor:", v7 & 1);
  v3 = (id)-[CPSPointsOfInterestPickerCell detailTextLabel](v12, "detailTextLabel");
  objc_msgSend(v3, "setTextColor:", v4);

}

- (void)setChosen:(BOOL)a3
{
  if (self->_chosen != a3)
  {
    self->_chosen = a3;
    -[CPSPointsOfInterestPickerCell setSelected:](self, "setSelected:", a3);
  }
}

- (BOOL)chosen
{
  return self->_chosen;
}

@end
