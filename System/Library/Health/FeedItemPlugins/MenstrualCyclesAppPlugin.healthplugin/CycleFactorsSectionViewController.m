@implementation CycleFactorsSectionViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[CycleFactorsSectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_231B1D684();

}

- (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController_shouldShowDisclosureIndicator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController_cycleFactorsSectionView) = 0;
  v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController_analysis));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleFactorsSectionViewController_cycleFactorsSectionView));
}

@end
