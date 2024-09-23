@implementation HomeEnergyProxy

- (void)dumpAllDataWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256D8B308;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256D8B310;
  v12[5] = v11;
  v13 = self;
  sub_23E5EC748((uint64_t)v7, (uint64_t)&unk_256D8B318, (uint64_t)v12);
  swift_release();
}

- (void)useMockDataWithFilePath:(NSString *)a3 disableMock:(BOOL)a4 validityDate:(NSDate *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSDate *v20;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_BYTE *)(v15 + 24) = a4;
  *(_QWORD *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_256D8B2E8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256D8B2F0;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  sub_23E5EC748((uint64_t)v13, (uint64_t)&unk_256D8B2F8, (uint64_t)v18);
  swift_release();
}

- (void)testNotificationsForGridID:(NSString *)a3 notificationContext:(NSDictionary *)a4 completionHandler:(id)a5
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
  NSDictionary *v18;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B2C8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8B2D0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8B2D8, (uint64_t)v16);
  swift_release();
}

- (void)testDelegateForGridIds:(NSSet *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSSet *v15;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8B2A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8B2B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8B2B8, (uint64_t)v14);
  swift_release();
}

- (void)testSetMockURLSessionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256D8B288;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256D8B290;
  v12[5] = v11;
  v13 = self;
  sub_23E5EC748((uint64_t)v7, (uint64_t)&unk_256D8B298, (uint64_t)v12);
  swift_release();
}

- (void)isNextCleanEnergyWindowNotificationEnabledForGridID:(NSString *)a3 homeID:(NSString *)a4 completionHandler:(id)a5
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B268;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8B270;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8B278, (uint64_t)v16);
  swift_release();
}

- (void)enableNextCleanEnergyWindowNotificationsForGridID:(NSString *)a3 notificationContext:(NSDictionary *)a4 completionHandler:(id)a5
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
  NSDictionary *v18;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B248;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8B250;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8B258, (uint64_t)v16);
  swift_release();
}

- (void)disableNextCleanEnergyWindowNotificationsForGridID:(NSString *)a3 homeID:(NSString *)a4 completionHandler:(id)a5
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B228;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8B230;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8B238, (uint64_t)v16);
  swift_release();
}

- (void)disableNextCleanEnergyWindowNotificationsForGridID:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8B208;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8B210;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8B218, (uint64_t)v14);
  swift_release();
}

- (void)disableAllNextCleanEnergyWindowNotificationsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256D8B1E8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256D8B1F0;
  v12[5] = v11;
  v13 = self;
  sub_23E5EC748((uint64_t)v7, (uint64_t)&unk_256D8B1F8, (uint64_t)v12);
  swift_release();
}

- (void)enableEnergyForecastDataCollectionForGridID:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8B1C8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8B1D0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8B1D8, (uint64_t)v14);
  swift_release();
}

- (void)disableEnergyForecastDataCollectionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256D8B1A8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256D8B1B0;
  v12[5] = v11;
  v13 = self;
  sub_23E5EC748((uint64_t)v7, (uint64_t)&unk_256D8B1B8, (uint64_t)v12);
  swift_release();
}

- (void)disableEnergyForecastDataCollectionForGridID:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8B188;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8B190;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8B198, (uint64_t)v14);
  swift_release();
}

- (void)energyWindowsForGridID:(NSString *)a3 fromDate:(NSDate *)a4 endDate:(NSDate *)a5 withCaching:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSString *v21;
  NSDate *v22;
  NSDate *v23;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v24;
  uint64_t v25;

  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_QWORD *)(v17 + 32) = a5;
  *(_BYTE *)(v17 + 40) = a6;
  *(_QWORD *)(v17 + 48) = v16;
  *(_QWORD *)(v17 + 56) = self;
  v18 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256D8B168;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256D8B170;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = self;
  sub_23E5EC748((uint64_t)v15, (uint64_t)&unk_256D8B178, (uint64_t)v20);
  swift_release();
}

