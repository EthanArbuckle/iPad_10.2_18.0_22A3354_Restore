@implementation CDRecentVolumeInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_bsdDisk, 0);
  objc_storeStrong((id *)&self->_freespace, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_cdVolume, 0);
  objc_storeStrong((id *)&self->_volume, 0);
}

- (id)_recentInfoAtUrgency:(int)a3 validateResults:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  BOOL v41;
  void *v42;
  void *v43;
  char v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  int v83;
  NSObject *v84;
  _BOOL4 v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t j;
  uint64_t v91;
  NSObject *v92;
  const char *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v99;
  void *v100;
  unint64_t v101;
  id obj;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
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
  _BYTE v128[128];
  uint8_t v129[128];
  uint8_t buf[4];
  _BYTE v131[24];
  __int16 v132;
  void *v133;
  __int16 v134;
  void *v135;
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[CDRecentVolumeInfo volume](self, "volume");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[CDRecentVolumeInfo volume](self, "volume");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDRecentVolumeInfo createVolumeWithPath:](self, "createVolumeWithPath:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDRecentVolumeInfo setCdVolume:](self, "setCdVolume:", v52);

      -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v53)
      {
        CDGetLogHandle((uint64_t)"client");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          -[CDRecentVolumeInfo volume](self, "volume");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v131 = v100;
          _os_log_error_impl(&dword_1A3662000, v54, OS_LOG_TYPE_ERROR, "CDRecentVolumeInfo _recentInfoAtUrgency: Unable to create cdVolume for %@", buf, 0xCu);

        }
        v55 = 0;
        goto LABEL_94;
      }
    }
  }
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  -[CDRecentVolumeInfo services](self, "services");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v109 = v6;
  v110 = v5;
  v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
  if (!v111)
  {
    v105 = 0;
    v101 = 0;
    goto LABEL_52;
  }
  v101 = 0;
  v105 = 0;
  v107 = *(_QWORD *)v125;
  do
  {
    for (i = 0; i != v111; ++i)
    {
      if (*(_QWORD *)v125 != v107)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
      -[CDRecentVolumeInfo services](self, "services");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "nonPurgeableAmount");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serviceInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "serviceInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SIGNING_ID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

LABEL_10:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "serviceInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SIGNING_ID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v11, "serviceInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SIGNING_ID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("CACHE_DELETE_SIGNING_ID"));

        }
        objc_msgSend(v11, "serviceInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PROCNAME"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v11, "serviceInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PROCNAME"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("CACHE_DELETE_PROCNAME"));

        }
        v26 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v9);

        goto LABEL_15;
      }
      objc_msgSend(v11, "serviceInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_PROCNAME"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_10;
LABEL_15:
      v27 = v114;
      if (v114 && objc_msgSend(v114, "unsignedLongLongValue"))
      {
        v28 = objc_msgSend(v114, "unsignedLongLongValue");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
        }
        v105 += v28;
        if (v113)
          v30 = v113;
        else
          v30 = v114;
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, v9);

        v27 = v114;
      }
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CACHE_DELETE_TOTAL_FSPURGEABLE")) & 1) != 0)
        goto LABEL_43;
      v31 = a3;
      if (a4)
      {
        v31 = a3;
        if (!-[CDRecentVolumeInfo _validateWithSharedCacheDeleteForService:](self, "_validateWithSharedCacheDeleteForService:", v9))
        {
          CDGetLogHandle((uint64_t)"client");
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            -[CDRecentVolumeInfo volume](self, "volume");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[CDRecentVolumeInfo services](self, "services");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectForKeyedSubscript:", v9);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v131 = 298;
            *(_WORD *)&v131[4] = 2080;
            *(_QWORD *)&v131[6] = "-[CDRecentVolumeInfo _recentInfoAtUrgency:validateResults:]";
            *(_WORD *)&v131[14] = 2112;
            *(_QWORD *)&v131[16] = v47;
            v132 = 2112;
            v133 = v9;
            v134 = 2112;
            v135 = v49;
            _os_log_impl(&dword_1A3662000, v45, OS_LOG_TYPE_DEFAULT, "%d : %s excluding: volume: %@, service: %@, value: %@", buf, 0x30u);

          }
          v5 = v110;
          goto LABEL_42;
        }
      }
      while (1)
      {
        objc_msgSend(v11, "amountAtUrgency:checkTimestamp:", v31, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          break;
LABEL_31:

        v41 = __OFSUB__((_DWORD)v31, 1);
        v31 = (v31 - 1);
        if (((int)v31 < 0) ^ v41 | ((_DWORD)v31 == 0))
          goto LABEL_37;
      }
      -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "amountIsRational:", v32);

      if (!v34)
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        v36 = objc_msgSend(v32, "unsignedLongLongValue");
        humanReadableNumber(objc_msgSend(v32, "unsignedLongLongValue"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("implausible value %llu (%@) for service: %@ at urgency %d on volume: %@"), v36, v37, v9, v31, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        CDGetLogHandle((uint64_t)"client");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v131 = 320;
          *(_WORD *)&v131[4] = 2112;
          *(_QWORD *)&v131[6] = v39;
          _os_log_error_impl(&dword_1A3662000, v40, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo _recentInfoAtUrgency: Discarding %@", buf, 0x12u);
        }

        goto LABEL_31;
      }
      objc_msgSend(v110, "setObject:forKeyedSubscript:", v32, v9);
      fsPurgeableTypeToServiceMap();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "allValues");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "containsObject:", v9);

      if ((v44 & 1) == 0)
        v101 += objc_msgSend(v32, "unsignedLongLongValue");

