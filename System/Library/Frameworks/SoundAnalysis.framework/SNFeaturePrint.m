@implementation SNFeaturePrint

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

  SNFeaturePrint.timeRange.getter((uint64_t)v9);
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
  SNFeaturePrint.timeRange.setter((uint64_t)v4);
}

- (int64_t)featurePrintType
{
  return SNFeaturePrint.featurePrintType.getter();
}

- (void)setFeaturePrintType:(int64_t)a3
{
  SNFeaturePrint.featurePrintType.setter(a3);
}

- (MLMultiArray)featureVector
{
  return (MLMultiArray *)SNFeaturePrint.featureVector.getter();
}

- (void)setFeatureVector:(id)a3
{
  id v4;
  SNFeaturePrint *v5;

  v4 = a3;
  v5 = self;
  SNFeaturePrint.featureVector.setter((uint64_t)v4);

}

- (SNFeaturePrint)init
{
  return (SNFeaturePrint *)sub_1D444A2B0();
}

- (id)copyWithZone:(void *)a3
{
  SNFeaturePrint *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNFeaturePrint.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNFeaturePrint *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  SNFeaturePrint.hash.getter();
  v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SNFeaturePrint *v4;
  SNFeaturePrint *v5;
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
  v6 = SNFeaturePrint.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNFeaturePrint)initWithCoder:(id)a3
{
  return (SNFeaturePrint *)SNFeaturePrint.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNFeaturePrint *v5;

  v4 = a3;
  v5 = self;
  SNFeaturePrint.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNFeaturePrint)initWithFeaturePrintType:(int64_t)a3 featureVector:(id)a4
{
  return (SNFeaturePrint *)sub_1D444AA10(a3, a4);
}

+ (id)cosineSimilarityBetweenOneFloat32Array:(float *)a3 andAnotherFloat32Array:(float *)a4 length:(int64_t)a5 error:(id *)a6
{
  return sub_1D444AB74(a3, a4, a5);
}

+ (id)cosineSimilarityBetweenOneFeatureVector:(id)a3 andAnotherFeatureVector:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  sub_1D444AECC(v6, v7);
  v9 = v8;

  return v9;
}

- (NSString)description
{
  SNFeaturePrint *v2;
  void *v3;

  v2 = self;
  SNFeaturePrint.description.getter();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{

}

@end