- (void)energyWindowsFor:(NSString *)a3 withCaching:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B138;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8B140;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8B148, (uint64_t)v16);
  swift_release();
}

- (void)gridIDLookupWithCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  CLLocationDegrees *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (CLLocationDegrees *)swift_allocObject();
  v12[2] = latitude;
  v12[3] = longitude;
  *((_QWORD *)v12 + 4) = v11;
  *((_QWORD *)v12 + 5) = self;
  v13 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8B118;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B120;
  v15[5] = v14;
  v16 = self;
  sub_23E5EC748((uint64_t)v10, (uint64_t)&unk_256D8B128, (uint64_t)v15);
  swift_release();
}

- (_TtC16HomeEnergyDaemon15HomeEnergyProxy)init
{
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *result;

  result = (_TtC16HomeEnergyDaemon15HomeEnergyProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

- (void)registerEnergySiteWithSite:(_TtC19EnergyKitFoundation12EKEnergySite *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC19EnergyKitFoundation12EKEnergySite *v15;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8B0F8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8B100;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8B108, (uint64_t)v14);
  swift_release();
}

- (void)getAllSiteIDsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256D8B0D8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256D8B0E0;
  v12[5] = v11;
  v13 = self;
  sub_23E5EC748((uint64_t)v7, (uint64_t)&unk_256D8B0E8, (uint64_t)v12);
  swift_release();
}

- (void)deleteEnergySiteWithSite:(_TtC19EnergyKitFoundation12EKEnergySite *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC19EnergyKitFoundation12EKEnergySite *v15;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8B0B8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8B0C0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8B0C8, (uint64_t)v14);
  swift_release();
}

- (void)siteWithSiteID:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8B098;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8B0A0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8B0A8, (uint64_t)v14);
  swift_release();
}

- (void)updateLocationWithSiteID:(NSString *)a3 location:(CLLocation *)a4 completionHandler:(id)a5
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
  CLLocation *v18;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B078;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8B080;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8B088, (uint64_t)v16);
  swift_release();
}

- (void)updateTimezoneWithSiteID:(NSString *)a3 timezone:(NSString *)a4 completionHandler:(id)a5
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B058;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8B060;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8B068, (uint64_t)v16);
  swift_release();
}

- (void)updateStateWithSiteID:(NSString *)a3 state:(NSString *)a4 completionHandler:(id)a5
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B038;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8B040;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8B048, (uint64_t)v16);
  swift_release();
}

- (void)updateFieldsWithSiteID:(NSString *)a3 from:(NSDictionary *)a4 completionHandler:(id)a5
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
  NSDictionary *v18;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8B018;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8B020;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8B028, (uint64_t)v16);
  swift_release();
}

- (void)updateSubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 subscriptionID:(NSString *)a5 accessToken:(NSString *)a6 refreshToken:(NSString *)a7 ckFunctionToken:(NSString *)a8 accountName:(NSString *)a9 accountNumber:(NSString *)a10 address:(NSString *)a11 serviceLocationID:(NSString *)a12 alternateSupplier:(NSString *)a13 accessTokenExpirationDate:(NSDate *)a14 completionHandler:(id)a15
{
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  NSString *v23;
  NSDate *v24;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  NSDate *v41;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v42;
  char *v43;
  NSString *v44;
  NSString *v45;
  NSString *v46;
  NSString *v47;
  NSDate *v48;
  NSString *v49;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v50;

  v49 = a8;
  v50 = self;
  v47 = a7;
  v48 = a14;
  v46 = a13;
  v44 = a3;
  v45 = a9;
  v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v19);
  v43 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a15);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  v22[5] = a6;
  v23 = v49;
  v22[6] = v47;
  v22[7] = v23;
  v22[8] = a9;
  v22[9] = a10;
  v22[10] = a11;
  v22[11] = a12;
  v24 = v48;
  v22[12] = v46;
  v22[13] = v24;
  v25 = v50;
  v22[14] = v21;
  v22[15] = v25;
  v26 = sub_23E718CF8();
  v27 = (uint64_t)v43;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v43, 1, 1, v26);
  v28 = (_QWORD *)swift_allocObject();
  v28[2] = 0;
  v28[3] = 0;
  v28[4] = &unk_256D8AFF0;
  v28[5] = v22;
  v29 = (_QWORD *)swift_allocObject();
  v29[2] = 0;
  v29[3] = 0;
  v29[4] = &unk_256D8AFF8;
  v29[5] = v28;
  v30 = v44;
  v31 = a4;
  v32 = a5;
  v33 = a6;
  v34 = v47;
  v35 = v49;
  v36 = v45;
  v37 = a10;
  v38 = a11;
  v39 = a12;
  v40 = v46;
  v41 = v48;
  v42 = v50;
  sub_23E5EC748(v27, (uint64_t)&unk_256D8B000, (uint64_t)v29);
  swift_release();
}

