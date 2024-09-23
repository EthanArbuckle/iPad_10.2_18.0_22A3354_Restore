@implementation RAWConvert

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("inputNeutral"), v6, v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___RAWConvert;
    v8 = objc_msgSendSuper2(&v10, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v8;
}

- (void)setInputNeutral:(id)a3
{
  uint64_t *p_inputNeutral;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  p_inputNeutral = (uint64_t *)&self->inputNeutral;
  v12 = a3;
  if ((id)*p_inputNeutral != v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_msgSend_isEqualToArray_(v12, v6, *p_inputNeutral, v7, v8) & 1) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v6, (uint64_t)CFSTR("inputNeutral"), v7, v8);
      objc_storeStrong((id *)&self->inputNeutral, a3);
      objc_msgSend_didChangeValueForKey_(self, v9, (uint64_t)CFSTR("inputNeutral"), v10, v11);
    }
  }

}

+ (id)customAttributes
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  objc_class *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  objc_class *v15;
  const char *v16;
  objc_class *v17;
  const char *v18;
  objc_class *v19;
  const char *v20;
  objc_class *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  objc_class *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  objc_class *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  objc_class *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  objc_class *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  objc_class *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  objc_class *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  objc_class *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  objc_class *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void *v76;
  objc_class *v77;
  void *v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  objc_class *v82;
  void *v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  objc_class *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[3];
  _QWORD v139[3];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[2];
  _QWORD v144[2];
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[2];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[2];
  _QWORD v157[2];
  _QWORD v158[2];
  _QWORD v159[2];
  _QWORD v160[3];
  _QWORD v161[3];
  _QWORD v162[3];
  _QWORD v163[3];
  _QWORD v164[3];
  _QWORD v165[3];
  _QWORD v166[3];
  _QWORD v167[2];
  uint64_t v168;
  _QWORD v169[2];
  _QWORD v170[2];
  uint64_t v171;
  CFTypeRef v172;
  _QWORD v173[19];
  _QWORD v174[21];

  v174[19] = *MEMORY[0x1E0C80C00];
  v173[0] = CFSTR("inputColorSpace");
  v171 = *MEMORY[0x1E0C9DE10];
  v2 = v171;
  v172 = sub_1D543E884();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v3, (uint64_t)&v172, (uint64_t)&v171, 1);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v174[0] = v135;
  v173[1] = CFSTR("inputNeutral");
  v169[0] = *MEMORY[0x1E0C9DE08];
  v4 = v169[0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v170[0] = v134;
  v169[1] = v2;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v6, v7, v8, v9);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v170[1] = v133;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v170, (uint64_t)v169, 2);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v174[1] = v132;
  v173[2] = CFSTR("inputRange");
  v166[0] = v4;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v167[0] = v130;
  v167[1] = &unk_1E99CC508;
  v12 = *MEMORY[0x1E0C9DE68];
  v166[1] = v2;
  v166[2] = v12;
  v168 = *MEMORY[0x1E0C9DED0];
  v13 = v168;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v167, (uint64_t)v166, 3);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v174[2] = v131;
  v173[3] = CFSTR("inputFactor");
  v164[0] = v4;
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v165[0] = v128;
  v165[1] = &unk_1E99CC508;
  v164[1] = v2;
  v164[2] = v12;
  v165[2] = v13;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v165, (uint64_t)v164, 3);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v174[3] = v129;
  v173[4] = CFSTR("inputCalibrationIlluminant1");
  v162[0] = v4;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v126;
  v163[1] = v13;
  v162[1] = v12;
  v162[2] = v2;
  v163[2] = &unk_1E99CBFE8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v163, (uint64_t)v162, 3);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v174[4] = v127;
  v173[5] = CFSTR("inputCalibrationIlluminant2");
  v160[0] = v4;
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v161[0] = v124;
  v161[1] = v13;
  v160[1] = v12;
  v160[2] = v2;
  v161[2] = &unk_1E99CC000;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v161, (uint64_t)v160, 3);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v174[5] = v125;
  v173[6] = CFSTR("inputXYZtoCamera1");
  v158[0] = v4;
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v159[0] = v121;
  v158[1] = v2;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v22, v23, v24, v25);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v159[1] = v122;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v26, (uint64_t)v159, (uint64_t)v158, 2);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v174[6] = v123;
  v173[7] = CFSTR("inputXYZtoCamera2");
  v156[0] = v4;
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = v118;
  v156[1] = v2;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v28, v29, v30, v31);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v157[1] = v119;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)v157, (uint64_t)v156, 2);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v174[7] = v120;
  v173[8] = CFSTR("inputCameraCalibration1");
  v154[0] = v4;
  v33 = (objc_class *)objc_opt_class();
  NSStringFromClass(v33);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v155[0] = v115;
  v154[1] = v2;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v34, v35, v36, v37);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v155[1] = v116;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v38, (uint64_t)v155, (uint64_t)v154, 2);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v174[8] = v117;
  v173[9] = CFSTR("inputCameraCalibration2");
  v152[0] = v4;
  v39 = (objc_class *)objc_opt_class();
  NSStringFromClass(v39);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v112;
  v152[1] = v2;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v40, v41, v42, v43);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v153[1] = v113;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v44, (uint64_t)v153, (uint64_t)v152, 2);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v174[9] = v114;
  v173[10] = CFSTR("inputReduction1");
  v150[0] = v4;
  v45 = (objc_class *)objc_opt_class();
  NSStringFromClass(v45);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v109;
  v150[1] = v2;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v46, v47, v48, v49);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v151[1] = v110;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v50, (uint64_t)v151, (uint64_t)v150, 2);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v174[10] = v111;
  v173[11] = CFSTR("inputReduction2");
  v148[0] = v4;
  v51 = (objc_class *)objc_opt_class();
  NSStringFromClass(v51);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v106;
  v148[1] = v2;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v52, v53, v54, v55);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v149[1] = v107;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v56, (uint64_t)v149, (uint64_t)v148, 2);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v174[11] = v108;
  v173[12] = CFSTR("inputForwardMatrix1");
  v146[0] = v4;
  v57 = (objc_class *)objc_opt_class();
  NSStringFromClass(v57);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v2;
  v147[0] = v103;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v58, v59, v60, v61);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v104;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v62, (uint64_t)v147, (uint64_t)v146, 2);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v174[12] = v105;
  v173[13] = CFSTR("inputForwardMatrix2");
  v144[0] = v4;
  v63 = (objc_class *)objc_opt_class();
  NSStringFromClass(v63);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v2;
  v145[0] = v100;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v64, v65, v66, v67);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v101;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v68, (uint64_t)v145, (uint64_t)v144, 2);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v174[13] = v102;
  v173[14] = CFSTR("inputShouldUseForwardMatrix");
  v142[0] = v4;
  v69 = (objc_class *)objc_opt_class();
  NSStringFromClass(v69);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v2;
  v143[0] = v99;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v143[1] = v74;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v75, (uint64_t)v143, (uint64_t)v142, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v174[14] = v76;
  v173[15] = CFSTR("inputShouldRecoverHighlights");
  v140[0] = v4;
  v77 = (objc_class *)objc_opt_class();
  NSStringFromClass(v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v140[1] = v2;
  v79 = MEMORY[0x1E0C9AAA0];
  v141[0] = v78;
  v141[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v80, (uint64_t)v141, (uint64_t)v140, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v174[15] = v81;
  v173[16] = CFSTR("inputShouldLinearize");
  v138[0] = v4;
  v82 = (objc_class *)objc_opt_class();
  NSStringFromClass(v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = v83;
  v139[1] = v79;
  v84 = *MEMORY[0x1E0C9DE18];
  v138[1] = v2;
  v138[2] = v84;
  v139[2] = CFSTR("ShouldLinearize");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v85, (uint64_t)v139, (uint64_t)v138, 3);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v174[16] = v86;
  v174[17] = v79;
  v173[17] = CFSTR("kCIRAWFilterDoesClip");
  v173[18] = CFSTR("inputBlacks");
  v136[0] = v4;
  v87 = (objc_class *)objc_opt_class();
  NSStringFromClass(v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v136[1] = v2;
  v137[0] = v88;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v89, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v93;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v94, (uint64_t)v137, (uint64_t)v136, 2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v174[18] = v95;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v96, (uint64_t)v174, (uint64_t)v173, 19);
  v98 = (id)objc_claimAutoreleasedReturnValue();

  return v98;
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

- (CMatrix)matrixFromArray:(SEL)a3 rowCount:(id)a4 columnCount:(unint64_t)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CMatrix *result;
  _QWORD v34[2];

  v9 = a4;
  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v14 = objc_msgSend_count(v9, v10, v11, v12, v13), a6 <= 0xA)
    && a5 <= 0xA
    && v14)
  {
    sub_1D5338D3C((uint64_t)retstr, a5, a6);
    if (a5)
    {
      v19 = 0;
      v20 = 0;
      while (!a6)
      {
LABEL_14:
        ++v20;
        v19 += a6;
        if (v20 == a5)
          goto LABEL_17;
      }
      v21 = 0;
      while (v19 + v21 < (unint64_t)objc_msgSend_count(v9, v15, v16, v17, v18))
      {
        objc_msgSend_objectAtIndexedSubscript_(v9, v22, v19 + v21, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_doubleValue(v25, v26, v27, v28, v29);
          v31 = v30;
          v34[0] = sub_1D5339044((uint64_t)retstr, v20);
          v34[1] = v32;
          *(_QWORD *)sub_1D53390D4((uint64_t)v34, v21) = v31;
        }

        if (++v21 >= a6)
          goto LABEL_14;
      }
    }
  }
  else
  {
    sub_1D5339168(retstr);
  }
