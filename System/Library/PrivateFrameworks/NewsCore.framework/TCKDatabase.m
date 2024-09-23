@implementation TCKDatabase

- (TCKDatabase)init
{
  TCKDatabase *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *recordsByID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TCKDatabase;
  v2 = -[TCKDatabase init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recordsByID = v2->_recordsByID;
    v2->_recordsByID = v3;

  }
  return v2;
}

- (void)addOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  uint64_t v50;
  NSMutableDictionary *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void (**v56)(_QWORD, _QWORD, _QWORD);
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void (**v61)(_QWORD, _QWORD, _QWORD);
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void (**v66)(_QWORD, _QWORD, _QWORD);
  void *v67;
  id v68;
  TCKDatabase *v69;
  id v70;
  NSMutableDictionary *v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t ii;
  uint64_t v79;
  void *v80;
  void (**v81)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v82;
  void (**v83)(_QWORD, _QWORD, _QWORD);
  id v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t jj;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void (**v96)(_QWORD, _QWORD);
  void (*v97)(void);
  id v98;
  void *v99;
  void (**v100)(_QWORD, _QWORD);
  id v101;
  void *v102;
  void (**v103)(_QWORD, _QWORD, _QWORD);
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void (**v111)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v112;
  void *v113;
  id v114;
  NSObject *v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t kk;
  uint64_t v123;
  void *v124;
  void (**v125)(_QWORD, _QWORD, _QWORD);
  void *v126;
  uint64_t v127;
  uint64_t v128;
  id v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  NSMutableDictionary *recordsByID;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t i;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t j;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  NSMutableDictionary *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t k;
  void *v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t m;
  uint64_t v168;
  void (**v169)(_QWORD, _QWORD, _QWORD);
  void (**v170)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v171;
  void *v172;
  void *v173;
  void *mm;
  uint64_t v175;
  NSMutableDictionary *v176;
  void *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t nn;
  uint64_t v183;
  void *v184;
  void (**v185)(_QWORD, _QWORD);
  void *v186;
  void *v187;
  void (**v188)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v189;
  void *v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  void *v202;
  uint64_t v203;
  uint64_t v204;
  id obj;
  id obja;
  void *v207;
  uint64_t v208;
  TCKDatabase *v209;
  _QWORD v210[4];
  id v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  _QWORD v216[5];
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  _QWORD v221[4];
  id v222;
  uint64_t v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  _QWORD v236[5];
  id v237;
  _QWORD v238[4];
  id v239;
  _QWORD v240[5];
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  _QWORD v245[4];
  id v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  _QWORD v267[4];
  id v268;
  _QWORD v269[4];
  id v270;
  id v271;
  id v272;
  id v273;
  uint8_t buf[4];
  const char *v275;
  __int16 v276;
  char *v277;
  __int16 v278;
  int v279;
  __int16 v280;
  id v281;
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  _BYTE v289[128];
  _BYTE v290[128];
  _BYTE v291[128];
  _BYTE v292[128];
  uint64_t v293;

  v293 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  v202 = v6;
  v209 = self;
  v199 = v4;
  if (!v6)
    goto LABEL_18;
  v8 = v6;
  -[TCKDatabase tSavedRecords](self, "tSavedRecords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TCKDatabase setTSavedRecords:](self, "setTSavedRecords:", v10);

  }
  -[TCKDatabase tSavedRecordIDs](self, "tSavedRecordIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[TCKDatabase setTSavedRecordIDs:](self, "setTSavedRecordIDs:", v12);

  }
  -[TCKDatabase tDeletedRecordIDs](self, "tDeletedRecordIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TCKDatabase setTDeletedRecordIDs:](self, "setTDeletedRecordIDs:", v14);

  }
  -[TCKDatabase tSavedRecords](self, "tSavedRecords");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCKDatabase tSavedRecordIDs](self, "tSavedRecordIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCKDatabase tDeletedRecordIDs](self, "tDeletedRecordIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modifyRecordsCompletionBlock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v269[0] = v7;
  v269[1] = 3221225472;
  v269[2] = __28__TCKDatabase_addOperation___block_invoke;
  v269[3] = &unk_1E46476A0;
  v196 = v15;
  v270 = v196;
  v194 = v16;
  v271 = v194;
  v193 = v17;
  v272 = v193;
  v192 = v18;
  v273 = v192;
  objc_msgSend(v8, "setModifyRecordsCompletionBlock:", v269);
  -[TCKDatabase tModifyRecordsOperationHandler](self, "tModifyRecordsOperationHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[TCKDatabase tModifyRecordsOperationHandler](self, "tModifyRecordsOperationHandler");
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v20)[2](v20, v8);
LABEL_15:
    v4 = v199;
    goto LABEL_16;
  }
  -[TCKDatabase tModifyRecordsHandler](self, "tModifyRecordsHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TCKDatabase tModifyRecordsHandler](self, "tModifyRecordsHandler");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordsToSave");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordIDsToDelete");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v267[0] = v7;
    v267[1] = 3221225472;
    v267[2] = __28__TCKDatabase_addOperation___block_invoke_2;
    v267[3] = &unk_1E463D6B8;
    v268 = v8;
    ((void (**)(_QWORD, void *, void *, _QWORD *))v22)[2](v22, v23, v24, v267);

    v20 = (void (**)(_QWORD, _QWORD))v268;
    goto LABEL_15;
  }
  v265 = 0u;
  v266 = 0u;
  v263 = 0u;
  v264 = 0u;
  objc_msgSend(v8, "recordsToSave");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v263, v292, 16);
  if (v127)
  {
    v128 = v127;
    v129 = *(id *)v264;
    v200 = *(id *)v264;
    do
    {
      v130 = 0;
      v203 = v128;
      do
      {
        if (*(id *)v264 != v129)
          objc_enumerationMutation(obj);
        v131 = *(void **)(*((_QWORD *)&v263 + 1) + 8 * v130);
        v132 = objc_msgSend(v8, "savePolicy");
        recordsByID = self->_recordsByID;
        objc_msgSend(v131, "recordID");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        if (v132 == 1)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](recordsByID, "objectForKeyedSubscript:", v134);
          v135 = (void *)objc_claimAutoreleasedReturnValue();

          if (v135)
          {
            v208 = v130;
            v261 = 0u;
            v262 = 0u;
            v259 = 0u;
            v260 = 0u;
            objc_msgSend(v131, "encryptedValueStore");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "changedKeys");
            v137 = (void *)objc_claimAutoreleasedReturnValue();

            v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v259, v291, 16);
            if (v138)
            {
              v139 = v138;
              v140 = *(_QWORD *)v260;
              do
              {
                for (i = 0; i != v139; ++i)
                {
                  if (*(_QWORD *)v260 != v140)
                    objc_enumerationMutation(v137);
                  v142 = *(_QWORD *)(*((_QWORD *)&v259 + 1) + 8 * i);
                  objc_msgSend(v131, "encryptedValueStore");
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v143, "objectForKeyedSubscript:", v142);
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "encryptedValueStore");
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v145, "setObject:forKeyedSubscript:", v144, v142);

                }
                v139 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v259, v291, 16);
              }
              while (v139);
            }

            v257 = 0u;
            v258 = 0u;
            v255 = 0u;
            v256 = 0u;
            objc_msgSend(v131, "valueStore");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "changedKeys");
            v147 = (void *)objc_claimAutoreleasedReturnValue();

            v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v255, v290, 16);
            if (v148)
            {
              v149 = v148;
              v150 = *(_QWORD *)v256;
              do
              {
                for (j = 0; j != v149; ++j)
                {
                  if (*(_QWORD *)v256 != v150)
                    objc_enumerationMutation(v147);
                  v152 = *(_QWORD *)(*((_QWORD *)&v255 + 1) + 8 * j);
                  objc_msgSend(v131, "valueStore");
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "objectForKeyedSubscript:", v152);
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "valueStore");
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v155, "setObject:forKeyedSubscript:", v154, v152);

                }
                v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v255, v290, 16);
              }
              while (v149);
            }
            v129 = v200;
            v8 = v202;
            v130 = v208;
            self = v209;
            v7 = MEMORY[0x1E0C809B0];
            v128 = v203;
          }
          else
          {
            v156 = self->_recordsByID;
            objc_msgSend(v131, "recordID");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v156, "setObject:forKeyedSubscript:", v131, v147);
          }

        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](recordsByID, "setObject:forKeyedSubscript:", v131, v134);
          v135 = v134;
        }

        ++v130;
      }
      while (v130 != v128);
      v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v263, v292, 16);
    }
    while (v128);
  }

  v253 = 0u;
  v254 = 0u;
  v251 = 0u;
  v252 = 0u;
  objc_msgSend(v8, "recordIDsToDelete");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v251, v289, 16);
  if (v158)
  {
    v159 = v158;
    v160 = *(_QWORD *)v252;
    do
    {
      for (k = 0; k != v159; ++k)
      {
        if (*(_QWORD *)v252 != v160)
          objc_enumerationMutation(v157);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordsByID, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v251 + 1) + 8 * k));
      }
      v159 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v251, v289, 16);
    }
    while (v159);
  }

  objc_msgSend(v8, "perRecordCompletionBlock");
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  if (v162)
  {
    v249 = 0u;
    v250 = 0u;
    v247 = 0u;
    v248 = 0u;
    objc_msgSend(v8, "recordsToSave");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v247, v288, 16);
    if (v164)
    {
      v165 = v164;
      v166 = *(_QWORD *)v248;
      do
      {
        for (m = 0; m != v165; ++m)
        {
          if (*(_QWORD *)v248 != v166)
            objc_enumerationMutation(v163);
          v168 = *(_QWORD *)(*((_QWORD *)&v247 + 1) + 8 * m);
          objc_msgSend(v8, "perRecordCompletionBlock");
          v169 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v169[2](v169, v168, 0);

        }
        v165 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v247, v288, 16);
      }
      while (v165);
    }

    self = v209;
  }
  objc_msgSend(v8, "modifyRecordsCompletionBlock");
  v170 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordsToSave");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordIDsToDelete");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, _QWORD))v170)[2](v170, v171, v172, 0);

  objc_msgSend(v8, "completionBlock");
  v173 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v199;
  if (!v173)
    goto LABEL_17;
  objc_msgSend(v8, "completionBlock");
  v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (*)(void))v20[2])();
