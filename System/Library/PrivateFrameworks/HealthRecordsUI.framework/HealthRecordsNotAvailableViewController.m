@implementation HealthRecordsNotAvailableViewController

- (_TtC15HealthRecordsUI39HealthRecordsNotAvailableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC15HealthRecordsUI39HealthRecordsNotAvailableViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_1BC62C680();
    v6 = a4;
    v7 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HealthRecordsNotAvailableViewController();
  v9 = -[HealthRecordsNotAvailableViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC15HealthRecordsUI39HealthRecordsNotAvailableViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HealthRecordsNotAvailableViewController();
  return -[HealthRecordsNotAvailableViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
