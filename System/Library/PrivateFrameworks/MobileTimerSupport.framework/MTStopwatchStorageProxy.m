@implementation MTStopwatchStorageProxy

- (_TtC18MobileTimerSupport23MTStopwatchStorageProxy)init
{
  return (_TtC18MobileTimerSupport23MTStopwatchStorageProxy *)MTStopwatchStorageProxy.init()();
}

- (void)getStopwatchesWitchCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1B8DEEEC8;
  }
  else
  {
    v9 = 0;
  }
  v10 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v8;
  v11[5] = v9;
  v11[6] = self;
  v12 = self;
  sub_1B8DEE404((uint64_t)v8);
  sub_1B8D8DEC0((uint64_t)v7, (uint64_t)&unk_1EF1E3F40, (uint64_t)v11);
  swift_release();
  sub_1B8DACDE8((uint64_t)v8);

}

- (void)createStopWatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a5;
  v15[7] = sub_1B8DAD014;
  v15[8] = v13;
  v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  v18 = v16;
  sub_1B8DFD22C();
  sub_1B8D8DEC0((uint64_t)v11, (uint64_t)&unk_1EF1E3F38, (uint64_t)v15);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)updateStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a5;
  v15[7] = sub_1B8DAD014;
  v15[8] = v13;
  v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  v18 = v16;
  sub_1B8DFD22C();
  sub_1B8D8DEC0((uint64_t)v11, (uint64_t)&unk_1EF1E3F30, (uint64_t)v15);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)deleteStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a5;
  v15[7] = sub_1B8DAD014;
  v15[8] = v13;
  v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  v18 = v16;
  sub_1B8DFD22C();
  sub_1B8D8DEC0((uint64_t)v11, (uint64_t)&unk_1EF1E3F28, (uint64_t)v15);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 withCompletion:(id)a5 source:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  id v19;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v20;
  id v21;
  id v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = self;
  v17[5] = a4;
  v17[6] = a3;
  v17[7] = a6;
  v17[8] = sub_1B8DAD014;
  v17[9] = v15;
  v18 = a3;
  v19 = a4;
  swift_unknownObjectRetain_n();
  v20 = self;
  v21 = v19;
  v22 = v18;
  sub_1B8DFD22C();
  sub_1B8D8DEC0((uint64_t)v13, (uint64_t)&unk_1EF1E3F20, (uint64_t)v17);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1B8DAD014;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  v18 = v16;
  sub_1B8DEE404((uint64_t)v12);
  sub_1B8D8DEC0((uint64_t)v11, (uint64_t)&unk_1EF1E3F18, (uint64_t)v15);
  swift_release();
  sub_1B8DACDE8((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1B8DAD014;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  v18 = v16;
  sub_1B8DEE404((uint64_t)v12);
  sub_1B8D8DEC0((uint64_t)v11, (uint64_t)&unk_1EF1E3F10, (uint64_t)v15);
  swift_release();
  sub_1B8DACDE8((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1B8DAD014;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  v18 = v16;
  sub_1B8DEE404((uint64_t)v12);
  sub_1B8D8DEC0((uint64_t)v11, (uint64_t)&unk_1EF1E3F08, (uint64_t)v15);
  swift_release();
  sub_1B8DACDE8((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1B8DAD014;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  v18 = v16;
  sub_1B8DEE404((uint64_t)v12);
  sub_1B8D8DEC0((uint64_t)v11, (uint64_t)&unk_1EF1E3F00, (uint64_t)v15);
  swift_release();
  sub_1B8DACDE8((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1B8DAD014;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  v18 = v16;
  sub_1B8DEE404((uint64_t)v12);
  sub_1B8D8DEC0((uint64_t)v11, (uint64_t)&unk_1EF1E3EF8, (uint64_t)v15);
  swift_release();
  sub_1B8DACDE8((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1B8DACDF8;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  v18 = v16;
  sub_1B8DEE404((uint64_t)v12);
  sub_1B8D8DEC0((uint64_t)v11, (uint64_t)&unk_1EF1E3EF0, (uint64_t)v15);
  swift_release();
  sub_1B8DACDE8((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)registerObserver:(id)a3
{
  sub_1B8DEACC4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1E6F2EA28, (uint64_t)&unk_1EF1E3EE8);
}

- (void)unregisterObserver:(id)a3
{
  sub_1B8DEACC4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1E6F2EA00, (uint64_t)&unk_1EF1E3EE0);
}

- (void)setSystemReady
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _TtC18MobileTimerSupport23MTStopwatchStorageProxy *v8;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F320);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B8DFDD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  v8 = self;
  sub_1B8DE775C((uint64_t)v5, (uint64_t)&unk_1EF1E3ED8, (uint64_t)v7);
  swift_release();
  sub_1B8D9D154((uint64_t)v5, &qword_1ED36F320);

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
