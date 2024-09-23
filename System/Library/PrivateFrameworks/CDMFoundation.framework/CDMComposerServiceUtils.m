@implementation CDMComposerServiceUtils

+ (void)logNluRequestForInsights:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  NSObject *v75;
  _BOOL4 v76;
  void *v77;
  NSObject *v78;
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
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  unint64_t i;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  unint64_t v116;
  NSObject *v117;
  void *v118;
  NSObject *v119;
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
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  unint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  unint64_t v148;
  NSObject *v149;
  void *v150;
  NSObject *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  NSObject *v159;
  NSObject *v160;
  void *v161;
  NSObject *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  NSObject *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  uint64_t v173;
  unint64_t v174;
  NSObject *v175;
  NSObject *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  NSObject *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  unint64_t v191;
  void *v192;
  NSObject *v193;
  void *v194;
  void *v195;
  NSObject *v196;
  void *v197;
  void *v198;
  void *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  uint8_t buf[4];
  const char *v206;
  __int16 v207;
  const __CFString *v208;
  __int16 v209;
  _QWORD v210[3];

  v210[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = CDMLogContext;
  v204 = v3;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    v192 = (void *)MEMORY[0x24BE9E358];
    v193 = v4;
    objc_msgSend(v3, "siriNLUTypeObj");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "printableRequest:", v194);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("cdmio");
    v209 = 2112;
    v210[0] = v195;
    _os_log_debug_impl(&dword_21A2A0000, v193, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nNluRequest: %@", buf, 0x20u);

    v4 = CDMLogContext;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "siriNLUTypeObj");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "idA");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    v209 = 2114;
    v210[0] = v8;
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nRequest ID: %{public}@", buf, 0x20u);

    v4 = CDMLogContext;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v196 = v4;
    objc_msgSend(v3, "siriNLUTypeObj");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "requestId");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "idA");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("saliententities");
    v209 = 2112;
    v210[0] = v199;
    _os_log_debug_impl(&dword_21A2A0000, v196, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nRequest ID: %@", buf, 0x20u);

    v4 = CDMLogContext;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v4;
    objc_msgSend(v3, "siriNLUTypeObj");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentTurnInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "startTimestamp");
    *(_DWORD *)buf = 136315650;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    v209 = 2048;
    v210[0] = v12;
    _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nCurrent Turn Timestamp: %llu", buf, 0x20u);

    v4 = CDMLogContext;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v4;
    objc_msgSend(v3, "siriNLUTypeObj");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentTurnInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "asrOutputs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "utterance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    v209 = 2112;
    v210[0] = v18;
    _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nCurrent Turn Utterance: %@", buf, 0x20u);

    v4 = CDMLogContext;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n===== Current Turn Context =====", buf, 0x16u);
    v4 = CDMLogContext;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n======== NL Context  ===========", buf, 0x16u);
    v4 = CDMLogContext;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n========== Active Tasks ========", buf, 0x16u);
  }
  objc_msgSend(v3, "siriNLUTypeObj");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentTurnInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "turnContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nlContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activeTasks");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    objc_msgSend(v3, "siriNLUTypeObj");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentTurnInput");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "turnContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "nlContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activeTasks");
    v29 = v19;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v203 = objc_msgSend(v30, "count");

    v31 = &unk_253E45000;
    if (v203)
      goto LABEL_23;
  }
  else
  {

    v31 = &unk_253E45000;
  }
  v32 = *((_QWORD *)v31 + 366);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v32, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nNo active tasks", buf, 0x16u);
  }
LABEL_23:
  v33 = 0;
  v34 = v204;
  while (1)
  {
    objc_msgSend(v34, "siriNLUTypeObj");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "currentTurnInput");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "turnContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "nlContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activeTasks");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    v41 = *((_QWORD *)v31 + 366);
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (v40 <= v33)
      break;
    if (v42)
    {
      v43 = (void *)MEMORY[0x24BE9E358];
      v44 = v41;
      objc_msgSend(v34, "siriNLUTypeObj");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "currentTurnInput");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "turnContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "nlContext");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "activeTasks");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectAtIndexedSubscript:", v33);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "printableTask:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
      v207 = 2112;
      v208 = CFSTR("summary");
      v209 = 1024;
      LODWORD(v210[0]) = v33;
      WORD2(v210[0]) = 2112;
      *(_QWORD *)((char *)v210 + 6) = v51;
      _os_log_impl(&dword_21A2A0000, v44, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nCurrent Turn Active Task %d: %@", buf, 0x26u);

      v34 = v204;
      v31 = &unk_253E45000;

    }
    ++v33;
  }
  if (v42)
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v41, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n========== Executed Tasks =======", buf, 0x16u);
  }
  objc_msgSend(v34, "siriNLUTypeObj");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "currentTurnInput");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "turnContext");
  v54 = v34;
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "nlContext");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "executedTasks");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    objc_msgSend(v54, "siriNLUTypeObj");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "currentTurnInput");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "turnContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "nlContext");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "executedTasks");
    v63 = v52;
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = objc_msgSend(v64, "count");

    v65 = &unk_253E45000;
    if (v200)
      goto LABEL_36;
  }
  else
  {

    v65 = &unk_253E45000;
  }
  v66 = *((_QWORD *)v65 + 366);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v66, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nNo executed tasks", buf, 0x16u);
  }
