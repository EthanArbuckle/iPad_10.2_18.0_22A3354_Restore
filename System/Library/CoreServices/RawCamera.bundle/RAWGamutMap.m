@implementation RAWGamutMap

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v28[0] = MEMORY[0x1E0C9AA70];
  v27[0] = CFSTR("inputColorSpace");
  v27[1] = CFSTR("inputShouldWarn");
  v3 = *MEMORY[0x1E0C9DE68];
  v25[0] = *MEMORY[0x1E0C9DE10];
  v2 = v25[0];
  v25[1] = v3;
  v4 = *MEMORY[0x1E0C9DE78];
  v26[0] = MEMORY[0x1E0C9AAA0];
  v26[1] = v4;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v26, (uint64_t)v25, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v5;
  v27[2] = CFSTR("inputVersion");
  v23[0] = *MEMORY[0x1E0C9DE08];
  v6 = v23[0];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9DE50];
  v24[0] = v8;
  v24[1] = &unk_1E99CB3E8;
  v10 = *MEMORY[0x1E0C9DE48];
  v23[1] = v9;
  v23[2] = v10;
  v24[2] = &unk_1E99CB400;
  v24[3] = &unk_1E99CB3E8;
  v23[3] = v2;
  v23[4] = v3;
  v11 = *MEMORY[0x1E0C9DED0];
  v23[5] = *MEMORY[0x1E0C9DE18];
  v24[4] = v11;
  v24[5] = CFSTR("inputVersion");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v24, (uint64_t)v23, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v13;
  v27[3] = CFSTR("inputGamutMapMax");
  v21[0] = v6;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  v22[1] = &unk_1E99CB418;
  v21[1] = v2;
  v21[2] = v3;
  v22[2] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v22, (uint64_t)v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v28, (uint64_t)v27, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
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
  CIImage *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSNumber *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  NSNumber *inputGamutMapMax;
  const char *v27;
  uint64_t v28;
  _QWORD v30[5];
  uint8_t buf[8];
  _QWORD v32[6];
  _QWORD v33[7];

  v33[6] = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWGamutMap", (const char *)&unk_1D548AF1A, buf, 2u);
    }

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1D536F3B8;
    v30[3] = &unk_1E996F870;
    v30[4] = self;
    v5 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v30);
    v6 = self->inputImage;
    if (objc_msgSend_BOOLValue(self->inputShouldWarn, v7, v8, v9, v10))
    {
      objc_msgSend_kernelWithName_(GMKernels, v11, (uint64_t)CFSTR("gamutWarning"), v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v16, (uint64_t)v15, (uint64_t)v6, 0, self->inputColorSpace, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((int)objc_msgSend_intValue(self->inputVersion, v11, v12, v13, v14) < 7)
      {
        objc_msgSend_kernelWithName_(GMKernels, v18, (uint64_t)CFSTR("gmKernel_v6"), v19, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = &unk_1E99CC318;
        v32[1] = &unk_1E99CC328;
        v32[2] = &unk_1E99CC2E8;
        v32[3] = &unk_1E99CC338;
        inputGamutMapMax = self->inputGamutMapMax;
        v32[4] = &unk_1E99CC348;
        v32[5] = inputGamutMapMax;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v32, 6, v28);
      }
      else
      {
        objc_msgSend_kernelWithName_(GMKernels, v18, (uint64_t)CFSTR("gmKernel_v7"), v19, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = &unk_1E99CC2C8;
        v33[1] = &unk_1E99CC2D8;
        v33[2] = &unk_1E99CC2E8;
        v33[3] = &unk_1E99CC2F8;
        v21 = self->inputGamutMapMax;
        v33[4] = &unk_1E99CC308;
        v33[5] = v21;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v33, 6, v23);
      }
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v25, (uint64_t)v15, (uint64_t)v6, v24, self->inputColorSpace, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (CIImage *)v24;
    }

    v5[2](v5);
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputGamutMapMax, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputShouldWarn, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
