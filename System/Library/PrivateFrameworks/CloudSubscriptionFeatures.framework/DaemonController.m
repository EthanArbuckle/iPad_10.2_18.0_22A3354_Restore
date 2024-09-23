@implementation DaemonController

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  DaemonController *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = DaemonController.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v6, (NSXPCConnection)v7);

  return v9;
}

- (DaemonController)init
{
  id v2;
  id v3;
  id v4;
  DaemonController *v5;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedSessionWithNoUrlCache);
  v3 = objc_msgSend(v2, sel_urlSession);

  v4 = objc_allocWithZone((Class)type metadata accessor for DaemonController());
  v5 = (DaemonController *)DaemonController.init(session:)(v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)start
{
  DaemonController *v2;

  v2 = self;
  sub_1A5B5C6CC();

}

- (void).cxx_destruct
{

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

@end