LABEL_16:

LABEL_17:
LABEL_18:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v4;
  else
    v25 = 0;
  v26 = v25;
  if (v26)
  {
    -[TCKDatabase tSavedZones](self, "tSavedZones");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[TCKDatabase setTSavedZones:](self, "setTSavedZones:", v28);

    }
    -[TCKDatabase tDeletedZoneIDs](self, "tDeletedZoneIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[TCKDatabase setTDeletedZoneIDs:](self, "setTDeletedZoneIDs:", v30);

    }
    -[TCKDatabase tSavedZones](self, "tSavedZones");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v26, "recordZonesToSave");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithArray:copyItems:", v33, 1);
    objc_msgSend(v31, "addObjectsFromArray:", v34);

    -[TCKDatabase tDeletedZoneIDs](v209, "tDeletedZoneIDs");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    self = v209;
    v36 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v26, "recordZoneIDsToDelete");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v36, "initWithArray:copyItems:", v37, 1);
    objc_msgSend(v35, "addObjectsFromArray:", v38);

    -[TCKDatabase tModifyZonesHandler](v209, "tModifyZonesHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[TCKDatabase tModifyZonesHandler](v209, "tModifyZonesHandler");
      v40 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recordZonesToSave");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recordZoneIDsToDelete");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v245[0] = v7;
      v245[1] = 3221225472;
      v245[2] = __28__TCKDatabase_addOperation___block_invoke_3;
      v245[3] = &unk_1E463D6B8;
      v246 = v26;
      ((void (**)(_QWORD, void *, void *, _QWORD *))v40)[2](v40, v41, v42, v245);

      v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v246;
    }
    else
    {
      v44 = v4;
      v243 = 0u;
      v244 = 0u;
      v241 = 0u;
      v242 = 0u;
      objc_msgSend(v26, "recordZoneIDsToDelete");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v241, v287, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v242;
        do
        {
          for (n = 0; n != v47; ++n)
          {
            if (*(_QWORD *)v242 != v48)
              objc_enumerationMutation(v45);
            v50 = *(_QWORD *)(*((_QWORD *)&v241 + 1) + 8 * n);
            v51 = v209->_recordsByID;
            v240[0] = v7;
            v240[1] = 3221225472;
            v240[2] = __28__TCKDatabase_addOperation___block_invoke_4;
            v240[3] = &unk_1E46476C8;
            v240[4] = v50;
            -[NSMutableDictionary fc_removeObjectsForKeysPassingTest:](v51, "fc_removeObjectsForKeysPassingTest:", v240);
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v241, v287, 16);
        }
        while (v47);
      }

      objc_msgSend(v26, "modifyRecordZonesCompletionBlock");
      v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recordZonesToSave");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recordZoneIDsToDelete");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v43)[2](v43, v52, v53, 0);

      v4 = v44;
      self = v209;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v54 = v4;
  else
    v54 = 0;
  v55 = v54;
  if (v55)
  {
    -[TCKDatabase tFetchZonesHandler](self, "tFetchZonesHandler");
    v56 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "recordZoneIDs");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v238[0] = v7;
    v238[1] = 3221225472;
    v238[2] = __28__TCKDatabase_addOperation___block_invoke_5;
    v238[3] = &unk_1E463D040;
    v239 = v55;
    ((void (**)(_QWORD, void *, _QWORD *))v56)[2](v56, v57, v238);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v58 = v4;
  else
    v58 = 0;
  v59 = v58;
  v60 = v59;
  v207 = v59;
  if (v59)
  {
    if (objc_msgSend(v59, "isCancelled"))
    {
      objc_msgSend(v60, "fetchRecordsCompletionBlock");
      v61 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 20, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v61)[2](v61, 0, v62);

      v60 = v207;
    }
    else
    {
      -[TCKDatabase tFetchedRecords](self, "tFetchedRecords");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v63)
      {
        v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[TCKDatabase setTFetchedRecords:](self, "setTFetchedRecords:", v64);

      }
      -[TCKDatabase tFetchRecordsHandler](self, "tFetchRecordsHandler");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
      {
        -[TCKDatabase tFetchRecordsHandler](self, "tFetchRecordsHandler");
        v66 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "recordIDs");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v236[0] = v7;
        v236[1] = 3221225472;
        v236[2] = __28__TCKDatabase_addOperation___block_invoke_6;
        v236[3] = &unk_1E46446B8;
        v236[4] = self;
        v237 = v207;
        ((void (**)(_QWORD, void *, _QWORD *))v66)[2](v66, v67, v236);

        v60 = v207;
      }
      else
      {
        v197 = v55;
        v68 = v26;
        v69 = self;
        v70 = v4;
        v71 = v69->_recordsByID;
        objc_msgSend(v60, "recordIDs");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary fc_subdictionaryForKeys:](v71, "fc_subdictionaryForKeys:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = v207;
        v234 = 0u;
        v235 = 0u;
        v232 = 0u;
        v233 = 0u;
        v74 = v73;
        v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v232, v286, 16);
        if (v75)
        {
          v76 = v75;
          v77 = *(_QWORD *)v233;
          do
          {
            for (ii = 0; ii != v76; ++ii)
            {
              if (*(_QWORD *)v233 != v77)
                objc_enumerationMutation(v74);
              v79 = *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * ii);
              objc_msgSend(v60, "perRecordCompletionBlock");
              v80 = (void *)objc_claimAutoreleasedReturnValue();

              if (v80)
              {
                objc_msgSend(v60, "perRecordCompletionBlock");
                v81 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "objectForKeyedSubscript:", v79);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *, uint64_t, _QWORD))v81)[2](v81, v82, v79, 0);

                v60 = v207;
              }
            }
            v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v232, v286, 16);
          }
          while (v76);
        }

        objc_msgSend(v60, "fetchRecordsCompletionBlock");
        v83 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, _QWORD))v83)[2](v83, v74, 0);

        v4 = v70;
        self = v209;
        v26 = v68;
        v55 = v197;
      }
    }
  }
  objc_opt_class();
  if (!v4 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v84 = 0;
    goto LABEL_78;
  }
  v195 = v26;
  v198 = v55;
  v84 = v4;
  -[TCKDatabase tFetchedChangedRecordZoneNames](self, "tFetchedChangedRecordZoneNames");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v85)
  {
    v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TCKDatabase setTFetchedChangedRecordZoneNames:](self, "setTFetchedChangedRecordZoneNames:", v86);

  }
  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  objc_msgSend(v84, "recordZoneIDs");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v228, v285, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v229;
    do
    {
      for (jj = 0; jj != v89; ++jj)
      {
        if (*(_QWORD *)v229 != v90)
          objc_enumerationMutation(v87);
        v92 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * jj);
        -[TCKDatabase tFetchedChangedRecordZoneNames](v209, "tFetchedChangedRecordZoneNames");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "zoneName");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "addObject:", v94);

      }
      v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v228, v285, 16);
    }
    while (v89);
  }

  self = v209;
  -[TCKDatabase tFetchRecordZoneChangesOperationHandler](v209, "tFetchRecordZoneChangesOperationHandler");
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v95)
  {
    -[TCKDatabase tFetchZoneChangesHandler](v209, "tFetchZoneChangesHandler");
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    if (v117)
    {
      v226 = 0uLL;
      v227 = 0uLL;
      v224 = 0uLL;
      v225 = 0uLL;
      objc_msgSend(v84, "recordZoneIDs");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v224, v284, 16);
      if (v119)
      {
        v120 = v119;
        v121 = *(_QWORD *)v225;
        do
        {
          for (kk = 0; kk != v120; ++kk)
          {
            if (*(_QWORD *)v225 != v121)
              objc_enumerationMutation(v118);
            v123 = *(_QWORD *)(*((_QWORD *)&v224 + 1) + 8 * kk);
            -[TCKDatabase tFetchZoneChangesHandler](v209, "tFetchZoneChangesHandler");
            v124 = (void *)objc_claimAutoreleasedReturnValue();

            if (v124)
            {
              -[TCKDatabase tFetchZoneChangesHandler](v209, "tFetchZoneChangesHandler");
              v125 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v221[0] = MEMORY[0x1E0C809B0];
              v221[1] = 3221225472;
              v221[2] = __28__TCKDatabase_addOperation___block_invoke_7;
              v221[3] = &unk_1E463D338;
              v222 = v84;
              v223 = v123;
              ((void (**)(_QWORD, uint64_t, _QWORD *))v125)[2](v125, v123, v221);

            }
          }
          v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v224, v284, 16);
        }
        while (v120);
      }

      objc_msgSend(v84, "fetchRecordZoneChangesCompletionBlock");
      v126 = (void *)objc_claimAutoreleasedReturnValue();

      if (v126)
      {
        objc_msgSend(v84, "fetchRecordZoneChangesCompletionBlock");
        v96 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v96[2](v96, 0);
        v4 = v199;
        v7 = MEMORY[0x1E0C809B0];
        goto LABEL_76;
      }
      v4 = v199;
      v7 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v219 = 0uLL;
      v220 = 0uLL;
      v217 = 0uLL;
      v218 = 0uLL;
      objc_msgSend(v84, "recordZoneIDs");
      v201 = (id)objc_claimAutoreleasedReturnValue();
      obja = (id)objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v217, v283, 16);
      if (obja)
      {
        v204 = *(_QWORD *)v218;
        do
        {
          for (mm = 0; mm != obja; mm = (char *)mm + 1)
          {
            if (*(_QWORD *)v218 != v204)
              objc_enumerationMutation(v201);
            v175 = *(_QWORD *)(*((_QWORD *)&v217 + 1) + 8 * (_QWORD)mm);
            v176 = v209->_recordsByID;
            v216[0] = v7;
            v216[1] = 3221225472;
            v216[2] = __28__TCKDatabase_addOperation___block_invoke_8;
            v216[3] = &unk_1E46476F0;
            v216[4] = v175;
            -[NSMutableDictionary keysOfEntriesPassingTest:](v176, "keysOfEntriesPassingTest:", v216);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            v212 = 0u;
            v213 = 0u;
            v214 = 0u;
            v215 = 0u;
            v178 = v177;
            v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v212, v282, 16);
            if (v179)
            {
              v180 = v179;
              v181 = *(_QWORD *)v213;
              do
              {
                for (nn = 0; nn != v180; ++nn)
                {
                  if (*(_QWORD *)v213 != v181)
                    objc_enumerationMutation(v178);
                  v183 = *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * nn);
                  objc_msgSend(v84, "recordChangedBlock");
                  v184 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v184)
                  {
                    objc_msgSend(v84, "recordChangedBlock");
                    v185 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary objectForKeyedSubscript:](v209->_recordsByID, "objectForKeyedSubscript:", v183);
                    v186 = (void *)objc_claimAutoreleasedReturnValue();
                    ((void (**)(_QWORD, void *))v185)[2](v185, v186);

                  }
                }
                v180 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v212, v282, 16);
              }
              while (v180);
            }

            objc_msgSend(v84, "recordZoneFetchCompletionBlock");
            v187 = (void *)objc_claimAutoreleasedReturnValue();

            if (v187)
            {
              objc_msgSend(v84, "recordZoneFetchCompletionBlock");
              v188 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v189 = (void *)objc_opt_new();
              ((void (**)(_QWORD, uint64_t, _QWORD, void *, _QWORD, _QWORD))v188)[2](v188, v175, 0, v189, 0, 0);

            }
            v7 = MEMORY[0x1E0C809B0];
          }
          obja = (id)objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v217, v283, 16);
        }
        while (obja);
      }

      objc_msgSend(v84, "fetchRecordZoneChangesCompletionBlock");
      v190 = (void *)objc_claimAutoreleasedReturnValue();

      if (v190)
      {
        objc_msgSend(v84, "fetchRecordZoneChangesCompletionBlock");
        v96 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v97 = (void (*)(void))v96[2];
        goto LABEL_75;
      }
      v4 = v199;
    }
    v26 = v195;
    v55 = v198;
    v60 = v207;
    goto LABEL_78;
  }
  -[TCKDatabase tFetchRecordZoneChangesOperationHandler](v209, "tFetchRecordZoneChangesOperationHandler");
  v96 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v97 = (void (*)(void))v96[2];
