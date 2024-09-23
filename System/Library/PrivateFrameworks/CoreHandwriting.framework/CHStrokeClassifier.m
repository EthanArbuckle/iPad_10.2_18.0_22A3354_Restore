@implementation CHStrokeClassifier

- (CHStrokeClassifier)initWithStrokeProvider:(id)a3 strokeClassificationLastResult:(id)a4 forceClass:(int64_t)a5
{
  id v9;
  id v10;
  CHStrokeClassifier *v11;
  CHStrokeClassifier *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHStrokeClassifier;
  v11 = -[CHStrokeClassifier init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_strokeProvider, a3);
    objc_storeStrong((id *)&v12->_strokeClassificationLastResult, a4);
    v12->_forcedStrokeClass = a5;
  }

  return v12;
}

- (id)updatedStrokeClassificationResultByAddingStrokes:(id)a3 removingStrokeIdentifiers:(id)a4 clutterFilter:(id)a5 affectedClutterStrokeIDs:(id)a6 cancellationBlock:(id)a7
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int isHighDensityStroke;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t i;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  int v129;
  id v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t j;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  id v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t k;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  id v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t m;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  CHMutableStrokeClassificationResult *v187;
  CHMutableStrokeClassificationResult *v188;
  void *v190;
  id v191;
  id v192;
  void *v193;
  id obj;
  CHMutableStrokeClassificationResult *v195;
  uint64_t (**v196)(void);
  void *v197;
  void *v198;
  void *v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  uint8_t v223[128];
  uint8_t buf[4];
  uint64_t v225;
  _BYTE v226[128];
  uint64_t v227;

  v227 = *MEMORY[0x1E0C80C00];
  v191 = a3;
  v192 = a4;
  v12 = a5;
  v13 = a6;
  v196 = (uint64_t (**)(void))a7;
  objc_msgSend_strokeClassificationLastResult(self, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_strokeClassificationLastResult(self, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = (CHMutableStrokeClassificationResult *)objc_msgSend_mutableCopy(v25, v26, v27, v28, v29, v30);

  }
  else
  {
    v195 = objc_alloc_init(CHMutableStrokeClassificationResult);
  }
  objc_msgSend_strokeProvider(self, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedStrokes(v36, v37, v38, v39, v40, v41);
  v193 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_set(MEMORY[0x1E0C99E20], v42, v43, v44, v45, v46);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v47, v48, v49, v50, v51);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v199 = (void *)objc_msgSend_mutableCopy(v192, v52, v53, v54, v55, v56);
  v218 = 0u;
  v219 = 0u;
  v216 = 0u;
  v217 = 0u;
  v57 = v13;
  v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v216, (uint64_t)v226, 16, v59);
  if (v65)
  {
    v66 = *(_QWORD *)v217;
    do
    {
      v67 = 0;
      do
      {
        if (*(_QWORD *)v217 != v66)
          objc_enumerationMutation(v57);
        v68 = *(_QWORD *)(*((_QWORD *)&v216 + 1) + 8 * v67);
        objc_msgSend_strokeClassificationLastResult(self, v60, v61, v62, v63, v64);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeClassificationsByStrokeIdentifier(v69, v70, v71, v72, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v75, v76, v68, v77, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        v86 = objc_msgSend_integerValue(v80, v81, v82, v83, v84, v85);
        isHighDensityStroke = objc_msgSend_isHighDensityStroke_(v12, v87, v68, v88, v89, v90);
        if (v86 == 8)
          v96 = 0;
        else
          v96 = isHighDensityStroke;
        if (v96 == 1)
        {
          objc_msgSend_addObject_(v198, v92, v68, v93, v94, v95);
          objc_msgSend_addObject_(v199, v97, v68, v98, v99, v100);
        }
        else
        {
          if (v86 == 8)
            v101 = isHighDensityStroke;
          else
            v101 = 1;
          if ((v101 & 1) == 0)
          {
            v102 = (void *)objc_opt_class();
            objc_msgSend_strokeProvider(self, v103, v104, v105, v106, v107);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeForIdentifier_inStrokeProvider_(v102, v109, v68, (uint64_t)v108, v110, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();

            if (v112)
            {
              objc_msgSend_addObject_(v197, v113, (uint64_t)v112, v114, v115, v116);
            }
            else
            {
              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v117 = (id)qword_1EF568E18[0];
              if (os_log_type_enabled(v117, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v225 = v68;
                _os_log_impl(&dword_1BE607000, v117, OS_LOG_TYPE_FAULT, "Unexpected nil stroke in updatedStrokeClassificationResultByAddingStrokes, encoded stroke identifier is %@. Skipping", buf, 0xCu);
              }

            }
          }
        }

        ++v67;
      }
      while (v65 != v67);
      v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v216, (uint64_t)v226, 16, v64);
    }
    while (v65);
  }

  v214 = 0u;
  v215 = 0u;
  v212 = 0u;
  v213 = 0u;
  obj = v192;
  v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v118, (uint64_t)&v212, (uint64_t)v223, 16, v119);
  if (v120)
  {
    v121 = *(_QWORD *)v213;
    while (2)
    {
      for (i = 0; i != v120; ++i)
      {
        if (*(_QWORD *)v213 != v121)
          objc_enumerationMutation(obj);
        v123 = *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * i);
        if ((v196[2]() & 1) != 0)
        {
          v129 = 1;
          goto LABEL_38;
        }
        objc_msgSend_updateByRemovingStrokeIdentifier_withRemovedAndClutterStrokeIDs_(v195, v124, v123, (uint64_t)v199, v125, v126);
      }
      v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v127, (uint64_t)&v212, (uint64_t)v223, 16, v128);
      if (v120)
        continue;
      break;
    }
  }
  v129 = 0;
LABEL_38:

  v210 = 0u;
  v211 = 0u;
  v208 = 0u;
  v209 = 0u;
  v130 = v198;
  v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v131, (uint64_t)&v208, (uint64_t)v222, 16, v132);
  if (v133)
  {
    v134 = *(_QWORD *)v209;
    while (2)
    {
      for (j = 0; j != v133; ++j)
      {
        if (*(_QWORD *)v209 != v134)
          objc_enumerationMutation(v130);
        v136 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * j);
        if ((v196[2]() & 1) != 0)
        {
          v129 = 1;
          goto LABEL_48;
        }
        objc_msgSend_updateByTransitionedClutterStrokeIdentifier_withRemovedAndClutterStrokeIDs_(v195, v137, v136, (uint64_t)v199, v138, v139);
      }
      v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v140, (uint64_t)&v208, (uint64_t)v222, 16, v141);
      if (v133)
        continue;
      break;
    }
    v129 = 0;
  }
LABEL_48:
  v190 = v130;

  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  v142 = v191;
  v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v143, (uint64_t)&v204, (uint64_t)v221, 16, v144);
  if (v145)
  {
    v146 = *(_QWORD *)v205;
    while (2)
    {
      for (k = 0; k != v145; ++k)
      {
        if (*(_QWORD *)v205 != v146)
          objc_enumerationMutation(v142);
        v150 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * k);
        if ((v196[2]() & 1) != 0)
        {
          v129 = 1;
          goto LABEL_61;
        }
        objc_msgSend_encodedStrokeIdentifier(v150, v151, v152, v153, v154, v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = objc_msgSend_isHighDensityStroke_(v12, v157, (uint64_t)v156, v158, v159, v160);

        if (v161)
        {
          objc_msgSend_updateByAddingClutterStroke_(v195, v162, (uint64_t)v150, v164, v165, v166);
        }
        else
        {
          v167 = objc_msgSend_forcedStrokeClass(self, v162, v163, v164, v165, v166);
          objc_msgSend_updateByAddingNonClutterStroke_withAllStrokes_forceClass_(v195, v168, (uint64_t)v150, (uint64_t)v193, v167, v169);
        }
      }
      v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v148, (uint64_t)&v204, (uint64_t)v221, 16, v149);
      if (v145)
        continue;
      break;
    }
    v129 = 0;
  }
LABEL_61:

  v202 = 0u;
  v203 = 0u;
  v200 = 0u;
  v201 = 0u;
  v170 = v197;
  v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v170, v171, (uint64_t)&v200, (uint64_t)v220, 16, v172);
  if (v173)
  {
    v174 = *(_QWORD *)v201;
    while (2)
    {
      for (m = 0; m != v173; ++m)
      {
        if (*(_QWORD *)v201 != v174)
          objc_enumerationMutation(v170);
        v176 = *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * m);
        if (v196[2]())
        {

          goto LABEL_72;
        }
        v182 = objc_msgSend_forcedStrokeClass(self, v177, v178, v179, v180, v181);
        objc_msgSend_updateByAddingNonClutterStroke_withAllStrokes_forceClass_(v195, v183, v176, (uint64_t)v193, v182, v184);
      }
      v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v170, v185, (uint64_t)&v200, (uint64_t)v220, 16, v186);
      if (v173)
        continue;
      break;
    }

    v187 = v195;
  }
  else
  {

    v187 = v195;
    if (v129)
LABEL_72:
      v187 = 0;
  }
  v188 = v187;

  return v188;
}

