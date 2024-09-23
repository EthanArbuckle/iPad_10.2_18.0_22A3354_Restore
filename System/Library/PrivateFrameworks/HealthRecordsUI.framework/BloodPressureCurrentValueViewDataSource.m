@implementation BloodPressureCurrentValueViewDataSource

- (_TtC15HealthRecordsUI39BloodPressureCurrentValueViewDataSource)initWithDateCache:(id)a3 healthStore:(id)a4 selectedRangeFormatter:(id)a5
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BloodPressureCurrentValueViewDataSource();
  return -[HKCurrentValueViewDataSource initWithDateCache:healthStore:selectedRangeFormatter:](&v9, sel_initWithDateCache_healthStore_selectedRangeFormatter_, a3, a4, a5);
}

- (_TtC15HealthRecordsUI39BloodPressureCurrentValueViewDataSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BloodPressureCurrentValueViewDataSource();
  return -[BloodPressureCurrentValueViewDataSource init](&v3, sel_init);
}

@end
