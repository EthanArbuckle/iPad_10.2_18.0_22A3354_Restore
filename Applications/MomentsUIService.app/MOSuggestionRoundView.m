@implementation MOSuggestionRoundView

- (void)layoutSubviews
{
  id v2;
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOSuggestionRoundView();
  v2 = v3.receiver;
  -[MOSuggestionRoundView layoutSubviews](&v3, "layoutSubviews");
  objc_msgSend(v2, "setClipsToBounds:", 1, v3.receiver, v3.super_class);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "_setCornerRadius:", CGRectGetHeight(v4) * 0.5);

}

- (_TtC16MomentsUIService21MOSuggestionRoundView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for MOSuggestionRoundView();
  return -[MOSuggestionRoundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MomentsUIService21MOSuggestionRoundView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionRoundView();
  return -[MOSuggestionRoundView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
