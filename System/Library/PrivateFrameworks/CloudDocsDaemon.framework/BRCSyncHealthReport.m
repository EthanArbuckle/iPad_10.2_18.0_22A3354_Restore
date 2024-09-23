@implementation BRCSyncHealthReport

- (BRCSyncHealthReport)init
{
  BRCSyncHealthReport *v2;
  uint64_t v3;
  NSMutableDictionary *syncUpErrorsByMangledID;
  uint64_t v5;
  NSMutableDictionary *syncDownErrorsByMangledID;
  uint64_t v7;
  NSMutableSet *syncUpFailures;
  uint64_t v9;
  NSMutableSet *uploadFailures;
  uint64_t v11;
  NSMutableSet *downloadFailures;
  uint64_t v13;
  NSMutableArray *aggregatedEvents;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BRCSyncHealthReport;
  v2 = -[BRCSyncHealthReport init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    syncUpErrorsByMangledID = v2->_syncUpErrorsByMangledID;
    v2->_syncUpErrorsByMangledID = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    syncDownErrorsByMangledID = v2->_syncDownErrorsByMangledID;
    v2->_syncDownErrorsByMangledID = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    syncUpFailures = v2->_syncUpFailures;
    v2->_syncUpFailures = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    uploadFailures = v2->_uploadFailures;
    v2->_uploadFailures = (NSMutableSet *)v9;

    v11 = objc_opt_new();
    downloadFailures = v2->_downloadFailures;
    v2->_downloadFailures = (NSMutableSet *)v11;

    v13 = objc_opt_new();
    aggregatedEvents = v2->_aggregatedEvents;
    v2->_aggregatedEvents = (NSMutableArray *)v13;

  }
  return v2;
}

- (id)getRampNumberForSession:(id)a3
{
  uint64_t v3;

  v3 = +[BRCUserDefaults rampNumberWithSession:](BRCUserDefaults, "rampNumberWithSession:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v3);
}

- (void)_fillTransferFailure:(id)a3 withRowID:(unint64_t)a4 atDate:(id)a5 session:(id)a6
{
  void *v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v11, "clientDB");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "fetch:", CFSTR("SELECT ci.zone_rowid, IFNULL(si.pcs_state, 0) FROM client_items AS ci LEFT JOIN server_items AS si ON ci.item_id = si.item_id AND ci.zone_rowid = si.zone_rowid WHERE ci.rowid = %lld"), a4);

  if (objc_msgSend(v14, "next"))
  {
    objc_msgSend(v14, "numberAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "intAtIndex:", 1);
    objc_msgSend(v11, "serverZoneByRowID:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clientZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "encounteredErrorWithPCSState:enhancedDrivePrivacyEnabled:privateDB:atDate:", v16, objc_msgSend(v18, "enhancedDrivePrivacyEnabled"), objc_msgSend(v18, "isSharedZone") ^ 1, v10);
  }
  else
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v14, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v23)
      {
        objc_msgSend(v11, "clientDB");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastError");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 134218498;
      v26 = a4;
      v27 = 2112;
      v28 = v24;
      v29 = 2112;
      v30 = v19;
      _os_log_fault_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to compute the pcs chain status and zone rowid for item row %lld - %@%@", buf, 0x20u);
      if (!v23)
      {

      }
    }

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v15, "supportsEnhancedDrivePrivacy");
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encounteredErrorWithPCSState:enhancedDrivePrivacyEnabled:privateDB:atDate:", 0, v21, 1, v22);

  }
}

