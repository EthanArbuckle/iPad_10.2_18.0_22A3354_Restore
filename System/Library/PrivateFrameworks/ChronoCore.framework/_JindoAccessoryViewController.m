@implementation _JindoAccessoryViewController

- (_TtC10ChronoCore29_JindoAccessoryViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC10ChronoCore29_JindoAccessoryViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore29_JindoAccessoryViewController__subscriptions) = (Class)MEMORY[0x1E0DEE9E8];
  v4 = a3;

  result = (_TtC10ChronoCore29_JindoAccessoryViewController *)sub_1D29C6474();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  -[_JindoAccessoryViewController setView:](self, sel_setView_, *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ChronoCore29_JindoAccessoryViewController__view));
}

- (_TtC10ChronoCore29_JindoAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1D28AD10C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore29_JindoAccessoryViewController__view));
  swift_bridgeObjectRelease();
}

@end
