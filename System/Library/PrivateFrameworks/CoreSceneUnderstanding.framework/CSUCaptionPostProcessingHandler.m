@implementation CSUCaptionPostProcessingHandler

- (CSUCaptionPostProcessingHandler)initWithRuntimeParameters:(id)a3
{
  id v4;
  CSUCaptionPostProcessingHandler *v5;
  CSUCaptionPostProcessingHandler *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSCharacterSet *trimSet;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSUCaptionPostProcessingHandler;
  v5 = -[CSUCaptionPostProcessingHandler init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_runtimeParameters, v4);
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], v7, (uint64_t)CFSTR(" "), v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    trimSet = v6->_trimSet;
    v6->_trimSet = (NSCharacterSet *)v10;

  }
  return v6;
}

- (id)postProcessCaptions:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v18;
  id v19;

  v6 = *(_QWORD *)&a4;
  v19 = 0;
  objc_msgSend__excludeGenderReplacements_genderOption_error_(self, a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)&v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if (v9)
  {
    v11 = v9;
    if (a5)
    {
      v11 = objc_retainAutorelease(v9);
      v12 = 0;
      *a5 = v11;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v18 = 0;
    objc_msgSend__excludeGenderTriggers_genderOption_error_(self, v10, (uint64_t)v8, v6, (uint64_t)&v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;

    if (v11)
    {
      if (a5)
      {
        v11 = objc_retainAutorelease(v11);
        v12 = 0;
        *a5 = v11;
      }
      else
      {
        v12 = 0;
      }
      v8 = v13;
    }
    else
    {
      objc_msgSend__replacements_genderOption_(self, v14, (uint64_t)v13, v6, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v16;
      v11 = 0;
      v8 = v12;
    }
  }

  return v12;
}

- (id)_excludeGenderReplacements:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t j;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
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
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t *v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t k;
  void *v139;
  id v140;
  void *v141;
  NSObject *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  id v149;
  id obj;
  id obja;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  CSUCaptionPostProcessingHandler *v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  uint64_t v177;

  v177 = *MEMORY[0x24BDAC8D0];
  v149 = a3;
  v156 = self;
  objc_msgSend_runtimeParameters(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_genderOption(v11, v12, v13, v14, v15);

  if (a4 != 1 || v16)
  {
    v141 = v149;
    v140 = v149;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v17, v18, v19, v20);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    obj = v149;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v169, (uint64_t)v176, 16);
    if (v22)
    {
      v152 = *(_QWORD *)v170;
      do
      {
        v154 = v22;
        for (i = 0; i != v154; ++i)
        {
          if (*(_QWORD *)v170 != v152)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v27, v23, (uint64_t)off_256941598, v24, v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithSpaceAtEnds(v28, v29, v30, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v167 = 0u;
          v168 = 0u;
          v165 = 0u;
          v166 = 0u;
          objc_msgSend_runtimeParameters(v156, v34, v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_excludeGenderReplacements(v38, v39, v40, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v165, (uint64_t)v175, 16);
          if (v49)
          {
            v50 = *(_QWORD *)v166;
            do
            {
              v51 = 0;
              v52 = v33;
              do
              {
                if (*(_QWORD *)v166 != v50)
                  objc_enumerationMutation(v43);
                v53 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * v51);
                v54 = (void *)objc_msgSend_mutableCopy(v52, v45, v46, v47, v48);
                objc_msgSend_replacementKey(v53, v55, v56, v57, v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_replacementValue(v53, v60, v61, v62, v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = objc_msgSend_length(v52, v65, v66, v67, v68);
                objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v54, v70, (uint64_t)v59, (uint64_t)v64, 0, 0, v69);

                v33 = (void *)objc_msgSend_copy(v54, v71, v72, v73, v74);
                ++v51;
                v52 = v33;
              }
              while (v49 != v51);
              v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v45, (uint64_t)&v165, (uint64_t)v175, 16);
            }
            while (v49);
          }

          v79 = (void *)objc_msgSend_mutableCopy(v27, v75, v76, v77, v78);
          objc_msgSend_trimSet(v156, v80, v81, v82, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByTrimmingCharactersInSet_(v33, v85, (uint64_t)v84, v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v79, v89, (uint64_t)v88, (uint64_t)off_256941598, v90);

          v95 = (void *)objc_msgSend_copy(v79, v91, v92, v93, v94);
          objc_msgSend_addObject_(v153, v96, (uint64_t)v95, v97, v98);

        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v169, (uint64_t)v176, 16);
      }
      while (v22);
    }

    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    obja = v153;
    v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v99, (uint64_t)&v161, (uint64_t)v174, 16);
    if (v103)
    {
      v104 = *(_QWORD *)v162;
      v105 = (uint64_t *)&off_256941598;
      do
      {
        for (j = 0; j != v103; ++j)
        {
          if (*(_QWORD *)v162 != v104)
            objc_enumerationMutation(obja);
          objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v161 + 1) + 8 * j), v100, *v105, v101, v102);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithSpaceAtEnds(v107, v108, v109, v110, v111);
          v155 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_whitespaceCharacterSet(MEMORY[0x24BDD14A8], v112, v113, v114, v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsSeparatedByCharactersInSet_(v155, v117, (uint64_t)v116, v118, v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          v159 = 0u;
          v160 = 0u;
          v157 = 0u;
          v158 = 0u;
          objc_msgSend_runtimeParameters(v156, v121, v122, v123, v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_genderedTokens(v125, v126, v127, v128, v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();

          v131 = v105;
          v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v132, (uint64_t)&v157, (uint64_t)v173, 16);
          if (v136)
          {
            v137 = *(_QWORD *)v158;
            while (2)
            {
              for (k = 0; k != v136; ++k)
              {
                if (*(_QWORD *)v158 != v137)
                  objc_enumerationMutation(v130);
                if (objc_msgSend_indexOfObject_(v120, v133, *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * k), v134, v135) != 0x7FFFFFFFFFFFFFFFLL)
                {

                  sub_23A016E78();
                  v142 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
                    sub_23A09E700(v142, v143, v144);

                  if (a5)
                  {
                    objc_msgSend_errorWithCode_message_(CSUError, v145, 2, (uint64_t)CFSTR("Found gender token, reporting error multiple-gender-words"), v146);
                    *a5 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  v140 = 0;
                  v139 = obja;
                  goto LABEL_39;
                }
              }
              v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v133, (uint64_t)&v157, (uint64_t)v173, 16);
              if (v136)
                continue;
              break;
            }
          }

          v105 = v131;
        }
        v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v100, (uint64_t)&v161, (uint64_t)v174, 16);
      }
      while (v103);
    }

    v139 = obja;
    v140 = obja;
LABEL_39:

    v141 = v149;
  }

  return v140;
}

