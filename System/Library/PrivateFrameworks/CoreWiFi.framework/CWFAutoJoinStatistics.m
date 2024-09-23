@implementation CWFAutoJoinStatistics

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
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t CandidateCount;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  id v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  void *v319;
  _QWORD v321[4];
  id v322;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_startedAt(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, (uint64_t)CFSTR("started_at"), v10);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_autoJoinCount(self, v12, v13, v14, v15);
  objc_msgSend_numberWithUnsignedInteger_(v11, v17, v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("auto_join_count"), v22);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_autoJoinRetryCount(self, v24, v25, v26, v27);
  objc_msgSend_numberWithUnsignedInteger_(v23, v29, v28, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, (uint64_t)CFSTR("auto_join_retry_count"), v34);

  v35 = (void *)MEMORY[0x1E0CB37E8];
  CandidateCount = objc_msgSend_autoJoinDidFindCandidateCount(self, v36, v37, v38, v39);
  objc_msgSend_numberWithUnsignedInteger_(v35, v41, CandidateCount, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, (uint64_t)CFSTR("auto_join_did_find_candidate_count"), v46);

  v47 = (void *)MEMORY[0x1E0CB37E8];
  v52 = objc_msgSend_autoJoinDidJoinCount(self, v48, v49, v50, v51);
  objc_msgSend_numberWithUnsignedInteger_(v47, v53, v52, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, (uint64_t)CFSTR("auto_join_did_join_count"), v58);

  v59 = (void *)MEMORY[0x1E0CB37E8];
  v64 = objc_msgSend_autoJoinAlreadyAssociatedCount(self, v60, v61, v62, v63);
  objc_msgSend_numberWithUnsignedInteger_(v59, v65, v64, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, (uint64_t)CFSTR("auto_join_already_assoc_count"), v70);

  v71 = (void *)MEMORY[0x1E0CB37E8];
  v76 = objc_msgSend_autoJoinAbortedCount(self, v72, v73, v74, v75);
  objc_msgSend_numberWithUnsignedInteger_(v71, v77, v76, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v81, (uint64_t)v80, (uint64_t)CFSTR("auto_join_aborted_count"), v82);

  v83 = (void *)MEMORY[0x1E0CB37E8];
  v88 = objc_msgSend_combinedScanChannelCount(self, v84, v85, v86, v87);
  objc_msgSend_numberWithUnsignedInteger_(v83, v89, v88, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v93, (uint64_t)v92, (uint64_t)CFSTR("combined_scan_channel_count"), v94);

  v95 = (void *)MEMORY[0x1E0CB37E8];
  v100 = objc_msgSend_combinedScanChannelCount2GHz(self, v96, v97, v98, v99);
  objc_msgSend_numberWithUnsignedInteger_(v95, v101, v100, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v105, (uint64_t)v104, (uint64_t)CFSTR("combined_scan_channel_count_2ghz"), v106);

  v107 = (void *)MEMORY[0x1E0CB37E8];
  v112 = objc_msgSend_combinedScanChannelCount5GHz(self, v108, v109, v110, v111);
  objc_msgSend_numberWithUnsignedInteger_(v107, v113, v112, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v117, (uint64_t)v116, (uint64_t)CFSTR("combined_scan_channel_count_5ghz"), v118);

  v119 = (void *)MEMORY[0x1E0CB37E8];
  v124 = objc_msgSend_combinedScanChannelCount6GHz(self, v120, v121, v122, v123);
  objc_msgSend_numberWithUnsignedInteger_(v119, v125, v124, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v129, (uint64_t)v128, (uint64_t)CFSTR("combined_scan_channel_count_6ghz"), v130);

  v131 = (void *)MEMORY[0x1E0CB37E8];
  v136 = objc_msgSend_scanChannelCount(self, v132, v133, v134, v135);
  objc_msgSend_numberWithUnsignedInteger_(v131, v137, v136, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v141, (uint64_t)v140, (uint64_t)CFSTR("scan_channel_count"), v142);

  v143 = (void *)MEMORY[0x1E0CB37E8];
  v148 = objc_msgSend_scanChannelCount2GHz(self, v144, v145, v146, v147);
  objc_msgSend_numberWithUnsignedInteger_(v143, v149, v148, v150, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v153, (uint64_t)v152, (uint64_t)CFSTR("scan_channel_count_2ghz"), v154);

  v155 = (void *)MEMORY[0x1E0CB37E8];
  v160 = objc_msgSend_scanChannelCount5GHz(self, v156, v157, v158, v159);
  objc_msgSend_numberWithUnsignedInteger_(v155, v161, v160, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v165, (uint64_t)v164, (uint64_t)CFSTR("scan_channel_count_5ghz"), v166);

  v167 = (void *)MEMORY[0x1E0CB37E8];
  v172 = objc_msgSend_scanChannelCount6GHz(self, v168, v169, v170, v171);
  objc_msgSend_numberWithUnsignedInteger_(v167, v173, v172, v174, v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v177, (uint64_t)v176, (uint64_t)CFSTR("scan_channel_count_6ghz"), v178);

  v179 = (void *)MEMORY[0x1E0CB37E8];
  v184 = objc_msgSend_preAssocScanChannelCount(self, v180, v181, v182, v183);
  objc_msgSend_numberWithUnsignedInteger_(v179, v185, v184, v186, v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v189, (uint64_t)v188, (uint64_t)CFSTR("pre_assoc_scan_channel_count"), v190);

  v191 = (void *)MEMORY[0x1E0CB37E8];
  v196 = objc_msgSend_preAssocScanChannelCount2GHz(self, v192, v193, v194, v195);
  objc_msgSend_numberWithUnsignedInteger_(v191, v197, v196, v198, v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v201, (uint64_t)v200, (uint64_t)CFSTR("pre_assoc_scan_channel_count_2ghz"), v202);

  v203 = (void *)MEMORY[0x1E0CB37E8];
  v208 = objc_msgSend_preAssocScanChannelCount5GHz(self, v204, v205, v206, v207);
  objc_msgSend_numberWithUnsignedInteger_(v203, v209, v208, v210, v211);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v213, (uint64_t)v212, (uint64_t)CFSTR("pre_assoc_scan_channel_count_5ghz"), v214);

  v215 = (void *)MEMORY[0x1E0CB37E8];
  v220 = objc_msgSend_preAssocScanChannelCount6GHz(self, v216, v217, v218, v219);
  objc_msgSend_numberWithUnsignedInteger_(v215, v221, v220, v222, v223);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v225, (uint64_t)v224, (uint64_t)CFSTR("pre_assoc_scan_channel_count_6ghz"), v226);

  v227 = (void *)MEMORY[0x1E0CB37E8];
  v232 = objc_msgSend_followup6GHzScanChannelCount(self, v228, v229, v230, v231);
  objc_msgSend_numberWithUnsignedInteger_(v227, v233, v232, v234, v235);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v237, (uint64_t)v236, (uint64_t)CFSTR("followup_6ghz_scan_channel_count"), v238);

  v239 = (void *)MEMORY[0x1E0CB37E8];
  v244 = objc_msgSend_GASQueryCount(self, v240, v241, v242, v243);
  objc_msgSend_numberWithUnsignedInteger_(v239, v245, v244, v246, v247);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v249, (uint64_t)v248, (uint64_t)CFSTR("gas_query_count"), v250);

  v251 = (void *)MEMORY[0x1E0CB37E8];
  v256 = objc_msgSend_autoHotspotCount(self, v252, v253, v254, v255);
  objc_msgSend_numberWithUnsignedInteger_(v251, v257, v256, v258, v259);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v261, (uint64_t)v260, (uint64_t)CFSTR("auto_hotspot_count"), v262);

  v263 = (void *)MEMORY[0x1E0CB37E8];
  v268 = objc_msgSend_autoHotspotDidFindCandidateCount(self, v264, v265, v266, v267);
  objc_msgSend_numberWithUnsignedInteger_(v263, v269, v268, v270, v271);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v273, (uint64_t)v272, (uint64_t)CFSTR("auto_hotspot_did_find_candidate_count"), v274);

  v275 = (void *)MEMORY[0x1E0CB37E8];
  v280 = objc_msgSend_autoHotspotDidJoinCount(self, v276, v277, v278, v279);
  objc_msgSend_numberWithUnsignedInteger_(v275, v281, v280, v282, v283);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v285, (uint64_t)v284, (uint64_t)CFSTR("auto_hotspot_did_join_count"), v286);

  v287 = (void *)MEMORY[0x1E0CB37E8];
  v292 = objc_msgSend_autoHotspotAbortedCount(self, v288, v289, v290, v291);
  objc_msgSend_numberWithUnsignedInteger_(v287, v293, v292, v294, v295);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v297, (uint64_t)v296, (uint64_t)CFSTR("auto_hotspot_aborted_count"), v298);

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v299, v300, v301, v302);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoJoinTriggerCounts(self, v304, v305, v306, v307);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v321[0] = MEMORY[0x1E0C809B0];
  v321[1] = 3221225472;
  v321[2] = sub_1B06FF010;
  v321[3] = &unk_1E6135C40;
  v309 = v303;
  v322 = v309;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v308, v310, (uint64_t)v321, v311, v312);

  objc_msgSend_setObject_forKeyedSubscript_(v3, v313, (uint64_t)v309, (uint64_t)CFSTR("auto_join_trigger_counts"), v314);
  sub_1B06475A8(v3, 0, 1u);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  if (v318)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v315, (uint64_t)v318, v316, v317);
    v319 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v319 = 0;
  }

  return v319;
}