LABEL_37:
      CDGetLogHandle((uint64_t)"client");
      v45 = objc_claimAutoreleasedReturnValue();
      v5 = v110;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v110, "objectForKeyedSubscript:", v9);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v131 = 323;
        *(_WORD *)&v131[4] = 2112;
        *(_QWORD *)&v131[6] = v9;
        *(_WORD *)&v131[14] = 2112;
        *(_QWORD *)&v131[16] = v46;
        v132 = 2112;
        v133 = v11;
        _os_log_impl(&dword_1A3662000, v45, OS_LOG_TYPE_DEFAULT, "%d CDRecentVolumeInfo _recentInfoAtUrgency, service: %@, amount: %@ %@", buf, 0x26u);

      }
LABEL_42:
      v6 = v109;

      v27 = v114;
LABEL_43:

    }
    v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
  }
  while (v111);
LABEL_52:

  -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v57 = -[CDRecentVolumeInfo _reserveForVolume](self, "_reserveForVolume");
    -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "size");
    -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v59 - objc_msgSend(v60, "freespace");

    v62 = v101;
    if (v101 >= v61 - v57)
      v63 = v61 - v57;
    else
      v63 = v101;
    if (v61 > v57 && v63)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v64 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v64, CFSTR("CACHE_DELETE_SHARED_PURGEABLE"));
      goto LABEL_61;
    }
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v64 = objc_claimAutoreleasedReturnValue();
    v62 = v101;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      -[CDRecentVolumeInfo volume](self, "volume");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v131 = 342;
      *(_WORD *)&v131[4] = 2112;
      *(_QWORD *)&v131[6] = v99;
      _os_log_error_impl(&dword_1A3662000, v64, OS_LOG_TYPE_ERROR, "%d Unable to validate mount point: %@", buf, 0x12u);

    }
