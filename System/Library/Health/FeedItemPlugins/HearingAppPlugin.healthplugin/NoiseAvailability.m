@implementation NoiseAvailability

- (void)dealloc
{
  _TtC16HearingAppPlugin17NoiseAvailability *v2;
  __CFNotificationCenter *v3;
  objc_super v4;

  v2 = self;
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v3, v2);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for NoiseAvailability();
  -[NoiseAvailability dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC16HearingAppPlugin17NoiseAvailability__featureStatus;
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16HearingAppPlugin17NoiseAvailability__promotionVisibility;
  sub_23128F078();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)pairedDevicesDidUpdate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  _TtC16HearingAppPlugin17NoiseAvailability *v9;
  _TtC16HearingAppPlugin17NoiseAvailability *v10;
  uint64_t v11;

  sub_23128F05C(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = self;
  sub_23128E608((uint64_t)v8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23128F0CC((uint64_t)v8, (uint64_t)v6);
  v10 = v9;
  sub_2312BBC9C();
  sub_23128F110((uint64_t)v8);
  sub_23128E73C();

}

- (_TtC16HearingAppPlugin17NoiseAvailability)init
{
  _TtC16HearingAppPlugin17NoiseAvailability *result;

  result = (_TtC16HearingAppPlugin17NoiseAvailability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
