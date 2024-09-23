@implementation DigitalPresentmentResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV26DigitalPresentmentResponse *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_20A1A8C1C();
  v7 = (id)sub_20A1A8D9C();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (_TtC7CoreIDV26DigitalPresentmentResponse)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV26DigitalPresentmentResponse *)DigitalPresentmentResponse.init(coder:)(a3);
}

- (_TtC7CoreIDV26DigitalPresentmentResponse)init
{
  _TtC7CoreIDV26DigitalPresentmentResponse *result;

  result = (_TtC7CoreIDV26DigitalPresentmentResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20A120E74(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7CoreIDV26DigitalPresentmentResponse_encryptedData), *(_QWORD *)&self->encryptedData[OBJC_IVAR____TtC7CoreIDV26DigitalPresentmentResponse_encryptedData]);
}

@end
