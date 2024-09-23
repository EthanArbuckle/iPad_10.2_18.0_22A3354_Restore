@implementation HeadphoneNotificationsDataDetailConfigurationProvider

- (_TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v2 = OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_logger;
  v3 = qword_255EC2F50;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = sub_2312BBBC4();
  v6 = sub_23128A1E0(v5, (uint64_t)qword_255EC4110);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))((char *)v4 + v2, v6, v5);
  v7 = OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_dataType;
  sub_23128AC6C(0, (unint64_t *)&qword_2541596A0);
  *(Class *)((char *)&v4->super.isa + v7) = (Class)MEMORY[0x2348D92BC]((id)*MEMORY[0x24BDD2918]);

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for HeadphoneNotificationsDataDetailConfigurationProvider();
  return -[HeadphoneNotificationsDataDetailConfigurationProvider init](&v9, sel_init);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_logger;
  v4 = sub_2312BBBC4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_dataType));
}

@end
