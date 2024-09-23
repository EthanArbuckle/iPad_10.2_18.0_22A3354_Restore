@implementation SNSoundActionsResult

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

  SNSoundActionsResult.timeRange.getter((uint64_t)v9);
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
  SNSoundActionsResult.timeRange.setter((uint64_t)v4);
}

- (double)confidence
{
  return SNSoundActionsResult.confidence.getter();
}

- (void)setConfidence:(double)a3
{
  SNSoundActionsResult.confidence.setter(a3);
}

- (NSString)name
{
  void *v2;

  SNSoundActionsResult.name.getter();
  v2 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SNSoundActionsResult *v7;

  v4 = sub_1D451A6EC();
  v6 = v5;
  v7 = self;
  SNSoundActionsResult.name.setter(v4, v6);

}

- (SNSoundActionsResult)init
{
  return (SNSoundActionsResult *)sub_1D4315430();
}

- (id)copyWithZone:(void *)a3
{
  SNSoundActionsResult *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNSoundActionsResult.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNSoundActionsResult *v2;
  int64_t v3;

  v2 = self;
  v3 = SNSoundActionsResult.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNSoundActionsResult *v4;
  SNSoundActionsResult *v5;
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
  v6 = SNSoundActionsResult.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNSoundActionsResult)initWithCoder:(id)a3
{
  return (SNSoundActionsResult *)SNSoundActionsResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNSoundActionsResult *v5;

  v4 = a3;
  v5 = self;
  SNSoundActionsResult.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  SNSoundActionsResult *v2;
  void *v3;

  v2 = self;
  SNSoundActionsResult.description.getter();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
