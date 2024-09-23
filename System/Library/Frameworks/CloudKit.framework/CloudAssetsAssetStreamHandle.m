@implementation CloudAssetsAssetStreamHandle

+ (id)makeAssetStreamHandleWithPartition:(id)a3 owner:(id)a4 accessToken:(id)a5 requestorID:(id)a6 signature:(id)a7 referenceSignature:(id)a8 size:(int64_t)a9 assetKey:(id)a10 filenameExtension:(id)a11 applicationID:(id)a12 error:(id *)a13
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v45 = a13;
  v54 = a1;
  v55 = a9;
  v15 = type metadata accessor for URL();
  v46 = *(_QWORD *)(v15 - 8);
  v47 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v56 = v18;
  v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v57 = v19;
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v50 = v21;
  v51 = v20;
  v22 = a7;
  v23 = a8;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v49 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = v27;

  v48 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v30 = v29;

  v31 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v33 = v32;

  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v36 = v35;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  *(_QWORD *)&v44 = v34;
  *((_QWORD *)&v44 + 1) = v36;
  *(_QWORD *)&v43 = v31;
  *((_QWORD *)&v43 + 1) = v33;
  *((_QWORD *)&v42 + 1) = v55;
  v54 = v30;
  *(_QWORD *)&v42 = v30;
  v37 = v48;
  *((_QWORD *)&v41 + 1) = v48;
  v55 = v28;
  *(_QWORD *)&v41 = v28;
  v38 = v49;
  v39 = static CloudAssetsAssetStreamHandle.makeAssetStreamHandle(partition:owner:accessToken:requestorID:signature:referenceSignature:size:assetKey:filenameExtension:applicationID:)((uint64_t)v17, v53, v56, v52, v57, v51, v50, v49, v41, v42, v43, v44);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18A60FBA4(v31, v33);
  sub_18A60FBA4(v37, (unint64_t)v54);
  sub_18A60FBA4(v38, v55);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v39;
}

- (id)makeAVPlayerItemWith:(id)a3 options:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC8CloudKit28CloudAssetsAssetStreamHandle *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = sub_18A5F101C(&qword_1EDF6B8C0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = type metadata accessor for URL();
    v11 = 0;
  }
  else
  {
    v10 = type metadata accessor for URL();
    v11 = 1;
  }
  sub_18A5F1010((uint64_t)v9, v11, 1, v10);
  if (a4)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = self;
  CloudAssetsAssetStreamHandle.makeAVPlayerItem(with:options:)();
  v14 = v13;

  swift_bridgeObjectRelease();
  sub_18A63DED4((uint64_t)v9);
  return v14;
}

- (id)makeAVAssetExportSessionWith:(id)a3 options:(id)a4 presetName:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC8CloudKit28CloudAssetsAssetStreamHandle *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v8 = sub_18A5F101C(&qword_1EDF6B8C0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = type metadata accessor for URL();
    v12 = 0;
  }
  else
  {
    v11 = type metadata accessor for URL();
    v12 = 1;
  }
  sub_18A5F1010((uint64_t)v10, v12, 1, v11);
  if (a4)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = self;
  CloudAssetsAssetStreamHandle.makeAVAssetExportSession(with:options:presetName:)();
  v15 = v14;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18A63DED4((uint64_t)v10);
  return v15;
}

- (id)initFrom:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;

  return CloudAssetsAssetStreamHandle.init(from:)(v5, v7);
}

- (id)serializedDataAndReturnError:(id *)a3
{
  _TtC8CloudKit28CloudAssetsAssetStreamHandle *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v3 = self;
  v4 = CloudAssetsAssetStreamHandle.serializedData()();
  v6 = v5;

  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_18A60FBA4(v4, v6);
  return isa;
}

- (_TtC8CloudKit28CloudAssetsAssetStreamHandle)init
{
  CloudAssetsAssetStreamHandle.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8CloudKit28CloudAssetsAssetStreamHandle_assetStreamHandle;
  v3 = type metadata accessor for AssetStreamHandle();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (int64_t)size
{
  _TtC8CloudKit28CloudAssetsAssetStreamHandle *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  CloudAssetsAssetStreamHandle.size.getter();
  v4 = v3;

  return v4;
}

@end