LABEL_61:

  }
  -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v62);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v65, "mayContainPurgeableAmount:forService:", v66, 0);

  v68 = (void *)MEMORY[0x1E0CB37E8];
  if (v67)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v62);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v69, CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
  }
  else
  {
    -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v69, "size") * 0.8);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));

  }
  if (v6)
  {
    v71 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v71, CFSTR("CACHE_DELETE_NAME_MAP"));

  }
  -[CDRecentVolumeInfo volume](self, "volume");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v72, CFSTR("CACHE_DELETE_VOLUME"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v105);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v73, CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT"));

  v74 = (void *)objc_msgSend(v5, "copy");
  CDGetLogHandle((uint64_t)"client");
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "mountPoint");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v131 = 366;
    *(_WORD *)&v131[4] = 2114;
    *(_QWORD *)&v131[6] = v77;
    *(_WORD *)&v131[14] = 1024;
    *(_DWORD *)&v131[16] = a3;
    _os_log_impl(&dword_1A3662000, v75, OS_LOG_TYPE_DEFAULT, "%d CDRecentVolumeInfo _recentInfoAtUrgency, volume: %{public}@, urgency: %d, result:", buf, 0x18u);

  }
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v54 = v74;
  v78 = -[NSObject countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v121;
    v81 = "client";
    v106 = *(_QWORD *)v121;
    do
    {
      v82 = 0;
      v108 = v79;
      do
      {
        if (*(_QWORD *)v121 != v80)
          objc_enumerationMutation(v54);
        v112 = v82;
        v115 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v82);
        v83 = objc_msgSend(v115, "isEqualToString:", CFSTR("CACHE_DELETE_NAME_MAP"));
        CDGetLogHandle((uint64_t)v81);
        v84 = objc_claimAutoreleasedReturnValue();
        v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT);
        if (v83)
        {
          if (v85)
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v131 = v115;
            _os_log_impl(&dword_1A3662000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@: {", buf, 0xCu);
          }

          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          -[NSObject objectForKeyedSubscript:](v54, "objectForKeyedSubscript:", v115);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
          if (v87)
          {
            v88 = v87;
            v89 = *(_QWORD *)v117;
            do
            {
              for (j = 0; j != v88; ++j)
              {
                if (*(_QWORD *)v117 != v89)
                  objc_enumerationMutation(v86);
                v91 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * j);
                CDGetLogHandle((uint64_t)v81);
                v92 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                {
                  -[NSObject objectForKeyedSubscript:](v54, "objectForKeyedSubscript:", v115);
                  v93 = v81;
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "objectForKeyedSubscript:", v91);
                  v95 = v54;
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)v131 = v91;
                  *(_WORD *)&v131[8] = 2114;
                  *(_QWORD *)&v131[10] = v96;
                  _os_log_impl(&dword_1A3662000, v92, OS_LOG_TYPE_DEFAULT, "%{public}@ : %{public}@", buf, 0x16u);

                  v54 = v95;
                  v81 = v93;
                }

              }
              v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
            }
            while (v88);
          }

          CDGetLogHandle((uint64_t)v81);
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A3662000, v84, OS_LOG_TYPE_DEFAULT, "}", buf, 2u);
          }
          v6 = v109;
          v5 = v110;
          v80 = v106;
          v79 = v108;
        }
        else if (v85)
        {
          -[NSObject objectForKeyedSubscript:](v54, "objectForKeyedSubscript:", v115);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v131 = v115;
          *(_WORD *)&v131[8] = 2114;
          *(_QWORD *)&v131[10] = v97;
          _os_log_impl(&dword_1A3662000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ : %{public}@", buf, 0x16u);

        }
        v82 = v112 + 1;
      }
      while (v112 + 1 != v79);
      v79 = -[NSObject countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
    }
    while (v79);
  }
  v55 = v54;
LABEL_94:

  return v55;
}

- (NSMutableDictionary)services
{
  return self->_services;
}