- (id)_injectionForAnalyticsServiceCode:(int)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  switch(a3)
  {
    case 3:
      v4 = (void *)MEMORY[0x1E0DE81E0];
      v5 = "AND item_localsyncupstate = 4";
      goto LABEL_6;
    case 2:
      v4 = (void *)MEMORY[0x1E0DE81E0];
      v5 = "AND desired_version IS NOT NULL";
      v6 = 31;
      goto LABEL_11;
    case 1:
      v4 = (void *)MEMORY[0x1E0DE81E0];
      v5 = "AND item_localsyncupstate = 3";
LABEL_6:
      v6 = 29;
      goto LABEL_11;
  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[BRCSyncHealthReport _injectionForAnalyticsServiceCode:].cold.1((uint64_t)v7, a3, v8);

  v4 = (void *)MEMORY[0x1E0DE81E0];
  v5 = "";
  v6 = 0;
LABEL_11:
  objc_msgSend(v4, "rawInjection:length:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)generateReportWithSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BRCTransferFailureReport *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BRCTransferFailureReport *v32;
  NSMutableSet *syncUpFailures;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  BRCTransferFailureReport *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  unsigned int v64;
  void *v65;
  BRCTransferFailureReport *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  BRCTransferFailureReport *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  double v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  NSObject *v100;
  BRCTransferFailureReport *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  void *v107;
  void *v108;
  double v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  BRCTransferFailureReport *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  NSObject *v129;
  void *v130;
  BRCTransferFailureReport *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  NSObject *v143;
  void *v144;
  BRCTransferFailureReport *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  double v155;
  void *v156;
  void *v157;
  void *v158;
  NSObject *v159;
  BRCTransferFailureReport *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  NSObject *v172;
  void *v173;
  BRCTransferFailureReport *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  id v178;
  void *v179;
  void *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  void *v184;
  void *v185;
  NSObject *v186;
  void *v187;
  BRCTransferFailureReport *v188;
  uint64_t v189;
  void *v190;
  void *v191;
  id v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  time_t v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  NSObject *v207;
  BRDSIDString *v208;
  BRDSIDString *dsid;
  NSString *v210;
  NSString *rampNumber;
  void *v212;
  NSObject *v213;
  uint64_t v214;
  void *v215;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  uint64_t v224;
  void *context;
  void *contexta;
  void *v227;
  _QWORD v228[5];
  _QWORD v229[5];
  _QWORD v230[5];
  _QWORD v231[5];
  uint8_t buf[4];
  _BYTE v233[18];
  uint64_t v234;
  _QWORD v235[4];

  v235[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_totalZoneCount)
  {
    brc_bread_crumbs();
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v213 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v213, OS_LOG_TYPE_FAULT))
      -[BRCSyncHealthReport generateReportWithSession:].cold.2();

  }
  objc_msgSend(v4, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  v6 = MEMORY[0x1E0C809B0];
  v231[0] = MEMORY[0x1E0C809B0];
  v231[1] = 3221225472;
  v231[2] = __49__BRCSyncHealthReport_generateReportWithSession___block_invoke;
  v231[3] = &unk_1E875ECD0;
  v231[4] = self;
  objc_msgSend(v4, "enumerateClientZones:", v231);
  self->_totalZoneCount += 4;
  objc_msgSend(v4, "containerScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalZoneSyncDownAnalyticsErrors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v230[0] = v6;
  v230[1] = 3221225472;
  v230[2] = __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_2;
  v230[3] = &unk_1E875ECF8;
  v230[4] = self;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v230);

  objc_msgSend(v4, "containerScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internalZoneSyncUpAnalyticsErrors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v229[0] = v6;
  v229[1] = 3221225472;
  v229[2] = __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_3;
  v229[3] = &unk_1E875ECF8;
  v229[4] = self;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v229);

  v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:", v12);

  objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = v11;
  objc_msgSend(v11, "setTimeZone:", v13);

  objc_msgSend(v4, "clientDB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "fetch:", CFSTR("SELECT error_domain, error_code, error_message, error_timestamp, service, item_rowid FROM item_errors"));

  v227 = v4;
  if (objc_msgSend(v15, "next"))
  {
    v217 = *MEMORY[0x1E0C94810];
    while (1)
    {
      v221 = (void *)MEMORY[0x1D17A6BE8]();
      objc_msgSend(v15, "stringAtIndex:", 0);
      context = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "longLongAtIndex:", 1);
      objc_msgSend(v15, "stringAtIndex:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringAtIndex:", 3);
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "intAtIndex:", 4);
      v19 = objc_msgSend(v15, "longLongAtIndex:", 5);
      -[BRCSyncHealthReport _injectionForAnalyticsServiceCode:](self, "_injectionForAnalyticsServiceCode:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clientDB");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE rowid = %llu %@"), v19, v20);

      if ((objc_msgSend(v22, "BOOLValue") & 1) != 0)
        break;
      objc_msgSend(v4, "clientDB");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "execute:", CFSTR("DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d"), v19, v18);
LABEL_32:

      objc_autoreleasePoolPop(v221);
      if ((objc_msgSend(v15, "next") & 1) == 0)
        goto LABEL_33;
    }
    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v24 = v23;
    if (v17)
    {
      v234 = v217;
      v235[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v235, &v234, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", context, v16, v25);

    }
    else
    {
      v17 = 0;
      v26 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", context, v16, 0);
    }
    if (objc_msgSend(v223, "length"))
      objc_msgSend(v219, "dateFromString:", v223);
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v26);
    v220 = (void *)v27;
    switch((_DWORD)v18)
    {
      case 3:
        -[NSMutableSet member:](self->_syncUpFailures, "member:", v28);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)v37;
        if (v37)
          v39 = (void *)v37;
        else
          v39 = v28;
        v32 = v39;

        syncUpFailures = self->_syncUpFailures;
        break;
      case 2:
        -[NSMutableSet member:](self->_downloadFailures, "member:", v28);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        if (v34)
          v36 = (void *)v34;
        else
          v36 = v28;
        v32 = v36;

        syncUpFailures = self->_downloadFailures;
        break;
      case 1:
        -[NSMutableSet member:](self->_uploadFailures, "member:", v28);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        if (v29)
          v31 = (void *)v29;
        else
          v31 = v28;
        v32 = v31;

        syncUpFailures = self->_uploadFailures;
        break;
      default:
        brc_bread_crumbs();
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v233 = v18;
          *(_WORD *)&v233[4] = 2112;
          *(_QWORD *)&v233[6] = v215;
          _os_log_fault_impl(&dword_1CBD43000, v40, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No service with code %d%@", buf, 0x12u);
        }

        goto LABEL_31;
    }
    -[NSMutableSet addObject:](syncUpFailures, "addObject:", v32);
    v28 = v32;
LABEL_31:
    v4 = v227;
    -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v28, v19, v220, v227);

    goto LABEL_32;
  }
