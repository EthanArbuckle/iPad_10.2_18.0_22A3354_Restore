@implementation CADeviceSupportsHDRProcessing

void __CADeviceSupportsHDRProcessing_block_invoke()
{
  if (hdrprocessing_init_once != -1)
    dispatch_once_f(&hdrprocessing_init_once, 0, (dispatch_function_t)load_hdrprocessing_symbols);
  CADeviceSupportsHDRProcessing::supports_hdr = hdr_handle != 0;
}

@end
