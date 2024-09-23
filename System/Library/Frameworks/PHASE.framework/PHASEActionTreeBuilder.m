@implementation PHASEActionTreeBuilder

- (PHASEActionTreeBuilder)init
{
  PHASEActionTreeBuilder *v2;
  NSMutableArray *v3;
  NSMutableArray *rootNodes;
  NSMutableSet *v5;
  NSMutableSet *parameters;
  NSMutableSet *v7;
  NSMutableSet *mixNodes;
  PHASEActionTreeBuilder *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHASEActionTreeBuilder;
  v2 = -[PHASEActionTreeBuilder init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    rootNodes = v2->_rootNodes;
    v2->_rootNodes = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    parameters = v2->_parameters;
    v2->_parameters = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mixNodes = v2->_mixNodes;
    v2->_mixNodes = v7;

    v2->_nextNodeId = 0;
    v9 = v2;
  }

  return v2;
}

- (BOOL)addRootNode:(id)a3
{
  -[NSMutableArray addObject:](self->_rootNodes, "addObject:", a3);
  return 1;
}

- (BOOL)addParameter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[NSMutableSet addObject:](self->_parameters, "addObject:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "inputMetaParameterDefinition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "inputMetaParameterDefinition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PHASEActionTreeBuilder addParameter:](self, "addParameter:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)fillGeneratorNodeEntries:(id)a3 dictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  objc_msgSend(v26, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("Name"));

  GetCalibrationModeString((PHASECalibrationMode)objc_msgSend(v26, "calibrationMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("CalibrationMode"));

  v9 = (void *)0x24BDD1000;
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v26, "level");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("Level"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v26, "rate");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("Rate"));

  objc_msgSend(v26, "group");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v26, "group");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &stru_24D582B00;
  }
  objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("Group"));
  if (v14)
  {

  }
  objc_msgSend(v26, "gainMetaParameterDefinition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v26, "gainMetaParameterDefinition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASEActionTreeBuilder addParameter:](self, "addParameter:", v17);

    objc_msgSend(v26, "gainMetaParameterDefinition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v19, CFSTR("GainParameterName"));

  }
  objc_msgSend(v26, "rateMetaParameterDefinition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v26, "rateMetaParameterDefinition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASEActionTreeBuilder addParameter:](self, "addParameter:", v21);

    objc_msgSend(v26, "rateMetaParameterDefinition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v23, CFSTR("RateParameterName"));

  }
  objc_msgSend(v26, "mixerDefinition");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v25, CFSTR("Submix"));

}

