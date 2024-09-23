@implementation TipWithActionViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI27TipWithActionViewController *v2;

  v2 = self;
  sub_1A979B3F0();

}

- (_TtC18HealthExperienceUI27TipWithActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI27TipWithActionViewController *v11;
  objc_super v13;

  if (a3)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController_context;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((_QWORD *)v6 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController____lazy_storage___tileView) = 0;
    v7 = a4;
    v8 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController_context;
    *(_OWORD *)v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((_QWORD *)v9 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController____lazy_storage___tileView) = 0;
    v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TipWithActionViewController();
  v11 = -[TipWithActionViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v8, a4);

  return v11;
}

- (_TtC18HealthExperienceUI27TipWithActionViewController)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController____lazy_storage___tileView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TipWithActionViewController();
  return -[TipWithActionViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A970AD84((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController____lazy_storage___tileView));
}

@end
