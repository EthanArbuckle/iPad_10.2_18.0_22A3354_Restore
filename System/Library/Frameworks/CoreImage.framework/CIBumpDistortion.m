@implementation CIBumpDistortion

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryDistortionEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("6");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.4");
  v10[3] = CFSTR("inputCenter");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeDefault");
  v8[0] = CFSTR("CIAttributeTypePosition");
  v8[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v10[4] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18D60;
  v6[1] = &unk_1E2F18D60;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F18D70;
  v6[3] = &unk_1E2F18D80;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeDistance");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v10[5] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F18D90;
  v4[1] = &unk_1E2F18DA0;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F18DB0;
  v4[3] = &unk_1E2F18D60;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_bumpDistortion);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double x;
  double y;
  double width;
  double height;
  double v16;
  double v17;
  double v18;
  CIVector *v19;
  double v20;
  float64x2_t v21;
  float64_t v22;
  float32x2_t v23;
  double v24;
  float64x2_t v25;
  float64_t v26;
  float32x2_t v27;
  id v28;
  CIImage *inputImage;
  float64_t v30;
  float64_t v31;
  _QWORD v32[6];
  float v33;
  _QWORD v34[2];
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v34[1] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v4 = fmaxf(v3, 0.0);
  -[NSNumber floatValue](self->inputScale, "floatValue");
  if (fabsf(v4) < 0.001)
    return self->inputImage;
  v6 = -v5;
  if (fabsf(-v5) < 0.001)
    return self->inputImage;
  -[CIVector X](self->inputCenter, "X");
  v9 = v8 - v4;
  -[CIVector Y](self->inputCenter, "Y");
  v11 = v10 - v4;
  -[CIImage extent](self->inputImage, "extent");
  v37.origin.x = v9;
  v37.origin.y = v11;
  v37.size.width = (float)(v4 + v4);
  v37.size.height = v37.size.width;
  v36 = CGRectUnion(v35, v37);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  -[CIVector X](self->inputCenter, "X");
  v17 = v16;
  -[CIVector Y](self->inputCenter, "Y");
  v19 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(1.0 / v4), v6, v17, v18);
  -[CIVector X](v19, "X");
  v30 = v20;
  -[CIVector Y](v19, "Y");
  v21.f64[0] = v30;
  v21.f64[1] = v22;
  v23 = vcvt_f32_f64(v21);
  -[CIVector X](self->inputCenter, "X");
  v31 = v24;
  -[CIVector Y](self->inputCenter, "Y");
  v25.f64[0] = v31;
  v25.f64[1] = v26;
  v27 = vcvt_f32_f64(v25);
  v28 = -[CIBumpDistortion _kernel](self, "_kernel");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __31__CIBumpDistortion_outputImage__block_invoke;
  v32[3] = &__block_descriptor_52_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v32[4] = v27;
  v32[5] = v23;
  v33 = v4;
  inputImage = self->inputImage;
  v34[0] = v19;
  return (id)objc_msgSend(v28, "applyWithExtent:roiCallback:inputImage:arguments:", v32, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1), x, y, width, height);
}

