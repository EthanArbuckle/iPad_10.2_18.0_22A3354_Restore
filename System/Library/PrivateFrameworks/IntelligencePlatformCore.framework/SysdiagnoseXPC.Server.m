@implementation SysdiagnoseXPC.Server

- (void)diagnosticsWithCompletion:(id)a3
{
  sub_1C0B7635C(self, (int)a2, a3, (uint64_t)&unk_1E7A322A8, (uint64_t)&unk_1EF648F30);
}

- (void)entityTaggingSupplementalDiagnosticsWithCompletion:(id)a3
{
  sub_1C0B7635C(self, (int)a2, a3, (uint64_t)&unk_1E7A32280, (uint64_t)&unk_1EF648F20);
}

- (void)entityRelevanceRankingSupplementalDiagnosticsWithCompletion:(id)a3
{
  sub_1C0B7635C(self, (int)a2, a3, (uint64_t)&unk_1E7A32258, (uint64_t)&unk_1EF648F10);
}

- (void)entityResolutionSupplementalDiagnosticsWithCompletion:(id)a3
{
  sub_1C0B7635C(self, (int)a2, a3, (uint64_t)&unk_1E7A32230, (uint64_t)&unk_1EF648F00);
}

- (void)viewsSupplementalDiagnosticsWithCompletion:(id)a3
{
  sub_1C0B7635C(self, (int)a2, a3, (uint64_t)&unk_1E7A32208, (uint64_t)&unk_1EF648EF0);
}

- (_TtCC24IntelligencePlatformCore14SysdiagnoseXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore14SysdiagnoseXPC6Server *)SysdiagnoseXPC.Server.init()();
}

@end
