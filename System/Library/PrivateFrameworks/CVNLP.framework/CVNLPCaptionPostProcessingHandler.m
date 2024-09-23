@implementation CVNLPCaptionPostProcessingHandler

- (CVNLPCaptionPostProcessingHandler)initWithOptions:(id)a3 runtimeParameters:(id)a4
{
  id v5;
  CVNLPCaptionPostProcessingHandler *v6;
  CVNLPCaptionPostProcessingHandler *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSCharacterSet *trimSet;
  objc_super v13;

  v5 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CVNLPCaptionPostProcessingHandler;
  v6 = -[CVNLPCaptionPostProcessingHandler init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_runtimeParameters, v5);
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v8, (uint64_t)CFSTR(" "), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    trimSet = v7->_trimSet;
    v7->_trimSet = (NSCharacterSet *)v10;

  }
  return v7;
}

- (id)postProcessCaptions:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;

  v6 = *(_QWORD *)&a4;
  *a5 = 0;
  objc_msgSend__excludeGenderReplacements_genderOption_error_(self, a2, (uint64_t)a3, *(uint64_t *)&a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v8;
  if (*a5)
  {
    v11 = 0;
    v12 = (void *)v8;
  }
  else
  {
    objc_msgSend__excludeGenderTriggers_genderOption_error_(self, v9, v8, v6, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (*a5)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend__replacements_genderOption_(self, v13, (uint64_t)v12, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v14;
      v12 = v11;
    }
  }

  return v11;
}

- (id)postProcessCaptions:(id)a3 visionObservations:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend__checkForBlockingTokens_visionObservations_(self, v8, (uint64_t)v6, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__filterVisionObservations_(self, v10, (uint64_t)v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CVNLPCaptions;
  v16[1] = CVNLPImageClassificationIdentifiers;
  v17[0] = v9;
  v17[1] = v12;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v17, (uint64_t)v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_excludeGenderReplacements:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t j;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t k;
  void *v114;
  id v115;
  void *v116;
  const char *v117;
  id v120;
  id obj;
  id obja;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  CVNLPCaptionPostProcessingHandler *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v120 = a3;
  v127 = self;
  objc_msgSend_runtimeParameters(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_genderOption(v10, v11, v12, v13);

  if (a4 != 1 || v14)
  {
    v116 = v120;
    v115 = v120;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v15, v16, v17);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    obj = v120;
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v140, (uint64_t)v147, 16);
    if (v19)
    {
      v123 = *(_QWORD *)v141;
      do
      {
        v125 = v19;
        for (i = 0; i != v125; ++i)
        {
          if (*(_QWORD *)v141 != v123)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v23, v20, (uint64_t)CVNLPGeneratedCaption, v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithSpaceAtEnds(v24, v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          objc_msgSend_runtimeParameters(v127, v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_excludeGenderReplacements(v32, v33, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v136, (uint64_t)v146, 16);
          if (v41)
          {
            v42 = *(_QWORD *)v137;
            do
            {
              v43 = 0;
              v44 = v28;
              do
              {
                if (*(_QWORD *)v137 != v42)
                  objc_enumerationMutation(v36);
                v45 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v43);
                v46 = (void *)objc_msgSend_mutableCopy(v44, v38, v39, v40);
                objc_msgSend_replacementKey(v45, v47, v48, v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_replacementValue(v45, v51, v52, v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend_length(v44, v55, v56, v57);
                objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v46, v59, (uint64_t)v50, (uint64_t)v54, 0, 0, v58);

                v28 = (void *)objc_msgSend_copy(v46, v60, v61, v62);
                ++v43;
                v44 = v28;
              }
              while (v41 != v43);
              v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v38, (uint64_t)&v136, (uint64_t)v146, 16);
            }
            while (v41);
          }

          v66 = (void *)objc_msgSend_mutableCopy(v23, v63, v64, v65);
          objc_msgSend_trimSet(v127, v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByTrimmingCharactersInSet_(v28, v71, (uint64_t)v70, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v66, v74, (uint64_t)v73, (uint64_t)CVNLPGeneratedCaption);

          v78 = (void *)objc_msgSend_copy(v66, v75, v76, v77);
          objc_msgSend_addObject_(v124, v79, (uint64_t)v78, v80);

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v140, (uint64_t)v147, 16);
      }
      while (v19);
    }

    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    obja = v124;
    v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v81, (uint64_t)&v132, (uint64_t)v145, 16);
    if (v84)
    {
      v85 = *(_QWORD *)v133;
      v86 = (uint64_t *)&CVNLPGeneratedCaption;
      do
      {
        for (j = 0; j != v84; ++j)
        {
          if (*(_QWORD *)v133 != v85)
            objc_enumerationMutation(obja);
          objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v132 + 1) + 8 * j), v82, *v86, v83);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithSpaceAtEnds(v88, v89, v90, v91);
          v126 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v92, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsSeparatedByCharactersInSet_(v126, v96, (uint64_t)v95, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          v130 = 0u;
          v131 = 0u;
          v128 = 0u;
          v129 = 0u;
          objc_msgSend_runtimeParameters(v127, v99, v100, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_genderedTokens(v102, v103, v104, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          v107 = v86;
          v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v108, (uint64_t)&v128, (uint64_t)v144, 16);
          if (v111)
          {
            v112 = *(_QWORD *)v129;
            while (2)
            {
              for (k = 0; k != v111; ++k)
              {
                if (*(_QWORD *)v129 != v112)
                  objc_enumerationMutation(v106);
                if (objc_msgSend_indexOfObject_(v98, v109, *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * k), v110) != 0x7FFFFFFFFFFFFFFFLL)
                {

                  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v117, (uint64_t)CVNLPCationErrorDomain, 1001, 0);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

                  v115 = 0;
                  v114 = obja;
                  goto LABEL_35;
                }
              }
              v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v109, (uint64_t)&v128, (uint64_t)v144, 16);
              if (v111)
                continue;
              break;
            }
          }

          v86 = v107;
        }
        v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v82, (uint64_t)&v132, (uint64_t)v145, 16);
      }
      while (v84);
    }

    v114 = obja;
    v115 = obja;
