@implementation DisclosureCellViewController

- (_TtC18HealthExperienceUI28DisclosureCellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC18HealthExperienceUI28DisclosureCellViewController *v9;
  objc_super v11;

  if (a3)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___disclosureIndicator) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___cellAccessoryView) = 0;
    v6 = a4;
    v7 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___disclosureIndicator) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___cellAccessoryView) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DisclosureCellViewController();
  v9 = -[CellWithAccessoryViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC18HealthExperienceUI28DisclosureCellViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___disclosureIndicator) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___cellAccessoryView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DisclosureCellViewController();
  return -[CellWithAccessoryViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___disclosureIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___cellAccessoryView));
}

@end
