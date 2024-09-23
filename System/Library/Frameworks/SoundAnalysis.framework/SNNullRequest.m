@implementation SNNullRequest

- (double)sampleRate
{
  return sub_1D42CDE80();
}

- (void)setSampleRate:(double)a3
{
  sub_1D42CDEB0(a3);
}

- (unsigned)blockSize
{
  return sub_1D42CDEE0();
}

- (void)setBlockSize:(unsigned int)a3
{
  sub_1D42CDF18(*(uint64_t *)&a3);
}

- (double)computationalDutyCycle
{
  return sub_1D42CDF4C();
}

- (void)setComputationalDutyCycle:(double)a3
{
  sub_1D42CDF80(a3);
}

- (BOOL)graphIsDeadEnded
{
  return sub_1D42CDFB8() & 1;
}

- (void)setGraphIsDeadEnded:(BOOL)a3
{
  sub_1D42CDFF0(a3);
}

- (BOOL)shouldThrowException
{
  return sub_1D42CE028() & 1;
}

- (void)setShouldThrowException:(BOOL)a3
{
  sub_1D42CE060(a3);
}

- (SNNullRequest)init
{
  return (SNNullRequest *)sub_1D42CE0E0();
}

- (id)copyWithZone:(void *)a3
{
  SNNullRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNNullRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNNullRequest.hash.getter();
}

- (BOOL)isEqual:(id)a3
{
  SNNullRequest *v4;
  SNNullRequest *v5;
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
  v6 = SNNullRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6;
}

- (SNNullRequest)initWithCoder:(id)a3
{
  return (SNNullRequest *)SNNullRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNNullRequest *v5;

  v4 = a3;
  v5 = self;
  SNNullRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
