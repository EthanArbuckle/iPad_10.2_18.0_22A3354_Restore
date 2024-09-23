@implementation GPKError

- (_TtC8GroupKit8GPKError)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC8GroupKit8GPKError *)GPKError.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static GPKError.supportsSecureCoding.getter();
  return _convertBoolToObjCBool(_:)() & 1;
}

- (_TtC8GroupKit8GPKError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v5;
  id v6;
  _TtC8GroupKit8GPKError *v8;

  v5 = a3;
  v6 = a5;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  }
  v8 = (_TtC8GroupKit8GPKError *)GPKError.init(domain:code:userInfo:)();

  return v8;
}

@end
