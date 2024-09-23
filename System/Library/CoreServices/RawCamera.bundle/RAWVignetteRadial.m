@implementation RAWVignetteRadial

+ (id)customAttributes
{
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  objc_class *v10;
  const char *v11;
  objc_class *v12;
  const char *v13;
  objc_class *v14;
  const char *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[3];
  uint64_t v52;
  _QWORD v53[4];
  _QWORD v54[6];
  _QWORD v55[2];
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v54[0] = CFSTR("inputVignetteK0");
  v51[0] = *MEMORY[0x1E0C9DE08];
  v2 = v51[0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C9DE10];
  v39 = (void *)v4;
  v53[0] = v4;
  v53[1] = &unk_1E99CC4F8;
  v6 = *MEMORY[0x1E0C9DE68];
  v51[1] = v5;
  v51[2] = v6;
  v7 = *MEMORY[0x1E0C9DED0];
  v52 = *MEMORY[0x1E0C9DE18];
  v8 = v52;
  v53[2] = v7;
  v53[3] = CFSTR("inputVignetteK0");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v53, (uint64_t)v51, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v40;
  v54[1] = CFSTR("inputVignetteK1");
  v49[0] = v2;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v38;
  v50[1] = &unk_1E99CC4F8;
  v49[1] = v5;
  v49[2] = v6;
  v49[3] = v8;
  v50[2] = v7;
  v50[3] = CFSTR("inputVignetteK1");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v50, (uint64_t)v49, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v37;
  v54[2] = CFSTR("inputVignetteK2");
  v47[0] = v2;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v35;
  v48[1] = &unk_1E99CC4F8;
  v47[1] = v5;
  v47[2] = v6;
  v47[3] = v8;
  v48[2] = v7;
  v48[3] = CFSTR("inputVignetteK2");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v48, (uint64_t)v47, 4);
  v56 = objc_claimAutoreleasedReturnValue();
  v54[3] = CFSTR("inputVignetteK3");
  v45[0] = v2;
  v36 = (void *)v56;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v34;
  v46[1] = &unk_1E99CC4F8;
  v45[1] = v5;
  v45[2] = v6;
  v45[3] = v8;
  v46[2] = v7;
  v46[3] = CFSTR("inputVignetteK3");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v46, (uint64_t)v45, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v16;
  v54[4] = CFSTR("inputVignetteK4");
  v43[0] = v2;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v18;
  v44[1] = &unk_1E99CC4F8;
  v43[1] = v5;
  v43[2] = v6;
  v43[3] = v8;
  v44[2] = v7;
  v44[3] = CFSTR("inputVignetteK4");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v44, (uint64_t)v43, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v20;
  v54[5] = CFSTR("inputCenter");
  v41[0] = v2;
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v22;
  v41[1] = v5;
  objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v23, v24, v25, v26, 0.5, 0.5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v6;
  v28 = *MEMORY[0x1E0C9DEB8];
  v42[1] = v27;
  v42[2] = v28;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v42, (uint64_t)v41, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v30;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)v55, (uint64_t)v54, 6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)outputImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  CIImage *inputImage;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CIImage *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void (**v20)(_QWORD);
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  long double v36;
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
  float v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float v65;
  float v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  float v71;
  float v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  float v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  CIImage *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v118;
  _QWORD v119[5];
  uint8_t buf[16];
  _QWORD v121[4];
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;

  v121[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
  {
    v17 = 0;
    return v17;
  }
  v10 = objc_msgSend_BOOLValue(self->inputVignetteExecute, a2, v2, v3, v4);
  inputImage = self->inputImage;
  if ((v10 & 1) == 0)
  {
    v16 = inputImage;
    goto LABEL_6;
  }
  objc_msgSend_extent(inputImage, v6, v7, v8, v9);
  x = v122.origin.x;
  y = v122.origin.y;
  width = v122.size.width;
  height = v122.size.height;
  if (CGRectIsInfinite(v122))
  {
    NSLog(CFSTR("RAWVignetteRadial disabled because inputImage is infinite"));
    v16 = self->inputImage;
LABEL_6:
    v17 = v16;
    return v17;
  }
  sub_1D52EB19C();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWVignetteRadial", (const char *)&unk_1D548AF1A, buf, 2u);
  }

  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = sub_1D53EEE40;
  v119[3] = &unk_1E996F870;
  v119[4] = self;
  v20 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v119);
  objc_msgSend_X(self->inputVignetteCenter, v21, v22, v23, v24);
  v118 = v25;
  objc_msgSend_Y(self->inputVignetteCenter, v26, v27, v28, v29);
  v31 = v30;
  v123.origin.x = x;
  v123.origin.y = y;
  v123.size.width = width;
  v123.size.height = height;
  MinX = CGRectGetMinX(v123);
  v124.origin.x = x;
  v124.origin.y = y;
  v124.size.width = width;
  v124.size.height = height;
  MaxX = CGRectGetMaxX(v124);
  v125.origin.x = x;
  v125.origin.y = y;
  v125.size.width = width;
  v125.size.height = height;
  MinY = CGRectGetMinY(v125);
  v126.origin.x = x;
  v126.origin.y = y;
  v126.size.width = width;
  v126.size.height = height;
  MaxY = CGRectGetMaxY(v126);
  v36 = hypot(fmax(vabdd_f64(MinX, width * v118), vabdd_f64(MaxX, width * v118)), fmax(vabdd_f64(MinY, height * v31), vabdd_f64(MaxY, height * v31)));
  v37 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend_X(self->inputVignetteCenter, v38, v39, v40, v41);
  v43 = v42;
  objc_msgSend_Y(self->inputVignetteCenter, v44, v45, v46, v47);
  v49 = v48;
  objc_msgSend_floatValue(self->inputVignetteK4, v50, v51, v52, v53);
  objc_msgSend_vectorWithX_Y_Z_W_(v37, v55, v56, v57, v58, width * v43, height * v49, v54, (double)(1.0 / (v36 * v36)));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend_floatValue(self->inputVignetteK0, v61, v62, v63, v64);
  v66 = v65;
  objc_msgSend_floatValue(self->inputVignetteK1, v67, v68, v69, v70);
  v72 = v71;
  objc_msgSend_floatValue(self->inputVignetteK2, v73, v74, v75, v76);
  LODWORD(v36) = v77;
  objc_msgSend_floatValue(self->inputVignetteK3, v78, v79, v80, v81);
  objc_msgSend_vectorWithX_Y_Z_W_(v60, v83, v84, v85, v86, v66, v72, *(float *)&v36, v82);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(GainMapKernels, v88, (uint64_t)CFSTR("GainMapParametric"), v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = self->inputImage;
  v97 = self->inputColorSpace;
  if (v97)
  {
    objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v92, v93, (uint64_t)v97, v95, v96);
    v98 = objc_claimAutoreleasedReturnValue();

    v92 = (CIImage *)v98;
  }
  objc_msgSend_extent(v92, v93, v94, v95, v96);
  v100 = v99;
  v102 = v101;
  v104 = v103;
  v106 = v105;
  v121[0] = v92;
  v121[1] = v59;
  v121[2] = v87;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v107, (uint64_t)v121, 3, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_(v91, v110, (uint64_t)v109, v111, v112, v100, v102, v104, v106);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v17, v113, (uint64_t)v97, v114, v115);
    v116 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v116;
  }

  v20[2](v20);
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputVignetteExecute, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputVignetteCenter, 0);
  objc_storeStrong((id *)&self->inputVignetteK4, 0);
  objc_storeStrong((id *)&self->inputVignetteK3, 0);
  objc_storeStrong((id *)&self->inputVignetteK2, 0);
  objc_storeStrong((id *)&self->inputVignetteK1, 0);
  objc_storeStrong((id *)&self->inputVignetteK0, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
