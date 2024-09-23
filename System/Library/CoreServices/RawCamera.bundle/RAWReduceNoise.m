@implementation RAWReduceNoise

+ (id)customAttributes
{
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  objc_class *v12;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  objc_class *v30;
  const char *v31;
  objc_class *v32;
  const char *v33;
  objc_class *v34;
  uint64_t v35;
  const char *v36;
  objc_class *v37;
  const char *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[4];
  _QWORD v76[4];
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[6];
  _QWORD v80[6];
  _QWORD v81[6];
  _QWORD v82[6];
  _QWORD v83[6];
  _QWORD v84[6];
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[4];
  _QWORD v88[4];
  _QWORD v89[6];
  _QWORD v90[6];
  _QWORD v91[6];
  _QWORD v92[6];
  _QWORD v93[6];
  _QWORD v94[6];
  _QWORD v95[6];
  _QWORD v96[6];
  _QWORD v97[6];
  _QWORD v98[6];
  _QWORD v99[5];
  uint64_t v100;
  _QWORD v101[6];
  _QWORD v102[14];
  _QWORD v103[16];

  v103[14] = *MEMORY[0x1E0C80C00];
  v102[0] = CFSTR("inputLNRAmount");
  v99[0] = *MEMORY[0x1E0C9DE08];
  v2 = v99[0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C9DE10];
  v74 = (void *)v4;
  v101[0] = v4;
  v101[1] = &unk_1E99D1300;
  v6 = *MEMORY[0x1E0C9DE50];
  v99[1] = v5;
  v99[2] = v6;
  v7 = *MEMORY[0x1E0C9DE48];
  v101[2] = &unk_1E99D1300;
  v101[3] = &unk_1E99D1310;
  v8 = *MEMORY[0x1E0C9DE68];
  v99[3] = v7;
  v99[4] = v8;
  v9 = *MEMORY[0x1E0C9DED0];
  v100 = *MEMORY[0x1E0C9DE18];
  v10 = v100;
  v101[4] = v9;
  v101[5] = CFSTR("inputLNRAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v101, (uint64_t)v99, 6);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v73;
  v102[1] = CFSTR("inputCNRAmount");
  v97[0] = v2;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v72;
  v98[1] = &unk_1E99D1320;
  v97[1] = v5;
  v97[2] = v6;
  v98[2] = &unk_1E99D1300;
  v98[3] = &unk_1E99D1310;
  v97[3] = v7;
  v97[4] = v8;
  v97[5] = v10;
  v98[4] = v9;
  v98[5] = CFSTR("inputCNRAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v98, (uint64_t)v97, 6);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v70;
  v102[2] = CFSTR("inputSharpenAmount");
  v95[0] = v2;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v71;
  v96[1] = &unk_1E99D1320;
  v95[1] = v5;
  v95[2] = v6;
  v96[2] = &unk_1E99D1300;
  v96[3] = &unk_1E99D1310;
  v95[3] = v7;
  v95[4] = v8;
  v95[5] = v10;
  v96[4] = v9;
  v96[5] = CFSTR("inputSharpenAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v96, (uint64_t)v95, 6);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v69;
  v102[3] = CFSTR("inputSharpenThreshold");
  v93[0] = v2;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v67;
  v94[1] = &unk_1E99D1300;
  v93[1] = v5;
  v93[2] = v6;
  v94[2] = &unk_1E99D1330;
  v94[3] = &unk_1E99D1340;
  v93[3] = v7;
  v93[4] = v8;
  v93[5] = v10;
  v94[4] = v9;
  v94[5] = CFSTR("inputSharpenThreshold");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v94, (uint64_t)v93, 6);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v103[3] = v68;
  v102[4] = CFSTR("inputContrastAmount");
  v91[0] = v2;
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v65;
  v92[1] = &unk_1E99D1300;
  v91[1] = v5;
  v91[2] = v6;
  v92[2] = &unk_1E99D1300;
  v92[3] = &unk_1E99D1310;
  v91[3] = v7;
  v91[4] = v8;
  v91[5] = v10;
  v92[4] = v9;
  v92[5] = CFSTR("inputContrastAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v92, (uint64_t)v91, 6);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v103[4] = v66;
  v102[5] = CFSTR("inputDetailAmount");
  v89[0] = v2;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v63;
  v90[1] = &unk_1E99D1300;
  v89[1] = v5;
  v89[2] = v6;
  v90[2] = &unk_1E99D1300;
  v90[3] = &unk_1E99D1350;
  v89[3] = v7;
  v89[4] = v8;
  v89[5] = v10;
  v90[4] = v9;
  v90[5] = CFSTR("inputDetailAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v90, (uint64_t)v89, 6);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v103[5] = v64;
  v102[6] = CFSTR("inputNeutralFactors");
  v87[0] = v2;
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v60;
  v87[1] = v5;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v23, v24, v25, v26, 1.0, 1.0, 1.0, 1.0);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x1E0C9DEC0];
  v61 = (void *)v27;
  v88[1] = v27;
  v88[2] = v28;
  v87[2] = v8;
  v87[3] = v10;
  v88[3] = CFSTR("inputNeutralFactors");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v88, (uint64_t)v87, 4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v103[6] = v62;
  v102[7] = CFSTR("inputRepresentativeNoise");
  v85[0] = v2;
  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v58;
  v86[1] = &unk_1E99D1320;
  v85[1] = v5;
  v85[2] = v8;
  v85[3] = v10;
  v86[2] = v9;
  v86[3] = CFSTR("inputRepresentativeNoise");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)v86, (uint64_t)v85, 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v103[7] = v59;
  v102[8] = CFSTR("inputScaleFactor");
  v83[0] = v2;
  v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v56;
  v84[1] = &unk_1E99D1300;
  v83[1] = v6;
  v83[2] = v7;
  v84[2] = &unk_1E99D1310;
  v84[3] = &unk_1E99D1310;
  v83[3] = v5;
  v83[4] = v8;
  v83[5] = v10;
  v84[4] = v9;
  v84[5] = CFSTR("inputScaleFactor");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)v84, (uint64_t)v83, 6);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v103[8] = v57;
  v102[9] = CFSTR("inputMoireRadius");
  v81[0] = v2;
  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v54;
  v82[1] = &unk_1E99D1300;
  v81[1] = v6;
  v81[2] = v7;
  v82[2] = &unk_1E99D1360;
  v82[3] = &unk_1E99D1370;
  v81[3] = v5;
  v81[4] = v8;
  v35 = *MEMORY[0x1E0C9DE90];
  v81[5] = v10;
  v82[4] = v35;
  v82[5] = CFSTR("inputMoireRadius");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v36, (uint64_t)v82, (uint64_t)v81, 6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v103[9] = v55;
  v102[10] = CFSTR("inputMoireAmount");
  v79[0] = v2;
  v37 = (objc_class *)objc_opt_class();
  NSStringFromClass(v37);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v53;
  v80[1] = &unk_1E99D1300;
  v79[1] = v6;
  v79[2] = v7;
  v80[2] = &unk_1E99D1310;
  v80[3] = &unk_1E99D1320;
  v79[3] = v5;
  v79[4] = v8;
  v79[5] = v10;
  v80[4] = v9;
  v80[5] = CFSTR("inputMoireAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v38, (uint64_t)v80, (uint64_t)v79, 6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v103[10] = v39;
  v102[11] = CFSTR("inputOpponentColorEnabled");
  v77[0] = v2;
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v41;
  v78[1] = MEMORY[0x1E0C9AAB0];
  v77[1] = v5;
  v77[2] = v8;
  v42 = *MEMORY[0x1E0C9DE78];
  v77[3] = v10;
  v78[2] = v42;
  v78[3] = CFSTR("inputOpponentColorEnabled");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v43, (uint64_t)v78, (uint64_t)v77, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v103[11] = v44;
  v102[12] = CFSTR("inputShowHF");
  v75[0] = v2;
  v45 = (objc_class *)objc_opt_class();
  NSStringFromClass(v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v46;
  v76[1] = MEMORY[0x1E0C9AAA0];
  v75[1] = v5;
  v75[2] = v8;
  v75[3] = v10;
  v76[2] = v42;
  v76[3] = CFSTR("inputShowHF");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v47, (uint64_t)v76, (uint64_t)v75, 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v102[13] = CFSTR("kCIRAWFilterDoesClip");
  v49 = *MEMORY[0x1E0C9AE40];
  v103[12] = v48;
  v103[13] = v49;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v50, (uint64_t)v103, (uint64_t)v102, 14);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
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

+ (id)smartNoiseStatistics:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  _QWORD v27[6];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("kCGImageSourceLuminanceNoiseReductionAmount"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v8, (uint64_t)CFSTR("kCGImageSourceColorNoiseReductionAmount"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v12, (uint64_t)CFSTR("kCGImageSourceNoiseReductionSharpnessAmount"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v16, (uint64_t)CFSTR("kCGImageSourceNoiseReductionContrastAmount"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v20, (uint64_t)CFSTR("kCGImageSourceNoiseReductionDetailAmount"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("autoValue");
  v27[1] = CFSTR("lnramt");
  v28[0] = &unk_1E99CC458;
  v28[1] = v7;
  v27[2] = CFSTR("cnramt");
  v27[3] = CFSTR("sharpening");
  v28[2] = v11;
  v28[3] = v15;
  v27[4] = CFSTR("contrast");
  v27[5] = CFSTR("detail");
  v28[4] = v19;
  v28[5] = v23;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v28, (uint64_t)v27, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)smartNoiseAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  _QWORD v54[5];
  _QWORD v55[6];

  v55[5] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("lnramt"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v9, v10, v11, v12, v13);
  v15 = v14;
  objc_msgSend_objectForKeyedSubscript_(v5, v16, (uint64_t)CFSTR("cnramt"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v19, v20, v21, v22, v23);
  v25 = v24;
  objc_msgSend_objectForKeyedSubscript_(v5, v26, (uint64_t)CFSTR("sharpening"), v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v30, (uint64_t)CFSTR("contrast"), v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a3 + -0.5;
  v35 = fmax(v15 + (a3 + -0.5) * (1.0 - v15 + 1.0 - v15), 0.0);
  v54[0] = CFSTR("lnramt");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v36, v37, v38, v39, v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v40;
  v54[1] = CFSTR("cnramt");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v41, v42, v43, v44, v25 + v34 * 0.35);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v45;
  v55[2] = v29;
  v54[2] = CFSTR("sharpening");
  v54[3] = CFSTR("contrast");
  v55[3] = v33;
  v54[4] = CFSTR("detail");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v46, v47, v48, v49, fmax(v35 + -0.75, 0.0) * 4.0 * 0.5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v50;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v51, (uint64_t)v55, (uint64_t)v54, 5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)samplerForImage:(id)a3
{
  uint64_t v3;

  objc_msgSend_samplerWithImage_keysAndValues_(MEMORY[0x1E0C9DDF0], a2, (uint64_t)a3, *MEMORY[0x1E0C9E2B0], v3, self->inputColorSpace, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extractY:(id)a3 neutralFactors:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v8, (uint64_t)CFSTR("extractY"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v18, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_isAlphaOne_(self, v15, (uint64_t)v11, (uint64_t)v6, (uint64_t)v14, self->inputColorSpace, 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)extractYOpponentColor:(id)a3 neutralFactors:(id)a4 luminanceFactors:(id)a5 noiseVector:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_kernelWithName_(NRKernels, v14, (uint64_t)CFSTR("extractYOpponentColor"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = v12;
  v24[2] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v24, 3, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v21, (uint64_t)v17, (uint64_t)v10, (uint64_t)v20, self->inputColorSpace, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)extractHalfSizeRGB:(id)a3 neutralFactors:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double x;
  double y;
  double width;
  double height;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  CGAffineTransform v26;
  CGAffineTransform v27;
  _QWORD v28[2];
  CGRect v29;
  CGRect v30;

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(&v27, 0, sizeof(v27));
  CGAffineTransformMakeScale(&v27, 0.5, 0.5);
  objc_msgSend_kernelWithName_(NRKernels, v8, (uint64_t)CFSTR("extractHalfSizeRGB"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v6, v12, v13, v14, v15);
  v26 = v27;
  v30 = CGRectApplyAffineTransform(v29, &v26);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v28[0] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)v28, 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v23, (uint64_t)v11, (uint64_t)v6, (uint64_t)&unk_1E999BDB8, v22, self->inputColorSpace, 1, x, y, width, height);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)extractHalfSizeRGBHF:(id)a3 neutralFactors:(id)a4 threshold:(float)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  float v27;
  double x;
  double y;
  double width;
  double height;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  CGAffineTransform v43;
  CGAffineTransform v44;
  _QWORD v45[3];
  CGRect v46;
  CGRect v47;

  v45[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeScale(&v44, 0.5, 0.5);
  objc_msgSend_adjustedRNAmount(self, v10, v11, v12, v13);
  if (v18 <= 2.0)
  {
    objc_msgSend_adjustedRNAmount(self, v14, v15, v16, v17);
    v19 = flt_1D544EDF8[v20 > 1.0];
  }
  else
  {
    v19 = 0.6;
  }
  objc_msgSend_kernelWithName_(NRKernels, v14, (uint64_t)CFSTR("extractHalfSizeRGBHF"), v16, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v8, v22, v23, v24, v25);
  v26 = v19 * 0.5;
  v43 = v44;
  v27 = 1.0 / v19;
  v47 = CGRectApplyAffineTransform(v46, &v43);
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  v45[0] = v9;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v32, v33, v34, v35, a5, v26, v27, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v36;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v45, 2, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v40, (uint64_t)v21, (uint64_t)v8, (uint64_t)&unk_1E999BDD8, v39, self->inputColorSpace, x, y, width, height);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)highFrequencyIntoAlpha:(id)a3 threshold:(float)a4 neutralFactors:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double x;
  double y;
  double width;
  double height;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  _QWORD v41[3];
  CGRect v42;
  CGRect v43;

  v41[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend_adjustedRNAmount(self, v10, v11, v12, v13);
  if (v18 <= 2.0)
  {
    objc_msgSend_adjustedRNAmount(self, v14, v15, v16, v17);
    v19 = flt_1D544EE00[v20 > 1.0];
  }
  else
  {
    v19 = 0.04;
  }
  objc_msgSend_kernelWithName_(NRKernels, v14, (uint64_t)CFSTR("highFrequencyIntoAlpha"), v16, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v8, v22, v23, v24, v25);
  v43 = CGRectInset(v42, -1.0, -1.0);
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v30, v31, v32, v33, a4, (float)(v19 * 0.5), (float)(1.0 / v19), 0.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v34;
  v41[1] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v41, 2, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v38, (uint64_t)v21, (uint64_t)v8, (uint64_t)&unk_1E999BDF8, v37, self->inputColorSpace, x, y, width, height);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)multiply:(id)a3 byNeutralFactors:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v8, (uint64_t)CFSTR("multiplyByNeutralFactors"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v18, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v15, (uint64_t)v11, (uint64_t)v6, (uint64_t)v14, self->inputColorSpace, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)powerBlur:(id)a3 threshold:(float)a4 scale:(float)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double x;
  double y;
  double width;
  double height;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  _QWORD v32[4];
  float v33;
  _QWORD v34[2];
  CGRect v35;
  CGRect v36;

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v9, (uint64_t)CFSTR("powerBlur"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v8, v13, v14, v15, v16);
  v36 = CGRectInset(v35, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1D53CFCD4;
  v32[3] = &unk_1E9971F30;
  v33 = a5;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v21, v22, v23, v24, a4, a5, 0.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v25;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)v34, 1, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v29, (uint64_t)v12, (uint64_t)v8, (uint64_t)v32, v28, self->inputColorSpace, 1, x, y, width, height);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)powerBlurDespeckle:(id)a3 threshold:(float)a4 scale:(float)a5 countThreshold:(int)a6 luminanceThreshold:(float)a7 diffAmount:(float)a8
{
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double x;
  double y;
  double width;
  double height;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[3];
  CGRect v46;
  CGRect v47;

  v45[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v15, (uint64_t)CFSTR("powerBlurDespeckle"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v14, v19, v20, v21, v22);
  v47 = CGRectInset(v46, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  *(float *)&v44 = a5;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v27, v28, v29, v30, a4, a5, 0.0, 0.0, MEMORY[0x1E0C809B0], 3221225472, sub_1D53CFF08, &unk_1E9971F30, v44);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v31;
  objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v32, v33, v34, v35, (float)a6, a7, a8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v36;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v45, 2, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v40, (uint64_t)v18, (uint64_t)v14, (uint64_t)&v43, v39, self->inputColorSpace, x, y, width, height);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)powerBlurEarlyOut:(id)a3 threshold:(float)a4 scale:(float)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double x;
  double y;
  double width;
  double height;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  _QWORD v32[4];
  float v33;
  _QWORD v34[2];
  CGRect v35;
  CGRect v36;

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v9, (uint64_t)CFSTR("powerBlurEarlyOut"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v8, v13, v14, v15, v16);
  v36 = CGRectInset(v35, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1D53D00F4;
  v32[3] = &unk_1E9971F30;
  v33 = a5;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v21, v22, v23, v24, a4, a5, 0.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v25;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)v34, 1, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v29, (uint64_t)v12, (uint64_t)v8, (uint64_t)v32, v28, self->inputColorSpace, x, y, width, height);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)powerBlurEarlyOut2:(id)a3 threshold:(float)a4 scale:(float)a5 neutralThreshold:(float)a6 thresholdScale:(float)a7
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double x;
  double y;
  double width;
  double height;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  _QWORD v36[4];
  float v37;
  _QWORD v38[2];
  CGRect v39;
  CGRect v40;

  v38[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v13, (uint64_t)CFSTR("powerBlurEarlyOut2"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v12, v17, v18, v19, v20);
  v40 = CGRectInset(v39, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = sub_1D53D02F0;
  v36[3] = &unk_1E9971F30;
  v37 = a5;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v25, v26, v27, v28, a4, a5, a7, a6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v29;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)v38, 1, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v33, (uint64_t)v16, (uint64_t)v12, (uint64_t)v36, v32, self->inputColorSpace, x, y, width, height);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)powerBlurFS:(id)a3 threshold:(float)a4 neutralFactors:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double x;
  double y;
  double width;
  double height;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  _QWORD v33[3];
  CGRect v34;
  CGRect v35;

  v33[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend_kernelWithName_(NRKernels, v10, (uint64_t)CFSTR("powerBlurFS"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v8, v14, v15, v16, v17);
  v35 = CGRectInset(v34, -4.0, -4.0);
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  *(float *)&v35.origin.x = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v22, v23, v24, v25, v35.origin.x);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v26;
  v33[1] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v33, 2, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v30, (uint64_t)v13, (uint64_t)v8, (uint64_t)&unk_1E999BE18, v29, self->inputColorSpace, x, y, width, height);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)powerBlurHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double x;
  double y;
  double width;
  double height;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  _QWORD v34[4];
  float v35;
  _QWORD v36[2];
  CGRect v37;
  CGRect v38;

  v36[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v11, (uint64_t)CFSTR("powerBlurHF"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v10, v15, v16, v17, v18);
  v38 = CGRectInset(v37, (double)(int)(float)(a6 * -2.0), (double)(int)(float)(a6 * -2.0));
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1D53D0694;
  v34[3] = &unk_1E9971F30;
  v35 = a6;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v23, v24, v25, v26, a4, a6, a5, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v27;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v36, 1, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v31, (uint64_t)v14, (uint64_t)v10, (uint64_t)v34, v30, self->inputColorSpace, x, y, width, height);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)powerBlurDespeckleHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6 countThreshold:(int)a7 luminanceThreshold:(float)a8 diffAmount:(float)a9
{
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double x;
  double y;
  double width;
  double height;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  _QWORD v45[4];
  float v46;
  _QWORD v47[3];
  CGRect v48;
  CGRect v49;

  v47[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v16, (uint64_t)CFSTR("powerBlurDespeckleHF"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v15, v20, v21, v22, v23);
  v49 = CGRectInset(v48, (double)(int)(float)(a6 * -2.0), (double)(int)(float)(a6 * -2.0));
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = sub_1D53D08D0;
  v45[3] = &unk_1E9971F30;
  v46 = a6;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v28, v29, v30, v31, a4, a6, a5, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v32;
  objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v33, v34, v35, v36, (float)a7, a8, a9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v37;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)v47, 2, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v41, (uint64_t)v19, (uint64_t)v15, (uint64_t)v45, v40, self->inputColorSpace, x, y, width, height);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)powerBlurEarlyOutHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double x;
  double y;
  double width;
  double height;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  _QWORD v34[4];
  float v35;
  _QWORD v36[2];
  CGRect v37;
  CGRect v38;

  v36[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v11, (uint64_t)CFSTR("powerBlurEarlyOutHF"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v10, v15, v16, v17, v18);
  v38 = CGRectInset(v37, (double)(int)(float)(a6 * -2.0), (double)(int)(float)(a6 * -2.0));
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1D53D0AC8;
  v34[3] = &unk_1E9971F30;
  v35 = a6;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v23, v24, v25, v26, a4, a6, a5, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v27;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v36, 1, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v31, (uint64_t)v14, (uint64_t)v10, (uint64_t)v34, v30, self->inputColorSpace, x, y, width, height);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)powerBlurEarlyOut2HF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6 neutralThreshold:(float)a7 thresholdScale:(float)a8
{
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double y;
  double width;
  double height;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  double x;
  _QWORD v43[4];
  float v44;
  _QWORD v45[3];
  CGRect v46;
  CGRect v47;

  v45[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v15, (uint64_t)CFSTR("powerBlurEarlyOut2HF"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v14, v19, v20, v21, v22);
  v47 = CGRectInset(v46, (double)(int)(float)(a6 * -2.0), (double)(int)(float)(a6 * -2.0));
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = sub_1D53D0CFC;
  v43[3] = &unk_1E9971F30;
  v44 = a6;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v26, v27, v28, v29, a4, a6, a8, a7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v30;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v31, v32, v33, v34, a5, 0.0, 0.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v35;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v36, (uint64_t)v45, 2, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v39, (uint64_t)v18, (uint64_t)v14, (uint64_t)v43, v38, self->inputColorSpace, x, y, width, height);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)powerBlurFSHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 neutralFactors:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double x;
  double y;
  double width;
  double height;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  _QWORD v40[4];
  CGRect v41;
  CGRect v42;

  v40[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  objc_msgSend_kernelWithName_(NRKernels, v12, (uint64_t)CFSTR("powerBlurFSHF"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v10, v16, v17, v18, v19);
  v42 = CGRectInset(v41, -4.0, -4.0);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  *(float *)&v42.origin.x = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v24, v25, v26, v27, v42.origin.x);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v29, v30, v31, v32, a5, 0.0, 0.0, 0.0, v28, v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v33;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v34, (uint64_t)v40, 3, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v37, (uint64_t)v15, (uint64_t)v10, (uint64_t)&unk_1E999BE38, v36, self->inputColorSpace, x, y, width, height);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)perceptualToLinear:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v5, (uint64_t)CFSTR("perceptualToLinear"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v9, (uint64_t)v8, (uint64_t)v4, MEMORY[0x1E0C9AA60], self->inputColorSpace, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)expandHalfSizeRGB:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, 2.0, 2.0);
  objc_msgSend_kernelWithName_(NRKernels, v5, (uint64_t)CFSTR("expandHalfSizeRGB"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  v16 = v17;
  v19 = CGRectApplyAffineTransform(v18, &v16);
  v20 = CGRectInset(v19, -1.0, -1.0);
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1E999BE58, 0, self->inputColorSpace, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)powerBlurY:(id)a3 threshold:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double x;
  double y;
  double width;
  double height;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  _QWORD v30[2];
  CGRect v31;
  CGRect v32;

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v7, (uint64_t)CFSTR("powerBlurY"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v6, v11, v12, v13, v14);
  v32 = CGRectInset(v31, -2.0, -2.0);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  *(float *)&v32.origin.x = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v19, v20, v21, v22, v32.origin.x);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v30, 1, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v27, (uint64_t)v10, (uint64_t)v6, (uint64_t)&unk_1E999BE78, v26, self->inputColorSpace, 1, x, y, width, height);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)expandAndMakeDetails:(id)a3 halfSize:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double x;
  double y;
  double width;
  double height;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  CGAffineTransform v38;
  CGAffineTransform v39;
  _QWORD v40[2];
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(&v39, 0, sizeof(v39));
  CGAffineTransformMakeScale(&v39, 2.0, 2.0);
  objc_msgSend_kernelWithName_(NRKernels, v8, (uint64_t)CFSTR("expandAndMakeDetails"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v6, v12, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend_extent(v7, v24, v25, v26, v27);
  v38 = v39;
  v42 = CGRectApplyAffineTransform(v41, &v38);
  v45 = CGRectInset(v42, -1.0, -1.0);
  v43.origin.x = v17;
  v43.origin.y = v19;
  v43.size.width = v21;
  v43.size.height = v23;
  v44 = CGRectUnion(v43, v45);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  v40[0] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)v40, 1, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v35, (uint64_t)v11, (uint64_t)v6, (uint64_t)&unk_1E999BE98, v34, self->inputColorSpace, 1, x, y, width, height);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)reduce:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, 0.5, 0.5);
  objc_msgSend_kernelWithName_(NRKernels, v5, (uint64_t)CFSTR("reduce"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  v16 = v17;
  v19 = CGRectApplyAffineTransform(v18, &v16);
  v20 = CGRectInset(v19, -1.0, -1.0);
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1E999BEB8, 0, self->inputColorSpace, 1, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)gaborFiltersToSmoothedLuminanceAndGradient:(id)a3 smoothAmt:(float)a4 tinyBlurFactor:(float)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double x;
  double y;
  double width;
  double height;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  _QWORD v42[4];
  CGRect v43;
  CGRect v44;

  v42[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v9, (uint64_t)CFSTR("gaborFiltersToSmoothedLuminanceAndGradient"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v8, v13, v14, v15, v16);
  v44 = CGRectInset(v43, -3.0, -3.0);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  *(float *)&v44.origin.x = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v21, v22, v23, v24, v44.origin.x);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v26, v27, v28, v29, (float)((float)((float)(a5 * -4.0) + 1.0) + -0.14062), (float)(a5 + -0.09375), -0.0625, -0.0234375, v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v30;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v31, v32, v33, v34, -0.015625, -0.00390625, 0.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v35;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v36, (uint64_t)v42, 3, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v39, (uint64_t)v12, (uint64_t)v8, (uint64_t)&unk_1E999BED8, v38, self->inputColorSpace, 1, x, y, width, height);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)gaborFiltersToLuminanceAndVectorField:(id)a3 thresh:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double x;
  double y;
  double width;
  double height;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  _QWORD v30[2];
  CGRect v31;
  CGRect v32;

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v7, (uint64_t)CFSTR("gaborFiltersToLuminanceAndVectorField"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v6, v11, v12, v13, v14);
  v32 = CGRectInset(v31, -3.0, -3.0);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  *(float *)&v32.origin.x = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v19, v20, v21, v22, v32.origin.x);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v30, 1, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v27, (uint64_t)v10, (uint64_t)v6, (uint64_t)&unk_1E999BEF8, v26, self->inputColorSpace, 1, x, y, width, height);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)gaborFiltersToVectorField:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v5, (uint64_t)CFSTR("gaborFiltersToVectorField"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  v17 = CGRectInset(v16, -3.0, -3.0);
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1E999BF18, 0, self->inputColorSpace, 1, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)smoothDetailsAlongDirections:(id)a3 directions:(id)a4 amount:(float)a5
{
  id v8;
  id v9;
  double v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double x;
  double y;
  double width;
  double height;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  uint64_t v54;
  _QWORD v55[4];
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v55[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v54 = 0;
  *(float *)&v10 = a5;
  objc_msgSend_computeScaleA_B_withSmoothingAmount_(self, v11, (uint64_t)&v54 + 4, (uint64_t)&v54, v12, v10);
  objc_msgSend_kernelWithName_(NRKernels, v13, (uint64_t)CFSTR("smoothDetailsAlongDirections"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v9, v17, v18, v19, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend_extent(v8, v29, v30, v31, v32);
  v59 = CGRectInset(v56, -2.0, -2.0);
  v57.origin.x = v22;
  v57.origin.y = v24;
  v57.size.width = v26;
  v57.size.height = v28;
  v58 = CGRectUnion(v57, v59);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  v55[0] = v9;
  LODWORD(v58.origin.x) = HIDWORD(v54);
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v37, v38, v39, v40, v58.origin.x);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v41;
  LODWORD(v42) = v54;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v43, v44, v45, v46, v42);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v47;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v48, (uint64_t)v55, 3, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v51, (uint64_t)v16, (uint64_t)v8, (uint64_t)&unk_1E999BF38, v50, self->inputColorSpace, 1, x, y, width, height);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)smoothDetailsAlongDirectionsAtScale:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v51[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v14, (uint64_t)CFSTR("smoothDetailsAlongDirectionsAtScale"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v12, v18, v19, v20, v21);
  v53 = CGRectInset(v52, (double)(int)(float)-a5, (double)(int)(float)-a5);
  x = v53.origin.x;
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  objc_msgSend_extent(v13, v26, v27, v28, v29);
  v56.origin.x = v30;
  v56.origin.y = v31;
  v56.size.width = v32;
  v56.size.height = v33;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  v55 = CGRectUnion(v54, v56);
  v34 = v55.origin.x;
  v35 = v55.origin.y;
  v36 = v55.size.width;
  v37 = v55.size.height;
  *(float *)&v50 = a5;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v38, v39, v40, v41, a5, a6, a7, 0.0, MEMORY[0x1E0C809B0], 3221225472, sub_1D53D1F34, &unk_1E9971F30, v50, v13);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v42;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v43, (uint64_t)v51, 2, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v46, (uint64_t)v17, (uint64_t)v12, (uint64_t)&v49, v45, self->inputColorSpace, v34, v35, v36, v37);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

- (id)smoothDetailsAlongDirectionsAtScaleAntiBloom:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7 maxContrast:(float)a8
{
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[3];
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v53[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v16, (uint64_t)CFSTR("smoothDetailsAlongDirectionsAtScaleAntiBloom"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v14, v20, v21, v22, v23);
  v55 = CGRectInset(v54, (double)(int)(float)-a5, (double)(int)(float)-a5);
  x = v55.origin.x;
  y = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;
  objc_msgSend_extent(v15, v28, v29, v30, v31);
  v58.origin.x = v32;
  v58.origin.y = v33;
  v58.size.width = v34;
  v58.size.height = v35;
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  v57 = CGRectUnion(v56, v58);
  v36 = v57.origin.x;
  v37 = v57.origin.y;
  v38 = v57.size.width;
  v39 = v57.size.height;
  *(float *)&v52 = a5;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v40, v41, v42, v43, a5, a6, a7, a8, MEMORY[0x1E0C809B0], 3221225472, sub_1D53D2194, &unk_1E9971F30, v52, v15);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v44;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v45, (uint64_t)v53, 2, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v48, (uint64_t)v19, (uint64_t)v14, (uint64_t)&v51, v47, self->inputColorSpace, v36, v37, v38, v39);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

- (id)smoothDetailsAlongDirectionsAtScaleWithSharpen:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7 sharp:(float)a8 pscale:(float)a9 coringThreshold:(float)a10
{
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  _QWORD v60[4];
  float v61;
  _QWORD v62[4];
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v62[3] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v18, (uint64_t)CFSTR("smoothDetailsAlongDirectionsAtScaleWithSharpen"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v16, v22, v23, v24, v25);
  v64 = CGRectInset(v63, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  x = v64.origin.x;
  y = v64.origin.y;
  width = v64.size.width;
  height = v64.size.height;
  objc_msgSend_extent(v17, v30, v31, v32, v33);
  v67.origin.x = v34;
  v67.origin.y = v35;
  v67.size.width = v36;
  v67.size.height = v37;
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  v66 = CGRectUnion(v65, v67);
  v38 = v66.origin.x;
  v39 = v66.origin.y;
  v40 = v66.size.width;
  v41 = v66.size.height;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = sub_1D53D244C;
  v60[3] = &unk_1E9971F30;
  v61 = a5;
  v62[0] = v17;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v42, v43, v44, v45, a5, a6, a7, a8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v46;
  objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v47, v48, v49, v50, a9, (float)(a10 * 0.75), (float)(2.0 / a10));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v51;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v52, (uint64_t)v62, 3, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v55, (uint64_t)v21, (uint64_t)v16, (uint64_t)v60, v54, self->inputColorSpace, v38, v39, v40, v41);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

- (id)smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7 sharp:(float)a8 pscale:(float)a9 coringThreshold:(float)a10 maxContrast:(float)a11
{
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  _QWORD v62[4];
  float v63;
  _QWORD v64[4];
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v64[3] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v19, (uint64_t)CFSTR("smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v17, v23, v24, v25, v26);
  v66 = CGRectInset(v65, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  x = v66.origin.x;
  y = v66.origin.y;
  width = v66.size.width;
  height = v66.size.height;
  objc_msgSend_extent(v18, v31, v32, v33, v34);
  v69.origin.x = v35;
  v69.origin.y = v36;
  v69.size.width = v37;
  v69.size.height = v38;
  v67.origin.x = x;
  v67.origin.y = y;
  v67.size.width = width;
  v67.size.height = height;
  v68 = CGRectUnion(v67, v69);
  v39 = v68.origin.x;
  v40 = v68.origin.y;
  v41 = v68.size.width;
  v42 = v68.size.height;
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = sub_1D53D2710;
  v62[3] = &unk_1E9971F30;
  v63 = a5;
  v64[0] = v18;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v43, v44, v45, v46, a5, a6, a7, a8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v47;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v48, v49, v50, v51, a9, (float)(a10 * 0.75), (float)(2.0 / a10), a11);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v52;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v53, (uint64_t)v64, 3, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v56, (uint64_t)v22, (uint64_t)v17, (uint64_t)v62, v55, self->inputColorSpace, v39, v40, v41, v42);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (id)blurGradient:(id)a3 lothresh:(float)a4 factor:(float)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double x;
  double y;
  double width;
  double height;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  _QWORD v38[3];
  CGRect v39;
  CGRect v40;

  v38[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v9, (uint64_t)CFSTR("blurGradient"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v8, v13, v14, v15, v16);
  v40 = CGRectInset(v39, -1.0, -1.0);
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  *(float *)&v40.origin.x = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v21, v22, v23, v24, v40.origin.x);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v25;
  *(float *)&v26 = a5;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v27, v28, v29, v30, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v31;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)v38, 2, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v35, (uint64_t)v12, (uint64_t)v8, (uint64_t)&unk_1E999BF58, v34, self->inputColorSpace, x, y, width, height);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)blurGradientPlusCurvature:(id)a3 lothresh:(float)a4 factor:(float)a5 cthresh:(float)a6 cfactor:(float)a7
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double x;
  double y;
  double width;
  double height;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  _QWORD v54[5];
  CGRect v55;
  CGRect v56;

  v54[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v13, (uint64_t)CFSTR("blurGradientPlusCurvature"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v12, v17, v18, v19, v20);
  v56 = CGRectInset(v55, -1.0, -1.0);
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  *(float *)&v56.origin.x = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v25, v26, v27, v28, v56.origin.x);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v29;
  *(float *)&v30 = a5;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v31, v32, v33, v34, v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v35;
  *(float *)&v36 = a6;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v37, v38, v39, v40, v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v41;
  *(float *)&v42 = a7;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v43, v44, v45, v46, v42);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v47;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v48, (uint64_t)v54, 4, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v51, (uint64_t)v16, (uint64_t)v12, (uint64_t)&unk_1E999BF78, v50, self->inputColorSpace, x, y, width, height);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)expandAndSharpenDetailsThroughGradientMaskGather:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 sharpen:(float)a6 soften:(float)a7 floor:(float)a8 sushiFactors:(id)a9 crop:(CGRect)a10 lumFactors:(id)a11
{
  double height;
  double width;
  double y;
  double x;
  id v23;
  id v24;
  id v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  void *v60;
  id v61;
  _QWORD v62[10];

  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v62[8] = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a9;
  v26 = a11;
  v60 = v23;
  objc_msgSend_kernelWithName_(NRKernels, v27, (uint64_t)CFSTR("expandAndSharpenDetailsThroughGradientMaskGather"), v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v23;
  v62[1] = v24;
  *(float *)&v31 = a6;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v32, v33, v34, v35, v31);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v36;
  *(float *)&v37 = a7;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v38, v39, v40, v41, v37);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v42;
  *(float *)&v43 = a8;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v44, v45, v46, v47, v43);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v48;
  v62[5] = v25;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v49, v50, v51, v52, x, y, width, height);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v53;
  v62[7] = v26;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v54, (uint64_t)v62, 8, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v57, (uint64_t)v30, (uint64_t)v61, (uint64_t)&unk_1E999BF98, v56, self->inputColorSpace, 1, x, y, width, height);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (id)expandAndSharpenDetailsThroughGradientMaskGatherOpponentColor:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 originalY:(id)a6 sharpen:(float)a7 soften:(float)a8 floor:(float)a9 sushiFactors:(id)a10 crop:(CGRect)a11 lumFactors:(id)a12
{
  double height;
  double width;
  double y;
  double x;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[11];

  height = a11.size.height;
  width = a11.size.width;
  y = a11.origin.y;
  x = a11.origin.x;
  v66[9] = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a10;
  v29 = a12;
  v63 = v25;
  v64 = v26;
  objc_msgSend_kernelWithName_(NRKernels, v30, (uint64_t)CFSTR("expandAndSharpenDetailsThroughGradientMaskGatherOpponentColor"), v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v25;
  v66[1] = v26;
  v66[2] = v27;
  *(float *)&v34 = a7;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v35, v36, v37, v38, v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v39;
  *(float *)&v40 = a8;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v41, v42, v43, v44, v40);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v45;
  *(float *)&v46 = a9;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v47, v48, v49, v50, v46);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v51;
  v66[6] = v28;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v52, v53, v54, v55, x, y, width, height);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v56;
  v66[8] = v29;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v57, (uint64_t)v66, 9, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v60, (uint64_t)v33, (uint64_t)v65, (uint64_t)&unk_1E999BFB8, v59, self->inputColorSpace, 1, x, y, width, height);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (id)expandAndSharpenThroughGradientMaskGather:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 sharpen:(float)a6 floor:(float)a7 sushiFactors:(id)a8 crop:(CGRect)a9 lumFactors:(id)a10
{
  double height;
  double width;
  double y;
  double x;
  id v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  id v52;
  _QWORD v53[8];

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  v53[7] = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a8;
  v24 = a10;
  objc_msgSend_kernelWithName_(NRKernels, v25, (uint64_t)CFSTR("expandAndSharpenThroughGradientMaskGather"), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v21;
  v53[1] = v22;
  *(float *)&v29 = a6;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v30, v31, v32, v33, v29);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v34;
  *(float *)&v35 = a7;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v36, v37, v38, v39, v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v40;
  v53[4] = v23;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v41, v42, v43, v44, x, y, width, height);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v45;
  v53[6] = v24;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v46, (uint64_t)v53, 7, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v49, (uint64_t)v28, (uint64_t)v52, (uint64_t)&unk_1E999BFD8, v48, self->inputColorSpace, 1, x, y, width, height);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

- (id)expandAndSharpenThroughGradientMaskGatherOpponentColor:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 originalY:(id)a6 sharpen:(float)a7 floor:(float)a8 sushiFactors:(id)a9 crop:(CGRect)a10 lumFactors:(id)a11
{
  double height;
  double width;
  double y;
  double x;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  void *v55;
  id v56;
  _QWORD v57[9];

  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v57[8] = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a9;
  v27 = a11;
  v55 = v23;
  objc_msgSend_kernelWithName_(NRKernels, v28, (uint64_t)CFSTR("expandAndSharpenThroughGradientMaskGatherOpponentColor"), v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v23;
  v57[1] = v24;
  v57[2] = v25;
  *(float *)&v32 = a7;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v33, v34, v35, v36, v32);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v37;
  *(float *)&v38 = a8;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v39, v40, v41, v42, v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v57[4] = v43;
  v57[5] = v26;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v44, v45, v46, v47, x, y, width, height);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v57[6] = v48;
  v57[7] = v27;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v49, (uint64_t)v57, 8, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v52, (uint64_t)v31, (uint64_t)v56, (uint64_t)&unk_1E999BFF8, v51, self->inputColorSpace, 1, x, y, width, height);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

- (id)expandAndSharpenThroughGradientMask:(id)a3 fullSizeY:(id)a4 sharpen:(float)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double x;
  double y;
  double width;
  double height;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  CGAffineTransform v45;
  CGAffineTransform v46;
  _QWORD v47[3];
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v47[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeScale(&v46, 2.0, 2.0);
  objc_msgSend_kernelWithName_(NRKernels, v10, (uint64_t)CFSTR("expandAndSharpenThroughGradientMask"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v9, v14, v15, v16, v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend_extent(v8, v26, v27, v28, v29);
  v45 = v46;
  v52 = CGRectApplyAffineTransform(v48, &v45);
  v49.origin.x = v19;
  v49.origin.y = v21;
  v49.size.width = v23;
  v49.size.height = v25;
  v50 = CGRectUnion(v49, v52);
  v51 = CGRectInset(v50, -1.0, -1.0);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  v47[0] = v9;
  *(float *)&v51.origin.x = a5;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v34, v35, v36, v37, v51.origin.x);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v38;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v39, (uint64_t)v47, 2, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v42, (uint64_t)v13, (uint64_t)v8, (uint64_t)&unk_1E999C018, v41, self->inputColorSpace, 1, x, y, width, height);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)YAndRGBGather:(id)a3 cnrRGB:(id)a4 sushiFactors:(id)a5 crop:(CGRect)a6 lumFactors:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  _QWORD v34[5];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v34[4] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  objc_msgSend_kernelWithName_(NRKernels, v19, (uint64_t)CFSTR("YAndRGBGather"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v16;
  v34[1] = v17;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v23, v24, v25, v26, x, y, width, height);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v27;
  v34[3] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v34, 4, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v31, (uint64_t)v22, (uint64_t)v15, 0, v30, self->inputColorSpace, x, y, width, height);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)YAndRGBGatherOpponentColor:(id)a3 cnrRGB:(id)a4 originalY:(id)a5 sushiFactors:(id)a6 crop:(CGRect)a7 lumFactors:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  _QWORD v37[6];

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v37[5] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  objc_msgSend_kernelWithName_(NRKernels, v22, (uint64_t)CFSTR("YAndRGBGatherOpponentColor"), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v26, v27, v28, v29, x, y, width, height, v18, v19, v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v30;
  v37[4] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v31, (uint64_t)v37, 5, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v34, (uint64_t)v25, (uint64_t)v17, 0, v33, self->inputColorSpace, x, y, width, height);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)expandAndAddDetailsWithOverdrive:(id)a3 fullSize:(id)a4 contrast:(float)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double x;
  double y;
  double width;
  double height;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  CGAffineTransform v45;
  CGAffineTransform v46;
  _QWORD v47[3];
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v47[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeScale(&v46, 2.0, 2.0);
  objc_msgSend_kernelWithName_(NRKernels, v10, (uint64_t)CFSTR("expandAndAddDetailsWithOverdrive"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v9, v14, v15, v16, v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend_extent(v8, v26, v27, v28, v29);
  v45 = v46;
  v49 = CGRectApplyAffineTransform(v48, &v45);
  v52 = CGRectInset(v49, -1.0, -1.0);
  v50.origin.x = v19;
  v50.origin.y = v21;
  v50.size.width = v23;
  v50.size.height = v25;
  v51 = CGRectUnion(v50, v52);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  v47[0] = v9;
  *(float *)&v51.origin.x = a5;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v34, v35, v36, v37, v51.origin.x);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v38;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v39, (uint64_t)v47, 2, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v42, (uint64_t)v13, (uint64_t)v8, (uint64_t)&unk_1E999C038, v41, self->inputColorSpace, 1, x, y, width, height);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)fineGrainNoise:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v5, (uint64_t)CFSTR("FineGrainNoise"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  v17 = CGRectInset(v16, -1.0, -1.0);
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1E999C058, 0, self->inputColorSpace, 1, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fineGrainNoise2:(id)a3 tinyBlurFactor:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double x;
  double y;
  double width;
  double height;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  _QWORD v35[3];
  CGRect v36;
  CGRect v37;

  v35[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v7, (uint64_t)CFSTR("FineGrainNoise2"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v6, v11, v12, v13, v14);
  v37 = CGRectInset(v36, -2.0, -2.0);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v19, v20, v21, v22, (float)((float)((float)(a4 * -4.0) + 1.0) + -0.14062), (float)(a4 + -0.09375), -0.0625, -0.0234375);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v23;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v24, v25, v26, v27, -0.015625, -0.00390625, 0.0, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v28;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v29, (uint64_t)v35, 2, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v32, (uint64_t)v10, (uint64_t)v6, (uint64_t)&unk_1E999C078, v31, self->inputColorSpace, 1, x, y, width, height);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)expandAndAddDetailsThroughGradientMask:(id)a3 fullSize:(id)a4 fullSizeDetails:(id)a5 fullSizeMask:(id)a6 amount:(float)a7 contrastOverdrive:(float)a8 interpolant:(float)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double x;
  double y;
  double width;
  double height;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGAffineTransform v79;
  CGAffineTransform v80;
  _QWORD v81[5];
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v81[4] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  memset(&v80, 0, sizeof(v80));
  CGAffineTransformMakeScale(&v80, 2.0, 2.0);
  objc_msgSend_kernelWithName_(NRKernels, v17, (uint64_t)CFSTR("expandAndAddDetailsThroughGradientMask"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v14, v21, v22, v23, v24);
  v74 = v26;
  v75 = v25;
  v72 = v28;
  v73 = v27;
  objc_msgSend_extent(v15, v29, v30, v31, v32);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  objc_msgSend_extent(v16, v41, v42, v43, v44);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  objc_msgSend_extent(v13, v53, v54, v55, v56);
  v79 = v80;
  v83 = CGRectApplyAffineTransform(v82, &v79);
  v88 = CGRectInset(v83, -1.0, -1.0);
  v84.origin.x = v46;
  v84.origin.y = v48;
  v84.size.width = v50;
  v84.size.height = v52;
  v89 = CGRectUnion(v84, v88);
  v85.origin.x = v34;
  v85.origin.y = v36;
  v85.size.width = v38;
  v85.size.height = v40;
  v90 = CGRectUnion(v85, v89);
  v86.origin.y = v74;
  v86.origin.x = v75;
  v86.size.height = v72;
  v86.size.width = v73;
  v87 = CGRectUnion(v86, v90);
  x = v87.origin.x;
  y = v87.origin.y;
  width = v87.size.width;
  height = v87.size.height;
  v81[0] = v14;
  v81[1] = v15;
  v81[2] = v16;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v61, v62, v63, v64, a7, a8, a9, 0.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v65;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v66, (uint64_t)v81, 4, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v69, (uint64_t)v20, (uint64_t)v13, (uint64_t)&unk_1E999C098, v68, self->inputColorSpace, 1, x, y, width, height);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  return v70;
}

- (id)compositeThroughGradientMask:(id)a3 fullSize:(id)a4 fullSizeMask:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double x;
  double y;
  double width;
  double height;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  _QWORD v57[3];
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v57[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_kernelWithName_(NRKernels, v11, (uint64_t)CFSTR("compositeThroughGradientMask"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v9, v15, v16, v17, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend_extent(v10, v27, v28, v29, v30);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend_extent(v8, v39, v40, v41, v42);
  v61.origin.x = v43;
  v61.origin.y = v44;
  v61.size.width = v45;
  v61.size.height = v46;
  v58.origin.x = v32;
  v58.origin.y = v34;
  v58.size.width = v36;
  v58.size.height = v38;
  v62 = CGRectUnion(v58, v61);
  v59.origin.x = v20;
  v59.origin.y = v22;
  v59.size.width = v24;
  v59.size.height = v26;
  v60 = CGRectUnion(v59, v62);
  x = v60.origin.x;
  y = v60.origin.y;
  width = v60.size.width;
  height = v60.size.height;
  v57[0] = v9;
  v57[1] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v51, (uint64_t)v57, 2, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v54, (uint64_t)v14, (uint64_t)v8, 0, v53, self->inputColorSpace, 1, x, y, width, height);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (id)expandAndAddDetailsThroughGradientMask2:(id)a3 halfSize:(id)a4 fullSizeDetails:(id)a5 soften:(float)a6 sharpen:(float)a7
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double x;
  double y;
  double width;
  double height;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  CGAffineTransform v68;
  CGAffineTransform v69;
  _QWORD v70[5];
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v70[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  memset(&v69, 0, sizeof(v69));
  CGAffineTransformMakeScale(&v69, 2.0, 2.0);
  objc_msgSend_kernelWithName_(NRKernels, v13, (uint64_t)CFSTR("expandAndAddDetailsThroughGradientMask2"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v10, v17, v18, v19, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend_extent(v12, v29, v30, v31, v32);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  objc_msgSend_extent(v11, v41, v42, v43, v44);
  v68 = v69;
  v72 = CGRectApplyAffineTransform(v71, &v68);
  v76 = CGRectInset(v72, -1.0, -1.0);
  v73.origin.x = v34;
  v73.origin.y = v36;
  v73.size.width = v38;
  v73.size.height = v40;
  v77 = CGRectUnion(v73, v76);
  v74.origin.x = v22;
  v74.origin.y = v24;
  v74.size.width = v26;
  v74.size.height = v28;
  v75 = CGRectUnion(v74, v77);
  x = v75.origin.x;
  y = v75.origin.y;
  width = v75.size.width;
  height = v75.size.height;
  v70[0] = v11;
  v70[1] = v12;
  *(float *)&v75.origin.x = a6;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v49, v50, v51, v52, v75.origin.x);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v53;
  *(float *)&v54 = a7;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v55, v56, v57, v58, v54);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v59;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v60, (uint64_t)v70, 4, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v63, (uint64_t)v16, (uint64_t)v10, (uint64_t)&unk_1E999C0B8, v62, self->inputColorSpace, 1, x, y, width, height);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (id)expandAndAddDetailsThroughGradientMask3:(id)a3 fullSize:(id)a4 fullSizeDetails:(id)a5 fullSizeMask:(id)a6 amount:(float)a7 sharpen:(float)a8 interpolant:(float)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double x;
  double y;
  double width;
  double height;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGAffineTransform v79;
  CGAffineTransform v80;
  _QWORD v81[5];
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v81[4] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  memset(&v80, 0, sizeof(v80));
  CGAffineTransformMakeScale(&v80, 2.0, 2.0);
  objc_msgSend_kernelWithName_(NRKernels, v17, (uint64_t)CFSTR("expandAndAddDetailsThroughGradientMask3"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v14, v21, v22, v23, v24);
  v74 = v26;
  v75 = v25;
  v72 = v28;
  v73 = v27;
  objc_msgSend_extent(v15, v29, v30, v31, v32);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  objc_msgSend_extent(v16, v41, v42, v43, v44);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  objc_msgSend_extent(v13, v53, v54, v55, v56);
  v79 = v80;
  v83 = CGRectApplyAffineTransform(v82, &v79);
  v88 = CGRectInset(v83, -1.0, -1.0);
  v84.origin.x = v46;
  v84.origin.y = v48;
  v84.size.width = v50;
  v84.size.height = v52;
  v89 = CGRectUnion(v84, v88);
  v85.origin.x = v34;
  v85.origin.y = v36;
  v85.size.width = v38;
  v85.size.height = v40;
  v90 = CGRectUnion(v85, v89);
  v86.origin.y = v74;
  v86.origin.x = v75;
  v86.size.height = v72;
  v86.size.width = v73;
  v87 = CGRectUnion(v86, v90);
  x = v87.origin.x;
  y = v87.origin.y;
  width = v87.size.width;
  height = v87.size.height;
  v81[0] = v14;
  v81[1] = v15;
  v81[2] = v16;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v61, v62, v63, v64, a7, a8, a9, 0.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v65;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v66, (uint64_t)v81, 4, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v69, (uint64_t)v20, (uint64_t)v13, (uint64_t)&unk_1E999C0D8, v68, self->inputColorSpace, 1, x, y, width, height);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  return v70;
}

- (id)addNoise:(id)a3 noise:(id)a4 amount:(float)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double x;
  double y;
  double width;
  double height;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  id v47;
  _QWORD v49[3];
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v12 = a4;
  if (v12 && a5 >= 0.001)
  {
    objc_msgSend_kernelWithName_(NRKernels, v9, (uint64_t)CFSTR("AddNoise"), v10, v11, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v8, v14, v15, v16, v17);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend_extent(v12, v26, v27, v28, v29);
    v52.origin.x = v30;
    v52.origin.y = v31;
    v52.size.width = v32;
    v52.size.height = v33;
    v50.origin.x = v19;
    v50.origin.y = v21;
    v50.size.width = v23;
    v50.size.height = v25;
    v51 = CGRectUnion(v50, v52);
    x = v51.origin.x;
    y = v51.origin.y;
    width = v51.size.width;
    height = v51.size.height;
    v49[0] = v12;
    *(float *)&v51.origin.x = a5;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v38, v39, v40, v41, v51.origin.x);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v42;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v43, (uint64_t)v49, 2, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v46, (uint64_t)v13, (uint64_t)v8, 0, v45, self->inputColorSpace, 1, x, y, width, height);
    v47 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v47 = v8;
  }

  return v47;
}

- (id)vectorFieldToDirectionsAndGradients:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v5, (uint64_t)CFSTR("vectorFieldToDirectionsAndGradients"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_isAlphaOne_(self, v9, (uint64_t)v8, (uint64_t)v4, 0, self->inputColorSpace, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)smoothVectorFieldAlongVectors:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v5, (uint64_t)CFSTR("smoothVectorFieldAlongVectors"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  v17 = CGRectInset(v16, -3.0, -3.0);
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1E999C0F8, 0, self->inputColorSpace, 1, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)directionsToCurvature:(id)a3 threshold:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double x;
  double y;
  double width;
  double height;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  _QWORD v30[2];
  CGRect v31;
  CGRect v32;

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v7, (uint64_t)CFSTR("directionsToCurvature"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v6, v11, v12, v13, v14);
  v32 = CGRectInset(v31, -4.0, -4.0);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  *(float *)&v32.origin.x = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v19, v20, v21, v22, v32.origin.x);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v30, 1, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v27, (uint64_t)v10, (uint64_t)v6, (uint64_t)&unk_1E999C118, v26, self->inputColorSpace, x, y, width, height);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)mergeHalfSizeCurvature:(id)a3 intoFullSizeCurvature:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double x;
  double y;
  double width;
  double height;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  CGAffineTransform v38;
  CGAffineTransform v39;
  _QWORD v40[2];
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(&v39, 0, sizeof(v39));
  CGAffineTransformMakeScale(&v39, 2.0, 2.0);
  objc_msgSend_kernelWithName_(NRKernels, v8, (uint64_t)CFSTR("mergeHalfSizeCurvature"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v7, v12, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend_extent(v6, v24, v25, v26, v27);
  v38 = v39;
  v45 = CGRectApplyAffineTransform(v41, &v38);
  v42.origin.x = v17;
  v42.origin.y = v19;
  v42.size.width = v21;
  v42.size.height = v23;
  v43 = CGRectUnion(v42, v45);
  v44 = CGRectInset(v43, -1.0, -1.0);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  v40[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)v40, 1, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v35, (uint64_t)v11, (uint64_t)v7, (uint64_t)&unk_1E999C138, v34, self->inputColorSpace, x, y, width, height);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)viewY:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  _QWORD v28[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v28[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v13, (uint64_t)CFSTR("viewY"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v17, v18, v19, v20, x, y, width, height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v28, 2, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v25, (uint64_t)v16, (uint64_t)v11, 0, v24, self->inputColorSpace, x, y, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)viewBlend:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  _QWORD v28[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v28[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v13, (uint64_t)CFSTR("viewBlend"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v17, v18, v19, v20, x, y, width, height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v28, 2, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v25, (uint64_t)v16, (uint64_t)v11, 0, v24, self->inputColorSpace, x, y, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)viewD:(id)a3 factor:(float)a4 crop:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  _QWORD v33[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v33[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v12, (uint64_t)CFSTR("viewD"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v16 = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v17, v18, v19, v20, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v21;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v22, v23, v24, v25, x, y, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v26;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v33, 2, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v30, (uint64_t)v15, (uint64_t)v11, 0, v29, self->inputColorSpace, x, y, width, height);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)viewTG:(id)a3 lothresh:(float)a4 factor:(float)a5 crop:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  _QWORD v41[4];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v41[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v14, (uint64_t)CFSTR("viewTG"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v19, v20, v21, v22, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = a5;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v25, v26, v27, v28, v24, v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v29;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v30, v31, v32, v33, x, y, width, height);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v34;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v41, 3, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v38, (uint64_t)v17, (uint64_t)v13, 0, v37, self->inputColorSpace, x, y, width, height);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)viewVF:(id)a3 crop:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  _QWORD v25[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v10, (uint64_t)CFSTR("viewVF"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v14, v15, v16, v17, x, y, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v25, 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v22, (uint64_t)v13, (uint64_t)v9, 0, v21, self->inputColorSpace, x, y, width, height);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)viewG:(id)a3 scale:(float)a4 crop:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  _QWORD v33[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v33[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v12, (uint64_t)CFSTR("viewG"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v16 = a4;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v17, v18, v19, v20, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v21;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v22, v23, v24, v25, x, y, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v26;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v33, 2, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v30, (uint64_t)v15, (uint64_t)v11, 0, v29, self->inputColorSpace, x, y, width, height);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)viewDIR:(id)a3 do360:(BOOL)a4 crop:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v9;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  void *v35;
  _QWORD v36[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  v36[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  if (v9)
  {
    objc_msgSend_kernelWithName_(NRKernels, v11, (uint64_t)CFSTR("viewDIR360"), v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v16, v17, v18, v19, x, y, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v20;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v36, 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v24, (uint64_t)v15, (uint64_t)v14, 0, v23, self->inputColorSpace, 0.0, 0.0, width, height);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_kernelWithName_(NRKernels, v11, (uint64_t)CFSTR("viewDIR180"), v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v26, v27, v28, v29, x, y, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v20;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)&v35, 1, v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v32, (uint64_t)v15, (uint64_t)v14, 0, v23, self->inputColorSpace, 0.0, 0.0, width, height);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v25;

  return v33;
}

- (id)viewC:(id)a3 crop:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  _QWORD v25[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend_kernelWithName_(NRKernels, v10, (uint64_t)CFSTR("viewC"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v14, v15, v16, v17, x, y, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v25, 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v22, (uint64_t)v13, (uint64_t)v9, 0, v21, self->inputColorSpace, 0.0, 0.0, width, height);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)viewGDIR:(id)a3 do360:(BOOL)a4 crop:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v9;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  void *v35;
  _QWORD v36[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  v36[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  if (v9)
  {
    objc_msgSend_kernelWithName_(NRKernels, v11, (uint64_t)CFSTR("viewGDIR360"), v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v16, v17, v18, v19, x, y, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v20;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v36, 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v24, (uint64_t)v15, (uint64_t)v14, 0, v23, self->inputColorSpace, 0.0, 0.0, width, height);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_kernelWithName_(NRKernels, v11, (uint64_t)CFSTR("viewGDIR180"), v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v26, v27, v28, v29, x, y, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v20;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)&v35, 1, v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v32, (uint64_t)v15, (uint64_t)v14, 0, v23, self->inputColorSpace, 0.0, 0.0, width, height);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v25;

  return v33;
}

- (id)viewTGDIR:(id)a3 lothresh:(float)a4 factor:(float)a5 do360:(BOOL)a6 crop:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v11;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  _QWORD v61[3];
  _QWORD v62[4];

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v11 = a6;
  v62[3] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  if (v11)
  {
    objc_msgSend_kernelWithName_(NRKernels, v15, (uint64_t)CFSTR("viewTGDIR360"), v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v20 = a4;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v21, v22, v23, v24, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v25;
    *(float *)&v26 = a5;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v27, v28, v29, v30, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v31;
    objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v32, v33, v34, v35, x, y, width, height);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v36;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v62, 3, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v40, (uint64_t)v19, (uint64_t)v18, 0, v39, self->inputColorSpace, 0.0, 0.0, width, height);
    v41 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_kernelWithName_(NRKernels, v15, (uint64_t)CFSTR("viewTGDIR180"), v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v42 = a4;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v43, v44, v45, v46, v42);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v25;
    *(float *)&v47 = a5;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v48, v49, v50, v51, v47);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v31;
    objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v52, v53, v54, v55, x, y, width, height);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v36;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v56, (uint64_t)v61, 3, v57);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v58, (uint64_t)v19, (uint64_t)v18, 0, v39, self->inputColorSpace, 0.0, 0.0, width, height);
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v41;

  return v59;
}

- (id)viewRGB:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  _QWORD v28[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v28[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v13, (uint64_t)CFSTR("viewRGB"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v17, v18, v19, v20, x, y, width, height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v28, 2, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v25, (uint64_t)v16, (uint64_t)v11, 0, v24, self->inputColorSpace, 0.0, 0.0, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)viewHue:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  _QWORD v28[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v28[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend_kernelWithName_(NRKernels, v13, (uint64_t)CFSTR("viewHue"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E0C9DDF8], v17, v18, v19, v20, x, y, width, height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v28, 2, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v25, (uint64_t)v16, (uint64_t)v11, 0, v24, self->inputColorSpace, 0.0, 0.0, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)computeLowThreshold:(float *)a3 andFactor:(float *)a4 withThreshold:(float)a5 andSoftness:(float)a6
{
  float v6;
  float v7;

  if (a5 < 0.00065)
    a5 = 0.00065;
  v6 = a5 * a6;
  v7 = a5 - (float)(v6 * 0.5);
  *a3 = v7;
  *a4 = 1.0 / (float)((float)(a5 + (float)(v6 * 0.5)) - v7);
}

- (void)computeScaleA:(float *)a3 B:(float *)a4 withSmoothingAmount:(float)a5
{
  *a3 = (float)(a5 * -0.5) + 1.0;
  *a4 = a5 * 0.25;
}

- (id)outputUnboost:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  id v56;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[10];

  v61[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_intValue(self->inputBoostMethod, v5, v6, v7, v8))
  {
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v9, v10, v11, v12, 0.0106899999, 0.0437199995, 0.146479994, 0.667469978);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v13, v14, v15, v16, 654.581604, -28.2951641, 1.25156403, 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v17, v18, v19, v20, 68.604454, -10.1250257, 1.06397295, 0.000645000022);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v21, v22, v23, v24, 5.20553207, -2.30455089, 0.743704975, 0.0049970001);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v26, v27, v28, v29, 0.753764987, -0.49348101, 0.499689013, 0.015873);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v31, v32, v33, v34, 6.54402304, -12.7344961, 9.10175419, -1.99401903);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v36, v37, v38, v39, 232.470688, -640.049011, 589.582336, -181.004013);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = 1074885725;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v42, v43, v44, v45, v41);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v4;
    objc_msgSend_kernelWithName_(NRKernels, v48, (uint64_t)CFSTR("inverseBoost"), v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v58;
    v61[1] = &unk_1E99D1380;
    v61[2] = v60;
    v61[3] = v59;
    v61[4] = v25;
    v61[5] = v30;
    v61[6] = v35;
    v61[7] = v40;
    v61[8] = v46;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v52, (uint64_t)v61, 9, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v55, (uint64_t)v51, (uint64_t)v47, (uint64_t)v54, self->inputColorSpace, 1);
    v56 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v56 = v4;
  }

  return v56;
}

- (id)outputBoost:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  id v48;
  void *v50;
  _QWORD v51[7];

  v51[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_intValue(self->inputBoostMethod, v5, v6, v7, v8))
  {
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v9, v10, v11, v12, 0.100000001, 0.200000003, 0.5, 1.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v13, v14, v15, v16, -53.0999899, 16.819998, 0.799000025, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v18, v19, v20, v21, -12.3000026, 2.62000144, 2.41499972, -0.0603999913);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v23, v24, v25, v26, 2.64814695, -4.82888758, 3.60077739, -0.11918516);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v28, v29, v30, v31, 0.492000163, -1.72000039, 2.10900028, 0.118999943);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 1054951342;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v34, v35, v36, v37, v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v4;
    objc_msgSend_kernelWithName_(NRKernels, v40, (uint64_t)CFSTR("boost"), v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v50;
    v51[1] = v17;
    v51[2] = v22;
    v51[3] = v27;
    v51[4] = v32;
    v51[5] = v38;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v44, (uint64_t)v51, 6, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v47, (uint64_t)v43, (uint64_t)v39, (uint64_t)v46, self->inputColorSpace, 1);
    v48 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = v4;
  }

  return v48;
}

- (float)adjustedRNAmount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  float v6;
  float v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;

  objc_msgSend_floatValue(self->inputScaleFactor, a2, v2, v3, v4);
  v7 = fminf(fmaxf(v6, 0.0), 1.0);
  objc_msgSend_floatValue(self->inputRepresentativeNoise, v8, v9, v10, v11);
  return v7 * v12;
}

- (id)outputCNR:(id)a3 extent:(CGRect)a4 returningDebugProduct:(BOOL *)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  float v12;
  float v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  float v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  float v33;
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
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  float v72;
  BOOL v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v105;
  BOOL v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;

  v11 = a3;
  if (a5)
    *a5 = 0;
  objc_msgSend_adjustedRNAmount(self, v7, v8, v9, v10);
  v13 = v12;
  objc_msgSend_floatValue(self->inputCNRAmount, v14, v15, v16, v17);
  v19 = v18;
  objc_msgSend_floatValue(self->inputBaselineExposure, v20, v21, v22, v23);
  v25 = v24;
  v26 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend_X(self->inputNeutralFactors, v27, v28, v29, v30);
  v32 = v31;
  v33 = exp2f(v25);
  objc_msgSend_Y(self->inputNeutralFactors, v34, v35, v36, v37);
  v39 = v38;
  objc_msgSend_Z(self->inputNeutralFactors, v40, v41, v42, v43);
  objc_msgSend_vectorWithX_Y_Z_W_(v26, v45, v46, v47, v48, v32 * v33, v39 * v33, v44 * v33, 1.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 1.0;
  if (v13 > 1.5)
    v54 = 5.0;
  v55 = (float)(v13 * 0.024249) * v19;
  if ((float)(v55 * 3.5) >= 0.0051961)
    v56 = v55 * 3.5;
  else
    v56 = 0.0;
  if ((float)(v55 * 1.3) >= 0.0051961)
    v57 = v55 * 1.3;
  else
    v57 = 0.0;
  if ((float)(v55 * 0.75) >= 0.0051961)
    v58 = v55 * 0.75;
  else
    v58 = 0.0;
  v59 = v55 * 0.2;
  if ((float)(v54 * v59) >= 0.0051961)
    v60 = v59;
  else
    v60 = 0.0;
  objc_msgSend_floatValue(self->inputMoireRadius, v49, v50, v51, v52);
  v62 = v61;
  objc_msgSend_floatValue(self->inputMoireAmount, v63, v64, v65, v66);
  v72 = *(float *)&v71 * 0.04;
  if ((float)(*(float *)&v71 * 0.04) == 0.0)
    v62 = 0.0;
  if (v56 != 0.0 || v62 != 0.0 || (objc_msgSend_BOOLValue(self->inputShowHF, v67, v68, v69, v70) & 1) != 0)
  {
    if (v62 > 0.0 || objc_msgSend_BOOLValue(self->inputShowHF, v67, v68, v69, v70))
    {
      v73 = v57 != 0.0 || v62 > 2.0;
      if (v73 || (objc_msgSend_BOOLValue(self->inputShowHF, v67, v68, v69, v70) & 1) != 0)
      {
        *(float *)&v71 = v56;
        objc_msgSend_extractHalfSizeRGBHF_neutralFactors_threshold_(self, v67, (uint64_t)v11, (uint64_t)v53, v70, v71);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_BOOLValue(self->inputShowHF, v75, v76, v77, v78))
        {
          v87 = v74;
LABEL_77:
          v11 = v87;
          goto LABEL_78;
        }
        if (v56 > 0.0 || v62 > 0.0)
        {
          LODWORD(v84) = 1.0;
          *(float *)&v82 = v56;
          *(float *)&v83 = v72;
          objc_msgSend_powerBlurHF_threshold_moireAmount_scale_(self, v79, (uint64_t)v74, v80, v81, v82, v83, v84);
          v95 = objc_claimAutoreleasedReturnValue();

          v88 = (void *)v95;
        }
        else
        {
          v88 = v74;
        }
        if (v57 > 0.0 || v62 >= 3.0)
        {
          if (v57 > 0.0)
          {
            LODWORD(v85) = 1033650332;
            LODWORD(v86) = 1076258406;
            LODWORD(v84) = 3.0;
            *(float *)&v82 = v57;
            *(float *)&v83 = v72;
            objc_msgSend_powerBlurDespeckleHF_threshold_moireAmount_scale_countThreshold_luminanceThreshold_diffAmount_(self, v79, (uint64_t)v88, 5, v81, v82, v83, v84, v85, v86);
          }
          else
          {
            LODWORD(v84) = 3.0;
            *(float *)&v82 = v57;
            *(float *)&v83 = v72;
            objc_msgSend_powerBlurHF_threshold_moireAmount_scale_(self, v79, (uint64_t)v88, v80, v81, v82, v83, v84);
          }
          v103 = objc_claimAutoreleasedReturnValue();

          v88 = (void *)v103;
        }
        if (v58 > 0.0 || v62 >= 7.0)
        {
          LODWORD(v84) = 7.0;
          *(float *)&v82 = v58;
          *(float *)&v83 = v72;
          objc_msgSend_powerBlurEarlyOutHF_threshold_moireAmount_scale_(self, v79, (uint64_t)v88, v80, v81, v82, v83, v84);
          v105 = objc_claimAutoreleasedReturnValue();

          v88 = (void *)v105;
        }
        v106 = v62 < 14.0 && v60 <= 0.0;
        if (v13 <= 1.5)
        {
          if (!v106)
          {
            LODWORD(v84) = 14.0;
            *(float *)&v82 = v60;
            *(float *)&v83 = v72;
            objc_msgSend_powerBlurEarlyOutHF_threshold_moireAmount_scale_(self, v79, (uint64_t)v88, v80, v81, v82, v83, v84);
            v107 = objc_claimAutoreleasedReturnValue();
            goto LABEL_62;
          }
        }
        else if (!v106)
        {
          LODWORD(v85) = 1041865114;
          LODWORD(v84) = 14.0;
          LODWORD(v86) = 5.0;
          *(float *)&v82 = v60;
          *(float *)&v83 = v72;
          objc_msgSend_powerBlurEarlyOut2HF_threshold_moireAmount_scale_neutralThreshold_thresholdScale_(self, v79, (uint64_t)v88, v80, v81, v82, v83, v84, v85, v86);
          v107 = objc_claimAutoreleasedReturnValue();
LABEL_62:
          v108 = (void *)v107;

          v88 = v108;
        }
LABEL_75:
        objc_msgSend_perceptualToLinear_(self, v79, (uint64_t)v88, v80, v81);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_expandHalfSizeRGB_(self, v113, (uint64_t)v90, v114, v115);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_76;
      }
      *(float *)&v71 = v56;
      objc_msgSend_highFrequencyIntoAlpha_threshold_neutralFactors_(self, v67, (uint64_t)v11, (uint64_t)v53, v70, v71);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v91 = v56;
      *(float *)&v92 = v72;
      objc_msgSend_powerBlurFSHF_threshold_moireAmount_neutralFactors_(self, v93, (uint64_t)v90, (uint64_t)v53, v94, v91, v92);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v57 != 0.0)
      {
        objc_msgSend_extractHalfSizeRGB_neutralFactors_(self, v67, (uint64_t)v11, (uint64_t)v53, v70);
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56 <= 0.0)
        {
          v88 = v97;
        }
        else
        {
          LODWORD(v99) = 1.0;
          *(float *)&v98 = v56;
          objc_msgSend_powerBlur_threshold_scale_(self, v79, (uint64_t)v97, v80, v81, v98, v99);
          v102 = objc_claimAutoreleasedReturnValue();

          v88 = (void *)v102;
        }
        if (v57 > 0.0)
        {
          LODWORD(v100) = 1033650332;
          LODWORD(v101) = 1076258406;
          LODWORD(v99) = 3.0;
          *(float *)&v98 = v57;
          objc_msgSend_powerBlurDespeckle_threshold_scale_countThreshold_luminanceThreshold_diffAmount_(self, v79, (uint64_t)v88, 5, v81, v98, v99, v100, v101);
          v109 = objc_claimAutoreleasedReturnValue();

          v88 = (void *)v109;
        }
        if (v58 > 0.0)
        {
          LODWORD(v99) = 7.0;
          *(float *)&v98 = v58;
          objc_msgSend_powerBlurEarlyOut_threshold_scale_(self, v79, (uint64_t)v88, v80, v81, v98, v99);
          v110 = objc_claimAutoreleasedReturnValue();

          v88 = (void *)v110;
        }
        if (v13 <= 1.5)
        {
          if (v60 <= 0.0)
            goto LABEL_75;
          LODWORD(v99) = 14.0;
          *(float *)&v98 = v60;
          objc_msgSend_powerBlurEarlyOut_threshold_scale_(self, v79, (uint64_t)v88, v80, v81, v98, v99);
          v111 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v60 <= 0.0)
            goto LABEL_75;
          LODWORD(v100) = 1041865114;
          LODWORD(v99) = 14.0;
          LODWORD(v101) = 5.0;
          *(float *)&v98 = v60;
          objc_msgSend_powerBlurEarlyOut2_threshold_scale_neutralThreshold_thresholdScale_(self, v79, (uint64_t)v88, v80, v81, v98, v99, v100, v101);
          v111 = objc_claimAutoreleasedReturnValue();
        }
        v112 = (void *)v111;

        v88 = v112;
        goto LABEL_75;
      }
      *(float *)&v71 = v56;
      objc_msgSend_powerBlurFS_threshold_neutralFactors_(self, v67, (uint64_t)v11, (uint64_t)v53, v70, v71);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v11;
    }
LABEL_76:

    v87 = v89;
    goto LABEL_77;
  }
  objc_msgSend_multiply_byNeutralFactors_(self, v67, (uint64_t)v11, (uint64_t)v53, v70);
  v87 = (id)objc_claimAutoreleasedReturnValue();
LABEL_78:
  v116 = v87;

  return v116;
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
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
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
  NSObject *v33;
  NSObject *v34;
  void (**v35)(_QWORD);
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  float v45;
  float v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  float v51;
  float v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  float v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float v63;
  float v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  float v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  float v74;
  float v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  float v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  float v85;
  float v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  float v91;
  unsigned int v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  void *v115;
  double v116;
  double v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  id v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  double v167;
  double v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  double v173;
  double v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  double v179;
  double v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  float v185;
  float v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  double v192;
  double v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  double v198;
  double v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  double v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  double v215;
  double v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  double v221;
  double v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  double v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  float v237;
  void *v238;
  const char *v239;
  const char *v240;
  uint64_t v241;
  double v242;
  double v243;
  float v244;
  float v245;
  float v246;
  float v247;
  float v248;
  float v249;
  int v250;
  int v251;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  double v256;
  double v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  double v263;
  double v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  const char *v268;
  id v269;
  double v270;
  double v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  double v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  double v299;
  const char *v300;
  uint64_t v301;
  double v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  double v306;
  double v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  double v311;
  double v312;
  const char *v313;
  double v314;
  const char *v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  double v323;
  double v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  const char *v328;
  double v329;
  double v330;
  double v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  double v337;
  double v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  double v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  double v349;
  double v350;
  const char *v351;
  double v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  const char *v356;
  void *v357;
  id v358;
  const char *v359;
  double v360;
  double v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  double v383;
  float v384;
  double v385;
  uint64_t v386;
  double v387;
  double v388;
  const char *v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  double v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  double v400;
  double v401;
  double v402;
  double v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  double v408;
  double v409;
  double v410;
  double v411;
  double v412;
  double v413;
  double v414;
  const char *v415;
  uint64_t v416;
  void *v417;
  double v418;
  double v419;
  double v420;
  double v421;
  double v422;
  double v423;
  double v424;
  const char *v425;
  uint64_t v426;
  void *v427;
  double v428;
  double v429;
  double v430;
  double v431;
  double v432;
  double v433;
  double v434;
  const char *v435;
  uint64_t v436;
  void *v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  double v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  id v448;
  double v449;
  double v450;
  const char *v451;
  uint64_t v452;
  const char *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  double v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  double v461;
  double v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  void *v468;
  uint64_t v469;
  const char *v470;
  uint64_t v471;
  uint64_t v472;
  double v473;
  const char *v474;
  uint64_t v475;
  uint64_t v476;
  double v477;
  double v478;
  uint64_t v479;
  double v480;
  double v481;
  const char *v482;
  uint64_t v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  double v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  double v492;
  double v493;
  double v494;
  double v495;
  const char *v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  double v500;
  double v501;
  double v502;
  double v503;
  double v504;
  double v505;
  double v506;
  const char *v507;
  uint64_t v508;
  void *v509;
  double v510;
  double v511;
  double v512;
  double v513;
  double v514;
  double v515;
  double v516;
  const char *v517;
  uint64_t v518;
  void *v519;
  double v520;
  double v521;
  double v522;
  double v523;
  double v524;
  double v525;
  double v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  const char *v530;
  double v531;
  double v532;
  double v533;
  const char *v534;
  uint64_t v535;
  uint64_t v536;
  double v537;
  id v538;
  double v539;
  double v540;
  const char *v541;
  uint64_t v542;
  const char *v543;
  uint64_t v544;
  uint64_t v545;
  double v546;
  const char *v547;
  uint64_t v548;
  double v549;
  double v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  const char *v554;
  uint64_t v555;
  uint64_t v556;
  double v557;
  double v558;
  double v559;
  double v560;
  const char *v561;
  uint64_t v562;
  const char *v563;
  uint64_t v564;
  uint64_t v565;
  void *v566;
  double v567;
  const char *v568;
  uint64_t v569;
  uint64_t v570;
  double v571;
  double v572;
  double v573;
  double v574;
  const char *v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  double v579;
  double v580;
  double v581;
  double v582;
  double v583;
  double v584;
  const char *v585;
  uint64_t v586;
  void *v587;
  double v588;
  double v589;
  double v590;
  double v591;
  double v592;
  double v593;
  const char *v594;
  uint64_t v595;
  void *v596;
  double v597;
  double v598;
  double v599;
  double v600;
  double v601;
  double v602;
  const char *v603;
  uint64_t v604;
  void *v605;
  double v606;
  double v607;
  double v608;
  double v609;
  double v610;
  double v611;
  const char *v612;
  uint64_t v613;
  uint64_t v614;
  void *v615;
  const char *v616;
  uint64_t v617;
  double v618;
  double v619;
  id v620;
  double v621;
  double v622;
  const char *v623;
  uint64_t v624;
  const char *v625;
  uint64_t v626;
  uint64_t v627;
  double v628;
  const char *v629;
  uint64_t v630;
  double v631;
  double v632;
  const char *v633;
  uint64_t v634;
  uint64_t v635;
  double v636;
  double v637;
  double v638;
  const char *v639;
  const char *v640;
  uint64_t v641;
  uint64_t v642;
  double v643;
  double v644;
  const char *v645;
  uint64_t v646;
  uint64_t v647;
  double v648;
  const char *v649;
  uint64_t v650;
  uint64_t v651;
  void *v652;
  const char *v653;
  uint64_t v654;
  uint64_t v655;
  double v656;
  double v657;
  double v658;
  double v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  float v664;
  double v665;
  double v666;
  double v667;
  double v668;
  double v669;
  double v670;
  const char *v671;
  uint64_t v672;
  void *v673;
  double v674;
  double v675;
  double v676;
  double v677;
  double v678;
  double v679;
  const char *v680;
  uint64_t v681;
  void *v682;
  double v683;
  double v684;
  double v685;
  double v686;
  double v687;
  double v688;
  const char *v689;
  uint64_t v690;
  void *v691;
  double v692;
  double v693;
  double v694;
  double v695;
  double v696;
  double v697;
  const char *v698;
  uint64_t v699;
  uint64_t v700;
  const char *v701;
  uint64_t v702;
  uint64_t v703;
  double v704;
  double v705;
  double v706;
  uint64_t v707;
  double v708;
  double v709;
  const char *v710;
  void *v711;
  void *v712;
  id v713;
  const char *v714;
  uint64_t v715;
  double v716;
  const char *v717;
  id v718;
  uint64_t v719;
  float v720;
  uint64_t v721;
  float v722;
  double v723;
  double v724;
  double v725;
  double v726;
  void *v727;
  void *v728;
  uint64_t v729;
  void *v730;
  float v731;
  void *v732;
  void *v733;
  float v734;
  void *v735;
  float v736;
  uint64_t v737;
  void *v738;
  void *v739;
  void *v740;
  float v741;
  void *v742;
  void *v743;
  float v744;
  void *v745;
  float v746;
  void *v747;
  float v748;
  void *v749;
  float v750;
  void *v751;
  void *v752;
  void *v753;
  id v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  uint64_t v758;
  float v759;
  void *v760;
  void *v761;
  float v762;
  void *v763;
  float v764;
  void *v765;
  int v766;
  void *v767;
  uint64_t v768;
  uint64_t v769;
  uint64_t v770;
  void *v771;
  uint64_t v772;
  uint64_t v773;
  id v774;
  void *v775;
  void *v776;
  void *v777;
  void *v778;
  id v779;
  id v780;
  id v781;
  void *v782;
  void *v783;
  void *v784;
  void *v785;
  uint64_t v786;
  void *v787;
  void *v788;
  void *v789;
  void *v790;
  void *v791;
  float v792;
  void *v793;
  uint64_t v794;
  float v795;
  void *v796;
  void *v797;
  float v798;
  void *v799;
  void *v800;
  void *v801;
  char v802;
  uint8_t buf[8];
  _QWORD v804[6];

  if (!self->inputImage)
  {
    v44 = 0;
    return v44;
  }
  objc_msgSend_doubleValue(self->inputLNRAmount, a2, v2, v3, v4);
  if (v10 == 0.0)
  {
    objc_msgSend_doubleValue(self->inputCNRAmount, v6, v7, v8, v9);
    if (v15 == 0.0)
    {
      objc_msgSend_doubleValue(self->inputSharpenAmount, v11, v12, v13, v14);
      if (v20 == 0.0)
      {
        objc_msgSend_doubleValue(self->inputContrastAmount, v16, v17, v18, v19);
        if (v25 == 0.0)
        {
          objc_msgSend_doubleValue(self->inputDetailAmount, v21, v22, v23, v24);
          if (v30 == 0.0)
          {
            objc_msgSend_doubleValue(self->inputMoireAmount, v26, v27, v28, v29);
            if (v31 == 0.0)
              return self->inputImage;
          }
        }
      }
    }
  }
  sub_1D52EB19C();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v33))
  {
    *(_WORD *)&buf[4] = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v34, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWReduceNoise", (const char *)&unk_1D548AF1A, &buf[4], 2u);
  }

  v804[0] = MEMORY[0x1E0C809B0];
  v804[1] = 3221225472;
  v804[2] = sub_1D53DBAE0;
  v804[3] = &unk_1E996F870;
  v804[4] = self;
  v35 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v804);
  if ((int)objc_msgSend_intValue(self->inputVersion, v36, v37, v38, v39) >= 8)
  {
    if (self->inputISODictionary)
    {
      objc_msgSend_V8OutputImage(self, v40, v41, v42, v43);
      v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSLog(CFSTR("V8 Noise Reduction requested, but no ISO Dictionary present."));
      v44 = 0;
    }
    goto LABEL_112;
  }
  *(_QWORD *)buf = 0;
  objc_msgSend_floatValue(self->inputScaleFactor, v40, v41, v42, v43);
  v46 = v45;
  objc_msgSend_adjustedRNAmount(self, v47, v48, v49, v50);
  v52 = v51;
  objc_msgSend_floatValue(self->inputLNRAmount, v53, v54, v55, v56);
  v58 = v57;
  objc_msgSend_floatValue(self->inputSharpenAmount, v59, v60, v61, v62);
  v64 = v63;
  objc_msgSend_floatValue(self->inputSharpenThreshold, v65, v66, v67, v68);
  v798 = exp2f(fminf(fmaxf((float)(0.6 - v58) * 2.5, 0.0), 1.0) * v69);
  objc_msgSend_floatValue(self->inputContrastAmount, v70, v71, v72, v73);
  v75 = v74;
  objc_msgSend_floatValue(self->inputDetailAmount, v76, v77, v78, v79);
  v795 = v80;
  v766 = objc_msgSend_BOOLValue(self->inputOpponentColorEnabled, v81, v82, v83, v84);
  v85 = fminf(fmaxf(v46, 0.0), 1.0);
  v86 = v85 * v64;
  v91 = log2f(v85);
  v92 = vcvtms_s32_f32(v91);
  if ((v92 & 0x80000000) == 0)
  {
    v759 = v75;
    goto LABEL_30;
  }
  v93 = v75;
  v94 = v91 - (float)(int)floorf(v91);
  v75 = 0.0;
  if (v92 == -3)
  {
    v86 = v94 * v93;
    goto LABEL_29;
  }
  if (v92 == -2)
  {
    v86 = v93 + (float)((float)(v93 - v93) * v94);
    v75 = v94 * v93;
LABEL_29:
    v759 = 0.0;
    goto LABEL_30;
  }
  v95 = v93;
  v96 = v93 + (float)((float)(v86 - v93) * v94);
  v97 = v93 + (float)((float)(v93 - v93) * v94);
  v98 = v94 * v95;
  if (v92 != -1)
    v98 = 0.0;
  v759 = v98;
  if (v92 == -1)
    v86 = v96;
  else
    v86 = 0.0;
  if (v92 == -1)
    v75 = v97;
LABEL_30:
  if (v52 < 1.0619)
  {
    v746 = (float)(v52 / 1.0619) * 0.0113;
    v99 = 7.0;
    v100 = 0.381;
    v101 = 0.3;
LABEL_38:
    v748 = v101;
    goto LABEL_39;
  }
  if (v52 < 1.1953)
  {
    v102 = (float)(v52 + -1.0619) / 0.1334;
    v99 = v102 + 7.0;
    v746 = (float)(v102 * 0.0087) + 0.0113;
    v103 = 0.381;
LABEL_36:
    v104 = -0.013;
LABEL_37:
    v100 = v103 + (float)(v102 * v104);
    v101 = 1.0;
    goto LABEL_38;
  }
  if (v52 < 1.3487)
  {
    v102 = (float)(v52 + -1.1953) / 0.1534;
    v99 = (float)(v102 * 2.0) + 8.0;
    v746 = (float)(v102 * 0.008) + 0.02;
    v103 = 0.368;
    goto LABEL_36;
  }
  if (v52 < 1.4304)
  {
    v102 = (float)(v52 + -1.3487) / 0.0817;
    v99 = v102 + 10.0;
    v746 = (float)(v102 * 0.002) + 0.026;
    v103 = 0.355;
    v104 = 0.0;
    goto LABEL_37;
  }
  if (v52 >= 1.6138)
  {
    if (v52 < 1.8297)
    {
      v102 = (float)(v52 + -1.6138) / 0.2159;
      v99 = 11.0 - v102;
      v746 = (float)(v102 * 0.012) + 0.035;
      v103 = 0.278;
      v104 = -0.115;
      goto LABEL_37;
    }
    if (v52 < 2.8337)
    {
      v102 = (float)(v52 + -1.8297) / 1.004;
      v99 = (float)(v102 * -3.0) + 10.0;
      v746 = (float)(v102 * 0.034) + 0.047;
      v103 = 0.163;
      v104 = 0.077;
      goto LABEL_37;
    }
    if (v52 < 3.9856)
    {
      v102 = (float)(v52 + -2.8337) / 1.1519;
      v99 = (float)(v102 * -3.0) + 7.0;
      v746 = (float)(v102 * 0.008) + 0.081;
      v103 = 0.24;
      v104 = 0.06;
      goto LABEL_37;
    }
    v748 = 1.0;
    if (v52 >= 6.1675)
    {
      v99 = 3.5;
      v100 = 0.333;
      v746 = 0.206;
    }
    else
    {
      v114 = (float)(v52 + -3.9856) / 2.1819;
      v99 = (float)(v114 * -0.5) + 4.0;
      v746 = (float)(v114 * 0.117) + 0.089;
      v100 = (float)(v114 * 0.033) + 0.3;
    }
  }
  else
  {
    v109 = (float)(v52 + -1.4304) / 0.1834;
    v746 = (float)(v109 * 0.007) + 0.028;
    v100 = (float)(v109 * -0.077) + 0.355;
    v748 = 1.0;
    v99 = 11.0;
  }
LABEL_39:
  if (v52 < 1.135)
  {
    v105 = 0.03;
    goto LABEL_62;
  }
  if (v52 < 1.2804)
  {
    v106 = (float)(v52 + -1.135) / 0.1454;
    v107 = 0.03;
    v108 = 0.0008;
LABEL_61:
    v105 = v107 + (float)(v106 * v108);
    goto LABEL_62;
  }
  if (v52 < 1.5949)
  {
    v106 = (float)(v52 + -1.2804) / 0.3145;
    v107 = 0.0308;
    v108 = 0.0072;
    goto LABEL_61;
  }
  if (v52 < 1.7695)
  {
    v106 = (float)(v52 + -1.5949) / 0.1746;
    v107 = 0.038;
    v108 = 0.012;
    goto LABEL_61;
  }
  if (v52 < 2.5961)
  {
    v106 = (float)(v52 + -1.7695) / 0.8266;
    v107 = 0.05;
    v108 = 0.001;
    goto LABEL_61;
  }
  if (v52 < 3.8895)
  {
    v106 = (float)(v52 + -2.5961) / 1.2934;
    v107 = 0.051;
    v108 = 0.019;
    goto LABEL_61;
  }
  if (v52 < 5.9267)
  {
    v106 = (float)(v52 + -3.8895) / 2.0372;
    v107 = 0.07;
    v108 = 0.01;
    goto LABEL_61;
  }
  v105 = 0.08;
LABEL_62:
  if (v52 > 3.5)
    v99 = 1.0;
  v744 = v99;
  v750 = v100;
  v741 = v105;
  if (v58 >= 0.5)
  {
    if (v52 > 5.3079)
    {
      v110 = 0.04;
      goto LABEL_106;
    }
    if (v52 <= 3.7633)
    {
      if (v52 <= 2.1287)
      {
        if (v52 <= 1.6717)
        {
          if (v52 <= 0.9414)
          {
            if (v52 <= 0.5)
            {
              v110 = 0.0021;
              goto LABEL_106;
            }
            v111 = (float)(v52 + -0.5) / 0.3968;
            v112 = 0.0021;
            v113 = 0.0025;
          }
          else
          {
            v111 = (float)(v52 + -0.9414) / 0.7303;
            v112 = 0.0046;
            v113 = 0.0052;
          }
        }
        else
        {
          v111 = (float)(v52 + -1.6717) / 0.457;
          v112 = 0.0098;
          v113 = 0.0085;
        }
      }
      else
      {
        v111 = (float)(v52 + -2.1287) / 1.6346;
        v112 = 0.0183;
        v113 = 0.0067;
      }
    }
    else
    {
      v111 = (float)(v52 + -3.7633) / 1.5446;
      v112 = 0.025;
      v113 = 0.015;
    }
  }
  else
  {
    if (v52 > 5.9267)
    {
      v110 = 0.13;
      goto LABEL_106;
    }
    if (v52 <= 3.8895)
    {
      if (v52 <= 2.5961)
      {
        if (v52 <= 1.7695)
        {
          if (v52 <= 1.5949)
          {
            if (v52 <= 1.4104)
            {
              if (v52 <= 1.2804)
              {
                if (v52 <= 1.135)
                {
                  if (v52 <= 1.0083)
                  {
                    if (v52 <= 0.8954)
                    {
                      v111 = v52 / 0.8954;
                      v112 = 0.0087;
                      v113 = 0.0108;
                    }
                    else
                    {
                      v111 = (float)(v52 + -0.8954) / 0.1129;
                      v112 = 0.0195;
                      v113 = 0.0025;
                    }
                  }
                  else
                  {
                    v111 = (float)(v52 + -1.0083) / 0.1267;
                    v112 = 0.022;
                    v113 = 0.002;
                  }
                }
                else
                {
                  v111 = (float)(v52 + -1.135) / 0.1454;
                  v112 = 0.024;
                  v113 = 0.004;
                }
              }
              else
              {
                v111 = (float)(v52 + -1.2804) / 0.13;
                v112 = 0.028;
                v113 = 0.005;
              }
            }
            else
            {
              v111 = (float)(v52 + -1.4104) / 0.1845;
              v112 = 0.033;
              v113 = 0.003;
            }
          }
          else
          {
            v111 = (float)(v52 + -1.5949) / 0.1746;
            v112 = 0.036;
            v113 = 0.014;
          }
        }
        else
        {
          v111 = (float)(v52 + -1.7695) / 0.8266;
          v112 = 0.05;
          v113 = 0.015;
        }
      }
      else
      {
        v111 = (float)(v52 + -2.5961) / 1.2934;
        v112 = 0.065;
        v113 = 0.025;
      }
    }
    else
    {
      v111 = (float)(v52 + -3.8895) / 2.0372;
      v112 = 0.09;
      v113 = 0.04;
    }
  }
  v110 = v112 + (float)(v111 * v113);
LABEL_106:
  v792 = v110;
  v115 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend_X(self->inputNeutralFactors, v87, v88, v89, v90);
  v117 = v116;
  objc_msgSend_Y(self->inputNeutralFactors, v118, v119, v120, v121);
  v123 = v122;
  objc_msgSend_Z(self->inputNeutralFactors, v124, v125, v126, v127);
  objc_msgSend_vectorWithX_Y_Z_W_(v115, v129, v130, v131, v132, 1.0 / v117, 1.0 / v123, 1.0 / v128, 1.0);
  v800 = (void *)objc_claimAutoreleasedReturnValue();
  v764 = v75;
  v762 = v52;
  objc_msgSend_imageByClampingToExtent(self->inputImage, v133, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(self->inputImage, v138, v139, v140, v141);
  v143 = v142;
  v145 = v144;
  v147 = v146;
  v149 = v148;
  v150 = v800;
  objc_msgSend_outputUnboost_(self, v151, (uint64_t)v137, v152, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  v155 = v154;
  v802 = 0;
  objc_msgSend_outputCNR_extent_returningDebugProduct_(self, v156, (uint64_t)v155, (uint64_t)&v802, v157, v143, v145, v147, v149);
  v801 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_BOOLValue(self->inputShowHF, v158, v159, v160, v161))
  {
    sub_1D53DBB64(v801, v800, v143 * 0.5, v145 * 0.5, v147 * 0.5, v149 * 0.5);
    v166 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v802)
    {
      v726 = v143;
      objc_msgSend_X(self->inputNeutralFactors, v162, v163, v164, v165);
      v168 = v167;
      v725 = v145;
      objc_msgSend_Y(self->inputNeutralFactors, v169, v170, v171, v172);
      v174 = v173;
      objc_msgSend_Z(self->inputNeutralFactors, v175, v176, v177, v178);
      v180 = v179;
      v723 = v147;
      v724 = v149;
      v736 = v86;
      objc_msgSend_floatValue(self->inputBaselineExposure, v181, v182, v183, v184);
      v186 = exp2f(v185);
      v187 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend_X(self->inputLumFactors, v188, v189, v190, v191);
      v193 = v192;
      objc_msgSend_Y(self->inputLumFactors, v194, v195, v196, v197);
      v199 = v198;
      objc_msgSend_Z(self->inputLumFactors, v200, v201, v202, v203);
      objc_msgSend_vectorWithX_Y_Z_W_(v187, v205, v206, v207, v208, v193 * v186, v199 * v186, v204 * v186, 1.0);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v210 = (void *)MEMORY[0x1E0C9DDF8];
      v740 = v209;
      objc_msgSend_X(v209, v211, v212, v213, v214);
      v216 = v215;
      objc_msgSend_Y(v740, v217, v218, v219, v220);
      v222 = v221;
      objc_msgSend_Z(v740, v223, v224, v225, v226);
      objc_msgSend_vectorWithX_Y_Z_W_(v210, v228, v229, v230, v231, v168 * v216, v174 * v222, v180 * v227, 1.0);
      v236 = objc_claimAutoreleasedReturnValue();
      v730 = (void *)v236;
      if (v766)
      {
        v237 = (float)((float)(v762 * 0.01) * (float)(v762 * 0.01)) / 0.15;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v232, v233, v234, v235, v168 * (float)(v237 * 100.0), v168 / (float)((float)(v237 * 200.0) - (float)(v237 * 100.0)), v174 * (float)(v237 * 100.0), v174 / (float)((float)(v237 * 200.0) - (float)(v237 * 100.0)));
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extractYOpponentColor_neutralFactors_luminanceFactors_noiseVector_(self, v239, (uint64_t)v155, (uint64_t)self->inputNeutralFactors, (uint64_t)v740, v238);
        v739 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend_extractY_neutralFactors_(self, v232, (uint64_t)v155, v236, v235);
        v739 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v244 = v85 * v795;
      v734 = v798 * v792;
      v245 = v734 + v734;
      if (v58 >= 0.5)
        v246 = (float)(v58 + -0.5) + (float)(v58 + -0.5);
      else
        v246 = 0.0;
      if (v58 >= 0.5)
        v247 = 1.0;
      else
        v247 = v58 + v58;
      if (v762 >= 0.5)
        v248 = 0.0;
      else
        v248 = v244;
      if (v762 >= 0.5)
        v249 = v244;
      else
        v249 = 0.0;
      v731 = v246;
      if (v58 == 0.0 && v764 == 0.0 && v759 == 0.0 && v249 == 0.0)
      {
        v250 = 0;
      }
      else if (v246 == 0.0)
      {
        if (v249 == 0.0)
          v251 = 2;
        else
          v251 = 3;
        if (v759 == 0.0 && v764 == 0.0)
          v250 = v251;
        else
          v250 = 4;
      }
      else
      {
        v250 = 5;
      }
      LODWORD(v243) = 0.75;
      *(float *)&v242 = v734 + v734;
      objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v240, (uint64_t)&buf[4], (uint64_t)buf, v241, v242, v243);
      switch(v250)
      {
        case 0:
          LODWORD(v256) = 1.0;
          LODWORD(v257) = 0;
          objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v253, (uint64_t)v739, v254, v255, v256, v257);
          v258 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_reduce_(self, v259, v258, v260, v261);
          v262 = objc_claimAutoreleasedReturnValue();
          LODWORD(v264) = *(_DWORD *)buf;
          LODWORD(v263) = *(_DWORD *)&buf[4];
          objc_msgSend_blurGradient_lothresh_factor_(self, v265, v258, v266, v267, v263, v264);
          v765 = (void *)objc_claimAutoreleasedReturnValue();
          v745 = (void *)v262;
          v727 = (void *)v258;
          v269 = 0;
          *(float *)&v270 = v736;
          *(float *)&v271 = v248;
          if (v766)
            objc_msgSend_expandAndSharpenThroughGradientMaskGatherOpponentColor_halfSizeY_cnrRGB_originalY_sharpen_floor_sushiFactors_crop_lumFactors_(self, v268, (uint64_t)v765, v262, (uint64_t)v801, v739, v800, v740, v270, v271, v726, v725, v723, v724);
          else
            objc_msgSend_expandAndSharpenThroughGradientMaskGather_halfSizeY_cnrRGB_sharpen_floor_sushiFactors_crop_lumFactors_(self, v268, (uint64_t)v765, v262, (uint64_t)v801, v800, v740, v270, v271, v726, v725, v723, v724);
          goto LABEL_147;
        case 1:
          LODWORD(v256) = 1.0;
          LODWORD(v257) = 0;
          objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v253, (uint64_t)v739, v254, v255, v256, v257);
          v358 = (id)objc_claimAutoreleasedReturnValue();
          v780 = v358;
          v269 = 0;
          if (v766)
            objc_msgSend_YAndRGBGatherOpponentColor_cnrRGB_originalY_sushiFactors_crop_lumFactors_(self, v359, (uint64_t)v358, (uint64_t)v801, (uint64_t)v739, v800, v740, v726, v725, v723, v724);
          else
            objc_msgSend_YAndRGBGather_cnrRGB_sushiFactors_crop_lumFactors_(self, v359, (uint64_t)v358, (uint64_t)v801, (uint64_t)v800, v740, v726, v725, v723, v724);
          v442 = (void *)objc_claimAutoreleasedReturnValue();
          v777 = 0;
          v778 = 0;
          v774 = 0;
          v775 = 0;
          v732 = 0;
          v733 = 0;
          v785 = 0;
          v787 = 0;
          v783 = 0;
          v784 = 0;
          v782 = 0;
          v749 = 0;
          v751 = 0;
          v735 = 0;
          v790 = 0;
          v791 = 0;
          v443 = 0;
          v788 = 0;
          v789 = 0;
          v745 = 0;
          v747 = 0;
          v445 = 0;
          v743 = 0;
          v796 = 0;
          v799 = 0;
          v793 = 0;
          v760 = 0;
          v765 = 0;
          v446 = 0;
          v447 = 0;
          v444 = v780;
          v727 = v780;
          goto LABEL_167;
        case 2:
          LODWORD(v256) = 1.0;
          LODWORD(v257) = 0;
          objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v253, (uint64_t)v739, v254, v255, v256, v257);
          v318 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_reduce_(self, v319, v318, v320, v321);
          v322 = objc_claimAutoreleasedReturnValue();
          LODWORD(v324) = *(_DWORD *)buf;
          LODWORD(v323) = *(_DWORD *)&buf[4];
          objc_msgSend_blurGradient_lothresh_factor_(self, v325, v318, v326, v327, v323, v324);
          v765 = (void *)objc_claimAutoreleasedReturnValue();
          v745 = (void *)v322;
          v727 = (void *)v318;
          v269 = 0;
          *(float *)&v329 = v736;
          *(float *)&v330 = v247;
          *(float *)&v331 = v248;
          if (v766)
            objc_msgSend_expandAndSharpenDetailsThroughGradientMaskGatherOpponentColor_halfSizeY_cnrRGB_originalY_sharpen_soften_floor_sushiFactors_crop_lumFactors_(self, v328, (uint64_t)v765, v322, (uint64_t)v801, v739, v800, v740, v329, v330, v331, v726, v725, v723, v724);
          else
            objc_msgSend_expandAndSharpenDetailsThroughGradientMaskGather_halfSizeY_cnrRGB_sharpen_soften_floor_sushiFactors_crop_lumFactors_(self, v328, (uint64_t)v765, v322, (uint64_t)v801, v800, v740, v329, v330, v331, v726, v725, v723, v724);
LABEL_147:
          v272 = objc_claimAutoreleasedReturnValue();
          v442 = (void *)v272;
          v777 = 0;
          v778 = 0;
          v774 = 0;
          v775 = 0;
          v732 = 0;
          v733 = 0;
          v785 = 0;
          v787 = 0;
          v783 = 0;
          v784 = 0;
          v782 = 0;
          v749 = 0;
          v751 = 0;
          v735 = 0;
          v790 = 0;
          v791 = 0;
          v443 = 0;
          v788 = 0;
          v789 = 0;
          v747 = 0;
          v444 = 0;
          v445 = 0;
          v743 = 0;
          v796 = 0;
          v799 = 0;
          v793 = 0;
          v760 = 0;
          v446 = 0;
          v447 = 0;
LABEL_167:
          v738 = 0;
          v763 = 0;
          goto LABEL_210;
        case 3:
          LODWORD(v256) = 1.0;
          LODWORD(v257) = 0;
          objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v253, (uint64_t)v739, v254, v255, v256, v257);
          v332 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_reduce_(self, v333, v332, v334, v335);
          v336 = objc_claimAutoreleasedReturnValue();
          LODWORD(v338) = *(_DWORD *)buf;
          LODWORD(v337) = *(_DWORD *)&buf[4];
          objc_msgSend_blurGradient_lothresh_factor_(self, v339, v332, v340, v341, v337, v338);
          v765 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_expandAndMakeDetails_halfSize_(self, v342, (uint64_t)v765, v336, v343);
          v344 = objc_claimAutoreleasedReturnValue();
          LODWORD(v345) = 0;
          objc_msgSend_fineGrainNoise2_tinyBlurFactor_(self, v346, v344, v347, v348, v345);
          v760 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v349 = v247;
          *(float *)&v350 = v736;
          objc_msgSend_expandAndAddDetailsThroughGradientMask2_halfSize_fullSizeDetails_soften_sharpen_(self, v351, (uint64_t)v765, v336, v344, v349, v350);
          v743 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v352 = v249;
          objc_msgSend_addNoise_noise_amount_(self, v353, (uint64_t)v743, (uint64_t)v760, v354, v352);
          v355 = objc_claimAutoreleasedReturnValue();
          v357 = (void *)v355;
          v763 = (void *)v344;
          v745 = (void *)v336;
          v727 = (void *)v332;
          v269 = 0;
          if (v766)
            objc_msgSend_YAndRGBGatherOpponentColor_cnrRGB_originalY_sushiFactors_crop_lumFactors_(self, v356, v355, (uint64_t)v801, (uint64_t)v739, v800, v740, v726, v725, v723, v724);
          else
            objc_msgSend_YAndRGBGather_cnrRGB_sushiFactors_crop_lumFactors_(self, v356, v355, (uint64_t)v801, (uint64_t)v800, v740, v726, v725, v723, v724);
          v442 = (void *)objc_claimAutoreleasedReturnValue();
          v777 = 0;
          v778 = 0;
          v774 = 0;
          v775 = 0;
          v732 = 0;
          v733 = 0;
          v785 = 0;
          v787 = 0;
          v783 = 0;
          v784 = 0;
          v782 = 0;
          v749 = 0;
          v751 = 0;
          v735 = 0;
          v790 = 0;
          v791 = 0;
          v443 = 0;
          v788 = 0;
          v789 = 0;
          v747 = 0;
          v444 = v357;
          goto LABEL_173;
        case 4:
          LODWORD(v256) = 1.0;
          LODWORD(v257) = 0;
          objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v253, (uint64_t)v739, v254, v255, v256, v257);
          v276 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_reduce_(self, v277, v276, v278, v279);
          v280 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_expandAndMakeDetails_halfSize_(self, v281, v276, v280, v282);
          v763 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_reduce_(self, v283, v280, v284, v285);
          v286 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_expandAndMakeDetails_halfSize_(self, v287, v280, v286, v288);
          v751 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_reduce_(self, v289, v286, v290, v291);
          v292 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_expandAndMakeDetails_halfSize_(self, v293, v286, v292, v294);
          v749 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v295 = v759;
          objc_msgSend_expandAndAddDetailsWithOverdrive_fullSize_contrast_(self, v296, v292, (uint64_t)v749, v297, v295);
          v298 = objc_claimAutoreleasedReturnValue();
          *(float *)&v299 = v764;
          objc_msgSend_expandAndAddDetailsWithOverdrive_fullSize_contrast_(self, v300, v298, (uint64_t)v751, v301, v299);
          v747 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v302) = 0;
          objc_msgSend_fineGrainNoise2_tinyBlurFactor_(self, v303, (uint64_t)v763, v304, v305, v302);
          v760 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v307) = *(_DWORD *)buf;
          LODWORD(v306) = *(_DWORD *)&buf[4];
          objc_msgSend_blurGradient_lothresh_factor_(self, v308, v276, v309, v310, v306, v307);
          v765 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v311 = v247;
          *(float *)&v312 = v736;
          objc_msgSend_expandAndAddDetailsThroughGradientMask2_halfSize_fullSizeDetails_soften_sharpen_(self, v313, (uint64_t)v765, (uint64_t)v747, (uint64_t)v763, v311, v312);
          v743 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v314 = v249;
          objc_msgSend_addNoise_noise_amount_(self, v315, (uint64_t)v743, (uint64_t)v760, v316, v314);
          v737 = objc_claimAutoreleasedReturnValue();
          v732 = (void *)v298;
          v733 = (void *)v292;
          v735 = (void *)v286;
          v745 = (void *)v280;
          v727 = (void *)v276;
          v269 = 0;
          if (v766)
            objc_msgSend_YAndRGBGatherOpponentColor_cnrRGB_originalY_sushiFactors_crop_lumFactors_(self, v317, v737, (uint64_t)v801, (uint64_t)v739, v800, v740, v726, v725, v723, v724);
          else
            objc_msgSend_YAndRGBGather_cnrRGB_sushiFactors_crop_lumFactors_(self, v317, v737, (uint64_t)v801, (uint64_t)v800, v740, v726, v725, v723, v724);
          v442 = (void *)objc_claimAutoreleasedReturnValue();
          v777 = 0;
          v778 = 0;
          v774 = 0;
          v775 = 0;
          v785 = 0;
          v787 = 0;
          v783 = 0;
          v784 = 0;
          v782 = 0;
          v790 = 0;
          v791 = 0;
          v443 = 0;
          v788 = 0;
          v789 = 0;
          v444 = (void *)v737;
LABEL_173:
          v445 = 0;
          v796 = 0;
          v799 = 0;
          v793 = 0;
          v446 = 0;
          v447 = 0;
          v738 = 0;
          goto LABEL_210;
        case 5:
          v360 = v245;
          HIDWORD(v361) = 1063818100;
          if (v245 <= 0.003)
          {
            LODWORD(v360) = 1.0;
            LODWORD(v361) = 0;
            objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v253, (uint64_t)v739, v254, v255, v360, v361);
            v362 = (void *)objc_claimAutoreleasedReturnValue();
            v752 = v362;
            v753 = 0;
          }
          else
          {
            *(float *)&v360 = v741;
            objc_msgSend_gaborFiltersToLuminanceAndVectorField_thresh_(self, v253, (uint64_t)v739, v254, v255, v360);
            v362 = (void *)objc_claimAutoreleasedReturnValue();
            v752 = 0;
            v753 = v362;
          }
          v754 = v362;
          objc_msgSend_reduce_(self, v363, (uint64_t)v754, v364, v365);
          v755 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_expandAndMakeDetails_halfSize_(self, v366, (uint64_t)v754, v755, v367);
          v756 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_reduce_(self, v368, v755, v369, v370);
          v758 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_expandAndMakeDetails_halfSize_(self, v371, v755, v758, v372);
          v757 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_reduce_(self, v373, v758, v374, v375);
          v376 = objc_claimAutoreleasedReturnValue();
          v379 = v376;
          if ((float)(v734 * 0.25) <= 0.0025)
          {
            v269 = 0;
            v777 = 0;
            v778 = 0;
            v774 = 0;
            v775 = 0;
          }
          else
          {
            v767 = (void *)v376;
            objc_msgSend_gaborFiltersToVectorField_(self, v377, v376, v376, v378);
            v742 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v383 = v762;
            v384 = fminf(fmaxf((float)(v762 * 0.69444) + -1.0, 0.0), 1.0);
            LODWORD(v385) = 2.5;
            if (v762 <= 2.5)
            {
              v448 = v742;
              LODWORD(v449) = 0.75;
              v774 = v448;
              *(float *)&v450 = v734 * 0.25;
              objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v451, (uint64_t)&buf[4], (uint64_t)buf, v452, v450, v449);
              objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v453, (uint64_t)v774, v454, v455);
              v456 = objc_claimAutoreleasedReturnValue();
              *(float *)&v457 = v384;
              objc_msgSend_smoothDetailsAlongDirections_directions_amount_(self, v458, (uint64_t)v767, v456, v459, v457);
              v460 = objc_claimAutoreleasedReturnValue();
              LODWORD(v462) = *(_DWORD *)buf;
              LODWORD(v461) = *(_DWORD *)&buf[4];
              objc_msgSend_blurGradient_lothresh_factor_(self, v463, v456, v464, v465, v461, v462);
              v437 = (void *)v460;
              v777 = (void *)objc_claimAutoreleasedReturnValue();
              v775 = (void *)v456;
            }
            else
            {
              objc_msgSend_smoothVectorFieldAlongVectors_(self, v380, (uint64_t)v742, v381, v382, v385, v383);
              v386 = objc_claimAutoreleasedReturnValue();
              LODWORD(v387) = 0.75;
              *(float *)&v388 = v734 * 0.25;
              objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v389, (uint64_t)&buf[4], (uint64_t)buf, v390, v388, v387);
              objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v391, v386, v392, v393);
              v394 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v395 = v746 * 0.03;
              objc_msgSend_directionsToCurvature_threshold_(self, v396, (uint64_t)v394, v397, v398, v395);
              v399 = objc_claimAutoreleasedReturnValue();

              LODWORD(v401) = *(_DWORD *)buf;
              LODWORD(v400) = *(_DWORD *)&buf[4];
              LODWORD(v402) = 0;
              *(float *)&v403 = v744;
              objc_msgSend_blurGradientPlusCurvature_lothresh_factor_cthresh_cfactor_(self, v404, v399, v405, v406, v400, v401, v402, v403);
              v407 = objc_claimAutoreleasedReturnValue();
              *(float *)&v408 = v384 * v748;
              LODWORD(v409) = 1.0;
              LODWORD(v410) = 0;
              LODWORD(v411) = 1.0;
              *(float *)&v412 = v750;
              *(float *)&v413 = v762 * 0.02054;
              LODWORD(v414) = 1036831949;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v415, (uint64_t)v767, v407, v416, v409, v410, v408, v412, v411, v413, v414);
              v417 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v418 = v384 * (float)((float)(v748 * 0.66667) + 0.33333);
              LODWORD(v419) = 2.0;
              LODWORD(v420) = 0.25;
              LODWORD(v421) = 2.0;
              *(float *)&v422 = v750 * 0.6;
              *(float *)&v423 = v762 * 0.02054;
              LODWORD(v424) = 1036831949;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v425, (uint64_t)v417, v407, v426, v419, v420, v418, v422, v421, v423, v424);
              v427 = (void *)objc_claimAutoreleasedReturnValue();

              *(float *)&v428 = (float)(v750 * 0.6) * 0.6;
              LODWORD(v429) = 4.0;
              LODWORD(v430) = 0.5;
              LODWORD(v431) = 3.0;
              *(float *)&v432 = v384 * (float)((float)(v748 * 0.33333) + 0.66667);
              *(float *)&v433 = v762 * 0.02054;
              LODWORD(v434) = 1036831949;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v435, (uint64_t)v427, v407, v436, v429, v430, v432, v428, v431, v433, v434);
              v437 = (void *)objc_claimAutoreleasedReturnValue();

              v777 = (void *)v407;
              v774 = (id)v386;
              v775 = (void *)v399;
            }
            *(float *)&v441 = v734 * 0.25;
            objc_msgSend_powerBlurY_threshold_(self, v438, (uint64_t)v767, v439, v440, v441);
            v466 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_compositeThroughGradientMask_fullSize_fullSizeMask_(self, v467, (uint64_t)v466, (uint64_t)v437, (uint64_t)v777);
            v468 = (void *)objc_claimAutoreleasedReturnValue();

            v269 = v468;
            v778 = v742;
            v379 = (uint64_t)v269;
          }
          v768 = v379;
          objc_msgSend_expandAndMakeDetails_halfSize_(self, v377, v758, v379, v378);
          v469 = objc_claimAutoreleasedReturnValue();
          v769 = v469;
          if ((float)(v734 * 0.5) <= 0.003)
          {
            *(float *)&v473 = v759;
            objc_msgSend_expandAndAddDetailsWithOverdrive_fullSize_contrast_(self, v470, v768, v469, v472, v473);
            v770 = objc_claimAutoreleasedReturnValue();
            v499 = 0;
            v784 = 0;
            v785 = 0;
            v782 = 0;
            v529 = 0;
          }
          else
          {
            objc_msgSend_gaborFiltersToVectorField_(self, v470, v758, v471, v472);
            v728 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v477 = v762;
            v720 = fminf(fmaxf((float)(v762 * 1.3889) + -1.0, 0.0), 1.0);
            LODWORD(v478) = 1071225242;
            if (v762 <= 1.7)
            {
              v538 = v728;
              LODWORD(v539) = 0.75;
              v786 = (uint64_t)v538;
              *(float *)&v540 = v734 * 0.5;
              objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v541, (uint64_t)&buf[4], (uint64_t)buf, v542, v540, v539);
              objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v543, v786, v544, v545);
              v721 = objc_claimAutoreleasedReturnValue();
              *(float *)&v546 = v720;
              objc_msgSend_smoothDetailsAlongDirections_directions_amount_(self, v547, v769, v721, v548, v546);
              v529 = objc_claimAutoreleasedReturnValue();
              LODWORD(v550) = *(_DWORD *)buf;
              LODWORD(v549) = *(_DWORD *)&buf[4];
              objc_msgSend_blurGradient_lothresh_factor_(self, v551, v721, v552, v553, v549, v550);
              v499 = objc_claimAutoreleasedReturnValue();
              v479 = v786;
            }
            else
            {
              objc_msgSend_smoothVectorFieldAlongVectors_(self, v474, (uint64_t)v728, v475, v476, v478, v477);
              v479 = objc_claimAutoreleasedReturnValue();
              LODWORD(v480) = 0.75;
              *(float *)&v481 = v734 * 0.5;
              objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v482, (uint64_t)&buf[4], (uint64_t)buf, v483, v481, v480);
              objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v484, v479, v485, v486);
              v487 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v488 = v746 * 0.1111;
              objc_msgSend_directionsToCurvature_threshold_(self, v489, (uint64_t)v487, v490, v491, v488);
              v721 = objc_claimAutoreleasedReturnValue();

              LODWORD(v493) = *(_DWORD *)buf;
              LODWORD(v492) = *(_DWORD *)&buf[4];
              LODWORD(v494) = 0;
              *(float *)&v495 = v744;
              objc_msgSend_blurGradientPlusCurvature_lothresh_factor_cthresh_cfactor_(self, v496, v721, v497, v498, v492, v493, v494, v495);
              v499 = objc_claimAutoreleasedReturnValue();
              *(float *)&v500 = v720 * v748;
              LODWORD(v501) = 1.0;
              LODWORD(v502) = 0;
              LODWORD(v503) = 1.0;
              *(float *)&v504 = v750;
              *(float *)&v505 = v762 * 0.02054;
              LODWORD(v506) = 1036831949;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v507, v769, v499, v508, v501, v502, v500, v504, v503, v505, v506);
              v509 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v510 = v720 * (float)((float)(v748 * 0.66667) + 0.33333);
              LODWORD(v511) = 2.0;
              LODWORD(v512) = 0.25;
              LODWORD(v513) = 2.0;
              *(float *)&v514 = v750 * 0.6;
              *(float *)&v515 = v762 * 0.02054;
              LODWORD(v516) = 1036831949;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v517, (uint64_t)v509, v499, v518, v511, v512, v510, v514, v513, v515, v516);
              v519 = (void *)objc_claimAutoreleasedReturnValue();

              *(float *)&v520 = (float)(v750 * 0.6) * 0.6;
              LODWORD(v521) = 4.0;
              LODWORD(v522) = 0.5;
              LODWORD(v523) = 3.0;
              *(float *)&v524 = v720 * (float)((float)(v748 * 0.33333) + 0.66667);
              *(float *)&v525 = v762 * 0.02054;
              LODWORD(v526) = 1036831949;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v527, (uint64_t)v519, v499, v528, v521, v522, v524, v520, v523, v525, v526);
              v529 = objc_claimAutoreleasedReturnValue();

            }
            *(float *)&v533 = fminf(v731 / 0.5625, 1.0);
            *(float *)&v531 = 1.0 - v720;
            *(float *)&v532 = v759;
            objc_msgSend_expandAndAddDetailsThroughGradientMask_fullSize_fullSizeDetails_fullSizeMask_amount_contrastOverdrive_interpolant_(self, v530, v768, v769, v529, v499, v531, v532, v533, LODWORD(v720));
            v770 = objc_claimAutoreleasedReturnValue();
            v784 = (void *)v721;
            v785 = (void *)v479;
            v782 = v728;
          }
          v783 = (void *)v529;
          v787 = (void *)v499;
          if (v734 <= 0.003)
          {
            v790 = 0;
            *(float *)&v537 = v764;
            objc_msgSend_expandAndAddDetailsWithOverdrive_fullSize_contrast_(self, v534, v770, v757, v536, v537);
            v791 = 0;
            v771 = 0;
            v773 = objc_claimAutoreleasedReturnValue();
            v788 = 0;
            v789 = 0;
          }
          else
          {
            *(float *)&v537 = v798 * v792;
            objc_msgSend_gaborFiltersToVectorField_(self, v534, v755, v535, v536, v537);
            v761 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v557 = v762;
            v722 = fminf(fmaxf((float)(v762 * 2.7778) + -1.0, 0.0), 1.0);
            LODWORD(v558) = 1068708659;
            if (v762 <= 1.4)
            {
              v620 = v761;
              LODWORD(v621) = 0.75;
              v772 = (uint64_t)v620;
              *(float *)&v622 = v798 * v792;
              objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v623, (uint64_t)&buf[4], (uint64_t)buf, v624, v622, v621);
              objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v625, v772, v626, v627);
              v605 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v628 = v722;
              objc_msgSend_smoothDetailsAlongDirections_directions_amount_(self, v629, v757, (uint64_t)v605, v630, v628);
              v614 = objc_claimAutoreleasedReturnValue();
              LODWORD(v632) = *(_DWORD *)buf;
              LODWORD(v631) = *(_DWORD *)&buf[4];
              objc_msgSend_blurGradient_lothresh_factor_(self, v633, (uint64_t)v605, v634, v635, v631, v632);
              v578 = objc_claimAutoreleasedReturnValue();
              v615 = 0;
              v729 = v772;
            }
            else
            {
              objc_msgSend_smoothVectorFieldAlongVectors_(self, v554, (uint64_t)v761, v555, v556, v558, v557);
              v729 = objc_claimAutoreleasedReturnValue();
              LODWORD(v559) = 0.75;
              *(float *)&v560 = v798 * v792;
              objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v561, (uint64_t)&buf[4], (uint64_t)buf, v562, v560, v559);
              objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v563, v729, v564, v565);
              v566 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v567 = v746 * 0.3333;
              objc_msgSend_directionsToCurvature_threshold_(self, v568, (uint64_t)v566, v569, v570, v567);
              v719 = objc_claimAutoreleasedReturnValue();

              LODWORD(v572) = *(_DWORD *)buf;
              LODWORD(v571) = *(_DWORD *)&buf[4];
              LODWORD(v573) = 0;
              *(float *)&v574 = v744;
              objc_msgSend_blurGradientPlusCurvature_lothresh_factor_cthresh_cfactor_(self, v575, v719, v576, v577, v571, v572, v573, v574);
              v578 = objc_claimAutoreleasedReturnValue();
              *(float *)&v579 = v722 * v748;
              LODWORD(v580) = 1.0;
              LODWORD(v581) = 0;
              LODWORD(v582) = 1.0;
              *(float *)&v583 = v750;
              *(float *)&v584 = v762 * 0.02054;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v585, v757, v578, v586, v580, v581, v579, v583, v582, v584);
              v587 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v588 = v722 * (float)((float)(v748 * 0.66667) + 0.33333);
              LODWORD(v589) = 2.0;
              LODWORD(v590) = 0.25;
              LODWORD(v591) = 2.0;
              *(float *)&v592 = v750 * 0.6;
              *(float *)&v593 = v762 * 0.02054;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v594, (uint64_t)v587, v578, v595, v589, v590, v588, v592, v591, v593);
              v596 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v597) = 4.0;
              LODWORD(v598) = 0.5;
              LODWORD(v599) = 3.0;
              *(float *)&v600 = v722 * (float)((float)(v748 * 0.33333) + 0.66667);
              *(float *)&v601 = (float)(v750 * 0.6) * 0.6;
              *(float *)&v602 = v762 * 0.02054;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v603, (uint64_t)v596, v578, v604, v597, v598, v600, v601, v599, v602);
              v605 = (void *)objc_claimAutoreleasedReturnValue();

              *(float *)&v606 = (float)((float)(v750 * 0.6) * 0.6) * 0.6;
              LODWORD(v607) = 8.0;
              LODWORD(v608) = 0.75;
              LODWORD(v609) = 4.0;
              *(float *)&v610 = v722 * (float)((float)(v748 * 0.0) + 1.0);
              *(float *)&v611 = v762 * 0.02054;
              objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v612, (uint64_t)v605, v578, v613, v607, v608, v610, v606, v609, v611);
              v614 = objc_claimAutoreleasedReturnValue();
              v615 = (void *)v719;
            }

            *(float *)&v636 = fminf(v731 / 0.75, 1.0);
            *(float *)&v637 = 1.0 - v722;
            *(float *)&v638 = v764;
            objc_msgSend_expandAndAddDetailsThroughGradientMask_fullSize_fullSizeDetails_fullSizeMask_amount_contrastOverdrive_interpolant_(self, v639, v770, v757, v614, v578, v637, v638, v636);
            v790 = (void *)v578;
            v791 = v615;
            v771 = (void *)v729;
            v773 = objc_claimAutoreleasedReturnValue();
            v788 = v761;
            v789 = (void *)v614;
          }
          LODWORD(v619) = 0.75;
          *(float *)&v618 = v734 + v734;
          objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v616, (uint64_t)&buf[4], (uint64_t)buf, v617, v618, v619, v719);
          if (v245 <= 0.003)
          {
            if (v249 <= 0.0)
            {
              v662 = 0;
            }
            else
            {
              LODWORD(v643) = 0;
              objc_msgSend_fineGrainNoise2_tinyBlurFactor_(self, v640, v756, v641, v642, v643);
              v662 = objc_claimAutoreleasedReturnValue();
            }
            LODWORD(v644) = *(_DWORD *)buf;
            LODWORD(v643) = *(_DWORD *)&buf[4];
            objc_msgSend_blurGradient_lothresh_factor_(self, v640, (uint64_t)v754, v641, v642, v643, v644);
            v663 = objc_claimAutoreleasedReturnValue();
            *(float *)&v708 = v247;
            *(float *)&v709 = v736;
            objc_msgSend_expandAndAddDetailsThroughGradientMask2_halfSize_fullSizeDetails_soften_sharpen_(self, v710, v663, v773, v756, v708, v709);
            v711 = (void *)objc_claimAutoreleasedReturnValue();
            v796 = 0;
            v712 = 0;
            v738 = 0;
          }
          else
          {
            objc_msgSend_smoothVectorFieldAlongVectors_(self, v640, (uint64_t)v754, v641, v642);
            v794 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v645, v794, v646, v647);
            v797 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v648 = v746;
            objc_msgSend_directionsToCurvature_threshold_(self, v649, (uint64_t)v797, v650, v651, v648);
            v652 = (void *)objc_claimAutoreleasedReturnValue();

            if (v762 > 1.4 && v762 > 3.5 && (*(float *)&v656 = v734, v734 > 0.003) && v791)
            {
              objc_msgSend_mergeHalfSizeCurvature_intoFullSizeCurvature_(self, v653, (uint64_t)v791, (uint64_t)v652, v655, v656);
              v660 = objc_claimAutoreleasedReturnValue();

              v661 = v660;
            }
            else
            {
              v661 = (uint64_t)v652;
            }
            v796 = (void *)v661;
            LODWORD(v657) = *(_DWORD *)buf;
            LODWORD(v656) = *(_DWORD *)&buf[4];
            LODWORD(v658) = 0;
            *(float *)&v659 = v744;
            objc_msgSend_blurGradientPlusCurvature_lothresh_factor_cthresh_cfactor_(self, v653, v661, v654, v655, v656, v657, v658, v659);
            v663 = objc_claimAutoreleasedReturnValue();
            v664 = fminf(fmaxf((float)(v762 * 5.5556) + -1.0, 0.0), 1.0);
            *(float *)&v665 = v664 * v748;
            LODWORD(v666) = 1.0;
            LODWORD(v667) = 0;
            LODWORD(v668) = 1.0;
            *(float *)&v669 = v750;
            *(float *)&v670 = v762 * 0.02054;
            objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v671, v756, v663, v672, v666, v667, v665, v669, v668, v670);
            v673 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v674 = v664 * (float)((float)(v748 * 0.66667) + 0.33333);
            LODWORD(v675) = 2.0;
            LODWORD(v676) = 0.25;
            LODWORD(v677) = 2.0;
            *(float *)&v678 = v750 * 0.6;
            *(float *)&v679 = v762 * 0.02054;
            objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v680, (uint64_t)v673, v663, v681, v675, v676, v674, v678, v677, v679);
            v682 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v683) = 4.0;
            LODWORD(v684) = 0.5;
            LODWORD(v685) = 3.0;
            *(float *)&v686 = v664 * (float)((float)(v748 * 0.33333) + 0.66667);
            *(float *)&v687 = (float)(v750 * 0.6) * 0.6;
            *(float *)&v688 = v762 * 0.02054;
            objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v689, (uint64_t)v682, v663, v690, v683, v684, v686, v687, v685, v688);
            v691 = (void *)objc_claimAutoreleasedReturnValue();

            *(float *)&v692 = (float)((float)(v750 * 0.6) * 0.6) * 0.6;
            LODWORD(v693) = 8.0;
            LODWORD(v694) = 0.75;
            LODWORD(v695) = 4.0;
            *(float *)&v696 = v664 * (float)((float)(v748 * 0.0) + 1.0);
            *(float *)&v697 = v762 * 0.02054;
            objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v698, (uint64_t)v691, v663, v699, v693, v694, v696, v692, v695, v697);
            v700 = objc_claimAutoreleasedReturnValue();

            if (v249 <= 0.0)
            {
              v662 = 0;
              *(float *)&v705 = v731;
            }
            else
            {
              LODWORD(v704) = 0;
              objc_msgSend_fineGrainNoise2_tinyBlurFactor_(self, v701, v756, v702, v703, v704);
              v707 = objc_claimAutoreleasedReturnValue();
              *(float *)&v705 = v731;
              v662 = v707;
            }
            *(float *)&v706 = 1.0 - *(float *)&v705;
            *(float *)&v704 = v664;
            *(float *)&v705 = v736;
            objc_msgSend_expandAndAddDetailsThroughGradientMask3_fullSize_fullSizeDetails_fullSizeMask_amount_sharpen_interpolant_(self, v701, v773, v756, v700, v663, v704, v705, v706);
            v711 = (void *)objc_claimAutoreleasedReturnValue();
            v738 = (void *)v700;
            v712 = (void *)v794;
          }
          v713 = v711;
          v793 = v712;
          v799 = (void *)v663;
          v779 = v713;
          v776 = (void *)v662;
          if (v249 <= 0.0)
          {
            v718 = v713;
          }
          else
          {
            *(float *)&v716 = v249;
            objc_msgSend_addNoise_noise_amount_(self, v714, (uint64_t)v713, v662, v715, v716);
            v718 = (id)objc_claimAutoreleasedReturnValue();
          }
          v781 = v718;
          if (v766)
            objc_msgSend_YAndRGBGatherOpponentColor_cnrRGB_originalY_sushiFactors_crop_lumFactors_(self, v717, (uint64_t)v718, (uint64_t)v801, (uint64_t)v739, v800, v740, v726, v725, v723, v724);
          else
            objc_msgSend_YAndRGBGather_cnrRGB_sushiFactors_crop_lumFactors_(self, v717, (uint64_t)v718, (uint64_t)v801, (uint64_t)v800, v740, v726, v725, v723, v724);
          v442 = (void *)objc_claimAutoreleasedReturnValue();
          v732 = (void *)v770;
          v733 = (void *)v768;
          v735 = (void *)v758;
          v749 = (void *)v769;
          v751 = (void *)v757;
          v443 = v771;
          v446 = v754;
          v745 = (void *)v755;
          v747 = (void *)v773;
          v445 = v779;
          v743 = v779;
          v444 = v781;
          v765 = 0;
          v447 = v753;
          v727 = v752;
          v760 = v776;
          v763 = (void *)v756;
LABEL_210:
          objc_msgSend_outputBoost_(self, v273, (uint64_t)v442, v274, v275);
          break;
        default:
          v442 = 0;
          v269 = 0;
          v777 = 0;
          v778 = 0;
          v774 = 0;
          v775 = 0;
          v732 = 0;
          v733 = 0;
          v785 = 0;
          v787 = 0;
          v783 = 0;
          v784 = 0;
          v782 = 0;
          v749 = 0;
          v751 = 0;
          v735 = 0;
          v790 = 0;
          v791 = 0;
          v443 = 0;
          v788 = 0;
          v789 = 0;
          v745 = 0;
          v747 = 0;
          v444 = 0;
          v445 = 0;
          v743 = 0;
          v796 = 0;
          v799 = 0;
          v793 = 0;
          v760 = 0;
          v763 = 0;
          v765 = 0;
          v446 = 0;
          v447 = 0;
          v727 = 0;
          v738 = 0;
          objc_msgSend_outputBoost_(self, v253, 0, v254, v255);
          break;
      }
      v44 = (id)objc_claimAutoreleasedReturnValue();

      v150 = v800;
      goto LABEL_111;
    }
    objc_msgSend_viewRGB_sushiFactors_crop_(self, v162, (uint64_t)v801, (uint64_t)v800, v165, v143, v145, v147, v149);
    v166 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (id)v166;
LABEL_111:

LABEL_112:
  v35[2](v35);

  return v44;
}

- (id)image:(id)a3 croppedTo:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C9DDB8];
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v10, v11, v12, v13, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filterWithName_keysAndValues_(v9, v15, (uint64_t)CFSTR("CICrop"), (uint64_t)CFSTR("inputImage"), v16, v8, CFSTR("inputRectangle"), v14, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_valueForKey_(v17, v18, (uint64_t)CFSTR("outputImage"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)isBayerGreenAlignedforImage:(id)a3 andPattern:(int)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v12;
  CGRect v14;
  CGRect v15;

  v5 = a3;
  objc_msgSend_extent(v5, v6, v7, v8, v9);
  v15 = CGRectIntegral(v14);
  v10 = ~(int)v15.origin.x;
  if (a4 == 1633771873 || a4 == 1229539657)
    LOBYTE(v10) = v10 + 1;
  v12 = (v10 + ~(int)v15.origin.y) & 1;

  return v12;
}

- (id)outputCNR:(id)a3 E0:(CGRect)a4 E1:(CGRect)a5
{
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
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  _BOOL4 v35;
  float v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  float v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  float v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  float v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  float v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  float v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  float v96;
  float v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  float v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  float v116;
  float v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  float v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  float v136;
  float v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  float v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  float v156;
  float v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  float v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  float v176;
  float v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  float v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  float v196;
  float v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  float v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  float v216;
  float v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  float v227;
  float v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  float v237;
  float v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  float v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  float v257;
  float v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  float v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  float v277;
  float v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  float v288;
  float v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  float v298;
  float v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  float v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  float v318;
  float v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  float v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  float v338;
  float v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  void *v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  float v349;
  float v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  void *v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  float v359;
  float v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  float v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  float v379;
  float v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  float v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  float v399;
  float v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  void *v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  float v410;
  float v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  void *v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  float v420;
  float v421;
  void *v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  float v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  void *v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  float v440;
  float v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  void *v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  float v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  void *v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  float v460;
  float v461;
  void *v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  float v471;
  float v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  void *v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  float v481;
  float v482;
  void *v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  float v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  void *v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  float v501;
  float v502;
  void *v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  void *v507;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  float v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  void *v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  float v521;
  float v522;
  void *v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  void *v527;
  const char *v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  float v532;
  float v533;
  const char *v534;
  uint64_t v535;
  uint64_t v536;
  void *v537;
  const char *v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  float v542;
  float v543;
  void *v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  void *v548;
  const char *v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  float v553;
  const char *v554;
  uint64_t v555;
  uint64_t v556;
  void *v557;
  const char *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  float v562;
  float v563;
  float v564;
  float v565;
  float v566;
  int v567;
  int v568;
  NSDictionary *v569;
  const char *v570;
  uint64_t v571;
  uint64_t v572;
  void *v573;
  const char *v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  const char *v578;
  uint64_t v579;
  uint64_t v580;
  void *v581;
  const char *v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  void *v589;
  const char *v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  float v594;
  const char *v595;
  uint64_t v596;
  uint64_t v597;
  void *v598;
  const char *v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  float v603;
  const char *v604;
  uint64_t v605;
  uint64_t v606;
  void *v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  const char *v612;
  uint64_t v613;
  uint64_t v614;
  void *v615;
  const char *v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  float v620;
  const char *v621;
  uint64_t v622;
  uint64_t v623;
  void *v624;
  const char *v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  float v629;
  const char *v630;
  uint64_t v631;
  uint64_t v632;
  void *v633;
  const char *v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  float v638;
  const char *v639;
  uint64_t v640;
  uint64_t v641;
  void *v642;
  const char *v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  const char *v647;
  uint64_t v648;
  uint64_t v649;
  void *v650;
  const char *v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  const char *v655;
  uint64_t v656;
  uint64_t v657;
  void *v658;
  const char *v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  float v663;
  const char *v664;
  uint64_t v665;
  uint64_t v666;
  void *v667;
  const char *v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  float v672;
  const char *v673;
  uint64_t v674;
  uint64_t v675;
  void *v676;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  float v681;
  const char *v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  double v686;
  double v687;
  const char *v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  double v692;
  double v693;
  const char *v694;
  uint64_t v695;
  uint64_t v696;
  uint64_t v697;
  float v698;
  float v699;
  double v700;
  float v701;
  const char *v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  void *v706;
  const char *v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t v711;
  const char *v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t v715;
  float v716;
  float v717;
  const char *v718;
  uint64_t v719;
  uint64_t v720;
  uint64_t v721;
  const char *v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  float v726;
  float v727;
  int v728;
  int v729;
  double v730;
  char v731;
  CIImage *inputImage;
  uint64_t v733;
  const char *v734;
  uint64_t v735;
  int isBayerGreenAlignedforImage_andPattern;
  const char *v737;
  uint64_t v738;
  uint64_t v739;
  uint64_t v740;
  float v741;
  float v742;
  char v743;
  void *v744;
  const char *v745;
  uint64_t v746;
  uint64_t v747;
  void *v748;
  const char *v749;
  uint64_t v750;
  uint64_t v751;
  uint64_t v752;
  double v753;
  double v754;
  double v755;
  double v756;
  void *v757;
  const char *v758;
  uint64_t v759;
  uint64_t v760;
  uint64_t v761;
  float v762;
  const char *v763;
  uint64_t v764;
  uint64_t v765;
  uint64_t v766;
  void *v767;
  const char *v768;
  uint64_t v769;
  void *v770;
  const char *v771;
  uint64_t v772;
  void *v773;
  const char *v774;
  uint64_t v775;
  uint64_t v776;
  uint64_t v777;
  const char *v778;
  uint64_t v779;
  uint64_t v780;
  double v781;
  double v782;
  void *v783;
  void *v784;
  const char *v785;
  const char *v786;
  float v787;
  void *v788;
  const char *v789;
  uint64_t v790;
  uint64_t v791;
  void *v792;
  const char *v793;
  uint64_t v794;
  uint64_t v795;
  uint64_t v796;
  double v797;
  double v798;
  double v799;
  double v800;
  const char *v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  void *v805;
  const char *v806;
  uint64_t v807;
  uint64_t v808;
  uint64_t v809;
  void *v810;
  double v811;
  const char *v812;
  uint64_t v813;
  uint64_t v814;
  uint64_t v815;
  void *v816;
  const char *v817;
  uint64_t v818;
  void *v819;
  const char *v820;
  uint64_t v821;
  uint64_t v822;
  float v823;
  float v824;
  _BOOL4 v825;
  _BOOL4 v826;
  float v827;
  const char *v828;
  BOOL v829;
  const char *v830;
  void *v831;
  const char *v832;
  uint64_t v833;
  uint64_t v834;
  void *v835;
  const char *v836;
  uint64_t v837;
  uint64_t v838;
  uint64_t v839;
  double v840;
  double v841;
  double v842;
  double v843;
  const char *v844;
  uint64_t v845;
  uint64_t v846;
  uint64_t v847;
  const char *v848;
  uint64_t v849;
  uint64_t v850;
  uint64_t v851;
  void *v852;
  const char *v853;
  uint64_t v854;
  uint64_t v855;
  uint64_t v856;
  void *v857;
  const char *v858;
  uint64_t v859;
  uint64_t v860;
  uint64_t v861;
  void *v862;
  const char *v863;
  uint64_t v864;
  uint64_t v865;
  uint64_t v866;
  void *v867;
  const char *v868;
  uint64_t v869;
  uint64_t v870;
  uint64_t v871;
  void *v872;
  const char *v873;
  uint64_t v874;
  void *v875;
  const char *v876;
  uint64_t v877;
  uint64_t v878;
  void *v879;
  const char *v880;
  uint64_t v881;
  uint64_t v882;
  uint64_t v883;
  double v884;
  double v885;
  double v886;
  double v887;
  double v888;
  double v889;
  double v890;
  double v891;
  const char *v892;
  uint64_t v893;
  void *v894;
  const char *v895;
  uint64_t v896;
  uint64_t v897;
  void *v898;
  const char *v899;
  uint64_t v900;
  uint64_t v901;
  uint64_t v902;
  double v903;
  double v904;
  double v905;
  double v906;
  double v907;
  double v908;
  double v909;
  double v910;
  const char *v911;
  uint64_t v912;
  uint64_t v913;
  uint64_t v914;
  void *v915;
  const char *v916;
  uint64_t v917;
  void *v918;
  const char *v919;
  uint64_t v920;
  uint64_t v921;
  void *v922;
  const char *v923;
  uint64_t v924;
  uint64_t v925;
  void *v926;
  const char *v927;
  uint64_t v928;
  uint64_t v929;
  const char *v930;
  uint64_t v931;
  uint64_t v932;
  uint64_t v933;
  double x;
  double y;
  double width;
  double height;
  const char *v938;
  uint64_t v939;
  uint64_t v940;
  uint64_t v941;
  void *v942;
  const char *v943;
  uint64_t v944;
  uint64_t v945;
  uint64_t v946;
  void *v947;
  const char *v948;
  uint64_t v949;
  void *v950;
  const char *v951;
  uint64_t v952;
  void *v953;
  id v954;
  void *v955;
  const char *v956;
  uint64_t v957;
  uint64_t v958;
  const char *v959;
  uint64_t v960;
  uint64_t v961;
  uint64_t v962;
  double v963;
  double v964;
  double v965;
  double v966;
  const char *v967;
  uint64_t v968;
  uint64_t v969;
  uint64_t v970;
  const char *v971;
  uint64_t v972;
  uint64_t v973;
  uint64_t v974;
  double v975;
  const char *v976;
  uint64_t v977;
  uint64_t v978;
  uint64_t v979;
  const char *v980;
  uint64_t v981;
  const char *v982;
  uint64_t v983;
  float v984;
  void *v985;
  const char *v986;
  uint64_t v987;
  uint64_t v988;
  void *v989;
  const char *v990;
  uint64_t v991;
  uint64_t v992;
  uint64_t v993;
  double v994;
  double v995;
  double v996;
  double v997;
  const char *v998;
  uint64_t v999;
  uint64_t v1000;
  uint64_t v1001;
  void *v1002;
  const char *v1003;
  uint64_t v1004;
  uint64_t v1005;
  uint64_t v1006;
  void *v1007;
  double v1008;
  const char *v1009;
  uint64_t v1010;
  uint64_t v1011;
  uint64_t v1012;
  void *v1013;
  const char *v1014;
  uint64_t v1015;
  void *v1016;
  const char *v1017;
  uint64_t v1018;
  uint64_t v1019;
  float v1020;
  float v1021;
  const char *v1022;
  const char *v1023;
  float v1024;
  void *v1025;
  const char *v1026;
  uint64_t v1027;
  uint64_t v1028;
  void *v1029;
  const char *v1030;
  uint64_t v1031;
  uint64_t v1032;
  uint64_t v1033;
  double v1034;
  double v1035;
  double v1036;
  double v1037;
  const char *v1038;
  uint64_t v1039;
  uint64_t v1040;
  uint64_t v1041;
  void *v1042;
  const char *v1043;
  uint64_t v1044;
  uint64_t v1045;
  uint64_t v1046;
  void *v1047;
  const char *v1048;
  uint64_t v1049;
  uint64_t v1050;
  uint64_t v1051;
  void *v1052;
  const char *v1053;
  uint64_t v1054;
  void *v1055;
  const char *v1056;
  uint64_t v1057;
  void *v1058;
  const char *v1059;
  uint64_t v1060;
  uint64_t v1061;
  const char *v1062;
  uint64_t v1063;
  uint64_t v1064;
  uint64_t v1065;
  double v1066;
  double v1067;
  double v1068;
  double v1069;
  const char *v1070;
  uint64_t v1071;
  uint64_t v1072;
  uint64_t v1073;
  const char *v1074;
  uint64_t v1075;
  uint64_t v1076;
  uint64_t v1077;
  double v1078;
  const char *v1079;
  uint64_t v1080;
  uint64_t v1081;
  uint64_t v1082;
  const char *v1083;
  uint64_t v1084;
  const char *v1085;
  uint64_t v1086;
  uint64_t v1087;
  const char *v1088;
  uint64_t v1089;
  uint64_t v1090;
  uint64_t v1091;
  double v1092;
  double v1093;
  double v1094;
  double v1095;
  const char *v1096;
  uint64_t v1097;
  void *v1098;
  const char *v1099;
  uint64_t v1100;
  void *v1101;
  float v1103;
  float v1104;
  float v1105;
  float v1106;
  unsigned int v1107;
  int v1108;
  float v1109;
  float v1110;
  float v1111;
  unsigned int v1112;
  float v1113;
  float v1114;
  unsigned int v1115;
  float v1116;
  float v1117;
  int v1118;
  float v1119;
  float v1120;
  float v1121;
  int v1122;
  void *v1124;
  void *v1125;
  float v1126;
  int v1127;
  NSDictionary *v1128;
  float v1129;
  float v1130;
  float v1131;
  float v1132;
  float v1133;
  float v1134;
  float v1135;
  float v1136;
  float v1137;
  float v1138;
  float v1139;
  float v1140;
  float v1141;
  float v1142;
  float v1143;
  float v1144;
  float v1145;
  float v1146;
  float v1147;
  float v1148;
  void *v1149;
  float v1150;
  float v1151;
  float v1152;
  float v1153;
  float v1154;
  float v1155;
  float v1156;
  float v1157;
  void *v1158;
  void *v1159;
  id v1160;
  CGAffineTransform v1161;
  CGAffineTransform v1162;
  CGAffineTransform v1163;
  CGAffineTransform v1164;
  id v1165;
  _QWORD v1166[4];
  _QWORD v1167[4];
  _QWORD v1168[4];
  _QWORD v1169[4];
  _QWORD v1170[7];
  _QWORD v1171[4];
  _QWORD v1172[3];
  _QWORD v1173[4];
  _QWORD v1174[4];
  _QWORD v1175[4];
  CGRect v1176;
  CGRect v1177;
  CGRect v1178;
  CGRect v1179;
  CGRect v1180;
  CGRect v1181;
  CGRect v1182;
  CGRect v1183;
  CGRect v1184;
  CGRect v1185;
  CGRect v1186;
  CGRect v1187;
  CGRect v1188;
  CGRect v1189;
  CGRect v1190;
  CGRect v1191;
  CGRect v1192;
  CGRect v1193;

  v1175[2] = *MEMORY[0x1E0C80C00];
  v1160 = a3;
  objc_msgSend_floatValue(self->inputScaleFactor, v6, v7, v8, v9);
  v11 = v10;
  v16 = objc_msgSend_intValue(self->inputISO, v12, v13, v14, v15);
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v17, (uint64_t)CFSTR("ISOList"), v18, v19);
  v1159 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_count(v1159, v20, v21, v22, v23);
  v1129 = v11;
  if (v27)
  {
    v28 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v1159, v24, v28, v25, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend_intValue(v29, v30, v31, v32, v33);

      v35 = v16 != v34;
      if (v16 == v34)
      {
        v36 = 0.0;
        goto LABEL_10;
      }
      if (v16 < v34)
        break;
      if (v27 == ++v28)
        goto LABEL_6;
    }
    if (!v28)
    {
      v35 = 0;
      v36 = 0.0;
      goto LABEL_12;
    }
    objc_msgSend_objectAtIndexedSubscript_(v1159, v24, --v28, v25, v26);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_intValue(v37, v38, v39, v40, v41);

    v36 = (float)(v16 - v42) / (float)(v34 - v42);
LABEL_10:
    if (v28 != 100000)
      goto LABEL_12;
  }
  else
  {
LABEL_6:
    v35 = 0;
    v36 = 0.0;
  }
  v28 = v27 - 1;
LABEL_12:
  v1128 = self->inputTrimParameters;
  objc_msgSend_objectForKeyedSubscript_(v1128, v43, (uint64_t)CFSTR("color"), v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v46, v47, 0, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v50, v51, v52, v53, v54);
  v1144 = v55;

  objc_msgSend_objectAtIndexedSubscript_(v46, v56, 1, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v59, v60, v61, v62, v63);
  v1139 = v64;

  objc_msgSend_adjustedRNAmount(self, v65, v66, v67, v68);
  v1121 = v69;
  objc_msgSend_floatValue(self->inputCNRAmount, v70, v71, v72, v73);
  v1126 = v74;
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v75, (uint64_t)CFSTR("FCNRa"), v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v78, v79, v28, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v82, v83, v84, v85, v86);
  v1152 = v87;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v78, v88, v28 + 1, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v91, v92, v93, v94, v95);
    v97 = v96;

    v1152 = v1152 + (float)((float)(v97 - v1152) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v88, (uint64_t)CFSTR("FCNRb"), v89, v90);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v98, v99, v28, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v102, v103, v104, v105, v106);
  v1157 = v107;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v98, v108, v28 + 1, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v111, v112, v113, v114, v115);
    v117 = v116;

    v1157 = v1157 + (float)((float)(v117 - v1157) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v108, (uint64_t)CFSTR("FCNRc"), v109, v110);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v118, v119, v28, v120, v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v122, v123, v124, v125, v126);
  v1150 = v127;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v118, v128, v28 + 1, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v131, v132, v133, v134, v135);
    v137 = v136;

    v1150 = v1150 + (float)((float)(v137 - v1150) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v128, (uint64_t)CFSTR("FCNDa"), v129, v130);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v138, v139, v28, v140, v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v142, v143, v144, v145, v146);
  v1147 = v147;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v138, v148, v28 + 1, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v151, v152, v153, v154, v155);
    v157 = v156;

    v1147 = v1147 + (float)((float)(v157 - v1147) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v148, (uint64_t)CFSTR("FCNDb"), v149, v150);
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v158, v159, v28, v160, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v162, v163, v164, v165, v166);
  v1154 = v167;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v158, v168, v28 + 1, v169, v170);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v171, v172, v173, v174, v175);
    v177 = v176;

    v1154 = v1154 + (float)((float)(v177 - v1154) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v168, (uint64_t)CFSTR("FCNDc"), v169, v170);
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v178, v179, v28, v180, v181);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v182, v183, v184, v185, v186);
  v1145 = v187;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v178, v188, v28 + 1, v189, v190);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v191, v192, v193, v194, v195);
    v197 = v196;

    v1145 = v1145 + (float)((float)(v197 - v1145) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v188, (uint64_t)CFSTR("HCNRa"), v189, v190);
  v198 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v198, v199, v28, v200, v201);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v202, v203, v204, v205, v206);
  v1143 = v207;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v198, v208, v28 + 1, v209, v210);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v211, v212, v213, v214, v215);
    v217 = v216;

    v1143 = v1143 + (float)((float)(v217 - v1143) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v208, (uint64_t)CFSTR("HCNRb"), v209, v210);
  v218 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v218, v219, v28, v220, v221);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v222, v223, v224, v225, v226);
  v228 = v227;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v218, v229, v28 + 1, v230, v231);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v232, v233, v234, v235, v236);
    v238 = v237;

    v228 = v228 + (float)((float)(v238 - v228) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v229, (uint64_t)CFSTR("HCNRc"), v230, v231);
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v239, v240, v28, v241, v242);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v243, v244, v245, v246, v247);
  v1142 = v248;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v239, v249, v28 + 1, v250, v251);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v252, v253, v254, v255, v256);
    v258 = v257;

    v1142 = v1142 + (float)((float)(v258 - v1142) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v249, (uint64_t)CFSTR("HCNDa"), v250, v251);
  v259 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v259, v260, v28, v261, v262);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v263, v264, v265, v266, v267);
  v1141 = v268;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v259, v269, v28 + 1, v270, v271);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v272, v273, v274, v275, v276);
    v278 = v277;

    v1141 = v1141 + (float)((float)(v278 - v1141) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v269, (uint64_t)CFSTR("HCNDb"), v270, v271);
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v279, v280, v28, v281, v282);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v283, v284, v285, v286, v287);
  v289 = v288;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v279, v290, v28 + 1, v291, v292);
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v293, v294, v295, v296, v297);
    v299 = v298;

    v289 = v289 + (float)((float)(v299 - v289) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v290, (uint64_t)CFSTR("HCNDc"), v291, v292);
  v300 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v300, v301, v28, v302, v303);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v304, v305, v306, v307, v308);
  v1140 = v309;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v300, v310, v28 + 1, v311, v312);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v313, v314, v315, v316, v317);
    v319 = v318;

    v1140 = v1140 + (float)((float)(v319 - v1140) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v310, (uint64_t)CFSTR("QCNRa"), v311, v312);
  v320 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v320, v321, v28, v322, v323);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v324, v325, v326, v327, v328);
  v1138 = v329;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v320, v330, v28 + 1, v331, v332);
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v333, v334, v335, v336, v337);
    v339 = v338;

    v1138 = v1138 + (float)((float)(v339 - v1138) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v330, (uint64_t)CFSTR("QCNRb"), v331, v332);
  v340 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v340, v341, v28, v342, v343);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v344, v345, v346, v347, v348);
  v350 = v349;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v340, v351, v28 + 1, v352, v353);
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v354, v355, v356, v357, v358);
    v360 = v359;

    v350 = v350 + (float)((float)(v360 - v350) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v351, (uint64_t)CFSTR("QCNRc"), v352, v353);
  v361 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v361, v362, v28, v363, v364);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v365, v366, v367, v368, v369);
  v1137 = v370;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v361, v371, v28 + 1, v372, v373);
    v374 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v374, v375, v376, v377, v378);
    v380 = v379;

    v1137 = v1137 + (float)((float)(v380 - v1137) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v371, (uint64_t)CFSTR("QCNDa"), v372, v373);
  v381 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v381, v382, v28, v383, v384);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v385, v386, v387, v388, v389);
  v1136 = v390;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v381, v391, v28 + 1, v392, v393);
    v394 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v394, v395, v396, v397, v398);
    v400 = v399;

    v1136 = v1136 + (float)((float)(v400 - v1136) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v391, (uint64_t)CFSTR("QCNDb"), v392, v393);
  v401 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v401, v402, v28, v403, v404);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v405, v406, v407, v408, v409);
  v411 = v410;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v401, v412, v28 + 1, v413, v414);
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v415, v416, v417, v418, v419);
    v421 = v420;

    v411 = v411 + (float)((float)(v421 - v411) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v412, (uint64_t)CFSTR("QCNDc"), v413, v414);
  v422 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v422, v423, v28, v424, v425);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v426, v427, v428, v429, v430);
  v1135 = v431;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v422, v432, v28 + 1, v433, v434);
    v435 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v435, v436, v437, v438, v439);
    v441 = v440;

    v1135 = v1135 + (float)((float)(v441 - v1135) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v432, (uint64_t)CFSTR("ECNRa"), v433, v434);
  v442 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v442, v443, v28, v444, v445);
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v446, v447, v448, v449, v450);
  v1134 = v451;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v442, v452, v28 + 1, v453, v454);
    v455 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v455, v456, v457, v458, v459);
    v461 = v460;

    v1134 = v1134 + (float)((float)(v461 - v1134) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v452, (uint64_t)CFSTR("ECNRb"), v453, v454);
  v462 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v462, v463, v28, v464, v465);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v466, v467, v468, v469, v470);
  v472 = v471;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v462, v473, v28 + 1, v474, v475);
    v476 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v476, v477, v478, v479, v480);
    v482 = v481;

    v472 = v472 + (float)((float)(v482 - v472) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v473, (uint64_t)CFSTR("ECNRc"), v474, v475);
  v483 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v483, v484, v28, v485, v486);
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v487, v488, v489, v490, v491);
  v1133 = v492;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v483, v493, v28 + 1, v494, v495);
    v496 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v496, v497, v498, v499, v500);
    v502 = v501;

    v1133 = v1133 + (float)((float)(v502 - v1133) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v493, (uint64_t)CFSTR("ECNDa"), v494, v495);
  v503 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v503, v504, v28, v505, v506);
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v507, v508, v509, v510, v511);
  v1132 = v512;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v503, v513, v28 + 1, v514, v515);
    v516 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v516, v517, v518, v519, v520);
    v522 = v521;

    v1132 = v1132 + (float)((float)(v522 - v1132) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v513, (uint64_t)CFSTR("ECNDb"), v514, v515);
  v523 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v523, v524, v28, v525, v526);
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v527, v528, v529, v530, v531);
  v533 = v532;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v523, v534, v28 + 1, v535, v536);
    v537 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v537, v538, v539, v540, v541);
    v543 = v542;

    v533 = v533 + (float)((float)(v543 - v533) * v36);
  }
  objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v534, (uint64_t)CFSTR("ECNDc"), v535, v536);
  v544 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v544, v545, v28, v546, v547);
  v548 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v548, v549, v550, v551, v552);
  v1131 = v553;

  if (v35)
  {
    objc_msgSend_objectAtIndexedSubscript_(v544, v554, v28 + 1, v555, v556);
    v557 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v557, v558, v559, v560, v561);
    v563 = v562;

    v1131 = v1131 + (float)((float)(v563 - v1131) * v36);
  }
  v1124 = v46;
  v1125 = v544;
  v1120 = (float)(v1139 * 0.33333) + (float)(v1144 * 0.66667);
  v1116 = (float)(v1139 * 0.66667) + (float)(v1144 * 0.33333);
  v564 = v472 + (float)(v1139 * v533);
  v565 = fminf(fmaxf(v1129, 0.0), 1.0) * (float)(v1126 + v1126);
  v566 = v565 * v564;
  v1155 = v565 * (float)(v1157 + (float)(v1144 * v1154));
  v1119 = v565 * (float)(v228 + (float)(v1120 * v289));
  v567 = v1119 >= 0.00001 && v1155 >= 0.00001;
  v1117 = v565 * (float)(v350 + (float)(v1116 * v411));
  if (v1117 >= 0.00001)
    v568 = v567;
  else
    v568 = 0;
  v1127 = v568;
  if (v566 < 0.00001)
    v568 = 0;
  v1122 = v568;
  v569 = self->inputDespeckleParameters;
  objc_msgSend_objectForKeyedSubscript_(v569, v570, (uint64_t)CFSTR("enabled"), v571, v572);
  v573 = (void *)objc_claimAutoreleasedReturnValue();
  v1118 = objc_msgSend_BOOLValue(v573, v574, v575, v576, v577);

  objc_msgSend_objectForKeyedSubscript_(v569, v578, (uint64_t)CFSTR("SCSEnabled"), v579, v580);
  v581 = (void *)objc_claimAutoreleasedReturnValue();
  v1115 = objc_msgSend_BOOLValue(v581, v582, v583, v584, v585);

  objc_msgSend_objectForKeyedSubscript_(v569, v586, (uint64_t)CFSTR("SCSLuminanceThreshold"), v587, v588);
  v589 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v589, v590, v591, v592, v593);
  v1114 = v594;

  objc_msgSend_objectForKeyedSubscript_(v569, v595, (uint64_t)CFSTR("SCSSparkleThreshold"), v596, v597);
  v598 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v598, v599, v600, v601, v602);
  v1113 = v603;

  objc_msgSend_objectForKeyedSubscript_(v569, v604, (uint64_t)CFSTR("NCSEnabled"), v605, v606);
  v607 = (void *)objc_claimAutoreleasedReturnValue();
  v1112 = objc_msgSend_BOOLValue(v607, v608, v609, v610, v611);

  objc_msgSend_objectForKeyedSubscript_(v569, v612, (uint64_t)CFSTR("NCSSaturationThreshold"), v613, v614);
  v615 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v615, v616, v617, v618, v619);
  v1111 = v620;

  objc_msgSend_objectForKeyedSubscript_(v569, v621, (uint64_t)CFSTR("NCSRedBluePop"), v622, v623);
  v624 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v624, v625, v626, v627, v628);
  v1110 = v629;

  objc_msgSend_objectForKeyedSubscript_(v569, v630, (uint64_t)CFSTR("NCSContrastThreshold"), v631, v632);
  v633 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v633, v634, v635, v636, v637);
  v1109 = v638;

  objc_msgSend_objectForKeyedSubscript_(v569, v639, (uint64_t)CFSTR("NCSCountThreshold"), v640, v641);
  v642 = (void *)objc_claimAutoreleasedReturnValue();
  v1108 = objc_msgSend_intValue(v642, v643, v644, v645, v646);

  objc_msgSend_objectForKeyedSubscript_(v569, v647, (uint64_t)CFSTR("BCSEnabled"), v648, v649);
  v650 = (void *)objc_claimAutoreleasedReturnValue();
  v1107 = objc_msgSend_BOOLValue(v650, v651, v652, v653, v654);

  objc_msgSend_objectForKeyedSubscript_(v569, v655, (uint64_t)CFSTR("BCSRedPop"), v656, v657);
  v658 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v658, v659, v660, v661, v662);
  v1106 = v663;

  objc_msgSend_objectForKeyedSubscript_(v569, v664, (uint64_t)CFSTR("BCSBlueness"), v665, v666);
  v667 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v667, v668, v669, v670, v671);
  v1105 = v672;

  objc_msgSend_objectForKeyedSubscript_(v569, v673, (uint64_t)CFSTR("BCSContrastThreshold"), v674, v675);
  v676 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v676, v677, v678, v679, v680);
  v1104 = v681;

  objc_msgSend_X(self->inputNeutralFactors, v682, v683, v684, v685);
  v687 = v686;
  objc_msgSend_Y(self->inputNeutralFactors, v688, v689, v690, v691);
  v693 = v692;
  objc_msgSend_Z(self->inputNeutralFactors, v694, v695, v696, v697);
  v698 = v687;
  v699 = v693;
  v701 = v700;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v702, v703, v704, v705, v698, v699, v701, 1.0);
  v706 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v707, v708, v709, v710, (float)(1.0 / v698), (float)(1.0 / v699), (float)(1.0 / v701), 1.0);
  v711 = objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v1164, 0.5, 0.5);
  CGAffineTransformMakeScale(&v1163, 2.0, 2.0);
  objc_msgSend_floatValue(self->inputMoireRadius, v712, v713, v714, v715);
  v717 = v716;
  objc_msgSend_floatValue(self->inputMoireAmount, v718, v719, v720, v721);
  v1158 = (void *)v711;
  v1130 = v726 * 0.04;
  if ((float)(v726 * 0.04) == 0.0)
    v727 = 0.0;
  else
    v727 = v717;
  if (v727 <= 0.0)
  {
    v729 = objc_msgSend_BOOLValue(self->inputShowHF, v722, v723, v724, v725);
    v728 = v729;
    *(float *)&v730 = v1155;
    if (v1155 >= 0.00001)
      v731 = 1;
    else
      v731 = v729;
    if ((v731 & 1) == 0)
    {
      objc_msgSend_kernelWithName_(V8CNRKernels, v722, (uint64_t)CFSTR("multiplyByNeutralFactors"), v724, v725, v730);
      v879 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extent(v1160, v880, v881, v882, v883);
      v885 = v884;
      v887 = v886;
      v889 = v888;
      v891 = v890;
      v1175[0] = v1160;
      v1175[1] = v706;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v892, (uint64_t)v1175, 2, v893);
      v894 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_arguments_(v879, v895, (uint64_t)v894, v896, v897, v885, v887, v889, v891);
      v783 = (void *)objc_claimAutoreleasedReturnValue();

      v784 = 0;
      goto LABEL_142;
    }
  }
  else
  {
    v728 = 1;
  }
  v1103 = v566;
  inputImage = self->inputImage;
  v733 = objc_msgSend_intValue(self->inputSensorPattern, v722, v723, v724, v725);
  isBayerGreenAlignedforImage_andPattern = objc_msgSend_isBayerGreenAlignedforImage_andPattern_(self, v734, (uint64_t)inputImage, v733, v735);
  v741 = v565 * (float)(v1150 + (float)(v1144 * v1145));
  v1146 = v565 * (float)(v1152 + (float)(v1144 * v1147));
  v1148 = v741;
  if (isBayerGreenAlignedforImage_andPattern)
    v742 = -1.0;
  else
    v742 = 1.0;
  if (v727 > 2.0)
    v743 = 1;
  else
    v743 = v567;
  v1151 = v699 / v701;
  v1153 = v699 / v698;
  if ((v743 & 1) == 0 && (objc_msgSend_BOOLValue(self->inputShowHF, v737, v738, v739, v740) & 1) == 0)
  {
    if (v728)
    {
      objc_msgSend_kernelWithName_(V8CNRKernels, v737, (uint64_t)CFSTR("highFrequencyIntoAlpha"), v739, v740);
      v898 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extent(v1160, v899, v900, v901, v902);
      v904 = v903;
      v906 = v905;
      v908 = v907;
      v910 = v909;
      v1174[0] = v1160;
      v1174[1] = v706;
      v1174[2] = self->inputHighFrequencyFactor;
      *(float *)&v903 = v742;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v911, v912, v913, v914, v903);
      v915 = (void *)objc_claimAutoreleasedReturnValue();
      v1174[3] = v915;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v916, (uint64_t)v1174, 4, v917);
      v918 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v898, v919, (uint64_t)&unk_1E999C158, (uint64_t)v918, v920, v904, v906, v908, v910);
      v921 = objc_claimAutoreleasedReturnValue();

      v922 = v898;
      v1160 = (id)v921;
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v923, (uint64_t)CFSTR("%s%s"), v924, v925, "powerBlurLFS", "HF");
    }
    else
    {
      v922 = 0;
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v737, (uint64_t)CFSTR("%s%s"), v739, v740, "powerBlurLFS", ");
    }
    v926 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(V8CNRKernels, v927, (uint64_t)v926, v928, v929);
    v784 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v1160, v930, v931, v932, v933);
    v1183 = CGRectInset(v1182, -4.0, -4.0);
    x = v1183.origin.x;
    y = v1183.origin.y;
    width = v1183.size.width;
    height = v1183.size.height;
    v1173[0] = v1160;
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v938, v939, v940, v941, v1153, 1.0, v1151, 0.0);
    v942 = (void *)objc_claimAutoreleasedReturnValue();
    v1173[1] = v942;
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v943, v944, v945, v946, v1146, v1155, v1148, v1130);
    v947 = (void *)objc_claimAutoreleasedReturnValue();
    v1173[2] = v947;
    v1173[3] = v706;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v948, (uint64_t)v1173, 4, v949);
    v950 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v784, v951, (uint64_t)&unk_1E999C178, (uint64_t)v950, v952, x, y, width, height);
    v953 = (void *)objc_claimAutoreleasedReturnValue();

    v954 = v953;
LABEL_141:
    v783 = v954;
    v1160 = v954;
    goto LABEL_142;
  }
  if (v728)
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v737, (uint64_t)CFSTR("%s%s"), v739, v740, "extractHRGB", "HF");
  else
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v737, (uint64_t)CFSTR("%s%s"), v739, v740, "extractHRGB", ");
  v744 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(V8CNRKernels, v745, (uint64_t)v744, v746, v747);
  v748 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_extent(v1160, v749, v750, v751, v752);
  v1162 = v1164;
  v1177 = CGRectApplyAffineTransform(v1176, &v1162);
  v753 = v1177.origin.x;
  v754 = v1177.origin.y;
  v755 = v1177.size.width;
  v756 = v1177.size.height;
  v1172[0] = v1160;
  v1172[1] = v706;
  v757 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend_floatValue(self->inputHighFrequencyFactor, v758, v759, v760, v761);
  objc_msgSend_vectorWithX_Y_Z_W_(v757, v763, v764, v765, v766, v762, v742, 0.0, 0.0);
  v767 = (void *)objc_claimAutoreleasedReturnValue();
  v1172[2] = v767;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v768, (uint64_t)v1172, 3, v769);
  v770 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_roiCallback_arguments_(v748, v771, (uint64_t)&unk_1E999C198, (uint64_t)v770, v772, v753, v754, v755, v756);
  v773 = (void *)objc_claimAutoreleasedReturnValue();

  v1160 = v773;
  if (!objc_msgSend_BOOLValue(self->inputShowHF, v774, v775, v776, v777))
  {
    if (v1155 >= 0.00001 || v727 > 0.0)
    {
      LODWORD(v781) = 0;
      if (v727 >= 1.0)
        *(float *)&v782 = 0.0;
      else
        *(float *)&v782 = v727;
      v785 = "i";
      if (v727 >= 1.0)
        v785 = "";
      v786 = "HF";
      if (v727 == 0.0)
      {
        v786 = "";
        v787 = 0.0;
      }
      else
      {
        v787 = *(float *)&v782;
      }
      if (v727 == 0.0)
        v785 = "";
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v778, (uint64_t)CFSTR("%s%s%s"), v779, v780, v781, v782, "powerBlurL", v786, v785);
      v788 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_kernelWithName_(V8CNRKernels, v789, (uint64_t)v788, v790, v791);
      v792 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v773, v793, v794, v795, v796);
      v1179 = CGRectInset(v1178, -2.0, -2.0);
      v797 = v1179.origin.x;
      v798 = v1179.origin.y;
      v799 = v1179.size.width;
      v800 = v1179.size.height;
      v1171[0] = v773;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v801, v802, v803, v804, v1153, 1.0, v1151, 1.0);
      v805 = (void *)objc_claimAutoreleasedReturnValue();
      v1171[1] = v805;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v806, v807, v808, v809, v1146, v1155, v1148, v1130);
      v810 = (void *)objc_claimAutoreleasedReturnValue();
      v1171[2] = v810;
      *(float *)&v811 = v787;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v812, v813, v814, v815, v811);
      v816 = (void *)objc_claimAutoreleasedReturnValue();
      v1171[3] = v816;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v817, (uint64_t)v1171, 4, v818);
      v819 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v792, v820, (uint64_t)&unk_1E999C1B8, (uint64_t)v819, v821, v797, v798, v799, v800);
      v822 = objc_claimAutoreleasedReturnValue();

      v748 = v792;
      v1160 = (id)v822;
    }
    if (((v727 < 1.0) & ~v567) == 0)
    {
      v823 = v565 * (float)(v1143 + (float)(v1120 * v1141));
      v824 = v565 * (float)(v1142 + (float)(v1120 * v1140));
      v825 = v727 < 3.0;
      v826 = v727 > 1.0;
      v827 = (float)(v727 + -1.0) * 0.5;
      v828 = "HF";
      if (v727 <= 1.0)
        v828 = "";
      v829 = !v826 || !v825;
      if (!v826 || !v825)
        v827 = 0.0;
      v1156 = v827;
      v830 = "i";
      if (v829)
        v830 = "";
      if (v1118)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v778, (uint64_t)CFSTR("%s%s%s"), v779, v780, "powerBlurDespeckleL", v828, v830);
        v831 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_kernelWithName_(V8CNRKernels, v832, (uint64_t)v831, v833, v834);
        v835 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v1160, v836, v837, v838, v839);
        v1181 = CGRectInset(v1180, -6.0, -6.0);
        v840 = v1181.origin.x;
        v841 = v1181.origin.y;
        v842 = v1181.size.width;
        v843 = v1181.size.height;
        v1170[0] = v1160;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v844, v845, v846, v847, v1153, 1.0, v1151, 3.0);
        v1149 = (void *)objc_claimAutoreleasedReturnValue();
        v1170[1] = v1149;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v848, v849, v850, v851, v823, v1119, v824, v1130);
        v852 = (void *)objc_claimAutoreleasedReturnValue();
        v1170[2] = v852;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v853, v854, v855, v856, 0.0, (double)v1115, v1114, v1113);
        v857 = (void *)objc_claimAutoreleasedReturnValue();
        v1170[3] = v857;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v858, v859, v860, v861, (double)v1112, v1111, v1110, v1109);
        v862 = (void *)objc_claimAutoreleasedReturnValue();
        v1170[4] = v862;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v863, v864, v865, v866, (double)v1108, (double)v1107, v1106, v1105);
        v867 = (void *)objc_claimAutoreleasedReturnValue();
        v1170[5] = v867;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v868, v869, v870, v871, v1104, v1156, 0.0, 0.0);
        v872 = (void *)objc_claimAutoreleasedReturnValue();
        v1170[6] = v872;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v873, (uint64_t)v1170, 7, v874);
        v875 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v835, v876, (uint64_t)&unk_1E999C1D8, (uint64_t)v875, v877, v840, v841, v842, v843);
        v878 = objc_claimAutoreleasedReturnValue();

        v1160 = (id)v878;
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v778, (uint64_t)CFSTR("%s%s%s"), v779, v780, "powerBlurL", v828, v830);
        v955 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_kernelWithName_(V8CNRKernels, v956, (uint64_t)v955, v957, v958);
        v835 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v1160, v959, v960, v961, v962);
        v1185 = CGRectInset(v1184, -6.0, -6.0);
        v963 = v1185.origin.x;
        v964 = v1185.origin.y;
        v965 = v1185.size.width;
        v966 = v1185.size.height;
        v1169[0] = v1160;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v967, v968, v969, v970, v1153, 1.0, v1151, 3.0);
        v1149 = (void *)objc_claimAutoreleasedReturnValue();
        v1169[1] = v1149;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v971, v972, v973, v974, v823, v1119, v824, v1130);
        v852 = (void *)objc_claimAutoreleasedReturnValue();
        v1169[2] = v852;
        *(float *)&v975 = v1156;
        objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v976, v977, v978, v979, v975);
        v857 = (void *)objc_claimAutoreleasedReturnValue();
        v1169[3] = v857;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v980, (uint64_t)v1169, 4, v981);
        v862 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v835, v982, (uint64_t)&unk_1E999C1F8, (uint64_t)v862, v983, v963, v964, v965, v966);
        v867 = v1160;
        v1160 = (id)objc_claimAutoreleasedReturnValue();
      }

      v748 = v835;
    }
    if (((v727 < 3.0) & ~v1127) == 0)
    {
      v984 = 0.0;
      if (v727 <= 3.0)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v778, (uint64_t)CFSTR("%s%s%s"), v779, v780, "powerBlurEarlyOutL", ", ");
      }
      else if (v727 >= 7.0)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v778, (uint64_t)CFSTR("%s%s%s"), v779, v780, "powerBlurEarlyOutL", "HF", ");
      }
      else
      {
        v984 = (float)(v727 + -3.0) * 0.25;
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v778, (uint64_t)CFSTR("%s%s%s"), v779, v780, "powerBlurEarlyOutL", "HF", "i");
      }
      v985 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_kernelWithName_(V8CNRKernels, v986, (uint64_t)v985, v987, v988);
      v989 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v1160, v990, v991, v992, v993);
      v1187 = CGRectInset(v1186, -14.0, -14.0);
      v994 = v1187.origin.x;
      v995 = v1187.origin.y;
      v996 = v1187.size.width;
      v997 = v1187.size.height;
      v1168[0] = v1160;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v998, v999, v1000, v1001, v1153, 1.0, v1151, 7.0);
      v1002 = (void *)objc_claimAutoreleasedReturnValue();
      v1168[1] = v1002;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1003, v1004, v1005, v1006, (float)(v565 * (float)(v1138 + (float)(v1116 * v1136))), v1117, (float)(v565 * (float)(v1137 + (float)(v1116 * v1135))), v1130);
      v1007 = (void *)objc_claimAutoreleasedReturnValue();
      v1168[2] = v1007;
      *(float *)&v1008 = v984;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v1009, v1010, v1011, v1012, v1008);
      v1013 = (void *)objc_claimAutoreleasedReturnValue();
      v1168[3] = v1013;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1014, (uint64_t)v1168, 4, v1015);
      v1016 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v989, v1017, (uint64_t)&unk_1E999C218, (uint64_t)v1016, v1018, v994, v995, v996, v997);
      v1019 = objc_claimAutoreleasedReturnValue();

      v748 = v989;
      v1160 = (id)v1019;
    }
    if (((v727 < 7.0) & ~v1122) == 0)
    {
      v1020 = v565 * (float)(v1134 + (float)(v1139 * v1132));
      v1021 = v565 * (float)(v1133 + (float)(v1139 * v1131));
      v1022 = "HF";
      if (v727 <= 7.0)
        v1022 = "";
      v1023 = "i";
      if (v727 > 7.0 && v727 < 14.0)
        v1024 = (float)(v727 + -7.0) * 0.14286;
      else
        v1024 = 0.0;
      if (v727 <= 7.0 || v727 >= 14.0)
        v1023 = "";
      LODWORD(v781) = 1.5;
      *(float *)&v782 = v1121;
      if (v1121 <= 1.5)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v778, (uint64_t)CFSTR("%s%s%s"), v779, v780, v781, v782, "powerBlurEarlyOutL", v1022, v1023);
        v1058 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_kernelWithName_(V8CNRKernels, v1059, (uint64_t)v1058, v1060, v1061);
        v1029 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v1160, v1062, v1063, v1064, v1065);
        v1191 = CGRectInset(v1190, -28.0, -28.0);
        v1066 = v1191.origin.x;
        v1067 = v1191.origin.y;
        v1068 = v1191.size.width;
        v1069 = v1191.size.height;
        v1166[0] = v1160;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1070, v1071, v1072, v1073, v1153, 1.0, v1151, 14.0);
        v1042 = (void *)objc_claimAutoreleasedReturnValue();
        v1166[1] = v1042;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1074, v1075, v1076, v1077, v1020, v1103, v1021, v1130);
        v1047 = (void *)objc_claimAutoreleasedReturnValue();
        v1166[2] = v1047;
        *(float *)&v1078 = v1024;
        objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v1079, v1080, v1081, v1082, v1078);
        v1052 = (void *)objc_claimAutoreleasedReturnValue();
        v1166[3] = v1052;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1083, (uint64_t)v1166, 4, v1084);
        v1055 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v1029, v1085, (uint64_t)&unk_1E999C258, (uint64_t)v1055, v1086, v1066, v1067, v1068, v1069);
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v778, (uint64_t)CFSTR("%s%s%s"), v779, v780, v781, v782, "powerBlurEarlyOut2L", v1022, v1023);
        v1025 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_kernelWithName_(V8CNRKernels, v1026, (uint64_t)v1025, v1027, v1028);
        v1029 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v1160, v1030, v1031, v1032, v1033);
        v1189 = CGRectInset(v1188, -28.0, -28.0);
        v1034 = v1189.origin.x;
        v1035 = v1189.origin.y;
        v1036 = v1189.size.width;
        v1037 = v1189.size.height;
        v1167[0] = v1160;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1038, v1039, v1040, v1041, v1153, 1.0, v1151, 14.0);
        v1042 = (void *)objc_claimAutoreleasedReturnValue();
        v1167[1] = v1042;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1043, v1044, v1045, v1046, v1020, v1103, v1021, v1130);
        v1047 = (void *)objc_claimAutoreleasedReturnValue();
        v1167[2] = v1047;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1048, v1049, v1050, v1051, 5.0, 0.150000006, v1024, 0.0);
        v1052 = (void *)objc_claimAutoreleasedReturnValue();
        v1167[3] = v1052;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1053, (uint64_t)v1167, 4, v1054);
        v1055 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v1029, v1056, (uint64_t)&unk_1E999C238, (uint64_t)v1055, v1057, v1034, v1035, v1036, v1037);
      }
      v1087 = objc_claimAutoreleasedReturnValue();

      v748 = v1029;
      v1160 = (id)v1087;
    }
    objc_msgSend_kernelWithName_(V8CNRKernels, v778, (uint64_t)CFSTR("expandHRGB"), v779, v780);
    v784 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v1160, v1088, v1089, v1090, v1091);
    v1161 = v1163;
    v1193 = CGRectApplyAffineTransform(v1192, &v1161);
    v1092 = v1193.origin.x;
    v1093 = v1193.origin.y;
    v1094 = v1193.size.width;
    v1095 = v1193.size.height;
    v1165 = v1160;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1096, (uint64_t)&v1165, 1, v1097);
    v1098 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v784, v1099, (uint64_t)&unk_1E999C278, (uint64_t)v1098, v1100, v1092, v1093, v1094, v1095);
    v1101 = (void *)objc_claimAutoreleasedReturnValue();

    v954 = v1101;
    goto LABEL_141;
  }
  sub_1D53DBB64(v773, v1158, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v783 = (void *)objc_claimAutoreleasedReturnValue();
  v784 = v748;
LABEL_142:

  return v783;
}

- (id)kernelWithName:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char isEqualToString;
  const char *v22;
  const char *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  char v31[256];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = a4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v6);
        v9 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v11);

        objc_msgSend_name(v9, v13, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)v5, v19, v20);

        if ((isEqualToString & 1) != 0)
        {
          v24 = v9;

          goto LABEL_12;
        }
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v22, (uint64_t)&v26, (uint64_t)v30, 16);
      if (v8)
        continue;
      break;
    }

  }
  objc_msgSend_getCString_maxLength_encoding_(v5, v23, (uint64_t)v31, 256, 30);
  printf("kernel %s not found\n", v31);
  v24 = 0;
LABEL_12:

  return v24;
}

- (id)kernelArrayWithResourceName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;

  v3 = a3;
  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_(v8, v9, (uint64_t)v3, (uint64_t)CFSTR("cikernel"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], v12, (uint64_t)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_length(v15, v16, v17, v18, v19);
  v21 = malloc_type_malloc(v20 + 1, 0x74E3DEDBuLL);
  objc_msgSend_getBytes_range_(v15, v22, (uint64_t)v21, 0, v20);
  v21[v20] = 0;
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v23, (uint64_t)v21, 30, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelsWithString_messageLog_(MEMORY[0x1E0C9DDD0], v26, (uint64_t)v25, 0, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  free(v21);

  return v28;
}

- (id)V8OutputImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  float v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  float v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  float v61;
  float v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  float v71;
  float v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  float v84;
  float v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  float v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  float v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  float v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  _BOOL4 v140;
  float v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  float v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  float v166;
  float v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  float v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  float v185;
  float v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  float v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  float v205;
  float v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  float v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  float v224;
  float v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  float v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  float v244;
  float v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  float v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  float v263;
  float v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  float v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  float v283;
  float v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  float v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  float v302;
  float v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  float v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  float v322;
  float v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  float v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  float v341;
  float v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  float v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  float v361;
  float v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  float v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  float v380;
  float v381;
  float v382;
  float v383;
  const char *v384;
  uint64_t v385;
  uint64_t v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  void *v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  float v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  float v405;
  float v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  float v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  void *v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  float v424;
  float v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  void *v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  float v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  float v444;
  float v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  void *v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  float v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  void *v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  float v463;
  float v464;
  void *v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  void *v469;
  const char *v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  float v474;
  const char *v475;
  uint64_t v476;
  uint64_t v477;
  void *v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  float v483;
  float v484;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  void *v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  float v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  float v502;
  float v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  void *v507;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  void *v511;
  const char *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  float v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  void *v520;
  const char *v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  float v525;
  float v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  void *v530;
  const char *v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  float v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  void *v539;
  const char *v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  float v544;
  float v545;
  void *v546;
  const char *v547;
  uint64_t v548;
  uint64_t v549;
  void *v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  float v555;
  const char *v556;
  uint64_t v557;
  uint64_t v558;
  void *v559;
  const char *v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  float v564;
  float v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  void *v569;
  const char *v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  float v574;
  const char *v575;
  uint64_t v576;
  uint64_t v577;
  void *v578;
  const char *v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  float v583;
  float v584;
  void *v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  void *v589;
  const char *v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  float v594;
  const char *v595;
  uint64_t v596;
  uint64_t v597;
  void *v598;
  const char *v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  float v603;
  float v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  void *v608;
  const char *v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  float v613;
  const char *v614;
  uint64_t v615;
  uint64_t v616;
  void *v617;
  const char *v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  float v622;
  float v623;
  void *v624;
  const char *v625;
  uint64_t v626;
  uint64_t v627;
  void *v628;
  const char *v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  float v633;
  const char *v634;
  uint64_t v635;
  uint64_t v636;
  void *v637;
  const char *v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  float v642;
  float v643;
  const char *v644;
  uint64_t v645;
  uint64_t v646;
  void *v647;
  const char *v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  float v652;
  const char *v653;
  uint64_t v654;
  uint64_t v655;
  void *v656;
  const char *v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  float v661;
  float v662;
  void *v663;
  const char *v664;
  uint64_t v665;
  uint64_t v666;
  void *v667;
  const char *v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  float v672;
  const char *v673;
  uint64_t v674;
  uint64_t v675;
  void *v676;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  float v681;
  float v682;
  const char *v683;
  uint64_t v684;
  uint64_t v685;
  void *v686;
  const char *v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t v690;
  float v691;
  const char *v692;
  uint64_t v693;
  uint64_t v694;
  void *v695;
  const char *v696;
  uint64_t v697;
  uint64_t v698;
  uint64_t v699;
  float v700;
  float v701;
  void *v702;
  const char *v703;
  uint64_t v704;
  uint64_t v705;
  void *v706;
  const char *v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  float v711;
  const char *v712;
  uint64_t v713;
  uint64_t v714;
  void *v715;
  const char *v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t v719;
  float v720;
  float v721;
  const char *v722;
  uint64_t v723;
  uint64_t v724;
  void *v725;
  const char *v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  float v730;
  const char *v731;
  uint64_t v732;
  uint64_t v733;
  void *v734;
  const char *v735;
  uint64_t v736;
  uint64_t v737;
  uint64_t v738;
  float v739;
  float v740;
  void *v741;
  const char *v742;
  uint64_t v743;
  uint64_t v744;
  void *v745;
  const char *v746;
  uint64_t v747;
  uint64_t v748;
  uint64_t v749;
  float v750;
  const char *v751;
  uint64_t v752;
  uint64_t v753;
  void *v754;
  const char *v755;
  uint64_t v756;
  uint64_t v757;
  uint64_t v758;
  float v759;
  float v760;
  const char *v761;
  uint64_t v762;
  uint64_t v763;
  void *v764;
  const char *v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  float v769;
  const char *v770;
  uint64_t v771;
  uint64_t v772;
  void *v773;
  const char *v774;
  uint64_t v775;
  uint64_t v776;
  uint64_t v777;
  float v778;
  float v779;
  void *v780;
  const char *v781;
  uint64_t v782;
  uint64_t v783;
  void *v784;
  const char *v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  float v789;
  const char *v790;
  uint64_t v791;
  uint64_t v792;
  void *v793;
  const char *v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  float v798;
  float v799;
  const char *v800;
  uint64_t v801;
  uint64_t v802;
  void *v803;
  const char *v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  float v808;
  const char *v809;
  uint64_t v810;
  uint64_t v811;
  void *v812;
  const char *v813;
  uint64_t v814;
  uint64_t v815;
  uint64_t v816;
  float v817;
  float v818;
  void *v819;
  const char *v820;
  uint64_t v821;
  uint64_t v822;
  void *v823;
  const char *v824;
  uint64_t v825;
  uint64_t v826;
  uint64_t v827;
  float v828;
  const char *v829;
  uint64_t v830;
  uint64_t v831;
  void *v832;
  const char *v833;
  uint64_t v834;
  uint64_t v835;
  uint64_t v836;
  float v837;
  float v838;
  const char *v839;
  uint64_t v840;
  uint64_t v841;
  void *v842;
  const char *v843;
  uint64_t v844;
  uint64_t v845;
  uint64_t v846;
  float v847;
  const char *v848;
  uint64_t v849;
  uint64_t v850;
  void *v851;
  const char *v852;
  uint64_t v853;
  uint64_t v854;
  uint64_t v855;
  float v856;
  float v857;
  float v858;
  float v859;
  const char *v860;
  uint64_t v861;
  uint64_t v862;
  void *v863;
  const char *v864;
  uint64_t v865;
  uint64_t v866;
  void *v867;
  const char *v868;
  uint64_t v869;
  uint64_t v870;
  uint64_t v871;
  float v872;
  const char *v873;
  uint64_t v874;
  uint64_t v875;
  void *v876;
  const char *v877;
  uint64_t v878;
  uint64_t v879;
  uint64_t v880;
  float v881;
  float v882;
  const char *v883;
  uint64_t v884;
  uint64_t v885;
  void *v886;
  const char *v887;
  uint64_t v888;
  uint64_t v889;
  uint64_t v890;
  float v891;
  const char *v892;
  uint64_t v893;
  uint64_t v894;
  void *v895;
  const char *v896;
  uint64_t v897;
  uint64_t v898;
  uint64_t v899;
  float v900;
  float v901;
  void *v902;
  const char *v903;
  uint64_t v904;
  uint64_t v905;
  void *v906;
  const char *v907;
  uint64_t v908;
  uint64_t v909;
  uint64_t v910;
  float v911;
  const char *v912;
  uint64_t v913;
  uint64_t v914;
  void *v915;
  const char *v916;
  uint64_t v917;
  uint64_t v918;
  uint64_t v919;
  float v920;
  float v921;
  const char *v922;
  uint64_t v923;
  uint64_t v924;
  void *v925;
  const char *v926;
  uint64_t v927;
  uint64_t v928;
  uint64_t v929;
  float v930;
  const char *v931;
  uint64_t v932;
  uint64_t v933;
  void *v934;
  const char *v935;
  uint64_t v936;
  uint64_t v937;
  uint64_t v938;
  float v939;
  float v940;
  void *v941;
  const char *v942;
  uint64_t v943;
  uint64_t v944;
  void *v945;
  const char *v946;
  uint64_t v947;
  uint64_t v948;
  uint64_t v949;
  float v950;
  const char *v951;
  uint64_t v952;
  uint64_t v953;
  void *v954;
  const char *v955;
  uint64_t v956;
  uint64_t v957;
  uint64_t v958;
  float v959;
  float v960;
  const char *v961;
  uint64_t v962;
  uint64_t v963;
  void *v964;
  const char *v965;
  uint64_t v966;
  uint64_t v967;
  uint64_t v968;
  float v969;
  const char *v970;
  uint64_t v971;
  uint64_t v972;
  void *v973;
  const char *v974;
  uint64_t v975;
  uint64_t v976;
  uint64_t v977;
  float v978;
  float v979;
  const char *v980;
  uint64_t v981;
  uint64_t v982;
  void *v983;
  const char *v984;
  uint64_t v985;
  uint64_t v986;
  void *v987;
  const char *v988;
  uint64_t v989;
  uint64_t v990;
  uint64_t v991;
  float v992;
  const char *v993;
  uint64_t v994;
  uint64_t v995;
  void *v996;
  const char *v997;
  uint64_t v998;
  uint64_t v999;
  uint64_t v1000;
  float v1001;
  float v1002;
  const char *v1003;
  uint64_t v1004;
  uint64_t v1005;
  void *v1006;
  const char *v1007;
  uint64_t v1008;
  uint64_t v1009;
  uint64_t v1010;
  float v1011;
  const char *v1012;
  uint64_t v1013;
  uint64_t v1014;
  void *v1015;
  const char *v1016;
  uint64_t v1017;
  uint64_t v1018;
  uint64_t v1019;
  float v1020;
  float v1021;
  void *v1022;
  const char *v1023;
  uint64_t v1024;
  uint64_t v1025;
  void *v1026;
  const char *v1027;
  uint64_t v1028;
  uint64_t v1029;
  uint64_t v1030;
  float v1031;
  const char *v1032;
  uint64_t v1033;
  uint64_t v1034;
  void *v1035;
  const char *v1036;
  uint64_t v1037;
  uint64_t v1038;
  uint64_t v1039;
  float v1040;
  float v1041;
  const char *v1042;
  uint64_t v1043;
  uint64_t v1044;
  void *v1045;
  const char *v1046;
  uint64_t v1047;
  uint64_t v1048;
  uint64_t v1049;
  float v1050;
  const char *v1051;
  uint64_t v1052;
  uint64_t v1053;
  void *v1054;
  const char *v1055;
  uint64_t v1056;
  uint64_t v1057;
  uint64_t v1058;
  float v1059;
  float v1060;
  void *v1061;
  const char *v1062;
  uint64_t v1063;
  uint64_t v1064;
  void *v1065;
  const char *v1066;
  uint64_t v1067;
  uint64_t v1068;
  uint64_t v1069;
  float v1070;
  const char *v1071;
  uint64_t v1072;
  uint64_t v1073;
  void *v1074;
  const char *v1075;
  uint64_t v1076;
  uint64_t v1077;
  uint64_t v1078;
  float v1079;
  float v1080;
  const char *v1081;
  uint64_t v1082;
  uint64_t v1083;
  void *v1084;
  const char *v1085;
  uint64_t v1086;
  uint64_t v1087;
  uint64_t v1088;
  float v1089;
  const char *v1090;
  uint64_t v1091;
  uint64_t v1092;
  void *v1093;
  const char *v1094;
  uint64_t v1095;
  uint64_t v1096;
  uint64_t v1097;
  float v1098;
  float v1099;
  float v1100;
  float v1101;
  float v1102;
  float v1103;
  const char *v1104;
  uint64_t v1105;
  uint64_t v1106;
  uint64_t v1107;
  float v1108;
  float v1109;
  float v1110;
  float v1111;
  float v1112;
  float v1113;
  float v1114;
  float v1115;
  float v1116;
  const char *v1117;
  uint64_t v1118;
  uint64_t v1119;
  uint64_t v1120;
  float v1121;
  float v1122;
  const char *v1123;
  uint64_t v1124;
  uint64_t v1125;
  uint64_t v1126;
  const char *v1127;
  uint64_t v1128;
  uint64_t v1129;
  uint64_t v1130;
  float v1131;
  float v1132;
  float v1133;
  float v1134;
  float v1135;
  float v1136;
  float v1137;
  float v1138;
  float v1139;
  const char *v1140;
  uint64_t v1141;
  uint64_t v1142;
  uint64_t v1143;
  float v1144;
  const char *v1145;
  uint64_t v1146;
  uint64_t v1147;
  uint64_t v1148;
  float v1149;
  float v1150;
  const char *v1151;
  uint64_t v1152;
  uint64_t v1153;
  uint64_t v1154;
  float v1155;
  float v1156;
  float v1157;
  float v1158;
  unsigned int v1159;
  float v1160;
  const char *v1161;
  uint64_t v1162;
  uint64_t v1163;
  void *v1164;
  const char *v1165;
  uint64_t v1166;
  uint64_t v1167;
  uint64_t v1168;
  const char *v1169;
  uint64_t v1170;
  uint64_t v1171;
  void *v1172;
  const char *v1173;
  uint64_t v1174;
  uint64_t v1175;
  uint64_t v1176;
  float v1177;
  const char *v1178;
  uint64_t v1179;
  uint64_t v1180;
  void *v1181;
  const char *v1182;
  uint64_t v1183;
  uint64_t v1184;
  uint64_t v1185;
  float v1186;
  const char *v1187;
  uint64_t v1188;
  uint64_t v1189;
  void *v1190;
  const char *v1191;
  uint64_t v1192;
  uint64_t v1193;
  uint64_t v1194;
  float v1195;
  const char *v1196;
  uint64_t v1197;
  uint64_t v1198;
  uint64_t v1199;
  const char *v1200;
  uint64_t v1201;
  uint64_t v1202;
  uint64_t v1203;
  double v1204;
  double v1205;
  const char *v1206;
  uint64_t v1207;
  uint64_t v1208;
  uint64_t v1209;
  double v1210;
  double v1211;
  const char *v1212;
  uint64_t v1213;
  uint64_t v1214;
  uint64_t v1215;
  float v1216;
  float v1217;
  double v1218;
  float v1219;
  const char *v1220;
  uint64_t v1221;
  uint64_t v1222;
  uint64_t v1223;
  const char *v1224;
  uint64_t v1225;
  uint64_t v1226;
  uint64_t v1227;
  double v1228;
  double v1229;
  double v1230;
  double v1231;
  double v1232;
  double v1233;
  double v1234;
  double v1235;
  double x;
  double y;
  double width;
  double height;
  const char *v1240;
  uint64_t v1241;
  uint64_t v1242;
  const char *v1243;
  uint64_t v1244;
  uint64_t v1245;
  uint64_t v1246;
  const char *v1247;
  uint64_t v1248;
  uint64_t v1249;
  uint64_t v1250;
  id v1251;
  void *v1252;
  void *v1253;
  void *v1254;
  void *v1255;
  double v1256;
  double v1257;
  const char *v1258;
  uint64_t v1259;
  uint64_t v1260;
  uint64_t v1261;
  double v1262;
  double v1263;
  const char *v1264;
  uint64_t v1265;
  uint64_t v1266;
  uint64_t v1267;
  double v1268;
  const char *v1269;
  uint64_t v1270;
  uint64_t v1271;
  uint64_t v1272;
  const char *v1273;
  uint64_t v1274;
  uint64_t v1275;
  void *v1276;
  const char *v1277;
  uint64_t v1278;
  uint64_t v1279;
  uint64_t v1280;
  double v1281;
  double v1282;
  double v1283;
  double v1284;
  double v1285;
  double v1286;
  double v1287;
  double v1288;
  const char *v1289;
  uint64_t v1290;
  void *v1291;
  const char *v1292;
  uint64_t v1293;
  uint64_t v1294;
  const char *v1295;
  uint64_t v1296;
  uint64_t v1297;
  uint64_t v1298;
  const char *v1299;
  uint64_t v1300;
  uint64_t v1301;
  uint64_t v1302;
  double v1303;
  const char *v1304;
  uint64_t v1305;
  uint64_t v1306;
  uint64_t v1307;
  double v1308;
  double v1309;
  double v1310;
  double v1311;
  double v1312;
  double v1313;
  double v1314;
  double v1315;
  const char *v1316;
  uint64_t v1317;
  uint64_t v1318;
  uint64_t v1319;
  void *v1320;
  const char *v1321;
  uint64_t v1322;
  void *v1323;
  const char *v1324;
  uint64_t v1325;
  void *v1326;
  void *v1327;
  float v1328;
  uint64_t v1329;
  const char *v1330;
  uint64_t v1331;
  uint64_t v1332;
  uint64_t v1333;
  uint64_t v1334;
  const char *v1335;
  uint64_t v1336;
  uint64_t v1337;
  const char *v1338;
  uint64_t v1339;
  uint64_t v1340;
  uint64_t v1341;
  double v1342;
  double v1343;
  double v1344;
  double v1345;
  double v1346;
  double v1347;
  double v1348;
  double v1349;
  const char *v1350;
  uint64_t v1351;
  const char *v1352;
  uint64_t v1353;
  const char *v1354;
  uint64_t v1355;
  uint64_t v1356;
  const char *v1357;
  uint64_t v1358;
  uint64_t v1359;
  uint64_t v1360;
  double v1361;
  double v1362;
  double v1363;
  double v1364;
  const char *v1365;
  uint64_t v1366;
  void *v1367;
  const char *v1368;
  uint64_t v1369;
  const char *v1370;
  uint64_t v1371;
  uint64_t v1372;
  void *v1373;
  const char *v1374;
  uint64_t v1375;
  uint64_t v1376;
  uint64_t v1377;
  double v1378;
  CGFloat v1379;
  double v1380;
  CGFloat v1381;
  double v1382;
  CGFloat v1383;
  double v1384;
  CGFloat v1385;
  const char *v1386;
  uint64_t v1387;
  uint64_t v1388;
  uint64_t v1389;
  double v1390;
  double v1391;
  double v1392;
  double v1393;
  const char *v1394;
  uint64_t v1395;
  void *v1396;
  const char *v1397;
  uint64_t v1398;
  const char *v1399;
  uint64_t v1400;
  uint64_t v1401;
  const char *v1402;
  uint64_t v1403;
  uint64_t v1404;
  uint64_t v1405;
  double v1406;
  double v1407;
  double v1408;
  double v1409;
  const char *v1410;
  uint64_t v1411;
  void *v1412;
  const char *v1413;
  uint64_t v1414;
  const char *v1415;
  uint64_t v1416;
  uint64_t v1417;
  void *v1418;
  const char *v1419;
  uint64_t v1420;
  uint64_t v1421;
  uint64_t v1422;
  double v1423;
  CGFloat v1424;
  double v1425;
  CGFloat v1426;
  double v1427;
  CGFloat v1428;
  double v1429;
  CGFloat v1430;
  const char *v1431;
  uint64_t v1432;
  uint64_t v1433;
  uint64_t v1434;
  double v1435;
  double v1436;
  double v1437;
  double v1438;
  const char *v1439;
  uint64_t v1440;
  void *v1441;
  const char *v1442;
  uint64_t v1443;
  const char *v1444;
  uint64_t v1445;
  uint64_t v1446;
  const char *v1447;
  uint64_t v1448;
  uint64_t v1449;
  uint64_t v1450;
  double v1451;
  double v1452;
  double v1453;
  double v1454;
  const char *v1455;
  uint64_t v1456;
  void *v1457;
  const char *v1458;
  uint64_t v1459;
  const char *v1460;
  uint64_t v1461;
  uint64_t v1462;
  void *v1463;
  const char *v1464;
  uint64_t v1465;
  uint64_t v1466;
  uint64_t v1467;
  double v1468;
  CGFloat v1469;
  double v1470;
  CGFloat v1471;
  double v1472;
  CGFloat v1473;
  double v1474;
  CGFloat v1475;
  const char *v1476;
  uint64_t v1477;
  uint64_t v1478;
  uint64_t v1479;
  double v1480;
  double v1481;
  double v1482;
  double v1483;
  const char *v1484;
  uint64_t v1485;
  void *v1486;
  const char *v1487;
  uint64_t v1488;
  const char *v1489;
  uint64_t v1490;
  uint64_t v1491;
  const char *v1492;
  uint64_t v1493;
  uint64_t v1494;
  uint64_t v1495;
  double v1496;
  double v1497;
  double v1498;
  double v1499;
  const char *v1500;
  uint64_t v1501;
  void *v1502;
  const char *v1503;
  uint64_t v1504;
  const char *v1505;
  uint64_t v1506;
  uint64_t v1507;
  void *v1508;
  const char *v1509;
  uint64_t v1510;
  uint64_t v1511;
  uint64_t v1512;
  double v1513;
  CGFloat v1514;
  double v1515;
  CGFloat v1516;
  double v1517;
  CGFloat v1518;
  double v1519;
  CGFloat v1520;
  const char *v1521;
  uint64_t v1522;
  uint64_t v1523;
  uint64_t v1524;
  double v1525;
  double v1526;
  double v1527;
  double v1528;
  const char *v1529;
  uint64_t v1530;
  void *v1531;
  const char *v1532;
  uint64_t v1533;
  float v1534;
  const char *v1535;
  uint64_t v1536;
  uint64_t v1537;
  const char *v1538;
  uint64_t v1539;
  uint64_t v1540;
  uint64_t v1541;
  double v1542;
  double v1543;
  double v1544;
  double v1545;
  const char *v1546;
  uint64_t v1547;
  void *v1548;
  const char *v1549;
  uint64_t v1550;
  const char *v1551;
  uint64_t v1552;
  uint64_t v1553;
  uint64_t v1554;
  const char *v1555;
  uint64_t v1556;
  uint64_t v1557;
  void *v1558;
  const char *v1559;
  uint64_t v1560;
  uint64_t v1561;
  uint64_t v1562;
  double v1563;
  double v1564;
  double v1565;
  double v1566;
  const char *v1567;
  uint64_t v1568;
  void *v1569;
  const char *v1570;
  uint64_t v1571;
  const char *v1572;
  uint64_t v1573;
  uint64_t v1574;
  const char *v1575;
  uint64_t v1576;
  uint64_t v1577;
  uint64_t v1578;
  double v1579;
  double v1580;
  double v1581;
  double v1582;
  double v1583;
  double v1584;
  double v1585;
  double v1586;
  const char *v1587;
  uint64_t v1588;
  void *v1589;
  const char *v1590;
  uint64_t v1591;
  uint64_t v1592;
  const char *v1593;
  uint64_t v1594;
  uint64_t v1595;
  const char *v1596;
  uint64_t v1597;
  uint64_t v1598;
  uint64_t v1599;
  double v1600;
  double v1601;
  double v1602;
  double v1603;
  const char *v1604;
  uint64_t v1605;
  uint64_t v1606;
  uint64_t v1607;
  void *v1608;
  const char *v1609;
  uint64_t v1610;
  void *v1611;
  const char *v1612;
  uint64_t v1613;
  const char *v1614;
  uint64_t v1615;
  uint64_t v1616;
  void *v1617;
  const char *v1618;
  uint64_t v1619;
  uint64_t v1620;
  uint64_t v1621;
  CGFloat v1622;
  CGFloat v1623;
  CGFloat v1624;
  CGFloat v1625;
  const char *v1626;
  uint64_t v1627;
  uint64_t v1628;
  uint64_t v1629;
  CGFloat v1630;
  CGFloat v1631;
  CGFloat v1632;
  CGFloat v1633;
  double v1634;
  double v1635;
  double v1636;
  double v1637;
  const char *v1638;
  uint64_t v1639;
  uint64_t v1640;
  uint64_t v1641;
  void *v1642;
  const char *v1643;
  uint64_t v1644;
  void *v1645;
  const char *v1646;
  uint64_t v1647;
  const char *v1648;
  uint64_t v1649;
  uint64_t v1650;
  float v1651;
  float v1652;
  void *v1653;
  const char *v1654;
  uint64_t v1655;
  uint64_t v1656;
  uint64_t v1657;
  double v1658;
  double v1659;
  double v1660;
  double v1661;
  const char *v1662;
  uint64_t v1663;
  uint64_t v1664;
  uint64_t v1665;
  double v1666;
  CGFloat v1667;
  double v1668;
  CGFloat v1669;
  double v1670;
  CGFloat v1671;
  double v1672;
  CGFloat v1673;
  const char *v1674;
  uint64_t v1675;
  uint64_t v1676;
  uint64_t v1677;
  double v1678;
  CGFloat v1679;
  double v1680;
  CGFloat v1681;
  double v1682;
  CGFloat v1683;
  double v1684;
  CGFloat v1685;
  const char *v1686;
  uint64_t v1687;
  uint64_t v1688;
  uint64_t v1689;
  double v1690;
  double v1691;
  double v1692;
  double v1693;
  const char *v1694;
  uint64_t v1695;
  uint64_t v1696;
  uint64_t v1697;
  void *v1698;
  const char *v1699;
  uint64_t v1700;
  uint64_t v1701;
  uint64_t v1702;
  void *v1703;
  const char *v1704;
  uint64_t v1705;
  uint64_t v1706;
  uint64_t v1707;
  void *v1708;
  const char *v1709;
  uint64_t v1710;
  void *v1711;
  const char *v1712;
  uint64_t v1713;
  const char *v1714;
  uint64_t v1715;
  uint64_t v1716;
  uint64_t v1717;
  double v1718;
  CGFloat v1719;
  double v1720;
  CGFloat v1721;
  double v1722;
  CGFloat v1723;
  double v1724;
  CGFloat v1725;
  const char *v1726;
  uint64_t v1727;
  uint64_t v1728;
  uint64_t v1729;
  double v1730;
  double v1731;
  double v1732;
  double v1733;
  const char *v1734;
  uint64_t v1735;
  uint64_t v1736;
  uint64_t v1737;
  const char *v1738;
  uint64_t v1739;
  const char *v1740;
  uint64_t v1741;
  const char *v1742;
  uint64_t v1743;
  uint64_t v1744;
  double v1745;
  double v1746;
  const char *v1747;
  uint64_t v1748;
  uint64_t v1749;
  uint64_t v1750;
  double v1751;
  double v1752;
  double v1753;
  double v1754;
  const char *v1755;
  uint64_t v1756;
  void *v1757;
  const char *v1758;
  uint64_t v1759;
  const char *v1760;
  uint64_t v1761;
  uint64_t v1762;
  uint64_t v1763;
  const char *v1764;
  uint64_t v1765;
  uint64_t v1766;
  void *v1767;
  const char *v1768;
  uint64_t v1769;
  uint64_t v1770;
  uint64_t v1771;
  double v1772;
  double v1773;
  double v1774;
  double v1775;
  const char *v1776;
  uint64_t v1777;
  void *v1778;
  const char *v1779;
  uint64_t v1780;
  const char *v1781;
  uint64_t v1782;
  uint64_t v1783;
  const char *v1784;
  uint64_t v1785;
  uint64_t v1786;
  uint64_t v1787;
  double v1788;
  double v1789;
  double v1790;
  double v1791;
  double v1792;
  double v1793;
  double v1794;
  double v1795;
  const char *v1796;
  uint64_t v1797;
  void *v1798;
  const char *v1799;
  uint64_t v1800;
  uint64_t v1801;
  const char *v1802;
  uint64_t v1803;
  uint64_t v1804;
  const char *v1805;
  uint64_t v1806;
  uint64_t v1807;
  uint64_t v1808;
  double v1809;
  double v1810;
  double v1811;
  double v1812;
  const char *v1813;
  uint64_t v1814;
  uint64_t v1815;
  uint64_t v1816;
  void *v1817;
  const char *v1818;
  uint64_t v1819;
  void *v1820;
  const char *v1821;
  uint64_t v1822;
  const char *v1823;
  uint64_t v1824;
  uint64_t v1825;
  void *v1826;
  const char *v1827;
  uint64_t v1828;
  uint64_t v1829;
  uint64_t v1830;
  CGFloat v1831;
  CGFloat v1832;
  CGFloat v1833;
  CGFloat v1834;
  const char *v1835;
  uint64_t v1836;
  uint64_t v1837;
  uint64_t v1838;
  CGFloat v1839;
  CGFloat v1840;
  CGFloat v1841;
  CGFloat v1842;
  double v1843;
  double v1844;
  double v1845;
  double v1846;
  const char *v1847;
  uint64_t v1848;
  uint64_t v1849;
  uint64_t v1850;
  void *v1851;
  const char *v1852;
  uint64_t v1853;
  void *v1854;
  const char *v1855;
  uint64_t v1856;
  const char *v1857;
  uint64_t v1858;
  uint64_t v1859;
  const char *v1860;
  uint64_t v1861;
  uint64_t v1862;
  uint64_t v1863;
  void *v1864;
  const char *v1865;
  uint64_t v1866;
  uint64_t v1867;
  uint64_t v1868;
  void *v1869;
  const char *v1870;
  uint64_t v1871;
  uint64_t v1872;
  uint64_t v1873;
  CGFloat v1874;
  CGFloat v1875;
  CGFloat v1876;
  CGFloat v1877;
  const char *v1878;
  uint64_t v1879;
  uint64_t v1880;
  uint64_t v1881;
  CGFloat v1882;
  CGFloat v1883;
  CGFloat v1884;
  CGFloat v1885;
  double v1886;
  double v1887;
  double v1888;
  double v1889;
  const char *v1890;
  uint64_t v1891;
  void *v1892;
  const char *v1893;
  uint64_t v1894;
  const char *v1895;
  uint64_t v1896;
  uint64_t v1897;
  uint64_t v1898;
  uint64_t v1899;
  const char *v1900;
  uint64_t v1901;
  uint64_t v1902;
  uint64_t v1903;
  uint64_t v1904;
  const char *v1905;
  uint64_t v1906;
  uint64_t v1907;
  void *v1908;
  const char *v1909;
  uint64_t v1910;
  uint64_t v1911;
  uint64_t v1912;
  CGFloat v1913;
  CGFloat v1914;
  CGFloat v1915;
  CGFloat v1916;
  const char *v1917;
  uint64_t v1918;
  uint64_t v1919;
  uint64_t v1920;
  CGFloat v1921;
  CGFloat v1922;
  CGFloat v1923;
  CGFloat v1924;
  double v1925;
  double v1926;
  double v1927;
  double v1928;
  const char *v1929;
  uint64_t v1930;
  void *v1931;
  const char *v1932;
  uint64_t v1933;
  void *v1934;
  void *v1935;
  void *v1936;
  const char *v1937;
  uint64_t v1938;
  uint64_t v1939;
  uint64_t v1940;
  uint64_t v1941;
  void *v1942;
  const char *v1943;
  uint64_t v1944;
  uint64_t v1945;
  uint64_t v1946;
  uint64_t v1947;
  const char *v1948;
  uint64_t v1949;
  uint64_t v1950;
  const char *v1951;
  uint64_t v1952;
  uint64_t v1953;
  uint64_t v1954;
  CGFloat v1955;
  CGFloat v1956;
  CGFloat v1957;
  CGFloat v1958;
  const char *v1959;
  uint64_t v1960;
  uint64_t v1961;
  uint64_t v1962;
  CGFloat v1963;
  CGFloat v1964;
  CGFloat v1965;
  CGFloat v1966;
  double v1967;
  double v1968;
  double v1969;
  double v1970;
  const char *v1971;
  uint64_t v1972;
  void *v1973;
  const char *v1974;
  uint64_t v1975;
  const char *v1976;
  uint64_t v1977;
  uint64_t v1978;
  const char *v1979;
  uint64_t v1980;
  uint64_t v1981;
  uint64_t v1982;
  double v1983;
  CGFloat v1984;
  double v1985;
  CGFloat v1986;
  double v1987;
  CGFloat v1988;
  double v1989;
  CGFloat v1990;
  const char *v1991;
  uint64_t v1992;
  uint64_t v1993;
  uint64_t v1994;
  double v1995;
  double v1996;
  double v1997;
  double v1998;
  const char *v1999;
  uint64_t v2000;
  uint64_t v2001;
  uint64_t v2002;
  void *v2003;
  const char *v2004;
  uint64_t v2005;
  void *v2006;
  void *v2007;
  const char *v2008;
  uint64_t v2009;
  float v2010;
  float v2011;
  const char *v2012;
  uint64_t v2013;
  uint64_t v2014;
  uint64_t v2015;
  double v2016;
  double v2017;
  double v2018;
  double v2019;
  const char *v2020;
  uint64_t v2021;
  uint64_t v2022;
  uint64_t v2023;
  double v2024;
  CGFloat v2025;
  double v2026;
  CGFloat v2027;
  double v2028;
  CGFloat v2029;
  double v2030;
  CGFloat v2031;
  const char *v2032;
  uint64_t v2033;
  uint64_t v2034;
  uint64_t v2035;
  double v2036;
  CGFloat v2037;
  double v2038;
  CGFloat v2039;
  double v2040;
  CGFloat v2041;
  double v2042;
  CGFloat v2043;
  const char *v2044;
  uint64_t v2045;
  uint64_t v2046;
  uint64_t v2047;
  double v2048;
  double v2049;
  double v2050;
  double v2051;
  const char *v2052;
  uint64_t v2053;
  uint64_t v2054;
  uint64_t v2055;
  const char *v2056;
  uint64_t v2057;
  uint64_t v2058;
  uint64_t v2059;
  const char *v2060;
  uint64_t v2061;
  uint64_t v2062;
  uint64_t v2063;
  void *v2064;
  const char *v2065;
  uint64_t v2066;
  void *v2067;
  const char *v2068;
  uint64_t v2069;
  const char *v2070;
  uint64_t v2071;
  uint64_t v2072;
  double v2073;
  double v2074;
  const char *v2075;
  uint64_t v2076;
  uint64_t v2077;
  uint64_t v2078;
  double v2079;
  double v2080;
  double v2081;
  double v2082;
  const char *v2083;
  uint64_t v2084;
  void *v2085;
  const char *v2086;
  uint64_t v2087;
  const char *v2088;
  uint64_t v2089;
  uint64_t v2090;
  uint64_t v2091;
  const char *v2092;
  uint64_t v2093;
  uint64_t v2094;
  void *v2095;
  const char *v2096;
  uint64_t v2097;
  uint64_t v2098;
  uint64_t v2099;
  double v2100;
  double v2101;
  double v2102;
  double v2103;
  const char *v2104;
  uint64_t v2105;
  void *v2106;
  const char *v2107;
  uint64_t v2108;
  const char *v2109;
  uint64_t v2110;
  uint64_t v2111;
  const char *v2112;
  uint64_t v2113;
  uint64_t v2114;
  uint64_t v2115;
  double v2116;
  double v2117;
  double v2118;
  double v2119;
  double v2120;
  double v2121;
  double v2122;
  double v2123;
  const char *v2124;
  uint64_t v2125;
  void *v2126;
  const char *v2127;
  uint64_t v2128;
  uint64_t v2129;
  void *v2130;
  const char *v2131;
  uint64_t v2132;
  uint64_t v2133;
  const char *v2134;
  uint64_t v2135;
  uint64_t v2136;
  uint64_t v2137;
  double v2138;
  double v2139;
  double v2140;
  double v2141;
  const char *v2142;
  uint64_t v2143;
  uint64_t v2144;
  uint64_t v2145;
  void *v2146;
  const char *v2147;
  uint64_t v2148;
  void *v2149;
  const char *v2150;
  uint64_t v2151;
  const char *v2152;
  uint64_t v2153;
  uint64_t v2154;
  void *v2155;
  const char *v2156;
  uint64_t v2157;
  uint64_t v2158;
  uint64_t v2159;
  CGFloat v2160;
  CGFloat v2161;
  CGFloat v2162;
  CGFloat v2163;
  const char *v2164;
  uint64_t v2165;
  uint64_t v2166;
  uint64_t v2167;
  CGFloat v2168;
  CGFloat v2169;
  CGFloat v2170;
  CGFloat v2171;
  double v2172;
  double v2173;
  double v2174;
  double v2175;
  const char *v2176;
  uint64_t v2177;
  uint64_t v2178;
  uint64_t v2179;
  void *v2180;
  const char *v2181;
  uint64_t v2182;
  void *v2183;
  const char *v2184;
  uint64_t v2185;
  const char *v2186;
  uint64_t v2187;
  uint64_t v2188;
  const char *v2189;
  uint64_t v2190;
  uint64_t v2191;
  uint64_t v2192;
  void *v2193;
  const char *v2194;
  uint64_t v2195;
  uint64_t v2196;
  uint64_t v2197;
  void *v2198;
  const char *v2199;
  uint64_t v2200;
  uint64_t v2201;
  uint64_t v2202;
  CGFloat v2203;
  CGFloat v2204;
  CGFloat v2205;
  CGFloat v2206;
  const char *v2207;
  uint64_t v2208;
  uint64_t v2209;
  uint64_t v2210;
  CGFloat v2211;
  CGFloat v2212;
  CGFloat v2213;
  CGFloat v2214;
  double v2215;
  double v2216;
  double v2217;
  double v2218;
  const char *v2219;
  uint64_t v2220;
  void *v2221;
  const char *v2222;
  uint64_t v2223;
  const char *v2224;
  uint64_t v2225;
  uint64_t v2226;
  uint64_t v2227;
  const char *v2228;
  uint64_t v2229;
  uint64_t v2230;
  uint64_t v2231;
  uint64_t v2232;
  const char *v2233;
  uint64_t v2234;
  uint64_t v2235;
  void *v2236;
  void *v2237;
  const char *v2238;
  uint64_t v2239;
  uint64_t v2240;
  uint64_t v2241;
  CGFloat v2242;
  CGFloat v2243;
  CGFloat v2244;
  CGFloat v2245;
  const char *v2246;
  uint64_t v2247;
  uint64_t v2248;
  uint64_t v2249;
  CGFloat v2250;
  CGFloat v2251;
  CGFloat v2252;
  CGFloat v2253;
  double v2254;
  double v2255;
  double v2256;
  double v2257;
  const char *v2258;
  uint64_t v2259;
  void *v2260;
  void *v2261;
  const char *v2262;
  uint64_t v2263;
  uint64_t v2264;
  float v2265;
  void *v2266;
  const char *v2267;
  uint64_t v2268;
  uint64_t v2269;
  uint64_t v2270;
  uint64_t v2271;
  void *v2272;
  const char *v2273;
  uint64_t v2274;
  uint64_t v2275;
  uint64_t v2276;
  uint64_t v2277;
  uint64_t v2278;
  void *v2279;
  const char *v2280;
  uint64_t v2281;
  uint64_t v2282;
  const char *v2283;
  uint64_t v2284;
  uint64_t v2285;
  uint64_t v2286;
  CGFloat v2287;
  CGFloat v2288;
  CGFloat v2289;
  CGFloat v2290;
  const char *v2291;
  uint64_t v2292;
  uint64_t v2293;
  uint64_t v2294;
  CGFloat v2295;
  CGFloat v2296;
  CGFloat v2297;
  CGFloat v2298;
  double v2299;
  double v2300;
  double v2301;
  double v2302;
  const char *v2303;
  uint64_t v2304;
  void *v2305;
  const char *v2306;
  uint64_t v2307;
  void *v2308;
  const char *v2309;
  uint64_t v2310;
  uint64_t v2311;
  uint64_t v2312;
  uint64_t v2313;
  void *v2314;
  void *v2315;
  const char *v2316;
  uint64_t v2317;
  uint64_t v2318;
  uint64_t v2319;
  uint64_t v2320;
  const char *v2321;
  uint64_t v2322;
  uint64_t v2323;
  const char *v2324;
  uint64_t v2325;
  uint64_t v2326;
  uint64_t v2327;
  CGFloat v2328;
  CGFloat v2329;
  CGFloat v2330;
  CGFloat v2331;
  const char *v2332;
  uint64_t v2333;
  uint64_t v2334;
  uint64_t v2335;
  CGFloat v2336;
  CGFloat v2337;
  CGFloat v2338;
  CGFloat v2339;
  double v2340;
  double v2341;
  double v2342;
  double v2343;
  const char *v2344;
  uint64_t v2345;
  void *v2346;
  const char *v2347;
  uint64_t v2348;
  uint64_t v2349;
  const char *v2350;
  uint64_t v2351;
  uint64_t v2352;
  const char *v2353;
  uint64_t v2354;
  uint64_t v2355;
  uint64_t v2356;
  double v2357;
  CGFloat v2358;
  double v2359;
  CGFloat v2360;
  double v2361;
  CGFloat v2362;
  double v2363;
  CGFloat v2364;
  const char *v2365;
  uint64_t v2366;
  uint64_t v2367;
  uint64_t v2368;
  double v2369;
  double v2370;
  double v2371;
  double v2372;
  const char *v2373;
  uint64_t v2374;
  uint64_t v2375;
  uint64_t v2376;
  void *v2377;
  const char *v2378;
  uint64_t v2379;
  void *v2380;
  const char *v2381;
  uint64_t v2382;
  float v2383;
  float v2384;
  const char *v2385;
  uint64_t v2386;
  uint64_t v2387;
  uint64_t v2388;
  double v2389;
  double v2390;
  double v2391;
  double v2392;
  const char *v2393;
  uint64_t v2394;
  uint64_t v2395;
  uint64_t v2396;
  double v2397;
  CGFloat v2398;
  double v2399;
  CGFloat v2400;
  double v2401;
  CGFloat v2402;
  double v2403;
  CGFloat v2404;
  const char *v2405;
  uint64_t v2406;
  uint64_t v2407;
  uint64_t v2408;
  double v2409;
  CGFloat v2410;
  double v2411;
  CGFloat v2412;
  double v2413;
  CGFloat v2414;
  double v2415;
  CGFloat v2416;
  const char *v2417;
  uint64_t v2418;
  uint64_t v2419;
  uint64_t v2420;
  double v2421;
  double v2422;
  double v2423;
  double v2424;
  const char *v2425;
  uint64_t v2426;
  uint64_t v2427;
  uint64_t v2428;
  const char *v2429;
  uint64_t v2430;
  uint64_t v2431;
  uint64_t v2432;
  const char *v2433;
  uint64_t v2434;
  uint64_t v2435;
  uint64_t v2436;
  void *v2437;
  const char *v2438;
  uint64_t v2439;
  void *v2440;
  const char *v2441;
  uint64_t v2442;
  const char *v2443;
  uint64_t v2444;
  uint64_t v2445;
  float v2446;
  void *v2447;
  const char *v2448;
  uint64_t v2449;
  uint64_t v2450;
  uint64_t v2451;
  double v2452;
  double v2453;
  double v2454;
  double v2455;
  const char *v2456;
  uint64_t v2457;
  void *v2458;
  const char *v2459;
  uint64_t v2460;
  const char *v2461;
  uint64_t v2462;
  uint64_t v2463;
  uint64_t v2464;
  const char *v2465;
  uint64_t v2466;
  uint64_t v2467;
  uint64_t v2468;
  double v2469;
  double v2470;
  double v2471;
  double v2472;
  double v2473;
  double v2474;
  double v2475;
  double v2476;
  const char *v2477;
  uint64_t v2478;
  void *v2479;
  const char *v2480;
  uint64_t v2481;
  uint64_t v2482;
  const char *v2483;
  uint64_t v2484;
  uint64_t v2485;
  void *v2486;
  const char *v2487;
  uint64_t v2488;
  uint64_t v2489;
  uint64_t v2490;
  double v2491;
  double v2492;
  double v2493;
  double v2494;
  const char *v2495;
  uint64_t v2496;
  uint64_t v2497;
  uint64_t v2498;
  void *v2499;
  const char *v2500;
  uint64_t v2501;
  void *v2502;
  const char *v2503;
  uint64_t v2504;
  void *v2505;
  const char *v2506;
  uint64_t v2507;
  uint64_t v2508;
  void *v2509;
  const char *v2510;
  uint64_t v2511;
  uint64_t v2512;
  uint64_t v2513;
  CGFloat v2514;
  CGFloat v2515;
  CGFloat v2516;
  CGFloat v2517;
  const char *v2518;
  uint64_t v2519;
  uint64_t v2520;
  uint64_t v2521;
  CGFloat v2522;
  CGFloat v2523;
  CGFloat v2524;
  CGFloat v2525;
  double v2526;
  double v2527;
  CGFloat v2528;
  double v2529;
  const char *v2530;
  uint64_t v2531;
  uint64_t v2532;
  uint64_t v2533;
  void *v2534;
  const char *v2535;
  uint64_t v2536;
  void *v2537;
  const char *v2538;
  uint64_t v2539;
  const char *v2540;
  uint64_t v2541;
  uint64_t v2542;
  void *v2543;
  const char *v2544;
  uint64_t v2545;
  uint64_t v2546;
  uint64_t v2547;
  void *v2548;
  const char *v2549;
  uint64_t v2550;
  uint64_t v2551;
  uint64_t v2552;
  void *v2553;
  const char *v2554;
  uint64_t v2555;
  uint64_t v2556;
  uint64_t v2557;
  CGFloat v2558;
  CGFloat v2559;
  CGFloat v2560;
  CGFloat v2561;
  const char *v2562;
  uint64_t v2563;
  uint64_t v2564;
  uint64_t v2565;
  CGFloat v2566;
  CGFloat v2567;
  CGFloat v2568;
  CGFloat v2569;
  double v2570;
  double v2571;
  double v2572;
  double v2573;
  const char *v2574;
  uint64_t v2575;
  void *v2576;
  const char *v2577;
  uint64_t v2578;
  const char *v2579;
  uint64_t v2580;
  uint64_t v2581;
  uint64_t v2582;
  void *v2583;
  const char *v2584;
  uint64_t v2585;
  uint64_t v2586;
  uint64_t v2587;
  void *v2588;
  const char *v2589;
  uint64_t v2590;
  uint64_t v2591;
  void *v2592;
  const char *v2593;
  uint64_t v2594;
  uint64_t v2595;
  uint64_t v2596;
  CGFloat v2597;
  CGFloat v2598;
  CGFloat v2599;
  CGFloat v2600;
  const char *v2601;
  uint64_t v2602;
  uint64_t v2603;
  uint64_t v2604;
  CGFloat v2605;
  CGFloat v2606;
  CGFloat v2607;
  CGFloat v2608;
  double v2609;
  double v2610;
  double v2611;
  double v2612;
  const char *v2613;
  uint64_t v2614;
  void *v2615;
  const char *v2616;
  uint64_t v2617;
  void *v2618;
  const char *v2619;
  uint64_t v2620;
  uint64_t v2621;
  uint64_t v2622;
  void *v2623;
  const char *v2624;
  uint64_t v2625;
  uint64_t v2626;
  uint64_t v2627;
  void *v2628;
  const char *v2629;
  uint64_t v2630;
  uint64_t v2631;
  void *v2632;
  const char *v2633;
  uint64_t v2634;
  uint64_t v2635;
  uint64_t v2636;
  CGFloat v2637;
  CGFloat v2638;
  CGFloat v2639;
  CGFloat v2640;
  const char *v2641;
  uint64_t v2642;
  uint64_t v2643;
  uint64_t v2644;
  CGFloat v2645;
  CGFloat v2646;
  CGFloat v2647;
  CGFloat v2648;
  double v2649;
  double v2650;
  double v2651;
  double v2652;
  const char *v2653;
  uint64_t v2654;
  void *v2655;
  const char *v2656;
  uint64_t v2657;
  const char *v2658;
  uint64_t v2659;
  uint64_t v2660;
  uint64_t v2661;
  uint64_t v2662;
  const char *v2663;
  uint64_t v2664;
  uint64_t v2665;
  uint64_t v2666;
  uint64_t v2667;
  const char *v2668;
  uint64_t v2669;
  uint64_t v2670;
  void *v2671;
  const char *v2672;
  uint64_t v2673;
  uint64_t v2674;
  uint64_t v2675;
  CGFloat v2676;
  CGFloat v2677;
  CGFloat v2678;
  CGFloat v2679;
  const char *v2680;
  uint64_t v2681;
  uint64_t v2682;
  uint64_t v2683;
  CGFloat v2684;
  CGFloat v2685;
  CGFloat v2686;
  CGFloat v2687;
  double v2688;
  double v2689;
  double v2690;
  double v2691;
  const char *v2692;
  uint64_t v2693;
  void *v2694;
  const char *v2695;
  uint64_t v2696;
  void *v2697;
  const char *v2698;
  uint64_t v2699;
  uint64_t v2700;
  double v2701;
  void *v2702;
  const char *v2703;
  uint64_t v2704;
  uint64_t v2705;
  uint64_t v2706;
  double v2707;
  double v2708;
  double v2709;
  double v2710;
  const char *v2711;
  uint64_t v2712;
  void *v2713;
  const char *v2714;
  uint64_t v2715;
  void *v2716;
  void *v2717;
  const char *v2718;
  uint64_t v2719;
  uint64_t v2720;
  uint64_t v2721;
  double v2722;
  double v2723;
  double v2724;
  double v2725;
  const char *v2726;
  uint64_t v2727;
  void *v2728;
  const char *v2729;
  uint64_t v2730;
  void *v2731;
  const char *v2732;
  uint64_t v2733;
  uint64_t v2734;
  uint64_t v2735;
  CGFloat v2736;
  CGFloat v2737;
  CGFloat v2738;
  CGFloat v2739;
  const char *v2740;
  uint64_t v2741;
  uint64_t v2742;
  uint64_t v2743;
  CGFloat v2744;
  CGFloat v2745;
  CGFloat v2746;
  CGFloat v2747;
  double v2748;
  double v2749;
  double v2750;
  double v2751;
  const char *v2752;
  uint64_t v2753;
  void *v2754;
  const char *v2755;
  uint64_t v2756;
  const char *v2757;
  uint64_t v2758;
  uint64_t v2759;
  void *v2760;
  const char *v2761;
  uint64_t v2762;
  uint64_t v2763;
  uint64_t v2764;
  double v2765;
  CGFloat v2766;
  double v2767;
  CGFloat v2768;
  double v2769;
  CGFloat v2770;
  double v2771;
  CGFloat v2772;
  const char *v2773;
  uint64_t v2774;
  uint64_t v2775;
  uint64_t v2776;
  double v2777;
  CGFloat v2778;
  double v2779;
  CGFloat v2780;
  double v2781;
  CGFloat v2782;
  double v2783;
  CGFloat v2784;
  const char *v2785;
  uint64_t v2786;
  uint64_t v2787;
  uint64_t v2788;
  double v2789;
  double v2790;
  double v2791;
  double v2792;
  const char *v2793;
  uint64_t v2794;
  uint64_t v2795;
  uint64_t v2796;
  void *v2797;
  const char *v2798;
  uint64_t v2799;
  uint64_t v2800;
  uint64_t v2801;
  void *v2802;
  const char *v2803;
  uint64_t v2804;
  uint64_t v2805;
  uint64_t v2806;
  void *v2807;
  const char *v2808;
  uint64_t v2809;
  void *v2810;
  const char *v2811;
  uint64_t v2812;
  void *v2813;
  const char *v2814;
  uint64_t v2815;
  uint64_t v2816;
  uint64_t v2817;
  double v2818;
  double v2819;
  double v2820;
  double v2821;
  const char *v2822;
  uint64_t v2823;
  uint64_t v2824;
  uint64_t v2825;
  double v2826;
  CGFloat v2827;
  double v2828;
  CGFloat v2829;
  double v2830;
  CGFloat v2831;
  double v2832;
  CGFloat v2833;
  const char *v2834;
  uint64_t v2835;
  uint64_t v2836;
  uint64_t v2837;
  double v2838;
  CGFloat v2839;
  double v2840;
  CGFloat v2841;
  double v2842;
  CGFloat v2843;
  double v2844;
  CGFloat v2845;
  const char *v2846;
  uint64_t v2847;
  uint64_t v2848;
  uint64_t v2849;
  double v2850;
  double v2851;
  double v2852;
  double v2853;
  const char *v2854;
  uint64_t v2855;
  uint64_t v2856;
  uint64_t v2857;
  const char *v2858;
  uint64_t v2859;
  uint64_t v2860;
  uint64_t v2861;
  const char *v2862;
  uint64_t v2863;
  uint64_t v2864;
  uint64_t v2865;
  const char *v2866;
  uint64_t v2867;
  const char *v2868;
  uint64_t v2869;
  void *v2870;
  id v2871;
  const char *v2872;
  uint64_t v2873;
  uint64_t v2874;
  void *v2875;
  const char *v2876;
  uint64_t v2877;
  uint64_t v2878;
  uint64_t v2879;
  double v2880;
  CGFloat v2881;
  double v2882;
  CGFloat v2883;
  double v2884;
  CGFloat v2885;
  double v2886;
  CGFloat v2887;
  const char *v2888;
  uint64_t v2889;
  uint64_t v2890;
  uint64_t v2891;
  CGFloat v2892;
  CGFloat v2893;
  CGFloat v2894;
  CGFloat v2895;
  double v2896;
  double v2897;
  double v2898;
  double v2899;
  const char *v2900;
  uint64_t v2901;
  uint64_t v2902;
  uint64_t v2903;
  void *v2904;
  const char *v2905;
  uint64_t v2906;
  void *v2907;
  const char *v2908;
  uint64_t v2909;
  const char *v2910;
  uint64_t v2911;
  uint64_t v2912;
  const char *v2913;
  uint64_t v2914;
  uint64_t v2915;
  uint64_t v2916;
  double v2917;
  CGFloat v2918;
  double v2919;
  CGFloat v2920;
  double v2921;
  CGFloat v2922;
  double v2923;
  CGFloat v2924;
  const char *v2925;
  uint64_t v2926;
  uint64_t v2927;
  uint64_t v2928;
  CGFloat v2929;
  CGFloat v2930;
  CGFloat v2931;
  CGFloat v2932;
  CGFloat v2933;
  CGFloat v2934;
  CGFloat v2935;
  CGFloat v2936;
  const char *v2937;
  uint64_t v2938;
  uint64_t v2939;
  uint64_t v2940;
  CGFloat v2941;
  CGFloat v2942;
  CGFloat v2943;
  CGFloat v2944;
  double v2945;
  double v2946;
  double v2947;
  double v2948;
  const char *v2949;
  uint64_t v2950;
  void *v2951;
  const char *v2952;
  uint64_t v2953;
  void *v2954;
  const char *v2955;
  uint64_t v2956;
  uint64_t v2957;
  float v2959;
  float v2960;
  float v2961;
  float v2962;
  float v2963;
  float v2964;
  float v2965;
  float v2966;
  float v2967;
  float v2968;
  float v2969;
  float v2970;
  double v2971;
  double v2972;
  double v2973;
  double v2974;
  float v2975;
  float v2976;
  float v2977;
  float v2978;
  float v2979;
  float v2980;
  float v2981;
  float v2982;
  double v2983;
  float v2984;
  double v2985;
  float v2986;
  float v2987;
  float v2988;
  float v2989;
  float v2990;
  float v2991;
  NSDictionary *v2992;
  void *v2993;
  float v2994;
  float v2995;
  float v2996;
  float v2997;
  float v2998;
  float v2999;
  float v3000;
  float v3001;
  float v3002;
  float v3003;
  float v3004;
  double v3005;
  float v3006;
  double v3007;
  float v3008;
  float v3009;
  void *v3010;
  float v3011;
  float v3012;
  float v3013;
  float v3014;
  void *v3015;
  void *v3016;
  float v3017;
  float v3018;
  float v3019;
  float v3020;
  float v3021;
  float v3022;
  float v3023;
  float v3024;
  float v3025;
  float v3026;
  void *v3027;
  void *v3028;
  void *v3029;
  void *v3030;
  float v3031;
  void *v3032;
  float v3033;
  void *v3034;
  void *v3035;
  float v3036;
  void *v3037;
  float v3038;
  double v3039;
  void *v3040;
  float v3041;
  void *v3042;
  float v3043;
  float v3044;
  void *v3045;
  float v3046;
  void *v3047;
  void *v3048;
  void *v3049;
  void *v3050;
  void *v3051;
  void *v3052;
  float v3053;
  void *v3054;
  float v3055;
  void *v3056;
  void *v3057;
  void *v3058;
  float v3059;
  void *v3060;
  float v3061;
  id v3062;
  double v3063;
  id v3064;
  void *v3065;
  void *v3066;
  float v3067;
  void *v3068;
  void *v3069;
  void *v3070;
  void *v3071;
  void *v3072;
  void *v3073;
  void *v3074;
  float v3075;
  void *v3076;
  float v3077;
  float v3078;
  void *v3079;
  void *v3080;
  void *v3081;
  void *v3082;
  void *v3083;
  void *v3084;
  void *v3085;
  void *v3086;
  void *v3087;
  void *v3088;
  void *v3089;
  void *v3090;
  void *v3091;
  void *v3092;
  void *v3093;
  void *v3094;
  void *v3095;
  void *v3096;
  void *v3097;
  CGFloat v3098;
  void *v3099;
  float v3100;
  void *v3101;
  float v3102;
  void *v3103;
  float v3104;
  float v3105;
  void *v3106;
  float v3107;
  void *v3108;
  float v3109;
  id v3110;
  float v3111;
  void *v3112;
  float v3113;
  void *v3114;
  float v3115;
  void *v3116;
  float v3117;
  void *v3118;
  float v3119;
  void *v3120;
  float v3121;
  float v3122;
  void *v3123;
  float v3124;
  double v3125;
  void *v3126;
  float v3127;
  void *v3128;
  float v3129;
  id v3130;
  void *v3131;
  float v3132;
  void *v3133;
  float v3134;
  void *v3135;
  float v3136;
  void *v3137;
  float v3138;
  void *v3139;
  CGFloat v3140;
  float v3141;
  void *v3142;
  float v3143;
  void *v3144;
  float v3145;
  void *v3146;
  float v3147;
  void *v3148;
  CGFloat v3149;
  double v3150;
  CGFloat v3151;
  float v3152;
  void *v3153;
  float r1;
  CGFloat r1a;
  CGFloat r1b;
  CGFloat r1c;
  double r1d;
  CGFloat r1e;
  float v3160;
  CGFloat v3161;
  CGFloat v3162;
  CGFloat v3163;
  float v3164;
  float v3165;
  CGFloat v3166;
  CGFloat v3167;
  CGFloat v3168;
  float v3169;
  float v3170;
  CGFloat v3171;
  CGFloat v3172;
  float v3173;
  float v3174;
  float v3175;
  id v3176;
  float v3177;
  float v3178;
  void *v3179;
  void *v3180;
  id v3181;
  RAWReduceNoise *v3182;
  void *v3183;
  void *v3184;
  void *v3185;
  void *v3186;
  void *v3187;
  void *v3188;
  void *v3189;
  void *v3190;
  void *v3191;
  void *v3192;
  void *v3193;
  void *v3194;
  void *v3195;
  void *v3196;
  void *v3197;
  void *v3198;
  void *v3199;
  void *v3200;
  void *v3201;
  void *v3202;
  void *v3203;
  void *v3204;
  void *v3205;
  void *v3206;
  CGAffineTransform v3207;
  CGAffineTransform v3208;
  CGAffineTransform v3209;
  CGAffineTransform v3210;
  CGAffineTransform v3211;
  CGAffineTransform v3212;
  CGAffineTransform v3213;
  CGAffineTransform v3214;
  CGAffineTransform v3215;
  CGAffineTransform v3216;
  CGAffineTransform v3217;
  CGAffineTransform v3218;
  CGAffineTransform v3219;
  CGAffineTransform v3220;
  CGAffineTransform v3221;
  CGAffineTransform v3222;
  CGAffineTransform v3223;
  CGAffineTransform v3224;
  CGAffineTransform v3225;
  CGAffineTransform v3226;
  CGAffineTransform v3227;
  CGAffineTransform v3228;
  _QWORD v3229[5];
  _QWORD v3230[4];
  _QWORD v3231[6];
  _QWORD v3232[3];
  void *v3233;
  _QWORD v3234[7];
  void *v3235;
  _QWORD v3236[4];
  _QWORD v3237[4];
  _QWORD v3238[4];
  _QWORD v3239[4];
  _QWORD v3240[4];
  _QWORD v3241[3];
  void *v3242;
  id v3243;
  _QWORD v3244[3];
  _QWORD v3245[7];
  _QWORD v3246[4];
  _QWORD v3247[4];
  _QWORD v3248[4];
  _QWORD v3249[4];
  _QWORD v3250[4];
  _QWORD v3251[3];
  void *v3252;
  void *v3253;
  void *v3254;
  _QWORD v3255[3];
  _QWORD v3256[7];
  _QWORD v3257[4];
  _QWORD v3258[4];
  _QWORD v3259[4];
  _QWORD v3260[4];
  _QWORD v3261[3];
  void *v3262;
  void *v3263;
  void *v3264;
  _QWORD v3265[3];
  _QWORD v3266[7];
  _QWORD v3267[4];
  _QWORD v3268[3];
  void *v3269;
  void *v3270;
  void *v3271;
  _QWORD v3272[2];
  void *v3273;
  _QWORD v3274[2];
  void *v3275;
  _QWORD v3276[2];
  void *v3277;
  _QWORD v3278[2];
  id v3279;
  _QWORD v3280[4];
  _QWORD v3281[2];
  _QWORD v3282[5];
  CGRect v3283;
  CGRect v3284;
  CGRect v3285;
  CGRect v3286;
  CGRect v3287;
  CGRect v3288;
  CGRect v3289;
  CGRect v3290;
  CGRect v3291;
  CGRect v3292;
  CGRect v3293;
  CGRect v3294;
  CGRect v3295;
  CGRect v3296;
  CGRect v3297;
  CGRect v3298;
  CGRect v3299;
  CGRect v3300;
  CGRect v3301;
  CGRect v3302;
  CGRect v3303;
  CGRect v3304;
  CGRect v3305;
  CGRect v3306;
  CGRect v3307;
  CGRect v3308;
  CGRect v3309;
  CGRect v3310;
  CGRect v3311;
  CGRect v3312;
  CGRect v3313;
  CGRect v3314;
  CGRect v3315;
  CGRect v3316;
  CGRect v3317;
  CGRect v3318;
  CGRect v3319;
  CGRect v3320;
  CGRect v3321;
  CGRect v3322;
  CGRect v3323;
  CGRect v3324;
  CGRect v3325;
  CGRect v3326;
  CGRect v3327;
  CGRect v3328;
  CGRect v3329;
  CGRect v3330;
  CGRect v3331;
  CGRect v3332;
  CGRect v3333;
  CGRect v3334;
  CGRect v3335;
  CGRect v3336;
  CGRect v3337;
  CGRect v3338;
  CGRect v3339;
  CGRect v3340;
  CGRect v3341;
  CGRect v3342;
  CGRect v3343;
  CGRect v3344;
  CGRect v3345;
  CGRect v3346;
  CGRect v3347;
  CGRect v3348;
  CGRect v3349;
  CGRect v3350;
  CGRect v3351;
  CGRect v3352;
  CGRect v3353;
  CGRect v3354;
  CGRect v3355;
  CGRect v3356;
  CGRect v3357;
  CGRect v3358;
  CGRect v3359;
  CGRect v3360;
  CGRect v3361;
  CGRect v3362;
  CGRect v3363;
  CGRect v3364;
  CGRect v3365;
  CGRect v3366;
  CGRect v3367;
  CGRect v3368;
  CGRect v3369;
  CGRect v3370;
  CGRect v3371;
  CGRect v3372;
  CGRect v3373;
  CGRect v3374;
  CGRect v3375;
  CGRect v3376;
  CGRect v3377;
  CGRect v3378;
  CGRect v3379;
  CGRect v3380;
  CGRect v3381;
  CGRect v3382;
  CGRect v3383;
  CGRect v3384;
  CGRect v3385;
  CGRect v3386;
  CGRect v3387;
  CGRect v3388;
  CGRect v3389;
  CGRect v3390;
  CGRect v3391;
  CGRect v3392;
  CGRect v3393;
  CGRect v3394;
  CGRect v3395;
  CGRect v3396;
  CGRect v3397;
  CGRect v3398;
  CGRect v3399;
  CGRect v3400;
  CGRect v3401;
  CGRect v3402;
  CGRect v3403;
  CGRect v3404;
  CGRect v3405;
  CGRect v3406;
  CGRect v3407;
  CGRect v3408;
  CGRect v3409;
  CGRect v3410;
  CGRect v3411;
  CGRect v3412;
  CGRect v3413;
  CGRect v3414;
  CGRect v3415;
  CGRect v3416;
  CGRect v3417;
  CGRect v3418;
  CGRect v3419;
  CGRect v3420;
  CGRect v3421;
  CGRect v3422;
  CGRect v3423;
  CGRect v3424;
  CGRect v3425;
  CGRect v3426;
  CGRect v3427;
  CGRect v3428;
  CGRect v3429;
  CGRect v3430;
  CGRect v3431;
  CGRect v3432;
  CGRect v3433;
  CGRect v3434;
  CGRect v3435;
  CGRect v3436;
  CGRect v3437;
  CGRect v3438;
  CGRect v3439;
  CGRect v3440;
  CGRect v3441;
  CGRect v3442;
  CGRect v3443;
  CGRect v3444;
  CGRect v3445;
  CGRect v3446;
  CGRect v3447;
  CGRect v3448;
  CGRect v3449;
  CGRect v3450;
  CGRect v3451;
  CGRect v3452;
  CGRect v3453;
  CGRect v3454;
  CGRect v3455;
  CGRect v3456;
  CGRect v3457;
  CGRect v3458;
  CGRect v3459;
  CGRect v3460;
  CGRect v3461;
  CGRect v3462;
  CGRect v3463;
  CGRect v3464;
  CGRect v3465;
  CGRect v3466;
  CGRect v3467;
  CGRect v3468;
  CGRect v3469;
  CGRect v3470;
  CGRect v3471;
  CGRect v3472;
  CGRect v3473;
  CGRect v3474;
  CGRect v3475;
  CGRect v3476;
  CGRect v3477;
  CGRect v3478;
  CGRect v3479;
  CGRect v3480;
  CGRect v3481;
  CGRect v3482;
  CGRect v3483;
  CGRect v3484;
  CGRect v3485;
  CGRect v3486;
  CGRect v3487;

  v3282[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_floatValue(self->inputBaselineExposure, a2, v2, v3, v4);
  v3059 = exp2f(v6);
  v3182 = self;
  v2992 = self->inputTrimParameters;
  objc_msgSend_objectForKeyedSubscript_(v2992, v7, (uint64_t)CFSTR("noise"), v8, v9);
  v2993 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v2993, v10, 0, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v13, v14, v15, v16, v17);
  v19 = v18;

  objc_msgSend_objectAtIndexedSubscript_(v2993, v20, 1, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v23, v24, v25, v26, v27);
  v3170 = v28;

  objc_msgSend_objectForKeyedSubscript_(v2992, v29, (uint64_t)CFSTR("smoothing"), v30, v31);
  v3027 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v3027, v32, 0, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v35, v36, v37, v38, v39);
  v3023 = v40;

  objc_msgSend_objectAtIndexedSubscript_(v3027, v41, 1, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v44, v45, v46, v47, v48);
  v3041 = v49;

  objc_msgSend_objectForKeyedSubscript_(v2992, v50, (uint64_t)CFSTR("contrast"), v51, v52);
  v3028 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v3028, v53, 0, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v56, v57, v58, v59, v60);
  v62 = v61;

  objc_msgSend_objectAtIndexedSubscript_(v3028, v63, 1, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v66, v67, v68, v69, v70);
  v72 = v71;

  objc_msgSend_objectForKeyedSubscript_(v2992, v73, (uint64_t)CFSTR("outmaskDetailAmount"), v74, v75);
  v3029 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v3029, v76, 0, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v79, v80, v81, v82, v83);
  v85 = v84;

  objc_msgSend_objectAtIndexedSubscript_(v3029, v86, 1, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v89, v90, v91, v92, v93);
  v95 = v94;

  objc_msgSend_objectForKeyedSubscript_(v2992, v96, (uint64_t)CFSTR("outmaskDetailAttenuation"), v97, v98);
  v3030 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v3030, v99, 0, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v102, v103, v104, v105, v106);
  v3025 = v107;

  objc_msgSend_objectAtIndexedSubscript_(v3030, v108, 1, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v111, v112, v113, v114, v115);
  v3036 = v116;

  v121 = objc_msgSend_intValue(v3182->inputISO, v117, v118, v119, v120);
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v122, (uint64_t)CFSTR("ISOList"), v123, v124);
  v3035 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = objc_msgSend_count(v3035, v125, v126, v127, v128);
  v3104 = v62;
  v3100 = v85;
  v3102 = v72;
  if (v132)
  {
    v133 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v3035, v129, v133, v130, v131);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_msgSend_intValue(v134, v135, v136, v137, v138);

      v140 = v121 != v139;
      if (v121 == v139)
      {
        v141 = 0.0;
        goto LABEL_10;
      }
      if (v121 < v139)
        break;
      if (v132 == ++v133)
        goto LABEL_6;
    }
    if (!v133)
    {
      v140 = 0;
      v141 = 0.0;
      goto LABEL_12;
    }
    objc_msgSend_objectAtIndexedSubscript_(v3035, v129, --v133, v130, v131);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend_intValue(v142, v143, v144, v145, v146);

    v141 = (float)(v121 - v147) / (float)(v139 - v147);
LABEL_10:
    if (v133 != 100000)
      goto LABEL_12;
  }
  else
  {
LABEL_6:
    v140 = 0;
    v141 = 0.0;
  }
  v133 = v132 - 1;
LABEL_12:
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v129, (uint64_t)CFSTR("FYMa"), v130, v131);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v148, v149, v133, v150, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v152, v153, v154, v155, v156);
  v3175 = v157;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v148, v158, v133 + 1, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v161, v162, v163, v164, v165);
    v167 = v166;

    v3175 = v3175 + (float)((float)(v167 - v3175) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v158, (uint64_t)CFSTR("FYMb"), v159, v160);
  v3183 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3183, v168, v133, v169, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v171, v172, v173, v174, v175);
  v3165 = v176;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3183, v177, v133 + 1, v178, v179);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v180, v181, v182, v183, v184);
    v186 = v185;

    v3165 = v3165 + (float)((float)(v186 - v3165) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v177, (uint64_t)CFSTR("FYMc"), v178, v179);
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v187, v188, v133, v189, v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v191, v192, v193, v194, v195);
  v3160 = v196;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v187, v197, v133 + 1, v198, v199);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v200, v201, v202, v203, v204);
    v206 = v205;

    v3160 = v3160 + (float)((float)(v206 - v3160) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v197, (uint64_t)CFSTR("FYSDa"), v198, v199);
  v3184 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3184, v207, v133, v208, v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v210, v211, v212, v213, v214);
  r1 = v215;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3184, v216, v133 + 1, v217, v218);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v219, v220, v221, v222, v223);
    v225 = v224;

    r1 = r1 + (float)((float)(v225 - r1) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v216, (uint64_t)CFSTR("FYSDb"), v217, v218);
  v226 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v226, v227, v133, v228, v229);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v230, v231, v232, v233, v234);
  v3152 = v235;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v226, v236, v133 + 1, v237, v238);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v239, v240, v241, v242, v243);
    v245 = v244;

    v3152 = v3152 + (float)((float)(v245 - v3152) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v236, (uint64_t)CFSTR("FYSDc"), v237, v238);
  v3185 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3185, v246, v133, v247, v248);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v249, v250, v251, v252, v253);
  v3147 = v254;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3185, v255, v133 + 1, v256, v257);
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v258, v259, v260, v261, v262);
    v264 = v263;

    v3147 = v3147 + (float)((float)(v264 - v3147) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v255, (uint64_t)CFSTR("HYMa"), v256, v257);
  v265 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v265, v266, v133, v267, v268);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v269, v270, v271, v272, v273);
  v3145 = v274;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v265, v275, v133 + 1, v276, v277);
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v278, v279, v280, v281, v282);
    v284 = v283;

    v3145 = v3145 + (float)((float)(v284 - v3145) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v275, (uint64_t)CFSTR("HYMb"), v276, v277);
  v3186 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3186, v285, v133, v286, v287);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v288, v289, v290, v291, v292);
  v3143 = v293;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3186, v294, v133 + 1, v295, v296);
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v297, v298, v299, v300, v301);
    v303 = v302;

    v3143 = v3143 + (float)((float)(v303 - v3143) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v294, (uint64_t)CFSTR("HYMc"), v295, v296);
  v304 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v304, v305, v133, v306, v307);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v308, v309, v310, v311, v312);
  v3141 = v313;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v304, v314, v133 + 1, v315, v316);
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v317, v318, v319, v320, v321);
    v323 = v322;

    v3141 = v3141 + (float)((float)(v323 - v3141) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v314, (uint64_t)CFSTR("HYSDa"), v315, v316);
  v3187 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3187, v324, v133, v325, v326);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v327, v328, v329, v330, v331);
  v3138 = v332;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3187, v333, v133 + 1, v334, v335);
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v336, v337, v338, v339, v340);
    v342 = v341;

    v3138 = v3138 + (float)((float)(v342 - v3138) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v333, (uint64_t)CFSTR("HYSDb"), v334, v335);
  v343 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v343, v344, v133, v345, v346);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v347, v348, v349, v350, v351);
  v3136 = v352;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v343, v353, v133 + 1, v354, v355);
    v356 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v356, v357, v358, v359, v360);
    v362 = v361;

    v3136 = v3136 + (float)((float)(v362 - v3136) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v353, (uint64_t)CFSTR("HYSDc"), v354, v355);
  v3188 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3188, v363, v133, v364, v365);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v366, v367, v368, v369, v370);
  v3134 = v371;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3188, v372, v133 + 1, v373, v374);
    v375 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v375, v376, v377, v378, v379);
    v381 = v380;

    v3134 = v3134 + (float)((float)(v381 - v3134) * v141);
  }
  v382 = logf(v19);
  v383 = logf(v3170);
  v3077 = expf((float)(v383 * 0.33333) + (float)(v382 * 0.66667));
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v384, (uint64_t)CFSTR("QYMa"), v385, v386);
  v387 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v387, v388, v133, v389, v390);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v391, v392, v393, v394, v395);
  v3132 = v396;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v387, v397, v133 + 1, v398, v399);
    v400 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v400, v401, v402, v403, v404);
    v406 = v405;

    v3132 = v3132 + (float)((float)(v406 - v3132) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v397, (uint64_t)CFSTR("QYMb"), v398, v399);
  v3189 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3189, v407, v133, v408, v409);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v410, v411, v412, v413, v414);
  v3129 = v415;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3189, v416, v133 + 1, v417, v418);
    v419 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v419, v420, v421, v422, v423);
    v425 = v424;

    v3129 = v3129 + (float)((float)(v425 - v3129) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v416, (uint64_t)CFSTR("QYMc"), v417, v418);
  v426 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v426, v427, v133, v428, v429);
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v430, v431, v432, v433, v434);
  v3127 = v435;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v426, v436, v133 + 1, v437, v438);
    v439 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v439, v440, v441, v442, v443);
    v445 = v444;

    v3127 = v3127 + (float)((float)(v445 - v3127) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v436, (uint64_t)CFSTR("QYSDa"), v437, v438);
  v3190 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3190, v446, v133, v447, v448);
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v449, v450, v451, v452, v453);
  v3124 = v454;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3190, v455, v133 + 1, v456, v457);
    v458 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v458, v459, v460, v461, v462);
    v464 = v463;

    v3124 = v3124 + (float)((float)(v464 - v3124) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v455, (uint64_t)CFSTR("QYSDb"), v456, v457);
  v465 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v465, v466, v133, v467, v468);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v469, v470, v471, v472, v473);
  v3121 = v474;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v465, v475, v133 + 1, v476, v477);
    v478 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v478, v479, v480, v481, v482);
    v484 = v483;

    v3121 = v3121 + (float)((float)(v484 - v3121) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v475, (uint64_t)CFSTR("QYSDc"), v476, v477);
  v3191 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3191, v485, v133, v486, v487);
  v488 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v488, v489, v490, v491, v492);
  v3119 = v493;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3191, v494, v133 + 1, v495, v496);
    v497 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v497, v498, v499, v500, v501);
    v503 = v502;

    v3119 = v3119 + (float)((float)(v503 - v3119) * v141);
  }
  v3075 = expf((float)(v383 * 0.66667) + (float)(v382 * 0.33333));
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v504, (uint64_t)CFSTR("EYMa"), v505, v506);
  v507 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v507, v508, v133, v509, v510);
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v511, v512, v513, v514, v515);
  v3117 = v516;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v507, v517, v133 + 1, v518, v519);
    v520 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v520, v521, v522, v523, v524);
    v526 = v525;

    v3117 = v3117 + (float)((float)(v526 - v3117) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v517, (uint64_t)CFSTR("EYMb"), v518, v519);
  v3192 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3192, v527, v133, v528, v529);
  v530 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v530, v531, v532, v533, v534);
  v3115 = v535;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3192, v536, v133 + 1, v537, v538);
    v539 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v539, v540, v541, v542, v543);
    v545 = v544;

    v3115 = v3115 + (float)((float)(v545 - v3115) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v536, (uint64_t)CFSTR("EYMc"), v537, v538);
  v546 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v546, v547, v133, v548, v549);
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v550, v551, v552, v553, v554);
  v3113 = v555;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v546, v556, v133 + 1, v557, v558);
    v559 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v559, v560, v561, v562, v563);
    v565 = v564;

    v3113 = v3113 + (float)((float)(v565 - v3113) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v556, (uint64_t)CFSTR("EYSDa"), v557, v558);
  v3193 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3193, v566, v133, v567, v568);
  v569 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v569, v570, v571, v572, v573);
  v3111 = v574;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3193, v575, v133 + 1, v576, v577);
    v578 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v578, v579, v580, v581, v582);
    v584 = v583;

    v3111 = v3111 + (float)((float)(v584 - v3111) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v575, (uint64_t)CFSTR("EYSDb"), v576, v577);
  v585 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v585, v586, v133, v587, v588);
  v589 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v589, v590, v591, v592, v593);
  v3109 = v594;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v585, v595, v133 + 1, v596, v597);
    v598 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v598, v599, v600, v601, v602);
    v604 = v603;

    v3109 = v3109 + (float)((float)(v604 - v3109) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v595, (uint64_t)CFSTR("EYSDc"), v596, v597);
  v3194 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3194, v605, v133, v606, v607);
  v608 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v608, v609, v610, v611, v612);
  v3107 = v613;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3194, v614, v133 + 1, v615, v616);
    v617 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v617, v618, v619, v620, v621);
    v623 = v622;

    v3107 = v3107 + (float)((float)(v623 - v3107) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v614, (uint64_t)CFSTR("FullCMa"), v615, v616);
  v624 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v624, v625, v133, v626, v627);
  v628 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v628, v629, v630, v631, v632);
  v3022 = v633;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v624, v634, v133 + 1, v635, v636);
    v637 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v637, v638, v639, v640, v641);
    v643 = v642;

    v3022 = v3022 + (float)((float)(v643 - v3022) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v634, (uint64_t)CFSTR("FullCMb"), v635, v636);
  v3195 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3195, v644, v133, v645, v646);
  v647 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v647, v648, v649, v650, v651);
  v3021 = v652;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3195, v653, v133 + 1, v654, v655);
    v656 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v656, v657, v658, v659, v660);
    v662 = v661;

    v3021 = v3021 + (float)((float)(v662 - v3021) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v653, (uint64_t)CFSTR("FullCMc"), v654, v655);
  v663 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v663, v664, v133, v665, v666);
  v667 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v667, v668, v669, v670, v671);
  v3020 = v672;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v663, v673, v133 + 1, v674, v675);
    v676 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v676, v677, v678, v679, v680);
    v682 = v681;

    v3020 = v3020 + (float)((float)(v682 - v3020) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v673, (uint64_t)CFSTR("FullCSDa"), v674, v675);
  v3196 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3196, v683, v133, v684, v685);
  v686 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v686, v687, v688, v689, v690);
  v3019 = v691;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3196, v692, v133 + 1, v693, v694);
    v695 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v695, v696, v697, v698, v699);
    v701 = v700;

    v3019 = v3019 + (float)((float)(v701 - v3019) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v692, (uint64_t)CFSTR("FullCSDb"), v693, v694);
  v702 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v702, v703, v133, v704, v705);
  v706 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v706, v707, v708, v709, v710);
  v3018 = v711;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v702, v712, v133 + 1, v713, v714);
    v715 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v715, v716, v717, v718, v719);
    v721 = v720;

    v3018 = v3018 + (float)((float)(v721 - v3018) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v712, (uint64_t)CFSTR("FullCSDc"), v713, v714);
  v3197 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3197, v722, v133, v723, v724);
  v725 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v725, v726, v727, v728, v729);
  v3017 = v730;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3197, v731, v133 + 1, v732, v733);
    v734 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v734, v735, v736, v737, v738);
    v740 = v739;

    v3017 = v3017 + (float)((float)(v740 - v3017) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v731, (uint64_t)CFSTR("HalfCMa"), v732, v733);
  v741 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v741, v742, v133, v743, v744);
  v745 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v745, v746, v747, v748, v749);
  v3033 = v750;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v741, v751, v133 + 1, v752, v753);
    v754 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v754, v755, v756, v757, v758);
    v760 = v759;

    v3033 = v3033 + (float)((float)(v760 - v3033) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v751, (uint64_t)CFSTR("HalfCMb"), v752, v753);
  v3198 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3198, v761, v133, v762, v763);
  v764 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v764, v765, v766, v767, v768);
  v3031 = v769;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3198, v770, v133 + 1, v771, v772);
    v773 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v773, v774, v775, v776, v777);
    v779 = v778;

    v3031 = v3031 + (float)((float)(v779 - v3031) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v770, (uint64_t)CFSTR("HalfCMc"), v771, v772);
  v780 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v780, v781, v133, v782, v783);
  v784 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v784, v785, v786, v787, v788);
  v3014 = v789;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v780, v790, v133 + 1, v791, v792);
    v793 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v793, v794, v795, v796, v797);
    v799 = v798;

    v3014 = v3014 + (float)((float)(v799 - v3014) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v790, (uint64_t)CFSTR("HalfCSDa"), v791, v792);
  v3199 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3199, v800, v133, v801, v802);
  v803 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v803, v804, v805, v806, v807);
  v3013 = v808;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3199, v809, v133 + 1, v810, v811);
    v812 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v812, v813, v814, v815, v816);
    v818 = v817;

    v3013 = v3013 + (float)((float)(v818 - v3013) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v809, (uint64_t)CFSTR("HalfCSDb"), v810, v811);
  v819 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v819, v820, v133, v821, v822);
  v823 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v823, v824, v825, v826, v827);
  v3012 = v828;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v819, v829, v133 + 1, v830, v831);
    v832 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v832, v833, v834, v835, v836);
    v838 = v837;

    v3012 = v3012 + (float)((float)(v838 - v3012) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v829, (uint64_t)CFSTR("HalfCSDc"), v830, v831);
  v3200 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3200, v839, v133, v840, v841);
  v842 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v842, v843, v844, v845, v846);
  v3008 = v847;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3200, v848, v133 + 1, v849, v850);
    v851 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v851, v852, v853, v854, v855);
    v857 = v856;

    v3008 = v3008 + (float)((float)(v857 - v3008) * v141);
  }
  v858 = logf(v3023);
  v859 = logf(v3041);
  v2969 = expf((float)(v859 * 0.33333) + (float)(v858 * 0.66667));
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v860, (uint64_t)CFSTR("QuarterCMa"), v861, v862);
  v863 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v863, v864, v133, v865, v866);
  v867 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v867, v868, v869, v870, v871);
  v3009 = v872;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v863, v873, v133 + 1, v874, v875);
    v876 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v876, v877, v878, v879, v880);
    v882 = v881;

    v3009 = v3009 + (float)((float)(v882 - v3009) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v873, (uint64_t)CFSTR("QuarterCMb"), v874, v875);
  v3201 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3201, v883, v133, v884, v885);
  v886 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v886, v887, v888, v889, v890);
  v3006 = v891;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3201, v892, v133 + 1, v893, v894);
    v895 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v895, v896, v897, v898, v899);
    v901 = v900;

    v3006 = v3006 + (float)((float)(v901 - v3006) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v892, (uint64_t)CFSTR("QuarterCMc"), v893, v894);
  v902 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v902, v903, v133, v904, v905);
  v906 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v906, v907, v908, v909, v910);
  v3004 = v911;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v902, v912, v133 + 1, v913, v914);
    v915 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v915, v916, v917, v918, v919);
    v921 = v920;

    v3004 = v3004 + (float)((float)(v921 - v3004) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v912, (uint64_t)CFSTR("QuarterCSDa"), v913, v914);
  v3202 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3202, v922, v133, v923, v924);
  v925 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v925, v926, v927, v928, v929);
  v3003 = v930;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3202, v931, v133 + 1, v932, v933);
    v934 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v934, v935, v936, v937, v938);
    v940 = v939;

    v3003 = v3003 + (float)((float)(v940 - v3003) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v931, (uint64_t)CFSTR("QuarterCSDb"), v932, v933);
  v941 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v941, v942, v133, v943, v944);
  v945 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v945, v946, v947, v948, v949);
  v3002 = v950;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v941, v951, v133 + 1, v952, v953);
    v954 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v954, v955, v956, v957, v958);
    v960 = v959;

    v3002 = v3002 + (float)((float)(v960 - v3002) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v951, (uint64_t)CFSTR("QuarterCSDc"), v952, v953);
  v3203 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3203, v961, v133, v962, v963);
  v964 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v964, v965, v966, v967, v968);
  v2999 = v969;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3203, v970, v133 + 1, v971, v972);
    v973 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v973, v974, v975, v976, v977);
    v979 = v978;

    v2999 = v2999 + (float)((float)(v979 - v2999) * v141);
  }
  v2968 = expf((float)(v859 * 0.66667) + (float)(v858 * 0.33333));
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v980, (uint64_t)CFSTR("EighthCMa"), v981, v982);
  v983 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v983, v984, v133, v985, v986);
  v987 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v987, v988, v989, v990, v991);
  v3000 = v992;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v983, v993, v133 + 1, v994, v995);
    v996 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v996, v997, v998, v999, v1000);
    v1002 = v1001;

    v3000 = v3000 + (float)((float)(v1002 - v3000) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v993, (uint64_t)CFSTR("EighthCMb"), v994, v995);
  v3204 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3204, v1003, v133, v1004, v1005);
  v1006 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v1006, v1007, v1008, v1009, v1010);
  v2998 = v1011;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3204, v1012, v133 + 1, v1013, v1014);
    v1015 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v1015, v1016, v1017, v1018, v1019);
    v1021 = v1020;

    v2998 = v2998 + (float)((float)(v1021 - v2998) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v1012, (uint64_t)CFSTR("EighthCMc"), v1013, v1014);
  v1022 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v1022, v1023, v133, v1024, v1025);
  v1026 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v1026, v1027, v1028, v1029, v1030);
  v2997 = v1031;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v1022, v1032, v133 + 1, v1033, v1034);
    v1035 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v1035, v1036, v1037, v1038, v1039);
    v1041 = v1040;

    v2997 = v2997 + (float)((float)(v1041 - v2997) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v1032, (uint64_t)CFSTR("EighthCSDa"), v1033, v1034);
  v3205 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3205, v1042, v133, v1043, v1044);
  v1045 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v1045, v1046, v1047, v1048, v1049);
  v2996 = v1050;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3205, v1051, v133 + 1, v1052, v1053);
    v1054 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v1054, v1055, v1056, v1057, v1058);
    v1060 = v1059;

    v2996 = v2996 + (float)((float)(v1060 - v2996) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v1051, (uint64_t)CFSTR("EighthCSDb"), v1052, v1053);
  v1061 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v1061, v1062, v133, v1063, v1064);
  v1065 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v1065, v1066, v1067, v1068, v1069);
  v2995 = v1070;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v1061, v1071, v133 + 1, v1072, v1073);
    v1074 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v1074, v1075, v1076, v1077, v1078);
    v1080 = v1079;

    v2995 = v2995 + (float)((float)(v1080 - v2995) * v141);
  }
  objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v1071, (uint64_t)CFSTR("EighthCSDc"), v1072, v1073);
  v3206 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v3206, v1081, v133, v1082, v1083);
  v1084 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v1084, v1085, v1086, v1087, v1088);
  v2994 = v1089;

  if (v140)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3206, v1090, v133 + 1, v1091, v1092);
    v1093 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v1093, v1094, v1095, v1096, v1097);
    v1099 = v1098;

    v2994 = v2994 + (float)((float)(v1099 - v2994) * v141);
  }
  if (v3104 == 0.0)
    v1100 = 0.01;
  else
    v1100 = v3104;
  if (v3102 == 0.0)
    v1101 = 0.01;
  else
    v1101 = v3102;
  v1102 = logf(v1100);
  v1103 = logf(v1101);
  v3105 = expf((float)(v1103 * 0.5) + (float)(v1102 * 0.5));
  objc_msgSend_floatValue(v3182->inputLNRAmount, v1104, v1105, v1106, v1107);
  v3026 = v1108;
  v1109 = (float)((float)(v1108 + -0.75) * -4.0) + 1.0;
  if (v3026 <= 0.75)
    v1109 = 1.0;
  v1110 = v19;
  v1111 = v95 * v1109;
  v2975 = v3100 * v1109;
  v1112 = logf(v3100 * v1109);
  v2965 = v1111;
  v1113 = logf(v1111);
  v2960 = expf((float)(v1113 * 0.33333) + (float)(v1112 * 0.66667));
  v2962 = expf((float)(v1113 * 0.66667) + (float)(v1112 * 0.33333));
  v1114 = logf(v3025);
  v1115 = logf(v3036);
  v2959 = expf((float)(v1115 * 0.33333) + (float)(v1114 * 0.66667));
  v1116 = expf((float)(v1115 * 0.66667) + (float)(v1114 * 0.33333));
  objc_msgSend_floatValue(v3182->inputScaleFactor, v1117, v1118, v1119, v1120);
  v1122 = v1121;
  objc_msgSend_adjustedRNAmount(v3182, v1123, v1124, v1125, v1126);
  v3053 = v1131;
  v1132 = v3145 + (float)(v3077 * v3138);
  v1133 = v3143 + (float)(v3077 * v3136);
  v1134 = v3141 + (float)(v3077 * v3134);
  v1135 = v3129 + (float)(v3075 * v3121);
  v1136 = v3117 + (float)(v3170 * v3111);
  v1137 = fminf(fmaxf(v1122, 0.0), 1.0);
  v3046 = v1137;
  if (v1137 >= 1.0)
  {
    v3044 = v3175 + (float)(v1110 * r1);
    v3078 = v3165 + (float)(v1110 * v3152);
    v3122 = v3160 + (float)(v1110 * v3147);
    v3055 = v3115 + (float)(v3170 * v3109);
    v3067 = v3113 + (float)(v3170 * v3107);
    v2982 = v1135;
    v2966 = v3127 + (float)(v3075 * v3119);
    v2967 = v3132 + (float)(v3075 * v3124);
    v2980 = v1133;
    v2963 = v1134;
    v2964 = v1132;
  }
  else
  {
    v3044 = (float)(v3175 + (float)(v1110 * r1)) * (float)(v1137 * v1137);
    v3078 = (float)(v3165 + (float)(v1110 * v3152)) * (float)(v1137 * v1137);
    v3122 = (float)(v3160 + (float)(v1110 * v3147)) * (float)(v1137 * v1137);
    v2980 = v1133 * (float)(v1137 * v1137);
    v2963 = v1134 * (float)(v1137 * v1137);
    v2964 = v1132 * (float)(v1137 * v1137);
    v2982 = v1135 * (float)(v1137 * v1137);
    v2966 = (float)(v3127 + (float)(v3075 * v3119)) * (float)(v1137 * v1137);
    v2967 = (float)(v3132 + (float)(v3075 * v3124)) * (float)(v1137 * v1137);
    v1136 = v1136 * (float)(v1137 * v1137);
    v3055 = (float)(v3115 + (float)(v3170 * v3109)) * (float)(v1137 * v1137);
    v3067 = (float)(v3113 + (float)(v3170 * v3107)) * (float)(v1137 * v1137);
  }
  objc_msgSend_floatValue(v3182->inputSharpenAmount, v1127, v1128, v1129, v1130);
  v1139 = v1138;
  objc_msgSend_floatValue(v3182->inputSharpenThreshold, v1140, v1141, v1142, v1143);
  v3061 = exp2f(v1144);
  objc_msgSend_floatValue(v3182->inputContrastAmount, v1145, v1146, v1147, v1148);
  v1150 = v1149;
  objc_msgSend_floatValue(v3182->inputDetailAmount, v1151, v1152, v1153, v1154);
  v2977 = v1155;
  v2961 = v1116;
  v1156 = v1100 * v1150;
  v1157 = v3105 * v1150;
  v2987 = v3046 * v1139;
  v1158 = log2f(v3046);
  v1159 = vcvtms_s32_f32(v1158);
  if ((v1159 & 0x80000000) != 0)
  {
    v1328 = v1158 - (float)(int)floorf(v1158);
    v2981 = 0.0;
    switch(v1159)
    {
      case 0xFFFFFFFD:
        v2987 = v1328 * v1157;
        v2978 = 0.0;
        v2979 = 0.0;
        break;
      case 0xFFFFFFFE:
        v2987 = v1157 + (float)((float)(v1156 - v1157) * v1328);
        v2978 = v1328 * v1157;
        v2979 = 0.0;
        break;
      case 0xFFFFFFFF:
        v2987 = v1156 + (float)((float)(v2987 - v1156) * v1328);
        v2978 = v1157 + (float)((float)(v1156 - v1157) * v1328);
        v2979 = v1328 * v1157;
        break;
      default:
        v2978 = 0.0;
        v2979 = 0.0;
        v2987 = 0.0;
        break;
    }
  }
  else
  {
    v2978 = v1100 * v1150;
    v2979 = v3105 * v1150;
    v2981 = v1101 * v1150;
  }
  v1160 = 0.3;
  if (v3053 >= 1.0619)
    v1160 = 1.0;
  v3024 = v1160;
  v2990 = sub_1D53EC904(flt_1D544F214, flt_1D544F238, v3053);
  v2989 = sub_1D53EC904(flt_1D544F214, flt_1D544F25C, v3053);
  objc_msgSend_objectAtIndexedSubscript_(v3182->inputLowCurvatureThreshold, v1161, 0, v1162, v1163);
  v1164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v1164, v1165, v1166, v1167, v1168);

  objc_msgSend_objectAtIndexedSubscript_(v3182->inputLowCurvatureThreshold, v1169, 1, v1170, v1171);
  v1172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v1172, v1173, v1174, v1175, v1176);
  v2970 = v1177;

  objc_msgSend_objectAtIndexedSubscript_(v3182->inputLowCurvatureThreshold, v1178, 2, v1179, v1180);
  v1181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v1181, v1182, v1183, v1184, v1185);
  v2976 = v1186;

  objc_msgSend_objectAtIndexedSubscript_(v3182->inputLowCurvatureThreshold, v1187, 3, v1188, v1189);
  v1190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v1190, v1191, v1192, v1193, v1194);
  v2988 = v1195;

  objc_msgSend_imageByClampingToExtent(v3182->inputImage, v1196, v1197, v1198, v1199);
  v3146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_X(v3182->inputNeutralFactors, v1200, v1201, v1202, v1203);
  v1205 = v1204;
  objc_msgSend_Y(v3182->inputNeutralFactors, v1206, v1207, v1208, v1209);
  v1211 = v1210;
  objc_msgSend_Z(v3182->inputNeutralFactors, v1212, v1213, v1214, v1215);
  v1216 = v1205;
  v1217 = v1211;
  v1219 = v1218;
  v3125 = v1216;
  v2985 = v1217;
  v2983 = v1219;
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1220, v1221, v1222, v1223, 1.0 / v1216, 1.0 / v1217, 1.0 / v1219, 1.0);
  v3137 = (void *)objc_claimAutoreleasedReturnValue();
  v2991 = v1136;
  objc_msgSend_extent(v3182->inputImage, v1224, v1225, v1226, v1227);
  v1229 = v1228;
  v1231 = v1230;
  v1233 = v1232;
  v1235 = v1234;
  CGAffineTransformMakeScale(&v3228, 0.5, 0.5);
  v3226 = v3228;
  v3283.origin.x = v1229;
  v3283.origin.y = v1231;
  v3283.size.width = v1233;
  v3283.size.height = v1235;
  v3284 = CGRectApplyAffineTransform(v3283, &v3226);
  x = v3284.origin.x;
  y = v3284.origin.y;
  width = v3284.size.width;
  height = v3284.size.height;
  v3225 = v3228;
  v3285 = CGRectApplyAffineTransform(v3284, &v3225);
  v3224 = v3228;
  v3286 = CGRectApplyAffineTransform(v3285, &v3224);
  v3223 = v3228;
  CGRectApplyAffineTransform(v3286, &v3223);
  CGAffineTransformMakeScale(&v3227, 2.0, 2.0);
  v2973 = v1231;
  v2974 = v1229;
  v2971 = v1235;
  v2972 = v1233;
  objc_msgSend_outputCNR_E0_E1_(v3182, v1240, (uint64_t)v3146, v1241, v1242, v1229, v1231, v1233, v1235, x, y, width, height);
  v3135 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_BOOLValue(v3182->inputShowHF, v1243, v1244, v1245, v1246))
  {
    v1251 = v3135;
    v3123 = 0;
    v3042 = 0;
    v3054 = 0;
    v3056 = 0;
    v3068 = 0;
    v3071 = 0;
    v3072 = 0;
    v3126 = 0;
    v1252 = 0;
    v3181 = 0;
    v3108 = 0;
    v3106 = 0;
    v3103 = 0;
    v3101 = 0;
    v3099 = 0;
    v3110 = 0;
    v3076 = 0;
    v3112 = 0;
    v3073 = 0;
    v3128 = 0;
    v3120 = 0;
    v3118 = 0;
    v3116 = 0;
    v3114 = 0;
    v3130 = 0;
    v3074 = 0;
    v3133 = 0;
    v3069 = 0;
    v3070 = 0;
    v3153 = 0;
    v3032 = 0;
    v3034 = 0;
    v3144 = 0;
    v3142 = 0;
    v3176 = 0;
    v1253 = 0;
    v3064 = 0;
    v3065 = 0;
    v3060 = 0;
    v3062 = 0;
    v1254 = 0;
    v3037 = 0;
    v3045 = 0;
    v3047 = 0;
    v3051 = 0;
    v3052 = 0;
    v3066 = 0;
    v3050 = 0;
  }
  else
  {
    v1255 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend_X(v3182->inputLumFactors, v1247, v1248, v1249, v1250);
    v1257 = v1256;
    objc_msgSend_Y(v3182->inputLumFactors, v1258, v1259, v1260, v1261);
    v1263 = v1262;
    objc_msgSend_Z(v3182->inputLumFactors, v1264, v1265, v1266, v1267);
    objc_msgSend_vectorWithX_Y_Z_W_(v1255, v1269, v1270, v1271, v1272, v1257 * v3125, v1263 * v2985, v1268 * v2983, 1.0);
    v3126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(V8LNRKernels, v1273, (uint64_t)CFSTR("extractY"), v1274, v1275);
    v1276 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v3146, v1277, v1278, v1279, v1280);
    v1282 = v1281;
    v1284 = v1283;
    v1286 = v1285;
    v1288 = v1287;
    v3282[0] = v3146;
    v3282[1] = v3126;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1289, (uint64_t)v3282, 2, v1290);
    v1291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v1276, v1292, (uint64_t)v1291, v1293, v1294, v1282, v1284, v1286, v1288);
    v3050 = (void *)objc_claimAutoreleasedReturnValue();

    v2984 = v3078 * v3061;
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1295, v1296, v1297, v1298, (float)(v3044 * v3061), (float)(v3078 * v3061), (float)(v3122 * v3061), 0.0);
    v3123 = (void *)objc_claimAutoreleasedReturnValue();
    if ((float)(v3078 * v3061) <= 0.00001)
    {
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1299, v1300, v1301, v1302, 0.859375, -0.09375, -0.0625, -0.0234375);
      v1329 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1330, v1331, v1332, v1333, -0.015625, -0.00390625, 0.0, 0.0);
      v1334 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_kernelWithName_(V8LNRKernels, v1335, (uint64_t)CFSTR("gaborToSYAndG"), v1336, v1337);
      v3080 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extent(v3050, v1338, v1339, v1340, v1341);
      v1343 = v1342;
      v1345 = v1344;
      v1347 = v1346;
      v1349 = v1348;
      v3280[0] = v3050;
      v3280[1] = &unk_1E99D1310;
      v3280[2] = v1329;
      v3280[3] = v1334;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1350, (uint64_t)v3280, 4, v1351);
      v1320 = (void *)objc_claimAutoreleasedReturnValue();
      v1327 = v3080;
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3080, v1352, (uint64_t)&unk_1E999C2B8, (uint64_t)v1320, v1353, v1343, v1345, v1347, v1349);
      v1326 = (void *)objc_claimAutoreleasedReturnValue();
      v3051 = v1326;
      v3052 = 0;
      v3071 = (void *)v1334;
      v3072 = (void *)v1329;
    }
    else
    {
      *(float *)&v1303 = v3078 * v3061;
      objc_msgSend_kernelWithName_(V8LNRKernels, v1299, (uint64_t)CFSTR("gaborToYAndVF"), v1301, v1302, v1303);
      v3079 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extent(v3050, v1304, v1305, v1306, v1307);
      v1309 = v1308;
      v1311 = v1310;
      v1313 = v1312;
      v1315 = v1314;
      v3281[0] = v3050;
      LODWORD(v1308) = 0.5;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v1316, v1317, v1318, v1319, v1308);
      v1320 = (void *)objc_claimAutoreleasedReturnValue();
      v3281[1] = v1320;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1321, (uint64_t)v3281, 2, v1322);
      v1323 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3079, v1324, (uint64_t)&unk_1E999C298, (uint64_t)v1323, v1325, v1309, v1311, v1313, v1315);
      v1326 = (void *)objc_claimAutoreleasedReturnValue();

      v3071 = 0;
      v3072 = 0;
      v3051 = 0;
      v3052 = v1326;
      v1327 = v3079;
    }

    v3064 = v1326;
    objc_msgSend_kernelWithName_(V8LNRKernels, v1354, (uint64_t)CFSTR("reduce"), v1355, v1356);
    v3081 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v3064, v1357, v1358, v1359, v1360);
    v3222 = v3228;
    v3288 = CGRectApplyAffineTransform(v3287, &v3222);
    v1361 = v3288.origin.x;
    v1362 = v3288.origin.y;
    v1363 = v3288.size.width;
    v1364 = v3288.size.height;
    v3279 = v3064;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1365, (uint64_t)&v3279, 1, v1366);
    v1367 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v3081, v1368, (uint64_t)&unk_1E999C2D8, (uint64_t)v1367, v1369, v1361, v1362, v1363, v1364);
    v3065 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_kernelWithName_(V8LNRKernels, v1370, (uint64_t)CFSTR("expandAndMakeD"), v1371, v1372);
    v1373 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v3064, v1374, v1375, v1376, v1377);
    v1379 = v1378;
    v1381 = v1380;
    v1383 = v1382;
    v1385 = v1384;
    objc_msgSend_extent(v3065, v1386, v1387, v1388, v1389);
    v3221 = v3227;
    v3290 = CGRectApplyAffineTransform(v3289, &v3221);
    v3448 = CGRectInset(v3290, -1.0, -1.0);
    v3291.origin.x = v1379;
    v3291.origin.y = v1381;
    v3291.size.width = v1383;
    v3291.size.height = v1385;
    v3292 = CGRectUnion(v3291, v3448);
    v1390 = v3292.origin.x;
    v1391 = v3292.origin.y;
    v1392 = v3292.size.width;
    v1393 = v3292.size.height;
    v3278[0] = v3064;
    v3278[1] = v3065;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1394, (uint64_t)v3278, 2, v1395);
    v1396 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v1373, v1397, (uint64_t)&unk_1E999C2F8, (uint64_t)v1396, v1398, v1390, v1391, v1392, v1393);
    v3066 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_kernelWithName_(V8LNRKernels, v1399, (uint64_t)CFSTR("reduce"), v1400, v1401);
    v3082 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v3065, v1402, v1403, v1404, v1405);
    v3220 = v3228;
    v3294 = CGRectApplyAffineTransform(v3293, &v3220);
    v1406 = v3294.origin.x;
    v1407 = v3294.origin.y;
    v1408 = v3294.size.width;
    v1409 = v3294.size.height;
    v3277 = v3065;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1410, (uint64_t)&v3277, 1, v1411);
    v1412 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v3082, v1413, (uint64_t)&unk_1E999C318, (uint64_t)v1412, v1414, v1406, v1407, v1408, v1409);
    v3069 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_kernelWithName_(V8LNRKernels, v1415, (uint64_t)CFSTR("expandAndMakeD"), v1416, v1417);
    v1418 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v3065, v1419, v1420, v1421, v1422);
    v1424 = v1423;
    v1426 = v1425;
    v1428 = v1427;
    v1430 = v1429;
    objc_msgSend_extent(v3069, v1431, v1432, v1433, v1434);
    v3219 = v3227;
    v3296 = CGRectApplyAffineTransform(v3295, &v3219);
    v3449 = CGRectInset(v3296, -1.0, -1.0);
    v3297.origin.x = v1424;
    v3297.origin.y = v1426;
    v3297.size.width = v1428;
    v3297.size.height = v1430;
    v3298 = CGRectUnion(v3297, v3449);
    v1435 = v3298.origin.x;
    v1436 = v3298.origin.y;
    v1437 = v3298.size.width;
    v1438 = v3298.size.height;
    v3276[0] = v3065;
    v3276[1] = v3069;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1439, (uint64_t)v3276, 2, v1440);
    v1441 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v1418, v1442, (uint64_t)&unk_1E999C338, (uint64_t)v1441, v1443, v1435, v1436, v1437, v1438);
    v3070 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_kernelWithName_(V8LNRKernels, v1444, (uint64_t)CFSTR("reduce"), v1445, v1446);
    v3083 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v3069, v1447, v1448, v1449, v1450);
    v3218 = v3228;
    v3300 = CGRectApplyAffineTransform(v3299, &v3218);
    v1451 = v3300.origin.x;
    v1452 = v3300.origin.y;
    v1453 = v3300.size.width;
    v1454 = v3300.size.height;
    v3275 = v3069;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1455, (uint64_t)&v3275, 1, v1456);
    v1457 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v3083, v1458, (uint64_t)&unk_1E999C358, (uint64_t)v1457, v1459, v1451, v1452, v1453, v1454);
    v3073 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_kernelWithName_(V8LNRKernels, v1460, (uint64_t)CFSTR("expandAndMakeD"), v1461, v1462);
    v1463 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v3069, v1464, v1465, v1466, v1467);
    v1469 = v1468;
    v1471 = v1470;
    v1473 = v1472;
    v1475 = v1474;
    objc_msgSend_extent(v3073, v1476, v1477, v1478, v1479);
    v3217 = v3227;
    v3302 = CGRectApplyAffineTransform(v3301, &v3217);
    v3450 = CGRectInset(v3302, -1.0, -1.0);
    v3303.origin.x = v1469;
    v3303.origin.y = v1471;
    v3303.size.width = v1473;
    v3303.size.height = v1475;
    v3304 = CGRectUnion(v3303, v3450);
    v1480 = v3304.origin.x;
    v1481 = v3304.origin.y;
    v1482 = v3304.size.width;
    v1483 = v3304.size.height;
    v3274[0] = v3069;
    v3274[1] = v3073;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1484, (uint64_t)v3274, 2, v1485);
    v1486 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v1463, v1487, (uint64_t)&unk_1E999C378, (uint64_t)v1486, v1488, v1480, v1481, v1482, v1483);
    v3074 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_kernelWithName_(V8LNRKernels, v1489, (uint64_t)CFSTR("reduce"), v1490, v1491);
    v3084 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v3073, v1492, v1493, v1494, v1495);
    v3216 = v3228;
    v3306 = CGRectApplyAffineTransform(v3305, &v3216);
    v1496 = v3306.origin.x;
    v1497 = v3306.origin.y;
    v1498 = v3306.size.width;
    v1499 = v3306.size.height;
    v3273 = v3073;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1500, (uint64_t)&v3273, 1, v1501);
    v1502 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v3084, v1503, (uint64_t)&unk_1E999C398, (uint64_t)v1502, v1504, v1496, v1497, v1498, v1499);
    v3148 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_kernelWithName_(V8LNRKernels, v1505, (uint64_t)CFSTR("expandAndMakeD"), v1506, v1507);
    v1508 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v3073, v1509, v1510, v1511, v1512);
    v1514 = v1513;
    v1516 = v1515;
    v1518 = v1517;
    v1520 = v1519;
    objc_msgSend_extent(v3148, v1521, v1522, v1523, v1524);
    v3215 = v3227;
    v3308 = CGRectApplyAffineTransform(v3307, &v3215);
    v3451 = CGRectInset(v3308, -1.0, -1.0);
    v3309.origin.x = v1514;
    v3309.origin.y = v1516;
    v3309.size.width = v1518;
    v3309.size.height = v1520;
    v3310 = CGRectUnion(v3309, v3451);
    v1525 = v3310.origin.x;
    v1526 = v3310.origin.y;
    v1527 = v3310.size.width;
    v1528 = v3310.size.height;
    v3272[0] = v3073;
    v3272[1] = v3148;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1529, (uint64_t)v3272, 2, v1530);
    v1531 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v1508, v1532, (uint64_t)&unk_1E999C3B8, (uint64_t)v1531, v1533, v1525, v1526, v1527, v1528);
    v3076 = (void *)objc_claimAutoreleasedReturnValue();

    v1534 = v3055 * v3061;
    v2986 = 0.81 / v3059;
    v3181 = v3148;
    if ((float)(v3055 * v3061) <= 0.00001)
    {
      objc_msgSend_kernelWithName_(V8LNRKernels, v1535, (uint64_t)CFSTR("expandPlusDWithOverdrive"), v1536, v1537);
      v3087 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3076, v1714, v1715, v1716, v1717);
      v1719 = v1718;
      v1721 = v1720;
      v1723 = v1722;
      v1725 = v1724;
      objc_msgSend_extent(v3181, v1726, v1727, v1728, v1729);
      v3213 = v3227;
      v3328 = CGRectApplyAffineTransform(v3327, &v3213);
      v3456 = CGRectInset(v3328, -1.0, -1.0);
      v3329.origin.x = v1719;
      v3329.origin.y = v1721;
      v3329.size.width = v1723;
      v3329.size.height = v1725;
      v3330 = CGRectUnion(v3329, v3456);
      v1730 = v3330.origin.x;
      v1731 = v3330.origin.y;
      v1732 = v3330.size.width;
      v1733 = v3330.size.height;
      v3265[0] = v3181;
      v3265[1] = v3076;
      *(float *)&v3330.origin.x = v2981;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v1734, v1735, v1736, v1737, v3330.origin.x);
      v1698 = (void *)objc_claimAutoreleasedReturnValue();
      v3265[2] = v1698;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1738, (uint64_t)v3265, 3, v1739);
      v1703 = (void *)objc_claimAutoreleasedReturnValue();
      v1653 = v3087;
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3087, v1740, (uint64_t)&unk_1E999C478, (uint64_t)v1703, v1741, v1730, v1731, v1732, v1733);
      v3112 = (void *)objc_claimAutoreleasedReturnValue();
      v3068 = 0;
      v3108 = 0;
      v3106 = 0;
      v3103 = 0;
      v3101 = 0;
      v3099 = 0;
      v3110 = 0;
      v3139 = v1276;
    }
    else
    {
      objc_msgSend_kernelWithName_(V8LNRKernels, v1535, (uint64_t)CFSTR("gaborToVF"), v1536, v1537);
      v3085 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3073, v1538, v1539, v1540, v1541);
      v3312 = CGRectInset(v3311, -3.0, -3.0);
      v1542 = v3312.origin.x;
      v1543 = v3312.origin.y;
      v1544 = v3312.size.width;
      v1545 = v3312.size.height;
      v3271 = v3073;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1546, (uint64_t)&v3271, 1, v1547);
      v1548 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3085, v1549, (uint64_t)&unk_1E999C3D8, (uint64_t)v1548, v1550, v1542, v1543, v1544, v1545);
      v3099 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1551, v1552, v1553, v1554, (float)(v2991 * v3061), v1534, (float)(v3067 * v3061), 0.0);
      v3068 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_kernelWithName_(V8LNRKernels, v1555, (uint64_t)CFSTR("smoothVF"), v1556, v1557);
      v1558 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3099, v1559, v1560, v1561, v1562);
      v3314 = CGRectInset(v3313, -3.0, -3.0);
      v1563 = v3314.origin.x;
      v1564 = v3314.origin.y;
      v1565 = v3314.size.width;
      v1566 = v3314.size.height;
      v3270 = v3099;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1567, (uint64_t)&v3270, 1, v1568);
      v1569 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v1558, v1570, (uint64_t)&unk_1E999C3F8, (uint64_t)v1569, v1571, v1563, v1564, v1565, v1566);
      v3101 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v1572, (uint64_t)CFSTR("VFToGDIR"), v1573, v1574);
      v3057 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3101, v1575, v1576, v1577, v1578);
      v1580 = v1579;
      v1582 = v1581;
      v1584 = v1583;
      v1586 = v1585;
      v3269 = v3101;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1587, (uint64_t)&v3269, 1, v1588);
      v1589 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_arguments_(v3057, v1590, (uint64_t)v1589, v1591, v1592, v1580, v1582, v1584, v1586);
      v3103 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v1593, (uint64_t)CFSTR("DIRToC"), v1594, v1595);
      v3086 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3103, v1596, v1597, v1598, v1599);
      v3316 = CGRectInset(v3315, -8.0, -8.0);
      v1600 = v3316.origin.x;
      v1601 = v3316.origin.y;
      v1602 = v3316.size.width;
      v1603 = v3316.size.height;
      v3268[0] = v3103;
      v3268[1] = v3073;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1604, v1605, v1606, v1607, (float)(v3000 + (float)(v3041 * v2996)), (float)(v2998 + (float)(v3041 * v2995)), (float)(v2997 + (float)(v3041 * v2994)), 0.0);
      v1608 = (void *)objc_claimAutoreleasedReturnValue();
      v3268[2] = v1608;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1609, (uint64_t)v3268, 3, v1610);
      v1611 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3086, v1612, (uint64_t)&unk_1E999C418, (uint64_t)v1611, v1613, v1600, v1601, v1602, v1603);
      v3106 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v1614, (uint64_t)CFSTR("annealGAndC"), v1615, v1616);
      v1617 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3106, v1618, v1619, v1620, v1621);
      v3318 = CGRectInset(v3317, -1.0, -1.0);
      v1622 = v3318.origin.x;
      v1623 = v3318.origin.y;
      v1624 = v3318.size.width;
      v1625 = v3318.size.height;
      objc_msgSend_extent(v3073, v1626, v1627, v1628, v1629);
      v3452.origin.x = v1630;
      v3452.origin.y = v1631;
      v3452.size.width = v1632;
      v3452.size.height = v1633;
      v3319.origin.x = v1622;
      v3319.origin.y = v1623;
      v3319.size.width = v1624;
      v3319.size.height = v1625;
      v3320 = CGRectUnion(v3319, v3452);
      v1634 = v3320.origin.x;
      v1635 = v3320.origin.y;
      v1636 = v3320.size.width;
      v1637 = v3320.size.height;
      v3267[0] = v3106;
      v3267[1] = v3073;
      v3267[2] = v3068;
      *(float *)&v3320.origin.x = v2990;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v1638, v1639, v1640, v1641, v3320.origin.x);
      v1642 = (void *)objc_claimAutoreleasedReturnValue();
      v3267[3] = v1642;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1643, (uint64_t)v3267, 4, v1644);
      v1645 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v1617, v1646, (uint64_t)&unk_1E999C438, (uint64_t)v1645, v1647, v1634, v1635, v1636, v1637);
      v3108 = (void *)objc_claimAutoreleasedReturnValue();

      v3110 = v3076;
      v1651 = (float)(v1534 + -0.00003) / 0.00004;
      v1652 = 0.0;
      if (v1651 >= 0.0)
      {
        v1652 = (float)(v1534 + -0.00003) / 0.00004;
        if (v1651 > 1.0)
          v1652 = 1.0;
      }
      v3177 = v1652;
      objc_msgSend_kernelWithName_(V8LNRKernels, v1648, (uint64_t)CFSTR("expandPlusDThruG"), v1649, v1650);
      v1653 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3110, v1654, v1655, v1656, v1657);
      v3171 = v1658;
      v3166 = v1659;
      v3161 = v1660;
      r1a = v1661;
      objc_msgSend_extent(v3110, v1662, v1663, v1664, v1665);
      v1667 = v1666;
      v1669 = v1668;
      v1671 = v1670;
      v1673 = v1672;
      objc_msgSend_extent(v3108, v1674, v1675, v1676, v1677);
      v1679 = v1678;
      v1681 = v1680;
      v1683 = v1682;
      v1685 = v1684;
      objc_msgSend_extent(v3181, v1686, v1687, v1688, v1689);
      v3214 = v3227;
      v3322 = CGRectApplyAffineTransform(v3321, &v3214);
      v3453 = CGRectInset(v3322, -1.0, -1.0);
      v3323.origin.x = v1679;
      v3323.origin.y = v1681;
      v3323.size.width = v1683;
      v3323.size.height = v1685;
      v3454 = CGRectUnion(v3323, v3453);
      v3324.origin.x = v1667;
      v3324.origin.y = v1669;
      v3324.size.width = v1671;
      v3324.size.height = v1673;
      v3455 = CGRectUnion(v3324, v3454);
      v3325.origin.x = v3171;
      v3325.origin.y = v3166;
      v3325.size.width = v3161;
      v3325.size.height = r1a;
      v3326 = CGRectUnion(v3325, v3455);
      v1690 = v3326.origin.x;
      v1691 = v3326.origin.y;
      v1692 = v3326.size.width;
      v1693 = v3326.size.height;
      *(float *)&v3326.size.height = fminf(v3026 / 0.42188, 1.0);
      v3266[0] = v3181;
      v3266[1] = v3110;
      v3266[2] = v3110;
      v3266[3] = v3108;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1694, v1695, v1696, v1697, 0.0, v2981, *(float *)&v3326.size.height, (float)((float)((float)((float)(v3026 * 0.75) * 0.75) * 0.75)+ (float)((float)(*(float *)&v3326.size.height - (float)((float)((float)(v3026 * 0.75) * 0.75) * 0.75))* v3177)));
      v1698 = (void *)objc_claimAutoreleasedReturnValue();
      v3266[4] = v1698;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1699, v1700, v1701, v1702, (float)(v2986 * 0.0003), (float)(v2986 * 0.0009), (float)(v2986 * 0.0006), 0.0);
      v1703 = (void *)objc_claimAutoreleasedReturnValue();
      v3266[5] = v1703;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1704, v1705, v1706, v1707, v2965, v3036, 0.0, 0.0);
      v1708 = (void *)objc_claimAutoreleasedReturnValue();
      v3266[6] = v1708;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1709, (uint64_t)v3266, 7, v1710);
      v1711 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v1653, v1712, (uint64_t)&unk_1E999C458, (uint64_t)v1711, v1713, v1690, v1691, v1692, v1693);
      v3112 = (void *)objc_claimAutoreleasedReturnValue();

      v3139 = v3057;
    }

    v3001 = v3053 * 0.02054;
    v3038 = v3059 * v3053;
    *(float *)&v1745 = v2982 * v3061;
    LODWORD(v1746) = 925353388;
    v3043 = v2982 * v3061;
    if ((float)(v2982 * v3061) <= 0.00001)
    {
      objc_msgSend_kernelWithName_(V8LNRKernels, v1742, (uint64_t)CFSTR("expandPlusDWithOverdrive"), v1743, v1744, v1746, v1745);
      v3092 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3074, v1979, v1980, v1981, v1982);
      v1984 = v1983;
      v1986 = v1985;
      v1988 = v1987;
      v1990 = v1989;
      objc_msgSend_extent(v3112, v1991, v1992, v1993, v1994);
      v3211 = v3227;
      v3354 = CGRectApplyAffineTransform(v3353, &v3211);
      v3461 = CGRectInset(v3354, -1.0, -1.0);
      v3355.origin.x = v1984;
      v3355.origin.y = v1986;
      v3355.size.width = v1988;
      v3355.size.height = v1990;
      v3356 = CGRectUnion(v3355, v3461);
      v1995 = v3356.origin.x;
      v1996 = v3356.origin.y;
      v1997 = v3356.size.width;
      v1998 = v3356.size.height;
      v3255[0] = v3112;
      v3255[1] = v3074;
      *(float *)&v3356.origin.x = v2979;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v1999, v2000, v2001, v2002, v3356.origin.x);
      v2003 = (void *)objc_claimAutoreleasedReturnValue();
      v3255[2] = v2003;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2004, (uint64_t)v3255, 3, v2005);
      v2006 = (void *)objc_claimAutoreleasedReturnValue();
      v2007 = v3092;
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3092, v2008, (uint64_t)&unk_1E999C598, (uint64_t)v2006, v2009, v1995, v1996, v1997, v1998);
      v3133 = (void *)objc_claimAutoreleasedReturnValue();
      v3054 = 0;
      v3128 = 0;
      v3120 = 0;
      v3118 = 0;
      v3116 = 0;
      v3114 = 0;
      v3130 = 0;
    }
    else
    {
      objc_msgSend_kernelWithName_(V8LNRKernels, v1742, (uint64_t)CFSTR("gaborToVF"), v1743, v1744, v1746, v1745);
      v3088 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3069, v1747, v1748, v1749, v1750);
      v3332 = CGRectInset(v3331, -3.0, -3.0);
      v1751 = v3332.origin.x;
      v1752 = v3332.origin.y;
      v1753 = v3332.size.width;
      v1754 = v3332.size.height;
      v3264 = v3069;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1755, (uint64_t)&v3264, 1, v1756);
      v1757 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3088, v1758, (uint64_t)&unk_1E999C498, (uint64_t)v1757, v1759, v1751, v1752, v1753, v1754);
      v3114 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1760, v1761, v1762, v1763, (float)(v2967 * v3061), v3043, (float)(v2966 * v3061), 0.0);
      v3054 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_kernelWithName_(V8LNRKernels, v1764, (uint64_t)CFSTR("smoothVF"), v1765, v1766);
      v1767 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3114, v1768, v1769, v1770, v1771);
      v3334 = CGRectInset(v3333, -3.0, -3.0);
      v1772 = v3334.origin.x;
      v1773 = v3334.origin.y;
      v1774 = v3334.size.width;
      v1775 = v3334.size.height;
      v3263 = v3114;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1776, (uint64_t)&v3263, 1, v1777);
      v1778 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v1767, v1779, (uint64_t)&unk_1E999C4B8, (uint64_t)v1778, v1780, v1772, v1773, v1774, v1775);
      v3116 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v1781, (uint64_t)CFSTR("VFToGDIR"), v1782, v1783);
      v3058 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3116, v1784, v1785, v1786, v1787);
      v1789 = v1788;
      v1791 = v1790;
      v1793 = v1792;
      v1795 = v1794;
      v3262 = v3116;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1796, (uint64_t)&v3262, 1, v1797);
      v1798 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_arguments_(v3058, v1799, (uint64_t)v1798, v1800, v1801, v1789, v1791, v1793, v1795);
      v3118 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v1802, (uint64_t)CFSTR("DIRToC"), v1803, v1804);
      v3089 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3118, v1805, v1806, v1807, v1808);
      v3336 = CGRectInset(v3335, -8.0, -8.0);
      v1809 = v3336.origin.x;
      v1810 = v3336.origin.y;
      v1811 = v3336.size.width;
      v1812 = v3336.size.height;
      v3261[0] = v3118;
      v3261[1] = v3069;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1813, v1814, v1815, v1816, (float)(v3009 + (float)(v2968 * v3003)), (float)(v3006 + (float)(v2968 * v3002)), (float)(v3004 + (float)(v2968 * v2999)), 0.0);
      v1817 = (void *)objc_claimAutoreleasedReturnValue();
      v3261[2] = v1817;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1818, (uint64_t)v3261, 3, v1819);
      v1820 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3089, v1821, (uint64_t)&unk_1E999C4D8, (uint64_t)v1820, v1822, v1809, v1810, v1811, v1812);
      v3120 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v1823, (uint64_t)CFSTR("annealGAndC"), v1824, v1825);
      v1826 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3120, v1827, v1828, v1829, v1830);
      v3338 = CGRectInset(v3337, -1.0, -1.0);
      v1831 = v3338.origin.x;
      v1832 = v3338.origin.y;
      v1833 = v3338.size.width;
      v1834 = v3338.size.height;
      objc_msgSend_extent(v3069, v1835, v1836, v1837, v1838);
      v3457.origin.x = v1839;
      v3457.origin.y = v1840;
      v3457.size.width = v1841;
      v3457.size.height = v1842;
      v3339.origin.x = v1831;
      v3339.origin.y = v1832;
      v3339.size.width = v1833;
      v3339.size.height = v1834;
      v3340 = CGRectUnion(v3339, v3457);
      v1843 = v3340.origin.x;
      v1844 = v3340.origin.y;
      v1845 = v3340.size.width;
      v1846 = v3340.size.height;
      v3260[0] = v3120;
      v3260[1] = v3069;
      v3260[2] = v3054;
      *(float *)&v3340.origin.x = v2990;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v1847, v1848, v1849, v1850, v3340.origin.x);
      v1851 = (void *)objc_claimAutoreleasedReturnValue();
      v3260[3] = v1851;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1852, (uint64_t)v3260, 4, v1853);
      v1854 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v1826, v1855, (uint64_t)&unk_1E999C4F8, (uint64_t)v1854, v1856, v1843, v1844, v1845, v1846);
      v3128 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3038 <= 2.4)
      {
        v3130 = v3074;
        v3091 = v1826;
      }
      else
      {
        objc_msgSend_kernelWithName_(V8LNRKernels, v1857, (uint64_t)CFSTR("smoothDSharpenAntiBloom"), v1858, v1859);
        v3090 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1860, v1861, v1862, v1863, 1.0, v2970, v3024, v2989);
        v1864 = (void *)objc_claimAutoreleasedReturnValue();

        v3005 = (float)(2.0 / v3001);
        v3007 = (float)(v3001 * 0.75);
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1865, v1866, v1867, v1868, 1.0);
        v1869 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v3074, v1870, v1871, v1872, v1873);
        v3342 = CGRectInset(v3341, -2.0, -2.0);
        v1874 = v3342.origin.x;
        v1875 = v3342.origin.y;
        v1876 = v3342.size.width;
        v1877 = v3342.size.height;
        objc_msgSend_extent(v3128, v1878, v1879, v1880, v1881);
        v3458.origin.x = v1882;
        v3458.origin.y = v1883;
        v3458.size.width = v1884;
        v3458.size.height = v1885;
        v3343.origin.x = v1874;
        v3343.origin.y = v1875;
        v3343.size.width = v1876;
        v3343.size.height = v1877;
        v3344 = CGRectUnion(v3343, v3458);
        v1886 = v3344.origin.x;
        v1887 = v3344.origin.y;
        v1888 = v3344.size.width;
        v1889 = v3344.size.height;
        v3259[0] = v3074;
        v3259[1] = v3128;
        v3259[2] = v1864;
        v3259[3] = v1869;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1890, (uint64_t)v3259, 4, v1891);
        v1892 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v3090, v1893, (uint64_t)&unk_1E999C518, (uint64_t)v1892, v1894, v1886, v1887, v1888, v1889);
        v3131 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1895, v1896, v1897, v1898, 2.0, (float)(v2970 + (float)((float)(1.0 - v2970) * 0.25)), (float)((float)(v3024 * 0.66667) + 0.33333), (float)(v2989 * 0.6));
        v1899 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1900, v1901, v1902, v1903, 2.0, v3007, v3005, 0.100000001);
        v1904 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_kernelWithName_(V8LNRKernels, v1905, (uint64_t)CFSTR("smoothDSharpenAntiBloom"), v1906, v1907);
        v3010 = (void *)objc_claimAutoreleasedReturnValue();

        v1908 = (void *)v1899;
        objc_msgSend_extent(v3131, v1909, v1910, v1911, v1912);
        v3346 = CGRectInset(v3345, -4.0, -4.0);
        v1913 = v3346.origin.x;
        v1914 = v3346.origin.y;
        v1915 = v3346.size.width;
        v1916 = v3346.size.height;
        objc_msgSend_extent(v3128, v1917, v1918, v1919, v1920);
        v3459.origin.x = v1921;
        v3459.origin.y = v1922;
        v3459.size.width = v1923;
        v3459.size.height = v1924;
        v3347.origin.x = v1913;
        v3347.origin.y = v1914;
        v3347.size.width = v1915;
        v3347.size.height = v1916;
        v3348 = CGRectUnion(v3347, v3459);
        v1925 = v3348.origin.x;
        v1926 = v3348.origin.y;
        v1927 = v3348.size.width;
        v1928 = v3348.size.height;
        v3258[0] = v3131;
        v3258[1] = v3128;
        v3258[2] = v1899;
        v3258[3] = v1904;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1929, (uint64_t)v3258, 4, v1930);
        v1931 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v3010, v1932, (uint64_t)&unk_1E999C538, (uint64_t)v1931, v1933, v1925, v1926, v1927, v1928);
        v1934 = (void *)objc_claimAutoreleasedReturnValue();

        v1935 = v1908;
        v1936 = (void *)v1904;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1937, v1938, v1939, v1940, 4.0, (float)(v2970 + (float)((float)(1.0 - v2970) * 0.5)), (float)((float)(v3024 * 0.33333) + 0.66667), (float)((float)(v2989 * 0.6) * 0.6));
        v1941 = objc_claimAutoreleasedReturnValue();

        v1942 = v1936;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v1943, v1944, v1945, v1946, 3.0, v3007, v3005, 0.100000001);
        v1947 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_kernelWithName_(V8LNRKernels, v1948, (uint64_t)CFSTR("smoothDSharpenAntiBloom"), v1949, v1950);
        v3091 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v1934, v1951, v1952, v1953, v1954);
        v3350 = CGRectInset(v3349, -8.0, -8.0);
        v1955 = v3350.origin.x;
        v1956 = v3350.origin.y;
        v1957 = v3350.size.width;
        v1958 = v3350.size.height;
        objc_msgSend_extent(v3128, v1959, v1960, v1961, v1962);
        v3460.origin.x = v1963;
        v3460.origin.y = v1964;
        v3460.size.width = v1965;
        v3460.size.height = v1966;
        v3351.origin.x = v1955;
        v3351.origin.y = v1956;
        v3351.size.width = v1957;
        v3351.size.height = v1958;
        v3352 = CGRectUnion(v3351, v3460);
        v1967 = v3352.origin.x;
        v1968 = v3352.origin.y;
        v1969 = v3352.size.width;
        v1970 = v3352.size.height;
        v3257[0] = v1934;
        v3257[1] = v3128;
        v3257[2] = v1941;
        v3257[3] = v1947;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1971, (uint64_t)v3257, 4, v1972);
        v1973 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v3091, v1974, (uint64_t)&unk_1E999C558, (uint64_t)v1973, v1975, v1967, v1968, v1969, v1970);
        v3130 = (id)objc_claimAutoreleasedReturnValue();

        v3071 = (void *)v1947;
        v3072 = (void *)v1941;
      }
      v2010 = (float)(v3043 + -0.00003) / 0.00004;
      v2011 = 0.0;
      if (v2010 >= 0.0)
      {
        v2011 = (float)(v3043 + -0.00003) / 0.00004;
        if (v2010 > 1.0)
          v2011 = 1.0;
      }
      v3178 = v2011;
      objc_msgSend_kernelWithName_(V8LNRKernels, v1976, (uint64_t)CFSTR("expandPlusDThruG"), v1977, v1978);
      v2007 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3074, v2012, v2013, v2014, v2015);
      v3172 = v2016;
      v3167 = v2017;
      v3162 = v2018;
      r1b = v2019;
      objc_msgSend_extent(v3130, v2020, v2021, v2022, v2023);
      v2025 = v2024;
      v2027 = v2026;
      v2029 = v2028;
      v2031 = v2030;
      objc_msgSend_extent(v3128, v2032, v2033, v2034, v2035);
      v2037 = v2036;
      v2039 = v2038;
      v2041 = v2040;
      v2043 = v2042;
      objc_msgSend_extent(v3112, v2044, v2045, v2046, v2047);
      v3212 = v3227;
      v3358 = CGRectApplyAffineTransform(v3357, &v3212);
      v3462 = CGRectInset(v3358, -1.0, -1.0);
      v3359.origin.x = v2037;
      v3359.origin.y = v2039;
      v3359.size.width = v2041;
      v3359.size.height = v2043;
      v3463 = CGRectUnion(v3359, v3462);
      v3360.origin.x = v2025;
      v3360.origin.y = v2027;
      v3360.size.width = v2029;
      v3360.size.height = v2031;
      v3464 = CGRectUnion(v3360, v3463);
      v3361.origin.x = v3172;
      v3361.origin.y = v3167;
      v3361.size.width = v3162;
      v3361.size.height = r1b;
      v3362 = CGRectUnion(v3361, v3464);
      v2048 = v3362.origin.x;
      v2049 = v3362.origin.y;
      v2050 = v3362.size.width;
      v2051 = v3362.size.height;
      *(float *)&v3362.origin.x = fminf(v3026 / 0.5625, 1.0);
      v3256[0] = v3112;
      v3256[1] = v3074;
      v3256[2] = v3130;
      v3256[3] = v3128;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2052, v2053, v2054, v2055, 0.0, v2979, *(float *)&v3362.origin.x, (float)((float)((float)(v3026 * 0.75) * 0.75)+ (float)((float)(*(float *)&v3362.origin.x - (float)((float)(v3026 * 0.75) * 0.75)) * v3178)));
      v2003 = (void *)objc_claimAutoreleasedReturnValue();
      v3256[4] = v2003;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2056, v2057, v2058, v2059, (float)(v2986 * 0.0005), (float)(v2986 * 0.0015), (float)(v2986 * 0.001), 0.0);
      v2006 = (void *)objc_claimAutoreleasedReturnValue();
      v3256[5] = v2006;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2060, v2061, v2062, v2063, v2962, v2961, 0.0, 0.0);
      v2064 = (void *)objc_claimAutoreleasedReturnValue();
      v3256[6] = v2064;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2065, (uint64_t)v3256, 7, v2066);
      v2067 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2007, v2068, (uint64_t)&unk_1E999C578, (uint64_t)v2067, v2069, v2048, v2049, v2050, v2051);
      v3133 = (void *)objc_claimAutoreleasedReturnValue();

      v3139 = v3058;
    }

    *(float *)&v2073 = v2980 * v3061;
    LODWORD(v2074) = 925353388;
    v3011 = v2980 * v3061;
    if ((float)(v2980 * v3061) <= 0.00001)
    {
      objc_msgSend_kernelWithName_(V8LNRKernels, v2070, (uint64_t)CFSTR("expandPlusDWithOverdrive"), v2071, v2072, v2074, v2073);
      v3097 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3070, v2353, v2354, v2355, v2356);
      v2358 = v2357;
      v2360 = v2359;
      v2362 = v2361;
      v2364 = v2363;
      objc_msgSend_extent(v3133, v2365, v2366, v2367, v2368);
      v3209 = v3227;
      v3390 = CGRectApplyAffineTransform(v3389, &v3209);
      v3470 = CGRectInset(v3390, -1.0, -1.0);
      v3391.origin.x = v2358;
      v3391.origin.y = v2360;
      v3391.size.width = v2362;
      v3391.size.height = v2364;
      v3392 = CGRectUnion(v3391, v3470);
      v2369 = v3392.origin.x;
      v2370 = v3392.origin.y;
      v2371 = v3392.size.width;
      v2372 = v3392.size.height;
      v3244[0] = v3133;
      v3244[1] = v3070;
      *(float *)&v3392.origin.x = v2978;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v2373, v2374, v2375, v2376, v3392.origin.x);
      v2377 = (void *)objc_claimAutoreleasedReturnValue();
      v3244[2] = v2377;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2378, (uint64_t)v3244, 3, v2379);
      v2380 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3097, v2381, (uint64_t)&unk_1E999C6D8, (uint64_t)v2380, v2382, v2369, v2370, v2371, v2372);
      v1253 = (void *)objc_claimAutoreleasedReturnValue();
      v3042 = 0;
      v3153 = 0;
      v3032 = 0;
      v3144 = 0;
      v3142 = 0;
      v3176 = 0;
      v3056 = v3139;
    }
    else
    {
      objc_msgSend_kernelWithName_(V8LNRKernels, v2070, (uint64_t)CFSTR("gaborToVF"), v2071, v2072, v2074, v2073);
      v3093 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3065, v2075, v2076, v2077, v2078);
      v3364 = CGRectInset(v3363, -3.0, -3.0);
      v2079 = v3364.origin.x;
      v2080 = v3364.origin.y;
      v2081 = v3364.size.width;
      v2082 = v3364.size.height;
      v3254 = v3065;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2083, (uint64_t)&v3254, 1, v2084);
      v2085 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3093, v2086, (uint64_t)&unk_1E999C5B8, (uint64_t)v2085, v2087, v2079, v2080, v2081, v2082);
      v3142 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2088, v2089, v2090, v2091, (float)(v2964 * v3061), v3011, (float)(v2963 * v3061), 0.0);
      v3042 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_kernelWithName_(V8LNRKernels, v2092, (uint64_t)CFSTR("smoothVF"), v2093, v2094);
      v2095 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3142, v2096, v2097, v2098, v2099);
      v3366 = CGRectInset(v3365, -3.0, -3.0);
      v2100 = v3366.origin.x;
      v2101 = v3366.origin.y;
      v2102 = v3366.size.width;
      v2103 = v3366.size.height;
      v3253 = v3142;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2104, (uint64_t)&v3253, 1, v2105);
      v2106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2095, v2107, (uint64_t)&unk_1E999C5D8, (uint64_t)v2106, v2108, v2100, v2101, v2102, v2103);
      v3144 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v2109, (uint64_t)CFSTR("VFToGDIR"), v2110, v2111);
      v3056 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3144, v2112, v2113, v2114, v2115);
      v2117 = v2116;
      v2119 = v2118;
      v2121 = v2120;
      v2123 = v2122;
      v3252 = v3144;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2124, (uint64_t)&v3252, 1, v2125);
      v2126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_arguments_(v3056, v2127, (uint64_t)v2126, v2128, v2129, v2117, v2119, v2121, v2123);
      v2130 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v2131, (uint64_t)CFSTR("DIRToC"), v2132, v2133);
      v3094 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v2130, v2134, v2135, v2136, v2137);
      v3368 = CGRectInset(v3367, -8.0, -8.0);
      v2138 = v3368.origin.x;
      v2139 = v3368.origin.y;
      v2140 = v3368.size.width;
      v2141 = v3368.size.height;
      v3251[0] = v2130;
      v3251[1] = v3065;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2142, v2143, v2144, v2145, (float)(v3033 + (float)(v2969 * v3013)), (float)(v3031 + (float)(v2969 * v3012)), (float)(v3014 + (float)(v2969 * v3008)), 0.0);
      v2146 = (void *)objc_claimAutoreleasedReturnValue();
      v3251[2] = v2146;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2147, (uint64_t)v3251, 3, v2148);
      v2149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3094, v2150, (uint64_t)&unk_1E999C5F8, (uint64_t)v2149, v2151, v2138, v2139, v2140, v2141);
      v3032 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v2152, (uint64_t)CFSTR("annealGAndC"), v2153, v2154);
      v2155 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3032, v2156, v2157, v2158, v2159);
      v3370 = CGRectInset(v3369, -1.0, -1.0);
      v2160 = v3370.origin.x;
      v2161 = v3370.origin.y;
      v2162 = v3370.size.width;
      v2163 = v3370.size.height;
      objc_msgSend_extent(v3065, v2164, v2165, v2166, v2167);
      v3465.origin.x = v2168;
      v3465.origin.y = v2169;
      v3465.size.width = v2170;
      v3465.size.height = v2171;
      v3371.origin.x = v2160;
      v3371.origin.y = v2161;
      v3371.size.width = v2162;
      v3371.size.height = v2163;
      v3372 = CGRectUnion(v3371, v3465);
      v2172 = v3372.origin.x;
      v2173 = v3372.origin.y;
      v2174 = v3372.size.width;
      v2175 = v3372.size.height;
      v3250[0] = v3032;
      v3250[1] = v3065;
      v3250[2] = v3042;
      *(float *)&v3372.origin.x = v2990;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v2176, v2177, v2178, v2179, v3372.origin.x);
      v2180 = (void *)objc_claimAutoreleasedReturnValue();
      v3250[3] = v2180;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2181, (uint64_t)v3250, 4, v2182);
      v2183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2155, v2184, (uint64_t)&unk_1E999C618, (uint64_t)v2183, v2185, v2172, v2173, v2174, v2175);
      v3153 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3038 <= 1.7)
      {
        v3176 = v3070;
      }
      else
      {
        objc_msgSend_kernelWithName_(V8LNRKernels, v2186, (uint64_t)CFSTR("smoothDSharpen"), v2187, v2188);
        v3095 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2189, v2190, v2191, v2192, 1.0, v2976, v3024, v2989);
        v2193 = (void *)objc_claimAutoreleasedReturnValue();

        v3063 = (float)(v3001 * 0.75);
        v3039 = (float)(2.0 / v3001);
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2194, v2195, v2196, v2197, 1.0);
        v2198 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v3070, v2199, v2200, v2201, v2202);
        v3374 = CGRectInset(v3373, -2.0, -2.0);
        v2203 = v3374.origin.x;
        v2204 = v3374.origin.y;
        v2205 = v3374.size.width;
        v2206 = v3374.size.height;
        objc_msgSend_extent(v3153, v2207, v2208, v2209, v2210);
        v3466.origin.x = v2211;
        v3466.origin.y = v2212;
        v3466.size.width = v2213;
        v3466.size.height = v2214;
        v3375.origin.x = v2203;
        v3375.origin.y = v2204;
        v3375.size.width = v2205;
        v3375.size.height = v2206;
        v3376 = CGRectUnion(v3375, v3466);
        v2215 = v3376.origin.x;
        v2216 = v3376.origin.y;
        v2217 = v3376.size.width;
        v2218 = v3376.size.height;
        v3249[0] = v3070;
        v3249[1] = v3153;
        v3249[2] = v2193;
        v3249[3] = v2198;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2219, (uint64_t)v3249, 4, v2220);
        v2221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v3095, v2222, (uint64_t)&unk_1E999C638, (uint64_t)v2221, v2223, v2215, v2216, v2217, v2218);
        v3179 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2224, v2225, v2226, v2227, 2.0, (float)(v2976 + (float)((float)(1.0 - v2976) * 0.25)), (float)((float)(v3024 * 0.66667) + 0.33333), (float)(v2989 * 0.6));
        v3015 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2228, v2229, v2230, v2231, 2.0, v3063, v3039, 0.0);
        v2232 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_kernelWithName_(V8LNRKernels, v2233, (uint64_t)CFSTR("smoothDSharpen"), v2234, v2235);
        v2236 = (void *)objc_claimAutoreleasedReturnValue();

        v2237 = (void *)v2232;
        objc_msgSend_extent(v3179, v2238, v2239, v2240, v2241);
        v3378 = CGRectInset(v3377, -4.0, -4.0);
        v2242 = v3378.origin.x;
        v2243 = v3378.origin.y;
        v2244 = v3378.size.width;
        v2245 = v3378.size.height;
        objc_msgSend_extent(v3153, v2246, v2247, v2248, v2249);
        v3467.origin.x = v2250;
        v3467.origin.y = v2251;
        v3467.size.width = v2252;
        v3467.size.height = v2253;
        v3379.origin.x = v2242;
        v3379.origin.y = v2243;
        v3379.size.width = v2244;
        v3379.size.height = v2245;
        v3380 = CGRectUnion(v3379, v3467);
        v2254 = v3380.origin.x;
        v2255 = v3380.origin.y;
        v2256 = v3380.size.width;
        v2257 = v3380.size.height;
        v3248[0] = v3179;
        v3248[1] = v3153;
        v3248[2] = v3015;
        v3248[3] = v2232;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2258, (uint64_t)v3248, 4, v2259);
        v2260 = (void *)objc_claimAutoreleasedReturnValue();
        v2261 = v2237;
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v2236, v2262, (uint64_t)&unk_1E999C658, (uint64_t)v2260, v2263, v2254, v2255, v2256, v2257);
        v2264 = objc_claimAutoreleasedReturnValue();

        v2265 = (float)(v2989 * 0.6) * 0.6;
        v2266 = v2236;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2267, v2268, v2269, v2270, 4.0, (float)(v2976 + (float)((float)(1.0 - v2976) * 0.5)), (float)((float)(v3024 * 0.33333) + 0.66667), v2265);
        v2271 = objc_claimAutoreleasedReturnValue();

        v3016 = (void *)v2271;
        v2272 = (void *)v2264;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2273, v2274, v2275, v2276, 3.0, v3063, v3039, 0.0);
        v2277 = objc_claimAutoreleasedReturnValue();

        v2278 = v2277;
        v2279 = v2272;
        objc_msgSend_kernelWithName_(V8LNRKernels, v2280, (uint64_t)CFSTR("smoothDSharpen"), v2281, v2282);
        v3096 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v2272, v2283, v2284, v2285, v2286);
        v3382 = CGRectInset(v3381, -8.0, -8.0);
        v2287 = v3382.origin.x;
        v2288 = v3382.origin.y;
        v2289 = v3382.size.width;
        v2290 = v3382.size.height;
        objc_msgSend_extent(v3153, v2291, v2292, v2293, v2294);
        v3468.origin.x = v2295;
        v3468.origin.y = v2296;
        v3468.size.width = v2297;
        v3468.size.height = v2298;
        v3383.origin.x = v2287;
        v3383.origin.y = v2288;
        v3383.size.width = v2289;
        v3383.size.height = v2290;
        v3384 = CGRectUnion(v3383, v3468);
        v2299 = v3384.origin.x;
        v2300 = v3384.origin.y;
        v2301 = v3384.size.width;
        v2302 = v3384.size.height;
        v3247[0] = v2272;
        v3247[1] = v3153;
        v3247[2] = v3016;
        v3247[3] = v2278;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2303, (uint64_t)v3247, 4, v2304);
        v2305 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v3096, v2306, (uint64_t)&unk_1E999C678, (uint64_t)v2305, v2307, v2299, v2300, v2301, v2302);
        v3180 = (void *)objc_claimAutoreleasedReturnValue();

        v2308 = (void *)v2278;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2309, v2310, v2311, v2312, 8.0, (float)(v2976 + (float)((float)(1.0 - v2976) * 0.75)), 1.0, (float)(v2265 * 0.6));
        v2313 = objc_claimAutoreleasedReturnValue();

        v2314 = v2308;
        v2315 = (void *)v2313;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2316, v2317, v2318, v2319, 4.0, v3063, v3039, 0.0);
        v2320 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_kernelWithName_(V8LNRKernels, v2321, (uint64_t)CFSTR("smoothDSharpen"), v2322, v2323);
        v2155 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v3180, v2324, v2325, v2326, v2327);
        v3386 = CGRectInset(v3385, -16.0, -16.0);
        v2328 = v3386.origin.x;
        v2329 = v3386.origin.y;
        v2330 = v3386.size.width;
        v2331 = v3386.size.height;
        objc_msgSend_extent(v3153, v2332, v2333, v2334, v2335);
        v3469.origin.x = v2336;
        v3469.origin.y = v2337;
        v3469.size.width = v2338;
        v3469.size.height = v2339;
        v3387.origin.x = v2328;
        v3387.origin.y = v2329;
        v3387.size.width = v2330;
        v3387.size.height = v2331;
        v3388 = CGRectUnion(v3387, v3469);
        v2340 = v3388.origin.x;
        v2341 = v3388.origin.y;
        v2342 = v3388.size.width;
        v2343 = v3388.size.height;
        v3246[0] = v3180;
        v3246[1] = v3153;
        v3246[2] = v2315;
        v3246[3] = v2320;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2344, (uint64_t)v3246, 4, v2345);
        v2346 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v2155, v2347, (uint64_t)&unk_1E999C698, (uint64_t)v2346, v2348, v2340, v2341, v2342, v2343);
        v2349 = objc_claimAutoreleasedReturnValue();

        v3071 = (void *)v2320;
        v3072 = v2315;
        v3176 = (id)v2349;
      }
      v2383 = (float)(v3011 + -0.00003) / 0.00004;
      v2384 = 0.0;
      if (v2383 >= 0.0)
      {
        v2384 = (float)(v3011 + -0.00003) / 0.00004;
        if (v2383 > 1.0)
          v2384 = 1.0;
      }
      v3173 = v2384;
      objc_msgSend_kernelWithName_(V8LNRKernels, v2350, (uint64_t)CFSTR("expandPlusDThruG"), v2351, v2352);
      v3097 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3070, v2385, v2386, v2387, v2388);
      v3168 = v2389;
      v3163 = v2390;
      r1c = v2391;
      v3149 = v2392;
      objc_msgSend_extent(v3176, v2393, v2394, v2395, v2396);
      v2398 = v2397;
      v2400 = v2399;
      v2402 = v2401;
      v2404 = v2403;
      objc_msgSend_extent(v3153, v2405, v2406, v2407, v2408);
      v2410 = v2409;
      v2412 = v2411;
      v2414 = v2413;
      v2416 = v2415;
      objc_msgSend_extent(v3133, v2417, v2418, v2419, v2420);
      v3210 = v3227;
      v3394 = CGRectApplyAffineTransform(v3393, &v3210);
      v3471 = CGRectInset(v3394, -1.0, -1.0);
      v3395.origin.x = v2410;
      v3395.origin.y = v2412;
      v3395.size.width = v2414;
      v3395.size.height = v2416;
      v3472 = CGRectUnion(v3395, v3471);
      v3396.origin.x = v2398;
      v3396.origin.y = v2400;
      v3396.size.width = v2402;
      v3396.size.height = v2404;
      v3473 = CGRectUnion(v3396, v3472);
      v3397.origin.x = v3168;
      v3397.origin.y = v3163;
      v3397.size.width = r1c;
      v3397.size.height = v3149;
      v3398 = CGRectUnion(v3397, v3473);
      v2421 = v3398.origin.x;
      v2422 = v3398.origin.y;
      v2423 = v3398.size.width;
      v2424 = v3398.size.height;
      *(float *)&v3398.size.width = fminf(v3026 / 0.75, 1.0);
      v3245[0] = v3133;
      v3245[1] = v3070;
      v3245[2] = v3176;
      v3245[3] = v3153;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2425, v2426, v2427, v2428, 0.0, v2978, *(float *)&v3398.size.width, (float)((float)(v3026 * 0.75) + (float)((float)(*(float *)&v3398.size.width - (float)(v3026 * 0.75)) * v3173)));
      v2377 = (void *)objc_claimAutoreleasedReturnValue();
      v3245[4] = v2377;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2429, v2430, v2431, v2432, (float)(v2986 * 0.0007), (float)(v2986 * 0.0021), (float)(v2986 * 0.0014), 0.0);
      v2380 = (void *)objc_claimAutoreleasedReturnValue();
      v3245[5] = v2380;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2433, v2434, v2435, v2436, v2960, v2959, 0.0, 0.0);
      v2437 = (void *)objc_claimAutoreleasedReturnValue();
      v3245[6] = v2437;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2438, (uint64_t)v3245, 7, v2439);
      v2440 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v3097, v2441, (uint64_t)&unk_1E999C6B8, (uint64_t)v2440, v2442, v2421, v2422, v2423, v2424);
      v1253 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v2446 = (float)(1.0 / v3059) * 0.00175;
    v3174 = v3046 * v2977;
    v3164 = 1.0 / (float)((float)((float)((float)(1.0 / v3059) * 0.014) / v2446) + -1.0);
    v3169 = v2446 * (float)(v3164 + 1.0);
    if (v2984 <= 0.00001)
    {
      if ((float)(v3046 * v2977) <= 0.0)
      {
        v3045 = 0;
      }
      else
      {
        objc_msgSend_kernelWithName_(V8LNRKernels, v2443, (uint64_t)CFSTR("FGN"), v2444, v2445);
        v2717 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v3066, v2718, v2719, v2720, v2721);
        v3426 = CGRectInset(v3425, -2.0, -2.0);
        v2722 = v3426.origin.x;
        v2723 = v3426.origin.y;
        v2724 = v3426.size.width;
        v2725 = v3426.size.height;
        v3233 = v3066;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2726, (uint64_t)&v3233, 1, v2727);
        v2728 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v2717, v2729, (uint64_t)&unk_1E999C818, (uint64_t)v2728, v2730, v2722, v2723, v2724, v2725);
        v3045 = (void *)objc_claimAutoreleasedReturnValue();

        v3097 = v2717;
      }
      objc_msgSend_kernelWithName_(V8LNRKernels, v2443, (uint64_t)CFSTR("annealG"), v2444, v2445);
      v2731 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3064, v2732, v2733, v2734, v2735);
      v3428 = CGRectInset(v3427, -1.0, -1.0);
      v2736 = v3428.origin.x;
      v2737 = v3428.origin.y;
      v2738 = v3428.size.width;
      v2739 = v3428.size.height;
      objc_msgSend_extent(v3064, v2740, v2741, v2742, v2743);
      v3479.origin.x = v2744;
      v3479.origin.y = v2745;
      v3479.size.width = v2746;
      v3479.size.height = v2747;
      v3429.origin.x = v2736;
      v3429.origin.y = v2737;
      v3429.size.width = v2738;
      v3429.size.height = v2739;
      v3430 = CGRectUnion(v3429, v3479);
      v2748 = v3430.origin.x;
      v2749 = v3430.origin.y;
      v2750 = v3430.size.width;
      v2751 = v3430.size.height;
      v3232[0] = v3064;
      v3232[1] = v3064;
      v3232[2] = v3123;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2752, (uint64_t)v3232, 3, v2753);
      v2754 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2731, v2755, (uint64_t)&unk_1E999C838, (uint64_t)v2754, v2756, v2748, v2749, v2750, v2751);
      v1254 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v2757, (uint64_t)CFSTR("expandPlusDThruG2"), v2758, v2759);
      v2760 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v1254, v2761, v2762, v2763, v2764);
      v2766 = v2765;
      v2768 = v2767;
      v2770 = v2769;
      v2772 = v2771;
      objc_msgSend_extent(v3066, v2773, v2774, v2775, v2776);
      v2778 = v2777;
      v2780 = v2779;
      v2782 = v2781;
      v2784 = v2783;
      objc_msgSend_extent(v1253, v2785, v2786, v2787, v2788);
      v3207 = v3227;
      v3432 = CGRectApplyAffineTransform(v3431, &v3207);
      v3480 = CGRectInset(v3432, -1.0, -1.0);
      v3433.origin.x = v2778;
      v3433.origin.y = v2780;
      v3433.size.width = v2782;
      v3433.size.height = v2784;
      v3481 = CGRectUnion(v3433, v3480);
      v3434.origin.x = v2766;
      v3434.origin.y = v2768;
      v3434.size.width = v2770;
      v3434.size.height = v2772;
      v3435 = CGRectUnion(v3434, v3481);
      v2789 = v3435.origin.x;
      v2790 = v3435.origin.y;
      v2791 = v3435.size.width;
      v2792 = v3435.size.height;
      v3231[0] = v1253;
      v3231[1] = v3066;
      v3231[2] = v1254;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2793, v2794, v2795, v2796, v2987, 1.0, v3169, v3164);
      v2797 = (void *)objc_claimAutoreleasedReturnValue();
      v3231[3] = v2797;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2798, v2799, v2800, v2801, (float)(v2986 * 0.004), (float)(v2986 * 0.012), (float)(v2986 * 0.008), 0.0);
      v2802 = (void *)objc_claimAutoreleasedReturnValue();
      v3231[4] = v2802;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2803, v2804, v2805, v2806, v2975, v3025, 0.0, 0.0);
      v2807 = (void *)objc_claimAutoreleasedReturnValue();
      v3231[5] = v2807;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2808, (uint64_t)v3231, 6, v2809);
      v2810 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2760, v2811, (uint64_t)&unk_1E999C858, (uint64_t)v2810, v2812, v2789, v2790, v2791, v2792);
      v2813 = (void *)objc_claimAutoreleasedReturnValue();
      v3037 = 0;
      v3034 = 0;
      v3047 = 0;
    }
    else
    {
      objc_msgSend_kernelWithName_(V8LNRKernels, v2443, (uint64_t)CFSTR("smoothVF"), v2444, v2445);
      v2447 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3064, v2448, v2449, v2450, v2451);
      v3400 = CGRectInset(v3399, -3.0, -3.0);
      v2452 = v3400.origin.x;
      v2453 = v3400.origin.y;
      v2454 = v3400.size.width;
      v2455 = v3400.size.height;
      v3243 = v3064;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2456, (uint64_t)&v3243, 1, v2457);
      v2458 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2447, v2459, (uint64_t)&unk_1E999C6F8, (uint64_t)v2458, v2460, v2452, v2453, v2454, v2455);
      v3034 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v2461, (uint64_t)CFSTR("VFToGDIR"), v2462, v2463);
      v2464 = objc_claimAutoreleasedReturnValue();

      v3056 = (void *)v2464;
      objc_msgSend_extent(v3034, v2465, v2466, v2467, v2468);
      v2470 = v2469;
      v2472 = v2471;
      v2474 = v2473;
      v2476 = v2475;
      v3242 = v3034;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2477, (uint64_t)&v3242, 1, v2478);
      v2479 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_arguments_(v3056, v2480, (uint64_t)v2479, v2481, v2482, v2470, v2472, v2474, v2476);
      v3040 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v2483, (uint64_t)CFSTR("DIRToC"), v2484, v2485);
      v2486 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3040, v2487, v2488, v2489, v2490);
      v3402 = CGRectInset(v3401, -8.0, -8.0);
      v2491 = v3402.origin.x;
      v2492 = v3402.origin.y;
      v2493 = v3402.size.width;
      v2494 = v3402.size.height;
      v3241[0] = v3040;
      v3241[1] = v3064;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2495, v2496, v2497, v2498, (float)(v3022 + (float)(v3023 * v3019)), (float)(v3021 + (float)(v3023 * v3018)), (float)(v3020 + (float)(v3023 * v3017)), 0.0);
      v2499 = (void *)objc_claimAutoreleasedReturnValue();
      v3241[2] = v2499;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2500, (uint64_t)v3241, 3, v2501);
      v2502 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2486, v2503, (uint64_t)&unk_1E999C718, (uint64_t)v2502, v2504, v2491, v2492, v2493, v2494);
      v2505 = (void *)objc_claimAutoreleasedReturnValue();

      v3037 = v2505;
      objc_msgSend_kernelWithName_(V8LNRKernels, v2506, (uint64_t)CFSTR("annealGAndC"), v2507, v2508);
      v2509 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v2505, v2510, v2511, v2512, v2513);
      v3404 = CGRectInset(v3403, -1.0, -1.0);
      v2514 = v3404.origin.x;
      v2515 = v3404.origin.y;
      v2516 = v3404.size.width;
      v2517 = v3404.size.height;
      objc_msgSend_extent(v3064, v2518, v2519, v2520, v2521);
      v3474.origin.x = v2522;
      v3474.origin.y = v2523;
      v3474.size.width = v2524;
      v3474.size.height = v2525;
      v3405.origin.x = v2514;
      v3405.origin.y = v2515;
      v3405.size.width = v2516;
      v3405.size.height = v2517;
      v3406 = CGRectUnion(v3405, v3474);
      v2526 = v3406.origin.x;
      v2527 = v3406.origin.y;
      v2528 = v3406.size.width;
      v2529 = v3406.size.height;
      v3240[0] = v2505;
      v3240[1] = v3064;
      v3240[2] = v3123;
      *(float *)&v3406.origin.x = v2990;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v2530, v2531, v2532, v2533, v3406.origin.x);
      v2534 = (void *)objc_claimAutoreleasedReturnValue();
      v3240[3] = v2534;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2535, (uint64_t)v3240, 4, v2536);
      v2537 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2509, v2538, (uint64_t)&unk_1E999C738, (uint64_t)v2537, v2539, v2526, v2527, v2528, v2529);
      v1254 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v2540, (uint64_t)CFSTR("smoothDSharpen"), v2541, v2542);
      v2543 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2544, v2545, v2546, v2547, 1.0, v2988, v3024, v2989);
      v2548 = (void *)objc_claimAutoreleasedReturnValue();

      r1d = (float)(v3001 * 0.75);
      v3150 = (float)(2.0 / v3001);
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2549, v2550, v2551, v2552, 1.0);
      v2553 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3066, v2554, v2555, v2556, v2557);
      v3408 = CGRectInset(v3407, -2.0, -2.0);
      v2558 = v3408.origin.x;
      v2559 = v3408.origin.y;
      v2560 = v3408.size.width;
      v2561 = v3408.size.height;
      objc_msgSend_extent(v1254, v2562, v2563, v2564, v2565);
      v3475.origin.x = v2566;
      v3475.origin.y = v2567;
      v3475.size.width = v2568;
      v3475.size.height = v2569;
      v3409.origin.x = v2558;
      v3409.origin.y = v2559;
      v3409.size.width = v2560;
      v3409.size.height = v2561;
      v3410 = CGRectUnion(v3409, v3475);
      v2570 = v3410.origin.x;
      v2571 = v3410.origin.y;
      v2572 = v3410.size.width;
      v2573 = v3410.size.height;
      v3239[0] = v3066;
      v3239[1] = v1254;
      v3239[2] = v2548;
      v3239[3] = v2553;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2574, (uint64_t)v3239, 4, v2575);
      v2576 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2543, v2577, (uint64_t)&unk_1E999C758, (uint64_t)v2576, v2578, v2570, v2571, v2572, v2573);
      v3048 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2579, v2580, v2581, v2582, 2.0, (float)(v2988 + (float)((float)(1.0 - v2988) * 0.25)), (float)((float)(v3024 * 0.66667) + 0.33333), (float)(v2989 * 0.6));
      v2583 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2584, v2585, v2586, v2587, 2.0, r1d, v3150, 0.0);
      v2588 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v2589, (uint64_t)CFSTR("smoothDSharpen"), v2590, v2591);
      v2592 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3048, v2593, v2594, v2595, v2596);
      v3412 = CGRectInset(v3411, -4.0, -4.0);
      v2597 = v3412.origin.x;
      v2598 = v3412.origin.y;
      v2599 = v3412.size.width;
      v2600 = v3412.size.height;
      objc_msgSend_extent(v1254, v2601, v2602, v2603, v2604);
      v3476.origin.x = v2605;
      v3476.origin.y = v2606;
      v3476.size.width = v2607;
      v3476.size.height = v2608;
      v3413.origin.x = v2597;
      v3413.origin.y = v2598;
      v3413.size.width = v2599;
      v3413.size.height = v2600;
      v3414 = CGRectUnion(v3413, v3476);
      v2609 = v3414.origin.x;
      v2610 = v3414.origin.y;
      v2611 = v3414.size.width;
      v2612 = v3414.size.height;
      v3238[0] = v3048;
      v3238[1] = v1254;
      v3238[2] = v2583;
      v3238[3] = v2588;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2613, (uint64_t)v3238, 4, v2614);
      v2615 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2592, v2616, (uint64_t)&unk_1E999C778, (uint64_t)v2615, v2617, v2609, v2610, v2611, v2612);
      v2618 = (void *)objc_claimAutoreleasedReturnValue();

      *(float *)&v2528 = (float)(v2989 * 0.6) * 0.6;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2619, v2620, v2621, v2622, 4.0, (float)(v2988 + (float)((float)(1.0 - v2988) * 0.5)), (float)((float)(v3024 * 0.33333) + 0.66667), *(float *)&v2528);
      v2623 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2624, v2625, v2626, v2627, 3.0, r1d, v3150, 0.0);
      v2628 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_kernelWithName_(V8LNRKernels, v2629, (uint64_t)CFSTR("smoothDSharpen"), v2630, v2631);
      v2632 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v2618, v2633, v2634, v2635, v2636);
      v3416 = CGRectInset(v3415, -8.0, -8.0);
      v2637 = v3416.origin.x;
      v2638 = v3416.origin.y;
      v2639 = v3416.size.width;
      v2640 = v3416.size.height;
      objc_msgSend_extent(v1254, v2641, v2642, v2643, v2644);
      v3477.origin.x = v2645;
      v3477.origin.y = v2646;
      v3477.size.width = v2647;
      v3477.size.height = v2648;
      v3417.origin.x = v2637;
      v3417.origin.y = v2638;
      v3417.size.width = v2639;
      v3417.size.height = v2640;
      v3418 = CGRectUnion(v3417, v3477);
      v2649 = v3418.origin.x;
      v2650 = v3418.origin.y;
      v2651 = v3418.size.width;
      v2652 = v3418.size.height;
      v3237[0] = v2618;
      v3237[1] = v1254;
      v3237[2] = v2623;
      v3237[3] = v2628;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2653, (uint64_t)v3237, 4, v2654);
      v2655 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2632, v2656, (uint64_t)&unk_1E999C798, (uint64_t)v2655, v2657, v2649, v2650, v2651, v2652);
      v3049 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2658, v2659, v2660, v2661, 8.0, (float)(v2988 + (float)((float)(1.0 - v2988) * 0.75)), 1.0, (float)(*(float *)&v2528 * 0.6));
      v2662 = objc_claimAutoreleasedReturnValue();

      v3072 = (void *)v2662;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2663, v2664, v2665, v2666, 4.0, r1d, v3150, 0.0);
      v2667 = objc_claimAutoreleasedReturnValue();

      v3071 = (void *)v2667;
      objc_msgSend_kernelWithName_(V8LNRKernels, v2668, (uint64_t)CFSTR("smoothDSharpen"), v2669, v2670);
      v2671 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3049, v2672, v2673, v2674, v2675);
      v3420 = CGRectInset(v3419, -16.0, -16.0);
      v2676 = v3420.origin.x;
      v2677 = v3420.origin.y;
      v2678 = v3420.size.width;
      v2679 = v3420.size.height;
      objc_msgSend_extent(v1254, v2680, v2681, v2682, v2683);
      v3478.origin.x = v2684;
      v3478.origin.y = v2685;
      v3478.size.width = v2686;
      v3478.size.height = v2687;
      v3421.origin.x = v2676;
      v3421.origin.y = v2677;
      v3421.size.width = v2678;
      v3421.size.height = v2679;
      v3422 = CGRectUnion(v3421, v3478);
      v2688 = v3422.origin.x;
      v2689 = v3422.origin.y;
      v2690 = v3422.size.width;
      v2691 = v3422.size.height;
      v3236[0] = v3049;
      v3236[1] = v1254;
      v3236[2] = v3072;
      v3236[3] = v2667;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2692, (uint64_t)v3236, 4, v2693);
      v2694 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2671, v2695, (uint64_t)&unk_1E999C7B8, (uint64_t)v2694, v2696, v2688, v2689, v2690, v2691);
      v2697 = (void *)objc_claimAutoreleasedReturnValue();

      v3047 = v2697;
      *(float *)&v2701 = v3174;
      if (v3174 <= 0.0)
      {
        v3045 = 0;
        v2716 = v2671;
      }
      else
      {
        objc_msgSend_kernelWithName_(V8LNRKernels, v2698, (uint64_t)CFSTR("FGN"), v2699, v2700, v2701);
        v2702 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v3066, v2703, v2704, v2705, v2706);
        v3424 = CGRectInset(v3423, -2.0, -2.0);
        v2707 = v3424.origin.x;
        v2708 = v3424.origin.y;
        v2709 = v3424.size.width;
        v2710 = v3424.size.height;
        v3235 = v3066;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2711, (uint64_t)&v3235, 1, v2712);
        v2713 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v2702, v2714, (uint64_t)&unk_1E999C7D8, (uint64_t)v2713, v2715, v2707, v2708, v2709, v2710);
        v3045 = (void *)objc_claimAutoreleasedReturnValue();

        v2716 = v2702;
      }
      objc_msgSend_kernelWithName_(V8LNRKernels, v2698, (uint64_t)CFSTR("expandPlusDThruG3"), v2699, v2700);
      v2760 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3066, v2814, v2815, v2816, v2817);
      r1e = v2818;
      v3151 = v2819;
      v3140 = v2820;
      v3098 = v2821;
      objc_msgSend_extent(v2697, v2822, v2823, v2824, v2825);
      v2827 = v2826;
      v2829 = v2828;
      v2831 = v2830;
      v2833 = v2832;
      objc_msgSend_extent(v1254, v2834, v2835, v2836, v2837);
      v2839 = v2838;
      v2841 = v2840;
      v2843 = v2842;
      v2845 = v2844;
      objc_msgSend_extent(v1253, v2846, v2847, v2848, v2849);
      v3208 = v3227;
      v3437 = CGRectApplyAffineTransform(v3436, &v3208);
      v3482 = CGRectInset(v3437, -1.0, -1.0);
      v3438.origin.x = v2839;
      v3438.origin.y = v2841;
      v3438.size.width = v2843;
      v3438.size.height = v2845;
      v3483 = CGRectUnion(v3438, v3482);
      v3439.origin.x = v2827;
      v3439.origin.y = v2829;
      v3439.size.width = v2831;
      v3439.size.height = v2833;
      v3484 = CGRectUnion(v3439, v3483);
      v3440.origin.x = r1e;
      v3440.origin.y = v3151;
      v3440.size.width = v3140;
      v3440.size.height = v3098;
      v3441 = CGRectUnion(v3440, v3484);
      v2850 = v3441.origin.x;
      v2851 = v3441.origin.y;
      v2852 = v3441.size.width;
      v2853 = v3441.size.height;
      v3234[0] = v1253;
      v3234[1] = v3066;
      v3234[2] = v2697;
      v3234[3] = v1254;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2854, v2855, v2856, v2857, v3169, v2987, (float)(1.0 - v3026), 1.0);
      v2797 = (void *)objc_claimAutoreleasedReturnValue();
      v3234[4] = v2797;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2858, v2859, v2860, v2861, (float)(v2986 * 0.004), (float)(v2986 * 0.012), (float)(v2986 * 0.008), v3164);
      v2802 = (void *)objc_claimAutoreleasedReturnValue();
      v3234[5] = v2802;
      objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v2862, v2863, v2864, v2865, v2975, v3025, 0.0, 0.0);
      v2807 = (void *)objc_claimAutoreleasedReturnValue();
      v3234[6] = v2807;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2866, (uint64_t)v3234, 7, v2867);
      v2810 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2760, v2868, (uint64_t)&unk_1E999C7F8, (uint64_t)v2810, v2869, v2850, v2851, v2852, v2853);
      v2813 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v2870 = v2760;

    v2871 = v2813;
    v3060 = v2871;
    if (v3174 > 0.0 && v3174 >= 0.001 && v3045)
    {
      objc_msgSend_kernelWithName_(V8LNRKernels, v2872, (uint64_t)CFSTR("addFGN"), v2873, v2874);
      v2875 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v3060, v2876, v2877, v2878, v2879);
      v2881 = v2880;
      v2883 = v2882;
      v2885 = v2884;
      v2887 = v2886;
      objc_msgSend_extent(v3045, v2888, v2889, v2890, v2891);
      v3485.origin.x = v2892;
      v3485.origin.y = v2893;
      v3485.size.width = v2894;
      v3485.size.height = v2895;
      v3442.origin.x = v2881;
      v3442.origin.y = v2883;
      v3442.size.width = v2885;
      v3442.size.height = v2887;
      v3443 = CGRectUnion(v3442, v3485);
      v2896 = v3443.origin.x;
      v2897 = v3443.origin.y;
      v2898 = v3443.size.width;
      v2899 = v3443.size.height;
      v3230[0] = v3060;
      v3230[1] = v3045;
      v3230[2] = v1254;
      *(float *)&v3443.origin.x = v3174;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v2900, v2901, v2902, v2903, v3443.origin.x);
      v2904 = (void *)objc_claimAutoreleasedReturnValue();
      v3230[3] = v2904;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2905, (uint64_t)v3230, 4, v2906);
      v2907 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2875, v2908, (uint64_t)&unk_1E999C878, (uint64_t)v2907, v2909, v2896, v2897, v2898, v2899);
      v3062 = (id)objc_claimAutoreleasedReturnValue();

      v2870 = v2875;
    }
    else
    {
      v3062 = v2871;
    }
    objc_msgSend_kernelWithName_(V8LNRKernels, v2910, (uint64_t)CFSTR("YAndRGBGather"), v2911, v2912);
    v1252 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v3062, v2913, v2914, v2915, v2916);
    v2918 = v2917;
    v2920 = v2919;
    v2922 = v2921;
    v2924 = v2923;
    objc_msgSend_extent(v3050, v2925, v2926, v2927, v2928);
    v3486.origin.x = v2929;
    v3486.origin.y = v2930;
    v3486.size.width = v2931;
    v3486.size.height = v2932;
    v3444.origin.x = v2918;
    v3444.origin.y = v2920;
    v3444.size.width = v2922;
    v3444.size.height = v2924;
    v3445 = CGRectUnion(v3444, v3486);
    v2933 = v3445.origin.x;
    v2934 = v3445.origin.y;
    v2935 = v3445.size.width;
    v2936 = v3445.size.height;
    objc_msgSend_extent(v3135, v2937, v2938, v2939, v2940);
    v3487.origin.x = v2941;
    v3487.origin.y = v2942;
    v3487.size.width = v2943;
    v3487.size.height = v2944;
    v3446.origin.x = v2933;
    v3446.origin.y = v2934;
    v3446.size.width = v2935;
    v3446.size.height = v2936;
    v3447 = CGRectUnion(v3446, v3487);
    v2945 = v3447.origin.x;
    v2946 = v3447.origin.y;
    v2947 = v3447.size.width;
    v2948 = v3447.size.height;
    v3229[0] = v3062;
    v3229[1] = v3050;
    v3229[2] = v3135;
    v3229[3] = v3137;
    v3229[4] = v3182->inputLumFactors;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2949, (uint64_t)v3229, 5, v2950);
    v2951 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v1252, v2952, (uint64_t)&unk_1E999C898, (uint64_t)v2951, v2953, v2945, v2946, v2947, v2948);
    v2954 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_image_croppedTo_(v3182, v2955, (uint64_t)v2954, v2956, v2957, v2974, v2973, v2972, v2971);
    v1251 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1251;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputShowHF, 0);
  objc_storeStrong((id *)&self->inputHighFrequencyFactor, 0);
  objc_storeStrong((id *)&self->inputDespeckleParameters, 0);
  objc_storeStrong((id *)&self->inputLowCurvatureThreshold, 0);
  objc_storeStrong((id *)&self->inputTrimParameters, 0);
  objc_storeStrong((id *)&self->inputISODictionary, 0);
  objc_storeStrong((id *)&self->inputSensorPattern, 0);
  objc_storeStrong((id *)&self->inputISO, 0);
  objc_storeStrong((id *)&self->inputBaselineExposure, 0);
  objc_storeStrong((id *)&self->inputLumFactors, 0);
  objc_storeStrong((id *)&self->inputBoostMethod, 0);
  objc_storeStrong((id *)&self->inputScaleFactor, 0);
  objc_storeStrong((id *)&self->inputRepresentativeNoise, 0);
  objc_storeStrong((id *)&self->inputNeutralFactors, 0);
  objc_storeStrong((id *)&self->inputOpponentColorEnabled, 0);
  objc_storeStrong((id *)&self->inputMoireAmount, 0);
  objc_storeStrong((id *)&self->inputMoireRadius, 0);
  objc_storeStrong((id *)&self->inputDetailAmount, 0);
  objc_storeStrong((id *)&self->inputContrastAmount, 0);
  objc_storeStrong((id *)&self->inputSharpenThreshold, 0);
  objc_storeStrong((id *)&self->inputSharpenAmount, 0);
  objc_storeStrong((id *)&self->inputCNRAmount, 0);
  objc_storeStrong((id *)&self->inputLNRAmount, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
