@implementation TiledHistogram

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  _WORD *v22;
  unint64_t v23;
  float *v34;
  int32x2_t v35;
  float32x2_t v36;
  float *v37;
  float *v38;
  float v39;
  uint64_t v41;
  _QWORD v42[4097];

  v42[4095] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("binCount")), "unsignedLongValue");
  v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("areaW")), "longValue");
  v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("areaH")), "longValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("scale")), "floatValue");
  v13 = v12;
  v14 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  objc_msgSend(v14, "region");
  v16 = v15;
  v18 = (unint64_t)v17;
  bzero(&v41, 0x8000uLL);
  v19 = objc_msgSend(v14, "baseAddress");
  if (v18)
  {
    v20 = v19;
    for (i = 0; i != v18; ++i)
    {
      if ((unint64_t)v16)
      {
        v22 = (_WORD *)(v20 + 4);
        v23 = (unint64_t)v16;
        do
        {
          _H0 = v22[1];
          __asm { FCVT            S0, H0 }
          _H1 = *(v22 - 2);
          __asm { FCVT            S1, H1 }
          *(float *)&v42[2 * (int)_S1 - 1] = *(float *)&v42[2 * (int)_S1 - 1] + _S0;
          LOWORD(_S1) = *(v22 - 1);
          __asm { FCVT            S1, H1 }
          *((float *)&v42[2 * (int)_S1 - 1] + 1) = *((float *)&v42[2 * (int)_S1 - 1] + 1) + _S0;
          LOWORD(_S1) = *v22;
          __asm { FCVT            S1, H1 }
          *(float *)&v42[2 * (int)_S1] = *(float *)&v42[2 * (int)_S1] + _S0;
          v22 += 4;
          --v23;
        }
        while (v23);
      }
      v20 += objc_msgSend(v14, "bytesPerRow") & 0xFFFFFFFFFFFFFFF8;
    }
  }
  v34 = (float *)objc_msgSend(a5, "baseAddress");
  if (!objc_msgSend(v14, "roiTileIndex"))
    bzero(v34, 16 * v9);
  if (v9)
  {
    *(float *)v35.i32 = v13 / (float)(v11 * v10);
    v36 = (float32x2_t)vdup_lane_s32(v35, 0);
    v37 = v34 + 2;
    v38 = (float *)v42;
    do
    {
      *((float32x2_t *)v37 - 1) = vmla_f32(*(float32x2_t *)(v37 - 2), v36, *(float32x2_t *)(v38 - 2));
      v39 = *v38;
      v38 += 4;
      *v37 = *v37 + (float)(v39 * *(float *)v35.i32);
      v37 += 4;
      --v9;
    }
    while (v9);
  }
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4
{
  return 2056;
}

+ (int)outputFormatWithArguments:(id)a3
{
  return 2312;
}

+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v6 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("tileSize"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "longValue");
  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("areaX")), "longValue");
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("areaY")), "longValue");
  v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("areaW")), "longValue");
  v10 = (v6 - 1 + objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("areaH")), "longValue")) / v6;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      if ((v6 - 1 + v9) / v6 >= 1)
      {
        v13 = (v6 - 1 + v9) / v6;
        v14 = v7;
        do
        {
          v16.origin.x = (double)v14;
          v16.origin.y = (double)(v8 + i * v6);
          v16.size.width = (double)v6;
          v16.size.height = (double)v6;
          v18.origin.x = (double)v7;
          v18.origin.y = (double)v8;
          v18.size.width = (double)v9;
          v18.size.height = (double)v9;
          v17 = CGRectIntersection(v16, v18);
          objc_msgSend(v11, "addObject:", +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height));
          v14 += v6;
          --v13;
        }
        while (v13);
      }
    }
  }
  return v11;
}

@end
