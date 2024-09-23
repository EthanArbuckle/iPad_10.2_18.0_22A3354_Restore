@implementation CIAreaReductionFilter

- (id)_reduce4X4
{
  return 0;
}

- (id)_reduce2X2
{
  return 0;
}

- (id)_reduce4X1
{
  return 0;
}

- (id)_reduce1X4
{
  return 0;
}

- (id)outputImage
{
  id v3;
  void *v4;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  uint64_t v44;
  double v45;
  double v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  double v57;
  id v58;
  _QWORD v59[8];
  _QWORD v60[8];
  _QWORD v61[8];
  _QWORD v62[8];
  void *v63;
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[5];
  CGRect v68;

  v67[3] = *MEMORY[0x1E0C80C00];
  v3 = -[CIReductionFilter offsetAndCrop](self, "offsetAndCrop");
  if (!v3)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = v3;
  objc_msgSend(v3, "extent");
  if (CGRectIsEmpty(v68))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (-[CIAreaReductionFilter _reduce4X4](self, "_reduce4X4") && (objc_msgSend(v4, "extent"), v6 > 2.0))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "extent");
      if (v8 <= 2.0)
        break;
      objc_msgSend(v4, "extent");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v17 = -[CIAreaReductionFilter _reduce4X4](self, "_reduce4X4");
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __36__CIAreaReductionFilter_outputImage__block_invoke;
      v62[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      *(double *)&v62[4] = v10;
      *(double *)&v62[5] = v12;
      *(double *)&v62[6] = v14;
      *(double *)&v62[7] = v16;
      v67[0] = v4;
      v67[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v14, v16);
      v18 = (v7 + 1);
      v67[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
      v4 = (void *)objc_msgSend(v17, "applyWithExtent:roiCallback:arguments:", v62, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3), v10, v12, ceil(v14 * 0.25), ceil(v16 * 0.25));
      objc_msgSend(v4, "extent");
      v7 = v18;
      if (v19 <= 2.0)
        goto LABEL_11;
    }
    v18 = v7;
  }
  else
  {
    v18 = 0;
  }
LABEL_11:
  if (-[CIAreaReductionFilter _reduce2X2](self, "_reduce2X2"))
  {
    objc_msgSend(v4, "extent");
    if (v20 > 1.0)
    {
      while (1)
      {
        objc_msgSend(v4, "extent");
        if (v21 <= 1.0)
          break;
        objc_msgSend(v4, "extent");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v30 = -[CIAreaReductionFilter _reduce2X2](self, "_reduce2X2");
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __36__CIAreaReductionFilter_outputImage__block_invoke_2;
        v61[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        *(double *)&v61[4] = v23;
        *(double *)&v61[5] = v25;
        *(double *)&v61[6] = v27;
        *(double *)&v61[7] = v29;
        v66[0] = v4;
        v66[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v27, v29);
        v31 = (v18 + 1);
        v66[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
        v4 = (void *)objc_msgSend(v30, "applyWithExtent:roiCallback:arguments:", v61, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3), v23, v25, ceil(v27 * 0.5), ceil(v29 * 0.5));
        objc_msgSend(v4, "extent");
        v18 = v31;
        if (v32 <= 1.0)
          goto LABEL_17;
      }
    }
  }
  v31 = v18;
LABEL_17:
  objc_msgSend(v4, "extent");
  if (v33 <= 1.0)
  {
    v44 = v31;
  }
  else
  {
    v34 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v4, "extent");
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v43 = -[CIAreaReductionFilter _reduce1X4](self, "_reduce1X4");
      v60[0] = v34;
      v60[1] = 3221225472;
      v60[2] = __36__CIAreaReductionFilter_outputImage__block_invoke_3;
      v60[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      *(double *)&v60[4] = v36;
      *(double *)&v60[5] = v38;
      *(double *)&v60[6] = v40;
      *(double *)&v60[7] = v42;
      v65[0] = v4;
      v65[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
      v44 = (v31 + 1);
      v65[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
      v4 = (void *)objc_msgSend(v43, "applyWithExtent:roiCallback:arguments:", v60, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3), v36, v38, v40, ceil(v42 * 0.25));
      objc_msgSend(v4, "extent");
      v31 = v44;
    }
    while (v45 > 1.0);
  }
  objc_msgSend(v4, "extent");
  if (v46 > 1.0)
  {
    v47 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v4, "extent");
      v49 = v48;
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v56 = -[CIAreaReductionFilter _reduce4X1](self, "_reduce4X1");
      v59[0] = v47;
      v59[1] = 3221225472;
      v59[2] = __36__CIAreaReductionFilter_outputImage__block_invoke_4;
      v59[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      *(double *)&v59[4] = v49;
      *(double *)&v59[5] = v51;
      *(double *)&v59[6] = v53;
      *(double *)&v59[7] = v55;
      v64[0] = v4;
      v64[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
      v64[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
      v4 = (void *)objc_msgSend(v56, "applyWithExtent:roiCallback:arguments:", v59, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3), v49, v51, ceil(v53 * 0.25), v55);
      objc_msgSend(v4, "extent");
      v44 = (v44 + 1);
    }
    while (v57 > 1.0);
  }
  v58 = -[CIReductionFilter _reduceCrop](self, "_reduceCrop");
  v63 = v4;
  return (id)objc_msgSend(v58, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_62, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1), 0.0, 0.0, 1.0, 1.0);
}

void __36__CIAreaReductionFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5;
  float v6;

  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  ReductionROIwh(*(CGRect *)&a2, 4.0, 4.0, v5, v6);
}

float __36__CIAreaReductionFilter_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5;
  float v6;
  float result;

  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  ReductionROIwh(*(CGRect *)&a2, 2.0, 2.0, v5, v6);
  return result;
}

void __36__CIAreaReductionFilter_outputImage__block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5;

  v5 = *(double *)(a1 + 56);
  ReductionROIh(*(CGRect *)&a2, 4.0, v5);
}

void __36__CIAreaReductionFilter_outputImage__block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5;

  v5 = *(double *)(a1 + 48);
  ReductionROIw(*(CGRect *)&a2, 4.0, v5);
}

@end