- (id)_excludeGenderTriggers:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
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
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL4 v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v85;
  uint64_t v86;
  id *v87;
  id v88;
  uint64_t v89;
  void *v90;
  CSUCaptionPostProcessingHandler *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t v97;
  _BYTE v98[15];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v91 = self;
  objc_msgSend_runtimeParameters(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_genderOption(v13, v14, v15, v16, v17);

  if (a4 == 1 && v18 == 1)
  {
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v19 = v8;
    v90 = v19;
    v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v103, (uint64_t)v109, 16);
    if (v85)
    {
      v88 = v8;
      v89 = *(_QWORD *)v104;
      v87 = a5;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v104 != v89)
            objc_enumerationMutation(v19);
          objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v103 + 1) + 8 * v24), v21, (uint64_t)off_256941598, v22, v23, v85);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v24;
          objc_msgSend_stringWithSpaceAtEnds(v25, v26, v27, v28, v29);
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_whitespaceCharacterSet(MEMORY[0x24BDD14A8], v30, v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsSeparatedByCharactersInSet_(v92, v35, (uint64_t)v34, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          objc_msgSend_runtimeParameters(v91, v39, v40, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_excludeGenderTriggers(v43, v44, v45, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v99, (uint64_t)v108, 16);
          if (v54)
          {
            v55 = *(_QWORD *)v100;
            while (2)
            {
              for (i = 0; i != v54; ++i)
              {
                if (*(_QWORD *)v100 != v55)
                  objc_enumerationMutation(v48);
                v57 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
                objc_msgSend_triggerTokens(v57, v50, v51, v52, v53);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend_count(v58, v59, v60, v61, v62) == 0;

                if (v63)
                {
                  sub_23A016E78();
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                    sub_23A09E738(&v97, v98, v68);
                }
                else
                {
                  v95 = 0u;
                  v96 = 0u;
                  v93 = 0u;
                  v94 = 0u;
                  objc_msgSend_triggerTokens(v57, v64, v65, v66, v67);
                  v68 = objc_claimAutoreleasedReturnValue();
                  v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v93, (uint64_t)v107, 16);
                  if (!v73)
                  {
LABEL_31:

                    sub_23A016E78();
                    v77 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                      sub_23A09E76C(v77, v78, v79);

                    objc_msgSend_errorWithCode_message_(CSUError, v80, 2, (uint64_t)CFSTR("Found trigger tokens, reporting error: Found-exclude-gender-trigger"), v81);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    v83 = v82;
                    if (v87)
                      *v87 = objc_retainAutorelease(v82);

                    v76 = 0;
                    v8 = v88;
                    goto LABEL_36;
                  }
                  v74 = *(_QWORD *)v94;
LABEL_16:
                  v75 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v94 != v74)
                      objc_enumerationMutation(v68);
                    if (objc_msgSend_indexOfObject_(v38, v70, *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v75), v71, v72) == 0x7FFFFFFFFFFFFFFFLL)
                      break;
                    if (v73 == ++v75)
                    {
                      v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v70, (uint64_t)&v93, (uint64_t)v107, 16);
                      if (v73)
                        goto LABEL_16;
                      goto LABEL_31;
                    }
                  }
                }

              }
              v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v99, (uint64_t)v108, 16);
              if (v54)
                continue;
              break;
            }
          }

          v24 = v86 + 1;
          v8 = v88;
          v19 = v90;
        }
        while (v86 + 1 != v85);
        v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v21, (uint64_t)&v103, (uint64_t)v109, 16);
      }
      while (v85);
    }

  }
  v76 = v8;
