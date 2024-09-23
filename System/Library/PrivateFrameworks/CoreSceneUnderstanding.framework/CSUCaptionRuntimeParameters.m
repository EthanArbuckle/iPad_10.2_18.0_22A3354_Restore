@implementation CSUCaptionRuntimeParameters

- (CSUCaptionRuntimeParameters)initWithOptions:(id)a3
{
  id v4;
  CSUCaptionRuntimeParameters *v5;
  CSUCaptionRuntimeParameters *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSUCaptionRuntimeParameters;
  v5 = -[CSUCaptionRuntimeParameters init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)&v5->_captionModelMinimumConfidence = xmmword_23A0A3AA0;
    v5->_excludeGenderStrategy = 1;
    NSLog(CFSTR("%@"), v4);
    objc_msgSend__loadRuntimeParameters_(v6, v7, (uint64_t)v4, v8, v9);
  }

  return v6;
}

- (void)_loadRuntimeParameters:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSArray *v79;
  NSArray *replacements;
  NSArray *v81;
  NSArray *excludeGenderReplacements;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  uint64_t v100;
  CSUCaptionRuntimeExcludeGenderTrigger *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSArray *v114;
  NSArray *excludeGenderTriggers;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  NSObject *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  NSArray *v178;
  NSArray *genderedTokens;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  NSObject *v196;
  id v197;
  const char *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t j;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  id v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  NSArray *v227;
  NSArray *blackListRules;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  id obj;
  id v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  void **v245;
  id v246;
  _BYTE v247[128];
  _BYTE v248[128];
  uint64_t v249;

  v249 = *MEMORY[0x24BDAC8D0];
  v246 = a3;
  v232 = v246;
  objc_msgSend_objectForKeyedSubscript_(v246, v3, (uint64_t)CFSTR("captionModel"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v246, v7, (uint64_t)CFSTR("captionModel"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v230 = v10;
      objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("minimumConfidence"), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v10, v15, (uint64_t)CFSTR("minimumConfidence"), v16, v17);
        v18 = objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend_doubleValue(v18, v19, v20, v21, v22);
          self->_captionModelMinimumConfidence = v26;
          goto LABEL_14;
        }
      }
      else
      {

      }
      sub_23A016E78();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        sub_23A09E3F0(v34, v35, v36, v37, v38, v39, v40, v41);

      v18 = 0;
LABEL_14:
      objc_msgSend_objectForKeyedSubscript_(v10, v23, (uint64_t)CFSTR("lengthNormalizationFactor"), v24, v25);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v10, v43, (uint64_t)CFSTR("lengthNormalizationFactor"), v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend_doubleValue(v46, v47, v48, v49, v50);
          self->_captionModelLengthNormalizationFactor = v54;
          goto LABEL_21;
        }
      }
      else
      {

      }
      sub_23A016E78();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        sub_23A09E380(v55, v56, v57, v58, v59, v60, v61, v62);

      v46 = 0;
LABEL_21:
      objc_msgSend_objectForKeyedSubscript_(v10, v51, (uint64_t)CFSTR("excludeGenderStrategy"), v52, v53);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v230, v64, (uint64_t)CFSTR("excludeGenderStrategy"), v65, v66);
        v67 = objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          self->_excludeGenderStrategy = objc_msgSend_unsignedIntegerValue(v67, v68, v69, v70, v71);
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {

      }
      sub_23A016E78();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        sub_23A09E310(v67, v72, v73, v74, v75, v76, v77, v78);
      goto LABEL_27;
    }
  }
  else
  {

  }
  sub_23A016E78();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_23A09E2A0(v18, v27, v28, v29, v30, v31, v32, v33);
  v230 = 0;
