@implementation CHSearchQuery

- (CHSearchQuery)initWithRecognitionSession:(id)a3
{
  CHSearchQuery *v3;
  NSArray *v4;
  NSArray *foundItems;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHSearchQuery;
  v3 = -[CHQuery initWithRecognitionSession:](&v7, sel_initWithRecognitionSession_, a3);
  if (v3)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    foundItems = v3->_foundItems;
    v3->_foundItems = v4;

    v3->_fullWordsOnly = 0;
    v3->_caseMatchingOnly = 0;
  }
  return v3;
}

- (void)stop
{
  ((void (*)(CHSearchQuery *, char *))MEMORY[0x1E0DE7D20])(self, sel_pause);
}

- (void)q_updateQueryResult
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSString *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSArray *v56;
  NSArray *foundItems;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  objc_super v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E50;
  v4 = os_signpost_id_generate(v3);

  if (qword_1EF568E88 == -1)
  {
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHSearchQuery", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSearchQuery\", buf, 2u);
  }

  v65.receiver = self;
  v65.super_class = (Class)CHSearchQuery;
  -[CHQuery q_updateQueryResult](&v65, sel_q_updateQueryResult);
  objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_debugName(self, v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeProviderVersion(v13, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v67 = v20;
    v68 = 2112;
    v69 = v26;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEBUG, "%@: beginning update for result version %@.", buf, 0x16u);

  }
  v27 = self->_queryString;
  objc_msgSend_q_foundItemsForSearchString_sessionResult_(self, v28, (uint64_t)v27, (uint64_t)v13, v29, v30);
  v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 == -1)
  {
    v32 = (id)qword_1EF568E28;
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    goto LABEL_17;
  }
  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v32 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
LABEL_17:
    objc_msgSend_debugName(self, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recognitionSession(self, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_count(v31, v45, v46, v47, v48, v49);
    *(_DWORD *)buf = 138412802;
    v67 = v38;
    v68 = 2048;
    v69 = v44;
    v70 = 2048;
    v71 = v50;
    _os_log_impl(&dword_1BE607000, v32, OS_LOG_TYPE_DEFAULT, "%@: finished update for session %p. Found %ld item(s).", buf, 0x20u);

  }
LABEL_18:

  if (self->_foundItems != v31)
  {
    v56 = (NSArray *)objc_msgSend_copy(v31, v51, v52, v53, v54, v55);
    foundItems = self->_foundItems;
    self->_foundItems = v56;

    objc_msgSend_q_queryResultDidChange(self, v58, v59, v60, v61, v62);
  }
  if (qword_1EF568E88 == -1)
  {
    v63 = (id)qword_1EF568E50;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_24;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v63 = (id)qword_1EF568E50;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_24;
  }
  if (os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v63, OS_SIGNPOST_INTERVAL_END, v4, "CHSearchQuery", ", buf, 2u);
  }
LABEL_24:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v64 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v64, OS_LOG_TYPE_DEFAULT, "END \"CHSearchQuery\", buf, 2u);
  }

}

