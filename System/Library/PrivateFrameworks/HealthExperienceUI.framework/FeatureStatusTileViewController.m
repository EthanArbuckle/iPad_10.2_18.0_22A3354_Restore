@implementation FeatureStatusTileViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FeatureStatusTileViewController();
  v2 = v8.receiver;
  -[FeatureStatusTileViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v8.receiver, v8.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1A9A30F4C();
    objc_msgSend(v4, sel_addSubview_, v5);

    v6 = sub_1A9A30F4C();
    v7 = objc_msgSend(v2, sel_view);
    objc_msgSend(v6, sel_hk_alignConstraintsWithView_, v7);

  }
  else
  {
    __break(1u);
  }
}

- (void)didSelectCell:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  _TtC18HealthExperienceUI31FeatureStatusTileViewController *v8;
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1A9A30F4C();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  v10 = sub_1A9A30F4C();
  sub_1A970E098();

}

- (_TtC18HealthExperienceUI31FeatureStatusTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI31FeatureStatusTileViewController *v11;
  objc_super v13;

  if (a3)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController_context;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((_QWORD *)v6 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController____lazy_storage___featureStatusPlatformView) = 0;
    v7 = a4;
    v8 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController_context;
    *(_OWORD *)v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((_QWORD *)v9 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController____lazy_storage___featureStatusPlatformView) = 0;
    v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FeatureStatusTileViewController();
  v11 = -[FeatureStatusTileViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v8, a4);

  return v11;
}

- (_TtC18HealthExperienceUI31FeatureStatusTileViewController)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController____lazy_storage___featureStatusPlatformView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FeatureStatusTileViewController();
  return -[FeatureStatusTileViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A970AD84((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController____lazy_storage___featureStatusPlatformView));
}

@end
