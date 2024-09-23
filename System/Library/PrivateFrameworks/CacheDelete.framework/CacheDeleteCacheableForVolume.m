@implementation CacheDeleteCacheableForVolume

void ___CacheDeleteCacheableForVolume_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    v17 = 1331;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume() calling remote clientGetState with key:%@", buf, 0x12u);
  }

  v6 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___CacheDeleteCacheableForVolume_block_invoke_244;
  v11[3] = &unk_1E4A32B78;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 56);
  v12 = v7;
  v14 = v8;
  v10 = *(_OWORD *)(a1 + 40);
  v9 = (id)v10;
  v13 = v10;
  v15 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v3, "clientGetState:replyBlock:", v7, v11);

}

void ___CacheDeleteCacheableForVolume_block_invoke_244(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  double v38;
  double v39;
  const char *v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  const char *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  unint64_t v52;
  uint64_t v53;
  NSObject *v54;
  char *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  unint64_t v60;
  _BOOL4 v61;
  char *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  const char *v66;
  NSObject *v67;
  const char *v68;
  const char *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  const char *v80;
  const char *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  NSObject *v90;
  const char *v91;
  const char *v92;
  char *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint8_t buf[4];
  int v106;
  __int16 v107;
  const char *v108;
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  id v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  double v116;
  __int16 v117;
  double v118;
  __int16 v119;
  void *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (const char *)a1[4];
    *(_DWORD *)buf = 67109634;
    v106 = 1333;
    v107 = 2112;
    v108 = v5;
    v109 = 2112;
    v110 = (uint64_t)v3;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState: %@ : %@", buf, 0x1Cu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "isEqual:", MEMORY[0x1E0C9AAB0]);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (const char *)a1[4];
      if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
        v13 = "TRUE";
      else
        v13 = "FALSE";
      *(_DWORD *)buf = 67109634;
      v106 = 1337;
      v107 = 2112;
      v108 = v12;
      v109 = 2080;
      v110 = (uint64_t)v13;
      _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState: %@ : %s", buf, 0x1Cu);
    }