LABEL_17:

  return result;
}

- (id)inputNeutralXY
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[35];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_cameraProfile(self, a2, v2, v3, v4);
  objc_msgSend_neutralWhitePointWithProfile_(self, v6, (uint64_t)v25, v7, v8);
  v10 = v9;
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v16, v17, v18, v19, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v26, 2, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  sub_1D532D710(v25);
  return v23;
}

- (id)outputMatrix
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeRef v16;
  CGColorSpace *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  void *v37;
  uint64_t v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  double *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  double *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  uint64_t v86;
  void *v87;
  void *v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  double v94[2];
  _QWORD v95[35];
  _QWORD v96[4];
  _QWORD v97[4];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  CGFloat matrix;
  __int128 v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  CGFloat blackPoint;
  uint64_t v118;
  uint64_t v119;
  CGFloat whitePoint[4];
  CGFloat gamma[4];

  gamma[3] = *(CGFloat *)MEMORY[0x1E0C80C00];
  objc_msgSend_cameraProfile(self, a2, v2, v3, v4);
  objc_msgSend_neutralWhitePointWithProfile_(self, v6, (uint64_t)v95, v7, v8);
  v94[0] = v9;
  v94[1] = v10;
  sub_1D5338D40((uint64_t)&v91, 3u, 3u, 0.6097, v11, v12, v13, v14, v15, 0x3FCA474538EF34D7);
  v16 = self->inputColorSpace;
  if (v16 != sub_1D543E884())
  {
    gamma[2] = 1.0;
    *(_OWORD *)gamma = xmmword_1D544F2B0;
    *(_OWORD *)whitePoint = xmmword_1D544F2C8;
    whitePoint[2] = 0.824899971;
    blackPoint = 0.0;
    v118 = 0;
    v119 = 0;
    v112 = 0;
    v114 = 0u;
    v111 = 0u;
    matrix = 1.0;
    v113 = 0x3FF0000000000000;
    v115 = 0;
    v116 = 0x3FF0000000000000;
    v105 = 0;
    v107 = 0u;
    v104 = 0u;
    v103 = 0x3FF0000000000000;
    v106 = 0x3FF0000000000000;
    v108 = 0;
    v109 = 0x3FF0000000000000;
    v102 = 0;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v17 = CGColorSpaceCreateCalibratedRGB(whitePoint, &blackPoint, gamma, &matrix);
    MEMORY[0x1D827150C](v17, 0);
    CGColorTransformConvertColorComponents();
    CGColorTransformConvertColorComponents();
    CGColorTransformConvertColorComponents();
    CGColorSpaceRelease(v17);
    CGColorTransformRelease();
    sub_1D5338D40((uint64_t)&v89, 3u, 3u, *(double *)&v98 * 0.9642, v18, v19, v20, v21, v22, COERCE__INT64(*((double *)&v99 + 1) * 0.9642));
    sub_1D53393A8(&v91, (uint64_t)&v89);
    if (*((_QWORD *)&v89 + 1))
    {
      v90 = *((_QWORD *)&v89 + 1);
      operator delete(*((void **)&v89 + 1));
    }
  }
  sub_1D5338BF8(&v86, (uint64_t)&v91);
  sub_1D536D624((uint64_t)v95, v94, (unsigned int *)&v86, &matrix);
  if (v87)
  {
    v88 = v87;
    operator delete(v87);
  }
  sub_1D5338D40((uint64_t)&v103, 3u, 1u, 1.0, v23, v24, v25, v26, v27, 0x3FF0000000000000);
  sub_1D5339A4C((unsigned int *)&matrix, &v89);
  sub_1D5339674((unsigned int *)&v89, &v103, (uint64_t)&v98);
  if (*((_QWORD *)&v89 + 1))
  {
    v90 = *((_QWORD *)&v89 + 1);
    operator delete(*((void **)&v89 + 1));
  }
  v28 = sub_1D533A1F0((unsigned int *)&v98);
  *(_QWORD *)&v89 = sub_1D5339044((uint64_t)&v98, 0);
  *((_QWORD *)&v89 + 1) = v29;
  v30 = *(double *)sub_1D53390D4((uint64_t)&v89, 0);
  v31 = sub_1D533A1F0((unsigned int *)&v98);
  *(_QWORD *)&v89 = sub_1D5339044((uint64_t)&v98, 1u);
  *((_QWORD *)&v89 + 1) = v32;
  v33 = *(double *)sub_1D53390D4((uint64_t)&v89, 0);
  v34 = sub_1D533A1F0((unsigned int *)&v98);
  *(_QWORD *)&v89 = sub_1D5339044((uint64_t)&v98, 2u);
  *((_QWORD *)&v89 + 1) = v35;
  v36 = *(double *)sub_1D53390D4((uint64_t)&v89, 0);
  v96[0] = CFSTR("inputRVector");
  v37 = (void *)MEMORY[0x1E0C9DDF8];
  *(_QWORD *)&v89 = sub_1D5339044((uint64_t)&matrix, 0);
  *((_QWORD *)&v89 + 1) = v38;
  v39 = *(double *)sub_1D53390D4((uint64_t)&v89, 0);
  *(_QWORD *)&gamma[0] = sub_1D5339044((uint64_t)&matrix, 0);
  gamma[1] = v40;
  v41 = *(double *)sub_1D53390D4((uint64_t)gamma, 1u);
  *(_QWORD *)&whitePoint[0] = sub_1D5339044((uint64_t)&matrix, 0);
  whitePoint[1] = v42;
  v43 = (double *)sub_1D53390D4((uint64_t)whitePoint, 2u);
  objc_msgSend_vectorWithX_Y_Z_(v37, v44, v45, v46, v47, v39, v41, *v43);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v48;
  v96[1] = CFSTR("inputGVector");
  v49 = (void *)MEMORY[0x1E0C9DDF8];
  *(_QWORD *)&blackPoint = sub_1D5339044((uint64_t)&matrix, 1u);
  v118 = v50;
  v51 = *(double *)sub_1D53390D4((uint64_t)&blackPoint, 0);
  v85[0] = sub_1D5339044((uint64_t)&matrix, 1u);
  v85[1] = v52;
  v53 = *(double *)sub_1D53390D4((uint64_t)v85, 1u);
  v84[0] = sub_1D5339044((uint64_t)&matrix, 1u);
  v84[1] = v54;
  v55 = (double *)sub_1D53390D4((uint64_t)v84, 2u);
  objc_msgSend_vectorWithX_Y_Z_(v49, v56, v57, v58, v59, v51, v53, *v55);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v60;
  v96[2] = CFSTR("inputBVector");
  v61 = (void *)MEMORY[0x1E0C9DDF8];
  v83[0] = sub_1D5339044((uint64_t)&matrix, 2u);
  v83[1] = v62;
  v63 = *(double *)sub_1D53390D4((uint64_t)v83, 0);
  v82[0] = sub_1D5339044((uint64_t)&matrix, 2u);
  v82[1] = v64;
  v65 = *(double *)sub_1D53390D4((uint64_t)v82, 1u);
  v81[0] = sub_1D5339044((uint64_t)&matrix, 2u);
  v81[1] = v66;
  v67 = (double *)sub_1D53390D4((uint64_t)v81, 2u);
  objc_msgSend_vectorWithX_Y_Z_(v61, v68, v69, v70, v71, v63, v65, *v67);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v72;
  v96[3] = CFSTR("inputFactors");
  objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v73, v74, v75, v76, v28 / v30, v31 / v33, v34 / v36);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v77;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v78, (uint64_t)v97, (uint64_t)v96, 4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (*((_QWORD *)&v98 + 1))
  {
    *(_QWORD *)&v99 = *((_QWORD *)&v98 + 1);
    operator delete(*((void **)&v98 + 1));
  }
  if ((_QWORD)v104)
  {
    *((_QWORD *)&v104 + 1) = v104;
    operator delete((void *)v104);
  }
  if ((_QWORD)v111)
  {
    *((_QWORD *)&v111 + 1) = v111;
    operator delete((void *)v111);
  }
  if (v92)
  {
    v93 = v92;
    operator delete(v92);
  }
  sub_1D532D710(v95);
  return v79;
}

