@implementation AXBTRouteIsAirpods

void __AXBTRouteIsAirpods_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E24F8D08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXBTRouteIsAirpods_ValidAirPodRoutes;
  AXBTRouteIsAirpods_ValidAirPodRoutes = v0;

}

@end