LABEL_35:

    v116 = v120;
  }

  return v115;
}

- (id)_excludeGenderTriggers:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  id v62;
  const char *v63;
  uint64_t v65;
  id *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  CVNLPCaptionPostProcessingHandler *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v71 = self;
  objc_msgSend_runtimeParameters(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_genderOption(v12, v13, v14, v15);

  if (a4 == 1 && v16 == 1)
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v17 = v8;
    v70 = v17;
    v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v81, (uint64_t)v87, 16);
    if (v67)
    {
      v21 = *(_QWORD *)v82;
      v69 = v8;
      v65 = *(_QWORD *)v82;
      v66 = a5;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v82 != v21)
            objc_enumerationMutation(v17);
          objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v81 + 1) + 8 * v22), v19, (uint64_t)CVNLPGeneratedCaption, v20, v65);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v22;
          objc_msgSend_stringWithSpaceAtEnds(v23, v24, v25, v26);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsSeparatedByCharactersInSet_(v72, v31, (uint64_t)v30, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          objc_msgSend_runtimeParameters(v71, v34, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_excludeGenderTriggers(v37, v38, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v77, (uint64_t)v86, 16);
          if (v46)
          {
            v47 = *(_QWORD *)v78;
            while (2)
            {
              for (i = 0; i != v46; ++i)
              {
                if (*(_QWORD *)v78 != v47)
                  objc_enumerationMutation(v41);
                v49 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
                objc_msgSend_triggerTokens(v49, v43, v44, v45);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend_count(v50, v51, v52, v53) == 0;

                if (!v54)
                {
                  v75 = 0u;
                  v76 = 0u;
                  v73 = 0u;
                  v74 = 0u;
                  objc_msgSend_triggerTokens(v49, v43, v44, v45);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v73, (uint64_t)v85, 16);
                  if (v59)
                  {
                    v60 = *(_QWORD *)v74;
                    do
                    {
                      for (j = 0; j != v59; ++j)
                      {
                        if (*(_QWORD *)v74 != v60)
                          objc_enumerationMutation(v55);
                        if (objc_msgSend_indexOfObject_(v33, v57, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j), v58) == 0x7FFFFFFFFFFFFFFFLL)
                        {

                          goto LABEL_12;
                        }
                      }
                      v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v57, (uint64_t)&v73, (uint64_t)v85, 16);
                    }
                    while (v59);
                  }

                  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v63, (uint64_t)CVNLPCationErrorDomain, 1002, 0);
                  *v66 = (id)objc_claimAutoreleasedReturnValue();

                  v62 = 0;
                  v8 = v69;
                  goto LABEL_31;
                }
LABEL_12:
                ;
              }
              v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v43, (uint64_t)&v77, (uint64_t)v86, 16);
              if (v46)
                continue;
              break;
            }
          }

          v22 = v68 + 1;
          v8 = v69;
          v17 = v70;
          v21 = v65;
        }
        while (v68 + 1 != v67);
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v19, (uint64_t)&v81, (uint64_t)v87, 16);
      }
      while (v67);
    }

  }
  v62 = v8;
