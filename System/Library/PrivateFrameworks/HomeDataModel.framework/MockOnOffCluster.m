@implementation MockOnOffCluster

- (id)readAttributeOnOffWithParams:(id)a3
{
  id v4;
  _TtC13HomeDataModel16MockOnOffCluster *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_23E27D5EC();

  v6 = (void *)sub_23E537454();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)onWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, id, uint64_t);
  id v13;
  id v14;
  _TtC13HomeDataModel16MockOnOffCluster *v15;
  uint64_t v16;

  v10 = _Block_copy(a6);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256D494A0);
    a4 = (id)sub_23E5377F0();
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = *(void (**)(uint64_t, id, uint64_t))((char *)&self->super.super.super.super.isa
                                                    + OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_commandObserver);
  v13 = a3;
  v14 = a5;
  v15 = self;
  if (v12)
  {
    sub_23E27D5B0((uint64_t)v12);
    v12(1, a4, 1);
    sub_23E22D1F8((uint64_t)v12);
  }
  sub_23E27C208((uint64_t)a4, &OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_attributes);
  v16 = swift_allocObject();
  *(_BYTE *)(v16 + 16) = 1;
  sub_23E27C548((uint64_t)sub_23E27DB74, v11, (uint64_t)sub_23E27DA7C, v16, (uint64_t)&unk_250EE2B58, (uint64_t)&unk_250EE2B80, (uint64_t)sub_23E27DADC, (uint64_t)&block_descriptor_25);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)offWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  void (*v12)(_QWORD, id, _QWORD);
  id v13;
  id v14;
  _TtC13HomeDataModel16MockOnOffCluster *v15;
  uint64_t v16;

  v10 = _Block_copy(a6);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256D494A0);
    a4 = (id)sub_23E5377F0();
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = *(void (**)(_QWORD, id, _QWORD))((char *)&self->super.super.super.super.isa
                                                  + OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_commandObserver);
  v13 = a3;
  v14 = a5;
  v15 = self;
  if (v12)
  {
    sub_23E27D5B0((uint64_t)v12);
    v12(0, a4, 0);
    sub_23E22D1F8((uint64_t)v12);
  }
  sub_23E27C208((uint64_t)a4, &OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_attributes);
  v16 = swift_allocObject();
  *(_BYTE *)(v16 + 16) = 0;
  sub_23E27C548((uint64_t)sub_23E27DB74, v11, (uint64_t)sub_23E27DA7C, v16, (uint64_t)&unk_250EE2B58, (uint64_t)&unk_250EE2B80, (uint64_t)sub_23E27DADC, (uint64_t)&block_descriptor_25);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)toggleWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC13HomeDataModel16MockOnOffCluster *v14;

  v10 = _Block_copy(a6);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256D494A0);
    a4 = (id)sub_23E5377F0();
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_23E27D6E4((uint64_t)a4, (uint64_t)sub_23E27DB74, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC13HomeDataModel16MockOnOffCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
  sub_23E27D3BC((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (_TtC13HomeDataModel16MockOnOffCluster)initWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
  sub_23E27D418((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_23E27D240((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_attributes, &OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_commandObserver, (uint64_t (*)(_QWORD, _QWORD))sub_23E27DB78);
}

@end
