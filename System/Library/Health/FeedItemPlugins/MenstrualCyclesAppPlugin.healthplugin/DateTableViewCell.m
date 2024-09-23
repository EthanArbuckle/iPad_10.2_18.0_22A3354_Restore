@implementation DateTableViewCell

- (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell)init
{
  uint64_t ObjectType;
  void *v4;
  _TtC24MenstrualCyclesAppPlugin17DateTableViewCell *v5;

  ObjectType = swift_getObjectType();
  (*(void (**)(void))(ObjectType + 80))();
  v4 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  v5 = -[DateTableViewCell initWithStyle:reuseIdentifier:](self, sel_initWithStyle_reuseIdentifier_, 1, v4);

  return v5;
}

- (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC24MenstrualCyclesAppPlugin17DateTableViewCell *v7;
  objc_super v9;

  if (a4)
  {
    _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    v6 = (void *)sub_231CA1BD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DateTableViewCell();
  v7 = -[DateTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, v6);

  -[DateTableViewCell setSelectionStyle:](v7, sel_setSelectionStyle_, 0);
  return v7;
}

- (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell)initWithCoder:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin17DateTableViewCell *result;

  result = (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

@end
