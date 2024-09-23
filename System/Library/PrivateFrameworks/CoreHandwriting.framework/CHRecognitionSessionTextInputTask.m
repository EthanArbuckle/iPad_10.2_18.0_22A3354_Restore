@implementation CHRecognitionSessionTextInputTask

- (CHRecognitionSessionTextInputTask)initWithLocales:(id)a3 strokeProvider:(id)a4 initialTextInputTargets:(id)a5 inputResult:(id)a6 recognitionEnvironment:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CHRecognitionSessionTextInputTask *v21;
  uint64_t v22;
  NSArray *initialTextInputTargets;
  int v25;
  char v26;
  char v27;
  char v28;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CHRecognitionSessionTextInputTask;
  v28 = 0;
  v27 = 0;
  v26 = 0;
  v25 = 0;
  v21 = -[CHRecognitionSessionTask initWithSessionMode:locales:preferredLocales:strokeProvider:calculateDocumentProvider:inputResult:recognitionQOSClass:recognitionEnvironment:isHighResponsivenessTask:strokeClassificationModel:strokeGroupingModel:strokeGroupingRequirement:principalLineRequirement:subjectStrokeIdentifiers:recognitionOptions:disableMathTextSwapping:partialResultBlock:wantsAutoRefine:](&v29, sel_initWithSessionMode_locales_preferredLocales_strokeProvider_calculateDocumentProvider_inputResult_recognitionQOSClass_recognitionEnvironment_isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine_, 1, v12, v12, v13, 0, v15, v25, a7, v26, 0, 0, 0, 0, 0, 0, v27, 0,
          v28);
  if (v21)
  {
    v22 = objc_msgSend_copy(v14, v16, v17, v18, v19, v20);
    initialTextInputTargets = v21->_initialTextInputTargets;
    v21->_initialTextInputTargets = (NSArray *)v22;

  }
  return v21;
}

- (CHRecognitionSessionTextInputTask)initWithSessionMode:(int64_t)a3 locales:(id)a4 preferredLocales:(id)a5 strokeProvider:(id)a6 inputResult:(id)a7 recognitionQOSClass:(unsigned int)a8 recognitionEnvironment:(int64_t)a9 isHighResponsivenessTask:(BOOL)a10 strokeClassificationModel:(id)a11 strokeGroupingModel:(id)a12 strokeGroupingRequirement:(int64_t)a13 subjectStrokeIdentifiers:(id)a14 recognitionOptions:(id)a15 disableMathTextSwapping:(BOOL)a16 partialResultBlock:(id)a17
{
  NSObject *v18;
  uint8_t v20[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v18 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1BE607000, v18, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v20, 2u);
  }

  return 0;
}

- (id)recognitionResultsForGroupingResult:(id)a3 groupingManager:(id)a4 strokeGroupsToProcess:(id)a5 strokeClassificationResult:(id)a6 strokeGroupReplacements:(id *)a7
{
  return 0;
}