double __31__CIBumpDistortion_outputImage__block_invoke(float32x2_t *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8;
  float v9;
  double MaxX;
  double MaxY;
  float v12;
  float v13;
  float32x2_t v14;
  float32_t v15;
  float32x2_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  double v21;
  double v22;
  float32x2_t v23;
  _BOOL4 v24;
  float32x2_t v25;
  float32x2_t v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x2_t v33;
  float v34;
  float v35;
  float32x2_t v36;
  _BOOL4 v37;
  float32x2_t v38;
  float32x2_t v39;
  float v40;
  float v41;
  BOOL v42;
  float v43;
  float v44;
  float32x2_t v45;
  float32x2_t v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float32x2_t v52;
  float32x2_t v53;
  float32x2_t v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float32x2_t v59;
  float v60;
  float v61;
  float32x2_t v62;
  float32x2_t v63;
  float32x2_t v64;
  float v65;
  float v66;
  float v67;
  float v68;
  double MinY;
  double MinX;
  float32x2_t v72;
  float32x2_t v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v8 = a2;
  v73 = a1[4];
  v72 = a1[5];
  v9 = a1[6].f32[0];
  MinX = CGRectGetMinX(*(CGRect *)&a2);
  v74.origin.x = v8;
  v74.origin.y = a3;
  v74.size.width = a4;
  v74.size.height = a5;
  MinY = CGRectGetMinY(v74);
  v75.origin.x = v8;
  v75.origin.y = a3;
  v75.size.width = a4;
  v75.size.height = a5;
  MaxX = CGRectGetMaxX(v75);
  v76.origin.x = v8;
  v76.origin.y = a3;
  v76.size.width = a4;
  v76.size.height = a5;
  MaxY = CGRectGetMaxY(v76);
  v79.origin.x = (float)(v73.f32[0] - v9);
  v79.origin.y = (float)(v73.f32[1] - v9);
  v79.size.width = v9 + v9;
  v77.origin.x = v8;
  v77.origin.y = a3;
  v77.size.width = a4;
  v77.size.height = a5;
  v79.size.height = v79.size.width;
  v78 = CGRectIntersection(v77, v79);
  if (!CGRectIsEmpty(v78))
  {
    v12 = MinX;
    v13 = MinY;
    v14.f32[0] = MaxX;
    v16 = vsub_f32(v73, (float32x2_t)__PAIR64__(LODWORD(v13), LODWORD(v12)));
    v17 = 1.0;
    v18 = 1.0 - (float)(sqrtf(vaddv_f32(vmul_f32(v16, v16))) * v72.f32[0]);
    if (v18 <= 1.0)
      v19 = v18;
    else
      v19 = 1.0;
    if (v18 >= 0.0)
      v20 = v19;
    else
      v20 = 0.0;
    v21 = (v20 * -2.0 + 3.0) * v20 * v20;
    v22 = v72.f32[1];
    *(float *)&v21 = v21 * v72.f32[1] + 1.0;
    v23 = vadd_f32(v73, vmul_n_f32(vsub_f32((float32x2_t)__PAIR64__(LODWORD(v13), LODWORD(v12)), v73), *(float *)&v21));
    v24 = v73.f32[1] > v13;
    v15 = MaxY;
    if (v73.f32[1] >= v15)
      v24 = 0;
    if (v24)
    {
      v25.i32[1] = v73.i32[1];
      v25.f32[0] = MinX;
      v26 = vsub_f32(v73, v25);
      v27 = 1.0 - (float)(v72.f32[0] * sqrtf(vaddv_f32(vmul_f32(v26, v26))));
      if (v27 <= 1.0)
        v28 = v27;
      else
        v28 = 1.0;
      if (v27 >= 0.0)
        v29 = v28;
      else
        v29 = 0.0;
      v30 = (v29 * -2.0 + 3.0) * v29 * v29 * v22 + 1.0;
      v31 = vminnm_f32(v23, vadd_f32(v73, vmul_n_f32(vsub_f32(v25, v73), v30)));
    }
    else
    {
      v31 = v23;
    }
    v32.f32[0] = MinX;
    v32.f32[1] = MaxY;
    v33 = vsub_f32(v73, v32);
    v34 = 1.0 - (float)(v72.f32[0] * sqrtf(vaddv_f32(vmul_f32(v33, v33))));
    if (v34 <= 1.0)
      v17 = v34;
    if (v34 < 0.0)
      v17 = 0.0;
    v35 = (v17 * -2.0 + 3.0) * v17 * v17 * v22 + 1.0;
    v36 = vminnm_f32(v31, vadd_f32(v73, vmul_n_f32(vsub_f32(v32, v73), v35)));
    v37 = v73.f32[0] > v12;
    if (v73.f32[0] >= v14.f32[0])
      v37 = 0;
    if (v37)
    {
      v38.i32[0] = v73.i32[0];
      v38.f32[1] = MaxY;
      v39 = vsub_f32(v73, v38);
      v40 = 1.0;
      v41 = 1.0 - (float)(v72.f32[0] * sqrtf(vaddv_f32(vmul_f32(v39, v39))));
      if (v41 <= 1.0)
        v40 = v41;
      v42 = v41 < 0.0;
      v43 = 0.0;
      if (!v42)
        v43 = v40;
      v44 = (v43 * -2.0 + 3.0) * v43 * v43 * v22 + 1.0;
      v36 = vminnm_f32(v36, vadd_f32(v73, vmul_n_f32(vsub_f32(v38, v73), v44)));
    }
    v45.f32[0] = MaxX;
    v45.f32[1] = MaxY;
    v46 = vsub_f32(v73, v45);
    v47 = v72.f32[0] * sqrtf(vaddv_f32(vmul_f32(v46, v46)));
    v48 = 1.0;
    v49 = 1.0 - v47;
    if (v49 <= 1.0)
      v50 = v49;
    else
      v50 = 1.0;
    if (v49 < 0.0)
      v50 = 0.0;
    v51 = (v50 * -2.0 + 3.0) * v50 * v50 * v22 + 1.0;
    v52 = vminnm_f32(v36, vadd_f32(v73, vmul_n_f32(vsub_f32(v45, v73), v51)));
    if (v24)
    {
      v53.i32[1] = v73.i32[1];
      v53.f32[0] = MaxX;
      v54 = vsub_f32(v73, v53);
      v55 = 1.0 - (float)(v72.f32[0] * sqrtf(vaddv_f32(vmul_f32(v54, v54))));
      if (v55 <= 1.0)
        v56 = v55;
      else
        v56 = 1.0;
      if (v55 >= 0.0)
        v57 = v56;
      else
        v57 = 0.0;
      v58 = (v57 * -2.0 + 3.0) * v57 * v57 * v22 + 1.0;
      v52 = vminnm_f32(v52, vadd_f32(v73, vmul_n_f32(vsub_f32(v53, v73), v58)));
    }
    v14.f32[1] = MinY;
    v59 = vsub_f32(v73, v14);
    v60 = 1.0 - (float)(v72.f32[0] * sqrtf(vaddv_f32(vmul_f32(v59, v59))));
    if (v60 <= 1.0)
      v48 = v60;
    if (v60 < 0.0)
      v48 = 0.0;
    v61 = (v48 * -2.0 + 3.0) * v48 * v48 * v22 + 1.0;
    v62 = vminnm_f32(v52, vadd_f32(v73, vmul_n_f32(vsub_f32(v14, v73), v61)));
    if (v37)
    {
      v63.i32[0] = v73.i32[0];
      v63.f32[1] = MinY;
      v64 = vsub_f32(v73, v63);
      v65 = 1.0;
      v66 = 1.0 - (float)(v72.f32[0] * sqrtf(vaddv_f32(vmul_f32(v64, v64))));
      if (v66 <= 1.0)
        v65 = v66;
      v42 = v66 < 0.0;
      v67 = 0.0;
      if (!v42)
        v67 = v65;
      v68 = (v67 * -2.0 + 3.0) * v67 * v67 * v22 + 1.0;
      v62.i32[0] = vminnm_f32(v62, vadd_f32(v73, vmul_n_f32(vsub_f32(v63, v73), v68))).u32[0];
    }
    return v62.f32[0];
  }
  return v8;
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

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
