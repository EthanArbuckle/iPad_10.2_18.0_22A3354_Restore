@implementation _SNClassifySoundRequest

- (_SNClassifySoundRequest)init
{
  sub_1D43F2E7C();
}

- (_SNClassifySoundRequest)initWithMLModel:(id)a3 error:(id *)a4
{
  _SNClassifySoundRequest *result;

  sub_1D43F3670((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_1D43F2EE0);
  return result;
}

- (_SNClassifySoundRequest)initWithClassifierIdentifier:(id)a3 error:(id *)a4
{
  _SNClassifySoundRequest *result;

  sub_1D43F3670((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_1D43F35EC);
  return result;
}

- (double)overlapFactor
{
  return sub_1D43F3708();
}

- (BOOL)setOverlapFactor:(double)a3 error:(id *)a4
{
  _SNClassifySoundRequest *v5;

  v5 = self;
  sub_1D43F371C(a3);

  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)windowDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  int v5;
  unsigned int v6;
  int64_t v7;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1D43F3878();
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
  _SNClassifySoundRequest *v6;

  var0 = a3->var0;
  v4 = *(_QWORD *)&a3->var1;
  var3 = a3->var3;
  v6 = self;
  sub_1D43F38E4(var0, v4, var3);

}

- (SNTimeDurationConstraint)windowDurationConstraint
{
  _SNClassifySoundRequest *v2;
  id v3;

  v2 = self;
  v3 = sub_1D43F397C();

  return (SNTimeDurationConstraint *)v3;
}

- (NSArray)knownClassifications
{
  void *v2;

  sub_1D43F3A74();
  v2 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (id)copyWithZone:(void *)a3
{
  _SNClassifySoundRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  _SNClassifySoundRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  _SNClassifySoundRequest *v2;
  int64_t v3;

  v2 = self;
  v3 = _SNClassifySoundRequest.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _SNClassifySoundRequest *v4;
  _SNClassifySoundRequest *v5;
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
  v6 = _SNClassifySoundRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42D7018((uint64_t)v8, &qword_1EFE47160);
  return v6 & 1;
}

- (_SNClassifySoundRequest)initWithCoder:(id)a3
{
  return (_SNClassifySoundRequest *)_SNClassifySoundRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _SNClassifySoundRequest *v5;

  v4 = a3;
  v5 = self;
  _SNClassifySoundRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  double *v7[4];

  v4 = a3;
  sub_1D43F4AF8(v7);

  sub_1D42B5528(v7, (uint64_t)v7[3]);
  v5 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v7);
  return v5;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 64];
  v3 = *(_QWORD *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 72];
  v4 = *(_QWORD *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 80];
  v5 = *(_QWORD *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 88];
  v6 = self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 96];
  sub_1D42B5C3C(*(void **)((char *)&self->super.isa + OBJC_IVAR____SNClassifySoundRequest_impl), *(id *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl], self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 8]);
  v7 = sub_1D42F1F54();
  sub_1D42B5C4C(v7, v8, v2, v3, v4, v5, v6);
  swift_bridgeObjectRelease();
}

@end
