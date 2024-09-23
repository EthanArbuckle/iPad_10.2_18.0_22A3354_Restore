@implementation MatterAddDeviceExtensionConnectionHandler

- (id)principalObject
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler));
}

- (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler)initWithPrincipalObject:(id)a3
{
  uint64_t v4;

  swift_unknownObjectRetain();
  sub_23452BD64();
  swift_unknownObjectRelease();
  return (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *)sub_234514E70((uint64_t)&v4);
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  _TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *v5;

  v4 = a3;
  v5 = self;
  sub_234515064(v4);

  return 1;
}

- (void)selectWiFiNetworkFromScanResults:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED18);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23452BCB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25615F610;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25615F618;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_234518584((uint64_t)v9, (uint64_t)&unk_25615F620, (uint64_t)v14);
  swift_release();
}

- (void)selectThreadNetworkFromScanResults:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED18);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23452BCB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25615F5D8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25615F5E0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_234518584((uint64_t)v9, (uint64_t)&unk_25615F5E8, (uint64_t)v14);
  swift_release();
}

- (void)validateDeviceCredential:(MTSDeviceCredential *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  MTSDeviceCredential *v15;
  _TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED18);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23452BCB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25615F5B0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25615F5B8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_234518584((uint64_t)v9, (uint64_t)&unk_25615F5C0, (uint64_t)v14);
  swift_release();
}

- (void)pairDeviceInHome:(MTSDeviceSetupHome *)a3 onboardingPayload:(NSString *)a4 uuid:(NSUUID *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  MTSDeviceSetupHome *v19;
  NSString *v20;
  NSUUID *v21;
  _TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED18);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_23452BCB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_25615F580;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_25615F588;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_234518584((uint64_t)v13, (uint64_t)&unk_25615F590, (uint64_t)v18);
  swift_release();
}

- (void)fetchRoomsInHome:(MTSDeviceSetupHome *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  MTSDeviceSetupHome *v15;
  _TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED18);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23452BCB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25615F550;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25615F558;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_234518584((uint64_t)v9, (uint64_t)&unk_25615F560, (uint64_t)v14);
  swift_release();
}

- (void)configureDeviceWithName:(NSString *)a3 room:(MTSDeviceSetupRoom *)a4 completionHandler:(id)a5
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
  MTSDeviceSetupRoom *v18;
  _TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED18);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23452BCB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25615F4F8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25615F508;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_234518584((uint64_t)v11, (uint64_t)&unk_25615F518, (uint64_t)v16);
  swift_release();
}

- (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler)init
{
  _TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *result;

  result = (_TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler));
}

@end
