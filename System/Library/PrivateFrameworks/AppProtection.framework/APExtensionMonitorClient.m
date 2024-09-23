@implementation APExtensionMonitorClient

- (void)beginMonitoringForExtensionUUID:(id)a3 monitorUUID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC13AppProtection24APExtensionMonitorClient *v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;

  v5 = sub_2362CB428();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v11);
  v13 = (char *)&v16 - v12;
  sub_2362CB410();
  sub_2362CB410();
  v14 = self;
  sub_2362B3FBC((uint64_t)v13, (uint64_t)v10);

  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v10, v5);
  v15(v13, v5);
}

- (void)endMonitoringForMonitorUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC13AppProtection24APExtensionMonitorClient *v9;
  uint64_t v10;

  v4 = sub_2362CB428();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2362CB410();
  v9 = self;
  sub_2362B4908((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC13AppProtection24APExtensionMonitorClient)init
{
  _TtC13AppProtection24APExtensionMonitorClient *result;

  result = (_TtC13AppProtection24APExtensionMonitorClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  sub_236264B94((uint64_t)self + OBJC_IVAR____TtC13AppProtection24APExtensionMonitorClient_delegate);
  swift_bridgeObjectRelease();
}

@end