- (CWFAutoJoinStatistics)init
{
  CWFAutoJoinStatistics *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *autoJoinTriggerCounts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CWFAutoJoinStatistics;
  v2 = -[CWFAutoJoinStatistics init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    autoJoinTriggerCounts = v2->_autoJoinTriggerCounts;
    v2->_autoJoinTriggerCounts = v3;

  }
  return v2;
}

- (unint64_t)autoJoinCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_autoJoinTriggerCounts(self, a2, v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v12)
  {
    v17 = v12;
    v18 = 0;
    v19 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v10);
        v18 += objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v22 + 1) + 8 * i), v13, v14, v15, v16);
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)autoJoinRetryCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend_autoJoinTriggerCounts(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B06FF294;
  v11[3] = &unk_1E6135C68;
  v11[4] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v6, (uint64_t)v11, v7, v8);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unint64_t)combinedScanChannelCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = objc_msgSend_scanChannelCount(self, a2, v2, v3, v4);
  v11 = objc_msgSend_preAssocScanChannelCount(self, v7, v8, v9, v10) + v6;
  return v11 + objc_msgSend_followup6GHzScanChannelCount(self, v12, v13, v14, v15);
}

- (unint64_t)combinedScanChannelCount2GHz
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_scanChannelCount2GHz(self, a2, v2, v3, v4);
  return objc_msgSend_preAssocScanChannelCount2GHz(self, v7, v8, v9, v10) + v6;
}

- (unint64_t)combinedScanChannelCount5GHz
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_scanChannelCount5GHz(self, a2, v2, v3, v4);
  return objc_msgSend_preAssocScanChannelCount5GHz(self, v7, v8, v9, v10) + v6;
}

- (unint64_t)combinedScanChannelCount6GHz
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = objc_msgSend_scanChannelCount6GHz(self, a2, v2, v3, v4);
  v11 = objc_msgSend_preAssocScanChannelCount6GHz(self, v7, v8, v9, v10) + v6;
  return v11 + objc_msgSend_followup6GHzScanChannelCount(self, v12, v13, v14, v15);
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.wifi.autojoin.statistics");
}

