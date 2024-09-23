@implementation CIColumnAverage

- (id)outputImage
{
  CIImage *v2;
  CIImage *v3;
  double v5;
  float v6;
  CIKernel *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CIKernel *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CIKernel *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  CIKernel *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CIImage *v29;
  CIImage *v30;
  CIImage *v31;
  _QWORD v32[2];
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = -[CIReductionFilter offsetAndCrop](self, "offsetAndCrop");
  if (!v2)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v3 = v2;
  -[CIImage extent](v2, "extent");
  if (CGRectIsEmpty(v33))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](v3, "extent");
  v28 = v5;
  -[CIImage extent](v3, "extent");
  v6 = 1.0;
  if (CGRectGetMaxY(v34) >= 16.0)
  {
    do
    {
      v6 = v6 * 16.0;
      v7 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_vertAvg16);
      -[CIImage extent](v3, "extent");
      v32[0] = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v7, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_97, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1), v9, v10, v11, ceil(v8 * 0.0625));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxY(v35) >= 16.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxY(v36) >= 8.0)
  {
    do
    {
      v6 = v6 * 8.0;
      v12 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_vertAvg8);
      -[CIImage extent](v3, "extent");
      v31 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v12, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_98_0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1), v14, v15, v16, ceil(v13 * 0.125));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxY(v37) >= 8.0);
  }
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxY(v38) >= 4.0)
  {
    do
    {
      v6 = v6 * 4.0;
      v17 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_vertAvg4);
      -[CIImage extent](v3, "extent");
      v30 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v17, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_99, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1), v19, v20, v21, ceil(v18 * 0.25));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxY(v39) >= 4.0);
  }
  v22 = v28;
  -[CIImage extent](v3, "extent");
  if (CGRectGetMaxY(v40) > 1.0)
  {
    do
    {
      v6 = v6 + v6;
      v23 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_vertAvg2);
      -[CIImage extent](v3, "extent");
      v29 = v3;
      v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v23, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_100_0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1), v25, v26, v27, ceil(v24 * 0.5));
      -[CIImage extent](v3, "extent");
    }
    while (CGRectGetMaxY(v41) > 1.0);
  }
  if ((float)(v6 / v22) != 1.0)
    return -[CIImage filteredImage:keysAndValues:](v3, "filteredImage:keysAndValues:", CFSTR("CIColorMatrix"), CFSTR("inputRVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0), CFSTR("inputGVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0), CFSTR("inputBVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0), CFSTR("inputAVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, (float)(v6 / v22)), CFSTR("inputBiasVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0),
             0);
  return v3;
}

void __30__CIColumnAverage_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 1.0, 16.0);
}

void __30__CIColumnAverage_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 1.0, 8.0);
}

void __30__CIColumnAverage_outputImage__block_invoke_3(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 1.0, 4.0);
}

void __30__CIColumnAverage_outputImage__block_invoke_4(double a1, double a2, double a3, double a4)
{
  ReductionROI(*(CGRect *)&a1, 1.0, 2.0);
}

@end
