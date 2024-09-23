@implementation FBADirectoriesMigrator

+ (void)run
{
  swift_getObjCClassMetadata(a1);
  sub_1000933A4();
}

+ (void)deleteOldDirectoriesWithLibraryDirectory:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_getObjCClassMetadata(a1);
  sub_100093A94();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC18Feedback_Assistant22FBADirectoriesMigrator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBADirectoriesMigrator();
  return -[FBADirectoriesMigrator init](&v3, "init");
}

@end
