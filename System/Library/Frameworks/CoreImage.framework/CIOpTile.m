@implementation CIOpTile

- (id)_CIOpTile
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_opTile);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  __float2 v8;
  CIVector *v9;
  CIVector *v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CIImage *inputImage;
  CIVector *inputCenter;
  _QWORD v20[5];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v6 = 1.0 / v5;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v8 = __sincosf_stret(v7);
  v9 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v6 * v8.__cosval), (float)(v6 * v8.__sinval), (float)-(float)(v8.__sinval * v6));
  v10 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0 / v4);
  v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->inputCenter, v10, v9, 0);
  v12 = -[CIOpTile _CIOpTile](self, "_CIOpTile");
  v13 = *MEMORY[0x1E0C9D5E0];
  v14 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __23__CIOpTile_outputImage__block_invoke;
  v20[3] = &unk_1E2EC3588;
  inputImage = self->inputImage;
  inputCenter = self->inputCenter;
  v20[4] = v11;
  v21[0] = inputImage;
  v21[1] = inputCenter;
  v21[2] = v10;
  v21[3] = v9;
  return (id)objc_msgSend(v12, "applyWithExtent:roiCallback:arguments:", v20, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4), v13, v14, v15, v16);
}

double __23__CIOpTile_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
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
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double result;
  float v54;
  double v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v9 = *(void **)(a1 + 32);
  v10 = (void *)objc_msgSend(v9, "objectAtIndex:", 0);
  v11 = (void *)objc_msgSend(v9, "objectAtIndex:", 1);
  v12 = (void *)objc_msgSend(v9, "objectAtIndex:", 2);
  v13 = a3 + a5;
  v14 = a2 + a4;
  objc_msgSend(v10, "X");
  v16 = v15;
  objc_msgSend(v10, "Y");
  *(float *)&v17 = v17;
  v18 = v16;
  v19 = a2 - v16;
  v20 = *(float *)&v17;
  v21 = a3 - *(float *)&v17;
  v22 = v13 - *(float *)&v17;
  objc_msgSend(v11, "X");
  *(float *)&v13 = v23;
  objc_msgSend(v11, "Y");
  *(float *)&v24 = v24;
  v25 = *(float *)&v13;
  v26 = floor(v19 * *(float *)&v13);
  v27 = *(float *)&v24;
  v28 = v26 * *(float *)&v24;
  v29 = floor(v21 * v25) * *(float *)&v24;
  v55 = floor(v22 * v25) * *(float *)&v24;
  v30 = floor((v14 - v18) * v25) * *(float *)&v24;
  objc_msgSend(v12, "X");
  *(float *)&v31 = v31;
  v54 = *(float *)&v31;
  objc_msgSend(v12, "Y");
  v33 = v32;
  objc_msgSend(v12, "Z");
  *(float *)&v22 = v34;
  objc_msgSend(v12, "W");
  *(float *)&v35 = v35;
  v36 = v29 * v33;
  v37 = v36 + v28 * v54;
  v38 = *(float *)&v35;
  v39 = v29 * v38;
  v40 = v29 * v38 + v28 * *(float *)&v22;
  v41 = v55 * v33;
  v42 = v41 + v28 * v54;
  v43 = v55 * v38;
  v44 = v43 + v28 * *(float *)&v22;
  v45 = v41 + v30 * v54;
  v46 = v43 + v30 * *(float *)&v22;
  v47 = v36 + v30 * v54;
  v48 = v39 + v30 * *(float *)&v22;
  v49 = v37 + v18;
  v50 = v40 + v20;
  v51 = v42 + v18;
  v52 = v44 + v20;
  v56.origin.x = v45 + v18;
  v56.origin.y = v46 + v20;
  v59.origin.x = v47 + v18;
  v59.origin.y = v48 + v20;
  v56.size.width = v27;
  v56.size.height = v27;
  v59.size.width = v27;
  v59.size.height = v27;
  v60 = CGRectUnion(v56, v59);
  v57.origin.x = v51;
  v57.origin.y = v52;
  v57.size.width = v27;
  v57.size.height = v27;
  v61 = CGRectUnion(v57, v60);
  v58.origin.x = v49;
  v58.origin.y = v50;
  v58.size.width = v27;
  v58.size.height = v27;
  *(_QWORD *)&result = (unint64_t)CGRectUnion(v58, v61);
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryTileEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("9");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputWidth");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1A4D0;
  v6[1] = &unk_1E2F1A4E0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A4F0;
  v6[3] = &unk_1E2F1A500;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1A500;
  v6[5] = CFSTR("CIAttributeTypeDistance");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A4D0;
  v4[1] = &unk_1E2F1A510;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A520;
  v4[3] = &unk_1E2F1A530;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1A4E0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
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
