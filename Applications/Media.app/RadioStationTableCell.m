@implementation RadioStationTableCell

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  sub_10002CB24(self, (uint64_t)a2, a3, a4, (const char **)&selRef_setSelected_animated_);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  sub_10002CB24(self, (uint64_t)a2, a3, a4, (const char **)&selRef_setHighlighted_animated_);
}

- (void)toggleFavorite
{
  _TtC5Media21RadioStationTableCell *v2;

  v2 = self;
  sub_10002CBC4();

}

- (_TtC5Media21RadioStationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC5Media21RadioStationTableCell *)sub_10002CCA0(a3, (uint64_t)a4, v6);
}

- (_TtC5Media21RadioStationTableCell)initWithCoder:(id)a3
{
  return (_TtC5Media21RadioStationTableCell *)sub_10002CDE8(a3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell____lazy_storage___favoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell_imageViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell_imageViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell_waveformView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Media21RadioStationTableCell_config), v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell____lazy_storage___stationImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell____lazy_storage___titleStackView));
}

@end
