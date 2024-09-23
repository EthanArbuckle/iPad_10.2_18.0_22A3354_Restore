@implementation FMR1ItemLocalizerContext

- (NSString)description
{
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v2;
  void *v3;

  v2 = self;
  sub_23A991900();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v2;
  uint64_t v3;

  v2 = self;
  sub_23A991B90((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  sub_23A963B3C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI24FMR1ItemLocalizerContext_findable);

  swift_release();
  swift_bridgeObjectRelease();
  sub_23A98C874(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11FMFindingUI24FMR1ItemLocalizerContext_incrementItemLocalizerHandler));
  sub_23A98C874(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11FMFindingUI24FMR1ItemLocalizerContext_decrementItemLocalizerHandler));

}

- (void)willIntegrateProximity:(id)a3
{
  id v4;
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v5;

  v4 = a3;
  v5 = self;
  sub_23A991C58((uint64_t)v4);

}

- (void)willIntegrateDevicePose:(id)a3
{
  id v4;
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v5;

  v4 = a3;
  v5 = self;
  sub_23A991E24((uint64_t)v4);

}

- (void)itemLocalizerChangedState:(unint64_t)a3
{
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v4;

  v4 = self;
  sub_23A991FF0(a3);

}

- (void)itemLocalizerChangedActivity:(unint64_t)a3
{
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v4;

  v4 = self;
  sub_23A99243C(a3);

}

- (void)itemChangedState:(unint64_t)a3
{
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v4;

  v4 = self;
  sub_23A99281C(a3);

}

- (void)didUpdateRangeEstimate:(id)a3
{
  id v4;
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v5;

  v4 = a3;
  v5 = self;
  sub_23A992F08(v4);

}

- (void)didUpdateItemPosition:(id)a3
{
  id v5;
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v6;

  v5 = a3;
  v6 = self;
  sub_23A9933D4((uint64_t)a3);

}

- (void)didUpdateDevicePose:(id)a3
{
  id v4;
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v5;

  v4 = a3;
  v5 = self;
  sub_23A9935A4((uint64_t)v4);

}

- (void)pathIsDegenerate:(id)a3
{
  id v4;
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v5;

  v4 = a3;
  v5 = self;
  sub_23A993770(v4);

}

- (void)didFailWithError:(id)a3
{
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_23A993B3C(v5);

}

- (_TtC11FMFindingUI24FMR1ItemLocalizerContext)init
{
  _TtC11FMFindingUI24FMR1ItemLocalizerContext *result;

  result = (_TtC11FMFindingUI24FMR1ItemLocalizerContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
