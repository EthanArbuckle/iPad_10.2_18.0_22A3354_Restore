@implementation ARPHomeControlSuggester

+ (id)suggester
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithScoreThresholdForMicrolocationSuggestionsConsidered:highScoreThresholdForMicroLocationSuggestionMerge:lowScoreThresholdForMicroLocationSuggestionMerge:highScoreThresholdForTimeBasedSuggestionMerge:lowScoreThresholdForTimeBasedSuggestionMerge:", 0.1, 0.4, 0.2, 0.3, 0.2);
}

- (ARPHomeControlSuggester)initWithScoreThresholdForMicrolocationSuggestionsConsidered:(double)a3 highScoreThresholdForMicroLocationSuggestionMerge:(double)a4 lowScoreThresholdForMicroLocationSuggestionMerge:(double)a5 highScoreThresholdForTimeBasedSuggestionMerge:(double)a6 lowScoreThresholdForTimeBasedSuggestionMerge:(double)a7
{
  ARPHomeControlSuggester *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ARPHomeControlSuggester;
  result = -[ARPHomeControlSuggester init](&v13, sel_init);
  if (result)
  {
    result->_scoreThresholdForMicrolocationSuggestionsConsidered = a3;
    result->_highScoreThresholdForMicroLocationSuggestionMerge = a4;
    result->_lowScoreThresholdForMicroLocationSuggestionMerge = a5;
    result->_highScoreThresholdForTimeBasedSuggestionMerge = a6;
    result->_lowScoreThresholdForTimeBasedSuggestionMerge = a7;
    result->_scoreSceneBoost = 0.0;
  }
  return result;
}

- (id)suggestionsWithMaxSuggestions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultCorrelationsSessionFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggester suggestionsWithMaxSuggestions:referenceDate:correlationsFile:](self, "suggestionsWithMaxSuggestions:referenceDate:correlationsFile:", a3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)suggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 correlationsFile:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  unint64_t v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  double v83;
  uint64_t v84;
  uint64_t n;
  unint64_t v86;
  unint64_t v87;
  id v88;
  NSObject *v89;
  unint64_t v90;
  unint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *oslog;
  ARPHomeControlSuggester *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  unint64_t v106;
  id obj;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint8_t buf[4];
  void *v129;
  __int16 v130;
  void *v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[ARPHomeControlSuggester timeBasedSuggestionsWithMaxSuggestions:referenceDate:fallBackToFrequency:](self, "timeBasedSuggestionsWithMaxSuggestions:referenceDate:fallBackToFrequency:", a3, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ARPHomeControlLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v129 = v12;
    _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "Total suggestions from time-bucketing = %@", buf, 0xCu);

  }
  -[ARPHomeControlSuggester microlocationBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:](self, "microlocationBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:", a3, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v129 = v14;
    _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "Total suggestions from micro-locations = %@", buf, 0xCu);

  }
  v104 = v13;

  -[ARPHomeControlSuggester homeKitEventsSortedByStartDate](self, "homeKitEventsSortedByStartDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggester frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:](self, "frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:", a3, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v129 = v17;
    _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "Total suggestions from frequency MRU = %@", buf, 0xCu);

  }
  v99 = v16;

  v98 = self;
  v106 = a3;
  v102 = v9;
  v103 = v8;
  -[ARPHomeControlSuggester nextActionBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:](self, "nextActionBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:", a3, v8, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v129 = v19;
    _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "Total suggestions from next-action = %@", buf, 0xCu);

  }
  v100 = v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  obj = v10;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v125 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
        objc_msgSend(v25, "setSuggestionReason:", CFSTR("Time-bucket"));
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "objectForKeyedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v29 = v28;
        objc_msgSend(v25, "score");
        objc_msgSend(v26, "numberWithDouble:", v29 + v30 * 2.0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, v25);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
    }
    while (v22);
  }
  oslog = v11;

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v32 = v104;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v121;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v121 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * j);
        objc_msgSend(v37, "setSuggestionReason:", CFSTR("Microlocation"));
        v38 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "objectForKeyedSubscript:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        v41 = v40;
        objc_msgSend(v37, "score");
        objc_msgSend(v38, "numberWithDouble:", v41 + v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v43, v37);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
    }
    while (v34);
  }
  v105 = v32;

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v44 = v100;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v117;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v117 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * k);
        objc_msgSend(v49, "setSuggestionReason:", CFSTR("Next Action"));
        v50 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "objectForKeyedSubscript:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "doubleValue");
        v53 = v52;
        objc_msgSend(v49, "score");
        objc_msgSend(v50, "numberWithDouble:", v53 + v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v55, v49);

      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
    }
    while (v46);
  }
  v101 = v44;

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v56 = v99;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v113;
    do
    {
      for (m = 0; m != v58; ++m)
      {
        if (*(_QWORD *)v113 != v59)
          objc_enumerationMutation(v56);
        v61 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * m);
        objc_msgSend(v61, "setSuggestionReason:", CFSTR("Frequency-MRU"));
        v62 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "objectForKeyedSubscript:", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "doubleValue");
        v65 = v64;
        objc_msgSend(v61, "score");
        objc_msgSend(v62, "numberWithDouble:", v65 + v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v67, v61);

      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
    }
    while (v58);
  }

  objc_msgSend(v20, "keysSortedByValueUsingComparator:", &__block_literal_global_2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "firstObject");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "score");
  v71 = v70;
  objc_msgSend(v68, "lastObject");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "score");
  v74 = v71 - v73;

  if (v74 <= 0.00001)
  {
    -[ARPHomeControlSuggester homeKitEventsSortedByStartDate](v98, "homeKitEventsSortedByStartDate");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v106;
    -[ARPHomeControlSuggester frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:](v98, "frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:", v106, v76, 1);
    v77 = objc_claimAutoreleasedReturnValue();

    v68 = (void *)v77;
  }
  else
  {
    v75 = v106;
  }
  v78 = objc_msgSend(v68, "count");
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v79 = v68;
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v108, v132, 16);
  v81 = v105;
  if (v80)
  {
    v82 = v80;
    v83 = (double)v78 + 1.0;
    v84 = *(_QWORD *)v109;
    do
    {
      for (n = 0; n != v82; ++n)
      {
        if (*(_QWORD *)v109 != v84)
          objc_enumerationMutation(v79);
        objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * n), "setScore:", v83);
        v83 = v83 + -1.0;
      }
      v82 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v108, v132, 16);
    }
    while (v82);
  }

  if (v75)
  {
    v86 = objc_msgSend(v79, "count");
    if (v86 >= v75)
      v87 = v75;
    else
      v87 = v86;
    objc_msgSend(v79, "subarrayWithRange:", 0, v87);
    v88 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "count"))
    {
      ARPLog();
      v89 = objc_claimAutoreleasedReturnValue();
      v90 = 0;
      do
      {
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          v91 = v90 + 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v90 + 1);
          v92 = v88;
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "objectAtIndexedSubscript:", v90);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v129 = v93;
          v130 = 2112;
          v131 = v94;
          _os_log_impl(&dword_1DD793000, v89, OS_LOG_TYPE_DEFAULT, "Home Control Suggestion %@: %@", buf, 0x16u);

          v88 = v92;
          v90 = v91;
        }
        else
        {
          ++v90;
        }

      }
      while (objc_msgSend(v88, "count") > v90);
      v81 = v105;
    }
  }
  else
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v79, "count"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v129 = v95;
      _os_log_impl(&dword_1DD793000, oslog, OS_LOG_TYPE_DEFAULT, "Total Home Control suggestions returned = %@", buf, 0xCu);

    }
    v88 = v79;
  }

  return v88;
}

