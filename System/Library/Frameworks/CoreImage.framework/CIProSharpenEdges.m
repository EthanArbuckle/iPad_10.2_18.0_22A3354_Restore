@implementation CIProSharpenEdges

- (id)_CIConvertRGBtoY
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_convertRGBtoY);
}

- (id)_CIBlur1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_blur1);
}

- (id)_CIBlur2
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_blur2);
}

- (id)_CIBlur4
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_blur4);
}

- (id)_CIEdgesPrep
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_edgesPrep);
}

- (id)_CIFindEdges
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_findEdges);
}

- (id)_CISharpenCombineEdges
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_sharpenCombineEdges);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v10;
  float v11;
  float v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _QWORD v48[4];
  void *v49;
  void *v50;
  void *v51;
  CIImage *inputImage;
  _QWORD v53[2];
  _QWORD v54[2];
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v54[1] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputFalloff, "floatValue");
  v4 = fminf(fmaxf(v3, 0.0), 1.0);
  -[NSNumber floatValue](self->inputSharpness, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputEdgeScale, "floatValue");
  v8 = v6 / (float)((float)(v4 + 1.0) + (float)(v4 * v4));
  if (v8 < 0.1)
    return self->inputImage;
  v10 = fminf(fmaxf(v7, 0.0), 5.5);
  if ((float)(v4 * v8) >= 0.1)
    v11 = v4 * v8;
  else
    v11 = 0.0;
  if ((float)((float)(v4 * v4) * v8) >= 0.1)
    v12 = (float)(v4 * v4) * v8;
  else
    v12 = 0.0;
  v13 = -[CIProSharpenEdges _CIEdgesPrep](self, "_CIEdgesPrep");
  -[CIImage extent](self->inputImage, "extent");
  v54[0] = self->inputImage;
  v18 = (void *)objc_msgSend(v13, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1), v14, v15, v16, v17);
  v19 = -[CIProSharpenEdges _CIFindEdges](self, "_CIFindEdges");
  objc_msgSend(v18, "extent");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v53[0] = v18;
  v53[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", __exp10(v10));
  v28 = objc_msgSend(v19, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_41, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2), v21, v23, v25, v27);
  v29 = -[CIProSharpenEdges _CIConvertRGBtoY](self, "_CIConvertRGBtoY");
  -[CIImage extent](self->inputImage, "extent");
  inputImage = self->inputImage;
  v34 = (void *)objc_msgSend(v29, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &inputImage, 1), v30, v31, v32, v33);
  v35 = -[CIProSharpenEdges _CIBlur1](self, "_CIBlur1");
  objc_msgSend(v34, "extent");
  v56 = CGRectInset(v55, -1.0, -1.0);
  v51 = v34;
  v36 = (void *)objc_msgSend(v35, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_43, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1), v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
  if (v11 > 0.0)
  {
    v37 = -[CIProSharpenEdges _CIBlur2](self, "_CIBlur2");
    objc_msgSend(v36, "extent");
    v58 = CGRectInset(v57, -2.0, -2.0);
    v50 = v36;
    v36 = (void *)objc_msgSend(v37, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_44, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1), v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
  }
  if (v12 > 0.0)
  {
    v38 = -[CIProSharpenEdges _CIBlur4](self, "_CIBlur4");
    objc_msgSend(v36, "extent");
    v60 = CGRectInset(v59, -4.0, -4.0);
    v49 = v36;
    v36 = (void *)objc_msgSend(v38, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_45, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1), v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
  }
  v39 = -[CIProSharpenEdges _CISharpenCombineEdges](self, "_CISharpenCombineEdges");
  objc_msgSend(v36, "extent");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v8, v11, v12, self->inputImage, v36);
  v48[3] = v28;
  return (id)objc_msgSend(v39, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4), v41, v43, v45, v47);
}

double __32__CIProSharpenEdges_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __32__CIProSharpenEdges_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __32__CIProSharpenEdges_outputImage__block_invoke_3(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

double __32__CIProSharpenEdges_outputImage__block_invoke_4(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -4.0, -4.0);
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[5];
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategorySharpen");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v9[4] = CFSTR("CICategoryApplePrivate");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v10[1] = CFSTR("inputFalloff");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeMin");
  v8[0] = CFSTR("CIAttributeTypeScalar");
  v8[1] = &unk_1E2F1AA80;
  v7[2] = CFSTR("CIAttributeMax");
  v7[3] = CFSTR("CIAttributeSliderMin");
  v8[2] = &unk_1E2F1AAD0;
  v8[3] = &unk_1E2F1AA80;
  v7[4] = CFSTR("CIAttributeSliderMax");
  v7[5] = CFSTR("CIAttributeDefault");
  v8[4] = &unk_1E2F1AAD0;
  v8[5] = &unk_1E2F1AAE0;
  v11[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v10[2] = CFSTR("inputSharpness");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = CFSTR("CIAttributeTypeScalar");
  v6[1] = &unk_1E2F1AA80;
  v5[2] = CFSTR("CIAttributeMax");
  v5[3] = CFSTR("CIAttributeSliderMin");
  v6[2] = &unk_1E2F1AA90;
  v6[3] = &unk_1E2F1AA80;
  v5[4] = CFSTR("CIAttributeSliderMax");
  v5[5] = CFSTR("CIAttributeDefault");
  v6[4] = &unk_1E2F1AA90;
  v6[5] = &unk_1E2F1AAF0;
  v5[6] = CFSTR("CIAttributeIdentity");
  v6[6] = &unk_1E2F1AA80;
  v11[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v10[3] = CFSTR("inputEdgeScale");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeScalar");
  v4[1] = &unk_1E2F1AA80;
  v3[2] = CFSTR("CIAttributeMax");
  v3[3] = CFSTR("CIAttributeSliderMin");
  v4[2] = &unk_1E2F1AB00;
  v4[3] = &unk_1E2F1AA80;
  v3[4] = CFSTR("CIAttributeSliderMax");
  v3[5] = CFSTR("CIAttributeDefault");
  v4[4] = &unk_1E2F1AB00;
  v4[5] = &unk_1E2F1AB10;
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
}

@end
