@implementation ToolboxXPCServiceServer.Server

- (void)readinessWithPlannerType:(id)a3 with:(id)a4
{
  sub_23FD345A4(self, (int)a2, (int)a3, a4, (uint64_t)&unk_251015310, (uint64_t)sub_23FD3C750, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23FD31768);
}

- (void)populateWithPlannerType:(id)a3 with:(id)a4
{
  sub_23FD345A4(self, (int)a2, (int)a3, a4, (uint64_t)&unk_251015298, (uint64_t)sub_23FCD4EAC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23FD33AE8);
}

- (void)baseRelativeURLWithPlannerType:(id)a3 with:(id)a4
{
  sub_23FD345A4(self, (int)a2, (int)a3, a4, (uint64_t)&unk_251015248, (uint64_t)sub_23FD3C688, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23FD34640);
}

- (void)queryWithPlannerType:(id)a3 query:(id)a4 k:(int64_t)a5 clientIdentifier:(id)a6 availableClientActions:(id)a7 with:(id)a8
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _TtCC23IntelligenceFlowRuntime23ToolboxXPCServiceServer6Server *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v10 = _Block_copy(a8);
  v11 = sub_23FD74BF4();
  v13 = v12;
  v14 = sub_23FD74BF4();
  v16 = v15;
  if (a6)
  {
    v17 = sub_23FD74BF4();
    a6 = v18;
  }
  else
  {
    v17 = 0;
  }
  v19 = sub_23FD74F0C();
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v10;
  v21 = self;
  sub_23FD34FC8(v11, v13, v14, v16, a5, v17, (uint64_t)a6, v19, (uint64_t)sub_23FD3CA0C, v20, v22, a5, v24, v25, v26, v27, v28, v29, v30,
    v31,
    v32,
    v33);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)queryWithPlannerType:(id)a3 query:(id)a4 bundleIDs:(id)a5 with:(id)a6
{
  void *v7;
  _TtCC23IntelligenceFlowRuntime23ToolboxXPCServiceServer6Server *v8;

  v7 = _Block_copy(a6);
  sub_23FD74BF4();
  sub_23FD74BF4();
  sub_23FD74CD8();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v8 = self;
  sub_23FD3714C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)queryWithPlannerType:(id)a3 query:(id)a4 toolIDs:(id)a5 with:(id)a6
{
  void *v7;
  _TtCC23IntelligenceFlowRuntime23ToolboxXPCServiceServer6Server *v8;

  v7 = _Block_copy(a6);
  sub_23FD74BF4();
  sub_23FD74BF4();
  sub_23FD74CD8();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v8 = self;
  sub_23FD3714C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)sandboxWithInjectionId:(id)a3 plannerType:(id)a4 with:(id)a5
{
  sub_23FD3B150();
}

- (void)countWithPlannerType:(id)a3 toolType:(id)a4 with:(id)a5
{
  sub_23FD3B150();
}

- (void)toolMappingWithPlannerType:(id)a3 customKey:(id)a4 with:(id)a5
{
  sub_23FD3B150();
}

- (void)listToolsWithPlannerType:(id)a3 toolType:(id)a4 with:(id)a5
{
  sub_23FD3B150();
}

- (_TtCC23IntelligenceFlowRuntime23ToolboxXPCServiceServer6Server)init
{
  sub_23FC98380();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
