@implementation TransportRequestObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15HomePodSettings22TransportRequestObject *v5;

  v4 = a3;
  v5 = self;
  sub_22DFA14D8(v4);

}

- (_TtC15HomePodSettings22TransportRequestObject)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings22TransportRequestObject *)sub_22DFA16F4(a3);
}

- (_TtC15HomePodSettings22TransportRequestObject)init
{
  sub_22DFA1A2C();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC15HomePodSettings22TransportRequestObject_request);
  swift_bridgeObjectRelease();
}

@end
