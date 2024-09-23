@implementation CISeedFillProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  int v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  uint64_t v26;
  int v27;
  unsigned __int8 v28;
  _QWORD *inited;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t j;
  __int128 v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  vImage_Buffer dest;
  vImage_Buffer src;
  float v43[4];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  v10 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
  objc_msgSend(v9, "format");
  objc_msgSend(v10, "format");
  objc_msgSend(a5, "format");
  objc_msgSend(a5, "region");
  v12 = v11;
  objc_msgSend(a5, "region");
  v14 = v13;
  v15 = objc_msgSend(a5, "bytesPerRow");
  clearOutput(a5);
  *(_OWORD *)&src.height = xmmword_19248E2C0;
  src.rowBytes = 8;
  dest.data = v43;
  *(_OWORD *)&dest.height = xmmword_19248E2C0;
  dest.rowBytes = 16;
  src.data = (void *)objc_msgSend(v10, "baseAddress");
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
  v16 = roundf(v43[0]);
  v17 = roundf(v43[1]);
  objc_msgSend(v9, "region");
  v19 = (int)(v16 - v18);
  objc_msgSend(v9, "region");
  v21 = (int)(v17 - v20);
  if (v19 <= v21)
    v22 = (int)(v17 - v20);
  else
    v22 = v19;
  if (v22 >= 1)
  {
    v23 = (unint64_t)v12;
    v24 = (unint64_t)v14;
    objc_msgSend(v9, "region");
    v26 = (int)(v25 - (double)v21 + -1.0);
    v27 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kThreshold")), "intValue");
    v28 = (v27 & ~(v27 >> 31)) >= 0xFF ? -1 : v27 & ~(v27 >> 31);
    inited = initBitmask((unint64_t)v14, (unint64_t)v12);
    *((_QWORD *)&v37 + 1) = objc_msgSend(v9, "bytesPerRow", v28, 0, 0, 0, 0);
    objc_msgSend(v9, "region");
    v38 = (unint64_t)v30;
    objc_msgSend(v9, "region");
    v39 = (unint64_t)v31;
    LODWORD(v40) = 0;
    seedFill(objc_msgSend(v9, "baseAddress"), (uint64_t)inited, v19, v26, (uint64_t)&v37, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))fillR8);
    v32 = objc_msgSend(a5, "baseAddress");
    if (v23)
    {
      v33 = v32;
      for (i = 0; i != v23; ++i)
      {
        if (v24)
        {
          for (j = 0; j != v24; ++j)
            *(_BYTE *)(v33 + j) = -(char)bitValueFromBitmask((uint64_t)inited, j, i);
        }
        v33 += v15;
      }
    }
  }
  return 1;
}

+ (int)outputFormat
{
  return 261;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  int *v3;

  if (a3 == 1)
  {
    v3 = &kCIFormatRGBAh;
    return *v3;
  }
  if (!a3)
  {
    v3 = &kCIFormatR8;
    return *v3;
  }
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)result
{
  if (a3 == 1)
  {
    result.origin.x = 0.0;
    result.origin.y = 0.0;
    result.size.width = 1.0;
    result.size.height = 1.0;
  }
  return result;
}

@end
