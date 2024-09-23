@implementation ATXAmbientSuggestionProvider

- (NSArray)stackSuggestions
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  ATXAmbientSuggestionProvider *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v2 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
  v3 = (uint64_t)&v2[4];
  v4 = v2 + 6;
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_2384D9AA0(v3, &v9);
  os_unfair_lock_unlock(v4);
  v6 = v9;

  if (!v6)
    return (NSArray *)0;
  type metadata accessor for ATXWidgetStackSuggestion(0);
  v7 = (void *)sub_2384DFA84();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (ATXAmbientSuggestionProvider)init
{
  return (ATXAmbientSuggestionProvider *)ATXAmbientSuggestionProvider.init()();
}

- (void)dealloc
{
  ATXAmbientSuggestionProvider *v2;

  v2 = self;
  sub_2384DB3CC();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();

  sub_2384D82E8((uint64_t)self + OBJC_IVAR___ATXAmbientSuggestionProvider_delegate);
}

- (ATXAmbientSuggestionProviderDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ATXAmbientSuggestionProvider_delegate;
  swift_beginAccess();
  return (ATXAmbientSuggestionProviderDelegate *)(id)MEMORY[0x23B836F90](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)ambientConfigurationManagerCacheDidUpdate
{
  ATXAmbientSuggestionProvider *v2;

  v2 = self;
  ATXAmbientSuggestionProvider.ambientConfigurationManagerCacheDidUpdate()();

}

- (void)logViewDidAppear
{
  ATXAmbientSuggestionProvider *v2;
  uint64_t v3;

  v2 = self;
  v3 = sub_2384D993C();
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 128))(v3);

  swift_release();
}

- (void)logViewDidDisappear
{
  ATXAmbientSuggestionProvider *v2;
  uint64_t v3;

  v2 = self;
  v3 = sub_2384D993C();
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 136))(v3);

  swift_release();
}

- (void)logUserDidTapWidget:(id)a3
{
  id v4;
  ATXAmbientSuggestionProvider *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_2384D993C();
  (*(void (**)(id))(*(_QWORD *)v6 + 144))(v4);

  swift_release();
}

- (void)logStackDidChangeToWidget:(id)a3 reason:(unint64_t)a4
{
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  ATXAmbientSuggestionProvider *v14;
  id v15;
  uint64_t v16;

  ObjectType = swift_getObjectType();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = ObjectType;
  v13 = a3;
  v14 = self;
  v15 = v13;
  sub_2384CAEBC((uint64_t)v10, (uint64_t)&unk_256912FE8, (uint64_t)v12);

  swift_release();
}

- (void)logWidgetStack:(id)a3 didChangeToWidget:(id)a4 reason:(unint64_t)a5
{
  id v8;
  id v9;
  ATXAmbientSuggestionProvider *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  ATXAmbientSuggestionProvider.logWidgetStack(_:didChangeTo:reason:)((uint64_t)v8, v9, a5);

}

- (void)readStacksWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ATXAmbientSuggestionProvider *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256912FD0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256912FD8;
  v12[5] = v11;
  v13 = self;
  sub_2384B82C0((uint64_t)v7, (uint64_t)&unk_256912FE0, (uint64_t)v12);
  swift_release();
}

- (void)writeStacks:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  ATXAmbientSuggestionProvider *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256912FA8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256912FB0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2384B82C0((uint64_t)v9, (uint64_t)&unk_256912FB8, (uint64_t)v14);
  swift_release();
}

@end
