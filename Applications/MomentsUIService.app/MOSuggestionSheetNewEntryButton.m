@implementation MOSuggestionSheetNewEntryButton

- (_TtC16MomentsUIService31MOSuggestionSheetNewEntryButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MomentsUIService31MOSuggestionSheetNewEntryButton *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MOSuggestionSheetNewEntryButton();
  v7 = -[MOSuggestionSheetNewEntryButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  MOSuggestionSheetNewEntryButton.sharedInit()();

  return v7;
}

- (_TtC16MomentsUIService31MOSuggestionSheetNewEntryButton)initWithCoder:(id)a3
{
  id v4;
  _TtC16MomentsUIService31MOSuggestionSheetNewEntryButton *v5;
  _TtC16MomentsUIService31MOSuggestionSheetNewEntryButton *v6;
  _TtC16MomentsUIService31MOSuggestionSheetNewEntryButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MOSuggestionSheetNewEntryButton();
  v4 = a3;
  v5 = -[MOSuggestionSheetNewEntryButton initWithCoder:](&v9, "initWithCoder:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    MOSuggestionSheetNewEntryButton.sharedInit()();

  }
  return v6;
}

@end