- (id)generateNodeDictionary:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  PHASEActionTreeBuilder *v9;
  NSMutableSet *mixNodes;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PHASEActionTreeBuilder *v16;
  NSMutableSet *v17;
  void *v18;
  void *v19;
  void *v20;
  PHASEActionTreeBuilder *v21;
  NSMutableSet *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PHASEActionTreeBuilder *v28;
  NSMutableSet *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  id v41;
  unint64_t j;
  void *v43;
  BOOL v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t m;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  Phase::Logger *v101;
  NSObject *v102;
  id v103;
  uint64_t v104;
  void *v105;
  BOOL v106;
  NSMutableSet *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  id v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t n;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  PHASEActionTreeBuilder *v122;
  NSMutableSet *v123;
  void *v124;
  void *v125;
  void *v126;
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
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  void *v185;
  void *v186;
  Phase::Logger *v187;
  NSObject *v188;
  id v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  void *v193;
  Phase::Logger *v194;
  NSObject *v195;
  id v196;
  uint64_t v197;
  PHASEActionTreeBuilder *v198;
  id v199;
  id *v200;
  void *v201;
  id obj;
  uint64_t v203;
  id v204;
  uint64_t v205;
  void *v206;
  void *v207;
  id v208;
  id v209;
  id i;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  uint64_t v232;
  void *v233;
  _BYTE v234[128];
  _BYTE v235[128];
  uint64_t v236;
  void *v237;
  uint8_t v238[128];
  uint8_t buf[4];
  const char *v240;
  __int16 v241;
  int v242;
  __int16 v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  _BYTE v247[128];
  uint64_t v248;

  v248 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  v200 = a4;
  v201 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = self;
    mixNodes = self->_mixNodes;
    objc_msgSend(v8, "mixerDefinition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](mixNodes, "addObject:", v11);

    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v12, "setObject:forKey:", CFSTR("sampler"), CFSTR("Type"));
    -[PHASEActionTreeBuilder fillGeneratorNodeEntries:dictionary:](v9, "fillGeneratorNodeEntries:dictionary:", v8, v12);
    objc_msgSend(v8, "assetIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("Asset"));

    GetCullOptionString((PHASECullOption)objc_msgSend(v8, "cullOption"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("CullOption"));

    GetPlaybackModeString((PHASEPlaybackMode)objc_msgSend(v8, "playbackMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("PlaybackMode"));
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v16 = self;
    v17 = self->_mixNodes;
    objc_msgSend(v8, "mixerDefinition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v17, "addObject:", v18);

    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v12, "setObject:forKey:", CFSTR("pushstream"), CFSTR("Type"));
    -[PHASEActionTreeBuilder fillGeneratorNodeEntries:dictionary:](v16, "fillGeneratorNodeEntries:dictionary:", v8, v12);
    objc_msgSend(v8, "format");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("Format"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "normalize"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v20, CFSTR("Normalize"));

    objc_msgSend(v8, "targetLKFS");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("TargetLKFS"));
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v21 = self;
    v22 = self->_mixNodes;
    objc_msgSend(v8, "mixerDefinition");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v22, "addObject:", v23);

    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v12, "setObject:forKey:", CFSTR("externaloutputpullstream"), CFSTR("Type"));
    -[PHASEActionTreeBuilder fillGeneratorNodeEntries:dictionary:](v21, "fillGeneratorNodeEntries:dictionary:", v8, v12);
    objc_msgSend(v8, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v25, CFSTR("UUID"));

    GetChannelLayoutString((Phase::ChannelLayout *)objc_msgSend(v8, "channelLayoutTag"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v26, CFSTR("ChannelLayoutTag"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "normalize"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v27, CFSTR("Normalize"));

    objc_msgSend(v8, "targetLKFS");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("TargetLKFS"));
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v28 = self;
    v29 = self->_mixNodes;
    objc_msgSend(v8, "mixerDefinition");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v29, "addObject:", v30);

    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v12, "setObject:forKey:", CFSTR("pullstream"), CFSTR("Type"));
    -[PHASEActionTreeBuilder fillGeneratorNodeEntries:dictionary:](v28, "fillGeneratorNodeEntries:dictionary:", v8, v12);
    objc_msgSend(v8, "format");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v31, CFSTR("Format"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "normalize"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v32, CFSTR("Normalize"));

    objc_msgSend(v8, "targetLKFS");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("TargetLKFS"));
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v199 = v7;
    v204 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v230 = 0u;
    v231 = 0u;
    v228 = 0u;
    v229 = 0u;
    objc_msgSend(v199, "ranges");
    v198 = self;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v205 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v228, v247, 16);
    if (v205)
    {
      v203 = *(_QWORD *)v229;
      do
      {
        for (i = 0; i != (id)v205; i = (char *)i + 1)
        {
          if (*(_QWORD *)v229 != v203)
            objc_enumerationMutation(obj);
          v34 = *(_QWORD *)(*((_QWORD *)&v228 + 1) + 8 * (_QWORD)i);
          v206 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend(*(id *)(v34 + 8), "identifier");
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = *(id *)(v34 + 16);
          v213 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v36 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v35, "startPoint");
          objc_msgSend(v36, "numberWithDouble:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v213, "setValue:forKey:", v37, CFSTR("StartInputValue"));

          v38 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v35, "startPoint");
          objc_msgSend(v38, "numberWithDouble:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v213, "setValue:forKey:", v40, CFSTR("StartOutputValue"));

          v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          for (j = 0; ; ++j)
          {
            objc_msgSend(v35, "segments");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "count") > j;

            if (!v44)
              break;
            v45 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            v46 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v35, "segments");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", j);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "endPoint");
            objc_msgSend(v46, "numberWithDouble:");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setValue:forKey:", v49, CFSTR("InputValue"));

            v50 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v35, "segments");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectAtIndexedSubscript:", j);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "endPoint");
            objc_msgSend(v50, "numberWithDouble:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setValue:forKey:", v54, CFSTR("OutputValue"));

            objc_msgSend(v35, "segments");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectAtIndexedSubscript:", j);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            GetCurveTypeString((PHASECurveType)objc_msgSend(v56, "curveType"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setValue:forKey:", v57, CFSTR("CurveType"));

            objc_msgSend(v41, "addObject:", v45);
          }
          objc_msgSend(v213, "setValue:forKey:", v41, CFSTR("Segments"));

          objc_msgSend(v206, "dictionaryWithObjectsAndKeys:", v207, CFSTR("SubTreeNodeName"), v213, CFSTR("Envelope"), 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v204, "addObject:", v58);
        }
        v205 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v228, v247, 16);
      }
      while (v205);
    }

    objc_msgSend(v199, "blendParameterDefinition");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59 == 0;

    if (!v60)
    {
      objc_msgSend(v199, "blendParameterDefinition");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASEActionTreeBuilder addParameter:](self, "addParameter:", v61);

      v62 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(v199, "identifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "blendParameterDefinition");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "identifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "dictionaryWithObjectsAndKeys:", v63, CFSTR("Name"), CFSTR("blend"), CFSTR("Type"), v204, CFSTR("Children"), v65, CFSTR("BlendParameter"), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v199, "blendParameterDefinition");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASEActionTreeBuilder addParameter:](v198, "addParameter:", v66);
