@implementation CycleFactorsDaySummaryCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_ongoingCycleFactors) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_collectionViewSource) = 0;
  v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[CycleFactorsDaySummaryCollectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_231B8119C();
  sub_231B8183C();

}

- (void)pushAddFactorView
{
  _TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController *v2;

  v2 = self;
  sub_231B81A34();

}

- (void)viewModelProviderDidUpdate:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_231B81BB0(v4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_viewModelProvider));
  swift_release();
  swift_release();
  sub_231A65778((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_cycleDay);
  v3 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_gregorianCalendar;
  v4 = sub_231C9D36C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_collectionViewSource));
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231B82770(v7);

}

@end
