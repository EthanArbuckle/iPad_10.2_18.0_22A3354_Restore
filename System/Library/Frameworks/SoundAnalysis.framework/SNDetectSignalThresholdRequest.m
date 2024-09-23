@implementation SNDetectSignalThresholdRequest

- (double)sampleRate
{
  return sub_1D42D17D8();
}

- (void)setSampleRate:(double)a3
{
  sub_1D42D1808(a3);
}

- (unsigned)blockSize
{
  return sub_1D42D1838();
}

- (void)setBlockSize:(unsigned int)a3
{
  sub_1D42D1870(*(uint64_t *)&a3);
}

- (double)magnitudeThreshold
{
  return sub_1D42D18A4();
}

- (void)setMagnitudeThreshold:(double)a3
{
  sub_1D42D18D8(a3);
}

- (SNDetectSignalThresholdRequest)init
{
  return (SNDetectSignalThresholdRequest *)sub_1D42D1948();
}

- (id)copyWithZone:(void *)a3
{
  SNDetectSignalThresholdRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNDetectSignalThresholdRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  int64_t result;

  SNDetectSignalThresholdRequest.hash.getter();
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SNDetectSignalThresholdRequest *v4;
  SNDetectSignalThresholdRequest *v5;
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
  v6 = SNDetectSignalThresholdRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6;
}

- (SNDetectSignalThresholdRequest)initWithCoder:(id)a3
{
  return (SNDetectSignalThresholdRequest *)SNDetectSignalThresholdRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNDetectSignalThresholdRequest *v5;

  v4 = a3;
  v5 = self;
  SNDetectSignalThresholdRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