- (CacheDeleteVolume)cdVolume
{
  return self->_cdVolume;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CDRecentVolumeInfo timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("CACHE_DELETE_TIMESTAMP"));

  -[CDRecentVolumeInfo freespace](self, "freespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("CACHE_DELETE_FREESPACE"));

  -[CDRecentVolumeInfo services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("CACHE_DELETE_SERVICES"));

  -[CDRecentVolumeInfo volume](self, "volume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("CACHE_DELETE_VOLUME"));

  objc_msgSend(v11, "encodeInteger:forKey:", -[CDRecentVolumeInfo volumeState](self, "volumeState"), CFSTR("CACHE_DELETE_VOLUME_STATE"));
  -[CDRecentVolumeInfo thresholds](self, "thresholds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("CACHE_DELETE_THRESHOLDS"));

  -[CDRecentVolumeInfo bsdDisk](self, "bsdDisk");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("CACHE_DELETE_BSD_DISK"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CDRecentVolumeInfo reserve](self, "reserve"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("CACHE_DELETE_RESERVE"));

  objc_msgSend(v11, "encodeBool:forKey:", -[CDRecentVolumeInfo hasSnapshot](self, "hasSnapshot"), CFSTR("CACHE_DELETE_HAS_SNAPSHOT"));
}

- (NSNumber)freespace
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (NSDictionary)thresholds
{
  return self->_thresholds;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)volumeState
{
  return self->_volumeState;
}

- (unint64_t)reserve
{
  return self->_reserve;
}

- (CDRecentVolumeInfo)initWithVolumeInfo:(id)a3
{
  id v4;
  CDRecentVolumeInfo *v5;
  uint64_t v6;
  NSString *volume;
  void *v8;
  uint64_t v9;
  CacheDeleteVolume *cdVolume;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const char *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSMutableDictionary *services;
  NSObject *v30;
  CDRecentVolumeInfo *v31;
  NSMutableDictionary *v32;
  uint64_t v33;
  NSString *bsdDisk;
  void *v35;
  uint64_t v36;
  NSDictionary *thresholds;
  uint64_t v38;
  NSNumber *freespace;
  uint64_t v40;
  NSDate *timestamp;
  char *v43;
  CDRecentVolumeInfo *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CDRecentVolumeInfo;
  v5 = -[CDRecentVolumeInfo init](&v51, sel_init);
  if (!v5)
  {
LABEL_23:
    v31 = v5;
    goto LABEL_24;
  }
  objc_msgSend(v4, "volume");
  v6 = objc_claimAutoreleasedReturnValue();
  volume = v5->_volume;
  v5->_volume = (NSString *)v6;

  objc_msgSend(v4, "volume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo createVolumeWithPath:](v5, "createVolumeWithPath:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  cdVolume = v5->_cdVolume;
  v5->_cdVolume = (CacheDeleteVolume *)v9;

  if (v5->_volume && v5->_cdVolume)
  {
    objc_msgSend(v4, "services");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
    {
      v44 = v5;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(v4, "services");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      if (!v15)
        goto LABEL_17;
      v16 = v15;
      v17 = "client";
      v46 = *(_QWORD *)v48;
      while (1)
      {
        v18 = 0;
        v45 = v16;
        do
        {
          if (*(_QWORD *)v48 != v46)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v18);
          if (objc_msgSend(v4, "_validateWithSharedCacheDeleteForService:", v19))
          {
            objc_msgSend(v4, "services");
            v20 = objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v21, "copy");
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v19);
          }
          else
          {
            CDGetLogHandle((uint64_t)v17);
            v20 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              goto LABEL_15;
            objc_msgSend(v4, "volume");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "services");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v19);
            v23 = v17;
            v24 = v4;
            v25 = v14;
            v26 = v13;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67110146;
            v53 = 72;
            v54 = 2080;
            v55 = "-[CDRecentVolumeInfo initWithVolumeInfo:]";
            v56 = 2112;
            v57 = v21;
            v58 = 2112;
            v59 = v19;
            v60 = 2112;
            v61 = v27;
            _os_log_impl(&dword_1A3662000, v20, OS_LOG_TYPE_DEFAULT, "%d : %s excluding: volume: %@, service: %@, value: %@", buf, 0x30u);

            v13 = v26;
            v14 = v25;
            v4 = v24;
            v17 = v23;
            v16 = v45;
          }

LABEL_15:
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
        if (!v16)
        {
LABEL_17:

          v28 = objc_msgSend(v13, "mutableCopy");
          v5 = v44;
          services = v44->_services;
          v44->_services = (NSMutableDictionary *)v28;

          goto LABEL_22;
        }
      }
    }
    v32 = v5->_services;
    v5->_services = (NSMutableDictionary *)v12;
    v13 = v32;
LABEL_22:

    v5->_reserve = objc_msgSend(v4, "reserve");
    objc_msgSend(v4, "bsdDisk");
    v33 = objc_claimAutoreleasedReturnValue();
    bsdDisk = v5->_bsdDisk;
    v5->_bsdDisk = (NSString *)v33;

    objc_msgSend(v4, "thresholds");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    thresholds = v5->_thresholds;
    v5->_thresholds = (NSDictionary *)v36;

    v5->_hasSnapshot = objc_msgSend(v4, "hasSnapshot");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CacheDeleteVolume freespace](v5->_cdVolume, "freespace"));
    v38 = objc_claimAutoreleasedReturnValue();
    freespace = v5->_freespace;
    v5->_freespace = (NSNumber *)v38;

    v5->_volumeState = -[CacheDeleteVolume state](v5->_cdVolume, "state");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v40 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v40;

    goto LABEL_23;
  }
  CDGetLogHandle((uint64_t)"client");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "volume");
    v43 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v53 = 63;
    v54 = 2112;
    v55 = v43;
    _os_log_error_impl(&dword_1A3662000, v30, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo unable to validate mount point: %@", buf, 0x12u);

  }
  v31 = 0;
