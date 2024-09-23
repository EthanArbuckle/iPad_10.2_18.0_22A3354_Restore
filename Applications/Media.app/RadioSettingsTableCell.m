@implementation RadioSettingsTableCell

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5Media22RadioSettingsTableCell *v6;

  v6 = self;
  sub_10002D3FC(a3, a4, (SEL *)&selRef_setSelected_animated_);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5Media22RadioSettingsTableCell *v6;

  v6 = self;
  sub_10002D3FC(a3, a4, (SEL *)&selRef_setHighlighted_animated_);

}

- (_TtC5Media22RadioSettingsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC5Media22RadioSettingsTableCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Media22RadioSettingsTableCell_enabled) = 1;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
    *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Media22RadioSettingsTableCell_enabled) = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RadioSettingsTableCell();
  v9 = -[RadioSettingsTableCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtC5Media22RadioSettingsTableCell)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Media22RadioSettingsTableCell_enabled) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RadioSettingsTableCell();
  return -[RadioSettingsTableCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
