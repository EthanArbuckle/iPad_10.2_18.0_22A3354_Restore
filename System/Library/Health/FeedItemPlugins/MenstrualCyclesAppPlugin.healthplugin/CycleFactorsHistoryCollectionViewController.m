@implementation CycleFactorsHistoryCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController_collectionViewSections) = (Class)MEMORY[0x24BEE4AF8];
  v4 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController_numOngoingFactors;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController_collectionViewSource) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController *)sub_231CA2A48();
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
  -[CycleFactorsHistoryCollectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_231C46C08();
  sub_231AD59B0();

}

- (void)pushAddFactorView
{
  _TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController *v2;

  v2 = self;
  sub_231C475D8();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController_collectionViewSource));
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231C47FF4(v7);

}

@end