- (id)blendFactor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v18[2];
  _QWORD v19[35];

  objc_msgSend_cameraProfile(self, a2, v2, v3, v4);
  objc_msgSend_neutralWhitePointWithProfile_(self, v6, (uint64_t)v19, v7, v8);
  v18[0] = v9;
  v18[1] = v10;
  v11 = sub_1D536E61C((uint64_t)v19, v18);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v12, v13, v14, v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1D532D710(v19);
  return v16;
}

- (id)outputImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  CIImage *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  CIVector *inputBlacks;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CIVector *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  _BOOL4 v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  float v66;
  int v67;
  CIVector *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  CIImage *v73;
  void *v74;
  CIVector *v75;
  float v76;
  float v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  float v82;
  float v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  float v88;
  float v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  double v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  double v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  float v141;
  float v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  double v147;
  double v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  double v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  float v169;
  float v170;
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
  double v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  double v194;
  double v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  double v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  float v210;
  float v211;
  double v212;
  float v213;
  float v214;
  float v215;
  float v216;
  double v217;
  double v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  double v223;
  double v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  float v229;
  float v230;
  double v231;
  float v232;
  float v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  void *exception;
  void (**v261)(_QWORD);
  uint64_t v262;
  void *v263;
  _QWORD v264[5];
  uint8_t buf[8];
  _QWORD v266[5];

  v266[3] = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    objc_msgSend_outputMatrix(self, a2, v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v263 = (void *)v6;
      sub_1D52EB19C();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D527F000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWConvert", (const char *)&unk_1D548AF1A, buf, 2u);
      }

      v264[0] = MEMORY[0x1E0C809B0];
      v264[1] = 3221225472;
      v264[2] = sub_1D53F1144;
      v264[3] = &unk_1E996F870;
      v264[4] = self;
      v261 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v264);
      v10 = self->inputImage;
      v262 = sub_1D543E528(v10);
      if (objc_msgSend_BOOLValue(self->inputShouldLinearize, v11, v12, v13, v14))
      {
        objc_msgSend_kernelWithName_(RAWKernels, v15, (uint64_t)CFSTR("raw_srgb_to_linear"), v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v20, (uint64_t)v19, (uint64_t)v10, 0, v262, 1);
        v21 = objc_claimAutoreleasedReturnValue();

        v10 = (CIImage *)v21;
      }
      inputBlacks = self->inputBlacks;
      objc_msgSend_null(MEMORY[0x1E0C99E38], v15, v16, v17, v18);
      v27 = (CIVector *)objc_claimAutoreleasedReturnValue();
      if (inputBlacks == v27
        || (objc_msgSend_X(self->inputBlacks, v23, v24, v25, v26), v32 == 0.0)
        || (objc_msgSend_Y(self->inputBlacks, v28, v29, v30, v31), v37 == 0.0))
      {
        v39 = 0;
      }
      else
      {
        objc_msgSend_Z(self->inputBlacks, v33, v34, v35, v36);
        v39 = v38 != 0.0;
      }

      v44 = objc_msgSend_intValue(self->inputTargetRange, v40, v41, v42, v43);
      v49 = objc_msgSend_intValue(self->inputRange, v45, v46, v47, v48);
      if ((int)objc_msgSend_intValue(self->inputTargetRange, v50, v51, v52, v53) <= 0
        || (int)objc_msgSend_intValue(self->inputRange, v54, v55, v56, v57) <= 0
        || (objc_msgSend_floatValue(self->inputFactor, v58, v59, v60, v61), v66 <= 0.0))
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1D8271938](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
      }
      v67 = v44 != v49 || v39;
      if (v67 == 1)
      {
        if (v39)
        {
          v68 = self->inputBlacks;
        }
        else
        {
          objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v62, v63, v64, v65, 0.0, 0.0, 0.0, 0.0);
          v68 = (CIVector *)objc_claimAutoreleasedReturnValue();
        }
        v75 = v68;
        objc_msgSend_floatValue(self->inputTargetRange, v69, v70, v71, v72);
        v77 = v76;
        objc_msgSend_floatValue(self->inputRange, v78, v79, v80, v81);
        v83 = v82;
        objc_msgSend_floatValue(self->inputFactor, v84, v85, v86, v87);
        v89 = v88;
        v90 = (void *)MEMORY[0x1E0C9DDF8];
        objc_msgSend_X(v75, v91, v92, v93, v94);
        v96 = v95;
        objc_msgSend_Y(v75, v97, v98, v99, v100);
        v102 = v101;
        objc_msgSend_Z(v75, v103, v104, v105, v106);
        v107 = (float)(v77 / (float)(v83 * v89));
        objc_msgSend_vectorWithX_Y_Z_W_(v90, v109, v110, v111, v112, v107 * v96 / -65535.0, -(v102 * v107) / 65535.0, -(v108 * v107) / 65535.0, 0.0);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v114, v115, v116, v117, v107, 0.0, 0.0, 0.0);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v119, v120, v121, v122, 0.0, v107, 0.0, 0.0);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v124, v125, v126, v127, 0.0, 0.0, v107, 0.0);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyMatrixToImage_vectorR_vectorG_vectorB_vectorBias_inSpace_outSpace_(self, v129, (uint64_t)v10, (uint64_t)v118, (uint64_t)v123, v128, v113, v262);
        v130 = objc_claimAutoreleasedReturnValue();

        v131 = (void *)MEMORY[0x1E0C9DDF8];
        objc_msgSend_floatValue(self->inputRange, v132, v133, v134, v135);
        LODWORD(v107) = v136;
        objc_msgSend_floatValue(self->inputRange, v137, v138, v139, v140);
        v142 = v141;
        objc_msgSend_X(v75, v143, v144, v145, v146);
        v148 = v147;
        objc_msgSend_floatValue(self->inputRange, v149, v150, v151, v152);
        LODWORD(v96) = v153;
        objc_msgSend_floatValue(self->inputRange, v154, v155, v156, v157);
        LODWORD(v102) = v158;
        objc_msgSend_Y(v75, v159, v160, v161, v162);
        v164 = v163;
        objc_msgSend_floatValue(self->inputRange, v165, v166, v167, v168);
        v170 = v169;
        objc_msgSend_floatValue(self->inputRange, v171, v172, v173, v174);
        v176 = v175;
        objc_msgSend_Z(v75, v177, v178, v179, v180);
        objc_msgSend_vectorWithX_Y_Z_W_(v131, v182, v183, v184, v185, *(float *)&v107 / (v148 + v142), *(float *)&v96 / (v164 + *(float *)&v102), v170 / (v181 + v176), 0.0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (CIImage *)v130;
      }
      else
      {
        v74 = 0;
      }
      if (objc_msgSend_BOOLValue(self->inputShouldRecoverHighlights, v62, v63, v64, v65))
      {
        objc_msgSend_objectForKeyedSubscript_(v263, v186, (uint64_t)CFSTR("inputFactors"), v187, v188);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_X(v189, v190, v191, v192, v193);
        v195 = v194;
        objc_msgSend_Y(v189, v196, v197, v198, v199);
        v201 = v200;
        objc_msgSend_Z(v189, v202, v203, v204, v205);
        v210 = v195;
        v211 = v201;
        v213 = v212;
        v214 = v210;
        v215 = v211;
        v216 = v213;
        if (v74)
        {
          objc_msgSend_X(v74, v206, v207, v208, v209);
          v218 = v217;
          objc_msgSend_Y(v74, v219, v220, v221, v222);
          v224 = v223;
          objc_msgSend_Z(v74, v225, v226, v227, v228);
          v229 = v218;
          v214 = v210 * v229;
          v230 = v224;
          v215 = v211 * v230;
          *(float *)&v231 = v231;
          v216 = v213 * *(float *)&v231;
        }
        v232 = v215 * 0.9;
        if ((float)(v215 * 0.9) > v214)
          v232 = v214;
        if (v232 <= v216)
          v233 = v232;
        else
          v233 = v216;
        objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v206, v207, v208, v209, v214, v233, v216);
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v235, v236, v237, v238, 1.0 / v210, 1.0 / v211, 1.0 / v213);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_kernelWithName_(RAWKernels, v240, (uint64_t)CFSTR("RAWRecoverHighlightsV2"), v241, v242);
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        v266[0] = v189;
        v266[1] = v234;
        v266[2] = v239;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v244, (uint64_t)v266, 3, v245);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v247, (uint64_t)v243, (uint64_t)v10, (uint64_t)v246, v262, 1);
        v248 = objc_claimAutoreleasedReturnValue();

        v10 = (CIImage *)v248;
      }
      objc_msgSend_objectForKeyedSubscript_(v263, v186, (uint64_t)CFSTR("inputRVector"), v187, v188);
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v263, v250, (uint64_t)CFSTR("inputGVector"), v251, v252);
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v263, v254, (uint64_t)CFSTR("inputBVector"), v255, v256);
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyMatrixToImage_vectorR_vectorG_vectorB_vectorBias_inSpace_outSpace_(self, v258, (uint64_t)v10, (uint64_t)v249, (uint64_t)v253, v257, 0, v262, self->inputColorSpace);
      v73 = (CIImage *)objc_claimAutoreleasedReturnValue();

      v261[2](v261);
      v7 = v263;
    }
    else
    {
      v73 = self->inputImage;
    }

  }
  else
  {
    v73 = 0;
  }
  return v73;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputTargetRange, 0);
  objc_storeStrong((id *)&self->inputBlacks, 0);
  objc_storeStrong((id *)&self->inputShouldLinearize, 0);
  objc_storeStrong((id *)&self->inputShouldRecoverHighlights, 0);
  objc_storeStrong((id *)&self->inputShouldUseForwardMatrix, 0);
  objc_storeStrong((id *)&self->inputForwardMatrix2, 0);
  objc_storeStrong((id *)&self->inputForwardMatrix1, 0);
  objc_storeStrong((id *)&self->inputReduction2, 0);
  objc_storeStrong((id *)&self->inputReduction1, 0);
  objc_storeStrong((id *)&self->inputCameraCalibration2, 0);
  objc_storeStrong((id *)&self->inputCameraCalibration1, 0);
  objc_storeStrong((id *)&self->inputXYZtoCamera2, 0);
  objc_storeStrong((id *)&self->inputXYZtoCamera1, 0);
  objc_storeStrong((id *)&self->inputCalibrationIlluminant2, 0);
  objc_storeStrong((id *)&self->inputCalibrationIlluminant1, 0);
  objc_storeStrong((id *)&self->inputFactor, 0);
  objc_storeStrong((id *)&self->inputRange, 0);
  objc_storeStrong((id *)&self->inputNeutral, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

- (CCameraProfile)cameraProfile
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v32[8];
  void *__p;
  void *v34;
  uint64_t v35;
  int v36;
  int v37;
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[4];
  __int16 v44;
  _QWORD v45[4];
  _QWORD v46[4];

  sub_1D5367248((uint64_t)&v35);
  v9 = objc_msgSend_count(self->inputXYZtoCamera1, v5, v6, v7, v8);
  v36 = objc_msgSend_intValue(self->inputCalibrationIlluminant1, v10, v11, v12, v13);
  v18 = v9 / 3;
  v37 = objc_msgSend_intValue(self->inputCalibrationIlluminant2, v14, v15, v16, v17);
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v19, (uint64_t)self->inputXYZtoCamera1, v18, 3);
  sub_1D53393A8(v38, (uint64_t)v32);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v20, (uint64_t)self->inputXYZtoCamera2, v18, 3);
  sub_1D53393A8(v39, (uint64_t)v32);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v21, (uint64_t)self->inputCameraCalibration1, v18, v18);
  sub_1D53393A8(v40, (uint64_t)v32);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v22, (uint64_t)self->inputCameraCalibration2, v18, v18);
  sub_1D53393A8(v41, (uint64_t)v32);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v23, (uint64_t)self->inputReduction1, 3, v18);
  sub_1D53393A8(v45, (uint64_t)v32);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v24, (uint64_t)self->inputReduction2, 3, v18);
  sub_1D53393A8(v46, (uint64_t)v32);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v25, (uint64_t)self->inputForwardMatrix1, 3, v18);
  sub_1D53393A8(v42, (uint64_t)v32);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v26, (uint64_t)self->inputForwardMatrix2, 3, v18);
  sub_1D53393A8(v43, (uint64_t)v32);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  v44 = objc_msgSend_intValue(self->inputShouldUseForwardMatrix, v27, v28, v29, v30);
  sub_1D53F1A68((uint64_t)retstr, (uint64_t)&v35);
  return (CCameraProfile *)sub_1D532D710(&v35);
}

