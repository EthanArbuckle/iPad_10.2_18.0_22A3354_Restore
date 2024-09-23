@implementation ToolServicesServer

- (_TtC10ChronoCore18ToolServicesServer)init
{
  _TtC10ChronoCore18ToolServicesServer *result;

  result = (_TtC10ChronoCore18ToolServicesServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_timelineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_taskService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_extensionService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_descriptorService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_stateCaptureService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_widgetHostService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_controlHostService);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_liveControlService, &qword_1ED958A70);
  swift_release();
  swift_release();
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_previewControlService, &qword_1ED9521F8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_keybagStateProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_rendererSessionProvider);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_activityService, &qword_1ED954DF0);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC10ChronoCore18ToolServicesServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1D27CA120(v8);

  swift_unknownObjectRelease();
}

- (void)refreshDescriptorsForExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
  sub_1D27C961C(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1D27CAC44);
}

- (void)resetCaches:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _TtC10ChronoCore18ToolServicesServer *v11;
  _QWORD v12[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a3;
  v8[3] = sub_1D27B3278;
  v8[4] = v7;
  v12[4] = sub_1D27CD3F4;
  v12[5] = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1D271E3EC;
  v12[3] = &block_descriptor_106_0;
  v9 = _Block_copy(v12);
  v10 = a3;
  v11 = self;
  swift_retain();
  swift_release();
  BSDispatchMain();
  _Block_release(v9);

  swift_release();
}

- (void)expireLocationGracePeriods
{
  sub_1D27C9AD8(self, (uint64_t)a2, (uint64_t)sub_1D27C51FC, (uint64_t)&block_descriptor_97);
}

- (void)allCachedSnapshotURLsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _TtC10ChronoCore18ToolServicesServer *v8;
  _QWORD v9[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1D27CD5EC;
  *(_QWORD *)(v6 + 24) = v5;
  v9[4] = sub_1D27CD3A8;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D271E3EC;
  v9[3] = &block_descriptor_94_0;
  v7 = _Block_copy(v9);
  v8 = self;
  swift_retain();
  swift_release();
  BSDispatchMain();
  _Block_release(v7);

  swift_release();
}

- (void)listStateCaptureIdentifiersWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10ChronoCore18ToolServicesServer *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1D27CD3A0;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1D27CB198(MEMORY[0x1E0DEE9D8], (void (*)(uint64_t *, id))sub_1D27B2AF8, v6, (uint64_t)v7, (uint64_t)v7);

  swift_release();
  swift_release();
}

- (void)fetchStateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10ChronoCore18ToolServicesServer *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1D27CD678;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1D27CB408(0x3E6C696E3CLL, 0xE500000000000000, (void (*)(uint64_t *, void *))sub_1D27CD654, v6, (uint64_t)v7, (uint64_t)v7);

  swift_release();
  swift_release();
}

- (void)fetchStateForItemWithIdentifier:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC10ChronoCore18ToolServicesServer *v11;

  v5 = _Block_copy(a4);
  v6 = sub_1D29C59E8();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_1D27CD36C;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = self;
  swift_retain();
  sub_1D27CB5C4(0x3E6C696E3CLL, 0xE500000000000000, (void (*)(uint64_t *, _QWORD *))sub_1D27CD374, v10, (uint64_t)v11, (uint64_t)v11, v6, v8);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)extensionInfoForBundleIdentifier:(id)a3 completion:(id)a4
{
  sub_1D27C961C(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1D27CBBD4);
}

- (void)extensionInfoWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC10ChronoCore18ToolServicesServer *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED952EC0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = sub_1D29C5C40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1D27CD1C4;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_1D2961FD8((uint64_t)v7, (uint64_t)&unk_1EFC8D6D0, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)widgetsWithTimelines:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10ChronoCore18ToolServicesServer *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1D27CD1AC;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1D27CB798(0, (void (*)(id *, id))sub_1D27B3538, v6, (uint64_t)v7, (uint64_t)v7);

  swift_release();
  swift_release();
}

- (void)timelineForWidgetKey:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC10ChronoCore18ToolServicesServer *v13;
  id v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED94D920);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = sub_1D29C162C();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = self;
  v14 = a3;
  sub_1D27CB9AC(v9, (void (*)(_BYTE *, void *))sub_1D27CD5E8, v11, (uint64_t)v13, (uint64_t)v13, v14);
  sub_1D271E704((uint64_t)v9, &qword_1ED94D920);

  swift_release();
}

- (void)reloadControlsOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
  sub_1D27C8B68(self, (int)a2, (uint64_t)a3, (int)a4, (int)a5, a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D27C7FD8);
}

- (void)reloadTimelinesOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
  sub_1D27C8B68(self, (int)a2, (uint64_t)a3, (int)a4, (int)a5, a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D27C8544);
}

- (void)contentURLForActivityID:(id)a3 completion:(id)a4
{
  sub_1D27C961C(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1D27CC1DC);
}

- (void)runReaper
{
  sub_1D27C9AD8(self, (uint64_t)a2, (uint64_t)sub_1D27C96A8, (uint64_t)&block_descriptor_12);
}

- (void)fetchWidgetSceneInfoWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC10ChronoCore18ToolServicesServer *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED952EC0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1D29C5C40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EFC8D638;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EFC8D640;
  v12[5] = v11;
  v13 = self;
  sub_1D28A52FC((uint64_t)v7, (uint64_t)&unk_1EFC8EF30, (uint64_t)v12);
  swift_release();
}

- (void)runMigrationReaper
{
  sub_1D27C9AD8(self, (uint64_t)a2, (uint64_t)sub_1D27C9A74, (uint64_t)&block_descriptor_12);
}

@end