- (NSDictionary)coreAnalyticsEventPayload
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t CandidateCount;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
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
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  void *v299;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_autoJoinCount(self, v8, v9, v10, v11);
  objc_msgSend_numberWithUnsignedInteger_(v7, v13, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, (uint64_t)CFSTR("autoJoinCount"), v18);

  v19 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_autoJoinAlreadyAssociatedCount(self, v20, v21, v22, v23);
  objc_msgSend_numberWithUnsignedInteger_(v19, v25, v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v29, (uint64_t)v28, (uint64_t)CFSTR("autoJoinAlreadyAssociatedCount"), v30);

  v31 = (void *)MEMORY[0x1E0CB37E8];
  CandidateCount = objc_msgSend_autoJoinDidFindCandidateCount(self, v32, v33, v34, v35);
  objc_msgSend_numberWithUnsignedInteger_(v31, v37, CandidateCount, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, (uint64_t)CFSTR("autoJoinDidFindCandidateCount"), v42);

  v43 = (void *)MEMORY[0x1E0CB37E8];
  v48 = objc_msgSend_autoJoinDidJoinCount(self, v44, v45, v46, v47);
  objc_msgSend_numberWithUnsignedInteger_(v43, v49, v48, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, (uint64_t)CFSTR("autoJoinDidJoinCount"), v54);

  v55 = (void *)MEMORY[0x1E0CB37E8];
  v60 = objc_msgSend_autoJoinAbortedCount(self, v56, v57, v58, v59);
  objc_msgSend_numberWithUnsignedInteger_(v55, v61, v60, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v65, (uint64_t)v64, (uint64_t)CFSTR("autoJoinAbortedCount"), v66);

  v67 = (void *)MEMORY[0x1E0CB37E8];
  v72 = objc_msgSend_autoJoinRetryCount(self, v68, v69, v70, v71);
  objc_msgSend_numberWithUnsignedInteger_(v67, v73, v72, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v77, (uint64_t)v76, (uint64_t)CFSTR("autoJoinRetryCount"), v78);

  v79 = (void *)MEMORY[0x1E0CB37E8];
  v84 = objc_msgSend_combinedScanChannelCount(self, v80, v81, v82, v83);
  objc_msgSend_numberWithUnsignedInteger_(v79, v85, v84, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v89, (uint64_t)v88, (uint64_t)CFSTR("combinedScanChannelCount"), v90);

  v91 = (void *)MEMORY[0x1E0CB37E8];
  v96 = objc_msgSend_combinedScanChannelCount2GHz(self, v92, v93, v94, v95);
  objc_msgSend_numberWithUnsignedInteger_(v91, v97, v96, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v101, (uint64_t)v100, (uint64_t)CFSTR("combinedScanChannelCount2GHz"), v102);

  v103 = (void *)MEMORY[0x1E0CB37E8];
  v108 = objc_msgSend_combinedScanChannelCount5GHz(self, v104, v105, v106, v107);
  objc_msgSend_numberWithUnsignedInteger_(v103, v109, v108, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v113, (uint64_t)v112, (uint64_t)CFSTR("combinedScanChannelCount5GHz"), v114);

  v115 = (void *)MEMORY[0x1E0CB37E8];
  v120 = objc_msgSend_combinedScanChannelCount6GHz(self, v116, v117, v118, v119);
  objc_msgSend_numberWithUnsignedInteger_(v115, v121, v120, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v125, (uint64_t)v124, (uint64_t)CFSTR("combinedScanChannelCount6GHz"), v126);

  v127 = (void *)MEMORY[0x1E0CB37E8];
  v132 = objc_msgSend_scanChannelCount(self, v128, v129, v130, v131);
  objc_msgSend_numberWithUnsignedInteger_(v127, v133, v132, v134, v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v137, (uint64_t)v136, (uint64_t)CFSTR("scanChannelCount"), v138);

  v139 = (void *)MEMORY[0x1E0CB37E8];
  v144 = objc_msgSend_scanChannelCount2GHz(self, v140, v141, v142, v143);
  objc_msgSend_numberWithUnsignedInteger_(v139, v145, v144, v146, v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v149, (uint64_t)v148, (uint64_t)CFSTR("scanChannelCount2GHz"), v150);

  v151 = (void *)MEMORY[0x1E0CB37E8];
  v156 = objc_msgSend_scanChannelCount5GHz(self, v152, v153, v154, v155);
  objc_msgSend_numberWithUnsignedInteger_(v151, v157, v156, v158, v159);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v161, (uint64_t)v160, (uint64_t)CFSTR("scanChannelCount5GHz"), v162);

  v163 = (void *)MEMORY[0x1E0CB37E8];
  v168 = objc_msgSend_scanChannelCount6GHz(self, v164, v165, v166, v167);
  objc_msgSend_numberWithUnsignedInteger_(v163, v169, v168, v170, v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v173, (uint64_t)v172, (uint64_t)CFSTR("scanChannelCount6GHz"), v174);

  v175 = (void *)MEMORY[0x1E0CB37E8];
  v180 = objc_msgSend_preAssocScanChannelCount(self, v176, v177, v178, v179);
  objc_msgSend_numberWithUnsignedInteger_(v175, v181, v180, v182, v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v185, (uint64_t)v184, (uint64_t)CFSTR("preAssocScanChannelCount"), v186);

  v187 = (void *)MEMORY[0x1E0CB37E8];
  v192 = objc_msgSend_preAssocScanChannelCount2GHz(self, v188, v189, v190, v191);
  objc_msgSend_numberWithUnsignedInteger_(v187, v193, v192, v194, v195);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v197, (uint64_t)v196, (uint64_t)CFSTR("preAssocScanChannelCount2GHz"), v198);

  v199 = (void *)MEMORY[0x1E0CB37E8];
  v204 = objc_msgSend_preAssocScanChannelCount5GHz(self, v200, v201, v202, v203);
  objc_msgSend_numberWithUnsignedInteger_(v199, v205, v204, v206, v207);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v209, (uint64_t)v208, (uint64_t)CFSTR("preAssocScanChannelCount5GHz"), v210);

  v211 = (void *)MEMORY[0x1E0CB37E8];
  v216 = objc_msgSend_preAssocScanChannelCount6GHz(self, v212, v213, v214, v215);
  objc_msgSend_numberWithUnsignedInteger_(v211, v217, v216, v218, v219);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v221, (uint64_t)v220, (uint64_t)CFSTR("preAssocScanChannelCount6GHz"), v222);

  v223 = (void *)MEMORY[0x1E0CB37E8];
  v228 = objc_msgSend_followup6GHzScanChannelCount(self, v224, v225, v226, v227);
  objc_msgSend_numberWithUnsignedInteger_(v223, v229, v228, v230, v231);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v233, (uint64_t)v232, (uint64_t)CFSTR("followup6GHzScanChannelCount"), v234);

  v235 = (void *)MEMORY[0x1E0CB37E8];
  v240 = objc_msgSend_GASQueryCount(self, v236, v237, v238, v239);
  objc_msgSend_numberWithUnsignedInteger_(v235, v241, v240, v242, v243);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v245, (uint64_t)v244, (uint64_t)CFSTR("GASQueryCount"), v246);

  v247 = (void *)MEMORY[0x1E0CB37E8];
  v252 = objc_msgSend_autoHotspotCount(self, v248, v249, v250, v251);
  objc_msgSend_numberWithUnsignedInteger_(v247, v253, v252, v254, v255);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v257, (uint64_t)v256, (uint64_t)CFSTR("autoHotspotCount"), v258);

  v259 = (void *)MEMORY[0x1E0CB37E8];
  v264 = objc_msgSend_autoHotspotDidFindCandidateCount(self, v260, v261, v262, v263);
  objc_msgSend_numberWithUnsignedInteger_(v259, v265, v264, v266, v267);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v269, (uint64_t)v268, (uint64_t)CFSTR("autoHotspotDidFindCandidateCount"), v270);

  v271 = (void *)MEMORY[0x1E0CB37E8];
  v276 = objc_msgSend_autoHotspotDidJoinCount(self, v272, v273, v274, v275);
  objc_msgSend_numberWithUnsignedInteger_(v271, v277, v276, v278, v279);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v281, (uint64_t)v280, (uint64_t)CFSTR("autoHotspotDidJoinCount"), v282);

  v283 = (void *)MEMORY[0x1E0CB37E8];
  v288 = objc_msgSend_autoHotspotAbortedCount(self, v284, v285, v286, v287);
  objc_msgSend_numberWithUnsignedInteger_(v283, v289, v288, v290, v291);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v293, (uint64_t)v292, (uint64_t)CFSTR("autoHotspotAbortedCount"), v294);

  v299 = (void *)objc_msgSend_copy(v6, v295, v296, v297, v298);
  return (NSDictionary *)v299;
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
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t CandidateCount;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
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
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  id v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  _QWORD v180[4];
  id v181;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startedAt(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0630E50(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR("startedAt=%@, "), v14, v15, v12);

  v20 = objc_msgSend_autoJoinCount(self, v16, v17, v18, v19);
  v25 = objc_msgSend_autoJoinRetryCount(self, v21, v22, v23, v24);
  CandidateCount = objc_msgSend_autoJoinDidFindCandidateCount(self, v26, v27, v28, v29);
  v35 = objc_msgSend_autoJoinDidJoinCount(self, v31, v32, v33, v34);
  v40 = objc_msgSend_autoJoinAlreadyAssociatedCount(self, v36, v37, v38, v39);
  v45 = objc_msgSend_autoJoinAbortedCount(self, v41, v42, v43, v44);
  objc_msgSend_appendFormat_(v6, v46, (uint64_t)CFSTR("autoJoin=[%lu (retry=%lu, candidate=%lu, join=%lu, already=%lu, abort=%lu)], "), v47, v48, v20, v25, CandidateCount, v35, v40, v45);
  v53 = objc_msgSend_combinedScanChannelCount(self, v49, v50, v51, v52);
  v58 = objc_msgSend_combinedScanChannelCount2GHz(self, v54, v55, v56, v57);
  v63 = objc_msgSend_combinedScanChannelCount5GHz(self, v59, v60, v61, v62);
  v68 = objc_msgSend_combinedScanChannelCount6GHz(self, v64, v65, v66, v67);
  objc_msgSend_appendFormat_(v6, v69, (uint64_t)CFSTR("combinedScan=[%lu (2GHz=%lu, 5GHz=%lu, 6GHz=%lu)], "), v70, v71, v53, v58, v63, v68);
  v76 = objc_msgSend_scanChannelCount(self, v72, v73, v74, v75);
  v81 = objc_msgSend_scanChannelCount2GHz(self, v77, v78, v79, v80);
  v86 = objc_msgSend_scanChannelCount5GHz(self, v82, v83, v84, v85);
  v91 = objc_msgSend_scanChannelCount6GHz(self, v87, v88, v89, v90);
  objc_msgSend_appendFormat_(v6, v92, (uint64_t)CFSTR("scan=[%lu (2GHz=%lu, 5GHz=%lu, 6GHz=%lu)], "), v93, v94, v76, v81, v86, v91);
  v99 = objc_msgSend_preAssocScanChannelCount(self, v95, v96, v97, v98);
  v104 = objc_msgSend_preAssocScanChannelCount2GHz(self, v100, v101, v102, v103);
  v109 = objc_msgSend_preAssocScanChannelCount5GHz(self, v105, v106, v107, v108);
  v114 = objc_msgSend_preAssocScanChannelCount6GHz(self, v110, v111, v112, v113);
  objc_msgSend_appendFormat_(v6, v115, (uint64_t)CFSTR("preAssocScan=[%lu (2GHz=%lu, 5GHz=%lu, 6GHz=%lu)], "), v116, v117, v99, v104, v109, v114);
  v122 = objc_msgSend_followup6GHzScanChannelCount(self, v118, v119, v120, v121);
  objc_msgSend_appendFormat_(v6, v123, (uint64_t)CFSTR("followup6GHzScan=%lu, "), v124, v125, v122);
  v130 = objc_msgSend_GASQueryCount(self, v126, v127, v128, v129);
  objc_msgSend_appendFormat_(v6, v131, (uint64_t)CFSTR("GAS=%lu, "), v132, v133, v130);
  v138 = objc_msgSend_autoHotspotCount(self, v134, v135, v136, v137);
  v143 = objc_msgSend_autoHotspotDidFindCandidateCount(self, v139, v140, v141, v142);
  v148 = objc_msgSend_autoHotspotDidJoinCount(self, v144, v145, v146, v147);
  v153 = objc_msgSend_autoHotspotAbortedCount(self, v149, v150, v151, v152);
  objc_msgSend_appendFormat_(v6, v154, (uint64_t)CFSTR("autoHotspot=[%lu (candidate=%lu, join=%lu, abort=%lu)], "), v155, v156, v138, v143, v148, v153);
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v157, v158, v159, v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoJoinTriggerCounts(self, v162, v163, v164, v165);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v180[0] = MEMORY[0x1E0C809B0];
  v180[1] = 3221225472;
  v180[2] = sub_1B06FFC60;
  v180[3] = &unk_1E6135C40;
  v181 = v161;
  v167 = v161;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v166, v168, (uint64_t)v180, v169, v170);

  objc_msgSend_appendFormat_(v6, v171, (uint64_t)CFSTR("triggers=(%@)"), v172, v173, v167);
  v178 = (void *)objc_msgSend_copy(v6, v174, v175, v176, v177);

  return (NSString *)v178;
}

