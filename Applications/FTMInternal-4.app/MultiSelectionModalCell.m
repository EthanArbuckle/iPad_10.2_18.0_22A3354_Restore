@implementation MultiSelectionModalCell

- (_TtC13FTMInternal_423MultiSelectionModalCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC13FTMInternal_423MultiSelectionModalCell *)sub_100164E98((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100164918);
}

- (_TtC13FTMInternal_423MultiSelectionModalCell)initWithCoder:(id)a3
{
  sub_100164F04((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC13FTMInternal_423MultiSelectionModalCell____lazy_storage___titleLabel, &OBJC_IVAR____TtC13FTMInternal_423MultiSelectionModalCell____lazy_storage___separatorView, 543);
}

- (void)prepareForReuse
{
  sub_100164F90(self, (uint64_t)a2, type metadata accessor for MultiSelectionModalCell, (uint64_t (*)(id))sub_10016470C);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_423MultiSelectionModalCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_423MultiSelectionModalCell____lazy_storage___separatorView));
}

@end