- (id)refineStrokeClassificationResultUsingClassificationResult:(id)a3 strokeClassificationModel:(id)a4 sortedAddedStrokes:(id)a5 removedStrokeIdentifiers:(id)a6 cancellationBlock:(id)a7
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char isStrokeClassificationText;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t i;
  id v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t j;
  void *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  id v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t k;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  double v230;
  double v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  float v286;
  float v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  uint64_t v312;
  int v313;
  _BOOL4 v314;
  uint64_t v315;
  BOOL v316;
  int v317;
  int v318;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t m;
  uint64_t v352;
  void *v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  void *v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  char isScriptClassificationMath;
  char v370;
  void *v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  double v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  double v406;
  double v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  double v413;
  double v414;
  double v415;
  _BOOL4 v416;
  int v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  void *v423;
  const char *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  void *v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  const char *v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  double v454;
  double v455;
  _BOOL4 v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  double v467;
  double v468;
  uint64_t v469;
  id v470;
  const char *v471;
  uint64_t v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t n;
  void *v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  void *v485;
  const char *v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  const char *v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  void *v495;
  void *v497;
  void *v498;
  id v499;
  void *v500;
  int v501;
  _BOOL4 v502;
  int v503;
  id v504;
  void *v505;
  void *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  void *v510;
  uint64_t v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  id obj;
  id obja;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  _BYTE v547[128];
  _BYTE v548[128];
  _BYTE v549[128];
  _BYTE v550[128];
  _BYTE v551[128];
  uint8_t v552[128];
  uint8_t buf[4];
  uint64_t v554;
  uint64_t v555;

  v555 = *MEMORY[0x1E0C80C00];
  objc_msgSend_refineStrokeClassificationResultUsingClassificationResultScript_strokeClassificationModel_sortedAddedStrokes_removedStrokeIdentifiers_cancellationBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7);
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  v512 = (void *)objc_msgSend_mutableCopy(v498, v7, v8, v9, v10, v11);
  objc_msgSend_set(MEMORY[0x1E0C99E20], v12, v13, v14, v15, v16);
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v17, v18, v19, v20, v21);
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  v525 = 0u;
  v526 = 0u;
  v523 = 0u;
  v524 = 0u;
  objc_msgSend_scriptClassificationsByStrokeIdentifier(v512, v22, v23, v24, v25, v26);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v523, (uint64_t)v548, 16, v28);
  if (v34)
  {
    v35 = *(_QWORD *)v524;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v524 != v35)
          objc_enumerationMutation(obj);
        v37 = *(_QWORD *)(*((_QWORD *)&v523 + 1) + 8 * v36);
        objc_msgSend_scriptClassificationsByStrokeIdentifier(v512, v29, v30, v31, v32, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v38, v39, v37, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend_integerValue(v43, v44, v45, v46, v47, v48);

        v50 = (void *)objc_opt_class();
        objc_msgSend_strokeProvider(self, v51, v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeForIdentifier_inStrokeProvider_(v50, v57, v37, (uint64_t)v56, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          objc_msgSend_strokeClassificationsByStrokeIdentifier(v512, v61, v62, v63, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_encodedStrokeIdentifier(v60, v67, v68, v69, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v66, v73, (uint64_t)v72, v74, v75, v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend_integerValue(v77, v78, v79, v80, v81, v82);

          if (v49 == 1)
          {
            sub_1BE871570((uint64_t)v512, v60, 2);
            v88 = (void *)objc_opt_class();
            isStrokeClassificationText = objc_msgSend_isStrokeClassificationText_(v88, v89, v83, v90, v91, v92);
            goto LABEL_9;
          }
          if (objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v84, v49, v85, v86, v87))
          {
            if (_os_feature_enabled_impl())
              v99 = 3;
            else
              v99 = 1;
            sub_1BE871570((uint64_t)v512, v60, v99);
            v100 = (void *)objc_opt_class();
            if ((objc_msgSend_isStrokeClassificationMath_(v100, v101, v83, v102, v103, v104) & 1) == 0)
              goto LABEL_23;
          }
          else
          {
            if (v49 != 8)
            {
              sub_1BE871570((uint64_t)v512, v60, 1);
              v105 = (void *)objc_opt_class();
              isStrokeClassificationText = objc_msgSend_isStrokeClassificationText_(v105, v106, v83, v107, v108, v109);
LABEL_9:
              if ((isStrokeClassificationText & 1) != 0)
                goto LABEL_16;
              goto LABEL_23;
            }
            if ((unint64_t)(v83 - 8) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              sub_1BE871570((uint64_t)v512, v60, 5);
LABEL_23:
              objc_msgSend_addObject_(v505, v94, v37, v95, v96, v97);
            }
          }
        }
        else
        {
          objc_msgSend_addObject_(v506, v61, v37, v63, v64, v65);
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v98 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v554 = v37;
            _os_log_impl(&dword_1BE607000, v98, OS_LOG_TYPE_ERROR, "Unexpected nil stroke in Stroke Classification, encoded stoke identifier is %@. Skipping.", buf, 0xCu);
          }

        }
LABEL_16:

        ++v36;
      }
      while (v34 != v36);
      v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v523, (uint64_t)v548, 16, v33);
      v34 = v110;
    }
    while (v110);
  }

  if (objc_msgSend_count(v506, v111, v112, v113, v114, v115))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v121 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
    {
      v127 = objc_msgSend_count(v506, v122, v123, v124, v125, v126);
      *(_DWORD *)buf = 134217984;
      v554 = v127;
      _os_log_impl(&dword_1BE607000, v121, OS_LOG_TYPE_ERROR, "Removing %lu invalid nil strokes in Stroke Classification", buf, 0xCu);
    }

    v521 = 0u;
    v522 = 0u;
    v519 = 0u;
    v520 = 0u;
    v128 = v506;
    v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v129, (uint64_t)&v519, (uint64_t)v547, 16, v130);
    if (v134)
    {
      v135 = *(_QWORD *)v520;
      do
      {
        for (i = 0; i != v134; ++i)
        {
          if (*(_QWORD *)v520 != v135)
            objc_enumerationMutation(v128);
          objc_msgSend_updateByRemovingStrokeIdentifier_withRemovedAndClutterStrokeIDs_(v512, v131, *(_QWORD *)(*((_QWORD *)&v519 + 1) + 8 * i), (uint64_t)v128, v132, v133);
        }
        v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v131, (uint64_t)&v519, (uint64_t)v547, 16, v133);
      }
      while (v134);
    }

  }
  v137 = (id)objc_msgSend_copy(v512, v116, v117, v118, v119, v120);
  v499 = v505;
  v497 = v137;
  if (!self)
  {
    v495 = 0;
    goto LABEL_161;
  }
  v143 = (void *)objc_msgSend_mutableCopy(v137, v138, v139, v140, v141, v142);
  v545 = 0u;
  v546 = 0u;
  v543 = 0u;
  v544 = 0u;
  objc_msgSend_nontextCandidates(v143, v144, v145, v146, v147, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v150, (uint64_t)&v543, (uint64_t)buf, 16, v151);
  if (v157)
  {
    v158 = *(_QWORD *)v544;
    do
    {
      for (j = 0; j != v157; ++j)
      {
        if (*(_QWORD *)v544 != v158)
          objc_enumerationMutation(v149);
        v160 = *(void **)(*((_QWORD *)&v543 + 1) + 8 * j);
        objc_msgSend_scriptClassificationsByStrokeIdentifier(v143, v152, v153, v154, v155, v156);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIdentifier(v160, v162, v163, v164, v165, v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v161, v168, (uint64_t)v167, v169, v170, v171);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = objc_msgSend_integerValue(v172, v173, v174, v175, v176, v177);

        if (v178 == 1)
        {
          objc_msgSend_setFallbackClassification_(v160, v179, 2, v180, v181, v182);
        }
        else if (v178 == 8)
        {
          objc_msgSend_setFallbackClassification_(v160, v179, 5, v180, v181, v182);
        }
        else if (objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v179, v178, v180, v181, v182))
        {
          objc_msgSend_setFallbackClassification_(v160, v183, 3, v184, v185, v186);
        }
        else
        {
          objc_msgSend_setFallbackClassification_(v160, v183, 1, v184, v185, v186);
        }
      }
      v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v152, (uint64_t)&v543, (uint64_t)buf, 16, v156);
    }
    while (v157);
  }

  v541 = 0u;
  v542 = 0u;
  v539 = 0u;
  v540 = 0u;
  v187 = v499;
  v194 = objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v188, (uint64_t)&v539, (uint64_t)v552, 16, v189);
  if (v194)
  {
    v195 = *(_QWORD *)v540;
    do
    {
      for (k = 0; k != v194; ++k)
      {
        if (*(_QWORD *)v540 != v195)
          objc_enumerationMutation(v187);
        objc_msgSend_strokeIdentifierFromData_(self->_strokeProvider, v190, *(_QWORD *)(*((_QWORD *)&v539 + 1) + 8 * k), v191, v192, v193);
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeForIdentifier_(self->_strokeProvider, v198, (uint64_t)v197, v199, v200, v201);
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_updateNonTextCandidatesSupportFromStroke_(v143, v203, (uint64_t)v202, v204, v205, v206);

      }
      v194 = objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v190, (uint64_t)&v539, (uint64_t)v552, 16, v193);
    }
    while (v194);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v207, v208, v209, v210, v211);
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  v537 = 0u;
  v538 = 0u;
  v535 = 0u;
  v536 = 0u;
  objc_msgSend_nontextCandidates(v143, v212, v213, v214, v215, v216);
  v504 = (id)objc_claimAutoreleasedReturnValue();
  v509 = objc_msgSend_countByEnumeratingWithState_objects_count_(v504, v217, (uint64_t)&v535, (uint64_t)v551, 16, v218);
  if (!v509)
    goto LABEL_153;
  v507 = *(_QWORD *)v536;
  do
  {
    v511 = 0;
    while (2)
    {
      if (*(_QWORD *)v536 != v507)
        objc_enumerationMutation(v504);
      v224 = *(void **)(*((_QWORD *)&v535 + 1) + 8 * v511);
      if ((objc_msgSend_isLongHorizontalNonTextLine(v224, v219, v220, v221, v222, v223) & 1) == 0)
        goto LABEL_68;
      objc_msgSend_supportingStrokeIdentifiers(v224, v219, v220, v221, v222, v223);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sizeRatioFromStrokes_(v224, v226, (uint64_t)v225, v227, v228, v229);
      v231 = v230;
      v515 = v224;

      if (v231 < 0.25)
        goto LABEL_68;
      objc_msgSend_scriptClassificationsByStrokeIdentifier(v143, v219, v220, v221, v222, v223);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIdentifier(v224, v233, v234, v235, v236, v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v232, v239, (uint64_t)v238, v240, v241, v242);
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      v508 = objc_msgSend_integerValue(v243, v244, v245, v246, v247, v248);

      objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v143, v249, v250, v251, v252, v253);
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIdentifier(v515, v255, v256, v257, v258, v259);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v254, v261, (uint64_t)v260, v262, v263, v264);
      v510 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_probabilityByScriptClassifications(v510, v265, v266, v267, v268, v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v271, v508, v272, v273, v274);
      v275 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v270, v276, v275, v277, v278, v279);
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v280, v281, v282, v283, v284, v285);
      v287 = v286;

      objc_msgSend_orderedScriptClassification(v510, v288, v289, v290, v291, v292);
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v275) = objc_msgSend_count(v293, v294, v295, v296, v297, v298) == 0;

      if ((v275 & 1) != 0)
      {
        v310 = 0;
        v311 = v515;
        v312 = v508;
        if (v508 == 16)
        {
LABEL_75:
          v503 = 0;
          v313 = 0;
          v314 = 1;
          goto LABEL_100;
        }
      }
      else
      {
        objc_msgSend_scriptClassificationAtIndex_(v510, v299, 1, v301, v302, v303);
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        v310 = objc_msgSend_integerValue(v304, v305, v306, v307, v308, v309);

        v311 = v515;
        v312 = v508;
        if (v508 == 16)
          goto LABEL_75;
      }
      if (v312 == 8 || v310 != 16 || v287 >= 0.8)
      {
        v315 = v508;
        v314 = v231 > 0.7 && v508 == 7;
        if (v508 != 15)
        {
LABEL_81:
          v316 = v315 == 8 && v310 == 15;
          v317 = v316;
          v503 = v317;
          v318 = v316 || v314;
          if (v318 != 1)
            goto LABEL_67;
          v313 = 0;
          goto LABEL_100;
        }
      }
      else
      {
        v314 = 1;
        v315 = v508;
        if (v508 != 15)
          goto LABEL_81;
      }
      v503 = 1;
      v313 = 1;
LABEL_100:
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v299, v300, v301, v302, v303);
      v513 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v320, v321, v322, v323, v324);
      obja = (id)objc_claimAutoreleasedReturnValue();
      v501 = v313;
      v502 = v314;
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v325, v326, v327, v328, v329);
      v514 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v330, v331, v332, v333, v334);
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      v533 = 0u;
      v534 = 0u;
      v531 = 0u;
      v532 = 0u;
      objc_msgSend_supportingStrokeIdentifiers(v311, v336, v337, v338, v339, v340);
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      v349 = objc_msgSend_countByEnumeratingWithState_objects_count_(v341, v342, (uint64_t)&v531, (uint64_t)v550, 16, v343);
      if (!v349)
        goto LABEL_120;
      v350 = *(_QWORD *)v532;
      do
      {
        for (m = 0; m != v349; ++m)
        {
          if (*(_QWORD *)v532 != v350)
            objc_enumerationMutation(v341);
          v352 = *(_QWORD *)(*((_QWORD *)&v531 + 1) + 8 * m);
          objc_msgSend_scriptClassificationsByStrokeIdentifier(v143, v344, v345, v346, v347, v348);
          v353 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v353, v354, v352, v355, v356, v357);
          v358 = (void *)objc_claimAutoreleasedReturnValue();
          v364 = objc_msgSend_integerValue(v358, v359, v360, v361, v362, v363);

          isScriptClassificationMath = objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v365, v364, v366, v367, v368);
          if (v364 == 8)
            v370 = 1;
          else
            v370 = isScriptClassificationMath;
          v371 = v335;
          if ((v370 & 1) == 0)
          {
LABEL_103:
            objc_msgSend_addObject_(v371, v344, v352, v346, v347, v348);
            continue;
          }
          if ((v364 & 0xFFFFFFFFFFFFFFFELL) == 0xE)
          {
            objc_msgSend_strokeProvider(self, v344, v345, v346, v347, v348);
            v372 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v373, v352, (uint64_t)v372, v374, v375);
            v376 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend_isHorizontalAlignedWithStroke_(v515, v377, (uint64_t)v376, v378, v379, v380))
              objc_msgSend_addObject_(v514, v381, v352, v382, v383, v384);
            else
              objc_msgSend_addObject_(obja, v381, v352, v382, v383, v384);

          }
          else if ((v364 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
          {
            objc_msgSend_addObject_(obja, v344, v352, v346, v347, v348);
            v371 = v513;
            if (v364 == 13)
              goto LABEL_103;
          }
        }
        v349 = objc_msgSend_countByEnumeratingWithState_objects_count_(v341, v344, (uint64_t)&v531, (uint64_t)v550, 16, v348);
      }
      while (v349);
LABEL_120:

      objc_msgSend_support(v515, v385, v386, v387, v388, v389);
      if (v395 >= 0.0)
      {
        v417 = 1;
        goto LABEL_127;
      }
      if (!objc_msgSend_count(obja, v390, v391, v392, v393, v394))
      {
        v407 = 0.0;
        if (v502)
          goto LABEL_123;
LABEL_135:
        if (!v503)
          goto LABEL_133;
        if (objc_msgSend_count(v513, v396, v397, v398, v399, v400))
        {
          objc_msgSend_supportFromStrokes_(v515, v390, (uint64_t)v513, v392, v393, v394);
          v455 = v454 / (double)(unint64_t)objc_msgSend_count(v513, v449, v450, v451, v452, v453);
          if (v407 != 0.0)
          {
LABEL_138:
            v456 = v455 / v407 > 0.7;
LABEL_151:
            v417 = !v456;
            goto LABEL_127;
          }
        }
        else
        {
          v455 = 0.0;
          if (v407 != 0.0)
            goto LABEL_138;
        }
        v456 = 0;
        goto LABEL_151;
      }
      objc_msgSend_supportFromStrokes_(v515, v396, (uint64_t)obja, v398, v399, v400);
      v407 = v406 / (double)(unint64_t)objc_msgSend_count(obja, v401, v402, v403, v404, v405);
      if (!v502)
        goto LABEL_135;
LABEL_123:
      if (objc_msgSend_count(v335, v396, v397, v398, v399, v400)
        && (objc_msgSend_supportFromStrokes_(v515, v408, (uint64_t)v335, v410, v411, v412), v414 = v413, v413 > 0.0))
      {
        objc_msgSend_support(v515, v408, v409, v410, v411, v412);
        v416 = v414 / fabs(v415) > 0.15;
      }
      else
      {
        v416 = 0;
      }
      if (objc_msgSend_count(v514, v408, v409, v410, v411, v412))
      {
        objc_msgSend_supportFromStrokes_(v515, v457, (uint64_t)v514, v459, v460, v461);
        v468 = v467 / (double)(unint64_t)objc_msgSend_count(v514, v462, v463, v464, v465, v466);
      }
      else
      {
        v468 = 0.0;
      }
      if (objc_msgSend_count(obja, v457, v458, v459, v460, v461)
        || !objc_msgSend_count(v514, v390, v469, v392, v393, v394))
      {
        if (v407 == 0.0)
          v417 = v416;
        else
          v417 = v468 / v407 > 0.32 || v416;
      }
      else
      {
        v417 = v416 | 1;
      }
