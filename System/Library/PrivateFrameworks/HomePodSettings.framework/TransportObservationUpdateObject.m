@implementation TransportObservationUpdateObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15HomePodSettings32TransportObservationUpdateObject *v5;

  v4 = a3;
  v5 = self;
  sub_22DFD45A8(v4);

}

- (_TtC15HomePodSettings32TransportObservationUpdateObject)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings32TransportObservationUpdateObject *)sub_22DFD47D0(a3);
}

- (_TtC15HomePodSettings32TransportObservationUpdateObject)init
{
  sub_22DFD4B10();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC15HomePodSettings32TransportObservationUpdateObject_observationUpdate);
  swift_bridgeObjectRelease();
}

@end
