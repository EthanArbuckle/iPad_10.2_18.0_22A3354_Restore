@implementation CycleHistoryCycleDayCell

+ (Class)layerClass
{
  sub_23190ACE4(0, &qword_255F45CB0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell *)sub_231A64164(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231A657B4();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[CycleHistoryCycleDayCell applyLayoutAttributes:](&v6, sel_applyLayoutAttributes_, v4);
  sub_231A65150();

}

- (void).cxx_destruct
{
  sub_231A65778((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell_day);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell_backgroundCapsule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell_flowDot));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell_supplementaryDataLoggedDot));
}

@end