- (id)frequencybasedSuggestionsWitMaxSuggestions:(unint64_t)a3 events:(id)a4 useScenes:(BOOL)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  double v35;
  int v36;
  double v37;
  void *v38;
  char isKindOfClass;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  char v43;
  char v44;
  ARPHomeControlSuggestion *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  float v50;
  void *v51;
  id v52;
  ARPHomeControlSuggestion *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  char v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t j;
  void *v112;
  void *v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  unint64_t v124;
  unint64_t v125;
  id v126;
  void *v127;
  unint64_t v129;
  unint64_t v130;
  void *v131;
  _BOOL4 v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  uint64_t v149;
  void *v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  uint8_t v159;
  _BYTE v160[15];
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  void *v165;
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _QWORD v169[14];
  _QWORD v170[7];

  v132 = a5;
  v129 = a3;
  v170[5] = *MEMORY[0x1E0C80C00];
  v148 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = *MEMORY[0x1E0D15B68];
  v170[0] = *MEMORY[0x1E0D15B48];
  v170[1] = v6;
  v7 = *MEMORY[0x1E0D15B60];
  v170[2] = *MEMORY[0x1E0D15B58];
  v170[3] = v7;
  v170[4] = *MEMORY[0x1E0D15B50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v137 = (void *)MEMORY[0x1E0C99E60];
  getHMServiceTypeSpeaker();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v169[0] = v10;
  getHMServiceTypeDoorbell();
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v169[1] = v145;
  getHMServiceTypeMicrophone();
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v169[2] = v143;
  getHMServiceTypeTemperatureSensor();
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v169[3] = v141;
  getHMServiceTypeAirQualitySensor();
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v169[4] = v139;
  getHMServiceTypeHumiditySensor();
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v169[5] = v135;
  getHMServiceTypeCarbonMonoxideSensor();
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v169[6] = v133;
  getHMServiceTypeContactSensor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v169[7] = v11;
  getHMServiceTypeLeakSensor();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v169[8] = v12;
  getHMServiceTypeLightSensor();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v169[9] = v13;
  getHMServiceTypeMotionSensor();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v169[10] = v14;
  getHMServiceTypeOccupancySensor();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v169[11] = v15;
  getHMServiceTypeSmokeSensor();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v169[12] = v16;
  getHMServiceTypeCarbonDioxideSensor();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v169[13] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setWithArray:", v18);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v148, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "eventBody");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForKey:", CFSTR("base"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateInterval");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startDate");
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v23 = v148;
  v134 = v9;
  v136 = v23;
  v149 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v161, v168, 16);
  if (!v149)
  {
    v140 = 0;
    v24 = 0;
    v26 = v147;
    goto LABEL_38;
  }
  v140 = 0;
  v24 = 0;
  v25 = *(_QWORD *)v162;
  v26 = v147;
  v144 = *(_QWORD *)v162;
  do
  {
    v27 = 0;
    do
    {
      if (*(_QWORD *)v162 != v25)
        objc_enumerationMutation(v23);
      v28 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v27);
      objc_msgSend(v28, "eventBody", v129);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "valueForKey:", CFSTR("base"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        ARPLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[ARPHomeControlSuggester frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:].cold.1(&v159, v160, v41);
        goto LABEL_31;
      }
      objc_msgSend(v30, "source");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v9, "containsObject:", v31);

      if ((v32 & 1) != 0)
        goto LABEL_32;
      objc_msgSend(v30, "dateInterval");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "startDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "timeIntervalSinceDate:", v34);
      v36 = (int)(v35 / 86400.0);

      v37 = exp((double)v36 * -0.5);
      objc_msgSend(v28, "eventBody");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      getBMHomeKitClientAccessoryControlEventClass();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      objc_msgSend(v28, "eventBody");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if ((isKindOfClass & 1) != 0)
      {
        -[NSObject serviceType](v40, "serviceType");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v138, "containsObject:", v42);

        if ((v43 & 1) != 0)
        {
          v26 = v147;
          goto LABEL_17;
        }
        v53 = objc_alloc_init(ARPHomeControlSuggestion);
        -[ARPHomeControlSuggestion setType:](v53, "setType:", 0);
        -[NSObject accessoryUniqueIdentifier](v41, "accessoryUniqueIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARPHomeControlSuggestion setTargetUUID:](v53, "setTargetUUID:", v54);

        objc_msgSend(v30, "homeUniqueIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARPHomeControlSuggestion setHomeUUID:](v53, "setHomeUUID:", v55);

        -[NSObject serviceUniqueIdentifier](v41, "serviceUniqueIdentifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARPHomeControlSuggestion setAccessoryServiceUUID:](v53, "setAccessoryServiceUUID:", v56);

        objc_msgSend(v24, "dateInterval");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "startDate");
        v58 = objc_claimAutoreleasedReturnValue();
        v142 = v24;
        if (v58)
        {
          v59 = (void *)v58;
          v60 = v24;
          objc_msgSend(v30, "dateInterval");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "startDate");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "dateInterval");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "startDate");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "timeIntervalSinceDate:", v64);
          v66 = v65;

          goto LABEL_23;
        }
