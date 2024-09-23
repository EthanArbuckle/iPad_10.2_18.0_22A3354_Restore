@implementation CIAreaAverage

- (id)outputImageNonMPS:(id)a3
{
  CIImage *v3;
  double v5;
  double v6;
  double v7;
  CIKernel *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CIKernel *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CIKernel *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CIKernel *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CIKernel *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CIKernel *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CIKernel *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CIKernel *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CIKernel *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CIKernel *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CIKernel *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CIImage *v67;
  CIImage *v68;
  CIImage *v69;
  CIImage *v70;
  CIImage *v71;
  CIImage *v72;
  CIImage *v73;
  CIImage *v74;
  CIImage *v75;
  CIImage *v76;
  _QWORD v77[2];
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
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

  v77[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v3 = (CIImage *)a3;
  objc_msgSend(a3, "extent");
  if (CGRectIsEmpty(v78))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](v3, "extent");
  v65 = v5;
  -[CIImage extent](v3, "extent");
  v66 = v6;
  -[CIImage extent](v3, "extent");
  v7 = 1.0;
  if (CGRectGetMaxX(v79) > 4.0)
  {
    do
    {
      -[CIImage extent](v3, "extent");
      if (CGRectGetMaxY(v80) <= 4.0)
        break;
      v7 = v7 * 64.0;
      v8 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_areaAvg8);
      -[CIImage extent](v3, "extent");
      v77[0] = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v8, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_70_0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1), v11, v12, ceil(v9 * 0.125), ceil(v10 * 0.125));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxX(v81) > 4.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxX(v82) > 2.0)
  {
    do
    {
      -[CIImage extent](v3, "extent");
      if (CGRectGetMaxY(v83) <= 2.0)
        break;
      v7 = v7 * 16.0;
      v13 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_areaAvg4);
      -[CIImage extent](v3, "extent");
      v76 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v13, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_71, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1), v16, v17, ceil(v14 * 0.25), ceil(v15 * 0.25));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxX(v84) > 2.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxX(v85) > 1.0)
  {
    do
    {
      -[CIImage extent](v3, "extent");
      if (CGRectGetMaxY(v86) <= 1.0)
        break;
      v7 = v7 * 4.0;
      v18 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_areaAvg2);
      -[CIImage extent](v3, "extent");
      v75 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v18, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_72, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1), v21, v22, ceil(v19 * 0.5), ceil(v20 * 0.5));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxX(v87) > 1.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxY(v88) >= 16.0)
  {
    v23 = v65;
    do
    {
      v7 = v7 * 16.0;
      v24 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_vertAvg16);
      -[CIImage extent](v3, "extent");
      v74 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v24, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_73, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1), v26, v27, v28, ceil(v25 * 0.0625));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxY(v89) >= 16.0);
  }
  else
  {
    v23 = v65;
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxY(v90) >= 8.0)
  {
    do
    {
      v7 = v7 * 8.0;
      v29 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_vertAvg8);
      -[CIImage extent](v3, "extent");
      v73 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v29, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_74, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1), v31, v32, v33, ceil(v30 * 0.125));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxY(v91) >= 8.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxY(v92) >= 4.0)
  {
    do
    {
      v7 = v7 * 4.0;
      v34 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_vertAvg4);
      -[CIImage extent](v3, "extent");
      v72 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v34, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_75_1, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1), v36, v37, v38, ceil(v35 * 0.25));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxY(v93) >= 4.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxY(v94) > 1.0)
  {
    do
    {
      v7 = v7 + v7;
      v39 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_vertAvg2);
      -[CIImage extent](v3, "extent");
      v71 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v39, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_76, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1), v41, v42, v43, ceil(v40 * 0.5));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxY(v95) > 1.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxX(v96) >= 16.0)
  {
    do
    {
      v7 = v7 * 16.0;
      v44 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_horizAvg16);
      -[CIImage extent](v3, "extent");
      v70 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v44, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_77, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1), v46, v47, ceil(v45 * 0.0625), v48);
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxX(v97) >= 16.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxX(v98) >= 8.0)
  {
    do
    {
      v7 = v7 * 8.0;
      v49 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_horizAvg8);
      -[CIImage extent](v3, "extent");
      v69 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v49, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_78, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1), v51, v52, ceil(v50 * 0.125), v53);
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxX(v99) >= 8.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxX(v100) >= 4.0)
  {
    do
    {
      v7 = v7 * 4.0;
      v54 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_horizAvg4);
      -[CIImage extent](v3, "extent");
      v68 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v54, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_79, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1), v56, v57, ceil(v55 * 0.25), v58);
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxX(v101) >= 4.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxX(v102) > 1.0)
  {
    do
    {
      v7 = v7 + v7;
      v59 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_horizAvg2);
      -[CIImage extent](v3, "extent");
      v67 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v59, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_80_1, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1), v61, v62, ceil(v60 * 0.5), v63);
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxX(v103) > 1.0);
  }
  v64 = v7 / (v23 * v66);
  if (v64 != 1.0)
    return -[CIImage filteredImage:keysAndValues:](v3, "filteredImage:keysAndValues:", CFSTR("CIColorMatrix"), CFSTR("inputRVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0), CFSTR("inputGVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0), CFSTR("inputBVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0), CFSTR("inputAVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, v64), CFSTR("inputBiasVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0), 0);
  return v3;
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 8.0, 8.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_2(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 4.0, 4.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_3(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 2.0, 2.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_4(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 1.0, 16.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_5(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 1.0, 8.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_6(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 1.0, 4.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_7(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 1.0, 2.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_8(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 16.0, 1.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_9(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 8.0, 1.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_10(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 4.0, 1.0);
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_11(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 2.0, 1.0);
}

- (id)outputImage
{
  id v3;
  void *v4;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  CIImage *v18;
  uint64_t v19;
  CIVector *v20;
  _QWORD v21[2];
  CGRect v22;

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = -[CIReductionFilter offsetAndCrop](self, "offsetAndCrop");
  if (!v3)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = v3;
  objc_msgSend(v3, "extent");
  if (CGRectIsEmpty(v22))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  objc_msgSend(v4, "extent");
  if (v6 != 1.0 || (objc_msgSend(v4, "extent"), v7 != 1.0))
  {
    v8 = -[CIAreaAverage outputImageNonMPS:](self, "outputImageNonMPS:", v4);
    if (!CI_ENABLE_MPS())
      return v8;
    objc_msgSend(v4, "extent");
    v12 = v11;
    v14 = v13;
    *(float *)&v11 = v9;
    *(float *)&v13 = v10;
    if (fmaxf(*(float *)&v11, *(float *)&v13) > 4096.0)
      return v8;
    v15 = v9;
    v16 = v10;
    v21[0] = v4;
    v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v20 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v12, v14, v15, v16, CFSTR("region"));
    v18 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIAreaAverageProcessor, "applyWithExtent:inputs:arguments:error:", v17, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1), 0, 0.0, 0.0, 1.0, 1.0);
    if (v18)
      return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", v18, v8);
    else
      return v8;
  }
  return v4;
}

@end
