@implementation MOSuggestionCollectionViewDateSectionHeaderView

- (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView *)specialized MOSuggestionCollectionViewDateSectionHeaderView.init(frame:)();
}

- (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  char *v6;
  uint64_t v7;
  _TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView *result;

  v4 = OBJC_IVAR____TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView_dateLabel;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)closure #1 in variable initialization expression of MOSuggestionCollectionViewDateSectionHeaderView.dateLabel();
  v6 = (char *)self + OBJC_IVAR____TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView_date;
  v7 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);

  result = (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionCollectionViewCell.swift", 53, 2, 283, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView_dateLabel));
  outlined destroy of Date?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView_date);
}

@end