LABEL_25:

        goto LABEL_26;
      }
      getBMHomeKitClientActionSetEventClass();
      objc_opt_class();
      v44 = objc_opt_isKindOfClass();

      objc_msgSend(v28, "eventBody");
      v41 = objc_claimAutoreleasedReturnValue();
      if ((v44 & 1) != 0)
      {
        v45 = objc_alloc_init(ARPHomeControlSuggestion);
        -[ARPHomeControlSuggestion setType:](v45, "setType:", 1);
        -[NSObject actionSetUniqueIdentifier](v41, "actionSetUniqueIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARPHomeControlSuggestion setTargetUUID:](v45, "setTargetUUID:", v46);

        objc_msgSend(v30, "homeUniqueIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARPHomeControlSuggestion setHomeUUID:](v45, "setHomeUUID:", v47);

        v26 = v147;
        if (v132)
        {
          v48 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v150, "objectForKeyedSubscript:", v45);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "floatValue");
          objc_msgSend(v48, "numberWithDouble:", v37 + v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "setObject:forKeyedSubscript:", v51, v45);

          v23 = v136;
        }
        v52 = v30;

        v24 = v52;
LABEL_17:
        v25 = v144;
LABEL_31:

        goto LABEL_32;
      }
      getBMHomeKitClientMediaAccessoryControlEventClass();
      objc_opt_class();
      v67 = objc_opt_isKindOfClass();

      if ((v67 & 1) != 0)
      {
        objc_msgSend(v28, "eventBody");
        v41 = objc_claimAutoreleasedReturnValue();
        v53 = objc_alloc_init(ARPHomeControlSuggestion);
        -[ARPHomeControlSuggestion setType:](v53, "setType:", 0);
        -[NSObject accessoryUniqueIdentifier](v41, "accessoryUniqueIdentifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARPHomeControlSuggestion setTargetUUID:](v53, "setTargetUUID:", v68);

        objc_msgSend(v30, "homeUniqueIdentifier");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARPHomeControlSuggestion setHomeUUID:](v53, "setHomeUUID:", v69);

        objc_msgSend(v24, "dateInterval");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "startDate");
        v70 = objc_claimAutoreleasedReturnValue();
        v142 = v24;
        if (!v70)
          goto LABEL_25;
        v59 = (void *)v70;
        objc_msgSend(v30, "dateInterval");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "startDate");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dateInterval");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "startDate");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "timeIntervalSinceDate:", v74);
        v66 = v75;

LABEL_23:
        if (v66 <= 1.0)
        {
          v76 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v131, "objectForKeyedSubscript:", v53);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "doubleValue");
          objc_msgSend(v76, "numberWithDouble:", v37 + v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "setObject:forKeyedSubscript:", v79, v53);

          v26 = v147;
          goto LABEL_29;
        }
LABEL_26:
        objc_msgSend(v140, "dateInterval");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "startDate");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "dateInterval");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "startDate");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v81, "isEqualToDate:", v83);

        v26 = v147;
        if ((v84 & 1) != 0)
        {
          v9 = v134;
          v23 = v136;
          v24 = v142;
        }
        else
        {
          v85 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v147, "objectForKeyedSubscript:", v53);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "doubleValue");
          objc_msgSend(v85, "numberWithDouble:", v37 + v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "setObject:forKeyedSubscript:", v88, v53);

          v77 = v140;
          v140 = v30;
