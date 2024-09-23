@implementation CIMirror

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryTileEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v7[4] = CFSTR("CICategoryApplePrivate");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v8[1] = CFSTR("inputPoint");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v9[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v8[2] = CFSTR("inputAngle");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1A350;
  v4[1] = &unk_1E2F1A360;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = &unk_1E2F1A360;
  v4[3] = CFSTR("CIAttributeTypeAngle");
  v9[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_mirror);
}

- (double)computeDOD:(float32x2_t)a3@<D0> tst:(__n128)a4@<Q1> off:(int8x16_t)a5@<Q2> mtx:(int8x16_t)a6@<Q3>
{
  double x;
  double y;
  double width;
  double height;
  double v12;
  double v13;
  float v14;
  double v15;
  float v16;
  long double v17;
  long double v18;
  double v19;
  double v20;
  double v21;
  float64x2_t v22;
  double v23;
  double v24;
  int64x2_t v26;
  int64x2_t v27;
  double v28;
  float64x2_t v29;
  int64x2_t v31;
  int64x2_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BOOL v40;
  float64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  double v44;
  double v45;
  BOOL v46;
  float64x2_t v47;
  int64x2_t v48;
  int64x2_t v49;
  float32x2_t v50;
  float32_t v51;
  int64x2_t v52;
  int64x2_t v53;
  float32x2_t v54;
  int64x2_t v55;
  int64x2_t v56;
  float32x2_t v57;
  int64x2_t v58;
  int64x2_t v59;
  int64x2_t v60;
  double result;
  int64x2_t v62;
  double v63;
  double v64;
  double v65;
  __int32 v66;
  double v67;
  __int32 v68;
  float v69;
  double v70;
  __int32 v71;
  double v72;
  __int32 v73;
  _OWORD v78[2];
  _OWORD v79[2];
  _OWORD v80[2];
  _OWORD v81[2];
  _OWORD v82[2];
  _OWORD v83[2];
  _OWORD v84[2];
  _OWORD v85[2];
  int64x2_t v86;
  int64x2_t v87;
  CGRect v88;
  CGRect v89;

  objc_msgSend(a1[10], "extent");
  x = v88.origin.x;
  y = v88.origin.y;
  width = v88.size.width;
  height = v88.size.height;
  if (CGRectIsInfinite(v88))
  {
    height = 1.79769313e308;
    x = -8.98846567e307;
    y = -8.98846567e307;
    width = 1.79769313e308;
  }
  else
  {
    v89.origin.x = x;
    v89.origin.y = y;
    v89.size.width = width;
    v89.size.height = height;
    if (CGRectIsNull(v89))
    {
      height = 0.0;
      x = INFINITY;
      y = INFINITY;
      width = 0.0;
    }
  }
  *a2 = vdupq_n_s64(0x7FF0000000000000uLL);
  a2[1].i64[0] = 0;
  a2[1].i64[1] = 0;
  objc_msgSend(a1[11], "X");
  v13 = v12;
  objc_msgSend(a1[11], "Y");
  v14 = v13;
  v69 = v14;
  v16 = v15;
  objc_msgSend(a1[12], "doubleValue");
  v18 = v17;
  v67 = cos(v17);
  v19 = y + height;
  v72 = v16;
  if (fabs(v67) > 0.001)
  {
    v63 = fmin(y, v19);
    v20 = tan(v18);
    v21 = v69;
    v22.f64[0] = v69 + (v63 - v72) * v20;
    v23 = fmin(x, x + width);
    v24 = fmax(x, x + width);
    if (v22.f64[0] >= v23 && v22.f64[0] <= v24)
    {
      v22.f64[1] = v63;
      v64 = v20;
      v26 = a2[1];
      v85[0] = *a2;
      v85[1] = v26;
      extendDOD((uint64_t)v85, &v86, vcvt_f32_f64(v22), a3, a4, a5, a6);
      v21 = v69;
      v20 = v64;
      v27 = v87;
      *a2 = v86;
      a2[1] = v27;
    }
    v28 = fmax(y, v19);
    v29.f64[0] = v21 + (v28 - v72) * v20;
    if (v29.f64[0] >= v23 && v29.f64[0] <= v24)
    {
      v29.f64[1] = v28;
      v31 = a2[1];
      v84[0] = *a2;
      v84[1] = v31;
      extendDOD((uint64_t)v84, &v86, vcvt_f32_f64(v29), a3, a4, a5, a6);
      v32 = v87;
      *a2 = v86;
      a2[1] = v32;
    }
  }
  v33 = sin(v18);
  v34 = x + width;
  v35 = fmin(x, x + width);
  if (fabs(v33) <= 0.001)
  {
    v38 = fmin(y, v19);
    v39 = fmax(y, v19);
    v70 = fmax(x, v34);
  }
  else
  {
    v36 = v69;
    v37 = (v35 - v69) * v67 / v33 + v72;
    v38 = fmin(y, v19);
    v39 = fmax(y, v19);
    v40 = v37 < v38 || v37 > v39;
    v65 = v35;
    if (!v40)
    {
      v41.f64[0] = v35;
      v41.f64[1] = (v35 - v69) * v67 / v33 + v72;
      v42 = a2[1];
      v83[0] = *a2;
      v83[1] = v42;
      extendDOD((uint64_t)v83, &v86, vcvt_f32_f64(v41), a3, a4, a5, a6);
      v35 = v65;
      v43 = v87;
      *a2 = v86;
      a2[1] = v43;
    }
    v44 = fmax(x, v34);
    v45 = (v44 - v36) * v67 / v33 + v72;
    v46 = v45 < v38 || v45 > v39;
    v70 = v44;
    if (!v46)
    {
      v47.f64[0] = v44;
      v47.f64[1] = (v44 - v36) * v67 / v33 + v72;
      v48 = a2[1];
      v82[0] = *a2;
      v82[1] = v48;
      extendDOD((uint64_t)v82, &v86, vcvt_f32_f64(v47), a3, a4, a5, a6);
      v35 = v65;
      v49 = v87;
      *a2 = v86;
      a2[1] = v49;
    }
  }
  v50.f32[0] = v35;
  v66 = v50.i32[0];
  v51 = v38;
  v73 = LODWORD(v51);
  v50.f32[1] = v51;
  v52 = a2[1];
  v81[0] = *a2;
  v81[1] = v52;
  extendDOD((uint64_t)v81, &v86, v50, a3, a4, a5, a6);
  v53 = v87;
  *a2 = v86;
  a2[1] = v53;
  *(float *)v53.i32 = v39;
  v68 = v53.i32[0];
  v54 = (float32x2_t)__PAIR64__(v53.u32[0], v66);
  v55 = a2[1];
  v80[0] = *a2;
  v80[1] = v55;
  extendDOD((uint64_t)v80, &v86, v54, a3, a4, a5, a6);
  v56 = v87;
  *a2 = v86;
  a2[1] = v56;
  v57.f32[0] = v70;
  v71 = v57.i32[0];
  v57.i32[1] = v73;
  v58 = a2[1];
  v79[0] = *a2;
  v79[1] = v58;
  extendDOD((uint64_t)v79, &v86, v57, a3, a4, a5, a6);
  v59 = v87;
  *a2 = v86;
  a2[1] = v59;
  v60 = a2[1];
  v78[0] = *a2;
  v78[1] = v60;
  extendDOD((uint64_t)v78, &v86, (float32x2_t)__PAIR64__(v68, v71), a3, a4, a5, a6);
  result = *(double *)v86.i64;
  v62 = v87;
  *a2 = v86;
  a2[1] = v62;
  return result;
}

