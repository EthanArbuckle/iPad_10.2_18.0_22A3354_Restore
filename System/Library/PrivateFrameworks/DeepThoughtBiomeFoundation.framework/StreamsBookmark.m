@implementation StreamsBookmark

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_256968190;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_256968190 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC26DeepThoughtBiomeFoundation15StreamsBookmark *v5;

  v4 = a3;
  v5 = self;
  sub_23A2E97C4(v4);

}

- (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark)initWithCoder:(id)a3
{
  return (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark *)StreamsBookmark.init(coder:)(a3);
}

- (NSString)debugDescription
{
  _TtC26DeepThoughtBiomeFoundation15StreamsBookmark *v2;
  void *v3;

  v2 = self;
  sub_23A2E9E8C();

  v3 = (void *)sub_23A316F7C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark)init
{
  _TtC26DeepThoughtBiomeFoundation15StreamsBookmark *result;

  result = (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
