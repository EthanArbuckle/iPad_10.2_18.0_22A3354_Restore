@implementation CICMYKHalftone

- (id)_CIWhite
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_white);
}

- (id)_CICMYK_convert
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_cmyk_convert);
}

- (id)_CICMYK_cyan
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_cmyk_cyan);
}

- (id)_CICMYK_magenta
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_cmyk_magenta);
}

- (id)_CICMYK_yellow
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_cmyk_yellow);
}

- (id)_CICMYK_black
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_cmyk_black);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  float v24;
  uint64_t v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  __float2 v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CIVector *inputCenter;
  void *v42;
  __float2 v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CIVector *v52;
  void *v53;
  __float2 v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CIVector *v64;
  void *v65;
  __float2 v66;
  id v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CIVector *v76;
  double v78;
  float v79;
  double v80;
  float v81;
  float v82;
  double v83;
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  CIImage *inputImage;
  _QWORD v89[3];

  v89[2] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v4 = 1.0 / v3;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v6 = v5 + 1.30899694;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v8 = v7 + 0.261799388;
  v79 = v8;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v81 = v9 + 0.0;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v11 = v10 + 0.785398163;
  v82 = v11;
  -[NSNumber floatValue](self->inputSharpness, "floatValue");
  v83 = fmin(1.0 / (1.0 - v12), 10000.0);
  v13 = -[CICMYKHalftone _CICMYK_convert](self, "_CICMYK_convert");
  -[CIImage extent](self->inputImage, "extent");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v89[0] = self->inputImage;
  -[NSNumber floatValue](self->inputUCR, "floatValue");
  v23 = v22;
  -[NSNumber floatValue](self->inputGCR, "floatValue");
  v89[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v23, v24);
  v25 = objc_msgSend(v13, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2), v15, v17, v19, v21);
  v26 = -[CICMYKHalftone _CIWhite](self, "_CIWhite");
  -[CIImage extent](self->inputImage, "extent");
  inputImage = self->inputImage;
  v31 = (void *)objc_msgSend(v26, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &inputImage, 1), v27, v28, v29, v30);
  v32 = __sincosf_stret(v6);
  v33 = -[CICMYKHalftone _CICMYK_cyan](self, "_CICMYK_cyan");
  objc_msgSend(v31, "extent");
  v78 = v34;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  inputCenter = self->inputCenter;
  v87[0] = v31;
  v87[1] = v25;
  v87[2] = inputCenter;
  v87[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v4 * v32.__cosval), (float)(v4 * v32.__sinval), (float)-(float)(v32.__sinval * v4), (float)(v4 * v32.__cosval));
  v87[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v83);
  v42 = (void *)objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 5), v78, v36, v38, v40);
  v43 = __sincosf_stret(v79);
  v44 = -[CICMYKHalftone _CICMYK_magenta](self, "_CICMYK_magenta");
  objc_msgSend(v42, "extent");
  v80 = v45;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v52 = self->inputCenter;
  v86[0] = v42;
  v86[1] = v25;
  v86[2] = v52;
  v86[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v4 * v43.__cosval), (float)(v4 * v43.__sinval), (float)-(float)(v43.__sinval * v4), (float)(v4 * v43.__cosval));
  v86[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v83);
  v53 = (void *)objc_msgSend(v44, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 5), v80, v47, v49, v51);
  v54 = __sincosf_stret(v81);
  v55 = -[CICMYKHalftone _CICMYK_yellow](self, "_CICMYK_yellow");
  objc_msgSend(v53, "extent");
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v64 = self->inputCenter;
  v85[0] = v53;
  v85[1] = v25;
  v85[2] = v64;
  v85[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v4 * v54.__cosval), (float)(v4 * v54.__sinval), (float)-(float)(v54.__sinval * v4), (float)(v4 * v54.__cosval));
  v85[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v83);
  v65 = (void *)objc_msgSend(v55, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 5), v57, v59, v61, v63);
  v66 = __sincosf_stret(v82);
  v67 = -[CICMYKHalftone _CICMYK_black](self, "_CICMYK_black");
  objc_msgSend(v65, "extent");
  v69 = v68;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v76 = self->inputCenter;
  v84[0] = v65;
  v84[1] = v25;
  v84[2] = v76;
  v84[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v4 * v66.__cosval), (float)(v4 * v66.__sinval), (float)-(float)(v66.__sinval * v4), (float)(v4 * v66.__cosval));
  v84[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v83);
  return (id)objc_msgSend(v67, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 5), v69, v71, v73, v75);
}

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[7];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[9];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryHalftoneEffect");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("9");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.4");
  v12[3] = CFSTR("inputWidth");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F18DD0;
  v10[1] = &unk_1E2F18DE0;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F18DF0;
  v10[3] = &unk_1E2F18E00;
  v9[4] = CFSTR("CIAttributeIdentity");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F18E00;
  v10[5] = CFSTR("CIAttributeTypeDistance");
  v9[6] = CFSTR("CIUIParameterSet");
  v10[6] = CFSTR("CIUISetBasic");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v12[4] = CFSTR("inputSharpness");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F18E10;
  v8[1] = &unk_1E2F18E10;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F18E20;
  v8[3] = &unk_1E2F18E30;
  v7[4] = CFSTR("CIAttributeType");
  v7[5] = CFSTR("CIUIParameterSet");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v8[5] = CFSTR("CIUISetBasic");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v12[5] = CFSTR("inputGCR");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18E10;
  v6[1] = &unk_1E2F18E10;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F18E20;
  v6[3] = &unk_1E2F18E20;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18E20;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v5[6] = CFSTR("CIUIParameterSet");
  v6[6] = CFSTR("CIUISetIntermediate");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v12[6] = CFSTR("inputUCR");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18E10;
  v4[1] = &unk_1E2F18E10;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F18E20;
  v4[3] = &unk_1E2F18E40;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F18E40;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v3[6] = CFSTR("CIUIParameterSet");
  v4[6] = CFSTR("CIUISetIntermediate");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputSharpness
{
  return self->inputSharpness;
}

- (void)setInputSharpness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputGCR
{
  return self->inputGCR;
}

- (void)setInputGCR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)inputUCR
{
  return self->inputUCR;
}

- (void)setInputUCR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
