@implementation ML3DAAPImportOperation

- (void)dealloc
{
  void *importSession;
  objc_super v4;

  importSession = self->_importSession;
  if (importSession)
    (*(void (**)(void *, SEL))(*(_QWORD *)importSession + 8))(importSession, a2);
  v4.receiver = self;
  v4.super_class = (Class)ML3DAAPImportOperation;
  -[ML3DAAPImportOperation dealloc](&v4, sel_dealloc);
}

- (BOOL)performImportOfSourceType:(int)a3 usingConnection:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t n;
  double v24;
  void *v25;
  double v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  double v37;
  void *v38;
  double v39;
  NSObject *v40;
  ML3ImportSession *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL *p_importSessionStarted;
  ML3ImportSession *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  double v57;
  void *v58;
  double v59;
  NSObject *v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  double v71;
  void *v72;
  double v73;
  NSObject *v74;
  void *v75;
  BOOL v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  NSObject *v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t k;
  double v86;
  void *v87;
  double v88;
  NSObject *v89;
  void *v90;
  BOOL v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t m;
  double v99;
  NSObject *v100;
  void *v101;
  double v102;
  NSObject *v103;
  ML3ImportSession *v104;
  double v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  NSObject *v111;
  NSObject *v112;
  double v113;
  double v114;
  int v115;
  double v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  NSObject *v122;
  NSObject *v123;
  double v124;
  double v125;
  int v126;
  double v128;
  double v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  double v133;
  NSObject *v134;
  NSObject *v135;
  double v136;
  double v137;
  int v138;
  double v139;
  double v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  int v145;
  NSObject *v146;
  _BOOL4 v147;
  NSObject *v148;
  double v149;
  double v150;
  int v151;
  int v152;
  ML3DatabaseConnection *v153;
  ML3MusicLibrary *v154;
  int v155;
  void *v156;
  ML3ImportSession **p_importSession;
  id v158;
  id v159;
  id v160;
  int v161;
  id v162;
  id v163;
  id obj;
  void *v165;
  ML3DAAPImportOperation *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  id v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  id v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  id v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  id v218;
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  uint8_t v229[128];
  uint8_t buf[4];
  double v231;
  __int16 v232;
  double v233;
  _BYTE v234[128];
  uint64_t v235;

  v235 = *MEMORY[0x1E0C80C00];
  v153 = (ML3DatabaseConnection *)a4;
  v152 = a3;
  self->_sourceType = a3;
  self->_clientInitiatedReset = 0;
  v166 = self;
  -[ML3ImportOperation import](self, "import");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "library");
  v154 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    if (self->_sourceType == 2)
    {
      -[ML3ImportOperation import](self, "import");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_clientInitiatedReset = objc_msgSend(v6, "clientInitiatedReset");

      objc_msgSend(v156, "albumData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "length");

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0CB38B0];
        objc_msgSend(v156, "albumData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v218 = 0;
        objc_msgSend(v9, "propertyListWithData:options:format:error:", v10, 0, 0, &v218);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = COERCE_DOUBLE(v218);

        if (v11 == 0.0)
        {
          v155 = 1;
        }
        else
        {
          v12 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v231 = v11;
            _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Failed to deserialize album data with error: %{public}@", buf, 0xCu);
          }

          v155 = 0;
        }

      }
      else
      {
        v155 = 1;
      }
      v216 = 0u;
      v217 = 0u;
      v214 = 0u;
      v215 = 0u;
      v159 = v8;
      v54 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v214, v234, 16);
      if (v54)
      {
        v161 = 0;
        v55 = *(_QWORD *)v215;
        do
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v215 != v55)
              objc_enumerationMutation(v159);
            v57 = *(double *)(*((_QWORD *)&v214 + 1) + 8 * i);
            objc_msgSend(v165, "attributesOfItemAtPath:error:", *(_QWORD *)&v57, 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = COERCE_DOUBLE(objc_msgSend(v58, "fileSize"));

            v60 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v231 = v59;
              v232 = 2114;
              v233 = v57;
              _os_log_impl(&dword_1AC149000, v60, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of album data from: %{public}@", buf, 0x16u);
            }

            -[ML3DAAPImportOperation _preprocessDAAPPayloadFromFile:entityType:](v166, "_preprocessDAAPPayloadFromFile:entityType:", *(_QWORD *)&v57, 0);
            v161 |= *(_QWORD *)&v59 != 0;
          }
          v54 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v214, v234, 16);
        }
        while (v54);
      }
      else
      {
        v161 = 0;
      }

      objc_msgSend(v156, "albumArtistData");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "length") == 0;

      if (v62)
      {
        v65 = 0;
      }
      else
      {
        v63 = (void *)MEMORY[0x1E0CB38B0];
        objc_msgSend(v156, "albumArtistData");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v213 = 0;
        objc_msgSend(v63, "propertyListWithData:options:format:error:", v64, 0, 0, &v213);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = COERCE_DOUBLE(v213);

        if (v66 != 0.0)
        {
          v67 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v231 = v66;
            _os_log_impl(&dword_1AC149000, v67, OS_LOG_TYPE_DEFAULT, "Failed to deserialize artist data with error: %{public}@", buf, 0xCu);
          }

          v155 = 0;
        }

      }
      v211 = 0u;
      v212 = 0u;
      v209 = 0u;
      v210 = 0u;
      v160 = v65;
      v19 = 0;
      v68 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v209, v229, 16);
      if (v68)
      {
        v69 = *(_QWORD *)v210;
        do
        {
          for (j = 0; j != v68; ++j)
          {
            if (*(_QWORD *)v210 != v69)
              objc_enumerationMutation(v160);
            v71 = *(double *)(*((_QWORD *)&v209 + 1) + 8 * j);
            objc_msgSend(v165, "attributesOfItemAtPath:error:", *(_QWORD *)&v71, 0);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = COERCE_DOUBLE(objc_msgSend(v72, "fileSize"));

            v74 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v231 = v73;
              v232 = 2114;
              v233 = v71;
              _os_log_impl(&dword_1AC149000, v74, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of artist data from: %{public}@", buf, 0x16u);
            }

            -[ML3DAAPImportOperation _preprocessDAAPPayloadFromFile:entityType:](v166, "_preprocessDAAPPayloadFromFile:entityType:", *(_QWORD *)&v71, 1);
            v19 |= *(_QWORD *)&v73 != 0;
          }
          v68 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v209, v229, 16);
        }
        while (v68);
      }

    }
    else
    {
      v159 = 0;
      v160 = 0;
      v19 = 0;
      v161 = 0;
      v155 = 1;
    }
    objc_msgSend(v156, "trackData");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "length") == 0;

    if (v76)
    {
      v79 = 0;
    }
    else
    {
      v77 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v156, "trackData");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v208 = 0;
      objc_msgSend(v77, "propertyListWithData:options:format:error:", v78, 0, 0, &v208);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = COERCE_DOUBLE(v208);

      if (v80 != 0.0)
      {
        v81 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v231 = v80;
          _os_log_impl(&dword_1AC149000, v81, OS_LOG_TYPE_DEFAULT, "Failed to deserialize track data with error: %{public}@", buf, 0xCu);
        }

        v155 = 0;
      }

    }
    v206 = 0u;
    v207 = 0u;
    v204 = 0u;
    v205 = 0u;
    obj = v79;
    v82 = 0;
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v228, 16);
    if (v83)
    {
      v84 = *(_QWORD *)v205;
      do
      {
        for (k = 0; k != v83; ++k)
        {
          if (*(_QWORD *)v205 != v84)
            objc_enumerationMutation(obj);
          v86 = *(double *)(*((_QWORD *)&v204 + 1) + 8 * k);
          objc_msgSend(v165, "attributesOfItemAtPath:error:", *(_QWORD *)&v86, 0);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = COERCE_DOUBLE(objc_msgSend(v87, "fileSize"));

          v89 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v231 = v88;
            v232 = 2114;
            v233 = v86;
            _os_log_impl(&dword_1AC149000, v89, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of track data from: %{public}@", buf, 0x16u);
          }

          -[ML3DAAPImportOperation _preprocessDAAPPayloadFromFile:entityType:](v166, "_preprocessDAAPPayloadFromFile:entityType:", *(_QWORD *)&v86, 2);
          v82 |= *(_QWORD *)&v88 != 0;
        }
        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v228, 16);
      }
      while (v83);
    }

    objc_msgSend(v156, "playlistData");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "length") == 0;

    if (v91)
    {
      v94 = 0;
    }
    else
    {
      v92 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v156, "playlistData");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "propertyListWithData:options:format:error:", v93, 0, 0, 0);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    v163 = v94;
    v95 = 0;
    v96 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v200, v227, 16);
    if (v96)
    {
      v97 = *(_QWORD *)v201;
      do
      {
        for (m = 0; m != v96; ++m)
        {
          if (*(_QWORD *)v201 != v97)
            objc_enumerationMutation(v163);
          v99 = *(double *)(*((_QWORD *)&v200 + 1) + 8 * m);
          if (objc_msgSend(obj, "containsObject:", *(_QWORD *)&v99))
          {
            v100 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v231 = v99;
              _os_log_impl(&dword_1AC149000, v100, OS_LOG_TYPE_DEFAULT, "Skipping playlist import file '%{public}@' because it was already processed", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(v165, "attributesOfItemAtPath:error:", *(_QWORD *)&v99, 0);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = COERCE_DOUBLE(objc_msgSend(v101, "fileSize"));

            v103 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v231 = v102;
              v232 = 2114;
              v233 = v99;
              _os_log_impl(&dword_1AC149000, v103, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of playlist data from: %{public}@", buf, 0x16u);
            }

            -[ML3DAAPImportOperation _preprocessDAAPPayloadFromFile:entityType:](v166, "_preprocessDAAPPayloadFromFile:entityType:", *(_QWORD *)&v99, 3);
            v95 |= *(_QWORD *)&v102 != 0;
          }
        }
        v96 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v200, v227, 16);
      }
      while (v96);
    }

    if (v155)
    {
      if (((v82 | v95 | v161 | v19) & 1) == 0)
      {
        LOBYTE(v155) = 1;
        goto LABEL_163;
      }
      v104 = (ML3ImportSession *)operator new();
      ML3ImportSession::ML3ImportSession(v104, v154, v153, v152, 1);
      p_importSession = (ML3ImportSession **)&v166->_importSession;
      v166->_importSession = v104;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v106 = v105;
      v198 = 0u;
      v199 = 0u;
      v196 = 0u;
      v197 = 0u;
      v162 = v160;
      v107 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v196, v226, 16);
      if (v107)
      {
        v108 = *(_QWORD *)v197;
LABEL_135:
        v109 = 0;
        while (1)
        {
          if (*(_QWORD *)v197 != v108)
            objc_enumerationMutation(v162);
          v110 = *(double *)(*((_QWORD *)&v196 + 1) + 8 * v109);
          if ((-[ML3DAAPImportOperation isCancelled](v166, "isCancelled") & 1) != 0)
            break;
          v111 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v231 = v110;
            _os_log_impl(&dword_1AC149000, v111, OS_LOG_TYPE_DEFAULT, "Starting to import artist from: %{public}@", buf, 0xCu);
          }

          -[ML3DAAPImportOperation _importDAAPPayloadFromFile:entityType:](v166, "_importDAAPPayloadFromFile:entityType:", *(_QWORD *)&v110, 1);
          if (v107 == ++v109)
          {
            v107 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v196, v226, 16);
            if (v107)
              goto LABEL_135;
            break;
          }
        }
      }

      v112 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v114 = v113;
        v115 = objc_msgSend(v162, "count");
        *(_DWORD *)buf = 134218240;
        v231 = v114 - v106;
        v232 = 1024;
        LODWORD(v233) = v115;
        _os_log_impl(&dword_1AC149000, v112, OS_LOG_TYPE_DEFAULT, "Import Metrics: Finished importing Album Artist in %2f seconds (fileCount=%d)", buf, 0x12u);
      }

      if (v166->_importError)
      {
        LOBYTE(v155) = 0;
        v160 = v162;
        goto LABEL_163;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v117 = v116;
      v194 = 0u;
      v195 = 0u;
      v192 = 0u;
      v193 = 0u;
      v158 = v159;
      v118 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v192, v225, 16);
      if (v118)
      {
        v119 = *(_QWORD *)v193;
LABEL_150:
        v120 = 0;
        while (1)
        {
          if (*(_QWORD *)v193 != v119)
            objc_enumerationMutation(v158);
          v121 = *(double *)(*((_QWORD *)&v192 + 1) + 8 * v120);
          if ((-[ML3DAAPImportOperation isCancelled](v166, "isCancelled") & 1) != 0)
            break;
          v122 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v231 = v121;
            _os_log_impl(&dword_1AC149000, v122, OS_LOG_TYPE_DEFAULT, "Starting to import albums from: %{public}@", buf, 0xCu);
          }

          -[ML3DAAPImportOperation _importDAAPPayloadFromFile:entityType:](v166, "_importDAAPPayloadFromFile:entityType:", *(_QWORD *)&v121, 0);
          if (v118 == ++v120)
          {
            v118 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v192, v225, 16);
            if (v118)
              goto LABEL_150;
            break;
          }
        }
      }

      v123 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v125 = v124;
        v126 = objc_msgSend(v158, "count");
        *(_DWORD *)buf = 134218240;
        v231 = v125 - v117;
        v232 = 1024;
        LODWORD(v233) = v126;
        _os_log_impl(&dword_1AC149000, v123, OS_LOG_TYPE_DEFAULT, "Import Metrics: Finished importing Album in %2f seconds (fileCount=%d)", buf, 0x12u);
      }

      if (v166->_importError)
      {
        LOBYTE(v155) = 0;
        goto LABEL_162;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v129 = v128;
      v190 = 0u;
      v191 = 0u;
      v188 = 0u;
      v189 = 0u;
      v42 = obj;
      v130 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v188, v224, 16);
      if (v130)
      {
        v131 = *(_QWORD *)v189;
LABEL_167:
        v132 = 0;
        while (1)
        {
          if (*(_QWORD *)v189 != v131)
            objc_enumerationMutation(v42);
          v133 = *(double *)(*((_QWORD *)&v188 + 1) + 8 * v132);
          if ((-[ML3DAAPImportOperation isCancelled](v166, "isCancelled") & 1) != 0)
            break;
          v134 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v231 = v133;
            _os_log_impl(&dword_1AC149000, v134, OS_LOG_TYPE_DEFAULT, "Starting to import tracks from: %{public}@", buf, 0xCu);
          }

          -[ML3DAAPImportOperation _importDAAPPayloadFromFile:entityType:](v166, "_importDAAPPayloadFromFile:entityType:", *(_QWORD *)&v133, 2);
          if (v130 == ++v132)
          {
            v130 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v188, v224, 16);
            if (v130)
              goto LABEL_167;
            break;
          }
        }
      }

      _ML3LogCategoryDefault();
      v135 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v137 = v136;
        v138 = objc_msgSend(v42, "count");
        *(_DWORD *)buf = 134218240;
        v231 = v137 - v129;
        v232 = 1024;
        LODWORD(v233) = v138;
        _os_log_impl(&dword_1AC149000, v135, OS_LOG_TYPE_DEFAULT, "Import Metrics: Finished importing Tracks in %2f seconds (fileCount=%d)", buf, 0x12u);
      }

      if (v166->_importError)
      {
        LOBYTE(v155) = 0;
        goto LABEL_67;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v140 = v139;
      v186 = 0u;
      v187 = 0u;
      v184 = 0u;
      v185 = 0u;
      v47 = v163;
      v141 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v184, v223, 16);
      if (v141)
      {
        v142 = *(_QWORD *)v185;
LABEL_181:
        v143 = 0;
        while (1)
        {
          if (*(_QWORD *)v185 != v142)
            objc_enumerationMutation(v47);
          v144 = *(double *)(*((_QWORD *)&v184 + 1) + 8 * v143);
          if ((-[ML3DAAPImportOperation isCancelled](v166, "isCancelled") & 1) != 0)
            break;
          v145 = objc_msgSend(v42, "containsObject:", *(_QWORD *)&v144);
          v146 = os_log_create("com.apple.amp.medialibrary", "Default");
          v147 = os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT);
          if (v145)
          {
            if (v147)
            {
              *(_DWORD *)buf = 138543362;
              v231 = v144;
              _os_log_impl(&dword_1AC149000, v146, OS_LOG_TYPE_DEFAULT, "Skipping playlist import file '%{public}@' because it was already processed", buf, 0xCu);
            }

          }
          else
          {
            if (v147)
            {
              *(_DWORD *)buf = 138543362;
              v231 = v144;
              _os_log_impl(&dword_1AC149000, v146, OS_LOG_TYPE_DEFAULT, "Starting to import playlists from: %{public}@", buf, 0xCu);
            }

            -[ML3DAAPImportOperation _importDAAPPayloadFromFile:entityType:](v166, "_importDAAPPayloadFromFile:entityType:", *(_QWORD *)&v144, 3);
          }
          if (v141 == ++v143)
          {
            v141 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v184, v223, 16);
            if (v141)
              goto LABEL_181;
            break;
          }
        }
      }

      _ML3LogCategoryDefault();
      v148 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v150 = v149;
        v151 = objc_msgSend(v47, "count");
        *(_DWORD *)buf = 134218240;
        v231 = v150 - v140;
        v232 = 1024;
        LODWORD(v233) = v151;
        _os_log_impl(&dword_1AC149000, v148, OS_LOG_TYPE_DEFAULT, "Import Metrics: Finished importing Playlists in %2f seconds (fileCount=%d)", buf, 0x12u);
      }

      if (v166->_importError)
      {
        LOBYTE(v155) = 0;
LABEL_66:
        v163 = v47;
LABEL_67:
        obj = v42;
LABEL_162:
        v159 = v158;
        v160 = v162;
        goto LABEL_163;
      }
      p_importSessionStarted = &v166->_importSessionStarted;
      if (!v166->_importSessionStarted)
      {
        LOBYTE(v155) = 1;
        goto LABEL_66;
      }
      LOBYTE(v155) = ML3ImportSession::finish(*p_importSession);
