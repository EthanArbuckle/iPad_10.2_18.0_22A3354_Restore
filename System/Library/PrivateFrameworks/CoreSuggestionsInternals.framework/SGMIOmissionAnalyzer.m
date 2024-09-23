@implementation SGMIOmissionAnalyzer

+ (id)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v28;
  id v29;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v28) = 0;
  +[SGMIOmissionAnalyzer identifyComposeWarningsFromSubject:content:attributes:toRecipients:ccRecipients:bccRecipients:originalToRecipients:originalCcRecipients:attachments:language:store:disableConservativeCheckRequirement:](SGMIOmissionAnalyzer, "identifyComposeWarningsFromSubject:content:attributes:toRecipients:ccRecipients:bccRecipients:originalToRecipients:originalCcRecipients:attachments:language:store:disableConservativeCheckRequirement:", v25, v24, v23, v22, v21, v20, v19, v18, v17, 0, v26, v28);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 language:(id)a12 store:(id)a13 disableConservativeCheckRequirement:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  dispatch_block_t v33;
  NSObject *v34;
  id v35;
  void *v36;
  id v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint8_t buf[8];
  _QWORD block[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t *v65;
  id v66;
  BOOL v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v45 = a3;
  v41 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v43 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  if (identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasOnceToken2 != -1)
    dispatch_once(&identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasOnceToken2, &__block_literal_global_29303);
  v27 = (id)identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__29304;
  v72 = __Block_byref_object_dispose__29305;
  v73 = (id)MEMORY[0x1E0C9AA60];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_6;
  block[3] = &unk_1E7DB4C40;
  v65 = &v68;
  v66 = a1;
  v48 = v45;
  v54 = v48;
  v28 = v41;
  v55 = v28;
  v46 = v19;
  v56 = v46;
  v42 = v20;
  v57 = v42;
  v40 = v21;
  v58 = v40;
  v44 = v43;
  v59 = v44;
  v39 = v22;
  v60 = v39;
  v29 = v23;
  v61 = v29;
  v30 = v24;
  v62 = v30;
  v31 = v25;
  v63 = v31;
  v32 = v26;
  v64 = v32;
  v67 = a14;
  v33 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_async(v27, v33);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForBlock:timeoutSeconds:", v33, 0.25) == 1)
  {
    sgMailIntelligenceLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v34, OS_LOG_TYPE_ERROR, "SGMIOmissionAnalyzer: Mail Intelligence's SPI back end timed out", buf, 2u);
    }

    if (identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasOnceToken4 != -1)
      dispatch_once(&identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasOnceToken4, &__block_literal_global_10_29307);
    v35 = (id)identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult_8;
    v36 = (void *)MEMORY[0x1E0D81598];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_2;
    v49[3] = &unk_1E7DB7578;
    v51 = v33;
    v50 = v28;
    objc_msgSend(v36, "runAsyncOnQueue:afterDelaySeconds:block:", v35, v49, 5.0);

    v37 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v37 = (id)v69[5];
  }

  _Block_object_dispose(&v68, 8);
  return v37;
}