LABEL_127:
      if (v417 && v508 != 8)
      {
        objc_msgSend_setFallbackClassification_(v515, v390, 5, v392, v393, v394);
        objc_msgSend_strokeIdentifier(v515, v418, v419, v420, v421, v422);
        v423 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BE8714D4((uint64_t)v143, v423, 6);

        objc_msgSend_strokeIdentifier(v515, v424, v425, v426, v427, v428);
        v429 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v500, v430, (uint64_t)v429, v431, v432, v433);
        goto LABEL_132;
      }
      if (((v501 | v417 | v503 ^ 1) & 1) == 0)
      {
        objc_msgSend_setFallbackClassification_(v515, v390, 3, v392, v393, v394);
        objc_msgSend_strokeIdentifier(v515, v434, v435, v436, v437, v438);
        v439 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BE8714D4((uint64_t)v143, v439, 3);

        objc_msgSend_strokeIdentifier(v515, v440, v441, v442, v443, v444);
        v429 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v500, v445, (uint64_t)v429, v446, v447, v448);
LABEL_132:

      }
LABEL_133:

LABEL_67:
LABEL_68:
      if (++v511 != v509)
        continue;
      break;
    }
    v509 = objc_msgSend_countByEnumeratingWithState_objects_count_(v504, v219, (uint64_t)&v535, (uint64_t)v551, 16, v223);
  }
  while (v509);
LABEL_153:

  v529 = 0u;
  v530 = 0u;
  v527 = 0u;
  v528 = 0u;
  v470 = v500;
  v477 = objc_msgSend_countByEnumeratingWithState_objects_count_(v470, v471, (uint64_t)&v527, (uint64_t)v549, 16, v472);
  if (v477)
  {
    v478 = *(_QWORD *)v528;
    do
    {
      for (n = 0; n != v477; ++n)
      {
        if (*(_QWORD *)v528 != v478)
          objc_enumerationMutation(v470);
        objc_msgSend_strokeIdentifierFromData_(self->_strokeProvider, v473, *(_QWORD *)(*((_QWORD *)&v527 + 1) + 8 * n), v474, v475, v476);
        v480 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeForIdentifier_(self->_strokeProvider, v481, (uint64_t)v480, v482, v483, v484);
        v485 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_updateNonTextCandidatesSupportFromStroke_(v143, v486, (uint64_t)v485, v487, v488, v489);

      }
      v477 = objc_msgSend_countByEnumeratingWithState_objects_count_(v470, v473, (uint64_t)&v527, (uint64_t)v549, 16, v476);
    }
    while (v477);
  }

  v495 = (void *)objc_msgSend_copy(v143, v490, v491, v492, v493, v494);
LABEL_161:

  return v495;
}

- (id)refineStrokeClassificationResultUsingClassificationResultScript:(id)a3 strokeClassificationModel:(id)a4 sortedAddedStrokes:(id)a5 removedStrokeIdentifiers:(id)a6 cancellationBlock:(id)a7
{
  id v11;
  id v12;
  uint64_t (**v13)(void);
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double MidY;
  uint64_t j;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  CGFloat *v86;
  uint64_t k;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t m;
  double v139;
  uint64_t n;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
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
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
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
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  id v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  int v239;
  id v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  unint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  int v252;
  double v253;
  double v254;
  unint64_t v255;
  unint64_t v256;
  uint8x8_t v257;
  double **v258;
  double *v259;
  unint64_t v260;
  unint64_t v261;
  double *v262;
  float v263;
  _QWORD *v264;
  double **v265;
  _BOOL8 v266;
  unint64_t v267;
  unint64_t v268;
  size_t prime;
  unint64_t v270;
  uint8x8_t v271;
  uint64_t v272;
  unint64_t v273;
  unint64_t v274;
  const char *v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  id v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  _QWORD *v288;
  CHStrokeClassifier *v289;
  const double *v290;
  float64x2_t v291;
  int64x2_t v292;
  uint64_t v293;
  char *v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t ii;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  double v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  id v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  int v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  id v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  void *v377;
  unint64_t jj;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  void *v383;
  const char *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  CHScriptClassificationRawResult *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  void *v423;
  const char *v424;
  uint64_t v425;
  uint64_t v426;
  void *v427;
  const char *v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  void *v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  void *v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  void *v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  void *v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  void *v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  void *v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  void *v484;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  void *v490;
  const char *v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  void *v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  int64x2_t v501;
  uint64_t v502;
  void *v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  const char *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  void *v517;
  const char *v518;
  uint64_t v519;
  uint64_t v520;
  const char *v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  void *v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  const char *v530;
  uint64_t v531;
  const char *v532;
  uint64_t v533;
  void *v534;
  const char *v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  const char *v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  void *v553;
  void *v554;
  const char *v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  const char *v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  void *v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  void *v571;
  const char *v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  const char *v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  void *v581;
  const char *v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  void *v586;
  uint64_t v587;
  const char *v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  void *v592;
  const char *v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  void *v598;
  const char *v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  const char *v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  void *v608;
  const char *v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  const char *v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  NSObject *v619;
  const char *v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  void *v625;
  const char *v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  void *v630;
  const char *v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  NSObject *v637;
  const char *v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  const char *v644;
  uint64_t v645;
  char v646;
  const char *v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  uint64_t v655;
  void *v656;
  void *v657;
  unint64_t kk;
  const char *v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  void *v663;
  const char *v664;
  uint64_t v665;
  uint64_t v666;
  uint64_t v667;
  const char *v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  const char *v674;
  uint64_t v675;
  uint64_t v676;
  uint64_t v677;
  uint64_t v678;
  id v679;
  const char *v680;
  uint64_t v681;
  uint64_t v682;
  uint64_t v683;
  void *v684;
  _QWORD *v685;
  uint64_t v686;
  void *v687;
  double v688;
  const char *v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  uint64_t v693;
  void *v694;
  const char *v695;
  uint64_t v696;
  uint64_t v697;
  CHScriptClassificationRawResult *v698;
  const char *v699;
  uint64_t v700;
  uint64_t v701;
  uint64_t v702;
  void *v703;
  const char *v704;
  uint64_t v705;
  uint64_t v706;
  uint64_t v707;
  void *v708;
  const char *v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  const char *v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t v719;
  void *v720;
  const char *v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  void *v725;
  const char *v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  void *v730;
  const char *v731;
  uint64_t v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  float v736;
  float v737;
  const char *v738;
  uint64_t v739;
  uint64_t v740;
  uint64_t v741;
  uint64_t v742;
  const char *v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  uint64_t v747;
  double v748;
  uint64_t v749;
  void *v750;
  const char *v751;
  uint64_t v752;
  uint64_t v753;
  uint64_t v754;
  uint64_t v755;
  const char *v756;
  uint64_t v757;
  uint64_t v758;
  uint64_t v759;
  uint64_t v760;
  void *v761;
  const char *v762;
  uint64_t v763;
  const char *v764;
  uint64_t v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  uint64_t v769;
  uint64_t v770;
  uint64_t mm;
  void *v772;
  void *v773;
  const char *v774;
  uint64_t v775;
  uint64_t v776;
  uint64_t v777;
  uint64_t v778;
  void *v779;
  const char *v780;
  uint64_t v781;
  uint64_t v782;
  uint64_t v783;
  char isEqual;
  int v785;
  const char *v786;
  uint64_t v787;
  uint64_t v788;
  uint64_t v789;
  uint64_t v790;
  void *v791;
  const char *v792;
  uint64_t v793;
  uint64_t v794;
  uint64_t v795;
  void *v796;
  const char *v797;
  uint64_t v798;
  uint64_t v799;
  uint64_t v800;
  int v801;
  uint64_t v802;
  const char *v803;
  uint64_t v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  void *v808;
  const char *v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t v812;
  uint64_t v813;
  const char *v814;
  uint64_t v815;
  const char *v816;
  uint64_t v817;
  uint64_t v818;
  uint64_t v819;
  uint64_t v820;
  void *v821;
  void *v822;
  _QWORD *v823;
  _QWORD *v824;
  void *v825;
  void *v827;
  void *v828;
  void *v829;
  id v830;
  uint64_t v831;
  uint64_t v832;
  id v833;
  id v834;
  void *v835;
  float64x2_t v836;
  char v837;
  id v838;
  uint64_t v839;
  char v840;
  id v841;
  uint64_t v842;
  void *v843;
  void *v844;
  void *v845;
  uint64_t v846;
  uint64_t (**v847)(void);
  id v848;
  _QWORD *v849;
  uint64_t v850;
  void *v851;
  float64x2_t v852;
  void *v853;
  void *v854;
  void *v855;
  uint64_t v856;
  void *v857;
  id obj;
  void *v860;
  __int128 v861;
  __int128 v862;
  __int128 v863;
  __int128 v864;
  _QWORD v865[5];
  __int128 v866;
  __int128 v867;
  __int128 v868;
  __int128 v869;
  __int128 v870;
  __int128 v871;
  __int128 v872;
  __int128 v873;
  __int128 v874;
  __int128 v875;
  __int128 v876;
  __int128 v877;
  __int128 v878;
  __int128 v879;
  __int128 v880;
  __int128 v881;
  __int128 v882;
  __int128 v883;
  __int128 v884;
  __int128 v885;
  __int128 v886;
  __int128 v887;
  __int128 v888;
  __int128 v889;
  void *v890[2];
  void *__p[2];
  float v892;
  _BYTE v893[128];
  __int128 buf;
  uint64_t v895;
  _BYTE v896[128];
  _BYTE v897[128];
  _BYTE v898[128];
  _BYTE v899[128];
  _BYTE v900[128];
  _BYTE v901[128];
  uint64_t v902;
  CGRect v903;
  CGRect v904;
  CGRect v905;
  CGRect v906;
  CGRect v907;
  CGRect v908;
  CGRect v909;

  v902 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v848 = a4;
  v12 = a5;
  v830 = a6;
  v13 = (uint64_t (**)(void))a7;
  v860 = v11;
  v829 = v12;
  if (!v11)
  {
    v282 = 0;
    goto LABEL_292;
  }
  v847 = v13;
  *(_OWORD *)v890 = 0u;
  *(_OWORD *)__p = 0u;
  v892 = 1.0;
  v886 = 0u;
  v887 = 0u;
  v888 = 0u;
  v889 = 0u;
  obj = v12;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v886, (uint64_t)v901, 16, v15);
  if (!v21)
    goto LABEL_24;
  v22 = *(_QWORD *)v887;
  if (self)
  {
    while (1)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v887 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v886 + 1) + 8 * i);
        objc_msgSend_strokeClassificationsByStrokeIdentifier(v860, v16, v17, v18, v19, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_encodedStrokeIdentifier(v24, v26, v27, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v25, v32, (uint64_t)v31, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = objc_msgSend_integerValue(v36, v37, v38, v39, v40, v41);
        v43 = v24;
        v49 = v43;
        if (v42 == 8)
        {

          goto LABEL_16;
        }
        if ((v42 & 0xFFFFFFFFFFFFFFFELL) != 6
          && (v42 != 5 || (objc_msgSend_strokeAttributes(v43, v44, v45, v46, v47, v48) & 2) == 0))
        {

LABEL_15:
          objc_msgSend_bounds(v49, v51, v52, v53, v54, v55);
          MidY = CGRectGetMidY(v903);
          sub_1BE8781EC((uint64_t)v890, MidY, MidY);
          goto LABEL_16;
        }
        v50 = _os_feature_enabled_impl();

        if (v50)
          goto LABEL_15;
LABEL_16:

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v886, (uint64_t)v901, 16, v20);
      if (!v21)
        goto LABEL_24;
    }
  }
  do
  {
    for (j = 0; j != v21; ++j)
    {
      if (*(_QWORD *)v887 != v22)
        objc_enumerationMutation(obj);
      v58 = *(void **)(*((_QWORD *)&v886 + 1) + 8 * j);
      objc_msgSend_strokeClassificationsByStrokeIdentifier(v11, v16, v17, v18, v19, v20);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodedStrokeIdentifier(v58, v60, v61, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v59, v66, (uint64_t)v65, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_integerValue(v70, v71, v72, v73, v74, v75);
    }
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v886, (uint64_t)v901, 16, v20);
  }
  while (v21);
