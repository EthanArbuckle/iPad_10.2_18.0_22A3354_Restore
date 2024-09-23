@implementation CUFindMyLocateMeDeviceMonitor

- (id)meDeviceUpdatedHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor_meDeviceUpdatedHandler);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21D955168;
  aBlock[3] = &block_descriptor_12;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setMeDeviceUpdatedHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_21D95838C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor_meDeviceUpdatedHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_21D955250(v7);
}

+ (BOOL)supported
{
  return 1;
}

- (CUFindMyLocateMeDeviceMonitor)initWithDispatchQueue:(id)a3
{
  _QWORD *v3;
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor_meDeviceUpdatedHandler);
  *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__dispatchQueue) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)CUFindMyLocateMeDeviceMonitor;
  v4 = a3;
  return -[CUFindMyLocateMeDeviceMonitor init](&v6, sel_init);
}

- (void)dealloc
{
  CUFindMyLocateMeDeviceMonitor *v2;
  objc_super v3;

  v2 = self;
  sub_21D9552D4();
  v3.receiver = v2;
  v3.super_class = (Class)CUFindMyLocateMeDeviceMonitor;
  -[CUFindMyLocateMeDeviceMonitor dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_release();
  sub_21D955250(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor_meDeviceUpdatedHandler));
}

- (void)activate
{
  CUFindMyLocateMeDeviceMonitor *v2;

  v2 = self;
  sub_21D95765C((uint64_t)&unk_24E1407B0, (uint64_t)sub_21D9555C4, (uint64_t)&block_descriptor);

}

- (void)invalidate
{
  CUFindMyLocateMeDeviceMonitor *v2;

  v2 = self;
  sub_21D95765C((uint64_t)&unk_24E140800, (uint64_t)sub_21D957830, (uint64_t)&block_descriptor_6);

}

- (CUFindMyLocateMeDeviceMonitor)init
{
  CUFindMyLocateMeDeviceMonitor *result;

  result = (CUFindMyLocateMeDeviceMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
