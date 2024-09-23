@implementation CIAccordionFoldTransition

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[9];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryTransition");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("8");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.10");
  v12[3] = CFSTR("inputBottomHeight");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeDefault");
  v10[0] = &unk_1E2F18B00;
  v10[1] = &unk_1E2F18B00;
  v9[2] = CFSTR("CIAttributeType");
  v10[2] = CFSTR("CIAttributeTypeDistance");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v12[4] = CFSTR("inputNumberOfFolds");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1B3B0;
  v8[1] = &unk_1E2F1B3B0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1B3C8;
  v8[3] = &unk_1E2F1B3E0;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1B3F8;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v12[5] = CFSTR("inputFoldShadowAmount");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18B00;
  v6[1] = &unk_1E2F18B00;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F18B10;
  v6[3] = &unk_1E2F18B10;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18B20;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v12[6] = CFSTR("inputTime");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18B00;
  v4[1] = &unk_1E2F18B00;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F18B10;
  v4[3] = &unk_1E2F18B00;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F18B00;
  v4[5] = CFSTR("CIAttributeTypeTime");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)_kernelWarpS
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_accordianWarpS);
}

- (id)_kernelWarpT
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_accordianWarpT);
}

- (id)_kernelMix
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_accordionMix);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_accordionFoldTransition);
}

