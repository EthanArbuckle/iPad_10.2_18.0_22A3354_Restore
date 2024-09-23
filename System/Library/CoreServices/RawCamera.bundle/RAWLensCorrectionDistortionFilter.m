@implementation RAWLensCorrectionDistortionFilter

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
  if (objc_msgSend_hasPrefix_(v7, v8, (uint64_t)CFSTR("inputDistortionMap"), v9, v10))
  {
    mapImg = self->mapImg;
    self->mapImg = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)RAWLensCorrectionDistortionFilter;
  -[RAWLensCorrectionDistortionFilter setValue:forKey:](&v12, sel_setValue_forKey_, v6, v7);

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
  v11 = CFSTR("inputDistortionAmount");
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
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  CIImage *v40;
  CIImage *mapImg;

  if (!self->inputDistortionMap || self->mapImg)
    return 1;
  v7 = objc_msgSend_unsignedIntValue(self->inputDistortionMapWidth, a2, v2, v3, v4);
  v12 = objc_msgSend_unsignedIntValue(self->inputDistortionMapHeight, v8, v9, v10, v11);
  if (v7 >= 4 && v12 > 3)
  {
    v14 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v7;
      if (objc_msgSend_length(self->inputDistortionMap, v15, v16, v17, v18) == 8 * v14 * v7)
      {
        objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v20, 16 * v14 * v7, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend_bytes(self->inputDistortionMap, v24, v25, v26, v27);
        v29 = objc_retainAutorelease(v23);
        v34 = objc_msgSend_mutableBytes(v29, v30, v31, v32, v33);
        v36 = 0;
        v37 = 0;
        do
        {
          v38 = 0;
          do
          {
            *(_QWORD *)&v39 = *(_QWORD *)(v28 + 8 * v36 + 8 * v38);
            *((_QWORD *)&v39 + 1) = v39;
            *(_OWORD *)(v34 + 16 * v36 + 16 * v38++) = v39;
          }
          while (v19 != (_DWORD)v38);
          ++v37;
          v36 += v19;
        }
        while (v37 != v14);
        objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E0C9DDC8], v35, (uint64_t)v29, 16 * v19, *MEMORY[0x1E0C9E078], 0, (double)v19, (double)v14);
        v40 = (CIImage *)objc_claimAutoreleasedReturnValue();
        mapImg = self->mapImg;
        self->mapImg = v40;

        return 1;
      }
      NSLog(CFSTR("LensCorrectionFilter inputDistortionMap is not of the expected length."));
    }
    else
    {
      NSLog(CFSTR("LensCorrectionFilter inputDistortionMap must be of type NSData."));
    }
  }
  else
  {
    NSLog(CFSTR("LensCorrectionFilter inputDistortionMapWidth/Height must be greater than 3."));
  }
  return 0;
}

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  NSNumber *inputDistortionAmount;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  CIImage *v78;
  _QWORD v80[5];
  id v81;
  double v82;
  double v83;
  double v84;
  double v85;
  float v86;
  double v87[3];
  double v88;
  double v89;
  double v90;
  _QWORD v91[5];
  uint8_t buf[16];
  _QWORD v93[4];

  v93[3] = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLensCorrectionDistortionFilter", (const char *)&unk_1D548AF1A, buf, 2u);
    }

    v5 = MEMORY[0x1E0C809B0];
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = sub_1D52A2924;
    v91[3] = &unk_1E996F870;
    v91[4] = self;
    v6 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v91);
    if ((objc_msgSend_makeMapImages(self, v7, v8, v9, v10) & 1) != 0)
    {
      objc_msgSend_floatValue(self->inputDistortionAmount, v11, v12, v13, v14);
      if (self->mapImg && (v19 = fminf(fmaxf(v18, 0.0), 1.0), v19 >= 0.001))
      {
        objc_msgSend_kernelWithName_(LCKernels, v15, (uint64_t)CFSTR("lensCorrect_dist"), v16, v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extent(self->inputImage, v21, v22, v23, v24);
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v33, v34, v35, v36, v25 + v29 * 0.5, v27 + v31 * 0.5, v29 * 0.5, v31 * 0.5);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(self->inputDistortionMapWidth, v38, v39, v40, v41);
        v43 = v42;
        objc_msgSend_doubleValue(self->inputDistortionMapHeight, v44, v45, v46, v47);
        v49 = v48;
        objc_msgSend_imageByClampingToExtent(self->mapImg, v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = v30 / (v43 + -1.0);
        v87[1] = 0.0;
        v87[2] = 0.0;
        v88 = v32 / (v49 + -1.0);
        v89 = v87[0] * -0.5;
        v90 = v88 * -0.5;
        objc_msgSend_imageByApplyingTransform_(v54, v55, (uint64_t)v87, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v80[0] = v5;
        v80[1] = 3221225472;
        v80[2] = sub_1D52A2B38;
        v80[3] = &unk_1E9971F98;
        v80[4] = self;
        v81 = &unk_1E9971FD8;
        v82 = v26;
        v83 = v28;
        v84 = v30;
        v85 = v32;
        v86 = v19;
        v59 = (void *)MEMORY[0x1D82721B4](v80);
        inputImage = self->inputImage;
        objc_msgSend_extent(inputImage, v61, v62, v63, v64);
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v72 = v71;
        inputDistortionAmount = self->inputDistortionAmount;
        v93[0] = v58;
        v93[1] = inputDistortionAmount;
        v93[2] = v37;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v74, (uint64_t)v93, 3, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v77, (uint64_t)v20, (uint64_t)inputImage, (uint64_t)v59, v76, self->inputColorSpace, v66, v68, v70, v72);
        v78 = (CIImage *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v78 = self->inputImage;
      }
    }
    else
    {
      v78 = 0;
    }
    v6[2](v6);

  }
  else
  {
    v78 = 0;
  }
  return v78;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mapImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputDistortionMapHeight, 0);
  objc_storeStrong((id *)&self->inputDistortionMapWidth, 0);
  objc_storeStrong((id *)&self->inputDistortionMap, 0);
  objc_storeStrong((id *)&self->inputDistortionAmount, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
