@implementation MonogramView

- (_TtC15ConversationKit12MonogramView)init
{
  MonogramView.init()();
}

- (_TtC15ConversationKit12MonogramView)initWithFrame:(CGRect)a3
{
  MonogramView.init(frame:)();
}

- (_TtC15ConversationKit12MonogramView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  MonogramView.init(coder:)();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC15ConversationKit12MonogramView *v7;
  __C::CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  MonogramView.draw(_:)(v8);

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
