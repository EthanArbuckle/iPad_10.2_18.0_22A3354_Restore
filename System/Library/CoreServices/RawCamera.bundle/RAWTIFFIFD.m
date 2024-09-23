@implementation RAWTIFFIFD

- (RAWTIFFIFD)initWithNamespace:(id)a3 reverseNamespace:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  RAWTIFFIFD *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)RAWTIFFIFD;
  v12 = -[RAWTIFFIFD init](&v32, sel_init);
  if (v12)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMTagsByID_(v12, v14, (uint64_t)v13, v15, v16);

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMTagsByName_(v12, v22, (uint64_t)v21, v23, v24);

    objc_msgSend_setMNamespace_(v12, v25, (uint64_t)v6, v26, v27);
    objc_msgSend_setMNamespaceReverse_(v12, v28, (uint64_t)v7, v29, v30);
  }

  return v12;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSMutableDictionary *mTagsByID;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  mTagsByID = self->mTagsByID;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(mTagsByID, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
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
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  id v42;

  v42 = a3;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v6, a4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mTagsByID(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v42, (uint64_t)v9, v16);

  objc_msgSend_mNamespace(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v9, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)CFSTR("Name"), v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_mTagsByName(self, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v29, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v40, (uint64_t)v42, (uint64_t)v39, v41);

  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void (**v44)(_QWORD);
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void (**v56)(_QWORD);
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void (**v100)(_QWORD);
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void (**v177)(_QWORD);
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  void (**v210)(_QWORD);
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  void (**v265)(_QWORD);
  uint64_t v266;
  void *v268;
  void *v269;

  v7 = a3;
  v8 = atomic_load((unsigned __int8 *)&qword_1EFF32620);
  if ((v8 & 1) == 0 && __cxa_guard_acquire(&qword_1EFF32620))
  {
    objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E0CB38E8], v4, (uint64_t)CFSTR("([[:digit:]]+(?:%[[:digit:]]+)?\\[[[:digit:]]+\\])|([[:digit:]]+(?:%[[:digit:]]+)?)|([[:alpha:]][[:alnum:]]*(?:%[[:digit:]]+)?\\[[[:digit:]]\\])|([[:alpha:]][[:alnum:]]*(?:%[[:digit:]]+)?)"), 1, 0);
    qword_1EFF32618 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EFF32620);
  }
  v9 = atomic_load((unsigned __int8 *)&qword_1EFF32630);
  if ((v9 & 1) == 0 && __cxa_guard_acquire(&qword_1EFF32630))
  {
    objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E0CB38E8], v4, (uint64_t)CFSTR("([[:alnum:]]+)\\[([[:digit:]]+)\\]"), 1, 0);
    qword_1EFF32628 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EFF32630);
  }
  v10 = atomic_load((unsigned __int8 *)&qword_1EFF32640);
  if ((v10 & 1) == 0 && __cxa_guard_acquire(&qword_1EFF32640))
  {
    qword_1EFF32638 = (uint64_t)NSClassFromString(CFSTR("NSBlock"));
    __cxa_guard_release(&qword_1EFF32640);
  }
  objc_msgSend_componentsSeparatedByString_(v7, v4, (uint64_t)CFSTR("."), v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)qword_1EFF32618;
  v22 = objc_msgSend_length(v16, v18, v19, v20, v21);
  objc_msgSend_firstMatchInString_options_range_(v17, v23, (uint64_t)v16, 0, 0, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_numberOfRanges(v24, v25, v26, v27, v28) != 5)
    goto LABEL_9;
  if (!objc_msgSend_rangeAtIndex_(v24, v29, 1, v30, v31))
  {
    v45 = objc_msgSend_rangeAtIndex_(v24, v32, 1, v33, v34);
    objc_msgSend_substringWithRange_(v16, v46, v45, (uint64_t)v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)qword_1EFF32628;
    v54 = objc_msgSend_length(v48, v50, v51, v52, v53);
    objc_msgSend_firstMatchInString_options_range_(v49, v55, (uint64_t)v48, 0, 0, v54);
    v56 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_numberOfRanges(v56, v57, v58, v59, v60) == 3)
    {
      v64 = objc_msgSend_rangeAtIndex_(v56, v61, 1, v62, v63);
      objc_msgSend_substringWithRange_(v48, v65, v64, (uint64_t)v65, v66);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend_rangeAtIndex_(v56, v67, 2, v68, v69);
      objc_msgSend_substringWithRange_(v48, v71, v70, (uint64_t)v71, v72);
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mTagsByID(self, v73, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)MEMORY[0x1E0CB37E8];
      v83 = objc_msgSend_integerValue(v268, v79, v80, v81, v82);
      objc_msgSend_numberWithInteger_(v78, v84, v83, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v77, v88, (uint64_t)v87, v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      v96 = objc_msgSend_integerValue(v269, v92, v93, v94, v95);
      objc_msgSend_objectAtIndexedSubscript_(v91, v97, v96, v98, v99);
      v100 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_28:

        v135 = v268;
        goto LABEL_29;
      }
LABEL_27:
      v100[2](v100);
      v238 = objc_claimAutoreleasedReturnValue();

      v243 = objc_msgSend_integerValue(v269, v239, v240, v241, v242);
      objc_msgSend_setObject_atIndexedSubscript_(v91, v244, v238, v243, v245);
      v100 = (void (**)(_QWORD))v238;
      goto LABEL_28;
    }
