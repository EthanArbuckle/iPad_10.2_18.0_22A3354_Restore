@implementation CWFSensingResult

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_data(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, (uint64_t)CFSTR("data"), v10);

  sub_1B06475A8(v3, 0, 1u);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v11, (uint64_t)v14, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
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
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
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
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
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
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  unint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v279;
  CWFSensingResult *v280;
  void *v281;
  void *v282;
  void *v283;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (self->_data)
  {
    objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR("data={\n"), v8, v9);
    if (objc_msgSend_count(self->_data, v11, v12, v13, v14))
    {
      v18 = 0;
      v280 = self;
      do
      {
        objc_msgSend_objectAtIndex_(self->_data, v15, v18, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("SENSING_RESULTS_DATA_TIMESTAMP"), v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v23, v24, v25, v26, v27);
        v29 = v28;

        objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v30, v31, v32, v33, v29);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend_setDateFormat_(v35, v36, (uint64_t)CFSTR("yyyy/MM/dd HH:mm:ss:SSS"), v37, v38);
        objc_msgSend_localTimeZone(MEMORY[0x1E0C99E80], v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTimeZone_(v35, v44, (uint64_t)v43, v45, v46);

        v283 = (void *)v34;
        objc_msgSend_stringFromDate_(v35, v47, v34, v48, v49);
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v10, v50, (uint64_t)CFSTR("\t\"DATA_TIMESTAMP[%ld]\" = %@\n"), v51, v52, v18, v282);
        objc_msgSend_objectForKeyedSubscript_(v19, v53, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_TA"), v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v10, v57, (uint64_t)CFSTR("\t\"DATA_INFO_TA\" = %@\n"), v58, v59, v56);
        objc_msgSend_objectForKeyedSubscript_(v19, v60, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_RA"), v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_appendFormat_(v10, v64, (uint64_t)CFSTR("\t\"DATA_INFO_RA\" = %@\n"), v65, v66, v63);
        objc_msgSend_objectForKeyedSubscript_(v19, v67, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_BSSID"), v68, v69);
        v70 = objc_claimAutoreleasedReturnValue();

        v281 = (void *)v70;
        objc_msgSend_appendFormat_(v10, v71, (uint64_t)CFSTR("\t\"DATA_INFO_BSSID\" = %@\n"), v72, v73, v70);
        objc_msgSend_objectForKeyedSubscript_(v19, v74, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_NUM_TONES"), v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend_integerValue(v77, v78, v79, v80, v81);

        objc_msgSend_appendFormat_(v10, v83, (uint64_t)CFSTR("\t\"DATA_INFO_NUM_TONES\" = %ld\n"), v84, v85, v82);
        objc_msgSend_objectForKeyedSubscript_(v19, v86, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_BW"), v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend_integerValue(v89, v90, v91, v92, v93);

        objc_msgSend_appendFormat_(v10, v95, (uint64_t)CFSTR("\t\"DATA_INFO_BW\" = %ld\n"), v96, v97, v94);
        objc_msgSend_objectForKeyedSubscript_(v19, v98, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_FRAME_TYPE"), v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend_integerValue(v101, v102, v103, v104, v105);

        objc_msgSend_appendFormat_(v10, v107, (uint64_t)CFSTR("\t\"DATA_INFO_FRAME_TYPE\" = 0x%lx\n"), v108, v109, v106);
        objc_msgSend_objectForKeyedSubscript_(v19, v110, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_NSTS"), v111, v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend_integerValue(v113, v114, v115, v116, v117);

        objc_msgSend_appendFormat_(v10, v119, (uint64_t)CFSTR("\t\"DATA_INFO_NSTS_IN_FRAME\" = %ld\n"), v120, v121, v118);
        objc_msgSend_objectForKeyedSubscript_(v19, v122, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_SLICE"), v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = objc_msgSend_integerValue(v125, v126, v127, v128, v129);

        objc_msgSend_appendFormat_(v10, v131, (uint64_t)CFSTR("\t\"DATA_INFO_SLICE\" = %ld\n"), v132, v133, v130);
        objc_msgSend_objectForKeyedSubscript_(v19, v134, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_NUM_RX_CORES"), v135, v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = objc_msgSend_integerValue(v137, v138, v139, v140, v141);

        objc_msgSend_appendFormat_(v10, v143, (uint64_t)CFSTR("\t\"DATA_INFO_NUM_RX_CORES\" = %ld\n"), v144, v145, v142);
        objc_msgSend_objectForKeyedSubscript_(v19, v146, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_NUM_STREAMS"), v147, v148);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = objc_msgSend_integerValue(v149, v150, v151, v152, v153);

        objc_msgSend_appendFormat_(v10, v155, (uint64_t)CFSTR("\t\"DATA_INFO_NSTS_REPORTED\" = %ld\n"), v156, v157, v154);
        objc_msgSend_objectForKeyedSubscript_(v19, v158, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_AGC_GAIN"), v159, v160);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = objc_msgSend_integerValue(v161, v162, v163, v164, v165);

        objc_msgSend_appendFormat_(v10, v167, (uint64_t)CFSTR("\t\"DATA_INFO_AGC_GAIN\" = %ld\n"), v168, v169, v166);
        objc_msgSend_objectForKeyedSubscript_(v19, v170, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_NUM_RSSI"), v171, v172);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = objc_msgSend_integerValue(v173, v174, v175, v176, v177);

        objc_msgSend_appendFormat_(v10, v179, (uint64_t)CFSTR("\t\"DATA_INFO_NUM_RSSI\" = %ld\n"), v180, v181, v178);
        objc_msgSend_objectForKeyedSubscript_(v19, v182, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_CHANNEL"), v183, v184);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        v190 = objc_msgSend_integerValue(v185, v186, v187, v188, v189);

        objc_msgSend_appendFormat_(v10, v191, (uint64_t)CFSTR("\t\"DATA_INFO_CHANNEL\" = %ld\n"), v192, v193, v190);
        objc_msgSend_objectForKeyedSubscript_(v19, v194, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_BW"), v195, v196);
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        v202 = objc_msgSend_integerValue(v197, v198, v199, v200, v201);

        objc_msgSend_appendFormat_(v10, v203, (uint64_t)CFSTR("\t\"DATA_INFO_BW\" = %ld\n"), v204, v205, v202);
        objc_msgSend_objectForKeyedSubscript_(v19, v206, (uint64_t)CFSTR("SENSING_RESULTS_DATA_INFO_RSSI"), v207, v208);
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v10, v210, (uint64_t)CFSTR("\t\"DATA_INFO_RSSI[%ld]\" ="), v211, v212, v18);
        if (objc_msgSend_count(v209, v213, v214, v215, v216))
        {
          v220 = 0;
          do
          {
            objc_msgSend_objectAtIndex_(v209, v217, v220, v218, v219);
            v221 = (void *)objc_claimAutoreleasedReturnValue();
            v226 = objc_msgSend_integerValue(v221, v222, v223, v224, v225);
            objc_msgSend_appendFormat_(v10, v227, (uint64_t)CFSTR(" %ld"), v228, v229, v226);

            ++v220;
          }
          while (v220 < objc_msgSend_count(v209, v230, v231, v232, v233));
        }
        objc_msgSend_appendFormat_(v10, v217, (uint64_t)CFSTR("\n"), v218, v219);
        objc_msgSend_objectForKeyedSubscript_(v19, v234, (uint64_t)CFSTR("SENSING_RESULTS_DATA_BUFFER_LEN"), v235, v236);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = objc_msgSend_unsignedIntValue(v237, v238, v239, v240, v241);

        objc_msgSend_appendFormat_(v10, v243, (uint64_t)CFSTR("\t\"DATA_BUFFER_LEN[%ld]\" = %ld\n"), v244, v245, v18, v242);
        objc_msgSend_objectForKeyedSubscript_(v19, v246, (uint64_t)CFSTR("SENSING_RESULTS_DATA_BUFFER"), v247, v248);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v10, v250, (uint64_t)CFSTR("\t\"DATA_BUFFER[%ld]\" ="), v251, v252, v18);
        if (objc_msgSend_count(v249, v253, v254, v255, v256))
        {
          v260 = 0;
          do
          {
            objc_msgSend_objectAtIndex_(v249, v257, v260, v258, v259);
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            v266 = objc_msgSend_integerValue(v261, v262, v263, v264, v265);
            objc_msgSend_appendFormat_(v10, v267, (uint64_t)CFSTR(" 0x%08lx"), v268, v269, v266);

            ++v260;
          }
          while (v260 < objc_msgSend_count(v249, v270, v271, v272, v273));
        }
        objc_msgSend_appendFormat_(v10, v257, (uint64_t)CFSTR("\n"), v258, v259);

        ++v18;
        self = v280;
      }
      while (v18 < objc_msgSend_count(v280->_data, v274, v275, v276, v277));
    }
    objc_msgSend_appendFormat_(v10, v15, (uint64_t)CFSTR("}\n"), v16, v17, v279);
  }
  else
  {
    objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR("data=%@\n"), v8, v9, 0);
  }
  return (NSString *)v10;
}

- (BOOL)isEqualToSensingResult:(id)a3
{
  id v4;
  NSArray *data;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSArray *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char isEqual;

  v4 = a3;
  data = self->_data;
  objc_msgSend_data(v4, v6, v7, v8, v9);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (data == v14)
  {
    isEqual = 1;
  }
  else if (self->_data)
  {
    objc_msgSend_data(v4, v10, v11, v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = self->_data;
      objc_msgSend_data(v4, v15, v16, v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v20, v22, (uint64_t)v21, v23, v24);

    }
    else
    {
      isEqual = 0;
    }

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFSensingResult *v4;
  CWFSensingResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToSensingResult;

  v4 = (CWFSensingResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToSensingResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToSensingResult = objc_msgSend_isEqualToSensingResult_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToSensingResult = 0;
  }

  return isEqualToSensingResult;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_hash(self->_data, a2, v2, v3, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFSensingResult, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setData_(v11, v12, (uint64_t)self->_data, v13, v14);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_data, (uint64_t)CFSTR("_data"), v3);
}

- (CWFSensingResult)initWithCoder:(id)a3
{
  id v4;
  CWFSensingResult *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *data;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CWFSensingResult;
  v5 = -[CWFSensingResult init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v11, v7, v12, v13, v8, v9, v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("_data"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSArray *)v17;

  }
  return v5;
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
