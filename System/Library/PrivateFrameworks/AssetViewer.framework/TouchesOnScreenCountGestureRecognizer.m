@implementation TouchesOnScreenCountGestureRecognizer

- (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer)init
{
  _TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer *v3;
  objc_super v5;

  *(_QWORD *)((char *)&self->super._gestureFlags
            + OBJC_IVAR____TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer_asvDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TouchesOnScreenCountGestureRecognizer();
  v3 = -[TouchesOnScreenCountGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, 0, 0);
  -[TouchesOnScreenCountGestureRecognizer setCancelsTouchesInView:](v3, sel_setCancelsTouchesInView_, 0);
  -[TouchesOnScreenCountGestureRecognizer setDelaysTouchesEnded:](v3, sel_setDelaysTouchesEnded_, 0);
  -[TouchesOnScreenCountGestureRecognizer setState:](v3, sel_setState_, 0);

  return v3;
}

- (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer)initWithCoder:(id)a3
{
  id v5;
  _TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer *result;

  *(_QWORD *)((char *)&self->super._gestureFlags
            + OBJC_IVAR____TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer_asvDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer *)sub_1D94D382C();
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer *v6;

  v5 = a4;
  v6 = self;
  sub_1D9494544();

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer *v8;

  sub_1D94944C0();
  sub_1D94944FC();
  v6 = sub_1D94D3244();
  v7 = a4;
  v8 = self;
  sub_1D949460C(v6);

  swift_bridgeObjectRelease();
}

- (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1D94D3508();
    swift_unknownObjectRelease();
  }
  result = (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D93D6F14((uint64_t)self + OBJC_IVAR____TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer_asvDelegate);
}

@end
