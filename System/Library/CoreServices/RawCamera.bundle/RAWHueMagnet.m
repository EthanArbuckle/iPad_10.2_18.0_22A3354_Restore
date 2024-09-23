@implementation RAWHueMagnet

+ (id)customAttributes
{
  uint64_t v2;
  CFTypeRef v3;
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
  objc_class *v16;
  const char *v17;
  objc_class *v18;
  const char *v19;
  objc_class *v20;
  const char *v21;
  objc_class *v22;
  void *v23;
  const char *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[6];
  _QWORD v45[6];
  _QWORD v46[6];
  _QWORD v47[6];
  _QWORD v48[6];
  _QWORD v49[6];
  _QWORD v50[6];
  _QWORD v51[6];
  _QWORD v52[6];
  _QWORD v53[6];
  _QWORD v54[6];
  _QWORD v55[6];
  _QWORD v56[6];
  _QWORD v57[6];
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[8];
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v61[0] = CFSTR("inputColorSpace");
  v58 = *MEMORY[0x1E0C9DE10];
  v2 = v58;
  v3 = sub_1D543E884();
  v59 = *MEMORY[0x1E0C9DE18];
  v4 = v59;
  v60[0] = v3;
  v60[1] = CFSTR("inputColorSpace");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v60, (uint64_t)&v58, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v43;
  v61[1] = CFSTR("inputVersion");
  v56[0] = *MEMORY[0x1E0C9DE08];
  v6 = v56[0];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9DE50];
  v37 = (void *)v8;
  v57[0] = v8;
  v57[1] = &unk_1E99CC3F8;
  v10 = *MEMORY[0x1E0C9DE48];
  v56[1] = v9;
  v56[2] = v10;
  v57[2] = &unk_1E99CC408;
  v57[3] = &unk_1E99CC418;
  v11 = *MEMORY[0x1E0C9DE68];
  v56[3] = v2;
  v56[4] = v11;
  v12 = *MEMORY[0x1E0C9DED0];
  v56[5] = v4;
  v57[4] = v12;
  v57[5] = CFSTR("inputVersion");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v57, (uint64_t)v56, 6);
  v63 = objc_claimAutoreleasedReturnValue();
  v61[2] = CFSTR("inputHueMagMR");
  v54[0] = v6;
  v38 = (void *)v63;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v42;
  v55[1] = &unk_1E99CC428;
  v54[1] = v9;
  v54[2] = v10;
  v55[2] = &unk_1E99CC438;
  v55[3] = &unk_1E99CC448;
  v54[3] = v2;
  v54[4] = v11;
  v54[5] = v4;
  v55[4] = v12;
  v55[5] = CFSTR("inputHueMagMR");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v55, (uint64_t)v54, 6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v41;
  v61[3] = CFSTR("inputHueMagRY");
  v52[0] = v6;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v40;
  v53[1] = &unk_1E99CC428;
  v52[1] = v9;
  v52[2] = v10;
  v53[2] = &unk_1E99CC438;
  v53[3] = &unk_1E99CC448;
  v52[3] = v2;
  v52[4] = v11;
  v52[5] = v4;
  v53[4] = v12;
  v53[5] = CFSTR("inputHueMagRY");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v53, (uint64_t)v52, 6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v39;
  v61[4] = CFSTR("inputHueMagYG");
  v50[0] = v6;
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v35;
  v51[1] = &unk_1E99CC428;
  v50[1] = v9;
  v50[2] = v10;
  v51[2] = &unk_1E99CC438;
  v51[3] = &unk_1E99CC448;
  v50[3] = v2;
  v50[4] = v11;
  v50[5] = v4;
  v51[4] = v12;
  v51[5] = CFSTR("inputHueMagYG");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v51, (uint64_t)v50, 6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v36;
  v61[5] = CFSTR("inputHueMagGC");
  v48[0] = v6;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v33;
  v49[1] = &unk_1E99CC428;
  v48[1] = v9;
  v48[2] = v10;
  v49[2] = &unk_1E99CC438;
  v49[3] = &unk_1E99CC448;
  v48[3] = v2;
  v48[4] = v11;
  v48[5] = v4;
  v49[4] = v12;
  v49[5] = CFSTR("inputHueMagGC");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v49, (uint64_t)v48, 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v34;
  v61[6] = CFSTR("inputHueMagCB");
  v46[0] = v6;
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v23;
  v47[1] = &unk_1E99CC428;
  v46[1] = v9;
  v46[2] = v10;
  v47[2] = &unk_1E99CC438;
  v47[3] = &unk_1E99CC448;
  v46[3] = v2;
  v46[4] = v11;
  v46[5] = v4;
  v47[4] = v12;
  v47[5] = CFSTR("inputHueMagCB");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v47, (uint64_t)v46, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v25;
  v61[7] = CFSTR("inputHueMagBM");
  v44[0] = v6;
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v27;
  v45[1] = &unk_1E99CC428;
  v44[1] = v9;
  v44[2] = v10;
  v45[2] = &unk_1E99CC438;
  v45[3] = &unk_1E99CC448;
  v44[3] = v2;
  v44[4] = v11;
  v44[5] = v4;
  v45[4] = v12;
  v45[5] = CFSTR("inputHueMagBM");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)v45, (uint64_t)v44, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v29;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)&v62, (uint64_t)v61, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
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
  void (**v5)(_QWORD, __n128);
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
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  CIImage *v51;
  __n128 v52;
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
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  _QWORD v125[5];
  uint8_t buf[8];
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  _QWORD v132[2];

  v132[1] = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWHueMagnet", (const char *)&unk_1D548AF1A, buf, 2u);
    }

    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = sub_1D53CE194;
    v125[3] = &unk_1E996F870;
    v125[4] = self;
    v5 = (void (**)(_QWORD, __n128))MEMORY[0x1D82721B4](v125);
    objc_msgSend_doubleValue(self->inputHueMagMR, v6, v7, v8, v9);
    v11 = v10;
    objc_msgSend_doubleValue(self->inputHueMagRY, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_doubleValue(self->inputHueMagYG, v18, v19, v20, v21);
    v23 = v22;
    objc_msgSend_doubleValue(self->inputHueMagGC, v24, v25, v26, v27);
    v29 = v28;
    objc_msgSend_doubleValue(self->inputHueMagCB, v30, v31, v32, v33);
    v35 = v34;
    objc_msgSend_doubleValue(self->inputHueMagBM, v36, v37, v38, v39);
    v40 = fmin(fmax(v11, -0.2), 0.2);
    v41 = fmin(fmax(v17, -0.2), 0.2);
    v42 = fmin(fmax(v23, -0.2), 0.2);
    v44 = fabs(v40);
    v45 = fabs(v41);
    v46 = fabs(v42);
    v121 = fmin(fmax(v35, -0.2), 0.2);
    v122 = fmin(fmax(v29, -0.2), 0.2);
    v47 = fabs(v122);
    v120 = fmin(fmax(v43, -0.2), 0.2);
    v123 = fabs(v120);
    v124 = fabs(v121);
    v51 = self->inputImage;
    if (v44 >= 0.001
      || v45 >= 0.001
      || v46 >= 0.001
      || v47 >= 0.001
      || (v52.n128_f64[0] = v124, v124 >= 0.001)
      || (v52.n128_f64[0] = v123, v123 >= 0.001))
    {
      if (v44 >= 0.001)
      {
        objc_msgSend_kernelWithName_(HMKernels, v48, (uint64_t)CFSTR("RAWHueMagnetMR"), v49, v50, v52.n128_f64[0]);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v54, v55, v56, v57, v40);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v132[0] = v58;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v59, (uint64_t)v132, 1, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v62, (uint64_t)v53, (uint64_t)v51, (uint64_t)v61, self->inputColorSpace, 1);
        v63 = objc_claimAutoreleasedReturnValue();

        v51 = (CIImage *)v63;
      }
      if (v45 >= 0.001)
      {
        objc_msgSend_kernelWithName_(HMKernels, v48, (uint64_t)CFSTR("RAWHueMagnetRY"), v49, v50);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v65, v66, v67, v68, v41);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = v69;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v70, (uint64_t)&v131, 1, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v73, (uint64_t)v64, (uint64_t)v51, (uint64_t)v72, self->inputColorSpace, 1);
        v74 = objc_claimAutoreleasedReturnValue();

        v51 = (CIImage *)v74;
      }
      if (v46 >= 0.001)
      {
        objc_msgSend_kernelWithName_(HMKernels, v48, (uint64_t)CFSTR("RAWHueMagnetYG"), v49, v50);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v76, v77, v78, v79, v42);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = v80;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v81, (uint64_t)&v130, 1, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v84, (uint64_t)v75, (uint64_t)v51, (uint64_t)v83, self->inputColorSpace, 1);
        v85 = objc_claimAutoreleasedReturnValue();

        v51 = (CIImage *)v85;
      }
      if (v47 >= 0.001)
      {
        objc_msgSend_kernelWithName_(HMKernels, v48, (uint64_t)CFSTR("RAWHueMagnetGC"), v49, v50);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v87, v88, v89, v90, v122);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = v91;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v92, (uint64_t)&v129, 1, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v95, (uint64_t)v86, (uint64_t)v51, (uint64_t)v94, self->inputColorSpace, 1);
        v96 = objc_claimAutoreleasedReturnValue();

        v51 = (CIImage *)v96;
      }
      if (v124 >= 0.001)
      {
        objc_msgSend_kernelWithName_(HMKernels, v48, (uint64_t)CFSTR("RAWHueMagnetCB"), v49, v50, v124);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v98, v99, v100, v101, v121);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = v102;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v103, (uint64_t)&v128, 1, v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v106, (uint64_t)v97, (uint64_t)v51, (uint64_t)v105, self->inputColorSpace, 1);
        v107 = objc_claimAutoreleasedReturnValue();

        v51 = (CIImage *)v107;
      }
      v52.n128_f64[0] = v123;
      if (v123 >= 0.001)
      {
        objc_msgSend_kernelWithName_(HMKernels, v48, (uint64_t)CFSTR("RAWHueMagnetBM"), v49, v50, v123);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v109, v110, v111, v112, v120);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = v113;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v114, (uint64_t)&v127, 1, v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v117, (uint64_t)v108, (uint64_t)v51, (uint64_t)v116, self->inputColorSpace, 1);
        v118 = objc_claimAutoreleasedReturnValue();

        v51 = (CIImage *)v118;
      }
    }
    v5[2](v5, v52);

  }
  else
  {
    v51 = 0;
  }
  return v51;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputHueMagBM, 0);
  objc_storeStrong((id *)&self->inputHueMagCB, 0);
  objc_storeStrong((id *)&self->inputHueMagGC, 0);
  objc_storeStrong((id *)&self->inputHueMagYG, 0);
  objc_storeStrong((id *)&self->inputHueMagRY, 0);
  objc_storeStrong((id *)&self->inputHueMagMR, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
