@implementation MapsSyncError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC8MapsSync13MapsSyncError)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MapsSyncError();
  return -[MapsSyncError initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC8MapsSync13MapsSyncError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  _TtC8MapsSync13MapsSyncError *result;

  result = (_TtC8MapsSync13MapsSyncError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
