@implementation HFHomeEnergyManager

- (_TtC4Home19HFHomeEnergyManager)initWithHome:(id)a3
{
  id v4;
  id v5;
  id v6;
  _BYTE *v7;
  _TtC4Home19HFHomeEnergyManager *v8;

  v4 = objc_allocWithZone(MEMORY[0x1E0C9E390]);
  v5 = a3;
  v6 = objc_msgSend(v4, sel_init);
  v7 = objc_allocWithZone((Class)type metadata accessor for HFHomeEnergyManager());
  v8 = (_TtC4Home19HFHomeEnergyManager *)sub_1DD447E14(v5, (uint64_t)v6, v7);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (CLLocation)temporaryLocation
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation);
  swift_beginAccess();
  return (CLLocation *)*v2;
}

- (void)setTemporaryLocation:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isGridForecastVisible
{
  _TtC4Home19HFHomeEnergyManager *v2;
  char v3;

  v2 = self;
  v3 = sub_1DD43C070();

  return v3 & 1;
}

- (BOOL)isGridForecastEnabled
{
  _TtC4Home19HFHomeEnergyManager *v2;
  char v3;

  v2 = self;
  v3 = sub_1DD43C1A0();

  return v3 & 1;
}

- (void)setIsGridForecastEnabled:(BOOL)a3
{
  _TtC4Home19HFHomeEnergyManager *v4;

  v4 = self;
  sub_1DD43C3A8(a3);

}

- (BOOL)effectiveGridForecastAvailable
{
  unsigned __int8 *v3;
  int v4;
  _BYTE *v5;

  v3 = (unsigned __int8 *)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable;
  swift_beginAccess();
  v4 = *v3;
  if (v4 == 2)
  {
    v5 = (char *)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable;
    swift_beginAccess();
    LOBYTE(v4) = *v5;
  }
  return v4 & 1;
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
  _TtC4Home19HFHomeEnergyManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378350);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DD63E2FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F03E6288;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F03E6290;
  v12[5] = v11;
  v13 = self;
  sub_1DD447CC8((uint64_t)v7, (uint64_t)&unk_1F03E6298, (uint64_t)v12);
  swift_release();
}

- (BOOL)isHomeElectricitySupported
{
  _TtC4Home19HFHomeEnergyManager *v2;
  char v3;

  v2 = self;
  v3 = sub_1DD43D47C();

  return v3 & 1;
}

- (void)setIsHomeElectricitySupported:(BOOL)a3
{
  _TtC4Home19HFHomeEnergyManager *v4;

  v4 = self;
  sub_1DD43D4C8(a3);

}

- (BOOL)cachedHasEnergySite
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite;
  swift_beginAccess();
  return *v2;
}

- (void)setCachedHasEnergySite:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)cachedHasUtilitySubscription
{
  _TtC4Home19HFHomeEnergyManager *v2;
  char v3;

  v2 = self;
  v3 = sub_1DD43D880();

  return v3 & 1;
}

- (BOOL)isHomeEnergyVisible
{
  _TtC4Home19HFHomeEnergyManager *v2;
  char v3;

  v2 = self;
  v3 = sub_1DD43DE00();

  return v3 & 1;
}

- (void)isHomeElectricitySupportedInHomeRegionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Home19HFHomeEnergyManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378350);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DD63E2FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F03E6268;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F03E6270;
  v12[5] = v11;
  v13 = self;
  sub_1DD447CC8((uint64_t)v7, (uint64_t)&unk_1F03E6278, (uint64_t)v12);
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
  _TtC4Home19HFHomeEnergyManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378350);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DD63E2FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F03E6248;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F03E6250;
  v12[5] = v11;
  v13 = self;
  sub_1DD447CC8((uint64_t)v7, (uint64_t)&unk_1F03E6258, (uint64_t)v12);
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
  _TtC4Home19HFHomeEnergyManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378350);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DD63E2FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F03E6228;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F03E6230;
  v12[5] = v11;
  v13 = self;
  sub_1DD447CC8((uint64_t)v7, (uint64_t)&unk_1F03E6238, (uint64_t)v12);
  swift_release();
}

- (void)isGridForecastAvailableInHomeRegionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Home19HFHomeEnergyManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378350);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DD63E2FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F03E6208;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F03E6210;
  v12[5] = v11;
  v13 = self;
  sub_1DD447CC8((uint64_t)v7, (uint64_t)&unk_1F03E6218, (uint64_t)v12);
  swift_release();
}

- (void)homeRegionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Home19HFHomeEnergyManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378350);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DD63E2FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F03E61E8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F03E61F0;
  v12[5] = v11;
  v13 = self;
  sub_1DD447CC8((uint64_t)v7, (uint64_t)&unk_1F03E61F8, (uint64_t)v12);
  swift_release();
}

- (BOOL)isGridForecastAvailableForNewFeaturesView
{
  return sub_1DD448504() & 1;
}

+ (void)utilityConfiguration:(NSString *)a3 completionHandler:(id)a4
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

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378350);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_1DD63E2FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1F03E62A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1F03E62B0;
  v14[5] = v13;
  v15 = a3;
  sub_1DD447CC8((uint64_t)v9, (uint64_t)&unk_1F03E62B8, (uint64_t)v14);
  swift_release();
}

- (void)createUtilitySubscriptionWithHomeID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 accessTokenExpirationDate:(NSDate *)a7 refreshToken:(NSString *)a8 address:(NSString *)a9 utilityCustomerName:(NSString *)a10 completionHandler:(id)a11
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  NSString *v21;
  _TtC4Home19HFHomeEnergyManager *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  NSDate *v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  _TtC4Home19HFHomeEnergyManager *v34;
  _TtC4Home19HFHomeEnergyManager *v35;
  NSString *v36;

  v35 = self;
  v36 = a8;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378350);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a11);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v21 = v36;
  v20[6] = a7;
  v20[7] = v21;
  v20[8] = a9;
  v20[9] = a10;
  v22 = v35;
  v20[10] = v19;
  v20[11] = v22;
  v23 = sub_1DD63E2FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_1F03E61B8;
  v24[5] = v20;
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_1F03E52F8;
  v25[5] = v24;
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v31 = v36;
  v32 = a9;
  v33 = a10;
  v34 = v35;
  sub_1DD447CC8((uint64_t)v18, (uint64_t)&unk_1F03E5300, (uint64_t)v25);
  swift_release();
}

- (_TtC4Home19HFHomeEnergyManager)init
{
  _TtC4Home19HFHomeEnergyManager *result;

  result = (_TtC4Home19HFHomeEnergyManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_geocoder);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