+ (id)_identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 language:(id)a12 store:(id)a13 disableConservativeCheckRequirement:(BOOL)a14
{
  id v19;
  id v20;
  __CFString *v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  id v29;
  __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t i;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t j;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  id v138;
  void *v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  int v154;
  NSObject *v155;
  _BOOL4 v156;
  void *v157;
  void *v158;
  uint64_t v159;
  id v160;
  NSObject *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  NSObject *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  void *v177;
  __CFString *v178;
  _BOOL4 v179;
  void *v180;
  void *v181;
  id v182;
  __CFString *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  int v193;
  void *v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  void *v200;
  void *v201;
  id v202;
  __CFString *v203;
  void *v204;
  __CFString *v205;
  id v206;
  id v207;
  _QWORD v208[4];
  id v209;
  _QWORD v210[4];
  id v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _BYTE v224[128];
  _BYTE v225[128];
  uint8_t v226[128];
  uint8_t buf[4];
  uint64_t v228;
  __int16 v229;
  void *v230;
  __int16 v231;
  void *v232;
  __int16 v233;
  void *v234;
  __int16 v235;
  void *v236;
  __int16 v237;
  id v238;
  __int16 v239;
  id v240;
  __int16 v241;
  void *v242;
  __int16 v243;
  uint64_t v244;
  __int16 v245;
  const __CFString *v246;
  uint64_t v247;

  v247 = *MEMORY[0x1E0C80C00];
  v199 = a3;
  v198 = a4;
  v182 = a5;
  v19 = a6;
  v206 = a7;
  v197 = a8;
  v195 = a9;
  v196 = a10;
  v20 = a11;
  v21 = (__CFString *)a12;
  v207 = a13;
  LODWORD(a7) = objc_msgSend(MEMORY[0x1E0D198F0], "mailIntelligenceSPILogging");
  sgMailIntelligenceLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  v183 = v21;
  v184 = v19;
  v187 = v20;
  if ((_DWORD)a7)
  {
    v24 = v199;
    if (v23)
    {
      objc_msgSend(v198, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "description");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "description");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "description");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "description");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v200 = (void *)v27;
      v202 = (id)objc_claimAutoreleasedReturnValue();
      if (v195)
      {
        objc_msgSend(v195, "description");
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = CFSTR("(null)");
      }
      v178 = v28;
      v180 = (void *)v26;
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (v196)
      {
        objc_msgSend(v196, "description");
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = CFSTR("(null)");
      }
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v30, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "description");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      v35 = v183;
      *(_DWORD *)buf = 138742275;
      if (!v183)
        v35 = CFSTR("(null)");
      v228 = (uint64_t)v199;
      v229 = 2117;
      v230 = v25;
      v231 = 2117;
      v232 = v180;
      v233 = 2117;
      v234 = v200;
      v235 = 2117;
      v236 = v204;
      v237 = 2117;
      v238 = v202;
      v239 = 2117;
      v240 = v29;
      v241 = 2117;
      v242 = v31;
      v243 = 2117;
      v244 = v33;
      v245 = 2112;
      v246 = v35;
      _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEFAULT, "SGMI-SPI (input)identifyComposeWarningsFromSubject:%{sensitive}@ content:%{sensitive}@ attributes:%{sensitive}@ toRecipients:%{sensitive}@ ccRecipients:%{sensitive}@ bccRecipients:%{sensitive}@ originalToRecipients:%{sensitive}@ originalCcRecipients:%{sensitive}@ attachments:%{sensitive}@ language:%@", buf, 0x66u);

      if (v196)
      if (v195)

      v21 = v183;
      v19 = v184;
      v20 = v187;
      v24 = v199;
    }
  }
  else
  {
    v24 = v199;
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEFAULT, "SGMI started omission analysis", buf, 2u);
    }
  }

  objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v206);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v38 = v21;
  }
  else
  {
    v39 = (void *)MEMORY[0x1E0D70A90];
    +[SGMessage preferredLanguages](SGMessage, "preferredLanguages");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "detectLanguageFromTextHeuristicallyWithLanguages:languages:defaultLanguage:", v37, v40, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      v38 = v41;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "languageCode");
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v19 = v184;
    }

  }
  v44 = v38;
  +[SGMIConfig defaultConfig](SGMIConfig, "defaultConfig");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = v44;
  v205 = v44;
  if (!v45)
  {

    v203 = CFSTR("en");
    objc_msgSend(v191, "objectForKeyedSubscript:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v186 = v36;
  if (objc_msgSend(v19, "count") == 1 && !objc_msgSend(v206, "count"))
  {
    objc_msgSend(v19, "firstObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handles");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (v48 == 1)
    {
      objc_msgSend(v45, "nickname");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "body");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "matchForString:", v37);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend(v207, "sgmiFeatureStore");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v51, "coreRange");
        objc_msgSend(v37, "substringWithRange:", v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "handles");
        v57 = v45;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "firstObject");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "recordMappingFromNickname:toEmailAddress:", v55, v59);

        v45 = v57;
        v36 = v186;

      }
    }
  }
  v201 = v37;
  v181 = v45;
  if (objc_msgSend(v20, "count"))
  {
    v189 = (void *)objc_opt_new();
  }
  else
  {
    objc_msgSend(v191, "attachmentLinkDetectionRegex");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "firstMatchInString:options:range:", v37, 0, 0, objc_msgSend(v37, "length"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      sgMailIntelligenceLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = objc_msgSend(v61, "range");
        objc_msgSend(v37, "substringWithRange:", v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138739971;
        v228 = (uint64_t)v65;
        _os_log_impl(&dword_1C3607000, v62, OS_LOG_TYPE_DEFAULT, "SGMI identified a file-sharing link in the body: %{sensitive}@ and therefore consider it as an attachment.", buf, 0xCu);

      }
    }

    v189 = (void *)objc_opt_new();
    if (!v61)
    {
      v193 = 0;
      goto LABEL_43;
    }
  }
  v66 = 1;
  if (!objc_msgSend(MEMORY[0x1E0D81588], "isDNUEnabled"))
  {
    v67 = 0;
    goto LABEL_95;
  }
  v193 = 1;
LABEL_43:
  objc_msgSend(v45, "attachment");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "subject");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "matchForString:", v24);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v179 = v70 != 0;
  if (v70)
  {
    v71 = v45;
    v72 = objc_alloc(MEMORY[0x1E0D19870]);
    v73 = objc_msgSend(v70, "range");
    v75 = v74;
    v76 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v70, "signature");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend(v76, "initWithFormat:", CFSTR("%@-%@"), v203, v77);
    LOBYTE(v167) = 0;
    v79 = (void *)objc_msgSend(v72, "initFromString:coreRange:signature:maxWindowSizeAroundCore:detectedLanguage:isIncomingMessage:score:", v24, v73, v75, v78, 16, v205, v167, &unk_1E7E0CB48);

    if (v79)
    {
      objc_msgSend(v207, "sgmiFeatureStore");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "shouldExposeWarning:", v79);
      v81 = objc_claimAutoreleasedReturnValue();

      if (!-[NSObject BOOLValue](v81, "BOOLValue"))
      {
        sgMailIntelligenceLogHandle();
        v82 = objc_claimAutoreleasedReturnValue();
        v45 = v71;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v82, OS_LOG_TYPE_DEFAULT, "SGMI identified a subject warning but blocked it because of a poor user engagement on the pattern.", buf, 2u);
        }

        v36 = v186;
        goto LABEL_55;
      }
      objc_msgSend(v189, "addObject:", v79);
    }
    else
    {
      sgMailIntelligenceLogHandle();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v81, OS_LOG_TYPE_FAULT, "SGMI failed to create a warning from a match.", buf, 2u);
      }
      v79 = 0;
    }
    v45 = v71;
    v36 = v186;