LABEL_63:
      if (*p_importSession)
        (*(void (**)(ML3ImportSession *))(*(_QWORD *)*p_importSession + 8))(*p_importSession);
      *p_importSession = 0;
      *p_importSessionStarted = 0;
      goto LABEL_66;
    }
  }
  else
  {
    objc_msgSend(v156, "trackData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "length");

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v156, "trackData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = 0;
      objc_msgSend(v15, "propertyListWithData:options:format:error:", v16, 0, 0, &v183);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = COERCE_DOUBLE(v183);

      v155 = *(_QWORD *)&v17 == 0;
      if (v17 != 0.0)
      {
        v18 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v231 = v17;
          _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "Failed to deserialize track data with error: %{public}@", buf, 0xCu);
        }

      }
    }
    else
    {
      v155 = 1;
    }
    v181 = 0u;
    v182 = 0u;
    v179 = 0u;
    v180 = 0u;
    obj = v14;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v222, 16);
    v21 = 0;
    if (v20)
    {
      v22 = *(_QWORD *)v180;
      do
      {
        for (n = 0; n != v20; ++n)
        {
          if (*(_QWORD *)v180 != v22)
            objc_enumerationMutation(obj);
          v24 = *(double *)(*((_QWORD *)&v179 + 1) + 8 * n);
          objc_msgSend(v165, "attributesOfItemAtPath:error:", *(_QWORD *)&v24, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = COERCE_DOUBLE(objc_msgSend(v25, "fileSize"));

          v27 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v231 = v26;
            v232 = 2114;
            v233 = v24;
            _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of track data from: %{public}@", buf, 0x16u);
          }

          -[ML3DAAPImportOperation _preprocessDAAPPayloadFromFile:entityType:](v166, "_preprocessDAAPPayloadFromFile:entityType:", *(_QWORD *)&v24, 2);
          v21 |= *(_QWORD *)&v26 != 0;
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v222, 16);
      }
      while (v20);
    }

    objc_msgSend(v156, "playlistData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length") == 0;

    if (v29)
    {
      v32 = 0;
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v156, "playlistData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "propertyListWithData:options:format:error:", v31, 0, 0, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v163 = v32;
    v33 = 0;
    v34 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v175, v221, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v176;
      do
      {
        for (ii = 0; ii != v34; ++ii)
        {
          if (*(_QWORD *)v176 != v35)
            objc_enumerationMutation(v163);
          v37 = *(double *)(*((_QWORD *)&v175 + 1) + 8 * ii);
          objc_msgSend(v165, "attributesOfItemAtPath:error:", *(_QWORD *)&v37, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = COERCE_DOUBLE(objc_msgSend(v38, "fileSize"));

          v40 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v231 = v39;
            v232 = 2114;
            v233 = v37;
            _os_log_impl(&dword_1AC149000, v40, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of playlist data from: %{public}@", buf, 0x16u);
          }

          -[ML3DAAPImportOperation _preprocessDAAPPayloadFromFile:entityType:](v166, "_preprocessDAAPPayloadFromFile:entityType:", *(_QWORD *)&v37, 3);
          v33 |= *(_QWORD *)&v39 != 0;
        }
        v34 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v175, v221, 16);
      }
      while (v34);
    }

    if ((v155 & (v21 | v33)) == 1)
    {
      v41 = (ML3ImportSession *)operator new();
      ML3ImportSession::ML3ImportSession(v41, v154, v153, v152, 1);
      p_importSession = (ML3ImportSession **)&v166->_importSession;
      v166->_importSession = v41;
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      v174 = 0u;
      v42 = obj;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v171, v220, 16);
      if (v43)
      {
        v44 = *(_QWORD *)v172;
LABEL_40:
        v45 = 0;
        while (1)
        {
          if (*(_QWORD *)v172 != v44)
            objc_enumerationMutation(v42);
          v46 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * v45);
          if ((-[ML3DAAPImportOperation isCancelled](v166, "isCancelled") & 1) != 0)
            break;
          -[ML3DAAPImportOperation _importDAAPPayloadFromFile:](v166, "_importDAAPPayloadFromFile:", v46);
          if (v43 == ++v45)
          {
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v171, v220, 16);
            if (v43)
              goto LABEL_40;
            break;
          }
        }
      }

      v169 = 0u;
      v170 = 0u;
      v167 = 0u;
      v168 = 0u;
      v47 = v163;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v167, v219, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v168;
LABEL_48:
        v50 = 0;
        while (1)
        {
          if (*(_QWORD *)v168 != v49)
            objc_enumerationMutation(v47);
          v51 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * v50);
          if ((-[ML3DAAPImportOperation isCancelled](v166, "isCancelled") & 1) != 0)
            break;
          -[ML3DAAPImportOperation _importDAAPPayloadFromFile:](v166, "_importDAAPPayloadFromFile:", v51);
          if (v48 == ++v50)
          {
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v167, v219, 16);
            if (v48)
              goto LABEL_48;
            break;
          }
        }
      }

      if (v166->_importError)
      {
        v159 = 0;
        v160 = 0;
        LOBYTE(v155) = 0;
      }
      else
      {
        p_importSessionStarted = &v166->_importSessionStarted;
        if (v166->_importSessionStarted)
        {
          v53 = *p_importSession;
          v155 = ML3ImportSession::flush(*p_importSession, 1);
          if (v155)
            ML3ImportSession::_finishImport((id *)v53);
          v162 = 0;
          v158 = 0;
          goto LABEL_63;
        }
        v159 = 0;
        v160 = 0;
        LOBYTE(v155) = 1;
      }
      v163 = v47;
      obj = v42;
    }
    else
    {
      v159 = 0;
      v160 = 0;
    }
  }
LABEL_163:

  return v155;
}

- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  uint64_t *v3;
  Element *var0;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  __shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  shared_ptr<ML3DAAPImportItem> result;

  var0 = a3.var0;
  v5 = v3;
  v6 = operator new();
  v7 = v6;
  v8 = *(_QWORD *)var0;
  v9 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  *(_WORD *)(v6 + 16) = 256;
  *(_BYTE *)(v6 + 18) = 1;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_DWORD *)(v6 + 56) = 1065353216;
  *(_QWORD *)v6 = &off_1E5B4D050;
  *(_QWORD *)(v6 + 8) = 0;
  *(_QWORD *)(v6 + 64) = v8;
  *(_QWORD *)(v6 + 72) = v9;
  if (v9)
  {
    v12 = (unint64_t *)&v9->__shared_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  *v5 = v6;
  v14 = operator new();
  *(_QWORD *)v14 = &off_1E5B51768;
  *(_QWORD *)(v14 + 8) = 0;
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = v7;
  v5[1] = v14;
  if (v9)
  {
    v16 = (unint64_t *)&v9->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  result.var1 = v15;
  result.var0 = (ML3DAAPImportItem *)v14;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:
{
  uint64_t *v5;
  __shared_weak_count *var1;
  Element *var0;
  uint64_t *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  _QWORD *v14;
  __shared_weak_count *v15;
  ML3DAAPImportItem *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20[3];
  void *__p;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  void **v26;
  shared_ptr<ML3DAAPImportItem> result;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = v5;
  v10 = operator new();
  v11 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v24 = *(_QWORD *)var0;
  v25 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  __p = 0;
  v22 = 0;
  v23 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, *(const void **)var1, *((_QWORD *)var1 + 1), (uint64_t)(*((_QWORD *)var1 + 1) - *(_QWORD *)var1) >> 3);
  memset(v20, 0, sizeof(v20));
  std::vector<std::unordered_set<std::string>>::__init_with_size[abi:ne180100]<std::unordered_set<std::string>*,std::unordered_set<std::string>*>((uint64_t)v20, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0xCCCCCCCCCCCCCCCDLL * (a4->__end_ - a4->__begin_));
  ML3DAAPContainerImportItem::ML3DAAPContainerImportItem(v10, &v24, (uint64_t)&__p, v20);
  *v9 = v10;
  v14 = (_QWORD *)operator new();
  *v14 = &off_1E5B51AB0;
  v14[1] = 0;
  v14[2] = 0;
  v14[3] = v10;
  v9[1] = (uint64_t)v14;
  v26 = (void **)v20;
  std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100](&v26);
  v16 = (ML3DAAPImportItem *)__p;
  if (__p)
  {
    v22 = __p;
    operator delete(__p);
  }
  v17 = v25;
  if (v25)
  {
    v18 = (unint64_t *)&v25->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  result.var1 = v15;
  result.var0 = v16;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)personImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  uint64_t *v3;
  Element *var0;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  __shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  shared_ptr<ML3DAAPImportItem> result;

  var0 = a3.var0;
  v5 = v3;
  v6 = operator new();
  v7 = v6;
  v8 = *(_QWORD *)var0;
  v9 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v16 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  ML3DAAPPersonImportItem::ML3DAAPPersonImportItem(v6, v8, v9);
  *v5 = v7;
  v12 = operator new();
  *(_QWORD *)v12 = &off_1E5B51960;
  *(_QWORD *)(v12 + 8) = 0;
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = v7;
  v5[1] = v12;
  if (v16)
  {
    v14 = (unint64_t *)&v16->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  result.var1 = v13;
  result.var0 = (ML3DAAPImportItem *)v12;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)albumImportItemFromDAAPTrackElement:(shared_ptr<ML3CPP::Element>)a3
{
  uint64_t *v3;
  Element *var0;
  uint64_t *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  ML3DAAPImportItem *v14;
  __shared_weak_count *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  shared_ptr<ML3DAAPImportItem> result;

  var0 = a3.var0;
  v6 = v3;
  v7 = operator new();
  v8 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v19 = *(_QWORD *)var0;
  v20 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  -[ML3ImportOperation import](self, "import", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "library");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ML3DAAPAlbumImportItem::ML3DAAPAlbumImportItem(v7, &v19, v12);
  *v6 = v7;
  v13 = (_QWORD *)operator new();
  *v13 = &off_1E5B51810;
  v13[1] = 0;
  v13[2] = 0;
  v13[3] = v7;
  v6[1] = (uint64_t)v13;

  v16 = v20;
  if (v20)
  {
    v17 = (unint64_t *)&v20->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)artistImportItemFromDAAPTrackElement:(shared_ptr<ML3CPP:(int64_t)a4 :Element>)a3 artistEntityType:
{
  uint64_t *v4;
  __shared_weak_count *var1;
  Element *var0;
  uint64_t *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  ML3DAAPImportItem *v16;
  __shared_weak_count *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  shared_ptr<ML3DAAPImportItem> result;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = v4;
  v9 = operator new();
  v10 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v21 = *(_QWORD *)var0;
  v22 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  -[ML3ImportOperation import](self, "import", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "library");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ML3DAAPArtistImportItem::ML3DAAPArtistImportItem(v9, &v21, (uint64_t)var1, v14);
  *v8 = v9;
  v15 = (_QWORD *)operator new();
  *v15 = &off_1E5B518B8;
  v15[1] = 0;
  v15[2] = 0;
  v15[3] = v9;
  v8[1] = (uint64_t)v15;

  v18 = v22;
  if (v22)
  {
    v19 = (unint64_t *)&v22->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)albumImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  _QWORD *v3;
  shared_ptr<ML3DAAPImportItem> result;

  *v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ML3DAAPImportItem *)self;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)albumArtistImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  _QWORD *v3;
  shared_ptr<ML3DAAPImportItem> result;

  *v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ML3DAAPImportItem *)self;
  return result;
}