LABEL_9:

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_22:
    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (const char *)a1[4];
      if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
        v41 = "TRUE";
      else
        v41 = "FALSE";
      *(_DWORD *)buf = 67109634;
      v106 = 1372;
      v107 = 2112;
      v108 = v40;
      v109 = 2080;
      v110 = (uint64_t)v41;
      _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
    }
    goto LABEL_27;
  }
  CDGetLogHandle((uint64_t)"client");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (const char *)a1[4];
    v16 = (void *)objc_opt_class();
    *(_DWORD *)buf = 67109890;
    v106 = 1339;
    v107 = 2112;
    v108 = v15;
    v109 = 2112;
    v110 = (uint64_t)v16;
    v111 = 2112;
    v112 = v3;
    v17 = v16;
    _os_log_impl(&dword_1A3662000, v14, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, results(%@): %@", buf, 0x26u);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_CACHE_ENABLED"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_CACHEABLE_DURATION"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  evaluateNumberProperty(v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1[7] + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  if (v11)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = evaluateBoolProperty(v11);
    CDGetLogHandle((uint64_t)"client");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (const char *)a1[4];
      if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
        v24 = "TRUE";
      else
        v24 = "FALSE";
      *(_DWORD *)buf = 67109634;
      v106 = 1351;
      v107 = 2112;
      v108 = v23;
      v109 = 2080;
      v110 = (uint64_t)v24;
      _os_log_impl(&dword_1A3662000, v22, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
    }

    if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      v25 = (void *)a1[5];
      v26 = v3;
      v27 = v25;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceReferenceDate");
      v30 = v29;

      objc_msgSend(v27, "thresholds");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("DESIRED_DISK_THRESHOLD"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_CACHEABLE_DURATION"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_CACHEABLE_DURATION"));
        v36 = objc_claimAutoreleasedReturnValue();
        evaluateNumberProperty(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
        v39 = v38;

      }
      else
      {
        CDGetLogHandle((uint64_t)"client");
        v36 = objc_claimAutoreleasedReturnValue();
        v39 = 7200.0;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          v106 = 1173;
          v107 = 2112;
          v108 = (const char *)v26;
          _os_log_error_impl(&dword_1A3662000, v36, OS_LOG_TYPE_ERROR, "%d validateCacheableStateForVolume: duration not specified, using default. state: %@", buf, 0x12u);
        }
      }

      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TIMESTAMP"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TIMESTAMP"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        evaluateNumberProperty(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "doubleValue");
        v50 = v49;

        v51 = v30 - v50;
        v52 = 0x280000000;
        if (v33)
        {
          v53 = objc_msgSend(v33, "unsignedLongLongValue");
          if ((unint64_t)(2 * v53) < 0x280000000)
            v52 = 2 * v53;
        }
        if (v51 < v39)
        {
          CDGetLogHandle((uint64_t)"client");
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v27, "mountPoint");
            v55 = (char *)objc_claimAutoreleasedReturnValue();
            v96 = objc_msgSend(v27, "freespace");
            humanReadableNumber(objc_msgSend(v27, "freespace"));
            v99 = v27;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            humanReadableNumber(v52);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v50);
            v102 = v33;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67110914;
            v106 = 1199;
            v107 = 2112;
            v108 = v55;
            v109 = 2048;
            v110 = v96;
            v111 = 2112;
            v112 = v56;
            v113 = 2112;
            v114 = v57;
            v115 = 2048;
            v116 = v51;
            v117 = 2048;
            v118 = v39;
            v119 = 2112;
            v120 = v58;
            _os_log_impl(&dword_1A3662000, v54, OS_LOG_TYPE_DEFAULT, "%d valid cacheable state for %@: freespace is %llu (%@) (%@ required), age is %f seconds (duration is: %f seconds), set at: %@", buf, 0x4Eu);

            v33 = v102;
            v27 = v99;
          }
LABEL_49:
          v59 = 1;
          goto LABEL_50;
        }
        v60 = objc_msgSend(v27, "freespace");
        CDGetLogHandle((uint64_t)"client");
        v54 = objc_claimAutoreleasedReturnValue();
        v61 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        if (v60 < v52)
        {
          if (v61)
          {
            objc_msgSend(v27, "mountPoint");
            v62 = (char *)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(v27, "freespace");
            humanReadableNumber(objc_msgSend(v27, "freespace"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            humanReadableNumber(v52);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v50);
            v103 = v33;
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67110914;
            v106 = 1215;
            v107 = 2112;
            v108 = v62;
            v109 = 2048;
            v110 = v97;
            v111 = 2112;
            v112 = v100;
            v113 = 2112;
            v114 = v63;
            v115 = 2048;
            v116 = v51;
            v117 = 2048;
            v118 = v39;
            v119 = 2112;
            v120 = v64;
            _os_log_impl(&dword_1A3662000, v54, OS_LOG_TYPE_DEFAULT, "%d valid cacheable state for %@: freespace is %llu (%@) (%@ required), age is %f seconds (duration is: %f seconds), set at: %@", buf, 0x4Eu);

            v33 = v103;
          }
          goto LABEL_49;
        }
        if (v61)
        {
          objc_msgSend(v27, "mountPoint");
          v93 = (char *)objc_claimAutoreleasedReturnValue();
          v98 = objc_msgSend(v27, "freespace");
          humanReadableNumber(objc_msgSend(v27, "freespace"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          humanReadableNumber(v52);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v50);
          v104 = v33;
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67110914;
          v106 = 1224;
          v107 = 2112;
          v108 = v93;
          v109 = 2048;
          v110 = v98;
          v111 = 2112;
          v112 = v101;
          v113 = 2112;
          v114 = v94;
          v115 = 2048;
          v116 = v51;
          v117 = 2048;
          v118 = v39;
          v119 = 2112;
          v120 = v95;
          _os_log_impl(&dword_1A3662000, v54, OS_LOG_TYPE_DEFAULT, "%d invalid cacheable state for %@: freespace is %llu (%@) (%@ required), age is %f seconds (duration is: %f seconds), set at: %@", buf, 0x4Eu);

          v33 = v104;
        }
      }
      else
      {
        CDGetLogHandle((uint64_t)"client");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          v106 = 1180;
          v107 = 2112;
          v108 = (const char *)v26;
          _os_log_error_impl(&dword_1A3662000, v54, OS_LOG_TYPE_ERROR, "%d validateCacheableStateForVolume: Invalid state, no timestamp: %@", buf, 0x12u);
        }
      }
      v59 = 0;
