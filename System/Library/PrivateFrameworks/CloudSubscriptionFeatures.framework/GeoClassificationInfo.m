@implementation GeoClassificationInfo

- (NSString)featureKey
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5BC9B3C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)expired
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC25CloudSubscriptionFeatures21GeoClassificationInfo *v7;
  char v8;
  uint64_t v10;

  v3 = sub_1A5BC9974();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1A5BC9968();
  v8 = sub_1A5BC98FC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v8 & 1;
}

- (unint64_t)status
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC25CloudSubscriptionFeatures21GeoClassificationInfo_geoClassification);
  v3 = *(_QWORD *)&self->geoClassification[OBJC_IVAR____TtC25CloudSubscriptionFeatures21GeoClassificationInfo_geoClassification];
  swift_bridgeObjectRetain();
  return sub_1A5B95F7C(v2, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo)initWithCoder:(id)a3
{
  return (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo *)GeoClassificationInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC25CloudSubscriptionFeatures21GeoClassificationInfo *v5;

  v4 = a3;
  v5 = self;
  sub_1A5B95500(v4);

}

- (NSString)description
{
  _TtC25CloudSubscriptionFeatures21GeoClassificationInfo *v2;
  void *v3;

  v2 = self;
  sub_1A5B9571C();

  v3 = (void *)sub_1A5BC9B3C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC25CloudSubscriptionFeatures21GeoClassificationInfo *v4;
  _TtC25CloudSubscriptionFeatures21GeoClassificationInfo *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A5BC9E3C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A5B95914((uint64_t)v8);

  sub_1A5B8A7C0((uint64_t)v8);
  return v6 & 1;
}

- (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo)init
{
  _TtC25CloudSubscriptionFeatures21GeoClassificationInfo *result;

  result = (_TtC25CloudSubscriptionFeatures21GeoClassificationInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC25CloudSubscriptionFeatures21GeoClassificationInfo_cacheTill;
  v4 = sub_1A5BC9974();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
