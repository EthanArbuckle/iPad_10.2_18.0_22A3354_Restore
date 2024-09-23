@implementation HFNetworkRouterServiceItem

+ (NSSet)supportedServiceTypes
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
  uint64_t v4;
  HFNetworkRouterServiceItem *v5;
  void *v6;

  if (a3)
    v4 = sub_1DD63E098();
  else
    v4 = 0;
  v5 = self;
  v6 = (void *)HFNetworkRouterServiceItem._subclass_update(options:)(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (HFNetworkRouterServiceItem)initWithValueSource:(id)a3 service:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFNetworkRouterServiceItem;
  return -[HFServiceItem initWithValueSource:service:](&v5, sel_initWithValueSource_service_, a3, a4);
}

@end
