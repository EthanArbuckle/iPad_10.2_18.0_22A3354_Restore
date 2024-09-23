@implementation SNAudioCorrelationResult

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

  SNAudioCorrelationResult.timeRange.getter((uint64_t)v9);
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
  SNAudioCorrelationResult.timeRange.setter((uint64_t)v4);
}

- (double)peakValue
{
  return sub_1D44C2420();
}

- (void)setPeakValue:(double)a3
{
  sub_1D44C1730(a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)peakTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  int v5;
  unsigned int v6;
  int64_t v7;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1D44C2488();
  retstr->var0 = (int64_t)result;
  retstr->var1 = v5;
  retstr->var2 = v6;
  retstr->var3 = v7;
  return result;
}

- (void)setPeakTime:(id *)a3
{
  sub_1D44C177C(a3->var0, *(_QWORD *)&a3->var1, a3->var3);
}

- (int64_t)channelIndex
{
  return sub_1D44C24E8();
}

- (void)setChannelIndex:(int64_t)a3
{
  sub_1D44C171C(a3);
}

- (SNAudioCorrelationResult)init
{
  return (SNAudioCorrelationResult *)sub_1D44C2520();
}

- (id)copyWithZone:(void *)a3
{
  SNAudioCorrelationResult *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNAudioCorrelationResult.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNAudioCorrelationResult.hash.getter();
}

- (BOOL)isEqual:(id)a3
{
  SNAudioCorrelationResult *v4;
  SNAudioCorrelationResult *v5;
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
  v6 = SNAudioCorrelationResult.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6;
}

- (SNAudioCorrelationResult)initWithCoder:(id)a3
{
  return (SNAudioCorrelationResult *)SNAudioCorrelationResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNAudioCorrelationResult *v5;

  v4 = a3;
  v5 = self;
  SNAudioCorrelationResult.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  SNAudioCorrelationResult *v2;
  void *v3;

  v2 = self;
  SNAudioCorrelationResult.description.getter();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