- (id)textCorrectionResultsForGroupingResult:(id)a3 groupingManager:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  dispatch_group_t v67;
  NSObject *v68;
  id v69;
  dispatch_time_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
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
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char isEqualToNumber;
  id v178;
  id v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  double x;
  double y;
  double width;
  double height;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  double v204;
  double v205;
  double v206;
  double v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  double v214;
  double v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  void *v222;
  id v223;
  id v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  NSObject *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  NSObject *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  id v279;
  id v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  void *v309;
  CHStrokeGroupTextCorrectionResult *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  void *v338;
  id v339;
  void *v340;
  id obj;
  void *v342;
  id v343;
  void *v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  id v348;
  void *v349;
  void *v350;
  id v351;
  id v352;
  void *context;
  void *v354;
  id v355;
  void *v356;
  CHRecognitionSessionTextInputTask *v357;
  id v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  double v367;
  double *v368;
  uint64_t v369;
  char v370;
  id v371;
  id v372;
  _BYTE v373[128];
  _BYTE v374[128];
  _BYTE block[24];
  void *v376;
  id v377;
  CHRecognitionSessionTextInputTask *v378;
  id v379;
  NSObject *v380;
  id v381;
  double *v382;
  uint64_t v383;
  CGRect v384;

  v383 = *MEMORY[0x1E0C80C00];
  v339 = a3;
  v343 = a4;
  objc_msgSend_inputResult(self, v6, v7, v8, v9, v10);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recognitionLocales(self, v11, v12, v13, v14, v15);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activeTextInputQuery(self, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recognitionSession(v21, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_strokeGroupOrdering(v27, v28, v29, v30, v31, v32);
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v339, v34, v33, 0, v35, v36);
  v340 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_activeTextInputQuery(self, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textInputTargetsDataSource(v42, v43, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v357 = self;
  v338 = v48;
  if (v48)
  {
    v348 = v48;
    v54 = v340;
    v60 = v54;
    if (self)
    {
      v61 = objc_msgSend_count(v54, v55, v56, v57, v58, v59);
      objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], v62, v61, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v367 = 0.0;
      v368 = &v367;
      v369 = 0x2020000000;
      v370 = 0;
      v67 = dispatch_group_create();
      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = sub_1BE6E45E4;
      v376 = &unk_1E77F3AF0;
      v377 = v60;
      v378 = self;
      v379 = v348;
      v68 = v67;
      v380 = v68;
      v69 = v66;
      v381 = v69;
      v382 = &v367;
      dispatch_sync(MEMORY[0x1E0C80D38], block);
      v70 = dispatch_time(0, 2000000000);
      dispatch_group_wait(v68, v70);
      v71 = v69;
      objc_sync_enter(v71);
      *((_BYTE *)v368 + 24) = 1;
      v77 = objc_msgSend_copy(v71, v72, v73, v74, v75, v76);
      objc_sync_exit(v71);

      _Block_object_dispose(&v367, 8);
    }
    else
    {
      v77 = 0;
    }

    v349 = (void *)v77;
  }
  else
  {
    v349 = 0;
  }
  v78 = (void *)MEMORY[0x1E0C99E08];
  v79 = objc_msgSend_count(v340, v49, v50, v51, v52, v53);
  objc_msgSend_dictionaryWithCapacity_(v78, v80, v79, v81, v82, v83);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  v365 = 0u;
  v366 = 0u;
  v363 = 0u;
  v364 = 0u;
  obj = v340;
  v346 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v84, (uint64_t)&v363, (uint64_t)v374, 16, v85);
  if (v346)
  {
    v345 = *(_QWORD *)v364;
LABEL_8:
    v91 = 0;
    while (1)
    {
      if (*(_QWORD *)v364 != v345)
        objc_enumerationMutation(obj);
      v92 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * v91);
      if ((objc_msgSend_cancelled(self, v86, v87, v88, v89, v90) & 1) != 0)
        break;
      context = (void *)MEMORY[0x1C3B818B0]();
      v93 = (void *)MEMORY[0x1E0CB37E8];
      v99 = objc_msgSend_uniqueIdentifier(v92, v94, v95, v96, v97, v98);
      objc_msgSend_numberWithInteger_(v93, v100, v99, v101, v102, v103);
      v354 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v349, v104, (uint64_t)v354, v105, v106, v107);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      if (v356)
      {
        v361 = 0u;
        v362 = 0u;
        v359 = 0u;
        v360 = 0u;
        objc_msgSend_strokeGroupingResult(v347, v108, v109, v110, v111, v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeGroups(v113, v114, v115, v116, v117, v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();

        v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v359, (uint64_t)v373, 16, v121);
        if (v127)
        {
          v128 = *(_QWORD *)v360;
LABEL_15:
          v129 = 0;
          while (1)
          {
            if (*(_QWORD *)v360 != v128)
              objc_enumerationMutation(v119);
            v130 = *(void **)(*((_QWORD *)&v359 + 1) + 8 * v129);
            v131 = objc_msgSend_ancestorIdentifier(v130, v122, v123, v124, v125, v126);
            if (v131 == objc_msgSend_ancestorIdentifier(v92, v132, v133, v134, v135, v136))
              break;
            if (v127 == ++v129)
            {
              v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v122, (uint64_t)&v359, (uint64_t)v373, 16, v126);
              if (v127)
                goto LABEL_15;
              goto LABEL_21;
            }
          }
          v138 = objc_msgSend_uniqueIdentifier(v130, v122, v123, v124, v125, v126);
          objc_msgSend_textCorrectionResultForStrokeGroupIdentifier_(v347, v139, v138, v140, v141, v142);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_textCorrectionResult(v143, v144, v145, v146, v147, v148);
          v137 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v137)
            goto LABEL_25;
          objc_msgSend_inputTarget(v137, v149, v150, v151, v152, v153);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_inputTargetIdentifier(v154, v155, v156, v157, v158, v159);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_textInputTarget(v356, v161, v162, v163, v164, v165);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_inputTargetIdentifier(v166, v167, v168, v169, v170, v171);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToNumber = objc_msgSend_isEqualToNumber_(v160, v173, (uint64_t)v172, v174, v175, v176);

          if ((isEqualToNumber & 1) != 0)
            goto LABEL_25;
        }
        else
        {
LABEL_21:
          v137 = v119;
        }

        v137 = 0;
LABEL_25:
        v358 = v92;
        v352 = v343;
        v178 = v356;
        v351 = v344;
        v355 = v137;
        v350 = v178;
        if (v357)
        {
          v179 = v178;
          objc_opt_self();
          v184 = objc_msgSend_defaultTextAffectedRangeForTargetContentInfo_(CHTextCorrectionRecognizer, v180, (uint64_t)v179, v181, v182, v183);
          objc_msgSend_characterRectForCharacterIndex_(v179, v185, (uint64_t)&v185[v184 - 1], v186, v187, v188);
          x = v384.origin.x;
          y = v384.origin.y;
          width = v384.size.width;
          height = v384.size.height;
          if (CGRectIsNull(v384))
          {
            objc_msgSend_textInputTarget(v179, v193, v194, v195, v196, v197);
            v198 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_frame(v198, v199, v200, v201, v202, v203);
            x = v204;
            y = v205;
            width = v206;
            height = v207;

          }
          v367 = 0.0;
          v208 = v358;
          objc_msgSend_bounds(v358, v209, v210, v211, v212, v213);
          v215 = v214;
          objc_msgSend_bounds(v358, v216, v217, v218, v219, v220);
          v371 = 0;
          v372 = 0;
          objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(v352, v221, (uint64_t)v358, (uint64_t)&v372, (uint64_t)&v371, (uint64_t)&v367, 0, v215);
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          v223 = v372;
          v224 = v371;
          v230 = objc_msgSend_strokeCount(v222, v225, v226, v227, v228, v229);
          if (v230 != objc_msgSend_count(v224, v231, v232, v233, v234, v235))
          {
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v241 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v241, OS_LOG_TYPE_FAULT))
            {
              v247 = objc_msgSend_strokeCount(v222, v242, v243, v244, v245, v246);
              v253 = objc_msgSend_count(v224, v248, v249, v250, v251, v252);
              *(_DWORD *)block = 134218240;
              *(_QWORD *)&block[4] = v247;
              *(_WORD *)&block[12] = 2048;
              *(_QWORD *)&block[14] = v253;
              _os_log_impl(&dword_1BE607000, v241, OS_LOG_TYPE_FAULT, "The strokes count in the drawing (%ld) must match the ones in the result (%ld).", block, 0x16u);
            }

            v208 = v358;
          }
          v254 = objc_msgSend_strokeCount(v223, v236, v237, v238, v239, v240);
          if (v254 != objc_msgSend_count(v224, v255, v256, v257, v258, v259))
          {
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v265 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v265, OS_LOG_TYPE_FAULT))
            {
              v271 = objc_msgSend_strokeCount(v223, v266, v267, v268, v269, v270);
              v277 = objc_msgSend_count(v224, v272, v273, v274, v275, v276);
              *(_DWORD *)block = 134218240;
              *(_QWORD *)&block[4] = v271;
              *(_WORD *)&block[12] = 2048;
              *(_QWORD *)&block[14] = v277;
              _os_log_impl(&dword_1BE607000, v265, OS_LOG_TYPE_FAULT, "The strokes count in the original drawing (%ld) must match the ones in the result (%ld).", block, 0x16u);
            }

            v208 = v358;
          }
          objc_msgSend_strokeProvider(v357, v260, v261, v262, v263, v264);
          v278 = (void *)objc_claimAutoreleasedReturnValue();
          v279 = v208;
          v280 = v278;
          objc_opt_self();
          objc_msgSend_lastStrokeIdentifier(v279, v281, v282, v283, v284, v285);
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          if (v290)
          {
            objc_msgSend_strokeIdentifierFromData_(v280, v286, (uint64_t)v290, v287, v288, v289);
            v295 = (void *)objc_claimAutoreleasedReturnValue();
            if (v295)
            {
              objc_msgSend_strokeForIdentifier_(v280, v291, (uint64_t)v295, v292, v293, v294);
              v296 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v296 = 0;
            }

          }
          else
          {
            v296 = 0;
          }

          objc_msgSend_delegate(v357, v297, v298, v299, v300, v301);
          v302 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_textCorrectionRecognizerForLocales_(v302, v303, (uint64_t)v351, v304, v305, v306);
          v307 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_textCorrectionResultForDrawing_targetContentInfo_originalDrawing_lastStroke_localTypedContextBounds_normalizedDrawingScaleFactor_previousCorrectionResult_(v307, v308, (uint64_t)v222, (uint64_t)v179, (uint64_t)v223, (uint64_t)v296, v355, x, y, width, height, v367);
          v309 = (void *)objc_claimAutoreleasedReturnValue();
          v310 = [CHStrokeGroupTextCorrectionResult alloc];
          v314 = (void *)objc_msgSend_initWithTextCorrectionResult_inputStrokeIdentifiers_(v310, v311, (uint64_t)v309, (uint64_t)v224, v312, v313);

        }
        else
        {
          v314 = 0;
        }

        v315 = (void *)MEMORY[0x1E0CB37E8];
        v321 = objc_msgSend_uniqueIdentifier(v358, v316, v317, v318, v319, v320);
        objc_msgSend_numberWithInteger_(v315, v322, v321, v323, v324, v325);
        v326 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v342, v327, (uint64_t)v314, (uint64_t)v326, v328, v329);

      }
      objc_autoreleasePoolPop(context);
      self = v357;
      if (++v91 == v346)
      {
        v330 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v86, (uint64_t)&v363, (uint64_t)v374, 16, v90);
        v346 = v330;
        if (v330)
          goto LABEL_8;
        break;
      }
    }
  }

  v336 = (void *)objc_msgSend_copy(v342, v331, v332, v333, v334, v335);
  return v336;
}

