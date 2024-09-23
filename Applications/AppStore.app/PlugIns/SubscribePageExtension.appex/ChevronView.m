@implementation ChevronView

- (_TtC22SubscribePageExtension11ChevronView)init
{
  return (_TtC22SubscribePageExtension11ChevronView *)sub_100520B70();
}

- (_TtC22SubscribePageExtension11ChevronView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension11ChevronView *)sub_100520C94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension11ChevronView)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtension11ChevronView *)sub_100520DD8(a3);
}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChevronView();
  v2 = v3.receiver;
  -[ChevronView didMoveToWindow](&v3, "didMoveToWindow");
  sub_1005210C8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11ChevronView_chevronImageView));
}

@end