LABEL_75:
  v97();
  v4 = v199;
LABEL_76:
  v26 = v195;
  v60 = v207;

  v55 = v198;
LABEL_78:
  objc_opt_class();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v98 = v4;
    -[TCKDatabase tFetchDatabaseChangesHandler](self, "tFetchDatabaseChangesHandler");
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (v99)
    {
      -[TCKDatabase tFetchDatabaseChangesHandler](self, "tFetchDatabaseChangesHandler");
      v100 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v210[0] = v7;
      v210[1] = 3221225472;
      v210[2] = __28__TCKDatabase_addOperation___block_invoke_9;
      v210[3] = &unk_1E463D6B8;
      v211 = v98;
      ((void (**)(_QWORD, _QWORD *))v100)[2](v100, v210);

    }
    objc_opt_class();
  }
  else
  {
    objc_opt_class();
    v98 = 0;
    if (!v4)
      goto LABEL_88;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_88:
    objc_opt_class();
    v101 = 0;
    if (!v4)
      goto LABEL_95;
    goto LABEL_89;
  }
  v101 = v4;
  objc_msgSend(v101, "fetchSubscriptionCompletionBlock");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    objc_msgSend(v101, "fetchSubscriptionCompletionBlock");
    v103 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 11, 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v103)[2](v103, 0, v104);

    v60 = v207;
  }
  objc_opt_class();
