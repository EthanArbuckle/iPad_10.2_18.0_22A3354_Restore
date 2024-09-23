@implementation SensorController

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore16SensorController)initWithAccessory:(id)a3 id:(int64_t)a4 name:(id)a5 sensors:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  _TtC11DockKitCore16SensorController *v13;

  v8 = sub_23A690E1C();
  v10 = v9;
  type metadata accessor for Sensor();
  v11 = sub_23A690F18();
  v12 = a3;
  v13 = (_TtC11DockKitCore16SensorController *)sub_23A678150(a3, a4, v8, v10, v11);

  swift_bridgeObjectRelease();
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore16SensorController *v5;

  v4 = a3;
  v5 = self;
  sub_23A62E48C(v4);

}

- (_TtC11DockKitCore16SensorController)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore16SensorController *v4;

  v3 = a3;
  sub_23A690D08();
  swift_unknownObjectWeakInit();
  v4 = (_TtC11DockKitCore16SensorController *)sub_23A62F264();

  return v4;
}

- (void)getSensorDataWithSensors:(NSArray *)a3 delegate:(_TtP11DockKitCore23XPCSensorClientProtocol_ *)a4 occurrence:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSArray *v19;
  _TtC11DockKitCore16SensorController *v20;
  uint64_t v21;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2569A11C8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2569A11D0;
  v18[5] = v17;
  v19 = a3;
  swift_unknownObjectRetain();
  v20 = self;
  sub_23A67DFCC((uint64_t)v13, (uint64_t)&unk_2569A11D8, (uint64_t)v18);
  swift_release();
}

- (void)stopSensorDataWithSensors:(NSArray *)a3 completionHandler:(id)a4
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
  _TtC11DockKitCore16SensorController *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A11A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A11B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A11B8, (uint64_t)v14);
  swift_release();
}

- (void)setSensorStateWithSensors:(NSArray *)a3 states:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSArray *v18;
  _TtC11DockKitCore16SensorController *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A1198;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A03C0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_25699FF10, (uint64_t)v16);
  swift_release();
}

- (_TtC11DockKitCore16SensorController)initWithAccessory:(id)a3 id:(int64_t)a4 type:(int64_t)a5 name:(id)a6
{
  id v6;
  _TtC11DockKitCore16SensorController *result;

  v6 = a3;
  result = (_TtC11DockKitCore16SensorController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11DockKitCore16SensorController_logger;
  v3 = sub_23A690D14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
