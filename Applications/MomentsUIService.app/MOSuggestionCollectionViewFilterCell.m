@implementation MOSuggestionCollectionViewFilterCell

- (_TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  uint64_t v9;
  _TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell *v10;
  _TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_title);
  *v8 = 0;
  v8[1] = 0;
  v9 = OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_filterButton;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)closure #1 in variable initialization expression of MOSuggestionCollectionViewFilterCell.filterButton();

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewFilterCell();
  v11 = -[MOSuggestionCollectionViewFilterCell initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  MOSuggestionCollectionViewFilterCell.setupView()();

  return v11;
}

- (_TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_title);
  *v4 = 0;
  v4[1] = 0;
  v5 = OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_filterButton;
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)closure #1 in variable initialization expression of MOSuggestionCollectionViewFilterCell.filterButton();

  result = (_TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionSheetFilterCollectionView.swift", 60, 2, 117, 0);
  __break(1u);
  return result;
}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewFilterCell();
  return -[MOSuggestionCollectionViewFilterCell isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewFilterCell();
  v4 = v5.receiver;
  -[MOSuggestionCollectionViewFilterCell setSelected:](&v5, "setSelected:", v3);
  MOSuggestionCollectionViewFilterCell.isSelected.didset();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_title]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_filterButton));
}

@end
