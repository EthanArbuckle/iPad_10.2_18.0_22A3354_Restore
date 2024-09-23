@implementation CompactCalendarViewLayout

- (_TtC24MenstrualCyclesAppPlugin25CompactCalendarViewLayout)init
{
  _TtC24MenstrualCyclesAppPlugin25CompactCalendarViewLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = -[UICollectionViewFlowLayout init](&v4, sel_init);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v2, sel_setMinimumLineSpacing_, 6.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v2, sel_setMinimumInteritemSpacing_, 10.0);

  return v2;
}

- (_TtC24MenstrualCyclesAppPlugin25CompactCalendarViewLayout)initWithCoder:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin25CompactCalendarViewLayout *result;

  result = (_TtC24MenstrualCyclesAppPlugin25CompactCalendarViewLayout *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  _TtC24MenstrualCyclesAppPlugin25CompactCalendarViewLayout *v2;

  v2 = self;
  sub_231AE01B4();

}

@end
