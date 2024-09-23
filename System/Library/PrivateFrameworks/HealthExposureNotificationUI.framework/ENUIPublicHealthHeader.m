@implementation ENUIPublicHealthHeader

- (NSString)title
{
  return (NSString *)sub_21CD017D0();
}

- (NSString)subtitle
{
  return (NSString *)sub_21CD017D0();
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_backgroundColor));
}

- (UIColor)textColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_textColor));
}

- (NSURL)logoURL
{
  return (NSURL *)sub_21CD0185C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_logoURL);
}

- (int64_t)style
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_style);
}

- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)initWithTitle:(id)a3 subtitle:(id)a4 backgroundColor:(id)a5 textColor:(id)a6 logoURL:(id)a7 style:(int64_t)a8
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  objc_class *v26;
  id v27;
  id v28;
  _TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader *v29;
  objc_super v31;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B3B10);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21CD765B0();
  v18 = v17;
  v19 = sub_21CD765B0();
  v21 = v20;
  if (a7)
  {
    sub_21CD762C8();
    v22 = sub_21CD762E0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v15, 0, 1, v22);
  }
  else
  {
    v23 = sub_21CD762E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v15, 1, 1, v23);
  }
  v24 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_title);
  *v24 = v16;
  v24[1] = v18;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_subtitle);
  *v25 = v19;
  v25[1] = v21;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_backgroundColor) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_textColor) = (Class)a6;
  sub_21CD06894((uint64_t)v15, (uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_logoURL);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_style) = (Class)a8;
  v26 = (objc_class *)type metadata accessor for ENUIPublicHealthHeader(0);
  v31.receiver = self;
  v31.super_class = v26;
  v27 = a5;
  v28 = a6;
  v29 = -[ENUIPublicHealthHeader init](&v31, sel_init);
  sub_21CD068DC((uint64_t)v15);
  return v29;
}

- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)init
{
  _TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader *result;

  result = (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_backgroundColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_textColor));
  sub_21CD068DC((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_logoURL);
}

@end