LABEL_89:
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v105 = v4;
    -[TCKDatabase tSavedSubscriptions](self, "tSavedSubscriptions");
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v106)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[TCKDatabase setTSavedSubscriptions:](self, "setTSavedSubscriptions:", v107);

    }
    -[TCKDatabase tSavedSubscriptions](self, "tSavedSubscriptions");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "subscriptionsToSave");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "addObjectsFromArray:", v109);

    objc_msgSend(v105, "modifySubscriptionsCompletionBlock");
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (v110)
    {
      objc_msgSend(v105, "modifySubscriptionsCompletionBlock");
      v111 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "subscriptionsToSave");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "subscriptionIDsToDelete");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v111)[2](v111, v112, v113, 0);

    }
    objc_opt_class();
    v60 = v207;
    goto LABEL_96;
  }
LABEL_95:
  objc_opt_class();
  v105 = 0;
  if (!v4)
  {
LABEL_100:
    v114 = 0;
    goto LABEL_101;
  }
LABEL_96:
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_100;
  v114 = v4;
  v115 = MEMORY[0x1E0C81028];
  v116 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
  {
    v191 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CKQueryOperation is not supported"));
    *(_DWORD *)buf = 136315906;
    v275 = "-[TCKDatabase addOperation:]";
    v276 = 2080;
    v277 = "TCKDatabase.m";
    v278 = 1024;
    v279 = 299;
    v280 = 2114;
    v281 = v191;
    v60 = v207;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_101:

}

