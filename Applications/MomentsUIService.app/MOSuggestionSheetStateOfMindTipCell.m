@implementation MOSuggestionSheetStateOfMindTipCell

- (_TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell)initWithCoder:(id)a3
{
  id v5;
  _TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell_currentTipView, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell_tipModel) = 0;
  v5 = a3;

  result = (_TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionSheetStateOfMindTipCell.swift", 58, 2, 25, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell)initWithFrame:(CGRect)a3
{
  double y;
  double width;
  double height;
  _TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell *v7;
  void (*v8)(void);
  _TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell *v9;
  objc_super v11;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell_currentTipView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell_tipModel) = 0;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MOSuggestionSheetStateOfMindTipCell();
  v7 = -[MOSuggestionSheetStateOfMindTipCell initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = *(void (**)(void))((swift_isaMask & (uint64_t)v7->super.super.super.super.isa) + 0x98);
  v9 = v7;
  v8();

  return v9;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell_currentTipView);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell_tipModel));
}

@end
