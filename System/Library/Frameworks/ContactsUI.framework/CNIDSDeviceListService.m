@implementation CNIDSDeviceListService

- (id)fetch
{
  CNIDSDeviceListService *v2;
  void *v3;

  v2 = self;
  sub_18ACBA1BC();

  type metadata accessor for DeviceListServiceDeviceInfo();
  v3 = (void *)sub_18AF4FD28();
  swift_bridgeObjectRelease();
  return v3;
}

- (CNIDSDeviceListService)init
{
  CNIDSDeviceListService *v2;
  id v3;
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNIDSDeviceListService____lazy_storage___services) = 0;
  v2 = self;
  v3 = CNUILogPosters();
  sub_18AF4E90C();

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for IDSDeviceListService();
  return -[CNIDSDeviceListService init](&v5, sel_init);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___CNIDSDeviceListService_logger;
  v4 = sub_18AF4E900();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
