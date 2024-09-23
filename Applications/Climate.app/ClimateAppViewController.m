@implementation ClimateAppViewController

- (_TtC7Climate24ClimateAppViewController)init
{
  return (_TtC7Climate24ClimateAppViewController *)sub_10004B2C0();
}

- (_TtC7Climate24ClimateAppViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10005217C();
}

- (_TtC7Climate24ClimateAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7Climate24ClimateAppViewController *result;

  v4 = a4;
  result = (_TtC7Climate24ClimateAppViewController *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateAppViewController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController_coordinator));
  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC7Climate24ClimateAppViewController_climateSystem, type metadata accessor for ClimateSystemManager);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController_cancellables));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController_activeConstraints));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController____lazy_storage___zoneCard));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController_autoSettingsObserver));
  sub_100011920(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsCache), *(_QWORD *)&self->coordinator[OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsCache], *(_QWORD *)&self->cancellables[OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsCache], *(_QWORD *)&self->activeConstraints[OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsCache], *(_QWORD *)&self->zoneCardActive[OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsCache], *(_QWORD *)&self->carView[OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsCache + 7], *(_QWORD *)&self->$__lazy_storage_$_zoneCard[OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsCache + 7]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController____lazy_storage___systemControls));
}

- (void)viewDidLoad
{
  _TtC7Climate24ClimateAppViewController *v2;

  v2 = self;
  sub_10004C8F0();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClimateAppViewController(0);
  v2 = v4.receiver;
  -[ClimateAppViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = sub_10004A704();
  sub_1000370FC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClimateAppViewController(0);
  v4 = v7.receiver;
  -[ClimateAppViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "navigationController", v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setNavigationBarHidden:", 1);

    v4 = v6;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7Climate24ClimateAppViewController *v4;

  v4 = self;
  sub_10004E488(a3);

}

@end
