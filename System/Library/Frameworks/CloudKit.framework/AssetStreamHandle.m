@implementation AssetStreamHandle

+ (C2RequestOptions)networkRequestOptions
{
  return (C2RequestOptions *)sub_18A65F614();
}

+ (void)makeAssetStreamHandleFrom:(NSURL *)a3 with:(NSData *)a4 for:(NSString *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSURL *v12;
  NSData *v13;
  NSString *v14;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = a1;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  sub_18A65FE34((uint64_t)&unk_1EDF6BEB8, (uint64_t)v11);
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

  return AssetStreamHandle.init(from:)(v5, v7);
}

- (id)serializedDataAndReturnError:(id *)a3
{
  _TtC8CloudKit17AssetStreamHandle *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v3 = self;
  v4 = AssetStreamHandle.serializedData()();
  v6 = v5;

  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_18A60FBA4(v4, v6);
  return isa;
}

- (id)makeAVPlayerItemWith:(id)a3 options:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC8CloudKit17AssetStreamHandle *v12;
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
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = self;
  AssetStreamHandle.makeAVPlayerItem(with:options:)((uint64_t)v9, (uint64_t)a4);
  v14 = v13;

  swift_bridgeObjectRelease();
  sub_18A60FCC4((uint64_t)v9, &qword_1EDF6B8C0);
  return v14;
}

- (id)makeAVAssetExportSessionWith:(id)a3 options:(id)a4 presetName:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC8CloudKit17AssetStreamHandle *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v8 = sub_18A5F101C(&qword_1EDF6B8C0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
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
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;
  v16 = self;
  AssetStreamHandle.makeAVAssetExportSession(with:options:presetName:)((uint64_t)v10, (uint64_t)a4, v13, v15);
  v18 = v17;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18A60FCC4((uint64_t)v10, &qword_1EDF6B8C0);
  return v18;
}

- (_TtC8CloudKit17AssetStreamHandle)init
{
  AssetStreamHandle.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)size
{
  _TtC8CloudKit17AssetStreamHandle *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  AssetStreamHandle.size.getter();
  v4 = v3;

  return v4;
}

@end
