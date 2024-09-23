@implementation SizeReaderUIView

- (_TtC8SOSBuddy16SizeReaderUIView)initWithCoder:(id)a3
{
  _TtC8SOSBuddy16SizeReaderUIView *result;

  result = (_TtC8SOSBuddy16SizeReaderUIView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100260900, "SOSBuddy/SizeReaderView.swift", 29, 2, 21, 0);
  __break(1u);
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SizeReaderUIView();
  -[SizeReaderUIView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SizeReaderUIView();
  v7 = v8.receiver;
  -[SizeReaderUIView setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_100145CE4();

}

- (_TtC8SOSBuddy16SizeReaderUIView)initWithFrame:(CGRect)a3
{
  _TtC8SOSBuddy16SizeReaderUIView *result;

  result = (_TtC8SOSBuddy16SizeReaderUIView *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.SizeReaderUIView", 25, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->_onSizeChanged[OBJC_IVAR____TtC8SOSBuddy16SizeReaderUIView__onSizeChanged]);
}

@end