LABEL_24:

  v884 = 0u;
  v885 = 0u;
  v882 = 0u;
  v883 = 0u;
  v76 = v830;
  v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v882, (uint64_t)v900, 16, v78);
  if (v84)
  {
    v85 = *(_QWORD *)v883;
    if (self)
    {
      v86 = (CGFloat *)MEMORY[0x1E0C9D628];
      do
      {
        for (k = 0; k != v84; ++k)
        {
          if (*(_QWORD *)v883 != v85)
            objc_enumerationMutation(v76);
          v88 = *(_QWORD *)(*((_QWORD *)&v882 + 1) + 8 * k);
          objc_msgSend_strokeClassificationLastResult(self, v79, v80, v81, v82, v83);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeClassificationsByStrokeIdentifier(v89, v90, v91, v92, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v95, v96, v88, v97, v98, v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          if (v100)
          {
            v106 = objc_msgSend_integerValue(v100, v101, v102, v103, v104, v105);
            if (v106 != 8
              && ((v106 & 0xFFFFFFFFFFFFFFFELL) != 6
               && (v106 != 5 || (objc_msgSend_strokeAttributes(0, v107, v108, v109, v110, v111) & 2) == 0)
               || _os_feature_enabled_impl()))
            {
              objc_msgSend_strokeClassificationLastResult(self, v107, v108, v109, v110, v111);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_substrokesByStrokeIdentifier(v112, v113, v114, v115, v116, v117);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v118, v119, v88, v120, v121, v122);
              v123 = (void *)objc_claimAutoreleasedReturnValue();

              x = *v86;
              y = v86[1];
              width = v86[2];
              height = v86[3];
              v878 = 0u;
              v879 = 0u;
              v880 = 0u;
              v881 = 0u;
              v128 = v123;
              v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v129, (uint64_t)&v878, (uint64_t)v899, 16, v130);
              if (v136)
              {
                v137 = *(_QWORD *)v879;
                do
                {
                  for (m = 0; m != v136; ++m)
                  {
                    if (*(_QWORD *)v879 != v137)
                      objc_enumerationMutation(v128);
                    objc_msgSend_bounds(*(void **)(*((_QWORD *)&v878 + 1) + 8 * m), v131, v132, v133, v134, v135);
                    v909.origin.x = x;
                    v909.origin.y = y;
                    v909.size.width = width;
                    v909.size.height = height;
                    v905 = CGRectUnion(v904, v909);
                    x = v905.origin.x;
                    y = v905.origin.y;
                    width = v905.size.width;
                    height = v905.size.height;
                  }
                  v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v131, (uint64_t)&v878, (uint64_t)v899, 16, v135);
                }
                while (v136);
              }

              v906.origin.x = x;
              v906.origin.y = y;
              v906.size.width = width;
              v906.size.height = height;
              v139 = CGRectGetMidY(v906);
              sub_1BE8781EC((uint64_t)v890, v139, v139);

            }
          }

        }
        v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v79, (uint64_t)&v882, (uint64_t)v900, 16, v83);
      }
      while (v84);
    }
    else
    {
      do
      {
        for (n = 0; n != v84; ++n)
        {
          if (*(_QWORD *)v883 != v85)
            objc_enumerationMutation(v76);
          v141 = *(_QWORD *)(*((_QWORD *)&v882 + 1) + 8 * n);
          objc_msgSend_strokeClassificationLastResult(0, v79, v80, v81, v82, v83);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeClassificationsByStrokeIdentifier(v142, v143, v144, v145, v146, v147);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v148, v149, v141, v150, v151, v152);
          v153 = (void *)objc_claimAutoreleasedReturnValue();

          if (v153)
            objc_msgSend_integerValue(v153, v154, v155, v156, v157, v158);

        }
        v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v79, (uint64_t)&v882, (uint64_t)v900, 16, v83);
      }
      while (v84);
    }
  }

  objc_msgSend_strokeProvider(self, v159, v160, v161, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedStrokes(v164, v165, v166, v167, v168, v169);
  v827 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v170, v171, v172, v173, v174);
  v835 = (void *)objc_claimAutoreleasedReturnValue();
  v876 = 0u;
  v877 = 0u;
  v874 = 0u;
  v875 = 0u;
  v841 = v827;
  v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v841, v175, (uint64_t)&v874, (uint64_t)v898, 16, v176);
  if (v177)
  {
    v856 = *(_QWORD *)v875;
LABEL_57:
    v178 = 0;
    while (1)
    {
      if (*(_QWORD *)v875 != v856)
        objc_enumerationMutation(v841);
      v179 = *(void **)(*((_QWORD *)&v874 + 1) + 8 * v178);
      if ((v847[2]() & 1) != 0)
        goto LABEL_147;
      objc_msgSend_strokeClassificationsByStrokeIdentifier(v860, v180, v181, v182, v183, v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodedStrokeIdentifier(v179, v186, v187, v188, v189, v190);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v185, v192, (uint64_t)v191, v193, v194, v195);
      v196 = (void *)objc_claimAutoreleasedReturnValue();

      if (v196)
        break;
LABEL_145:

      if (++v178 == v177)
      {
        v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v841, v275, (uint64_t)&v874, (uint64_t)v898, 16, v276);
        if (v177)
          goto LABEL_57;
        goto LABEL_147;
      }
    }
    v207 = objc_msgSend_integerValue(v196, v197, v198, v199, v200, v201);
    if (v207 != 8)
      objc_msgSend_addObject_(v835, v202, (uint64_t)v179, v204, v205, v206);
    objc_msgSend_strokeClassificationLastResult(self, v202, v203, v204, v205, v206);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeClassificationsByStrokeIdentifier(v208, v209, v210, v211, v212, v213);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodedStrokeIdentifier(v179, v215, v216, v217, v218, v219);
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v214, v221, (uint64_t)v220, v222, v223, v224);
    v225 = (void *)objc_claimAutoreleasedReturnValue();

    if (v225)
    {
      v231 = objc_msgSend_integerValue(v225, v226, v227, v228, v229, v230);
      v232 = v179;
      v238 = v232;
      v239 = 0;
      if (self && v231 != 8)
      {
        if ((v231 & 0xFFFFFFFFFFFFFFFELL) == 6
          || v231 == 5 && (objc_msgSend_strokeAttributes(v232, v233, v234, v235, v236, v237) & 2) != 0)
        {
          v239 = _os_feature_enabled_impl();
        }
        else
        {
          v239 = 1;
        }
      }

      v240 = v238;
      v246 = (unint64_t)v240;
      if (self == 0 || v207 == 8)
      {

        if ((v239 & 1) == 0)
          goto LABEL_144;
LABEL_81:
        objc_msgSend_bounds((void *)v246, v247, v248, v249, v250, v251);
        v253 = CGRectGetMidY(v907);
        v254 = v253;
        if (v253 == 0.0)
          v255 = 0;
        else
          v255 = *(_QWORD *)&v253;
        v256 = (unint64_t)v890[1];
        if (v890[1])
        {
          v257 = (uint8x8_t)vcnt_s8((int8x8_t)v890[1]);
          v257.i16[0] = vaddlv_u8(v257);
          if (v257.u32[0] > 1uLL)
          {
            v246 = v255;
            if ((void *)v255 >= v890[1])
              v246 = v255 % (unint64_t)v890[1];
          }
          else
          {
            v246 = ((unint64_t)v890[1] - 1) & v255;
          }
          v258 = (double **)*((_QWORD *)v890[0] + v246);
          if (v258)
          {
            v259 = *v258;
            if (v259)
            {
              if (v257.u32[0] < 2uLL)
              {
                while (1)
                {
                  v261 = *((_QWORD *)v259 + 1);
                  if (v261 == v255)
                  {
                    if (v259[2] == v254)
                      goto LABEL_144;
                  }
                  else if ((v261 & ((unint64_t)v890[1] - 1)) != v246)
                  {
                    goto LABEL_104;
                  }
                  v259 = *(double **)v259;
                  if (!v259)
                    goto LABEL_104;
                }
              }
              do
              {
                v260 = *((_QWORD *)v259 + 1);
                if (v260 == v255)
                {
                  if (v259[2] == v254)
                    goto LABEL_144;
                }
                else
                {
                  if ((void *)v260 >= v890[1])
                    v260 %= (unint64_t)v890[1];
                  if (v260 != v246)
                    break;
                }
                v259 = *(double **)v259;
              }
              while (v259);
            }
          }
        }
LABEL_104:
        v262 = (double *)operator new(0x18uLL);
        *v262 = 0.0;
        *((_QWORD *)v262 + 1) = v255;
        v262[2] = v254;
        v263 = (float)((unint64_t)__p[1] + 1);
        if (v256 && (float)(v892 * (float)v256) >= v263)
        {
          v264 = v890[0];
          v265 = (double **)*((_QWORD *)v890[0] + v246);
          if (v265)
          {
LABEL_107:
            *(_QWORD *)v262 = *v265;
            goto LABEL_142;
          }
        }
        else
        {
          v266 = (v256 & (v256 - 1)) != 0;
          if (v256 < 3)
            v266 = 1;
          v267 = v266 | (2 * v256);
          v268 = vcvtps_u32_f32(v263 / v892);
          if (v267 <= v268)
            prime = v268;
          else
            prime = v267;
          if (prime == 1)
          {
            prime = 2;
          }
          else if ((prime & (prime - 1)) != 0)
          {
            prime = std::__next_prime(prime);
            v256 = (unint64_t)v890[1];
          }
          if (prime > v256)
            goto LABEL_118;
          if (prime < v256)
          {
            v270 = vcvtps_u32_f32((float)(unint64_t)__p[1] / v892);
            if (v256 < 3
              || (v271 = (uint8x8_t)vcnt_s8((int8x8_t)v256), v271.i16[0] = vaddlv_u8(v271), v271.u32[0] > 1uLL))
            {
              v270 = std::__next_prime(v270);
            }
            else
            {
              v272 = 1 << -(char)__clz(v270 - 1);
              if (v270 >= 2)
                v270 = v272;
            }
            if (prime <= v270)
              prime = v270;
            if (prime < v256)
LABEL_118:
              sub_1BE61F23C((uint64_t)v890, prime);
          }
          v256 = (unint64_t)v890[1];
          v273 = (unint64_t)v890[1] - 1;
          if (((unint64_t)v890[1] & ((unint64_t)v890[1] - 1)) != 0)
          {
            if ((void *)v255 >= v890[1])
            {
              v246 = v255 % (unint64_t)v890[1];
              v264 = v890[0];
              v265 = (double **)*((_QWORD *)v890[0] + v255 % (unint64_t)v890[1]);
              if (v265)
                goto LABEL_107;
            }
            else
            {
              v246 = v255;
              v264 = v890[0];
              v265 = (double **)*((_QWORD *)v890[0] + v255);
              if (v265)
                goto LABEL_107;
            }
          }
          else
          {
            v246 = v273 & v255;
            v264 = v890[0];
            v265 = (double **)*((_QWORD *)v890[0] + (v273 & v255));
            if (v265)
              goto LABEL_107;
          }
        }
        *v262 = *(double *)__p;
        __p[0] = v262;
        v264[v246] = __p;
        if (!*(_QWORD *)v262)
        {
LABEL_143:
          ++__p[1];
          goto LABEL_144;
        }
        v274 = *(_QWORD *)(*(_QWORD *)v262 + 8);
        if ((v256 & (v256 - 1)) != 0)
        {
          if (v274 >= v256)
            v274 %= v256;
        }
        else
        {
          v274 &= v256 - 1;
        }
        v265 = (double **)((char *)v890[0] + 8 * v274);
LABEL_142:
        *v265 = v262;
        goto LABEL_143;
      }
      if ((v207 & 0xFFFFFFFFFFFFFFFELL) == 6
        || v207 == 5 && (objc_msgSend_strokeAttributes(v240, v241, v242, v243, v244, v245) & 2) != 0)
      {
        v252 = _os_feature_enabled_impl();

        if (v239 == v252)
          goto LABEL_144;
        goto LABEL_81;
      }

      if ((v239 & 1) == 0)
        goto LABEL_81;
    }
LABEL_144:

    goto LABEL_145;
  }
LABEL_147:

  if ((v847[2]() & 1) == 0)
  {
    objc_msgSend_set(MEMORY[0x1E0C99E20], v277, v278, v279, v280, v281);
    v857 = (void *)objc_claimAutoreleasedReturnValue();
    v288 = __p[0];
    if (__p[0])
    {
      v852 = (float64x2_t)vdupq_n_s64(0x4082C00000000000uLL);
      while (1)
      {
        v289 = self;
        if (!self)
          break;
        v290 = (const double *)(v288 + 2);
        v291 = vld1q_dup_f64(v290);
        v292 = vcvtq_s64_f64(vrndmq_f64(vdivq_f64(vaddq_f64(v291, (float64x2_t)xmmword_1BE8E02B0), v852)));
        v289 = (CHStrokeClassifier *)v292.i64[1];
        v293 = v292.i64[0];
        if (v292.i64[0] <= v292.i64[1])
          goto LABEL_155;
LABEL_152:
        v288 = (_QWORD *)*v288;
        if (!v288)
          goto LABEL_159;
      }
      v293 = 0;
LABEL_155:
      v294 = (char *)&v289->super.isa + 1;
      do
      {
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v283, v293, v285, v286, v287);
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v857, v296, (uint64_t)v295, v297, v298, v299);

        ++v293;
      }
      while (v294 != (char *)v293);
      goto LABEL_152;
    }
