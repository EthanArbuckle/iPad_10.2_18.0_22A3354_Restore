@implementation TickerCell

- (_TtC13FTMInternal_410TickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC13FTMInternal_410TickerCell *)sub_1001661C0(a3, (uint64_t)a4, v6);
}

- (_TtC13FTMInternal_410TickerCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC13FTMInternal_410TickerCell *result;

  v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_410TickerCell_digit);
  *v5 = 48;
  v5[1] = 0xE100000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_410TickerCell_fontSize) = (Class)0x4044000000000000;
  v6 = OBJC_IVAR____TtC13FTMInternal_410TickerCell_numberLabel;
  v7 = objc_allocWithZone((Class)UILabel);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, "init");

  result = (_TtC13FTMInternal_410TickerCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/TickerCell.swift", 30, 2, 34, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->digit[OBJC_IVAR____TtC13FTMInternal_410TickerCell_digit]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_410TickerCell_numberLabel));
}

@end
