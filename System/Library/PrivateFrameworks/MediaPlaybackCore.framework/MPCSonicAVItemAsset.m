@implementation MPCSonicAVItemAsset

- (MPCSonicAVItemAsset)initWithSonicAVItem:(id)a3
{
  MPCSonicAVItemAsset *result;

  sub_210CBA500(a3);
  return result;
}

- (void).cxx_destruct
{
  sub_210CBB4B4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MPCSonicAVItemAsset_sonicAVItem, (void (*)(uint64_t))MEMORY[0x24BEE4F98], &OBJC_IVAR___MPCSonicAVItemAsset__storage);
}

- (AVAsset)avAsset
{
  MPCSonicAVItemAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_210CBA770();

  return (AVAsset *)v3;
}

- (BOOL)isHLS
{
  MPCSonicAVItemAsset *v2;
  char v3;

  v2 = self;
  v3 = sub_210CBA8AC(MEMORY[0x24BEC6CB8]);

  return v3 & 1;
}

- (BOOL)isEnhancedHLS
{
  MPCSonicAVItemAsset *v2;
  char v3;

  v2 = self;
  v3 = sub_210CBA8AC((uint64_t (*)(uint64_t))MEMORY[0x24BEC6CA8]);

  return v3 & 1;
}

- (void)loadEnhancedHLSAudioFormatsWithCompletion:(id)a3
{
  sub_210CBCD48(self, (int)a2, a3, (uint64_t)&unk_24CAA96F8, (uint64_t)&unk_254A7EC90);
}

- (void)prepareForRate:(float)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  MPCSonicAVItemAsset *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(float *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = v6;
  *(_QWORD *)(v7 + 32) = self;
  v8 = self;
  sub_210C336D8((uint64_t)&unk_254A7EC70, v7);
}

- (MPCSonicAVItemAsset)init
{
  MPCSonicAVItemAsset.init()();
}

@end