LABEL_159:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v283, v284, v285, v286, v287);
    v828 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v300, v301, v302, v303, v304);
    v853 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v305, v306, v307, v308, v309);
    v844 = (void *)objc_claimAutoreleasedReturnValue();
    v315 = objc_msgSend_mutableCopy(v860, v310, v311, v312, v313, v314);
    v872 = 0u;
    v873 = 0u;
    v870 = 0u;
    v871 = 0u;
    v833 = v835;
    v849 = (_QWORD *)v315;
    v318 = objc_msgSend_countByEnumeratingWithState_objects_count_(v833, v316, (uint64_t)&v870, (uint64_t)v897, 16, v317);
    if (v318)
    {
      v842 = *(_QWORD *)v871;
      v836 = (float64x2_t)vdupq_n_s64(0x4082C00000000000uLL);
      do
      {
        v839 = v318;
        for (ii = 0; ii != v839; ++ii)
        {
          if (*(_QWORD *)v871 != v842)
            objc_enumerationMutation(v833);
          v320 = *(void **)(*((_QWORD *)&v870 + 1) + 8 * ii);
          if ((v847[2]() & 1) != 0)
          {
            v837 = 1;
            goto LABEL_208;
          }
          objc_msgSend_bounds(v320, v321, v322, v323, v324, v325);
          v330 = CGRectGetMidY(v908);
          v850 = *(_QWORD *)&v330;
          if (self)
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v326, vcvtmd_s64_f64(v330 / 600.0), v327, v328, v329);
          else
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v326, 0, v327, v328, v329);
          v854 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeClassificationsByStrokeIdentifier(v860, v331, v332, v333, v334, v335);
          v336 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_encodedStrokeIdentifier(v320, v337, v338, v339, v340, v341);
          v342 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v336, v343, (uint64_t)v342, v344, v345, v346);
          v845 = (void *)objc_claimAutoreleasedReturnValue();

          v352 = objc_msgSend_integerValue(v845, v347, v348, v349, v350, v351);
          v353 = v320;
          v359 = v353;
          if (!self || v352 == 8)
          {

          }
          else
          {
            if ((v352 & 0xFFFFFFFFFFFFFFFELL) != 6
              && (v352 != 5 || (objc_msgSend_strokeAttributes(v353, v354, v355, v356, v357, v358) & 2) == 0))
            {

LABEL_186:
              if (objc_msgSend_containsObject_(v857, v361, (uint64_t)v854, v363, v364, v365))
              {
                objc_msgSend_objectForKeyedSubscript_(v828, v413, (uint64_t)v854, v415, v416, v417);
                v423 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v423)
                {
                  objc_msgSend_set(MEMORY[0x1E0C99E20], v418, v419, v420, v421, v422);
                  v423 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v828, v424, (uint64_t)v423, (uint64_t)v854, v425, v426);
                }
                objc_msgSend_addObject_(v423, v418, (uint64_t)v359, v420, v421, v422);
              }
              else
              {
                objc_msgSend_strokeClassificationLastResult(self, v413, v414, v415, v416, v417);
                v427 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_strokeClassificationsByStrokeIdentifier(v427, v428, v429, v430, v431, v432);
                v433 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_encodedStrokeIdentifier(v359, v434, v435, v436, v437, v438);
                v439 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v433, v440, (uint64_t)v439, v441, v442, v443);
                v444 = (void *)objc_claimAutoreleasedReturnValue();
                v831 = objc_msgSend_integerValue(v444, v445, v446, v447, v448, v449);

                objc_msgSend_strokeClassificationLastResult(self, v450, v451, v452, v453, v454);
                v455 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_scriptClassificationsByStrokeIdentifier(v455, v456, v457, v458, v459, v460);
                v461 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_encodedStrokeIdentifier(v359, v462, v463, v464, v465, v466);
                v467 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v461, v468, (uint64_t)v467, v469, v470, v471);
                v472 = (void *)objc_claimAutoreleasedReturnValue();
                v478 = objc_msgSend_integerValue(v472, v473, v474, v475, v476, v477);

                objc_msgSend_strokeClassificationLastResult(self, v479, v480, v481, v482, v483);
                v484 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v484, v485, v486, v487, v488, v489);
                v490 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_encodedStrokeIdentifier(v359, v491, v492, v493, v494, v495);
                v496 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(v490, v497, (uint64_t)v496, v498, v499, v500);
                v423 = (void *)objc_claimAutoreleasedReturnValue();

                sub_1BE871570((uint64_t)v849, v359, v831);
                sub_1BE871720(v849, v359, v478, v423);
              }

LABEL_192:
              v501 = vcvtq_s64_f64(vrndmq_f64(vdivq_f64(vaddq_f64((float64x2_t)vdupq_lane_s64(v850, 0), (float64x2_t)xmmword_1BE8E02B0), v836)));
              v411 = v501.i64[1];
              v412 = v501.i64[0];
              if (v501.i64[0] > v501.i64[1])
                goto LABEL_199;
              goto LABEL_193;
            }
            v360 = _os_feature_enabled_impl();

            if (v360)
              goto LABEL_186;
          }
          objc_msgSend_scriptCodeMap(v848, v361, v362, v363, v364, v365);
          v371 = (id)objc_claimAutoreleasedReturnValue();
          if (self)
          {
            objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v366, v367, v368, v369, v370);
            v377 = (void *)objc_claimAutoreleasedReturnValue();
            for (jj = 0; objc_msgSend_count(v371, v372, v373, v374, v375, v376) > jj; ++jj)
            {
              objc_msgSend_objectAtIndexedSubscript_(v371, v379, jj, v380, v381, v382);
              v383 = (void *)objc_claimAutoreleasedReturnValue();
              v389 = objc_msgSend_integerValue(v383, v384, v385, v386, v387, v388);

              if (v389 == 8)
              {
                objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v390, 8, v391, v392, v393);
                v394 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKey_(v377, v395, (uint64_t)&unk_1E7829790, (uint64_t)v394, v396, v397);
              }
              else
              {
                objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v390, v389, v391, v392, v393);
                v394 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKey_(v377, v398, (uint64_t)&unk_1E78297A0, (uint64_t)v394, v399, v400);
              }

            }
            v401 = [CHScriptClassificationRawResult alloc];
            v406 = (void *)objc_msgSend_initWithProbabilityByScriptClassifications_(v401, v402, (uint64_t)v377, v403, v404, v405);

          }
          else
          {
            v406 = 0;
          }

          sub_1BE871720(v849, v359, 8, v406);
          if (self)
            goto LABEL_192;
          v411 = 0;
          v412 = 0;
LABEL_193:
          v502 = v411 + 1;
          do
          {
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v407, v412, v408, v409, v410);
            v503 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_containsObject_(v857, v504, (uint64_t)v503, v505, v506, v507))
            {
              objc_msgSend_objectForKeyedSubscript_(v853, v508, (uint64_t)v503, v509, v510, v511);
              v517 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v517)
              {
                objc_msgSend_array(MEMORY[0x1E0C99DE8], v512, v513, v514, v515, v516);
                v517 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v853, v518, (uint64_t)v517, (uint64_t)v503, v519, v520);
              }
              objc_msgSend_addObject_(v517, v512, (uint64_t)v359, v514, v515, v516);

            }
            ++v412;
          }
          while (v502 != v412);
LABEL_199:
          objc_msgSend_objectForKeyedSubscript_(v844, v407, (uint64_t)v854, v408, v409, v410);
          v526 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v526)
          {
            objc_msgSend_set(MEMORY[0x1E0C99E20], v521, v522, v523, v524, v525);
            v526 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v844, v527, (uint64_t)v526, (uint64_t)v854, v528, v529);
          }
          objc_msgSend_addObject_(v526, v521, (uint64_t)v359, v523, v524, v525);

        }
        v318 = objc_msgSend_countByEnumeratingWithState_objects_count_(v833, v530, (uint64_t)&v870, (uint64_t)v897, 16, v531);
      }
      while (v318);
    }
    v837 = 0;
LABEL_208:

    v868 = 0u;
    v869 = 0u;
    v866 = 0u;
    v867 = 0u;
    v838 = v828;
    v834 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v838, v532, (uint64_t)&v866, (uint64_t)v896, 16, v533);
    if (v834)
    {
      v832 = *(_QWORD *)v867;
      while (2)
      {
        v843 = 0;
        do
        {
          if (*(_QWORD *)v867 != v832)
            objc_enumerationMutation(v838);
          v534 = *(void **)(*((_QWORD *)&v866 + 1) + 8 * (_QWORD)v843);
          if (v847[2]())
          {

            goto LABEL_285;
          }
          objc_msgSend_objectForKeyedSubscript_(v838, v535, (uint64_t)v534, v536, v537, v538);
          v851 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v853, v539, (uint64_t)v534, v540, v541, v542);
          v855 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend_count(v851, v543, v544, v545, v546, v547) < 2
            || (unint64_t)objc_msgSend_count(v855, v548, v549, v550, v551, v552) <= 0xA)
          {
            objc_msgSend_setWithArray_(MEMORY[0x1E0C99E20], v548, (uint64_t)v855, v550, v551, v552);
            v553 = (void *)objc_claimAutoreleasedReturnValue();
            v554 = (void *)MEMORY[0x1E0CB37E8];
            v560 = objc_msgSend_integerValue(v534, v555, v556, v557, v558, v559);
            objc_msgSend_numberWithInteger_(v554, v561, v560 - 1, v562, v563, v564);
            v565 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_allKeys(v844, v566, v567, v568, v569, v570);
            v571 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v554) = objc_msgSend_containsObject_(v571, v572, (uint64_t)v565, v573, v574, v575);

            if ((_DWORD)v554)
            {
              objc_msgSend_objectForKeyedSubscript_(v844, v576, (uint64_t)v565, v578, v579, v580);
              v581 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_unionSet_(v553, v582, (uint64_t)v581, v583, v584, v585);

            }
            v586 = (void *)MEMORY[0x1E0CB37E8];
            v587 = objc_msgSend_integerValue(v534, v576, v577, v578, v579, v580);
            objc_msgSend_numberWithInteger_(v586, v588, v587 + 1, v589, v590, v591);
            v592 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_allKeys(v844, v593, v594, v595, v596, v597);
            v598 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v586) = objc_msgSend_containsObject_(v598, v599, (uint64_t)v592, v600, v601, v602);

            if ((_DWORD)v586)
            {
              objc_msgSend_objectForKeyedSubscript_(v844, v603, (uint64_t)v592, v605, v606, v607);
              v608 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_unionSet_(v553, v609, (uint64_t)v608, v610, v611, v612);

            }
            v613 = objc_msgSend_count(v553, v603, v604, v605, v606, v607);
            if (v613 != objc_msgSend_count(v855, v614, v615, v616, v617, v618))
            {
              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v619 = (id)qword_1EF568E78;
              if (os_log_type_enabled(v619, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_1BE607000, v619, OS_LOG_TYPE_DEBUG, "Adding neighbor tiles strokes as context in case of insufficient context", (uint8_t *)&buf, 2u);
              }

              objc_msgSend_allObjects(v553, v620, v621, v622, v623, v624);
              v625 = (void *)objc_claimAutoreleasedReturnValue();
              v865[0] = MEMORY[0x1E0C809B0];
              v865[1] = 3221225472;
              v865[2] = sub_1BE875840;
              v865[3] = &unk_1E77F30F0;
              v865[4] = self;
              objc_msgSend_sortedArrayUsingComparator_(v625, v626, (uint64_t)v865, v627, v628, v629);
              v630 = (void *)objc_claimAutoreleasedReturnValue();

              v636 = objc_msgSend_copy(v630, v631, v632, v633, v634, v635);
              v855 = (void *)v636;
            }

          }
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v637 = (id)qword_1EF568E78;
          if (os_log_type_enabled(v637, OS_LOG_TYPE_DEBUG))
          {
            v643 = objc_msgSend_count(v855, v638, v639, v640, v641, v642);
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v643;
            _os_log_impl(&dword_1BE607000, v637, OS_LOG_TYPE_DEBUG, "Running stroke classification over %ld strokes", (uint8_t *)&buf, 0xCu);
          }

          buf = 0uLL;
          v895 = 0;
          v646 = objc_msgSend_classifyStrokes_outStrokeClassProbabilities_cancellationBlock_(v848, v644, (uint64_t)v855, (uint64_t)&buf, (uint64_t)v847, v645);
          v837 = ((uint64_t (*)(uint64_t (**)(void)))v847[2])(v847);
          v840 = v646 ^ 1 | v837;
          if ((v840 & 1) == 0)
          {
            for (kk = 0; kk < objc_msgSend_count(v855, v647, v648, v649, v650, v651); ++kk)
            {
              objc_msgSend_objectAtIndexedSubscript_(v855, v659, kk, v660, v661, v662);
              v663 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_containsObject_(v851, v664, (uint64_t)v663, v665, v666, v667))
              {
                v673 = buf;
                objc_msgSend_scriptCodeMap(v848, v668, v669, v670, v671, v672);
                v679 = (id)objc_claimAutoreleasedReturnValue();
                if (self)
                {
                  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v674, v675, v676, v677, v678);
                  v684 = (void *)objc_claimAutoreleasedReturnValue();
                  v685 = (_QWORD *)(v673 + 24 * kk);
                  if ((int)((v685[1] - *v685) >> 2) >= 1)
                  {
                    v686 = 0;
                    do
                    {
                      objc_msgSend_objectAtIndexedSubscript_(v679, v680, v686, v681, v682, v683);
                      v687 = (void *)objc_claimAutoreleasedReturnValue();
                      LODWORD(v688) = *(_DWORD *)(*v685 + 4 * v686);
                      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v689, v690, v691, v692, v693, v688);
                      v694 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setObject_forKey_(v684, v695, (uint64_t)v694, (uint64_t)v687, v696, v697);

                      ++v686;
                    }
                    while (v686 < (int)((v685[1] - *v685) >> 2));
                  }
                  v698 = [CHScriptClassificationRawResult alloc];
                  v703 = (void *)objc_msgSend_initWithProbabilityByScriptClassifications_(v698, v699, (uint64_t)v684, v700, v701, v702);

                }
                else
                {
                  v703 = 0;
                }

                objc_msgSend_scriptClassificationAtIndex_(v703, v704, 0, v705, v706, v707);
                v708 = (void *)objc_claimAutoreleasedReturnValue();
                v714 = objc_msgSend_integerValue(v708, v709, v710, v711, v712, v713);

                objc_msgSend_probabilityByScriptClassifications(v703, v715, v716, v717, v718, v719);
                v720 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v721, v714, v722, v723, v724);
                v725 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v720, v726, (uint64_t)v725, v727, v728, v729);
                v730 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_floatValue(v730, v731, v732, v733, v734, v735);
                v737 = v736;

                if (((v714 == 8) & (objc_msgSend_strokeAttributes(v663, v738, v739, v740, v741, v742) >> 2)) != 0)
                  v749 = 7;
                else
                  v749 = v714;
                if (v749 == 8)
                {
                  if ((unint64_t)objc_msgSend_count(v855, v743, v744, v745, v746, v747) < 0xB
                    || (v748 = v737, v737 < 0.65))
                  {
                    objc_msgSend_scriptClassificationAtIndex_(v703, v743, 1, v745, v746, v747, v748);
                    v750 = (void *)objc_claimAutoreleasedReturnValue();
                    v846 = objc_msgSend_integerValue(v750, v751, v752, v753, v754, v755);

                    v863 = 0u;
                    v864 = 0u;
                    v861 = 0u;
                    v862 = 0u;
                    objc_msgSend_nontextCandidates(v849, v756, v757, v758, v759, v760);
                    v761 = (void *)objc_claimAutoreleasedReturnValue();
                    v769 = objc_msgSend_countByEnumeratingWithState_objects_count_(v761, v762, (uint64_t)&v861, (uint64_t)v893, 16, v763);
                    if (v769)
                    {
                      v770 = *(_QWORD *)v862;
                      while (2)
                      {
                        for (mm = 0; mm != v769; ++mm)
                        {
                          if (*(_QWORD *)v862 != v770)
                            objc_enumerationMutation(v761);
                          v772 = *(void **)(*((_QWORD *)&v861 + 1) + 8 * mm);
                          objc_msgSend_encodedStrokeIdentifier(v663, v764, v765, v766, v767, v768);
                          v773 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_strokeIdentifier(v772, v774, v775, v776, v777, v778);
                          v779 = (void *)objc_claimAutoreleasedReturnValue();
                          isEqual = objc_msgSend_isEqual_(v773, v780, (uint64_t)v779, v781, v782, v783);

                          if ((isEqual & 1) != 0)
                          {
                            v785 = 1;
                            goto LABEL_263;
                          }
                        }
                        v769 = objc_msgSend_countByEnumeratingWithState_objects_count_(v761, v764, (uint64_t)&v861, (uint64_t)v893, 16, v768);
                        if (v769)
                          continue;
                        break;
                      }
                    }
                    v785 = 0;
LABEL_263:

                    objc_msgSend_validFallbackScriptClassificationsForNontext(CHScriptClassificationRawResult, v786, v787, v788, v789, v790);
                    v791 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v792, v846, v793, v794, v795);
                    v796 = (void *)objc_claimAutoreleasedReturnValue();
                    v801 = objc_msgSend_containsObject_(v791, v797, (uint64_t)v796, v798, v799, v800);

                    v802 = v846;
                    if (!v801)
                      v802 = 8;
                    if (v785)
                      v749 = 8;
                    else
                      v749 = v802;
                  }
                  else
                  {
                    v749 = 8;
                  }
                }
                if ((objc_msgSend_strokeAttributes(v663, v743, v744, v745, v746, v747, v748) & 2) != 0
                  && !objc_msgSend_isValidScriptClassificationForShapeStroke(v703, v803, v804, v805, v806, v807))
                {
                  v749 = 8;
                }
                else if (v749 == 11)
                {
                  objc_msgSend_fallbackScriptClassificationForWeakLabel(v703, v803, v804, v805, v806, v807);
                  v808 = (void *)objc_claimAutoreleasedReturnValue();
                  v749 = objc_msgSend_integerValue(v808, v809, v810, v811, v812, v813);

                }
                sub_1BE871720(v849, v663, v749, v703);

              }
            }
          }
          v652 = buf;
          if ((_QWORD)buf)
          {
            v653 = *((_QWORD *)&buf + 1);
            v654 = (void *)buf;
            if (*((_QWORD *)&buf + 1) != (_QWORD)buf)
            {
              v655 = *((_QWORD *)&buf + 1);
              do
              {
                v657 = *(void **)(v655 - 24);
                v655 -= 24;
                v656 = v657;
                if (v657)
                {
                  *(_QWORD *)(v653 - 16) = v656;
                  operator delete(v656);
                }
                v653 = v655;
              }
              while (v655 != v652);
              v654 = (void *)buf;
            }
            *((_QWORD *)&buf + 1) = v652;
            operator delete(v654);
          }

          if ((v840 & 1) != 0)
            goto LABEL_282;
          v843 = (char *)v843 + 1;
        }
        while (v843 != v834);
        v834 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v838, v814, (uint64_t)&v866, (uint64_t)v896, 16, v815);
        if (v834)
          continue;
        break;
      }

    }
    else
    {
LABEL_282:

      if ((v837 & 1) != 0)
      {
LABEL_285:
        v822 = 0;
        v821 = v849;
        goto LABEL_286;
      }
    }
    v821 = v849;
    v822 = (void *)objc_msgSend_copy(v849, v816, v817, v818, v819, v820);
