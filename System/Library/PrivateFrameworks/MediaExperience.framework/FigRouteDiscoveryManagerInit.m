@implementation FigRouteDiscoveryManagerInit

void __FigRouteDiscoveryManagerInit_block_invoke()
{
  char *v0;
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];

  if (discoverManager_getSharedManager_onceToken != -1)
    dispatch_once(&discoverManager_getSharedManager_onceToken, &__block_literal_global_15);
  v0 = &discoverManager_getSharedManager_discoveryState;
  v1 = (uint64_t)&qword_1EE2B3238;
  if (!qword_1EE2B3238)
  {
    v0 = 0;
    v1 = 8;
  }
  v2 = *(NSObject **)v1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __FigRouteDiscoveryManagerInit_block_invoke_2;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = v0;
  MXDispatchAsync((uint64_t)"FigRouteDiscoveryManagerInit_block_invoke", (uint64_t)"FigRouteDiscoveryManager.m", 2543, 0, 0, v2, (uint64_t)v3);
}

void __FigRouteDiscoveryManagerInit_block_invoke_2(uint64_t a1)
{
  discoveryManager_logDiscoverers(*(_QWORD *)(a1 + 32), 1);
}

@end
