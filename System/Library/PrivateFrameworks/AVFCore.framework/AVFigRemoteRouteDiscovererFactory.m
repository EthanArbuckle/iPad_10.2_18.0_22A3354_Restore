@implementation AVFigRemoteRouteDiscovererFactory

- (OpaqueFigRouteDiscoverer)createRouteDiscovererWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4
{
  FigRouteDiscovererXPCRemoteCreate();
  return 0;
}

@end