LABEL_29:
          v9 = v134;
          v24 = v142;

          v23 = v136;
        }
        v25 = v144;

        goto LABEL_31;
      }
      v26 = v147;
      v25 = v144;
LABEL_32:

      ++v27;
    }
    while (v149 != v27);
    v89 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v161, v168, 16);
    v149 = v89;
  }
  while (v89);
LABEL_38:
  v90 = v24;

  objc_msgSend(v26, "allValues");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "valueForKeyPath:", CFSTR("@sum.self"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "doubleValue");
  v94 = v93;

  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  objc_msgSend(v26, "allKeys");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
  if (v96)
  {
    v97 = v96;
    v98 = *(_QWORD *)v156;
    do
    {
      for (i = 0; i != v97; ++i)
      {
        if (*(_QWORD *)v156 != v98)
          objc_enumerationMutation(v95);
        v100 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * i);
        objc_msgSend(v26, "objectForKeyedSubscript:", v100, v129);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "doubleValue");
        objc_msgSend(v100, "setScore:", v102 / v94);

      }
      v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
    }
    while (v97);
  }

  objc_msgSend(v150, "allValues");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "valueForKeyPath:", CFSTR("@sum.self"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "doubleValue");
  v106 = v105;

  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  objc_msgSend(v150, "allKeys");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v151, v166, 16);
  if (v108)
  {
    v109 = v108;
    v110 = *(_QWORD *)v152;
    do
    {
      for (j = 0; j != v109; ++j)
      {
        if (*(_QWORD *)v152 != v110)
          objc_enumerationMutation(v107);
        v112 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * j);
        objc_msgSend(v150, "objectForKeyedSubscript:", v112, v129);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "doubleValue");
        objc_msgSend(v112, "setScore:", v114 / v106);

      }
      v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v151, v166, 16);
    }
    while (v109);
  }

  v115 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v26, "allKeys");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "arrayWithArray:", v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v117, "count"))
  {
    v118 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v131, "allKeys");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "arrayWithArray:", v119);
    v120 = objc_claimAutoreleasedReturnValue();

    v117 = (void *)v120;
  }
  objc_msgSend(v150, "allKeys", v129);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "addObjectsFromArray:", v121);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v165, 1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "sortUsingDescriptors:", v123);

  if (v130)
  {
    v124 = objc_msgSend(v117, "count");
    if (v124 >= v130)
      v125 = v130;
    else
      v125 = v124;
    objc_msgSend(v117, "subarrayWithRange:", 0, v125);
    v126 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v126 = v117;
  }
  v127 = v126;

  return v127;
}

- (NSArray)homeKitEventsSortedByStartDate
{
  return self->_homeKitEventsSortedByStartDate;
}

- (id)timeBasedSuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 fallBackToFrequency:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v5 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[ARPHomeControlSuggester homeKitEventsWithLookbackDays:](self, "homeKitEventsWithLookbackDays:", 30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggester setHomeKitEventsSortedByStartDate:](self, "setHomeKitEventsSortedByStartDate:", v9);
  ARPHomeControlLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v11;
    _os_log_impl(&dword_1DD793000, v10, OS_LOG_TYPE_INFO, "Total HomeKit events = %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v8;
  -[ARPHomeControlSuggester timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:events:referenceDate:](self, "timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:events:referenceDate:", a3, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v15);
  }
  if (v5)
  {
    if (!a3)
    {
      -[ARPHomeControlSuggester frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:](self, "frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:", 0, v9, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v25;
        _os_log_impl(&dword_1DD793000, v10, OS_LOG_TYPE_INFO, "Total suggestions from frequency-based MRU = %@", buf, 0xCu);

      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v18 = v24;
      v26 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v34 != v28)
              objc_enumerationMutation(v18);
            objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
          }
          v27 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        }
        while (v27);
      }
LABEL_31:

      goto LABEL_32;
    }
    if (objc_msgSend(v12, "count") < a3)
    {
      -[ARPHomeControlSuggester frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:](self, "frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:", a3, v9, 0);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v38;
LABEL_15:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v22);
          if (objc_msgSend(v12, "count") >= a3)
            break;
          objc_msgSend(v12, "addObject:", v23);
          if (v20 == ++v22)
          {
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            if (v20)
              goto LABEL_15;
            goto LABEL_31;
          }
        }
      }
      goto LABEL_31;
    }
  }