- (shared_ptr<ML3DAAPDeleteImportItem>)albumArtistItemFromDeletedDAAPArtistEntity:(const void *)a3
{
  _QWORD *v3;
  shared_ptr<ML3DAAPDeleteImportItem> result;

  *v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ML3DAAPDeleteImportItem *)self;
  return result;
}

- (shared_ptr<ML3DAAPDeleteImportItem>)albumItemFromDeletedDAAPAlbumEntity:(const void *)a3
{
  _QWORD *v3;
  shared_ptr<ML3DAAPDeleteImportItem> result;

  *v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ML3DAAPDeleteImportItem *)self;
  return result;
}

- (BOOL)_preprocessDAAPPayloadFromFile:(id)a3 entityType:(int)a4
{
  id v5;
  char *v6;
  _QWORD *v7;
  shared_ptr<DAAPParserDelegate> *p_delegate;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  ML3CPP::Parser *v12;
  DAAPParserDelegate *ptr;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *p_shared_weak_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  ML3CPP::Parser *v22;
  std::__shared_weak_count *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  char v31;
  __int128 v32;
  ML3CPP::Parser *v33;
  std::__shared_weak_count *v34;
  int v35;
  _QWORD v36[2];
  _BYTE v37[408];
  _QWORD v38[20];

  v38[19] = *MEMORY[0x1E0C80C00];
  v35 = a4;
  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "fileSystemRepresentation");
  std::ifstream::basic_ifstream(v36);
  v6 = (char *)operator new(0x68uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(_QWORD *)v6 = &off_1E5B516C0;
  *((_QWORD *)v6 + 3) = v36;
  *((_OWORD *)v6 + 2) = 0u;
  v6[48] = 0;
  *(_OWORD *)(v6 + 52) = 0u;
  *(_OWORD *)(v6 + 68) = 0u;
  *(_OWORD *)(v6 + 84) = 0u;
  *((_DWORD *)v6 + 25) = 0;
  v33 = (ML3CPP::Parser *)(v6 + 24);
  v34 = (std::__shared_weak_count *)v6;
  v31 = 1;
  v7 = operator new(0xD8uLL);
  v7[1] = 0;
  v7[2] = 0;
  *v7 = &off_1E5B51378;
  std::allocator<DAAPParserDelegate>::construct[abi:ne180100]<DAAPParserDelegate,ML3DAAPImportOperation * const {__strong}&,std::shared_ptr<ML3CPP::Parser> &,ML3DAAPImportOperationEntityType &,BOOL>((uint64_t)(v7 + 3), self, (uint64_t)(v6 + 24), (std::__shared_weak_count *)v6, (unsigned int *)&v35, &v31);
  *(_QWORD *)&v32 = v7 + 3;
  *((_QWORD *)&v32 + 1) = v7;
  p_delegate = &self->_delegate;
  std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)p_delegate, &v32);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
  if (*((_QWORD *)&v32 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = v33;
  ptr = p_delegate->__ptr_;
  cntrl = (std::__shared_weak_count *)p_delegate->__cntrl_;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&cntrl->__shared_weak_owners_;
    do
      v18 = __ldxr(p_shared_weak_owners);
    while (__stxr(v18 + 1, p_shared_weak_owners));
  }
  v19 = (std::__shared_weak_count *)*((_QWORD *)v12 + 2);
  *((_QWORD *)v12 + 1) = ptr;
  *((_QWORD *)v12 + 2) = cntrl;
  if (v19)
    std::__shared_weak_count::__release_weak(v19);
  if (cntrl)
  {
    v20 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v22 = v33;
  ML3CPP::Parser::parse(v33);
  v23 = (std::__shared_weak_count *)*((_QWORD *)v22 + 2);
  *((_QWORD *)v22 + 1) = 0;
  *((_QWORD *)v22 + 2) = 0;
  if (v23)
    std::__shared_weak_count::__release_weak(v23);
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)((char *)v36 + *(_QWORD *)(v36[0] - 24)), *(_DWORD *)&v37[*(_QWORD *)(v36[0] - 24) + 16] | 4);
  v32 = 0uLL;
  std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)p_delegate, &v32);
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
  if (*((_QWORD *)&v32 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v34;
  if (v34)
  {
    v28 = (unint64_t *)&v34->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v36[0] = *MEMORY[0x1E0DE4F40];
  *(_QWORD *)((char *)v36 + *(_QWORD *)(v36[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
  MEMORY[0x1AF43C5DC](v37);
  std::istream::~istream();
  MEMORY[0x1AF43C6FC](v38);

  return 1;
}

- (BOOL)_importDAAPPayloadFromFile:(id)a3 entityType:(int)a4
{
  id v5;
  char *v6;
  _QWORD *v7;
  shared_ptr<DAAPParserDelegate> *p_delegate;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  ML3CPP::Parser *v12;
  DAAPParserDelegate *ptr;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *p_shared_weak_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  ML3CPP::Parser *v22;
  std::__shared_weak_count *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  char v31;
  __int128 v32;
  ML3CPP::Parser *v33;
  std::__shared_weak_count *v34;
  int v35;
  _QWORD v36[2];
  _BYTE v37[408];
  _QWORD v38[20];

  v38[19] = *MEMORY[0x1E0C80C00];
  v35 = a4;
  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "fileSystemRepresentation");
  std::ifstream::basic_ifstream(v36);
  v6 = (char *)operator new(0x68uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(_QWORD *)v6 = &off_1E5B516C0;
  *((_QWORD *)v6 + 3) = v36;
  *((_OWORD *)v6 + 2) = 0u;
  v6[48] = 0;
  *(_OWORD *)(v6 + 52) = 0u;
  *(_OWORD *)(v6 + 68) = 0u;
  *(_OWORD *)(v6 + 84) = 0u;
  *((_DWORD *)v6 + 25) = 0;
  v33 = (ML3CPP::Parser *)(v6 + 24);
  v34 = (std::__shared_weak_count *)v6;
  v31 = 0;
  v7 = operator new(0xD8uLL);
  v7[1] = 0;
  v7[2] = 0;
  *v7 = &off_1E5B51378;
  std::allocator<DAAPParserDelegate>::construct[abi:ne180100]<DAAPParserDelegate,ML3DAAPImportOperation * const {__strong}&,std::shared_ptr<ML3CPP::Parser> &,ML3DAAPImportOperationEntityType &,BOOL>((uint64_t)(v7 + 3), self, (uint64_t)(v6 + 24), (std::__shared_weak_count *)v6, (unsigned int *)&v35, &v31);
  *(_QWORD *)&v32 = v7 + 3;
  *((_QWORD *)&v32 + 1) = v7;
  p_delegate = &self->_delegate;
  std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)p_delegate, &v32);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
  if (*((_QWORD *)&v32 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = v33;
  ptr = p_delegate->__ptr_;
  cntrl = (std::__shared_weak_count *)p_delegate->__cntrl_;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&cntrl->__shared_weak_owners_;
    do
      v18 = __ldxr(p_shared_weak_owners);
    while (__stxr(v18 + 1, p_shared_weak_owners));
  }
  v19 = (std::__shared_weak_count *)*((_QWORD *)v12 + 2);
  *((_QWORD *)v12 + 1) = ptr;
  *((_QWORD *)v12 + 2) = cntrl;
  if (v19)
    std::__shared_weak_count::__release_weak(v19);
  if (cntrl)
  {
    v20 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v22 = v33;
  ML3CPP::Parser::parse(v33);
  v23 = (std::__shared_weak_count *)*((_QWORD *)v22 + 2);
  *((_QWORD *)v22 + 1) = 0;
  *((_QWORD *)v22 + 2) = 0;
  if (v23)
    std::__shared_weak_count::__release_weak(v23);
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)((char *)v36 + *(_QWORD *)(v36[0] - 24)), *(_DWORD *)&v37[*(_QWORD *)(v36[0] - 24) + 16] | 4);
  v32 = 0uLL;
  std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)p_delegate, &v32);
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
  if (*((_QWORD *)&v32 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v34;
  if (v34)
  {
    v28 = (unint64_t *)&v34->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v36[0] = *MEMORY[0x1E0DE4F40];
  *(_QWORD *)((char *)v36 + *(_QWORD *)(v36[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
  MEMORY[0x1AF43C5DC](v37);
  std::istream::~istream();
  MEMORY[0x1AF43C6FC](v38);

  return 1;
}

- (BOOL)_importDAAPPayloadFromFile:(id)a3
{
  id v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  shared_ptr<DAAPParserDelegate> *p_delegate;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  ML3CPP::Parser *v16;
  DAAPParserDelegate *ptr;
  std::__shared_weak_count *cntrl;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *p_shared_weak_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  ML3CPP::Parser *v26;
  std::__shared_weak_count *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  __int128 v35;
  ML3CPP::Parser *v36;
  std::__shared_weak_count *v37;
  __int128 v38;
  _QWORD v39[2];
  _BYTE v40[408];
  _QWORD v41[20];

  v41[19] = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "fileSystemRepresentation");
  std::ifstream::basic_ifstream(v39);
  v5 = (std::__shared_weak_count *)operator new(0x68uLL);
  *(_OWORD *)&v5->__shared_owners_ = 0u;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B516C0;
  v5[1].__vftable = (std::__shared_weak_count_vtbl *)v39;
  *(_OWORD *)&v5[1].__shared_owners_ = 0u;
  LOBYTE(v5[2].__vftable) = 0;
  *(std::__shared_count *)((char *)&v5[2].std::__shared_count + 4) = 0u;
  *(_OWORD *)((char *)&v5[2].__shared_weak_owners_ + 4) = 0u;
  *(_OWORD *)((char *)&v5[3].__shared_owners_ + 4) = 0u;
  HIDWORD(v5[4].__vftable) = 0;
  v36 = (ML3CPP::Parser *)&v5[1];
  v37 = v5;
  v7 = operator new(0xD8uLL);
  v8 = v7;
  v7[1] = 0;
  v7[2] = 0;
  *v7 = &off_1E5B51378;
  v9 = v7 + 3;
  *(_QWORD *)&v38 = v5 + 1;
  *((_QWORD *)&v38 + 1) = v5;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  DAAPParserDelegate::DAAPParserDelegate((uint64_t)(v7 + 3), self, &v38);
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  *(_QWORD *)&v35 = v9;
  *((_QWORD *)&v35 + 1) = v8;
  p_delegate = &self->_delegate;
  std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)p_delegate, &v35);
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
  if (*((_QWORD *)&v35 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = v36;
  ptr = p_delegate->__ptr_;
  cntrl = (std::__shared_weak_count *)p_delegate->__cntrl_;
  if (cntrl)
  {
    v19 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
    p_shared_weak_owners = (unint64_t *)&cntrl->__shared_weak_owners_;
    do
      v22 = __ldxr(p_shared_weak_owners);
    while (__stxr(v22 + 1, p_shared_weak_owners));
  }
  v23 = (std::__shared_weak_count *)*((_QWORD *)v16 + 2);
  *((_QWORD *)v16 + 1) = ptr;
  *((_QWORD *)v16 + 2) = cntrl;
  if (v23)
    std::__shared_weak_count::__release_weak(v23);
  if (cntrl)
  {
    v24 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v26 = v36;
  ML3CPP::Parser::parse(v36);
  v27 = (std::__shared_weak_count *)*((_QWORD *)v26 + 2);
  *((_QWORD *)v26 + 1) = 0;
  *((_QWORD *)v26 + 2) = 0;
  if (v27)
    std::__shared_weak_count::__release_weak(v27);
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)((char *)v39 + *(_QWORD *)(v39[0] - 24)), *(_DWORD *)&v40[*(_QWORD *)(v39[0] - 24) + 16] | 4);
  v38 = 0uLL;
  std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)p_delegate, &v38);
  v28 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
  if (*((_QWORD *)&v38 + 1))
  {
    v29 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = v37;
  if (v37)
  {
    v32 = (unint64_t *)&v37->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v39[0] = *MEMORY[0x1E0DE4F40];
  *(_QWORD *)((char *)v39 + *(_QWORD *)(v39[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
  MEMORY[0x1AF43C5DC](v40);
  std::istream::~istream();
  MEMORY[0x1AF43C6FC](v41);

  return 1;
}

- (void)_finishParsingWithError:(id)a3
{
  NSError *v4;
  NSObject *v5;
  NSError *importError;
  int v7;
  NSError *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (NSError *)a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "parsing finished. error=%{public}@", (uint8_t *)&v7, 0xCu);
  }

  importError = self->_importError;
  self->_importError = v4;

}

- (BOOL)_processUpdateType:(unsigned __int8)a3
{
  self->_updateType = a3;
  return 1;
}

- (BOOL)_processTrackItemCount:(int)a3
{
  NSObject *v4;
  const char *v5;
  int64_t totalTrackCount;
  int64_t totalArtistCount;
  int64_t totalAlbumCount;
  int64_t totalContainerCount;
  int updateType;
  int v12;
  const char *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  self->_totalTrackCount += a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_importSessionStarted)
      v5 = "yes";
    else
      v5 = "no";
    totalTrackCount = self->_totalTrackCount;
    totalArtistCount = self->_totalArtistCount;
    totalAlbumCount = self->_totalAlbumCount;
    totalContainerCount = self->_totalContainerCount;
    updateType = self->_updateType;
    v12 = 136316418;
    v13 = v5;
    v14 = 2048;
    v15 = totalTrackCount;
    v16 = 2048;
    v17 = totalArtistCount;
    v18 = 2048;
    v19 = totalAlbumCount;
    v20 = 2048;
    v21 = totalContainerCount;
    v22 = 1024;
    v23 = updateType;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "updating entity counts for import session: sessionStarted=%s, %lld tracks, %lld artists, %lld albums, %lld containers for update type %d", (uint8_t *)&v12, 0x3Au);
  }

  return 1;
}

- (BOOL)_processTrackElement:(shared_ptr<ML3CPP::Element>)a3
{
  Element *var0;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  void *importSession;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  char v15;
  double v16;
  unint64_t *v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  __int16 v26[8];
  uint64_t v27[2];
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint8_t buf[8];
  uint64_t v31;

  var0 = a3.var0;
  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded", a3.var0, a3.var1))
  {
    v5 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v28 = *(_QWORD *)var0;
    v29 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    -[ML3DAAPImportOperation importItemFromDAAPElement:](self, "importItemFromDAAPElement:", &v28);
    v8 = v29;
    if (v29)
    {
      v9 = (unint64_t *)&v29->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)buf + 16))(*(_QWORD *)buf))
    {
      importSession = self->_importSession;
      v12 = (std::__shared_weak_count *)v31;
      v27[0] = *(_QWORD *)buf;
      v27[1] = v31;
      if (v31)
      {
        v13 = (unint64_t *)(v31 + 8);
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
      }
      v15 = ML3ImportSession::addTrack((uint64_t)importSession, v27, 0);
      if (v12)
      {
        v17 = (unint64_t *)&v12->__shared_owners_;
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    else
    {
      v20 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v26[0] = 0;
        _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEFAULT, "skipping invalid track", (uint8_t *)v26, 2u);
      }

      v15 = 1;
    }
    v21 = self->_processedTrackCount + 1;
    self->_processedTrackCount = v21;
    *(float *)&v16 = (float)(self->_processedContainerCount
                           + self->_processedAlbumCount
                           + v21
                           + self->_processedArtistCount)
                   / (float)(self->_totalContainerCount
                           + self->_totalTrackCount
                           + self->_totalAlbumCount
                           + self->_totalArtistCount);
    -[ML3DAAPImportOperation updateImportProgress:](self, "updateImportProgress:", v16);
    v22 = (std::__shared_weak_count *)v31;
    if (v31)
    {
      v23 = (unint64_t *)(v31 + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else
  {
    v19 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  return v15;
}

- (BOOL)_processTrackImportItem:(shared_ptr<ML3DAAPImportItem>)a3
{
  ML3DAAPImportItem *var0;
  void *importSession;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  char v9;
  double v10;
  unint64_t *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint8_t buf[16];

  var0 = a3.var0;
  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded", a3.var0, a3.var1))
  {
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)var0 + 16))(*(_QWORD *)var0))
    {
      importSession = self->_importSession;
      v6 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      v17 = *(_QWORD *)var0;
      v18 = v6;
      if (v6)
      {
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v8 = __ldxr(p_shared_owners);
        while (__stxr(v8 + 1, p_shared_owners));
      }
      v9 = ML3ImportSession::addTrack((uint64_t)importSession, &v17, 1);
      if (v6)
      {
        v11 = (unint64_t *)&v6->__shared_owners_;
        do
          v12 = __ldaxr(v11);
        while (__stlxr(v12 - 1, v11));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
      }
    }
    else
    {
      v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "skipping invalid track", buf, 2u);
      }

      v9 = 1;
    }
    v15 = self->_processedTrackCount + 1;
    self->_processedTrackCount = v15;
    *(float *)&v10 = (float)(self->_processedContainerCount
                           + self->_processedAlbumCount
                           + v15
                           + self->_processedArtistCount)
                   / (float)(self->_totalContainerCount
                           + self->_totalTrackCount
                           + self->_totalAlbumCount
                           + self->_totalArtistCount);
    -[ML3DAAPImportOperation updateImportProgress:](self, "updateImportProgress:", v10, v17, v18);
  }
  else
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  return v9;
}