LABEL_55:

    goto LABEL_56;
  }
  v79 = 0;
LABEL_56:
  objc_msgSend(v45, "attachment");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "body");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "matchForString:", v37);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    v86 = objc_msgSend(v85, "range");
    v88 = v86 + v87;
    v89 = objc_msgSend(v37, "length");
    v90 = objc_msgSend(v85, "range");
    if ((unint64_t)(v89 - (v91 + v90)) >= 0xC)
      v92 = 12;
    else
      v92 = v89 - (v91 + v90);
    objc_msgSend(v37, "substringWithRange:", v88, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v93, "rangeOfString:", CFSTR("http")) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v93, "rangeOfString:", CFSTR("www")) == 0x7FFFFFFFFFFFFFFFLL)
    {

      v222 = 0u;
      v223 = 0u;
      v220 = 0u;
      v221 = 0u;
      objc_msgSend(v85, "wildcardsMatches");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v220, v226, 16);
      if (v95)
      {
        v96 = *(_QWORD *)v221;
        v172 = v79;
        v177 = v94;
        v169 = *(_QWORD *)v221;
        do
        {
          v97 = 0;
          v170 = v95;
          do
          {
            if (*(_QWORD *)v221 != v96)
              objc_enumerationMutation(v94);
            v98 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * v97);
            v216 = 0u;
            v217 = 0u;
            v218 = 0u;
            v219 = 0u;
            objc_msgSend(v98, "componentsSeparatedByString:", CFSTR(" "));
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v216, v225, 16);
            if (v174)
            {
              v176 = *(_QWORD *)v217;
              v173 = v99;
              v171 = v97;
              do
              {
                for (i = 0; i != v174; ++i)
                {
                  if (*(_QWORD *)v217 != v176)
                    objc_enumerationMutation(v99);
                  v101 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * i);
                  if ((unint64_t)objc_msgSend(v101, "length") >= 4)
                  {
                    v214 = 0u;
                    v215 = 0u;
                    v212 = 0u;
                    v213 = 0u;
                    v102 = v186;
                    v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v212, v224, 16);
                    if (v103)
                    {
                      v104 = v103;
                      v105 = *(_QWORD *)v213;
                      while (2)
                      {
                        for (j = 0; j != v104; ++j)
                        {
                          if (*(_QWORD *)v213 != v105)
                            objc_enumerationMutation(v102);
                          v107 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * j);
                          objc_msgSend(v107, "displayName");
                          v108 = objc_claimAutoreleasedReturnValue();
                          if (v108)
                          {
                            v109 = (void *)v108;
                            objc_msgSend(v107, "displayName");
                            v110 = (void *)objc_claimAutoreleasedReturnValue();
                            v111 = objc_msgSend(v110, "rangeOfString:options:", v101, 129);

                            if (v111 != 0x7FFFFFFFFFFFFFFFLL)
                            {
                              sgMailIntelligenceLogHandle();
                              v162 = objc_claimAutoreleasedReturnValue();
                              v37 = v201;
                              if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
                              {
                                v163 = objc_msgSend(v85, "range");
                                objc_msgSend(v201, "substringWithRange:", v163, v164);
                                v165 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138740227;
                                v228 = (uint64_t)v165;
                                v229 = 2117;
                                v230 = v101;
                                _os_log_impl(&dword_1C3607000, v162, OS_LOG_TYPE_DEFAULT, "SGMI identified potential missing attachment in '%{sensitive}@',however, given '%{sensitive}@' is in the recipients, this warning got disqualified...", buf, 0x16u);

                              }
                              v36 = v186;
                              v20 = v187;
                              v45 = v181;
                              v67 = v179;
                              v79 = v172;
                              v85 = v173;
                              goto LABEL_92;
                            }
                          }
                        }
                        v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v212, v224, 16);
                        if (v104)
                          continue;
                        break;
                      }
                    }

                    v20 = v187;
                    v37 = v201;
                    v79 = v172;
                    v99 = v173;
                    v94 = v177;
                    v97 = v171;
                  }
                }
                v36 = v186;
                v174 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v216, v225, 16);
              }
              while (v174);
            }

            ++v97;
            v96 = v169;
          }
          while (v97 != v170);
          v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v220, v226, 16);
        }
        while (v95);
      }

      v112 = objc_alloc(MEMORY[0x1E0D19870]);
      v113 = objc_msgSend(v85, "range");
      v115 = v114;
      v116 = v37;
      v117 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v85, "signature");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = (void *)objc_msgSend(v117, "initWithFormat:", CFSTR("%@-%@"), v203, v118);
      LOBYTE(v168) = 0;
      v120 = objc_msgSend(v112, "initFromString:coreRange:signature:maxWindowSizeAroundCore:detectedLanguage:isIncomingMessage:score:", v116, v113, v115, v119, 16, v205, v168, &unk_1E7E0CB48);

      objc_msgSend(v207, "sgmiFeatureStore");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "shouldExposeWarning:", v120);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      v123 = v122;
      if (objc_msgSend(v122, "BOOLValue"))
      {
        objc_msgSend(v189, "addObject:", v120);
        v67 = 1;
        v177 = v85;
        v79 = (void *)v120;
        v37 = v201;
        v45 = v181;
      }
      else
      {
        sgMailIntelligenceLogHandle();
        v166 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v166, OS_LOG_TYPE_DEFAULT, "SGMI identified a body warning but blocked it because of a poor user engagement on the pattern.", buf, 2u);
        }

        v67 = 1;
        v177 = v85;
        v79 = (void *)v120;
        v37 = v201;
        v45 = v181;
      }
      v85 = v123;
    }
    else
    {
      v177 = v93;
      sgMailIntelligenceLogHandle();
      v124 = objc_claimAutoreleasedReturnValue();
      v67 = v179;
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        v125 = objc_msgSend(v85, "range");
        objc_msgSend(v37, "substringWithRange:", v125, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138740227;
        v228 = (uint64_t)v127;
        v229 = 2117;
        v230 = v177;
        _os_log_impl(&dword_1C3607000, v124, OS_LOG_TYPE_DEFAULT, "SGMI identified potential missing attachment in '%{sensitive}@',however, given a link seems to be present in the following characters: '%{sensitive}@', this warning got disqualified...", buf, 0x16u);

      }
    }