LABEL_52:

      goto LABEL_12;
    }
    objc_msgSend(v199, "spatialMixerDefinitionForDistance");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v105 == 0;

    if (!v106)
    {
      v107 = self->_mixNodes;
      objc_msgSend(v199, "spatialMixerDefinitionForDistance");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v107, "addObject:", v108);

      v109 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(v199, "identifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "spatialMixerDefinitionForDistance");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "identifier");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "dictionaryWithObjectsAndKeys:", v66, CFSTR("Name"), CFSTR("blend"), CFSTR("Type"), v204, CFSTR("Children"), CFSTR("auto_distance"), CFSTR("BlendParameter"), v111, CFSTR("DistanceSubmixName"), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_52;
    }
    v184 = *MEMORY[0x24BDD0FC8];
    v245 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Improperly initialized blend node"));
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v246 = v185;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v246, &v245, 1);
    v186 = (void *)objc_claimAutoreleasedReturnValue();

    v188 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v187)
                                                                                         + 16)));
    if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v186, "objectForKeyedSubscript:", v184);
      v189 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v190 = objc_msgSend(v189, "UTF8String");
      *(_DWORD *)buf = 136315650;
      v240 = "PHASEAssetRegistry.mm";
      v241 = 1024;
      v242 = 2286;
      v243 = 2080;
      v244 = v190;
      _os_log_impl(&dword_2164CC000, v188, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (v200)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924648, v186);
      *v200 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_93:
    v12 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v208 = v7;
    v214 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v226 = 0u;
    v227 = 0u;
    v224 = 0u;
    v225 = 0u;
    objc_msgSend(v208, "subtrees");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = v67;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v224, v238, 16);
    if (v68)
    {
      v69 = *(_QWORD *)v225;
      while (2)
      {
        for (k = 0; k != v68; ++k)
        {
          if (*(_QWORD *)v225 != v69)
            objc_enumerationMutation(v211);
          v71 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * k);
          objc_msgSend(v71, "subtree");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v72 == 0;

          if (v73)
          {
            v98 = *MEMORY[0x24BDD0FC8];
            v236 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Switch node subtree is nil"));
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v237 = v99;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v237, &v236, 1);
            v100 = (void *)objc_claimAutoreleasedReturnValue();

            v102 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v101)
                                                                                                 + 16)));
            if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v100, "objectForKeyedSubscript:", v98);
              v103 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v104 = objc_msgSend(v103, "UTF8String");
              *(_DWORD *)buf = 136315650;
              v240 = "PHASEAssetRegistry.mm";
              v241 = 1024;
              v242 = 2304;
              v243 = 2080;
              v244 = v104;
              _os_log_impl(&dword_2164CC000, v102, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

            }
            if (v200)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924648, v100);
              *v200 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_93;
          }
          v74 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend(v71, "subtree");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "identifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "switchValue");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "dictionaryWithObjectsAndKeys:", v76, CFSTR("SubTreeNodeName"), v77, CFSTR("SwitchValue"), 0);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v214, "addObject:", v78);
        }
        v67 = v211;
        v68 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v224, v238, 16);
        if (v68)
          continue;
        break;
      }
    }

    objc_msgSend(v208, "switchMetaParameterDefinition");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASEActionTreeBuilder addParameter:](self, "addParameter:", v79);

    v80 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v208, "identifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "switchMetaParameterDefinition");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "identifier");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "dictionaryWithObjectsAndKeys:", v81, CFSTR("Name"), CFSTR("switch"), CFSTR("Type"), v83, CFSTR("SwitchParameter"), v214, CFSTR("Children"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v209 = v7;
      v215 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v222 = 0u;
      v223 = 0u;
      v220 = 0u;
      v221 = 0u;
      objc_msgSend(v209, "subtrees");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v212 = v84;
      v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v220, v235, 16);
      if (v85)
      {
        v86 = *(_QWORD *)v221;
        do
        {
          for (m = 0; m != v85; ++m)
          {
            if (*(_QWORD *)v221 != v86)
              objc_enumerationMutation(v212);
            v88 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * m);
            v89 = (void *)MEMORY[0x24BDBCE70];
            objc_msgSend(v88, "subtree");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "identifier");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v88, "weight");
            objc_msgSend(v92, "numberWithDouble:");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "dictionaryWithObjectsAndKeys:", v91, CFSTR("SubTreeNodeName"), v93, CFSTR("Weight"), 0);
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v215, "addObject:", v94);
          }
          v84 = v212;
          v85 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v220, v235, 16);
        }
        while (v85);
      }

      v95 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(v209, "identifier");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v209, "uniqueSelectionQueueLength"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "dictionaryWithObjectsAndKeys:", v96, CFSTR("Name"), CFSTR("random"), CFSTR("Type"), v97, CFSTR("UniqueSelectionQueueLength"), v215, CFSTR("Children"), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v112 = v7;
        v113 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v218 = 0u;
        v219 = 0u;
        v216 = 0u;
        v217 = 0u;
        objc_msgSend(v112, "children");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v216, v234, 16);
        if (v115)
        {
          v116 = *(_QWORD *)v217;
          do
          {
            for (n = 0; n != v115; ++n)
            {
              if (*(_QWORD *)v217 != v116)
                objc_enumerationMutation(v114);
              objc_msgSend(*(id *)(*((_QWORD *)&v216 + 1) + 8 * n), "identifier");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "addObject:", v118);

            }
            v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v216, v234, 16);
          }
          while (v115);
        }

        v119 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v112, "identifier");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "dictionaryWithObjectsAndKeys:", v120, CFSTR("Name"), CFSTR("container"), CFSTR("Type"), v113, CFSTR("Children"), 0);
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v191 = *MEMORY[0x24BDD0FC8];
            v232 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected object in submix array"));
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            v233 = v192;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v233, &v232, 1);
            v193 = (void *)objc_claimAutoreleasedReturnValue();

            v195 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v194)
                                                                                                 + 16)));
            if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v193, "objectForKeyedSubscript:", v191);
              v196 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v197 = objc_msgSend(v196, "UTF8String");
              *(_DWORD *)buf = 136315650;
              v240 = "PHASEAssetRegistry.mm";
              v241 = 1024;
              v242 = 2471;
              v243 = 2080;
              v244 = v197;
              _os_log_impl(&dword_2164CC000, v195, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

            }
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924648, v193);
            *v200 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_93;
        }
        v121 = v7;
        v122 = self;
        v123 = self->_mixNodes;
        objc_msgSend(v121, "mixerDefinition");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v123, "addObject:", v124);

        v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v12, "setObject:forKey:", CFSTR("procedure"), CFSTR("Type"));
        -[PHASEActionTreeBuilder fillGeneratorNodeEntries:dictionary:](v122, "fillGeneratorNodeEntries:dictionary:", v121, v12);
        GetCullOptionString((PHASECullOption)objc_msgSend(v121, "cullOption"));
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v125, CFSTR("CullOption"));

        GetPlaybackModeString((PHASEPlaybackMode)objc_msgSend(v121, "playbackMode"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v126, CFSTR("PlaybackMode"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v121, "maxPolyphony"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v127, CFSTR("ProcedureMaxPolyphony"));

        GetVoiceStealingTypeString(objc_msgSend(v121, "voiceStealingType"));
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v128, CFSTR("ProcedureVoiceStealingType"));

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "setObject:forKey:", CFSTR("water"), CFSTR("ProcedureType"));
          v129 = v121;
          v130 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v129, "fallRate");
          objc_msgSend(v130, "numberWithDouble:");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v131, CFSTR("FallRate"));

          v132 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v129, "averageDropDiameter");
          objc_msgSend(v132, "numberWithDouble:");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v133, CFSTR("AverageDropDiameter"));

          v134 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v129, "maxDropDiameter");
          objc_msgSend(v134, "numberWithDouble:");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v135, CFSTR("MaxDropDiameter"));

          v136 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v129, "impulseShape");
          objc_msgSend(v136, "numberWithDouble:");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v137, CFSTR("ImpulseShape"));

          v138 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v129, "impulseGainExponent");
          objc_msgSend(v138, "numberWithDouble:");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v139, CFSTR("ImpulseGainExponent"));

          v140 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v129, "impulseGain");
          objc_msgSend(v140, "numberWithDouble:");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v141, CFSTR("ImpulseGain"));

          v142 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v129, "chirpRiseRate");
          objc_msgSend(v142, "numberWithDouble:");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v143, CFSTR("ChirpRiseRate"));

          v144 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v129, "baseFrequencyMultiplier");
          objc_msgSend(v144, "numberWithDouble:");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v145, CFSTR("BaseFrequencyMultiplier"));

          v146 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v129, "bubbleGain");
          objc_msgSend(v146, "numberWithDouble:");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v147, CFSTR("BubbleGain"));

          objc_msgSend(v129, "fallRateMetaParameterDefinition");
          v148 = (void *)objc_claimAutoreleasedReturnValue();

          if (v148)
          {
            objc_msgSend(v129, "fallRateMetaParameterDefinition");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v122, "addParameter:", v149);

            objc_msgSend(v129, "fallRateMetaParameterDefinition");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "identifier");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v151, CFSTR("FallRateParameterName"));

          }
          objc_msgSend(v129, "averageDropDiameterMetaParameterDefinition");
          v152 = (void *)objc_claimAutoreleasedReturnValue();

          if (v152)
          {
            objc_msgSend(v129, "averageDropDiameterMetaParameterDefinition");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v122, "addParameter:", v153);

            objc_msgSend(v129, "averageDropDiameterMetaParameterDefinition");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "identifier");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v155, CFSTR("AverageDropDiameterParameterName"));

          }
          objc_msgSend(v129, "maxDropDiameterMetaParameterDefinition");
          v156 = (void *)objc_claimAutoreleasedReturnValue();

          if (v156)
          {
            objc_msgSend(v129, "maxDropDiameterMetaParameterDefinition");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v122, "addParameter:", v157);

            objc_msgSend(v129, "maxDropDiameterMetaParameterDefinition");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "identifier");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v159, CFSTR("MaxDropDiameterParameterName"));

          }
          objc_msgSend(v129, "impulseShapeMetaParameterDefinition");
          v160 = (void *)objc_claimAutoreleasedReturnValue();

          if (v160)
          {
            objc_msgSend(v129, "impulseShapeMetaParameterDefinition");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v122, "addParameter:", v161);

            objc_msgSend(v129, "impulseShapeMetaParameterDefinition");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v162, "identifier");
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v163, CFSTR("ImpulseShapeParameterName"));

          }
          objc_msgSend(v129, "impulseGainExponentMetaParameterDefinition");
          v164 = (void *)objc_claimAutoreleasedReturnValue();

          if (v164)
          {
            objc_msgSend(v129, "impulseGainExponentMetaParameterDefinition");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v122, "addParameter:", v165);

            objc_msgSend(v129, "impulseGainExponentMetaParameterDefinition");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "identifier");
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v167, CFSTR("ImpulseGainExponentParameterName"));

          }
          objc_msgSend(v129, "impulseGainMetaParameterDefinition");
          v168 = (void *)objc_claimAutoreleasedReturnValue();

          if (v168)
          {
            objc_msgSend(v129, "impulseGainMetaParameterDefinition");
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v122, "addParameter:", v169);

            objc_msgSend(v129, "impulseGainMetaParameterDefinition");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v170, "identifier");
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v171, CFSTR("ImpulseGainParameterName"));

          }
          objc_msgSend(v129, "chirpRiseRateMetaParameterDefinition");
          v172 = (void *)objc_claimAutoreleasedReturnValue();

          if (v172)
          {
            objc_msgSend(v129, "chirpRiseRateMetaParameterDefinition");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v122, "addParameter:", v173);

            objc_msgSend(v129, "chirpRiseRateMetaParameterDefinition");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "identifier");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v175, CFSTR("ChirpRiseRateParameterName"));

          }
          objc_msgSend(v129, "baseFrequencyMultiplierMetaParameterDefinition");
          v176 = (void *)objc_claimAutoreleasedReturnValue();

          if (v176)
          {
            objc_msgSend(v129, "baseFrequencyMultiplierMetaParameterDefinition");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v122, "addParameter:", v177);

            objc_msgSend(v129, "baseFrequencyMultiplierMetaParameterDefinition");
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v178, "identifier");
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v179, CFSTR("BaseFrequencyMultiplierParameterName"));

          }
          objc_msgSend(v129, "bubbleGainMetaParameterDefinition");
          v180 = (void *)objc_claimAutoreleasedReturnValue();

          if (v180)
          {
            objc_msgSend(v129, "bubbleGainMetaParameterDefinition");
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v122, "addParameter:", v181);

            objc_msgSend(v129, "bubbleGainMetaParameterDefinition");
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "identifier");
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v183, CFSTR("BubbleGainParameterName"));

          }
        }

      }
    }
  }
