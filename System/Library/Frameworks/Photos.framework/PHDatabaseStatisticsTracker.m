@implementation PHDatabaseStatisticsTracker

- (void)addManagedObjectContext:(id)a3
{
  id v4;
  _TtC6Photos27PHDatabaseStatisticsTracker *v5;

  v4 = a3;
  v5 = self;
  sub_1992189B4(v4);

}

- (int64_t)currentByteCount
{
  _TtC6Photos27PHDatabaseStatisticsTracker *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_199218C88();
  v4 = v3;

  return v4;
}

- (void)enableGatheringSqlStatements
{
  _TtC6Photos27PHDatabaseStatisticsTracker *v2;

  v2 = self;
  sub_199218F54();

}

- (void)disableGatheringSqlStatements
{
  _TtC6Photos27PHDatabaseStatisticsTracker *v2;

  v2 = self;
  sub_199219238();

}

- (NSArray)sqlStatements
{
  _TtC6Photos27PHDatabaseStatisticsTracker *v2;
  void *v3;

  v2 = self;
  sub_1992195D4();

  v3 = (void *)sub_199428034();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)removeAllSqlStatements
{
  _TtC6Photos27PHDatabaseStatisticsTracker *v2;

  v2 = self;
  sub_199219618();

}

- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC6Photos27PHDatabaseStatisticsTracker *v16;
  uint64_t v17;

  v10 = sub_199428004();
  v12 = v11;
  v13 = sub_199428040();
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_199219698((uint64_t)v16, v17, v10, v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC6Photos27PHDatabaseStatisticsTracker)init
{
  _TtC6Photos27PHDatabaseStatisticsTracker *result;

  sub_199219A58();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
