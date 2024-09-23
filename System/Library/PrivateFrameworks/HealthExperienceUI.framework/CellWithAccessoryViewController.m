@implementation CellWithAccessoryViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI31CellWithAccessoryViewController *v2;

  v2 = self;
  sub_1A99A7298();

}

- (NSString)description
{
  _TtC18HealthExperienceUI31CellWithAccessoryViewController *v2;
  void *v3;

  v2 = self;
  sub_1A99A7448();

  v3 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC18HealthExperienceUI31CellWithAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18HealthExperienceUI31CellWithAccessoryViewController *)CellWithAccessoryViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI31CellWithAccessoryViewController)initWithCoder:(id)a3
{
  char *v5;
  _QWORD *v6;
  objc_class *v7;
  objc_super v9;

  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_context;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_contentView) = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_baseIdentifier);
  v7 = (objc_class *)type metadata accessor for CellWithAccessoryViewController();
  *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return -[CellWithAccessoryViewController initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A970AD84((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_contentView));
  swift_bridgeObjectRelease();
}

@end
