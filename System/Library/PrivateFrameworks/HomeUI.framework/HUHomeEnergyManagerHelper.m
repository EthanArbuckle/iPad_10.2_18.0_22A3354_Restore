@implementation HUHomeEnergyManagerHelper

- (HUHomeEnergyManagerHelper)initWithHome:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUHomeEnergyManagerHelper_home) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HomeEnergyManagerHelper();
  v4 = a3;
  return -[HUHomeEnergyManagerHelper init](&v6, sel_init);
}

- (void)updateHomeEnergyAvailableFeaturesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HUHomeEnergyManagerHelper *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF20A7B0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF20A7B8;
  v12[5] = v11;
  v13 = self;
  sub_1B901BAB4((uint64_t)v7, (uint64_t)&unk_1EF20A7C0, (uint64_t)v12);
  swift_release();
}

- (void)fetchPillAdviceWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HUHomeEnergyManagerHelper *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF20A790;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF20A798;
  v12[5] = v11;
  v13 = self;
  sub_1B901BAB4((uint64_t)v7, (uint64_t)&unk_1EF20A7A0, (uint64_t)v12);
  swift_release();
}

- (void)updateHomeLocationWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HUHomeEnergyManagerHelper *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF20A770;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF20A778;
  v12[5] = v11;
  v13 = self;
  sub_1B901BAB4((uint64_t)v7, (uint64_t)&unk_1EF20A780, (uint64_t)v12);
  swift_release();
}

- (void)initializeGridForecastSnapshots
{
  HUHomeEnergyManagerHelper *v2;

  v2 = self;
  sub_1B8EB88B8();

}

- (void)homeLocationRegionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HUHomeEnergyManagerHelper *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF20A750;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF20A758;
  v12[5] = v11;
  v13 = self;
  sub_1B901BAB4((uint64_t)v7, (uint64_t)&unk_1EF20A760, (uint64_t)v12);
  swift_release();
}

- (void)utilityDetailsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HUHomeEnergyManagerHelper *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF20A728;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF20A730;
  v12[5] = v11;
  v13 = self;
  sub_1B901BAB4((uint64_t)v7, (uint64_t)&unk_1EF20A738, (uint64_t)v12);
  swift_release();
}

- (void)revokeSubscriptionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HUHomeEnergyManagerHelper *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF20A718;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF209370;
  v12[5] = v11;
  v13 = self;
  sub_1B901BAB4((uint64_t)v7, (uint64_t)&unk_1EF20E5B0, (uint64_t)v12);
  swift_release();
}

+ (void)couldOnboardUtilityWithHome:(HMHome *)a3 checkLocation:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  HMHome *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = a1;
  v14 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF20A830;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF20A838;
  v16[5] = v15;
  v17 = a3;
  sub_1B901BAB4((uint64_t)v11, (uint64_t)&unk_1EF20A840, (uint64_t)v16);
  swift_release();
}

+ (void)utilityLookupWithHome:(HMHome *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  HMHome *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF20A810;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF20A818;
  v14[5] = v13;
  v15 = a3;
  sub_1B901BAB4((uint64_t)v9, (uint64_t)&unk_1EF20A820, (uint64_t)v14);
  swift_release();
}

+ (void)allUtilitiesInRegion:(NSString *)a3 completionHandler:(id)a4
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

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF20A7F0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF20A7F8;
  v14[5] = v13;
  v15 = a3;
  sub_1B901BAB4((uint64_t)v9, (uint64_t)&unk_1EF20A800, (uint64_t)v14);
  swift_release();
}

+ (void)utilityInformation:(NSString *)a3 completionHandler:(id)a4
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

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF20A7D0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF20A7D8;
  v14[5] = v13;
  v15 = a3;
  sub_1B901BAB4((uint64_t)v9, (uint64_t)&unk_1EF20A7E0, (uint64_t)v14);
  swift_release();
}

+ (int64_t)toAddressMatchTypeHelper:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (id)constructServiceAddress:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = sub_1B93EDD00();
  v4 = (void *)sub_1B8EBDA78(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (BOOL)textValidation:(id)a3 field:(id)a4
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = sub_1B93EDDB4();
  v6 = v5;
  swift_bridgeObjectRelease();
  v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0)
    v7 = v4 & 0xFFFFFFFFFFFFLL;
  return v7 != 0;
}

+ (BOOL)characterCount:(id)a3 min:(int64_t)a4 max:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_1B93EDDB4();
  LOBYTE(a5) = sub_1B8EBFE78(v7, v8, a4, a5);
  swift_bridgeObjectRelease();
  return a5 & 1;
}

+ (BOOL)regexValidationWithPattern:(id)a3 text:(id)a4
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_1B93EDDB4();
  v6 = v5;
  v7 = sub_1B93EDDB4();
  LOBYTE(v4) = sub_1B8EC0118(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (HUHomeEnergyManagerHelper)init
{
  HUHomeEnergyManagerHelper *result;

  result = (HUHomeEnergyManagerHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

+ (BOOL)accountNotFound:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF20ACE0);
  if (swift_dynamicCast())
  {
    v5 = sub_1B93EC314();
    v6 = sub_1B93EC314();

    if (v5 == v6)
      return 1;
  }
  else
  {

  }
  return 0;
}

+ (NSString)homeEnergyErrorDomain
{
  return (NSString *)(id)sub_1B93EDD84();
}

@end