LABEL_286:
    v282 = v822;

    goto LABEL_287;
  }
  v282 = 0;
LABEL_287:

  v823 = __p[0];
  if (__p[0])
  {
    do
    {
      v824 = (_QWORD *)*v823;
      operator delete(v823);
      v823 = v824;
    }
    while (v824);
  }
  v825 = v890[0];
  v890[0] = 0;
  if (v825)
    operator delete(v825);
  v13 = v847;
LABEL_292:

  return v282;
}

- (id)refineStrokeClassificationResultUsingSortedTextStrokeGroups:(id)a3 strokeClassificationResult:(id)a4 cancellationBlock:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
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
  uint64_t v47;
  char v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  BOOL v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  id v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  BOOL v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  double v154;
  uint64_t j;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  id v184;
  const char *v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t k;
  double v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  int v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  double v212;
  double v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  int v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  double v251;
  double v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  double v258;
  double v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  double v265;
  double v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  double v272;
  double v273;
  double v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  double v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  double v327;
  double v328;
  double v329;
  double v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  double v336;
  double v337;
  BOOL v338;
  BOOL v339;
  BOOL v340;
  double v341;
  double v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  double v348;
  double v349;
  double v350;
  double v351;
  _BOOL4 v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  double v358;
  double v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  double v365;
  _BOOL4 v366;
  NSObject *v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  void *v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t m;
  uint64_t v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  void *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  void *v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  int v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  int isStrokeClassificationMath;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  NSObject *v459;
  const char *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  void *v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  const char *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  void *v480;
  const char *v481;
  uint64_t v482;
  const char *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t kk;
  uint64_t v491;
  void *v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  void *v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  unint64_t v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  void *v513;
  unint64_t ii;
  const char *v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  void *v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  const char *v532;
  uint64_t v533;
  void *v534;
  const char *v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  void *v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  BOOL v546;
  id v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t n;
  id v553;
  id v554;
  const char *v555;
  uint64_t v556;
  uint64_t v558;
  id v559;
  uint64_t v560;
  id v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  int v565;
  int v566;
  void *v567;
  id v568;
  void *v569;
  void *v570;
  uint64_t v571;
  unsigned int (**v572)(void);
  id v573;
  id v574;
  id v575;
  char *v576;
  void *v577;
  id v578;
  unint64_t jj;
  uint64_t v580;
  double v581;
  void *v582;
  id obj;
  void *v584;
  id v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  _BYTE v614[128];
  _BYTE v615[128];
  _BYTE v616[128];
  _BYTE v617[128];
  _BYTE v618[128];
  uint8_t v619[128];
  uint8_t buf[128];
  uint64_t v621;

  v621 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v572 = (unsigned int (**)(void))a5;
  v577 = v9;
  v585 = (id)objc_msgSend_mutableCopy(v9, v10, v11, v12, v13, v14);
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16, v17, v18, v19);
  v584 = (void *)objc_claimAutoreleasedReturnValue();
  v604 = 0u;
  v605 = 0u;
  v602 = 0u;
  v603 = 0u;
  obj = v8;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v602, (uint64_t)v618, 16, v21);
  if (v27)
  {
    v28 = *(_QWORD *)v603;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v603 != v28)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v602 + 1) + 8 * i);
        objc_msgSend_allKeys(v584, v22, v23, v24, v25, v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0CB37E8];
        v38 = objc_msgSend_classification(v30, v33, v34, v35, v36, v37);
        objc_msgSend_numberWithInteger_(v32, v39, v38, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend_containsObject_(v31, v44, (uint64_t)v43, v45, v46, v47);

        if ((v48 & 1) == 0)
        {
          objc_msgSend_set(MEMORY[0x1E0C99E20], v49, v50, v51, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)MEMORY[0x1E0CB37E8];
          v61 = objc_msgSend_classification(v30, v56, v57, v58, v59, v60);
          objc_msgSend_numberWithInteger_(v55, v62, v61, v63, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v584, v67, (uint64_t)v54, (uint64_t)v66, v68, v69);

        }
        v70 = (void *)MEMORY[0x1E0CB37E8];
        v71 = objc_msgSend_classification(v30, v49, v50, v51, v52, v53);
        objc_msgSend_numberWithInteger_(v70, v72, v71, v73, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v584, v77, (uint64_t)v76, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v81, v82, (uint64_t)v30, v83, v84, v85);

      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v602, (uint64_t)v618, 16, v26);
    }
    while (v27);
  }

  objc_msgSend_objectForKeyedSubscript_(v584, v86, (uint64_t)&unk_1E78293A8, v87, v88, v89);
  v569 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v584, v90, (uint64_t)&unk_1E78293C0, v91, v92, v93);
  v567 = (void *)objc_claimAutoreleasedReturnValue();
  if (v569 && v567)
  {
    v600 = 0u;
    v601 = 0u;
    v598 = 0u;
    v599 = 0u;
    v559 = v569;
    v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v559, v99, (uint64_t)&v598, (uint64_t)v617, 16, v100);
    if (!v101)
      goto LABEL_87;
    v560 = *(_QWORD *)v599;
    if (self)
    {
      while (1)
      {
        v564 = 0;
        v558 = v101;
        do
        {
          if (*(_QWORD *)v599 != v560)
            objc_enumerationMutation(v559);
          v570 = *(void **)(*((_QWORD *)&v598 + 1) + 8 * v564);
          if (v572[2]())
            goto LABEL_140;
          objc_msgSend_strokeIdentifiers(v570, v104, v105, v106, v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = (unint64_t)objc_msgSend_count(v109, v110, v111, v112, v113, v114) < 2;

          if (!v115)
          {
            v596 = 0u;
            v597 = 0u;
            v594 = 0u;
            v595 = 0u;
            v561 = v567;
            v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v561, v116, (uint64_t)&v594, (uint64_t)v616, 16, v117);
            if (!v118)
              goto LABEL_15;
            v563 = *(_QWORD *)v595;
            while (1)
            {
              v571 = 0;
              v562 = v118;
              do
              {
                if (*(_QWORD *)v595 != v563)
                  objc_enumerationMutation(v561);
                v119 = *(id *)(*((_QWORD *)&v594 + 1) + 8 * v571);
                v574 = v570;
                v568 = v577;
                objc_msgSend_changeableTextMathScriptClassifications(CHScriptClassificationRawResult, v120, v121, v122, v123, v124);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                v565 = sub_1BE876FDC(v125, v119, v568);

                v566 = sub_1BE876FDC(&unk_1E7828010, v574, v568);
                v126 = v119;
                v578 = v568;
                v573 = v126;
                objc_msgSend_strokeIdentifiers(v126, v127, v128, v129, v130, v131);
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                v138 = objc_msgSend_count(v132, v133, v134, v135, v136, v137) == 0;

                v144 = 0.0;
                if (!v138)
                {
                  v612 = 0u;
                  v613 = 0u;
                  v610 = 0u;
                  v611 = 0u;
                  objc_msgSend_strokeIdentifiers(v573, v139, v140, v141, v142, v143);
                  v575 = (id)objc_claimAutoreleasedReturnValue();
                  v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v575, v145, (uint64_t)&v610, (uint64_t)buf, 16, v146);
                  if (v152)
                  {
                    v153 = 0;
                    v580 = *(_QWORD *)v611;
                    v154 = 0.0;
                    do
                    {
                      for (j = 0; j != v152; ++j)
                      {
                        if (*(_QWORD *)v611 != v580)
                          objc_enumerationMutation(v575);
                        v156 = *(_QWORD *)(*((_QWORD *)&v610 + 1) + 8 * j);
                        objc_msgSend_strokeProvider(self, v147, v148, v149, v150, v151, v558);
                        v157 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v158, v156, (uint64_t)v157, v159, v160);
                        v161 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v577)
                          goto LABEL_34;
                        objc_msgSend_substrokesByStrokeIdentifier(v578, v162, v163, v164, v165, v166);
                        v167 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_encodedStrokeIdentifier(v161, v168, v169, v170, v171, v172);
                        v173 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_objectForKey_(v167, v174, (uint64_t)v173, v175, v176, v177);
                        v178 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v178)
                        {
LABEL_34:
                          v179 = (void *)objc_opt_class();
                          objc_msgSend_substrokesForStroke_(v179, v180, (uint64_t)v161, v181, v182, v183);
                          v178 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        v608 = 0u;
                        v609 = 0u;
                        v606 = 0u;
                        v607 = 0u;
                        v184 = v178;
                        v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v185, (uint64_t)&v606, (uint64_t)v619, 16, v186);
                        if (v192)
                        {
                          v193 = *(_QWORD *)v607;
                          do
                          {
                            for (k = 0; k != v192; ++k)
                            {
                              if (*(_QWORD *)v607 != v193)
                                objc_enumerationMutation(v184);
                              objc_msgSend_bounds(*(void **)(*((_QWORD *)&v606 + 1) + 8 * k), v187, v188, v189, v190, v191);
                              v154 = v154 + v195;
                            }
                            v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v187, (uint64_t)&v606, (uint64_t)v619, 16, v191);
                          }
                          while (v192);
                        }

                        v201 = objc_msgSend_count(v184, v196, v197, v198, v199, v200);
                        v153 += v201;
                      }
                      v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v575, v147, (uint64_t)&v610, (uint64_t)buf, 16, v151);
                    }
                    while (v152);

                    if (v153)
                      v144 = v154 / (double)v153;
                    else
                      v144 = 0.0;
                  }
                  else
                  {

                  }
                }

                objc_msgSend_bounds(v573, v202, v203, v204, v205, v206);
                v213 = 2.2;
                if (v566)
                  v213 = 5.0;
                if ((v565 | v566) != 1)
                  goto LABEL_53;
                if (v212 / v144 > v213)
                  goto LABEL_53;
                if (objc_msgSend_classification(v573, v207, v208, v209, v210, v211) == 3)
                  goto LABEL_53;
                v216 = (void *)objc_opt_class();
                objc_msgSend_bounds(v574, v217, v218, v219, v220, v221);
                v223 = v222;
                v225 = v224;
                v227 = v226;
                v229 = v228;
                objc_msgSend_bounds(v573, v230, v231, v232, v233, v234);
                objc_msgSend_distanceFromRectangle_toRectangle_(v216, v235, v236, v237, v238, v239, v223, v225, v227, v229, v240, v241, v242, v243);
                if (v244 >= v144 + v144 || v244 <= 1.0)
                  goto LABEL_53;
                v245 = sub_1BE876FDC(&unk_1E7828028, v574, v578);
                objc_msgSend_bounds(v573, v246, v247, v248, v249, v250);
                v252 = v251;
                objc_msgSend_bounds(v574, v253, v254, v255, v256, v257);
                v259 = v258;
                objc_msgSend_bounds(v573, v260, v261, v262, v263, v264);
                v266 = v265;
                v581 = v259;
                objc_msgSend_bounds(v574, v267, v268, v269, v270, v271);
                v273 = v272;
                v274 = v252;
                objc_msgSend_bounds(v573, v275, v276, v277, v278, v279);
                v281 = v280;
                v283 = v282;
                v285 = v284;
                v287 = v286;
                objc_msgSend_bounds(v574, v288, v289, v290, v291, v292);
                objc_msgSend_horizontalDistanceBetweenRectangle_rectangle_(CHStrokeUtilities, v293, v294, v295, v296, v297, v281, v283, v285, v287, v298, v299, v300, v301);
                v303 = v302;
                objc_msgSend_bounds(v573, v304, v305, v306, v307, v308);
                v310 = v309;
                v312 = v311;
                v314 = v313;
                v316 = v315;
                objc_msgSend_bounds(v574, v317, v318, v319, v320, v321);
                objc_msgSend_verticalDistanceBetweenRectangle_rectangle_(CHStrokeUtilities, v322, v323, v324, v325, v326, v310, v312, v314, v316, v327, v328, v329, v330);
                v337 = fmin(v266, v273);
                v338 = v336 < v337 * -0.3;
                if (v303 <= 0.0)
                  v338 = 0;
                v339 = v303 < v337 * -0.3;
                if (v336 <= 0.0)
                  v339 = 0;
                if (v245)
                  v340 = v339;
                else
                  v340 = v338;
                objc_msgSend_bounds(v574, v331, v332, v333, v334, v335, v558);
                v342 = v341;
                objc_msgSend_bounds(v573, v343, v344, v345, v346, v347);
                v348 = fmax(v274, v581);
                v350 = vabdd_f64(v342, v349);
                v351 = v348 * 0.75;
                v352 = v350 < v348 * 0.75;
                objc_msgSend_bounds(v574, v353, v354, v355, v356, v357);
                v359 = v358;
                objc_msgSend_bounds(v573, v360, v361, v362, v363, v364);
                if (v245)
                {
                  v366 = vabdd_f64(v359, v365) < v337 * 0.75;
                  v352 = v350 < v351 && v366;
                }
                if (!v340)
                {
LABEL_53:

LABEL_54:
                  goto LABEL_55;
                }

                if (v352 | v566)
                {
                  if (qword_1EF568E88 != -1)
                    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                  v367 = (id)qword_1EF568E78;
                  if (os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BE607000, v367, OS_LOG_TYPE_DEBUG, "Converting neighbor text group to math group classification", buf, 2u);
                  }

                  objc_msgSend_strategyIdentifier(v574, v368, v369, v370, v371, v372);
                  v373 = (void *)objc_claimAutoreleasedReturnValue();
                  v379 = objc_msgSend_classification(v574, v374, v375, v376, v377, v378);
                  objc_msgSend_updateStrategyIdentifier_classification_(v573, v380, (uint64_t)v373, v379, v381, v382);

                  v592 = 0u;
                  v593 = 0u;
                  v590 = 0u;
                  v591 = 0u;
                  objc_msgSend_strokeIdentifiers(v573, v383, v384, v385, v386, v387);
                  v573 = (id)objc_claimAutoreleasedReturnValue();
                  v395 = objc_msgSend_countByEnumeratingWithState_objects_count_(v573, v388, (uint64_t)&v590, (uint64_t)v615, 16, v389);
                  if (v395)
                  {
                    v396 = *(_QWORD *)v591;
                    do
                    {
                      for (m = 0; m != v395; ++m)
                      {
                        if (*(_QWORD *)v591 != v396)
                          objc_enumerationMutation(v573);
                        v398 = *(_QWORD *)(*((_QWORD *)&v590 + 1) + 8 * m);
                        objc_msgSend_strokeProvider(self, v390, v391, v392, v393, v394);
                        v399 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v400, v398, (uint64_t)v399, v401, v402);
                        v403 = (void *)objc_claimAutoreleasedReturnValue();

                        v409 = objc_msgSend_classification(v574, v404, v405, v406, v407, v408);
                        sub_1BE871570((uint64_t)v585, v403, v409);

                      }
                      v395 = objc_msgSend_countByEnumeratingWithState_objects_count_(v573, v390, (uint64_t)&v590, (uint64_t)v615, 16, v394);
                    }
                    while (v395);
                  }
                  goto LABEL_54;
                }