LABEL_28:

  v245 = &v246;
  sub_23A02D9D4(&v245, CFSTR("replacements"));
  v79 = (NSArray *)objc_claimAutoreleasedReturnValue();
  replacements = self->_replacements;
  self->_replacements = v79;

  sub_23A02D9D4(&v245, CFSTR("excludeGenderReplacements"));
  v81 = (NSArray *)objc_claimAutoreleasedReturnValue();
  excludeGenderReplacements = self->_excludeGenderReplacements;
  self->_excludeGenderReplacements = v81;

  objc_msgSend_objectForKeyedSubscript_(v246, v83, (uint64_t)CFSTR("excludeGenderTriggers"), v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v246, v87, (uint64_t)CFSTR("excludeGenderTriggers"), v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      objc_msgSend_array(MEMORY[0x24BDBCEB8], v91, v92, v93, v94);
      v95 = objc_claimAutoreleasedReturnValue();
      v243 = 0u;
      v244 = 0u;
      v241 = 0u;
      v242 = 0u;
      obj = v90;
      v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v96, (uint64_t)&v241, (uint64_t)v248, 16);
      if (v97)
      {
        v98 = *(_QWORD *)v242;
        do
        {
          for (i = 0; i != v97; ++i)
          {
            if (*(_QWORD *)v242 != v98)
              objc_enumerationMutation(obj);
            v100 = *(_QWORD *)(*((_QWORD *)&v241 + 1) + 8 * i);
            v101 = [CSUCaptionRuntimeExcludeGenderTrigger alloc];
            v105 = (void *)objc_msgSend_initWithDictionary_(v101, v102, v100, v103, v104);
            objc_msgSend_addObject_(v95, v106, (uint64_t)v105, v107, v108);

          }
          v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v109, (uint64_t)&v241, (uint64_t)v248, 16);
        }
        while (v97);
      }

      v114 = (NSArray *)objc_msgSend_copy(v95, v110, v111, v112, v113);
      excludeGenderTriggers = self->_excludeGenderTriggers;
      self->_excludeGenderTriggers = v114;

      goto LABEL_42;
    }
  }
  else
  {

  }
  sub_23A016E78();
  v95 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
    sub_23A09E230(v95, v116, v117, v118, v119, v120, v121, v122);
  obj = 0;
LABEL_42:

  objc_msgSend_objectForKeyedSubscript_(v232, v123, (uint64_t)off_2569415B0, v124, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v232, v127, (uint64_t)off_2569415B0, v128, v129);
    v229 = (void *)objc_claimAutoreleasedReturnValue();

    if (v229)
    {
      v134 = objc_msgSend_unsignedIntegerValue(v229, v130, v131, v132, v133);
      goto LABEL_47;
    }
  }
  else
  {

  }
  v229 = 0;
  v134 = 1;
LABEL_47:
  self->_genderOption = v134;
  sub_23A016E78();
  v135 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG))
    sub_23A09E1B8(&self->_genderOption, v135);

  objc_msgSend_objectForKeyedSubscript_(v246, v136, (uint64_t)CFSTR("filterTokens"), v137, v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v246, v140, (uint64_t)CFSTR("filterTokens"), v141, v142);
    v231 = (void *)objc_claimAutoreleasedReturnValue();

    if (v231)
    {
      objc_msgSend_array(MEMORY[0x24BDBCEB8], v143, v144, v145, v146);
      v147 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v231, v148, (uint64_t)CFSTR("gender"), v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v231, v152, (uint64_t)CFSTR("gender"), v153, v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();

        if (v155)
        {
          objc_msgSend_addObjectsFromArray_(v147, v156, (uint64_t)v155, v157, v158);
LABEL_62:
          v178 = (NSArray *)objc_msgSend_copy(v147, v159, v160, v161, v162, v229, v230);
          genderedTokens = self->_genderedTokens;
          self->_genderedTokens = v178;

          goto LABEL_63;
        }
      }
      else
      {

      }
      sub_23A016E78();
      v170 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v170, OS_LOG_TYPE_DEBUG))
        sub_23A09E148(v170, v171, v172, v173, v174, v175, v176, v177);

      v155 = 0;
      goto LABEL_62;
    }
  }
  else
  {

  }
  sub_23A016E78();
  v147 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
    sub_23A09E0D8(v147, v163, v164, v165, v166, v167, v168, v169);
  v231 = 0;
