@implementation CIAreaRedRadialCentroid

+ (id)customAttributes
{
  uint64_t v2;
  id v3;
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[4];
  _QWORD v10[4];
  const __CFString *v11;
  const __CFString *v12;
  _QWORD v13[4];
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryReduction");
  v13[1] = CFSTR("CICategoryBuiltIn");
  v13[2] = CFSTR("CICategoryHighDynamicRange");
  v13[3] = CFSTR("CICategoryApplePrivate");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v14[1] = CFSTR("inputCenter");
  v11 = CFSTR("CIAttributeType");
  v12 = CFSTR("CIAttributeTypeImage");
  v15[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v14[2] = CFSTR("inputRadius");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeMax");
  v10[0] = &unk_1E2F1BE30;
  v10[1] = &unk_1E2F1DAF8;
  v9[2] = CFSTR("CIAttributeDefault");
  v9[3] = CFSTR("CIAttributeType");
  v10[2] = &unk_1E2F1BEA8;
  v10[3] = CFSTR("CIAttributeTypeScalar");
  v15[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v14[3] = CFSTR("inputRadialMode");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = &unk_1E2F1BE30;
  v8[1] = &unk_1E2F1BEC0;
  v7[2] = CFSTR("CIAttributeDefault");
  v7[3] = CFSTR("CIAttributeType");
  v8[2] = &unk_1E2F1BE30;
  v8[3] = CFSTR("CIAttributeTypeInteger");
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v14[4] = CFSTR("inputMinWeight");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = &unk_1E2F1BE30;
  v6[1] = &unk_1E2F1DAF8;
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeType");
  v6[2] = &unk_1E2F1BE30;
  v6[3] = CFSTR("CIAttributeTypeScalar");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v3 = (id)objc_msgSend(+[CIAreaCentroid customAttributes](CIAreaCentroid, "customAttributes"), "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", v2);
  return v3;
}

- (id)_kernelGaussian
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_RCFalloffGaussian);
}

- (id)_kernelDisk
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_RCFalloffDisk);
}

- (id)_kernelCenter
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_RCCenter);
}

- (id)outputImage
{
  uint64_t v3;
  CIImage *inputCenter;
  BOOL v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CIImage *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CIImage **p_inputImage;
  double v27;
  double v28;
  double v29;
  void *v30;
  CIVector *inputExtent;
  NSNumber *inputMinWeight;
  float v33;
  uint64_t v34;
  CIColorKernel *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double x;
  double y;
  double width;
  double height;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  float v61;
  const __CFString *v62;
  CIVector *v63;
  CIImage *inputImage;
  CIImage *v65;
  CIImage *v66;
  _QWORD v67[4];
  const __CFString *v68;
  _QWORD v69[2];
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v69[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSNumber integerValue](self->inputRadialMode, "integerValue");
  inputCenter = self->inputCenter;
  if (self->super.super.super.inputExtent)
    v5 = inputCenter == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = v3;
    if ((v3 & 0x8000000000000000) == 0 && v3 <= 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[CIAreaRedRadialCentroid _kernelCenter](self, "_kernelCenter");
        -[CIImage extent](self->super.super.super.inputImage, "extent");
        v66 = self->inputCenter;
        inputCenter = (CIImage *)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1), v8, v9, v10, v11);
      }
      v12 = -[CIImage imageByClampingToExtent](inputCenter, "imageByClampingToExtent");
      -[NSNumber floatValue](self->inputRadius, "floatValue");
      v14 = v13;
      -[NSNumber floatValue](self->inputRadius, "floatValue");
      v16 = v14 * v15;
      if (v6)
      {
        v16 = 1.0 / (v16 / 9.0);
        v17 = -[CIAreaRedRadialCentroid _kernelGaussian](self, "_kernelGaussian");
        -[CIImage extent](self->super.super.super.inputImage, "extent");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        inputImage = self->super.super.super.inputImage;
        p_inputImage = &inputImage;
      }
      else
      {
        v17 = -[CIAreaRedRadialCentroid _kernelDisk](self, "_kernelDisk");
        -[CIImage extent](self->super.super.super.inputImage, "extent");
        v19 = v18;
        v21 = v27;
        v23 = v28;
        v25 = v29;
        v65 = self->super.super.super.inputImage;
        p_inputImage = &v65;
      }
      p_inputImage[1] = v12;
      *(float *)&v18 = v16;
      p_inputImage[2] = (CIImage *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
      v30 = (void *)objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", p_inputImage, 3), v19, v21, v23, v25);
      inputExtent = self->super.super.super.inputExtent;
      v62 = CFSTR("inputExtent");
      v63 = inputExtent;
      inputCenter = (CIImage *)objc_msgSend(v30, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaRedCentroid"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
      inputMinWeight = self->inputMinWeight;
      if (inputMinWeight)
      {
        -[NSNumber floatValue](inputMinWeight, "floatValue");
        if (v33 > 0.0)
        {
          v68 = CFSTR("inputExtent");
          v61 = v33;
          -[CIImage extent](inputCenter, "extent");
          v69[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
          v34 = objc_msgSend((id)objc_msgSend(v30, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMinMaxRed"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1)), "imageByClampingToExtent");
          v35 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_RCSelectGreaterThan);
          -[CIImage extent](inputCenter, "extent");
          v37 = v36;
          v39 = v38;
          v41 = v40;
          v43 = v42;
          -[CIImage extent](v12, "extent");
          v74.origin.x = v44;
          v74.origin.y = v45;
          v74.size.width = v46;
          v74.size.height = v47;
          v70.origin.x = v37;
          v70.origin.y = v39;
          v70.size.width = v41;
          v70.size.height = v43;
          v71 = CGRectUnion(v70, v74);
          x = v71.origin.x;
          y = v71.origin.y;
          width = v71.size.width;
          height = v71.size.height;
          objc_msgSend(v30, "extent");
          v75.origin.x = v52;
          v75.origin.y = v53;
          v75.size.width = v54;
          v75.size.height = v55;
          v72.origin.x = x;
          v72.origin.y = y;
          v72.size.width = width;
          v72.size.height = height;
          v73 = CGRectUnion(v72, v75);
          v56 = v73.origin.x;
          v57 = v73.origin.y;
          v58 = v73.size.width;
          v59 = v73.size.height;
          v67[0] = inputCenter;
          v67[1] = v12;
          v67[2] = v34;
          *(float *)&v73.origin.x = v61;
          v67[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v73.origin.x);
          return -[CIImage imageByCroppingToRect:](-[CIColorKernel applyWithExtent:arguments:](v35, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4), v56, v57, v58, v59), "imageByCroppingToRect:", x, y, width, height);
        }
      }
    }
  }
  return inputCenter;
}

- (CIImage)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputRadialMode
{
  return self->inputRadialMode;
}

- (void)setInputRadialMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputMinWeight
{
  return self->inputMinWeight;
}

- (void)setInputMinWeight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