LABEL_55:
                ++v571;
              }
              while (v571 != v562);
              v410 = objc_msgSend_countByEnumeratingWithState_objects_count_(v561, v214, (uint64_t)&v594, (uint64_t)v616, 16, v215);
              v118 = v410;
              if (!v410)
              {
LABEL_15:

                break;
              }
            }
          }
          ++v564;
        }
        while (v564 != v558);
        v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v559, v102, (uint64_t)&v598, (uint64_t)v617, 16, v103);
        if (!v101)
          goto LABEL_87;
      }
    }
LABEL_123:
    v530 = v101;
    v531 = 0;
    while (1)
    {
      if (*(_QWORD *)v599 != v560)
        objc_enumerationMutation(v559);
      v534 = *(void **)(*((_QWORD *)&v598 + 1) + 8 * v531);
      if ((((uint64_t (*)(void))v572[2])() & 1) != 0)
        break;
      objc_msgSend_strokeIdentifiers(v534, v535, v536, v537, v538, v539);
      v540 = (void *)objc_claimAutoreleasedReturnValue();
      v546 = (unint64_t)objc_msgSend_count(v540, v541, v542, v543, v544, v545) < 2;

      if (!v546)
      {
        v596 = 0u;
        v597 = 0u;
        v594 = 0u;
        v595 = 0u;
        v547 = v567;
        v550 = objc_msgSend_countByEnumeratingWithState_objects_count_(v547, v548, (uint64_t)&v594, (uint64_t)v616, 16, v549);
        if (v550)
        {
          v551 = *(_QWORD *)v595;
          do
          {
            for (n = 0; n != v550; ++n)
            {
              if (*(_QWORD *)v595 != v551)
                objc_enumerationMutation(v547);
              v553 = *(id *)(*((_QWORD *)&v594 + 1) + 8 * n);
              v554 = v534;

            }
            v550 = objc_msgSend_countByEnumeratingWithState_objects_count_(v547, v555, (uint64_t)&v594, (uint64_t)v616, 16, v556);
          }
          while (v550);
        }

      }
      if (++v531 == v530)
      {
        v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v559, v532, (uint64_t)&v598, (uint64_t)v617, 16, v533);
        if (!v101)
        {
LABEL_87:

          goto LABEL_88;
        }
        goto LABEL_123;
      }
    }
LABEL_140:

    goto LABEL_141;
  }
LABEL_88:
  if (!self)
  {
    v503 = 0;
    while (v503 < objc_msgSend_count(obj, v94, v95, v96, v97, v98, v558) && (((uint64_t (*)(void))v572[2])() & 1) == 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(obj, v504, v503, v505, v506, v507);
      v513 = (void *)objc_claimAutoreleasedReturnValue();
      for (ii = ++v503; ii < objc_msgSend_count(obj, v508, v509, v510, v511, v512); ++ii)
      {
        objc_msgSend_objectAtIndexedSubscript_(obj, v515, ii, v516, v517, v518);
        v519 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BE876BFC(0, v513, v519, v577);
        objc_msgSend_classification(v513, v520, v521, v522, v523, v524);
        objc_msgSend_classification(v519, v525, v526, v527, v528, v529);

      }
    }
    goto LABEL_141;
  }
  v576 = 0;
LABEL_91:
  if ((unint64_t)v576 < objc_msgSend_count(obj, v94, v95, v96, v97, v98, v558)
    && (((uint64_t (*)(void))v572[2])() & 1) == 0)
  {
    objc_msgSend_objectAtIndexedSubscript_(obj, v411, (uint64_t)v576, v412, v413, v414);
    v420 = (void *)objc_claimAutoreleasedReturnValue();
    for (jj = (unint64_t)++v576; ; ++jj)
    {
      if (jj >= objc_msgSend_count(obj, v415, v416, v417, v418, v419))
      {

        goto LABEL_91;
      }
      objc_msgSend_objectAtIndexedSubscript_(obj, v421, jj, v422, v423, v424);
      v582 = (void *)objc_claimAutoreleasedReturnValue();
      v425 = sub_1BE876BFC((uint64_t)self, v420, v582, v577);
      v431 = objc_msgSend_classification(v420, v426, v427, v428, v429, v430);
      v437 = objc_msgSend_classification(v582, v432, v433, v434, v435, v436);
      if (objc_msgSend_isStrokeClassificationTextOrMath_(CHStrokeUtilities, v438, v431, v439, v440, v441)&& objc_msgSend_isStrokeClassificationTextOrMath_(CHStrokeUtilities, v442, v437, v443, v444, v445))
      {
        if (objc_msgSend_isStrokeClassificationText_(CHStrokeUtilities, v446, v431, v447, v448, v449)&& (objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v450, v437, v451, v452, v453) & 1) != 0)
        {
          isStrokeClassificationMath = 1;
        }
        else
        {
          if (!objc_msgSend_isStrokeClassificationText_(CHStrokeUtilities, v450, v437, v451, v452, v453))goto LABEL_115;
          isStrokeClassificationMath = objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v455, v431, v456, v457, v458);
        }
        if ((v425 & isStrokeClassificationMath) == 1)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v459 = (id)qword_1EF568E78;
          if (os_log_type_enabled(v459, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE607000, v459, OS_LOG_TYPE_DEBUG, "Converting overlapping groups to the same stroke classification", buf, 2u);
          }

          objc_msgSend_strategyIdentifier(v420, v460, v461, v462, v463, v464);
          v465 = (void *)objc_claimAutoreleasedReturnValue();
          v471 = objc_msgSend_classification(v420, v466, v467, v468, v469, v470);
          objc_msgSend_updateStrategyIdentifier_classification_(v582, v472, (uint64_t)v465, v471, v473, v474);

          v588 = 0u;
          v589 = 0u;
          v586 = 0u;
          v587 = 0u;
          objc_msgSend_strokeIdentifiers(v582, v475, v476, v477, v478, v479);
          v480 = (void *)objc_claimAutoreleasedReturnValue();
          v488 = objc_msgSend_countByEnumeratingWithState_objects_count_(v480, v481, (uint64_t)&v586, (uint64_t)v614, 16, v482);
          if (v488)
          {
            v489 = *(_QWORD *)v587;
            do
            {
              for (kk = 0; kk != v488; ++kk)
              {
                if (*(_QWORD *)v587 != v489)
                  objc_enumerationMutation(v480);
                v491 = *(_QWORD *)(*((_QWORD *)&v586 + 1) + 8 * kk);
                objc_msgSend_strokeProvider(self, v483, v484, v485, v486, v487);
                v492 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v493, v491, (uint64_t)v492, v494, v495);
                v496 = (void *)objc_claimAutoreleasedReturnValue();

                v502 = objc_msgSend_classification(v420, v497, v498, v499, v500, v501);
                sub_1BE871570((uint64_t)v585, v496, v502);

              }
              v488 = objc_msgSend_countByEnumeratingWithState_objects_count_(v480, v483, (uint64_t)&v586, (uint64_t)v614, 16, v487);
            }
            while (v488);
          }

        }
      }
