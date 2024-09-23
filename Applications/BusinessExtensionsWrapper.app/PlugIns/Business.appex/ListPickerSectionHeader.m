@implementation ListPickerSectionHeader

- (_TtC8Business23ListPickerSectionHeader)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC8Business23ListPickerSectionHeader *)sub_100054980(v3, v4);
}

- (_TtC8Business23ListPickerSectionHeader)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000553A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23ListPickerSectionHeader_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23ListPickerSectionHeader_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23ListPickerSectionHeader_bottomSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23ListPickerSectionHeader_separatorColor));
}

@end