LABEL_36:
  v67 = 0;
  v68 = v204;
  while (1)
  {
    objc_msgSend(v68, "siriNLUTypeObj");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "currentTurnInput");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "turnContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "nlContext");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "executedTasks");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "count");

    v75 = *((_QWORD *)v65 + 366);
    v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT);
    if (v74 <= v67)
      break;
    if (v76)
    {
      v77 = (void *)MEMORY[0x24BE9E358];
      v78 = v75;
      objc_msgSend(v68, "siriNLUTypeObj");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "currentTurnInput");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "turnContext");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "nlContext");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "executedTasks");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "objectAtIndexedSubscript:", v67);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "printableTask:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
      v207 = 2112;
      v208 = CFSTR("summary");
      v209 = 1024;
      LODWORD(v210[0]) = v67;
      WORD2(v210[0]) = 2112;
      *(_QWORD *)((char *)v210 + 6) = v85;
      _os_log_impl(&dword_21A2A0000, v78, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nCurrent Turn Executed Task %d: %@", buf, 0x26u);

      v68 = v204;
      v65 = &unk_253E45000;

    }
    ++v67;
  }
  if (v76)
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v75, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n========== Salient Entities ====", buf, 0x16u);
  }
  objc_msgSend(v68, "siriNLUTypeObj");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "currentTurnInput");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "turnContext");
  v88 = v68;
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "nlContext");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "salientEntities");
  v91 = objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v92 = (void *)v91;
    objc_msgSend(v88, "siriNLUTypeObj");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "currentTurnInput");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "turnContext");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "nlContext");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "salientEntities");
    v97 = v86;
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = objc_msgSend(v98, "count");

    if (v201)
    {
      v99 = &unk_253E45000;
      v100 = (void *)CDMLogContext;
      v101 = v204;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
      {
        v102 = v100;
        objc_msgSend(v204, "siriNLUTypeObj");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "currentTurnInput");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "turnContext");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "nlContext");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "salientEntities");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = objc_msgSend(v107, "count");
        *(_DWORD *)buf = 136315650;
        v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
        v207 = 2112;
        v208 = CFSTR("summary");
        v209 = 2048;
        v210[0] = v108;
        _os_log_impl(&dword_21A2A0000, v102, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n%lu salient entities. See salient entities section for more.", buf, 0x20u);

        v101 = v204;
        v99 = &unk_253E45000;

      }
      goto LABEL_52;
    }
  }
  else
  {

  }
  v99 = &unk_253E45000;
  v109 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v109, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nNo salient entities", buf, 0x16u);
    v109 = CDMLogContext;
  }
  v101 = v204;
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("saliententities");
    _os_log_debug_impl(&dword_21A2A0000, v109, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nNo salient entities", buf, 0x16u);
  }
