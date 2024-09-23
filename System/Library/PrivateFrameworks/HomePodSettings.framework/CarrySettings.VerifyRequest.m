@implementation CarrySettings.VerifyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings13CarrySettings13VerifyRequest)initWithCoder:(id)a3
{
  return (_TtCO15HomePodSettings13CarrySettings13VerifyRequest *)sub_22DFA043C(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtCO15HomePodSettings13CarrySettings13VerifyRequest *v5;

  v4 = a3;
  v5 = self;
  CarrySettings.VerifyRequest.encode(with:)((NSCoder)v4);

}

- (BOOL)isEqual:(id)a3
{
  _TtCO15HomePodSettings13CarrySettings13VerifyRequest *v4;
  _TtCO15HomePodSettings13CarrySettings13VerifyRequest *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22DFDDBB0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CarrySettings.VerifyRequest.isEqual(_:)((uint64_t)v8);

  sub_22DF3A824((uint64_t)v8);
  return v6;
}

- (_TtCO15HomePodSettings13CarrySettings13VerifyRequest)init
{
  CarrySettings.VerifyRequest.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
