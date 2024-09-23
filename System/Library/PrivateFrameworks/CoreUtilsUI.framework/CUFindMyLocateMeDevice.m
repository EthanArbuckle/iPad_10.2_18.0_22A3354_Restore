@implementation CUFindMyLocateMeDevice

- (NSString)findMyIdentifier
{
  return (NSString *)sub_21D9580CC();
}

- (NSString)idsID
{
  return (NSString *)sub_21D9580CC();
}

- (BOOL)isThisDevice
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDevice_isThisDevice);
}

- (NSString)name
{
  return (NSString *)sub_21D9580CC();
}

- (CUFindMyLocateMeDevice)initWithFindMyIdentifier:(id)a3 idsID:(id)a4 isThisDevice:(BOOL)a5 name:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  objc_super v20;

  v8 = sub_21D958DD8();
  v10 = v9;
  v11 = sub_21D958DD8();
  v13 = v12;
  v14 = sub_21D958DD8();
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___CUFindMyLocateMeDevice_findMyIdentifier);
  *v15 = v8;
  v15[1] = v10;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___CUFindMyLocateMeDevice_idsID);
  *v16 = v11;
  v16[1] = v13;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CUFindMyLocateMeDevice_isThisDevice) = a5;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___CUFindMyLocateMeDevice_name);
  *v17 = v14;
  v17[1] = v18;
  v20.receiver = self;
  v20.super_class = (Class)CUFindMyLocateMeDevice;
  return -[CUFindMyLocateMeDevice init](&v20, sel_init);
}

- (CUFindMyLocateMeDevice)init
{
  CUFindMyLocateMeDevice *result;

  result = (CUFindMyLocateMeDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
