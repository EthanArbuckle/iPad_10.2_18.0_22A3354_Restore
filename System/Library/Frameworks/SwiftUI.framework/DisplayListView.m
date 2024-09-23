@implementation DisplayListView

- (_TtC7SwiftUI15DisplayListView)initWithCoder:(id)a3
{
  _TtC7SwiftUI15DisplayListView *result;

  result = (_TtC7SwiftUI15DisplayListView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *v3;
  uint64_t v4;
  CGContext *v5;
  double v6;
  _TtC7SwiftUI15DisplayListView *v7;
  uint64_t v8;

  v7 = self;
  v3 = UIGraphicsGetCurrentContext();
  if (v3)
  {
    v5 = v3;
    v6 = MEMORY[0x1E0C80A78](v3, v4);
    MEMORY[0x18D757E40](&v8, v6);
    static GraphicsContext.renderingTo(cgContext:environment:deviceScale:content:)();

    swift_release();
    swift_release();
  }
  else
  {
    static Log.internalWarning(_:)();

  }
}

- (_TtC7SwiftUI15DisplayListView)initWithFrame:(CGRect)a3
{
  _TtC7SwiftUI15DisplayListView *result;

  result = (_TtC7SwiftUI15DisplayListView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
