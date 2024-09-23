@implementation CITriangleKaleidoscope

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryTileEffect");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("6");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.10");
  v12[3] = CFSTR("inputPoint");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputRotation");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F1AFE0;
  v8[1] = &unk_1E2F1AFF0;
  v7[2] = CFSTR("CIAttributeDefault");
  v7[3] = CFSTR("CIAttributeType");
  v8[2] = &unk_1E2F1B000;
  v8[3] = CFSTR("CIAttributeTypeAngle");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v12[5] = CFSTR("inputSize");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[0] = &unk_1E2F1AFE0;
  v6[1] = &unk_1E2F1B010;
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeType");
  v6[2] = &unk_1E2F1B020;
  v6[3] = CFSTR("CIAttributeTypeScalar");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v12[6] = CFSTR("inputDecay");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1AFE0;
  v4[1] = &unk_1E2F1B030;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = &unk_1E2F1B040;
  v4[3] = CFSTR("CIAttributeTypeScalar");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)_colorKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_triangleKaleidoscopeColor);
}

- (id)_geomKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_triangleKaleidoscopeGeom);
}

- (id)outputImage
{
  int v3;
  double v4;
  float64x2_t v5;
  float64_t v6;
  float v7;
  float v8;
  float v9;
  double v10;
  float v11;
  float v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  __float2 v18;
  __double2 v19;
  float v20;
  float v21;
  __double2 v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  CIVector *v29;
  CIVector *v30;
  CIVector *v31;
  id v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CIImage *inputImage;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v49;
  float v50;
  float v51;
  float v52;
  float64_t v53;
  float32x2_t v54;
  int v55;
  _QWORD v56[5];
  float v57;
  float v58;
  _QWORD v59[4];
  _QWORD v60[4];

  v60[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber floatValue](self->inputDecay, "floatValue");
  v55 = v3;
  -[CIVector X](self->inputPoint, "X");
  v53 = v4;
  -[CIVector Y](self->inputPoint, "Y");
  v5.f64[0] = v53;
  v5.f64[1] = v6;
  v54 = vcvt_f32_f64(v5);
  -[NSNumber floatValue](self->inputSize, "floatValue");
  v8 = fmax(v7, 0.01);
  v52 = v8;
  v9 = v8 * -1.5;
  v10 = v8 * 1.73205081;
  v11 = v10 / -6.0;
  -[NSNumber floatValue](self->inputRotation, "floatValue");
  v13 = v12;
  v51 = v12;
  -[CIVector X](self->inputPoint, "X");
  v15 = v14;
  -[CIVector Y](self->inputPoint, "Y");
  v17 = v16;
  v18 = __sincosf_stret(v13);
  v49 = (float)((float)(v18.__cosval * v11) + (float)(v18.__sinval * v9)) + v17;
  v50 = (float)((float)(v18.__cosval * v9) - (float)(v18.__sinval * v11)) + v15;
  v19 = __sincos_stret(v13 + -0.523598776);
  v20 = v10 * v19.__cosval;
  v21 = v10 * v19.__sinval;
  v22 = __sincos_stret(v13 + 0.523598776);
  v23 = v10 * v22.__cosval;
  *(float *)&v10 = v10 * v22.__sinval;
  v24 = 1.0 / (float)((float)(v20 * *(float *)&v10) - (float)(v21 * v23));
  v25 = v24 * *(float *)&v10;
  v26 = -(float)(v21 * v24);
  v27 = -(float)(v23 * v24);
  v28 = v24 * v20;
  v29 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v50, v49);
  v30 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v25, v27, v26, v28);
  v31 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v20, v23, v21, *(float *)&v10);
  v32 = -[CITriangleKaleidoscope _geomKernel](self, "_geomKernel");
  v33 = -[CITriangleKaleidoscope _colorKernel](self, "_colorKernel");
  v34 = *MEMORY[0x1E0C9D5E0];
  v35 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v36 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v37 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __37__CITriangleKaleidoscope_outputImage__block_invoke;
  v56[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v56[4] = v54;
  inputImage = self->inputImage;
  v57 = v52;
  v58 = v51;
  v60[0] = v29;
  v60[1] = v30;
  v60[2] = v31;
  v39 = (void *)objc_msgSend(v32, "applyWithExtent:roiCallback:inputImage:arguments:", v56, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3), v34, v35, v36, v37);
  objc_msgSend(v39, "extent");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v59[0] = v39;
  v59[1] = v29;
  v59[2] = v30;
  LODWORD(v40) = v55;
  v59[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  return (id)objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4), v41, v43, v45, v47);
}

