@implementation CVNLPCaptionRuntimeParameters

- (CVNLPCaptionRuntimeParameters)initWithOptions:(id)a3
{
  id v4;
  CVNLPCaptionRuntimeParameters *v5;
  const char *v6;
  uint64_t v7;
  CVNLPCaptionRuntimeParameters *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CVNLPCaptionRuntimeParameters;
  v5 = -[CVNLPCaptionRuntimeParameters init](&v10, sel_init);
  v8 = v5;
  if (v5)
  {
    *(_OWORD *)&v5->_captionModelMinimumConfidence = xmmword_1B03B0FC0;
    v5->_excludeGenderStrategy = 1;
    objc_msgSend__loadRuntimeParameters_(v5, v6, (uint64_t)v4, v7);
  }

  return v8;
}

- (void)_loadRuntimeParameters:(id)a3
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  NSDictionary *v58;
  NSDictionary *classifierRevisions;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  id v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  CVNLPCaptionSensitiveImageParameters *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  void *v111;
  const char *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  NSDictionary *v117;
  NSDictionary *sensitiveImageParameters;
  NSArray *v119;
  NSArray *replacements;
  NSArray *v121;
  NSArray *excludeGenderReplacements;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t j;
  uint64_t v135;
  CVNLPCaptionRuntimeExcludeGenderTrigger *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  NSArray *v146;
  NSArray *excludeGenderTriggers;
  void *v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  NSArray *v170;
  NSArray *genderedTokens;
  id v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  void *v193;
  id v194;
  const char *v195;
  uint64_t v196;
  void *v197;
  NSObject *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  NSArray *v202;
  NSArray *blackListRules;
  void *v204;
  void *v205;
  void *v206;
  NSObject *log;
  void *v208;
  void *v209;
  void *v210;
  id v211;
  id obj;
  id obja;
  void *v215;
  void *v216;
  id v217;
  id v218;
  id v219;
  id v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  void **p_location;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  id location;
  uint8_t buf[4];
  void *v236;
  __int16 v237;
  void *v238;
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  uint64_t v242;

  v242 = *MEMORY[0x1E0C80C00];
  v211 = a3;
  objc_msgSend_objectForKeyedSubscript_(v211, v3, (uint64_t)CVNLPCaptionModelPath, v4);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v208, v5, (uint64_t)CFSTR("runtime_parameters.json"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99D50];
  v210 = v7;
  objc_msgSend_path(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataWithContentsOfFile_(v8, v13, (uint64_t)v12, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v209 = (void *)v15;
  if (v15)
  {
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v16, v15, 0, 0);
    location = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = location;
    else
      v17 = 0;
    objc_storeStrong(&location, v17);
    if (!v17)
    {
      if (qword_1EEEB2D38 != -1)
        dispatch_once(&qword_1EEEB2D38, &unk_1E60CDAE8);
      log = (id)qword_1EEEB2D30;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v236 = v210;
        _os_log_error_impl(&dword_1B02D2000, log, OS_LOG_TYPE_ERROR, "Could not load the contents of file at %@ as dictionary", buf, 0xCu);
      }
      goto LABEL_120;
    }
    objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("captionModel"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      log = 0;
LABEL_33:

LABEL_34:
      objc_msgSend_objectForKeyedSubscript_(location, v24, (uint64_t)CFSTR("classifiers"), v25);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(location, v50, (uint64_t)CFSTR("classifiers"), v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          v206 = v52;
          objc_msgSend_objectForKeyedSubscript_(v52, v53, (uint64_t)CFSTR("revisions"), v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_objectForKeyedSubscript_(v52, v56, (uint64_t)CFSTR("revisions"), v57);
            v58 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            classifierRevisions = self->_classifierRevisions;
            self->_classifierRevisions = v58;
          }
          else
          {
            classifierRevisions = self->_classifierRevisions;
            self->_classifierRevisions = 0;
          }

          objc_msgSend_objectForKeyedSubscript_(v52, v60, (uint64_t)CFSTR("blockingTokens"), v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_objectForKeyedSubscript_(v52, v63, (uint64_t)CFSTR("blockingTokens"), v64);
            v217 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v217 = 0;
          }

          objc_msgSend_objectForKeyedSubscript_(v52, v65, (uint64_t)CFSTR("categories"), v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_objectForKeyedSubscript_(v52, v68, (uint64_t)CFSTR("categories"), v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            if (v70)
            {
              objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v71, v72, v73);
              v215 = (void *)objc_claimAutoreleasedReturnValue();
              v232 = 0u;
              v233 = 0u;
              v230 = 0u;
              v231 = 0u;
              objc_msgSend_allKeys(v70, v74, v75, v76);
              obj = (id)objc_claimAutoreleasedReturnValue();
              v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v230, (uint64_t)v241, 16);
              if (v78)
              {
                v79 = *(_QWORD *)v231;
                do
                {
                  for (i = 0; i != v78; ++i)
                  {
                    if (*(_QWORD *)v231 != v79)
                      objc_enumerationMutation(obj);
                    v81 = *(id *)(*((_QWORD *)&v230 + 1) + 8 * i);
                    objc_msgSend_objectForKeyedSubscript_(v70, v82, (uint64_t)v81, v83);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend_objectForKeyedSubscript_(v70, v85, (uint64_t)v81, v86);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v87 = 0;
                    }

                    objc_msgSend_objectForKeyedSubscript_(v87, v88, (uint64_t)CFSTR("minimumConfidence"), v89);
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend_objectForKeyedSubscript_(v87, v91, (uint64_t)CFSTR("minimumConfidence"), v92);
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v93 = 0;
                    }

                    objc_msgSend_objectForKeyedSubscript_(v87, v94, (uint64_t)CFSTR("blockingTokens"), v95);
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend_objectForKeyedSubscript_(v87, v97, (uint64_t)CFSTR("blockingTokens"), v98);
                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v99 = 0;
                    }

                    objc_msgSend_objectForKeyedSubscript_(v87, v100, (uint64_t)CFSTR("blockingTokensAnnex"), v101);
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend_objectForKeyedSubscript_(v87, v103, (uint64_t)CFSTR("blockingTokensAnnex"), v104);
                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v105 = 0;
                    }

                    if (v93)
                    {
                      v106 = [CVNLPCaptionSensitiveImageParameters alloc];
                      objc_msgSend_doubleValue(v93, v107, v108, v109);
                      v111 = (void *)objc_msgSend_initWithVisionIdentifier_minConfidence_commonBlockingTokens_categoryBlockingTokens_categoryBlockingTokensAnnex_(v106, v110, (uint64_t)v81, (uint64_t)v217, v99, v105);
                      objc_msgSend_setObject_forKeyedSubscript_(v215, v112, (uint64_t)v111, (uint64_t)v81);

                    }
                  }
                  v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v113, (uint64_t)&v230, (uint64_t)v241, 16);
                }
                while (v78);
              }

              v117 = (NSDictionary *)objc_msgSend_copy(v215, v114, v115, v116);
              sensitiveImageParameters = self->_sensitiveImageParameters;
              self->_sensitiveImageParameters = v117;

            }
          }
          else
          {

          }
