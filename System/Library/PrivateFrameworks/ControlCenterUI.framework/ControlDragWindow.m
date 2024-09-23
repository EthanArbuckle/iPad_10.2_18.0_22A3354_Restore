@implementation ControlDragWindow

- (_TtC15ControlCenterUI17ControlDragWindow)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC15ControlCenterUI17ControlDragWindow *result;

  v5 = OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_weakObjectsHashTable);

  result = (_TtC15ControlCenterUI17ControlDragWindow *)sub_1CFBFAD14();
  __break(1u);
  return result;
}

- (_TtC15ControlCenterUI17ControlDragWindow)initWithWindowScene:(id)a3
{
  return (_TtC15ControlCenterUI17ControlDragWindow *)sub_1CFBF9BAC(a3);
}

- (void)beginTrackingPlatterView:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _TtC15ControlCenterUI17ControlDragWindow *v8;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews);
  v5 = a3;
  v8 = self;
  objc_msgSend(v4, sel_addObject_, v5);
  v6 = -[ControlDragWindow rootViewController](v8, sel_rootViewController);
  v7 = objc_msgSend(v6, sel_view);

  objc_msgSend(v7, sel_addSubview_, v5);
  -[ControlDragWindow setHidden:](v8, sel_setHidden_, 0);

}

- (void)stopTrackingPlatterView:(id)a3
{
  id v4;
  void *v5;
  _TtC15ControlCenterUI17ControlDragWindow *v6;

  v4 = a3;
  v6 = self;
  objc_msgSend(v4, sel_removeFromSuperview);
  v5 = *(Class *)((char *)&v6->super.super.super.super.isa
                + OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews);
  objc_msgSend(v5, sel_removeObject_, v4);
  -[ControlDragWindow setHidden:](v6, sel_setHidden_, objc_msgSend(v5, sel_count) == 0);

}

- (_TtC15ControlCenterUI17ControlDragWindow)initWithFrame:(CGRect)a3
{
  sub_1CFBF9F80();
}

- (_TtC15ControlCenterUI17ControlDragWindow)initWithContentRect:(CGRect)a3
{
  sub_1CFBF9F80();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews));
}

@end
