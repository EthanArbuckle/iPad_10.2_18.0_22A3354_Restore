@implementation AddAccountTableViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (_TtC15HealthRecordsUI23AddAccountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC15HealthRecordsUI23AddAccountTableViewCell *v7;
  _TtC15HealthRecordsUI23AddAccountTableViewCell *v8;
  objc_super v10;

  if (a4)
  {
    sub_1BC62C680();
    *((_BYTE *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC15HealthRecordsUI23AddAccountTableViewCell_alignWithAccountTitle) = 0;
    v6 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    *((_BYTE *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC15HealthRecordsUI23AddAccountTableViewCell_alignWithAccountTitle) = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AddAccountTableViewCell();
  v7 = -[HRStandardTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, v6);

  v8 = v7;
  sub_1BC42C000();

  return v8;
}

- (_TtC15HealthRecordsUI23AddAccountTableViewCell)initWithCoder:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI23AddAccountTableViewCell *v5;
  _TtC15HealthRecordsUI23AddAccountTableViewCell *v6;
  _TtC15HealthRecordsUI23AddAccountTableViewCell *v7;
  objc_super v9;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI23AddAccountTableViewCell_alignWithAccountTitle) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AddAccountTableViewCell();
  v4 = a3;
  v5 = -[HRStandardTableViewCell initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_1BC42C000();

  }
  return v6;
}

- (void)tintColorDidChange
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AddAccountTableViewCell();
  v2 = v6.receiver;
  -[AddAccountTableViewCell tintColorDidChange](&v6, sel_tintColorDidChange);
  v3 = objc_msgSend(v2, sel_textLabel, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_tintColor);
    objc_msgSend(v4, sel_setTextColor_, v5);

    v2 = v4;
  }

}

@end
