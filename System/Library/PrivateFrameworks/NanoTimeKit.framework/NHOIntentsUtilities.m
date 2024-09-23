@implementation NHOIntentsUtilities

+ (void)pickableEnergyForecastIntentsWithHome:(HMHome *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  HMHome *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF171E48);
  MEMORY[0x1E0C80A78](v7, v8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = v12;
  v13[4] = a1;
  v14 = sub_1B752FDFC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF171E98;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF171EA0;
  v16[5] = v15;
  v17 = a3;
  sub_1B751FFCC((uint64_t)v11, (uint64_t)&unk_1EF171EA8, (uint64_t)v16);
  swift_release();
}

+ (void)pickableElectricityUsageIntentsWithHome:(HMHome *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  HMHome *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF171E48);
  MEMORY[0x1E0C80A78](v7, v8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = v12;
  v13[4] = a1;
  v14 = sub_1B752FDFC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF171E78;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF171E80;
  v16[5] = v15;
  v17 = a3;
  sub_1B751FFCC((uint64_t)v11, (uint64_t)&unk_1EF171E88, (uint64_t)v16);
  swift_release();
}

+ (void)pickableElectricityRatesIntentsWithHome:(HMHome *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  HMHome *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF171E48);
  MEMORY[0x1E0C80A78](v7, v8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = v12;
  v13[4] = a1;
  v14 = sub_1B752FDFC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF171E58;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF171E60;
  v16[5] = v15;
  v17 = a3;
  sub_1B751FFCC((uint64_t)v11, (uint64_t)&unk_1EF171E68, (uint64_t)v16);
  swift_release();
}

+ (id)pickableActionSetIntentsWithHome:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  sub_1B752FE68();

  sub_1B752FBB0();
  v4 = (void *)sub_1B752FDCC();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)pickableAccessoryIntentsWithHome:(id)a3 room:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  sub_1B752FE5C();

  sub_1B752FB98();
  v7 = (void *)sub_1B752FDCC();
  swift_bridgeObjectRelease();
  return v7;
}

- (NHOIntentsUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[NHOIntentsUtilities init](&v3, sel_init);
}

@end
