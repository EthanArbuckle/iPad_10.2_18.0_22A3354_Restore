@implementation ServerBackedExtensionMonitorRegistry.MonitorClientExport

- (void)extensionMonitorWithUUID:(id)a3 lockedStatusUpdate:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtCC13AppProtection36ServerBackedExtensionMonitorRegistryP33_0D76BCD90F39FFE5BC347065C6051DB119MonitorClientExport *v11;
  uint64_t v12;

  v6 = sub_2362CB428();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2362CB410();
  if (swift_weakLoadStrong())
  {
    v11 = self;
    sub_236275930((uint64_t)v10, a4);

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtCC13AppProtection36ServerBackedExtensionMonitorRegistryP33_0D76BCD90F39FFE5BC347065C6051DB119MonitorClientExport)init
{
  objc_super v4;

  swift_weakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ServerBackedExtensionMonitorRegistry.MonitorClientExport();
  return -[ServerBackedExtensionMonitorRegistry.MonitorClientExport init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
