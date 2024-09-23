@implementation CarPairingLogging

void __CarPairingLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carkit", "Pairing");
  v1 = (void *)CarPairingLogging_facility;
  CarPairingLogging_facility = (uint64_t)v0;

}

@end