LABEL_32:
  objc_msgSend(v12, "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:(unint64_t)a3 events:(id)a4 referenceDate:(id)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v25;
  void *v26;
  id obj;
  void *v28;
  uint8_t v29;
  _BYTE v30[15];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(v28, "components:fromDate:", 32, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hour");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v14, "eventBody");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueForKey:", CFSTR("base"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dateInterval");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v28, "components:fromDate:", 32, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v19, "hour") ^ (unint64_t)v9) <= 3)
            objc_msgSend(v26, "addObject:", v14);
          v8 = v19;
        }
        else
        {
          ARPLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[ARPHomeControlSuggester timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:events:referenceDate:].cold.1(&v29, v30, v20);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  -[ARPHomeControlSuggester frequencybasedSuggestionsWitMaxSuggestions:events:](self, "frequencybasedSuggestionsWitMaxSuggestions:events:", a3, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)setHomeKitEventsSortedByStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitEventsSortedByStartDate, a3);
}

- (id)microlocationBasedsuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 correlationsFile:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  void *v71;
  float v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  id v79;
  void *v81;
  void *v82;
  id v83;
  unint64_t v84;
  void *v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  NSObject *v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  _BYTE v100[128];
  uint64_t v101;
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v98 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v9, 1, &v98);
    v11 = v98;
    if (v11)
    {
      v12 = v11;
      ARPLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ARPHomeControlSuggester microlocationBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:].cold.2((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
      v20 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v84 = a3;
      v97 = 0;
      v86 = v10;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v97);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v97;
      objc_msgSend(v21, "microlocationCorrelationsDictionary");
      v90 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "archiveDate");
      v91 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0D15A08];
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "predicateForEventsWithStartInDateRangeFrom:to:", v24, v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (void *)v22;
      v101 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v25, v27, 0, 1, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v29;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPHomeControlSuggester.m");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringByAppendingFormat:", CFSTR(":%d"), 217);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setClientName:", v32);

      objc_msgSend(v29, "setTracker:", &__block_literal_global_29);
      -[ARPHomeControlSuggester knowledgeStore](self, "knowledgeStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v87;
      objc_msgSend(v33, "executeQuery:error:", v29, &v96);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v96;

      v89 = v34;
      if (v12)
      {
        v35 = (void *)v91;
        ARPLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[ARPHomeControlSuggester microlocationBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:].cold.1((uint64_t)v12, v36, v37, v38, v39, v40, v41, v42);
        v20 = (void *)MEMORY[0x1E0C9AA60];
        v43 = v85;
        v10 = v86;
        v13 = v90;
      }
      else
      {
        v82 = v29;
        objc_msgSend(v34, "firstObject");
        v88 = objc_claimAutoreleasedReturnValue();
        -[NSObject startDate](v88, "startDate");
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = 0;
        v81 = (void *)v44;
        if (v91)
        {
          v46 = v44;
          if (v44)
          {
            objc_msgSend(v8, "timeIntervalSinceDate:");
            if (v47 <= 600.0 && (objc_msgSend(v8, "timeIntervalSinceDate:", v46), v48 <= 600.0))
            {
              -[NSObject metadata](v88, "metadata");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D15A88], "probabilityVector");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "objectForKeyedSubscript:", v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v51, "allValues");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "valueForKeyPath:", CFSTR("@max.self"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v53, "doubleValue");
              v55 = v54;
              -[ARPHomeControlSuggester scoreThresholdForMicrolocationSuggestionsConsidered](self, "scoreThresholdForMicrolocationSuggestionsConsidered");
              if (v55 >= v56)
              {
                objc_msgSend(v51, "allKeysForObject:", v53);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "firstObject");
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v58, "UUIDString");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject objectForKeyedSubscript:](v90, "objectForKeyedSubscript:", v59);
                v45 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v45 = 0;
              }

            }
            else
            {
              v45 = 0;
            }
          }
        }
        v83 = v8;
        objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "allValues");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "valueForKeyPath:", CFSTR("@sum.self"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "doubleValue");
        v64 = v63;

        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        objc_msgSend(v45, "allKeys");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
        if (v66)
        {
          v67 = v66;
          v68 = *(_QWORD *)v93;
          do
          {
            for (i = 0; i != v67; ++i)
            {
              if (*(_QWORD *)v93 != v68)
                objc_enumerationMutation(v65);
              v70 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
              objc_msgSend(v45, "objectForKeyedSubscript:", v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "floatValue");
              objc_msgSend(v70, "setScore:", v72 / v64);

              objc_msgSend(v60, "addObject:", v70);
            }
            v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
          }
          while (v67);
        }

        objc_msgSend(v60, "array");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)objc_msgSend(v73, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v75;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "sortUsingDescriptors:", v76);

        if (v84)
        {
          v77 = objc_msgSend(v74, "count");
          if (v77 >= v84)
            v78 = v84;
          else
            v78 = v77;
          objc_msgSend(v74, "subarrayWithRange:", 0, v78);
          v79 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v79 = v74;
        }
        v20 = v79;
        v10 = v86;
        v13 = v90;
        v35 = (void *)v91;

        v30 = v82;
        v8 = v83;
        v43 = v85;
        v36 = v88;
      }

    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v20;
}