LABEL_50:

      CDGetLogHandle((uint64_t)"client");
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = " NOT";
        if (v59)
          v66 = "";
        *(_DWORD *)buf = 67109378;
        v106 = 1227;
        v107 = 2080;
        v108 = v66;
        _os_log_impl(&dword_1A3662000, v65, OS_LOG_TYPE_DEFAULT, "%d validateCacheableStateForVolume: cacheable state is%s valid", buf, 0x12u);
      }

      if ((v59 & 1) == 0)
      {
        CDGetLogHandle((uint64_t)"client");
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = (const char *)a1[4];
          if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
            v69 = "TRUE";
          else
            v69 = "FALSE";
          *(_DWORD *)buf = 67109634;
          v106 = 1361;
          v107 = 2112;
          v108 = v68;
          v109 = 2080;
          v110 = (uint64_t)v69;
          _os_log_impl(&dword_1A3662000, v67, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
        }

        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
        v70 = (void *)a1[5];
        v71 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "timeIntervalSinceReferenceDate");
        objc_msgSend(v71, "numberWithDouble:");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        _CacheDeleteSetCacheableForVolume(v70, v73, 1);

        v74 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "timeIntervalSinceReferenceDate");
        objc_msgSend(v74, "numberWithDouble:");
        v76 = objc_claimAutoreleasedReturnValue();
        v77 = *(_QWORD *)(a1[7] + 8);
        v78 = *(void **)(v77 + 40);
        *(_QWORD *)(v77 + 40) = v76;

        CDGetLogHandle((uint64_t)"client");
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          v80 = (const char *)a1[4];
          if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
            v81 = "TRUE";
          else
            v81 = "FALSE";
          *(_DWORD *)buf = 67109634;
          v106 = 1365;
          v107 = 2112;
          v108 = v80;
          v109 = 2080;
          v110 = (uint64_t)v81;
          _os_log_impl(&dword_1A3662000, v79, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
        }

      }
      v82 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "doubleValue");
      v84 = v83;
      v85 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "doubleValue");
      objc_msgSend(v85, "dateWithTimeIntervalSinceNow:");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "stringWithFormat:", CFSTR("cacheable disabled, will reset in %f seconds at %@"), v84, v86);
      v87 = objc_claimAutoreleasedReturnValue();
      v88 = *(_QWORD *)(a1[8] + 8);
      v89 = *(void **)(v88 + 40);
      *(_QWORD *)(v88 + 40) = v87;

      CDGetLogHandle((uint64_t)"client");
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        v91 = (const char *)a1[4];
        if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
          v92 = "TRUE";
        else
          v92 = "FALSE";
        *(_DWORD *)buf = 67109634;
        v106 = 1370;
        v107 = 2112;
        v108 = v91;
        v109 = 2080;
        v110 = (uint64_t)v92;
        _os_log_impl(&dword_1A3662000, v90, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
      }

      goto LABEL_9;
    }
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (const char *)a1[4];
      if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
        v44 = "TRUE";
      else
        v44 = "FALSE";
      *(_DWORD *)buf = 67109634;
      v106 = 1346;
      v107 = 2112;
      v108 = v43;
      v109 = 2080;
      v110 = (uint64_t)v44;
      _os_log_impl(&dword_1A3662000, v42, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
    }

    v11 = 0;
  }
LABEL_27:

}

@end
