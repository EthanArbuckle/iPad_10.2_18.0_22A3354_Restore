@implementation _SNClassification

- (NSString)identifier
{
  void *v2;

  _SNClassification.identifier.getter();
  v2 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _SNClassification *v7;

  v4 = sub_1D451A6EC();
  v6 = v5;
  v7 = self;
  _SNClassification.identifier.setter(v4, v6);

}

- (double)confidence
{
  return _SNClassification.confidence.getter();
}

- (void)setConfidence:(double)a3
{
  _SNClassification.confidence.setter(a3);
}

- (_SNClassification)init
{
  sub_1D43300F0();
}

- (_SNClassification)initWithIdentifier:(id)a3 confidence:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  _SNClassification *result;

  v5 = sub_1D451A6EC();
  sub_1D4330148(v5, v6, a4);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1D4331588(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))_SNClassification.copy(with:));
}

- (int64_t)hash
{
  _SNClassification *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  _SNClassification.hash.getter();
  v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1D43317D4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))_SNClassification.isEqual(_:));
}

- (_SNClassification)initWithCoder:(id)a3
{
  _SNClassification *result;

  _SNClassification.init(coder:)(a3);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _SNClassification *v5;

  v4 = a3;
  v5 = self;
  _SNClassification.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_1D4331D70(self, (uint64_t)a2, (void (*)(void))_SNClassification.description.getter);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