LABEL_24:

  return v31;
}

- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 atUrgency:(int)a5 withTimestamp:(double)a6 nonPurgeableAmount:(id)a7 deductFromCurrentAmount:(BOOL)a8 info:(id)a9
{
  _BOOL8 v10;
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BYTE v37[18];
  __int16 v38;
  id v39;
  uint64_t v40;

  v10 = a8;
  v13 = *(_QWORD *)&a5;
  v40 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a9;
  -[CDRecentVolumeInfo services](self, "services");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v21, "amountAtUrgency:checkTimestamp:", v13, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "updateAmount:atUrgency:withTimestamp:nonPurgeableAmount:deductFromCurrentAmount:info:", v16, v13, v18, v10, v19, a6);
    CDGetLogHandle((uint64_t)"client");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        v32 = 67110146;
        v33 = 218;
        v34 = 2114;
        v35 = v17;
        v36 = 2114;
        *(_QWORD *)v37 = v22;
        *(_WORD *)&v37[8] = 2114;
        *(_QWORD *)&v37[10] = v16;
        v38 = 2114;
        v39 = v19;
        _os_log_impl(&dword_1A3662000, v24, OS_LOG_TYPE_DEFAULT, "%d updateServiceInfoAmount UPDATED %{public}@, old: %{public}@, new: %{public}@, info: %{public}@", (uint8_t *)&v32, 0x30u);
      }
    }
    else if (v25)
    {
      -[CDRecentVolumeInfo volume](self, "volume");
      v32 = 67109890;
      v33 = 220;
      v34 = 2114;
      v35 = v17;
      v36 = 1024;
      *(_DWORD *)v37 = v13;
      *(_WORD *)&v37[4] = 2114;
      *(_QWORD *)&v37[6] = objc_claimAutoreleasedReturnValue();
      v27 = *(void **)&v37[6];
      _os_log_impl(&dword_1A3662000, v24, OS_LOG_TYPE_DEFAULT, "%d updateServiceInfoAmount NO CHANGE for %{public}@ at %d on %{public}@", (uint8_t *)&v32, 0x22u);

    }
  }
  else
  {
    +[CDRecentServiceInfo CDRecentServiceInfo:atUrgency:withTimestamp:nonPurgeableAmount:info:](CDRecentServiceInfo, "CDRecentServiceInfo:atUrgency:withTimestamp:nonPurgeableAmount:info:", v16, v13, v18, v19, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo services](self, "services");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, v17);

    CDGetLogHandle((uint64_t)"client");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 67109634;
      v33 = 212;
      v34 = 2114;
      v35 = v17;
      v36 = 2114;
      *(_QWORD *)v37 = v19;
      _os_log_impl(&dword_1A3662000, v22, OS_LOG_TYPE_DEFAULT, "%d NEW updateServiceInfoAmount for %{public}@, info: %{public}@", (uint8_t *)&v32, 0x1Cu);
    }
    LOBYTE(v23) = 1;
  }

  -[CDRecentVolumeInfo createVolumeWithMountPoint:](self, "createVolumeWithMountPoint:", self->_volume);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28 && objc_msgSend(v28, "validate"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v29, "freespace"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo setFreespace:](self, "setFreespace:", v30);

  }
  return v23;
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setFreespace:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)createVolumeWithPath:(id)a3
{
  return +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", a3);
}

- (NSString)bsdDisk
{
  return self->_bsdDisk;
}

