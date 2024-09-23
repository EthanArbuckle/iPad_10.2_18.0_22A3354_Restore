@implementation ActivityCancelTouchAssertion

- (void)dealloc
{
  char v2;
  _TtC18ActivityUIServices28ActivityCancelTouchAssertion *v3;
  _TtC18ActivityUIServices28ActivityCancelTouchAssertion *v4;
  objc_super v5;

  v2 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated);
  v3 = self;
  v4 = v3;
  if ((v2 & 1) == 0)
    -[ActivityCancelTouchAssertion invalidate](v3, sel_invalidate);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for ActivityCancelTouchAssertion();
  -[ActivityCancelTouchAssertion dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (_TtC18ActivityUIServices28ActivityCancelTouchAssertion)init
{
  _TtC18ActivityUIServices28ActivityCancelTouchAssertion *result;

  result = (_TtC18ActivityUIServices28ActivityCancelTouchAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)invalidate
{
  _TtC18ActivityUIServices28ActivityCancelTouchAssertion *v2;

  v2 = self;
  sub_22D820CBC();

}

@end