- (id)nextActionBasedsuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 correlationsFile:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  char isKindOfClass;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  char v38;
  ARPHomeControlSuggestion *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  float v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  unint64_t v68;
  id v69;
  unint64_t v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  id v90;
  _BYTE v91[128];
  _QWORD v92[16];

  v92[14] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (v7)
  {
    v90 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 1, &v90);
    v9 = v90;
    if (v9)
    {
      v10 = v9;
      ARPLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ARPHomeControlSuggester nextActionBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:].cold.2((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
      v18 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_43;
    }
    v71 = a3;
    v75 = v7;
    v89 = 0;
    v74 = v8;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v89);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v89;
    objc_msgSend(v19, "nextActionCorrelationsDictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "archiveDate");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    -[ARPHomeControlSuggester mostRecentHomeKitEvent](self, "mostRecentHomeKitEvent");
    v20 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)MEMORY[0x1E0C99E60];
    v84 = (void *)v20;
    getHMServiceTypeSpeaker();
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v81;
    getHMServiceTypeDoorbell();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v80;
    getHMServiceTypeMicrophone();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v79;
    getHMServiceTypeTemperatureSensor();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v92[3] = v78;
    getHMServiceTypeAirQualitySensor();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v92[4] = v77;
    getHMServiceTypeHumiditySensor();
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v92[5] = v76;
    getHMServiceTypeCarbonMonoxideSensor();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v92[6] = v21;
    getHMServiceTypeContactSensor();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v92[7] = v22;
    getHMServiceTypeLeakSensor();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v92[8] = v23;
    getHMServiceTypeLightSensor();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v92[9] = v24;
    getHMServiceTypeMotionSensor();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v92[10] = v25;
    getHMServiceTypeOccupancySensor();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v92[11] = v26;
    getHMServiceTypeSmokeSensor();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v92[12] = v27;
    getHMServiceTypeCarbonDioxideSensor();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v92[13] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setWithArray:", v29);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v84;
    if (!v84)
    {
      v32 = 0;
LABEL_26:
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject allValues](v32, "allValues");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "valueForKeyPath:", CFSTR("@sum.self"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "doubleValue");
      v54 = v53;

      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      -[NSObject allKeys](v11, "allKeys");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v86;
        do
        {
          for (i = 0; i != v57; ++i)
          {
            if (*(_QWORD *)v86 != v58)
              objc_enumerationMutation(v55);
            v60 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
            -[NSObject objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "floatValue");
            v63 = v62 + 1.0;
            -[NSObject allKeys](v11, "allKeys");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setScore:", v63 / (v54 + (double)(unint64_t)objc_msgSend(v64, "count")));

            objc_msgSend(v50, "addObject:", v60);
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
        }
        while (v57);
      }

      objc_msgSend(v50, "array");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(v65, "mutableCopy");

      if (v71)
      {
        v67 = objc_msgSend(v66, "count");
        if (v67 >= v71)
          v68 = v71;
        else
          v68 = v67;
        objc_msgSend(v66, "subarrayWithRange:", 0, v68);
        v69 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v69 = v66;
      }
      v18 = v69;
      v30 = v84;

      goto LABEL_42;
    }
    objc_msgSend(v84, "eventBody");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "valueForKey:", CFSTR("base"));
    v32 = objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      ARPLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[ARPHomeControlSuggester nextActionBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:].cold.1(v32, v43, v44);
      goto LABEL_41;
    }
    objc_msgSend(v84, "eventBody");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    getBMHomeKitClientAccessoryControlEventClass();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v84, "eventBody");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if ((isKindOfClass & 1) != 0)
    {
      -[NSObject serviceType](v35, "serviceType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v83, "containsObject:", v37);

      if ((v38 & 1) != 0)
      {
LABEL_40:

LABEL_41:
        v18 = (void *)MEMORY[0x1E0C9AA60];
LABEL_42:
        v8 = v74;
        v7 = v75;
        v10 = v73;

LABEL_43:
        goto LABEL_44;
      }
      v39 = objc_alloc_init(ARPHomeControlSuggestion);
      -[ARPHomeControlSuggestion setType:](v39, "setType:", 0);
      -[NSObject accessoryUniqueIdentifier](v36, "accessoryUniqueIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARPHomeControlSuggestion setTargetUUID:](v39, "setTargetUUID:", v40);

      -[NSObject homeUniqueIdentifier](v32, "homeUniqueIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARPHomeControlSuggestion setHomeUUID:](v39, "setHomeUUID:", v41);

      -[NSObject serviceUniqueIdentifier](v36, "serviceUniqueIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARPHomeControlSuggestion setAccessoryServiceUUID:](v39, "setAccessoryServiceUUID:", v42);
    }
    else
    {
      getBMHomeKitClientActionSetEventClass();
      objc_opt_class();
      v45 = objc_opt_isKindOfClass();

      objc_msgSend(v84, "eventBody");
      v36 = objc_claimAutoreleasedReturnValue();
      if ((v45 & 1) != 0)
      {
        v39 = objc_alloc_init(ARPHomeControlSuggestion);
        -[ARPHomeControlSuggestion setType:](v39, "setType:", 1);
        -[NSObject actionSetUniqueIdentifier](v36, "actionSetUniqueIdentifier");
        v46 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        getBMHomeKitClientMediaAccessoryControlEventClass();
        objc_opt_class();
        v47 = objc_opt_isKindOfClass();

        if ((v47 & 1) == 0)
        {
          v39 = 0;
          goto LABEL_23;
        }
        objc_msgSend(v84, "eventBody");
        v36 = objc_claimAutoreleasedReturnValue();
        v39 = objc_alloc_init(ARPHomeControlSuggestion);
        -[ARPHomeControlSuggestion setType:](v39, "setType:", 0);
        -[NSObject accessoryUniqueIdentifier](v36, "accessoryUniqueIdentifier");
        v46 = objc_claimAutoreleasedReturnValue();
      }
      v48 = (void *)v46;
      -[ARPHomeControlSuggestion setTargetUUID:](v39, "setTargetUUID:", v46);

      -[NSObject homeUniqueIdentifier](v32, "homeUniqueIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARPHomeControlSuggestion setHomeUUID:](v39, "setHomeUUID:", v42);
    }

    if (v39)
    {
      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v39);
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_23:
    v36 = 0;
LABEL_24:
    v49 = -[NSObject count](v36, "count");

    if (v49)
    {

      v32 = v36;
      goto LABEL_26;
    }
    goto LABEL_40;
  }
  v18 = (void *)MEMORY[0x1E0C9AA60];
LABEL_44:

  return v18;
}

- (void)microlocationBasedsuggestionsWithMaxSuggestions:(uint64_t)a3 referenceDate:(uint64_t)a4 correlationsFile:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD793000, a2, a3, "Error reading persisted microlocation home controls archive file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)nextActionBasedsuggestionsWithMaxSuggestions:(uint64_t)a3 referenceDate:(uint64_t)a4 correlationsFile:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD793000, a2, a3, "Error reading persisted nextAction home controls archive file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (id)frequencybasedSuggestionsWitMaxSuggestions:(unint64_t)a3 events:(id)a4
{
  return -[ARPHomeControlSuggester frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:](self, "frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:", a3, a4, 1);
}

- (id)homeKitEventsWithLookbackDays:(int64_t)a3
{
  CFAbsoluteTime v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  ARPHomeControlSuggester *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  _QWORD v43[4];

  v29 = self;
  v43[2] = *MEMORY[0x1E0C80C00];
  v3 = CFAbsoluteTimeGetCurrent() + (double)(1440 * a3) * -60.0;
  getBMHomeKitClientAccessoryControlStreamClass();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "publisherFromStartTime:", v3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  getBMHomeKitClientActionSetStreamClass();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "publisherFromStartTime:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getBMHomeKitClientMediaAccessoryControlStreamClass();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "publisherFromStartTime:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v8 == 0)
  {
    ARPLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ARPHomeControlSuggester homeKitEventsWithLookbackDays:].cold.1(v15, v11, v12);
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v43[0] = v6;
    v43[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "orderedMergeWithOthers:comparator:", v14, &__block_literal_global_46);
    v15 = objc_claimAutoreleasedReturnValue();

    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy_;
    v40 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3000);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __57__ARPHomeControlSuggester_homeKitEventsWithLookbackDays___block_invoke_2;
    v35[3] = &unk_1EA7D4478;
    v35[4] = &v36;
    v35[5] = 3000;
    v16 = (id)-[NSObject sinkWithCompletion:receiveInput:](v15, "sinkWithCompletion:receiveInput:", &__block_literal_global_49, v35);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = (id)v37[5];
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    v19 = v18;
    if (v18)
    {
      v20 = *(_QWORD *)v32;
      v21 = 0.0;
      v22 = 0.0;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v23);
          objc_msgSend(v24, "eventBody", v29);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          getBMHomeKitClientMediaAccessoryControlEventClass();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            v21 = v21 + 1.0;
          }
          else
          {
            objc_msgSend(v24, "eventBody");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            getBMHomeKitClientAccessoryControlEventClass();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
              v21 = v21 + 1.0;
            else
              v22 = v22 + 1.0;
          }
          ++v23;
        }
        while (v19 != v23);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      }
      while (v19);

      if (v22 > 0.0)
        -[ARPHomeControlSuggester setScoreSceneBoost:](v29, "setScoreSceneBoost:", v21 / v22 * 4.0);
    }
    else
    {

    }
    v13 = (void *)objc_msgSend((id)v37[5], "copy", v29);
    _Block_object_dispose(&v36, 8);

  }
  return v13;
}

