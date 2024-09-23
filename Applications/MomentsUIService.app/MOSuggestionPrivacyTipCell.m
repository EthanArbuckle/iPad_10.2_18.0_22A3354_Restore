@implementation MOSuggestionPrivacyTipCell

- (_TtC16MomentsUIService26MOSuggestionPrivacyTipCell)initWithCoder:(id)a3
{
  void (**v5)();
  id v6;
  _TtC16MomentsUIService26MOSuggestionPrivacyTipCell *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_currentTipView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_tipModel) = 0;
  v5 = (void (**)())((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_didDismiss);
  *v5 = closure #1 in variable initialization expression of MOSuggestionPrivacyTipCell.didDismiss;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC16MomentsUIService26MOSuggestionPrivacyTipCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionSheetPrivacyTipCell.swift", 54, 2, 29, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService26MOSuggestionPrivacyTipCell)initWithFrame:(CGRect)a3
{
  void (**v4)();
  double y;
  double width;
  double height;
  _TtC16MomentsUIService26MOSuggestionPrivacyTipCell *v8;
  void (*v9)(void);
  _TtC16MomentsUIService26MOSuggestionPrivacyTipCell *v10;
  objc_super v12;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_currentTipView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_tipModel) = 0;
  v4 = (void (**)())((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_didDismiss);
  *v4 = closure #1 in variable initialization expression of MOSuggestionPrivacyTipCell.didDismiss;
  v4[1] = 0;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MOSuggestionPrivacyTipCell();
  v8 = -[MOSuggestionPrivacyTipCell initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = *(void (**)(void))((swift_isaMask & (uint64_t)v8->super.super.super.super.isa) + 0xB0);
  v10 = v8;
  v9();

  return v10;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_currentTipView);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_tipModel));
  swift_release(*(_QWORD *)&self->currentTipView[OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_didDismiss]);
}

@end
