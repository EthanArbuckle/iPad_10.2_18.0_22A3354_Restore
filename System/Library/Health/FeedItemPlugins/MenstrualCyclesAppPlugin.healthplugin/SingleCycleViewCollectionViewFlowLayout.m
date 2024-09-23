@implementation SingleCycleViewCollectionViewFlowLayout

- (_TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout)init
{
  _TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = -[UICollectionViewFlowLayout init](&v4, sel_init);
  -[UICollectionViewFlowLayout setScrollDirection:](v2, sel_setScrollDirection_, 1);
  return v2;
}

- (_TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout)initWithCoder:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout *result;

  result = (_TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareLayout
{
  _TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout *v2;

  v2 = self;
  sub_231AA9980();

}

@end
