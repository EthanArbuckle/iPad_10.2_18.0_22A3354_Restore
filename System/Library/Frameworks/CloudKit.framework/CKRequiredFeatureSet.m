@implementation CKRequiredFeatureSet

- (CKRequiredFeatureSet)init
{
  return (CKRequiredFeatureSet *)sub_18A6362E4();
}

- (CKRequiredFeatureSet)initWithZoneFeatures:(id)a3 recordFeatures:(id)a4 fieldFeatures:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CKRequiredFeatureSet *result;

  type metadata accessor for CKZoneFeature((uint64_t)self);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for CKRecordFeature(v5);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for CKFieldFeature(v6);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  CKRequiredFeatureSet.init(zoneFeatures:recordFeatures:fieldFeatures:)(v5, v6, v7, v8, v9, v10, v11, v12);
  return result;
}

- (id)zoneFeatures
{
  CKRequiredFeatureSet *v2;
  void *v3;
  void *v4;

  v2 = self;
  CKRequiredFeatureSet.zoneFeatures.getter();
  v4 = v3;

  return v4;
}

- (id)recordFeatures
{
  CKRequiredFeatureSet *v2;
  void *v3;
  void *v4;

  v2 = self;
  CKRequiredFeatureSet.recordFeatures.getter();
  v4 = v3;

  return v4;
}

- (id)fieldFeatures
{
  CKRequiredFeatureSet *v2;
  void *v3;
  void *v4;

  v2 = self;
  CKRequiredFeatureSet.fieldFeatures.getter();
  v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKRequiredFeatureSet *v5;

  v4 = a3;
  v5 = self;
  CKRequiredFeatureSet.encode(with:)((NSCoder)v4);

}

- (CKRequiredFeatureSet)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  return (CKRequiredFeatureSet *)CKRequiredFeatureSet.init(coder:)(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (id)copyWithZone:(void *)a3
{
  CKRequiredFeatureSet *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  CKRequiredFeatureSet.copy(with:)((uint64_t)v3, v6);

  sub_18A608B00(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_18A608B60((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_18A637378(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKRequiredFeatureSet.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18A61E268(self, (uint64_t)a2, CKRequiredFeatureSet.description.getter);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_18A5F37A4();
  sub_18A5F3FF4();
}

@end
