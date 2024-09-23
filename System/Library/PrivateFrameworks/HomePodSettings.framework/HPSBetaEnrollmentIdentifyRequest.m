@implementation HPSBetaEnrollmentIdentifyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HPSBetaEnrollmentIdentifyRequest)init
{
  return (HPSBetaEnrollmentIdentifyRequest *)BetaEnrollment.IdentifyRequest.init()();
}

- (HPSBetaEnrollmentIdentifyRequest)initWithCoder:(id)a3
{
  return (HPSBetaEnrollmentIdentifyRequest *)BetaEnrollment.IdentifyRequest.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  HPSBetaEnrollmentIdentifyRequest *v4;
  HPSBetaEnrollmentIdentifyRequest *v5;
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
  v6 = BetaEnrollment.IdentifyRequest.isEqual(_:)((uint64_t)v8);

  sub_22DF3A824((uint64_t)v8);
  return v6 & 1;
}

@end
