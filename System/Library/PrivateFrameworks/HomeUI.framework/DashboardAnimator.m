@implementation DashboardAnimator

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetNavigationBarAppearance));
}

- (double)transitionDuration:(id)a3
{
  return dbl_1B943D1E8[*((char *)&self->super.isa + OBJC_IVAR____TtC6HomeUI17DashboardAnimator_style)];
}

- (void)animateTransition:(id)a3
{
  char v5;
  uint64_t v6;
  void *v7;
  _TtC6HomeUI17DashboardAnimator *v8;

  swift_unknownObjectRetain();
  v8 = self;
  sub_1B8F398B4(a3);
  if ((v5 & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = a3;
    v7 = (void *)swift_unknownObjectRetain();
    sub_1B8F3AC04(v7, (void (*)(_QWORD))sub_1B8F3D7FC, v6);
    swift_unknownObjectRelease();

    swift_release();
  }
  else
  {
    objc_msgSend(a3, sel_completeTransition_, 0);
    swift_unknownObjectRelease();

  }
}

- (_TtC6HomeUI17DashboardAnimator)init
{
  _TtC6HomeUI17DashboardAnimator *result;

  result = (_TtC6HomeUI17DashboardAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