LABEL_70:
          p_location = &location;
          sub_1B035DC70(&p_location, CFSTR("replacements"));
          v119 = (NSArray *)objc_claimAutoreleasedReturnValue();
          replacements = self->_replacements;
          self->_replacements = v119;

          sub_1B035DC70(&p_location, CFSTR("excludeGenderReplacements"));
          v121 = (NSArray *)objc_claimAutoreleasedReturnValue();
          excludeGenderReplacements = self->_excludeGenderReplacements;
          self->_excludeGenderReplacements = v121;

          objc_msgSend_objectForKeyedSubscript_(location, v123, (uint64_t)CFSTR("excludeGenderTriggers"), v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_objectForKeyedSubscript_(location, v126, (uint64_t)CFSTR("excludeGenderTriggers"), v127);
            v218 = (id)objc_claimAutoreleasedReturnValue();

            if (!v218)
            {
              v219 = 0;
LABEL_82:
              objc_msgSend_objectForKeyedSubscript_(v211, v128, (uint64_t)CVNLPCaptionEnableGenderedCaptions, v130);
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend_objectForKeyedSubscript_(v211, v149, (uint64_t)CVNLPCaptionEnableGenderedCaptions, v150);
                v205 = (void *)objc_claimAutoreleasedReturnValue();

                if (v205)
                {
                  v154 = objc_msgSend_unsignedIntegerValue(v205, v151, v152, v153);
                  goto LABEL_87;
                }
              }
              else
              {

              }
              v205 = 0;
              v154 = 1;
LABEL_87:
              self->_genderOption = v154;
              objc_msgSend_objectForKeyedSubscript_(location, v151, (uint64_t)CFSTR("filterTokens"), v153);
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend_objectForKeyedSubscript_(location, v156, (uint64_t)CFSTR("filterTokens"), v157);
                obja = (id)objc_claimAutoreleasedReturnValue();

                if (!obja)
                {
                  obja = 0;
                  goto LABEL_98;
                }
                objc_msgSend_array(MEMORY[0x1E0C99DE8], v158, v159, v160);
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(obja, v161, (uint64_t)CFSTR("gender"), v162);
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend_objectForKeyedSubscript_(obja, v164, (uint64_t)CFSTR("gender"), v165);
                  v166 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v166)
                    objc_msgSend_addObjectsFromArray_(v155, v167, (uint64_t)v166, v169);
                }
                else
                {

                  v166 = 0;
                }
                v170 = (NSArray *)objc_msgSend_copy(v155, v167, v168, v169);
                genderedTokens = self->_genderedTokens;
                self->_genderedTokens = v170;

              }
              else
              {
                obja = 0;
              }

