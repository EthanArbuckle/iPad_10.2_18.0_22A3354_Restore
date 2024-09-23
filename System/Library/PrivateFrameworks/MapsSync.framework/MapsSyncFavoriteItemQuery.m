@implementation MapsSyncFavoriteItemQuery

- (_TtC8MapsSync25MapsSyncFavoriteItemQuery)initWithOptions:(id)a3 delegate:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  return (_TtC8MapsSync25MapsSyncFavoriteItemQuery *)MapsSyncFavoriteItemQuery.init(options:delegate:)(a3);
}

- (_TtC8MapsSync25MapsSyncFavoriteItemQuery)initWithDelegate:(id)a3
{
  return -[MapsSyncFavoriteItemQuery initWithOptions:delegate:](self, sel_initWithOptions_delegate_, 0, a3);
}

- (void)fetchContents:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC8MapsSync25MapsSyncFavoriteItemQuery *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = sub_1A41A73A0;
  v6[3] = v5;
  v7 = self;
  swift_retain();
  sub_1A4162A48((void (*)(_QWORD, _QWORD))sub_1A41A73CC, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC8MapsSync25MapsSyncFavoriteItemQuery *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_1A41A7308;
  v8[3] = v7;
  v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A4162A48((void (*)(_QWORD, _QWORD))sub_1A41A73CC, v8, a3);

  swift_release();
  swift_release();
}

- (void)fetchQueryContents:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC8MapsSync25MapsSyncFavoriteItemQuery *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = sub_1A41A739C;
  v6[3] = v5;
  v7 = self;
  swift_retain();
  sub_1A4162A48((void (*)(_QWORD, _QWORD))sub_1A41A73D0, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchQueryContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC8MapsSync25MapsSyncFavoriteItemQuery *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_1A41A7300;
  v8[3] = v7;
  v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A4162A48((void (*)(_QWORD, _QWORD))sub_1A41A73D0, v8, a3);

  swift_release();
  swift_release();
}

+ (OS_os_log)signpostLog
{
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1ACAA0);
  return (OS_os_log *)(id)sub_1A423C464();
}

- (id)findDuplicates:(id)a3
{
  id v4;
  _TtC8MapsSync25MapsSyncFavoriteItemQuery *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1A41A6780((uint64_t)v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC420);
  v6 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)mergeDuplicateObjectsWithDuplicates:(id)a3
{
  uint64_t v4;
  _TtC8MapsSync25MapsSyncFavoriteItemQuery *v5;
  void *v6;

  type metadata accessor for MapsSyncBaseItem();
  v4 = sub_1A423C1C4();
  v5 = self;
  v6 = (void *)sub_1A41A7024(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC8MapsSync25MapsSyncFavoriteItemQuery)initWithQueryDelegate:(id)a3 predicate:(id)a4
{
  id v5;
  _TtC8MapsSync25MapsSyncFavoriteItemQuery *result;

  swift_unknownObjectRetain();
  v5 = a4;
  result = (_TtC8MapsSync25MapsSyncFavoriteItemQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
