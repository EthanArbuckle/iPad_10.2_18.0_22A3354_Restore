@implementation XPCSessionManager.DelegateTrampoline

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
  id v8;
  _TtCC10FindMyBase17XPCSessionManagerP33_A03603F91824D587CF1B3EB0B5E03C5F18DelegateTrampoline *v9;

  swift_unownedRetainStrong();
  v7 = a3;
  v8 = a4;
  v9 = self;
  LOBYTE(a3) = sub_23B55B36C((uint64_t)v7, v8);
  swift_release();

  return a3 & 1;
}

- (_TtCC10FindMyBase17XPCSessionManagerP33_A03603F91824D587CF1B3EB0B5E03C5F18DelegateTrampoline)init
{
  _TtCC10FindMyBase17XPCSessionManagerP33_A03603F91824D587CF1B3EB0B5E03C5F18DelegateTrampoline *result;

  result = (_TtCC10FindMyBase17XPCSessionManagerP33_A03603F91824D587CF1B3EB0B5E03C5F18DelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unownedRelease();
}

@end