- (BOOL)_processDeletedTrackId:(int64_t)a3
{
  uint64_t v5;
  int sourceType;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  void *importSession;
  unint64_t v10;
  char v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v18[2];
  uint8_t buf[8];
  std::__shared_weak_count *v20;

  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded"))
  {
    v5 = operator new();
    sourceType = self->_sourceType;
    *(_WORD *)(v5 + 16) = 256;
    *(_BYTE *)(v5 + 18) = 1;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_DWORD *)(v5 + 56) = 1065353216;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_QWORD *)v5 = &off_1E5B4DC90;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)(v5 + 64) = a3;
    *(_DWORD *)(v5 + 72) = sourceType;
    *(_QWORD *)buf = v5;
    v7 = (std::__shared_weak_count *)operator new();
    v7->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B518F0;
    v7->__shared_weak_owners_ = 0;
    v7[1].__vftable = (std::__shared_weak_count_vtbl *)v5;
    v20 = v7;
    importSession = self->_importSession;
    v18[0] = v5;
    v18[1] = (uint64_t)v7;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    v11 = ML3ImportSession::removeTrack((uint64_t)importSession, v18);
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    v13 = v20;
    if (v20)
    {
      v14 = (unint64_t *)&v20->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  return v11;
}

- (BOOL)_processContainerItemCount:(int)a3
{
  NSObject *v4;
  const char *v5;
  int64_t totalTrackCount;
  int64_t totalArtistCount;
  int64_t totalAlbumCount;
  int64_t totalContainerCount;
  int updateType;
  int v12;
  const char *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  self->_totalContainerCount += a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_importSessionStarted)
      v5 = "yes";
    else
      v5 = "no";
    totalTrackCount = self->_totalTrackCount;
    totalArtistCount = self->_totalArtistCount;
    totalAlbumCount = self->_totalAlbumCount;
    totalContainerCount = self->_totalContainerCount;
    updateType = self->_updateType;
    v12 = 136316418;
    v13 = v5;
    v14 = 2048;
    v15 = totalTrackCount;
    v16 = 2048;
    v17 = totalArtistCount;
    v18 = 2048;
    v19 = totalAlbumCount;
    v20 = 2048;
    v21 = totalContainerCount;
    v22 = 1024;
    v23 = updateType;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "updating entity counts for import session: sessionStarted=%s, %lld tracks, %lld artists, %lld albums, %lld containers for update type %d", (uint8_t *)&v12, 0x3Au);
  }

  return 1;
}

- (BOOL)_processContainerElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:
{
  __shared_weak_count *var1;
  Element *var0;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  void *importSession;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  char v19;
  double v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  int64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v30;
  std::__shared_weak_count *v31;
  void *v32[3];
  void *__p;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint8_t buf[8];
  std::__shared_weak_count *v39;
  uint8_t v40[8];

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded", a3.var0, a3.var1, a4, a5))
  {
    v9 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v36 = *(_QWORD *)var0;
    v37 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    __p = 0;
    v34 = 0;
    v35 = 0;
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, *(const void **)var1, *((_QWORD *)var1 + 1), (uint64_t)(*((_QWORD *)var1 + 1) - *(_QWORD *)var1) >> 3);
    memset(v32, 0, sizeof(v32));
    std::vector<std::unordered_set<std::string>>::__init_with_size[abi:ne180100]<std::unordered_set<std::string>*,std::unordered_set<std::string>*>((uint64_t)v32, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0xCCCCCCCCCCCCCCCDLL * (a4->__end_ - a4->__begin_));
    -[ML3DAAPImportOperation containerImportItemFromDAAPElement:withTrackIds:trackPersonIdentifiers:](self, "containerImportItemFromDAAPElement:withTrackIds:trackPersonIdentifiers:", &v36, &__p, v32);
    *(_QWORD *)v40 = v32;
    std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)v40);
    if (__p)
    {
      v34 = __p;
      operator delete(__p);
    }
    v12 = v37;
    if (v37)
    {
      v13 = (unint64_t *)&v37->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)buf + 16))(*(_QWORD *)buf))
    {
      importSession = self->_importSession;
      v16 = v39;
      v30 = *(_QWORD *)buf;
      v31 = v39;
      if (v39)
      {
        v17 = (unint64_t *)&v39->__shared_owners_;
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 + 1, v17));
      }
      v19 = ML3ImportSession::addContainer((uint64_t)importSession, &v30);
      if (v16)
      {
        v21 = (unint64_t *)&v16->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
    }
    else
    {
      v24 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_DEFAULT, "skipping invalid container", v40, 2u);
      }

      v19 = 1;
    }
    v25 = self->_processedContainerCount + 1;
    self->_processedContainerCount = v25;
    *(float *)&v20 = (float)(self->_processedTrackCount + self->_processedAlbumCount + v25 + self->_processedArtistCount)
                   / (float)(self->_totalContainerCount
                           + self->_totalTrackCount
                           + self->_totalAlbumCount
                           + self->_totalArtistCount);
    -[ML3DAAPImportOperation updateImportProgress:](self, "updateImportProgress:", v20, v30, v31);
    v26 = v39;
    if (v39)
    {
      v27 = (unint64_t *)&v39->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }
  else
  {
    v23 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v23, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  return v19;
}

- (BOOL)_processDeletedContainerId:(int64_t)a3
{
  uint64_t v5;
  int sourceType;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  void *importSession;
  unint64_t v10;
  char v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v18[2];
  uint8_t buf[8];
  std::__shared_weak_count *v20;

  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded"))
  {
    v5 = operator new();
    sourceType = self->_sourceType;
    *(_WORD *)(v5 + 16) = 256;
    *(_BYTE *)(v5 + 18) = 1;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_DWORD *)(v5 + 56) = 1065353216;
    *(_QWORD *)(v5 + 64) = a3;
    *(_DWORD *)(v5 + 72) = sourceType;
    *(_QWORD *)v5 = &off_1E5B4FC50;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)buf = v5;
    v7 = (std::__shared_weak_count *)operator new();
    v7->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51EA0;
    v7->__shared_weak_owners_ = 0;
    v7[1].__vftable = (std::__shared_weak_count_vtbl *)v5;
    v20 = v7;
    importSession = self->_importSession;
    v18[0] = v5;
    v18[1] = (uint64_t)v7;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    v11 = ML3ImportSession::removeContainer((uint64_t)importSession, v18);
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    v13 = v20;
    if (v20)
    {
      v14 = (unint64_t *)&v20->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  return v11;
}

- (BOOL)_processPersonElement:(shared_ptr<ML3CPP::Element>)a3
{
  Element *var0;
  BOOL v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  void *importSession;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v23[2];
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint8_t buf[8];
  uint64_t v27;

  var0 = a3.var0;
  v5 = -[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded", a3.var0, a3.var1);
  if (v5)
  {
    v6 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v24 = *(_QWORD *)var0;
    v25 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    -[ML3DAAPImportOperation personImportItemFromDAAPElement:](self, "personImportItemFromDAAPElement:", &v24);
    v9 = v25;
    if (v25)
    {
      v10 = (unint64_t *)&v25->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    importSession = self->_importSession;
    v13 = (std::__shared_weak_count *)v27;
    v23[0] = *(_QWORD *)buf;
    v23[1] = v27;
    if (v27)
    {
      v14 = (unint64_t *)(v27 + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    ML3ImportSession::addPerson((uint64_t)importSession, v23);
    if (v13)
    {
      v16 = (unint64_t *)&v13->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v18 = (std::__shared_weak_count *)v27;
    if (v27)
    {
      v19 = (unint64_t *)(v27 + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  else
  {
    v21 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

  }
  return v5;
}

- (BOOL)_processDeletedAlbumId:(const void *)a3
{
  id *importSession;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t AlbumPersistentID;
  unint64_t *v11;
  unint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  _BYTE *v20;
  NSObject *v21;
  _BYTE *v22;
  int v23;
  _BYTE *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint8_t v32[4];
  _BYTE *v33;
  _BYTE buf[12];
  __int16 v35;
  uint64_t v36;
  char v37;
  _BYTE v38[18];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded"))
  {
    -[ML3DAAPImportOperation albumItemFromDeletedDAAPAlbumEntity:](self, "albumItemFromDeletedDAAPAlbumEntity:", a3);
    if (!(*(unsigned int (**)())(*(_QWORD *)v30 + 16))())
    {
      v19 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)v30 + 88))(buf);
        v20 = v37 >= 0 ? buf : *(_BYTE **)buf;
        *(_DWORD *)v38 = 136446210;
        *(_QWORD *)&v38[4] = v20;
        _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_ERROR, "skip deleting invalid album=%{public}s", v38, 0xCu);
        if (v37 < 0)
          operator delete(*(void **)buf);
      }

      v18 = 1;
      goto LABEL_54;
    }
    importSession = (id *)self->_importSession;
    if (v31)
    {
      p_shared_owners = (unint64_t *)&v31->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    if (*((_DWORD *)importSession + 8) == 2)
    {
      if ((objc_msgSend(importSession[260], "count") || importSession[284])
        && !ML3ImportSession::flush((ML3ImportSession *)importSession, 1))
      {
        v18 = 0;
        goto LABEL_49;
      }
      *(_QWORD *)v38 = v30;
      *(_QWORD *)&v38[8] = v31;
      if (v31)
      {
        v8 = (unint64_t *)&v31->__shared_owners_;
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      AlbumPersistentID = ML3ImportSession::_getAlbumPersistentID((uint64_t)importSession, v38, 0);
      if (v31)
      {
        v11 = (unint64_t *)&v31->__shared_owners_;
        do
          v12 = __ldaxr(v11);
        while (__stlxr(v12 - 1, v11));
        if (!v12)
        {
          ((void (*)())v31->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      if (AlbumPersistentID)
      {
        v13 = importSession[286];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", AlbumPersistentID);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

        ++*((_DWORD *)importSession + 55);
        v15 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_msgSend(importSession[286], "count");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = AlbumPersistentID;
          v35 = 2048;
          v36 = v16;
          _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "removing albumPID=%lld, _deletedAlbums count=%ld", buf, 0x16u);
        }
      }
      else
      {
        v15 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)v30 + 88))(buf);
          v24 = v37 >= 0 ? buf : *(_BYTE **)buf;
          *(_DWORD *)v32 = 136446210;
          v33 = v24;
          _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "not removing album=%{public}s", v32, 0xCu);
          if (v37 < 0)
            operator delete(*(void **)buf);
        }
      }

      if ((unint64_t)objc_msgSend(importSession[286], "count") > 0x3E7 || importSession[284])
      {
        v18 = ML3ImportSession::flush((ML3ImportSession *)importSession, 1);
        goto LABEL_49;
      }
    }
    else
    {
      *((_BYTE *)importSession + 1521) = 1;
      v21 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)v30 + 88))(buf);
        v22 = v37 >= 0 ? buf : *(_BYTE **)buf;
        v23 = *((_DWORD *)importSession + 8);
        *(_DWORD *)v38 = 136446466;
        *(_QWORD *)&v38[4] = v22;
        *(_WORD *)&v38[12] = 1024;
        *(_DWORD *)&v38[14] = v23;
        _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "not removing album=%{public}s as it's not supported for source=%d", v38, 0x12u);
        if (v37 < 0)
          operator delete(*(void **)buf);
      }

    }
    v18 = 1;