- (id)outputImage
{
  double v3;
  double v4;
  double x;
  double y;
  double width;
  double height;
  double v10;
  double v11;
  unsigned int v12;
  double v13;
  unsigned int v14;
  __double2 v15;
  __double2 v16;
  float64x2_t v17;
  __int128 v18;
  __int128 v19;
  float v20;
  double v21;
  float v22;
  float v23;
  double v24;
  float sinval;
  float v26;
  float v27;
  __double2 v28;
  float v29;
  float v30;
  double v31;
  unsigned int v32;
  double v33;
  unsigned int v34;
  unsigned int v35;
  __int128 v36;
  id v37;
  __int128 v38;
  double var0;
  double var1;
  double var3;
  double var2;
  CIImage *inputImage;
  __int128 v44;
  uint64_t v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  __int128 v53;
  float v54;
  __double2 v55;
  float v56;
  double v57;
  unint64_t v58;
  float v59;
  __int128 v60;
  _QWORD v61[4];
  __double2 v62;
  __int128 v63;
  __int128 v64;
  double v65;
  unint64_t v66;
  double v67;
  Rectangle v68;
  Rectangle v69;
  _QWORD v70[5];
  CGRect v71;
  CGRect v72;

  v70[4] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputAngle, "doubleValue");
  v4 = v3;
  -[CIImage extent](self->inputImage, "extent");
  x = v71.origin.x;
  y = v71.origin.y;
  width = v71.size.width;
  height = v71.size.height;
  if (CGRectIsInfinite(v71))
  {
    height = 1.79769313e308;
    x = -8.98846567e307;
    y = -8.98846567e307;
    width = 1.79769313e308;
  }
  else
  {
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    if (CGRectIsNull(v72))
    {
      height = 0.0;
      x = INFINITY;
      y = INFINITY;
      width = 0.0;
    }
  }
  -[CIVector X](self->inputPoint, "X");
  v11 = v10;
  -[CIVector Y](self->inputPoint, "Y");
  *(float *)&v12 = v11;
  *(float *)&v14 = v13;
  v54 = *(float *)&v12;
  v56 = *(float *)&v14;
  *(double *)&v58 = COERCE_DOUBLE(__PAIR64__(v14, v12));
  v16 = __sincos_stret(v4);
  v17.f64[0] = v16.__sinval * v16.__sinval - v16.__cosval * v16.__cosval;
  v17.f64[1] = v16.__cosval * (v16.__sinval + v16.__sinval);
  *(float32x2_t *)&v18 = vcvt_f32_f64(v17);
  v19 = v18;
  DWORD2(v19) = DWORD1(v18);
  v20 = v16.__cosval * v16.__cosval - v16.__sinval * v16.__sinval;
  v59 = v20;
  v60 = v19;
  v44 = v18;
  if (x != -8.98846567e307
    || y != -8.98846567e307
    || width != 1.79769313e308
    || (v21 = *(double *)&v58, height != 1.79769313e308))
  {
    *(float *)&v21 = x + width * 0.5;
    v22 = y + height * 0.5;
    *((float *)&v21 + 1) = v22;
  }
  v23 = *((float *)&v21 + 1);
  v24 = -v16.__sinval * (float)(v56 - *((float *)&v21 + 1)) + (float)(v54 - *(float *)&v21) * v16.__cosval;
  *(float *)&v15.__sinval = v16.__cosval;
  sinval = v16.__sinval;
  v26 = -sinval;
  v27 = v16.__sinval * v56 + (float)-v54 * v16.__cosval;
  v51 = v26;
  v52 = *(float *)&v15.__sinval;
  v28 = v15;
  *((float *)&v28.__sinval + 1) = v26;
  v50 = v27;
  *(float *)&v28.__cosval = v27;
  if (v24 <= 0.0)
  {
    v29 = v16.__cosval * (v24 * -2.0);
    v30 = v29;
  }
  else
  {
    v30 = 0.0;
  }
  v31 = v16.__sinval * (v24 + v24);
  if (v24 > 0.0)
    v31 = 0.0;
  *(float *)&v32 = v31;
  v33 = v24 + fabs(v24);
  *(float *)&v34 = v16.__cosval * v33;
  *(float *)&v35 = -(v33 * v16.__sinval);
  v48 = *(float *)&v32;
  v49 = v30;
  *(_QWORD *)&v36 = __PAIR64__(v32, LODWORD(v30));
  v46 = *(float *)&v35;
  v47 = *(float *)&v34;
  *((_QWORD *)&v36 + 1) = __PAIR64__(v35, v34);
  v55 = v28;
  v57 = v21;
  v53 = v36;
  -[CIMirror computeDOD:tst:off:mtx:](self, "computeDOD:tst:off:mtx:", v21, v28.__sinval, v44);
  Rectangle::integralize(&v69, 0.0001, (uint64_t)&v68);
  v69 = v68;
  v37 = -[CIMirror _kernel](self, "_kernel");
  v38 = v60;
  *((float *)&v38 + 3) = v59;
  var1 = v69.var1;
  var0 = v69.var0;
  var3 = v69.var3;
  var2 = v69.var2;
  if (v69.var0 == -8.98846567e307
    && v69.var1 == -8.98846567e307
    && v69.var2 == 1.79769313e308
    && v69.var3 == 1.79769313e308)
  {
    var0 = *MEMORY[0x1E0C9D5E0];
    var1 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    var2 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    var3 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __23__CIMirror_outputImage__block_invoke;
  v61[3] = &__block_descriptor_104_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v65 = v57;
  v66 = v58;
  v62 = v55;
  v63 = v53;
  v64 = v38;
  v67 = v4;
  inputImage = self->inputImage;
  v70[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", *(float *)&v57, v23);
  v70[1] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v52, v51, v50);
  v70[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v49, v48, v47, v46);
  v70[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", *(float *)&v45, *((float *)&v45 + 1), *((float *)&v45 + 1), v59);
  return (id)objc_msgSend(v37, "applyWithExtent:roiCallback:inputImage:arguments:", v61, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 4), var0, var1, var2, var3);
}