- (BOOL)isEqualToAutoJoinStatistics:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  NSDate *startedAt;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDate *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSDate *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  NSMutableDictionary *autoJoinTriggerCounts;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableDictionary *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableDictionary *v39;
  uint64_t v40;
  NSMutableDictionary *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t autoJoinDidFindCandidateCount;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t autoJoinDidJoinCount;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t autoJoinAlreadyAssociatedCount;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t autoJoinAbortedCount;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t scanChannelCount;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t scanChannelCount2GHz;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t scanChannelCount5GHz;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t scanChannelCount6GHz;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t preAssocScanChannelCount;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t preAssocScanChannelCount2GHz;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t preAssocScanChannelCount5GHz;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t preAssocScanChannelCount6GHz;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t followup6GHzScanChannelCount;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t GASQueryCount;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t autoHotspotCount;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t autoHotspotDidFindCandidateCount;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t autoHotspotDidJoinCount;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t autoHotspotAbortedCount;
  void *v133;

  v7 = a3;
  startedAt = self->_startedAt;
  objc_msgSend_startedAt(v7, v9, v10, v11, v12);
  v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (startedAt != v17)
  {
    if (!self->_startedAt
      || (objc_msgSend_startedAt(v7, v13, v14, v15, v16), (v18 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = 0;
      goto LABEL_40;
    }
    v3 = (void *)v18;
    v23 = self->_startedAt;
    objc_msgSend_startedAt(v7, v19, v20, v21, v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v23, v24, (uint64_t)v4, v25, v26))
    {
      v27 = 0;
LABEL_39:

      goto LABEL_40;
    }
  }
  autoJoinTriggerCounts = self->_autoJoinTriggerCounts;
  objc_msgSend_autoJoinTriggerCounts(v7, v13, v14, v15, v16);
  v33 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  if (autoJoinTriggerCounts != v33)
  {
    if (!self->_autoJoinTriggerCounts)
      goto LABEL_34;
    objc_msgSend_autoJoinTriggerCounts(v7, v29, v30, v31, v32);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
LABEL_33:

      v27 = 0;
      goto LABEL_38;
    }
    v5 = (void *)v34;
    v39 = self->_autoJoinTriggerCounts;
    objc_msgSend_autoJoinTriggerCounts(v7, v35, v36, v37, v38);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v39;
    v42 = (void *)v40;
    if (!objc_msgSend_isEqual_(v41, v43, v40, v44, v45))
    {
      v27 = 0;
LABEL_36:

      goto LABEL_37;
    }
    v133 = v42;
  }
  autoJoinDidFindCandidateCount = self->_autoJoinDidFindCandidateCount;
  if (autoJoinDidFindCandidateCount == objc_msgSend_autoJoinDidFindCandidateCount(v7, v29, v30, v31, v32))
  {
    autoJoinDidJoinCount = self->_autoJoinDidJoinCount;
    if (autoJoinDidJoinCount == objc_msgSend_autoJoinDidJoinCount(v7, v47, v48, v49, v50))
    {
      autoJoinAlreadyAssociatedCount = self->_autoJoinAlreadyAssociatedCount;
      if (autoJoinAlreadyAssociatedCount == objc_msgSend_autoJoinAlreadyAssociatedCount(v7, v52, v53, v54, v55))
      {
        autoJoinAbortedCount = self->_autoJoinAbortedCount;
        if (autoJoinAbortedCount == objc_msgSend_autoJoinAbortedCount(v7, v57, v58, v59, v60))
        {
          scanChannelCount = self->_scanChannelCount;
          if (scanChannelCount == objc_msgSend_scanChannelCount(v7, v62, v63, v64, v65))
          {
            scanChannelCount2GHz = self->_scanChannelCount2GHz;
            if (scanChannelCount2GHz == objc_msgSend_scanChannelCount2GHz(v7, v67, v68, v69, v70))
            {
              scanChannelCount5GHz = self->_scanChannelCount5GHz;
              if (scanChannelCount5GHz == objc_msgSend_scanChannelCount5GHz(v7, v72, v73, v74, v75))
              {
                scanChannelCount6GHz = self->_scanChannelCount6GHz;
                if (scanChannelCount6GHz == objc_msgSend_scanChannelCount6GHz(v7, v77, v78, v79, v80))
                {
                  preAssocScanChannelCount = self->_preAssocScanChannelCount;
                  if (preAssocScanChannelCount == objc_msgSend_preAssocScanChannelCount(v7, v82, v83, v84, v85))
                  {
                    preAssocScanChannelCount2GHz = self->_preAssocScanChannelCount2GHz;
                    if (preAssocScanChannelCount2GHz == objc_msgSend_preAssocScanChannelCount2GHz(v7, v87, v88, v89, v90))
                    {
                      preAssocScanChannelCount5GHz = self->_preAssocScanChannelCount5GHz;
                      if (preAssocScanChannelCount5GHz == objc_msgSend_preAssocScanChannelCount5GHz(v7, v92, v93, v94, v95))
                      {
                        preAssocScanChannelCount6GHz = self->_preAssocScanChannelCount6GHz;
                        if (preAssocScanChannelCount6GHz == objc_msgSend_preAssocScanChannelCount6GHz(v7, v97, v98, v99, v100))
                        {
                          followup6GHzScanChannelCount = self->_followup6GHzScanChannelCount;
                          if (followup6GHzScanChannelCount == objc_msgSend_followup6GHzScanChannelCount(v7, v102, v103, v104, v105))
                          {
                            GASQueryCount = self->_GASQueryCount;
                            if (GASQueryCount == objc_msgSend_GASQueryCount(v7, v107, v108, v109, v110))
                            {
                              autoHotspotCount = self->_autoHotspotCount;
                              if (autoHotspotCount == objc_msgSend_autoHotspotCount(v7, v112, v113, v114, v115))
                              {
                                autoHotspotDidFindCandidateCount = self->_autoHotspotDidFindCandidateCount;
                                if (autoHotspotDidFindCandidateCount == objc_msgSend_autoHotspotDidFindCandidateCount(v7, v117, v118, v119, v120))
                                {
                                  autoHotspotDidJoinCount = self->_autoHotspotDidJoinCount;
                                  if (autoHotspotDidJoinCount == objc_msgSend_autoHotspotDidJoinCount(v7, v122, v123, v124, v125))
                                  {
                                    autoHotspotAbortedCount = self->_autoHotspotAbortedCount;
                                    v27 = autoHotspotAbortedCount == objc_msgSend_autoHotspotAbortedCount(v7, v127, v128, v129, v130);
                                    v42 = v133;
                                    if (autoJoinTriggerCounts == v33)
                                      goto LABEL_37;
                                    goto LABEL_36;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (autoJoinTriggerCounts != v33)
  {

    goto LABEL_33;
  }
LABEL_34:
  v27 = 0;
LABEL_37:

LABEL_38:
  if (startedAt != v17)
    goto LABEL_39;
LABEL_40:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  CWFAutoJoinStatistics *v4;
  CWFAutoJoinStatistics *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToAutoJoinStatistics;

  v4 = (CWFAutoJoinStatistics *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAutoJoinStatistics = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAutoJoinStatistics = objc_msgSend_isEqualToAutoJoinStatistics_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToAutoJoinStatistics = 0;
  }

  return isEqualToAutoJoinStatistics;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int8x16_t v12;

  v6 = objc_msgSend_hash(self->_startedAt, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_autoJoinTriggerCounts, v7, v8, v9, v10);
  v12 = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)&self->_autoJoinAlreadyAssociatedCount, *(int8x16_t *)&self->_preAssocScanChannelCount), veorq_s8(*(int8x16_t *)&self->_scanChannelCount, *(int8x16_t *)&self->_followup6GHzScanChannelCount)), veorq_s8(veorq_s8(*(int8x16_t *)&self->_autoJoinDidJoinCount, *(int8x16_t *)&self->_preAssocScanChannelCount5GHz), veorq_s8(*(int8x16_t *)&self->_scanChannelCount5GHz, *(int8x16_t *)&self->_autoHotspotCount)));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) ^ self->_autoHotspotDidJoinCount ^ self->_autoHotspotAbortedCount ^ v11 ^ v6;
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
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
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinStatistics, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setStartedAt_(v11, v12, (uint64_t)self->_startedAt, v13, v14);
  v19 = (void *)objc_msgSend_mutableCopy(self->_autoJoinTriggerCounts, v15, v16, v17, v18);
  objc_msgSend_setAutoJoinTriggerCounts_(v11, v20, (uint64_t)v19, v21, v22);

  objc_msgSend_setAutoJoinDidFindCandidateCount_(v11, v23, self->_autoJoinDidFindCandidateCount, v24, v25);
  objc_msgSend_setAutoJoinDidJoinCount_(v11, v26, self->_autoJoinDidJoinCount, v27, v28);
  objc_msgSend_setAutoJoinAlreadyAssociatedCount_(v11, v29, self->_autoJoinAlreadyAssociatedCount, v30, v31);
  objc_msgSend_setAutoJoinAbortedCount_(v11, v32, self->_autoJoinAbortedCount, v33, v34);
  objc_msgSend_setScanChannelCount_(v11, v35, self->_scanChannelCount, v36, v37);
  objc_msgSend_setScanChannelCount2GHz_(v11, v38, self->_scanChannelCount2GHz, v39, v40);
  objc_msgSend_setScanChannelCount5GHz_(v11, v41, self->_scanChannelCount5GHz, v42, v43);
  objc_msgSend_setScanChannelCount6GHz_(v11, v44, self->_scanChannelCount6GHz, v45, v46);
  objc_msgSend_setPreAssocScanChannelCount_(v11, v47, self->_preAssocScanChannelCount, v48, v49);
  objc_msgSend_setPreAssocScanChannelCount2GHz_(v11, v50, self->_preAssocScanChannelCount2GHz, v51, v52);
  objc_msgSend_setPreAssocScanChannelCount5GHz_(v11, v53, self->_preAssocScanChannelCount5GHz, v54, v55);
  objc_msgSend_setPreAssocScanChannelCount6GHz_(v11, v56, self->_preAssocScanChannelCount6GHz, v57, v58);
  objc_msgSend_setFollowup6GHzScanChannelCount_(v11, v59, self->_followup6GHzScanChannelCount, v60, v61);
  objc_msgSend_setGASQueryCount_(v11, v62, self->_GASQueryCount, v63, v64);
  objc_msgSend_setAutoHotspotCount_(v11, v65, self->_autoHotspotCount, v66, v67);
  objc_msgSend_setAutoHotspotDidFindCandidateCount_(v11, v68, self->_autoHotspotDidFindCandidateCount, v69, v70);
  objc_msgSend_setAutoHotspotDidJoinCount_(v11, v71, self->_autoHotspotDidJoinCount, v72, v73);
  objc_msgSend_setAutoHotspotAbortedCount_(v11, v74, self->_autoHotspotAbortedCount, v75, v76);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startedAt;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  id v122;

  startedAt = self->_startedAt;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)startedAt, (uint64_t)CFSTR("_startedAt"), v7);
  v12 = (void *)objc_msgSend_copy(self->_autoJoinTriggerCounts, v8, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)v12, (uint64_t)CFSTR("_autoJoinTriggerCounts"), v14);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, self->_autoJoinDidFindCandidateCount, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)v18, (uint64_t)CFSTR("_autoJoinDidFindCandidateCount"), v20);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v21, self->_autoJoinDidJoinCount, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)v24, (uint64_t)CFSTR("_autoJoinDidJoinCount"), v26);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v27, self->_autoJoinAlreadyAssociatedCount, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)v30, (uint64_t)CFSTR("_autoJoinAlreadyAssociatedCount"), v32);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v33, self->_autoJoinAbortedCount, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v37, (uint64_t)v36, (uint64_t)CFSTR("_autoJoinAbortedCount"), v38);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v39, self->_scanChannelCount, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v43, (uint64_t)v42, (uint64_t)CFSTR("_scanChannelCount"), v44);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v45, self->_scanChannelCount2GHz, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v49, (uint64_t)v48, (uint64_t)CFSTR("_scanChannelCount2GHz"), v50);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v51, self->_scanChannelCount5GHz, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v55, (uint64_t)v54, (uint64_t)CFSTR("_scanChannelCount5GHz"), v56);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v57, self->_scanChannelCount6GHz, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v61, (uint64_t)v60, (uint64_t)CFSTR("_scanChannelCount6GHz"), v62);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v63, self->_preAssocScanChannelCount, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v67, (uint64_t)v66, (uint64_t)CFSTR("_preAssocScanChannelCount"), v68);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v69, self->_preAssocScanChannelCount2GHz, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v73, (uint64_t)v72, (uint64_t)CFSTR("_preAssocScanChannelCount2GHz"), v74);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v75, self->_preAssocScanChannelCount5GHz, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v79, (uint64_t)v78, (uint64_t)CFSTR("_preAssocScanChannelCount5GHz"), v80);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v81, self->_preAssocScanChannelCount6GHz, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v85, (uint64_t)v84, (uint64_t)CFSTR("_preAssocScanChannelCount6GHz"), v86);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v87, self->_followup6GHzScanChannelCount, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v91, (uint64_t)v90, (uint64_t)CFSTR("_followup6GHzScanChannelCount"), v92);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v93, self->_GASQueryCount, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v97, (uint64_t)v96, (uint64_t)CFSTR("_GASQueryCount"), v98);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v99, self->_autoHotspotCount, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v103, (uint64_t)v102, (uint64_t)CFSTR("_autoHotspotCount"), v104);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v105, self->_autoHotspotDidFindCandidateCount, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v109, (uint64_t)v108, (uint64_t)CFSTR("_autoHotspotDidFindCandidateCount"), v110);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v111, self->_autoHotspotDidJoinCount, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v115, (uint64_t)v114, (uint64_t)CFSTR("_autoHotspotDidJoinCount"), v116);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v117, self->_autoHotspotAbortedCount, v118, v119);
  v122 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v120, (uint64_t)v122, (uint64_t)CFSTR("_autoHotspotAbortedCount"), v121);

}

