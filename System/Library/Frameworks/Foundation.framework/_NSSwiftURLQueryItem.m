@implementation _NSSwiftURLQueryItem

- (BOOL)isEqual:(id)a3
{
  return @objc _NSSwiftURLComponents.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))_NSSwiftURLQueryItem.isEqual(_:));
}

- (id)copyWithZone:(void *)a3
{
  return (id)@objc _NSSwiftURLComponents.copy(with:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))_NSSwiftURLQueryItem.copy(with:));
}

- (int64_t)hash
{
  _NSSwiftURLQueryItem *v2;
  Swift::Int v3;

  v2 = self;
  v3 = _NSSwiftURLQueryItem.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSSwiftURLQueryItem)initWithCoder:(id)a3
{
  return (_NSSwiftURLQueryItem *)_NSSwiftURLQueryItem.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[NSURLQueryItem encodeWithCoder:](&v4, sel_encodeWithCoder_, a3);
}

- (NSString)name
{
  return (NSString *)(id)String._bridgeToObjectiveCImpl()();
}

- (NSString)value
{
  if (*(_QWORD *)&self->queryItem[OBJC_IVAR____NSSwiftURLQueryItem_queryItem])
    return (NSString *)(id)String._bridgeToObjectiveCImpl()();
  else
    return (NSString *)0;
}

- (_NSSwiftURLQueryItem)initWithName:(id)a3 value:(id)a4
{
  _NSSwiftURLQueryItem *result;

  result = (_NSSwiftURLQueryItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
