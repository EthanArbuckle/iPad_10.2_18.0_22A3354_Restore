@implementation AFibBurdenLifeFactorView

- (_TtC5Heart24AFibBurdenLifeFactorView)initWithCoder:(id)a3
{
  id v5;
  _TtC5Heart24AFibBurdenLifeFactorView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___imageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___titleDetailView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___infoView) = 0;
  v5 = a3;

  result = (_TtC5Heart24AFibBurdenLifeFactorView *)sub_231414EE4();
  __break(1u);
  return result;
}

- (void)tapped
{
  _TtC5Heart24AFibBurdenLifeFactorView *v2;

  v2 = self;
  sub_23133304C();

}

- (_TtC5Heart24AFibBurdenLifeFactorView)initWithFrame:(CGRect)a3
{
  _TtC5Heart24AFibBurdenLifeFactorView *result;

  result = (_TtC5Heart24AFibBurdenLifeFactorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_2312D2854((uint64_t)self + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___titleDetailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___infoView));
}

@end
