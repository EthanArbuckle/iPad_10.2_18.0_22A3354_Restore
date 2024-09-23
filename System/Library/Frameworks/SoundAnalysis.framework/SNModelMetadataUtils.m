@implementation SNModelMetadataUtils

+ (id)validatedFeedbackConnectionsFromModelDescription:(id)a3 orDefault:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  type metadata accessor for SNModelFeatureConnection();
  sub_1D4456098(&qword_1EFE40320, v5, (uint64_t (*)(uint64_t))type metadata accessor for SNModelFeatureConnection, MEMORY[0x1E0DEFCF8]);
  sub_1D451ABFC();
  swift_getObjCClassMetadata();
  v6 = a3;
  sub_1D44C976C(v6);

  swift_bridgeObjectRelease();
  v7 = (void *)sub_1D451ABF0();
  swift_bridgeObjectRelease();
  return v7;
}

- (SNModelMetadataUtils)init
{
  return (SNModelMetadataUtils *)sub_1D42F2C1C();
}

@end
