@implementation CNKScreenSharingStateMonitorFactory

- (id)makeScreenSharingStateMonitorWithCall:(id)a3
{
  id v5;
  CNKScreenSharingStateMonitorFactory *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = self;
  CNKScreenSharingStateMonitorFactory.makeScreenSharingStateMonitor(using:)(a3);
  v8 = v7;

  return v8;
}

- (CNKScreenSharingStateMonitorProtocol)sharedMonitor
{
  CNKScreenSharingStateMonitorFactory *v2;
  void *v3;

  v2 = self;
  v3 = (void *)static ScreenSharingStateMonitor.sharedMonitor.getter();

  return (CNKScreenSharingStateMonitorProtocol *)v3;
}

- (CNKScreenSharingStateMonitorFactory)init
{
  return (CNKScreenSharingStateMonitorFactory *)CNKScreenSharingStateMonitorFactory.init()();
}

@end
