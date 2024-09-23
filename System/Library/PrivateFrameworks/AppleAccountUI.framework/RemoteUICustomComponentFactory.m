@implementation RemoteUICustomComponentFactory

+ (void)registerRemoteUISwiftViews
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static CustomComponentFactory.registerRemoteUISwiftViews()();
}

- (RemoteUICustomComponentFactory)init
{
  return (RemoteUICustomComponentFactory *)CustomComponentFactory.init()();
}

@end
