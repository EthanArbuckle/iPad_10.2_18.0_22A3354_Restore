@implementation _SNClassificationResult

- (_SNClassificationResult)init
{
  sub_1D43307A8();
}

- (NSDictionary)classificationDictionary
{
  _SNClassificationResult *v2;
  void *v3;

  v2 = self;
  _SNClassificationResult.classificationDictionary.getter();

  sub_1D42CA5D0(0, (unint64_t *)&qword_1EFE404B0);
  v3 = (void *)sub_1D451A5A8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setClassificationDictionary:(id)a3
{
  uint64_t v4;
  _SNClassificationResult *v5;

  sub_1D42CA5D0(0, (unint64_t *)&qword_1EFE404B0);
  v4 = sub_1D451A5CC();
  v5 = self;
  _SNClassificationResult.classificationDictionary.setter(v4);

}

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

  _SNClassificationResult.timeRange.getter((uint64_t)v9);
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
  double v4[2];
  __int128 v5;
  uint64_t v6;
  int64_t v7;

  var3 = a3->var1.var3;
  v4[0] = *(double *)&a3->var0.var0;
  v4[1] = *(double *)&a3->var0.var1;
  v5 = *(_OWORD *)&a3->var0.var3;
  v6 = *(_QWORD *)&a3->var1.var1;
  v7 = var3;
  _SNClassificationResult.timeRange.setter(v4);
}

- (NSString)classifierIdentifier
{
  uint64_t v2;
  void *v3;

  _SNClassificationResult.classifierIdentifier.getter();
  if (v2)
  {
    v3 = (void *)sub_1D451A6C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setClassifierIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _SNClassificationResult *v7;

  if (a3)
  {
    v4 = sub_1D451A6EC();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  _SNClassificationResult.classifierIdentifier.setter(v4, v6);

}

- (id)_initPrivate:(id)a3
{
  id v4;

  v4 = a3;
  return sub_1D4330EC8(a3);
}

- (_SNClassificationResult)initWithClassificationDictionary:(id)a3
{
  uint64_t v3;
  _SNClassificationResult *result;

  sub_1D42CA5D0(0, (unint64_t *)&qword_1EFE404B0);
  v3 = sub_1D451A5CC();
  sub_1D4330FD0(v3);
  return result;
}

- (id)classificationForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _SNClassificationResult *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = sub_1D451A6EC();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1D43310EC(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (id)classifications
{
  _SNClassificationResult *v2;
  void *v3;

  v2 = self;
  sub_1D4331238();

  type metadata accessor for _SNClassification();
  v3 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1D4331588(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))_SNClassificationResult.copy(with:));
}

- (int64_t)hash
{
  _SNClassificationResult *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  _SNClassificationResult.hash.getter();
  v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1D43317D4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))_SNClassificationResult.isEqual(_:));
}

- (_SNClassificationResult)initWithCoder:(id)a3
{
  return (_SNClassificationResult *)_SNClassificationResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _SNClassificationResult *v5;

  v4 = a3;
  v5 = self;
  _SNClassificationResult.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_1D4331D70(self, (uint64_t)a2, (void (*)(void))_SNClassificationResult.description.getter);
}

- (_SNClassificationResult)initWithBinarySampleRepresentation:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = sub_1D4519C54();
  v6 = v5;

  return (_SNClassificationResult *)sub_1D4331F4C(v4, v6);
}

- (id)binarySampleRepresentation
{
  _SNClassificationResult *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1D4332254();
  v5 = v4;

  v6 = (void *)sub_1D4519C3C();
  sub_1D42B5420(v3, v5);
  return v6;
}

- (_SNClassificationResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6;
  id v7;
  _SNClassificationResult *result;

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
  sub_1D42B7204();
  sub_1D4334130();
}

@end