LABEL_49:
    if (v31)
    {
      v25 = (unint64_t *)&v31->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)())v31->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v31);
      }
    }
LABEL_54:
    if (v31)
    {
      v27 = (unint64_t *)&v31->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)())v31->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    return v18;
  }
  v17 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
  }

  return 0;
}

- (BOOL)_processDeletedArtistId:(const void *)a3
{
  void *importSession;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  char v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void **v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *__p[2];
  char v20;
  uint64_t v21[2];
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void **v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded"))
  {
    -[ML3DAAPImportOperation albumArtistItemFromDeletedDAAPArtistEntity:](self, "albumArtistItemFromDeletedDAAPArtistEntity:", a3);
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v22 + 16))(v22))
    {
      importSession = self->_importSession;
      v6 = (std::__shared_weak_count *)v23;
      v21[0] = v22;
      v21[1] = v23;
      if (v23)
      {
        v7 = (unint64_t *)(v23 + 8);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
      }
      v9 = ML3ImportSession::removeAlbumArtist((uint64_t)importSession, v21);
      if (v6)
      {
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
      }
    }
    else
    {
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(void **__return_ptr))(*(_QWORD *)v22 + 88))(__p);
        v14 = v20 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)buf = 136446210;
        v25 = v14;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "skip deleting invalid albumArtist=%{public}s", buf, 0xCu);
        if (v20 < 0)
          operator delete(__p[0]);
      }

      v9 = 1;
    }
    v15 = (std::__shared_weak_count *)v23;
    if (v23)
    {
      v16 = (unint64_t *)(v23 + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "failed to start import session", (uint8_t *)__p, 2u);
    }

    return 0;
  }
  return v9;
}

- (BOOL)_startImportSessionIfNeeded
{
  BOOL result;
  NSObject *v4;
  int64_t totalTrackCount;
  int64_t totalArtistCount;
  int64_t totalAlbumCount;
  int64_t totalContainerCount;
  int updateType;
  _BOOL4 clientInitiatedReset;
  int v11;
  int64_t v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_importSessionStarted)
    return 1;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    totalTrackCount = self->_totalTrackCount;
    totalArtistCount = self->_totalArtistCount;
    totalAlbumCount = self->_totalAlbumCount;
    totalContainerCount = self->_totalContainerCount;
    updateType = self->_updateType;
    clientInitiatedReset = self->_clientInitiatedReset;
    v11 = 134219264;
    v12 = totalTrackCount;
    v13 = 2048;
    v14 = totalArtistCount;
    v15 = 2048;
    v16 = totalAlbumCount;
    v17 = 2048;
    v18 = totalContainerCount;
    v19 = 1024;
    v20 = updateType;
    v21 = 1024;
    v22 = clientInitiatedReset;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "starting import session with %lld tracks, %lld artists, %lld albums, %lld containers for update type %d, clientInitiatedReset=%d", (uint8_t *)&v11, 0x36u);
  }

  result = ML3ImportSession::begin((ML3ImportSession *)self->_importSession, LODWORD(self->_totalContainerCount)+ LODWORD(self->_totalTrackCount)+ LODWORD(self->_totalArtistCount)+ LODWORD(self->_totalAlbumCount), self->_updateType == 0, self->_clientInitiatedReset);
  self->_importSessionStarted = 1;
  return result;
}

- (BOOL)_processAlbumCount:(int)a3
{
  NSObject *v4;
  const char *v5;
  int64_t totalTrackCount;
  int64_t totalArtistCount;
  int64_t totalAlbumCount;
  int64_t totalContainerCount;
  int updateType;
  int v12;
  const char *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  self->_totalAlbumCount += a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_importSessionStarted)
      v5 = "yes";
    else
      v5 = "no";
    totalTrackCount = self->_totalTrackCount;
    totalArtistCount = self->_totalArtistCount;
    totalAlbumCount = self->_totalAlbumCount;
    totalContainerCount = self->_totalContainerCount;
    updateType = self->_updateType;
    v12 = 136316418;
    v13 = v5;
    v14 = 2048;
    v15 = totalTrackCount;
    v16 = 2048;
    v17 = totalArtistCount;
    v18 = 2048;
    v19 = totalAlbumCount;
    v20 = 2048;
    v21 = totalContainerCount;
    v22 = 1024;
    v23 = updateType;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "updating entity counts for import session: sessionStarted=%s, %lld tracks, %lld artists, %lld albums, %lld containers for update type %d", (uint8_t *)&v12, 0x3Au);
  }

  return 1;
}

- (BOOL)_processArtistCount:(int)a3
{
  NSObject *v4;
  const char *v5;
  int64_t totalTrackCount;
  int64_t totalArtistCount;
  int64_t totalAlbumCount;
  int64_t totalContainerCount;
  int updateType;
  int v12;
  const char *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  self->_totalArtistCount += a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_importSessionStarted)
      v5 = "yes";
    else
      v5 = "no";
    totalTrackCount = self->_totalTrackCount;
    totalArtistCount = self->_totalArtistCount;
    totalAlbumCount = self->_totalAlbumCount;
    totalContainerCount = self->_totalContainerCount;
    updateType = self->_updateType;
    v12 = 136316418;
    v13 = v5;
    v14 = 2048;
    v15 = totalTrackCount;
    v16 = 2048;
    v17 = totalArtistCount;
    v18 = 2048;
    v19 = totalAlbumCount;
    v20 = 2048;
    v21 = totalContainerCount;
    v22 = 1024;
    v23 = updateType;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "updating entity counts for import session: sessionStarted=%s, %lld tracks, %lld artists, %lld albums, %lld containers for update type %d", (uint8_t *)&v12, 0x3Au);
  }

  return 1;
}

- (BOOL)_processAlbumArtistFromArtistElement:(shared_ptr<ML3CPP::Element>)a3
{
  Element *var0;
  double v5;
  double v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *importSession;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char v17;
  unint64_t *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  double v26;
  int64_t v27;
  double v28;
  __int16 v30[8];
  _QWORD v31[2];
  __int128 v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  uint8_t buf[24];
  uint64_t v36;

  var0 = a3.var0;
  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", a3.var0, a3.var1);
  v6 = v5;
  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded"))
  {
    v7 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v33 = *(_QWORD *)var0;
    v34 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    -[ML3DAAPImportOperation albumArtistImportItemFromDAAPElement:](self, "albumArtistImportItemFromDAAPElement:", &v33);
    v10 = v34;
    if (v34)
    {
      v11 = (unint64_t *)&v34->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)buf + 16))(*(_QWORD *)buf))
    {
      importSession = self->_importSession;
      v14 = *(std::__shared_weak_count **)&buf[8];
      v32 = *(_OWORD *)buf;
      if (*(_QWORD *)&buf[8])
      {
        v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
      v31[0] = 0;
      v31[1] = 0;
      v17 = ML3ImportSession::addAlbumArtist((uint64_t)importSession, (uint64_t *)&v32, v31);
      if (v14)
      {
        v18 = (unint64_t *)&v14->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
    }
    else
    {
      v21 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v30[0] = 0;
        _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "skipping invalid album artist", (uint8_t *)v30, 2u);
      }

      v17 = 1;
    }
    v22 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v23 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else
  {
    v20 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    v17 = 0;
  }
  v25 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v26 - v6;
    _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "Import Metrics: Finished Processing Album Artist Import in %2f seconds", buf, 0xCu);
  }

  v27 = self->_processedArtistCount + 1;
  self->_processedArtistCount = v27;
  *(float *)&v28 = (float)(self->_processedTrackCount + self->_processedContainerCount + v27 + self->_processedAlbumCount)
                 / (float)(self->_totalContainerCount
                         + self->_totalTrackCount
                         + self->_totalAlbumCount
                         + self->_totalArtistCount);
  -[ML3DAAPImportOperation updateImportProgress:](self, "updateImportProgress:", v28);
  return v17;
}

- (BOOL)_processAlbumFromAlbumElement:(shared_ptr<ML3CPP::Element>)a3
{
  Element *var0;
  double v5;
  double v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *importSession;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char v17;
  unint64_t *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  double v26;
  int64_t v27;
  double v28;
  __int16 v30[8];
  _QWORD v31[2];
  __int128 v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  uint8_t buf[24];
  uint64_t v36;

  var0 = a3.var0;
  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", a3.var0, a3.var1);
  v6 = v5;
  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded"))
  {
    v7 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v33 = *(_QWORD *)var0;
    v34 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    -[ML3DAAPImportOperation albumImportItemFromDAAPElement:](self, "albumImportItemFromDAAPElement:", &v33);
    v10 = v34;
    if (v34)
    {
      v11 = (unint64_t *)&v34->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)buf + 16))(*(_QWORD *)buf))
    {
      importSession = self->_importSession;
      v14 = *(std::__shared_weak_count **)&buf[8];
      v32 = *(_OWORD *)buf;
      if (*(_QWORD *)&buf[8])
      {
        v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
      v31[0] = 0;
      v31[1] = 0;
      v17 = ML3ImportSession::addAlbum((uint64_t)importSession, (uint64_t *)&v32, v31, 0);
      if (v14)
      {
        v18 = (unint64_t *)&v14->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
    }
    else
    {
      v21 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v30[0] = 0;
        _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "skipping invalid album", (uint8_t *)v30, 2u);
      }

      v17 = 1;
    }
    v22 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v23 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else
  {
    v20 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    v17 = 0;
  }
  v25 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v26 - v6;
    _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "Import Metrics: Finished Processing Album Import in %2f seconds", buf, 0xCu);
  }

  v27 = self->_processedAlbumCount + 1;
  self->_processedAlbumCount = v27;
  *(float *)&v28 = (float)(self->_processedTrackCount
                         + self->_processedContainerCount
                         + v27
                         + self->_processedArtistCount)
                 / (float)(self->_totalContainerCount
                         + self->_totalTrackCount
                         + self->_totalAlbumCount
                         + self->_totalArtistCount);
  -[ML3DAAPImportOperation updateImportProgress:](self, "updateImportProgress:", v28);
  return v17;
}