LABEL_92:

    v66 = v193;
  }
  else
  {
    v66 = v193;
    v67 = v70 != 0;
  }

LABEL_95:
  objc_msgSend(v207, "sgmiFeatureStore");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "updateAttachmentDetectionStatsOnMailWithTextContent:attachments:warningRaised:attachmentPredicted:isIncomingMail:", v37, v20, v67 & (v66 ^ 1), v67, 0);

  if ((v66 & 1) != 0)
    v129 = (id)objc_opt_new();
  else
    v129 = v189;
  v130 = v129;
  v194 = (void *)objc_opt_new();
  objc_msgSend(v45, "recipientConservative");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "body");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "matchesForString:", v37);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "recipient");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "body");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "matchesForString:", v37);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  v137 = MEMORY[0x1E0C809B0];
  v210[0] = MEMORY[0x1E0C809B0];
  v210[1] = 3221225472;
  v210[2] = __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke;
  v210[3] = &unk_1E7DB4C88;
  v138 = v133;
  v211 = v138;
  objc_msgSend(v136, "_pas_filteredArrayWithTest:", v210);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  v140 = objc_msgSend(v138, "count");
  v141 = objc_msgSend(v139, "count") + v140;
  if (v141)
  {
    if (v195 && v196 && (v142 = objc_msgSend(v195, "count"), v142 + objc_msgSend(v196, "count")))
    {
      v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v195);
      objc_msgSend(v146, "addObjectsFromArray:", v196);
      v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v184);
      objc_msgSend(v147, "addObjectsFromArray:", v206);
      objc_msgSend(v147, "minusSet:", v146);
      if (objc_msgSend(v147, "count") >= v141)
      {

        v138 = (id)MEMORY[0x1E0C9AA60];
        v139 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v208[0] = v137;
      v208[1] = 3221225472;
      v208[2] = __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_2;
      v208[3] = &unk_1E7DB4C88;
      v209 = v201;
      v143 = (void *)MEMORY[0x1C3BD5158](v208);
      objc_msgSend(v138, "_pas_filteredArrayWithTest:", v143);
      v144 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v139, "_pas_filteredArrayWithTest:", v143);
      v145 = objc_claimAutoreleasedReturnValue();

      v146 = v209;
      v138 = (id)v144;
      v139 = (void *)v145;
    }
    v175 = v139;

  }
  else
  {
    v175 = v139;
  }
  objc_msgSend(v36, "_pas_mappedArrayWithTransform:", &__block_literal_global_43_29285);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_pas_mappedArrayWithTransform:", &__block_literal_global_46_29286);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "_pas_mappedArrayWithTransform:", &__block_literal_global_49);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIOmissionAnalyzer filterOutOrConvertMatches:visibleFlatRecipientEmailsList:visibleFlatRecipientList:bccFlatRecipientList:contactMatchRequired:textContent:regexLanguage:detectedLanguage:store:](SGMIOmissionAnalyzer, "filterOutOrConvertMatches:visibleFlatRecipientEmailsList:visibleFlatRecipientList:bccFlatRecipientList:contactMatchRequired:textContent:regexLanguage:detectedLanguage:store:", v138, v148, v149, v150, 0, v201, v203, v205, v207);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "addObjectsFromArray:", v151);

  +[SGMIOmissionAnalyzer filterOutOrConvertMatches:visibleFlatRecipientEmailsList:visibleFlatRecipientList:bccFlatRecipientList:contactMatchRequired:textContent:regexLanguage:detectedLanguage:store:](SGMIOmissionAnalyzer, "filterOutOrConvertMatches:visibleFlatRecipientEmailsList:visibleFlatRecipientList:bccFlatRecipientList:contactMatchRequired:textContent:regexLanguage:detectedLanguage:store:", v175, v148, v149, v150, !a14, v201, v203, v205, v207);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "addObjectsFromArray:", v152);

  objc_msgSend(v207, "sgmiFeatureStore");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "updateRecipientDetectionStatsWarningRaised:", objc_msgSend(v194, "count") != 0);

  objc_msgSend(v130, "addObjectsFromArray:", v194);
  v154 = objc_msgSend(MEMORY[0x1E0D198F0], "mailIntelligenceSPILogging");
  sgMailIntelligenceLogHandle();
  v155 = objc_claimAutoreleasedReturnValue();
  v156 = os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT);
  if (v154)
  {
    if (v156)
    {
      objc_msgSend(v130, "description");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138739971;
      v228 = (uint64_t)v158;
      _os_log_impl(&dword_1C3607000, v155, OS_LOG_TYPE_DEFAULT, "SGMI-SPI (output compose warnings) %{sensitive}@", buf, 0xCu);

    }
  }
  else if (v156)
  {
    v159 = objc_msgSend(v130, "count");
    *(_DWORD *)buf = 134217984;
    v228 = v159;
    _os_log_impl(&dword_1C3607000, v155, OS_LOG_TYPE_DEFAULT, "SGMI ended omission analysis and returned %tu results", buf, 0xCu);
  }

  v160 = v130;
  return v160;
}

