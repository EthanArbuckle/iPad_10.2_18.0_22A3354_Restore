@implementation GraphSimulationXPC.Server

- (void)mockTripleEntityTaggingWithContactId:(NSString *)a3 inferredRelationshipLabel:(NSString *)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  NSString *v11;
  _TtCC24IntelligencePlatformCore18GraphSimulationXPC6Server *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF63A6E8, (uint64_t)v9);
}

- (_TtCC24IntelligencePlatformCore18GraphSimulationXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore18GraphSimulationXPC6Server *)GraphSimulationXPC.Server.init()();
}

@end
