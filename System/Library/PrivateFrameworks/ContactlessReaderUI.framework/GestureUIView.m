@implementation GestureUIView

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC19ContactlessReaderUI13GestureUIView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_22F8970E4(x, y, width, height);

}

- (_TtC19ContactlessReaderUI13GestureUIView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ContactlessReaderUI13GestureUIView_drawNumberRecognizer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for GestureUIView();
  return -[GestureUIView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19ContactlessReaderUI13GestureUIView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ContactlessReaderUI13GestureUIView_drawNumberRecognizer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GestureUIView();
  return -[GestureUIView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
