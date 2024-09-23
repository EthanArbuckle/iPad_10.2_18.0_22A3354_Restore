@implementation SendMenuParentView

- (_TtC7ChatKit18SendMenuParentView)init
{
  _TtC7ChatKit18SendMenuParentView *v2;
  void *v3;
  _TtC7ChatKit18SendMenuParentView *v4;
  id v5;
  objc_super v7;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit18SendMenuParentView_allowsHitTesting) = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SendMenuParentView();
  v2 = -[SendMenuParentView initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v3 = (void *)objc_opt_self();
  v4 = v2;
  v5 = objc_msgSend(v3, sel_clearColor);
  -[SendMenuParentView setBackgroundColor:](v4, sel_setBackgroundColor_, v5);

  -[SendMenuParentView setAccessibilityViewIsModal:](v4, sel_setAccessibilityViewIsModal_, 1);
  return v4;
}

- (_TtC7ChatKit18SendMenuParentView)initWithCoder:(id)a3
{
  id v4;
  _TtC7ChatKit18SendMenuParentView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit18SendMenuParentView_allowsHitTesting) = 1;
  v4 = a3;

  result = (_TtC7ChatKit18SendMenuParentView *)sub_18E769320();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _BYTE *v8;
  id v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v8 = (char *)self + OBJC_IVAR____TtC7ChatKit18SendMenuParentView_allowsHitTesting;
  swift_beginAccess();
  v9 = 0;
  if (*v8 == 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)type metadata accessor for SendMenuParentView();
    v9 = -[SendMenuParentView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, x, y);
  }
  return v9;
}

- (_TtC7ChatKit18SendMenuParentView)initWithFrame:(CGRect)a3
{
  _TtC7ChatKit18SendMenuParentView *result;

  result = (_TtC7ChatKit18SendMenuParentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