+ (id)defaultCorrelationsSessionFile
{
  uint64_t v2;
  size_t v3;
  uid_t v4;
  BOOL v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  passwd v14;
  passwd *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = sysconf(71);
  if (v2 == -1)
    v3 = 4096;
  else
    v3 = v2;
  v15 = 0;
  v4 = geteuid();
  if (!v4)
    v4 = getuid();
  memset(&v14, 0, sizeof(v14));
  if (getpwuid_r(v4, &v14, (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3, &v15))
    v5 = 1;
  else
    v5 = v15 == 0;
  if (v5)
  {
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("AirPlayRoutePrediction/HomeControlSuggestions/correlations.archive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ARPHomeControlLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      v7 = "ARPHomeControlSuggester defaultCorrelationsSessionFile returning fallback path: %@";
LABEL_15:
      _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFileSystemRepresentation:length:", v15->pw_dir, strlen(v15->pw_dir));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("/Library/AirPlayRoutePrediction/HomeControlSuggestions/correlations.archive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ARPHomeControlLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      v7 = "ARPHomeControlSuggester defaultCorrelationsSessionFile returning getpwuid_r path: %@";
      goto LABEL_15;
    }
  }

  return v10;
}

uint64_t __88__ARPHomeControlSuggester_suggestionsWithMaxSuggestions_referenceDate_correlationsFile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "doubleValue");
    v11 = v10;
    objc_msgSend(v5, "doubleValue");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __106__ARPHomeControlSuggester_microlocationBasedsuggestionsWithMaxSuggestions_referenceDate_correlationsFile___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)timeBasedSuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4
{
  return -[ARPHomeControlSuggester timeBasedSuggestionsWithMaxSuggestions:referenceDate:fallBackToFrequency:](self, "timeBasedSuggestionsWithMaxSuggestions:referenceDate:fallBackToFrequency:", a3, a4, 1);
}

