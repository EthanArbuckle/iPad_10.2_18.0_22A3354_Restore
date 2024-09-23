@implementation MiniPlayerContainerView

- (void)layoutSubviews
{
  _TtC11MediaCoreUI23MiniPlayerContainerView *v2;

  v2 = self;
  sub_2412DA820();

}

- (_TtC11MediaCoreUI23MiniPlayerContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_24138228C();
}

- (_TtC11MediaCoreUI23MiniPlayerContainerView)initWithFrame:(CGRect)a3
{
  _TtC11MediaCoreUI23MiniPlayerContainerView *result;

  result = (_TtC11MediaCoreUI23MiniPlayerContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI23MiniPlayerContainerView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI23MiniPlayerContainerView_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI23MiniPlayerContainerView_contentView));
}

@end
