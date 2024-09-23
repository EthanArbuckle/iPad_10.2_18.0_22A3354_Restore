@implementation HPSBetaEnrollmentStateChangeRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HPSBetaEnrollmentStateChangeRequest)initWithCoder:(id)a3
{
  return (HPSBetaEnrollmentStateChangeRequest *)sub_22DF5A738(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  HPSBetaEnrollmentStateChangeRequest *v5;

  v4 = a3;
  v5 = self;
  BetaEnrollment.StateChangeRequest.encode(with:)((NSCoder)v4);

}

- (BOOL)isEqual:(id)a3
{
  HPSBetaEnrollmentStateChangeRequest *v4;
  HPSBetaEnrollmentStateChangeRequest *v5;
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
  v6 = BetaEnrollment.StateChangeRequest.isEqual(_:)((uint64_t)v8);

  sub_22DF3A824((uint64_t)v8);
  return v6;
}

- (HPSBetaEnrollmentStateChangeRequest)init
{
  BetaEnrollment.StateChangeRequest.init()();
}

@end
