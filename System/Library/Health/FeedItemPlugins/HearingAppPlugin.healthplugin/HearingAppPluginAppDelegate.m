@implementation HearingAppPluginAppDelegate

- (_TtC16HearingAppPlugin27HearingAppPluginAppDelegate)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC16HearingAppPlugin27HearingAppPluginAppDelegate *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v2 = OBJC_IVAR____TtC16HearingAppPlugin27HearingAppPluginAppDelegate_logger;
  v3 = qword_255EC2F50;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = sub_2312BBBC4();
  v6 = sub_23128A1E0(v5, (uint64_t)qword_255EC4110);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))((char *)v4 + v2, v6, v5);
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC16HearingAppPlugin27HearingAppPluginAppDelegate____lazy_storage___articleIdentifiersByUrl) = 0;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for HearingAppPluginAppDelegate();
  return -[HearingAppPluginAppDelegate init](&v8, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC16HearingAppPlugin27HearingAppPluginAppDelegate_logger;
  v3 = sub_2312BBBC4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