- (id)frequencybasedSuggestionsWitMaxSuggestions:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[ARPHomeControlSuggester homeKitEventsWithLookbackDays:](self, "homeKitEventsWithLookbackDays:", 30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggester frequencybasedSuggestionsWitMaxSuggestions:events:](self, "frequencybasedSuggestionsWitMaxSuggestions:events:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __57__ARPHomeControlSuggester_homeKitEventsWithLookbackDays___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("base"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForKey:", CFSTR("base"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "compare:", v12);

  return v13;
}

void __57__ARPHomeControlSuggester_homeKitEventsWithLookbackDays___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count");
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3 == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "addObject:", v5);

}

- (id)mostRecentHomeKitEvent
{
  CFAbsoluteTime v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v2 = CFAbsoluteTimeGetCurrent() + -2592000.0;
  getBMHomeKitClientAccessoryControlStreamClass();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "publisherFromStartTime:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  getBMHomeKitClientActionSetStreamClass();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "publisherFromStartTime:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getBMHomeKitClientMediaAccessoryControlStreamClass();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "publisherFromStartTime:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v8 == 0)
  {
    ARPLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ARPHomeControlSuggester homeKitEventsWithLookbackDays:].cold.1(v14, v11, v12);
    v17 = 0;
  }
  else
  {
    v26[0] = v6;
    v26[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedMergeWithOthers:comparator:", v13, &__block_literal_global_51);
    v14 = objc_claimAutoreleasedReturnValue();

    -[NSObject last](v14, "last");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__ARPHomeControlSuggester_mostRecentHomeKitEvent__block_invoke_3;
    v19[3] = &unk_1EA7D44E0;
    v19[4] = &v20;
    v16 = (id)objc_msgSend(v15, "sinkWithCompletion:receiveInput:", &__block_literal_global_52, v19);
    v17 = (id)v21[5];
    _Block_object_dispose(&v20, 8);

  }
  return v17;
}

uint64_t __49__ARPHomeControlSuggester_mostRecentHomeKitEvent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("base"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForKey:", CFSTR("base"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "compare:", v12);

  return v13;
}

void __49__ARPHomeControlSuggester_mostRecentHomeKitEvent__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (double)scoreThresholdForMicrolocationSuggestionsConsidered
{
  return self->_scoreThresholdForMicrolocationSuggestionsConsidered;
}

- (void)setScoreThresholdForMicrolocationSuggestionsConsidered:(double)a3
{
  self->_scoreThresholdForMicrolocationSuggestionsConsidered = a3;
}

- (double)highScoreThresholdForMicroLocationSuggestionMerge
{
  return self->_highScoreThresholdForMicroLocationSuggestionMerge;
}

- (void)setHighScoreThresholdForMicroLocationSuggestionMerge:(double)a3
{
  self->_highScoreThresholdForMicroLocationSuggestionMerge = a3;
}

- (double)lowScoreThresholdForMicroLocationSuggestionMerge
{
  return self->_lowScoreThresholdForMicroLocationSuggestionMerge;
}

- (void)setLowScoreThresholdForMicroLocationSuggestionMerge:(double)a3
{
  self->_lowScoreThresholdForMicroLocationSuggestionMerge = a3;
}

- (double)highScoreThresholdForTimeBasedSuggestionMerge
{
  return self->_highScoreThresholdForTimeBasedSuggestionMerge;
}

- (void)setHighScoreThresholdForTimeBasedSuggestionMerge:(double)a3
{
  self->_highScoreThresholdForTimeBasedSuggestionMerge = a3;
}

- (double)lowScoreThresholdForTimeBasedSuggestionMerge
{
  return self->_lowScoreThresholdForTimeBasedSuggestionMerge;
}

- (void)setLowScoreThresholdForTimeBasedSuggestionMerge:(double)a3
{
  self->_lowScoreThresholdForTimeBasedSuggestionMerge = a3;
}

- (double)scoreSceneBoost
{
  return self->_scoreSceneBoost;
}

- (void)setScoreSceneBoost:(double)a3
{
  self->_scoreSceneBoost = a3;
}

- (NSString)correlationsSessionFile
{
  return self->_correlationsSessionFile;
}

- (void)setCorrelationsSessionFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationsSessionFile, 0);
  objc_storeStrong((id *)&self->_homeKitEventsSortedByStartDate, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)microlocationBasedsuggestionsWithMaxSuggestions:(uint64_t)a3 referenceDate:(uint64_t)a4 correlationsFile:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD793000, a2, a3, "Error fetching microlocations for correlation task: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)nextActionBasedsuggestionsWithMaxSuggestions:(NSObject *)a1 referenceDate:(uint64_t)a2 correlationsFile:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1DD793000, a1, a3, "Skipping nextAction suggestions - BMHomeKitClientBase is nil", v3);
  OUTLINED_FUNCTION_2();
}

- (void)timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:(uint8_t *)a1 events:(_BYTE *)a2 referenceDate:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1DD793000, a3, (uint64_t)a3, "Skipping HomeKit donation - BMHomeKitClientBase or dateInterval is nil", a1);
}

- (void)frequencybasedSuggestionsWitMaxSuggestions:(uint8_t *)a1 events:(_BYTE *)a2 useScenes:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1DD793000, a3, (uint64_t)a3, "Skipping suggestion - BMHomeKitClientBase is nil", a1);
}

- (void)homeKitEventsWithLookbackDays:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1DD793000, a1, a3, "One or more Biome HomeKit publishers are nil. Please check for the right entitlements", v3);
  OUTLINED_FUNCTION_2();
}

@end
