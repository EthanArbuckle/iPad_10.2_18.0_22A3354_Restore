@implementation CADeviceNeedsP3ShapeTracking

void __CADeviceNeedsP3ShapeTracking_block_invoke()
{
  char *v0;
  BOOL v1;
  unint64_t v2;
  uint64_t v3;

  v0 = getenv("CA_FORCE_P3_TRACKING");
  if (v0 && atoi(v0))
  {
    v1 = 1;
  }
  else
  {
    v2 = MGGetSInt64Answer();
    v3 = MGGetProductType();
    if (v2 >> 1 == 16392 || v3 == 1721691077 || v3 == 1429914406)
    {
      if (CADeviceUseCIF10::once != -1)
        dispatch_once(&CADeviceUseCIF10::once, &__block_literal_global_9735);
      v1 = CADeviceUseCIF10::enable_cif10 != 0;
    }
    else
    {
      v1 = 0;
    }
  }
  CADeviceNeedsP3ShapeTracking::p3_tracking = v1;
}

@end