LABEL_31:

  return v62;
}

- (id)_replacements:(id)a3 genderOption:(int)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  BOOL v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  BOOL v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  unsigned int v54;
  int v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
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
  void *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  id v102;
  id obj;
  uint64_t v104;
  id v105;
  uint64_t v106;
  void *v107;
  uint64_t i;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v102 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7);
  v105 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v8, v9, v10);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  obj = v102;
  v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v115, (uint64_t)v120, 16);
  if (v106)
  {
    v104 = *(_QWORD *)v116;
    v14 = a4;
    do
    {
      for (i = 0; i != v106; ++i)
      {
        if (*(_QWORD *)v116 != v104)
          objc_enumerationMutation(obj);
        v107 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v107, v12, (uint64_t)CVNLPGeneratedCaption, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithSpaceAtEnds(v15, v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        objc_msgSend_runtimeParameters(self, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_replacements(v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v111, (uint64_t)v119, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v112;
LABEL_8:
          v34 = 0;
          while (1)
          {
            if (*(_QWORD *)v112 != v33)
              objc_enumerationMutation(v27);
            v35 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v34);
            objc_msgSend_genderOption(v35, v29, v30, v31);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36 == 0;

            if (!v37)
            {
              objc_msgSend_genderOption(v35, v38, v39, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend_unsignedIntegerValue(v41, v42, v43, v44) == v14;

              if (!v45)
                break;
            }
            objc_msgSend_replacementKey(v35, v38, v39, v40);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend_rangeOfString_(v19, v47, (uint64_t)v46, v48) == 0x7FFFFFFFFFFFFFFFLL;

            if (!v49)
            {
              objc_msgSend_objectForKey_(v110, v29, (uint64_t)v35, v31);
              v53 = (id)objc_claimAutoreleasedReturnValue();
              if (!v53)
              {
                v54 = objc_msgSend_length(v19, v50, v51, v52);
                srand(v54);
                v55 = rand();
                objc_msgSend_replacementProb(v35, v56, v57, v58);
                v60 = (void *)MEMORY[0x1E0C9AAA0];
                if (v55 % 100 < (int)(v59 * 100.0))
                  v60 = (void *)MEMORY[0x1E0C9AAB0];
                v53 = v60;
                objc_msgSend_setObject_forKey_(v110, v61, (uint64_t)v53, (uint64_t)v35);
              }
              if (objc_msgSend_BOOLValue(v53, v50, v51, v52))
              {
                v65 = (void *)objc_msgSend_mutableCopy(v19, v62, v63, v64);
                objc_msgSend_replacementKey(v35, v66, v67, v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_replacementValue(v35, v70, v71, v72);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = objc_msgSend_length(v19, v74, v75, v76);
                objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v65, v78, (uint64_t)v69, (uint64_t)v73, 0, 0, v77);

                v82 = objc_msgSend_copy(v65, v79, v80, v81);
                v19 = (void *)v82;
              }

            }
            if (v32 == ++v34)
            {
              v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v111, (uint64_t)v119, 16);
              if (v32)
                goto LABEL_8;
              break;
            }
          }
        }

        v86 = (void *)objc_msgSend_mutableCopy(v107, v83, v84, v85);
        objc_msgSend_trimSet(self, v87, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByTrimmingCharactersInSet_(v19, v91, (uint64_t)v90, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v86, v94, (uint64_t)v93, (uint64_t)CVNLPGeneratedCaption);

        v98 = (void *)objc_msgSend_copy(v86, v95, v96, v97);
        objc_msgSend_addObject_(v105, v99, (uint64_t)v98, v100);

      }
      v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v115, (uint64_t)v120, 16);
    }
    while (v106);
  }

  return v105;
}

