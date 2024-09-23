@implementation CIPinchDistortion

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
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
  v6[0] = &unk_1E2F1A700;
  v6[1] = &unk_1E2F1A700;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A710;
  v6[3] = &unk_1E2F1A720;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1A700;
  v6[5] = CFSTR("CIAttributeTypeDistance");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v10[5] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A700;
  v4[1] = &unk_1E2F1A700;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A730;
  v4[3] = &unk_1E2F1A740;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1A700;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)_pinchDistortionScaleLT1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_pinchDistortionScaleLT1);
}

- (id)_pinchDistortionScaleGE1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_pinchDistortionScaleGE1);
}

- (CGRect)computeDOD:(float)a3 scale:(float)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
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
  CGFloat v25;
  double v26;
  double v27;
  float32x2_t v28;
  float v29;
  float32x2_t v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  float32x2_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  CGFloat v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  CGFloat v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  float v120;
  float v121;
  float v122;
  __int32 v123;
  __int32 v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  unsigned int v128;
  CGFloat v129;
  __int32 v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  double v136;
  float32x2_t v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect result;

  v131 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v133 = *MEMORY[0x1E0C9D628];
  v129 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v127 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[CIImage extent](self->inputImage, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CIVector X](self->inputCenter, "X");
  v15 = v14;
  -[CIVector Y](self->inputCenter, "Y");
  v17 = v16;
  v138.origin.x = v7;
  v138.origin.y = v9;
  v136 = v11;
  v138.size.width = v11;
  v18 = v13;
  v138.size.height = v13;
  if (CGRectIsInfinite(v138))
  {
    v24 = v136;
    v25 = v7;
    v26 = v9;
    v27 = v13;
  }
  else
  {
    v28.f32[0] = v15;
    v29 = v17;
    v121 = v28.f32[0];
    v122 = v29;
    v28.f32[1] = v29;
    v137 = v28;
    v126 = v7;
    v30.f32[0] = v7;
    *(float *)&v19 = v9;
    v123 = LODWORD(v19);
    v124 = v30.i32[0];
    v30.i32[1] = LODWORD(v19);
    *(float *)&v19 = a3;
    v31 = map_point_inv(v30, v28, v19, a4, v20, v21, v22, v23);
    v32 = unionPointWithRect(v31, v133, v131, v129, v127);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v125 = v18;
    *(float *)&v33 = v9 + v18;
    v128 = LODWORD(v33);
    *(float *)&v35 = a3;
    v43 = map_point_inv((float32x2_t)__PAIR64__(LODWORD(v33), v124), v137, v35, a4, v39, v40, v41, v42);
    v44 = unionPointWithRect(v43, v32, v34, v36, v38);
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v51 = v136;
    v52.f32[0] = v126 + v136;
    v130 = v52.i32[0];
    v52.i32[1] = v123;
    *(float *)&v47 = a3;
    v57 = map_point_inv(v52, v137, v47, a4, v53, v54, v55, v56);
    v58 = unionPointWithRect(v57, v44, v46, v48, v50);
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v120 = a3;
    *(float *)&v61 = a3;
    v69 = map_point_inv((float32x2_t)__PAIR64__(v128, v130), v137, v61, a4, v65, v66, v67, v68);
    v70 = unionPointWithRect(v69, v58, v60, v62, v64);
    v132 = v72;
    v134 = v71;
    v74 = v73;
    v75 = v125;
    v139.origin.x = v126;
    v139.origin.y = v9;
    v139.size.width = v136;
    v139.size.height = v125;
    v76 = v9;
    if (CGRectGetMinX(v139) < v121)
    {
      v140.origin.x = v126;
      v140.origin.y = v9;
      v140.size.width = v136;
      v140.size.height = v125;
      if (CGRectGetMaxX(v140) > v121)
      {
        v81 = map_point_inv((float32x2_t)__PAIR64__(v123, v137.u32[0]), v137, COERCE_DOUBLE(__PAIR64__(v137.u32[1], LODWORD(a3))), a4, v77, v78, v79, v80);
        v82 = unionPointWithRect(v81, v70, v134, v74, v132);
        v84 = v83;
        v86 = v85;
        v88 = v87;
        v75 = v125;
        v93 = map_point_inv((float32x2_t)__PAIR64__(v128, v137.u32[0]), v137, COERCE_DOUBLE(__PAIR64__(v137.u32[1], LODWORD(a3))), a4, v89, v90, v91, v92);
        v94 = v84;
        v76 = v9;
        v51 = v136;
        v70 = unionPointWithRect(v93, v82, v94, v86, v88);
        v132 = v96;
        v134 = v95;
        v74 = v97;
      }
    }
    v141.origin.x = v126;
    v141.origin.y = v76;
    v141.size.width = v51;
    v141.size.height = v75;
    if (CGRectGetMinY(v141) >= v122)
    {
      v103 = v132;
      v102 = v134;
    }
    else
    {
      v142.origin.x = v126;
      v142.origin.y = v76;
      v142.size.width = v51;
      v142.size.height = v75;
      v103 = v132;
      v102 = v134;
      if (CGRectGetMaxY(v142) > v122)
      {
        v104 = map_point_inv((float32x2_t)__PAIR64__(v137.u32[1], v130), v137, COERCE_DOUBLE(__PAIR64__(v137.u32[1], LODWORD(a3))), a4, v98, v99, v100, v101);
        v105 = unionPointWithRect(v104, v70, v134, v74, v132);
        v107 = v106;
        v109 = v108;
        v111 = v110;
        v116 = map_point_inv((float32x2_t)__PAIR64__(v137.u32[1], v124), v137, COERCE_DOUBLE(__PAIR64__(v137.u32[1], LODWORD(v120))), a4, v112, v113, v114, v115);
        v70 = unionPointWithRect(v116, v105, v107, v109, v111);
        v102 = v117;
        v74 = v118;
        v103 = v119;
      }
    }
    v143.origin.x = v70;
    v143.origin.y = v102;
    v143.size.width = v74;
    v143.size.height = v103;
    *(CGRect *)&v25 = CGRectIntegral(v143);
  }
  result.size.height = v27;
  result.size.width = v24;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  float v8;
  float v9;
  double v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  CIImage *v17;
  double v18;
  id v19;
  CIImage *inputImage;
  uint64_t v21;
  _QWORD *v22;
  double width;
  double y;
  double x;
  double height;
  _QWORD v27[4];
  float v28;
  float v29;
  float v30;
  float v31;
  _QWORD v32[4];
  float v33;
  float v34;
  float v35;
  float v36;
  double v37[6];
  _QWORD v38[2];
  _QWORD v39[3];
  CGRect v40;
  CGRect v41;

  v39[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[CIVector X](self->inputCenter, "X");
  v4 = v3;
  -[CIVector Y](self->inputCenter, "Y");
  v6 = v5;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  if (fabsf(v9) < 0.001)
    return self->inputImage;
  v11 = v9;
  if (v9 > 2.0)
  {
    NSLog(CFSTR("Invalid scale %g in CIPinchDistortion, must be less than 2"), v9);
    return 0;
  }
  v12 = v4;
  v13 = v6;
  v14 = fmin(v11, 1.9);
  v15 = v14;
  if (fabsf(v8) >= 1.0)
  {
    *(float *)&v14 = v8;
    *(float *)&v11 = v15;
    -[CIPinchDistortion computeDOD:scale:](self, "computeDOD:scale:", v14, v11);
    v41 = CGRectIntegral(v40);
    y = v41.origin.y;
    x = v41.origin.x;
    width = v41.size.width;
    height = v41.size.height;
    v18 = v15;
    if (v15 >= 1.0)
    {
      v19 = -[CIPinchDistortion _pinchDistortionScaleGE1](self, "_pinchDistortionScaleGE1");
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __32__CIPinchDistortion_outputImage__block_invoke_2;
      v27[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v28 = v4;
      v29 = v13;
      v30 = v15;
      v31 = v8;
      inputImage = self->inputImage;
      v38[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v12, v13);
      v38[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v8, 1.0 / v8, v15, v18 * -0.5);
      v21 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v22 = v27;
    }
    else
    {
      v19 = -[CIPinchDistortion _pinchDistortionScaleLT1](self, "_pinchDistortionScaleLT1");
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __32__CIPinchDistortion_outputImage__block_invoke;
      v32[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v33 = v4;
      v34 = v13;
      v35 = v15;
      v36 = v8;
      inputImage = self->inputImage;
      v39[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v12, v13);
      v39[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v8, 1.0 / v8, v15, v18 * -0.5);
      v21 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v22 = v32;
    }
    return (id)objc_msgSend(v19, "applyWithExtent:roiCallback:inputImage:arguments:", v22, inputImage, v21, x, y, width, height);
  }
  else if (v15 >= 0.999)
  {
    return -[CIImage imageByClampingToExtent](-[CIImage imageByCroppingToRect:](self->inputImage, "imageByCroppingToRect:", floorf(v12), floorf(v13), 1.0, 1.0), "imageByClampingToExtent");
  }
  else
  {
    v37[1] = 0.0;
    v37[2] = 0.0;
    v16 = 1.0 / (float)(1.0 - v15);
    v17 = self->inputImage;
    v37[0] = v16;
    v37[3] = v16;
    v37[4] = (float)((float)(1.0 - v16) * v12);
    v37[5] = (float)((float)(1.0 - v16) * v13);
    return -[CIImage imageByApplyingTransform:](v17, "imageByApplyingTransform:", v37);
  }
}

double __32__CIPinchDistortion_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, float32x2_t a6)
{
  a6.i32[0] = *(_DWORD *)(a1 + 32);
  return regionOf(*(CGRect *)&a2, a6, *(float32_t *)(a1 + 36), *(float *)(a1 + 40), *(float *)(a1 + 44));
}

double __32__CIPinchDistortion_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5, float32x2_t a6)
{
  a6.i32[0] = *(_DWORD *)(a1 + 32);
  return regionOf(*(CGRect *)&a2, a6, *(float32_t *)(a1 + 36), *(float *)(a1 + 40), *(float *)(a1 + 44));
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
