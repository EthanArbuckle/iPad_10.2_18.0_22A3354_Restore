@implementation RAWLocalToneMap

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[6];
  _QWORD v44[5];
  _QWORD v45[7];
  _QWORD v46[9];

  v46[7] = *MEMORY[0x1E0C80C00];
  v45[0] = *MEMORY[0x1E0C9DE30];
  v3 = *MEMORY[0x1E0C9DF28];
  v44[0] = *MEMORY[0x1E0C9DF08];
  v44[1] = v3;
  v4 = *MEMORY[0x1E0C9DEF8];
  v44[2] = *MEMORY[0x1E0C9DF30];
  v44[3] = v4;
  v44[4] = *MEMORY[0x1E0C9DEE8];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v44, 5, v2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v27;
  v45[1] = CFSTR("inputAmount");
  v6 = *MEMORY[0x1E0C9DE60];
  v38[0] = *MEMORY[0x1E0C9DE50];
  v5 = v38[0];
  v38[1] = v6;
  v43[0] = &unk_1E99CC198;
  v43[1] = &unk_1E99CC198;
  v8 = *MEMORY[0x1E0C9DE48];
  v39 = *MEMORY[0x1E0C9DE58];
  v7 = v39;
  v40 = v8;
  v43[2] = &unk_1E99CC1A8;
  v43[3] = &unk_1E99CC1B8;
  v10 = *MEMORY[0x1E0C9DE68];
  v41 = *MEMORY[0x1E0C9DE10];
  v9 = v41;
  v42 = v10;
  v11 = *MEMORY[0x1E0C9DED0];
  v43[4] = &unk_1E99CC1C8;
  v43[5] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v43, (uint64_t)v38, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v26;
  v45[2] = CFSTR("inputShadowAmount");
  v36[0] = v5;
  v36[1] = v6;
  v37[0] = &unk_1E99CC198;
  v37[1] = &unk_1E99CC198;
  v36[2] = v7;
  v36[3] = v8;
  v37[2] = &unk_1E99CC1A8;
  v37[3] = &unk_1E99CC1B8;
  v36[4] = v9;
  v36[5] = v10;
  v37[4] = &unk_1E99CC1C8;
  v37[5] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v37, (uint64_t)v36, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v25;
  v45[3] = CFSTR("inputHighlightAmount");
  v34[0] = v5;
  v34[1] = v6;
  v35[0] = &unk_1E99CC198;
  v35[1] = &unk_1E99CC198;
  v34[2] = v7;
  v34[3] = v8;
  v35[2] = &unk_1E99CC1A8;
  v35[3] = &unk_1E99CC1B8;
  v34[4] = v9;
  v34[5] = v10;
  v35[4] = &unk_1E99CC1C8;
  v35[5] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v35, (uint64_t)v34, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v24;
  v45[4] = CFSTR("inputShadowCutoff");
  v32[0] = v5;
  v32[1] = v6;
  v33[0] = &unk_1E99CC198;
  v33[1] = &unk_1E99CC198;
  v32[2] = v7;
  v32[3] = v8;
  v33[2] = &unk_1E99CC1C8;
  v33[3] = &unk_1E99CC1C8;
  v32[4] = v9;
  v32[5] = v10;
  v33[4] = &unk_1E99CC1D8;
  v33[5] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v33, (uint64_t)v32, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v23;
  v45[5] = CFSTR("inputHighlightCutoff");
  v30[0] = v5;
  v30[1] = v6;
  v31[0] = &unk_1E99CC198;
  v31[1] = &unk_1E99CC198;
  v30[2] = v7;
  v30[3] = v8;
  v31[2] = &unk_1E99CC1C8;
  v31[3] = &unk_1E99CC1C8;
  v30[4] = v9;
  v30[5] = v10;
  v31[4] = &unk_1E99CC1E8;
  v31[5] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v31, (uint64_t)v30, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = CFSTR("inputBlurRadius");
  v46[5] = v17;
  v28[0] = v5;
  v28[1] = v6;
  v29[0] = &unk_1E99CC1F8;
  v29[1] = &unk_1E99CC1B8;
  v28[2] = v7;
  v28[3] = v8;
  v29[2] = &unk_1E99CC208;
  v29[3] = &unk_1E99CC208;
  v28[4] = v9;
  v28[5] = v10;
  v29[4] = &unk_1E99CC218;
  v29[5] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v29, (uint64_t)v28, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v19;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v46, (uint64_t)v45, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)makeToneCurveImage
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  CIImage *v28;
  CIImage *tcImage;
  id v31;

  if (!self->tcImage)
  {
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], a2, 200, v2, v3);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend_mutableBytes(v31, v5, v6, v7, v8);
    for (i = 0; i != 50; ++i)
    {
      objc_msgSend_floatValue(self->inputAmount, v9, v10, v11, v12);
      *(_DWORD *)(v13 + 4 * i) = v15;
      objc_msgSend_floatValue(self->inputShadowCutoff, v16, v17, v18, v19);
      if ((float)(v24 * 50.0) > (float)(int)i)
      {
        objc_msgSend_floatValue(self->inputShadowAmount, v20, v21, v22, v23);
        *(float *)(v13 + 4 * i) = v25 * *(float *)(v13 + 4 * i);
      }
      objc_msgSend_floatValue(self->inputHighlightCutoff, v20, v21, v22, v23);
      if ((float)(v26 * 50.0) < (float)(int)i)
      {
        objc_msgSend_floatValue(self->inputHighlightAmount, v9, v10, v11, v12);
        *(float *)(v13 + 4 * i) = v27 * *(float *)(v13 + 4 * i);
      }
    }
    objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E0C9DDC8], v9, (uint64_t)v31, 200, *MEMORY[0x1E0C9E090], 0, 50.0, 1.0);
    v28 = (CIImage *)objc_claimAutoreleasedReturnValue();
    tcImage = self->tcImage;
    self->tcImage = v28;

  }
  return 1;
}

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  float v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  float v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  CIImage *inputImage;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  NSNumber *inputBlurRadius;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  CIImage *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  void (**v73)(_QWORD);
  void *v74;
  _QWORD v75[5];
  uint8_t buf[8];
  _QWORD v77[3];
  const __CFString *v78;
  NSNumber *v79;
  _QWORD v80[2];
  const __CFString *v81;
  _QWORD v82[3];

  v82[1] = *MEMORY[0x1E0C80C00];
  if (qword_1EFF32600 != -1)
    dispatch_once(&qword_1EFF32600, &unk_1E9971328);
  if (self->inputImage)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLocalToneMap", (const char *)&unk_1D548AF1A, buf, 2u);
    }

    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = sub_1D52954C4;
    v75[3] = &unk_1E996F870;
    v75[4] = self;
    v73 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v75);
    v5 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend_floatValue(self->inputHighlightAmount, v6, v7, v8, v9);
    v11 = v10;
    objc_msgSend_floatValue(self->inputHighlightCutoff, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_floatValue(self->inputShadowAmount, v18, v19, v20, v21);
    v23 = v22;
    objc_msgSend_floatValue(self->inputShadowCutoff, v24, v25, v26, v27);
    objc_msgSend_vectorWithX_Y_Z_W_(v5, v29, v30, v31, v32, v11, v17, v23, v28);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend_floatValue(self->inputAmount, v34, v35, v36, v37);
    objc_msgSend_vectorWithX_Y_Z_W_(v33, v39, v40, v41, v42, v38, 0.0, 0.0, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    inputImage = self->inputImage;
    v81 = CFSTR("inputRadius");
    v82[0] = self->inputBlurRadius;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v45, (uint64_t)v82, (uint64_t)&v81, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingFilter_withInputParameters_(inputImage, v47, (uint64_t)CFSTR("CIGaussianBlur"), (uint64_t)v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = qword_1EFF32610;
    v80[0] = v74;
    v80[1] = v43;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v51, (uint64_t)v80, 2, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v54, v50, (uint64_t)v49, (uint64_t)v53, self->inputColorSpace, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    inputBlurRadius = self->inputBlurRadius;
    v78 = CFSTR("inputRadius");
    v79 = inputBlurRadius;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v57, (uint64_t)&v79, (uint64_t)&v78, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingFilter_withInputParameters_(v55, v59, (uint64_t)CFSTR("CIGaussianBlur"), (uint64_t)v58, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_samplerWithImage_keysAndValues_(MEMORY[0x1E0C9DDF0], v62, (uint64_t)v61, *MEMORY[0x1E0C9E2B0], v63, self->inputColorSpace, 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = qword_1EFF32608;
    v66 = self->inputImage;
    v77[0] = v64;
    v77[1] = v74;
    v77[2] = v43;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v67, (uint64_t)v77, 3, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v70, v65, (uint64_t)v66, (uint64_t)v69, self->inputColorSpace, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    v73[2](v73);
  }
  else
  {
    v71 = 0;
  }
  return v71;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tcImage, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputBlurRadius, 0);
  objc_storeStrong((id *)&self->inputAmount, 0);
  objc_storeStrong((id *)&self->inputHighlightCutoff, 0);
  objc_storeStrong((id *)&self->inputShadowCutoff, 0);
  objc_storeStrong((id *)&self->inputHighlightAmount, 0);
  objc_storeStrong((id *)&self->inputShadowAmount, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
