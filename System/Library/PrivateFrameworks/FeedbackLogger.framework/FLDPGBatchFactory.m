@implementation FLDPGBatchFactory

+ (id)makeBatchWithPayload:(id)a3 bundleID:(id)a4 schema:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_1B514BC9C();
  v12 = v11;

  v13 = sub_1B514BF00();
  v15 = v14;

  v16 = sub_1B514BF00();
  v18 = v17;

  v19 = sub_1B5134164(v10, v12, v13, v15, v16, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B513303C(v10, v12);
  return v19;
}

+ (BOOL)isDPGBundleID:(id)a3
{
  char v3;

  sub_1B514BF00();
  v3 = sub_1B51346B0();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

+ (BOOL)allowDPGBundleID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = sub_1B514BF00();
  v5 = v4;
  swift_getObjCClassMetadata();
  v6 = sub_1B5134714(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (FLDPGBatchFactory)init
{
  return (FLDPGBatchFactory *)FLDPGBatchFactory.init()();
}

@end
