@implementation LayoutConstantsExtraLarge

void ___LayoutConstantsExtraLarge_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  v2 = a2;
  _LayoutConstantsModularSmall(v2, (uint64_t)v9);
  _LayoutConstantsExtraLarge___constants = v9[0];
  *(_OWORD *)&qword_1EF172A50 = v9[1];
  qword_1EF172A60 = v10;
  CLKRoundForDevice();
  *(_QWORD *)&_LayoutConstantsExtraLarge___constants = v3;
  CLKRoundForDevice();
  qword_1EF172A58 = v4;
  CLKRoundForDevice();
  qword_1EF172A50 = v5;
  CLKRoundForDevice();
  *((_QWORD *)&_LayoutConstantsExtraLarge___constants + 1) = v6;
  CLKRoundForDevice();
  v8 = v7;

  qword_1EF172A60 = v8;
}

void ___LayoutConstantsExtraLarge_block_invoke_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoundingBehavior:", 3);
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 8.0, 10.5);
  _LayoutConstantsExtraLarge___constants_0 = v3;
  v11[0] = &unk_1E6C9E4D0;
  v11[1] = &unk_1E6C9E4E8;
  v12[0] = &unk_1E6CA44E8;
  v12[1] = &unk_1E6CA44F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v4, 7.0);
  _LayoutConstantsExtraLarge___constants_1 = v5;

  v9[0] = &unk_1E6C9E4D0;
  v9[1] = &unk_1E6C9E4E8;
  v10[0] = &unk_1E6CA4508;
  v10[1] = &unk_1E6CA4518;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v6, 105.0);
  _LayoutConstantsExtraLarge___constants_2 = v7;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 1.75, 2.25);
  _LayoutConstantsExtraLarge___constants_3 = v8;

}

void ___LayoutConstantsExtraLarge_block_invoke_1(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  double (**v4)(_QWORD, double, double);
  double Width;
  _QWORD aBlock[4];
  id v7;
  _OWORD v8[3];
  CGRect v9;

  v2 = a2;
  _LayoutConstantsModularSmall_0(v2, v8);
  _LayoutConstantsExtraLarge___constants_0 = v8[0];
  *(_OWORD *)&qword_1EF174160 = v8[1];
  xmmword_1EF174170 = v8[2];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___LayoutConstantsExtraLarge_block_invoke_2;
  aBlock[3] = &unk_1E6BD5238;
  v7 = v2;
  v3 = v2;
  v4 = (double (**)(_QWORD, double, double))_Block_copy(aBlock);
  objc_msgSend(v3, "screenBounds");
  Width = CGRectGetWidth(v9);
  *(_QWORD *)&_LayoutConstantsExtraLarge___constants_0 = v4[2](v4, Width, *(double *)&_LayoutConstantsExtraLarge___constants_0);
  *((_QWORD *)&_LayoutConstantsExtraLarge___constants_0 + 1) = v4[2](v4, Width, *((double *)&_LayoutConstantsExtraLarge___constants_0+ 1));
  qword_1EF174160 = v4[2](v4, Width, *(double *)&qword_1EF174160);
  qword_1EF174168 = v4[2](v4, Width, *(double *)&qword_1EF174168);
  *(_QWORD *)&xmmword_1EF174170 = v4[2](v4, Width, *(double *)&xmmword_1EF174170);
  *((_QWORD *)&xmmword_1EF174170 + 1) = v4[2](v4, Width, *((double *)&xmmword_1EF174170 + 1));

}

uint64_t ___LayoutConstantsExtraLarge_block_invoke_2()
{
  return CLKRoundForDevice();
}

float64x2_t ___LayoutConstantsExtraLarge_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  float64x2_t result;
  double v5;
  float64x2_t v6[5];

  v2 = a2;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v5 = v3;
  _LayoutConstantsCircular(v2, v6);

  _LayoutConstantsExtraLarge___constantsGraphicExtraLarge = (__int128)vmulq_n_f64(v6[0], v5);
  unk_1EF174440 = vmulq_n_f64(v6[1], v5);
  xmmword_1EF174450 = (__int128)vmulq_n_f64(v6[2], v5);
  xmmword_1EF174460 = (__int128)vmulq_n_f64(v6[3], v5);
  result = vmulq_n_f64(v6[4], v5);
  xmmword_1EF174470 = (__int128)result;
  return result;
}

float64x2_t ___LayoutConstantsExtraLarge_block_invoke_4(uint64_t a1, void *a2)
{
  float64x2_t v7;
  float64x2_t result;
  _OWORD v9[3];

  _LayoutConstantsModularSmall_1(a2, v9);
  _LayoutConstantsExtraLarge_constants = v9[0];
  *(double *)&_LayoutConstantsExtraLarge_constants = *(double *)v9 * 3.0;
  __asm { FMOV            V0.2D, #3.0 }
  v7 = vmulq_f64((float64x2_t)v9[1], _Q0);
  result = vmulq_f64((float64x2_t)v9[2], _Q0);
  xmmword_1EF174528 = (__int128)v7;
  xmmword_1EF174538 = (__int128)result;
  return result;
}

float64x2_t ___LayoutConstantsExtraLarge_block_invoke_5(uint64_t a1, void *a2)
{
  float64x2_t result;
  float64x2_t v8[5];

  _LayoutConstantsModularSmall_2(a2, v8);
  __asm { FMOV            V0.2D, #3.0 }
  _LayoutConstantsExtraLarge_constants_0 = (__int128)vmulq_f64(v8[0], _Q0);
  unk_1EF175A20 = vmulq_f64(v8[1], _Q0);
  xmmword_1EF175A30 = (__int128)vmulq_f64(v8[2], _Q0);
  xmmword_1EF175A40 = (__int128)vmulq_f64(v8[3], _Q0);
  result = vmulq_f64(v8[4], _Q0);
  xmmword_1EF175A50 = (__int128)result;
  return result;
}

@end
