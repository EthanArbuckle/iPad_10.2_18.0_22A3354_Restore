@implementation CIAreaAverageProcessor

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("region"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "CGRectValue");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v25;
  int v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  int v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  unint64_t v36;
  int v37;
  int v38;
  _QWORD v40[2];
  __int128 v41;
  int64x2_t v42;
  _QWORD v43[6];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v8 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("region")), "CGRectValue");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_msgSend(a5, "metalCommandBuffer");
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6EA0]), "initWithDevice:", objc_msgSend(v17, "device"));
    if (v19)
    {
      v20 = (void *)v19;
      objc_msgSend(v8, "region");
      x = v44.origin.x;
      y = v44.origin.y;
      width = v44.size.width;
      height = v44.size.height;
      if (CGRectIsNull(v44))
      {
        LODWORD(v25) = 0;
        v26 = 0x7FFFFFFF;
        v27 = 0x7FFFFFFF;
      }
      else
      {
        v45.origin.x = x;
        v45.origin.y = y;
        v45.size.width = width;
        v45.size.height = height;
        if (CGRectIsInfinite(v45))
        {
          v26 = -2147483647;
          LODWORD(v25) = -1;
          v27 = -2147483647;
        }
        else
        {
          v46.origin.x = x;
          v46.origin.y = y;
          v46.size.width = width;
          v46.size.height = height;
          v47 = CGRectInset(v46, 0.000001, 0.000001);
          v48 = CGRectIntegral(v47);
          v27 = (int)v48.origin.x;
          v26 = (int)v48.origin.y;
          v25 = (unint64_t)v48.size.height;
        }
      }
      v49.origin.x = v10;
      v49.origin.y = v12;
      v49.size.width = v14;
      v49.size.height = v16;
      if (CGRectIsNull(v49))
      {
        v28 = 0;
        v29 = 0;
        v30 = 0x7FFFFFFF;
        v31 = 0x7FFFFFFF;
      }
      else
      {
        v50.origin.x = v10;
        v50.origin.y = v12;
        v50.size.width = v14;
        v50.size.height = v16;
        if (CGRectIsInfinite(v50))
        {
          v30 = -2147483647;
          v28 = 0xFFFFFFFFLL;
          v29 = 0xFFFFFFFFLL;
          v31 = -2147483647;
        }
        else
        {
          v51.origin.x = v10;
          v51.origin.y = v12;
          v51.size.width = v14;
          v51.size.height = v16;
          v52 = CGRectInset(v51, 0.000001, 0.000001);
          v53 = CGRectIntegral(v52);
          v31 = (int)v53.origin.x;
          v30 = (int)v53.origin.y;
          v29 = (unint64_t)v53.size.width;
          v28 = (unint64_t)v53.size.height;
        }
      }
      v43[0] = v27 - v31;
      v43[1] = (int)v28 - v26 - (int)v25 + v30;
      v43[2] = 0;
      v43[3] = v29;
      v43[4] = v28;
      v43[5] = 1;
      objc_msgSend(v20, "setClipRectSource:", v43);
      objc_msgSend(v20, "setOptions:", 2);
      objc_msgSend(v20, "setEdgeMode:", 1);
      objc_msgSend(a5, "region");
      v32 = v54.origin.x;
      v33 = v54.origin.y;
      v34 = v54.size.width;
      v35 = v54.size.height;
      if (CGRectIsNull(v54))
      {
        LODWORD(v36) = 0;
        v37 = 2147483646;
        v38 = 0x7FFFFFFF;
      }
      else
      {
        v55.origin.x = v32;
        v55.origin.y = v33;
        v55.size.width = v34;
        v55.size.height = v35;
        if (CGRectIsInfinite(v55))
        {
          LODWORD(v36) = -1;
          v37 = 0x80000000;
          v38 = -2147483647;
        }
        else
        {
          v56.origin.x = v32;
          v56.origin.y = v33;
          v56.size.width = v34;
          v56.size.height = v35;
          v57 = CGRectInset(v56, 0.000001, 0.000001);
          v58 = CGRectIntegral(v57);
          v38 = (int)v58.origin.x;
          v36 = (unint64_t)v58.size.height;
          v37 = (int)v58.origin.y - 1;
        }
      }
      v40[0] = -v38;
      v40[1] = (int)v36 + v37;
      v41 = xmmword_1924976B0;
      v42 = vdupq_n_s64(1uLL);
      objc_msgSend(v20, "setClipRect:", v40);
      objc_msgSend(v20, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v18, objc_msgSend(v8, "metalTexture"), objc_msgSend(a5, "metalTexture"));

    }
  }
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (int)outputFormat
{
  return 0;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 1;
}

@end
