@implementation CIConvolutionProcessor

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
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  float v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  void *v65;
  void *v66;
  unint64_t v67;
  int v68;
  int v69;
  void *v70;
  void *v71;
  unint64_t height;
  int y;
  int x;
  unint64_t v75;
  int v76;
  int v77;
  double v78;
  unint64_t v80;
  int v81;
  int v82;
  _BYTE v83[12];
  float v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;

  v88 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("w"));
  v10 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("h"));
  v11 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("bias"));
  v12 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("weights"));
  v13 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v14 = objc_msgSend(v9, "intValue");
  v15 = objc_msgSend(v10, "intValue");
  if (v12)
  {
    MEMORY[0x1E0C80A78]();
    v17 = &v83[-v16];
    convert_weights((const double *)objc_msgSend(v12, "_values"), (float *)&v83[-v16], v14, v15);
    if (CI_FLIP_IMAGE_PROCESSOR() && v15 >= 2)
    {
      v18 = 0;
      v19 = 0;
      v20 = v14 * (v15 - 1);
      do
      {
        v21 = v18;
        v22 = v20;
        v23 = v14;
        if (v14)
        {
          do
          {
            v24 = *(_DWORD *)&v17[4 * v21];
            *(_DWORD *)&v17[4 * v21] = *(_DWORD *)&v17[4 * v22];
            *(_DWORD *)&v17[4 * v22++] = v24;
            ++v21;
            --v23;
          }
          while (v23);
        }
        ++v19;
        v20 -= v14;
        v18 += v14;
      }
      while (v19 != v15 >> 1);
    }
    v25 = (void *)objc_msgSend(a5, "metalCommandBuffer");
    v26 = objc_msgSend(v13, "metalTexture");
    v27 = objc_msgSend(a5, "metalTexture");
    objc_msgSend(v13, "region");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(a5, "region");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      v45 = v44;
    }
    else
    {
      v45 = 0.0;
    }
    v84 = v45;
    if (v25)
    {
      v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E28]), "initWithDevice:kernelWidth:kernelHeight:weights:", objc_msgSend(v25, "device"), v14, v15, v17);
      if (v70)
      {
        v71 = v70;
        objc_msgSend(v70, "setOptions:", 2);
        v90.origin.x = v29;
        v90.origin.y = v31;
        v90.size.width = v33;
        v90.size.height = v35;
        if (CGRectIsNull(v90))
        {
          LODWORD(height) = 0;
          y = 0x7FFFFFFF;
          x = 0x7FFFFFFF;
        }
        else
        {
          v91.origin.x = v29;
          v91.origin.y = v31;
          v91.size.width = v33;
          v91.size.height = v35;
          if (CGRectIsInfinite(v91))
          {
            y = -2147483647;
            LODWORD(height) = -1;
            x = -2147483647;
          }
          else
          {
            v93.origin.x = v29;
            v93.origin.y = v31;
            v93.size.width = v33;
            v93.size.height = v35;
            v94 = CGRectInset(v93, 0.000001, 0.000001);
            v95 = CGRectIntegral(v94);
            x = (int)v95.origin.x;
            y = (int)v95.origin.y;
            height = (unint64_t)v95.size.height;
          }
        }
        v96.origin.x = v37;
        v96.origin.y = v39;
        v96.size.width = v41;
        v96.size.height = v43;
        if (CGRectIsNull(v96))
        {
          LODWORD(v75) = 0;
          v76 = 0x7FFFFFFF;
          v77 = 0x7FFFFFFF;
        }
        else
        {
          v97.origin.x = v37;
          v97.origin.y = v39;
          v97.size.width = v41;
          v97.size.height = v43;
          if (CGRectIsInfinite(v97))
          {
            v76 = -2147483647;
            LODWORD(v75) = -1;
            v77 = -2147483647;
          }
          else
          {
            v98.origin.x = v37;
            v98.origin.y = v39;
            v98.size.width = v41;
            v98.size.height = v43;
            v99 = CGRectInset(v98, 0.000001, 0.000001);
            v100 = CGRectIntegral(v99);
            v77 = (int)v100.origin.x;
            v76 = (int)v100.origin.y;
            v75 = (unint64_t)v100.size.height;
          }
        }
        v85 = v77 - x;
        v86 = y + (int)height - ((int)v75 + v76);
        v87 = 0;
        objc_msgSend(v71, "setOffset:", &v85);
        *(float *)&v78 = v84;
        objc_msgSend(v71, "setBias:", v78);
        objc_msgSend(v71, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v25, v26, v27);

      }
    }
  }
  else
  {
    v46 = (void *)objc_msgSend(a5, "metalCommandBuffer");
    v47 = objc_msgSend(v13, "metalTexture");
    v48 = objc_msgSend(a5, "metalTexture");
    objc_msgSend(v13, "region");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    objc_msgSend(a5, "region");
    if (v46)
    {
      v61 = v57;
      v62 = v58;
      v63 = v59;
      v64 = v60;
      v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E10]), "initWithDevice:kernelWidth:kernelHeight:", objc_msgSend(v46, "device"), v14, v15);
      if (v65)
      {
        v66 = v65;
        objc_msgSend(v65, "setOptions:", 2);
        v89.origin.x = v50;
        v89.origin.y = v52;
        v89.size.width = v54;
        v89.size.height = v56;
        if (CGRectIsNull(v89))
        {
          LODWORD(v67) = 0;
          v68 = 0x7FFFFFFF;
          v69 = 0x7FFFFFFF;
        }
        else
        {
          v92.origin.x = v50;
          v92.origin.y = v52;
          v92.size.width = v54;
          v92.size.height = v56;
          if (CGRectIsInfinite(v92))
          {
            v68 = -2147483647;
            LODWORD(v67) = -1;
            v69 = -2147483647;
          }
          else
          {
            v101.origin.x = v50;
            v101.origin.y = v52;
            v101.size.width = v54;
            v101.size.height = v56;
            v102 = CGRectInset(v101, 0.000001, 0.000001);
            v103 = CGRectIntegral(v102);
            v69 = (int)v103.origin.x;
            v68 = (int)v103.origin.y;
            v67 = (unint64_t)v103.size.height;
          }
        }
        v104.origin.x = v61;
        v104.origin.y = v62;
        v104.size.width = v63;
        v104.size.height = v64;
        if (CGRectIsNull(v104))
        {
          LODWORD(v80) = 0;
          v81 = 0x7FFFFFFF;
          v82 = 0x7FFFFFFF;
        }
        else
        {
          v105.origin.x = v61;
          v105.origin.y = v62;
          v105.size.width = v63;
          v105.size.height = v64;
          if (CGRectIsInfinite(v105))
          {
            v81 = -2147483647;
            LODWORD(v80) = -1;
            v82 = -2147483647;
          }
          else
          {
            v106.origin.x = v61;
            v106.origin.y = v62;
            v106.size.width = v63;
            v106.size.height = v64;
            v107 = CGRectInset(v106, 0.000001, 0.000001);
            v108 = CGRectIntegral(v107);
            v82 = (int)v108.origin.x;
            v81 = (int)v108.origin.y;
            v80 = (unint64_t)v108.size.height;
          }
        }
        v85 = v82 - v69;
        v86 = v68 + (int)v67 - ((int)v80 + v81);
        v87 = 0;
        objc_msgSend(v66, "setOffset:", &v85);
        objc_msgSend(v66, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v46, v47, v48);

      }
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

