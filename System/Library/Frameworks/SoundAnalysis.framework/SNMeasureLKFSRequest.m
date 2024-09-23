@implementation SNMeasureLKFSRequest

- (SNMeasureLKFSRequest)init
{
  return (SNMeasureLKFSRequest *)sub_1D42F2C1C();
}

- (id)copyWithZone:(void *)a3
{
  SNMeasureLKFSRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNMeasureLKFSRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  int64_t result;

  SNMeasureLKFSRequest.hash.getter();
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SNMeasureLKFSRequest *v4;
  SNMeasureLKFSRequest *v5;
  char v6;
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
  v6 = SNMeasureLKFSRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNMeasureLKFSRequest)initWithCoder:(id)a3
{
  return (SNMeasureLKFSRequest *)SNMeasureLKFSRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNMeasureLKFSRequest *v5;

  v4 = a3;
  v5 = self;
  SNMeasureLKFSRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