- (id)q_foundItemsForSearchString:(id)a3 sessionResult:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  _BOOL4 v107;
  id v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  id v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t k;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  id v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  unint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  NSObject *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t Index;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
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
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  CHSearchQueryItem *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  NSSet *strokeIdentifiers;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  _BOOL4 v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t m;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  char v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  id v292;
  const char *v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t n;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  int isValidStrokeIdentifier;
  CHSearchQueryItem *v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  id v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  NSSet *v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  id v338;
  id obj;
  uint64_t j;
  void *v341;
  id v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  id v346;
  uint64_t i;
  id v348;
  void *v349;
  id v350;
  _QWORD *v351;
  void *v352;
  id v353;
  char *v354;
  char *v355;
  id v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  id v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  _QWORD v375[2];
  void (*v376)(uint64_t, void *);
  void *v377;
  uint64_t *v378;
  uint64_t v379;
  uint64_t *v380;
  uint64_t v381;
  uint64_t (*v382)(uint64_t, uint64_t);
  void (*v383)(uint64_t);
  id v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  uint64_t v393[3];
  id v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  _BYTE v399[128];
  _QWORD v400[3];
  _BYTE v401[128];
  _BYTE v402[128];
  _BYTE v403[128];
  _BYTE v404[128];
  _BYTE buf[132];
  uint64_t v406;

  v406 = *MEMORY[0x1E0C80C00];
  v342 = a3;
  v346 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v353 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v346, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recognitionSession(self, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_strokeGroupOrdering(v21, v22, v23, v24, v25, v26);
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v15, v28, v27, 1, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v387 = 0u;
  v388 = 0u;
  v385 = 0u;
  v386 = 0u;
  obj = v31;
  v343 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v385, (uint64_t)v403, 16, v33);
  if (v343)
  {
    v337 = *(_QWORD *)v386;
    do
    {
      for (i = 0; i != v343; ++i)
      {
        if (*(_QWORD *)v386 != v337)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v385 + 1) + 8 * i);
        v379 = 0;
        v380 = &v379;
        v381 = 0x3032000000;
        v382 = sub_1BE713A60;
        v383 = sub_1BE713A70;
        v384 = 0;
        v336 = (uint64_t)v39;
        v40 = objc_msgSend_uniqueIdentifier(v39, v34, v35, v36, v37, v38, v334);
        objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v346, v41, v40, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v375[0] = MEMORY[0x1E0C809B0];
        v375[1] = 3221225472;
        v376 = sub_1BE713A78;
        v377 = &unk_1E77F4160;
        v378 = &v379;
        v348 = v45;
        v354 = (char *)v342;
        v351 = v375;
        if (self && objc_msgSend_length(v354, v46, v47, v48, v49, v50))
        {
          objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v51, v52, v53, v54, v55);
          v359 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_orderedLocales(v348, v56, v57, v58, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_localesSortedByCombinedLanguageFitness_(v348, v62, (uint64_t)v61, v63, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          v397 = 0u;
          v398 = 0u;
          v395 = 0u;
          v396 = 0u;
          v338 = v66;
          v334 = objc_msgSend_countByEnumeratingWithState_objects_count_(v338, v67, (uint64_t)&v395, (uint64_t)buf, 16, v68);
          if (v334)
          {
            v335 = *(_QWORD *)v396;
            do
            {
              for (j = 0; j != v334; ++j)
              {
                if (*(_QWORD *)v396 != v335)
                  objc_enumerationMutation(v338);
                v74 = *(_QWORD *)(*((_QWORD *)&v395 + 1) + 8 * j);
                objc_msgSend_recognitionResultsByLocale(v348, v69, v70, v71, v72, v73, v334);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v75, v76, v74, v77, v78, v79);
                v357 = (void *)objc_claimAutoreleasedReturnValue();

                v344 = objc_msgSend_tokenColumnCount(v357, v80, v81, v82, v83, v84);
                if (v344 >= 1)
                {
                  v89 = 0;
                  do
                  {
                    v355 = (char *)v89;
                    objc_msgSend_tokenRowsAtColumnIndex_(v357, v85, v89, v86, v87, v88);
                    v349 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend_count(v349, v90, v91, v92, v93, v94))
                    {
                      v99 = 0;
                      do
                      {
                        objc_msgSend_objectAtIndexedSubscript_(v349, v95, v99, v96, v97, v98);
                        v100 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend_count(v100, v101, v102, v103, v104, v105))
                        {
                          v106 = 0;
                          do
                          {
                            v394 = 0;
                            v393[0] = (uint64_t)v355;
                            v393[1] = v99;
                            v393[2] = v106;
                            v107 = sub_1BE713AF8((uint64_t)self, v357, v393, v354, 0, v359, &v394);
                            v108 = v394;
                            v114 = v108;
                            if (v107 && objc_msgSend_count(v108, v109, v110, v111, v112, v113))
                            {
                              objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v115, v116, v117, v118, v119);
                              v120 = (void *)objc_claimAutoreleasedReturnValue();
                              v391 = 0u;
                              v392 = 0u;
                              v389 = 0u;
                              v390 = 0u;
                              v121 = v114;
                              v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v389, (uint64_t)v404, 16, v123);
                              if (v129)
                              {
                                v130 = *(_QWORD *)v390;
                                do
                                {
                                  for (k = 0; k != v129; ++k)
                                  {
                                    if (*(_QWORD *)v390 != v130)
                                      objc_enumerationMutation(v121);
                                    objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v389 + 1) + 8 * k), v124, v125, v126, v127, v128);
                                    v132 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend_addIndexes_(v120, v133, (uint64_t)v132, v134, v135, v136);

                                  }
                                  v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v124, (uint64_t)&v389, (uint64_t)v404, 16, v128);
                                }
                                while (v129);
                              }

                              v376((uint64_t)v351, v120);
                              objc_msgSend_addIndexes_(v359, v137, (uint64_t)v120, v138, v139, v140);

                            }
                            ++v106;
                          }
                          while (v106 < objc_msgSend_count(v100, v141, v142, v143, v144, v145));
                        }

                        ++v99;
                      }
                      while (v99 < objc_msgSend_count(v349, v146, v147, v148, v149, v150));
                    }

                    v89 = (uint64_t)(v355 + 1);
                  }
                  while (v355 + 1 != (char *)v344);
                }

              }
              v334 = objc_msgSend_countByEnumeratingWithState_objects_count_(v338, v69, (uint64_t)&v395, (uint64_t)buf, 16, v73);
            }
            while (v334);
          }

        }
        objc_msgSend_inputStrokeIdentifiers(v348, v151, v152, v153, v154, v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        v373 = 0u;
        v374 = 0u;
        v371 = 0u;
        v372 = 0u;
        v157 = (id)v380[5];
        v165 = objc_msgSend_countByEnumeratingWithState_objects_count_(v157, v158, (uint64_t)&v371, (uint64_t)v402, 16, v159);
        if (v165)
        {
          v166 = *(_QWORD *)v372;
          do
          {
            v167 = 0;
            do
            {
              if (*(_QWORD *)v372 != v166)
                objc_enumerationMutation(v157);
              v168 = *(void **)(*((_QWORD *)&v371 + 1) + 8 * v167);
              v169 = objc_msgSend_count(v156, v160, v161, v162, v163, v164, v334);
              if (v169 <= objc_msgSend_lastIndex(v168, v170, v171, v172, v173, v174))
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v179 = (id)qword_1EF568E18[0];
                if (os_log_type_enabled(v179, OS_LOG_TYPE_FAULT))
                {
                  Index = objc_msgSend_lastIndex(v168, v180, v181, v182, v183, v184);
                  v191 = objc_msgSend_count(v156, v186, v187, v188, v189, v190);
                  *(_DWORD *)buf = 134218240;
                  *(_QWORD *)&buf[4] = Index;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = v191;
                  _os_log_impl(&dword_1BE607000, v179, OS_LOG_TYPE_FAULT, "Stroke index %ld in search result out of group stroke count %ld.", buf, 0x16u);
                }

              }
              objc_msgSend_objectsAtIndexes_(v156, v175, (uint64_t)v168, v176, v177, v178);
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recognitionSession(self, v193, v194, v195, v196, v197);
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_latestStrokeProvider(v198, v199, v200, v201, v202, v203);
              v204 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v205, (uint64_t)v192, (uint64_t)v204, v206, v207);
              v208 = (void *)objc_claimAutoreleasedReturnValue();

              if (v208)
              {
                v209 = [CHSearchQueryItem alloc];
                objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v210, (uint64_t)v208, v211, v212, v213);
                v214 = (id)objc_claimAutoreleasedReturnValue();
                if (v209)
                {
                  *(_QWORD *)buf = v209;
                  *(_QWORD *)&buf[8] = CHSearchQueryItem;
                  v209 = (CHSearchQueryItem *)objc_msgSendSuper2((objc_super *)buf, sel_init);
                  if (v209)
                  {
                    v220 = objc_msgSend_copy(v214, v215, v216, v217, v218, v219);
                    strokeIdentifiers = v209->_strokeIdentifiers;
                    v209->_strokeIdentifiers = (NSSet *)v220;

                  }
                }

                objc_msgSend_addObject_(v353, v222, (uint64_t)v209, v223, v224, v225);
              }

              ++v167;
            }
            while (v165 != v167);
            v165 = objc_msgSend_countByEnumeratingWithState_objects_count_(v157, v160, (uint64_t)&v371, (uint64_t)v402, 16, v164);
          }
          while (v165);
        }

        objc_msgSend_preferredLocale(v348, v226, v227, v228, v229, v230);
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        v232 = v231 == 0;

        if (v232)
        {
          objc_msgSend_recognitionSession(self, v233, v234, v235, v236, v237);
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          v370 = 0;
          objc_msgSend_mathTranscriptionWithEvaluationResultForStrokeGroup_outStrokeIdentifiers_(v238, v239, v336, (uint64_t)&v370, v240, v241);
          v352 = (void *)objc_claimAutoreleasedReturnValue();
          v350 = v370;

          if (v352 && v350)
          {
            objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v242, (uint64_t)v352, v243, v244, v245);
            v341 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_simplifiedTextTranscriptionForLatex_(CHTokenizedMathResult, v246, (uint64_t)v352, v247, v248, v249);
            v345 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v354, v250, (uint64_t)CFSTR(" "), (uint64_t)&stru_1E77F6F28, v251, v252);
            v358 = (void *)objc_claimAutoreleasedReturnValue();
            v368 = 0u;
            v369 = 0u;
            v366 = 0u;
            v367 = 0u;
            v400[0] = v352;
            v400[1] = v341;
            v400[2] = v345;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v253, (uint64_t)v400, 3, v254, v255);
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            v262 = objc_msgSend_countByEnumeratingWithState_objects_count_(v256, v257, (uint64_t)&v366, (uint64_t)v401, 16, v258);
            if (v262)
            {
              v263 = *(_QWORD *)v367;
              v356 = v256;
              while (2)
              {
                for (m = 0; m != v262; ++m)
                {
                  if (*(_QWORD *)v367 != v263)
                    objc_enumerationMutation(v356);
                  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(*(void **)(*((_QWORD *)&v366 + 1) + 8 * m), v259, (uint64_t)CFSTR(" "), (uint64_t)&stru_1E77F6F28, v260, v261, v334);
                  v360 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend_rangeOfString_(v360, v265, (uint64_t)v358, v266, v267, v268) != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    objc_msgSend_array(MEMORY[0x1E0C99DE8], v269, v270, v271, v272, v273);
                    v274 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_recognitionSession(self, v275, v276, v277, v278, v279);
                    v280 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_latestStrokeProvider(v280, v281, v282, v283, v284, v285);
                    v286 = (void *)objc_claimAutoreleasedReturnValue();
                    v287 = objc_opt_respondsToSelector();

                    if ((v287 & 1) != 0)
                    {
                      v364 = 0u;
                      v365 = 0u;
                      v362 = 0u;
                      v363 = 0u;
                      v292 = v350;
                      v300 = objc_msgSend_countByEnumeratingWithState_objects_count_(v292, v293, (uint64_t)&v362, (uint64_t)v399, 16, v294);
                      if (v300)
                      {
                        v301 = *(_QWORD *)v363;
                        do
                        {
                          for (n = 0; n != v300; ++n)
                          {
                            if (*(_QWORD *)v363 != v301)
                              objc_enumerationMutation(v292);
                            v303 = *(_QWORD *)(*((_QWORD *)&v362 + 1) + 8 * n);
                            objc_msgSend_recognitionSession(self, v295, v296, v297, v298, v299);
                            v304 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_latestStrokeProvider(v304, v305, v306, v307, v308, v309);
                            v310 = (void *)objc_claimAutoreleasedReturnValue();
                            isValidStrokeIdentifier = objc_msgSend_isValidStrokeIdentifier_(v310, v311, v303, v312, v313, v314);

                            if (isValidStrokeIdentifier)
                              objc_msgSend_addObject_(v274, v295, v303, v297, v298, v299);
                          }
                          v300 = objc_msgSend_countByEnumeratingWithState_objects_count_(v292, v295, (uint64_t)&v362, (uint64_t)v399, 16, v299);
                        }
                        while (v300);
                      }

                    }
                    else
                    {
                      objc_msgSend_addObjectsFromArray_(v274, v288, (uint64_t)v350, v289, v290, v291);
                    }
                    v316 = [CHSearchQueryItem alloc];
                    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v317, (uint64_t)v274, v318, v319, v320);
                    v321 = (id)objc_claimAutoreleasedReturnValue();
                    if (v316)
                    {
                      *(_QWORD *)buf = v316;
                      *(_QWORD *)&buf[8] = CHSearchQueryItem;
                      v316 = (CHSearchQueryItem *)objc_msgSendSuper2((objc_super *)buf, sel_init);
                      if (v316)
                      {
                        v327 = objc_msgSend_copy(v321, v322, v323, v324, v325, v326);
                        v328 = v316->_strokeIdentifiers;
                        v316->_strokeIdentifiers = (NSSet *)v327;

                      }
                    }

                    objc_msgSend_addObject_(v353, v329, (uint64_t)v316, v330, v331, v332);
                    v256 = v356;
                    goto LABEL_81;
                  }

                }
                v256 = v356;
                v262 = objc_msgSend_countByEnumeratingWithState_objects_count_(v356, v259, (uint64_t)&v366, (uint64_t)v401, 16, v261);
                if (v262)
                  continue;
                break;
              }
            }
LABEL_81:

          }
        }

        _Block_object_dispose(&v379, 8);
      }
      v343 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v385, (uint64_t)v403, 16, v38);
    }
    while (v343);
  }

  return v353;
}

- (void)setQueryString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  objc_msgSend_processingQueue(self, v5, v6, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE714548;
  block[3] = &unk_1E77F41B0;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_sync(v10, block);

}

- (NSString)queryString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE713A60;
  v15 = sub_1BE713A70;
  v16 = 0;
  objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE71468C;
  v10[3] = &unk_1E77F2290;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v8;
}

- (NSArray)foundItems
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE713A60;
  v15 = sub_1BE713A70;
  v16 = 0;
  objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE714788;
  v10[3] = &unk_1E77F2290;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Search Query %p"), v2, v3, v4, self);
}

- (BOOL)caseMatchingOnly
{
  return self->_caseMatchingOnly;
}

- (void)setCaseMatchingOnly:(BOOL)a3
{
  self->_caseMatchingOnly = a3;
}

- (BOOL)fullWordsOnly
{
  return self->_fullWordsOnly;
}

- (void)setFullWordsOnly:(BOOL)a3
{
  self->_fullWordsOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
}

@end
