@implementation E

vDSP_biquad_Setup __E_UTIL_deemph_block_invoke(uint64_t a1)
{
  vDSP_biquad_Setup result;
  double v2[6];

  v2[5] = *(double *)MEMORY[0x1E0C80C00];
  v2[1] = 0.0;
  v2[2] = 0.0;
  v2[0] = 1.0;
  v2[3] = (float)-*(float *)(a1 + 32);
  v2[4] = 0.0;
  result = vDSP_biquad_CreateSetup(v2, 1uLL);
  E_UTIL_deemph_biquad = (uint64_t)result;
  return result;
}

vDSP_biquad_Setup __E_UTIL_hp50_12k8_block_invoke()
{
  vDSP_biquad_Setup result;
  _OWORD v1[2];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1[0] = xmmword_1C8F4F7D0;
  v1[1] = xmmword_1C8F4F7E0;
  v2 = 0x3FEF550000000000;
  result = vDSP_biquad_CreateSetup((const double *)v1, 1uLL);
  E_UTIL_hp50_12k8_biquad = (uint64_t)result;
  return result;
}

@end
