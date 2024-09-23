@implementation CollectionHeaderSuplementaryCell

- (_TtC13FTMInternal_432CollectionHeaderSuplementaryCell)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_432CollectionHeaderSuplementaryCell *)sub_100162370(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_432CollectionHeaderSuplementaryCell)initWithCoder:(id)a3
{
  sub_100164F04((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC13FTMInternal_432CollectionHeaderSuplementaryCell____lazy_storage___headerLabel, &OBJC_IVAR____TtC13FTMInternal_432CollectionHeaderSuplementaryCell____lazy_storage___subHeaderLabel, 250);
}

- (void)prepareForReuse
{
  sub_100164F90(self, (uint64_t)a2, type metadata accessor for CollectionHeaderSuplementaryCell, (uint64_t (*)(id))sub_1001621F0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_432CollectionHeaderSuplementaryCell____lazy_storage___headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_432CollectionHeaderSuplementaryCell____lazy_storage___subHeaderLabel));
}

@end