+ (id)filterOutOrConvertMatches:(id)a3 visibleFlatRecipientEmailsList:(id)a4 visibleFlatRecipientList:(id)a5 bccFlatRecipientList:(id)a6 contactMatchRequired:(BOOL)a7 textContent:(id)a8 regexLanguage:(id)a9 detectedLanguage:(id)a10 store:(id)a11
{
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id v98;
  NSObject *v99;
  void *v101;
  void *v102;
  _BOOL4 v103;
  id v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id obj;
  id v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  id v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
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
  _BYTE v143[128];
  _BYTE v144[128];
  uint8_t v145[128];
  uint8_t buf[4];
  void *v147;
  __int16 v148;
  void *v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  uint64_t v153;

  v103 = a7;
  v153 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v110 = a6;
  v116 = a8;
  v109 = a9;
  v108 = a10;
  v112 = a11;
  v105 = (void *)objc_opt_new();
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  obj = v15;
  v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v152, 16);
  if (v114)
  {
    v113 = *(_QWORD *)v140;
    v106 = v16;
    v107 = v17;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v140 != v113)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v18);
        if (objc_msgSend(v19, "coreRange") == 0x7FFFFFFFFFFFFFFFLL)
        {
          sgMailIntelligenceLogHandle();
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
          {
            +[SGMITrialClientWrapper sharedInstance](SGMITrialClientWrapper, "sharedInstance");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "trialMetadataString");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v147 = v102;
            _os_log_fault_impl(&dword_1C3607000, v99, OS_LOG_TYPE_FAULT, "SGMI inconsistent recipient detection. Likely an issue in assets: %@", buf, 0xCu);

          }
          v96 = obj;

          v98 = (id)MEMORY[0x1E0C9AA60];
          v97 = v105;
          goto LABEL_95;
        }
        v115 = v19;
        v20 = objc_msgSend(v19, "coreRange");
        objc_msgSend(v116, "substringWithRange:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = 0u;
        v136 = 0u;
        v137 = 0u;
        v138 = 0u;
        v23 = objc_msgSend(&unk_1E7E10AD0, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v136;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v136 != v25)
                objc_enumerationMutation(&unk_1E7E10AD0);
              v27 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
              if (objc_msgSend(v22, "hasSuffix:", v27))
              {
                objc_msgSend(v22, "substringToIndex:", objc_msgSend(v22, "length") - objc_msgSend(v27, "length"));
                v28 = objc_claimAutoreleasedReturnValue();

                v22 = (void *)v28;
              }
            }
            v24 = objc_msgSend(&unk_1E7E10AD0, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
          }
          while (v24);
        }
        if ((unint64_t)objc_msgSend(v22, "length") < 2)
          goto LABEL_18;
        objc_msgSend(v22, "substringFromIndex:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lowercaseString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "substringFromIndex:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v29, "isEqualToString:", v31);

        if (v32)
        {
LABEL_18:
          v118 = v18;
          objc_msgSend(v112, "sgmiFeatureStore");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "knownEmailAddressesForNickname:", v22);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          v35 = v34;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v131, v150, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v132;
            while (2)
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v132 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
                if (objc_msgSend(v16, "containsObject:", v40))
                {
                  sgMailIntelligenceLogHandle();
                  v66 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138740227;
                    v147 = v22;
                    v148 = 2117;
                    v149 = v40;
                    _os_log_impl(&dword_1C3607000, v66, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer identified \"%{sensitive}@\" as a nickname used in the past for %{sensitive}@.", buf, 0x16u);
                  }
                  v61 = (uint64_t)v35;
                  v18 = v118;
                  goto LABEL_60;
                }
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v131, v150, 16);
              if (v37)
                continue;
              break;
            }
          }

          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          v41 = v17;
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v127, v145, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v128;
            while (2)
            {
              for (k = 0; k != v43; ++k)
              {
                if (*(_QWORD *)v128 != v44)
                  objc_enumerationMutation(v41);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * k), "rangeOfString:options:", v22, 129) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v18 = v118;
                  goto LABEL_62;
                }
              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v127, v145, 16);
              if (v43)
                continue;
              break;
            }
          }

          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          v117 = v110;
          v46 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
          if (v46)
          {
            v47 = v46;
            v48 = *(_QWORD *)v124;
            while (2)
            {
              for (m = 0; m != v47; ++m)
              {
                if (*(_QWORD *)v124 != v48)
                  objc_enumerationMutation(v117);
                v50 = objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * m), "rangeOfString:options:", v22, 129);
                if (v50 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v70 = v50;
                  v71 = v51;
                  v72 = (void *)MEMORY[0x1E0D19898];
                  v73 = objc_msgSend(v115, "range");
                  objc_msgSend(v72, "snippetFromString:coreRange:withMaxWindowSizeAroundCore:", v116, v73, v74, 16);
                  v66 = objc_claimAutoreleasedReturnValue();
                  v104 = objc_alloc(MEMORY[0x1E0D19878]);
                  v75 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v115, "signature");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  v77 = (void *)objc_msgSend(v75, "initWithFormat:", CFSTR("%@-%@"), v109, v76);
                  objc_msgSend(v116, "substringWithRange:", v70, v71);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = objc_msgSend(v104, "initWithSnippet:core:handle:signature:detectedLanguage:isIncomingMessage:score:matchFoundInBCC:", v66, v22, 0, v77, v108, 0, &unk_1E7E0CB48, v78);

                  objc_msgSend(v112, "sgmiFeatureStore");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "shouldExposeWarning:", v79);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v81, "BOOLValue"))
                  {
                    objc_msgSend(v105, "addObject:", v79);
                    v82 = (void *)v79;
                    v16 = v106;
                    v61 = (uint64_t)v117;
                    v18 = v118;
                  }
                  else
                  {
                    v82 = (void *)v79;
                    sgMailIntelligenceLogHandle();
                    v83 = objc_claimAutoreleasedReturnValue();
                    v16 = v106;
                    v61 = (uint64_t)v117;
                    v18 = v118;
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1C3607000, v83, OS_LOG_TYPE_DEFAULT, "SGMI identified a recipient warning but blocked it because of a poor user engagement on the pattern.", buf, 2u);
                    }

                  }
                  v17 = v107;
                  goto LABEL_60;
                }
              }
              v47 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
              if (v47)
                continue;
              break;
            }
          }

          v16 = v106;
          v17 = v107;
          v18 = v118;
          if (objc_msgSend(v116, "characterAtIndex:", objc_msgSend(v115, "range")) == 64)
          {
            v121 = 0u;
            v122 = 0u;
            v119 = 0u;
            v120 = 0u;
            v52 = v41;
            v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
            if (v53)
            {
              v54 = v53;
              v55 = *(_QWORD *)v120;
              while (2)
              {
                for (n = 0; n != v54; ++n)
                {
                  if (*(_QWORD *)v120 != v55)
                    objc_enumerationMutation(v52);
                  v57 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * n);
                  if (objc_msgSend(v57, "rangeOfString:", CFSTR("group")) != 0x7FFFFFFFFFFFFFFFLL
                    || objc_msgSend(v57, "rangeOfString:", CFSTR("list")) != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    sgMailIntelligenceLogHandle();
                    v66 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138740227;
                      v147 = v22;
                      v148 = 2117;
                      v149 = v57;
                      _os_log_impl(&dword_1C3607000, v66, OS_LOG_TYPE_DEFAULT, "SGMI identified a recipient warning for %{sensitive}@ but blocked it because one recipient address (%{sensitive}@) seems to be a group.", buf, 0x16u);
                    }
                    v61 = (uint64_t)v52;
                    v16 = v106;
                    v17 = v107;
                    goto LABEL_60;
                  }
                }
                v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
                v16 = v106;
                if (v54)
                  continue;
                break;
              }
            }

            v17 = v107;
          }
          if (!v103
            || +[SGMIOmissionAnalyzer matchRecentContact:store:](SGMIOmissionAnalyzer, "matchRecentContact:store:", v22, v112))
          {
            v58 = (void *)MEMORY[0x1E0D19898];
            v59 = objc_msgSend(v115, "range");
            objc_msgSend(v58, "snippetFromString:coreRange:withMaxWindowSizeAroundCore:", v116, v59, v60, 16);
            v61 = objc_claimAutoreleasedReturnValue();
            v62 = objc_alloc(MEMORY[0x1E0D19878]);
            v63 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v115, "signature");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = (void *)objc_msgSend(v63, "initWithFormat:", CFSTR("%@-%@"), v109, v64);
            v66 = objc_msgSend(v62, "initWithSnippet:core:handle:signature:detectedLanguage:isIncomingMessage:score:matchFoundInBCC:", v61, v22, 0, v65, v108, 0, &unk_1E7E0CB48, 0);

            objc_msgSend(v112, "sgmiFeatureStore");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "shouldExposeWarning:", v66);
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            v69 = v68;
            if (objc_msgSend(v68, "BOOLValue"))
            {
              objc_msgSend(v105, "addObject:", v66);
              v17 = v107;
            }
            else
            {
              if (v103)
              {
                sgMailIntelligenceLogHandle();
                v84 = objc_claimAutoreleasedReturnValue();
                v17 = v107;
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C3607000, v84, OS_LOG_TYPE_DEFAULT, "SGMI identified a recipient warning but blocked it because of a poor user engagement on the pattern.", buf, 2u);
                }

              }
              else
              {
                v85 = v68;
                v86 = objc_alloc(MEMORY[0x1E0D19878]);
                v87 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v115, "signature");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = (void *)objc_msgSend(v87, "initWithFormat:", CFSTR("%@-0000%@"), v109, v88);
                v90 = objc_msgSend(v86, "initWithSnippet:core:handle:signature:detectedLanguage:isIncomingMessage:score:matchFoundInBCC:", v61, v22, 0, v89, v108, 0, &unk_1E7E0CB48, 0);

                v66 = v90;
                objc_msgSend(v112, "sgmiFeatureStore");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "shouldExposeWarning:", v66);
                v92 = (void *)objc_claimAutoreleasedReturnValue();

                v17 = v107;
                if (objc_msgSend(v92, "BOOLValue")
                  && +[SGMIOmissionAnalyzer matchRecentContact:store:](SGMIOmissionAnalyzer, "matchRecentContact:store:", v22, v112))
                {
                  sgMailIntelligenceLogHandle();
                  v93 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138739971;
                    v147 = v22;
                    _os_log_impl(&dword_1C3607000, v93, OS_LOG_TYPE_DEFAULT, "SGMI created a second chance recipient warning for %{sensitive}@.", buf, 0xCu);
                  }

                  objc_msgSend(v105, "addObject:", v66);
                }
                else
                {
                  sgMailIntelligenceLogHandle();
                  v94 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1C3607000, v94, OS_LOG_TYPE_DEFAULT, "SGMI identified a recipient warning from a conservative regex which user engagement was poor, even with contact match.", buf, 2u);
                  }

                }
                v69 = v92;
              }
              v18 = v118;
            }