- (BOOL)_processAlbumFromTrackElement:(shared_ptr<ML3CPP:(shared_ptr<ML3DAAPImportItem>)a4 :(int64_t)a5 Element>)a3 importItem:albumArtistPersistentID:
{
  __shared_weak_count *var1;
  Element *var0;
  _DWORD *importSession;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  int *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  _BYTE *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  int v40;
  unint64_t *v41;
  unint64_t v42;
  NSObject *v43;
  _BYTE *v44;
  NSObject *v45;
  _BYTE *v46;
  int v47;
  unint64_t *v48;
  unint64_t *v50;
  unint64_t v51;
  void *v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  __int128 v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  unint64_t *v70;
  unint64_t v71;
  NSObject *v72;
  std::string *p_p;
  std::string *v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t *v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  _QWORD *v80;
  uint64_t v81;
  int v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  std::string::size_type size;
  int v89;
  std::string::size_type v90;
  NSObject *v91;
  std::string *v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  unint64_t *v98;
  unint64_t v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  std::__shared_weak_count *v105;
  unint64_t *v106;
  unint64_t v107;
  unint64_t *v108;
  unint64_t v109;
  std::__shared_weak_count *v110;
  unint64_t *v111;
  unint64_t v112;
  std::__shared_weak_count *v113;
  unint64_t *v114;
  unint64_t v115;
  NSObject *v116;
  uint64_t v117;
  unint64_t v118;
  _QWORD v119[2];
  uint64_t v120;
  std::__shared_weak_count *v121;
  uint64_t v122;
  std::__shared_weak_count *v123;
  _QWORD *v124;
  std::__shared_weak_count *v125;
  uint64_t v126;
  std::__shared_weak_count *v127;
  std::string __str;
  std::string v129;
  _QWORD *v130;
  std::__shared_weak_count *v131;
  uint64_t v132;
  uint64_t v133;
  std::string __p;
  std::string v135;
  _QWORD *v136;
  std::__shared_weak_count *v137;
  uint64_t v138;
  std::__shared_weak_count *v139;
  __int128 v140;
  char v141;
  uint64_t v142;
  std::__shared_weak_count *v143;
  _BYTE buf[40];
  std::string v145;
  uint64_t v146;

  var1 = a3.var1;
  var0 = a3.var0;
  v146 = *MEMORY[0x1E0C80C00];
  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded", a3.var0, a3.var1, a4.var0, a4.var1, a5))
  {
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)var1 + 16))(*(_QWORD *)var1))
    {
      if (self->_sourceType == 2)
      {
        importSession = self->_importSession;
        v10 = *(_QWORD *)var1;
        v9 = (std::__shared_weak_count *)*((_QWORD *)var1 + 1);
        v124 = (_QWORD *)v10;
        v125 = v9;
        if (v9)
        {
          p_shared_owners = (unint64_t *)&v9->__shared_owners_;
          do
            v12 = __ldxr(p_shared_owners);
          while (__stxr(v12 + 1, p_shared_owners));
          v13 = importSession + 8;
          if (importSession[8] == 2)
          {
            v142 = v10;
            v143 = v9;
            v14 = (unint64_t *)&v9->__shared_owners_;
            do
              v15 = __ldxr(v14);
            while (__stxr(v15 + 1, v14));
LABEL_51:
            v40 = ML3ImportSession::_prepareTrackForImport((uint64_t)importSession, &v142, 0, 0);
            if (v9)
            {
              v41 = (unint64_t *)&v9->__shared_owners_;
              do
                v42 = __ldaxr(v41);
              while (__stlxr(v42 - 1, v41));
              if (!v42)
              {
                ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
                std::__shared_weak_count::__release_weak(v9);
              }
            }
            if (v40)
            {
              v43 = os_log_create("com.apple.amp.medialibrary", "Import");
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                (*(void (**)(_BYTE *__return_ptr))(*v124 + 88))(buf);
                v44 = buf[23] >= 0 ? buf : *(_BYTE **)buf;
                LODWORD(v145.__r_.__value_.__l.__data_) = 136446210;
                *(std::string::size_type *)((char *)v145.__r_.__value_.__r.__words + 4) = (std::string::size_type)v44;
                _os_log_impl(&dword_1AC149000, v43, OS_LOG_TYPE_ERROR, "Error augmenting album with track data=%{public}s", (uint8_t *)&v145, 0xCu);
                if ((buf[23] & 0x80000000) != 0)
                  operator delete(*(void **)buf);
              }

              v17 = 0;
              goto LABEL_72;
            }
            v141 = 0;
            v140 = 0uLL;
            (*(void (**)(_BYTE *__return_ptr, _QWORD *, uint64_t))(*v124 + 24))(buf, v124, 100663348);
            if ((buf[39] & 0x80000000) != 0)
            {
              std::string::__init_copy_ctor_external(&v145, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
              *(_QWORD *)buf = off_1E5B4D010;
              if ((buf[39] & 0x80000000) != 0)
                operator delete(*(void **)&buf[16]);
            }
            else
            {
              v145 = *(std::string *)&buf[16];
            }
            v138 = 0;
            v139 = 0;
            v136 = v124;
            v137 = v125;
            if (v125)
            {
              v50 = (unint64_t *)&v125->__shared_owners_;
              do
                v51 = __ldxr(v50);
              while (__stxr(v51 + 1, v50));
            }
            ML3ImportSession::_getAlbumGroupingIdentifierForImportItem((uint64_t)importSession, &v138, (uint64_t *)&v136, 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v137;
            if (v137)
            {
              v54 = (unint64_t *)&v137->__shared_owners_;
              do
                v55 = __ldaxr(v54);
              while (__stlxr(v55 - 1, v54));
              if (!v55)
              {
                ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
                std::__shared_weak_count::__release_weak(v53);
              }
            }
            v56 = v139;
            if (v139)
            {
              v57 = (unint64_t *)&v139->__shared_owners_;
              do
                v58 = __ldaxr(v57);
              while (__stlxr(v58 - 1, v57));
              if (!v58)
              {
                ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
                std::__shared_weak_count::__release_weak(v56);
              }
            }
            if (SHIBYTE(v145.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&v135, v145.__r_.__value_.__l.__data_, v145.__r_.__value_.__l.__size_);
            else
              v135 = v145;
            ML3ImportSession::_getAlbumImportItemForGroupingIdentifierAndPIDs(buf, (uint64_t)importSession, v52, (uint64_t *)&v135, 0, 0, &v141);
            v59 = *(_OWORD *)buf;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            v60 = (std::__shared_weak_count *)*((_QWORD *)&v140 + 1);
            v140 = v59;
            if (v60)
            {
              v61 = (unint64_t *)&v60->__shared_owners_;
              do
                v62 = __ldaxr(v61);
              while (__stlxr(v62 - 1, v61));
              if (!v62)
              {
                ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
                std::__shared_weak_count::__release_weak(v60);
              }
            }
            v63 = *(std::__shared_weak_count **)&buf[8];
            if (*(_QWORD *)&buf[8])
            {
              v64 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
              do
                v65 = __ldaxr(v64);
              while (__stlxr(v65 - 1, v64));
              if (!v65)
              {
                ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
                std::__shared_weak_count::__release_weak(v63);
              }
            }
            if (SHIBYTE(v135.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v135.__r_.__value_.__l.__data_);
            v66 = v140;
            if (!(_QWORD)v140)
            {
              v72 = os_log_create("com.apple.amp.medialibrary", "Import");
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                (*(void (**)(std::string *__return_ptr, _QWORD *))(*v124 + 88))(&__p, v124);
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  p_p = &__p;
                else
                  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                v74 = &v145;
                if ((v145.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v74 = (std::string *)v145.__r_.__value_.__r.__words[0];
                *(_DWORD *)buf = 136446722;
                *(_QWORD *)&buf[4] = p_p;
                *(_WORD *)&buf[12] = 2082;
                *(_QWORD *)&buf[14] = v74;
                *(_WORD *)&buf[22] = 2048;
                *(_QWORD *)&buf[24] = v52;
                _os_log_impl(&dword_1AC149000, v72, OS_LOG_TYPE_ERROR, "Could not locate album to augment with track data=%{public}s, cloudLibraryID=%{public}s, albumGroupingIdentifier=%p", buf, 0x20u);
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__p.__r_.__value_.__l.__data_);
              }

              v75 = v124[1];
              ML3ImportSession::_getDefaultEmptyAlbum((ML3ImportSession *)&v132);
              v76 = v133;
              ML3ImportSession::_setAlbumInfoForTrackPersistentID((uint64_t)importSession, v75, v132, v133);
              if (!v76)
                goto LABEL_206;
              v77 = (unint64_t *)(v76 + 8);
              do
                v78 = __ldaxr(v77);
              while (__stlxr(v78 - 1, v77));
              if (v78)
                goto LABEL_206;
              (*(void (**)(uint64_t))(*(_QWORD *)v76 + 16))(v76);
              v79 = (std::__shared_weak_count *)v76;
              goto LABEL_205;
            }
            v68 = v67;
            if (v67)
            {
              v130 = v67;
              v131 = (std::__shared_weak_count *)*((_QWORD *)&v140 + 1);
              v69 = v67;
              if (*((_QWORD *)&v140 + 1))
              {
                v70 = (unint64_t *)(*((_QWORD *)&v140 + 1) + 8);
                do
                  v71 = __ldxr(v70);
                while (__stxr(v71 + 1, v70));
                v69 = v67;
              }
            }
            else
            {
              v69 = 0;
              v130 = 0;
              v131 = 0;
            }
            v118 = v67[1];
            v80 = v124;
            if ((*(unsigned int (**)(_QWORD *, uint64_t))(*v124 + 56))(v124, 167772185)
              && (v81 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v124 + 32))(v124, 167772185),
                  v81 != (*(uint64_t (**)(_QWORD *, uint64_t))(*v68 + 32))(v68, 285212679)))
            {
              *(_DWORD *)(v68[8] + 56) = (*(uint64_t (**)(_QWORD *, uint64_t))(*v124 + 32))(v124, 167772185);
              v83 = os_log_create("com.apple.amp.medialibrary", "Import");
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                v84 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v80 + 32))(v80, 167772185);
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v84;
                _os_log_impl(&dword_1AC149000, v83, OS_LOG_TYPE_DEFAULT, "Augmenting user rating=%lld", buf, 0xCu);
              }

              v82 = 1;
            }
            else
            {
              v82 = 0;
            }
            if ((*(unsigned int (**)(_QWORD *, uint64_t))(*v80 + 56))(v80, 167772186))
            {
              v85 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v80 + 32))(v80, 167772186);
              if (v85 != (*(uint64_t (**)(_QWORD *, uint64_t))(*v68 + 32))(v68, 285212690))
              {
                *(_BYTE *)(v68[8] + 60) = (*(uint64_t (**)(_QWORD *, uint64_t))(*v80 + 32))(v80, 167772186) != 0;
                v86 = os_log_create("com.apple.amp.medialibrary", "Import");
                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  v87 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v80 + 32))(v80, 167772186);
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v87;
                  _os_log_impl(&dword_1AC149000, v86, OS_LOG_TYPE_DEFAULT, "Augmenting user rating is derived=%lld", buf, 0xCu);
                }

                v82 = 1;
              }
            }
            if ((*(unsigned int (**)(_QWORD *, uint64_t))(*v80 + 56))(v80, 100663323))
            {
              (*(void (**)(_BYTE *__return_ptr, _QWORD *, uint64_t))(*v80 + 24))(buf, v80, 100663323);
              if ((buf[39] & 0x80000000) != 0)
              {
                std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
                *(_QWORD *)buf = off_1E5B4D010;
                if ((buf[39] & 0x80000000) != 0)
                  operator delete(*(void **)&buf[16]);
              }
              else
              {
                __p = *(std::string *)&buf[16];
              }
              (*(void (**)(_BYTE *__return_ptr, _QWORD *, uint64_t))(*v68 + 24))(buf, v68, 285212682);
              if ((buf[39] & 0x80000000) != 0)
              {
                std::string::__init_copy_ctor_external(&v129, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
                *(_QWORD *)buf = off_1E5B4D010;
                if ((buf[39] & 0x80000000) != 0)
                  operator delete(*(void **)&buf[16]);
              }
              else
              {
                v129 = *(std::string *)&buf[16];
              }
              size = HIBYTE(v129.__r_.__value_.__r.__words[2]);
              v89 = SHIBYTE(v129.__r_.__value_.__r.__words[2]);
              if ((v129.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                size = v129.__r_.__value_.__l.__size_;
              if (!size)
              {
                v90 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v90 = __p.__r_.__value_.__l.__size_;
                if (v90)
                {
                  (*(void (**)(_BYTE *__return_ptr, _QWORD *, uint64_t))(*v80 + 24))(buf, v80, 100663323);
                  if ((buf[39] & 0x80000000) != 0)
                    std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
                  else
                    __str = *(std::string *)&buf[16];
                  std::string::operator=((std::string *)(v68 + 10), &__str);
                  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(__str.__r_.__value_.__l.__data_);
                  *(_QWORD *)buf = off_1E5B4D010;
                  if ((buf[39] & 0x80000000) != 0)
                    operator delete(*(void **)&buf[16]);
                  _ML3LogCategoryImport();
                  v91 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                  {
                    v92 = &__p;
                    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                      v92 = (std::string *)__p.__r_.__value_.__r.__words[0];
                    *(_DWORD *)buf = 136446210;
                    *(_QWORD *)&buf[4] = v92;
                    _os_log_impl(&dword_1AC149000, v91, OS_LOG_TYPE_DEFAULT, "Augmenting feedurl=%{public}s", buf, 0xCu);
                  }

                  v82 = 1;
                }
              }
              if (v89 < 0)
                operator delete(v129.__r_.__value_.__l.__data_);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
            if ((*(unsigned int (**)(_QWORD *, uint64_t))(*v80 + 56))(v80, 33554438))
            {
              v93 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v80 + 32))(v80, 33554438);
              if (v93 > (*(uint64_t (**)(_QWORD *, uint64_t))(*v68 + 32))(v68, 285212684))
              {
                *(_DWORD *)(v68[8] + 68) = (*(uint64_t (**)(_QWORD *, uint64_t))(*v80 + 32))(v80, 33554438);
                v94 = os_log_create("com.apple.amp.medialibrary", "Import");
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  v95 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v80 + 32))(v80, 33554438);
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v95;
                  _os_log_impl(&dword_1AC149000, v94, OS_LOG_TYPE_DEFAULT, "Augmenting album year=%lld", buf, 0xCu);
                }

                v82 = 1;
              }
            }
            v96 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v80 + 32))(v80, 16777217);
            if ((MLMediaTypeByStandardizingMediaType(v96) & 0x400) != 0
              || (*(uint64_t (**)(_QWORD *, uint64_t))(*v68 + 32))(v68, 285212676))
            {
              if (v141)
                v97 = 0;
              else
                v97 = v82;
              if (v97 != 1)
              {
LABEL_192:
                v103 = v80[1];
                v104 = v69[8];
                v105 = (std::__shared_weak_count *)v69[9];
                v126 = v104;
                v127 = v105;
                if (v105)
                {
                  v106 = (unint64_t *)&v105->__shared_owners_;
                  do
                    v107 = __ldxr(v106);
                  while (__stxr(v107 + 1, v106));
                }
                ML3ImportSession::_setAlbumInfoForTrackPersistentID((uint64_t)importSession, v103, v104, (uint64_t)v105);
                if (v105)
                {
                  v108 = (unint64_t *)&v105->__shared_owners_;
                  do
                    v109 = __ldaxr(v108);
                  while (__stlxr(v109 - 1, v108));
                  if (!v109)
                  {
                    ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
                    std::__shared_weak_count::__release_weak(v105);
                  }
                }
                v110 = v131;
                if (!v131)
                  goto LABEL_206;
                v111 = (unint64_t *)&v131->__shared_owners_;
                do
                  v112 = __ldaxr(v111);
                while (__stlxr(v112 - 1, v111));
                if (v112)
                  goto LABEL_206;
                ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
                v79 = v110;
LABEL_205:
                std::__shared_weak_count::__release_weak(v79);
LABEL_206:

                if (SHIBYTE(v145.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v145.__r_.__value_.__l.__data_);
                v113 = (std::__shared_weak_count *)*((_QWORD *)&v140 + 1);
                if (*((_QWORD *)&v140 + 1))
                {
                  v114 = (unint64_t *)(*((_QWORD *)&v140 + 1) + 8);
                  do
                    v115 = __ldaxr(v114);
                  while (__stlxr(v115 - 1, v114));
                  if (!v115)
                  {
                    ((void (*)(std::__shared_weak_count *))v113->__on_zero_shared)(v113);
                    std::__shared_weak_count::__release_weak(v113);
                  }
                }
LABEL_71:
                v17 = 1;
LABEL_72:
                v37 = v125;
                if (!v125)
                  return v17;
                v48 = (unint64_t *)&v125->__shared_owners_;
                do
                  v39 = __ldaxr(v48);
                while (__stlxr(v39 - 1, v48));
                goto LABEL_75;
              }
            }
            else
            {
              v68[15] = v80[1];
              v116 = os_log_create("com.apple.amp.medialibrary", "Import");
              if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
              {
                v117 = v80[1];
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v117;
                _os_log_impl(&dword_1AC149000, v116, OS_LOG_TYPE_DEFAULT, "Augmenting representative item pid=%lld", buf, 0xCu);
              }

              if (v141)
                goto LABEL_192;
            }
            *(_QWORD *)buf = v118;
            *(_QWORD *)&buf[8] = v66;
            *(_QWORD *)&buf[16] = *((_QWORD *)&v140 + 1);
            if (*((_QWORD *)&v140 + 1))
            {
              v98 = (unint64_t *)(*((_QWORD *)&v140 + 1) + 8);
              do
                v99 = __ldxr(v98);
              while (__stxr(v99 + 1, v98));
            }
            std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3ImportItem>>>((uint64_t)(importSession + 562), v118, (uint64_t)buf);
            v100 = *(std::__shared_weak_count **)&buf[16];
            if (*(_QWORD *)&buf[16])
            {
              v101 = (unint64_t *)(*(_QWORD *)&buf[16] + 8);
              do
                v102 = __ldaxr(v101);
              while (__stlxr(v102 - 1, v101));
              if (!v102)
              {
                ((void (*)(std::__shared_weak_count *))v100->__on_zero_shared)(v100);
                std::__shared_weak_count::__release_weak(v100);
              }
            }
            v80 = v124;
            v69 = v130;
            goto LABEL_192;
          }
        }
        else
        {
          v13 = importSession + 8;
          if (importSession[8] == 2)
          {
            v142 = v10;
            v143 = 0;
            goto LABEL_51;
          }
        }
        *((_BYTE *)importSession + 1521) = 1;
        v45 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          (*(void (**)(_BYTE *__return_ptr, uint64_t))(*(_QWORD *)v10 + 88))(buf, v10);
          v46 = buf[23] >= 0 ? buf : *(_BYTE **)buf;
          v47 = *v13;
          LODWORD(v145.__r_.__value_.__l.__data_) = 136446466;
          *(std::string::size_type *)((char *)v145.__r_.__value_.__r.__words + 4) = (std::string::size_type)v46;
          WORD2(v145.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&v145.__r_.__value_.__r.__words[1] + 6) = v47;
          _os_log_impl(&dword_1AC149000, v45, OS_LOG_TYPE_ERROR, "not augmenting album with track data=%{public}s as it's not supported for source=%d", (uint8_t *)&v145, 0x12u);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
        }

        goto LABEL_71;
      }
      v20 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      v122 = *(_QWORD *)var0;
      v123 = v20;
      if (v20)
      {
        v21 = (unint64_t *)&v20->__shared_owners_;
        do
          v22 = __ldxr(v21);
        while (__stxr(v22 + 1, v21));
      }
      -[ML3DAAPImportOperation albumImportItemFromDAAPTrackElement:](self, "albumImportItemFromDAAPTrackElement:", &v122);
      v23 = v123;
      if (v123)
      {
        v24 = (unint64_t *)&v123->__shared_owners_;
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
      v26 = self->_importSession;
      v120 = *(_QWORD *)buf;
      v121 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v27 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v28 = __ldxr(v27);
        while (__stxr(v28 + 1, v27));
      }
      v29 = (std::__shared_weak_count *)*((_QWORD *)var1 + 1);
      v119[0] = *(_QWORD *)var1;
      v119[1] = v29;
      if (v29)
      {
        v30 = (unint64_t *)&v29->__shared_owners_;
        do
          v31 = __ldxr(v30);
        while (__stxr(v31 + 1, v30));
      }
      v17 = ML3ImportSession::addAlbum((uint64_t)v26, &v120, v119, 0);
      if (v29)
      {
        v32 = (unint64_t *)&v29->__shared_owners_;
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 - 1, v32));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
      v34 = v121;
      if (v121)
      {
        v35 = (unint64_t *)&v121->__shared_owners_;
        do
          v36 = __ldaxr(v35);
        while (__stlxr(v36 - 1, v35));
        if (!v36)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      v37 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v38 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
LABEL_75:
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
      }
    }
    else
    {
      v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(_BYTE *__return_ptr))(**(_QWORD **)var1 + 88))(buf);
        v19 = buf[23] >= 0 ? buf : *(_BYTE **)buf;
        LODWORD(v145.__r_.__value_.__l.__data_) = 136446210;
        *(std::string::size_type *)((char *)v145.__r_.__value_.__r.__words + 4) = (std::string::size_type)v19;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_ERROR, "Not processing album from invalid track element=%{public}s", (uint8_t *)&v145, 0xCu);
        if ((buf[23] & 0x80000000) != 0)
          operator delete(*(void **)buf);
      }

      return 1;
    }
  }
  else
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  return v17;
}