void __28__TCKDatabase_addOperation___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)a1[4];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v16, 1);
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  v11 = (void *)a1[5];
  objc_msgSend(v16, "valueForKeyPath:", CFSTR("recordID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  v13 = (void *)a1[6];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v7, 1);
  objc_msgSend(v13, "addObjectsFromArray:", v14);

  v15 = a1[7];
  if (v15)
    (*(void (**)(uint64_t, id, id, id))(v15 + 16))(v15, v16, v7, v8);

}

void __28__TCKDatabase_addOperation___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        objc_msgSend(*(id *)(a1 + 32), "perRecordCompletionBlock");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "perRecordCompletionBlock");
          v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v16[2](v16, v14, 0);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "modifyRecordsCompletionBlock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "modifyRecordsCompletionBlock");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v18)[2](v18, v7, v8, v9);

  }
}

void __28__TCKDatabase_addOperation___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(id, id, id, id);

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v6, "modifyRecordZonesCompletionBlock");
  v10 = (void (**)(id, id, id, id))objc_claimAutoreleasedReturnValue();
  v10[2](v10, v9, v8, v7);

}

uint64_t __28__TCKDatabase_addOperation___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __28__TCKDatabase_addOperation___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void (**v7)(id, id, id);

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "fetchRecordZonesCompletionBlock");
  v7 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6, v5);

}

