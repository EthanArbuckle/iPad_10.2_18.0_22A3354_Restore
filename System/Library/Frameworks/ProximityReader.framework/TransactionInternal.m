@implementation TransactionInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader19TransactionInternal *v5;

  v4 = a3;
  v5 = self;
  TransactionInternal.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader19TransactionInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader19TransactionInternal *)TransactionInternal.init(coder:)(a3);
}

- (NSString)description
{
  _TtC15ProximityReader19TransactionInternal *v2;
  void *v3;

  v2 = self;
  TransactionInternal.description.getter();

  v3 = (void *)sub_21C3A7EB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15ProximityReader19TransactionInternal)init
{
  _TtC15ProximityReader19TransactionInternal *result;

  result = (_TtC15ProximityReader19TransactionInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C2D2B34(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15ProximityReader19TransactionInternal_transactionDescriptionEncoded), *(_QWORD *)&self->id[OBJC_IVAR____TtC15ProximityReader19TransactionInternal_transactionDescriptionEncoded]);
}

@end
