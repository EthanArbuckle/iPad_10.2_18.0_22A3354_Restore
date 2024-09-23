@implementation MOSuggestionSheetOversizedBoundsButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC16MomentsUIService38MOSuggestionSheetOversizedBoundsButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  CGPoint v15;
  CGRect v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[MOSuggestionSheetOversizedBoundsButton bounds](v8, "bounds");
  v10 = v9;
  -[MOSuggestionSheetOversizedBoundsButton bounds](v8, "bounds");
  v12 = v11;
  -[MOSuggestionSheetOversizedBoundsButton bounds](v8, "bounds");
  v17 = CGRectInset(v16, v10 * -1.5, v12 * -1.5);
  v15.x = x;
  v15.y = y;
  v13 = CGRectContainsPoint(v17, v15);

  return v13;
}

- (_TtC16MomentsUIService38MOSuggestionSheetOversizedBoundsButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MOSuggestionSheetOversizedBoundsButton();
  return -[MOSuggestionSheetOversizedBoundsButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MomentsUIService38MOSuggestionSheetOversizedBoundsButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionSheetOversizedBoundsButton();
  return -[MOSuggestionSheetOversizedBoundsButton initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