void __28__TCKDatabase_addOperation___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "tFetchedRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(v5, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:copyItems:", v9, 1);
  objc_msgSend(v7, "addObjectsFromArray:", v10);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
        objc_msgSend(*(id *)(a1 + 40), "perRecordCompletionBlock", (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(*(id *)(a1 + 40), "perRecordCompletionBlock");
          v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, uint64_t, id))v18)[2](v18, v19, v16, v6);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 40), "fetchRecordsCompletionBlock");
  v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))v20)[2](v20, v11, v6);

}

void __28__TCKDatabase_addOperation___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v13);
        objc_msgSend(*(id *)(a1 + 32), "recordChangedBlock");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "recordChangedBlock");
          v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v16[2](v16, v14);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21);
        objc_msgSend(*(id *)(a1 + 32), "recordWithIDWasDeletedBlock", (_QWORD)v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(*(id *)(a1 + 32), "recordWithIDWasDeletedBlock");
          v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, const __CFString *))v24)[2](v24, v22, CFSTR("UNKNOWN_RECORD_TYPE"));

        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v19);
  }

  objc_msgSend(*(id *)(a1 + 32), "recordZoneFetchCompletionBlock");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(*(id *)(a1 + 32), "recordZoneFetchCompletionBlock");
    v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 40);
    v28 = (void *)objc_opt_new();
    ((void (**)(_QWORD, uint64_t, _QWORD, void *, BOOL, id))v26)[2](v26, v27, 0, v28, v9 != 0, v9);

  }
}

