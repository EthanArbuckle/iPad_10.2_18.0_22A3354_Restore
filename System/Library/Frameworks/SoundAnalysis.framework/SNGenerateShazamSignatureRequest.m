@implementation SNGenerateShazamSignatureRequest

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)windowDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1D443A88C(sub_1D443A820, (uint64_t)retstr);
}

- (void)setWindowDuration:(id *)a3
{
  sub_1D443A860(a3->var0, *(_QWORD *)&a3->var1, a3->var3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)strideDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1D443A88C(sub_1D443A8C0, (uint64_t)retstr);
}

- (void)setStrideDuration:(id *)a3
{
  sub_1D443A900(a3->var0, *(_QWORD *)&a3->var1, a3->var3);
}

- (double)ringBufferDuration
{
  return sub_1D443A940();
}

- (void)setRingBufferDuration:(double)a3
{
  sub_1D443A96C(a3);
}

- (SNGenerateShazamSignatureRequest)init
{
  return (SNGenerateShazamSignatureRequest *)sub_1D443A980();
}

- (SNGenerateShazamSignatureRequest)initWithWindowDuration:(id *)a3 strideDuration:(id *)a4 ringBufferDuration:(double)a5
{
  return (SNGenerateShazamSignatureRequest *)sub_1D443AA34(a3->var0, *(_QWORD *)&a3->var1, a3->var3, a4->var0, *(_QWORD *)&a4->var1, a4->var3, a5);
}

- (id)copyWithZone:(void *)a3
{
  SNGenerateShazamSignatureRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNGenerateShazamSignatureRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  int64_t result;

  SNGenerateShazamSignatureRequest.hash.getter();
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SNGenerateShazamSignatureRequest *v4;
  SNGenerateShazamSignatureRequest *v5;
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
  v6 = SNGenerateShazamSignatureRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6;
}

- (SNGenerateShazamSignatureRequest)initWithCoder:(id)a3
{
  return (SNGenerateShazamSignatureRequest *)SNGenerateShazamSignatureRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNGenerateShazamSignatureRequest *v5;

  v4 = a3;
  v5 = self;
  SNGenerateShazamSignatureRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)getRingBufferDuration
{
  return sub_1D443A940();
}

+ (SNShazamMixingOptions)shazamChannelsMixingInfo
{
  SNShazamMixingOptions *result;
  float v5;
  unsigned __int16 v6;
  uint64_t v7;
  unsigned __int16 v8;
  float v9;
  unsigned __int16 v10;
  uint64_t v11;

  sub_1D443B010((uint64_t)&v8);
  v5 = v9;
  v6 = v10;
  v7 = v11;
  retstr->var0 = v8;
  retstr->var1 = v5;
  retstr->var2 = v6;
  *(_QWORD *)&retstr->var3 = v7;
  return result;
}

@end