LABEL_12:

  return v12;
}

- (BOOL)processNode:(id)a3 withArray:(id)a4 assetRegistry:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6)
    *a6 = 0;
  if (-[PHASEActionTreeBuilder checkNodeForValidChannelLayouts:assetRegistry:outError:](self, "checkNodeForValidChannelLayouts:assetRegistry:outError:", v10, v12, a6))
  {
    -[PHASEActionTreeBuilder generateNodeDictionary:outError:](self, "generateNodeDictionary:outError:", v10, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "addObject:", v13);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v10, "children", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v14);
            if (!-[PHASEActionTreeBuilder processNode:withArray:assetRegistry:outError:](self, "processNode:withArray:assetRegistry:outError:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v11, v12, a6))
            {
              v18 = 0;
              goto LABEL_16;
            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v15)
            continue;
          break;
        }
      }
      v18 = 1;
LABEL_16:

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)getParamArray:(id)a3 globalParamUIDs:(id)a4 outError:(id *)a5
{
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  Phase::Logger *v55;
  NSObject *v56;
  id v57;
  uint64_t v58;
  id *v60;
  id v61;
  id v62;
  id obj;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t i;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  v66 = a4;
  v62 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a5)
    *a5 = 0;
  v60 = a5;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v61;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
  if (v67)
  {
    v65 = *(_QWORD *)v75;
    while (2)
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v75 != v65)
          objc_enumerationMutation(obj);
        v68 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_msgSend(v68, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v66, "containsObject:", v7);

        if ((v8 & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v64 = v68;
            v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            objc_msgSend(v64, "envelope");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "segments");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v71;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v71 != v13)
                    objc_enumerationMutation(v11);
                  v15 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                  v16 = (void *)MEMORY[0x24BDBCE70];
                  v17 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v15, "endPoint");
                  objc_msgSend(v17, "numberWithDouble:");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v15, "endPoint");
                  objc_msgSend(v19, "numberWithDouble:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  GetCurveTypeString((PHASECurveType)objc_msgSend(v15, "curveType"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v18, CFSTR("InputValue"), v21, CFSTR("OutputValue"), v22, CFSTR("CurveType"), 0);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v9, "addObject:", v23);
                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
              }
              while (v12);
            }

            v24 = (void *)MEMORY[0x24BDBCE70];
            v25 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v64, "envelope");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "startPoint");
            objc_msgSend(v25, "numberWithDouble:");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v64, "envelope");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "startPoint");
            objc_msgSend(v28, "numberWithDouble:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v27, CFSTR("StartInputValue"), v31, CFSTR("StartOutputValue"), v9, CFSTR("Segments"), 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = (void *)MEMORY[0x24BDBCE70];
            objc_msgSend(v64, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "inputMetaParameterDefinition");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "dictionaryWithObjectsAndKeys:", CFSTR("mapped_range"), CFSTR("Type"), v34, CFSTR("Name"), v36, CFSTR("LinkedInputParameter"), CFSTR("float"), CFSTR("InputType"), CFSTR("float"), CFSTR("OutputType"), v32, CFSTR("Envelope"), 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v62, "addObject:", v37);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = v68;
              v39 = (void *)MEMORY[0x24BDBCE70];
              objc_msgSend(v38, "identifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v38, "minimum");
              objc_msgSend(v41, "numberWithDouble:");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v38, "maximum");
              objc_msgSend(v43, "numberWithDouble:");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "value");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "dictionaryWithObjectsAndKeys:", v40, CFSTR("Name"), CFSTR("input"), CFSTR("Type"), CFSTR("float"), CFSTR("InputType"), v42, CFSTR("RangeMin"), v44, CFSTR("RangeMax"), v45, CFSTR("DefaultValue"), 0);
              v9 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v62, "addObject:", v9);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v60)
                {
                  v52 = *MEMORY[0x24BDD0FC8];
                  v84 = *MEMORY[0x24BDD0FC8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected object in metaparameter array"));
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v85 = v53;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();

                  v56 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v55) + 16));
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v54, "objectForKeyedSubscript:", v52);
                    v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v58 = objc_msgSend(v57, "UTF8String");
                    *(_DWORD *)buf = 136315650;
                    v79 = "PHASEAssetRegistry.mm";
                    v80 = 1024;
                    v81 = 2613;
                    v82 = 2080;
                    v83 = v58;
                    _os_log_impl(&dword_2164CC000, v56, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

                  }
                  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924648, v54);
                  *v60 = (id)objc_claimAutoreleasedReturnValue();

                }
                v51 = 0;
                v50 = v62;
                goto LABEL_31;
              }
              v46 = v68;
              v47 = (void *)MEMORY[0x24BDBCE70];
              objc_msgSend(v46, "identifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "value");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "dictionaryWithObjectsAndKeys:", v48, CFSTR("Name"), CFSTR("input"), CFSTR("Type"), CFSTR("string"), CFSTR("InputType"), v49, CFSTR("DefaultValue"), 0);
              v9 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v62, "addObject:", v9);
            }
          }

        }
      }
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      if (v67)
        continue;
      break;
    }
  }

  v50 = v62;
  v51 = v62;
