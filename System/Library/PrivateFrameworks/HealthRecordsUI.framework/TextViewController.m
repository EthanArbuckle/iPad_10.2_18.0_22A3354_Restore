@implementation TextViewController

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI18TextViewController *v2;

  v2 = self;
  sub_1BC568238();

}

- (_TtC15HealthRecordsUI18TextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC15HealthRecordsUI18TextViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_1BC62C680();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15HealthRecordsUI18TextViewController____lazy_storage___textView) = 0;
    v6 = a4;
    v7 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15HealthRecordsUI18TextViewController____lazy_storage___textView) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TextViewController();
  v9 = -[TextViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC15HealthRecordsUI18TextViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI18TextViewController____lazy_storage___textView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TextViewController();
  return -[TextViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI18TextViewController____lazy_storage___textView));
}

@end
