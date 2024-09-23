@implementation KnowledgeConstructionXPC.Server

- (void)runFullPipelineWithReason:(unint64_t)a3 completion:(id)a4
{
  sub_1C0BC3AD8(self, (int)a2, a3, a4, (uint64_t)&unk_1E7A225E0, (uint64_t)&unk_1EF641B40);
}

- (void)runFastpassPipelineWithReason:(unint64_t)a3 completion:(id)a4
{
  sub_1C0BC3AD8(self, (int)a2, a3, a4, (uint64_t)&unk_1E7A225B8, (uint64_t)&unk_1EF641B30);
}

- (void)stopPipelineWithCompletion:(id)a3
{
  sub_1C0B7635C(self, (int)a2, a3, (uint64_t)&unk_1E7A22590, (uint64_t)&unk_1EF641B20);
}

- (void)checkInWithCompletion:(id)a3
{
  sub_1C0B7635C(self, (int)a2, a3, (uint64_t)&unk_1E7A22568, (uint64_t)&unk_1EF641B10);
}

- (_TtCC24IntelligencePlatformCore24KnowledgeConstructionXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore24KnowledgeConstructionXPC6Server *)KnowledgeConstructionXPC.Server.init()();
}

@end
