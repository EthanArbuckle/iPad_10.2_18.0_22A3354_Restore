@implementation DockCoreAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore12DockCoreInfo)info
{
  return (_TtC11DockKitCore12DockCoreInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info));
}

- (void)setInfo:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info) = (Class)a3;
  v3 = a3;

}

- (NSArray)systems
{
  void *v2;

  type metadata accessor for System();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23A690F00();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSystems:(id)a3
{
  type metadata accessor for System();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_systems) = (Class)sub_23A690F18();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_23A5C0220(self, (uint64_t)a2, (void (*)(void))sub_23A5F3E64);
}

- (NSString)summary
{
  return (NSString *)sub_23A5C0220(self, (uint64_t)a2, (void (*)(void))sub_23A5F4410);
}

- (BOOL)isEqual:(id)a3
{
  _TtC11DockKitCore17DockCoreAccessory *v4;
  _TtC11DockKitCore17DockCoreAccessory *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23A6911F4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_23A5F475C((uint64_t)v8);

  sub_23A5C921C((uint64_t)v8, &qword_2569A0330);
  return v6 & 1;
}

- (int64_t)hash
{
  void *v3;
  _TtC11DockKitCore17DockCoreAccessory *v4;
  id v5;
  int64_t v6;

  sub_23A691608();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info);
  v4 = self;
  v5 = v3;
  sub_23A691188();

  v6 = sub_23A6915F0();
  return v6;
}

- (_TtC11DockKitCore17DockCoreAccessory)initWithInfo:(id)a3 systems:(id)a4
{
  uint64_t v5;
  id v6;
  _TtC11DockKitCore17DockCoreAccessory *v7;

  type metadata accessor for System();
  v5 = sub_23A690F18();
  v6 = a3;
  v7 = (_TtC11DockKitCore17DockCoreAccessory *)sub_23A607414(v6, v5);

  return v7;
}

- (void)updateFromAccessory:(id)a3
{
  objc_class *v4;
  void *v5;
  char *v6;
  objc_class *v7;
  _TtC11DockKitCore17DockCoreAccessory *v8;

  v4 = *(objc_class **)((char *)a3 + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info) = v4;
  v6 = (char *)a3;
  v8 = self;
  v7 = v4;

  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_systems) = *(Class *)&v6[OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_systems];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_version) = (Class)2;

}

- (void)disconnectWithAllowReconnect:(BOOL)a3
{
  _BOOL4 v3;
  _TtC11DockKitCore17DockCoreAccessory *v4;

  v3 = a3;
  v4 = self;
  sub_23A5F4B18(v3);

}

- (void)dealloc
{
  _TtC11DockKitCore17DockCoreAccessory *v2;

  v2 = self;
  DockCoreAccessory.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A5F234C((uint64_t)self + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_trajectoryProgressDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_logger;
  v4 = sub_23A690D14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_created;
  v6 = sub_23A6906D8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory__xpcConnection_CameraCapture));
}

- (BOOL)hasSystemWithName:(id)a3 kind:(Class)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11DockKitCore17DockCoreAccessory *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v5 = sub_23A690E1C();
  v7 = v6;
  swift_getObjCClassMetadata();
  v8 = self;
  v9 = swift_bridgeObjectRetain();
  v10 = sub_23A607668(v9, v5, v7);
  swift_bridgeObjectRelease();
  if (v10 >> 62)
    v11 = sub_23A691374();
  else
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v11 > 0;
}

- (BOOL)hasSystemActuatorsWithName:(id)a3 actuators:(id)a4
{
  return sub_23A5F5AB4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A5F535C);
}

- (int64_t)getActuatorIndexWithName:(id)a3 system:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC11DockKitCore17DockCoreAccessory *v11;
  int64_t v12;

  v5 = sub_23A690E1C();
  v7 = v6;
  v8 = sub_23A690E1C();
  v10 = v9;
  v11 = self;
  v12 = sub_23A5F55A0(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (BOOL)hasSystemSensorsWithName:(id)a3 sensors:(id)a4
{
  return sub_23A5F5AB4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A5F5800);
}

- (id)getSystemSensorsWithName:(id)a3 sensors:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC11DockKitCore17DockCoreAccessory *v9;
  void *v10;

  v5 = sub_23A690E1C();
  v7 = v6;
  v8 = sub_23A690F18();
  v9 = self;
  sub_23A5F5B40(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Sensor();
  v10 = (void *)sub_23A690F00();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)getActuatorWithName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC11DockKitCore17DockCoreAccessory *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = sub_23A690E1C();
  v6 = v5;
  v7 = self;
  v8 = sub_23A5F6134(0);
  if (v8)
  {
    v9 = (void *)v8;
    type metadata accessor for ActuationController();
    v10 = (void *)swift_dynamicCastClass();
    if (v10)
      v10 = (void *)sub_23A63440C(v4, v6);

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    v10 = 0;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore17DockCoreAccessory *v5;

  v4 = a3;
  v5 = self;
  sub_23A5F6368(v4);

}

- (_TtC11DockKitCore17DockCoreAccessory)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore17DockCoreAccessory *)DockCoreAccessory.init(coder:)(a3);
}

- (void)actuatorFeedbackWithInfo:(id)a3 system:(id)a4 actuators:(id)a5 positions:(id)a6 velocities:(id)a7 timestamp:(double)a8
{
  id v11;
  _TtC11DockKitCore17DockCoreAccessory *v12;

  sub_23A690E1C();
  sub_23A690F18();
  sub_23A690F18();
  sub_23A690F18();
  v11 = a3;
  v12 = self;
  sub_23A5FAA9C((uint64_t)v11, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)trajectoryProgressFeedbackWithInfo:(id)a3 system:(id)a4 progress:(id)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _TtC11DockKitCore17DockCoreAccessory *v12;
  id v13;

  sub_23A690E1C();
  v8 = MEMORY[0x23B853C6C]((char *)self + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_trajectoryProgressDelegate);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = a3;
    v11 = a5;
    v12 = self;
    v13 = (id)sub_23A690E04();
    objc_msgSend(v9, sel_trajectoryProgressFeedbackWithInfo_system_progress_, v10, v13, v11);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)systemEventDataWithInfo:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  _TtC11DockKitCore17DockCoreAccessory *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A5FAE74((uint64_t)v6, (uint64_t)v7);

}

- (void)batteryStateDataWithInfo:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  _TtC11DockKitCore17DockCoreAccessory *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A5FAEF0((uint64_t)v6, (uint64_t)v7);

}

- (void)trackingSummaryDataWithInfo:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  _TtC11DockKitCore17DockCoreAccessory *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A5FAF6C((uint64_t)v6, (uint64_t)v7);

}

- (void)trackingSummaryDataDebugWithInfo:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  _TtC11DockKitCore17DockCoreAccessory *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A5FAFE8((uint64_t)v6, (uint64_t)v7);

}

- (void)disconnectedWithErr:(id)a3
{
  _TtC11DockKitCore17DockCoreAccessory *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_23A5FB0FC((uint64_t)a3);

}

- (void)sensorDataWithInfo:(id)a3 system:(id)a4 sensors:(id)a5 data:(id)a6
{
  id v8;
  _TtC11DockKitCore17DockCoreAccessory *v9;

  sub_23A690E1C();
  sub_23A690F18();
  type metadata accessor for SensorData();
  sub_23A690F18();
  v8 = a3;
  v9 = self;
  sub_23A60325C((uint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC11DockKitCore17DockCoreAccessory)init
{
  _TtC11DockKitCore17DockCoreAccessory *result;

  result = (_TtC11DockKitCore17DockCoreAccessory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
