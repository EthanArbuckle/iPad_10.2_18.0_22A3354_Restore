@implementation BulletedIconView

- (_TtC5Heart16BulletedIconView)initWithCoder:(id)a3
{
  id v4;
  _TtC5Heart16BulletedIconView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart16BulletedIconView____lazy_storage___iconView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart16BulletedIconView____lazy_storage___textLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart16BulletedIconView____lazy_storage___stackView) = 0;
  v4 = a3;

  result = (_TtC5Heart16BulletedIconView *)sub_231414EE4();
  __break(1u);
  return result;
}

- (_TtC5Heart16BulletedIconView)initWithFrame:(CGRect)a3
{
  sub_231334824();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16BulletedIconView____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16BulletedIconView____lazy_storage___textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16BulletedIconView____lazy_storage___stackView));
  v3 = *(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC5Heart16BulletedIconView_item);
  v4 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC5Heart16BulletedIconView_item);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