- (void)getCurrentLocationWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256D8AFC8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256D8AFD0;
  v12[5] = v11;
  v13 = self;
  sub_23E5EC748((uint64_t)v7, (uint64_t)&unk_256D8AFD8, (uint64_t)v12);
  swift_release();
}

- (void)leanHistoricalEnergyUsageWithInterval:(NSString *)a3 start:(NSDate *)a4 end:(NSDate *)a5 subscriptionID:(NSString *)a6 utilityID:(NSString *)a7 timeZone:(NSTimeZone *)a8 flowDirection:(int64_t)a9 siteID:(NSString *)a10 completionHandler:(id)a11
{
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  NSString *v26;
  NSDate *v27;
  NSDate *v28;
  NSString *v29;
  NSString *v30;
  NSTimeZone *v31;
  NSString *v32;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v33;
  uint64_t v34;
  char *v35;
  int64_t v36;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v37;

  v36 = a9;
  v37 = self;
  v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v18);
  v35 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = _Block_copy(a11);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  v21[5] = a6;
  v21[6] = a7;
  v21[7] = a8;
  v21[8] = v36;
  v21[9] = a10;
  v21[10] = v20;
  v21[11] = self;
  v22 = sub_23E718CF8();
  v23 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v35, 1, 1, v22);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_256D8AF98;
  v24[5] = v21;
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_256D8AFA0;
  v25[5] = v24;
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v31 = a8;
  v32 = a10;
  v33 = v37;
  sub_23E5EC748(v23, (uint64_t)&unk_256D8AFA8, (uint64_t)v25);
  swift_release();
}

- (void)historicalEnergyUsageWithInterval:(NSString *)a3 start:(NSDate *)a4 timezone:(NSString *)a5 utilityID:(NSString *)a6 subscriptionID:(NSString *)a7 completionHandler:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  NSString *v23;
  NSDate *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v28;
  uint64_t v29;

  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  v20 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_256D8AF78;
  v21[5] = v19;
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_256D8AF80;
  v22[5] = v21;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v28 = self;
  sub_23E5EC748((uint64_t)v17, (uint64_t)&unk_256D8AF88, (uint64_t)v22);
  swift_release();
}

- (void)isDataAvailableWithSiteID:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8AF50;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8AF58;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8AF60, (uint64_t)v14);
  swift_release();
}

- (void)createUtilitySubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 refreshToken:(NSString *)a7 completionHandler:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v28;
  uint64_t v29;

  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  v20 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_256D8AF30;
  v21[5] = v19;
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_256D8AF38;
  v22[5] = v21;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v28 = self;
  sub_23E5EC748((uint64_t)v17, (uint64_t)&unk_256D8AF40, (uint64_t)v22);
  swift_release();
}

- (void)createUtilitySubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 accessTokenExpirationDate:(NSDate *)a7 refreshToken:(NSString *)a8 utilityCustomerName:(NSString *)a9 completionHandler:(id)a10
{
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  NSDate *v29;
  NSString *v30;
  NSString *v31;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v32;
  char *v33;
  NSString *v34;

  v34 = a9;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v17);
  v33 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = a9;
  v20[9] = v19;
  v20[10] = self;
  v21 = sub_23E718CF8();
  v22 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v33, 1, 1, v21);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_256D8AF10;
  v23[5] = v20;
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_256D8AF18;
  v24[5] = v23;
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v30 = a8;
  v31 = v34;
  v32 = self;
  sub_23E5EC748(v22, (uint64_t)&unk_256D8AF20, (uint64_t)v24);
  swift_release();
}

