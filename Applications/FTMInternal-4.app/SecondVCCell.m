@implementation SecondVCCell

- (_TtC13FTMInternal_412SecondVCCell)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_412SecondVCCell *)sub_100165354(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_412SecondVCCell)initWithCoder:(id)a3
{
  id v4;
  _TtC13FTMInternal_412SecondVCCell *result;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell_metricFavorited) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___leftLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___rightLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___separatorView) = 0;
  v4 = a3;

  result = (_TtC13FTMInternal_412SecondVCCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/Cells.swift", 25, 2, 621, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  sub_10016346C(self, (uint64_t)a2, type metadata accessor for SecondVCCell, (void (*)(id))sub_100165BD8);
}

- (BOOL)isHighlighted
{
  return sub_100165CE8(self, (uint64_t)a2, type metadata accessor for SecondVCCell);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC13FTMInternal_412SecondVCCell *v4;

  v4 = self;
  sub_100165D84(a3, type metadata accessor for SecondVCCell, (uint64_t)&unk_100263E30, (uint64_t)sub_100166024, (uint64_t)&unk_100263E48);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___leftLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___rightLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___separatorView));
}

@end