LABEL_60:
            v41 = (id)v61;
LABEL_62:

          }
        }

        ++v18;
      }
      while (v18 != v114);
      v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v152, 16);
      v114 = v95;
      if (v95)
        continue;
      break;
    }
  }
  v96 = obj;

  v97 = v105;
  v98 = v105;
LABEL_95:

  return v98;
}

+ (BOOL)matchRecentContact:(id)a3 store:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  BOOL v31;
  NSObject *v32;
  const __CFString *v33;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  uint64_t *v41;
  _QWORD *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  NSObject *v46;
  id v47;
  uint64_t *v48;
  _QWORD *v49;
  _QWORD block[4];
  id v51;
  NSObject *v52;
  id v53;
  uint64_t *v54;
  _QWORD *v55;
  _QWORD v56[4];
  id v57;
  NSObject *v58;
  id v59;
  uint64_t *v60;
  _QWORD *v61;
  _QWORD v62[4];
  NSObject *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  _QWORD v72[3];
  char v73;
  _QWORD v74[3];
  char v75;
  _QWORD v76[3];
  char v77;
  _QWORD v78[3];
  char v79;
  uint8_t buf[4];
  id v81;
  __int16 v82;
  const __CFString *v83;
  _QWORD v84[4];

  v84[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v79 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v77 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  v75 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v73 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke;
  v62[3] = &unk_1E7DB4D30;
  v64 = v78;
  v65 = v76;
  v66 = v74;
  v67 = v72;
  v9 = v7;
  v63 = v9;
  v10 = (void *)MEMORY[0x1C3BD5158](v62);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setName:", CFSTR("Mail Previous Recipients for omittedRecipient Queue"));
  objc_msgSend(v11, "setQualityOfService:", 25);
  v12 = (void *)MEMORY[0x1E0D182A0];
  v84[0] = *MEMORY[0x1E0D18208];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchQueryForSearchTerm:preferredKinds:sendingAddress:recentsDomain:", v5, v13, 0, *MEMORY[0x1E0D18268]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D18290], "defaultInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v8;
  v56[1] = 3221225472;
  v56[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_2;
  v56[3] = &unk_1E7DB4D58;
  v60 = &v68;
  v61 = v78;
  v15 = v5;
  v57 = v15;
  v16 = v9;
  v58 = v16;
  v17 = v10;
  v59 = v17;
  objc_msgSend(v14, "performRecentsSearch:operationQueue:completion:", v35, v11, v56);

  dispatch_get_global_queue(25, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_112;
  block[3] = &unk_1E7DB4D80;
  v19 = v15;
  v51 = v19;
  v54 = &v68;
  v55 = v76;
  v20 = v16;
  v52 = v20;
  v21 = v17;
  v53 = v21;
  dispatch_async(v18, block);

  v43[0] = v8;
  v43[1] = 3221225472;
  v43[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_115;
  v43[3] = &unk_1E7DB4DA8;
  v22 = v6;
  v44 = v22;
  v23 = v19;
  v45 = v23;
  v48 = &v68;
  v49 = v74;
  v24 = v20;
  v46 = v24;
  v25 = v21;
  v47 = v25;
  dispatch_async(v18, v43);

  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_116;
  v36[3] = &unk_1E7DB4DA8;
  v26 = v22;
  v37 = v26;
  v27 = v23;
  v38 = v27;
  v41 = &v68;
  v42 = v72;
  v28 = v24;
  v39 = v28;
  v29 = v25;
  v40 = v29;
  dispatch_async(v18, v36);

  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v28, 0.1) == 1)
  {
    sgMailIntelligenceLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138739971;
      v81 = v27;
      _os_log_error_impl(&dword_1C3607000, v30, OS_LOG_TYPE_ERROR, "SGMIOmissionAnalyzer: Attempt to match %{sensitive}@ against the various sources of contacts timed out.", buf, 0xCu);
    }

    v31 = 0;
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v69 + 24))
        v33 = CFSTR("found a match");
      else
        v33 = CFSTR("did not find any match");
      *(_DWORD *)buf = 138740227;
      v81 = v27;
      v82 = 2112;
      v83 = v33;
      _os_log_impl(&dword_1C3607000, v32, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer Attempt to match %{sensitive}@ against the various sources of contacts %@.", buf, 0x16u);
    }

    v31 = *((_BYTE *)v69 + 24) != 0;
  }

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v78, 8);

  return v31;
}