- (void)createUtilitySubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 accessTokenExpirationDate:(NSDate *)a7 refreshToken:(NSString *)a8 address:(NSString *)a9 utilityCustomerName:(NSString *)a10 completionHandler:(id)a11
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  NSString *v21;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v22;
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v34;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v35;
  NSString *v36;

  v35 = self;
  v36 = a8;
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v16);
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
  v23 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_256D8AEF0;
  v24[5] = v20;
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_256D8AEF8;
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
  sub_23E5EC748((uint64_t)v18, (uint64_t)&unk_256D8AF00, (uint64_t)v25);
  swift_release();
}

- (void)revokeUtilitySubscriptionWithSiteID:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8AED0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8AED8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8AEE0, (uint64_t)v14);
  swift_release();
}

- (void)renewUtilityAccessTokenWithSiteID:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8AEB0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8AEB8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8AEC0, (uint64_t)v14);
  swift_release();
}

- (void)completedOnboardingWithId:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8AE90;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8AE98;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8AEA0, (uint64_t)v14);
  swift_release();
}

- (void)updateCompletedOnboardingWithId:(NSString *)a3 value:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8AE70;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8AE78;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8AE80, (uint64_t)v16);
  swift_release();
}

- (void)utilitiesNearLocationWithLocation:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  CLLocationDegrees *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (CLLocationDegrees *)swift_allocObject();
  v12[2] = latitude;
  v12[3] = longitude;
  *((_QWORD *)v12 + 4) = v11;
  *((_QWORD *)v12 + 5) = self;
  v13 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8AE50;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8AE58;
  v15[5] = v14;
  v16 = self;
  sub_23E5EC748((uint64_t)v10, (uint64_t)&unk_256D8AE60, (uint64_t)v15);
  swift_release();
}

- (void)utilityInformationWithUtilityID:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8AE30;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8AE38;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8AE40, (uint64_t)v14);
  swift_release();
}

- (void)isTAFEnabledWithUtilityID:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8AE10;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8AE18;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8AE20, (uint64_t)v14);
  swift_release();
}

- (void)getAllUtilitiesWithCountryCode:(NSString *)a3 completionHandler:(id)a4
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
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8ADF0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8ADF8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8AE00, (uint64_t)v14);
  swift_release();
}

- (void)useUtilityMockDataWithEnableMock:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256D8ADD0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256D8ADD8;
  v14[5] = v13;
  v15 = self;
  sub_23E5EC748((uint64_t)v9, (uint64_t)&unk_256D8ADE0, (uint64_t)v14);
  swift_release();
}

- (void)clearCacheWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256D8ADB0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256D8ADB8;
  v12[5] = v11;
  v13 = self;
  sub_23E5EC748((uint64_t)v7, (uint64_t)&unk_256D8ADC0, (uint64_t)v12);
  swift_release();
}

- (void)intervalReadingWithSubscriptionID:(NSString *)a3 utilityID:(NSString *)a4 interval:(NSString *)a5 start:(NSDate *)a6 end:(NSDate *)a7 timeZone:(NSTimeZone *)a8 flowDirection:(NSString *)a9 completionHandler:(id)a10
{
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  NSDate *v28;
  NSDate *v29;
  NSTimeZone *v30;
  NSString *v31;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v32;
  char *v33;
  NSString *v34;

  v34 = a9;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v17);
  v33 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = a9;
  v20[9] = v19;
  v20[10] = self;
  v21 = sub_23E718CF8();
  v22 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v33, 1, 1, v21);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_256D8AD60;
  v23[5] = v20;
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_256D8AD68;
  v24[5] = v23;
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v30 = a8;
  v31 = v34;
  v32 = self;
  sub_23E5EC748(v22, (uint64_t)&unk_256D8AD70, (uint64_t)v24);
  swift_release();
}