LABEL_52:
  for (i = 0; ; ++i)
  {
    objc_msgSend(v101, "siriNLUTypeObj");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "currentTurnInput");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "turnContext");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "nlContext");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "salientEntities");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v115, "count");

    v117 = *((_QWORD *)v99 + 366);
    if (v116 <= i)
      break;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
    {
      v118 = (void *)MEMORY[0x24BE9E358];
      v119 = v117;
      objc_msgSend(v101, "siriNLUTypeObj");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "currentTurnInput");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "turnContext");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "nlContext");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "salientEntities");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "objectAtIndexedSubscript:", i);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "printableEntityCandidate:", v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
      v207 = 2112;
      v208 = CFSTR("saliententities");
      v209 = 1024;
      LODWORD(v210[0]) = i;
      WORD2(v210[0]) = 2112;
      *(_QWORD *)((char *)v210 + 6) = v126;
      _os_log_debug_impl(&dword_21A2A0000, v119, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nCurrent Turn Salient Entity %d: %@", buf, 0x26u);

      v101 = v204;
      v99 = &unk_253E45000;

    }
  }
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v117, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n========== SDAs ================", buf, 0x16u);
  }
  objc_msgSend(v101, "siriNLUTypeObj");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "currentTurnInput");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "turnContext");
  v129 = v101;
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "nlContext");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "systemDialogActs");
  v132 = objc_claimAutoreleasedReturnValue();
  if (v132)
  {
    v133 = (void *)v132;
    objc_msgSend(v129, "siriNLUTypeObj");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "currentTurnInput");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "turnContext");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "nlContext");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "systemDialogActs");
    v138 = v127;
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend(v139, "count");

    if (v202)
    {
      v140 = 0;
      v141 = v204;
      v142 = &unk_253E45000;
      while (1)
      {
        objc_msgSend(v141, "siriNLUTypeObj");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "currentTurnInput");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "turnContext");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "nlContext");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "systemDialogActs");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = objc_msgSend(v147, "count");

        if (v148 <= v140)
          break;
        v149 = *((_QWORD *)v142 + 366);
        if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
        {
          v150 = (void *)MEMORY[0x24BE9E358];
          v151 = v149;
          objc_msgSend(v141, "siriNLUTypeObj");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "currentTurnInput");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "turnContext");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "nlContext");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "systemDialogActs");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "objectAtIndexedSubscript:", v140);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "printableSystemDialogAct:", v157);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
          v207 = 2112;
          v208 = CFSTR("summary");
          v209 = 1024;
          LODWORD(v210[0]) = v140;
          WORD2(v210[0]) = 2112;
          *(_QWORD *)((char *)v210 + 6) = v158;
          _os_log_impl(&dword_21A2A0000, v151, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nCurrent Turn SDA %d: %@", buf, 0x26u);

          v141 = v204;
          v142 = &unk_253E45000;

        }
        ++v140;
      }
      goto LABEL_69;
    }
  }
  else
  {

  }
  v142 = &unk_253E45000;
  v159 = CDMLogContext;
  v141 = v204;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v159, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nNo SDAs", buf, 0x16u);
  }
LABEL_69:
  v160 = *((_QWORD *)v142 + 366);
  if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    _os_log_impl(&dword_21A2A0000, v160, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n======== Legacy Context ========", buf, 0x16u);
    v160 = *((_QWORD *)v142 + 366);
  }
  if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
  {
    v161 = v142;
    v162 = v160;
    objc_msgSend(v141, "siriNLUTypeObj");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "currentTurnInput");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "turnContext");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "legacyNlContext");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    v209 = 2112;
    v210[0] = v166;
    _os_log_impl(&dword_21A2A0000, v162, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n%@", buf, 0x20u);

    v160 = *((_QWORD *)v161 + 366);
  }
  if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
  {
    v167 = v160;
    objc_msgSend(v204, "siriNLUTypeObj");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "previousTurnInputs");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = objc_msgSend(v169, "count");
    *(_DWORD *)buf = 136315650;
    v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
    v207 = 2112;
    v208 = CFSTR("summary");
    v209 = 2048;
    v210[0] = v170;
    _os_log_impl(&dword_21A2A0000, v167, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nPrevious turn input count: %zu", buf, 0x20u);

  }
  objc_msgSend(v204, "siriNLUTypeObj");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "previousTurnInputs");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = objc_msgSend(v172, "count");

  if (v173)
  {
    v174 = 0;
    do
    {
      v175 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
      {
        v176 = v175;
        v177 = v204;
        objc_msgSend(v204, "siriNLUTypeObj");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "previousTurnInputs");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "objectAtIndexedSubscript:", v174);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        v181 = objc_msgSend(v180, "startTimestamp");
        *(_DWORD *)buf = 136315906;
        v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
        v207 = 2112;
        v208 = CFSTR("summary");
        v209 = 1024;
        LODWORD(v210[0]) = v174;
        WORD2(v210[0]) = 2048;
        *(_QWORD *)((char *)v210 + 6) = v181;
        _os_log_impl(&dword_21A2A0000, v176, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nPrevious Turn %d Timestamp: %llu", buf, 0x26u);

        v175 = CDMLogContext;
      }
      else
      {
        v177 = v204;
      }
      if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
      {
        v182 = v175;
        objc_msgSend(v177, "siriNLUTypeObj");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "previousTurnInputs");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "objectAtIndexedSubscript:", v174);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "asrOutputs");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "firstObject");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "utterance");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v206 = "+[CDMComposerServiceUtils logNluRequestForInsights:]";
        v207 = 2112;
        v208 = CFSTR("summary");
        v209 = 1024;
        LODWORD(v210[0]) = v174;
        WORD2(v210[0]) = 2112;
        *(_QWORD *)((char *)v210 + 6) = v188;
        _os_log_impl(&dword_21A2A0000, v182, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nPrevious Turn %d Utterance: %@", buf, 0x26u);

        v177 = v204;
      }
      ++v174;
      objc_msgSend(v177, "siriNLUTypeObj");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "previousTurnInputs");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = objc_msgSend(v190, "count");

    }
    while (v191 > v174);
  }

}

@end
