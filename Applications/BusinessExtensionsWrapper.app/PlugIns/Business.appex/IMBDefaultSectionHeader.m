@implementation IMBDefaultSectionHeader

- (UILabel)headerLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader_headerLabel));
}

- (_TtC8Business23IMBDefaultSectionHeader)initWithReuseIdentifier:(id)a3
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
  return (_TtC8Business23IMBDefaultSectionHeader *)sub_10008D2E8(v3, v4);
}

- (_TtC8Business23IMBDefaultSectionHeader)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8Business23IMBDefaultSectionHeader *result;

  v5 = OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader_headerLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader____lazy_storage___separatorView) = 0;

  result = (_TtC8Business23IMBDefaultSectionHeader *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBDefaultSectionHeader.swift", 38, 2, 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader____lazy_storage___separatorView));
}

@end