- (CWhitePoint)neutralWhitePointWithProfile:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  BOOL v39;
  double v40;
  double v41;
  double *v42;
  uint64_t v43;
  unint64_t v44;
  double *v45;
  double *v46;
  double *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  double *v53;
  uint64_t v54;
  double *v55;
  double *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  double *v62;
  char *v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  void *__p;
  double *v69;
  unint64_t v70;
  double v71;
  double v72;
  CWhitePoint result;

  v71 = 0.0;
  v72 = 0.0;
  v10 = objc_msgSend_count(self->inputNeutral, a2, (uint64_t)a3, v3, v4);
  v11 = 0.0;
  if (v10)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->inputNeutral, v7, 0, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v12, v13, v14, v15, v16);
    v18 = v17;

    if (v10 < 2)
    {
      v28 = 0.0;
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(self->inputNeutral, v19, 1, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v22, v23, v24, v25, v26);
      v28 = v27;

      if (v10 >= 3)
      {
        objc_msgSend_objectAtIndexedSubscript_(self->inputNeutral, v29, 2, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v32, v33, v34, v35, v36);
        v11 = v37;

      }
    }
  }
  else
  {
    v28 = 0.0;
    v18 = 0.0;
  }
  if (v10 == 2 && v18 < 1.0)
  {
    v39 = v18 > 0.0 && v28 < 1.0;
    if (v39 && v28 > 0.0)
    {
      v40 = v18;
      v41 = v28;
      goto LABEL_63;
    }
  }
  if (v10 == 2 && v18 >= 2000.0 && v18 <= 50000.0)
  {
    sub_1D536C570(&v71, v18, v28);
    v40 = v71;
    v41 = v72;
    goto LABEL_63;
  }
  v40 = 0.0;
  if (v10 != 3 || v18 <= 0.0 || v28 <= 0.0)
  {
    v41 = 0.0;
    goto LABEL_63;
  }
  v41 = 0.0;
  if (v11 > 0.0)
  {
    v70 = 0;
    v42 = (double *)sub_1D5282D28((uint64_t)&v70, 1uLL);
    v44 = (unint64_t)&v42[v43];
    *v42 = v18;
    v45 = v42 + 1;
    __p = v42;
    v70 = v44;
    v69 = v42 + 1;
    if ((unint64_t)(v42 + 1) >= v44)
    {
      v47 = (double *)__p;
      v48 = ((char *)v45 - (_BYTE *)__p) >> 3;
      v49 = v48 + 1;
      if ((unint64_t)(v48 + 1) >> 61)
        goto LABEL_61;
      v50 = v44 - (_QWORD)__p;
      if (v50 >> 2 > v49)
        v49 = v50 >> 2;
      if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8)
        v51 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v51 = v49;
      if (v51)
      {
        v52 = (char *)sub_1D5282D28((uint64_t)&v70, v51);
        v47 = (double *)__p;
        v45 = v69;
      }
      else
      {
        v52 = 0;
      }
      v53 = (double *)&v52[8 * v48];
      v44 = (unint64_t)&v52[8 * v51];
      *v53 = v28;
      v46 = v53 + 1;
      while (v45 != v47)
      {
        v54 = *((_QWORD *)v45-- - 1);
        *((_QWORD *)v53-- - 1) = v54;
      }
      __p = v53;
      v69 = v46;
      v70 = v44;
      if (v47)
      {
        operator delete(v47);
        v44 = v70;
      }
    }
    else
    {
      v42[1] = v28;
      v46 = v42 + 2;
    }
    v69 = v46;
    if ((unint64_t)v46 < v44)
    {
      *v46 = v11;
      v55 = v46 + 1;
LABEL_59:
      v69 = v55;
      v40 = sub_1D536EA4C((unsigned int *)a3, (uint64_t *)&__p);
      v41 = v65;
      if (__p)
      {
        v69 = (double *)__p;
        operator delete(__p);
      }
      goto LABEL_63;
    }
    v56 = (double *)__p;
    v57 = ((char *)v46 - (_BYTE *)__p) >> 3;
    v58 = v57 + 1;
    if (!((unint64_t)(v57 + 1) >> 61))
    {
      v59 = v44 - (_QWORD)__p;
      if (v59 >> 2 > v58)
        v58 = v59 >> 2;
      if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF8)
        v60 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v60 = v58;
      if (v60)
      {
        v61 = (char *)sub_1D5282D28((uint64_t)&v70, v60);
        v56 = (double *)__p;
        v46 = v69;
      }
      else
      {
        v61 = 0;
      }
      v62 = (double *)&v61[8 * v57];
      v63 = &v61[8 * v60];
      *v62 = v11;
      v55 = v62 + 1;
      while (v46 != v56)
      {
        v64 = *((_QWORD *)v46-- - 1);
        *((_QWORD *)v62-- - 1) = v64;
      }
      __p = v62;
      v69 = v55;
      v70 = (unint64_t)v63;
      if (v56)
        operator delete(v56);
      goto LABEL_59;
    }
LABEL_61:
    sub_1D5282B8C();
  }
LABEL_63:
  v66 = v40;
  v67 = v41;
  result.var1 = v67;
  result.var0 = v66;
  return result;
}

@end
