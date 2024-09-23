@implementation MOAngelControllerWrapper

- (_TtC16MomentsUIService24MOAngelControllerWrapper)init
{
  return (_TtC16MomentsUIService24MOAngelControllerWrapper *)MOAngelControllerWrapper.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper_serverManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper_engagementWriter));
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper_delegate, &demangling cache variable for type metadata for MOAngelControllerWrapperDelegate?);
  v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper__isVisible;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Bool>);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper__isExpanded, v4);
}

- (void)shouldRefreshEvents
{
  _TtC16MomentsUIService24MOAngelControllerWrapper *v2;

  v2 = self;
  MOAngelControllerWrapper.shouldRefreshEvents()();

}

- (void)willReturnAssetsForSuggestion:(MOSuggestion *)a3 withTypes:(NSArray *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  MOSuggestion *v17;
  NSArray *v18;
  _TtC16MomentsUIService24MOAngelControllerWrapper *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1001EA328, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1001EA350, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in MOAngelControllerWrapper.willReturnAssets(for:withTypes:);
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1001EA378, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_58Tu;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_63Tu, (uint64_t)v16);
  swift_release(v20);
}

- (void)willReturnAssetsForSuggestion:(MOSuggestion *)a3 withTypes:(NSArray *)a4 onAssetsCallback:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  MOSuggestion *v17;
  NSArray *v18;
  _TtC16MomentsUIService24MOAngelControllerWrapper *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1001EA288, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1001EA2B0, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in MOAngelControllerWrapper.willReturnAssets(for:withTypes:);
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1001EA2D8, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTATu;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v16);
  swift_release(v20);
}

- (void)didReceivePresentationRequestWithOptions:(id)a3
{
  id v4;
  _TtC16MomentsUIService24MOAngelControllerWrapper *v5;

  v4 = a3;
  v5 = self;
  MOAngelControllerWrapper.didReceivePresentationRequest(with:)(v4);

}

- (void)didReceiveUpdateRequestWithState:(unint64_t)a3 animated:(BOOL)a4
{
  _TtC16MomentsUIService24MOAngelControllerWrapper *v6;

  v6 = self;
  MOAngelControllerWrapper.didReceiveUpdateRequest(with:animated:)(a3, a4);

}

@end