LABEL_33:
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v216, "delayForStuckThrottle");
  v214 = brc_current_date_nsec();
  v42 = v214 - v41;
  objc_msgSend(v4, "clientDB");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = v42;
  v44 = (void *)objc_msgSend(v43, "fetch:", CFSTR("SELECT cd.throttle_id, cd.last_try_stamp FROM client_downloads AS cd INNER JOIN client_items AS li ON cd.throttle_id = li.rowid WHERE cd.last_try_stamp > 0 AND cd.last_try_stamp < %lld AND cd.retry_count = 0 AND cd.throttle_state = 1 AND cd.transfer_queue != '_done' AND li.item_state IN (0, -1) AND li.item_localsyncupstate = 0 AND li.desired_version IS NOT NULL"), v42);

  if (objc_msgSend(v44, "next"))
  {
    v45 = *MEMORY[0x1E0D10B70];
    do
    {
      v46 = (void *)MEMORY[0x1D17A6BE8]();
      v47 = objc_msgSend(v44, "longLongAtIndex:", 0);
      objc_msgSend(v44, "doubleAtIndex:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v48 / 1000000000.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v45, 47, 0);
      brc_bread_crumbs();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v233 = v47;
        *(_WORD *)&v233[8] = 2112;
        *(_QWORD *)&v233[10] = v51;
        _os_log_impl(&dword_1CBD43000, v52, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item not scheduled for download%@", buf, 0x16u);
      }

      v53 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v50);
      -[NSMutableSet member:](self->_downloadFailures, "member:", v53);
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = (void *)v54;
      if (v54)
        v56 = (void *)v54;
      else
        v56 = v53;
      v57 = v56;

      -[NSMutableSet addObject:](self->_downloadFailures, "addObject:", v57);
      v58 = v47;
      v4 = v227;
      -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v57, v58, v49, v227);

      objc_autoreleasePoolPop(v46);
    }
    while ((objc_msgSend(v44, "next") & 1) != 0);
  }
  objc_msgSend(v4, "clientDB");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v59, "fetch:", CFSTR("SELECT COUNT(item_id), item_depth FROM server_items WHERE item_depth < 0 GROUP BY item_depth"));

  v222 = v60;
  if (objc_msgSend(v60, "next"))
  {
    v61 = *MEMORY[0x1E0D10B70];
    do
    {
      v62 = (void *)MEMORY[0x1D17A6BE8]();
      v63 = objc_msgSend(v60, "unsignedLongLongAtIndex:", 0);
      v64 = objc_msgSend(v60, "intAtIndex:", 1);
      if (v64 <= 0xFFFFFFFA)
      {
        brc_bread_crumbs();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v233 = v64;
          *(_WORD *)&v233[4] = 2112;
          *(_QWORD *)&v233[6] = v65;
          _os_log_fault_impl(&dword_1CBD43000, v70, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Got unexpected item depth: %d%@", buf, 0x12u);
        }
      }
      else
      {
        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v61, 74 - (v64 + 5), 0);
        v66 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v65);
        -[NSMutableSet member:](self->_downloadFailures, "member:", v66);
        v67 = objc_claimAutoreleasedReturnValue();
        v68 = (void *)v67;
        if (v67)
          v69 = (void *)v67;
        else
          v69 = v66;
        v70 = v69;

        v60 = v222;
        -[NSObject encounteredErrors:atDate:](v70, "encounteredErrors:atDate:", v63, 0);
      }

      objc_autoreleasePoolPop(v62);
    }
    while ((objc_msgSend(v60, "next") & 1) != 0);
  }
  objc_msgSend(v227, "clientDB");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "fetch:", CFSTR("SELECT cu.throttle_id, cu.last_try_stamp FROM client_uploads AS cu INNER JOIN client_items AS li ON cu.throttle_id = li.rowid WHERE cu.last_try_stamp > 0 AND cu.last_try_stamp < %lld AND cu.retry_count = 0 AND cu.throttle_state = 1 AND cu.transfer_queue != '_done' AND li.item_state IN (0, -1) AND li.item_localsyncupstate = 3"), v218);

  if (objc_msgSend(v72, "next"))
  {
    v73 = *MEMORY[0x1E0D10B70];
    do
    {
      v74 = (void *)MEMORY[0x1D17A6BE8]();
      v75 = objc_msgSend(v72, "longLongAtIndex:", 0);
      objc_msgSend(v72, "doubleAtIndex:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v76 / 1000000000.0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v73, 49, 0);
      brc_bread_crumbs();
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v233 = v75;
        *(_WORD *)&v233[8] = 2112;
        *(_QWORD *)&v233[10] = v79;
        _os_log_impl(&dword_1CBD43000, v80, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item not scheduled for upload%@", buf, 0x16u);
      }

      v81 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v78);
      -[NSMutableSet member:](self->_uploadFailures, "member:", v81);
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = (void *)v82;
      if (v82)
        v84 = (void *)v82;
      else
        v84 = v81;
      v85 = v84;

      -[NSMutableSet addObject:](self->_uploadFailures, "addObject:", v85);
      -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v85, v75, v77, v227);

      objc_autoreleasePoolPop(v74);
    }
    while ((objc_msgSend(v72, "next") & 1) != 0);
  }
  v86 = v227;
  objc_msgSend(v227, "clientDB");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v87, "fetch:", CFSTR("SELECT csu.throttle_id, csu.last_try_stamp, li.zone_rowid FROM client_sync_up AS csu INNER JOIN client_items AS li ON csu.throttle_id = li.rowid WHERE csu.last_try_stamp > 0 AND csu.last_try_stamp < %lld AND csu.retry_count = 0 AND csu.throttle_state IN (1,50) AND NOT item_id_is_documents(li.item_id) AND li.item_localsyncupstate = 4"), v218);

  if (objc_msgSend(v88, "next"))
  {
    v224 = *MEMORY[0x1E0D10B70];
    do
    {
      contexta = (void *)MEMORY[0x1D17A6BE8]();
      v89 = objc_msgSend(v88, "longLongAtIndex:", 0);
      objc_msgSend(v88, "doubleAtIndex:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v90 / 1000000000.0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v233 = v89;
        *(_WORD *)&v233[8] = 2112;
        *(_QWORD *)&v233[10] = v92;
        _os_log_impl(&dword_1CBD43000, v93, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item not scheduled for sync up%@", buf, 0x16u);
      }

      objc_msgSend(v88, "numberAtIndex:", 2);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "serverZoneByRowID:", v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "clientZone");
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v96, "isSyncBlocked"))
        v97 = 36;
      else
        v97 = 51;
      v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v224, v97, 0);
      if (objc_msgSend(v96, "isSyncBlockedBecauseAppNotInstalled"))
      {
        brc_bread_crumbs();
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v233 = v96;
          *(_WORD *)&v233[8] = 2112;
          *(_QWORD *)&v233[10] = v99;
          _os_log_error_impl(&dword_1CBD43000, v100, (os_log_type_t)0x90u, "[ERROR] Zone %@ has items which need sync. Clearing app sync blocked%@", buf, 0x16u);
        }

        objc_msgSend(v96, "clearStateBits:", 4096);
        objc_msgSend(v96, "scheduleSyncUp");
      }
      v101 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v98);
      -[NSMutableSet member:](self->_syncUpFailures, "member:", v101);
      v102 = objc_claimAutoreleasedReturnValue();
      v103 = (void *)v102;
      if (v102)
        v104 = (void *)v102;
      else
        v104 = v101;
      v105 = v104;

      -[NSMutableSet addObject:](self->_syncUpFailures, "addObject:", v105);
      v106 = v89;
      v86 = v227;
      -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v105, v106, v91, v227);

      objc_autoreleasePoolPop(contexta);
    }
    while ((objc_msgSend(v88, "next") & 1) != 0);
  }
  objc_msgSend(v86, "clientDB");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)objc_msgSend(v107, "fetch:", CFSTR("SELECT ci.rowid FROM client_items AS ci WHERE ci.item_localsyncupstate = 4 AND ci.item_min_supported_os_rowid IS NULL AND NOT EXISTS (SELECT 1 FROM client_sync_up AS cs WHERE cs.throttle_id = ci.rowid AND cs.throttle_state != 0)"));

  v109 = (double)v214;
  if (objc_msgSend(v108, "next"))
  {
    v110 = *MEMORY[0x1E0D10B70];
    do
    {
      v111 = (void *)MEMORY[0x1D17A6BE8]();
      v112 = objc_msgSend(v108, "longLongAtIndex:", 0);
      v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v110, 52, 0);
      brc_bread_crumbs();
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v233 = v112;
        *(_WORD *)&v233[8] = 2112;
        *(_QWORD *)&v233[10] = v114;
        _os_log_impl(&dword_1CBD43000, v115, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item with a missing sync up throttle%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v109 / 1000000000.0);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v113);
      -[NSMutableSet member:](self->_syncUpFailures, "member:", v117);
      v118 = objc_claimAutoreleasedReturnValue();
      v119 = (void *)v118;
      if (v118)
        v120 = (void *)v118;
      else
        v120 = v117;
      v121 = v120;

      -[NSMutableSet addObject:](self->_syncUpFailures, "addObject:", v121);
      -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v121, v112, v116, v227);

      objc_autoreleasePoolPop(v111);
    }
    while ((objc_msgSend(v108, "next") & 1) != 0);
  }
  objc_msgSend(v227, "clientDB");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (void *)objc_msgSend(v122, "fetch:", CFSTR("SELECT ci.rowid FROM client_items AS ci LEFT JOIN client_uploads AS cu ON ci.rowid = cu.throttle_id WHERE ci.item_localsyncupstate = 3 AND ci.item_type IN (1, 6) AND ci.item_state IN (0, -1) AND IFNULL(cu.throttle_state, 0) = 0"));

  if (objc_msgSend(v123, "next"))
  {
    v124 = *MEMORY[0x1E0D10B70];
    do
    {
      v125 = (void *)MEMORY[0x1D17A6BE8]();
      v126 = objc_msgSend(v123, "longLongAtIndex:", 0);
      v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v124, 50, 0);
      brc_bread_crumbs();
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v233 = v126;
        *(_WORD *)&v233[8] = 2112;
        *(_QWORD *)&v233[10] = v128;
        _os_log_impl(&dword_1CBD43000, v129, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item with a missing upload throttle%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v109 / 1000000000.0);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v127);
      -[NSMutableSet member:](self->_uploadFailures, "member:", v131);
      v132 = objc_claimAutoreleasedReturnValue();
      v133 = (void *)v132;
      if (v132)
        v134 = (void *)v132;
      else
        v134 = v131;
      v135 = v134;

      -[NSMutableSet addObject:](self->_uploadFailures, "addObject:", v135);
      -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v135, v126, v130, v227);

      objc_autoreleasePoolPop(v125);
    }
    while ((objc_msgSend(v123, "next") & 1) != 0);
  }
  objc_msgSend(v227, "clientDB");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (void *)objc_msgSend(v136, "fetch:", CFSTR("SELECT ci.rowid FROM client_items AS ci WHERE ci.desired_version IS NOT NULL AND ci.item_staged_file_id IS NULL AND ci.item_state IN (0, -1) AND NOT EXISTS (SELECT 1 FROM client_downloads AS cd WHERE cd.throttle_id = ci.rowid AND cd.download_kind = %d AND cd.throttle_state != 0) AND call_block(%p, ci.desired_version)"), 0, &__block_literal_global_403);

  if (objc_msgSend(v137, "next"))
  {
    v138 = *MEMORY[0x1E0D10B70];
    do
    {
      v139 = (void *)MEMORY[0x1D17A6BE8]();
      v140 = objc_msgSend(v137, "longLongAtIndex:", 0);
      v141 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v138, 48, 0);
      brc_bread_crumbs();
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v143 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v233 = v140;
        *(_WORD *)&v233[8] = 2112;
        *(_QWORD *)&v233[10] = v142;
        _os_log_impl(&dword_1CBD43000, v143, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item with a missing download throttle%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v109 / 1000000000.0);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v141);
      -[NSMutableSet member:](self->_downloadFailures, "member:", v145);
      v146 = objc_claimAutoreleasedReturnValue();
      v147 = (void *)v146;
      if (v146)
        v148 = (void *)v146;
      else
        v148 = v145;
      v149 = v148;

      -[NSMutableSet addObject:](self->_downloadFailures, "addObject:", v149);
      -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v149, v140, v144, v227);

      objc_autoreleasePoolPop(v139);
    }
    while ((objc_msgSend(v137, "next") & 1) != 0);
  }
  objc_msgSend(v227, "clientDB");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = (void *)objc_msgSend(v150, "fetch:", CFSTR("SELECT crt.throttle_id, crt.last_try_stamp FROM client_reader_throttle AS crt INNER JOIN client_items AS ci ON crt.throttle_id = ci.rowid WHERE crt.last_try_stamp > 0 AND crt.last_try_stamp < %lld AND crt.retry_count = 0 AND crt.throttle_state = 1 AND ci.item_state IN (0, -1) AND ci.item_localsyncupstate = 2"), v218);

  if (objc_msgSend(v151, "next"))
  {
    v152 = *MEMORY[0x1E0D10B70];
    do
    {
      v153 = (void *)MEMORY[0x1D17A6BE8]();
      v154 = objc_msgSend(v151, "longLongAtIndex:", 0);
      objc_msgSend(v151, "doubleAtIndex:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v155 / 1000000000.0);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v152, 53, 0);
      brc_bread_crumbs();
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v159 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v233 = v154;
        *(_WORD *)&v233[8] = 2112;
        *(_QWORD *)&v233[10] = v158;
        _os_log_impl(&dword_1CBD43000, v159, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item not scheduled for reading%@", buf, 0x16u);
      }

      v160 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v157);
      -[NSMutableSet member:](self->_uploadFailures, "member:", v160);
      v161 = objc_claimAutoreleasedReturnValue();
      v162 = (void *)v161;
      if (v161)
        v163 = (void *)v161;
      else
        v163 = v160;
      v164 = v163;

      -[NSMutableSet addObject:](self->_uploadFailures, "addObject:", v164);
      -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v164, v154, v156, v227);

      objc_autoreleasePoolPop(v153);
    }
    while ((objc_msgSend(v151, "next") & 1) != 0);
  }
  objc_msgSend(v227, "clientDB");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = (void *)objc_msgSend(v165, "fetch:", CFSTR("SELECT ci.rowid FROM client_items AS ci LEFT JOIN client_reader_throttle AS crt ON ci.rowid = crt.throttle_id WHERE ci.item_localsyncupstate = 2 AND ci.item_type IN (1, 6) AND ci.item_state IN (0, -1) AND IFNULL(crt.throttle_state, 0) = 0"));

  if (objc_msgSend(v166, "next"))
  {
    v167 = *MEMORY[0x1E0D10B70];
    do
    {
      v168 = (void *)MEMORY[0x1D17A6BE8]();
      v169 = objc_msgSend(v166, "longLongAtIndex:", 0);
      v170 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v167, 54, 0);
      brc_bread_crumbs();
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v172 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v233 = v169;
        *(_WORD *)&v233[8] = 2112;
        *(_QWORD *)&v233[10] = v171;
        _os_log_impl(&dword_1CBD43000, v172, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item with a missing reader throttle%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v109 / 1000000000.0);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v170);
      -[NSMutableSet member:](self->_uploadFailures, "member:", v174);
      v175 = objc_claimAutoreleasedReturnValue();
      v176 = (void *)v175;
      if (v175)
        v177 = (void *)v175;
      else
        v177 = v174;
      v178 = v177;

      -[NSMutableSet addObject:](self->_uploadFailures, "addObject:", v178);
      -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v178, v169, v173, v227);

      objc_autoreleasePoolPop(v168);
    }
    while ((objc_msgSend(v166, "next") & 1) != 0);
  }
  objc_msgSend(v227, "clientDB");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = (void *)objc_msgSend(v179, "fetch:", CFSTR("SELECT ci.rowid FROM client_items AS ci INNER JOIN client_reader_throttle AS crt ON ci.rowid = crt.throttle_id WHERE ci.item_localsyncupstate = 2 AND ci.item_type IN (1, 6) AND ci.item_state IN (0, -1) AND crt.retry_count > %lld"), objc_msgSend(v216, "readerRetryCountForFailure"));

  if (objc_msgSend(v180, "next"))
  {
    v181 = *MEMORY[0x1E0D10B70];
    do
    {
      v182 = (void *)MEMORY[0x1D17A6BE8]();
      v183 = objc_msgSend(v180, "longLongAtIndex:", 0);
      v184 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v181, 55, 0);
      brc_bread_crumbs();
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v186 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v233 = v183;
        *(_WORD *)&v233[8] = 2112;
        *(_QWORD *)&v233[10] = v185;
        _os_log_impl(&dword_1CBD43000, v186, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item stuck reading%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v109 / 1000000000.0);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      v188 = -[BRCTransferFailureReport initWithError:]([BRCTransferFailureReport alloc], "initWithError:", v184);
      -[NSMutableSet member:](self->_uploadFailures, "member:", v188);
      v189 = objc_claimAutoreleasedReturnValue();
      v190 = (void *)v189;
      if (v189)
        v191 = (void *)v189;
      else
        v191 = v188;
      v192 = v191;

      -[NSMutableSet addObject:](self->_uploadFailures, "addObject:", v192);
      -[BRCSyncHealthReport _fillTransferFailure:withRowID:atDate:session:](self, "_fillTransferFailure:withRowID:atDate:session:", v192, v183, v187, v227);

      objc_autoreleasePoolPop(v182);
    }
    while ((objc_msgSend(v180, "next") & 1) != 0);
  }
  objc_msgSend(v227, "clientDB");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = (void *)objc_msgSend(v193, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM client_items WHERE item_type IN (9, 10)"));
  self->_clientTruthDirFaultCount = objc_msgSend(v194, "unsignedLongLongValue");

  objc_msgSend(v227, "clientDB");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = (void *)objc_msgSend(v195, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM server_items WHERE item_type IN (9, 10)"));
  self->_serverTruthDirFaultCount = objc_msgSend(v196, "unsignedLongLongValue");

  objc_msgSend(v227, "clientDB");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = (void *)objc_msgSend(v197, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM server_items WHERE item_type IN (0, 9, 10)"));
  self->_serverTruthDirCount = objc_msgSend(v198, "unsignedLongLongValue");

  v199 = time(0);
  objc_msgSend(v227, "clientDB");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = (void *)objc_msgSend(v200, "numberWithSQL:", CFSTR("SELECT MIN(date) FROM boot_history"));
  self->_timeSinceLogin = v199 - objc_msgSend(v201, "unsignedLongLongValue");

  self->_zonesNeverFullSync = 0;
  v228[0] = MEMORY[0x1E0C809B0];
  v228[1] = 3221225472;
  v228[2] = __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_419;
  v228[3] = &unk_1E875ED40;
  v228[4] = self;
  objc_msgSend(v227, "enumeratePrivateClientZones:", v228);
  objc_msgSend(v227, "clientDB");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = (void *)objc_msgSend(v202, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM client_items"));
  self->_clientTruthTotalItemsCount = objc_msgSend(v203, "unsignedLongLongValue");

  objc_msgSend(v227, "clientDB");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = (void *)objc_msgSend(v204, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM server_items"));
  self->_serverTruthTotalItemsCount = objc_msgSend(v205, "unsignedLongLongValue");

  -[BRCSyncHealthReport _collectAggregatedTelemetryForSession:](self, "_collectAggregatedTelemetryForSession:", v227);
  brc_bread_crumbs();
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v207 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v207, OS_LOG_TYPE_DEBUG))
    -[BRCSyncHealthReport generateReportWithSession:].cold.1();

  objc_msgSend(v227, "accountDSID");
  v208 = (BRDSIDString *)objc_claimAutoreleasedReturnValue();
  dsid = self->_dsid;
  self->_dsid = v208;

  -[BRCSyncHealthReport getRampNumberForSession:](self, "getRampNumberForSession:", v227);
  v210 = (NSString *)objc_claimAutoreleasedReturnValue();
  rampNumber = self->_rampNumber;
  self->_rampNumber = v210;

}

uint64_t __49__BRCSyncHealthReport_generateReportWithSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v3 = a2;
  if (objc_msgSend(v3, "isSyncBlocked"))
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(v3, "serverZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "syncUpAnalyticsError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v6, v5);

  objc_msgSend(v3, "syncDownAnalyticsError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v7, v5);
  return 1;
}

uint64_t __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", a3, a2);
}

uint64_t __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", a3, a2);
}

