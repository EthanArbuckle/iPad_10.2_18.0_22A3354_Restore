@implementation CIMorphologyProcessor

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  CGRect v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("w"));
  v11 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("h"));
  v12 = objc_msgSend(v10, "intValue");
  v13 = v12 - 1;
  if (v12 < 1)
    v13 = v12;
  v14 = -(v13 >> 1);
  v15 = objc_msgSend(v11, "intValue");
  v16 = v15 - 1;
  if (v15 < 1)
    v16 = v15;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  return CGRectInset(v17, (double)v14, (double)-(v16 >> 1));
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v23;
  int v24;
  int v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  int v30;
  unint64_t v31;
  int v32;
  int v33;
  Class *v34;
  void *v35;
  int v37;
  int v38;
  _QWORD v39[3];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v9 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("w"));
  v10 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("h"));
  v11 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("doMin"));
  v12 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (v12)
  {
    v13 = v12;
    v14 = objc_msgSend(v12, "format");
    if (v14 == objc_msgSend(a5, "format"))
    {
      v15 = objc_msgSend(v9, "intValue");
      v16 = objc_msgSend(v10, "intValue");
      v17 = objc_msgSend(v11, "BOOLValue");
      v12 = (void *)objc_msgSend(a5, "metalCommandBuffer");
      if (v12)
      {
        v18 = v12;
        objc_msgSend(v13, "region");
        x = v40.origin.x;
        y = v40.origin.y;
        width = v40.size.width;
        height = v40.size.height;
        if (CGRectIsNull(v40))
        {
          LODWORD(v23) = 0;
          v24 = 0x7FFFFFFF;
          v25 = 0x7FFFFFFF;
        }
        else
        {
          v41.origin.x = x;
          v41.origin.y = y;
          v41.size.width = width;
          v41.size.height = height;
          if (CGRectIsInfinite(v41))
          {
            v24 = -2147483647;
            LODWORD(v23) = -1;
            v25 = -2147483647;
          }
          else
          {
            v42.origin.x = x;
            v42.origin.y = y;
            v42.size.width = width;
            v42.size.height = height;
            v43 = CGRectInset(v42, 0.000001, 0.000001);
            v44 = CGRectIntegral(v43);
            v25 = (int)v44.origin.x;
            v24 = (int)v44.origin.y;
            v23 = (unint64_t)v44.size.height;
          }
        }
        objc_msgSend(a5, "region");
        v26 = v45.origin.x;
        v27 = v45.origin.y;
        v28 = v45.size.width;
        v29 = v45.size.height;
        v38 = v16;
        v37 = v25;
        v30 = v15;
        if (CGRectIsNull(v45))
        {
          LODWORD(v31) = 0;
          v32 = 0x7FFFFFFF;
          v33 = 0x7FFFFFFF;
        }
        else
        {
          v46.origin.x = v26;
          v46.origin.y = v27;
          v46.size.width = v28;
          v46.size.height = v29;
          if (CGRectIsInfinite(v46))
          {
            v32 = -2147483647;
            LODWORD(v31) = -1;
            v33 = -2147483647;
          }
          else
          {
            v47.origin.x = v26;
            v47.origin.y = v27;
            v47.size.width = v28;
            v47.size.height = v29;
            v48 = CGRectInset(v47, 0.000001, 0.000001);
            v49 = CGRectIntegral(v48);
            v33 = (int)v49.origin.x;
            v32 = (int)v49.origin.y;
            v31 = (unint64_t)v49.size.height;
          }
        }
        v34 = (Class *)0x1E0CC6E00;
        if (!v17)
          v34 = (Class *)0x1E0CC6DF8;
        v12 = (void *)objc_msgSend(objc_alloc(*v34), "initWithDevice:kernelWidth:kernelHeight:", objc_msgSend(v18, "device"), v30, v38);
        if (v12)
        {
          v35 = v12;
          v39[0] = v33 - v37;
          v39[1] = v24 + (int)v23 - ((int)v31 + v32);
          v39[2] = 0;
          objc_msgSend(v12, "setOffset:", v39);
          objc_msgSend(v35, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v18, objc_msgSend(v13, "metalTexture"), objc_msgSend(a5, "metalTexture"));

          LOBYTE(v12) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return (char)v12;
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

+ (BOOL)allowCompressedInputsAndOutputs
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

+ (id)applyBoxToImage:(id)a3 width:(int)a4 height:(int)a5 doMin:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int v11;
  double x;
  double y;
  double width;
  double height;
  uint64_t v16;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[2];
  CGRect v21;
  CGRect v22;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  if (a4 != 1 || a5 != 1)
  {
    if (a6)
      v11 = 1;
    else
      v11 = -1;
    objc_msgSend(a3, "extent");
    v22 = CGRectInset(v21, (double)(v11 * (int)v8 / 2), (double)(v11 * (int)v7 / 2));
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
    v20[0] = v9;
    v16 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8, CFSTR("w"));
    v18[1] = CFSTR("h");
    v19[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v18[2] = CFSTR("doMin");
    v19[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    return (id)objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v16, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3), 0, x, y, width, height);
  }
  return v9;
}

@end
