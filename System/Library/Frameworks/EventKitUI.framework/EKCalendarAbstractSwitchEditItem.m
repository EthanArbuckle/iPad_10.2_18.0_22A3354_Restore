@implementation EKCalendarAbstractSwitchEditItem

- (void)setCalendar:(id)a3 store:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarAbstractSwitchEditItem;
  -[EKCalendarEditItem setCalendar:store:](&v5, sel_setCalendar_store_, a3, a4);
  -[EKCalendarAbstractSwitchEditItem setCells:](self, "setCells:", 0);
}

- (void)reset
{
  UILabel *descriptionLabel;
  NSMutableArray *cells;

  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = 0;

  cells = self->_cells;
  self->_cells = 0;

}

- (void)_switchStateChanged:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[EKCalendarAbstractSwitchEditItem setSwitchState:](self, "setSwitchState:", objc_msgSend(a3, "isOn"));
  -[EKCalendarEditItem delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKCalendarEditItem delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendarItemStartedEditing:", self);

  }
}

- (id)cell
{
  EKUITableViewCell *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[EKCalendarAbstractSwitchEditItem setSwitchState:](self, "setSwitchState:", -[EKCalendarAbstractSwitchEditItem underlyingCalendarState](self, "underlyingCalendarState"));
  v3 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
  v4 = -[EKCalendarAbstractSwitchEditItem cellWrapsLongText](self, "cellWrapsLongText");
  -[EKCalendarAbstractSwitchEditItem cellText](self, "cellText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell textLabel](v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[EKUITableViewCell textLabel](v3, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", !v4);

  -[EKUITableViewCell setSelectionStyle:](v3, "setSelectionStyle:", 0);
  if (!-[EKCalendarAbstractSwitchEditItem shouldHideSwitch](self, "shouldHideSwitch"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__switchStateChanged_, 4096);
    objc_msgSend(v8, "setOn:animated:", -[EKCalendarAbstractSwitchEditItem switchState](self, "switchState"), 0);
    -[EKUITableViewCell setAccessoryView:](v3, "setAccessoryView:", v8);

  }
  return v3;
}

- (NSMutableArray)cells
{
  NSMutableArray *cells;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;

  cells = self->_cells;
  if (!cells)
  {
    v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v5 = self->_cells;
    self->_cells = v4;

    v6 = self->_cells;
    -[EKCalendarAbstractSwitchEditItem cell](self, "cell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v6, "addObject:", v7);

    cells = self->_cells;
  }
  return cells;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[EKCalendarAbstractSwitchEditItem cells](self, "cells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)numberOfSubitems
{
  void *v2;
  unint64_t v3;

  -[EKCalendarAbstractSwitchEditItem cells](self, "cells");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)saveStateToCalendar:(id)a3
{
  _BOOL8 v4;
  _BOOL4 v5;

  v4 = -[EKCalendarAbstractSwitchEditItem switchState](self, "switchState", a3);
  v5 = v4 ^ -[EKCalendarAbstractSwitchEditItem underlyingCalendarState](self, "underlyingCalendarState");
  if (v5)
    -[EKCalendarAbstractSwitchEditItem setUnderlyingCalendarState:](self, "setUnderlyingCalendarState:", v4);
  return v5;
}

- (id)cellText
{
  return 0;
}

- (id)descriptionLabelText
{
  return 0;
}

- (BOOL)cellWrapsLongText
{
  return 0;
}

- (BOOL)shouldHideSwitch
{
  return 0;
}

- (BOOL)underlyingCalendarState
{
  return self->_underlyingCalendarState;
}

- (void)setUnderlyingCalendarState:(BOOL)a3
{
  self->_underlyingCalendarState = a3;
}

- (BOOL)switchState
{
  return self->_switchState;
}

- (void)setSwitchState:(BOOL)a3
{
  self->_switchState = a3;
}

- (BOOL)allowEventAlerts
{
  return self->_allowEventAlerts;
}

- (void)setAllowEventAlerts:(BOOL)a3
{
  self->_allowEventAlerts = a3;
}

- (void)setCells:(id)a3
{
  objc_storeStrong((id *)&self->_cells, a3);
}

- (UISwitch)toggleSwitch
{
  return self->_toggleSwitch;
}

- (void)setToggleSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_toggleSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleSwitch, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end