void __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_401(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  id v7;

  v6 = (void *)MEMORY[0x1D17A6BE8]();
  v7 = +[BRCDesiredVersion newFromSqliteValue:](BRCDesiredVersion, "newFromSqliteValue:", *a4);
  sqlite3_result_int(a2, objc_msgSend(v7, "wantsContent"));

  objc_autoreleasePoolPop(v6);
}

uint64_t __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_419(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = a2;
  if ((objc_msgSend(v3, "isSyncBlocked") & 1) == 0)
  {
    objc_msgSend(v3, "serverZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    if ((v5 & 0x20) == 0)
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  }

  return 1;
}

- (void)dumpAggregatedEvents:(id)a3
{
  void (**v4)(id, void *);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  if (-[NSMutableArray count](self->_aggregatedEvents, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_aggregatedEvents;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          +[BRCAnalyticsReporter _aggregatedTelemetryDescription:](BRCAnalyticsReporter, "_aggregatedTelemetryDescription:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("none"));
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);
  }

}

- (void)syncErrors:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  NSMutableSet *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ii;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t jj;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  BRCSyncHealthReport *v84;
  void *v85;
  id obj;
  id obja;
  id objb;
  id objc;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
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
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  if (!-[NSMutableSet count](self->_uploadFailures, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uploadError: none"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);

  }
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v6 = self->_uploadFailures;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v120;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v120 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uploadError: %@"), *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v11);

      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
    }
    while (v8);
  }

  if (!-[NSMutableSet count](self->_syncUpFailures, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("syncUpError: none"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v12);

  }
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v13 = self->_syncUpFailures;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v116;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v116 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("syncUpError: %@"), *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v18);

      }
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
    }
    while (v15);
  }

  if (!-[NSMutableSet count](self->_downloadFailures, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("downloadError: none"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v19);

  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v20 = self->_downloadFailures;
  v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v112;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v112 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("downloadError: %@"), *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * k));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v25);

      }
      v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
    }
    while (v22);
  }

  v84 = self;
  +[BRCCoreAnalyticsReporter dictionaryForErrorsByZone:wantPrivateZone:](BRCCoreAnalyticsReporter, "dictionaryForErrorsByZone:wantPrivateZone:", self->_syncUpErrorsByMangledID, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v26, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("syncUpSharedZoneError: none"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v27);

  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v94 = v26;
  objc_msgSend(v26, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
  if (v28)
  {
    v29 = v28;
    v90 = *(_QWORD *)v108;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v108 != v90)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * m);
        v32 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v31, "error");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "domain");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "error");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "code");
        if (objc_msgSend(v31, "isPCSChained"))
          v37 = "yes";
        else
          v37 = "no";
        objc_msgSend(v94, "objectForKeyedSubscript:", v31);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("syncUpSharedZoneError: %@;%ld pcs:%s count:%@"),
          v34,
          v36,
          v37,
          v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v39);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
    }
    while (v29);
  }

  +[BRCCoreAnalyticsReporter dictionaryForErrorsByZone:wantPrivateZone:](BRCCoreAnalyticsReporter, "dictionaryForErrorsByZone:wantPrivateZone:", v84->_syncUpErrorsByMangledID, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v40, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("syncUpPrivateZoneError: none"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v41);

  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v83 = v40;
  objc_msgSend(v40, "allKeys");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
  if (v42)
  {
    v43 = v42;
    v91 = *(_QWORD *)v104;
    do
    {
      for (n = 0; n != v43; ++n)
      {
        if (*(_QWORD *)v104 != v91)
          objc_enumerationMutation(obja);
        v45 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * n);
        v46 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v45, "error");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "domain");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "error");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "code");
        if (objc_msgSend(v45, "isPCSChained"))
          v51 = "yes";
        else
          v51 = "no";
        objc_msgSend(v94, "objectForKeyedSubscript:", v45);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("syncUpPrivateZoneError: %@;%ld pcs:%s count:%@"),
          v48,
          v50,
          v51,
          v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v53);

      }
      v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
    }
    while (v43);
  }

  +[BRCCoreAnalyticsReporter dictionaryForErrorsByZone:wantPrivateZone:](BRCCoreAnalyticsReporter, "dictionaryForErrorsByZone:wantPrivateZone:", v84->_syncDownErrorsByMangledID, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v54, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("syncDownSharedZoneError: none"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v55);

  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v82 = v54;
  objc_msgSend(v54, "allKeys");
  objb = (id)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v99, v124, 16);
  if (v56)
  {
    v57 = v56;
    v92 = *(_QWORD *)v100;
    do
    {
      for (ii = 0; ii != v57; ++ii)
      {
        if (*(_QWORD *)v100 != v92)
          objc_enumerationMutation(objb);
        v59 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * ii);
        v60 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v59, "error");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "domain");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "error");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "code");
        if (objc_msgSend(v59, "isPCSChained"))
          v65 = "yes";
        else
          v65 = "no";
        objc_msgSend(v94, "objectForKeyedSubscript:", v59);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "stringWithFormat:", CFSTR("syncDownSharedZoneError: %@;%ld pcs:%s count:%@"),
          v62,
          v64,
          v65,
          v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v67);

      }
      v57 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v99, v124, 16);
    }
    while (v57);
  }

  +[BRCCoreAnalyticsReporter dictionaryForErrorsByZone:wantPrivateZone:](BRCCoreAnalyticsReporter, "dictionaryForErrorsByZone:wantPrivateZone:", v84->_syncDownErrorsByMangledID, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v68, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("syncDownPrivateZoneError: none"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v69);

  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v85 = v68;
  objc_msgSend(v68, "allKeys");
  objc = (id)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v95, v123, 16);
  if (v70)
  {
    v71 = v70;
    v93 = *(_QWORD *)v96;
    do
    {
      for (jj = 0; jj != v71; ++jj)
      {
        if (*(_QWORD *)v96 != v93)
          objc_enumerationMutation(objc);
        v73 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * jj);
        v74 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v73, "error");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "domain");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "error");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "code");
        if (objc_msgSend(v73, "isPCSChained"))
          v79 = "yes";
        else
          v79 = "no";
        objc_msgSend(v94, "objectForKeyedSubscript:", v73);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "stringWithFormat:", CFSTR("syncDownPrivateZoneError: %@;%ld pcs:%s count:%@"),
          v76,
          v78,
          v79,
          v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v81);

      }
      v71 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v95, v123, 16);
    }
    while (v71);
  }

}

