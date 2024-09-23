@implementation MOSuggestionSheetListPlayButton

- (_TtC16MomentsUIService31MOSuggestionSheetListPlayButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  _TtC16MomentsUIService31MOSuggestionSheetListPlayButton *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetListPlayButton_mediaAssetID);
  v9 = (objc_class *)type metadata accessor for MOSuggestionSheetListPlayButton();
  *v8 = 0;
  v8[1] = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MOSuggestionSheetOversizedBoundsButton initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  MOSuggestionSheetListPlayButton.sharedInit()();

  return v10;
}

- (_TtC16MomentsUIService31MOSuggestionSheetListPlayButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MomentsUIService31MOSuggestionSheetListPlayButton *v6;
  _TtC16MomentsUIService31MOSuggestionSheetListPlayButton *v7;
  _TtC16MomentsUIService31MOSuggestionSheetListPlayButton *v8;
  objc_super v10;

  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetListPlayButton_mediaAssetID);
  *v4 = 0;
  v4[1] = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MOSuggestionSheetListPlayButton();
  v5 = a3;
  v6 = -[MOSuggestionSheetOversizedBoundsButton initWithCoder:](&v10, "initWithCoder:", v5);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    MOSuggestionSheetListPlayButton.sharedInit()();

  }
  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediaAssetID[OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetListPlayButton_mediaAssetID]);
}

@end
