@implementation TracklessSlider

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC6HomeUIP33_924B9BACA428215473DADD2D3F844A0415TracklessSlider *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = self;
  v10 = sub_1B8FB4598(x, y, width, height, a5);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (_TtC6HomeUIP33_924B9BACA428215473DADD2D3F844A0415TracklessSlider)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for TracklessSlider();
  return -[TracklessSlider initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6HomeUIP33_924B9BACA428215473DADD2D3F844A0415TracklessSlider)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TracklessSlider();
  return -[TracklessSlider initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
