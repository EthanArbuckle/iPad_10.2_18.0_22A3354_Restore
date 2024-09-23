@implementation RAWRadialLensCorrectionRB

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
  v12.super_class = (Class)RAWRadialLensCorrectionRB;
  -[RAWRadialLensCorrectionRB setValue:forKey:](&v12, sel_setValue_forKey_, v6, v7);

}

+ (id)customAttributes
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _OWORD v19[4];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19[0] = xmmword_1D544A990;
  v19[1] = unk_1D544A9A0;
  v19[2] = xmmword_1D544A9B0;
  v19[3] = unk_1D544A9C0;
  objc_msgSend_vectorWithValues_count_(MEMORY[0x1E0C9DDF8], a2, (uint64_t)v19, 8, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("inputScalesR");
  v5 = *MEMORY[0x1E0C9DE40];
  v15[0] = *MEMORY[0x1E0C9DE10];
  v4 = v15[0];
  v15[1] = v5;
  v16[0] = v3;
  v16[1] = v3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v16, (uint64_t)v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("inputScalesB");
  v18[0] = v7;
  v13[0] = v4;
  v13[1] = v5;
  v14[0] = v3;
  v14[1] = v3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v14, (uint64_t)v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v18, (uint64_t)v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)makeMapImages
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  _WORD *v31;
  uint64_t i;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  CIImage *v42;
  CIImage *mapImg;

  if (!self->inputScalesR || !self->inputScalesB || self->mapImg)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend_count(self->inputScalesR, v4, v5, v6, v7);
      if (v8 == objc_msgSend_count(self->inputScalesB, v9, v10, v11, v12))
      {
        v17 = objc_msgSend_count(self->inputScalesR, v13, v14, v15, v16);
        if (v17 > 2)
        {
          v21 = v17;
          v22 = (4 * (_DWORD)v17 + 15) & 0xFFFFFFF0;
          objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v18, v22, v19, v20);
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v31 = (_WORD *)objc_msgSend_mutableBytes(v23, v24, v25, v26, v27);
          for (i = 0; i != v21; ++i)
          {
            objc_msgSend_valueAtIndex_(self->inputScalesR, v28, i, v29, v30);
            *(float *)&_D0 = _D0;
            __asm { FCVT            H0, S0 }
            *v31 = LOWORD(_D0);
            objc_msgSend_valueAtIndex_(self->inputScalesB, v38, i, v39, v40);
            *(float *)&_D0 = _D0;
            __asm { FCVT            H0, S0 }
            v31[1] = LOWORD(_D0);
            v31 += 2;
          }
          objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E0C9DDC8], v28, (uint64_t)v23, v22, *MEMORY[0x1E0C9E088], 0, (double)v21, 1.0);
          v42 = (CIImage *)objc_claimAutoreleasedReturnValue();
          mapImg = self->mapImg;
          self->mapImg = v42;

          return 1;
        }
        NSLog(CFSTR("RadialLensCorrectionFilterRB inputScalesR must be a vector with length greater than 2."));
      }
      else
      {
        NSLog(CFSTR("RadialLensCorrectionFilterRB inputScalesR length must be same as inputScalesB length."));
      }
    }
    else
    {
      NSLog(CFSTR("RadialLensCorrectionFilterRB inputScalesB must be of type CIVector."));
    }
  }
  else
  {
    NSLog(CFSTR("RadialLensCorrectionFilterRB inputScalesR must be of type CIVector."));
  }
  return 0;
}

- (id)outputImage
{
  CIImage *inputImage;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  long double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  float v50;
  float v51;
  float v52;
  float v53;
  double v54;
  double v55;
  double v56;
  CIVector *v57;
  CIVector *v58;
  CIImage *mapImg;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  CIImage *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v85;
  CIVector *v86;
  CIVector *v87;
  void *v88;
  id v89;
  _QWORD v90[4];
  CIVector *v91;
  CIVector *v92;
  uint64_t v93;
  float v94;
  float v95;
  float v96;
  float v97;
  _QWORD v98[5];
  uint8_t buf[8];
  _QWORD v100[5];

  v100[3] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (inputImage)
  {
    if (self->inputScalesR || self->inputScalesB)
    {
      sub_1D52EB19C();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D527F000, v5, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWRadialLensCorrectionRB", (const char *)&unk_1D548AF1A, buf, 2u);
      }

      v6 = MEMORY[0x1E0C809B0];
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = sub_1D5333860;
      v98[3] = &unk_1E996F870;
      v98[4] = self;
      v7 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v98);
      if ((objc_msgSend_makeMapImages(self, v8, v9, v10, v11) & 1) != 0)
      {
        objc_msgSend_extent(self->inputImage, v12, v13, v14, v15);
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        objc_msgSend_kernelWithName_(LCKernels, v24, (uint64_t)CFSTR("radialLensRB"), v25, v26);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = hypot(v21, v23);
        v32 = objc_msgSend_count(self->inputScalesR, v28, v29, v30, v31);
        v37 = objc_msgSend_count(self->inputScalesR, v33, v34, v35, v36);
        v87 = self->inputScalesR;
        v86 = self->inputScalesB;
        objc_msgSend_imageByClampingToExtent(self->inputImage, v38, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = self->inputColorSpace;
        v44 = (uint64_t)v43;
        if (v43)
        {
          CFAutorelease(v43);
          objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v42, v45, v44, v46, v47);
          v48 = objc_claimAutoreleasedReturnValue();

          v42 = (void *)v48;
        }
        v49 = 2.0 / v27;
        v50 = (float)(unint64_t)(v37 - 1);
        v51 = v49;
        v52 = v17 + v21 * 0.5;
        v53 = v19 + v23 * 0.5;
        v89 = v88;
        v54 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
        v85 = *MEMORY[0x1E0C9D5E0];
        v55 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
        v56 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
        v90[0] = v6;
        v90[1] = 3221225472;
        v90[2] = sub_1D53338E4;
        v90[3] = &unk_1E997EAA8;
        v94 = v52;
        v95 = v53;
        v96 = v51;
        v97 = v50;
        v57 = v87;
        v91 = v57;
        v58 = v86;
        v92 = v58;
        v93 = v32;
        mapImg = self->mapImg;
        v100[0] = v42;
        v100[1] = mapImg;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v60, v61, v62, v63, v52, v53, v51, v50);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v100[2] = v64;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v65, (uint64_t)v100, 3, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v89, v68, (uint64_t)v90, (uint64_t)v67, v69, v85, v54, v55, v56);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(self->inputImage, v71, v72, v73, v74);
        objc_msgSend_imageByCroppingToRect_(v70, v75, v76, v77, v78);
        v79 = (CIImage *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v79, v80, v44, v81, v82);
          v83 = objc_claimAutoreleasedReturnValue();

          v79 = (CIImage *)v83;
        }

      }
      else
      {
        v79 = 0;
      }
      v7[2](v7);

    }
    else
    {
      v79 = inputImage;
    }
  }
  else
  {
    v79 = 0;
  }
  return v79;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mapImg, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputLDCExecuteFlags, 0);
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputScalesB, 0);
  objc_storeStrong((id *)&self->inputScalesR, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