LABEL_36:

  return v76;
}

- (id)_replacements:(id)a3 genderOption:(int)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
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
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  BOOL v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  unsigned int v65;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  id v126;
  id obj;
  uint64_t v128;
  id v129;
  uint64_t v130;
  void *v131;
  uint64_t i;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x24BDAC8D0];
  v126 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6, v7, v8);
  v129 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x24BDD1650], v9, v10, v11, v12);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  obj = v126;
  v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v139, (uint64_t)v144, 16);
  if (v130)
  {
    v128 = *(_QWORD *)v140;
    v17 = a4;
    do
    {
      for (i = 0; i != v130; ++i)
      {
        if (*(_QWORD *)v140 != v128)
          objc_enumerationMutation(obj);
        v131 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v131, v14, (uint64_t)off_256941598, v15, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithSpaceAtEnds(v18, v19, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v137 = 0u;
        v138 = 0u;
        v135 = 0u;
        v136 = 0u;
        objc_msgSend_runtimeParameters(self, v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_replacements(v28, v29, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v135, (uint64_t)v143, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v136;
LABEL_8:
          v41 = 0;
          while (1)
          {
            if (*(_QWORD *)v136 != v40)
              objc_enumerationMutation(v33);
            v42 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v41);
            objc_msgSend_genderOption(v42, v35, v36, v37, v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43 == 0;

            if (!v44)
            {
              objc_msgSend_genderOption(v42, v45, v46, v47, v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend_unsignedIntegerValue(v49, v50, v51, v52, v53) == v17;

              if (!v54)
                break;
            }
            objc_msgSend_replacementKey(v42, v45, v46, v47, v48);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend_rangeOfString_(v23, v56, (uint64_t)v55, v57, v58) == 0x7FFFFFFFFFFFFFFFLL;

            if (!v59)
            {
              objc_msgSend_objectForKey_(v134, v35, (uint64_t)v42, v37, v38);
              v64 = (id)objc_claimAutoreleasedReturnValue();
              if (!v64)
              {
                v65 = objc_msgSend_length(v23, v60, v61, v62, v63);
                srand(v65);
                v66 = rand();
                objc_msgSend_replacementProb(v42, v67, v68, v69, v70);
                v72 = (void *)MEMORY[0x24BDBD1C0];
                if (v66 % 100 < (int)(v71 * 100.0))
                  v72 = (void *)MEMORY[0x24BDBD1C8];
                v64 = v72;
                objc_msgSend_setObject_forKey_(v134, v73, (uint64_t)v64, (uint64_t)v42, v74);
              }
              if (objc_msgSend_BOOLValue(v64, v60, v61, v62, v63))
              {
                v79 = (void *)objc_msgSend_mutableCopy(v23, v75, v76, v77, v78);
                objc_msgSend_replacementKey(v42, v80, v81, v82, v83);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_replacementValue(v42, v85, v86, v87, v88);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = objc_msgSend_length(v23, v90, v91, v92, v93);
                objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v79, v95, (uint64_t)v84, (uint64_t)v89, 0, 0, v94);

                v100 = objc_msgSend_copy(v79, v96, v97, v98, v99);
                v23 = (void *)v100;
              }

            }
            if (v39 == ++v41)
            {
              v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v135, (uint64_t)v143, 16);
              if (v39)
                goto LABEL_8;
              break;
            }
          }
        }

        v105 = (void *)objc_msgSend_mutableCopy(v131, v101, v102, v103, v104);
        objc_msgSend_trimSet(self, v106, v107, v108, v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByTrimmingCharactersInSet_(v23, v111, (uint64_t)v110, v112, v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v105, v115, (uint64_t)v114, (uint64_t)off_256941598, v116);

        v121 = (void *)objc_msgSend_copy(v105, v117, v118, v119, v120);
        objc_msgSend_addObject_(v129, v122, (uint64_t)v121, v123, v124);

      }
      v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v139, (uint64_t)v144, 16);
    }
    while (v130);
  }

  return v129;
}