LABEL_31:

  return v51;
}

- (void)fillOutDistanceFieldsWithParams:(id)a3 dictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v30 = v6;
  v31 = v5;
  if (v5)
  {
    objc_msgSend(v5, "fadeOutParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "fadeOutParameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cullDistance");
      objc_msgSend(v8, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v10, CFSTR("FadeOutCullDistance"));

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v30, "setObject:forKey:", CFSTR("geometric_spreading"), CFSTR("DistanceModelType"));
      v11 = v5;
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "rolloffFactor");
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v13, CFSTR("RolloffFactor"));

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v30, "setObject:forKey:", CFSTR("envelope"), CFSTR("DistanceModelType"));
        v29 = v5;
        v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v29, "envelope");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "segments");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v33 != v18)
                objc_enumerationMutation(v16);
              v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v21 = (void *)MEMORY[0x24BDBCED8];
              v22 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v20, "endPoint");
              objc_msgSend(v22, "numberWithDouble:");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v20, "endPoint");
              objc_msgSend(v24, "numberWithDouble:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              GetCurveTypeString((PHASECurveType)objc_msgSend(v20, "curveType"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v23, CFSTR("Distance"), v26, CFSTR("Gain"), v27, CFSTR("CurveType"), 0, v29);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "addObject:", v28);
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v17);
        }

        objc_msgSend(v30, "setObject:forKey:", v14, CFSTR("EnvelopeSegments"));
      }
    }
  }
  else
  {
    objc_msgSend(v6, "setObject:forKey:", CFSTR("none"), CFSTR("DistanceModelType"));
  }

}

