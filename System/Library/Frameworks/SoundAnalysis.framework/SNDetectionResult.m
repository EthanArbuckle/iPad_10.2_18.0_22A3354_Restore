@implementation SNDetectionResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _QWORD v9[2];
  __int128 v10;
  uint64_t v11;
  int64_t v12;

  SNDetectionResult.timeRange.getter((uint64_t)v9);
  v5 = v12;
  v6 = v9[1];
  v7 = v11;
  v8 = v10;
  retstr->var0.var0 = v9[0];
  *(_QWORD *)&retstr->var0.var1 = v6;
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_QWORD *)&retstr->var1.var1 = v7;
  retstr->var1.var3 = v5;
  return result;
}

- (void)setTimeRange:(id *)a3
{
  int64_t var3;
  _QWORD v4[2];
  __int128 v5;
  uint64_t v6;
  int64_t v7;

  var3 = a3->var1.var3;
  v4[0] = a3->var0.var0;
  v4[1] = *(_QWORD *)&a3->var0.var1;
  v5 = *(_OWORD *)&a3->var0.var3;
  v6 = *(_QWORD *)&a3->var1.var1;
  v7 = var3;
  SNDetectionResult.timeRange.setter((uint64_t)v4);
}

- (double)confidence
{
  return SNDetectionResult.confidence.getter();
}

- (void)setConfidence:(double)a3
{
  SNDetectionResult.confidence.setter(a3);
}

- (BOOL)detected
{
  return SNDetectionResult.detected.getter() & 1;
}

- (void)setDetected:(BOOL)a3
{
  SNDetectionResult.detected.setter(a3);
}

- (NSString)identifier
{
  return (NSString *)sub_1D4479480((uint64_t)self, (uint64_t)a2, SNDetectionResult.identifier.getter);
}

- (void)setIdentifier:(id)a3
{
  sub_1D4479508(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))SNDetectionResult.identifier.setter);
}

- (NSString)detectorIdentifier
{
  return (NSString *)sub_1D4479480((uint64_t)self, (uint64_t)a2, SNDetectionResult.detectorIdentifier.getter);
}

- (void)setDetectorIdentifier:(id)a3
{
  sub_1D4479508(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))SNDetectionResult.detectorIdentifier.setter);
}

- (SNDetectionResult)init
{
  return (SNDetectionResult *)sub_1D4479608();
}

- (SNDetectionResult)initWithIdentifier:(id)a3
{
  SNDetectionResult *result;

  sub_1D451A6EC();
  sub_1D4479670();
  return result;
}

- (SNDetectionResult)initWithIdentifier:(id)a3 detectedValue:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1D451A6EC();
  return (SNDetectionResult *)sub_1D4479714(v5, v6, a4);
}

- (id)copyWithZone:(void *)a3
{
  SNDetectionResult *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNDetectionResult.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNDetectionResult *v2;
  int64_t v3;

  v2 = self;
  v3 = SNDetectionResult.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNDetectionResult *v4;
  SNDetectionResult *v5;
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
  v6 = SNDetectionResult.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNDetectionResult)initWithCoder:(id)a3
{
  return (SNDetectionResult *)SNDetectionResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNDetectionResult *v5;

  v4 = a3;
  v5 = self;
  SNDetectionResult.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  SNDetectionResult *v2;
  void *v3;

  v2 = self;
  SNDetectionResult.description.getter();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (SNDetectionResult)initWithBinarySampleRepresentation:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = sub_1D4519C54();
  v6 = v5;

  return (SNDetectionResult *)sub_1D447A250(v4, v6);
}

- (id)binarySampleRepresentation
{
  SNDetectionResult *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1D447A4A8();
  v5 = v4;

  v6 = (void *)sub_1D4519C3C();
  sub_1D42B5420(v3, v5);
  return v6;
}

- (SNDetectionResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6;
  id v7;
  SNDetectionResult *result;

  v6 = a3;
  v7 = a4;
  sub_1D4519C54();

  sub_1D451A5CC();
  sub_1D43323E0();
  return result;
}

- (id)plistRepresentationWithError:(id *)a3
{
  SNDetectionResult *v3;
  void *v4;
  uint64_t v6[4];

  v3 = self;
  sub_1D447A690(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