+ (id)reportUserEngagement:(BOOL)a3 forWarning:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = a4;
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIOmissionAnalyzer reportUserEngagement:forWarning:store:](SGMIOmissionAnalyzer, "reportUserEngagement:forWarning:store:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 store:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v6 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  sgMailIntelligenceLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("negative");
    if (v6)
      v10 = CFSTR("positive");
    v17 = 138412290;
    v18 = v10;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "SGMI received %@ feedback for missing entity warning", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(v7, "sgmiFeatureStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "incrementUserEngagement:forWarning:", v6, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  sgMailIntelligenceLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v12, "BOOLValue");
    v15 = CFSTR("not");
    if (v14)
      v15 = CFSTR("still");
    v17 = 138412290;
    v18 = v15;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGMI will %@ trigger a warning for such signature", (uint8_t *)&v17, 0xCu);
  }

  return v12;
}

intptr_t __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke(intptr_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
  }
  return result;
}

intptr_t __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= objc_msgSend(v3, "count") != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  sgMailIntelligenceLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138739971;
    v9 = v6;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer found a contact match for %{sensitive}@ in CoreRecents", (uint8_t *)&v8, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_112(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= objc_msgSend(v5, "count") != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (objc_msgSend(v5, "count"))
  {
    sgMailIntelligenceLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138740227;
      v11 = v7;
      v12 = 2117;
      v13 = v9;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer found a contact match: %{sensitive}@ ->  %{sensitive}@ in Contacts", (uint8_t *)&v10, 0x16u);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_115(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "suggestContactMatchesWithMessagingPrefix:limitTo:", *(_QWORD *)(a1 + 40), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= objc_msgSend(v2, "count") != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  if (objc_msgSend(v2, "count"))
  {
    sgMailIntelligenceLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v2, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138740227;
      v9 = v4;
      v10 = 2117;
      v11 = v7;
      _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer found a pseudo contact match: %{sensitive}@ ->  %{sensitive}@", (uint8_t *)&v8, 0x16u);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_116(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sgmiFeatureStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "knownEmailAddressesForNickname:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= objc_msgSend(v3, "count") != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  if (objc_msgSend(v3, "count"))
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138740227;
      v8 = v5;
      v9 = 2117;
      v10 = v6;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer found a nickname match: %{sensitive}@ ->  %{sensitive}@", (uint8_t *)&v7, 0x16u);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  NSRange v22;
  NSRange v23;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = objc_msgSend(v3, "coreRange", (_QWORD)v16);
        v12 = v11;
        v23.location = objc_msgSend(v9, "coreRange");
        v23.length = v13;
        v22.location = v10;
        v22.length = v12;
        if (NSIntersectionRange(v22, v23).length)
        {
          v14 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

BOOL __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", objc_msgSend(a2, "range")) == 64;
}

id __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_5(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ %@"), v5, v7);

  return v8;
}

id __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ %@"), v5, v7);

  return v8;
}

__CFString *__224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  __CFString *v5;

  v2 = a2;
  objc_msgSend(v2, "handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v2, "handles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E7DB83A8;
  }

  return v5;
}

