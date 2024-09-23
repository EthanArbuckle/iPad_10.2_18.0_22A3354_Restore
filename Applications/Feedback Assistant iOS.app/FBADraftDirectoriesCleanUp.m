@implementation FBADraftDirectoriesCleanUp

+ (void)run
{
  swift_getObjCClassMetadata(a1);
  sub_1000742F8();
}

+ (void)cleanDraftDirectoryWithStalenessDate:(id)a3 filerFormType:(int64_t)a4 url:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Date(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v16 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  sub_100074978((uint64_t)v15, a4, (uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (_TtC18Feedback_Assistant26FBADraftDirectoriesCleanUp)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBADraftDirectoriesCleanUp();
  return -[FBADraftDirectoriesCleanUp init](&v3, "init");
}

@end
