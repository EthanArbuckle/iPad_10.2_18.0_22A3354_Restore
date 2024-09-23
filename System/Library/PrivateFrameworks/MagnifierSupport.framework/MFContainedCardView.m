@implementation MFContainedCardView

- (_TtC16MagnifierSupport19MFContainedCardView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MagnifierSupport19MFContainedCardView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport19MFContainedCardView_dynamicConstraints) = (Class)MEMORY[0x24BEE4AF8];
  v4 = a3;

  result = (_TtC16MagnifierSupport19MFContainedCardView *)sub_22758ECC4();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport19MFContainedCardView)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport19MFContainedCardView *result;

  result = (_TtC16MagnifierSupport19MFContainedCardView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFContainedCardView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFContainedCardView_footerView));
  swift_bridgeObjectRelease();
}

@end