- (BOOL)_checkAboveThreshold:(id)a3 observationConfidence:(double)a4 difference:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  void *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;

  v8 = a3;
  objc_msgSend_runtimeParameters(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sensitiveImageParameters(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && (objc_msgSend_minConfidence(v19, v20, v21, v22), v26 < a4))
  {
    if (a5)
    {
      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_minConfidence(v19, v23, v24, v25);
      objc_msgSend_numberWithDouble_(v27, v29, v30, v31, a4 - v28);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = 1;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)_checkForBlockingTokens:(id)a3 blockingTokens:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  const char *v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v39;
  void *v40;
  id obj;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t i;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v43 = a4;
  if (objc_msgSend_count(v43, v5, v6, v7))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v39;
    v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v56, (uint64_t)v62, 16);
    if (v44)
    {
      v42 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v57 != v42)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v45, v12, (uint64_t)CVNLPGeneratedCaption, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v47 = v43;
          v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v15, (uint64_t)&v52, (uint64_t)v61, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v53;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v53 != v17)
                  objc_enumerationMutation(v47);
                v20 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v21 = v20;
                else
                  v21 = 0;
                if (v21)
                {
                  if (objc_msgSend_rangeOfString_(v14, v22, (uint64_t)v20, v23) != 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_37;
LABEL_11:

                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v24 = v20;
                  else
                    v24 = 0;
                  v25 = v24;
                  if (v25)
                  {
                    v50 = 0u;
                    v51 = 0u;
                    v48 = 0u;
                    v49 = 0u;
                    v20 = v25;
                    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v26, (uint64_t)&v48, (uint64_t)v60, 16);
                    if (v29)
                    {
                      v30 = *(_QWORD *)v49;
                      do
                      {
                        for (k = 0; k != v29; ++k)
                        {
                          if (*(_QWORD *)v49 != v30)
                            objc_enumerationMutation(v20);
                          if (objc_msgSend_rangeOfString_(v14, v27, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k), v28) == 0x7FFFFFFFFFFFFFFFLL)
                          {

                            goto LABEL_11;
                          }
                        }
                        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v27, (uint64_t)&v48, (uint64_t)v60, 16);
                      }
                      while (v29);
                    }

LABEL_37:
                    goto LABEL_38;
                  }
                }
              }
              v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v19, (uint64_t)&v52, (uint64_t)v61, 16);
              if (v16)
                continue;
              break;
            }
          }

          objc_msgSend_addObject_(v40, v32, (uint64_t)v45, v33);
LABEL_38:

        }
        v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v56, (uint64_t)v62, 16);
      }
      while (v44);
    }

    v37 = (id)objc_msgSend_copy(v40, v34, v35, v36);
  }
  else
  {
    v37 = v39;
  }

  return v37;
}

- (id)_checkForBlockingTokens:(id)a3 visionObservations:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  const char *v21;
  int v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = a4;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v42, (uint64_t)v46, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend_identifier(v15, v9, v10, v11, (_QWORD)v42);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_confidence(v15, v17, v18, v19);
        v22 = objc_msgSend__checkAboveThreshold_observationConfidence_difference_(self, v21, (uint64_t)v16, 0, v20);

        if (v22)
        {
          objc_msgSend_runtimeParameters(self, v9, v10, v11);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_sensitiveImageParameters(v23, v24, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v15, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v27, v32, (uint64_t)v31, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_blockingTokens(v34, v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__checkForBlockingTokens_blockingTokens_(self, v39, (uint64_t)v6, (uint64_t)v38);
          v40 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v40;
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v42, (uint64_t)v46, 16);
    }
    while (v12);
  }

  return v6;
}

