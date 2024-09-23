@implementation RAWLensCorrectionVignetteFilter

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CIImage *vigImg;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, (uint64_t)CFSTR("inputVignetteTable"), v9, v10))
  {
    vigImg = self->vigImg;
    self->vigImg = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)RAWLensCorrectionVignetteFilter;
  -[RAWLensCorrectionVignetteFilter setValue:forKey:](&v12, sel_setValue_forKey_, v6, v7);

}

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  _QWORD v9[7];
  _QWORD v10[7];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("inputVignetteAmount");
  v2 = *MEMORY[0x1E0C9DE60];
  v9[0] = *MEMORY[0x1E0C9DE50];
  v9[1] = v2;
  v10[0] = &unk_1E99CC228;
  v10[1] = &unk_1E99CC228;
  v3 = *MEMORY[0x1E0C9DE48];
  v9[2] = *MEMORY[0x1E0C9DE58];
  v9[3] = v3;
  v10[2] = &unk_1E99CC238;
  v10[3] = &unk_1E99CC238;
  v4 = *MEMORY[0x1E0C9DE40];
  v9[4] = *MEMORY[0x1E0C9DE10];
  v9[5] = v4;
  v10[4] = &unk_1E99CC238;
  v10[5] = &unk_1E99CC238;
  v9[6] = *MEMORY[0x1E0C9DE68];
  v10[6] = *MEMORY[0x1E0C9DED0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v10, (uint64_t)v9, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v12, (uint64_t)&v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

- (BOOL)makeMapImages
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const float *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float32x4_t *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  float32x4_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  CIImage *v32;
  CIImage *vigImg;

  if (!self->inputVignetteTable || self->vigImg)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend_length(self->inputVignetteTable, v3, v4, v5, v6);
    v12 = (const float *)objc_msgSend_bytes(self->inputVignetteTable, v8, v9, v10, v11);
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v13, (4 * v7) & 0xFFFFFFFFFFFFFFF0, v14, v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (float32x4_t *)objc_msgSend_mutableBytes(v16, v17, v18, v19, v20);
    v26 = v7 >> 2;
    if (v7 >= 4)
    {
      if (v26 <= 1)
        v27 = 1;
      else
        v27 = v7 >> 2;
      do
      {
        v28 = vld1q_dup_f32(v12++);
        *v21++ = v28;
        --v27;
      }
      while (v27);
    }
    v29 = (void *)MEMORY[0x1E0C9DDC8];
    v30 = objc_msgSend_length(v16, v22, v23, v24, v25);
    objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(v29, v31, (uint64_t)v16, v30, *MEMORY[0x1E0C9E078], 0, (double)v26, 1.0);
    v32 = (CIImage *)objc_claimAutoreleasedReturnValue();
    vigImg = self->vigImg;
    self->vigImg = v32;

    return 1;
  }
  NSLog(CFSTR("LensCorrectionFilter inputVignetteMap must be of type NSData."));
  return 0;
}

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  double v19;
  CIImage *v20;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  float v40;
  float v41;
  float v42;
  float v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  CIImage *inputImage;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  _QWORD v66[4];
  uint64_t v67;
  _QWORD v68[5];
  uint8_t buf[8];
  _QWORD v70[3];

  v70[2] = *MEMORY[0x1E0C80C00];
  sub_1D52EB19C();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLensCorrectionVignetteFilter", (const char *)&unk_1D548AF1A, buf, 2u);
  }

  v5 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = sub_1D52A1220;
  v68[3] = &unk_1E996F870;
  v68[4] = self;
  v10 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v68);
  if (self->inputImage && (objc_msgSend_makeMapImages(self, v6, v7, v8, v9) & 1) != 0)
  {
    objc_msgSend_floatValue(self->inputVignetteAmount, v11, v12, v13, v14);
    if (self->vigImg && (v19 = fminf(fmaxf(v18, 0.0), 1.0), v19 >= 0.001))
    {
      objc_msgSend_kernelWithName_(LCKernels, v15, (uint64_t)CFSTR("lensCorrect_vig"), v16, v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extent(self->inputImage, v23, v24, v25, v26);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      objc_msgSend_extent(self->vigImg, v35, v36, v37, v38);
      v40 = v39;
      v41 = v32 * 0.5;
      v42 = v34 * 0.5;
      v43 = hypotf(v41, v42);
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v44, v45, v46, v47, v28 + v32 * 0.5, v30 + v34 * 0.5, (float)((float)(v40 + -1.0) / v43), v19);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      inputImage = self->inputImage;
      objc_msgSend_extent(inputImage, v50, v51, v52, v53);
      v55 = v54;
      v57 = v56;
      v59 = v58;
      v61 = v60;
      v66[0] = v5;
      v66[1] = 3221225472;
      v66[2] = sub_1D52A12A4;
      v66[3] = &unk_1E9971F30;
      *(float *)&v67 = v40;
      v70[0] = self->vigImg;
      v70[1] = v48;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v62, (uint64_t)v70, 2, v63, v5, 3221225472, sub_1D52A12A4, &unk_1E9971F30, v67);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v65, (uint64_t)v22, (uint64_t)inputImage, (uint64_t)v66, v64, self->inputColorSpace, v55, v57, v59, v61);
      v20 = (CIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = self->inputImage;
    }
  }
  else
  {
    v20 = 0;
  }
  v10[2](v10);

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->vigImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputVignetteAmount, 0);
  objc_storeStrong((id *)&self->inputVignetteTable, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