uint64_t __28__TCKDatabase_addOperation___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __28__TCKDatabase_addOperation___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v13);
        objc_msgSend(*(id *)(a1 + 32), "recordZoneWithIDChangedBlock");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "recordZoneWithIDChangedBlock");
          v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v16[2](v16, v14);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21);
        objc_msgSend(*(id *)(a1 + 32), "recordZoneWithIDWasDeletedBlock", (_QWORD)v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(*(id *)(a1 + 32), "recordZoneWithIDWasDeletedBlock");
          v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v24[2](v24, v22);

        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  objc_msgSend(*(id *)(a1 + 32), "fetchDatabaseChangesCompletionBlock");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchDatabaseChangesCompletionBlock");
    v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, id))v26)[2](v26, 0, 0, v9);

  }
}

- (void)addRecord:(id)a3
{
  NSMutableDictionary *recordsByID;
  id v4;
  id v5;

  recordsByID = self->_recordsByID;
  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](recordsByID, "setObject:forKeyedSubscript:", v4, v5);

}

- (id)recordIDsInZoneName:(id)a3
{
  id v4;
  NSMutableDictionary *recordsByID;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  recordsByID = self->_recordsByID;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__TCKDatabase_recordIDsInZoneName___block_invoke;
  v9[3] = &unk_1E46476F0;
  v10 = v4;
  v6 = v4;
  -[NSMutableDictionary keysOfEntriesPassingTest:](recordsByID, "keysOfEntriesPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __35__TCKDatabase_recordIDsInZoneName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)recordWithID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", a3);
}

- (CKRecord)sentinelRecord
{
  void *v3;
  void *v4;

  +[CKRecordID fc_staticSentinelRecordID]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCKDatabase recordWithID:](self, "recordWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecord *)v4;
}

- (CKRecord)secureSentinelRecord
{
  void *v3;
  void *v4;

  +[CKRecordID fc_staticSecureSentinelRecordID]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCKDatabase recordWithID:](self, "recordWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecord *)v4;
}

- (NSMutableArray)tQueriedRecordTypes
{
  return self->_tQueriedRecordTypes;
}

- (void)setTQueriedRecordTypes:(id)a3
{
  objc_storeStrong((id *)&self->_tQueriedRecordTypes, a3);
}

- (NSMutableArray)tQueriedRecordZonesNames
{
  return self->_tQueriedRecordZonesNames;
}

- (void)setTQueriedRecordZonesNames:(id)a3
{
  objc_storeStrong((id *)&self->_tQueriedRecordZonesNames, a3);
}

