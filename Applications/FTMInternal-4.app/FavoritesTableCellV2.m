@implementation FavoritesTableCellV2

- (_TtC13FTMInternal_420FavoritesTableCellV2)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC13FTMInternal_420FavoritesTableCellV2 *)sub_100164E98((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1001628F0);
}

- (_TtC13FTMInternal_420FavoritesTableCellV2)initWithCoder:(id)a3
{
  id v4;
  _TtC13FTMInternal_420FavoritesTableCellV2 *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___valueLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___activityIndicator) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___separatorView) = 0;
  v4 = a3;

  result = (_TtC13FTMInternal_420FavoritesTableCellV2 *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/Cells.swift", 25, 2, 356, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  sub_10016346C(self, (uint64_t)a2, type metadata accessor for FavoritesTableCellV2, (void (*)(id))sub_1001634C8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___separatorView));
}

@end
