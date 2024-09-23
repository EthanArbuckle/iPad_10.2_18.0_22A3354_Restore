@implementation CoordinationObservationUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15HomePodSettings29CoordinationObservationUpdate *v5;

  v4 = a3;
  v5 = self;
  sub_22DFD4E34(v4);

}

- (_TtC15HomePodSettings29CoordinationObservationUpdate)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings29CoordinationObservationUpdate *)sub_22DFD4EF8(a3);
}

- (_TtC15HomePodSettings29CoordinationObservationUpdate)init
{
  sub_22DFD5018();
}

- (void).cxx_destruct
{
  sub_22DF55E2C((uint64_t)self + OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate____lazy_storage___observationUpdate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate_observationUpdateObject));
}

@end
