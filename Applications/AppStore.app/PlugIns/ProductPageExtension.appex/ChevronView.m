@implementation ChevronView

- (_TtC20ProductPageExtension11ChevronView)init
{
  return (_TtC20ProductPageExtension11ChevronView *)sub_10046CE68();
}

- (_TtC20ProductPageExtension11ChevronView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension11ChevronView *)sub_10046CF8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension11ChevronView)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtension11ChevronView *)sub_10046D0D0(a3);
}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChevronView();
  v2 = v3.receiver;
  -[ChevronView didMoveToWindow](&v3, "didMoveToWindow");
  sub_10046D3C0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension11ChevronView_chevronImageView));
}

@end
