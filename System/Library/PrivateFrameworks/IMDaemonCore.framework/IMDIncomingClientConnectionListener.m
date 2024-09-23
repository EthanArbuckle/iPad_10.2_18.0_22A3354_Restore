@implementation IMDIncomingClientConnectionListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  swift_retain();
  v7 = sub_1D141BE4C(v6);

  swift_release();
  return v7 & 1;
}

- (IMDIncomingClientConnectionListener)init
{
  IMDIncomingClientConnectionListener *result;

  swift_defaultActor_initialize();
  result = (IMDIncomingClientConnectionListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
