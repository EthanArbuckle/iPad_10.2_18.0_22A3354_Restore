@implementation ContextXPCServiceServer.Server

- (void)refreshWithContextTypes:(id)a3 interactionId:(id)a4 with:(id)a5
{
  void *v7;
  id v8;
  _TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  _TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server *v14;

  v7 = _Block_copy(a5);
  if (!a3)
  {
    v13 = a4;
    v14 = self;
    v12 = 0xF000000000000000;
    if (!a4)
      goto LABEL_5;
    goto LABEL_3;
  }
  v8 = a4;
  v9 = self;
  v10 = a3;
  a3 = (id)sub_23F33A4C0();
  v12 = v11;

  if (a4)
  {
LABEL_3:
    sub_23F33B51C();

  }
LABEL_5:
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  sub_23F2FFBE0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23F304EB4((uint64_t)a3, v12);

}

- (void)refreshAndRetrieveWithContextTypes:(id)a3 with:(id)a4
{
  void *v5;
  _TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v5 = _Block_copy(a4);
  v6 = self;
  if (a3)
  {
    v7 = a3;
    v8 = sub_23F33A4C0();
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0xF000000000000000;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v5;
  sub_23F300234(v8, v10, (uint64_t)sub_23F3051C4, v11);
  swift_release();
  sub_23F304EB4(v8, v10);

}

- (void)retrieveContextValuesWithContextTypes:(id)a3 timeout:(id)a4 with:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server *v14;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v14 = self;
  v11 = sub_23F33A4C0();
  v13 = v12;

  *(_QWORD *)(swift_allocObject() + 16) = v8;
  sub_23F301614();
  swift_release();
  sub_23F304CDC(v11, v13);

}

- (void)retrieveContextValuesWithQuery:(id)a3 with:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server *v10;

  v5 = _Block_copy(a4);
  v6 = sub_23F33B51C();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_23F302990(v6, v8, (uint64_t)sub_23F3051C4, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)retrieveRequiredContextValuesWith:(id)a3
{
  void *v4;
  _TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_23F303F68();

  swift_release();
}

- (void)dumpUIContextFromCacheWith:(id)a3
{
  void *v4;
  _TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_23F303F68();

  swift_release();
}

- (_TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server)init
{
  sub_23F30457C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_23F30571C();
  sub_23F30571C();
  sub_23F30571C();
  swift_release();
}

@end
