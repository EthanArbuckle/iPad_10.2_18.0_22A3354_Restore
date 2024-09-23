@implementation HPSAdaptiveVolumeDetailController

- (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController *)sub_1DB387B34(v5, v7, a4);
}

- (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController)initWithCoder:(id)a3
{
  id v4;
  _TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_listeners) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection) = 0;
  v4 = a3;

  result = (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController *)sub_1DB3BC664();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController *v2;

  v2 = self;
  sub_1DB3881F8();

}

- (id)specifiers
{
  _TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1DB38878C();

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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
