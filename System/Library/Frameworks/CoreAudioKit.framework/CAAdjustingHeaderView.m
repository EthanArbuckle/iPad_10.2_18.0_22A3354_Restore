@implementation CAAdjustingHeaderView

- (_TtC12CoreAudioKit21CAAdjustingHeaderView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for CAAdjustingHeaderView();
  return -[CAAUEQHeaderView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit21CAAdjustingHeaderView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAAdjustingHeaderView();
  return -[CAAUEQHeaderView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