- (void)fillOutDirectivityFieldsWithParams:(id)a3 dictionary:(id)a4 isListener:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  const __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  id v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id obj;
  id obja;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v5 = a5;
  v68 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v52 = v8;
  v53 = v7;
  if (v7)
  {
    v51 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v5)
        v9 = CFSTR("ListenerDirectivityModelType");
      else
        v9 = CFSTR("SourceDirectivityModelType");
      objc_msgSend(v52, "setObject:forKey:", CFSTR("cardioid"), v9);
      v54 = v7;
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      objc_msgSend(v54, "subbandParameters");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v63 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            v15 = (void *)MEMORY[0x24BDBCED8];
            v16 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v14, "frequency");
            objc_msgSend(v16, "numberWithDouble:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v14, "pattern");
            objc_msgSend(v18, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v14, "sharpness");
            objc_msgSend(v20, "numberWithDouble:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v17, CFSTR("Frequency"), v19, CFSTR("Pattern"), v21, CFSTR("Sharpness"), 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "addObject:", v22);
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        }
        while (v11);
      }

      if (v51)
        v23 = CFSTR("ListenerCardioidDirectivitySubbands");
      else
        v23 = CFSTR("SourceCardioidDirectivitySubbands");
      objc_msgSend(v52, "setObject:forKey:", v10, v23);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v5)
          v25 = CFSTR("ListenerDirectivityModelType");
        else
          v25 = CFSTR("SourceDirectivityModelType");
        objc_msgSend(v52, "setObject:forKey:", CFSTR("cone"), v25);
        v50 = v7;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        obja = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v50, "subbandParameters");
        v55 = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v59;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v59 != v27)
                objc_enumerationMutation(v55);
              v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
              v30 = (void *)MEMORY[0x24BDBCED8];
              v31 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v29, "frequency");
              objc_msgSend(v31, "numberWithDouble:");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v29, "innerAngle");
              objc_msgSend(v33, "numberWithDouble:");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v29, "outerAngle");
              objc_msgSend(v35, "numberWithDouble:");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v29, "outerGain");
              objc_msgSend(v37, "numberWithDouble:");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v32, CFSTR("Frequency"), v34, CFSTR("InnerAngle"), v36, CFSTR("OuterAngle"), v38, CFSTR("OuterGain"), 0, v50);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(obja, "addObject:", v39);
            }
            v26 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          }
          while (v26);
        }

        if (v51)
          v40 = CFSTR("ListenerConeDirectivitySubbands");
        else
          v40 = CFSTR("SourceConeDirectivitySubbands");
        objc_msgSend(v52, "setObject:forKey:", obja, v40);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v5)
            v41 = CFSTR("ListenerDirectivityModelType");
          else
            v41 = CFSTR("SourceDirectivityModelType");
          objc_msgSend(v52, "setObject:forKey:", CFSTR("sphericalcap"), v41);
          v42 = v7;
          v43 = (void *)MEMORY[0x24BDBCED8];
          v44 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v42, "sphereRadius");
          objc_msgSend(v44, "numberWithDouble:");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v42, "capOpeningAngle");
          objc_msgSend(v46, "numberWithDouble:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v45, CFSTR("SphereRadius"), v47, CFSTR("CapOpeningAngle"), 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
            v49 = CFSTR("ListenerSphericalCapDirectivityParameters");
          else
            v49 = CFSTR("SourceSphericalCapDirectivityParameters");
          objc_msgSend(v52, "setObject:forKey:", v48, v49);

        }
      }
    }
  }
  else
  {
    if (v5)
      v24 = CFSTR("ListenerDirectivityModelType");
    else
      v24 = CFSTR("SourceDirectivityModelType");
    objc_msgSend(v8, "setObject:forKey:", CFSTR("none"), v24);
  }

}

- (BOOL)checkNodeForValidChannelLayouts:(id)a3 assetRegistry:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  id v13;
  Phase *v14;
  NSString *v15;
  uint64_t v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  id v22;
  Phase *v23;
  NSString *v24;
  uint64_t v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  Phase::Logger *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  Phase::Logger *v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  int v56;
  uint64_t v58;
  void *v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_38;
  v9 = v7;
  objc_msgSend(v9, "mixerDefinition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v9, "mixerDefinition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v21 = objc_opt_isKindOfClass();

    if ((v21 & 1) == 0)
    {
LABEL_37:

LABEL_38:
      v54 = 1;
      goto LABEL_39;
    }
    objc_msgSend(v9, "mixerDefinition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v9;
      objc_msgSend(v22, "assetIdentifier");
      v23 = (Phase *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v8, "getSoundAssetInfo:", Phase::GetStringHashId(v23, v24));

      if (!v25)
      {
LABEL_14:

LABEL_36:
        goto LABEL_37;
      }
      v26 = *(_DWORD *)(v25 + 36);
      objc_msgSend(v12, "inputChannelLayout");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "layoutTag");

      if (v26 == v28)
        goto LABEL_36;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v9, "format");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "channelLayout");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "layoutTag");
        objc_msgSend(v12, "inputChannelLayout");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "layoutTag");

        if (v45 == v47)
          goto LABEL_36;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_36;
        objc_msgSend(v12, "inputChannelLayout");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "layoutTag");

        if (v56 == 6553601)
          goto LABEL_36;
      }
    }
    v48 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Channel layout mismatch between generator node and ambient mixer."), *MEMORY[0x24BDD0FC8]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v49;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v50)
                                                                                        + 16)));
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v36, "objectForKeyedSubscript:", v48);
      v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v53 = objc_msgSend(v52, "UTF8String");
      *(_DWORD *)buf = 136315650;
      v61 = "PHASEAssetRegistry.mm";
      v62 = 1024;
      v63 = 2844;
      v64 = 2080;
      v65 = v53;
      _os_log_impl(&dword_2164CC000, v51, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (!a5)
      goto LABEL_33;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924646, v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  objc_msgSend(v9, "mixerDefinition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
    objc_msgSend(v13, "assetIdentifier");
    v14 = (Phase *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "getSoundAssetInfo:", Phase::GetStringHashId(v14, v15));

    if (v16)
    {
      v17 = *(_DWORD *)(v16 + 36);
      objc_msgSend(v12, "inputChannelLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "layoutTag");

      if (v17 == v19)
        goto LABEL_36;
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v9, "format");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "channelLayout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "layoutTag");
    objc_msgSend(v12, "inputChannelLayout");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "layoutTag");

    if (v31 == v33)
      goto LABEL_36;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_36;
    objc_msgSend(v12, "inputChannelLayout");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "layoutTag");

    if (v42 == 6553601)
      goto LABEL_36;
  }
LABEL_17:
  v34 = *MEMORY[0x24BDD0FC8];
  v66 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Channel layout mismatch between generator node and channel mixer."));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v37)
                                                                                      + 16)));
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v36, "objectForKeyedSubscript:", v34);
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315650;
    v61 = "PHASEAssetRegistry.mm";
    v62 = 1024;
    v63 = 2793;
    v64 = 2080;
    v65 = objc_msgSend(v39, "UTF8String");
    _os_log_impl(&dword_2164CC000, v38, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

  }
  if (!a5)
    goto LABEL_33;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924646, v36);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
  *a5 = v40;
LABEL_33:

  v54 = 0;
LABEL_39:

  return v54;
}

