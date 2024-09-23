@implementation ENUIPublicHealthLegalDocument

- (NSString)text
{
  return (NSString *)sub_21CD017D0();
}

- (NSString)version
{
  return (NSString *)sub_21CD017D0();
}

- (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument)initWithText:(id)a3 version:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  objc_super v13;

  v5 = sub_21CD765B0();
  v7 = v6;
  v8 = sub_21CD765B0();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument_text);
  *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument_version);
  *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ENUIPublicHealthLegalDocument();
  return -[ENUIPublicHealthLegalDocument init](&v13, sel_init);
}

- (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument)init
{
  _TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument *result;

  result = (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
