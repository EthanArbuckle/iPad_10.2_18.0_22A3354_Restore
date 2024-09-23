@implementation SecureButtonTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC15AppDistribution15SecureButtonTag)initWithCoder:(id)a3
{
  id v3;
  _TtC15AppDistribution15SecureButtonTag *v4;

  v3 = a3;
  v4 = (_TtC15AppDistribution15SecureButtonTag *)sub_2360D0090(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15AppDistribution15SecureButtonTag *v5;

  v4 = a3;
  v5 = self;
  SecureButtonTag.encode(with:)((NSCoder)v4);

}

- (int64_t)hash
{
  _TtC15AppDistribution15SecureButtonTag *v2;
  int64_t v3;

  v2 = self;
  v3 = SecureButtonTag.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC15AppDistribution15SecureButtonTag *v4;
  _TtC15AppDistribution15SecureButtonTag *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2360D0DA0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = SecureButtonTag.isEqual(_:)((uint64_t)v8);

  sub_2360BB134((uint64_t)v8);
  return v6 & 1;
}

- (_TtC15AppDistribution15SecureButtonTag)init
{
  _TtC15AppDistribution15SecureButtonTag *result;

  result = (_TtC15AppDistribution15SecureButtonTag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AppDistribution15SecureButtonTag_backgroundColor));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AppDistribution15SecureButtonTag_foregroundColor));

}

@end
