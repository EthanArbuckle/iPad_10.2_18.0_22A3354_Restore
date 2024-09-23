@implementation ProfileCreatedView

- (_TtC12GameCenterUI18ProfileCreatedView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5C22B4();
}

- (void)primaryAction
{
  _TtC12GameCenterUI18ProfileCreatedView *v2;

  v2 = self;
  sub_1AB5C2408();

}

- (void).cxx_destruct
{
  sub_1AB4CB5BC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI18ProfileCreatedView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18ProfileCreatedView_confettiView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18ProfileCreatedView_primaryTrayButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18ProfileCreatedView____lazy_storage___confettiViewHeightConstraint));
}

@end
