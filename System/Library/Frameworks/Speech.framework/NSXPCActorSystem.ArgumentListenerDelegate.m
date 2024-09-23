@implementation NSXPCActorSystem.ArgumentListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtCC6Speech16NSXPCActorSystemP33_94CB77BB9A0C7D73CCFFEC4A056F3C0724ArgumentListenerDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1B2555214((uint64_t)v6, (uint64_t)v7);

  return v9 & 1;
}

- (_TtCC6Speech16NSXPCActorSystemP33_94CB77BB9A0C7D73CCFFEC4A056F3C0724ArgumentListenerDelegate)init
{
  sub_1B25552A8();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
