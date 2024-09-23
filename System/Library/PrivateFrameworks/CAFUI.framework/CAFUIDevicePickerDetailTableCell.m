@implementation CAFUIDevicePickerDetailTableCell

- (void)prepareForReuse
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAFUIDevicePickerDetailTableCell();
  v2 = v3.receiver;
  -[CAFUITableCell prepareForReuse](&v3, sel_prepareForReuse);
  v2[OBJC_IVAR____TtC5CAFUI32CAFUIDevicePickerDetailTableCell_isEnabled] = 1;

}

- (_TtC5CAFUI32CAFUIDevicePickerDetailTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  void *v7;
  _TtC5CAFUI32CAFUIDevicePickerDetailTableCell *v8;
  objc_super v10;

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((_BYTE *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC5CAFUI32CAFUIDevicePickerDetailTableCell_isEnabled) = 1;
    v7 = (void *)MEMORY[0x23B812F68](v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    *((_BYTE *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC5CAFUI32CAFUIDevicePickerDetailTableCell_isEnabled) = 1;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CAFUIDevicePickerDetailTableCell();
  v8 = -[CAFUITableCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, v7);

  return v8;
}

@end