- (id)outputImage
{
  id *p_inputImage;
  id result;
  id *p_inputTargetImage;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CIImage **v16;
  id *v17;
  double v18;
  id v19;
  CIImage *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  CIImage *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CIVector *v49;
  double v50;
  CIVector *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGAffineTransform v67;
  _QWORD v68[6];
  _QWORD v69[6];
  CGAffineTransform v70;
  CGAffineTransform v71;
  _QWORD v72[5];
  _QWORD v73[2];
  _QWORD v74[3];
  CGRect v75;
  CGRect v76;

  v74[2] = *MEMORY[0x1E0C80C00];
  p_inputImage = (id *)&self->inputImage;
  result = self->inputImage;
  if (!result)
    return result;
  objc_msgSend(result, "extent");
  if (CGRectIsInfinite(v75))
    return 0;
  p_inputTargetImage = (id *)&self->inputTargetImage;
  result = self->inputTargetImage;
  if (!result)
    return result;
  objc_msgSend(result, "extent");
  if (CGRectIsInfinite(v76))
    return 0;
  -[NSNumber doubleValue](self->inputNumberOfFolds, "doubleValue");
  v7 = v6;
  -[NSNumber doubleValue](self->inputTime, "doubleValue");
  v9 = fmin(fmax(v8, 0.0), 1.0);
  -[NSNumber doubleValue](self->inputFoldShadowAmount, "doubleValue");
  v11 = v10;
  -[NSNumber doubleValue](self->inputBottomHeight, "doubleValue");
  if (v9 <= 0.0)
  {
    v59 = *p_inputImage;
    return v59;
  }
  if (v9 >= 1.0)
  {
    v59 = *p_inputTargetImage;
    return v59;
  }
  v61 = fmin(fmax(round(v7), 0.0), 50.0);
  v62 = fmin(fmax(v11, 0.0), 1.0);
  v60 = fmax(v12, 0.0);
  objc_msgSend(*p_inputImage, "extent");
  v14 = v13;
  objc_msgSend(*p_inputTargetImage, "extent");
  if (v14 <= v15)
    v16 = &self->inputTargetImage;
  else
    v16 = (CIImage **)p_inputImage;
  if (v14 <= v15)
    v17 = p_inputImage;
  else
    v17 = (id *)&self->inputTargetImage;
  if (v14 <= v15)
    v18 = v9;
  else
    v18 = 1.0 - v9;
  v19 = *v17;
  v20 = *v16;
  objc_msgSend(*v17, "extent", 1.0 - v9);
  v22 = v21;
  v66 = v21;
  objc_msgSend(v19, "extent");
  v24 = v23;
  objc_msgSend(v19, "extent");
  v65 = v24 + v25 * 0.5;
  -[CIImage extent](v20, "extent");
  v27 = v26;
  v64 = v26;
  -[CIImage extent](v20, "extent");
  v29 = v28;
  -[CIImage extent](v20, "extent");
  v63 = v29 + v30 * 0.5;
  CGAffineTransformMakeTranslation(&v71, -v65, -v22);
  v31 = (void *)objc_msgSend(v19, "imageByApplyingTransform:", &v71);
  CGAffineTransformMakeTranslation(&v70, -v63, -v27);
  v32 = -[CIImage imageByApplyingTransform:](v20, "imageByApplyingTransform:", &v70);
  objc_msgSend(v31, "extent");
  v34 = v33;
  objc_msgSend(v31, "extent");
  v36 = v35;
  objc_msgSend(v31, "extent");
  v38 = v37;
  -[CIImage extent](v32, "extent");
  v40 = v39;
  -[CIImage extent](v32, "extent");
  v42 = v41;
  -[CIImage extent](v32, "extent");
  v44 = fmin(v43, v38);
  v45 = fmax(v40, v34);
  v46 = v42 - v36;
  v47 = v36 + v18 * (v42 - v36);
  v48 = (1.0 - v18) * v46;
  v49 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v60, v18 * v46, 1.0 / v18, v48);
  v50 = v48 / (v61 * (v34 + v40));
  v51 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v61 + v61, v50, v62 * (1.0 - v18));
  v52 = -[CIAccordionFoldTransition _kernelWarpS](self, "_kernelWarpS");
  v53 = MEMORY[0x1E0C809B0];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __40__CIAccordionFoldTransition_outputImage__block_invoke;
  v69[3] = &unk_1E2EC2C28;
  v69[4] = v49;
  *(double *)&v69[5] = v50;
  v74[0] = v51;
  v74[1] = v49;
  v54 = objc_msgSend(v52, "applyWithExtent:roiCallback:inputImage:arguments:", v69, v31, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2), v44, 0.0, v45, v47);
  v55 = -[CIAccordionFoldTransition _kernelWarpT](self, "_kernelWarpT");
  v68[0] = v53;
  v68[1] = 3221225472;
  v68[2] = __40__CIAccordionFoldTransition_outputImage__block_invoke_2;
  v68[3] = &unk_1E2EC2C28;
  v68[4] = v49;
  *(double *)&v68[5] = v50;
  v73[0] = v51;
  v73[1] = v49;
  v56 = objc_msgSend(v55, "applyWithExtent:roiCallback:inputImage:arguments:", v68, v32, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2), v44, 0.0, v45, v47);
  v57 = -[CIAccordionFoldTransition _kernelMix](self, "_kernelMix");
  v72[0] = v54;
  v72[1] = v56;
  v72[2] = v51;
  v72[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v72[4] = v49;
  v58 = (void *)objc_msgSend(v57, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 5), v44, 0.0, v45, v47);
  CGAffineTransformMakeTranslation(&v67, v65 + v18 * (v63 - v65), v66 + v18 * (v64 - v66));
  return (id)objc_msgSend(v58, "imageByApplyingTransform:", &v67);
}

double __40__CIAccordionFoldTransition_outputImage__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  double v4;

  v3 = *(void **)(a1 + 32);
  v4 = *(double *)(a1 + 40);
  objc_msgSend(v3, "X");
  objc_msgSend(v3, "Y");
  return a2 * (v4 + 1.0);
}

double __40__CIAccordionFoldTransition_outputImage__block_invoke_2(uint64_t a1, double a2)
{
  void *v3;
  double v4;

  v3 = *(void **)(a1 + 32);
  v4 = *(double *)(a1 + 40);
  objc_msgSend(v3, "X");
  objc_msgSend(v3, "Y");
  objc_msgSend(v3, "Z");
  objc_msgSend(v3, "W");
  objc_msgSend(v3, "Z");
  objc_msgSend(v3, "W");
  return a2 * (v4 + 1.0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputBottomHeight
{
  return self->inputBottomHeight;
}

- (void)setInputBottomHeight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputNumberOfFolds
{
  return self->inputNumberOfFolds;
}

- (void)setInputNumberOfFolds:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputFoldShadowAmount
{
  return self->inputFoldShadowAmount;
}

- (void)setInputFoldShadowAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
