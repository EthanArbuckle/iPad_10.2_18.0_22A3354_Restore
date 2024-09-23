@implementation NTPBTodaySectionConfig(FCAdditions)

+ (id)sectionConfigWithJSONDictionary:()FCAdditions
{
  id v3;
  id v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  BOOL v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  BOOL v36;
  char v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  id v48;
  BOOL v49;
  char v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  BOOL v55;
  char v56;
  void *v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  unsigned int v64;
  uint64_t v65;
  NSObject *v66;
  id v67;
  BOOL v68;
  char v69;
  void *v70;
  unsigned int v71;
  uint64_t v72;
  NSObject *v73;
  id v74;
  BOOL v75;
  char v76;
  void *v77;
  void *v78;
  NSObject *v79;
  id v80;
  BOOL v81;
  char v82;
  void *v83;
  uint64_t v84;
  NSObject *v85;
  id v86;
  BOOL v87;
  char v88;
  void *v89;
  int v90;
  uint64_t v91;
  NSObject *v92;
  id v93;
  BOOL v94;
  char v95;
  uint64_t v96;
  void *v97;
  void *v98;
  int v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  id v105;
  BOOL v106;
  char v107;
  void *v108;
  void *v109;
  NSObject *v110;
  id v111;
  BOOL v112;
  char v113;
  uint64_t v114;
  NSObject *v115;
  id v116;
  BOOL v117;
  char v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  id v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  NSObject *v141;
  id v142;
  NSObject *v143;
  BOOL v144;
  char v145;
  uint64_t v146;
  NSObject *v147;
  id v148;
  NSObject *v149;
  BOOL v150;
  char v151;
  void *v152;
  void *v153;
  NSObject *v154;
  id v155;
  BOOL v156;
  char v157;
  void *v158;
  void *v159;
  NSObject *v160;
  id v161;
  BOOL v162;
  char v163;
  void *v164;
  void *v165;
  id v166;
  BOOL v167;
  char v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t i;
  uint64_t v173;
  NSObject *v174;
  id v175;
  BOOL v176;
  char v177;
  void *v178;
  NSObject *v179;
  id v180;
  BOOL v181;
  char v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  id v208;
  void *v209;
  void *v210;
  id v211;
  id v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  id v217;
  id v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  id v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  _QWORD v230[4];
  id v231;
  uint64_t *v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  uint64_t v237;
  uint64_t *v238;
  uint64_t v239;
  char v240;
  _BYTE v241[128];
  uint64_t v242;

  v242 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v227 = v3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C918]);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v229, "objectForKeyedSubscript:", *MEMORY[0x24BE6C920]);
    v5 = objc_claimAutoreleasedReturnValue();
    v228 = (void *)v5;
    if (v229)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1500], "dateFormatterWithFormat:forReuse:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateFromString:", v228);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "fc_isLaterThan:", v8);

        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDBCE70], "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v229, v4);
          v11 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v11;
        }
      }

    }
    v12 = (void *)objc_opt_new();
    v237 = 0;
    v238 = &v237;
    v239 = 0x2020000000;
    v240 = 1;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C868]);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdentifier:", v13);
    v210 = (void *)v13;
    if (!v13)
    {
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.38((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires identifier")));

      v13 = 0;
    }
    if (v13)
      v16 = *((_BYTE *)v238 + 24) == 0;
    else
      v16 = 1;
    v17 = !v16;
    *((_BYTE *)v238 + 24) = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C940]);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSubidentifier:", v18);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C898]);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setName:", v19);
    v226 = (void *)v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C808]);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v19 = v20;
    objc_msgSend(v12, "setCompactName:", v19);
    v207 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C910]);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = v22;
    else
      v24 = v19;
    objc_msgSend(v12, "setReferralBarName:", v24);
    v206 = v23;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C890]);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNameColorLight:", v25);
    v209 = (void *)v25;
    if (!v25)
    {
      v26 = MEMORY[0x24BDACB70];
      v27 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.37((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires name color light")));

      v25 = 0;
    }
    v205 = (void *)v18;
    if (v25)
      v28 = *((_BYTE *)v238 + 24) == 0;
    else
      v28 = 1;
    v29 = !v28;
    *((_BYTE *)v238 + 24) = v29;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C888]);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v30)
      v32 = (void *)v30;
    else
      v32 = (void *)v25;
    v225 = v32;

    objc_msgSend(v12, "setNameColorDark:", v225);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C948]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      v34 = MEMORY[0x24BDACB70];
      v35 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.36((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires a section type")));

      v33 = 0;
    }
    if (v33)
      v36 = *((_BYTE *)v238 + 24) == 0;
    else
      v36 = 1;
    v37 = !v36;
    *((_BYTE *)v238 + 24) = v37;
    v38 = objc_msgSend(v33, "intValue");
    v39 = v38;
    v40 = v38;
    v204 = v33;
    if (v33)
    {
      v41 = 0;
      v42 = 0;
      switch((int)v38)
      {
        case 0:
        case 1:
        case 3:
        case 4:
        case 5:
        case 6:
          v42 = 1;
          v41 = v38;
          break;
        case 2:
          break;
        default:
          v42 = 0;
          break;
      }
      objc_msgSend(v12, "setSectionType:", v41);
      if (*((_BYTE *)v238 + 24))
        v43 = v42;
      else
        v43 = 0;
      *((_BYTE *)v238 + 24) = v43;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C810]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
    {
      objc_msgSend(v12, "setFallbackOrder:", objc_msgSend(v44, "integerValue"));
    }
    else
    {
      v47 = MEMORY[0x24BDACB70];
      v48 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.35((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires fallback order")));

      v45 = 0;
    }
    v203 = v45;
    if (v45)
      v49 = *((_BYTE *)v238 + 24) == 0;
    else
      v49 = 1;
    v50 = !v49;
    *((_BYTE *)v238 + 24) = v50;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C800]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
    {
      objc_msgSend(v12, "setCachedResultCutoffTime:", objc_msgSend(v51, "unsignedIntegerValue"));
    }
    else
    {
      v53 = MEMORY[0x24BDACB70];
      v54 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.34((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires cached result cutoff time")));

      v52 = 0;
    }
    v202 = v52;
    if (v52)
      v55 = *((_BYTE *)v238 + 24) == 0;
    else
      v55 = 1;
    v56 = !v55;
    *((_BYTE *)v238 + 24) = v56;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C878]);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = v57;
    if (v57)
      v58 = objc_msgSend(v57, "integerValue");
    else
      v58 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v12, "setMinimumStoriesAllocation:", v58);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C870]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v223 = v59;
    if (v59)
    {
      v60 = objc_msgSend(v59, "integerValue");
      v61 = objc_msgSend(v12, "minimumStoriesAllocation");
      if (v60 <= v61)
        v62 = v61;
      else
        v62 = v60;
    }
    else
    {
      v62 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(v12, "setMaximumStoriesAllocation:", v62);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C908]);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v222 = v63;
    if (v63)
    {
      v64 = objc_msgSend(v63, "intValue");
      if (v64 >= 2)
        v65 = 2;
      else
        v65 = v64;
      objc_msgSend(v12, "setReadArticlesFilterMethod:", v65);
    }
    else
    {
      v66 = MEMORY[0x24BDACB70];
      v67 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.33((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires a read stories filter method")));

    }
    if (v222)
      v68 = *((_BYTE *)v238 + 24) == 0;
    else
      v68 = 1;
    v69 = !v68;
    *((_BYTE *)v238 + 24) = v69;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C928]);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = v70;
    if (v70)
    {
      v71 = objc_msgSend(v70, "intValue");
      if (v71 >= 3)
        v72 = 0;
      else
        v72 = v71;
      objc_msgSend(v12, "setSeenArticlesFilterMethod:", v72);
    }
    else
    {
      v73 = MEMORY[0x24BDACB70];
      v74 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.32((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires seen stories filter method")));

      LODWORD(v72) = 0;
    }
    if (v221)
      v75 = *((_BYTE *)v238 + 24) == 0;
    else
      v75 = 1;
    v76 = !v75;
    *((_BYTE *)v238 + 24) = v76;
    if ((_DWORD)v72)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C930]);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v77;
      if (v77)
      {
        objc_msgSend(v12, "setSeenArticlesMinimumTimeSinceFirstSeenToFilter:", objc_msgSend(v77, "integerValue"));
      }
      else
      {
        v79 = MEMORY[0x24BDACB70];
        v80 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.31((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires seen stories minimum time to filter when seen stories filter method is not none")));

      }
      if (v78)
        v81 = *((_BYTE *)v238 + 24) == 0;
      else
        v81 = 1;
      v82 = !v81;
      *((_BYTE *)v238 + 24) = v82;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C820]);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = v83;
    if (v83)
    {
      if (objc_msgSend(v83, "BOOLValue"))
        v84 = 4;
      else
        v84 = 0;
    }
    else
    {
      v85 = MEMORY[0x24BDACB70];
      v86 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.30((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires a policy around whether to filter duplicate clusters within the section it describes")));

      v84 = 1;
    }
    if (v220)
      v87 = *((_BYTE *)v238 + 24) == 0;
    else
      v87 = 1;
    v88 = !v87;
    *((_BYTE *)v238 + 24) = v88;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C828]);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = v89;
    if (v89)
    {
      v90 = objc_msgSend(v89, "BOOLValue");
      v91 = 32;
      if (!v90)
        v91 = 0;
      v84 |= v91;
    }
    else
    {
      v92 = MEMORY[0x24BDACB70];
      v93 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.29((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires a policy around whether to filter muted channels within the section it describes")));

    }
    if (v219)
      v94 = *((_BYTE *)v238 + 24) == 0;
    else
      v94 = 1;
    v95 = !v94;
    *((_BYTE *)v238 + 24) = v95;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C838]);
    v96 = objc_claimAutoreleasedReturnValue();
    v97 = (void *)v96;
    v98 = (void *)MEMORY[0x24BDBD1C8];
    if (v96)
      v98 = (void *)v96;
    v218 = v98;

    v99 = objc_msgSend(v218, "BOOLValue");
    v100 = 2048;
    if (!v99)
      v100 = 0;
    objc_msgSend(v12, "setIntraSectionFilteringOptions:", v100 | v84);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C818]);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v101;
    if (v101)
    {
      if (objc_msgSend(v101, "BOOLValue"))
        v103 = 4;
      else
        v103 = 0;
      objc_msgSend(v12, "setInterSectionFilteringOptions:", v103);
    }
    else
    {
      v104 = MEMORY[0x24BDACB70];
      v105 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.28((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires a policy around whether to filter duplicate clusters across sections for the section it describes")));

      v102 = 0;
    }
    v201 = v102;
    if (v102)
      v106 = *((_BYTE *)v238 + 24) == 0;
    else
      v106 = 1;
    v107 = !v106;
    *((_BYTE *)v238 + 24) = v107;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C938]);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v108;
    if (v108)
    {
      objc_msgSend(v12, "setShownInFavoritesOnlyMode:", objc_msgSend(v108, "BOOLValue"));
    }
    else
    {
      v110 = MEMORY[0x24BDACB70];
      v111 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.27((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires a policy around whether to shown the section it describes in Favorites-only mode")));

      v109 = 0;
    }
    v200 = v109;
    if (v109)
      v112 = *((_BYTE *)v238 + 24) == 0;
    else
      v112 = 1;
    v113 = !v112;
    *((_BYTE *)v238 + 24) = v113;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8A0]);
    v114 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPersonalizationFeatureID:", v114);
    if (!v114)
    {
      v115 = MEMORY[0x24BDACB70];
      v116 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.26((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires a personalization feature ID")));

      v114 = 0;
    }
    v216 = (void *)v114;
    if (v114)
      v117 = *((_BYTE *)v238 + 24) == 0;
    else
      v117 = 1;
    v118 = !v117;
    *((_BYTE *)v238 + 24) = v118;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8C8]);
    v119 = objc_claimAutoreleasedReturnValue();
    v120 = (void *)v119;
    if (v119)
      v121 = (void *)v119;
    else
      v121 = &unk_24DB6EB90;
    v217 = v121;

    objc_msgSend(v12, "setPersonalizedPresenceFeatureImpressionPrior:", objc_msgSend(v217, "unsignedIntegerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8B8]);
    v122 = objc_claimAutoreleasedReturnValue();
    v123 = (void *)v122;
    if (v122)
      v124 = (void *)v122;
    else
      v124 = &unk_24DB6EB90;
    v215 = v124;

    objc_msgSend(v12, "setPersonalizedPresenceFeatureClickPrior:", objc_msgSend(v215, "unsignedIntegerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8C0]);
    v125 = objc_claimAutoreleasedReturnValue();
    v126 = (void *)v125;
    if (v125)
      v127 = (void *)v125;
    else
      v127 = v216;
    objc_msgSend(v12, "setPersonalizedPresenceFeatureID:", v127);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8F0]);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v199, "BOOLValue");
    objc_msgSend(v12, "setPresenceDeterminedByPersonalization:", v128);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C830]);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilterNonSubscribedInFavoritesOnlyMode:", objc_msgSend(v198, "BOOLValue"));
    if ((_DWORD)v128)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8D0]);
      v129 = objc_claimAutoreleasedReturnValue();
      v130 = (void *)v129;
      v131 = &unk_24DB6EBB0;
      if (v129)
        v131 = (void *)v129;
      v132 = v131;

      v133 = objc_msgSend(v132, "intValue");
      if (v133 < 2)
      {
        v134 = (void *)objc_opt_new();
        objc_msgSend(v134, "setPersonalizationMethod:", v133);
        if ((_DWORD)v133)
        {
          v135 = (void *)objc_opt_new();
          objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8E0]);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = v136;
          if (v136)
          {
            objc_msgSend(v136, "doubleValue");
            objc_msgSend(v135, "setScalar:");
          }
          else
          {
            v139 = v135;
            v140 = v40;
            v141 = MEMORY[0x24BDACB70];
            v142 = MEMORY[0x24BDACB70];
            v143 = v141;
            v40 = v140;
            v135 = v139;
            if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.25((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config needs a scalar whenever the section's presence is determined by Personalization")));

          }
          if (v137)
            v144 = *((_BYTE *)v238 + 24) == 0;
          else
            v144 = 1;
          v145 = !v144;
          *((_BYTE *)v238 + 24) = v145;
          objc_msgSend(v134, "setRelativeConfig:", v135);
        }
        else
        {
          v135 = (void *)objc_opt_new();
          objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8B0]);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = v138;
          if (v138)
          {
            objc_msgSend(v138, "doubleValue");
            objc_msgSend(v135, "setCTRToShow:");
          }
          else
          {
            v146 = v40;
            v147 = MEMORY[0x24BDACB70];
            v148 = MEMORY[0x24BDACB70];
            v149 = v147;
            v40 = v146;
            if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.24((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config needs a CTR to show whenever the section's presence is determined by Personalization")));

          }
          if (v137)
            v150 = *((_BYTE *)v238 + 24) == 0;
          else
            v150 = 1;
          v151 = !v150;
          *((_BYTE *)v238 + 24) = v151;
          objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8A8]);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = v152;
          if (v152)
          {
            objc_msgSend(v152, "doubleValue");
            objc_msgSend(v135, "setCTRToHide:");
          }
          else
          {
            v154 = MEMORY[0x24BDACB70];
            v155 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.23((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config needs a CTR to hide whenever the section's presence is determined by Personalization")));

            v153 = 0;
          }
          v213 = v153;
          if (v153)
            v156 = *((_BYTE *)v238 + 24) == 0;
          else
            v156 = 1;
          v157 = !v156;
          *((_BYTE *)v238 + 24) = v157;
          objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8D8]);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = v158;
          if (v158)
          {
            objc_msgSend(v158, "doubleValue");
            objc_msgSend(v135, "setMinProbabilityToShow:");
          }
          else
          {
            v160 = MEMORY[0x24BDACB70];
            v161 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.22((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config needs a minimum probability to show whenever the section's presence is determined by Personalization")));

          }
          if (v159)
            v162 = *((_BYTE *)v238 + 24) == 0;
          else
            v162 = 1;
          v163 = !v162;
          *((_BYTE *)v238 + 24) = v163;
          objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8E8]);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          v165 = v164;
          if (v164)
          {
            objc_msgSend(v135, "setSectionEdition:", objc_msgSend(v164, "unsignedIntegerValue"));
          }
          else
          {
            v166 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.21((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config needs a section edition whenever the section's presence is determined by Personalization")));

          }
          if (v165)
            v167 = *((_BYTE *)v238 + 24) == 0;
          else
            v167 = 1;
          v168 = !v167;
          *((_BYTE *)v238 + 24) = v168;
          objc_msgSend(v134, "setAbsoluteConfig:", v135);

        }
        objc_msgSend(v12, "setPersonalizedPresenceConfig:", v134);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C900]);
    v235 = 0u;
    v236 = 0u;
    v233 = 0u;
    v234 = 0u;
    v169 = (id)objc_claimAutoreleasedReturnValue();
    v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v233, v241, 16);
    if (v170)
    {
      v171 = *(_QWORD *)v234;
      do
      {
        for (i = 0; i != v170; ++i)
        {
          if (*(_QWORD *)v234 != v171)
            objc_enumerationMutation(v169);
          objc_msgSend(v12, "addQueueMembership:", objc_msgSend(*(id *)(*((_QWORD *)&v233 + 1) + 8 * i), "unsignedIntegerValue"));
        }
        v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v233, v241, 16);
      }
      while (v170);
    }

    v173 = objc_msgSend(v169, "count");
    if (!v173)
    {
      v174 = MEMORY[0x24BDACB70];
      v175 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.20((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires queue memberships")));

    }
    if (v173)
      v176 = *((_BYTE *)v238 + 24) == 0;
    else
      v176 = 1;
    v177 = !v176;
    *((_BYTE *)v238 + 24) = v177;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C840]);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = v178;
    if (v178)
    {
      objc_msgSend(v12, "setGlanceable:", objc_msgSend(v178, "BOOLValue"));
    }
    else
    {
      v179 = MEMORY[0x24BDACB70];
      v180 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.19((void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section config requires glanceability")));

    }
    if (v214)
      v181 = *((_BYTE *)v238 + 24) == 0;
    else
      v181 = 1;
    v182 = !v181;
    *((_BYTE *)v238 + 24) = v182;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C848]);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGroupActionTitle:", v183);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C850]);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGroupActionUrl:", v184);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C860]);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGroupNameActionUrl:", v185);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C7F8]);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColorLight:", v186);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C7F0]);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColorDark:", v187);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C858]);
    v188 = objc_claimAutoreleasedReturnValue();
    v189 = (void *)v188;
    v190 = (void *)MEMORY[0x24BDBD1A8];
    if (v188)
      v190 = (void *)v188;
    v212 = v190;

    v191 = (void *)objc_opt_new();
    v230[0] = MEMORY[0x24BDAC760];
    v230[1] = 3221225472;
    v230[2] = __71__NTPBTodaySectionConfig_FCAdditions__sectionConfigWithJSONDictionary___block_invoke;
    v230[3] = &unk_24DB5E770;
    v208 = v191;
    v231 = v208;
    v232 = &v237;
    objc_msgSend(v212, "enumerateObjectsUsingBlock:", v230);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C8F8]);
    v192 = objc_claimAutoreleasedReturnValue();
    v193 = (void *)v192;
    v194 = &unk_24DB6EBB0;
    if (v192)
      v194 = (void *)v192;
    v211 = v194;

    objc_msgSend(v12, "setPromotionCriterion:", objc_msgSend(v211, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6C880]);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMutingTagID:", v195);

    if (v39 <= 6)
      __asm { BR              X9 }
    if (*((_BYTE *)v238 + 24))
      v46 = v12;
    else
      v46 = 0;

    _Block_object_dispose(&v237, 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.1();
    v46 = 0;
  }
  v196 = v46;

  return v196;
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.1()
{
  void *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "JSONDictionary");
  v1[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v1);

  OUTLINED_FUNCTION_2();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.2(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 607);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.3(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 598);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.4(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 590);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.5(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 575);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.6(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 669);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.7(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 661);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.8(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 646);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.9(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 686);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.10(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 703);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.11(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 698);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.12(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 752);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.13(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 739);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.14(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 734);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.15(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 725);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.16(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 720);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.17(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 770);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.18(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 765);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.19(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 518);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.20(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 509);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.21(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 475);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.22(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 466);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.23(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 457);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.24(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 448);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.25(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 491);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.26(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 393);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.27(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 387);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.28(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 378);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.29(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 364);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.30(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 355);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.31(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 343);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.32(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 332);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.33(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 308);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.34(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 261);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.35(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 252);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.36(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 200);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.37(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 192);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.38(void *a1)
{
  _DWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_5_0(a1);
  *v1 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_0((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_1_1(v3, 174);
  OUTLINED_FUNCTION_0_2(&dword_2197E6000, MEMORY[0x24BDACB70], v4, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");

  OUTLINED_FUNCTION_6();
}

@end
