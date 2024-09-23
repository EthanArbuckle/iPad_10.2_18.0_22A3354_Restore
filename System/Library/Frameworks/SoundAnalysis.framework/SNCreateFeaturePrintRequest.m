@implementation SNCreateFeaturePrintRequest

- (SNTimeDurationConstraint)windowDurationConstraint
{
  SNCreateFeaturePrintRequest *v2;
  id v3;

  v2 = self;
  v3 = sub_1D4423D08();

  return (SNTimeDurationConstraint *)v3;
}

- (int64_t)featurePrintType
{
  return sub_1D4423DF0();
}

- (void)setFeaturePrintType:(int64_t)a3
{
  sub_1D4423E44(a3);
}

- (float)overlapFactor
{
  return sub_1D4423E74();
}

- (void)setOverlapFactor:(float)a3
{
  SNCreateFeaturePrintRequest *v4;

  v4 = self;
  sub_1D4423ECC(a3);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)windowDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  int v5;
  unsigned int v6;
  int64_t v7;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1D4424050();
  retstr->var0 = (int64_t)result;
  retstr->var1 = v5;
  retstr->var2 = v6;
  retstr->var3 = v7;
  return result;
}

- (void)setWindowDuration:(id *)a3
{
  CMTimeValue var0;
  uint64_t v4;
  CMTimeEpoch var3;
  SNCreateFeaturePrintRequest *v6;

  var0 = a3->var0;
  v4 = *(_QWORD *)&a3->var1;
  var3 = a3->var3;
  v6 = self;
  sub_1D44240BC(var0, v4, var3);

}

- (SNCreateFeaturePrintRequest)init
{
  return (SNCreateFeaturePrintRequest *)sub_1D44241D4();
}

- (SNCreateFeaturePrintRequest)initWithFeaturePrintType:(int64_t)a3
{
  return (SNCreateFeaturePrintRequest *)sub_1D442422C(a3);
}

- (SNCreateFeaturePrintRequest)initWithFeaturePrintType:(int64_t)a3 version:(int64_t)a4 error:(id *)a5
{
  SNCreateFeaturePrintRequest *result;

  sub_1D4424330(a3, a4);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  SNCreateFeaturePrintRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNCreateFeaturePrintRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNCreateFeaturePrintRequest.hash.getter();
}

- (BOOL)isEqual:(id)a3
{
  SNCreateFeaturePrintRequest *v4;
  SNCreateFeaturePrintRequest *v5;
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
  v6 = SNCreateFeaturePrintRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42D7018((uint64_t)v8, &qword_1EFE47160);
  return v6;
}

- (SNCreateFeaturePrintRequest)initWithCoder:(id)a3
{
  return (SNCreateFeaturePrintRequest *)SNCreateFeaturePrintRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNCreateFeaturePrintRequest *v5;

  v4 = a3;
  v5 = self;
  SNCreateFeaturePrintRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
