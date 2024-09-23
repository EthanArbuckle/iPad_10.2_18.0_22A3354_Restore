@implementation CIDroste

- (id)_CIDroste
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_droste);
}

- (id)outputImage
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MaxY;
  float v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  double v38;
  double v39;
  double v40;
  CIImage *inputImage;
  double v42;
  float v44;
  float v45;
  double MinY;
  double MaxX;
  double MinX;
  double v49;
  double v50;
  double v51;
  _QWORD v52[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  __n128 (*v56)(uint64_t, uint64_t);
  uint64_t (*v57)();
  const char *v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[6];

  v61[5] = *MEMORY[0x1E0C80C00];
  v53 = 0;
  v54 = &v53;
  v55 = 0x5012000000;
  v56 = __Block_byref_object_copy__4;
  v57 = __Block_byref_object_dispose__4;
  v58 = "";
  v59 = 0u;
  v60 = 0u;
  -[CIImage extent](self->inputImage, "extent");
  *(_QWORD *)&v59 = v3;
  *((_QWORD *)&v59 + 1) = v4;
  *(_QWORD *)&v60 = v5;
  *((_QWORD *)&v60 + 1) = v6;
  if (CGRectIsEmpty(*(CGRect *)(v54 + 6)) || CGRectIsInfinite(*(CGRect *)(v54 + 6)))
  {
    v7 = 0;
  }
  else
  {
    -[NSNumber doubleValue](self->inputZoom, "doubleValue");
    -[CIVector X](self->inputInsetPoint0, "X");
    v9 = v8;
    -[CIVector X](self->inputInsetPoint1, "X");
    v11 = v10;
    -[CIVector X](self->inputInsetPoint0, "X");
    v13 = v12;
    -[CIVector X](self->inputInsetPoint1, "X");
    v15 = v14;
    -[CIVector Y](self->inputInsetPoint0, "Y");
    v17 = v16;
    -[CIVector Y](self->inputInsetPoint1, "Y");
    v19 = v18;
    -[CIVector Y](self->inputInsetPoint0, "Y");
    v21 = v20;
    -[CIVector Y](self->inputInsetPoint1, "Y");
    v50 = v22;
    v49 = v21;
    MinX = CGRectGetMinX(*(CGRect *)(v54 + 6));
    v23 = v19;
    MaxX = CGRectGetMaxX(*(CGRect *)(v54 + 6));
    v24 = v17;
    MinY = CGRectGetMinY(*(CGRect *)(v54 + 6));
    MaxY = CGRectGetMaxY(*(CGRect *)(v54 + 6));
    -[NSNumber floatValue](self->inputStrands, "floatValue");
    v45 = v26;
    -[NSNumber floatValue](self->inputPeriodicity, "floatValue");
    v44 = v27;
    v28 = fmin(v9, v11);
    v29 = fmax(v13, v15);
    v30 = fmin(v24, v23);
    v31 = fmax(v49, v50);
    v32 = v29 - v28;
    v33 = v31 - v30;
    v34 = v28 + (v29 - v28) * 0.5;
    v35 = v30 + (v31 - v30) * 0.5;
    v36 = log(fmin((v35 - MinY) / (v35 - v30), fmin((v34 - MinX) / (v34 - v28), fmin((MaxY - v35) / (v31 - v35), (MaxX - v34) / (v29 - v34)))));
    v37 = -[CIDroste _CIDroste](self, "_CIDroste");
    v38 = *MEMORY[0x1E0C9D5E0];
    v51 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v40 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v39 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __23__CIDroste_outputImage__block_invoke;
    v52[3] = &unk_1E2EC3638;
    v52[4] = &v53;
    inputImage = self->inputImage;
    v61[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v34, v35);
    v61[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (double)(int)llroundf(fmaxf(v45, 1.0)), v36 * (double)(int)llroundf(v44) / 6.28318531);
    *(float *)&v42 = v36;
    v61[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
    -[NSNumber doubleValue](self->inputRotation, "doubleValue");
    v61[3] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:");
    v61[4] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v32 * 0.5, v33 * 0.5);
    v7 = (void *)objc_msgSend(v37, "applyWithExtent:roiCallback:inputImage:arguments:", v52, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5), v38, v51, v40, v39);
  }
  _Block_object_dispose(&v53, 8);
  return v7;
}

double __23__CIDroste_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[4];
  _QWORD v16[9];
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("CIAttributeFilterCategories");
  v15[0] = CFSTR("CICategoryDistortionEffect");
  v15[1] = CFSTR("CICategoryVideo");
  v15[2] = CFSTR("CICategoryStillImage");
  v15[3] = CFSTR("CICategoryBuiltIn");
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v17[1] = CFSTR("9");
  v16[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v16[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v17[2] = CFSTR("10.6");
  v16[3] = CFSTR("inputInsetPoint0");
  v13[0] = CFSTR("CIAttributeType");
  v13[1] = CFSTR("CIAttributeDefault");
  v14[0] = CFSTR("CIAttributeTypePosition");
  v14[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 200.0, 200.0);
  v17[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v16[4] = CFSTR("inputInsetPoint1");
  v11[1] = CFSTR("CIAttributeDefault");
  v12[0] = CFSTR("CIAttributeTypePosition");
  v11[0] = CFSTR("CIAttributeType");
  v12[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 400.0, 400.0);
  v17[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v16[5] = CFSTR("inputPeriodicity");
  v9[0] = CFSTR("CIAttributeType");
  v9[1] = CFSTR("CIAttributeMin");
  v10[0] = CFSTR("CIAttributeTypeScalar");
  v10[1] = &unk_1E2F19620;
  v9[2] = CFSTR("CIAttributeSliderMin");
  v9[3] = CFSTR("CIAttributeSliderMax");
  v10[2] = &unk_1E2F19620;
  v10[3] = &unk_1E2F19630;
  v9[4] = CFSTR("CIAttributeDefault");
  v10[4] = &unk_1E2F19620;
  v17[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v16[6] = CFSTR("inputStrands");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeMin");
  v8[0] = CFSTR("CIAttributeTypeScalar");
  v8[1] = &unk_1E2F19640;
  v8[2] = &unk_1E2F19650;
  v8[3] = &unk_1E2F19660;
  v7[2] = CFSTR("CIAttributeMax");
  v7[3] = CFSTR("CIAttributeSliderMin");
  v7[4] = CFSTR("CIAttributeSliderMax");
  v7[5] = CFSTR("CIAttributeDefault");
  v8[4] = &unk_1E2F19670;
  v8[5] = &unk_1E2F19620;
  v17[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v16[7] = CFSTR("inputRotation");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = CFSTR("CIAttributeTypeAngle");
  v6[1] = &unk_1E2F19680;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F19690;
  v6[3] = &unk_1E2F19680;
  v17[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v16[8] = CFSTR("inputZoom");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeScalar");
  v4[1] = &unk_1E2F196A0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F196A0;
  v4[3] = &unk_1E2F19630;
  v3[4] = CFSTR("CIAttributeDefault");
  v4[4] = &unk_1E2F19620;
  v17[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
