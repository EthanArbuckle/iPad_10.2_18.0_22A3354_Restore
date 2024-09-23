@implementation ENUIUserConsentStatus

- (NSString)textConsented
{
  return (NSString *)sub_21CD017D0();
}

- (NSString)versionConsented
{
  return (NSString *)sub_21CD017D0();
}

- (NSDate)dateConsented
{
  return (NSDate *)(id)sub_21CD76304();
}

- (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus)initWithTextConsented:(id)a3 versionConsented:(id)a4 dateConsented:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  objc_class *v18;
  _TtC28HealthExposureNotificationUI21ENUIUserConsentStatus *v19;
  objc_super v21;

  v6 = sub_21CD76340();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21CD765B0();
  v12 = v11;
  v13 = sub_21CD765B0();
  v15 = v14;
  sub_21CD76328();
  v16 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI21ENUIUserConsentStatus_textConsented);
  *v16 = v10;
  v16[1] = v12;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI21ENUIUserConsentStatus_versionConsented);
  *v17 = v13;
  v17[1] = v15;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI21ENUIUserConsentStatus_dateConsented, v9, v6);
  v18 = (objc_class *)type metadata accessor for ENUIUserConsentStatus(0);
  v21.receiver = self;
  v21.super_class = v18;
  v19 = -[ENUIUserConsentStatus init](&v21, sel_init);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v19;
}

- (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus)init
{
  _TtC28HealthExposureNotificationUI21ENUIUserConsentStatus *result;

  result = (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI21ENUIUserConsentStatus_dateConsented;
  v4 = sub_21CD76340();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
