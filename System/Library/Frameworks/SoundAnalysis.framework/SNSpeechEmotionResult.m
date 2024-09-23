@implementation SNSpeechEmotionResult

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

  SNSpeechEmotionResult.timeRange.getter((uint64_t)v9);
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
  SNSpeechEmotionResult.timeRange.setter((uint64_t)v4);
}

- (double)confidence
{
  return SNSpeechEmotionResult.confidence.getter();
}

- (void)setConfidence:(double)a3
{
  SNSpeechEmotionResult.confidence.setter(a3);
}

- (double)mood
{
  return SNSpeechEmotionResult.mood.getter();
}

- (void)setMood:(double)a3
{
  SNSpeechEmotionResult.mood.setter(a3);
}

- (double)valence
{
  return SNSpeechEmotionResult.valence.getter();
}

- (void)setValence:(double)a3
{
  SNSpeechEmotionResult.valence.setter(a3);
}

- (double)arousal
{
  return SNSpeechEmotionResult.arousal.getter();
}

- (void)setArousal:(double)a3
{
  SNSpeechEmotionResult.arousal.setter(a3);
}

- (double)dominance
{
  return SNSpeechEmotionResult.dominance.getter();
}

- (void)setDominance:(double)a3
{
  SNSpeechEmotionResult.dominance.setter(a3);
}

- (NSString)modelIdentifier
{
  void *v2;

  SNSpeechEmotionResult.modelIdentifier.getter();
  v2 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setModelIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SNSpeechEmotionResult *v7;

  v4 = sub_1D451A6EC();
  v6 = v5;
  v7 = self;
  SNSpeechEmotionResult.modelIdentifier.setter(v4, v6);

}

- (SNSpeechEmotionResult)init
{
  return (SNSpeechEmotionResult *)sub_1D441DC48();
}

- (SNSpeechEmotionResult)initWithMood:(double)a3 valence:(double)a4 arousal:(double)a5 dominance:(double)a6
{
  return (SNSpeechEmotionResult *)sub_1D441DCC8(a3, a4, a5, a6);
}

- (id)copyWithZone:(void *)a3
{
  SNSpeechEmotionResult *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNSpeechEmotionResult.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNSpeechEmotionResult *v2;
  int64_t v3;

  v2 = self;
  v3 = SNSpeechEmotionResult.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNSpeechEmotionResult *v4;
  SNSpeechEmotionResult *v5;
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
  v6 = SNSpeechEmotionResult.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNSpeechEmotionResult)initWithCoder:(id)a3
{
  return (SNSpeechEmotionResult *)SNSpeechEmotionResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNSpeechEmotionResult *v5;

  v4 = a3;
  v5 = self;
  SNSpeechEmotionResult.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  SNSpeechEmotionResult *v2;
  void *v3;

  v2 = self;
  SNSpeechEmotionResult.description.getter();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (SNSpeechEmotionResult)initWithBinarySampleRepresentation:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = sub_1D4519C54();
  v6 = v5;

  return (SNSpeechEmotionResult *)sub_1D441E8E0(v4, v6);
}

- (id)binarySampleRepresentation
{
  SNSpeechEmotionResult *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1D441EB2C();
  v5 = v4;

  v6 = (void *)sub_1D4519C3C();
  sub_1D42B5420(v3, v5);
  return v6;
}

- (SNSpeechEmotionResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6;
  id v7;
  SNSpeechEmotionResult *result;

  v6 = a3;
  v7 = a4;
  sub_1D4519C54();

  sub_1D451A5CC();
  sub_1D43323E0();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
