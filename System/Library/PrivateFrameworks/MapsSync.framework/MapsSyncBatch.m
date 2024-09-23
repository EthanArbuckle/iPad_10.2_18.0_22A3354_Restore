@implementation MapsSyncBatch

+ (void)commitWithItems:(id)a3 completion:(id)a4
{
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a4);
  type metadata accessor for MapsSyncBaseItem();
  v5 = sub_1A423C1C4();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  swift_getObjCClassMetadata();
  static MapsSyncBatch.commit(items:completion:)(v5, (uint64_t)sub_1A413FF4C, v6);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)mapObjectsByContextWithItems:(id)a3 completion:(id)a4
{
  void *v4;
  unint64_t v5;

  v4 = _Block_copy(a4);
  type metadata accessor for MapsSyncBaseItem();
  v5 = sub_1A423C1C4();
  _Block_copy(v4);
  sub_1A416FC1C(v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);
  swift_bridgeObjectRelease();
}

+ (void)deleteWithItems:(id)a3 completion:(id)a4
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t ObjCClassMetadata;

  v4 = _Block_copy(a4);
  type metadata accessor for MapsSyncBaseItem();
  v5 = sub_1A423C1C4();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1A4170B80(v5, (uint64_t)sub_1A411127C, v6, ObjCClassMetadata);
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC8MapsSync13MapsSyncBatch)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSyncBatch();
  return -[MapsSyncBatch init](&v3, sel_init);
}

@end
