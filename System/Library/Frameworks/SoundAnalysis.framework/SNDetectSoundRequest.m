@implementation SNDetectSoundRequest

+ (NSArray)allValidSoundIdentifiers
{
  return (NSArray *)sub_1D42ECE7C((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1D42ECD90, type metadata accessor for SNSoundIdentifier);
}

+ (NSArray)allValidDetectorIdentifiers
{
  return (NSArray *)sub_1D42ECE7C((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1D42ECEBC, type metadata accessor for SNDetectorIdentifier);
}

- (NSString)soundIdentifier
{
  SNDetectSoundRequest *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D42ED118();
  v4 = v3;

  return (NSString *)v4;
}

- (void)setSoundIdentifier:(id)a3
{
  id v4;
  SNDetectSoundRequest *v5;

  v4 = a3;
  v5 = self;
  sub_1D42ED198(v4);

}

- (MLModelConfiguration)modelConfiguration
{
  return (MLModelConfiguration *)sub_1D42ED200();
}

- (void)setModelConfiguration:(id)a3
{
  id v4;
  SNDetectSoundRequest *v5;

  v4 = a3;
  v5 = self;
  sub_1D42ED25C((uint64_t)v4);

}

- (SNDetectSoundRequest)init
{
  sub_1D42ED430();
}

- (id)copyWithZone:(void *)a3
{
  SNDetectSoundRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNDetectSoundRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNDetectSoundRequest *v2;
  int64_t v3;

  v2 = self;
  v3 = SNDetectSoundRequest.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNDetectSoundRequest *v4;
  SNDetectSoundRequest *v5;
  unsigned __int8 v6;
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
  v6 = SNDetectSoundRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNDetectSoundRequest)initWithCoder:(id)a3
{
  return (SNDetectSoundRequest *)SNDetectSoundRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNDetectSoundRequest *v5;

  v4 = a3;
  v5 = self;
  SNDetectSoundRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNDetectSoundRequest)initWithSoundIdentifier:(id)a3 shouldUseTwoPassDetection:(BOOL)a4
{
  SNDetectSoundRequest *result;

  sub_1D42EDACC(a3);
  return result;
}

- (SNDetectSoundRequest)initWithSoundIdentifier:(id)a3
{
  return (SNDetectSoundRequest *)sub_1D42EDB2C(a3);
}

- (SNDetectSoundRequest)initWithDetectorIdentifier:(id)a3 error:(id *)a4
{
  SNDetectSoundRequest *result;

  sub_1D42EE21C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *))sub_1D42EDDF4);
  return result;
}

- (SNDetectSoundRequest)initWithVGGishBasedMLModel:(id)a3 soundIdentifier:(id)a4
{
  return (SNDetectSoundRequest *)sub_1D42EDF68((uint64_t)a3, a4);
}

- (SNDetectSoundRequest)initWithMLModel:(id)a3 error:(id *)a4
{
  SNDetectSoundRequest *result;

  sub_1D42EE21C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *))sub_1D42EE010);
  return result;
}

- (NSString)description
{
  SNDetectSoundRequest *v2;
  void *v3;

  v2 = self;
  SNDetectSoundRequest.description.getter();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  uint64_t v7[4];

  v4 = a3;
  sub_1D42EE3D8(v7);

  sub_1D42B5528(v7, v7[3]);
  v5 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v7);
  return v5;
}

- (void).cxx_destruct
{
  void *v2;

  v2 = *(void **)&self->impl[OBJC_IVAR___SNDetectSoundRequest_impl + 32];
  sub_1D42B62C8(*(void **)((char *)&self->super.isa + OBJC_IVAR___SNDetectSoundRequest_impl), *(void **)&self->impl[OBJC_IVAR___SNDetectSoundRequest_impl], self->impl[OBJC_IVAR___SNDetectSoundRequest_impl + 8]);

  swift_bridgeObjectRelease();
}

@end
