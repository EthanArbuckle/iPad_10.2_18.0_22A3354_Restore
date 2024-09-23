@implementation SURLSessionViewModel

- (_TtC13FTMInternal_420SURLSessionViewModel)init
{
  _TtC13FTMInternal_420SURLSessionViewModel *result;

  result = (_TtC13FTMInternal_420SURLSessionViewModel *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.SURLSessionViewModel", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel__model;
  v4 = sub_100146438(&qword_1002B8140);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService));
}

- (void)slicingDescriptorsDidUpdate:(id)a3 withDescriptors:(id)a4 appInfo:(id)a5 andStatus:(BOOL)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  _TtC13FTMInternal_420SURLSessionViewModel *v17;

  v11 = sub_1001548C8(0, &qword_1002B8138, &off_10025DCE0);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = v14;
  v16 = a3;
  v17 = self;
  sub_1001E3B50(v12, v13, v15, a6);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
}

- (void)slicingRunningAppStateChanged:(id)a3
{
  id v4;
  _TtC13FTMInternal_420SURLSessionViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_1001E3DC4(v4);

}

@end
