@implementation CIToneCurve

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[3];
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[7];
  _QWORD v16[9];
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("CIAttributeFilterCategories");
  v15[0] = CFSTR("CICategoryColorAdjustment");
  v15[1] = CFSTR("CICategoryVideo");
  v15[2] = CFSTR("CICategoryStillImage");
  v15[3] = CFSTR("CICategoryInterlaced");
  v15[4] = CFSTR("CICategoryNonSquarePixels");
  v15[5] = CFSTR("CICategoryHighDynamicRange");
  v15[6] = CFSTR("CICategoryBuiltIn");
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 7);
  v17[1] = CFSTR("5");
  v16[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v16[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v17[2] = CFSTR("10.7");
  v16[3] = CFSTR("inputPoint0");
  v13[0] = CFSTR("CIAttributeDefault");
  v14[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  v13[1] = CFSTR("CIAttributeIdentity");
  v13[2] = CFSTR("CIAttributeType");
  v14[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  v14[2] = CFSTR("CIAttributeTypeOffset");
  v17[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v16[4] = CFSTR("inputPoint1");
  v11[0] = CFSTR("CIAttributeDefault");
  v12[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.25, 0.25);
  v11[1] = CFSTR("CIAttributeIdentity");
  v11[2] = CFSTR("CIAttributeType");
  v12[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.25, 0.25);
  v12[2] = CFSTR("CIAttributeTypeOffset");
  v17[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v16[5] = CFSTR("inputPoint2");
  v9[0] = CFSTR("CIAttributeDefault");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.5, 0.5);
  v9[1] = CFSTR("CIAttributeIdentity");
  v9[2] = CFSTR("CIAttributeType");
  v10[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.5, 0.5);
  v10[2] = CFSTR("CIAttributeTypeOffset");
  v17[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v16[6] = CFSTR("inputPoint3");
  v7[0] = CFSTR("CIAttributeDefault");
  v8[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.75, 0.75);
  v7[1] = CFSTR("CIAttributeIdentity");
  v7[2] = CFSTR("CIAttributeType");
  v8[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.75, 0.75);
  v8[2] = CFSTR("CIAttributeTypeOffset");
  v17[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v16[7] = CFSTR("inputPoint4");
  v5[0] = CFSTR("CIAttributeDefault");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0, 1.0);
  v5[1] = CFSTR("CIAttributeIdentity");
  v5[2] = CFSTR("CIAttributeType");
  v6[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0, 1.0);
  v6[2] = CFSTR("CIAttributeTypeOffset");
  v17[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v16[8] = CFSTR("inputExtrapolate");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = MEMORY[0x1E0C9AAA0];
  v4[1] = MEMORY[0x1E0C9AAA0];
  v3[2] = CFSTR("CIAttributeMax");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = CFSTR("CIAttributeTypeBoolean");
  v17[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  double v5;
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
  double v16;
  double v17;

  -[CIVector X](self->inputPoint0, "X");
  v4 = v3;
  -[CIVector Y](self->inputPoint0, "Y");
  if (vabdd_f64(v4, v5) >= 0.001)
    return 0;
  -[CIVector X](self->inputPoint1, "X");
  v7 = v6;
  -[CIVector Y](self->inputPoint1, "Y");
  if (vabdd_f64(v7, v8) >= 0.001)
    return 0;
  -[CIVector X](self->inputPoint2, "X");
  v10 = v9;
  -[CIVector Y](self->inputPoint2, "Y");
  if (vabdd_f64(v10, v11) >= 0.001)
    return 0;
  -[CIVector X](self->inputPoint3, "X");
  v13 = v12;
  -[CIVector Y](self->inputPoint3, "Y");
  if (vabdd_f64(v13, v14) >= 0.001)
    return 0;
  -[CIVector X](self->inputPoint4, "X");
  v16 = v15;
  -[CIVector Y](self->inputPoint4, "Y");
  return vabdd_f64(v16, v17) < 0.001;
}

- (id)outputImage
{
  _BOOL4 v3;
  CIImage *inputImage;
  uint64_t v6;
  CIColorKernel *v7;
  double v8;
  double v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  float v28;
  uint64_t v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  double *v35;
  float v36;
  uint64_t v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  double v43;
  uint64_t i;
  float v45;
  float v46;
  float v47;
  double v48;
  double v49;
  float v50;
  uint64_t v51;
  double *v52;
  double *v53;
  uint64_t v54;
  double v55;
  double v56;
  float v57;
  float v58;
  __int128 v59;
  double v60;
  __int128 v61;
  double v62;
  double v63;
  double v64;
  CIVector *v65;
  CIVector *v66;
  CIVector *v67;
  CIVector *v68;
  CIVector *v69;
  float v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  _QWORD v80[12];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  double v94;
  _QWORD v95[3];
  _QWORD v96[6];
  _OWORD v97[2];
  uint64_t v98;
  _OWORD v99[2];
  uint64_t v100;
  _OWORD v101[2];
  int v102;
  _OWORD v103[2];
  int v104;
  _OWORD v105[2];
  uint64_t v106;
  _OWORD v107[2];
  uint64_t v108;
  _OWORD v109[2];
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  v3 = -[CIToneCurve _isIdentity](self, "_isIdentity");
  inputImage = self->inputImage;
  if (v3)
    return inputImage;
  v6 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByApplyingFilter:](inputImage, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve")), "imageByUnpremultiplyingAlpha");
  v7 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_toneCurve);
  -[CIVector X](self->inputPoint0, "X");
  v9 = v8;
  v94 = v8;
  v10 = (double *)v95;
  -[CIVector Y](self->inputPoint0, "Y");
  v95[0] = v11;
  -[CIVector X](self->inputPoint1, "X");
  v95[1] = v12;
  -[CIVector Y](self->inputPoint1, "Y");
  v95[2] = v13;
  -[CIVector X](self->inputPoint2, "X");
  v96[0] = v14;
  -[CIVector Y](self->inputPoint2, "Y");
  v96[1] = v15;
  -[CIVector X](self->inputPoint3, "X");
  v17 = v16;
  *(double *)&v96[2] = v16;
  -[CIVector Y](self->inputPoint3, "Y");
  v96[3] = v18;
  -[CIVector X](self->inputPoint4, "X");
  v20 = v19;
  *(double *)&v96[4] = v19;
  -[CIVector Y](self->inputPoint4, "Y");
  v21 = 0;
  v96[5] = v22;
  v93 = 0;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v113 = 0;
  v111 = 0u;
  v112 = 0u;
  v110 = 0;
  memset(v109, 0, sizeof(v109));
  v108 = 0;
  memset(v107, 0, sizeof(v107));
  v106 = 0;
  memset(v105, 0, sizeof(v105));
  v104 = 0;
  memset(v103, 0, sizeof(v103));
  v102 = 0;
  memset(v101, 0, sizeof(v101));
  v100 = 0;
  memset(v99, 0, sizeof(v99));
  v98 = 0;
  memset(v97, 0, sizeof(v97));
  do
  {
    v23 = *v10;
    v10 += 2;
    v24 = v23;
    *(float *)((char *)&v111 + v21) = v24;
    v21 += 4;
  }
  while (v21 != 20);
  v25 = 0;
  v26 = 2;
  do
  {
    v27 = *(double *)&v95[v26 - 1];
    v28 = v27 - v9;
    *(float *)((char *)v103 + v25) = v28;
    v25 += 4;
    v26 += 2;
    v9 = v27;
  }
  while (v25 != 16);
  v29 = 0;
  v30 = *((float *)&v111 + 1);
  v31 = *(float *)v103;
  v32 = *(float *)v103;
  do
  {
    v33 = *(float *)((char *)v103 + v29 + 4);
    v34 = *(float *)((char *)&v111 + v29 + 8);
    *(float *)((char *)v101 + v29 + 4) = (float)((float)(-3.0 / v32) * (float)(v30 - *(float *)((char *)&v111 + v29)))
                                       + (float)((float)(3.0 / v33) * (float)(v34 - v30));
    v29 += 4;
    v32 = v33;
    v30 = v34;
  }
  while (v29 != 12);
  v35 = (double *)v96;
  v36 = 0.0;
  v37 = 4;
  v38 = 0.0;
  do
  {
    v39 = -((float)(v38 * v31) - (*v35 - *(v35 - 4)) * 2.0);
    v40 = *(float *)((char *)v101 + v37) - (float)(v31 * v36);
    v41 = *(float *)((char *)v103 + v37);
    v38 = v41 / v39;
    *(float *)((char *)v99 + v37) = v41 / v39;
    v36 = v40 / v39;
    *(float *)((char *)v97 + v37) = v40 / v39;
    v37 += 4;
    v35 += 2;
    v31 = v41;
  }
  while (v37 != 16);
  v42 = 0.0;
  LODWORD(v43) = v112;
  for (i = 12; i != -4; i -= 4)
  {
    v45 = *(float *)((char *)v97 + i) - (float)(*(float *)((char *)v99 + i) * v42);
    *(float *)((char *)v107 + i) = v45;
    v46 = *(float *)((char *)&v111 + i);
    v47 = *(float *)((char *)v103 + i);
    v48 = (float)((float)(*(float *)&v43 - v46) / v47);
    v49 = v47;
    *(float *)&v48 = v48 + (v42 + v45 * 2.0) * v49 * -0.333333333;
    *(_DWORD *)((char *)v109 + i) = LODWORD(v48);
    v43 = v49 * 3.0;
    v50 = (float)(v42 - v45) / (v49 * 3.0);
    *(float *)((char *)v105 + i) = v50;
    *(float *)&v43 = v46;
    v42 = v45;
  }
  v51 = 0;
  v52 = (double *)&v82;
  v53 = &v94;
  do
  {
    v54 = *(_QWORD *)v53;
    v53 += 2;
    v55 = *(float *)((char *)&v111 + v51);
    *((_QWORD *)v52 - 2) = v54;
    *(v52 - 1) = v55;
    v56 = *(float *)((char *)v107 + v51);
    v57 = *(float *)((char *)v105 + v51);
    *v52 = *(float *)((char *)v109 + v51);
    v52[1] = v56;
    v52[2] = v57;
    v51 += 4;
    v52 += 5;
  }
  while (v51 != 16);
  v58 = v20 - v17;
  *(double *)&v91 = v20;
  v59 = v89;
  v60 = v58;
  v61 = v90;
  v62 = *((double *)&v90 + 1) * v60 * v60;
  v63 = *(double *)&v89 + *((double *)&v89 + 1) * v60 + *(double *)&v90 * v60 * v60 + v62 * v60;
  v64 = *((double *)&v89 + 1) + *(double *)&v90 * v60 * 2.0 + v62 * 3.0;
  v65 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", *((double *)&v81 + 1), v82, *(double *)&v83, v43);
  v66 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v84, v85);
  v67 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", *((double *)&v86 + 1), v87, *(double *)&v88);
  v68 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v59, v61);
  v69 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v63, v64, 0.0, 0.0);
  if (-[NSNumber BOOLValue](self->inputExtrapolate, "BOOLValue"))
    v70 = 1.0;
  else
    v70 = 0.0;
  -[CIImage extent](self->inputImage, "extent");
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v78 = v77;
  v80[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v81, v6);
  v80[2] = v65;
  v80[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v83 + 1));
  v80[4] = v66;
  v80[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v86);
  v80[6] = v67;
  v80[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v88 + 1));
  v80[8] = v68;
  v80[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v91);
  v80[10] = v69;
  *(float *)&v79 = v70;
  v80[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v79);
  return -[CIImage imageByApplyingFilter:](-[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 12), v72, v74, v76, v78), "imageByPremultiplyingAlpha"), "imageByApplyingFilter:", CFSTR("CISRGBToneCurveToLinear"));
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputPoint0
{
  return self->inputPoint0;
}

- (void)setInputPoint0:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CIVector)inputPoint1
{
  return self->inputPoint1;
}

- (void)setInputPoint1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CIVector)inputPoint2
{
  return self->inputPoint2;
}

- (void)setInputPoint2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CIVector)inputPoint3
{
  return self->inputPoint3;
}

- (void)setInputPoint3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CIVector)inputPoint4
{
  return self->inputPoint4;
}

- (void)setInputPoint4:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)inputExtrapolate
{
  return self->inputExtrapolate;
}

- (void)setInputExtrapolate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

@end