LABEL_18:
    v44 = 0;
    goto LABEL_30;
  }
  if (objc_msgSend_rangeAtIndex_(v24, v32, 2, v33, v34))
  {
    if (objc_msgSend_rangeAtIndex_(v24, v35, 3, v36, v37))
    {
      if (objc_msgSend_rangeAtIndex_(v24, v38, 4, v39, v40))
      {
LABEL_9:
        v44 = 0;
        goto LABEL_32;
      }
      v194 = objc_msgSend_rangeAtIndex_(v24, v41, 4, v42, v43);
      objc_msgSend_substringWithRange_(v16, v195, v194, (uint64_t)v195, v196);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mTagsByName(self, v197, v198, v199, v200);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v48, v202, v203, v204, v205);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v201, v207, (uint64_t)v206, v208, v209);
      v210 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v210[2](v210);
        v100 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

        objc_msgSend_mTagsByName(self, v211, v212, v213, v214);
        v56 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v48, v215, v216, v217, v218);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v56, v219, (uint64_t)v100, (uint64_t)v135, v220);
        goto LABEL_29;
      }
      v56 = v210;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v56, v221, v222, v223, v224) != 1)
      {
        v44 = v56;
        goto LABEL_30;
      }
      objc_msgSend_firstObject(v56, v225, v226, v227, v228);
      v44 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99DE8], v229, (uint64_t)v56, v230, v231);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v44[2](v44);
        v100 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

        objc_msgSend_setObject_atIndexedSubscript_(v135, v232, (uint64_t)v100, 0, v233);
        goto LABEL_29;
      }
LABEL_30:

      goto LABEL_31;
    }
    v138 = objc_msgSend_rangeAtIndex_(v24, v38, 3, v39, v40);
    objc_msgSend_substringWithRange_(v16, v139, v138, (uint64_t)v139, v140);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = (void *)qword_1EFF32628;
    v146 = objc_msgSend_length(v48, v142, v143, v144, v145);
    objc_msgSend_firstMatchInString_options_range_(v141, v147, (uint64_t)v48, 0, 0, v146);
    v56 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_numberOfRanges(v56, v148, v149, v150, v151) == 3)
    {
      v155 = objc_msgSend_rangeAtIndex_(v56, v152, 1, v153, v154);
      objc_msgSend_substringWithRange_(v48, v156, v155, (uint64_t)v156, v157);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = objc_msgSend_rangeAtIndex_(v56, v158, 2, v159, v160);
      objc_msgSend_substringWithRange_(v48, v162, v161, (uint64_t)v162, v163);
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mTagsByName(self, v164, v165, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v268, v169, v170, v171, v172);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v168, v174, (uint64_t)v173, v175, v176);
      v177 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v177[2](v177);
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_mTagsByName(self, v182, v183, v184, v185);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v48, v187, v188, v189, v190);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v186, v192, (uint64_t)v91, (uint64_t)v191, v193);

      }
      else
      {
        v91 = v177;
      }
      v234 = objc_msgSend_integerValue(v269, v178, v179, v180, v181);
      objc_msgSend_objectAtIndexedSubscript_(v91, v235, v234, v236, v237);
      v100 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
    goto LABEL_18;
  }
  v101 = objc_msgSend_rangeAtIndex_(v24, v35, 2, v36, v37);
  objc_msgSend_substringWithRange_(v16, v102, v101, (uint64_t)v102, v103);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mTagsByID(self, v104, v105, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = (void *)MEMORY[0x1E0CB37E8];
  v114 = objc_msgSend_integerValue(v48, v110, v111, v112, v113);
  objc_msgSend_numberWithInteger_(v109, v115, v114, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v108, v119, (uint64_t)v118, v120, v121);
  v44 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44[2](v44);
    v100 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend_mTagsByID(self, v122, v123, v124, v125);
    v56 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    v126 = (void *)MEMORY[0x1E0CB37E8];
    v131 = objc_msgSend_integerValue(v48, v127, v128, v129, v130);
    objc_msgSend_numberWithInteger_(v126, v132, v131, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v56, v136, (uint64_t)v100, (uint64_t)v135, v137);
LABEL_29:

    v44 = v100;
    goto LABEL_30;
  }
