@implementation SNShazamSignatureResult

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

  SNShazamSignatureResult.timeRange.getter((uint64_t)v9);
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
  SNShazamSignatureResult.timeRange.setter((uint64_t)v4);
}

- (SHSignature)signature
{
  return (SHSignature *)SNShazamSignatureResult.signature.getter();
}

- (void)setSignature:(id)a3
{
  id v4;
  SNShazamSignatureResult *v5;

  v4 = a3;
  v5 = self;
  SNShazamSignatureResult.signature.setter((uint64_t)v4);

}

- (unint64_t)sequenceNum
{
  return SNShazamSignatureResult.sequenceNum.getter();
}

- (void)setSequenceNum:(unint64_t)a3
{
  SNShazamSignatureResult.sequenceNum.setter(a3);
}

- (SNShazamSignatureResult)initWithSignature:(id)a3 sequenceNum:(unint64_t)a4
{
  return (SNShazamSignatureResult *)sub_1D43B3F80(a3, a4);
}

- (id)copyWithZone:(void *)a3
{
  SNShazamSignatureResult *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNShazamSignatureResult.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNShazamSignatureResult *v2;
  int64_t v3;

  v2 = self;
  v3 = SNShazamSignatureResult.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNShazamSignatureResult *v4;
  SNShazamSignatureResult *v5;
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
  v6 = SNShazamSignatureResult.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNShazamSignatureResult)initWithCoder:(id)a3
{
  return (SNShazamSignatureResult *)SNShazamSignatureResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNShazamSignatureResult *v5;

  v4 = a3;
  v5 = self;
  SNShazamSignatureResult.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  SNShazamSignatureResult *v2;
  void *v3;

  v2 = self;
  SNShazamSignatureResult.description.getter();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (SNShazamSignatureResult)init
{
  SNShazamSignatureResult.init()();
}

- (void).cxx_destruct
{

}

@end