- (id)createParseableDictionaryWithUID:(id)a3 rootNodes:(id)a4 globalParamUIDs:(id)a5 assetRegistry:(id)a6 outError:(id *)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  __int128 v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  Phase::Logger *v95;
  NSObject *v96;
  id v97;
  uint64_t v98;
  uint64_t v100;
  void *v101;
  Phase::Logger *v102;
  NSObject *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSString *v109;
  uint64_t i;
  uint64_t v111;
  id v112;
  id v113;
  NSMutableSet *v114;
  id *v115;
  id v116;
  uint64_t v117;
  id v118;
  id v119;
  id v120;
  id v121;
  __int128 v122;
  void *v123;
  PHASEActionTreeBuilder *v124;
  id obj;
  id v126;
  id v127;
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
  __int128 v143;
  uint64_t v144;
  void *v145;
  _QWORD v146[4];
  uint8_t buf[4];
  const char *v148;
  __int16 v149;
  int v150;
  __int16 v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  uint64_t v159;

  v159 = *MEMORY[0x24BDAC8D0];
  v118 = a3;
  v116 = a4;
  v119 = a5;
  v126 = a6;
  self->_nextNodeId = 0;
  v127 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a7)
    *a7 = 0;
  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  obj = v116;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v158, 16);
  if (!v12)
  {
LABEL_11:
    v124 = self;
    v115 = a7;

    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v113 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v114 = self->_mixNodes;
    v15 = a7;
    v108 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v136, v157, 16);
    if (!v108)
    {
LABEL_52:

      -[NSMutableSet allObjects](v124->_parameters, "allObjects");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHASEActionTreeBuilder getParamArray:globalParamUIDs:outError:](PHASEActionTreeBuilder, "getParamArray:globalParamUIDs:outError:", v90, v119, v115);
      v114 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();

      if (!v114)
      {
        v114 = 0;
        goto LABEL_61;
      }
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v118, CFSTR("Name"), v114, CFSTR("Parameters"), v113, CFSTR("Submixes"), v127, CFSTR("Nodes"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_62:

      v91 = v113;
      goto LABEL_63;
    }
    v111 = *(_QWORD *)v137;
LABEL_13:
    v117 = 0;
    while (1)
    {
      if (*(_QWORD *)v137 != v111)
        objc_enumerationMutation(v114);
      v123 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v117);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v121 = v123;
        v120 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        objc_msgSend(v121, "spatialPipeline");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "entries");
        v112 = (id)objc_claimAutoreleasedReturnValue();

        v106 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v132, v156, 16);
        if (v106)
        {
          v107 = *(_QWORD *)v133;
          do
          {
            for (i = 0; i != v106; ++i)
            {
              if (*(_QWORD *)v133 != v107)
                objc_enumerationMutation(v112);
              v17 = *(NSString **)(*((_QWORD *)&v132 + 1) + 8 * i);
              objc_msgSend(v121, "spatialPipeline");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "entries");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = v17;
              objc_msgSend(v19, "objectForKeyedSubscript:", v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v17) = v20 == 0;

              if ((_DWORD)v17)
                std::terminate();
              objc_msgSend(v121, "spatialPipeline");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "entries");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", v109);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v130 = 0u;
              v131 = 0u;
              v128 = 0u;
              v129 = 0u;
              objc_msgSend(v23, "tweakParams");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v128, v155, 16);
              if (v26)
              {
                v27 = *(_QWORD *)v129;
                while (2)
                {
                  for (j = 0; j != v26; ++j)
                  {
                    if (*(_QWORD *)v129 != v27)
                      objc_enumerationMutation(v25);
                    v29 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j);
                    objc_msgSend(v23, "tweakParams");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "objectForKeyedSubscript:", v29);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, v29);
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v92 = *MEMORY[0x24BDD0FC8];
                        v153 = *MEMORY[0x24BDD0FC8];
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected object in tweak param struct.  Must be a number or parameter."));
                        v93 = (void *)objc_claimAutoreleasedReturnValue();
                        v154 = v93;
                        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1);
                        v94 = (void *)objc_claimAutoreleasedReturnValue();

                        v96 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v95) + 16));
                        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                        {
                          objc_msgSend(v94, "objectForKeyedSubscript:", v92);
                          v97 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                          v98 = objc_msgSend(v97, "UTF8String");
                          *(_DWORD *)buf = 136315650;
                          v148 = "PHASEAssetRegistry.mm";
                          v149 = 1024;
                          v150 = 2915;
                          v151 = 2080;
                          v152 = v98;
                          _os_log_impl(&dword_2164CC000, v96, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

                        }
                        if (v115)
                        {
                          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924648, v94);
                          *v115 = (id)objc_claimAutoreleasedReturnValue();
                        }

                        goto LABEL_60;
                      }
                      v32 = v31;
                      objc_msgSend(v32, "identifier");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("metaparam_"), v29);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "setObject:forKeyedSubscript:", v33, v34);

                      -[PHASEActionTreeBuilder addParameter:](v124, "addParameter:", v32);
                    }

                  }
                  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v128, v155, 16);
                  if (v26)
                    continue;
                  break;
                }
              }

              v35 = (void *)MEMORY[0x24BDBCED8];
              GetSpatialCategoryStringFromSpatialCategoryKey(v109);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v23, "sendLevel");
              objc_msgSend(v37, "numberWithDouble:");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0);
              v39 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v36, CFSTR("Category"), v38, CFSTR("Send"), v39, CFSTR("SendHF"), v40, CFSTR("SendLF"), v24, CFSTR("TweakParams"), 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v23, "sendLevelMetaParameterDefinition");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v39) = v42 == 0;

              if ((v39 & 1) == 0)
              {
                objc_msgSend(v23, "sendLevelMetaParameterDefinition");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "identifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "setObject:forKey:", v44, CFSTR("SendParameterName"));

                objc_msgSend(v23, "sendLevelMetaParameterDefinition");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[PHASEActionTreeBuilder addParameter:](v124, "addParameter:", v45);

              }
              objc_msgSend(v120, "addObject:", v41);

            }
            v106 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v132, v156, 16);
          }
          while (v106);
        }

        v46 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v121, "identifier");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v121, "gain");
        objc_msgSend(v48, "numberWithDouble:");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "dictionaryWithObjectsAndKeys:", v47, CFSTR("Name"), CFSTR("spatial"), CFSTR("Type"), v49, CFSTR("Gain"), v120, CFSTR("SpatialCategories"), 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v121, "gainMetaParameterDefinition");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v47) = v51 == 0;

        if ((v47 & 1) == 0)
        {
          objc_msgSend(v121, "gainMetaParameterDefinition");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setObject:forKey:", v53, CFSTR("GainParameterName"));

          objc_msgSend(v121, "gainMetaParameterDefinition");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHASEActionTreeBuilder addParameter:](v124, "addParameter:", v54);

        }
        objc_msgSend(v121, "distanceModelParameters");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHASEActionTreeBuilder fillOutDistanceFieldsWithParams:dictionary:](v124, "fillOutDistanceFieldsWithParams:dictionary:", v55, v50);

        objc_msgSend(v121, "listenerDirectivityModelParameters");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHASEActionTreeBuilder fillOutDirectivityFieldsWithParams:dictionary:isListener:](v124, "fillOutDirectivityFieldsWithParams:dictionary:isListener:", v56, v50, 1);

        objc_msgSend(v121, "sourceDirectivityModelParameters");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHASEActionTreeBuilder fillOutDirectivityFieldsWithParams:dictionary:isListener:](v124, "fillOutDirectivityFieldsWithParams:dictionary:isListener:", v57, v50, 0);

        v58 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v121, "listenerDopplerFactor");
        objc_msgSend(v58, "numberWithDouble:");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setObject:forKey:", v59, CFSTR("ListenerDopplerFactor"));

        v60 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v121, "sourceDopplerFactor");
        objc_msgSend(v60, "numberWithDouble:");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setObject:forKey:", v61, CFSTR("SourceDopplerFactor"));

        objc_msgSend(v113, "addObject:", v50);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v62 = v123;
          v63 = (void *)MEMORY[0x24BDBCED8];
          objc_msgSend(v62, "identifier");
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v62, "gain");
          objc_msgSend(v65, "numberWithDouble:");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "inputChannelLayout");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          GetChannelLayoutString((Phase::ChannelLayout *)objc_msgSend(v67, "layoutTag"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "dictionaryWithObjectsAndKeys:", v64, CFSTR("Name"), CFSTR("channel"), CFSTR("Type"), v66, CFSTR("Gain"), v68, CFSTR("ChannelLayout"), 0);
          v120 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v62, "gainMetaParameterDefinition");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v64) = v69 == 0;

          if ((v64 & 1) == 0)
          {
            objc_msgSend(v62, "gainMetaParameterDefinition");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "identifier");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "setObject:forKey:", v71, CFSTR("GainParameterName"));

            objc_msgSend(v62, "gainMetaParameterDefinition");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASEActionTreeBuilder addParameter:](v124, "addParameter:", v72);

          }
          objc_msgSend(v113, "addObject:", v120);
          goto LABEL_50;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v15)
            goto LABEL_62;
          v100 = *MEMORY[0x24BDD0FC8];
          v144 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected object in submix array"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = v101;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
          v121 = (id)objc_claimAutoreleasedReturnValue();

          v103 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v102)
                                                                                               + 16)));
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v121, "objectForKeyedSubscript:", v100);
            v104 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v105 = objc_msgSend(v104, "UTF8String");
            *(_DWORD *)buf = 136315650;
            v148 = "PHASEAssetRegistry.mm";
            v149 = 1024;
            v150 = 3021;
            v151 = 2080;
            v152 = v105;
            _os_log_impl(&dword_2164CC000, v103, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

          }
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924648, v121);
          *v115 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:

