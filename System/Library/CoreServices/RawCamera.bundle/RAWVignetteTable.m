@implementation RAWVignetteTable

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
  if (objc_msgSend_hasPrefix_(v7, v8, (uint64_t)CFSTR("inputVignetteTableData"), v9, v10))
  {
    vigImg = self->vigImg;
    self->vigImg = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)RAWVignetteTable;
  -[RAWVignetteTable setValue:forKey:](&v12, sel_setValue_forKey_, v6, v7);

}

- (BOOL)makeMapImages
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int16x4_t v26;
  int16x4_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  CIImage *v39;
  CIImage *vigImg;
  id v42;
  int64x2_t v43;
  vImage_Buffer dest;
  vImage_Buffer src;
  int v46;
  __int16 v47;
  _QWORD v48[3];
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  if (!self->vigImg)
  {
    v6 = objc_msgSend_intValue(self->inputVignetteTableDataSize, a2, v2, v3, v4);
    if (v6 < 1)
      return 0;
    v10 = v6;
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v7, ((8 * v6) & 0x7FFFFFFF0) + 16, v8, v9);
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend_mutableBytes(v42, v11, v12, v13, v14);
    v20 = objc_msgSend_bytes(self->inputVignetteTableData, v16, v17, v18, v19);
    v21 = 0;
    v43 = vdupq_n_s64(1uLL);
    do
    {
      v47 = 0;
      v46 = *(_DWORD *)(v20 + v21);
      dest.rowBytes = 2;
      src.data = &v46;
      *(int64x2_t *)&src.height = v43;
      src.rowBytes = 4;
      dest.data = &v47;
      *(int64x2_t *)&dest.height = v43;
      vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0);
      v26.i16[1] = 15360;
      v26.i32[1] = 1006648320;
      v26.i16[0] = v47;
      v27 = vzip1_s16(v26, v26);
      v27.i16[2] = v47;
      *(int16x4_t *)(v15 + 2 * (v21 & 0xFFFFFFFC)) = v27;
      v21 += 4;
    }
    while (4 * v10 != v21);
    v28 = (void *)MEMORY[0x1E0C9DDC8];
    v29 = objc_msgSend_length(v42, v22, v23, v24, v25);
    v30 = *MEMORY[0x1E0C9E0A8];
    v48[0] = *MEMORY[0x1E0C9E108];
    v48[1] = v30;
    v49[0] = MEMORY[0x1E0C9AAB0];
    v49[1] = MEMORY[0x1E0C9AAB0];
    v48[2] = *MEMORY[0x1E0C9E110];
    objc_msgSend_null(MEMORY[0x1E0C99E38], v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v35;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v36, (uint64_t)v49, (uint64_t)v48, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_options_(v28, v38, (uint64_t)v42, v29, *MEMORY[0x1E0C9E080], v37, (double)v10, 1.0);
    v39 = (CIImage *)objc_claimAutoreleasedReturnValue();
    vigImg = self->vigImg;
    self->vigImg = v39;

  }
  return 1;
}

- (id)outputImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CIImage *inputImage;
  double x;
  double y;
  double width;
  double height;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CIImage *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void (**v23)(_QWORD);
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  long double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  CIImage *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CIImage *vigImg;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v65[4];
  uint64_t v66;
  _QWORD v67[5];
  uint8_t buf[16];
  _QWORD v69[4];
  CGRect v70;

  v69[3] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    goto LABEL_16;
  objc_msgSend_extent(inputImage, a2, v2, v3, v4);
  x = v70.origin.x;
  y = v70.origin.y;
  width = v70.size.width;
  height = v70.size.height;
  if (CGRectIsInfinite(v70))
  {
    NSLog(CFSTR("RAWVignetteTable disabled because inputImage is infinite"));
LABEL_4:
    v15 = self->inputImage;
    return v15;
  }
  if ((int)objc_msgSend_intValue(self->inputVignetteTableDataSize, v11, v12, v13, v14) < 1
    || !objc_msgSend_makeMapImages(self, v16, v17, v18, v19))
  {
LABEL_16:
    v15 = 0;
    return v15;
  }
  if (!self->vigImg)
    goto LABEL_4;
  sub_1D52EB19C();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v21, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWVignetteTable", (const char *)&unk_1D548AF1A, buf, 2u);
  }

  v22 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = sub_1D52A0A18;
  v67[3] = &unk_1E996F870;
  v67[4] = self;
  v23 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v67);
  v28 = objc_msgSend_intValue(self->inputVignetteTableDataSize, v24, v25, v26, v27);
  v29 = hypot(width * 0.5, height * 0.5);
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v30, v31, v32, v33, x + width * 0.5, y + height * 0.5, (double)((float)((float)v28 + -1.0) / v29), 0.5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self->inputImage;
  v39 = self->inputColorSpace;
  if (v39)
  {
    objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v35, v36, (uint64_t)v39, v37, v38);
    v40 = objc_claimAutoreleasedReturnValue();

    v35 = (CIImage *)v40;
  }
  objc_msgSend_kernelWithName_(GainMapKernels, v36, (uint64_t)CFSTR("vignetteCorrectionTable"), v37, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v35, v42, v43, v44, v45);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v65[0] = v22;
  v65[1] = 3221225472;
  v65[2] = sub_1D52A0A9C;
  v65[3] = &unk_1E9971F30;
  vigImg = self->vigImg;
  LODWORD(v66) = v28;
  v69[0] = v35;
  v69[1] = vigImg;
  v69[2] = v34;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v55, (uint64_t)v69, 3, v56, v22, 3221225472, sub_1D52A0A9C, &unk_1E9971F30, v66);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_roiCallback_arguments_(v41, v58, (uint64_t)v65, (uint64_t)v57, v59, v47, v49, v51, v53);
  v15 = (CIImage *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v15, v60, (uint64_t)v39, v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();

    v15 = (CIImage *)v63;
  }

  v23[2](v23);
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->vigImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputVignetteTableDataSize, 0);
  objc_storeStrong((id *)&self->inputVignetteTableData, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
