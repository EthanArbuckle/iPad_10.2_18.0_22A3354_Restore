@implementation LBFCoreAnalyticsUtils

+ (void)upload:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  const char *v66;
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
  void *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  uint64_t isActivated;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  uint64_t isAllocated;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
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
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
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
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  id v240;
  _QWORD v241[20];
  _QWORD v242[22];

  v242[20] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v241[0] = CFSTR("lighthouseplugin_count_PerformTask_Failed");
  if (objc_msgSend_hasCountPerformTaskFailed(v3, v4, v5, v6, v7))
  {
    v12 = (void *)MEMORY[0x24BDD16E0];
    v13 = objc_msgSend_countPerformTaskFailed(v3, v8, v9, v10, v11);
    objc_msgSend_numberWithUnsignedInt_(v12, v14, v13, v15, v16);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v9, v10, v11);
  }
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v242[0] = v239;
  v241[1] = CFSTR("lighthouseplugin_count_PerformTask_Succeeded");
  if (objc_msgSend_hasCountPerformTaskSucceeded(v3, v17, v18, v19, v20))
  {
    v25 = (void *)MEMORY[0x24BDD16E0];
    v26 = objc_msgSend_countPerformTaskSucceeded(v3, v21, v22, v23, v24);
    objc_msgSend_numberWithUnsignedInt_(v25, v27, v26, v28, v29);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v21, v22, v23, v24);
  }
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v242[1] = v238;
  v241[2] = CFSTR("lighthouseplugin_count_Stop_Failed");
  if (objc_msgSend_hasCountStopFailed(v3, v30, v31, v32, v33))
  {
    v38 = (void *)MEMORY[0x24BDD16E0];
    v39 = objc_msgSend_countStopFailed(v3, v34, v35, v36, v37);
    objc_msgSend_numberWithUnsignedInt_(v38, v40, v39, v41, v42);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v34, v35, v36, v37);
  }
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v242[2] = v237;
  v241[3] = CFSTR("lighthouseplugin_count_Stop_Succeeded");
  if (objc_msgSend_hasCountStopSucceeded(v3, v43, v44, v45, v46))
  {
    v51 = (void *)MEMORY[0x24BDD16E0];
    v52 = objc_msgSend_countStopSucceeded(v3, v47, v48, v49, v50);
    objc_msgSend_numberWithUnsignedInt_(v51, v53, v52, v54, v55);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v47, v48, v49, v50);
  }
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v242[3] = v236;
  v241[4] = CFSTR("mlruntimedevent_count_TaskCompleted_Failed");
  if (objc_msgSend_hasCountTaskCompletedFailed(v3, v56, v57, v58, v59))
  {
    v64 = (void *)MEMORY[0x24BDD16E0];
    v65 = objc_msgSend_countTaskCompletedFailed(v3, v60, v61, v62, v63);
    objc_msgSend_numberWithUnsignedInt_(v64, v66, v65, v67, v68);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v60, v61, v62, v63);
  }
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v242[4] = v235;
  v241[5] = CFSTR("mlruntimedevent_count_TaskCompleted_Succeeded");
  if (objc_msgSend_hasCountTaskCompletedSucceeded(v3, v69, v70, v71, v72))
  {
    v77 = (void *)MEMORY[0x24BDD16E0];
    v78 = objc_msgSend_countTaskCompletedSucceeded(v3, v73, v74, v75, v76);
    objc_msgSend_numberWithUnsignedInt_(v77, v79, v78, v80, v81);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v73, v74, v75, v76);
  }
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v242[5] = v234;
  v241[6] = CFSTR("mlruntimedevent_count_TaskFetched_Failed");
  if (objc_msgSend_hasCountTaskFetchedFailed(v3, v82, v83, v84, v85))
  {
    v90 = (void *)MEMORY[0x24BDD16E0];
    v91 = objc_msgSend_countTaskFetchedFailed(v3, v86, v87, v88, v89);
    objc_msgSend_numberWithUnsignedInt_(v90, v92, v91, v93, v94);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v86, v87, v88, v89);
  }
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v242[6] = v233;
  v241[7] = CFSTR("mlruntimedevent_count_TaskFetched_Succeeded");
  if (objc_msgSend_hasCountTaskFetchedSucceeded(v3, v95, v96, v97, v98))
  {
    v103 = (void *)MEMORY[0x24BDD16E0];
    v104 = objc_msgSend_countTaskFetchedSucceeded(v3, v99, v100, v101, v102);
    objc_msgSend_numberWithUnsignedInt_(v103, v105, v104, v106, v107);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v99, v100, v101, v102);
  }
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v242[7] = v232;
  v241[8] = CFSTR("mlruntimedevent_count_TaskScheduled_Failed");
  if (objc_msgSend_hasCountTaskScheduledFailed(v3, v108, v109, v110, v111))
  {
    v116 = (void *)MEMORY[0x24BDD16E0];
    v117 = objc_msgSend_countTaskScheduledFailed(v3, v112, v113, v114, v115);
    objc_msgSend_numberWithUnsignedInt_(v116, v118, v117, v119, v120);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v112, v113, v114, v115);
  }
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v242[8] = v231;
  v241[9] = CFSTR("mlruntimedevent_count_TaskScheduled_Succeeded");
  if (objc_msgSend_hasCountTaskScheduledSucceeded(v3, v121, v122, v123, v124))
  {
    v129 = (void *)MEMORY[0x24BDD16E0];
    v130 = objc_msgSend_countTaskScheduledSucceeded(v3, v125, v126, v127, v128);
    objc_msgSend_numberWithUnsignedInt_(v129, v131, v130, v132, v133);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v125, v126, v127, v128);
  }
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v242[9] = v230;
  v241[10] = CFSTR("trialdevent_is_activated");
  if (objc_msgSend_hasIsActivated(v3, v134, v135, v136, v137))
  {
    v142 = (void *)MEMORY[0x24BDD16E0];
    isActivated = objc_msgSend_isActivated(v3, v138, v139, v140, v141);
    objc_msgSend_numberWithBool_(v142, v144, isActivated, v145, v146);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v138, v139, v140, v141);
  }
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v242[10] = v229;
  v241[11] = CFSTR("trialdevent_is_allocated");
  if (objc_msgSend_hasIsAllocated(v3, v147, v148, v149, v150))
  {
    v155 = (void *)MEMORY[0x24BDD16E0];
    isAllocated = objc_msgSend_isAllocated(v3, v151, v152, v153, v154);
    objc_msgSend_numberWithBool_(v155, v157, isAllocated, v158, v159);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v151, v152, v153, v154);
  }
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v242[11] = v228;
  v241[12] = CFSTR("trial_BMLTTaskId");
  if (objc_msgSend_hasTrialTaskID(v3, v160, v161, v162, v163))
    objc_msgSend_trialTaskID(v3, v164, v165, v166, v167);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v164, v165, v166, v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v242[12] = v168;
  v241[13] = CFSTR("trial_deploymentId");
  if (objc_msgSend_hasTrialDeploymentID(v3, v169, v170, v171, v172))
    objc_msgSend_trialDeploymentID(v3, v173, v174, v175, v176);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v173, v174, v175, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v242[13] = v177;
  v241[14] = CFSTR("trial_experimentId");
  if (objc_msgSend_hasTrialExperimentID(v3, v178, v179, v180, v181))
    objc_msgSend_trialExperimentID(v3, v182, v183, v184, v185);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v182, v183, v184, v185);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v242[14] = v186;
  v241[15] = CFSTR("trial_treatmentId");
  if (objc_msgSend_hasTrialTreatmentID(v3, v187, v188, v189, v190))
    objc_msgSend_trialTreatmentID(v3, v191, v192, v193, v194);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v191, v192, v193, v194);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v242[15] = v195;
  v241[16] = CFSTR("timestamp");
  v196 = (void *)MEMORY[0x24BDD16E0];
  v201 = objc_msgSend_timestamp(v3, v197, v198, v199, v200);
  objc_msgSend_numberWithUnsignedLongLong_(v196, v202, v201, v203, v204);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v242[16] = v205;
  v241[17] = CFSTR("timestamp_str");
  v206 = (void *)MEMORY[0x24BDD17C8];
  v211 = objc_msgSend_timestamp(v3, v207, v208, v209, v210);
  objc_msgSend_stringWithFormat_(v206, v212, (uint64_t)CFSTR("%llu"), v213, v214, v211);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v242[17] = v215;
  v241[18] = CFSTR("telemetryID");
  objc_msgSend_telemetryID(v3, v216, v217, v218, v219);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v242[18] = v220;
  v241[19] = CFSTR("contextID");
  objc_msgSend_contextID(v3, v221, v222, v223, v224);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v242[19] = v225;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v226, (uint64_t)v242, (uint64_t)v241, 20);
  v227 = (void *)objc_claimAutoreleasedReturnValue();

  v240 = v227;
  AnalyticsSendEventLazy();

}

@end
