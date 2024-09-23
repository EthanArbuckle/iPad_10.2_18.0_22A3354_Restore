@implementation ZL24CADisplayGetDummyDisplayv

CALocalDisplay *___ZL24CADisplayGetDummyDisplayv_block_invoke()
{
  CALocalDisplay *result;

  result = +[CALocalDisplay displayWithDisplayId:name:deviceName:update:timings:](CALocalDisplay, "displayWithDisplayId:name:deviceName:update:timings:", 0, CFSTR("Dummy"), CFSTR("Dummy"), &__block_literal_global_769, &__block_literal_global_771);
  CADisplayGetDummyDisplay(void)::dummy_display = (uint64_t)result;
  return result;
}

@end
