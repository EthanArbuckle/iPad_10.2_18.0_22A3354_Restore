@implementation CHNumberFieldResultReorderingStep

- (id)initForPhoneNumberFields
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CHNumberFieldResultReorderingStep *v7;
  NSCharacterSet *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSCharacterSet *allowedCharacters;
  NSCharacterSet *v29;
  NSDictionary *characterReplacements;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)CHNumberFieldResultReorderingStep;
  v7 = -[CHNumberFieldResultReorderingStep init](&v32, sel_init);
  if (v7)
  {
    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3780], v2, v3, v4, v5, v6);
    v8 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_letterCharacterSet(MEMORY[0x1E0CB3500], v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formUnionWithCharacterSet_(v8, v15, (uint64_t)v14, v16, v17, v18);

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v19, (uint64_t)CFSTR("+-#*'\",. "), v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formUnionWithCharacterSet_(v8, v24, (uint64_t)v23, v25, v26, v27);

    allowedCharacters = v7->_allowedCharacters;
    v7->_allowedCharacters = v8;
    v29 = v8;

    characterReplacements = v7->_characterReplacements;
    v7->_characterReplacements = (NSDictionary *)&unk_1E7827510;

  }
  return v7;
}

- (id)initForDigitFields
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CHNumberFieldResultReorderingStep *v7;
  NSCharacterSet *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSCharacterSet *allowedCharacters;
  NSCharacterSet *v19;
  NSDictionary *characterReplacements;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CHNumberFieldResultReorderingStep;
  v7 = -[CHNumberFieldResultReorderingStep init](&v22, sel_init);
  if (v7)
  {
    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3780], v2, v3, v4, v5, v6);
    v8 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v9, (uint64_t)CFSTR(",.-"), v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formUnionWithCharacterSet_(v8, v14, (uint64_t)v13, v15, v16, v17);

    allowedCharacters = v7->_allowedCharacters;
    v7->_allowedCharacters = v8;
    v19 = v8;

    characterReplacements = v7->_characterReplacements;
    v7->_characterReplacements = (NSDictionary *)&unk_1E7827538;

  }
  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (**v14)(id, void *, uint8_t *);
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t i;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t j;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  unint64_t k;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  CHTokenizedResultColumn *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  unint64_t m;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  CHTokenizedResultColumn *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  id *v242;
  void *v244;
  id obj;
  id v246;
  void *v247;
  id v249;
  id *v250;
  void *v251;
  _QWORD v252[5];
  _QWORD v253[5];
  uint8_t buf[8];
  unint64_t v255;
  unint64_t v256;

  v5 = (id *)a3;
  v246 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHNumberFieldResultReorderingStep is running", buf, 2u);
  }

  v253[0] = MEMORY[0x1E0C809B0];
  v253[1] = 3221225472;
  v253[2] = sub_1BE8BE10C;
  v253[3] = &unk_1E77F69F0;
  v253[4] = self;
  v7 = (void *)MEMORY[0x1C3B81A84](v253);
  v250 = v5;
  objc_msgSend_result(v5, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v244 = v7;
  v14 = v7;
  obj = v13;
  v249 = v13;
  objc_opt_self();
  v15 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_tokenColumns(v249, v16, v17, v18, v19, v20, v244);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  objc_msgSend_arrayWithCapacity_(v15, v28, v27, v29, v30, v31);
  v247 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; ; ++i)
  {
    objc_msgSend_tokenColumns(v249, v32, v33, v34, v35, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_count(v38, v39, v40, v41, v42, v43);

    if (i >= v44)
      break;
    objc_msgSend_tokenColumns(v249, v45, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v50, v51, i, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_textTokenRows(v55, v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_count(v62, v63, v64, v65, v66, v67);
    objc_msgSend_arrayWithCapacity_(v56, v69, v68, v70, v71, v72);
    v251 = (void *)objc_claimAutoreleasedReturnValue();

    for (j = 0; ; ++j)
    {
      objc_msgSend_textTokenRows(v55, v73, v74, v75, v76, v77);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend_count(v79, v80, v81, v82, v83, v84);

      if (j >= v85)
        break;
      objc_msgSend_textTokenRows(v55, v86, v87, v88, v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v91, v92, j, v93, v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      v97 = (void *)MEMORY[0x1E0C99DE8];
      v103 = objc_msgSend_count(v96, v98, v99, v100, v101, v102);
      objc_msgSend_arrayWithCapacity_(v97, v104, v103, v105, v106, v107);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      for (k = 0; k < objc_msgSend_count(v96, v108, v109, v110, v111, v112); ++k)
      {
        objc_msgSend_objectAtIndexedSubscript_(v96, v115, k, v116, v117, v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_string(v119, v120, v121, v122, v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = objc_msgSend_length(v125, v126, v127, v128, v129, v130);

        objc_msgSend_objectAtIndexedSubscript_(v96, v132, k, v133, v134, v135);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        if (v131)
        {
          *(_QWORD *)buf = i;
          v255 = j;
          v256 = k;
          v14[2](v14, v140, buf);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v113, v142, (uint64_t)v141, v143, v144, v145);

        }
        else
        {
          objc_msgSend_addObject_(v113, v136, (uint64_t)v140, v137, v138, v139);
        }

      }
      objc_msgSend_addObject_(v251, v115, (uint64_t)v113, v116, v117, v118);

    }
    v146 = [CHTokenizedResultColumn alloc];
    v151 = (void *)objc_msgSend_initWithTokenRows_(v146, v147, (uint64_t)v251, v148, v149, v150);
    objc_msgSend_addObject_(v247, v152, (uint64_t)v151, v153, v154, v155);

  }
  objc_msgSend_setTokenColumns_(v249, v45, (uint64_t)v247, v47, v48, v49);

  if (v250)
    objc_storeStrong(v250 + 3, obj);

  v156 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_result(v250, v157, v158, v159, v160, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenColumns(v162, v163, v164, v165, v166, v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = objc_msgSend_count(v168, v169, v170, v171, v172, v173);
  objc_msgSend_arrayWithCapacity_(v156, v175, v174, v176, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  for (m = 0; ; ++m)
  {
    objc_msgSend_result(v250, v180, v181, v182, v183, v184);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(v186, v187, v188, v189, v190, v191);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = objc_msgSend_count(v192, v193, v194, v195, v196, v197);

    if (m >= v198)
      break;
    objc_msgSend_result(v250, v199, v200, v201, v202, v203);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(v204, v205, v206, v207, v208, v209);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v210, v211, m, v212, v213, v214);
    v215 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_textTokenRows(v215, v216, v217, v218, v219, v220);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    v252[0] = MEMORY[0x1E0C809B0];
    v252[1] = 3221225472;
    v252[2] = sub_1BE8BE470;
    v252[3] = &unk_1E77F6A18;
    v252[4] = self;
    objc_msgSend_sortedArrayUsingComparator_(v221, v222, (uint64_t)v252, v223, v224, v225);
    v226 = (void *)objc_claimAutoreleasedReturnValue();

    v227 = [CHTokenizedResultColumn alloc];
    v232 = (void *)objc_msgSend_initWithTokenRows_(v227, v228, (uint64_t)v226, v229, v230, v231);
    objc_msgSend_addObject_(v179, v233, (uint64_t)v232, v234, v235, v236);

  }
  objc_msgSend_result(v250, v199, v200, v201, v202, v203);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTokenColumns_(v237, v238, (uint64_t)v179, v239, v240, v241);

  v242 = v250;
  return v242;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterReplacements, 0);
  objc_storeStrong((id *)&self->_allowedCharacters, 0);
}

@end