- (BOOL)_processArtistFromTrackElement:(shared_ptr<ML3CPP:(shared_ptr<ML3DAAPImportItem>)a4 :(int64_t *)a5 Element>)a3 importItem:albumArtistPersistentID:
{
  ML3DAAPImportItem *var0;
  __shared_weak_count *var1;
  Element *v7;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  __int128 v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char *importSession;
  std::__shared_weak_count *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  int *v21;
  unint64_t *v22;
  unint64_t v23;
  NSObject *v24;
  BOOL v25;
  NSObject *v26;
  uint8_t *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  __int128 v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  int v42;
  unint64_t *v43;
  unint64_t v44;
  NSObject *v45;
  uint8_t *v46;
  NSObject *v47;
  uint8_t *v48;
  int v49;
  int v50;
  uint64_t *v51;
  unint64_t v52;
  char v53;
  uint64_t *v54;
  unint64_t v55;
  _QWORD *v56;
  uint8_t *v57;
  uint64_t *v58;
  unint64_t v59;
  void *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  int v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  void *v72;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  unint64_t *v78;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  std::string::size_type size;
  void *v91;
  void *v92;
  std::string::size_type v93;
  const void *v94;
  _QWORD *v95;
  _QWORD *v96;
  unint64_t *v97;
  unint64_t v98;
  NSObject *v99;
  uint8_t *v100;
  std::string *v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t *v104;
  unint64_t v105;
  std::__shared_weak_count *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t *v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  std::__shared_weak_count *v113;
  unint64_t *v114;
  unint64_t v115;
  unint64_t *v116;
  unint64_t v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  std::__shared_weak_count *v121;
  unint64_t *v122;
  unint64_t v123;
  NSObject *log;
  unint64_t v125;
  void *v126;
  _QWORD v127[2];
  __int128 v128;
  _QWORD v129[2];
  uint64_t v130;
  std::__shared_weak_count *v131;
  uint64_t v132;
  std::__shared_weak_count *v133;
  _QWORD *v134;
  std::__shared_weak_count *v135;
  uint64_t v136;
  std::__shared_weak_count *v137;
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  std::__shared_weak_count *v141;
  uint64_t v142;
  uint64_t v143;
  std::string v144;
  std::string v145;
  uint64_t v146;
  std::__shared_weak_count *v147;
  char v148;
  uint64_t v149[2];
  uint64_t v150;
  std::__shared_weak_count *v151;
  _BYTE v152[22];
  uint8_t buf[16];
  std::string v154;
  std::string v155;
  uint64_t v156;

  var0 = a4.var0;
  var1 = a3.var1;
  v7 = a3.var0;
  v156 = *MEMORY[0x1E0C80C00];
  if (-[ML3DAAPImportOperation _startImportSessionIfNeeded](self, "_startImportSessionIfNeeded", a3.var0, a3.var1, a4.var0, a4.var1, a5))
  {
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)var1 + 16))(*(_QWORD *)var1))
    {
      v139 = 0uLL;
      v138 = 0uLL;
      v9 = (std::__shared_weak_count *)*((_QWORD *)v7 + 1);
      v136 = *(_QWORD *)v7;
      v137 = v9;
      if (v9)
      {
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
      }
      -[ML3DAAPImportOperation artistImportItemFromDAAPTrackElement:artistEntityType:](self, "artistImportItemFromDAAPTrackElement:artistEntityType:", &v136, 2);
      v12 = *(_OWORD *)buf;
      memset(buf, 0, sizeof(buf));
      v139 = v12;
      v13 = v137;
      if (v137)
      {
        v14 = (unint64_t *)&v137->__shared_owners_;
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      if (self->_sourceType != 2)
      {
        v28 = (std::__shared_weak_count *)*((_QWORD *)v7 + 1);
        v132 = *(_QWORD *)v7;
        v133 = v28;
        if (v28)
        {
          v29 = (unint64_t *)&v28->__shared_owners_;
          do
            v30 = __ldxr(v29);
          while (__stxr(v30 + 1, v29));
        }
        -[ML3DAAPImportOperation artistImportItemFromDAAPTrackElement:artistEntityType:](self, "artistImportItemFromDAAPTrackElement:artistEntityType:", &v132, 7);
        v31 = *(_OWORD *)buf;
        memset(buf, 0, sizeof(buf));
        v32 = (std::__shared_weak_count *)*((_QWORD *)&v138 + 1);
        v138 = v31;
        if (v32)
        {
          v33 = (unint64_t *)&v32->__shared_owners_;
          do
            v34 = __ldaxr(v33);
          while (__stlxr(v34 - 1, v33));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
            std::__shared_weak_count::__release_weak(v32);
          }
        }
        v35 = *(std::__shared_weak_count **)&buf[8];
        if (*(_QWORD *)&buf[8])
        {
          v36 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
          do
            v37 = __ldaxr(v36);
          while (__stlxr(v37 - 1, v36));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }
        v38 = v133;
        if (v133)
        {
          v39 = (unint64_t *)&v133->__shared_owners_;
          do
            v40 = __ldaxr(v39);
          while (__stlxr(v40 - 1, v39));
          if (!v40)
          {
            ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
            std::__shared_weak_count::__release_weak(v38);
          }
        }
        v41 = v138;
        if (!(_QWORD)v138)
          goto LABEL_119;
        goto LABEL_101;
      }
      importSession = (char *)self->_importSession;
      v18 = *(_QWORD *)var1;
      v17 = (std::__shared_weak_count *)*((_QWORD *)var1 + 1);
      v134 = *(_QWORD **)var1;
      v135 = v17;
      if (v17)
      {
        v19 = (unint64_t *)&v17->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
        v21 = (int *)(importSession + 32);
        if (*((_DWORD *)importSession + 8) == 2)
        {
          v150 = v18;
          v151 = v17;
          v22 = (unint64_t *)&v17->__shared_owners_;
          do
            v23 = __ldxr(v22);
          while (__stxr(v23 + 1, v22));
LABEL_51:
          v42 = ML3ImportSession::_prepareTrackForImport((uint64_t)importSession, &v150, 0, 0);
          if (v17)
          {
            v43 = (unint64_t *)&v17->__shared_owners_;
            do
              v44 = __ldaxr(v43);
            while (__stlxr(v44 - 1, v43));
            if (!v44)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
          }
          if (v42)
          {
            v45 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              (*(void (**)(uint8_t *__return_ptr))(*v134 + 88))(buf);
              v46 = v154.__r_.__value_.__s.__data_[7] >= 0 ? buf : *(uint8_t **)buf;
              LODWORD(v155.__r_.__value_.__l.__data_) = 136446210;
              *(std::string::size_type *)((char *)v155.__r_.__value_.__r.__words + 4) = (std::string::size_type)v46;
              _os_log_impl(&dword_1AC149000, v45, OS_LOG_TYPE_ERROR, "Error augmenting albumArtist with track data=%{public}s", (uint8_t *)&v155, 0xCu);
              if (v154.__r_.__value_.__s.__data_[7] < 0)
                operator delete(*(void **)buf);
            }
LABEL_93:

LABEL_94:
            v50 = 0;
            goto LABEL_95;
          }
          v149[0] = (uint64_t)v134;
          v149[1] = (uint64_t)v135;
          if (v135)
          {
            v51 = &v135->__shared_owners_;
            do
              v52 = __ldxr((unint64_t *)v51);
            while (__stxr(v52 + 1, (unint64_t *)v51));
          }
          v53 = ML3ImportSession::_prepareTrackSortData((uint64_t)importSession, v149);
          if (v135)
          {
            v54 = &v135->__shared_owners_;
            do
              v55 = __ldaxr((unint64_t *)v54);
            while (__stlxr(v55 - 1, (unint64_t *)v54));
            if (!v55)
            {
              ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
              std::__shared_weak_count::__release_weak(v135);
            }
          }
          if ((v53 & 1) == 0)
          {
            v45 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              (*(void (**)(uint8_t *__return_ptr))(*v134 + 88))(buf);
              v57 = v154.__r_.__value_.__s.__data_[7] >= 0 ? buf : *(uint8_t **)buf;
              LODWORD(v155.__r_.__value_.__l.__data_) = 136446210;
              *(std::string::size_type *)((char *)v155.__r_.__value_.__r.__words + 4) = (std::string::size_type)v57;
              _os_log_impl(&dword_1AC149000, v45, OS_LOG_TYPE_DEFAULT, "Error preparing track sort data for=%{public}s", (uint8_t *)&v155, 0xCu);
              if (v154.__r_.__value_.__s.__data_[7] < 0)
                operator delete(*(void **)buf);
            }
            goto LABEL_93;
          }
          if (!importSession[1520]
            && (objc_msgSend(*((id *)importSession + 286), "count") || *((_QWORD *)importSession + 284)))
          {
            importSession[1520] = 1;
            if (!ML3ImportSession::flush((ML3ImportSession *)importSession, 1))
              goto LABEL_94;
          }
          v148 = 0;
          v146 = 0;
          v147 = 0;
          v56 = v134;
          (*(void (**)(uint8_t *__return_ptr, _QWORD *, uint64_t))(*v134 + 24))(buf, v134, 301989899);
          if (SHIBYTE(v154.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(&v155, v154.__r_.__value_.__l.__data_, v154.__r_.__value_.__l.__size_);
            *(_QWORD *)buf = off_1E5B4D010;
            if (SHIBYTE(v154.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v154.__r_.__value_.__l.__data_);
          }
          else
          {
            v155 = v154;
          }
          (*(void (**)(uint8_t *__return_ptr, _QWORD *, _QWORD))(*v134 + 152))(buf, v134, 0);
          if (SHIBYTE(v154.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(&v145, v154.__r_.__value_.__l.__data_, v154.__r_.__value_.__l.__size_);
            *(_QWORD *)buf = off_1E5B4D010;
            if (SHIBYTE(v154.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v154.__r_.__value_.__l.__data_);
          }
          else
          {
            v145 = v154;
          }
          size = HIBYTE(v145.__r_.__value_.__r.__words[2]);
          if ((v145.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            size = v145.__r_.__value_.__l.__size_;
          if (size)
          {
            v91 = (void *)*((_QWORD *)importSession + 1);
            ML3CPPBridgeString((const UInt8 *)&v145, 1);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "groupingKeyForString:", v92);
            v126 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v126 = 0;
          }
          if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&v144, v155.__r_.__value_.__l.__data_, v155.__r_.__value_.__l.__size_);
          else
            v144 = v155;
          ML3ImportSession::_getAlbumArtistImportItemForGroupingIdentifierAndPIDs(buf, (uint64_t)importSession, v126, (uint64_t)&v144, 0, 0, &v148);
          v94 = *(const void **)buf;
          v93 = *(_QWORD *)&buf[8];
          v146 = *(_QWORD *)buf;
          v147 = *(std::__shared_weak_count **)&buf[8];
          if (SHIBYTE(v144.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v144.__r_.__value_.__l.__data_);
          if (v94)
          {
            v96 = v95;
            if (v95)
            {
              *(_QWORD *)v152 = v95;
              *(_QWORD *)&v152[8] = v93;
              if (v93)
              {
                v97 = (unint64_t *)(v93 + 8);
                do
                  v98 = __ldxr(v97);
                while (__stxr(v98 + 1, v97));
              }
            }
            else
            {
              *(_QWORD *)v152 = 0;
              *(_QWORD *)&v152[8] = 0;
            }
            if (!(*(uint64_t (**)(_QWORD *, uint64_t))(*v95 + 32))(v95, 301989894))
            {
              v125 = v96[1];
              v107 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v134 + 32))(v134, 16777217);
              if ((MLMediaTypeByStandardizingMediaType(v107) & 0x400) == 0
                && !(*(uint64_t (**)(_QWORD *, uint64_t))(*v96 + 32))(v96, 301989894))
              {
                v96[11] = v134[1];
                _ML3LogCategoryImport();
                log = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  v108 = v56[1];
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v108;
                  _os_log_impl(&dword_1AC149000, log, OS_LOG_TYPE_DEFAULT, "Augmenting representative itemPID=%lld", buf, 0xCu);
                }

                if (!v148)
                {
                  *(_QWORD *)buf = v125;
                  *(_QWORD *)&buf[8] = v94;
                  v154.__r_.__value_.__r.__words[0] = v93;
                  if (v93)
                  {
                    v109 = (unint64_t *)(v93 + 8);
                    do
                      v110 = __ldxr(v109);
                    while (__stxr(v110 + 1, v109));
                  }
                  std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3ImportItem>>>((uint64_t)(importSession + 2040), v125, (uint64_t)buf);
                  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)&buf[8]);
                }
              }
            }
            v111 = v56[1];
            v112 = v96[8];
            v113 = (std::__shared_weak_count *)v96[9];
            v140 = v112;
            v141 = v113;
            if (v113)
            {
              v114 = (unint64_t *)&v113->__shared_owners_;
              do
                v115 = __ldxr(v114);
              while (__stxr(v115 + 1, v114));
            }
            ML3ImportSession::_setAlbumArtistInfoForTrackPersistentID((uint64_t)importSession, v111, v112, (uint64_t)v113);
            if (v113)
            {
              v116 = (unint64_t *)&v113->__shared_owners_;
              do
                v117 = __ldaxr(v116);
              while (__stlxr(v117 - 1, v116));
              if (!v117)
              {
                ((void (*)(std::__shared_weak_count *))v113->__on_zero_shared)(v113);
                std::__shared_weak_count::__release_weak(v113);
              }
            }
            v118 = *(std::__shared_weak_count **)&v152[8];
            if (!*(_QWORD *)&v152[8])
              goto LABEL_210;
            v119 = (unint64_t *)(*(_QWORD *)&v152[8] + 8);
            do
              v120 = __ldaxr(v119);
            while (__stlxr(v120 - 1, v119));
            if (v120)
              goto LABEL_210;
            ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
            v106 = v118;
          }
          else
          {
            v99 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              (*(void (**)(uint8_t *__return_ptr, _QWORD *))(*v134 + 88))(buf, v134);
              if (v154.__r_.__value_.__s.__data_[7] >= 0)
                v100 = buf;
              else
                v100 = *(uint8_t **)buf;
              v101 = &v155;
              if ((v155.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v101 = (std::string *)v155.__r_.__value_.__r.__words[0];
              *(_DWORD *)v152 = 136446466;
              *(_QWORD *)&v152[4] = v100;
              *(_WORD *)&v152[12] = 2082;
              *(_QWORD *)&v152[14] = v101;
              _os_log_impl(&dword_1AC149000, v99, OS_LOG_TYPE_ERROR, "Could not locate album artist to augment with track data=%{public}s, cloudLibraryID=%{public}s", v152, 0x16u);
              if (v154.__r_.__value_.__s.__data_[7] < 0)
                operator delete(*(void **)buf);
            }

            v102 = v134[1];
            ML3ImportSession::_getDefaultEmptyArtist((ML3ImportSession *)&v142);
            v103 = v143;
            ML3ImportSession::_setAlbumArtistInfoForTrackPersistentID((uint64_t)importSession, v102, v142, v143);
            if (!v103)
              goto LABEL_210;
            v104 = (unint64_t *)(v103 + 8);
            do
              v105 = __ldaxr(v104);
            while (__stlxr(v105 - 1, v104));
            if (v105)
              goto LABEL_210;
            (*(void (**)(uint64_t))(*(_QWORD *)v103 + 16))(v103);
            v106 = (std::__shared_weak_count *)v103;
          }
          std::__shared_weak_count::__release_weak(v106);
LABEL_210:
          if (SHIBYTE(v145.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v145.__r_.__value_.__l.__data_);
          if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v155.__r_.__value_.__l.__data_);
          v121 = v147;
          if (v147)
          {
            v122 = (unint64_t *)&v147->__shared_owners_;
            do
              v123 = __ldaxr(v122);
            while (__stlxr(v123 - 1, v122));
            if (!v123)
            {
              ((void (*)(std::__shared_weak_count *))v121->__on_zero_shared)(v121);
              std::__shared_weak_count::__release_weak(v121);
            }
          }

LABEL_71:
          v50 = 1;
LABEL_95:
          if (v135)
          {
            v58 = &v135->__shared_owners_;
            do
              v59 = __ldaxr((unint64_t *)v58);
            while (__stlxr(v59 - 1, (unint64_t *)v58));
            if (!v59)
            {
              ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
              std::__shared_weak_count::__release_weak(v135);
            }
          }
          v41 = v138;
          if (!(_QWORD)v138)
          {
            if (v50)
            {
LABEL_119:
              if ((_QWORD)v139)
              {
                v72 = self->_importSession;
                v128 = v139;
                if (*((_QWORD *)&v139 + 1))
                {
                  v73 = (unint64_t *)(*((_QWORD *)&v139 + 1) + 8);
                  do
                    v74 = __ldxr(v73);
                  while (__stxr(v74 + 1, v73));
                }
                v75 = (std::__shared_weak_count *)*((_QWORD *)var1 + 1);
                v127[0] = *(_QWORD *)var1;
                v127[1] = v75;
                if (v75)
                {
                  v76 = (unint64_t *)&v75->__shared_owners_;
                  do
                    v77 = __ldxr(v76);
                  while (__stxr(v77 + 1, v76));
                }
                v25 = ML3ImportSession::addItemArtist((uint64_t)v72, &v128, v127);
                if (v75)
                {
                  v78 = (unint64_t *)&v75->__shared_owners_;
                  do
                    v79 = __ldaxr(v78);
                  while (__stlxr(v79 - 1, v78));
                  if (!v79)
                  {
                    ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
                    std::__shared_weak_count::__release_weak(v75);
                  }
                }
                v80 = (std::__shared_weak_count *)*((_QWORD *)&v128 + 1);
                if (*((_QWORD *)&v128 + 1))
                {
                  v81 = (unint64_t *)(*((_QWORD *)&v128 + 1) + 8);
                  do
                    v82 = __ldaxr(v81);
                  while (__stlxr(v82 - 1, v81));
                  if (!v82)
                  {
                    ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
                    std::__shared_weak_count::__release_weak(v80);
                  }
                }
              }
              else
              {
                v25 = 1;
              }
              goto LABEL_139;
            }
            goto LABEL_138;
          }
LABEL_101:
          v60 = self->_importSession;
          v130 = v41;
          v131 = (std::__shared_weak_count *)*((_QWORD *)&v138 + 1);
          if (*((_QWORD *)&v138 + 1))
          {
            v61 = (unint64_t *)(*((_QWORD *)&v138 + 1) + 8);
            do
              v62 = __ldxr(v61);
            while (__stxr(v62 + 1, v61));
          }
          v63 = (std::__shared_weak_count *)*((_QWORD *)var1 + 1);
          v129[0] = *(_QWORD *)var1;
          v129[1] = v63;
          if (v63)
          {
            v64 = (unint64_t *)&v63->__shared_owners_;
            do
              v65 = __ldxr(v64);
            while (__stxr(v65 + 1, v64));
          }
          v66 = ML3ImportSession::addAlbumArtist((uint64_t)v60, &v130, v129);
          if (v63)
          {
            v67 = (unint64_t *)&v63->__shared_owners_;
            do
              v68 = __ldaxr(v67);
            while (__stlxr(v68 - 1, v67));
            if (!v68)
            {
              ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
              std::__shared_weak_count::__release_weak(v63);
            }
          }
          v69 = v131;
          if (!v131)
            goto LABEL_116;
          v70 = (unint64_t *)&v131->__shared_owners_;
          do
            v71 = __ldaxr(v70);
          while (__stlxr(v71 - 1, v70));
          if (!v71)
          {
            ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
            std::__shared_weak_count::__release_weak(v69);
            if (v66)
              goto LABEL_117;
          }
          else
          {
LABEL_116:
            if (v66)
            {
LABEL_117:
              *(_QWORD *)var0 = *(_QWORD *)(v138 + 8);
              goto LABEL_119;
            }
          }
LABEL_138:
          v25 = 0;
LABEL_139:
          v83 = (std::__shared_weak_count *)*((_QWORD *)&v138 + 1);
          if (*((_QWORD *)&v138 + 1))
          {
            v84 = (unint64_t *)(*((_QWORD *)&v138 + 1) + 8);
            do
              v85 = __ldaxr(v84);
            while (__stlxr(v85 - 1, v84));
            if (!v85)
            {
              ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
              std::__shared_weak_count::__release_weak(v83);
            }
          }
          v86 = (std::__shared_weak_count *)*((_QWORD *)&v139 + 1);
          if (*((_QWORD *)&v139 + 1))
          {
            v87 = (unint64_t *)(*((_QWORD *)&v139 + 1) + 8);
            do
              v88 = __ldaxr(v87);
            while (__stlxr(v88 - 1, v87));
            if (!v88)
            {
              ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
              std::__shared_weak_count::__release_weak(v86);
            }
          }
          return v25;
        }
      }
      else
      {
        v21 = (int *)(importSession + 32);
        if (*((_DWORD *)importSession + 8) == 2)
        {
          v150 = v18;
          v151 = 0;
          goto LABEL_51;
        }
      }
      importSession[1521] = 1;
      v47 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(uint8_t *__return_ptr, uint64_t))(*(_QWORD *)v18 + 88))(buf, v18);
        v48 = v154.__r_.__value_.__s.__data_[7] >= 0 ? buf : *(uint8_t **)buf;
        v49 = *v21;
        LODWORD(v155.__r_.__value_.__l.__data_) = 136446466;
        *(std::string::size_type *)((char *)v155.__r_.__value_.__r.__words + 4) = (std::string::size_type)v48;
        WORD2(v155.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&v155.__r_.__value_.__r.__words[1] + 6) = v49;
        _os_log_impl(&dword_1AC149000, v47, OS_LOG_TYPE_ERROR, "not augmenting album artist with track data=%{public}s as it's not supported for source=%d", (uint8_t *)&v155, 0x12u);
        if (v154.__r_.__value_.__s.__data_[7] < 0)
          operator delete(*(void **)buf);
      }

      goto LABEL_71;
    }
    v26 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      (*(void (**)(uint8_t *__return_ptr))(**(_QWORD **)var1 + 88))(buf);
      v27 = v154.__r_.__value_.__s.__data_[7] >= 0 ? buf : *(uint8_t **)buf;
      LODWORD(v155.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)v155.__r_.__value_.__r.__words + 4) = (std::string::size_type)v27;
      _os_log_impl(&dword_1AC149000, v26, OS_LOG_TYPE_ERROR, "Not processing artist from invalid track element=%{public}s", (uint8_t *)&v155, 0xCu);
      if (v154.__r_.__value_.__s.__data_[7] < 0)
        operator delete(*(void **)buf);
    }

    return 1;
  }
  else
  {
    v24 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
}

- (shared_ptr<ML3DAAPImportItem>)_trackImportItemWithTrackElement:(shared_ptr<ML3CPP::Element>)a3
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  ML3DAAPImportItem *v6;
  __shared_weak_count *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  shared_ptr<ML3DAAPImportItem> result;

  v3 = (std::__shared_weak_count *)*((_QWORD *)a3.var0 + 1);
  v11 = *(_QWORD *)a3.var0;
  v12 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = (ML3DAAPImportItem *)-[ML3DAAPImportOperation importItemFromDAAPElement:](self, "importItemFromDAAPElement:", &v11, a3.var1);
  v8 = v12;
  if (v12)
  {
    v9 = (unint64_t *)&v12->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (int)_getTrackSource
{
  return self->_sourceType;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  cntrl = self->_delegate.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_importError, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 40) = 0;
  return self;
}

@end
