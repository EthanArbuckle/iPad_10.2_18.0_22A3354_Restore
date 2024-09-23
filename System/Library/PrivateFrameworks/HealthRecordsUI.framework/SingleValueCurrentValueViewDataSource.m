@implementation SingleValueCurrentValueViewDataSource

- (id)titleFor:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BC5B31A4();

  return v6;
}

- (void)updateDataSourceWithGraphView:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  id v9;
  _TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1BC5B25A4(v8, (uint64_t)v9, a5);

}

- (_TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource)initWithDateCache:(id)a3 healthStore:(id)a4 selectedRangeFormatter:(id)a5
{
  char *v8;
  objc_super v10;

  v8 = (char *)self
     + OBJC_IVAR____TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource_lastCachedNumberOfChartPoints;
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SingleValueCurrentValueViewDataSource();
  return -[HKCurrentValueViewDataSource initWithDateCache:healthStore:selectedRangeFormatter:](&v10, sel_initWithDateCache_healthStore_selectedRangeFormatter_, a3, a4, a5);
}

- (_TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self
     + OBJC_IVAR____TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource_lastCachedNumberOfChartPoints;
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SingleValueCurrentValueViewDataSource();
  return -[SingleValueCurrentValueViewDataSource init](&v4, sel_init);
}

@end
