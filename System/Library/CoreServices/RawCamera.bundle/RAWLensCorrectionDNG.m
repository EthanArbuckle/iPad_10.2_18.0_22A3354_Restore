@implementation RAWLensCorrectionDNG

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], a2, v2, v3, v4, 1.0, 0.0, 0.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v6, v7, v8, v9, 0.0, 0.0, 0.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v11, v12, v13, v14, 0.5, 0.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("inputKr");
  v17 = *MEMORY[0x1E0C9DE40];
  v31[0] = *MEMORY[0x1E0C9DE10];
  v16 = v31[0];
  v31[1] = v17;
  v32[0] = v5;
  v32[1] = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v32, (uint64_t)v31, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v19;
  v33[1] = CFSTR("inputKt");
  v29[0] = v16;
  v29[1] = v17;
  v30[0] = v10;
  v30[1] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v30, (uint64_t)v29, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v21;
  v33[2] = CFSTR("inputCenter");
  v27[0] = v16;
  v27[1] = v17;
  v28[0] = v15;
  v28[1] = v15;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v28, (uint64_t)v27, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v23;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v34, (uint64_t)v33, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
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

- (CGPoint)mapPoint:(CGPoint)a3 info:(id)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  float v72;
  float v73;
  float v74;
  float x;
  float y;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  float v91;
  double v92;
  CGPoint result;

  v4 = a4;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("Kr"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("Kt"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v13, (uint64_t)CFSTR("c"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_X(v8, v17, v18, v19, v20);
  v92 = v21;
  objc_msgSend_Y(v8, v22, v23, v24, v25);
  v27 = v26;
  objc_msgSend_Z(v8, v28, v29, v30, v31);
  v33 = v32;
  objc_msgSend_W(v8, v34, v35, v36, v37);
  v39 = v38;
  objc_msgSend_X(v12, v40, v41, v42, v43);
  v45 = v44;
  objc_msgSend_Y(v12, v46, v47, v48, v49);
  v51 = v50;
  objc_msgSend_X(v16, v52, v53, v54, v55);
  v57 = v56;
  objc_msgSend_Y(v16, v58, v59, v60, v61);
  v63 = v62;
  objc_msgSend_objectForKeyedSubscript_(v4, v64, (uint64_t)CFSTR("m"), v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v67, v68, v69, v70, v71);
  v73 = v72;
  *(float *)&v63 = v63;
  *(float *)&v57 = v57;
  v74 = v51;
  v91 = v74;
  *(float *)&v45 = v45;
  *(float *)&v51 = v92;

  x = a3.x;
  y = a3.y;
  v77 = (float)(x - *(float *)&v57) / v73;
  v78 = (float)(y - *(float *)&v63) / v73;
  v79 = (float)(v78 * v78) + (float)(v77 * v77);
  *(float *)&v27 = v27;
  *(float *)&v33 = v33;
  *(float *)&v39 = v39;
  v80 = (float)((float)((float)(v79 * *(float *)&v27) + *(float *)&v51) + (float)(*(float *)&v33 * (float)(v79 * v79)))
      + (float)(*(float *)&v39 * (float)(v79 * (float)(v79 * v79)));
  v81 = v77 * v80;
  v82 = v78 * v80;
  v83 = v77;
  v84 = v78;
  v85 = (v83 + v83) * v84;
  v86 = v79;
  *(float *)&v83 = (v86 + (v83 + v83) * v83) * v91 + *(float *)&v45 * v85;
  *(float *)&v84 = (v86 + (v84 + v84) * v84) * *(float *)&v45 + v91 * v85;
  v87 = (float)((float)(v73 * (float)(v81 + *(float *)&v83)) + *(float *)&v57);
  v88 = (float)((float)(v73 * (float)(v82 + *(float *)&v84)) + *(float *)&v63);

  v89 = v87;
  v90 = v88;
  result.y = v90;
  result.x = v89;
  return result;
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  float v37;
  float v38;
  double v39;
  id v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CIImage *inputImage;
  CIVector *inputKt;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  double v65;
  double v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[6];
  float v71;
  float v72;
  _QWORD v73[5];
  uint8_t buf[16];
  _QWORD v75[6];

  v75[4] = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLensCorrectionDNG", (const char *)&unk_1D548AF1A, buf, 2u);
    }

    v5 = MEMORY[0x1E0C809B0];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = sub_1D5441694;
    v73[3] = &unk_1E996F870;
    v73[4] = self;
    v6 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v73);
    objc_msgSend_extent(self->inputImage, v7, v8, v9, v10);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend_kernelWithName_(LCKernels, v19, (uint64_t)CFSTR("dngLens"), v20, v21);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(LCKernels, v22, (uint64_t)CFSTR("dngLensDraft"), v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_X(self->inputCenter, v26, v27, v28, v29);
    v31 = v30;
    objc_msgSend_Y(self->inputCenter, v32, v33, v34, v35);
    v37 = v12 + v16 * v31;
    v38 = v14 + v18 * v36;
    v39 = hypot(fmax(vabdd_f64(v12, v37), vabdd_f64(v12 + v16, v37)), fmax(vabdd_f64(v14, v38), vabdd_f64(v14 + v18, v38)));
    v70[0] = v5;
    v70[1] = 3221225472;
    v70[2] = sub_1D5441718;
    v70[3] = &unk_1E99A6B50;
    v70[4] = self;
    v71 = v37;
    v72 = v38;
    *(double *)&v70[5] = v39;
    v68[0] = v5;
    v68[1] = 3221225472;
    v68[2] = sub_1D5441920;
    v68[3] = &unk_1E9986F88;
    v40 = (id)MEMORY[0x1D82721B4](v70);
    v69 = v40;
    v41 = (void *)MEMORY[0x1D82721B4](v68);
    if (objc_msgSend_BOOLValue(self->inputDraftMode, v42, v43, v44, v45))
      v50 = (uint64_t)v25;
    else
      v50 = (uint64_t)v67;
    inputImage = self->inputImage;
    inputKt = self->inputKt;
    v75[0] = self->inputKr;
    v75[1] = inputKt;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v46, v47, v48, v49, v37, v38, *(_QWORD *)&v18, *(_QWORD *)&v16);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2] = v53;
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v54, v55, v56, v57, v39);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v75[3] = v58;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v59, (uint64_t)v75, 4, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v62, v50, (uint64_t)inputImage, (uint64_t)v41, v61, self->inputColorSpace, v12, v14, v66, v65);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6);
  }
  else
  {
    v63 = 0;
  }
  return v63;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputCenter, 0);
  objc_storeStrong((id *)&self->inputKt, 0);
  objc_storeStrong((id *)&self->inputKr, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
