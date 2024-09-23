@implementation UIContextXPCServiceServer.Server

- (void)retrieveUIContextElementsWithOptions:(id)a3 with:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtCC30IntelligenceFlowContextRuntime25UIContextXPCServiceServer6Server *v12;

  v6 = _Block_copy(a4);
  v7 = a3;
  v12 = self;
  v8 = sub_23F33A4C0();
  v10 = v9;

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v6;
  sub_23F335088(v8, v10, (uint64_t)sub_23F3051C4, v11);
  swift_release();
  sub_23F304CDC(v8, v10);

}

- (void)retrieveUIElementsWith:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtCC30IntelligenceFlowContextRuntime25UIContextXPCServiceServer6Server *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_23F336004((uint64_t)sub_23F3051C4, v5);

  swift_release();
}

- (void)retrieveElementHierarchyWithVerbose:(BOOL)a3 args:(id)a4 with:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _TtCC30IntelligenceFlowContextRuntime25UIContextXPCServiceServer6Server *v10;

  v7 = _Block_copy(a5);
  v8 = sub_23F33B5D0();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  sub_23F336838(a3, v8, (uint64_t)sub_23F3049A0, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtCC30IntelligenceFlowContextRuntime25UIContextXPCServiceServer6Server)init
{
  sub_23F30457C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end