double __37__CITriangleKaleidoscope_outputImage__block_invoke(float32x2_t *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  float32x2_t v9;
  float v10;
  __double2 v11;
  float32x2_t v12;
  float32_t v13;
  float32x2_t v14;
  CGPoint v15;
  CGFloat y;
  CGPoint v17;
  float32x2_t v18;
  float32_t v19;
  CGPoint v20;
  CGFloat v21;
  CGPoint v22;
  CGFloat v23;
  float v24;
  float v25;
  float32x2_t v26;
  float32x2_t v27;
  float32_t v28;
  float32x2_t v29;
  double v30;
  double v31;
  float v32;
  __double2 v33;
  float32x2_t v34;
  double v35;
  double v36;
  float v37;
  __double2 v38;
  double v39;
  double v40;
  float v41;
  BOOL v43;
  unsigned int v44;
  float32x2_t v45;
  double v46;
  double v47;
  float v48;
  float v49;
  float v50;
  BOOL v53;
  float32x2_t v54;
  float32x2_t v55;
  double v56;
  double v57;
  float v58;
  float v59;
  float v60;
  BOOL v63;
  float32x2_t v64;
  double v65;
  double v66;
  float v67;
  float v68;
  float v69;
  BOOL v70;
  BOOL v71;
  BOOL v72;
  float32x2_t v73;
  float32_t v74;
  CGPoint v75;
  CGFloat v76;
  CGPoint v77;
  CGFloat v78;
  float v80;
  float v81;
  float32x2_t v82;
  __int32 v83;
  float32_t v84;
  double v85;
  double v86;
  double v87;
  double v88;
  float v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v9 = a1[4];
  v10 = a1[5].f32[1];
  v89 = a1[5].f32[0];
  v87 = v10;
  v11 = __sincos_stret(v10);
  v12.f32[0] = v11.__sinval * 0.288675129 + v11.__cosval * -0.5;
  v88 = v11.__cosval * -0.288675129;
  v13 = v11.__cosval * -0.288675129 + v11.__sinval * -0.5;
  v12.f32[1] = v13;
  v14 = vadd_f32(v9, vmul_n_f32(vcvt_f32_f64(vmlaq_f64(vmulq_f64((float64x2_t)v11, (float64x2_t)xmmword_192498970), (float64x2_t)0, (float64x2_t)vextq_s8((int8x16_t)v11, (int8x16_t)v11, 8uLL))), v89));
  v15 = (CGPoint)vcvtq_f64_f32(vadd_f32(v9, vmul_n_f32(v12, v89)));
  y = v15.y;
  v90.origin.x = a2;
  v90.origin.y = a3;
  v90.size.width = a4;
  v90.size.height = a5;
  v17 = v15;
  if (CGRectContainsPoint(v90, v15))
  {
    v18.f32[0] = v11.__sinval * 0.288675129 + v11.__cosval * 0.5;
    v19 = v88 + v11.__sinval * 0.5;
    v18.f32[1] = v19;
    v20 = (CGPoint)vcvtq_f64_f32(vadd_f32(v9, vmul_n_f32(v18, v89)));
    v21 = v20.y;
    v91.origin.x = a2;
    v91.origin.y = a3;
    v91.size.width = a4;
    v91.size.height = a5;
    if (CGRectContainsPoint(v91, v20))
    {
      v22 = (CGPoint)vcvtq_f64_f32(v14);
      v23 = v22.y;
      v92.origin.x = a2;
      v92.origin.y = a3;
      v92.size.width = a4;
      v92.size.height = a5;
      if (CGRectContainsPoint(v92, v22))
      {
        v24 = v89;
        v25 = v10;
        v26 = v9;
        return triangleBounds(v24, v25, v26);
      }
    }
  }
  v80 = v10;
  v27.f32[0] = a2;
  v28 = a3;
  v83 = v27.i32[0];
  v84 = v28;
  v27.f32[1] = v28;
  v82 = (float32x2_t)vdup_n_s32(0x405DB3D7u);
  v29 = vmul_f32(vsub_f32(v27, v9), v82);
  v85 = a3;
  v86 = a2;
  v30 = v29.f32[0];
  v31 = v29.f32[1];
  v29.f32[0] = v11.__cosval * v29.f32[1] + v11.__sinval * v29.f32[0];
  v81 = v29.f32[0];
  v32 = -v89;
  v33 = __sincos_stret(v87 + 2.0943951);
  v34 = v9;
  v35 = a5;
  v36 = a4;
  v37 = v33.__cosval * v31 + v33.__sinval * v30;
  v38 = __sincos_stret(v87 + -2.0943951);
  v39 = v38.__cosval * v31 + v38.__sinval * v30;
  v40 = v86;
  v41 = v39;
  v43 = v81 < (float)-v89 || v37 < v32 || v41 < v32;
  *(float *)&v44 = v85 + v35;
  v45 = vmul_f32(vsub_f32((float32x2_t)__PAIR64__(v44, v83), v34), v82);
  v46 = v45.f32[0];
  v47 = v45.f32[1];
  v48 = v11.__cosval * v47 + v11.__sinval * v46;
  v49 = v33.__cosval * v47 + v33.__sinval * v46;
  v50 = v38.__cosval * v47 + v38.__sinval * v46;
  v53 = v43 || v48 < v32 || v49 < v32 || v50 < v32;
  v54.f32[0] = v86 + v36;
  v55 = vmul_f32(vsub_f32((float32x2_t)__PAIR64__(LODWORD(v84), v54.u32[0]), v34), v82);
  v56 = v55.f32[0];
  v57 = v55.f32[1];
  v58 = v11.__cosval * v57 + v11.__sinval * v56;
  v59 = v33.__cosval * v57 + v33.__sinval * v56;
  v60 = v38.__cosval * v57 + v38.__sinval * v56;
  v63 = v53 || v58 < v32 || v59 < v32 || v60 < v32;
  v54.f32[1] = v85 + v35;
  v64 = vmul_f32(vsub_f32(v54, v34), v82);
  v65 = v64.f32[0];
  v66 = v64.f32[1];
  if (v63)
  {
    v70 = 1;
  }
  else
  {
    v67 = v11.__cosval * v66 + v11.__sinval * v65;
    v70 = v67 < v32;
  }
  if (v70)
  {
    v71 = 1;
  }
  else
  {
    v68 = v33.__cosval * v66 + v33.__sinval * v65;
    v71 = v68 < v32;
  }
  if (v71)
  {
    v72 = 1;
  }
  else
  {
    v69 = v38.__cosval * v66 + v38.__sinval * v65;
    v72 = v69 < v32;
  }
  if (v72)
  {
    v93.origin.x = v86;
    v93.origin.y = v85;
    v93.size.width = v36;
    v93.size.height = v35;
    if (!CGRectContainsPoint(v93, v17))
    {
      v73.f32[0] = v11.__sinval * 0.288675129 + v11.__cosval * 0.5;
      v74 = v88 + v11.__sinval * 0.5;
      v73.f32[1] = v74;
      v75 = (CGPoint)vcvtq_f64_f32(vadd_f32(v34, vmul_n_f32(v73, v89)));
      v76 = v75.y;
      v94.origin.x = v86;
      v94.origin.y = v85;
      v94.size.width = v36;
      v94.size.height = v35;
      if (!CGRectContainsPoint(v94, v75))
      {
        v77 = (CGPoint)vcvtq_f64_f32(v14);
        v78 = v77.y;
        v95.origin.x = v86;
        v95.origin.y = v85;
        v95.size.width = v36;
        v95.size.height = v35;
        CGRectContainsPoint(v95, v77);
      }
    }
    v24 = v89;
    v25 = v80;
    v26 = v34;
    return triangleBounds(v24, v25, v26);
  }
  return v40;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputPoint
{
  return self->inputPoint;
}

- (void)setInputPoint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputRotation
{
  return self->inputRotation;
}

- (void)setInputRotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputDecay
{
  return self->inputDecay;
}

- (void)setInputDecay:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