- (NSArray)telemetryErrorEvents
{
  void *v3;
  NSMutableDictionary *syncUpErrorsByMangledID;
  uint64_t v5;
  id v6;
  NSMutableDictionary *syncDownErrorsByMangledID;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BRCSyncHealthReport *v47;
  NSMutableSet *obj;
  NSMutableSet *obja;
  NSMutableSet *objb;
  _QWORD v51[5];
  id v52;
  uint64_t *v53;
  _QWORD v54[5];
  id v55;
  uint64_t *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  int v64;
  _QWORD v65[5];
  id v66;
  uint64_t *v67;
  _QWORD v68[5];
  id v69;
  uint64_t *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  int v78;
  _QWORD v79[5];
  id v80;
  uint64_t *v81;
  _QWORD v82[5];
  id v83;
  uint64_t *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  int v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v46 = -[NSMutableDictionary count](self->_syncUpErrorsByMangledID, "count");
  v44 = -[NSMutableDictionary count](self->_syncDownErrorsByMangledID, "count");
  v47 = self;
  syncUpErrorsByMangledID = self->_syncUpErrorsByMangledID;
  v5 = MEMORY[0x1E0C809B0];
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke;
  v95[3] = &unk_1E875ECF8;
  v6 = v3;
  v96 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](syncUpErrorsByMangledID, "enumerateKeysAndObjectsUsingBlock:", v95);
  syncDownErrorsByMangledID = self->_syncDownErrorsByMangledID;
  v93[0] = v5;
  v93[1] = 3221225472;
  v93[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_2;
  v93[3] = &unk_1E875ECF8;
  v8 = v6;
  v94 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](syncDownErrorsByMangledID, "enumerateKeysAndObjectsUsingBlock:", v93);
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = 0;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = self->_uploadFailures;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v86 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        objc_msgSend(v12, "privateDBErrorCountByPCSAndEDPState", v44);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = v5;
        v82[1] = 3221225472;
        v82[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_3;
        v82[3] = &unk_1E875ED68;
        v82[4] = v12;
        v14 = v8;
        v83 = v14;
        v84 = &v89;
        objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v82);

        objc_msgSend(v12, "shareDBErrorCountByPCSAndEDPState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = v5;
        v79[1] = 3221225472;
        v79[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_4;
        v79[3] = &unk_1E875ED68;
        v79[4] = v12;
        v80 = v14;
        v81 = &v89;
        objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v79);

      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
    }
    while (v9);
  }

  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obja = v47->_downloadFailures;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v71, v98, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v72 != v17)
          objc_enumerationMutation(obja);
        v19 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
        objc_msgSend(v19, "privateDBErrorCountByPCSAndEDPState", v44);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = v5;
        v68[1] = 3221225472;
        v68[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_5;
        v68[3] = &unk_1E875ED68;
        v68[4] = v19;
        v21 = v8;
        v69 = v21;
        v70 = &v75;
        objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v68);

        objc_msgSend(v19, "shareDBErrorCountByPCSAndEDPState");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = v5;
        v65[1] = 3221225472;
        v65[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_6;
        v65[3] = &unk_1E875ED68;
        v65[4] = v19;
        v66 = v21;
        v67 = &v75;
        objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v65);

      }
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v71, v98, 16);
    }
    while (v16);
  }

  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  objb = v47->_syncUpFailures;
  v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v57, v97, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v58 != v24)
          objc_enumerationMutation(objb);
        v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
        objc_msgSend(v26, "privateDBErrorCountByPCSAndEDPState", v44);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v5;
        v54[1] = 3221225472;
        v54[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_7;
        v54[3] = &unk_1E875ED68;
        v54[4] = v26;
        v28 = v8;
        v55 = v28;
        v56 = &v61;
        objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v54);

        objc_msgSend(v26, "shareDBErrorCountByPCSAndEDPState");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v5;
        v51[1] = 3221225472;
        v51[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_8;
        v51[3] = &unk_1E875ED68;
        v51[4] = v26;
        v52 = v28;
        v53 = &v61;
        objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v51);

      }
      v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v57, v97, 16);
    }
    while (v23);
  }

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "telemetryEventQueueSize");

  v32 = v31 - 6;
  if (objc_msgSend(v8, "count") > v32)
    objc_msgSend(v8, "removeObjectsInRange:", v32, objc_msgSend(v8, "count") - v32);
  v33 = *((_DWORD *)v90 + 6);
  v34 = *((_DWORD *)v76 + 6);
  v35 = *((_DWORD *)v62 + 6);
  v36 = +[AppTelemetryTimeSeriesEvent newCASyncUpZoneErrorCountEventWithCount:](AppTelemetryTimeSeriesEvent, "newCASyncUpZoneErrorCountEventWithCount:", v46, v44);
  objc_msgSend(v8, "addObject:", v36);

  v37 = +[AppTelemetryTimeSeriesEvent newCASyncDownErrorCountEventWithCount:](AppTelemetryTimeSeriesEvent, "newCASyncDownErrorCountEventWithCount:", v45);
  objc_msgSend(v8, "addObject:", v37);

  v38 = +[AppTelemetryTimeSeriesEvent newCASyncUpItemErrorCountEventWithCount:](AppTelemetryTimeSeriesEvent, "newCASyncUpItemErrorCountEventWithCount:", *((unsigned int *)v62 + 6));
  objc_msgSend(v8, "addObject:", v38);

  v39 = +[AppTelemetryTimeSeriesEvent newCAUploadErrorCountEventWithCount:](AppTelemetryTimeSeriesEvent, "newCAUploadErrorCountEventWithCount:", *((unsigned int *)v90 + 6));
  objc_msgSend(v8, "addObject:", v39);

  v40 = +[AppTelemetryTimeSeriesEvent newCADownloadErrorCountEventWithCount:](AppTelemetryTimeSeriesEvent, "newCADownloadErrorCountEventWithCount:", *((unsigned int *)v76 + 6));
  objc_msgSend(v8, "addObject:", v40);

  v41 = +[AppTelemetryTimeSeriesEvent newCATotalErrorCountEventWithCount:](AppTelemetryTimeSeriesEvent, "newCATotalErrorCountEventWithCount:", (v45 + v46 + v33 + v34 + v35));
  objc_msgSend(v8, "addObject:", v41);

  v42 = v8;
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v89, 8);

  return (NSArray *)v42;
}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "error");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isPCSChained");
  v8 = objc_msgSend(v5, "isEnhancedDrivePrivacyEnabled");

  v9 = +[AppTelemetryTimeSeriesEvent newCASyncUpZoneErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:zoneMangledID:](AppTelemetryTimeSeriesEvent, "newCASyncUpZoneErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:zoneMangledID:", v10, v7, v8, v6);
  objc_msgSend(v4, "addObject:", v9);

}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "error");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isPCSChained");
  v8 = objc_msgSend(v5, "isEnhancedDrivePrivacyEnabled");

  v9 = +[AppTelemetryTimeSeriesEvent newCASyncDownErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:zoneMangledID:](AppTelemetryTimeSeriesEvent, "newCASyncDownErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:zoneMangledID:", v10, v7, v8, v6);
  objc_msgSend(v4, "addObject:", v9);

}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  id v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "left");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v6, "right");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  v11 = objc_msgSend(v5, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "error");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  v13 = +[AppTelemetryTimeSeriesEvent newCAUploadErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:](AppTelemetryTimeSeriesEvent, "newCAUploadErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:", v15, (v8 & 0xFFFFFFFE) == 2, v10, 0, v11);
  objc_msgSend(v12, "addObject:", v13);

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry"))
    v14 = 0;
  else
    v14 = v11;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v14;

}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  id v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "left");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v6, "right");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  v11 = objc_msgSend(v5, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "error");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  v13 = +[AppTelemetryTimeSeriesEvent newCAUploadErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:](AppTelemetryTimeSeriesEvent, "newCAUploadErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:", v15, (v8 & 0xFFFFFFFE) == 2, v10, 1, v11);
  objc_msgSend(v12, "addObject:", v13);

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry"))
    v14 = 0;
  else
    v14 = v11;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v14;

}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  id v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "left");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v6, "right");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  v11 = objc_msgSend(v5, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "error");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  v13 = +[AppTelemetryTimeSeriesEvent newCADownloadErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:](AppTelemetryTimeSeriesEvent, "newCADownloadErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:", v15, (v8 & 0xFFFFFFFE) == 2, v10, 0, v11);
  objc_msgSend(v12, "addObject:", v13);

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry"))
    v14 = 0;
  else
    v14 = v11;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v14;

}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  id v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "left");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v6, "right");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  v11 = objc_msgSend(v5, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "error");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  v13 = +[AppTelemetryTimeSeriesEvent newCADownloadErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:](AppTelemetryTimeSeriesEvent, "newCADownloadErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:", v15, (v8 & 0xFFFFFFFE) == 2, v10, 1, v11);
  objc_msgSend(v12, "addObject:", v13);

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry"))
    v14 = 0;
  else
    v14 = v11;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v14;

}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  id v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "left");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v6, "right");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  v11 = objc_msgSend(v5, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "error");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  v13 = +[AppTelemetryTimeSeriesEvent newCASyncUpItemErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:](AppTelemetryTimeSeriesEvent, "newCASyncUpItemErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:", v15, (v8 & 0xFFFFFFFE) == 2, v10, 0, v11);
  objc_msgSend(v12, "addObject:", v13);

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry"))
    v14 = 0;
  else
    v14 = v11;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v14;

}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  id v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "left");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v6, "right");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  v11 = objc_msgSend(v5, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "error");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  v13 = +[AppTelemetryTimeSeriesEvent newCASyncUpItemErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:](AppTelemetryTimeSeriesEvent, "newCASyncUpItemErrorEventWithError:pcsChained:enhancedDrivePrivacyEnabled:sharedZone:count:", v15, (v8 & 0xFFFFFFFE) == 2, v10, 1, v11);
  objc_msgSend(v12, "addObject:", v13);

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry"))
    v14 = 0;
  else
    v14 = v11;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v14;

}

