@implementation CIAreaRedCentroid

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryReduction");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryBuiltIn");
  v3[4] = CFSTR("CICategoryHighDynamicRange");
  v3[5] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v5[1] = CFSTR("12");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.14");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIImage *inputImage;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CIVector *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _QWORD v42[2];
  const __CFString *v43;
  CIVector *v44;
  _QWORD v45[3];
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v45[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->super.super.inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](inputImage, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CIVector CGRectValue](self->super.super.inputExtent, "CGRectValue");
  v48.origin.x = v12;
  v48.origin.y = v13;
  v48.size.width = v14;
  v48.size.height = v15;
  v46.origin.x = v5;
  v46.origin.y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  v47 = CGRectIntersection(v46, v48);
  if (CGRectIsEmpty(v47))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIVector CGRectValue](self->super.super.inputExtent, "CGRectValue");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v17);
  v26 = -[CIAreaCentroid _kernelWeightedCoordinate](self, "_kernelWeightedCoordinate");
  -[CIImage extent](self->super.super.inputImage, "extent");
  v45[0] = self->super.super.inputImage;
  v45[1] = v25;
  v31 = (void *)objc_msgSend(v26, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2), v27, v28, v29, v30);
  v43 = CFSTR("inputExtent");
  v44 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v18, v20, v22, v24);
  v32 = (void *)objc_msgSend((id)objc_msgSend(v31, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1)), "imageByUnpremultiplyingAlpha");
  v33 = -[CIAreaCentroid _kernelCentroid](self, "_kernelCentroid");
  objc_msgSend(v32, "extent");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42[0] = v32;
  v42[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v18, v20, v22, v24);
  return (id)objc_msgSend((id)objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2), v35, v37, v39, v41), "imageByCroppingToRect:", 0.0, 0.0, 1.0, 1.0);
}

@end
