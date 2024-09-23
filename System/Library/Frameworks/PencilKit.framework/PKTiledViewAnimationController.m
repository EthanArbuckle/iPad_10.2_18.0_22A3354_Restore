@implementation PKTiledViewAnimationController

- (PKTiledViewAnimationController)initWithTiledView:(id)a3
{
  id v3;
  PKTiledViewAnimationController *v4;

  v3 = a3;
  v4 = (PKTiledViewAnimationController *)specialized PKTiledViewAnimationController.init(tiledView:)();

  return v4;
}

- (void)avoidSnapshot:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  PKTiledViewAnimationController *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);

}

- (void)didEndDrawing
{
  PKTiledViewAnimationController *v2;

  v2 = self;
  PKTiledViewAnimationController.didEndDrawing()();

}

- (void)setupRefineAnimationFrom:(NSArray *)a3 to:(NSArray *)a4 in:(PKDrawing *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSArray *v18;
  NSArray *v19;
  PKDrawing *v20;
  PKTiledViewAnimationController *v21;
  uint64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &async function pointer to partial apply for @objc closure #1 in PKTiledViewAnimationController.setupRefineAnimation(from:to:in:);
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &_sIeghH_IeAgH_TRTA_69Tu;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v12, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_74Tu, (uint64_t)v17);
  swift_release();
}

- (void)setupStrokeInAnimationTo:(NSArray *)a3 in:(PKDrawing *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSArray *v16;
  PKDrawing *v17;
  PKTiledViewAnimationController *v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &async function pointer to partial apply for @objc closure #1 in PKTiledViewAnimationController.setupStrokeInAnimation(to:in:);
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &_sIeghH_IeAgH_TRTA_54Tu;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v10, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_59Tu, (uint64_t)v15);
  swift_release();
}

- (void)startRefineAnimationWithDuration:(double)a3
{
  PKTiledViewAnimationController *v4;

  v4 = self;
  PKTiledViewAnimationController.startRefineAnimation(duration:)(a3);

}

- (void)stopRefineAnimation
{
  void *v3;
  PKTiledViewAnimationController *v4;
  id v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKTiledViewAnimationController_mtkView);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_removeFromSuperview);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKTiledViewAnimationController_renderer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKTiledViewAnimationController_renderer) = 0;

}

- (void)refineFrom:(NSArray *)a3 to:(NSArray *)a4 in:(PKDrawing *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSArray *v18;
  NSArray *v19;
  PKDrawing *v20;
  PKTiledViewAnimationController *v21;
  uint64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &async function pointer to partial apply for @objc closure #1 in PKTiledViewAnimationController.refine(from:to:in:);
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &_sIeghH_IeAgH_TRTATu;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v12, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v17);
  swift_release();
}

- (PKTiledViewAnimationController)init
{
  PKTiledViewAnimationController *result;

  result = (PKTiledViewAnimationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

}

@end