LABEL_98:
              objc_msgSend_objectForKeyedSubscript_(location, v158, (uint64_t)CFSTR("blacklistTokens"), v160);
              v172 = (id)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend_objectForKeyedSubscript_(location, v173, (uint64_t)CFSTR("blacklistTokens"), v174);
                v204 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v204)
                {
LABEL_119:

LABEL_120:
                  goto LABEL_121;
                }
                objc_msgSend_array(MEMORY[0x1E0C99DE8], v175, v176, v177);
                v216 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v178, v179, v180);
                v181 = (void *)objc_claimAutoreleasedReturnValue();
                v223 = 0u;
                v224 = 0u;
                v221 = 0u;
                v222 = 0u;
                v172 = v204;
                v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v172, v182, (uint64_t)&v221, (uint64_t)v239, 16);
                if (v185)
                {
                  v186 = *(_QWORD *)v222;
                  do
                  {
                    v187 = 0;
                    do
                    {
                      if (*(_QWORD *)v222 != v186)
                        objc_enumerationMutation(v172);
                      objc_msgSend_stringByTrimmingCharactersInSet_(*(void **)(*((_QWORD *)&v221 + 1) + 8 * v187), v183, (uint64_t)v181, v184);
                      v188 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend_length(v188, v189, v190, v191))
                      {
                        v220 = 0;
                        objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E0CB38E8], v192, (uint64_t)v188, 1, &v220);
                        v193 = (void *)objc_claimAutoreleasedReturnValue();
                        v194 = v220;
                        v197 = v194;
                        if (v193)
                        {
                          objc_msgSend_addObject_(v216, v195, (uint64_t)v193, v196);
                        }
                        else if (v194)
                        {
                          if (qword_1EEEB2D38 != -1)
                            dispatch_once(&qword_1EEEB2D38, &unk_1E60CDAE8);
                          v198 = (id)qword_1EEEB2D30;
                          if (os_log_type_enabled(v198, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412546;
                            v236 = v188;
                            v237 = 2112;
                            v238 = v197;
                            _os_log_error_impl(&dword_1B02D2000, v198, OS_LOG_TYPE_ERROR, "Error adding caption rules-file line: %@. Error: %@", buf, 0x16u);
                          }

                        }
                      }

                      ++v187;
                    }
                    while (v185 != v187);
                    v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v172, v183, (uint64_t)&v221, (uint64_t)v239, 16);
                  }
                  while (v185);
                }

                v202 = (NSArray *)objc_msgSend_copy(v216, v199, v200, v201);
                blackListRules = self->_blackListRules;
                self->_blackListRules = v202;

              }
              goto LABEL_119;
            }
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v128, v129, v130);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v227 = 0u;
            v228 = 0u;
            v225 = 0u;
            v226 = 0u;
            v219 = v218;
            v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(v219, v131, (uint64_t)&v225, (uint64_t)v240, 16);
            if (v132)
            {
              v133 = *(_QWORD *)v226;
              do
              {
                for (j = 0; j != v132; ++j)
                {
                  if (*(_QWORD *)v226 != v133)
                    objc_enumerationMutation(v219);
                  v135 = *(_QWORD *)(*((_QWORD *)&v225 + 1) + 8 * j);
                  v136 = [CVNLPCaptionRuntimeExcludeGenderTrigger alloc];
                  v139 = (void *)objc_msgSend_initWithDictionary_(v136, v137, v135, v138);
                  objc_msgSend_addObject_(v125, v140, (uint64_t)v139, v141);

                }
                v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(v219, v142, (uint64_t)&v225, (uint64_t)v240, 16);
              }
              while (v132);
            }

            v146 = (NSArray *)objc_msgSend_copy(v125, v143, v144, v145);
            excludeGenderTriggers = self->_excludeGenderTriggers;
            self->_excludeGenderTriggers = v146;

          }
          else
          {
            v219 = 0;
          }

          goto LABEL_82;
        }
      }
      else
      {

      }
      v206 = 0;
      goto LABEL_70;
    }
    objc_msgSend_objectForKeyedSubscript_(location, v21, (uint64_t)CFSTR("captionModel"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      log = 0;
      goto LABEL_34;
    }
    log = v23;
    objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)CFSTR("minimumConfidence"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(log, v27, (uint64_t)CFSTR("minimumConfidence"), v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend_doubleValue(v20, v29, v30, v31);
        self->_captionModelMinimumConfidence = v32;
      }
    }
    else
    {

      v20 = 0;
    }
    objc_msgSend_objectForKeyedSubscript_(log, v29, (uint64_t)CFSTR("lengthNormalizationFactor"), v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(log, v35, (uint64_t)CFSTR("lengthNormalizationFactor"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend_doubleValue(v37, v38, v39, v40);
        self->_captionModelLengthNormalizationFactor = v41;
      }
    }
    else
    {

      v37 = 0;
    }
    objc_msgSend_objectForKeyedSubscript_(log, v38, (uint64_t)CFSTR("excludeGenderStrategy"), v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(log, v43, (uint64_t)CFSTR("excludeGenderStrategy"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v45)
      {
LABEL_32:

        goto LABEL_33;
      }
      self->_excludeGenderStrategy = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48);
    }
    else
    {
      v45 = v42;
    }

    goto LABEL_32;
  }
  if (qword_1EEEB2D38 != -1)
    dispatch_once(&qword_1EEEB2D38, &unk_1E60CDAE8);
  v33 = (id)qword_1EEEB2D30;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v236 = v210;
    _os_log_error_impl(&dword_1B02D2000, v33, OS_LOG_TYPE_ERROR, "Could not load the contents of file at %@", buf, 0xCu);
  }

LABEL_121:
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

- (NSDictionary)classifierRevisions
{
  return self->_classifierRevisions;
}

- (void)setClassifierRevisions:(id)a3
{
  objc_storeStrong((id *)&self->_classifierRevisions, a3);
}

- (NSDictionary)sensitiveImageParameters
{
  return self->_sensitiveImageParameters;
}

- (void)setSensitiveImageParameters:(id)a3
{
  objc_storeStrong((id *)&self->_sensitiveImageParameters, a3);
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
  objc_storeStrong((id *)&self->_sensitiveImageParameters, 0);
  objc_storeStrong((id *)&self->_classifierRevisions, 0);
}

@end
