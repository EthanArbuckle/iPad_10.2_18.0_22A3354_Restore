@implementation MOSuggestionSheetOnboardingTipCell

- (_TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell)initWithCoder:(id)a3
{
  id v4;
  _TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell_tipModel) = 0;
  v4 = a3;

  result = (_TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionSheetOnboardingTipCell.swift", 57, 2, 25, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell *v7;
  void (*v8)(void);
  _TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell_tipModel) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingTipCell();
  v7 = -[MOSuggestionSheetOnboardingTipCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  v8 = *(void (**)(void))((swift_isaMask & (uint64_t)v7->super.super.super.super.isa) + 0x70);
  v9 = v7;
  v8();

  return v9;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell_tipModel));
}

@end
