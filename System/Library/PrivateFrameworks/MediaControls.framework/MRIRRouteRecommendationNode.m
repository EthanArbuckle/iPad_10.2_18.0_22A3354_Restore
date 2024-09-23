@implementation MRIRRouteRecommendationNode

- (NSString)avOutputDeviceIdentifier
{
  return (NSString *)sub_1AAA7F1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRIRRouteRecommendationNode_avOutputDeviceIdentifier);
}

- (void)setAvOutputDeviceIdentifier:(id)a3
{
  sub_1AAA7F260((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MRIRRouteRecommendationNode_avOutputDeviceIdentifier);
}

- (NSString)rapportIdentifier
{
  return (NSString *)sub_1AAA7F1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRIRRouteRecommendationNode_rapportIdentifier);
}

- (void)setRapportIdentifier:(id)a3
{
  sub_1AAA7F260((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MRIRRouteRecommendationNode_rapportIdentifier);
}

- (NSString)idsIdentifier
{
  return (NSString *)sub_1AAA7F1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRIRRouteRecommendationNode_idsIdentifier);
}

- (void)setIdsIdentifier:(id)a3
{
  sub_1AAA7F260((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MRIRRouteRecommendationNode_idsIdentifier);
}

- (NSString)avOutpuDeviceIdentifier
{
  void (*v2)(void);
  MRIRRouteRecommendationNode *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v3 = self;
  v2();
  v5 = v4;

  if (v5)
  {
    v6 = (void *)sub_1AAABA460();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setAvOutpuDeviceIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  MRIRRouteRecommendationNode *v8;

  if (a3)
  {
    v4 = sub_1AAABA478();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70);
  v8 = self;
  v7(v4, v6);

}

- (MRIRRouteRecommendationNode)init
{
  MRIRRouteRecommendationNode *result;

  result = (MRIRRouteRecommendationNode *)_swift_stdlib_reportUnimplementedInitializer();
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