LABEL_115:

    }
  }
LABEL_141:

  return v585;
}

+ (id)nonTextCandidateForStroke:(id)a3 withSubstrokes:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  CHMutableNonTextCandidateStroke *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  CHMutableNonTextCandidateStroke *v59;
  const char *v60;
  double v62;
  _QWORD v63[5];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  __n128 (*v67)(__n128 *, __n128 *);
  void (*v68)(uint64_t);
  void *v69;
  void *__p;
  void *v71;
  uint64_t v72;

  v5 = a3;
  v6 = a4;
  objc_msgSend_bounds(v5, v7, v8, v9, v10, v11);
  v13 = v12;
  objc_msgSend_bounds(v5, v14, v15, v16, v17, v18);
  v20 = v19;
  objc_msgSend_bounds(v5, v21, v22, v23, v24, v25);
  v27 = v26;
  objc_msgSend_bounds(v5, v28, v29, v30, v31, v32);
  if (sqrt(v27 * v33 + v13 * v20) <= 63.0)
  {
    v45 = 0;
  }
  else
  {
    v64 = 0;
    v65 = &v64;
    v66 = 0x4812000000;
    v67 = sub_1BE877724;
    v68 = sub_1BE877748;
    v69 = &unk_1BE94989A;
    __p = 0;
    v71 = 0;
    v72 = 0;
    v34 = (void *)objc_opt_class();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = sub_1BE877760;
    v63[3] = &unk_1E77F2B80;
    v63[4] = &v64;
    objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v34, v35, (uint64_t)v5, 0, 1, (uint64_t)v63);
    v62 = 0.0;
    v36 = (void *)objc_opt_class();
    objc_msgSend_lineOrientationForStrokePoints_error_(v36, v37, (uint64_t)(v65 + 6), (uint64_t)&v62, v38, v39);
    v41 = v40;
    if (v62 >= 1.0)
    {
      v46 = (void *)objc_opt_class();
      v47 = v65;
      objc_msgSend_bounds(v5, v48, v49, v50, v51, v52);
      objc_msgSend_containerSupportForPoints_withBounds_(v46, v53, (uint64_t)(v47 + 6), v54, v55, v56);
      v58 = v57;
      v59 = [CHMutableNonTextCandidateStroke alloc];
      v44 = objc_msgSend_initWithStroke_consistingOfSubstrokes_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_(v59, v60, (uint64_t)v5, (uint64_t)v6, 7, 1, 0.0, 0.0, v58);
    }
    else
    {
      v42 = [CHMutableNonTextCandidateStroke alloc];
      v44 = objc_msgSend_initWithStroke_consistingOfSubstrokes_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_(v42, v43, (uint64_t)v5, (uint64_t)v6, 6, 1, v41, v62, 0.0);
    }
    v45 = (void *)v44;
    _Block_object_dispose(&v64, 8);
    if (__p)
    {
      v71 = __p;
      operator delete(__p);
    }
  }

  return v45;
}

+ (double)containerSupportForPoints:(const void *)a3 withBounds:(CGRect)a4
{
  uint64_t v4;
  unint64_t v5;
  double *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  float64x2_t *v11;
  uint8x8_t v12;
  int8x16_t v13;
  int8x8_t v14;
  int8x8_t v15;
  uint64x2_t v16;
  int8x8_t v17;
  float64x2_t v18;
  int8x8_t v19;
  int8x8_t v20;
  float64x2_t v21;
  int8x8_t v22;
  float64x2_t v23;
  int8x8_t v24;
  int8x8_t v25;
  float64x2_t v26;
  int8x8_t v27;
  int8x8_t v28;
  float64x2_t v29;
  int8x8_t v30;
  int8x8_t v31;
  float64x2_t v32;
  int8x8_t v33;
  int8x8_t v34;
  float64x2_t v35;
  int8x8_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  int8x16_t v45;
  int8x8_t v46;
  uint64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  int v51;
  uint64_t v52;
  _OWORD v53[6];
  __int32 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v54 = 0;
  memset(v53, 0, sizeof(v53));
  v4 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if (v4)
  {
    v5 = v4 >> 4;
    if (v5 <= 1)
      v5 = 1;
    v6 = (double *)(*(_QWORD *)a3 + 8);
    while (1)
    {
      v7 = (uint64_t)fmin((*(v6 - 1) - a4.origin.x) / a4.size.width * 10.0, 9.0)
         + 10 * (uint64_t)fmin((*v6 - a4.origin.y) / a4.size.height * 10.0, 9.0);
      if (v7 < 0)
        break;
      *((_BYTE *)v53 + v7) = 1;
      v6 += 2;
      if (!--v5)
        goto LABEL_13;
    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v8 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v51 = 134217984;
      v52 = v7;
      _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_ERROR, "Index %ld out of bounds in normalized image for container support calculation.", (uint8_t *)&v51, 0xCu);
    }

  }
LABEL_13:
  v9 = 0;
  v10 = 0.0;
  v11 = (float64x2_t *)&xmmword_1BE8E02C0;
  v12.i32[1] = 255;
  do
  {
    v13 = (int8x16_t)v53[v9];
    v14.i32[0] = v13.u8[0];
    v14.i32[1] = v13.u8[1];
    v15 = vand_s8(v14, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v15.u32[0];
    v16.i64[1] = v15.u32[1];
    v17.i32[0] = v13.u8[2];
    v18 = vcvtq_f64_u64(v16);
    v17.i32[1] = v13.u8[3];
    v19 = vand_s8(v17, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v19.u32[0];
    v16.i64[1] = v19.u32[1];
    v20.i32[0] = v13.u8[4];
    v20.i32[1] = v13.u8[5];
    v21 = vcvtq_f64_u64(v16);
    v22 = vand_s8(v20, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v22.u32[0];
    v16.i64[1] = v22.u32[1];
    v23 = vcvtq_f64_u64(v16);
    v24.i32[0] = v13.u8[6];
    v24.i32[1] = v13.u8[7];
    v25 = vand_s8(v24, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v25.u32[0];
    v16.i64[1] = v25.u32[1];
    v26 = vcvtq_f64_u64(v16);
    v13.i64[0] = vextq_s8(v13, v13, 8uLL).u64[0];
    v27.i32[0] = v13.u8[0];
    v27.i32[1] = v13.u8[1];
    v28 = vand_s8(v27, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v28.u32[0];
    v16.i64[1] = v28.u32[1];
    v29 = vcvtq_f64_u64(v16);
    v30.i32[0] = v13.u8[2];
    v30.i32[1] = v13.u8[3];
    v31 = vand_s8(v30, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v31.u32[0];
    v16.i64[1] = v31.u32[1];
    v32 = vcvtq_f64_u64(v16);
    v33.i32[0] = v13.u8[4];
    v33.i32[1] = v13.u8[5];
    v34 = vand_s8(v33, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v34.u32[0];
    v16.i64[1] = v34.u32[1];
    v35 = vcvtq_f64_u64(v16);
    v36.i32[0] = v13.u8[6];
    v36.i32[1] = v13.u8[7];
    *(int8x8_t *)v13.i8 = vand_s8(v36, (int8x8_t)0xFF000000FFLL);
    v16.i64[0] = v13.u32[0];
    v16.i64[1] = v13.u32[1];
    v37 = vmulq_f64(v11[7], vcvtq_f64_u64(v16));
    v38 = vmulq_f64(v11[6], v35);
    v39 = vmulq_f64(v11[5], v32);
    v40 = vmulq_f64(v11[4], v29);
    v41 = vmulq_f64(v11[3], v26);
    v42 = vmulq_f64(v11[2], v23);
    v43 = vmulq_f64(v11[1], v21);
    v44 = vmulq_f64(*v11, v18);
    v10 = v10
        + v44.f64[0]
        + v44.f64[1]
        + v43.f64[0]
        + v43.f64[1]
        + v42.f64[0]
        + v42.f64[1]
        + v41.f64[0]
        + v41.f64[1]
        + v40.f64[0]
        + v40.f64[1]
        + v39.f64[0]
        + v39.f64[1]
        + v38.f64[0]
        + v38.f64[1]
        + v37.f64[0]
        + v37.f64[1];
    ++v9;
    v11 += 8;
  }
  while (v9 != 6);
  v12.i32[0] = v54;
  v45 = (int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v12));
  v46 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL), (int8x8_t)0xFF000000FFLL);
  v47.i64[0] = v46.u32[0];
  v47.i64[1] = v46.u32[1];
  v48 = vcvtq_f64_u64(v47);
  *(int8x8_t *)v45.i8 = vand_s8(*(int8x8_t *)v45.i8, (int8x8_t)0xFF000000FFLL);
  v47.i64[0] = v45.u32[0];
  v47.i64[1] = v45.u32[1];
  v49 = vcvtq_f64_u64(v47);
  return v10 + v49.f64[0] + v49.f64[1] + v48.f64[0] + v48.f64[1];
}

+ (int64_t)fallbackTextScriptClassificationForMathGroup:(id)a3 strokeClassificationResult:(id)a4 fromTopNCandidate:(int64_t)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char isScriptClassificationMath;
  char v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  int v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  float v127;
  float v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _BOOL4 v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v147;
  id obj;
  void *v149;
  id v150;
  _QWORD v151[6];
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t (*v155)(uint64_t, uint64_t);
  void (*v156)(uint64_t);
  id v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  void (*v162)(uint64_t);
  id v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v150 = a4;
  v147 = v7;
  objc_msgSend_strokeIdentifiers(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_count(v13, v14, v15, v16, v17, v18);

  v25 = 7;
  if (v150 && v19)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v20, v21, v22, v23, v24);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    objc_msgSend_strokeIdentifiers(v7, v26, v27, v28, v29, v30);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v164, (uint64_t)v168, 16, v32);
    if (v38)
    {
      v39 = *(_QWORD *)v165;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v165 != v39)
            objc_enumerationMutation(obj);
          v41 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * i);
          objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v150, v33, v34, v35, v36, v37);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v42, v43, v41, v44, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = 0;
          while (1)
          {
            objc_msgSend_orderedScriptClassification(v47, v48, v49, v50, v51, v52);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_count(v54, v55, v56, v57, v58, v59) <= (unint64_t)a5)
            {
              objc_msgSend_orderedScriptClassification(v47, v60, v61, v62, v63, v64);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v53 < objc_msgSend_count(v70, v71, v72, v73, v74, v75);

            }
            else
            {
              v65 = v53 < a5;
            }

            if (!v65)
              break;
            objc_msgSend_scriptClassificationAtIndex_(v47, v66, v53, v67, v68, v69);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend_integerValue(v76, v77, v78, v79, v80, v81);

            isScriptClassificationMath = objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v83, v82, v84, v85, v86);
            if (v82 == 8)
              v88 = 1;
            else
              v88 = isScriptClassificationMath;
            ++v53;
            if ((v88 & 1) == 0)
            {
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v48, v82, v50, v51, v52);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v149, v90, (uint64_t)v89, v91, v92, v93);
              v94 = (void *)objc_claimAutoreleasedReturnValue();

              v100 = (void *)MEMORY[0x1E0CB37E8];
              if (v94)
              {
                v101 = objc_msgSend_intValue(v94, v95, v96, v97, v98, v99);
                objc_msgSend_numberWithInt_(v100, v102, (v101 + 1), v103, v104, v105);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v107, v82, v108, v109, v110);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v149, v112, (uint64_t)v106, (uint64_t)v111, v113, v114);

              }
              else
              {
                objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v95, v82, v97, v98, v99);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v149, v115, (uint64_t)&unk_1E7829420, (uint64_t)v106, v116, v117);
              }

              break;
            }
          }

        }
        v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v164, (uint64_t)v168, 16, v37);
      }
      while (v38);
    }

    v158 = 0;
    v159 = &v158;
    v160 = 0x3032000000;
    v161 = sub_1BE8780E8;
    v162 = sub_1BE8780F8;
    v163 = 0;
    v152 = 0;
    v153 = &v152;
    v154 = 0x3032000000;
    v155 = sub_1BE8780E8;
    v156 = sub_1BE8780F8;
    v157 = &unk_1E7829438;
    v151[0] = MEMORY[0x1E0C809B0];
    v151[1] = 3221225472;
    v151[2] = sub_1BE878100;
    v151[3] = &unk_1E77F64A8;
    v151[4] = &v152;
    v151[5] = &v158;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v149, v118, (uint64_t)v151, v119, v120, v121);
    if (v159[5]
      && (objc_msgSend_floatValue((void *)v153[5], v122, v123, v124, v125, v126),
          v128 = v127,
          objc_msgSend_strokeIdentifiers(v147, v129, v130, v131, v132, v133),
          v134 = (void *)objc_claimAutoreleasedReturnValue(),
          v140 = (float)(v128 / (float)(unint64_t)objc_msgSend_count(v134, v135, v136, v137, v138, v139)) > 0.6,
          v134,
          v140))
    {
      v25 = objc_msgSend_integerValue((void *)v159[5], v141, v142, v143, v144, v145);
    }
    else
    {
      v25 = 7;
    }
    _Block_object_dispose(&v152, 8);

    _Block_object_dispose(&v158, 8);
  }

  return v25;
}

- (CHStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (CHStrokeClassificationResult)strokeClassificationLastResult
{
  return self->_strokeClassificationLastResult;
}

- (int64_t)forcedStrokeClass
{
  return self->_forcedStrokeClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeClassificationLastResult, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
}

@end
