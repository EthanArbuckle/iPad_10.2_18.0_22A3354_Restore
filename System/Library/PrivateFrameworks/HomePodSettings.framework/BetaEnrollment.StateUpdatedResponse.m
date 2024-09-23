@implementation BetaEnrollment.StateUpdatedResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse)init
{
  return (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse *)BetaEnrollment.StateUpdatedResponse.init()();
}

- (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse)initWithCoder:(id)a3
{
  return (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse *)sub_22DF4A970(a3);
}

- (BOOL)isEqual:(id)a3
{
  _TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse *v4;
  _TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse *v5;
  char v6;
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
  v6 = BetaEnrollment.StateUpdatedResponse.isEqual(_:)((uint64_t)v8);

  sub_22DF3A824((uint64_t)v8);
  return v6 & 1;
}

@end
