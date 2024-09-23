@implementation CloudFeature

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CloudFeature *v5;

  v4 = a3;
  v5 = self;
  CloudFeature.encode(with:)((NSCoder)v4);

}

- (NSString)description
{
  CloudFeature *v2;
  void *v3;

  v2 = self;
  CloudFeature.description.getter();

  v3 = (void *)sub_1A5BC9B3C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A5B4FBE8((uint64_t)self + OBJC_IVAR___CloudFeature_ttl, &qword_1ED111280);
}

- (CloudFeature)initWithCoder:(id)a3
{
  return (CloudFeature *)CloudFeature.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CloudFeature)init
{
  char *v3;
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  CloudFeature *result;

  v3 = (char *)self + OBJC_IVAR___CloudFeature_limit;
  *(_QWORD *)v3 = 0;
  v3[8] = 1;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CloudFeature_accessToken);
  *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR___CloudFeature_ttl;
  v6 = sub_1A5BC9974();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);

  result = (CloudFeature *)sub_1A5BC9F50();
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CloudFeature *v4;
  CloudFeature *v5;
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
  v6 = CloudFeature.isEqual(_:)((uint64_t)v8);

  sub_1A5B4FBE8((uint64_t)v8, &qword_1ED110560);
  return v6 & 1;
}

@end
