@implementation RAWAdjustColorTRC

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("inputBoostAmount"), v6, v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___RAWAdjustColorTRC;
    v8 = objc_msgSendSuper2(&v10, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v8;
}

- (void)setInputBoostAmount:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setPrimitiveNumberValue_inVariable_forKey_, a3, &self->inputBoostAmount, CFSTR("inputBoostAmount"));
}

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
  const char *v10;
  objc_class *v11;
  const char *v12;
  objc_class *v13;
  const char *v14;
  objc_class *v15;
  const char *v16;
  objc_class *v17;
  const char *v18;
  objc_class *v19;
  const char *v20;
  objc_class *v21;
  const char *v22;
  objc_class *v23;
  const char *v24;
  objc_class *v25;
  const char *v26;
  objc_class *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  objc_class *v32;
  const char *v33;
  objc_class *v34;
  const char *v35;
  objc_class *v36;
  const char *v37;
  objc_class *v38;
  const char *v39;
  objc_class *v40;
  const char *v41;
  objc_class *v42;
  const char *v43;
  objc_class *v44;
  const char *v45;
  objc_class *v46;
  const char *v47;
  objc_class *v48;
  const char *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  const char *v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  id v58;
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  _QWORD v97[6];
  _QWORD v98[6];
  _QWORD v99[6];
  _QWORD v100[6];
  _QWORD v101[6];
  _QWORD v102[6];
  _QWORD v103[6];
  _QWORD v104[6];
  _QWORD v105[6];
  _QWORD v106[6];
  _QWORD v107[6];
  _QWORD v108[6];
  _QWORD v109[6];
  _QWORD v110[6];
  _QWORD v111[6];
  _QWORD v112[6];
  _QWORD v113[6];
  _QWORD v114[6];
  _QWORD v115[6];
  _QWORD v116[6];
  _QWORD v117[6];
  _QWORD v118[6];
  _QWORD v119[4];
  _QWORD v120[4];
  _QWORD v121[4];
  _QWORD v122[4];
  _QWORD v123[4];
  _QWORD v124[4];
  _QWORD v125[4];
  _QWORD v126[4];
  _QWORD v127[4];
  _QWORD v128[4];
  _QWORD v129[4];
  _QWORD v130[4];
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[4];
  _QWORD v134[4];
  _QWORD v135[4];
  _QWORD v136[4];
  uint64_t v137;
  uint64_t v138;
  _QWORD v139[2];
  _QWORD v140[22];
  _QWORD v141[10];
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v140[0] = CFSTR("inputColorSpace");
  v137 = *MEMORY[0x1E0C9DE10];
  v2 = v137;
  v3 = sub_1D543E884();
  v138 = *MEMORY[0x1E0C9DE18];
  v4 = v138;
  v139[0] = v3;
  v139[1] = CFSTR("inputColorSpace");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v139, (uint64_t)&v137, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v141[0] = v96;
  v140[1] = CFSTR("inputTRCs0");
  v135[0] = *MEMORY[0x1E0C9DE08];
  v6 = v135[0];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v95;
  v136[1] = &unk_1E99CC378;
  v8 = *MEMORY[0x1E0C9DE68];
  v135[1] = v2;
  v135[2] = v8;
  v9 = *MEMORY[0x1E0C9DED0];
  v135[3] = v4;
  v136[2] = v9;
  v136[3] = CFSTR("inputTRCs0");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v136, (uint64_t)v135, 4);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v141[1] = v89;
  v140[2] = CFSTR("inputTRCs1");
  v133[0] = v6;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v134[0] = objc_claimAutoreleasedReturnValue();
  v134[1] = &unk_1E99CC378;
  v133[1] = v2;
  v133[2] = v8;
  v133[3] = v4;
  v134[2] = v9;
  v134[3] = CFSTR("inputTRCs1");
  v94 = (void *)v134[0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v134, (uint64_t)v133, 4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v141[2] = v88;
  v140[3] = CFSTR("inputTRCs2");
  v131[0] = v6;
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v132[0] = objc_claimAutoreleasedReturnValue();
  v132[1] = &unk_1E99CC378;
  v131[1] = v2;
  v131[2] = v8;
  v131[3] = v4;
  v132[2] = v9;
  v132[3] = CFSTR("inputTRCs2");
  v93 = (void *)v132[0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v132, (uint64_t)v131, 4);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v141[3] = v87;
  v140[4] = CFSTR("inputTRCs3");
  v129[0] = v6;
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v130[0] = objc_claimAutoreleasedReturnValue();
  v130[1] = &unk_1E99CC378;
  v129[1] = v2;
  v129[2] = v8;
  v129[3] = v4;
  v130[2] = v9;
  v130[3] = CFSTR("inputTRCs3");
  v85 = (void *)v130[0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v130, (uint64_t)v129, 4);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v141[4] = v86;
  v140[5] = CFSTR("inputTRCs4");
  v127[0] = v6;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v128[0] = objc_claimAutoreleasedReturnValue();
  v128[1] = &unk_1E99CC378;
  v127[1] = v2;
  v127[2] = v4;
  v127[3] = v8;
  v128[2] = CFSTR("inputTRCs4");
  v128[3] = v9;
  v92 = (void *)v128[0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v128, (uint64_t)v127, 4);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v141[5] = v84;
  v140[6] = CFSTR("inputTRCy1");
  v125[0] = v6;
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v126[0] = objc_claimAutoreleasedReturnValue();
  v126[1] = &unk_1E99CC388;
  v125[1] = v2;
  v125[2] = v8;
  v125[3] = v4;
  v126[2] = v9;
  v126[3] = CFSTR("inputTRCy1");
  v91 = (void *)v126[0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v126, (uint64_t)v125, 4);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v141[6] = v83;
  v140[7] = CFSTR("inputTRCy2");
  v123[0] = v6;
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v124[0] = objc_claimAutoreleasedReturnValue();
  v124[1] = &unk_1E99CC398;
  v123[1] = v2;
  v123[2] = v8;
  v123[3] = v4;
  v124[2] = v9;
  v124[3] = CFSTR("inputTRCy2");
  v81 = (void *)v124[0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v124, (uint64_t)v123, 4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v141[7] = v82;
  v140[8] = CFSTR("inputTRCy3");
  v121[0] = v6;
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v122[0] = objc_claimAutoreleasedReturnValue();
  v122[1] = &unk_1E99CC3A8;
  v121[1] = v2;
  v121[2] = v8;
  v121[3] = v4;
  v122[2] = v9;
  v122[3] = CFSTR("inputTRCy3");
  v90 = (void *)v122[0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v122, (uint64_t)v121, 4);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v141[8] = v80;
  v140[9] = CFSTR("inputTRCy4");
  v119[0] = v6;
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v78;
  v120[1] = &unk_1E99CC378;
  v119[1] = v2;
  v119[2] = v8;
  v119[3] = v4;
  v120[2] = v9;
  v120[3] = CFSTR("inputTRCy4");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v26, (uint64_t)v120, (uint64_t)v119, 4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v141[9] = v79;
  v140[10] = CFSTR("inputBoostAmount");
  v117[0] = v6;
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0C9DE50];
  v76 = (void *)v28;
  v118[0] = v28;
  v118[1] = &unk_1E99CC3B8;
  v30 = *MEMORY[0x1E0C9DE48];
  v117[1] = v29;
  v117[2] = v30;
  v118[2] = &unk_1E99CC378;
  v118[3] = &unk_1E99CC378;
  v117[3] = v2;
  v117[4] = v8;
  v117[5] = v4;
  v118[4] = v9;
  v118[5] = CFSTR("inputBoostAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)v118, (uint64_t)v117, 6);
  v142 = objc_claimAutoreleasedReturnValue();
  v140[11] = CFSTR("inputBoostShadowAmount");
  v115[0] = v6;
  v77 = (void *)v142;
  v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v74;
  v116[1] = &unk_1E99CC3B8;
  v115[1] = v29;
  v115[2] = v30;
  v116[2] = &unk_1E99CC3C8;
  v116[3] = &unk_1E99CC378;
  v115[3] = v2;
  v115[4] = v8;
  v115[5] = v4;
  v116[4] = v9;
  v116[5] = CFSTR("inputBoostShadowAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)v116, (uint64_t)v115, 6);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v75;
  v140[12] = CFSTR("inputBoostPreserveHueAmount");
  v113[0] = v6;
  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v72;
  v114[1] = &unk_1E99CC3B8;
  v113[1] = v29;
  v113[2] = v30;
  v114[2] = &unk_1E99CC378;
  v114[3] = &unk_1E99CC3B8;
  v113[3] = v2;
  v113[4] = v8;
  v113[5] = v4;
  v114[4] = v9;
  v114[5] = CFSTR("inputBoostPreserveHueAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v35, (uint64_t)v114, (uint64_t)v113, 6);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v73;
  v140[13] = CFSTR("inputBoostHDRAmount");
  v111[0] = v6;
  v36 = (objc_class *)objc_opt_class();
  NSStringFromClass(v36);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v70;
  v112[1] = &unk_1E99CC378;
  v111[1] = v29;
  v111[2] = v30;
  v112[2] = &unk_1E99CC3D8;
  v112[3] = &unk_1E99CC378;
  v111[3] = v2;
  v111[4] = v8;
  v111[5] = v4;
  v112[4] = v9;
  v112[5] = CFSTR("inputBoostHDRAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)v112, (uint64_t)v111, 6);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v71;
  v140[14] = CFSTR("inputVersion");
  v109[0] = v6;
  v38 = (objc_class *)objc_opt_class();
  NSStringFromClass(v38);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v68;
  v110[1] = &unk_1E99CC3C8;
  v109[1] = v29;
  v109[2] = v30;
  v110[2] = &unk_1E99CC3D8;
  v110[3] = &unk_1E99CC3D8;
  v109[3] = v2;
  v109[4] = v8;
  v109[5] = v4;
  v110[4] = v9;
  v110[5] = CFSTR("inputVersion");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v39, (uint64_t)v110, (uint64_t)v109, 6);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v69;
  v140[15] = CFSTR("inputBoostPreserveRYHueAmount");
  v107[0] = v6;
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v66;
  v108[1] = &unk_1E99CC3B8;
  v107[1] = v29;
  v107[2] = v30;
  v108[2] = &unk_1E99CC378;
  v108[3] = &unk_1E99CC3E8;
  v107[3] = v2;
  v107[4] = v8;
  v107[5] = v4;
  v108[4] = v9;
  v108[5] = CFSTR("inputBoostPreserveRYHueAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v41, (uint64_t)v108, (uint64_t)v107, 6);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v67;
  v140[16] = CFSTR("inputBoostPreserveYGHueAmount");
  v105[0] = v6;
  v42 = (objc_class *)objc_opt_class();
  NSStringFromClass(v42);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v64;
  v106[1] = &unk_1E99CC3B8;
  v105[1] = v29;
  v105[2] = v30;
  v106[2] = &unk_1E99CC378;
  v106[3] = &unk_1E99CC3B8;
  v105[3] = v2;
  v105[4] = v8;
  v105[5] = v4;
  v106[4] = v9;
  v106[5] = CFSTR("inputBoostPreserveYGHueAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v43, (uint64_t)v106, (uint64_t)v105, 6);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v65;
  v140[17] = CFSTR("inputBoostPreserveGCHueAmount");
  v103[0] = v6;
  v44 = (objc_class *)objc_opt_class();
  NSStringFromClass(v44);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v62;
  v104[1] = &unk_1E99CC3B8;
  v103[1] = v29;
  v103[2] = v30;
  v104[2] = &unk_1E99CC378;
  v104[3] = &unk_1E99CC3B8;
  v103[3] = v2;
  v103[4] = v8;
  v103[5] = v4;
  v104[4] = v9;
  v104[5] = CFSTR("inputBoostPreserveGCHueAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v45, (uint64_t)v104, (uint64_t)v103, 6);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v63;
  v140[18] = CFSTR("inputBoostPreserveCBHueAmount");
  v101[0] = v6;
  v46 = (objc_class *)objc_opt_class();
  NSStringFromClass(v46);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v102[0] = v60;
  v102[1] = &unk_1E99CC3B8;
  v101[1] = v29;
  v101[2] = v30;
  v102[2] = &unk_1E99CC378;
  v102[3] = &unk_1E99CC3B8;
  v101[3] = v2;
  v101[4] = v8;
  v101[5] = v4;
  v102[4] = v9;
  v102[5] = CFSTR("inputBoostPreserveCBHueAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v47, (uint64_t)v102, (uint64_t)v101, 6);
  v150 = objc_claimAutoreleasedReturnValue();
  v140[19] = CFSTR("inputBoostPreserveBMHueAmount");
  v99[0] = v6;
  v61 = (void *)v150;
  v48 = (objc_class *)objc_opt_class();
  NSStringFromClass(v48);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v59;
  v100[1] = &unk_1E99CC3B8;
  v99[1] = v29;
  v99[2] = v30;
  v100[2] = &unk_1E99CC378;
  v100[3] = &unk_1E99CC3B8;
  v99[3] = v2;
  v99[4] = v8;
  v99[5] = v4;
  v100[4] = v9;
  v100[5] = CFSTR("inputBoostPreserveBMHueAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v49, (uint64_t)v100, (uint64_t)v99, 6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v50;
  v140[20] = CFSTR("inputBoostPreserveMRHueAmount");
  v97[0] = v6;
  v51 = (objc_class *)objc_opt_class();
  NSStringFromClass(v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v52;
  v98[1] = &unk_1E99CC3B8;
  v97[1] = v29;
  v97[2] = v30;
  v98[2] = &unk_1E99CC378;
  v98[3] = &unk_1E99CC3B8;
  v97[3] = v2;
  v97[4] = v8;
  v97[5] = v4;
  v98[4] = v9;
  v98[5] = CFSTR("inputBoostPreserveMRHueAmount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v53, (uint64_t)v98, (uint64_t)v97, 6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v140[21] = CFSTR("kCIRAWFilterDoesClip");
  v55 = *MEMORY[0x1E0C9AE40];
  v152 = v54;
  v153 = v55;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v56, (uint64_t)v141, (uint64_t)v140, 22);
  v58 = (id)objc_claimAutoreleasedReturnValue();

  return v58;
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
  CIImage *inputImage;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
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
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  CIImage *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  int v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  CIVector *inputReferencePoints;
  CIVector *inputOutputPoints;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  double v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  double v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  double v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  CIVector *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const void *v144;
  CIVector *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const void *v150;
  void *v151;
  float v152;
  float v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  float v158;
  float v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  float v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  float v175;
  float v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  float v181;
  float v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  float v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  BOOL v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  const char *v231;
  void *v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  double v242;
  double v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  double v249;
  double v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  double v256;
  double v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  const char *v280;
  const char *v281;
  uint64_t v282;
  uint64_t i;
  uint64_t v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  id v290;
  const char *v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  id inputColorSpace;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  double v328;
  double v329;
  double v330;
  const char *v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  double v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  double v346;
  double v347;
  double v348;
  double v349;
  double v350;
  double v351;
  double v352;
  double v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  void *v358;
  const char *v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  uint64_t v368;
  void *v369;
  double v370;
  double v371;
  double v372;
  uint64_t v373;
  uint64_t v374;
  void (**v375)(_QWORD);
  double v376;
  int v377;
  CIVector *v378;
  void *v379;
  CIImage *v380;
  void *v381;
  double v382;
  CIVector *v383;
  double v384;
  CIVector *v385;
  CIVector *v386;
  void *v387;
  uint64_t v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  uint64_t v393;
  id v394;
  _QWORD v396[8];
  _QWORD v397[4];
  CIVector *v398;
  CIVector *v399;
  unint64_t v400;
  _QWORD v401[5];
  uint8_t buf[16];
  _QWORD v403[7];
  _QWORD v404[6];
  _QWORD v405[7];
  _QWORD v406[7];
  _QWORD v407[9];
  _QWORD v408[2];
  _QWORD v409[4];
  _QWORD v410[3];
  _QWORD v411[5];

  v411[3] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
  {
    v71 = 0;
    return v71;
  }
  if (self->inputBoostAmount)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWAdjustColorTRC", (const char *)&unk_1D548AF1A, buf, 2u);
    }

    v5 = MEMORY[0x1E0C809B0];
    v401[0] = MEMORY[0x1E0C809B0];
    v401[1] = 3221225472;
    v401[2] = sub_1D53CCA30;
    v401[3] = &unk_1E996F870;
    v401[4] = self;
    v375 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v401);
    objc_msgSend_floatValue(self->inputBoostPreserveHueAmount, v6, v7, v8, v9);
    v11 = v10;
    objc_msgSend_doubleValue(self->inputBoostAmount, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_doubleValue(self->inputBoostShadowAmount, v18, v19, v20, v21);
    v23 = v22;
    objc_msgSend_doubleValue(self->inputBoostHDRAmount, v24, v25, v26, v27);
    v29 = v28;
    objc_msgSend_doubleValue(self->inputTRCs0, v30, v31, v32, v33);
    v39 = fmin(fmax(v17, 0.0), 1.0);
    v40 = fmin(fmax(v23, 0.0), 1.0);
    v41 = 1.0;
    if (v39 > 0.0)
    {
      v41 = v40 * v38;
      if (v39 < 1.0)
        v41 = 1.0 - v39 + v41 * v39;
    }
    objc_msgSend_doubleValue(self->inputTRCs1, v34, v35, v36, v37);
    v47 = 1.0;
    if (v39 > 0.0)
    {
      v47 = v46;
      if (v39 < 1.0)
        v47 = 1.0 - v39 + v46 * v39;
    }
    objc_msgSend_doubleValue(self->inputTRCs2, v42, v43, v44, v45);
    v382 = 1.0;
    if (v39 > 0.0)
    {
      v382 = v52;
      if (v39 < 1.0)
        v382 = 1.0 - v39 + v52 * v39;
    }
    objc_msgSend_doubleValue(self->inputTRCs3, v48, v49, v50, v51);
    v58 = 1.0;
    if (v39 > 0.0)
    {
      v58 = v57;
      if (v39 < 1.0)
        v58 = 1.0 - v39 + v57 * v39;
    }
    objc_msgSend_doubleValue(self->inputTRCs4, v53, v54, v55, v56);
    v371 = v40;
    v64 = 1.0;
    if (v39 > 0.0)
    {
      v64 = v63;
      if (v39 < 1.0)
        v64 = 1.0 - v39 + v63 * v39;
    }
    objc_msgSend_doubleValue(self->inputTRCy1, v59, v60, v61, v62);
    v384 = v41;
    if (v39 <= 0.0)
    {
      v70 = 0.1;
    }
    else
    {
      v70 = v69;
      if (v39 < 1.0)
        v70 = (1.0 - v39) * 0.1 + v69 * v39;
    }
    objc_msgSend_doubleValue(self->inputTRCy2, v65, v66, v67, v68);
    if (v39 <= 0.0)
    {
      v77 = 0.2;
    }
    else
    {
      v77 = v76;
      if (v39 < 1.0)
        v77 = (1.0 - v39) * 0.2 + v76 * v39;
    }
    v370 = v29;
    objc_msgSend_doubleValue(self->inputTRCy3, v72, v73, v74, v75);
    v83 = 0.5;
    if (v39 > 0.0)
    {
      v83 = v82;
      if (v39 < 1.0)
        v83 = (1.0 - v39) * 0.5 + v82 * v39;
    }
    v376 = v64;
    objc_msgSend_doubleValue(self->inputTRCy4, v78, v79, v80, v81);
    v89 = 1.0;
    if (v39 > 0.0)
    {
      v89 = v88;
      if (v39 < 1.0)
        v89 = 1.0 - v39 + v88 * v39;
    }
    v90 = objc_msgSend_intValue(self->inputVersion, v84, v85, v86, v87);
    v380 = self->inputImage;
    inputReferencePoints = self->inputReferencePoints;
    v377 = v90;
    if (inputReferencePoints)
    {
      if ((unint64_t)objc_msgSend_count(inputReferencePoints, v91, v92, v93, v94) >= 2)
      {
        inputOutputPoints = self->inputOutputPoints;
        if (inputOutputPoints)
        {
          v97 = objc_msgSend_count(inputOutputPoints, v91, v92, v93, v94);
          v102 = v97 == objc_msgSend_count(self->inputReferencePoints, v98, v99, v100, v101);
          v90 = v377;
          if (v102)
          {
            v386 = self->inputReferencePoints;
            v378 = self->inputOutputPoints;
            v107 = objc_msgSend_count(v386, v103, v104, v105, v106);
            objc_msgSend_valueAtIndex_(v386, v108, v107 - 1, v109, v110);
            v112 = v111;
            objc_msgSend_valueAtIndex_(v378, v113, v107 - 1, v114, v115);
            v117 = v116;
            objc_msgSend_valueAtIndex_(v386, v118, v107 - 2, v119, v120);
            v122 = v121;
            objc_msgSend_valueAtIndex_(v378, v123, v107 - 2, v124, v125);
            v127 = v126;
            v397[0] = v5;
            v397[1] = 3221225472;
            v397[2] = sub_1D53CCAB4;
            v397[3] = &unk_1E999BD98;
            v400 = v107;
            v383 = v386;
            v398 = v383;
            v385 = v378;
            v399 = v385;
            v392 = (void *)MEMORY[0x1D82721B4](v397);
            objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v128, 16 * v107, v129, v130);
            v394 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v138 = (_QWORD *)objc_msgSend_mutableBytes(v394, v131, v132, v133, v134);
            if (v107 <= 4)
            {
              if (v107)
              {
                for (i = 0; i != v107; ++i)
                {
                  objc_msgSend_valueAtIndex_(v383, v135, i, v136, v137);
                  v138[i] = v284;
                  objc_msgSend_valueAtIndex_(v385, v285, i, v286, v287);
                  v138[v107 + i] = v288;
                }
              }
            }
            else
            {
              v139 = objc_retainAutorelease(v383);
              v144 = (const void *)objc_msgSend__values(v139, v140, v141, v142, v143);
              memcpy(v138, v144, 8 * v107);
              v145 = objc_retainAutorelease(v385);
              v150 = (const void *)objc_msgSend__values(v145, v146, v147, v148, v149);
              memcpy(&v138[v107], v150, 8 * v107);
            }
            v289 = *MEMORY[0x1E0C9E150];
            v410[0] = *MEMORY[0x1E0C9E148];
            v410[1] = v289;
            v411[0] = v394;
            v411[1] = CFSTR("RAWAdjustColorTRC");
            v410[2] = *MEMORY[0x1E0C9E108];
            v411[2] = MEMORY[0x1E0C9AAB0];
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v135, (uint64_t)v411, (uint64_t)v410, 3);
            v389 = (void *)objc_claimAutoreleasedReturnValue();
            v290 = objc_alloc(MEMORY[0x1E0C9DDC8]);
            v292 = (void *)objc_msgSend_initWithImageProvider_width_height_format_colorSpace_options_(v290, v291, (uint64_t)v392, 256, 1, *MEMORY[0x1E0C9E098], 0, v389);
            objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v293, v294, v295, v296, 256.0, v39, v371, 0.0);
            v391 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v297, v298, v299, v300, v112, v117, (v117 - v127) / (v112 - v122));
            v390 = (void *)objc_claimAutoreleasedReturnValue();
            v301 = v380;
            objc_msgSend_extent(v292, v302, v303, v304, v305);
            v310 = v309;
            v312 = v311;
            v314 = v313;
            v316 = v315;
            inputColorSpace = self->inputColorSpace;
            if (inputColorSpace)
            {
              objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v380, v306, (uint64_t)self->inputColorSpace, v307, v308);
              v301 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v381 = v301;
            objc_msgSend_kernelWithName_(BoostKernels, v306, (uint64_t)CFSTR("boost_lut"), v307, v308);
            v318 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_extent(v301, v319, v320, v321, v322);
            v324 = v323;
            v326 = v325;
            v328 = v327;
            v330 = v329;
            v396[0] = v5;
            v396[1] = 3221225472;
            v396[2] = sub_1D53CCC74;
            v396[3] = &unk_1E999A430;
            v396[4] = v310;
            v396[5] = v312;
            v396[6] = v314;
            v396[7] = v316;
            v409[0] = v301;
            v409[1] = v292;
            v409[2] = v391;
            v409[3] = v390;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v331, (uint64_t)v409, 4, v332);
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_applyWithExtent_roiCallback_arguments_(v318, v334, (uint64_t)v396, (uint64_t)v333, v335, v324, v326, v328, v330);
            v336 = (void *)objc_claimAutoreleasedReturnValue();

            v340 = fmin(fmax(v370, 1.0), 3.0);
            if (v340 > 1.0)
            {
              objc_msgSend_kernelWithName_(BoostKernels, v337, (uint64_t)CFSTR("boost_hdr"), v338, v339);
              v341 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_extent(v336, v342, v343, v344, v345);
              v347 = v346;
              v349 = v348;
              v351 = v350;
              v353 = v352;
              v408[0] = v336;
              objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v354, v355, v356, v357, v340);
              v358 = (void *)objc_claimAutoreleasedReturnValue();
              v408[1] = v358;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v359, (uint64_t)v408, 2, v360);
              v361 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_applyWithExtent_arguments_(v341, v362, (uint64_t)v361, v363, v364, v347, v349, v351, v353);
              v365 = objc_claimAutoreleasedReturnValue();

              v336 = (void *)v365;
            }
            if (inputColorSpace)
            {
              v366 = v336;
              objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v336, v337, (uint64_t)inputColorSpace, v338, v339);
              v336 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v71 = v336;

            v227 = v398;
            goto LABEL_59;
          }
        }
      }
    }
    v372 = fmin(fmax(v11, 0.0), 1.0);
    if (v90 < 7)
    {
      if (v90 < 5)
      {
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v91, v92, v93, v94, 0.100000001, 0.200000003, 0.5, 1.0);
        v237 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v238, v239, v240, v241, v70 * 1000.0 * (v47 * 0.1 / v70 + v384 * 0.1 / v70 + -2.0), v70 * 100.0 * (1.0 - (v384 * 0.1 / v70 + v47 * 0.1 / v70 + v384 * 0.1 / v70 + -2.0)), v70 * 10.0 * (v384 * 0.1 / v70), 0.0);
        v385 = (CIVector *)objc_claimAutoreleasedReturnValue();
        v242 = v47 * 0.1 / (v77 - v70);
        v243 = v382 * 0.1 / (v77 - v70) + v242 + -2.0;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v244, v245, v246, v247, (v77 - v70) * v243 * 1000.0, (v77 - v70) * ((1.0 - (v242 + v243)) * 100.0 + v243 * -300.0), (v77 - v70) * ((1.0 - (v242 + v243)) * -20.0 + v243 * 30.0 + v242 * 10.0), v70 + (v77 - v70) * (1.0 - (v242 + v243) - v243 - v242));
        v248 = objc_claimAutoreleasedReturnValue();
        v249 = v382 * 0.3 / (v83 - v77);
        v250 = v58 * 0.3 / (v83 - v77) + v249 + -2.0;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v251, v252, v253, v254, (v83 - v77) * v250 * 1000.0 / 27.0, (v83 - v77) * ((1.0 - (v249 + v250)) * 100.0 / 9.0 + v250 * -200.0 / 9.0), (v83 - v77) * (v249 * 10.0 / 3.0 + v250 * 40.0 / 9.0 - (1.0 - (v249 + v250)) * 40.0 / 9.0), v77 + (v83 - v77) * ((1.0 - (v249 + v250)) * 4.0 / 9.0 - v250 * 8.0 / 27.0 - (v249 + v249) / 3.0));
        v255 = objc_claimAutoreleasedReturnValue();
        v256 = v58 * 0.5 / (1.0 - v83);
        v257 = v376 * 0.5 / (1.0 - v83) + v256 + -2.0;
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v258, v259, v260, v261, (1.0 - v83) * v257 * 8.0, (1.0 - v83) * ((1.0 - (v256 + v257)) * 4.0 + v257 * -12.0), (1.0 - v83) * (v256 * 2.0 - ((1.0 - (v256 + v257)) * 4.0 - v257 * 6.0)), v83 + (1.0 - v83) * (1.0 - (v256 + v257) - v257 - v256));
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v262, v263, v264, v265, v376);
        v266 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v267, v268, v269, v270, v372);
        v369 = (void *)v266;
        v383 = (CIVector *)v237;
        v221 = v377 < 3;
        v379 = (void *)objc_claimAutoreleasedReturnValue();
        if (v221)
        {
          v207 = (void *)v255;
          v228 = v369;
          if (v372 >= 1.0)
          {
            objc_msgSend_kernelWithName_(BoostKernels, v271, (uint64_t)CFSTR("boost_v2_dng"), v272, v273, 1.0, v372);
            v374 = objc_claimAutoreleasedReturnValue();
            v404[0] = v237;
            v404[1] = v385;
            v404[2] = v248;
            v404[3] = v255;
            v404[4] = v212;
            v404[5] = v369;
            v227 = (void *)v248;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v281, (uint64_t)v404, 6, v282);
          }
          else
          {
            objc_msgSend_kernelWithName_(BoostKernels, v271, (uint64_t)CFSTR("boost_v2"), v272, v273, 1.0, v372);
            v374 = objc_claimAutoreleasedReturnValue();
            v403[0] = v237;
            v403[1] = v385;
            v403[2] = v248;
            v403[3] = v255;
            v403[4] = v212;
            v403[5] = v369;
            v403[6] = v379;
            v227 = (void *)v248;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v278, (uint64_t)v403, 7, v279);
          }
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          v226 = (void *)v374;
          objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v280, v374, (uint64_t)v380, (uint64_t)v225, self->inputColorSpace, 1);
          v277 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v207 = (void *)v255;
          v228 = v369;
          objc_msgSend_kernelWithName_(BoostKernels, v271, (uint64_t)CFSTR("boost_v3"), v272, v273);
          v373 = objc_claimAutoreleasedReturnValue();
          v405[0] = v237;
          v405[1] = v385;
          v405[2] = v248;
          v405[3] = v255;
          v405[4] = v212;
          v405[5] = v369;
          v405[6] = v379;
          v227 = (void *)v248;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v274, (uint64_t)v405, 7, v275);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          v226 = (void *)v373;
          objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v276, v373, (uint64_t)v380, (uint64_t)v225, self->inputColorSpace, 1);
          v277 = objc_claimAutoreleasedReturnValue();
        }
        v236 = (void *)v277;
        v233 = v380;
        goto LABEL_58;
      }
      v387 = 0;
      v388 = 0;
    }
    else
    {
      v151 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend_floatValue(self->inputBoostPreserveRYHueAmount, v91, v92, v93, v94);
      v153 = v152;
      objc_msgSend_floatValue(self->inputBoostPreserveYGHueAmount, v154, v155, v156, v157);
      v159 = v158;
      objc_msgSend_floatValue(self->inputBoostPreserveGCHueAmount, v160, v161, v162, v163);
      objc_msgSend_vectorWithX_Y_Z_(v151, v165, v166, v167, v168, fminf(fmaxf(v153, 0.0), 1.0), fminf(fmaxf(v159, 0.0), 1.0), fminf(fmaxf(v164, 0.0), 1.0));
      v169 = objc_claimAutoreleasedReturnValue();
      v170 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend_floatValue(self->inputBoostPreserveCBHueAmount, v171, v172, v173, v174);
      v176 = v175;
      objc_msgSend_floatValue(self->inputBoostPreserveBMHueAmount, v177, v178, v179, v180);
      v182 = v181;
      objc_msgSend_floatValue(self->inputBoostPreserveMRHueAmount, v183, v184, v185, v186);
      objc_msgSend_vectorWithX_Y_Z_(v170, v188, v189, v190, v191, fminf(fmaxf(v176, 0.0), 1.0), fminf(fmaxf(v182, 0.0), 1.0), fminf(fmaxf(v187, 0.0), 1.0));
      v387 = (void *)v169;
      v388 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v91, v92, v93, v94, 0.100000001, 0.200000003, 0.5, 1.0);
    v192 = objc_claimAutoreleasedReturnValue();
    sub_1D5352D68(0.0, 0.0, v384, 0.1, v70, v47, v192, v193, v194, v195, v196);
    v197 = objc_claimAutoreleasedReturnValue();
    sub_1D5352D68(0.1, v70, v47, 0.2, v77, v382, v197, v198, v199, v200, v201);
    v202 = objc_claimAutoreleasedReturnValue();
    sub_1D5352D68(0.2, v77, v382, 0.5, v83, v58, v202, v203, v204, v205, v206);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1D5352D68(0.5, v83, v58, 1.0, v89, v376, (uint64_t)v207, v208, v209, v210, v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1D5352D68(0.5, v83, v58, 1.0, v83 + v58 * 0.5, v58, (uint64_t)v212, v213, v214, v215, v216);
    v393 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v217, v218, v219, v220, v372);
    v383 = (CIVector *)v192;
    v385 = (CIVector *)v197;
    v221 = v377 < 7;
    v379 = (void *)objc_claimAutoreleasedReturnValue();
    if (v221)
    {
      objc_msgSend_kernelWithName_(BoostKernels, v222, (uint64_t)CFSTR("boost_v5"), v223, v224);
      v368 = objc_claimAutoreleasedReturnValue();
      v406[0] = v192;
      v406[1] = v197;
      v406[2] = v202;
      v406[3] = v207;
      v406[4] = v212;
      v406[5] = v393;
      v406[6] = v379;
      v227 = (void *)v202;
      v228 = (void *)v393;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v234, (uint64_t)v406, 7, v235);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = (void *)v368;
      v226 = v387;
      v225 = (void *)v388;
    }
    else
    {
      objc_msgSend_kernelWithName_(BoostKernels, v222, (uint64_t)CFSTR("boost_v7"), v223, v224);
      v368 = objc_claimAutoreleasedReturnValue();
      v407[0] = v192;
      v407[1] = v197;
      v407[2] = v202;
      v407[3] = v207;
      v407[4] = v212;
      v407[5] = v393;
      v407[6] = v379;
      v226 = v387;
      v225 = (void *)v388;
      v407[7] = v387;
      v407[8] = v388;
      v227 = (void *)v202;
      v228 = (void *)v393;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v229, (uint64_t)v407, 9, v230);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = (void *)v368;
    }
    objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v231, v368, (uint64_t)v380, (uint64_t)v232, self->inputColorSpace, 1);
    v236 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_58:
    v71 = v236;

LABEL_59:
    v375[2](v375);

    return v71;
  }
  v71 = inputImage;
  return v71;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputOutputPoints, 0);
  objc_storeStrong((id *)&self->inputReferencePoints, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveMRHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveBMHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveCBHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveGCHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveYGHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveRYHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostPreserveHueAmount, 0);
  objc_storeStrong((id *)&self->inputBoostHDRAmount, 0);
  objc_storeStrong((id *)&self->inputBoostShadowAmount, 0);
  objc_storeStrong((id *)&self->inputBoostAmount, 0);
  objc_storeStrong((id *)&self->inputTRCs4, 0);
  objc_storeStrong((id *)&self->inputTRCy4, 0);
  objc_storeStrong((id *)&self->inputTRCs3, 0);
  objc_storeStrong((id *)&self->inputTRCy3, 0);
  objc_storeStrong((id *)&self->inputTRCs2, 0);
  objc_storeStrong((id *)&self->inputTRCy2, 0);
  objc_storeStrong((id *)&self->inputTRCs1, 0);
  objc_storeStrong((id *)&self->inputTRCy1, 0);
  objc_storeStrong((id *)&self->inputTRCs0, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