LABEL_31:

LABEL_32:
  if ((unint64_t)objc_msgSend_count(v11, v246, v247, v248, v249) >= 2)
  {
    v254 = objc_msgSend_count(v11, v250, v251, v252, v253);
    objc_msgSend_subarrayWithRange_(v11, v255, 1, v254 - 1, v256);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v257, v258, (uint64_t)CFSTR("."), v259, v260);
    v261 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v44, v262, (uint64_t)v261, v263, v264);
    v265 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v265[2](v265);
      v266 = objc_claimAutoreleasedReturnValue();

      v265 = (void (**)(_QWORD))v266;
    }

    v44 = v265;
  }

  return v44;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_msgSend_mTagsByName(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v19, (uint64_t)v16, v18);

}

- (void)dumpObjCInfoKey:(id)a3 value:(id)a4 indent:(unint64_t)a5
{
  id v8;
  id v9;
  FILE **v10;
  FILE *v11;
  int v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  FILE *v24;
  const char *v25;
  id v26;
  FILE **v27;
  FILE *v28;
  int v29;
  const char *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  FILE *v46;
  const char *v47;
  id v48;
  FILE *v49;
  const char *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  id v67;
  FILE *v68;
  const char *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  id v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  id v82;
  FILE *v83;
  const char *v84;
  id v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[6];
  _QWORD v97[6];
  void *__b[2];
  char v99;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (FILE **)MEMORY[0x1E0C80C10];
    v11 = (FILE *)*MEMORY[0x1E0C80C10];
    sub_1D52B1BB0(__b, a5, 9);
    v12 = v99;
    v13 = (const char *)__b[0];
    v14 = objc_retainAutorelease(v8);
    v19 = (const char *)objc_msgSend_UTF8String(v14, v15, v16, v17, v18);
    v20 = (const char *)__b;
    if (v12 < 0)
      v20 = v13;
    fprintf(v11, "%s%s : (\n", v20, v19);
    if (v99 < 0)
      operator delete(__b[0]);
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = sub_1D52A41FC;
    v97[3] = &unk_1E9972000;
    v97[4] = self;
    v97[5] = a5;
    objc_msgSend_enumerateObjectsUsingBlock_(v9, v21, (uint64_t)v97, v22, v23);
    v24 = *v10;
    sub_1D52B1BB0(__b, a5, 9);
    if (v99 >= 0)
      v25 = (const char *)__b;
    else
      v25 = (const char *)__b[0];
    fprintf(v24, "%s)\n", v25);
    if (v99 < 0)
      operator delete(__b[0]);
  }
  else
  {
    v26 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (FILE **)MEMORY[0x1E0C80C10];
      v28 = (FILE *)*MEMORY[0x1E0C80C10];
      sub_1D52B1BB0(__b, a5, 9);
      v29 = v99;
      v30 = (const char *)__b[0];
      v31 = objc_retainAutorelease(v8);
      v36 = (const char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35);
      v37 = (const char *)__b;
      if (v29 < 0)
        v37 = v30;
      fprintf(v28, "%s%s : {\n", v37, v36);
      if (v99 < 0)
        operator delete(__b[0]);
      v42 = objc_msgSend_count(v26, v38, v39, v40, v41);
      NSLog(CFSTR("NSDictionary %lu"), v42);
      v96[0] = MEMORY[0x1E0C809B0];
      v96[1] = 3221225472;
      v96[2] = sub_1D52A4390;
      v96[3] = &unk_1E9972028;
      v96[4] = self;
      v96[5] = a5;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v26, v43, (uint64_t)v96, v44, v45);
      v46 = *v27;
      sub_1D52B1BB0(__b, a5, 9);
      if (v99 >= 0)
        v47 = (const char *)__b;
      else
        v47 = (const char *)__b[0];
      fprintf(v46, "%s}\n", v47);
      if (v99 < 0)
        operator delete(__b[0]);
    }
    else
    {
      v48 = v26;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = (FILE *)*MEMORY[0x1E0C80C10];
        sub_1D52B1BB0(__b, a5, 9);
        if (v99 >= 0)
          v50 = (const char *)__b;
        else
          v50 = (const char *)__b[0];
        v51 = objc_retainAutorelease(v8);
        v56 = (const char *)objc_msgSend_UTF8String(v51, v52, v53, v54, v55);
        objc_msgSend_stringValue(v48, v57, v58, v59, v60);
        v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v66 = (const char *)objc_msgSend_UTF8String(v61, v62, v63, v64, v65);
        fprintf(v49, "%s%s : @%s\n", v50, v56, v66);

        if (v99 < 0)
          operator delete(__b[0]);
      }
      else
      {
        v67 = v48;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v68 = (FILE *)*MEMORY[0x1E0C80C10];
          v69 = (const char *)__b;
          sub_1D52B1BB0(__b, a5, 9);
          if (v99 < 0)
            v69 = (const char *)__b[0];
          v70 = objc_retainAutorelease(v8);
          v75 = (const char *)objc_msgSend_UTF8String(v70, v71, v72, v73, v74);
          v76 = objc_retainAutorelease(v67);
          v81 = (const char *)objc_msgSend_UTF8String(v76, v77, v78, v79, v80);
          fprintf(v68, "%s%s : @\"%s\"\n", v69, v75, v81);
          if (v99 < 0)
            operator delete(__b[0]);
        }
        else
        {
          v82 = v67;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v83 = (FILE *)*MEMORY[0x1E0C80C10];
            v84 = (const char *)__b;
            sub_1D52B1BB0(__b, a5, 9);
            if (v99 < 0)
              v84 = (const char *)__b[0];
            v85 = objc_retainAutorelease(v8);
            v90 = (const char *)objc_msgSend_UTF8String(v85, v86, v87, v88, v89);
            v95 = objc_msgSend_length(v82, v91, v92, v93, v94);
            fprintf(v83, "%s%s : %lu bytes\n", v84, v90, v95);
            if (v99 < 0)
              operator delete(__b[0]);
          }

        }
      }

    }
  }

}

