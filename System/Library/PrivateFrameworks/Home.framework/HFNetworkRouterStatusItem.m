@implementation HFNetworkRouterStatusItem

+ (NSSet)serviceTypes
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378408);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DD6683F0;
  *(_QWORD *)(inited + 32) = sub_1DD63E14C();
  *(_QWORD *)(inited + 40) = v3;
  *(_QWORD *)(inited + 48) = sub_1DD63E14C();
  *(_QWORD *)(inited + 56) = v4;
  sub_1DD3EE92C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v5 = (void *)sub_1DD63E380();
  swift_bridgeObjectRelease();
  return (NSSet *)v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFNetworkRouterStatusItem *v4;
  id updated;

  if (a3)
    sub_1DD63E098();
  v4 = self;
  updated = _sSo25HFNetworkRouterStatusItemC4HomeE16_subclass_update7optionsSo8NAFutureCySo19HFItemUpdateOutcomeCGSDys11AnyHashableVypGSg_tF_0();

  swift_bridgeObjectRelease();
  return updated;
}

- (HFNetworkRouterStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFNetworkRouterStatusItem;
  return -[HFStatusItem initWithHome:room:valueSource:](&v6, sel_initWithHome_room_valueSource_, a3, a4, a5);
}

@end