- (void)generateMockAMIDataWithSiteID:(NSString *)a3 startDate:(NSString *)a4 endDate:(NSString *)a5 forceAllReadingsToConstant:(BOOL)a6 recordInterval:(int64_t)a7 batchSize:(int64_t)a8 rateSchedule:(NSString *)a9 netMetering:(BOOL)a10 direction:(int64_t)a11 randomization:(BOOL)a12 completionHandler:(id)a13
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  uint64_t v21;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v22;
  int64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v31;
  uint64_t v32;
  int64_t v33;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v34;
  int64_t v35;
  NSString *v36;
  NSString *v37;

  v35 = a8;
  v36 = a4;
  v33 = a7;
  v34 = self;
  v37 = a5;
  HIDWORD(v32) = a12;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = _Block_copy(a13);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a3;
  *(_QWORD *)(v21 + 24) = a4;
  *(_QWORD *)(v21 + 32) = a5;
  *(_BYTE *)(v21 + 40) = a6;
  v22 = v34;
  v23 = v35;
  *(_QWORD *)(v21 + 48) = v33;
  *(_QWORD *)(v21 + 56) = v23;
  *(_QWORD *)(v21 + 64) = a9;
  *(_BYTE *)(v21 + 72) = a10;
  *(_QWORD *)(v21 + 80) = a11;
  *(_BYTE *)(v21 + 88) = BYTE4(v32);
  *(_QWORD *)(v21 + 96) = v20;
  *(_QWORD *)(v21 + 104) = v22;
  v24 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v19, 1, 1, v24);
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_256D8AD40;
  v25[5] = v21;
  v26 = (_QWORD *)swift_allocObject();
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = &unk_256D8AD48;
  v26[5] = v25;
  v27 = a3;
  v28 = v36;
  v29 = v37;
  v30 = a9;
  v31 = v22;
  sub_23E5EC748((uint64_t)v19, (uint64_t)&unk_256D8AD50, (uint64_t)v26);
  swift_release();
}

- (void)generateMultipleMeterMockAMIDataWithSiteID:(NSString *)a3 startDate:(NSString *)a4 endDate:(NSString *)a5 recordInterval:(int64_t)a6 rateSchedule:(NSString *)a7 multipleMeters:(int64_t)a8 completionHandler:(id)a9
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v28;
  uint64_t v29;

  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a9);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = self;
  v21 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_256D8AD20;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_256D8AD28;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a7;
  v28 = self;
  sub_23E5EC748((uint64_t)v18, (uint64_t)&unk_256D8AD30, (uint64_t)v23);
  swift_release();
}

- (void)refreshCurrentUtilityPeakPeriodsWithSiteID:(NSString *)a3 start:(NSDate *)a4 completionHandler:(id)a5
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
  NSDate *v18;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8ACF0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8ACF8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8AD00, (uint64_t)v16);
  swift_release();
}

- (void)triggerAMIFetchFromDropboxWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256D8ACB8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256D8ACC0;
  v12[5] = v11;
  v13 = self;
  sub_23E5EC748((uint64_t)v7, (uint64_t)&unk_256D8ACC8, (uint64_t)v12);
  swift_release();
}

- (void)requestAddToShareForHomeUUID:(NSUUID *)a3 siteID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSUUID *v17;
  NSString *v18;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256D8AC80;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256D8AC88;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23E5EC748((uint64_t)v11, (uint64_t)&unk_256D8AC90, (uint64_t)v16);
  swift_release();
}

- (void)resetUtilityDataWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16HomeEnergyDaemon15HomeEnergyProxy *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256D8AC28;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256D8AC38;
  v12[5] = v11;
  v13 = self;
  sub_23E5EC748((uint64_t)v7, (uint64_t)&unk_256D8AC48, (uint64_t)v12);
  swift_release();
}

@end
