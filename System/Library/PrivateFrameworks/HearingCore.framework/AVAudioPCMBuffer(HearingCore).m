@implementation AVAudioPCMBuffer(HearingCore)

- (id)magnitudesWithLevelMultiplier:()HearingCore count:
{
  signed int v7;
  int v8;
  int v9;
  OpaqueFFTSetup *fftsetup;
  size_t v11;
  DSPComplex *v12;
  float *v13;
  float *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  float v19;
  unint64_t v20;
  float *v21;
  float v22;
  void *v23;
  DSPComplex *v25;
  OpaqueFFTSetup *__setup;
  float __B;
  DSPSplitComplex __Z;

  v7 = llround(log2((double)(int)objc_msgSend(a1, "frameLength")));
  v8 = 1 << v7;
  if (1 << v7 >= 0)
    v9 = 1 << v7;
  else
    v9 = v8 + 1;
  fftsetup = vDSP_create_fftsetup(v7, 0);
  __Z.realp = (float *)malloc_type_calloc((uint64_t)v9 >> 1, 4uLL, 0x100004052888210uLL);
  __Z.imagp = (float *)malloc_type_calloc((uint64_t)v9 >> 1, 4uLL, 0x100004052888210uLL);
  v11 = v8;
  v12 = (DSPComplex *)malloc_type_calloc(v8, 4uLL, 0x100004052888210uLL);
  v13 = (float *)malloc_type_calloc(v11, 4uLL, 0x100004052888210uLL);
  vDSP_hann_window(v13, v11, 2);
  vDSP_vmul(*(const float **)objc_msgSend(a1, "floatChannelData"), 1, v13, 1, (float *)v12, 1, v11);
  v25 = v12;
  vDSP_ctoz(v12, 2, &__Z, 1, (uint64_t)v9 >> 1);
  __setup = fftsetup;
  vDSP_fft_zrip(fftsetup, &__Z, 1, v7, 1);
  v14 = (float *)malloc_type_calloc((uint64_t)v9 >> 1, 4uLL, 0x100004052888210uLL);
  vDSP_zvmags(&__Z, 1, v14, 1, (uint64_t)v9 >> 1);
  vDSP_vsadd(v14, 1, &kAdjust0DB, v14, 1, (uint64_t)v9 >> 1);
  __B = 1.0;
  vDSP_vdbcon(v14, 1, &__B, v14, 1, (uint64_t)v9 >> 1, 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != 31)
  {
    v16 = 0;
    v17 = 3 * (v9 >> 1) + (3 * (v9 >> 1) < 0 ? 3 : 0);
    v18 = ((3 * (v9 >> 1) / 4) & ~(v17 >> 31)) + 1;
    v19 = 0.0;
    v20 = ((uint64_t)v17 >> 2) / (unint64_t)(a4 + 1);
    v21 = v14;
    do
    {
      ++v16;
      v22 = __exp10(*v21 * 0.05) / 50.0;
      if (v19 < v22)
        v19 = v22;
      if (v20 == v16)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 * a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v23);

        v16 = 0;
        v19 = 0.0;
      }
      ++v21;
      --v18;
    }
    while (v18);
  }
  vDSP_destroy_fftsetup(__setup);
  free(__Z.realp);
  free(__Z.imagp);
  free(v25);
  free(v13);
  free(v14);
  return v15;
}

@end
