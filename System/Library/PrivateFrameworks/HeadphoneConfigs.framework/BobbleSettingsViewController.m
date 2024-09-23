@implementation BobbleSettingsViewController

- (void)presentBobbleTutorials
{
  _TtC16HeadphoneConfigs28BobbleSettingsViewController *v2;

  v2 = self;
  sub_1DB39B110();

}

- (HPMHeadphoneDevice)headphoneDevice
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  return (HPMHeadphoneDevice *)*v2;
}

- (void)setHeadphoneDevice:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC16HeadphoneConfigs28BobbleSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1DB3BC340();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16HeadphoneConfigs28BobbleSettingsViewController *)BobbleSettingsViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC16HeadphoneConfigs28BobbleSettingsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DB3A1334();
}

- (id)specifiers
{
  _TtC16HeadphoneConfigs28BobbleSettingsViewController *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = (unint64_t)BobbleSettingsViewController.specifiers()();

  if (v3)
  {
    v4 = (void *)sub_1DB3BC3B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BobbleSettingsViewController();
  v4 = v6.receiver;
  -[BobbleSettingsViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  sub_1DB3A0C58();
  v5 = sub_1DB3A092C();
  objc_msgSend(v5, sel_play, v6.receiver, v6.super_class);

  objc_msgSend(v4, sel_reloadSpecifiers);
}

- (id)headGesturesEnabled
{
  _TtC16HeadphoneConfigs28BobbleSettingsViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1DB39FF1C();
  v4 = v3;

  return v4;
}

- (void)setHeadGesturesEnabledWithEnabled:(id)a3
{
  uint64_t v3;
  id v5;
  _TtC16HeadphoneConfigs28BobbleSettingsViewController *v6;
  uint64_t v7;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    swift_retain();
    if (objc_msgSend(v5, sel_BOOLValue))
      v7 = 1;
    else
      v7 = 2;
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 144))(v7);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (id)getVoiceEnvironment:(id)a3
{
  _TtC16HeadphoneConfigs28BobbleSettingsViewController *v4;
  void *v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1DB398ADC();
  swift_unknownObjectRelease();

  v5 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  return v5;
}

+ (BOOL)bobbleSupported:(id)a3
{
  BOOL v3;

  swift_unknownObjectRetain();
  v3 = _s16HeadphoneConfigs28BobbleSettingsViewControllerC15bobbleSupportedySbyXlFZ_0();
  swift_unknownObjectRelease();
  return v3;
}

+ (NSArray)bobbleMainSepcifier
{
  void *v2;

  swift_getObjCClassMetadata();
  sub_1DB3A05B0();
  sub_1DB38507C(0, &qword_1F02DA480);
  v2 = (void *)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (id)headGestureOnInput:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  sub_1DB3A193C(v3);

  v4 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)acceptReplyPlayPauseStringMapping
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  id v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v2)
  {
    v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 232);
    v4 = self;
    v5 = swift_retain();
    LOBYTE(v3) = v3(v5);
    swift_release();
    sub_1DB3986C8((char)v3);

    v6 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)declineDismissSkipStringMapping
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  id v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v2)
  {
    v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 184);
    v4 = self;
    v5 = swift_retain();
    LOBYTE(v3) = v3(v5);
    swift_release();
    sub_1DB3986C8((char)v3);

    v6 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset));
}

@end
