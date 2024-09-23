@implementation RAWRadialLensCorrection

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CIImage *mapImg;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, (uint64_t)CFSTR("inputScales"), v9, v10))
  {
    mapImg = self->mapImg;
    self->mapImg = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)RAWRadialLensCorrection;
  -[RAWRadialLensCorrection setValue:forKey:](&v12, sel_setValue_forKey_, v6, v7);

}

+ (id)customAttributes
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  const __CFString *v12;
  void *v13;
  _OWORD v14[4];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14[0] = xmmword_1D544A990;
  v14[1] = unk_1D544A9A0;
  v14[2] = xmmword_1D544A9B0;
  v14[3] = unk_1D544A9C0;
  objc_msgSend_vectorWithValues_count_(MEMORY[0x1E0C9DDF8], a2, (uint64_t)v14, 8, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("inputScales");
  v4 = *MEMORY[0x1E0C9DE40];
  v10[0] = *MEMORY[0x1E0C9DE10];
  v10[1] = v4;
  v11[0] = v3;
  v11[1] = v3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v11, (uint64_t)v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)&v13, (uint64_t)&v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)makeMapImages
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  CIImage *v29;
  CIImage *mapImg;

  if (!self->inputScales || self->mapImg)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend_count(self->inputScales, v4, v5, v6, v7);
    if (v8 > 2)
    {
      v12 = v8;
      v13 = (8 * (_DWORD)v8 + 15) & 0xFFFFFFF0;
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v9, v13, v10, v11);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = objc_msgSend_mutableBytes(v14, v15, v16, v17, v18);
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_valueAtIndex_(self->inputScales, v19, i, v20, v21);
        *(float *)&_D0 = _D0;
        __asm { FCVT            H0, S0 }
        *(int16x4_t *)(v22 + 8 * i) = vdup_lane_s16(*(int16x4_t *)&_D0, 0);
      }
      objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E0C9DDC8], v19, (uint64_t)v14, v13, *MEMORY[0x1E0C9E080], 0, (double)v12, 1.0);
      v29 = (CIImage *)objc_claimAutoreleasedReturnValue();
      mapImg = self->mapImg;
      self->mapImg = v29;

      return 1;
    }
    NSLog(CFSTR("RadialLensCorrectionFilter inputScales must be a vector with length greater than 2."));
  }
  else
  {
    NSLog(CFSTR("RadialLensCorrectionFilter inputScales must be of type CIVector."));
  }
  return 0;
}

- (id)outputImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CIImage *inputImage;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  long double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  float v60;
  float v61;
  float v62;
  float v63;
  void *v64;
  id v65;
  double v66;
  double v67;
  double v68;
  CIVector *v69;
  CIImage *mapImg;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v96;
  CIVector *v97;
  void *v98;
  void *v99;
  _QWORD v100[4];
  CIVector *v101;
  uint64_t v102;
  float v103;
  float v104;
  float v105;
  float v106;
  _QWORD v107[5];
  uint8_t buf[8];
  _QWORD v109[5];

  v109[3] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (inputImage)
  {
    if (self->inputScales)
    {
      if (objc_msgSend_intValue(self->inputLDCExecuteFlags, a2, v2, v3, v4))
      {
        sub_1D52EB19C();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v7))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D527F000, v8, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWRadialLensCorrection", (const char *)&unk_1D548AF1A, buf, 2u);
        }

        v9 = MEMORY[0x1E0C809B0];
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = sub_1D5332B6C;
        v107[3] = &unk_1E996F870;
        v107[4] = self;
        v10 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v107);
        if ((objc_msgSend_makeMapImages(self, v11, v12, v13, v14) & 1) != 0)
        {
          objc_msgSend_extent(self->inputImage, v15, v16, v17, v18);
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v26 = v25;
          objc_msgSend_kernelWithName_(LCKernels, v27, (uint64_t)CFSTR("radialLens"), v28, v29);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_kernelWithName_(LCKernels, v30, (uint64_t)CFSTR("radialLensDraft"), v31, v32);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = hypot(v24, v26);
          v38 = objc_msgSend_count(self->inputScales, v34, v35, v36, v37);
          v43 = objc_msgSend_count(self->inputScales, v39, v40, v41, v42);
          v97 = self->inputScales;
          objc_msgSend_imageByClampingToExtent(self->inputImage, v44, v45, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = self->inputColorSpace;
          v54 = (uint64_t)v49;
          if (v49)
          {
            CFAutorelease(v49);
            objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v48, v55, v54, v56, v57);
            v58 = objc_claimAutoreleasedReturnValue();

            v48 = (void *)v58;
          }
          v59 = objc_msgSend_BOOLValue(self->inputDraftMode, v50, v51, v52, v53);
          v60 = 2.0 / v33;
          v61 = (float)(unint64_t)(v43 - 1);
          v62 = v20 + v24 * 0.5;
          v63 = v22 + v26 * 0.5;
          v64 = v99;
          if (v59)
            v64 = v98;
          v65 = v64;
          v66 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
          v96 = *MEMORY[0x1E0C9D5E0];
          v67 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
          v68 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
          v100[0] = v9;
          v100[1] = 3221225472;
          v100[2] = sub_1D5332BF0;
          v100[3] = &unk_1E997EA80;
          v103 = v62;
          v104 = v63;
          v105 = v60;
          v106 = v61;
          v69 = v97;
          v101 = v69;
          v102 = v38;
          mapImg = self->mapImg;
          v109[0] = v48;
          v109[1] = mapImg;
          objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v71, v72, v73, v74, v62, v63, v60, v61);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v109[2] = v75;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v76, (uint64_t)v109, 3, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_applyWithExtent_roiCallback_arguments_(v65, v79, (uint64_t)v100, (uint64_t)v78, v80, v96, v66, v67, v68);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_extent(self->inputImage, v82, v83, v84, v85);
          objc_msgSend_imageByCroppingToRect_(v81, v86, v87, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v90, v91, v54, v92, v93);
            v94 = objc_claimAutoreleasedReturnValue();

            v90 = (void *)v94;
          }

        }
        else
        {
          v90 = 0;
        }
        v10[2](v10);

        return v90;
      }
      inputImage = self->inputImage;
    }
    return inputImage;
  }
  v90 = 0;
  return v90;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mapImg, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputLDCExecuteFlags, 0);
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputScales, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