- (id)clutterFilter
{
  return 0;
}

- (id)newStrokeClassifier
{
  CHStrokeClassifier *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *Result_forceClass;

  v3 = [CHStrokeClassifier alloc];
  objc_msgSend_strokeProvider(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputResult(self, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeClassificationResult(v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  Result_forceClass = (void *)objc_msgSend_initWithStrokeProvider_strokeClassificationLastResult_forceClass_(v3, v22, (uint64_t)v9, (uint64_t)v21, 1, v23);

  return Result_forceClass;
}

- (id)newGroupingManager
{
  CHStrokeGroupingManager *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *isMathMode;
  char v31;

  v3 = [CHStrokeGroupingManager alloc];
  objc_msgSend_strokeProvider(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputResult(self, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recognitionLocales(self, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_initialTextInputTargets(self, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  isMathMode = (void *)objc_msgSend_initWithStrokeProvider_sessionLastResult_strokeGroupingModel_locales_isInlineContinuousMode_inlineContinuousModeTargets_isMathMode_(v3, v28, (uint64_t)v9, (uint64_t)v15, 0, (uint64_t)v21, 1, v27, v31);

  return isMathMode;
}

- (id)newGroupingPostProcessingManagerWithGroupingManager:(id)a3
{
  return 0;
}

- (NSArray)initialTextInputTargets
{
  return self->_initialTextInputTargets;
}

- (CHTextInputQuery)activeTextInputQuery
{
  return self->_activeTextInputQuery;
}

- (void)setActiveTextInputQuery:(id)a3
{
  objc_storeStrong((id *)&self->_activeTextInputQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTextInputQuery, 0);
  objc_storeStrong((id *)&self->_initialTextInputTargets, 0);
}

@end