- (void)dumpMemoryInfoKey:(id)a3 indent:(unint64_t)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  void **v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void (**v66)(_QWORD);
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  FILE *v81;
  void **v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  FILE *v89;
  void **v90;
  id v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t j;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void (**v140)(_QWORD);
  const char *v141;
  uint64_t v142;
  const char *v143;
  void *v144;
  const char *v145;
  FILE *v146;
  void **v147;
  id v148;
  id obj;
  id obja;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  void *__p[2];
  char v161;
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v148 = a3;
  objc_msgSend_mTagsByID(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v9, v10, v11, v12, v13);

  if (v14)
  {
    v19 = (FILE *)*MEMORY[0x1E0C80C10];
    v20 = __p;
    sub_1D52B1BB0(__p, a4, 9);
    if (v161 < 0)
      v20 = (void **)__p[0];
    v21 = objc_retainAutorelease(v148);
    v26 = (const char *)objc_msgSend_UTF8String(v21, v22, v23, v24, v25);
    objc_msgSend_mTagsByID(self, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_count(v31, v32, v33, v34, v35);
    fprintf(v19, "%s%s : TagsByID( %lu items\n", (const char *)v20, v26, v36);

    if (v161 < 0)
      operator delete(__p[0]);
    objc_msgSend_mTagsByID(self, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v46, v47, (uint64_t)&unk_1E9972068, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    obj = v50;
    v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v156, (uint64_t)v163, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v157;
      v58 = a4 + 1;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v157 != v57)
            objc_enumerationMutation(obj);
          v60 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * i);
          objc_msgSend_mTagsByID(self, v52, v53, v54, v55);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)v60, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          v66 = v65;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_stringValue(v60, v67, v68, v69, v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_dumpMemoryInfoKey_indent_(v66, v72, (uint64_t)v71, v58, v73);
          }
          else
          {
            NSClassFromString(CFSTR("NSBlock"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_stringValue(v60, v74, v75, v76, v77);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v66[2](v66);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dumpObjCInfoKey_value_indent_(self, v79, (uint64_t)v71, (uint64_t)v78, v58);

            }
            else
            {
              objc_msgSend_stringValue(v60, v74, v75, v76, v77);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dumpObjCInfoKey_value_indent_(self, v80, (uint64_t)v71, (uint64_t)v66, v58);
            }
          }

        }
        v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v156, (uint64_t)v163, 16);
      }
      while (v56);
    }

    v81 = (FILE *)*MEMORY[0x1E0C80C10];
    sub_1D52B1BB0(__p, a4, 9);
    if (v161 >= 0)
      v82 = __p;
    else
      v82 = (void **)__p[0];
    fprintf(v81, "%s)\n", (const char *)v82);
    if (v161 < 0)
      operator delete(__p[0]);

  }
  objc_msgSend_mTagsByName(self, v15, v16, v17, v18);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend_count(v83, v84, v85, v86, v87) == 0;

  if (!v88)
  {
    v89 = (FILE *)*MEMORY[0x1E0C80C10];
    v90 = __p;
    sub_1D52B1BB0(__p, a4, 9);
    if (v161 < 0)
      v90 = (void **)__p[0];
    v91 = objc_retainAutorelease(v148);
    v96 = (const char *)objc_msgSend_UTF8String(v91, v92, v93, v94, v95);
    objc_msgSend_mTagsByName(self, v97, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend_count(v101, v102, v103, v104, v105);
    fprintf(v89, "%s%s : TagsByName( %lu items\n", (const char *)v90, v96, v106);

    if (v161 < 0)
      operator delete(__p[0]);
    objc_msgSend_mTagsByName(self, v107, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v111, v112, v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v116, v117, (uint64_t)&unk_1E99720A8, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    obja = v120;
    v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v121, (uint64_t)&v152, (uint64_t)v162, 16);
    if (v125)
    {
      v126 = *(_QWORD *)v153;
      v127 = a4 + 1;
      do
      {
        for (j = 0; j != v125; ++j)
        {
          if (*(_QWORD *)v153 != v126)
            objc_enumerationMutation(obja);
          v129 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * j);
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v122, (uint64_t)CFSTR("@\"%@\"), v123, v124, v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mTagsByName(self, v131, v132, v133, v134);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v135, v136, v129, v137, v138);
          v139 = (void *)objc_claimAutoreleasedReturnValue();

          v140 = v139;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_dumpMemoryInfoKey_indent_(v140, v141, (uint64_t)v130, v127, v142);
          }
          else
          {
            NSClassFromString(CFSTR("NSBlock"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v140[2](v140);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dumpObjCInfoKey_value_indent_(self, v145, (uint64_t)v130, (uint64_t)v144, v127);

            }
            else
            {
              objc_msgSend_dumpObjCInfoKey_value_indent_(self, v143, (uint64_t)v130, (uint64_t)v140, v127);
            }
          }

        }
        v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v122, (uint64_t)&v152, (uint64_t)v162, 16);
      }
      while (v125);
    }

    v146 = (FILE *)*MEMORY[0x1E0C80C10];
    sub_1D52B1BB0(__p, a4, 9);
    if (v161 >= 0)
      v147 = __p;
    else
      v147 = (void **)__p[0];
    fprintf(v146, "%s)\n", (const char *)v147);
    if (v161 < 0)
      operator delete(__p[0]);

  }
}

- (NSMutableDictionary)mTagsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMTagsByID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)mTagsByName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMTagsByName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)mNamespace
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMNamespace:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)mNamespaceReverse
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMNamespaceReverse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNamespaceReverse, 0);
  objc_storeStrong((id *)&self->mNamespace, 0);
  objc_storeStrong((id *)&self->mTagsByName, 0);
  objc_storeStrong((id *)&self->mTagsByID, 0);
}

@end