+ (id)applyConToImage:(id)a3 width:(int)a4 height:(int)a5 bias:(double)a6 weights:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  int v17;
  double v18;
  int v19;
  double x;
  double y;
  double width;
  double height;
  uint64_t v24;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  CGRect v29;

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v28[1] = *MEMORY[0x1E0C80C00];
  if (fabs(a6) >= 1.0e-10)
  {
    x = *MEMORY[0x1E0C9D5E0];
    y = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    width = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    height = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  else
  {
    objc_msgSend(a3, "extent");
    if ((int)v10 >= 0)
      v17 = v10;
    else
      v17 = v10 + 1;
    v18 = (double)-(v17 >> 1);
    if ((int)v9 >= 0)
      v19 = v9;
    else
      v19 = v9 + 1;
    v29 = CGRectInset(*(CGRect *)&v13, v18, (double)-(v19 >> 1));
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
  }
  v28[0] = a3;
  v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v27[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10, CFSTR("w"));
  v26[1] = CFSTR("h");
  v27[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v26[2] = CFSTR("bias");
  v26[3] = CFSTR("weights");
  v27[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v27[3] = a7;
  return (id)objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v24, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4), 0, x, y, width, height);
}

+ (id)applyBoxToImage:(id)a3 width:(int)a4 height:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  int v13;
  double v14;
  int v15;
  double x;
  double y;
  double width;
  double height;
  uint64_t v20;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  CGRect v25;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "extent");
  if ((int)v6 >= 0)
    v13 = v6;
  else
    v13 = v6 + 1;
  v14 = (double)-(v13 >> 1);
  if ((int)v5 >= 0)
    v15 = v5;
  else
    v15 = v5 + 1;
  v25 = CGRectInset(*(CGRect *)&v9, v14, (double)-(v15 >> 1));
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v24[0] = a3;
  v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v22[1] = CFSTR("h");
  v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6, CFSTR("w"));
  v23[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  return (id)objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v20, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2), 0, x, y, width, height);
}

@end
