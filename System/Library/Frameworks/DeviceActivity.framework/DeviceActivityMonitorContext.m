@implementation DeviceActivityMonitorContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_1C064BDB4((uint64_t)a1, (uint64_t)a2, &qword_1EF615158, (id *)&qword_1EF615A18);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_1C064BDB4((uint64_t)a1, (uint64_t)a2, &qword_1EF615160, (id *)&qword_1EF615A20);
}

- (void)intervalDidStartForActivity:(id)a3 replyHandler:(id)a4
{
  sub_1C064BED8(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1C064C6E8);
}

- (void)intervalDidEndForActivity:(id)a3 replyHandler:(id)a4
{
  sub_1C064BED8(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1C064C938);
}

- (void)eventDidReachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
  sub_1C064BF70(self, (int)a2, (int)a3, (int)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_1C064CB88);
}

- (void)intervalWillStartWarningForActivity:(id)a3 replyHandler:(id)a4
{
  sub_1C064BED8(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1C064CE68);
}

- (void)intervalWillEndWarningForActivity:(id)a3 replyHandler:(id)a4
{
  sub_1C064BED8(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1C064D0B8);
}

- (void)eventWillReachThresholdWarning:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
  sub_1C064BF70(self, (int)a2, (int)a3, (int)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_1C064D308);
}

- (_TtC14DeviceActivity28DeviceActivityMonitorContext)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC14DeviceActivity28DeviceActivityMonitorContext____lazy_storage___monitor) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DeviceActivityMonitorContext();
  return -[DeviceActivityMonitorContext init](&v3, sel_init);
}

- (_TtC14DeviceActivity28DeviceActivityMonitorContext)initWithInputItems:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_1C066103C();
  else
    v3 = 0;
  return (_TtC14DeviceActivity28DeviceActivityMonitorContext *)sub_1C064C074(v3);
}

- (_TtC14DeviceActivity28DeviceActivityMonitorContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF615A90);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_1C066103C();
  if (a4)
  {
    sub_1C0660CDC();
    v9 = sub_1C0660CF4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_1C0660CF4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtC14DeviceActivity28DeviceActivityMonitorContext *)sub_1C064C150((uint64_t)a3, (uint64_t)v8);
}

- (_TtC14DeviceActivity28DeviceActivityMonitorContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF615A90);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_1C066103C();
  if (a5)
  {
    sub_1C0660CDC();
    v11 = sub_1C0660CF4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = sub_1C0660CF4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = a4;
  return (_TtC14DeviceActivity28DeviceActivityMonitorContext *)sub_1C064C388((uint64_t)a3, a4, (uint64_t)v10);
}

- (void).cxx_destruct
{
  sub_1C064C640(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC14DeviceActivity28DeviceActivityMonitorContext____lazy_storage___monitor));
}

@end
