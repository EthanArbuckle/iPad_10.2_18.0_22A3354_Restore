@implementation CoordinationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15HomePodSettings19CoordinationRequest *v5;

  v4 = a3;
  v5 = self;
  sub_22DF55428(v4);

}

- (_TtC15HomePodSettings19CoordinationRequest)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings19CoordinationRequest *)sub_22DF554E4(a3);
}

- (_TtC15HomePodSettings19CoordinationRequest)init
{
  sub_22DF5560C();
}

- (void).cxx_destruct
{
  sub_22DF55714((uint64_t)self + OBJC_IVAR____TtC15HomePodSettings19CoordinationRequest____lazy_storage___request);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HomePodSettings19CoordinationRequest_requestObject));
}

@end
