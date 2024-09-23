@implementation DeviceSelectorCell

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DeviceSelectorCell();
  -[CardViewCell layoutSubviews](&v2, "layoutSubviews");
}

- (_TtC11Diagnostics18DeviceSelectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DARootViewController *v5;
  DARootViewController *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC11Diagnostics18DeviceSelectorCell *)sub_1000B270C(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics18DeviceSelectorCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics18DeviceSelectorCell *)sub_1000B283C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_deviceViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_dedDevice));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_deviceInformationView));
}

@end
