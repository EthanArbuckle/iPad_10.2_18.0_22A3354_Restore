@implementation SNEstimateDirectionOfArrivalRequest

- (NSArray)spatialSpectrum
{
  void *v2;

  v2 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (SNEstimateDirectionOfArrivalRequest)init
{
  return (SNEstimateDirectionOfArrivalRequest *)sub_1D4389E70();
}

- (SNEstimateDirectionOfArrivalRequest)initWithTuningPrefix:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  SNEstimateDirectionOfArrivalRequest *result;

  v3 = sub_1D451A6EC();
  sub_1D438A180(v3, v4);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  SNEstimateDirectionOfArrivalRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNEstimateDirectionOfArrivalRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNEstimateDirectionOfArrivalRequest *v2;
  int64_t v3;

  v2 = self;
  v3 = SNEstimateDirectionOfArrivalRequest.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNEstimateDirectionOfArrivalRequest *v4;
  SNEstimateDirectionOfArrivalRequest *v5;
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
  v6 = SNEstimateDirectionOfArrivalRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42D7018((uint64_t)v8, &qword_1EFE47160);
  return v6 & 1;
}

- (SNEstimateDirectionOfArrivalRequest)initWithCoder:(id)a3
{
  id v3;
  SNEstimateDirectionOfArrivalRequest *result;

  v3 = a3;
  SNEstimateDirectionOfArrivalRequest.init(coder:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNEstimateDirectionOfArrivalRequest *v5;

  v4 = a3;
  v5 = self;
  SNEstimateDirectionOfArrivalRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
