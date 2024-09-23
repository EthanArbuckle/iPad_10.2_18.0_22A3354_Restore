@implementation InternalBiomeXPC.Server

- (void)viewStopWithCompletion:(id)a3
{
  sub_1C0B7635C(self, (int)a2, a3, (uint64_t)&unk_1E7A20B18, (uint64_t)&unk_1EF6407C0);
}

- (void)viewRunUpdateWithViewQuery:(GDViewQuery *)a3 forceRebuild:(BOOL)a4 priorityOverride:(NSNumber *)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  GDViewQuery *v12;
  NSNumber *v13;
  _TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server *v14;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  *(_BYTE *)(v11 + 24) = a4;
  *(_QWORD *)(v11 + 32) = a5;
  *(_QWORD *)(v11 + 40) = v10;
  *(_QWORD *)(v11 + 48) = self;
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF6407B0, v11);
}

- (void)viewClearAllDataWithViewQuery:(GDViewQuery *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  GDViewQuery *v8;
  _TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF6407A0, (uint64_t)v7);
}

- (void)viewValidateWithViewQuery:(GDViewQuery *)a3 applyFixes:(BOOL)a4 verbose:(int64_t)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  GDViewQuery *v12;
  _TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server *v13;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  *(_BYTE *)(v11 + 24) = a4;
  *(_QWORD *)(v11 + 32) = a5;
  *(_QWORD *)(v11 + 40) = v10;
  *(_QWORD *)(v11 + 48) = self;
  v12 = a3;
  v13 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF640790, v11);
}

- (void)viewDumpStateWithCompletion:(id)a3
{
  void *v4;
  _TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  InternalBiomeXPC.Server.viewDumpState(completion:)((void (*)(uint64_t, _QWORD))sub_1C09D5F48);

  swift_release();
}

- (void)viewValidateWithCompletion:(id)a3
{
  sub_1C0B7635C(self, (int)a2, a3, (uint64_t)&unk_1E7A20A50, (uint64_t)&unk_1EF640780);
}

- (void)viewSetEnabledWithName:(NSString *)a3 enabled:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  NSString *v10;
  _TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF640770, v9);
}

- (_TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server *)InternalBiomeXPC.Server.init()();
}

@end
