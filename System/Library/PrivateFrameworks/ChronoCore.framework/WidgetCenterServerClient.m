@implementation WidgetCenterServerClient

- (void)invalidateConfigurationRecommendationsWithCompletion:(id)a3
{
  sub_1D28A2FD0((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1D28A5E04);
}

- (void)invalidateConfigurationRecommendationsInBundle:(id)a3 completion:(id)a4
{
  sub_1D28A2E4C((uint64_t)self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_1D28A54F8);
}

- (void)_loadCurrentConfigurations:(id)a3
{
  sub_1D28A2FD0((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1D28A5FE4);
}

- (void)_reloadTimelinesOfKind:(id)a3 completion:(id)a4
{
  sub_1D28A2E4C((uint64_t)self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_1D28A6234);
}

- (void)_reloadTimelinesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5
{
  void *v6;
  id v7;
  void *v8;

  v6 = _Block_copy(a5);
  sub_1D29C59E8();
  sub_1D29C59E8();
  v7 = objc_allocWithZone((Class)sub_1D29C5250());
  _Block_copy(v6);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = (void *)sub_1D29C5238();
  sub_1D28A64F0(v8, (uint64_t)self, (uint64_t)v6);
  _Block_release(v6);

  _Block_release(v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)_reloadAllTimelines:(id)a3
{
  sub_1D28A2FD0((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1D28A6B30);
}

- (void)invalidateRelevancesOfKind:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED952EC0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1D29C5C40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EFC8EF60;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EFC8EF68;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1D28A52FC((uint64_t)v9, (uint64_t)&unk_1EFC8EF70, (uint64_t)v14);
  swift_release();
}

- (void)invalidateRelevancesOfKind:(NSString *)a3 inBundle:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED952EC0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1D29C5C40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EFC8EF10;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EFC8D640;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1D28A52FC((uint64_t)v11, (uint64_t)&unk_1EFC8EF30, (uint64_t)v16);
  swift_release();
}

- (void)widgetRelevanceArchiveForKind:(id)a3 inBundle:(id)a4 handler:(id)a5
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;

  v7 = _Block_copy(a5);
  v8 = sub_1D29C59E8();
  v10 = v9;
  if (a4)
  {
    v11 = sub_1D29C59E8();
    a4 = v12;
  }
  else
  {
    v11 = 0;
  }
  _Block_copy(v7);
  swift_retain();
  sub_1D28A7810(v8, v10, v11, (unint64_t)a4, (uint64_t)self, (void (**)(_QWORD, _QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
