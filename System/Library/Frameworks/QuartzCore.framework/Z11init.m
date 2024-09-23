@implementation Z11init

void *___Z11init_libedrv_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/libEDR.framework/libEDR", 2);
  init_libedr(void)::handle = (uint64_t)result;
  if (result)
  {
    result = dlsym(result, "EDRGetDefaultMinScalingFactor");
    libedr_min_scale_factor_f = (float (*)(_QWORD))result;
  }
  return result;
}

@end
