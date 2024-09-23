@implementation StopwatchSessionsProvider

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)();
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t (*)())_Block_copy(a4);
  if (v11)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v11;
    v11 = sub_1B8DAD014;
  }
  v12 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v14 = a3;
  swift_retain_n();
  v15 = v14;
  swift_unknownObjectRetain();
  sub_1B8D8DEC0((uint64_t)v10, (uint64_t)&unk_1EF1E17D8, (uint64_t)v13);
  swift_release();
  sub_1B8DACDE8((uint64_t)v11);

  swift_unknownObjectRelease();
  swift_release();
}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  void *v5;

  v5 = _Block_copy(a4);
  if (v5)
    _Block_release(v5);
}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  if (v11)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v11;
    v11 = sub_1B8DACDF8;
  }
  v12 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v14 = a3;
  swift_retain_n();
  v15 = v14;
  swift_unknownObjectRetain();
  sub_1B8D8DEC0((uint64_t)v10, (uint64_t)&unk_1EF1E17C8, (uint64_t)v13);
  swift_release();
  sub_1B8DACDE8((uint64_t)v11);

  swift_unknownObjectRelease();
  swift_release();
}

@end
