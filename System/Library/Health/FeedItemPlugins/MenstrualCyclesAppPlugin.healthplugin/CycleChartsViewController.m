@implementation CycleChartsViewController

- (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController)initWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  _TtC24MenstrualCyclesAppPlugin25CycleChartsViewController *result;

  v4 = a3;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_231CA2A6C())
    v5 = (objc_class *)sub_2319096B8(MEMORY[0x24BEE4AF8]);
  else
    v5 = (objc_class *)MEMORY[0x24BEE4B08];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_subscriptions) = v5;

  result = (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC24MenstrualCyclesAppPlugin25CycleChartsViewController *v2;

  v2 = self;
  sub_231C615FC();

}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin25CycleChartsViewController *v2;

  v2 = self;
  sub_231C61754();

}

- (void)presentEditView
{
  _TtC24MenstrualCyclesAppPlugin25CycleChartsViewController *v2;

  v2 = self;
  sub_231C61A58();

}

- (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin25CycleChartsViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_calendarCache));
  swift_bridgeObjectRelease();
}

@end
