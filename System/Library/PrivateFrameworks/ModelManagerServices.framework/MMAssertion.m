@implementation MMAssertion

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (MMAssertion)initWithPolicy:(id)a3 description:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_2422726A4();
  v6 = v5;
  v7 = sub_2422726A4();
  return (MMAssertion *)sub_24222CC98(v4, v6, v7, v8);
}

- (void)acquireWithCompletionHandler:(id)a3
{
  sub_24222D190(self, (int)a2, a3, (uint64_t)&unk_25133C040, (uint64_t)&unk_2571E1EF8);
}

- (void)invalidateWithCompletionHandler:(id)a3
{
  sub_24222D190(self, (int)a2, a3, (uint64_t)&unk_25133BFA0, (uint64_t)&unk_2571E1EB0);
}

- (MMAssertion)init
{
  MMAssertion.init()();
}

@end
