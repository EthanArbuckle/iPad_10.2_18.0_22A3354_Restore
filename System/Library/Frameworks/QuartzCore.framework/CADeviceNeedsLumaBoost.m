@implementation CADeviceNeedsLumaBoost

void __CADeviceNeedsLumaBoost_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  int Int;
  const std::string *v4[3];
  void **v5[2];

  v5[1] = *(void ***)MEMORY[0x1E0C80C00];
  v0 = MGGetProductType();
  v1 = 0;
  v2 = CADeviceNeedsLumaBoost::needs_luma_bost;
  do
    v2 |= _ZZZ22CADeviceNeedsLumaBoostEUb0_E13boost_devices[v1++] == v0;
  while (v1 != 22);
  CADeviceNeedsLumaBoost::needs_luma_bost = v2;
  if (CADeviceHasInternalBuild::once != -1)
    dispatch_once(&CADeviceHasInternalBuild::once, &__block_literal_global_107);
  if (CADeviceHasInternalBuild::internal)
  {
    CABootArgGetArray(v4);
    Int = CABootArgGetInt(v4[0], v4[1], 0, "iomfb_RuntimeProperty_TLStrength");
    v5[0] = (void **)v4;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](v5);
    if (Int)
      CADeviceNeedsLumaBoost::needs_luma_bost = 0;
  }
}

@end