LABEL_63:

  objc_msgSend_objectForKeyedSubscript_(v246, v180, (uint64_t)CFSTR("blacklistTokens"), v181, v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v246, v184, (uint64_t)CFSTR("blacklistTokens"), v185, v186);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v233 = 0;
  }

  objc_msgSend_array(MEMORY[0x24BDBCEB8], v187, v188, v189, v190);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  if (v233)
  {
    objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x24BDD14A8], v191, v192, v193, v194);
    v196 = objc_claimAutoreleasedReturnValue();
    v239 = 0u;
    v240 = 0u;
    v237 = 0u;
    v238 = 0u;
    v197 = v233;
    v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(v197, v198, (uint64_t)&v237, (uint64_t)v247, 16);
    if (v202)
    {
      v203 = *(_QWORD *)v238;
      do
      {
        for (j = 0; j != v202; ++j)
        {
          if (*(_QWORD *)v238 != v203)
            objc_enumerationMutation(v197);
          objc_msgSend_stringByTrimmingCharactersInSet_(*(void **)(*((_QWORD *)&v237 + 1) + 8 * j), v199, (uint64_t)v196, v200, v201, v229);
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_length(v205, v206, v207, v208, v209))
          {
            v236 = 0;
            objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x24BDD1798], v210, (uint64_t)v205, 1, (uint64_t)&v236);
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            v215 = v236;
            if (v211)
              objc_msgSend_addObject_(v195, v212, (uint64_t)v211, v213, v214);

          }
        }
        v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(v197, v199, (uint64_t)&v237, (uint64_t)v247, 16);
      }
      while (v202);
    }

  }
  else
  {
    sub_23A016E78();
    v196 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
      sub_23A09E068(v196, v216, v217, v218, v219, v220, v221, v222);
  }

  v227 = (NSArray *)objc_msgSend_copy(v195, v223, v224, v225, v226);
  blackListRules = self->_blackListRules;
  self->_blackListRules = v227;

}

- (double)captionModelMinimumConfidence
{
  return self->_captionModelMinimumConfidence;
}

- (void)setCaptionModelMinimumConfidence:(double)a3
{
  self->_captionModelMinimumConfidence = a3;
}

- (double)captionModelLengthNormalizationFactor
{
  return self->_captionModelLengthNormalizationFactor;
}

- (void)setCaptionModelLengthNormalizationFactor:(double)a3
{
  self->_captionModelLengthNormalizationFactor = a3;
}

- (int)excludeGenderStrategy
{
  return self->_excludeGenderStrategy;
}

- (void)setExcludeGenderStrategy:(int)a3
{
  self->_excludeGenderStrategy = a3;
}

- (NSArray)replacements
{
  return self->_replacements;
}

- (void)setReplacements:(id)a3
{
  objc_storeStrong((id *)&self->_replacements, a3);
}

- (NSArray)genderedTokens
{
  return self->_genderedTokens;
}

- (void)setGenderedTokens:(id)a3
{
  objc_storeStrong((id *)&self->_genderedTokens, a3);
}

- (NSArray)blackListRules
{
  return self->_blackListRules;
}

- (void)setBlackListRules:(id)a3
{
  objc_storeStrong((id *)&self->_blackListRules, a3);
}

- (NSArray)excludeGenderReplacements
{
  return self->_excludeGenderReplacements;
}

- (void)setExcludeGenderReplacements:(id)a3
{
  objc_storeStrong((id *)&self->_excludeGenderReplacements, a3);
}

- (NSArray)excludeGenderTriggers
{
  return self->_excludeGenderTriggers;
}

- (void)setExcludeGenderTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_excludeGenderTriggers, a3);
}

- (int)genderOption
{
  return self->_genderOption;
}

- (void)setGenderOption:(int)a3
{
  self->_genderOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeGenderTriggers, 0);
  objc_storeStrong((id *)&self->_excludeGenderReplacements, 0);
  objc_storeStrong((id *)&self->_blackListRules, 0);
  objc_storeStrong((id *)&self->_genderedTokens, 0);
  objc_storeStrong((id *)&self->_replacements, 0);
}

@end
