@implementation CILensModelCalculatorCPU

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3)
    return 2312;
  else
    return 0;
}

+ (int)outputFormat
{
  return 2056;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v6 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputFocusRect"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v7 = 1.0;
  v8 = 1.0;
  v9 = 0.0;
  v10 = 0.0;
  if (!a3 && v6)
    objc_msgSend(v6, "CGRectValue", 0.0, 0.0, 1.0, 1.0);
  result.size.height = v7;
  result.size.width = v8;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int v21;
  int v22;
  double v23;
  double v24;
  int v25;
  double v26;
  void *v27;
  float v28;
  float v29;
  BOOL v30;
  char v31;
  uint64_t i;
  double v33;
  unsigned int v34;
  void *v35;
  uint64_t j;
  float v37;
  int v38;
  unint64_t v39;
  int k;
  int v41;
  float v42;
  float v43;
  float *v44;
  double v45;
  double v46;
  unsigned int v47;
  double v48;
  double v50;
  double v51;
  float v52[4096];
  _BYTE v53[1024];
  uint64_t v54;

  MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v54 = *MEMORY[0x1E0C80C00];
  v12 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("inputFocusRect")), "CGRectValue");
  v14 = v13;
  v51 = v15;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("inputTuningParameters"));
  bzero(v53, 0x400uLL);
  bzero(v52, 0x4000uLL);
  v21 = 0;
  v22 = 0;
  v23 = v19 * 0.015625;
  v50 = v19 * 0.015625 * 0.5;
  v24 = 0.0;
  do
  {
    v25 = 0;
    v26 = 0.0;
    do
    {
      v52[v21 + v25] = sampleLinearWithOffset(v12, 0, v17 * 0.015625 * 0.5 + v14 + v17 * 0.015625 * v26, v50 + v51 + v23 * v24);
      v26 = v26 + 1.0;
      ++v25;
    }
    while (v25 != 64);
    v24 = v24 + 1.0;
    ++v22;
    v21 += 64;
  }
  while (v22 != 64);
  v27 = (void *)objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v28 = sampleLinearWithOffset(v27, 0, 0.0, 0.0);
  v29 = sampleLinearWithOffset(v27, 1u, 0.0, 0.0);
  v30 = vabds_f32(v29, v28) < 0.001;
  if (v28 == 1.0)
    v30 = 1;
  v31 = v29 == 1.0 || v30;
  if ((v31 & 1) == 0)
  {
    for (i = 0; i != 4096; ++i)
    {
      v33 = (float)(1.0 / (float)(v29 - v28)) * 255.0 * (float)(v52[i] - v28);
      v34 = (int)v33 & ~((int)v33 >> 31);
      if (v34 >= 0xFF)
        v34 = 255;
      ++*(_DWORD *)&v53[4 * v34];
    }
    v35 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    for (j = 0; j != 1024; j += 4)
      objc_msgSend(v35, "appendFormat:", CFSTR("%d, "), *(unsigned int *)&v53[j]);
    NSLog(CFSTR("focus = \n%@"), v35);
    SDOFSimpleLensModelValue(CFSTR("zeroShiftPercentile"), v20);
    v38 = vcvtmd_s64_f64(v37 * 64.0 * 64.0);
    if (v38 < 1)
    {
      v42 = 0.0;
    }
    else
    {
      v39 = 0;
      for (k = 0; k < v38; k += *(_DWORD *)&v53[4 * v39++])
      {
        v41 = v39 + 1;
        if (v39 > 0xFE)
          break;
      }
      v42 = (float)v41;
    }
    v43 = (float)((float)(v29 - v28) * v42) / 255.0 + v28;
    v44 = (float *)objc_msgSend(v7, "baseAddress");
    *v44 = v28;
    v44[1] = v43;
    v44[2] = 0.83689;
    v44[3] = v29;
    objc_msgSend(v7, "region");
    if (v45 != 1.0)
    {
      objc_msgSend(v7, "region");
      if (v46 > 0.0)
      {
        v47 = 0;
        do
        {
          memset_pattern16((void *)(objc_msgSend(v7, "baseAddress") + objc_msgSend(v7, "bytesPerRow") * v47++), v44, objc_msgSend(v7, "bytesPerRow"));
          objc_msgSend(v7, "region");
        }
        while (v48 > (double)v47);
      }
    }
  }
  return v31 ^ 1;
}

@end