- (CWFAutoJoinStatistics)initWithCoder:(id)a3
{
  id v4;
  CWFAutoJoinStatistics *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *startedAt;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableDictionary *autoJoinTriggerCounts;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  objc_super v172;

  v4 = a3;
  v172.receiver = self;
  v172.super_class = (Class)CWFAutoJoinStatistics;
  v5 = -[CWFAutoJoinStatistics init](&v172, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_startedAt"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v15, v16, v13, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v17, (uint64_t)CFSTR("_autoJoinTriggerCounts"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_mutableCopy(v20, v21, v22, v23, v24);
    autoJoinTriggerCounts = v5->_autoJoinTriggerCounts;
    v5->_autoJoinTriggerCounts = (NSMutableDictionary *)v25;

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, (uint64_t)CFSTR("_autoJoinDidFindCandidateCount"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoJoinDidFindCandidateCount = objc_msgSend_unsignedIntegerValue(v30, v31, v32, v33, v34);

    v35 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, (uint64_t)CFSTR("_autoJoinDidJoinCount"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoJoinDidJoinCount = objc_msgSend_unsignedIntegerValue(v38, v39, v40, v41, v42);

    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, (uint64_t)CFSTR("_autoJoinAlreadyAssociatedCount"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoJoinAlreadyAssociatedCount = objc_msgSend_unsignedIntegerValue(v46, v47, v48, v49, v50);

    v51 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, (uint64_t)CFSTR("_autoJoinAbortedCount"), v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoJoinAbortedCount = objc_msgSend_unsignedIntegerValue(v54, v55, v56, v57, v58);

    v59 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, (uint64_t)CFSTR("_scanChannelCount"), v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scanChannelCount = objc_msgSend_unsignedIntegerValue(v62, v63, v64, v65, v66);

    v67 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v68, v67, (uint64_t)CFSTR("_scanChannelCount2GHz"), v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scanChannelCount2GHz = objc_msgSend_unsignedIntegerValue(v70, v71, v72, v73, v74);

    v75 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v76, v75, (uint64_t)CFSTR("_scanChannelCount5GHz"), v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scanChannelCount5GHz = objc_msgSend_unsignedIntegerValue(v78, v79, v80, v81, v82);

    v83 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v84, v83, (uint64_t)CFSTR("_scanChannelCount6GHz"), v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scanChannelCount6GHz = objc_msgSend_unsignedIntegerValue(v86, v87, v88, v89, v90);

    v91 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v92, v91, (uint64_t)CFSTR("_preAssocScanChannelCount"), v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preAssocScanChannelCount = objc_msgSend_unsignedIntegerValue(v94, v95, v96, v97, v98);

    v99 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v100, v99, (uint64_t)CFSTR("_preAssocScanChannelCount2GHz"), v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preAssocScanChannelCount2GHz = objc_msgSend_unsignedIntegerValue(v102, v103, v104, v105, v106);

    v107 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v108, v107, (uint64_t)CFSTR("_preAssocScanChannelCount5GHz"), v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preAssocScanChannelCount5GHz = objc_msgSend_unsignedIntegerValue(v110, v111, v112, v113, v114);

    v115 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v116, v115, (uint64_t)CFSTR("_preAssocScanChannelCount6GHz"), v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preAssocScanChannelCount6GHz = objc_msgSend_unsignedIntegerValue(v118, v119, v120, v121, v122);

    v123 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v124, v123, (uint64_t)CFSTR("_followup6GHzScanChannelCount"), v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_followup6GHzScanChannelCount = objc_msgSend_unsignedIntegerValue(v126, v127, v128, v129, v130);

    v131 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v132, v131, (uint64_t)CFSTR("_GASQueryCount"), v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_GASQueryCount = objc_msgSend_unsignedIntegerValue(v134, v135, v136, v137, v138);

    v139 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v140, v139, (uint64_t)CFSTR("_autoHotspotCount"), v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoHotspotCount = objc_msgSend_unsignedIntegerValue(v142, v143, v144, v145, v146);

    v147 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v148, v147, (uint64_t)CFSTR("_autoHotspotDidFindCandidateCount"), v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoHotspotDidFindCandidateCount = objc_msgSend_unsignedIntegerValue(v150, v151, v152, v153, v154);

    v155 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v156, v155, (uint64_t)CFSTR("_autoHotspotDidJoinCount"), v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoHotspotDidJoinCount = objc_msgSend_unsignedIntegerValue(v158, v159, v160, v161, v162);

    v163 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v164, v163, (uint64_t)CFSTR("_autoHotspotAbortedCount"), v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoHotspotAbortedCount = objc_msgSend_unsignedIntegerValue(v166, v167, v168, v169, v170);

  }
  return v5;
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)autoJoinTriggerCounts
{
  return self->_autoJoinTriggerCounts;
}

- (void)setAutoJoinTriggerCounts:(id)a3
{
  objc_storeStrong((id *)&self->_autoJoinTriggerCounts, a3);
}

- (unint64_t)autoJoinAlreadyAssociatedCount
{
  return self->_autoJoinAlreadyAssociatedCount;
}

- (void)setAutoJoinAlreadyAssociatedCount:(unint64_t)a3
{
  self->_autoJoinAlreadyAssociatedCount = a3;
}

- (unint64_t)autoJoinDidFindCandidateCount
{
  return self->_autoJoinDidFindCandidateCount;
}

- (void)setAutoJoinDidFindCandidateCount:(unint64_t)a3
{
  self->_autoJoinDidFindCandidateCount = a3;
}

- (unint64_t)autoJoinDidJoinCount
{
  return self->_autoJoinDidJoinCount;
}

- (void)setAutoJoinDidJoinCount:(unint64_t)a3
{
  self->_autoJoinDidJoinCount = a3;
}

- (unint64_t)autoJoinAbortedCount
{
  return self->_autoJoinAbortedCount;
}

- (void)setAutoJoinAbortedCount:(unint64_t)a3
{
  self->_autoJoinAbortedCount = a3;
}

- (unint64_t)scanChannelCount
{
  return self->_scanChannelCount;
}

- (void)setScanChannelCount:(unint64_t)a3
{
  self->_scanChannelCount = a3;
}

- (unint64_t)scanChannelCount2GHz
{
  return self->_scanChannelCount2GHz;
}

- (void)setScanChannelCount2GHz:(unint64_t)a3
{
  self->_scanChannelCount2GHz = a3;
}

- (unint64_t)scanChannelCount5GHz
{
  return self->_scanChannelCount5GHz;
}

- (void)setScanChannelCount5GHz:(unint64_t)a3
{
  self->_scanChannelCount5GHz = a3;
}

- (unint64_t)scanChannelCount6GHz
{
  return self->_scanChannelCount6GHz;
}

- (void)setScanChannelCount6GHz:(unint64_t)a3
{
  self->_scanChannelCount6GHz = a3;
}

- (unint64_t)preAssocScanChannelCount
{
  return self->_preAssocScanChannelCount;
}

- (void)setPreAssocScanChannelCount:(unint64_t)a3
{
  self->_preAssocScanChannelCount = a3;
}

- (unint64_t)preAssocScanChannelCount2GHz
{
  return self->_preAssocScanChannelCount2GHz;
}

- (void)setPreAssocScanChannelCount2GHz:(unint64_t)a3
{
  self->_preAssocScanChannelCount2GHz = a3;
}

- (unint64_t)preAssocScanChannelCount5GHz
{
  return self->_preAssocScanChannelCount5GHz;
}

- (void)setPreAssocScanChannelCount5GHz:(unint64_t)a3
{
  self->_preAssocScanChannelCount5GHz = a3;
}

- (unint64_t)preAssocScanChannelCount6GHz
{
  return self->_preAssocScanChannelCount6GHz;
}

- (void)setPreAssocScanChannelCount6GHz:(unint64_t)a3
{
  self->_preAssocScanChannelCount6GHz = a3;
}

- (unint64_t)followup6GHzScanChannelCount
{
  return self->_followup6GHzScanChannelCount;
}

- (void)setFollowup6GHzScanChannelCount:(unint64_t)a3
{
  self->_followup6GHzScanChannelCount = a3;
}

- (unint64_t)GASQueryCount
{
  return self->_GASQueryCount;
}

- (void)setGASQueryCount:(unint64_t)a3
{
  self->_GASQueryCount = a3;
}

- (unint64_t)autoHotspotCount
{
  return self->_autoHotspotCount;
}

- (void)setAutoHotspotCount:(unint64_t)a3
{
  self->_autoHotspotCount = a3;
}

- (unint64_t)autoHotspotDidFindCandidateCount
{
  return self->_autoHotspotDidFindCandidateCount;
}

- (void)setAutoHotspotDidFindCandidateCount:(unint64_t)a3
{
  self->_autoHotspotDidFindCandidateCount = a3;
}

- (unint64_t)autoHotspotDidJoinCount
{
  return self->_autoHotspotDidJoinCount;
}

- (void)setAutoHotspotDidJoinCount:(unint64_t)a3
{
  self->_autoHotspotDidJoinCount = a3;
}

- (unint64_t)autoHotspotAbortedCount
{
  return self->_autoHotspotAbortedCount;
}

- (void)setAutoHotspotAbortedCount:(unint64_t)a3
{
  self->_autoHotspotAbortedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoJoinTriggerCounts, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);
}

@end
