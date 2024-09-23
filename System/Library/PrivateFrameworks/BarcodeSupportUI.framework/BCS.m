@implementation BCS

void __BCS_LOG_CHANNEL_PREFIXBarcodeScanner_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BarcodeScanner", "BarcodeScanner");
  v1 = (void *)BCS_LOG_CHANNEL_PREFIXBarcodeScanner_log;
  BCS_LOG_CHANNEL_PREFIXBarcodeScanner_log = (uint64_t)v0;

}

void __BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BarcodeScanner.LifeCycle", "BarcodeScannerLifeCycle");
  v1 = (void *)BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle_log;
  BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle_log = (uint64_t)v0;

}

@end