void __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  LOBYTE(v5) = *(_BYTE *)(a1 + 136);
  objc_msgSend(*(id *)(a1 + 128), "_identifyComposeWarningsFromSubject:content:attributes:toRecipients:ccRecipients:bccRecipients:originalToRecipients:originalCcRecipients:attachments:language:store:disableConservativeCheckRequirement:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(MEMORY[0x1E0D81598], "waitForBlock:timeoutSeconds:", *(_QWORD *)(a1 + 40), 0.0);
  if ((_DWORD)result == 1)
  {
    sgMailIntelligenceLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "length");
      v5 = 134217984;
      v6 = v4;
      _os_log_fault_impl(&dword_1C3607000, v3, OS_LOG_TYPE_FAULT, "SGMIOmissionAnalyzer: Mail Intelligence's SPI back took over 5 seconds on a %tu-lengthed content: we have to xpc_transaction_exit_clean", (uint8_t *)&v5, 0xCu);
    }

    return xpc_transaction_exit_clean();
  }
  return result;
}

void __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_9()
{
  void *v0;
  dispatch_queue_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = dispatch_queue_create("SGMIOmissionAnalyzer-timeout", 0);
  v2 = (void *)identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult_8;
  identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult_8 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke()
{
  void *v0;
  dispatch_queue_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = dispatch_queue_create("SGMIOmissionAnalyzer-processing", 0);
  v2 = (void *)identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult;
  identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
