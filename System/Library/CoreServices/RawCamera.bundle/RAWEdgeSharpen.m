@implementation RAWEdgeSharpen

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  objc_class *v14;
  const char *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
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
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[4];
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v37[0] = CFSTR("inputColorSpace");
  v34 = *MEMORY[0x1E0C9DE10];
  v2 = v34;
  v3 = sub_1D543E528(a1);
  v35 = *MEMORY[0x1E0C9DE18];
  v4 = v35;
  v36[0] = v3;
  v36[1] = CFSTR("inputColorSpace");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v36, (uint64_t)&v34, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v27;
  v37[1] = CFSTR("inputVersion");
  v32[0] = *MEMORY[0x1E0C9DE08];
  v6 = v32[0];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9DE50];
  v24 = (void *)v8;
  v33[0] = v8;
  v33[1] = &unk_1E99CC518;
  v10 = *MEMORY[0x1E0C9DE48];
  v32[1] = v9;
  v32[2] = v10;
  v33[2] = &unk_1E99CC528;
  v33[3] = &unk_1E99CC538;
  v11 = *MEMORY[0x1E0C9DE68];
  v32[3] = v2;
  v32[4] = v11;
  v12 = *MEMORY[0x1E0C9DED0];
  v32[5] = v4;
  v33[4] = v12;
  v33[5] = CFSTR("inputVersion");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v33, (uint64_t)v32, 6);
  v39 = objc_claimAutoreleasedReturnValue();
  v37[2] = CFSTR("inputPreSharpenAmount");
  v30[0] = v6;
  v26 = (void *)v39;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v31[1] = &unk_1E99CC548;
  v30[1] = v9;
  v30[2] = v10;
  v31[2] = &unk_1E99CC558;
  v31[3] = &unk_1E99CC548;
  v30[3] = v2;
  v30[4] = v11;
  v30[5] = v4;
  v31[4] = v12;
  v31[5] = CFSTR("inputPreSharpenAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v31, (uint64_t)v30, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v16;
  v37[3] = CFSTR("inputPreSharpenBlurAmount");
  v28[0] = v6;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v29[1] = &unk_1E99CC568;
  v28[1] = v9;
  v28[2] = v10;
  v29[2] = &unk_1E99CC578;
  v29[3] = &unk_1E99CC548;
  v28[3] = v2;
  v28[4] = v11;
  v28[5] = v4;
  v29[4] = v12;
  v29[5] = CFSTR("inputPreSharpenBlurAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v29, (uint64_t)v28, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v20;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v38, (uint64_t)v37, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](v2, sel_customAttributes, v3, v4, v5);
}

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  void (**v5)(_QWORD);
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  CIImage *v21;
  void *v22;
  CIImage *inputImage;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  _QWORD v46[5];
  uint8_t buf[16];
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWEdgeSharpen", (const char *)&unk_1D548AF1A, buf, 2u);
    }

    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = sub_1D544400C;
    v46[3] = &unk_1E996F870;
    v46[4] = self;
    v5 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v46);
    objc_msgSend_doubleValue(self->inputPreSharpenAmount, v6, v7, v8, v9);
    v11 = v10;
    objc_msgSend_doubleValue(self->inputPreSharpenBlurAmount, v12, v13, v14, v15);
    v20 = v19;
    if (fabs(v11) >= 0.001 || fabs(v19) >= 0.001)
    {
      objc_msgSend_kernelWithName_(RAWKernels, v16, (uint64_t)CFSTR("simpleSharpenLNR"), v17, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      inputImage = self->inputImage;
      objc_msgSend_extent(inputImage, v24, v25, v26, v27);
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v36, v37, v38, v39, v20, v11);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v40;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v41, (uint64_t)v48, 1, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v44, (uint64_t)v22, (uint64_t)inputImage, (uint64_t)&unk_1E99A6F60, v43, self->inputColorSpace, v29, v31, v33, v35);
      v21 = (CIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = self->inputImage;
    }
    v5[2](v5);

  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputPreSharpenBlurAmount, 0);
  objc_storeStrong((id *)&self->inputPreSharpenAmount, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
