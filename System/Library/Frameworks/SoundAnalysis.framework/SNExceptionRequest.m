@implementation SNExceptionRequest

- (int64_t)exceptionLocation
{
  return sub_1D4344C7C();
}

- (void)setExceptionLocation:(int64_t)a3
{
  sub_1D4344CB0(a3);
}

- (SNExceptionRequest)initWithExceptionLocation:(int64_t)a3
{
  return (SNExceptionRequest *)sub_1D4344D00(a3);
}

- (SNExceptionRequest)init
{
  return (SNExceptionRequest *)sub_1D4344D68();
}

- (id)copyWithZone:(void *)a3
{
  SNExceptionRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNExceptionRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  int64_t result;

  SNExceptionRequest.hash.getter();
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SNExceptionRequest *v4;
  SNExceptionRequest *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = SNExceptionRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6;
}

- (SNExceptionRequest)initWithCoder:(id)a3
{
  return (SNExceptionRequest *)SNExceptionRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNExceptionRequest *v5;

  v4 = a3;
  v5 = self;
  SNExceptionRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
