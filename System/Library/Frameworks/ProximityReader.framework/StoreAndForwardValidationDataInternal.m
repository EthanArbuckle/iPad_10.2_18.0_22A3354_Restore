@implementation StoreAndForwardValidationDataInternal

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_25525AE00;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_25525AE00 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader37StoreAndForwardValidationDataInternal *v5;

  v4 = a3;
  v5 = self;
  StoreAndForwardValidationDataInternal.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader37StoreAndForwardValidationDataInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader37StoreAndForwardValidationDataInternal *)StoreAndForwardValidationDataInternal.init(coder:)(a3);
}

- (_TtC15ProximityReader37StoreAndForwardValidationDataInternal)init
{
  _TtC15ProximityReader37StoreAndForwardValidationDataInternal *result;

  result = (_TtC15ProximityReader37StoreAndForwardValidationDataInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
