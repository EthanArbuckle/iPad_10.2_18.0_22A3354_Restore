@implementation InternalError

- (_TtC8GroupKit13InternalError)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC8GroupKit13InternalError *)InternalError.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8GroupKit13InternalError *v5;

  v4 = a3;
  v5 = self;
  InternalError.encode(with:)((NSCoder)a3);

}

+ (BOOL)supportsSecureCoding
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static InternalError.supportsSecureCoding.getter();
  return _convertBoolToObjCBool(_:)() & 1;
}

- (_TtC8GroupKit13InternalError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v5;
  id v6;
  _TtC8GroupKit13InternalError *v8;

  v5 = a3;
  v6 = a5;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  }
  v8 = (_TtC8GroupKit13InternalError *)InternalError.init(domain:code:userInfo:)();

  return v8;
}

@end