void __23__CIMirror_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v10;
  BOOL IsNull;
  double v12;
  float32x2_t v13;
  long double v14;
  double v15;
  double v16;
  double v17;
  float64x2_t v18;
  double v19;
  double v20;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  float64x2_t v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  BOOL v42;
  float64x2_t v43;
  double v44;
  double v45;
  double v46;
  BOOL v47;
  float64x2_t v48;
  double v49;
  float32x2_t v50;
  float32_t v51;
  unsigned int v52;
  float32x2_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  float32x2_t v58;
  __int32 v59;
  double v60;
  unsigned int v61;
  uint64_t v62;
  __int32 v63;
  double v64;
  double v65;
  __int32 v66;
  int8x16_t v67;
  int8x16_t v68;
  __n128 v69;
  _OWORD v70[2];
  _OWORD v71[2];
  _OWORD v72[2];
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[4];
  _QWORD v76[4];
  int64x2_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  CGRect v82;

  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    v10 = -8.98846567e307;
    a4 = 1.79769313e308;
    a5 = 1.79769313e308;
    v64 = -8.98846567e307;
  }
  else
  {
    v82.origin.x = a2;
    v82.origin.y = a3;
    v82.size.width = a4;
    v82.size.height = a5;
    IsNull = CGRectIsNull(v82);
    if (IsNull)
    {
      a4 = 0.0;
      a5 = 0.0;
      v10 = INFINITY;
    }
    else
    {
      v10 = a3;
    }
    if (IsNull)
      v12 = INFINITY;
    else
      v12 = a2;
    v64 = v12;
  }
  v13 = *(float32x2_t *)(a1 + 80);
  v62 = *(_QWORD *)(a1 + 88);
  v68 = *(int8x16_t *)(a1 + 48);
  v69 = *(__n128 *)(a1 + 32);
  v67 = *(int8x16_t *)(a1 + 64);
  v14 = *(double *)(a1 + 96);
  v60 = cos(v14);
  v15 = a5 + v10;
  v57 = a4;
  v56 = a5 + v10;
  if (fabs(v60) <= 0.001)
  {
    v29 = 0;
    v22 = 0x7FF0000000000000;
    v28 = 0;
    v23 = 0x7FF0000000000000;
  }
  else
  {
    v54 = fmin(v10, v15);
    v16 = tan(v14);
    v17 = *(float *)&v62;
    v18.f64[0] = *(float *)&v62 + (v54 - *((float *)&v62 + 1)) * v16;
    v19 = fmin(v64, a4 + v64);
    v20 = fmax(v64, a4 + v64);
    if (v18.f64[0] < v19 || v18.f64[0] > v20)
    {
      v29 = 0;
      v26 = 0x7FF0000000000000;
      v28 = 0;
      v27 = 0x7FF0000000000000;
    }
    else
    {
      v18.f64[1] = v54;
      v77 = vdupq_n_s64(0x7FF0000000000000uLL);
      v78 = 0;
      v79 = 0;
      v24 = v16;
      v25 = v19;
      extendROI((uint64_t)&v77, &v80, vcvt_f32_f64(v18), v13, v69, v68, v67);
      v19 = v25;
      v17 = *(float *)&v62;
      v16 = v24;
      v27 = *((_QWORD *)&v80 + 1);
      v26 = v80;
      v29 = *((_QWORD *)&v81 + 1);
      v28 = v81;
    }
    v30 = fmax(v10, v15);
    v31.f64[0] = v17 + (v30 - *((float *)&v62 + 1)) * v16;
    if (v31.f64[0] < v19 || v31.f64[0] > v20)
    {
      v22 = v27;
      v23 = v26;
    }
    else
    {
      v31.f64[1] = v30;
      v76[0] = v26;
      v76[1] = v27;
      v76[2] = v28;
      v76[3] = v29;
      extendROI((uint64_t)v76, &v80, vcvt_f32_f64(v31), v13, v69, v68, v67);
      v22 = *((_QWORD *)&v80 + 1);
      v23 = v80;
      v29 = *((_QWORD *)&v81 + 1);
      v28 = v81;
    }
  }
  v33 = sin(v14);
  v34 = v64;
  v35 = v57 + v64;
  v36 = fmin(v64, v57 + v64);
  if (fabs(v33) <= 0.001)
  {
    v40 = fmin(v10, v56);
    v41 = fmax(v10, v56);
    v65 = fmax(v64, v35);
  }
  else
  {
    v58 = v13;
    v37 = *(float *)&v62;
    v38 = *((float *)&v62 + 1);
    v39 = (v36 - *(float *)&v62) * v60 / v33 + *((float *)&v62 + 1);
    v40 = fmin(v10, v56);
    v41 = fmax(v10, v56);
    v42 = v39 < v40 || v39 > v41;
    v55 = v36;
    if (!v42)
    {
      v43.f64[0] = v36;
      v43.f64[1] = (v36 - *(float *)&v62) * v60 / v33 + *((float *)&v62 + 1);
      v75[0] = v23;
      v75[1] = v22;
      v75[2] = v28;
      v75[3] = v29;
      v44 = v40;
      extendROI((uint64_t)v75, &v80, vcvt_f32_f64(v43), v58, v69, v68, v67);
      v37 = *(float *)&v62;
      v40 = v44;
      v34 = v64;
      v22 = *((_QWORD *)&v80 + 1);
      v23 = v80;
      v29 = *((_QWORD *)&v81 + 1);
      v28 = v81;
    }
    v45 = fmax(v34, v35);
    v46 = (v45 - v37) * v60 / v33 + v38;
    v47 = v46 < v40 || v46 > v41;
    v65 = v45;
    if (v47)
    {
      v13 = v58;
    }
    else
    {
      v48.f64[0] = v45;
      v48.f64[1] = (v45 - v37) * v60 / v33 + v38;
      v74[0] = v23;
      v74[1] = v22;
      v74[2] = v28;
      v74[3] = v29;
      v13 = v58;
      v49 = v40;
      extendROI((uint64_t)v74, &v80, vcvt_f32_f64(v48), v58, v69, v68, v67);
      v40 = v49;
      v22 = *((_QWORD *)&v80 + 1);
      v23 = v80;
      v29 = *((_QWORD *)&v81 + 1);
      v28 = v81;
    }
    v36 = v55;
  }
  v50.f32[0] = v36;
  v59 = v50.i32[0];
  v51 = v40;
  v63 = LODWORD(v51);
  v50.f32[1] = v51;
  v73[0] = v23;
  v73[1] = v22;
  v73[2] = v28;
  v73[3] = v29;
  extendROI((uint64_t)v73, &v80, v50, v13, v69, v68, v67);
  *(float *)&v52 = v41;
  v61 = v52;
  v72[0] = v80;
  v72[1] = v81;
  extendROI((uint64_t)v72, &v80, (float32x2_t)__PAIR64__(v52, v59), v13, v69, v68, v67);
  v53.f32[0] = v65;
  v66 = v53.i32[0];
  v53.i32[1] = v63;
  v71[0] = v80;
  v71[1] = v81;
  extendROI((uint64_t)v71, &v80, v53, v13, v69, v68, v67);
  v70[0] = v80;
  v70[1] = v81;
  extendROI((uint64_t)v70, &v80, (float32x2_t)__PAIR64__(v61, v66), v13, v69, v68, v67);
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

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