- (id)_checkForBlockingTokens:(id)a3 blockingTokens:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v53;
  void *v54;
  id obj;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t i;
  uint64_t v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v53 = a3;
  v57 = a4;
  if (objc_msgSend_count(v57, v5, v6, v7, v8))
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v9, v10, v11, v12);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v53;
    v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v71, (uint64_t)v79, 16);
    if (v58)
    {
      v56 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v72 != v56)
            objc_enumerationMutation(obj);
          v59 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v59, v14, (uint64_t)off_256941598, v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v62 = v57;
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v18, (uint64_t)&v67, (uint64_t)v78, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v68;
            while (2)
            {
              v21 = 0;
              v61 = v19;
              do
              {
                if (*(_QWORD *)v68 != v20)
                  objc_enumerationMutation(v62);
                v22 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v21);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v23 = (void *)v22;
                else
                  v23 = 0;
                v24 = v23;
                if (v24)
                {
                  v28 = v24;
                  if (objc_msgSend_rangeOfString_(v17, v25, v22, v26, v27) != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    sub_23A016E78();
                    v45 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v77 = v22;
                      _os_log_debug_impl(&dword_239FE9000, v45, OS_LOG_TYPE_DEBUG, "Found %@ in the caption", buf, 0xCu);
                    }
LABEL_42:

                    goto LABEL_43;
                  }
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v29 = (void *)v22;
                  else
                    v29 = 0;
                  v30 = v29;
                  v28 = v30;
                  if (v30)
                  {
                    v65 = 0u;
                    v66 = 0u;
                    v63 = 0u;
                    v64 = 0u;
                    v31 = v30;
                    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v63, (uint64_t)v75, 16);
                    if (v36)
                    {
                      v37 = *(_QWORD *)v64;
                      while (2)
                      {
                        for (j = 0; j != v36; ++j)
                        {
                          if (*(_QWORD *)v64 != v37)
                            objc_enumerationMutation(v31);
                          v39 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
                          if (objc_msgSend_rangeOfString_(v17, v33, v39, v34, v35) == 0x7FFFFFFFFFFFFFFFLL)
                          {
                            sub_23A016E78();
                            v40 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 138412290;
                              v77 = v39;
                              _os_log_debug_impl(&dword_239FE9000, v40, OS_LOG_TYPE_DEBUG, "Did not find %@ in the caption", buf, 0xCu);
                            }

                            v19 = v61;
                            goto LABEL_34;
                          }
                        }
                        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v33, (uint64_t)&v63, (uint64_t)v75, 16);
                        if (v36)
                          continue;
                        break;
                      }
                    }

                    sub_23A016E78();
                    v45 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v77 = (uint64_t)v31;
                      _os_log_debug_impl(&dword_239FE9000, v45, OS_LOG_TYPE_DEBUG, "Found all tokens %@ in the caption", buf, 0xCu);
                    }
                    v28 = v31;
                    goto LABEL_42;
                  }
                }
