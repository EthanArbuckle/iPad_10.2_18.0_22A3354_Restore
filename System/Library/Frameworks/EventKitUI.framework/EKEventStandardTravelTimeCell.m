@implementation EKEventStandardTravelTimeCell

- (EKEventStandardTravelTimeCell)init
{
  EKEventStandardTravelTimeCell *v2;
  EKEventStandardTravelTimeCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventStandardTravelTimeCell;
  v2 = -[EKEventStandardTravelTimeCell init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[EKCalendarChooserCell setShowCheckmarksOnLeft:](v2, "setShowCheckmarksOnLeft:", 1);
    -[EKCalendarChooserCell setChecked:](v3, "setChecked:", 0);
  }
  return v3;
}

@end