- (id)volumeServices
{
  void *v2;
  void *v3;

  -[CDRecentVolumeInfo services](self, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isStale
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  char v9;

  -[CDRecentVolumeInfo timestamp](self, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = validateTimestamp(v3, 3600.0);

  -[CDRecentVolumeInfo volume](self, "volume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo freespace](self, "freespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = validateFreespace(v5, v6, &unk_1E4A38B18, 0);

  -[CDRecentVolumeInfo thresholds](self, "thresholds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = !v7;
  if (!v8)
    v9 = 1;
  if (v4)
    return v9;
  else
    return 1;
}

- (id)copyInvalidsAtUrgency:(int)a3 currentlyPushing:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[8];
  unint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo freespace](self, "freespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue") / 0xAuLL;

  if (v6 <= 0x9600000)
    v7 = 157286400;
  else
    v7 = v6;
  v38 = 0;
  -[CDRecentVolumeInfo volume](self, "volume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo freespace](self, "freespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = validateFreespace(v8, v9, v10, &v38);

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    -[CDRecentVolumeInfo volume](self, "volume");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo freespace](self, "freespace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 3 * v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = validateFreespace(v13, v14, v15, 0);

    if (!v16)
    {
      CDGetLogHandle((uint64_t)"client");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3662000, v17, OS_LOG_TYPE_DEFAULT, "Drastic free space change. Querying all pushing services as well!", buf, 2u);
      }

    }
    -[CDRecentVolumeInfo invalidate](self, "invalidate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v38);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo setFreespace:](self, "setFreespace:", v18);

    v12 = !v16;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[CDRecentVolumeInfo services](self, "services");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[CDRecentVolumeInfo services](self, "services");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v26, "validate:atUrgency:", a3, 120.0) & 1) == 0
          && (objc_msgSend(v31, "containsObject:", v24) ^ 1 | v12) == 1)
        {
          objc_msgSend(v30, "addObject:", v24);
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");

  return v28;
}

