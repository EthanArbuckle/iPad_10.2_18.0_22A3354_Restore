@implementation InternalStateViewController.Cell

- (_TtCC15HealthRecordsUI27InternalStateViewController4Cell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v5;
  _TtCC15HealthRecordsUI27InternalStateViewController4Cell *v6;
  objc_super v8;

  if (a4)
  {
    sub_1BC62C680();
    v5 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for InternalStateViewController.Cell();
  v6 = -[InternalStateViewController.Cell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 3, v5);

  return v6;
}

- (_TtCC15HealthRecordsUI27InternalStateViewController4Cell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InternalStateViewController.Cell();
  return -[InternalStateViewController.Cell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
