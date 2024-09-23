@implementation FBADataClientStub

- (id)initForBundle:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_10008C16C(v3);

  return v4;
}

- (void)didLogOutWithCompletion:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  _TtC18Feedback_Assistant17FBADataClientStub *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);

}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
  _QWORD *v6;
  void (*v7)(_QWORD *);
  id v8;
  _TtC18Feedback_Assistant17FBADataClientStub *v9;

  v6 = _Block_copy(a4);
  v7 = (void (*)(_QWORD *))v6[2];
  v8 = a3;
  v9 = self;
  v7(v6);
  _Block_release(v6);

}

- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  sub_100089C4C(self, (uint64_t)a2, (uint64_t)a3, a4, a5, 0xD000000000000018, 0x80000001000D8DF0, 61);
}

- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  sub_100089C4C(self, (uint64_t)a2, (uint64_t)a3, a4, a5, 0xD000000000000024, 0x80000001000D8D90, 66);
}

- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _TtC18Feedback_Assistant17FBADataClientStub *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v9 = sub_10004BB9C(&qword_100116790);
  __chkstk_darwin(v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for URLRequest(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a4);
  v17 = _Block_copy(a5);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_1000EA0D8, 24, 7);
  *(_QWORD *)(v18 + 16) = v16;
  v19 = swift_allocObject(&unk_1000EA100, 24, 7);
  *(_QWORD *)(v19 + 16) = v17;
  v20 = self;
  URLRequest.url.getter();
  v21 = type metadata accessor for URL(0);
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v11, 1, v21) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_10008A1A0((uint64_t)v11, (uint64_t)sub_10008C908, v18, (uint64_t)sub_10008C744, v19);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v21);

    swift_release(v18);
    swift_release(v19);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC18Feedback_Assistant17FBADataClientStub *v17;
  uint64_t v18;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = swift_allocObject(&unk_1000EA088, 24, 7);
  *(_QWORD *)(v15 + 16) = v13;
  v16 = swift_allocObject(&unk_1000EA0B0, 24, 7);
  *(_QWORD *)(v16 + 16) = v14;
  v17 = self;
  sub_10008AE5C((uint64_t)v12, (uint64_t)sub_10008C740, v15, (uint64_t)sub_10008C744, v16);

  swift_release(v15);
  swift_release(v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)dataForURL:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  _TtC18Feedback_Assistant17FBADataClientStub *v15;
  uint64_t v16;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = self;
  _Block_release(v14);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC18Feedback_Assistant17FBADataClientStub *v17;
  uint64_t v18;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = swift_allocObject(&unk_1000EA038, 24, 7);
  *(_QWORD *)(v15 + 16) = v13;
  v16 = swift_allocObject(&unk_1000EA060, 24, 7);
  *(_QWORD *)(v16 + 16) = v14;
  v17 = self;
  sub_10008A1A0((uint64_t)v12, (uint64_t)sub_10008C748, v15, (uint64_t)sub_10008C744, v16);

  swift_release(v15);
  swift_release(v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _TtC18Feedback_Assistant17FBADataClientStub *v19;
  uint64_t v20;

  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = _Block_copy(a7);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = swift_allocObject(&unk_1000E9FE8, 24, 7);
  *(_QWORD *)(v17 + 16) = v15;
  v18 = swift_allocObject(&unk_1000EA010, 24, 7);
  *(_QWORD *)(v18 + 16) = v16;
  v19 = self;
  sub_10008AE5C((uint64_t)v14, (uint64_t)sub_10008C740, v17, (uint64_t)sub_10008C744, v18);

  swift_release(v17);
  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _TtC18Feedback_Assistant17FBADataClientStub *v19;
  uint64_t v20;

  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = _Block_copy(a7);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = swift_allocObject(&unk_1000E9F98, 24, 7);
  *(_QWORD *)(v17 + 16) = v15;
  v18 = swift_allocObject(&unk_1000E9FC0, 24, 7);
  *(_QWORD *)(v18 + 16) = v16;
  v19 = self;
  sub_10008AE5C((uint64_t)v14, (uint64_t)sub_10008C740, v17, (uint64_t)sub_10008C744, v18);

  swift_release(v17);
  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC18Feedback_Assistant17FBADataClientStub *v17;
  uint64_t v18;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = swift_allocObject(&unk_1000E9F48, 24, 7);
  *(_QWORD *)(v15 + 16) = v13;
  v16 = swift_allocObject(&unk_1000E9F70, 24, 7);
  *(_QWORD *)(v16 + 16) = v14;
  v17 = self;
  sub_10008AE5C((uint64_t)v12, (uint64_t)sub_10008C740, v15, (uint64_t)sub_10008C744, v16);

  swift_release(v15);
  swift_release(v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)deleteAtURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _TtC18Feedback_Assistant17FBADataClientStub *v19;
  uint64_t v20;

  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = _Block_copy(a7);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = swift_allocObject(&unk_1000E9EF8, 24, 7);
  *(_QWORD *)(v17 + 16) = v15;
  v18 = swift_allocObject(&unk_1000E9F20, 24, 7);
  *(_QWORD *)(v18 + 16) = v16;
  v19 = self;
  sub_10008AE5C((uint64_t)v14, (uint64_t)sub_10008C740, v17, (uint64_t)sub_10008C744, v18);

  swift_release(v17);
  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (_TtC18Feedback_Assistant17FBADataClientStub)init
{
  _TtC18Feedback_Assistant17FBADataClientStub *result;

  result = (_TtC18Feedback_Assistant17FBADataClientStub *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBADataClientStub", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->bundle[OBJC_IVAR____TtC18Feedback_Assistant17FBADataClientStub_testFixtureDir]);
}

@end
