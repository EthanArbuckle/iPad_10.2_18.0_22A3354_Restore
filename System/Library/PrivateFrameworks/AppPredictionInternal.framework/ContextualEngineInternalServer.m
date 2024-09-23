@implementation ContextualEngineInternalServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC21AppPredictionInternal30ContextualEngineInternalServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1C9DF98AC(v7);

  return v9 & 1;
}

- (void)fetchAllSnapshotsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC21AppPredictionInternal30ContextualEngineInternalServer *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84F090);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_1C9E45DE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF931D98;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF931DA0;
  v13[5] = v12;
  v14 = self;
  sub_1C9DF9768((uint64_t)v8, (uint64_t)&unk_1EF931DA8, (uint64_t)v13);
  swift_release();
}

- (void)fetchSnapshotOverrideWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC21AppPredictionInternal30ContextualEngineInternalServer *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84F090);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_1C9E45DE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF931D78;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF931D80;
  v13[5] = v12;
  v14 = self;
  sub_1C9DF9768((uint64_t)v8, (uint64_t)&unk_1EF931D88, (uint64_t)v13);
  swift_release();
}

- (void)overrideWithSnapshot:(ATXContextualSuggestionSnapshot *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  ATXContextualSuggestionSnapshot *v16;
  _TtC21AppPredictionInternal30ContextualEngineInternalServer *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84F090);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_1C9E45DE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF931D58;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF931D60;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1C9DF9768((uint64_t)v10, (uint64_t)&unk_1EF931D68, (uint64_t)v15);
  swift_release();
}

- (void)updateWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC21AppPredictionInternal30ContextualEngineInternalServer *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84F090);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_1C9E45DE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF931D18;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF931D28;
  v13[5] = v12;
  v14 = self;
  sub_1C9DF9768((uint64_t)v8, (uint64_t)&unk_1EF931D38, (uint64_t)v13);
  swift_release();
}

- (_TtC21AppPredictionInternal30ContextualEngineInternalServer)init
{
  _TtC21AppPredictionInternal30ContextualEngineInternalServer *result;

  result = (_TtC21AppPredictionInternal30ContextualEngineInternalServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AppPredictionInternal30ContextualEngineInternalServer____lazy_storage___xpcListener));
  sub_1C9DF7A98((uint64_t)self + OBJC_IVAR____TtC21AppPredictionInternal30ContextualEngineInternalServer_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AppPredictionInternal30ContextualEngineInternalServer_suggestionStore));
}

@end
