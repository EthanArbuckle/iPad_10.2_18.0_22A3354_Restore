@implementation TapActionGestureRecognizer

- (void)execute
{
  _TtC8AppStore26TapActionGestureRecognizer *v2;

  v2 = self;
  sub_1002B7F00();

}

- (_TtC8AppStore26TapActionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v5;
  _TtC8AppStore26TapActionGestureRecognizer *result;
  _QWORD v7[4];

  if (a3)
  {
    v5 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7, v5);
    swift_unknownObjectRelease(a3);
  }
  result = (_TtC8AppStore26TapActionGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer("AppStore.TapActionGestureRecognizer", 35, "init(target:action:)", 20, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore26TapActionGestureRecognizer_action));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore26TapActionGestureRecognizer_objectGraph));
}

@end