- (CDRecentVolumeInfo)initWithCoder:(id)a3
{
  id v4;
  CDRecentVolumeInfo *v5;
  uint64_t v6;
  NSString *volume;
  uint64_t v8;
  CacheDeleteVolume *cdVolume;
  uint64_t v10;
  NSDate *timestamp;
  uint64_t v12;
  NSNumber *freespace;
  uint64_t v14;
  NSObject *v15;
  CacheDeleteVolume *v16;
  CDRecentVolumeInfo *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *services;
  uint64_t v25;
  NSMutableDictionary *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSDictionary *thresholds;
  uint64_t v34;
  NSDictionary *v35;
  uint64_t v36;
  NSString *bsdDisk;
  void *v38;
  NSString *v40;
  NSString *v41;
  objc_super v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  NSString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CDRecentVolumeInfo;
  v5 = -[CDRecentVolumeInfo init](&v42, sel_init);
  if (!v5)
  {
LABEL_20:
    v17 = v5;
    goto LABEL_21;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CACHE_DELETE_VOLUME"));
  v6 = objc_claimAutoreleasedReturnValue();
  volume = v5->_volume;
  v5->_volume = (NSString *)v6;

  if (v5->_volume)
  {
    -[CDRecentVolumeInfo createVolumeWithMountPoint:](v5, "createVolumeWithMountPoint:");
    v8 = objc_claimAutoreleasedReturnValue();
    cdVolume = v5->_cdVolume;
    v5->_cdVolume = (CacheDeleteVolume *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CACHE_DELETE_TIMESTAMP"));
    v10 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CACHE_DELETE_FREESPACE"));
    v12 = objc_claimAutoreleasedReturnValue();
    freespace = v5->_freespace;
    v5->_freespace = (NSNumber *)v12;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CACHE_DELETE_VOLUME_STATE")))
    {
      v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CACHE_DELETE_VOLUME_STATE"));
LABEL_15:
      v5->_volumeState = v14;
      v18 = (void *)MEMORY[0x1E0C99E60];
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("CACHE_DELETE_SERVICES"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "mutableCopy");
      services = v5->_services;
      v5->_services = (NSMutableDictionary *)v23;

      if (!v5->_services)
      {
        v25 = objc_opt_new();
        v26 = v5->_services;
        v5->_services = (NSMutableDictionary *)v25;

      }
      v27 = (void *)MEMORY[0x1E0C99E60];
      v28 = objc_opt_class();
      v29 = objc_opt_class();
      objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("CACHE_DELETE_THRESHOLDS"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "mutableCopy");
      thresholds = v5->_thresholds;
      v5->_thresholds = (NSDictionary *)v32;

      if (!v5->_thresholds)
      {
        v34 = objc_opt_new();
        v35 = v5->_thresholds;
        v5->_thresholds = (NSDictionary *)v34;

      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CACHE_DELETE_BSD_DISK"));
      v36 = objc_claimAutoreleasedReturnValue();
      bsdDisk = v5->_bsdDisk;
      v5->_bsdDisk = (NSString *)v36;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CACHE_DELETE_RESERVE"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_reserve = objc_msgSend(v38, "unsignedIntegerValue");
      v5->_hasSnapshot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CACHE_DELETE_HAS_SNAPSHOT"));

      goto LABEL_20;
    }
    v16 = v5->_cdVolume;
    if (v16)
    {
      if (-[CacheDeleteVolume validate](v16, "validate"))
        v14 = -[CacheDeleteVolume state](v5->_cdVolume, "state");
      else
        v14 = 0;
      goto LABEL_15;
    }
    CDGetLogHandle((uint64_t)"client");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v41 = v5->_volume;
      *(_DWORD *)buf = 67109378;
      v44 = 131;
      v45 = 2112;
      v46 = v41;
      _os_log_error_impl(&dword_1A3662000, v15, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo unable to validate mount point: %@", buf, 0x12u);
    }
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v40 = v5->_volume;
      *(_DWORD *)buf = 67109378;
      v44 = 119;
      v45 = 2112;
      v46 = v40;
      _os_log_error_impl(&dword_1A3662000, v15, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo unable to validate mount point: %@", buf, 0x12u);
    }
  }

  v17 = 0;
LABEL_21:

  return v17;
}

- (id)createVolumeWithMountPoint:(id)a3
{
  return +[CacheDeleteVolume volumeWithMountpoint:](CacheDeleteVolume, "volumeWithMountpoint:", a3);
}

- (CDRecentVolumeInfo)initWithServices:(id)a3 volumeName:(id)a4
{
  id v6;
  id v7;
  CDRecentVolumeInfo *v8;
  CDRecentVolumeInfo *v9;
  uint64_t v10;
  CacheDeleteVolume *cdVolume;
  uint64_t v12;
  NSObject *v13;
  CDRecentVolumeInfo *v14;
  NSMutableDictionary *services;
  uint64_t v16;
  NSNumber *freespace;
  uint64_t v18;
  NSDate *timestamp;
  objc_super v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CDRecentVolumeInfo;
  v8 = -[CDRecentVolumeInfo init](&v21, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_11:
    v14 = v9;
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v8->_volume, a4);
  -[CDRecentVolumeInfo createVolumeWithPath:](v9, "createVolumeWithPath:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  cdVolume = v9->_cdVolume;
  v9->_cdVolume = (CacheDeleteVolume *)v10;

  if (v9->_volume && v9->_cdVolume)
  {
    if (v6)
    {
      v12 = objc_msgSend(v6, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    services = v9->_services;
    v9->_services = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CacheDeleteVolume freespace](v9->_cdVolume, "freespace"));
    v16 = objc_claimAutoreleasedReturnValue();
    freespace = v9->_freespace;
    v9->_freespace = (NSNumber *)v16;

    v9->_volumeState = -[CacheDeleteVolume state](v9->_cdVolume, "state");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = objc_claimAutoreleasedReturnValue();
    timestamp = v9->_timestamp;
    v9->_timestamp = (NSDate *)v18;

    v9->_hasSnapshot = 0;
    goto LABEL_11;
  }
  CDGetLogHandle((uint64_t)"client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    v23 = 40;
    v24 = 2112;
    v25 = v7;
    _os_log_error_impl(&dword_1A3662000, v13, OS_LOG_TYPE_ERROR, "%d CDRecentVolumeInfo unable to validate mount point: %@", buf, 0x12u);
  }

  v14 = 0;
LABEL_12:

  return v14;
}

+ (id)CDRecentVolumeInfo:(id)a3
{
  id v3;
  CDRecentVolumeInfo *v4;

  v3 = a3;
  v4 = -[CDRecentVolumeInfo initWithServices:volumeName:]([CDRecentVolumeInfo alloc], "initWithServices:volumeName:", 0, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CDRecentVolumeInfo *v5;
  void *v6;
  void *v7;
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

  v5 = objc_alloc_init(CDRecentVolumeInfo);
  -[CDRecentVolumeInfo services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[CDRecentVolumeInfo setServices:](v5, "setServices:", v7);

  -[CDRecentVolumeInfo timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[CDRecentVolumeInfo setTimestamp:](v5, "setTimestamp:", v9);

  -[CDRecentVolumeInfo freespace](self, "freespace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[CDRecentVolumeInfo setFreespace:](v5, "setFreespace:", v11);

  -[CDRecentVolumeInfo volume](self, "volume");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[CDRecentVolumeInfo setVolume:](v5, "setVolume:", v13);

  -[CDRecentVolumeInfo setVolumeState:](v5, "setVolumeState:", -[CDRecentVolumeInfo volumeState](self, "volumeState"));
  -[CDRecentVolumeInfo thresholds](self, "thresholds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  -[CDRecentVolumeInfo setThresholds:](v5, "setThresholds:", v15);

  -[CDRecentVolumeInfo bsdDisk](self, "bsdDisk");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[CDRecentVolumeInfo setBsdDisk:](v5, "setBsdDisk:", v17);

  -[CDRecentVolumeInfo setReserve:](v5, "setReserve:", -[CDRecentVolumeInfo reserve](self, "reserve"));
  -[CDRecentVolumeInfo setHasSnapshot:](v5, "setHasSnapshot:", -[CDRecentVolumeInfo hasSnapshot](self, "hasSnapshot"));
  -[CDRecentVolumeInfo volume](self, "volume");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo createVolumeWithPath:](self, "createVolumeWithPath:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo setCdVolume:](v5, "setCdVolume:", v19);

  return v5;
}

- (BOOL)_validateWithSharedCacheDeleteForService:(id)a3
{
  return 1;
}

- (id)recentInfoAtUrgency:(int)a3
{
  return -[CDRecentVolumeInfo _recentInfoAtUrgency:validateResults:](self, "_recentInfoAtUrgency:validateResults:", *(_QWORD *)&a3, 1);
}

- (void)removeServiceInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CDRecentVolumeInfo services](self, "services");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (BOOL)validateServiceInfo:(id)a3 atUrgency:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CDRecentVolumeInfo services](self, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v8, "validate:atUrgency:", v4, 120.0);
  return v4;
}

- (BOOL)isEmpty
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  -[CDRecentVolumeInfo services](self, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__CDRecentVolumeInfo_isEmpty__block_invoke;
  v4[3] = &unk_1E4A32638;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __29__CDRecentVolumeInfo_isEmpty__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEmpty");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CDRecentVolumeInfo services](self, "services");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%@:"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        v10 = (void *)MEMORY[0x1E0CB3940];
        -[CDRecentVolumeInfo services](self, "services");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)log
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CDRecentVolumeInfo timestamp](self, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo freespace](self, "freespace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v4;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "  timestamp: %@, freespace: %@", buf, 0x16u);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CDRecentVolumeInfo services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v18;
    *(_QWORD *)&v8 = 138412290;
    v16 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        -[CDRecentVolumeInfo services](self, "services", v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        CDGetLogHandle((uint64_t)"client");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          v23 = v12;
          _os_log_impl(&dword_1A3662000, v15, OS_LOG_TYPE_DEFAULT, "   service: %@", buf, 0xCu);
        }

        objc_msgSend(v14, "log");
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)invalidate
{
  id v2;

  -[CDRecentVolumeInfo services](self, "services");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1);

}

uint64_t __32__CDRecentVolumeInfo_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void)setVolume:(id)a3
{
  objc_storeStrong((id *)&self->_volume, a3);
}

- (void)setCdVolume:(id)a3
{
  objc_storeStrong((id *)&self->_cdVolume, a3);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setReserve:(unint64_t)a3
{
  self->_reserve = a3;
}

- (void)setBsdDisk:(id)a3
{
  objc_storeStrong((id *)&self->_bsdDisk, a3);
}

- (void)setHasSnapshot:(BOOL)a3
{
  self->_hasSnapshot = a3;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (void)setVolumeState:(int64_t)a3
{
  self->_volumeState = a3;
}

- (void)setThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_thresholds, a3);
}

- (NSMutableDictionary)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

@end
