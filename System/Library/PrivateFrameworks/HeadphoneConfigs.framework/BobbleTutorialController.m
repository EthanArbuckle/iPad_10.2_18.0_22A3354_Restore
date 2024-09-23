@implementation BobbleTutorialController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BobbleTutorialController();
  v4 = v6.receiver;
  -[BobbleTutorialController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  v5 = sub_1DB39A560();
  objc_msgSend(v5, sel_play, v6.receiver, v6.super_class);

}

- (void)viewDidLoad
{
  _TtC16HeadphoneConfigs24BobbleTutorialController *v2;

  v2 = self;
  sub_1DB399834();

}

- (void)dealloc
{
  _TtC16HeadphoneConfigs24BobbleTutorialController *v2;

  v2 = self;
  sub_1DB39ADD8();
}

- (void).cxx_destruct
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType;
  sub_1DB39B598(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType), *((_QWORD *)v3 + 1), *((_QWORD *)v3 + 2), *((_QWORD *)v3 + 3), *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), *((void **)v3 + 6), *((_QWORD *)v3 + 7), v3[64]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_hpDevice));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark));
}

- (_TtC16HeadphoneConfigs24BobbleTutorialController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC16HeadphoneConfigs24BobbleTutorialController *result;

  result = (_TtC16HeadphoneConfigs24BobbleTutorialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs24BobbleTutorialController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC16HeadphoneConfigs24BobbleTutorialController *result;

  v6 = a5;
  result = (_TtC16HeadphoneConfigs24BobbleTutorialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