- (NSArray)telemetryOtherEvents
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_new();
  v4 = +[AppTelemetryTimeSeriesEvent newQBSDirFaultsCountEvent:serverTruthDirFaultCount:serverTruthDirCount:timeSinceLogin:serverTruthTotalItemsCount:zonesNeverFullSync:](AppTelemetryTimeSeriesEvent, "newQBSDirFaultsCountEvent:serverTruthDirFaultCount:serverTruthDirCount:timeSinceLogin:serverTruthTotalItemsCount:zonesNeverFullSync:", self->_clientTruthDirFaultCount, self->_serverTruthDirFaultCount, self->_serverTruthDirCount, self->_timeSinceLogin, self->_serverTruthTotalItemsCount, self->_zonesNeverFullSync);
  objc_msgSend(v3, "addObject:", v4);

  return (NSArray *)v3;
}

- (unint64_t)totalZoneCount
{
  return self->_totalZoneCount;
}

- (unint64_t)blockedZonesCount
{
  return self->_blockedZonesCount;
}

- (unint64_t)clientTruthTotalItemsCount
{
  return self->_clientTruthTotalItemsCount;
}

- (unint64_t)serverTruthTotalItemsCount
{
  return self->_serverTruthTotalItemsCount;
}

- (unint64_t)zonesNeverFullSync
{
  return self->_zonesNeverFullSync;
}

