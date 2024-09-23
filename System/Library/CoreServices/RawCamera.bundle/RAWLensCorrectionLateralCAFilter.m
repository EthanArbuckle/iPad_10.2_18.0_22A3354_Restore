@implementation RAWLensCorrectionLateralCAFilter

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
  if (objc_msgSend_hasPrefix_(v7, v8, (uint64_t)CFSTR("inputLateralCAMap"), v9, v10))
  {
    mapImg = self->mapImg;
    self->mapImg = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)RAWLensCorrectionLateralCAFilter;
  -[RAWLensCorrectionLateralCAFilter setValue:forKey:](&v12, sel_setValue_forKey_, v6, v7);

}

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[6];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("inputLateralCAAmount");
  v2 = *MEMORY[0x1E0C9DE60];
  v10[0] = *MEMORY[0x1E0C9DE50];
  v10[1] = v2;
  v11[0] = &unk_1E99CC228;
  v11[1] = &unk_1E99CC228;
  v3 = *MEMORY[0x1E0C9DE48];
  v10[2] = *MEMORY[0x1E0C9DE58];
  v10[3] = v3;
  v4 = *MEMORY[0x1E0C9DE68];
  v10[4] = *MEMORY[0x1E0C9DE10];
  v10[5] = v4;
  v11[2] = &unk_1E99CC238;
  v11[3] = &unk_1E99CC238;
  v5 = *MEMORY[0x1E0C9DED0];
  v11[4] = &unk_1E99CC238;
  v11[5] = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v11, (uint64_t)v10, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v13, (uint64_t)&v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  CIImage *v20;
  CIImage *mapImg;

  if (!self->inputLateralCAMap || self->mapImg)
    return 1;
  v7 = objc_msgSend_unsignedIntValue(self->inputLateralCAMapWidth, a2, v2, v3, v4);
  v12 = objc_msgSend_unsignedIntValue(self->inputLateralCAMapHeight, v8, v9, v10, v11);
  if (v7 >= 4 && v12 > 3)
  {
    v14 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend_length(self->inputLateralCAMap, v15, v16, v17, v18) == 4 * 4 * v7 * v14)
      {
        objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E0C9DDC8], v19, (uint64_t)self->inputLateralCAMap, 16 * v7, *MEMORY[0x1E0C9E078], 0, (double)v7, (double)v14);
        v20 = (CIImage *)objc_claimAutoreleasedReturnValue();
        mapImg = self->mapImg;
        self->mapImg = v20;

        return 1;
      }
      NSLog(CFSTR("LensCorrectionFilter inputLateralCAMap is not of the expected length."));
    }
    else
    {
      NSLog(CFSTR("LensCorrectionFilter inputLateralCAMap must be of type NSData."));
    }
  }
  else
  {
    NSLog(CFSTR("LensCorrectionFilter inputLateralCAMapWidth/Height must be greater than 3."));
  }
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
  float v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  CIImage *inputImage;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  CIImage *v77;
  _QWORD v79[5];
  id v80;
  double v81;
  double v82;
  double v83;
  double v84;
  float v85;
  double v86[3];
  double v87;
  double v88;
  double v89;
  _QWORD v90[5];
  uint8_t buf[8];
  _QWORD v92[3];

  v92[2] = *MEMORY[0x1E0C80C00];
  sub_1D52EB19C();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLensCorrectionLateralCAFilter", (const char *)&unk_1D548AF1A, buf, 2u);
  }

  v5 = MEMORY[0x1E0C809B0];
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = sub_1D52A1ABC;
  v90[3] = &unk_1E996F870;
  v90[4] = self;
  v10 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v90);
  if (self->inputImage && (objc_msgSend_makeMapImages(self, v6, v7, v8, v9) & 1) != 0)
  {
    objc_msgSend_floatValue(self->inputLateralCAAmount, v11, v12, v13, v14);
    if (self->mapImg && (v19 = fminf(fmaxf(v18, 0.0), 1.0), v19 >= 0.001))
    {
      objc_msgSend_kernelWithName_(LCKernels, v15, (uint64_t)CFSTR("lensCorrect_lca"), v16, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extent(self->inputImage, v21, v22, v23, v24);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v33, v34, v35, v36, v25 + v29 * 0.5, v27 + v31 * 0.5, v29 * 0.5, v31 * 0.5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(self->inputLateralCAMapWidth, v38, v39, v40, v41);
      v43 = v42;
      objc_msgSend_doubleValue(self->inputLateralCAMapHeight, v44, v45, v46, v47);
      v49 = v48;
      objc_msgSend_imageByClampingToExtent(self->mapImg, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = v30 / (v43 + -1.0);
      v86[1] = 0.0;
      v86[2] = 0.0;
      v87 = v32 / (v49 + -1.0);
      v88 = v86[0] * -0.5;
      v89 = v87 * -0.5;
      objc_msgSend_imageByApplyingTransform_(v54, v55, (uint64_t)v86, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v79[0] = v5;
      v79[1] = 3221225472;
      v79[2] = sub_1D52A1D90;
      v79[3] = &unk_1E9971F98;
      v79[4] = self;
      v80 = &unk_1E9971F70;
      v81 = v26;
      v82 = v28;
      v83 = v30;
      v84 = v32;
      v85 = v19;
      v59 = (void *)MEMORY[0x1D82721B4](v79);
      inputImage = self->inputImage;
      objc_msgSend_extent(inputImage, v61, v62, v63, v64);
      v66 = v65;
      v68 = v67;
      v70 = v69;
      v72 = v71;
      v92[0] = v58;
      v92[1] = v37;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v73, (uint64_t)v92, 2, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v76, (uint64_t)v20, (uint64_t)inputImage, (uint64_t)v59, v75, self->inputColorSpace, v66, v68, v70, v72);
      v77 = (CIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v77 = self->inputImage;
    }
  }
  else
  {
    v77 = 0;
  }
  v10[2](v10);

  return v77;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mapImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputLateralCAMapHeight, 0);
  objc_storeStrong((id *)&self->inputLateralCAMapWidth, 0);
  objc_storeStrong((id *)&self->inputLateralCAMap, 0);
  objc_storeStrong((id *)&self->inputLateralCAAmount, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
