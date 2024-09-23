@implementation ASUIDeviceTableViewCell

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ASUIDeviceTableViewCell();
  -[ASUIDeviceTableViewCell awakeFromNib](&v2, "awakeFromNib");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v6;

  v4 = a4;
  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ASUIDeviceTableViewCell();
  -[ASUIDeviceTableViewCell setSelected:animated:](&v6, "setSelected:animated:", v5, v4);
}

- (_TtC16AccessorySetupUI23ASUIDeviceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC16AccessorySetupUI23ASUIDeviceTableViewCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC16AccessorySetupUI23ASUIDeviceTableViewCell_device) = 0;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC16AccessorySetupUI23ASUIDeviceTableViewCell_device) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ASUIDeviceTableViewCell();
  v9 = -[ASUIDeviceTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtC16AccessorySetupUI23ASUIDeviceTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16AccessorySetupUI23ASUIDeviceTableViewCell_device) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ASUIDeviceTableViewCell();
  return -[ASUIDeviceTableViewCell initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIDeviceTableViewCell_device));
}

@end