LABEL_34:

                ++v21;
              }
              while (v21 != v19);
              v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v41, (uint64_t)&v67, (uint64_t)v78, 16);
              if (v19)
                continue;
              break;
            }
          }

          objc_msgSend_addObject_(v54, v42, (uint64_t)v59, v43, v44);
LABEL_43:

        }
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v71, (uint64_t)v79, 16);
      }
      while (v58);
    }

    v51 = (id)objc_msgSend_copy(v54, v47, v48, v49, v50);
  }
  else
  {
    v51 = v53;
  }

  return v51;
}

- (id)postProcessResults:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  id v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  CSUCaptionResult *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  id v69;
  void *v71;
  void *v74;
  id obj;
  id obja;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _QWORD v88[3];
  _QWORD v89[3];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v69 = a3;
  v77 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend_results(v69, v5, v6, v7, v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v83, (uint64_t)v90, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v84;
    v16 = MEMORY[0x24BDBD1C0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v84 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        v88[0] = off_256941598;
        objc_msgSend_caption(v18, v10, v11, v12, v13, v69);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = v19;
        v88[1] = off_2569415A0;
        v20 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_score(v18, v21, v22, v23, v24);
        objc_msgSend_numberWithFloat_(v20, v25, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v88[2] = off_2569415A8;
        v89[1] = v29;
        v89[2] = v16;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)v89, (uint64_t)v88, 3);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addObject_(v77, v32, (uint64_t)v31, v33, v34);
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v83, (uint64_t)v90, 16);
    }
    while (v14);
  }

  v82 = 0;
  objc_msgSend_postProcessCaptions_genderOption_error_(self, v35, (uint64_t)v77, a4, (uint64_t)&v82);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v82;
  v71 = v36;
  if (v36)
  {
    v37 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v36);
  }
  else
  {
    v38 = (void *)objc_opt_new();
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    obja = v74;
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v39, (uint64_t)&v78, (uint64_t)v87, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v79 != v41)
            objc_enumerationMutation(obja);
          v43 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
          v44 = [CSUCaptionResult alloc];
          objc_msgSend_objectForKeyedSubscript_(v43, v45, (uint64_t)off_256941598, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v43, v49, (uint64_t)off_2569415A0, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatValue(v52, v53, v54, v55, v56);
          v60 = (void *)objc_msgSend_initWithCaption_score_(v44, v57, (uint64_t)v48, v58, v59);

          objc_msgSend_addObject_(v38, v61, (uint64_t)v60, v62, v63);
        }
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v64, (uint64_t)&v78, (uint64_t)v87, 16);
      }
      while (v40);
    }

    objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v65, (uint64_t)v38, v66, v67);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v37;
}

- (NSCharacterSet)trimSet
{
  return (NSCharacterSet *)objc_getProperty(self, a2, 8, 1);
}

- (CSUCaptionRuntimeParameters)runtimeParameters
{
  return (CSUCaptionRuntimeParameters *)objc_loadWeakRetained((id *)&self->_runtimeParameters);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_runtimeParameters);
  objc_storeStrong((id *)&self->_trimSet, 0);
}

@end