LABEL_61:
          v15 = 0;
          goto LABEL_62;
        }
        v73 = v123;
        objc_msgSend(v73, "orientation");
        v122 = v74;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)&v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v146[0] = v75;
        HIDWORD(v76) = DWORD1(v122);
        LODWORD(v76) = DWORD1(v122);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v146[1] = v77;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v122), DWORD2(v122))));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v146[2] = v78;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v122), HIDWORD(v122))));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v146[3] = v79;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v146, 4);
        v120 = (id)objc_claimAutoreleasedReturnValue();

        v80 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v73, "identifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v73, "gain");
        objc_msgSend(v82, "numberWithDouble:");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "inputChannelLayout");
        v84 = objc_claimAutoreleasedReturnValue();
        GetChannelLayoutString((Phase::ChannelLayout *)objc_msgSend((id)v84, "layoutTag"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "dictionaryWithObjectsAndKeys:", v81, CFSTR("Name"), CFSTR("ambient"), CFSTR("Type"), v83, CFSTR("Gain"), v120, CFSTR("Orientation"), v85, CFSTR("ChannelLayout"), 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v73, "gainMetaParameterDefinition");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v84) = v86 == 0;

        if ((v84 & 1) == 0)
        {
          objc_msgSend(v73, "gainMetaParameterDefinition");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "identifier");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setObject:forKey:", v88, CFSTR("GainParameterName"));

          objc_msgSend(v73, "gainMetaParameterDefinition");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHASEActionTreeBuilder addParameter:](v124, "addParameter:", v89);

        }
        objc_msgSend(v113, "addObject:", v50);
      }

LABEL_50:
      ++v117;
      v15 = v115;
      if (v117 == v108)
      {
        v108 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v136, v157, 16);
        if (v108)
          goto LABEL_13;
        goto LABEL_52;
      }
    }
  }
  v13 = *(_QWORD *)v141;
LABEL_5:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v141 != v13)
      objc_enumerationMutation(obj);
    if (!-[PHASEActionTreeBuilder processNode:withArray:assetRegistry:outError:](self, "processNode:withArray:assetRegistry:outError:", *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v14), v127, v126, a7))break;
    if (v12 == ++v14)
    {
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v158, 16);
      if (!v12)
        goto LABEL_11;
      goto LABEL_5;
    }
  }
  v15 = 0;
  v91 = obj;
LABEL_63:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixNodes, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_rootNodes, 0);
}

@end