- (NSDictionary)syncUpErrorsByMangledID
{
  return &self->_syncUpErrorsByMangledID->super;
}

- (NSDictionary)syncDownErrorsByMangledID
{
  return &self->_syncDownErrorsByMangledID->super;
}

- (NSSet)syncUpFailures
{
  return &self->_syncUpFailures->super;
}

- (NSSet)uploadFailures
{
  return &self->_uploadFailures->super;
}

- (NSSet)downloadFailures
{
  return &self->_downloadFailures->super;
}

- (NSArray)aggregatedEvents
{
  return &self->_aggregatedEvents->super;
}

- (NSString)dsid
{
  return (NSString *)self->_dsid;
}

- (NSString)rampNumber
{
  return self->_rampNumber;
}

- (unint64_t)clientTruthDirFaultCount
{
  return self->_clientTruthDirFaultCount;
}

- (unint64_t)serverTruthDirFaultCount
{
  return self->_serverTruthDirFaultCount;
}

- (unint64_t)serverTruthDirCount
{
  return self->_serverTruthDirCount;
}

- (unint64_t)timeSinceLogin
{
  return self->_timeSinceLogin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedEvents, 0);
  objc_storeStrong((id *)&self->_downloadFailures, 0);
  objc_storeStrong((id *)&self->_uploadFailures, 0);
  objc_storeStrong((id *)&self->_syncUpFailures, 0);
  objc_storeStrong((id *)&self->_rampNumber, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_syncDownErrorsByMangledID, 0);
  objc_storeStrong((id *)&self->_syncUpErrorsByMangledID, 0);
}

- (void)_injectionForAnalyticsServiceCode:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No service with code %d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)generateReportWithSession:.cold.1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t v7;
  uint8_t v8[14];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_15_0();
  v9 = v0;
  v10 = v1;
  v11 = v2;
  v12 = v1;
  v13 = v3;
  v14 = v1;
  v15 = v4;
  v16 = v1;
  v17 = v5;
  v18 = v1;
  v19 = v6;
  _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated sync health report with upload failures:%@\ndownload failures:%@\nsync up failures:%@\nzone sync up errors:%@\nzone sync down errors:%@\naggregated events:%@%@", v8, 0x48u);
}

- (void)generateReportWithSession:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _totalZoneCount == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
