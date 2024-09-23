@implementation HMDNetworkInfoController

- (HMDNetworkInfoController)init
{
  uint64_t v2;
  HMDNetworkInfoController *v3;

  type metadata accessor for NetworkInfoSCDataSource();
  v2 = swift_allocObject();
  v3 = (HMDNetworkInfoController *)sub_1CD0D2AB8(v2);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

- (void)dealloc
{
  void *v2;
  HMDNetworkInfoController *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDNetworkInfoController_store);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HMDNetworkInfoController_store) = 0;
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for NetworkInfoController();
  -[HMDNetworkInfoController dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___HMDNetworkInfoController_logger;
  v4 = sub_1CDAB840C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___HMDNetworkInfoController_dataSource);
}

- (void)start
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  HMDNetworkInfoController *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HMDNetworkInfoController_dataSource);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v10[2] = self;
  v6 = *(uint64_t (**)(unint64_t, unint64_t, uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v8 = v6(0xD000000000000015, 0x80000001CDB7EA80, sub_1CD0D2C18, v10, v4, v5);
  v9 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR___HMDNetworkInfoController_store);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___HMDNetworkInfoController_store) = (Class)v8;

}

- (id)obtainNetworkInfoProto
{
  HMDNetworkInfoController *v2;
  void *v3;

  v2 = self;
  NetworkInfoController.obtainNetworkInfoProto()();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA45BA8);
  v3 = (void *)sub_1CDAB8478();
  swift_bridgeObjectRelease();
  return v3;
}

@end
