@implementation ChevronView

- (_TtC8AppStore11ChevronView)init
{
  return (_TtC8AppStore11ChevronView *)sub_100090264();
}

- (_TtC8AppStore11ChevronView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore11ChevronView *)sub_100090388(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore11ChevronView)initWithCoder:(id)a3
{
  return (_TtC8AppStore11ChevronView *)sub_1000904CC(a3);
}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChevronView();
  v2 = v3.receiver;
  -[ChevronView didMoveToWindow](&v3, "didMoveToWindow");
  sub_1000907BC();

}

- (void).cxx_destruct
{

}

@end
