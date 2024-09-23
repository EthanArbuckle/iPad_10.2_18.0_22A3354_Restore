@implementation CICircularWrap

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_circularWrap);
}

- (id)outputImage
{
  float v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  id result;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  double v21;
  float v22;
  double v23;
  float v24;
  __float2 v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  __float2 v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  int v48;
  signed int v49;
  double v50;
  double v51;
  float v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  int v62;
  float v63;
  double v64;
  double v65;
  double v66;
  double v67;
  id v68;
  CIImage *inputImage;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  _QWORD v82[8];
  _QWORD v83[6];

  v83[5] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  if (fabsf(v3) < 0.001 || !self->inputCenter)
    return self->inputImage;
  -[CIImage extent](self->inputImage, "extent");
  v8 = v7;
  result = 0;
  if (v7 <= 20000.0)
  {
    v10 = v6;
    if (v6 <= 20000.0)
    {
      v74 = v5;
      v75 = v4;
      -[NSNumber floatValue](self->inputRadius, "floatValue");
      if (v11 >= 0.01)
        v12 = v11;
      else
        v12 = 0.01;
      v72 = v10;
      v13 = v10 + v12 + -1.0;
      v79 = -v12;
      -[NSNumber floatValue](self->inputAngle, "floatValue");
      v73 = v8;
      v15 = (v8 + -1.0) / v12;
      v16 = v14 - v15;
      if (v14 >= v16)
        v17 = v14;
      else
        v17 = v14 - v15;
      v81 = v17;
      if (v14 >= v16)
        v18 = v16;
      else
        v18 = v14;
      v19 = v14 - v18;
      v20 = (v8 + -1.0) / (float)((float)(v16 - v18) - v19);
      v77 = v20;
      v78 = -(float)(v19 * v20);
      -[CIVector X](self->inputCenter, "X");
      v22 = v21;
      -[CIVector Y](self->inputCenter, "Y");
      v24 = v23;
      v25 = __sincosf_stret(v18);
      v26 = v22 + (float)(v12 * v25.__cosval);
      v27 = v24 + (float)(v12 * v25.__sinval);
      v76 = v13;
      v28 = v22 + (float)(v13 * v25.__cosval);
      v29 = v24 + (float)(v13 * v25.__sinval);
      if (v28 > v26)
        v30 = v22 + (float)(v13 * v25.__cosval);
      else
        v30 = v22 + (float)(v12 * v25.__cosval);
      if (v28 >= v26)
        v31 = v30;
      else
        v31 = v22 + (float)(v12 * v25.__cosval);
      if (v28 >= v26)
        v32 = v22 + (float)(v12 * v25.__cosval);
      else
        v32 = v28;
      if (v29 > v27)
        v33 = v29;
      else
        v33 = v24 + (float)(v12 * v25.__sinval);
      if (v29 >= v27)
        v34 = v33;
      else
        v34 = v24 + (float)(v12 * v25.__sinval);
      if (v29 >= v27)
        v35 = v24 + (float)(v12 * v25.__sinval);
      else
        v35 = v29;
      v36 = __sincosf_stret(v81);
      v37 = v22 + (float)(v12 * v36.__cosval);
      v38 = v24 + (float)(v12 * v36.__sinval);
      if (v37 > v31)
        v39 = v22 + (float)(v12 * v36.__cosval);
      else
        v39 = v31;
      if (v37 >= v32)
        v40 = v39;
      else
        v40 = v31;
      if (v37 >= v32)
        v37 = v32;
      if (v38 > v34)
        v41 = v24 + (float)(v12 * v36.__sinval);
      else
        v41 = v34;
      if (v38 >= v35)
        v42 = v41;
      else
        v42 = v34;
      if (v38 >= v35)
        v38 = v35;
      v43 = v22 + (float)(v76 * v36.__cosval);
      v44 = v24 + (float)(v76 * v36.__sinval);
      if (v43 > v40)
        v45 = v22 + (float)(v76 * v36.__cosval);
      else
        v45 = v40;
      if (v43 >= v37)
      {
        v46 = v37;
      }
      else
      {
        v45 = v40;
        v46 = v22 + (float)(v76 * v36.__cosval);
      }
      if (v44 > v42)
        v47 = v24 + (float)(v76 * v36.__sinval);
      else
        v47 = v42;
      if (v44 < v38)
        v47 = v42;
      v80 = v18;
      v48 = vcvtpd_s64_f64(v18 / 1.57079633);
      if (v44 < v38)
        v38 = v24 + (float)(v76 * v36.__sinval);
      v49 = vcvtpd_s64_f64(v81 / 1.57079633);
      if (v48 >= v49)
      {
        v59 = v74;
        v58 = v75;
        v61 = v72;
        v60 = v73;
      }
      else
      {
        v50 = v43;
        v51 = v44;
        if (v12 <= v76)
          v52 = v76;
        else
          v52 = v12;
        v53 = (float)(v24 - v52);
        v54 = (float)(v22 - v52);
        v55 = v24;
        v56 = (float)(v52 + v24);
        v57 = (float)(v52 + v22);
        v59 = v74;
        v58 = v75;
        v61 = v72;
        v60 = v73;
        do
        {
          if (v48 <= 0)
            v62 = -(-v48 & 3);
          else
            v62 = v48 & 3;
          switch(v62 + (v62 < 0 ? 4 : 0))
          {
            case 0:
              v51 = v55;
              v50 = v57;
              break;
            case 1:
              v51 = v56;
              goto LABEL_74;
            case 2:
              v51 = v55;
              v50 = v54;
              break;
            case 3:
              v51 = v53;
LABEL_74:
              v50 = v22;
              break;
            default:
              break;
          }
          if (v50 > v45)
            v63 = v50;
          else
            v63 = v45;
          if (v50 < v46)
            v46 = v50;
          else
            v45 = v63;
          if (v51 >= v38)
          {
            if (v51 > v47)
              v47 = v51;
          }
          else
          {
            v38 = v51;
          }
          ++v48;
        }
        while (v49 != v48);
      }
      v64 = v46;
      v65 = v38;
      v66 = (float)(v45 - v46);
      v67 = (float)(v47 - v38);
      v68 = -[CICircularWrap _kernel](self, "_kernel");
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __29__CICircularWrap_outputImage__block_invoke;
      v82[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v82[4] = v58;
      v82[5] = v59;
      *(double *)&v82[6] = v60;
      *(double *)&v82[7] = v61;
      inputImage = self->inputImage;
      v83[0] = self->inputCenter;
      v83[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v79 + 0.5);
      *(float *)&v70 = v77;
      v83[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
      v83[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v78 + 0.5);
      *(float *)&v71 = v80;
      v83[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
      return (id)objc_msgSend(v68, "applyWithExtent:roiCallback:inputImage:arguments:", v82, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 5), v64, v65, v66, v67);
    }
  }
  return result;
}

double __29__CICircularWrap_outputImage__block_invoke(CGRect *a1)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(a1[1], -1.0, -1.0);
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryDistortionEffect");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.5");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[0] = CFSTR("CIAttributeTypeDistance");
  v4[1] = &unk_1E2F18F80;
  v4[2] = &unk_1E2F18F80;
  v4[3] = &unk_1E2F18F90;
  v3[4] = CFSTR("CIAttributeDefault");
  v4[4] = &unk_1E2F18FA0;
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
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

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