- (id)_filterVisionObservations:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  const char *v19;
  int v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  id *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;
  int64_t v52;
  void *v53;
  uint64_t v55;
  float *v56;
  float *v57;
  float v58;
  float v59;
  id *v60;
  id v61;
  float *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id *v71;
  id *v72;
  void *v73;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  char *v81;
  id *v82;
  char *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v81 = 0;
  v82 = 0;
  v83 = 0;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v4 = a3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v77, (uint64_t)v84, 16);
  v75 = v4;
  v10 = 0;
  if (v9)
  {
    v11 = *(_QWORD *)v78;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v78 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v12);
        objc_msgSend_identifier(v13, v6, v7, v8, v75);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_confidence(v13, v15, v16, v17);
        v76 = 0;
        v20 = objc_msgSend__checkAboveThreshold_observationConfidence_difference_(self, v19, (uint64_t)v14, (uint64_t)&v76, v18);
        v21 = v76;

        if (v20)
        {
          objc_msgSend_floatValue(v21, v22, v23, v24);
          v26 = v25;
          objc_msgSend_identifier(v13, v27, v28, v29);
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v10 >= v83)
          {
            v33 = v81;
            v34 = (v10 - v81) >> 4;
            v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 60)
              sub_1B02D7758();
            v36 = v83 - v81;
            if ((v83 - v81) >> 3 > v35)
              v35 = v36 >> 3;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
              v37 = 0xFFFFFFFFFFFFFFFLL;
            else
              v37 = v35;
            if (v37 >> 60)
              sub_1B02D72AC();
            v38 = (char *)operator new(16 * v37);
            v39 = &v38[16 * v34];
            v40 = &v38[16 * v37];
            *(_DWORD *)v39 = v26;
            *((_QWORD *)v39 + 1) = v31;
            v32 = (id *)(v39 + 16);
            if (v10 == v33)
            {
              v81 = &v38[16 * v34];
              v82 = (id *)(v39 + 16);
              v83 = &v38[16 * v37];
              v4 = v75;
              if (!v10)
                goto LABEL_23;
            }
            else
            {
              v41 = v10;
              v4 = v75;
              do
              {
                v42 = *((_DWORD *)v41 - 4);
                v41 -= 16;
                *((_DWORD *)v39 - 4) = v42;
                v39 -= 16;
                v43 = *((_QWORD *)v41 + 1);
                *((_QWORD *)v41 + 1) = 0;
                *((_QWORD *)v39 + 1) = v43;
              }
              while (v41 != v33);
              v81 = v39;
              v82 = v32;
              v83 = v40;
              do
              {

                v10 -= 16;
              }
              while (v10 != v33);
              v10 = v33;
              if (!v33)
                goto LABEL_23;
            }
            operator delete(v10);
          }
          else
          {
            *(_DWORD *)v10 = v26;
            *((_QWORD *)v10 + 1) = v30;
            v32 = (id *)(v10 + 16);
          }
LABEL_23:
          v82 = v32;
          v10 = (char *)v32;
        }

        ++v12;
      }
      while (v12 != v9);
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v77, (uint64_t)v84, 16);
      v9 = v44;
      if (!v44)
      {
        v45 = (id *)v81;
        goto LABEL_31;
      }
    }
  }
  v45 = 0;
LABEL_31:

  v49 = v10 - (char *)v45;
  if (v10 - (char *)v45 >= 17)
  {
    v50 = v49 >> 4;
    v51 = (unint64_t)((v49 >> 4) - 2) >> 1;
    v52 = v51;
    do
    {
      if (v51 >= v52)
      {
        v55 = (2 * v52) | 1;
        v56 = (float *)&v45[2 * v55];
        if (2 * v52 + 2 < v50 && *v56 < v56[4])
        {
          v56 += 4;
          v55 = 2 * v52 + 2;
        }
        v57 = (float *)&v45[2 * v52];
        v58 = *v56;
        v59 = *v57;
        if (*v56 >= *v57)
        {
          v60 = &v45[2 * v52];
          v61 = v60[1];
          v60[1] = 0;
          do
          {
            v62 = v57;
            v57 = v56;
            *v62 = v58;
            v63 = *((_QWORD *)v56 + 1);
            *((_QWORD *)v57 + 1) = 0;
            v64 = (void *)*((_QWORD *)v62 + 1);
            *((_QWORD *)v62 + 1) = v63;

            if (v51 < v55)
              break;
            v65 = 2 * v55;
            v55 = (2 * v55) | 1;
            v56 = (float *)&v45[2 * v55];
            v66 = v65 + 2;
            if (v66 < v50 && *v56 < v56[4])
            {
              v56 += 4;
              v55 = v66;
            }
            v58 = *v56;
          }
          while (*v56 >= v59);
          *v57 = v59;
          v53 = (void *)*((_QWORD *)v57 + 1);
          *((_QWORD *)v57 + 1) = v61;

        }
      }
    }
    while (v52-- > 0);
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v46, v47, v48, v75);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v82;
  if (v45 != v82)
  {
    v72 = v45;
    do
    {
      objc_msgSend_addObject_(v70, v67, (uint64_t)v72[1], v69);
      v72 += 2;
    }
    while (v72 != v71);
  }
  v73 = (void *)objc_msgSend_copy(v70, v67, v68, v69);

  if (v45)
  {
    for (; v71 != v45; v71 -= 2)

    operator delete(v45);
  }

  return v73;
}

- (NSCharacterSet)trimSet
{
  return (NSCharacterSet *)objc_getProperty(self, a2, 8, 1);
}

- (CVNLPCaptionRuntimeParameters)runtimeParameters
{
  return (CVNLPCaptionRuntimeParameters *)objc_loadWeakRetained((id *)&self->_runtimeParameters);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_runtimeParameters);
  objc_storeStrong((id *)&self->_trimSet, 0);
}

@end
