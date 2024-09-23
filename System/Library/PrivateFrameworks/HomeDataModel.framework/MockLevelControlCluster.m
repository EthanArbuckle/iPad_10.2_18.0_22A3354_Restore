@implementation MockLevelControlCluster

- (void)moveToLevelWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC13HomeDataModel23MockLevelControlCluster *v14;

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
  sub_23E27D85C(v12, (uint64_t)a4, (uint64_t)sub_23E27D5E4, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC13HomeDataModel23MockLevelControlCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
  sub_23E27D3BC((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (_TtC13HomeDataModel23MockLevelControlCluster)initWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
  sub_23E27D418((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_23E27D240((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC13HomeDataModel23MockLevelControlCluster_attributes, &OBJC_IVAR____TtC13HomeDataModel23MockLevelControlCluster_commandObserver, (uint64_t (*)(_QWORD, _QWORD))sub_23E27DB78);
}

@end
