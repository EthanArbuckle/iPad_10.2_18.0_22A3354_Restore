@implementation SQLiteDatabase

- (void)dealloc
{
  _TtC21DocumentUnderstanding14SQLiteDatabase *v2;
  objc_super v3;

  v2 = self;
  SQLiteDatabase.deleteTemporary()();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for SQLiteDatabase();
  -[SQLiteDatabase dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding14SQLiteDatabase_internalSQLiteDB));
  swift_bridgeObjectRelease();
  outlined destroy of URL?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding14SQLiteDatabase_temporaryURL);
  swift_bridgeObjectRelease();
}

- (_TtC21DocumentUnderstanding14SQLiteDatabase)init
{
  _TtC21DocumentUnderstanding14SQLiteDatabase *result;

  result = (_TtC21DocumentUnderstanding14SQLiteDatabase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
