@implementation FMNearbyInteractionLocalizerContext

- (NSString)description
{
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v2;
  void *v3;

  v2 = self;
  sub_23A983770();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v2;
  uint64_t v3;

  v2 = self;
  sub_23A983A00((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  sub_23A963B3C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_findable);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_error));
  sub_23A98C874(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_incrementNISessionHandler));
  sub_23A98C874(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_decrementNISessionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_niConfiguration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_niSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_arSession));
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v6;
  id v7;
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A983AD8(v6, v7);

}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v8;

  sub_23A968488(0, &qword_2569D60B8);
  v6 = sub_23AA330B0();
  v7 = a3;
  v8 = self;
  sub_23A98D2DC(v6);

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_23A98E120(v11, a5, (uint64_t)a6);

}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  unint64_t v8;
  id v9;
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v10;

  sub_23A968488(0, &qword_2569D60B8);
  v8 = sub_23AA330B0();
  v9 = a3;
  v10 = self;
  sub_23A98EA28(v8, a5);

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 didUpdateAlgorithmConvergence:(id)a4 forObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_23A98F074(v9, a5);

}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  id v6;
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v7;

  v6 = a3;
  v7 = self;
  sub_23A98FE6C();

}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  id v5;
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v6;

  v5 = a3;
  v6 = self;
  sub_23A990144();

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_23A990374(v8);

}

- (_TtC11FMFindingUI35FMNearbyInteractionLocalizerContext)init
{
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *result;

  result = (_TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  _TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A98836C((uint64_t)v6, (uint64_t)v7);

}

- (BOOL)sessionShouldAttemptRelocalization:(id)a3
{
  return 0;
}

@end