- (NSMutableArray)tFetchedRecords
{
  return self->_tFetchedRecords;
}

- (void)setTFetchedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_tFetchedRecords, a3);
}

- (NSMutableArray)tFetchedChangedRecordZoneNames
{
  return self->_tFetchedChangedRecordZoneNames;
}

- (void)setTFetchedChangedRecordZoneNames:(id)a3
{
  objc_storeStrong((id *)&self->_tFetchedChangedRecordZoneNames, a3);
}

- (NSMutableArray)tQueriedRecords
{
  return self->_tQueriedRecords;
}

- (void)setTQueriedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_tQueriedRecords, a3);
}

- (NSMutableArray)tSavedRecords
{
  return self->_tSavedRecords;
}

- (void)setTSavedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_tSavedRecords, a3);
}

- (NSMutableSet)tSavedRecordIDs
{
  return self->_tSavedRecordIDs;
}

- (void)setTSavedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_tSavedRecordIDs, a3);
}

- (NSMutableArray)tSavedZones
{
  return self->_tSavedZones;
}

- (void)setTSavedZones:(id)a3
{
  objc_storeStrong((id *)&self->_tSavedZones, a3);
}

- (NSMutableArray)tDeletedZoneIDs
{
  return self->_tDeletedZoneIDs;
}

- (void)setTDeletedZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_tDeletedZoneIDs, a3);
}

- (NSMutableArray)tDeletedRecordIDs
{
  return self->_tDeletedRecordIDs;
}

- (void)setTDeletedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_tDeletedRecordIDs, a3);
}

- (NSMutableArray)tSavedSubscriptions
{
  return self->_tSavedSubscriptions;
}

- (void)setTSavedSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_tSavedSubscriptions, a3);
}

- (id)tQueryHandler
{
  return self->_tQueryHandler;
}

- (void)setTQueryHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)tFetchRecordsHandler
{
  return self->_tFetchRecordsHandler;
}

- (void)setTFetchRecordsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)tModifyRecordsOperationHandler
{
  return self->_tModifyRecordsOperationHandler;
}

- (void)setTModifyRecordsOperationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)tModifyRecordsHandler
{
  return self->_tModifyRecordsHandler;
}

- (void)setTModifyRecordsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)tFetchZonesHandler
{
  return self->_tFetchZonesHandler;
}

- (void)setTFetchZonesHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)tModifyZonesHandler
{
  return self->_tModifyZonesHandler;
}

- (void)setTModifyZonesHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)tFetchZoneChangesHandler
{
  return self->_tFetchZoneChangesHandler;
}

- (void)setTFetchZoneChangesHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)tFetchRecordZoneChangesOperationHandler
{
  return self->_tFetchRecordZoneChangesOperationHandler;
}

- (void)setTFetchRecordZoneChangesOperationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)tFetchDatabaseChangesHandler
{
  return self->_tFetchDatabaseChangesHandler;
}

- (void)setTFetchDatabaseChangesHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSMutableDictionary)recordsByID
{
  return self->_recordsByID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByID, 0);
  objc_storeStrong(&self->_tFetchDatabaseChangesHandler, 0);
  objc_storeStrong(&self->_tFetchRecordZoneChangesOperationHandler, 0);
  objc_storeStrong(&self->_tFetchZoneChangesHandler, 0);
  objc_storeStrong(&self->_tModifyZonesHandler, 0);
  objc_storeStrong(&self->_tFetchZonesHandler, 0);
  objc_storeStrong(&self->_tModifyRecordsHandler, 0);
  objc_storeStrong(&self->_tModifyRecordsOperationHandler, 0);
  objc_storeStrong(&self->_tFetchRecordsHandler, 0);
  objc_storeStrong(&self->_tQueryHandler, 0);
  objc_storeStrong((id *)&self->_tSavedSubscriptions, 0);
  objc_storeStrong((id *)&self->_tDeletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_tDeletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_tSavedZones, 0);
  objc_storeStrong((id *)&self->_tSavedRecordIDs, 0);
  objc_storeStrong((id *)&self->_tSavedRecords, 0);
  objc_storeStrong((id *)&self->_tQueriedRecords, 0);
  objc_storeStrong((id *)&self->_tFetchedChangedRecordZoneNames, 0);
  objc_storeStrong((id *)&self->_tFetchedRecords, 0);
  objc_storeStrong((id *)&self->_tQueriedRecordZonesNames, 0);
  objc_storeStrong((id *)&self->_tQueriedRecordTypes, 0);
}

@end
