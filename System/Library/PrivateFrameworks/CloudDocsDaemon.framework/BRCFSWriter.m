@implementation BRCFSWriter

+ (BOOL)_shouldForceApplyMetadataForItem:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "isDocument"))
  {
    objc_msgSend(v3, "asDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isShared"))
      v5 = objc_msgSend(v4, "isPausedFromSync");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_isPathMatchIdle:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  if (+[BRCServerChangesApplyUtil shouldForceApplyContentForItem:](BRCServerChangesApplyUtil, "shouldForceApplyContentForItem:", a3->var0))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[BRCFSWriter(Bouncing) _isPathMatchIdle:].cold.1();

    goto LABEL_10;
  }
  if (objc_msgSend(a3->var0, "isDocument"))
  {
    objc_msgSend(a3->var0, "asDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isResumingSync"))
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[BRCFSWriter(Bouncing) _isPathMatchIdle:].cold.2();
LABEL_9:

LABEL_10:
      return 1;
    }
    if (objc_msgSend(v4, "isPausedFromSync")
      && (objc_msgSend(v4, "localDiffs") & 0xFF007FF0047FFFLL) == 0)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[BRCFSWriter(Bouncing) _isPathMatchIdle:].cold.3();
      goto LABEL_9;
    }

  }
  if ((objc_msgSend(a3->var0, "isReserved") & 1) != 0
    || objc_msgSend(a3->var0, "isIdleOrRejected") && !objc_msgSend(a3->var0, "isLost"))
  {
    return 1;
  }
  return objc_msgSend(a3->var0, "isShareAcceptationFault");
}

- (id)_generateGentlePhysicalBounceNameForPathMatch:(id *)a3 dirfd:(int)a4 existingSourceLogicalName:(id)a5 lastBounceNo:(unint64_t *)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  const __CFString *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  int v59;
  void *v60;
  NSObject *v61;
  uint64_t v63;
  void *v64;
  unsigned int v65;
  unint64_t *v67;
  unint64_t v68;
  const __CFString *v69;
  void *v70;
  unint64_t v71;
  uint8_t buf[4];
  _BYTE v73[20];
  _QWORD v74[5];

  v7 = *(_QWORD *)&a4;
  v74[3] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a3->var0;
  v71 = 0;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "bounceFileMaxRetries");
  objc_msgSend(v11, "bounceFileReportInterval");
  v14 = v13;
  objc_msgSend(v10, "st");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logicalName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "br_stringByDeletingPathBounceNo:", &v71);
  v17 = objc_claimAutoreleasedReturnValue();

  v70 = (void *)v17;
  if (v17)
  {
    v18 = objc_msgSend(v10, "isDirectoryWithPackageName");
    v19 = CFSTR("folder");
    if (!v18)
      v19 = 0;
    v69 = v19;
    v20 = v71;
    if (!v71)
    {
      v20 = 1;
      v71 = 1;
    }
    v64 = v11;
    if (a6 && *a6 > v20)
      v71 = *a6;
    v21 = 0;
    v68 = v12;
    v22 = 1;
    v63 = 138412546;
    v67 = a6;
    v65 = v7;
    while (1)
    {
      v23 = ++v71;
      if (a6)
        *a6 = v23;
      if (v22 >= v68)
      {
        v26 = v10;
        v27 = v9;
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v63;
          *(_QWORD *)v73 = v70;
          *(_WORD *)&v73[8] = 2112;
          *(_QWORD *)&v73[10] = v28;
          _os_log_fault_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Tried to bounce the file [%@] too many times. Use UUID instead.%@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v70, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", v24, v69, 0);
        v31 = objc_claimAutoreleasedReturnValue();

        -[BRCFSWriter session](self, "session");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "clientState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("lastReportedBounceEventTS"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33
          || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v34, "timeIntervalSinceDate:", v33),
              v36 = v35,
              v34,
              v36 > v14))
        {
          v37 = +[AppTelemetryTimeSeriesEvent newFileBouncedManyTimes](AppTelemetryTimeSeriesEvent, "newFileBouncedManyTimes", v63);
          -[BRCFSWriter session](self, "session");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "analyticsReporter");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v37);

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v40, CFSTR("lastReportedBounceEventTS"));

        }
        v21 = (void *)v31;
        v9 = v27;
        v10 = v26;
        v7 = v65;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v24, v69, 0);
        v25 = v21;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (objc_msgSend(v9, "isEqualToString:", v21))
        break;
      objc_msgSend(v10, "parentClientZone");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "st");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "parentID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v41, "existsByParentID:andCaseInsensitiveLogicalName:", v43, v21);

      if (!v44)
      {
        if ((v7 & 0x80000000) != 0)
        {
          brc_bread_crumbs();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v73 = v21;
            *(_WORD *)&v73[8] = 2112;
            *(_QWORD *)&v73[10] = v70;
            *(_WORD *)&v73[18] = 2112;
            v74[0] = v55;
            _os_log_debug_impl(&dword_1CBD43000, v56, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated bounce name: %@ for %@%@", buf, 0x20u);
          }
          goto LABEL_39;
        }
        if ((objc_msgSend(v10, "isFault") & 1) != 0)
        {
          objc_msgSend(v21, "br_sideFaultName");
          v45 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v45 = v21;
        }
        v46 = objc_retainAutorelease(v45);
        v47 = (const char *)objc_msgSend(v46, "fileSystemRepresentation");
        v53 = BRCOpenAt(v7, v47, 32772, v48, v49, v50, v51, v52, v63);
        v54 = v53;
        if (v53 < 0)
        {
          if (*__error() == 2)
          {
            brc_bread_crumbs();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)v73 = v21;
              *(_WORD *)&v73[8] = 2112;
              *(_QWORD *)&v73[10] = v70;
              *(_WORD *)&v73[18] = 1024;
              LODWORD(v74[0]) = v7;
              WORD2(v74[0]) = 2112;
              *(_QWORD *)((char *)v74 + 6) = v57;
              _os_log_debug_impl(&dword_1CBD43000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated bounce name: %@ for %@ in %d%@", buf, 0x26u);
            }

            goto LABEL_47;
          }
        }
        else
        {
          close(v53);
        }

        if (*__error() != 17 && *__error() != 21 && *__error() != 20 && v54 < 0)
        {
          v59 = *__error();
          brc_bread_crumbs();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v73 = v7;
            *(_WORD *)&v73[4] = 2112;
            *(_QWORD *)&v73[6] = v21;
            *(_WORD *)&v73[14] = 1024;
            *(_DWORD *)&v73[16] = v59;
            LOWORD(v74[0]) = 2112;
            *(_QWORD *)((char *)v74 + 2) = v60;
            _os_log_error_impl(&dword_1CBD43000, v61, (os_log_type_t)0x90u, "[ERROR] openat(%d, %@) %{errno}d%@", buf, 0x22u);
          }

          v46 = 0;
          *__error() = v59;
LABEL_47:
          v11 = v64;
          goto LABEL_48;
        }
      }
      ++v22;
      a6 = v67;
    }
    brc_bread_crumbs();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter(Bouncing) _generateGentlePhysicalBounceNameForPathMatch:dirfd:existingSourceLogicalName:lastBounceNo:].cold.1();
LABEL_39:

    v11 = v64;
    if (!objc_msgSend(v10, "isFault"))
      goto LABEL_49;
    objc_msgSend(v21, "br_sideFaultName");
    v46 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

    v21 = v46;
  }
  else
  {
    v21 = 0;
  }
LABEL_49:

  return v21;
}

- (BOOL)bouncePathMatchesForLookup:(id)a3 toApplyServerItem:(id)a4 clientZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  if (!v8)
  {
    v19 = 0;
    LOBYTE(v11) = 1;
    v17 = 0uLL;
    v18 = 0uLL;
LABEL_13:
    v15 = v11;
    goto LABEL_14;
  }
  objc_msgSend(v8, "faultedMatch");
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v8, "byPathMatch");
  if (*(_QWORD *)&v20[0])
    v11 = -[BRCFSWriter bouncePathMatch:toApplyServerItem:clientZone:](self, "bouncePathMatch:toApplyServerItem:clientZone:", v20, v9, v10);
  else
    v11 = 1;
  if (!(_QWORD)v17)
    goto LABEL_13;
  v12 = objc_msgSend(*(id *)&v20[0], "dbRowID");
  v13 = objc_msgSend((id)v17, "dbRowID");
  v14 = v12 == v13;
  v15 = v12 == v13 && v11;
  if (!v14 && v11)
    v15 = -[BRCFSWriter bouncePathMatch:toApplyServerItem:clientZone:](self, "bouncePathMatch:toApplyServerItem:clientZone:", &v17, v9, v10);
LABEL_14:
  __destructor_8_s0_s8_s16_s24((id *)&v17);
  __destructor_8_s0_s8_s16_s24((id *)v20);

  return v15;
}

- (BOOL)bouncePathMatch:(id *)a3 toApplyServerItem:(id)a4 clientZone:(id)a5
{
  void *v5;
  void *v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  BRCFSWriter *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  char v38;
  void *v39;
  NSObject *v40;
  void *v41;
  char v42;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  BRCFSWriter *v48;
  id v49;
  const $9EE3FC84C9B3A82DF6438513DA0F9593 *v50;
  int v51;

  v10 = a4;
  v11 = a5;
  v12 = a3->var2;
  v13 = a3->var0;
  v14 = v13;
  v51 = 0;
  if (!v13)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.4();

    if (objc_msgSend(v12, "type") == 6 || objc_msgSend(v12, "type") == 4)
    {
      objc_msgSend(v11, "itemByFileID:", objc_msgSend(v12, "parentFileID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        if ((objc_msgSend(v19, "isLost") & 1) == 0)
        {
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.2();

          objc_msgSend(v20, "markLostClearGenerationID:backoffMode:", 1, 1);
          objc_msgSend(v20, "saveToDB");
        }
      }
      else
      {
        brc_bread_crumbs();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.1();

        objc_msgSend(v12, "appLibrary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "fsEventsMonitor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "resetWithReason:", CFSTR("no parent while bouncing path"));
      }
      goto LABEL_45;
    }
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.3();

    -[BRCFSWriter session](self, "session");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fsReader");
    v37 = objc_claimAutoreleasedReturnValue();
    -[NSObject fseventAtPath:flags:](v37, "fseventAtPath:flags:", v12, 0);
    goto LABEL_44;
  }
  v15 = objc_msgSend(v13, "needsSyncUp");
  if (!v15)
  {
    if ((objc_msgSend(v14, "isDocument") & 1) != 0)
      goto LABEL_17;
LABEL_32:
    v28 = 0;
    goto LABEL_33;
  }
  objc_msgSend(v11, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncUpScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "jobStateFor:", v14) == 52)
  {
    v44 = v10;
    v45 = v12;
    v16 = v11;

LABEL_21:
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.7();

    v28 = 1;
    goto LABEL_24;
  }
  if ((objc_msgSend(v14, "isDocument") & 1) == 0)
  {

    goto LABEL_32;
  }
LABEL_17:
  v23 = v11;
  v24 = self;
  v44 = v10;
  v45 = v12;
  v16 = v23;
  objc_msgSend(v14, "asDocument");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "uploadError");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "br_isCloudDocsErrorCode:", 43);

  if (v15)
  {

    self = v24;
    if ((v27 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
    self = v24;
    if (v27)
      goto LABEL_21;
  }
  v28 = 0;
LABEL_24:
  v11 = v16;
  v10 = v44;
  v12 = v45;
LABEL_33:
  v38 = objc_msgSend(v14, "isKnownByServer");
  if ((v28 & 1) == 0 && v10 && (v38 & 1) == 0)
  {
    brc_bread_crumbs();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.6(v10, (uint64_t)v39, v40);

    -[BRCFSWriter session](self, "session");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "applyScheduler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setState:forServerItem:localItem:", 22, v10, 0);

    goto LABEL_45;
  }
  if (((v28 | objc_msgSend(v14, "isFault") ^ 1) & 1) == 0
    && !+[BRCFSWriter _isPathMatchIdle:](BRCFSWriter, "_isPathMatchIdle:", a3))
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.5();
LABEL_44:

LABEL_45:
    v42 = 0;
    goto LABEL_46;
  }
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke;
  v46[3] = &unk_1E8767B30;
  v47 = v14;
  v48 = self;
  v50 = a3;
  v49 = v12;
  v42 = objc_msgSend(v49, "performOnOpenParentFileDescriptor:error:", v46, &v51);

  v20 = v47;
LABEL_46:

  return v42;
}

uint64_t __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke(id *a1, uint64_t a2)
{
  id *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  char v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  int v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  int v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  id v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id *v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  int v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v3 = a1;
  v85 = *MEMORY[0x1E0C80C00];
  v4 = a1 + 4;
  objc_msgSend(a1[4], "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = 0;
  objc_msgSend(v4[1], "_generateGentlePhysicalBounceNameForPathMatch:dirfd:existingSourceLogicalName:lastBounceNo:", v4[3], a2, 0, &v78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v4, "beginBounceAndSaveToDBWithBounceNumber:", v78);
  objc_msgSend(*v4, "st");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logicalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || objc_msgSend(v6, "isEqualToString:", v9))
  {
    brc_bread_crumbs();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
      __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_6();

  }
  if (objc_msgSend(*v4, "isFault"))
  {
    objc_msgSend(*v4, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stagedFileID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      brc_bread_crumbs();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
        __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_5();

    }
    objc_msgSend(v3[5], "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stageRegistry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v3[6];
    v77 = 0;
    v15 = objc_msgSend(v13, "moveOldVersionFromPath:error:", v14, &v77);
    v16 = v77;
    v17 = v16;
    if ((v15 & 1) != 0)
    {
      v70 = v16;
      v71 = v6;
      v73 = v7;
      v74 = v3;
      v72 = v9;
      objc_msgSend(*v4, "st");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "documentID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntValue");
      objc_msgSend(*v4, "st");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fileID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v13;
      v24 = objc_msgSend(v22, "longLongValue");
      objc_msgSend(*v4, "st");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stagedFileID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = objc_msgSend(v23, "transferDocumentID:fromOldVersionStage:toStage:", v20, v24, objc_msgSend(v26, "longLongValue"));

      if ((v24 & 1) == 0)
      {
        v13 = v23;
        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        v33 = v70;
        v6 = v71;
        v7 = v73;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_3();

        v3 = v74;
        objc_msgSend(v74[4], "markNeedsDeleteForRescheduleOfItem:", *((_QWORD *)v74[7] + 1));
        objc_msgSend(v74[4], "saveToDB");
        goto LABEL_19;
      }
      objc_msgSend(v74[4], "st");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stagedFileID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "longLongValue");
      v30 = v74[6];
      v76 = v70;
      v7 = v73;
      v31 = objc_msgSend(v23, "moveFromStage:toPath:fileName:error:", v29, v30, v73, &v76);
      v32 = v76;

      v13 = v23;
      if ((v31 & 1) != 0)
      {
        v33 = v32;
        v6 = v71;
        v3 = v74;
LABEL_19:
        v9 = v72;
        if (objc_msgSend(*v4, "isShared") && (objc_msgSend(*v4, "sharingOptions") & 4) != 0)
        {
          objc_msgSend(v3[6], "physicalURL");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "URLByDeletingLastPathComponent");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "URLByAppendingPathComponent:", v7);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3[4], "clientZone");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "isPrivateZone");

          if ((v48 & 1) != 0)
          {
            v49 = 0;
          }
          else
          {
            objc_msgSend(*v4, "ownerKey");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v4, "db");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            +[BRCAccountSession userIdentityForKey:db:](BRCAccountSession, "userIdentityForKey:db:", v52, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            v6 = v71;
            objc_msgSend(v54, "nameComponentsAcceptUnknownUser:", 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "br_formattedName");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(*v4, "collaborationIdentifierIfComputable");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = BRCSetAllShareAttributesAtURL(v46);

          if ((v57 & 1) == 0)
          {
            v58 = *__error();
            brc_bread_crumbs();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, (os_log_type_t)0x90u))
            {
              objc_msgSend(v46, "path");
              v75 = v59;
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v80 = v65;
              v81 = 1024;
              v82 = v58;
              v83 = 2112;
              v84 = v75;
              _os_log_error_impl(&dword_1CBD43000, v60, (os_log_type_t)0x90u, "[ERROR] could not set share attributes for share at path: %@ %{errno}d%@", buf, 0x1Cu);

              v59 = v75;
            }

            *__error() = v58;
          }

          v9 = v72;
          v7 = v73;
        }

        goto LABEL_36;
      }
      brc_bread_crumbs();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_2();

      v6 = v71;
      if (objc_msgSend(v32, "br_isPOSIXErrorCode:", 17))
        objc_msgSend(*v4, "scanParentDirectory");
      objc_msgSend(v74[4], "markNeedsDeleteForRescheduleOfItem:", *((_QWORD *)v74[7] + 1));
      v17 = v32;
      v9 = v72;
    }
    else
    {
      brc_bread_crumbs();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, (os_log_type_t)0x90u))
        __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_4();

      objc_msgSend(*v4, "markBounceFailed");
    }
    objc_msgSend(*v4, "saveToDB");

    v36 = 0xFFFFFFFFLL;
    goto LABEL_39;
  }
  objc_msgSend(v3[6], "filename");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = BRCRenameAt(a2, v34, a2, v7, 0);

  if ((v35 & 0x80000000) == 0)
  {
LABEL_36:
    +[BRCFileCoordinator itemAtPath:origLogicalName:didBounceToNewLogicalName:](BRCFileCoordinator, "itemAtPath:origLogicalName:didBounceToNewLogicalName:", v3[6], v6, v9);
    brc_bread_crumbs();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_1();

    objc_msgSend(*v4, "markBounceFinished");
    objc_msgSend(*v4, "saveToDB");
    v36 = 0;
    goto LABEL_39;
  }
  v36 = *__error();
  v37 = *__error();
  brc_bread_crumbs();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
  {
    v64 = *v4;
    *(_DWORD *)buf = 138412802;
    v80 = v64;
    v81 = 1024;
    v82 = v37;
    v83 = 2112;
    v84 = v38;
    _os_log_error_impl(&dword_1CBD43000, v39, (os_log_type_t)0x90u, "[ERROR] Failed rename for bouncing %@ %{errno}d%@", buf, 0x1Cu);
  }

  *__error() = v37;
  objc_msgSend(*v4, "markBounceFailed");
  objc_msgSend(*v4, "saveToDB");
LABEL_39:

  return v36;
}

- (id)bouncePath:(id)a3 forItemConflictingWithAnFSRoot:(id)a4
{
  id v6;
  id v7;
  BRCRelativePath *v8;
  uint64_t v9;
  void *v10;
  BRCRelativePath *v11;
  id v12;
  id v13;
  BRCRelativePath *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  BRCFSWriter *v22;
  BRCRelativePath *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  int v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__55;
  v29 = __Block_byref_object_dispose__55;
  v30 = 0;
  v8 = [BRCRelativePath alloc];
  v9 = objc_msgSend(v6, "parentFileID");
  objc_msgSend(v6, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BRCRelativePath initWithFileID:session:](v8, "initWithFileID:session:", v9, v10);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke;
  v19[3] = &unk_1E8767B58;
  v24 = &v25;
  v12 = v7;
  v20 = v12;
  v13 = v6;
  v21 = v13;
  v22 = self;
  v14 = v11;
  v23 = v14;
  if (!-[BRCRelativePath performOnOpenFileDescriptor:error:](v14, "performOnOpenFileDescriptor:error:", v19, &v31))
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v13;
      v34 = 1024;
      v35 = v31;
      v36 = 2112;
      v37 = v15;
      _os_log_error_impl(&dword_1CBD43000, v16, (os_log_type_t)0x90u, "[ERROR] can't bounce %@ %{errno}d%@", buf, 0x1Cu);
    }

  }
  v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

uint64_t __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke(uint64_t a1, uint64_t a2, __n128 a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id *v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  __n128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v4 = 0;
  v38 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
LABEL_2:
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "st", *(_OWORD *)&v27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logicalName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCFileCoordinator itemAtPath:origLogicalName:didBounceToNewLogicalName:](BRCFileCoordinator, "itemAtPath:origLogicalName:didBounceToNewLogicalName:", v5, v7, v4);

    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke_cold_2();

    v10 = 0;
  }
  else
  {
    v4 = 0;
    v13 = (id *)(a1 + 40);
    v14 = 1002;
    a3.n128_u64[0] = 138412802;
    v27 = a3;
    while (1)
    {
      v30 = 0;
      v28 = 0u;
      v29 = 0u;
      v28 = (unint64_t)*(id *)(a1 + 32);
      v29 = (unint64_t)*(id *)(a1 + 40);
      v30 = 0;
      objc_msgSend(*(id *)(a1 + 48), "_generateGentlePhysicalBounceNameForPathMatch:dirfd:existingSourceLogicalName:lastBounceNo:", &v28, a2, 0, &v31);
      v15 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v15;
      if (!--v14)
        break;
      objc_msgSend(*v13, "filename");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = BRCRenameAt(a2, v16, a2, v4, 0);

      if (v17 < 0)
      {
        v21 = *__error();
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        {
          v24 = *v13;
          *(_DWORD *)buf = v27.n128_u32[0];
          v33 = v24;
          v34 = 1024;
          v35 = v21;
          v36 = 2112;
          v37 = v22;
          _os_log_error_impl(&dword_1CBD43000, v23, (os_log_type_t)0x90u, "[ERROR] Failed rename for bouncing %@ %{errno}d%@", buf, 0x1Cu);
        }

        *__error() = v21;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "pathWithChildAtPath:", v4);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

      }
      __destructor_8_s0_s8_s16_s24((id *)&v28);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        goto LABEL_2;
    }
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke_cold_1();

    __destructor_8_s0_s8_s16_s24((id *)&v28);
    v10 = 35;
  }

  return v10;
}

- (int)_computeURLMatchWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5 bounceNamespace:(unsigned __int8)a6 applyNamespace:(unsigned __int8)a7 urlMatch:(id *)a8
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  NSObject *v33;
  void *v35;
  int v36;
  id v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint8_t buf[32];
  uint64_t v43;
  uint64_t v44;

  v36 = a7;
  v8 = a6;
  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v38 = a5;
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  if ((_DWORD)v8 != 1)
  {
    if (v11)
    {
      objc_msgSend(v11, "byPathMatch");
      goto LABEL_7;
    }
LABEL_6:
    v43 = 0;
    memset(buf, 0, sizeof(buf));
    goto LABEL_7;
  }
  if (!v11)
    goto LABEL_6;
  objc_msgSend(v11, "faultedMatch");
LABEL_7:
  __move_assignment_8_8_s0_s8_s16_s24_t32w8((uint64_t)&v39, (uint64_t *)buf);
  if (!(_QWORD)v39)
    goto LABEL_29;
  objc_msgSend(v12, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v39, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToItemID:", v14) & 1) != 0)
  {
    objc_msgSend(v12, "clientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dbRowID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v39, "clientZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dbRowID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "br_isEqualToNumber:", v18);

    if ((v19 & 1) != 0)
      goto LABEL_29;
  }
  else
  {

  }
  if ((objc_msgSend(v11, "tryToDeleteItemInNamespace:", v8, self) & 1) != 0)
  {
LABEL_29:
    v20 = 0;
    goto LABEL_30;
  }
  if ((objc_msgSend((id)v40, "exists") & 1) != 0)
  {
    __copy_assignment_8_8_s0_s8_s16_s24_t32w8((uint64_t)a8, (uint64_t)&v39);
    v20 = 1;
    goto LABEL_30;
  }
  objc_msgSend(v11, "_moveMissingItemAsideInNamespace:", v8);
  if (objc_msgSend(v12, "isDocument"))
  {
    objc_msgSend(v12, "asDocument");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  if (v36 != 2)
    goto LABEL_28;
  v22 = objc_msgSend(v21, "isPackage") ^ 1;
  if ((_DWORD)v8)
    LOBYTE(v22) = 1;
  if ((v22 & 1) != 0
    || !objc_msgSend((id)v39, "isDirectory")
    || !objc_msgSend((id)v40, "exists"))
  {
LABEL_28:

    goto LABEL_29;
  }
  objc_msgSend(v38, "serverZone");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "clientZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v35, "bouncePathMatch:toApplyServerItem:clientZone:", &v39, v38, v24);

  if ((v25 & 1) != 0)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v40, "filename");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v39, "st");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "filename");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v26;
      _os_log_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEFAULT, "[NOTICE] Bounced transmogrifiable %@ to %@%@", buf, 0x20u);

    }
    goto LABEL_28;
  }
  brc_bread_crumbs();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v39;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v32;
    _os_log_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEFAULT, "[NOTICE] Failed to bounce transmogrifiable %@%@", buf, 0x16u);
  }

  v20 = -1;
LABEL_30:
  __destructor_8_s0_s8_s16_s24((id *)&v39);

  return v20;
}

- (BOOL)_shouldBounceSourceItemWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5 bounceNamespace:(unsigned __int8)a6 urlMatch:(id *)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  BOOL v15;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (objc_msgSend(v13, "isSharedToMeTopLevelItem"))
    v15 = -[BRCFSWriter _computeURLMatchWithLookup:localItem:serverItem:bounceNamespace:applyNamespace:urlMatch:](self, "_computeURLMatchWithLookup:localItem:serverItem:bounceNamespace:applyNamespace:urlMatch:", v12, v13, v14, v8, 0, a7) != 0;
  else
    v15 = 0;

  return v15;
}

- (unint64_t)computeSourceBounceNumberIfNecessaryWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  id v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0u;
  v27 = 0u;
  if (-[BRCFSWriter _shouldBounceSourceItemWithLookup:localItem:serverItem:bounceNamespace:urlMatch:](self, "_shouldBounceSourceItemWithLookup:localItem:serverItem:bounceNamespace:urlMatch:", v8, v9, v10, 1, &v26)|| -[BRCFSWriter _shouldBounceSourceItemWithLookup:localItem:serverItem:bounceNamespace:urlMatch:](self, "_shouldBounceSourceItemWithLookup:localItem:serverItem:bounceNamespace:urlMatch:", v8, v9, v10, 0, &v26))
  {
    objc_msgSend(v8, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v21 = 0;
    v12 = (id)objc_msgSend(v11, "br_stringByDeletingPathBounceNo:andPathExtension:", &v25, &v21);
    v13 = v21;
    if (!objc_msgSend(*((id *)&v27 + 1), "resolveMustExist:error:", 1, 0))
      goto LABEL_6;
    v14 = (void *)*((_QWORD *)&v27 + 1);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3254779904;
    v17[2] = __93__BRCFSWriter_Bouncing__computeSourceBounceNumberIfNecessaryWithLookup_localItem_serverItem___block_invoke;
    v17[3] = &unk_1E8767B80;
    v17[4] = self;
    __copy_constructor_8_8_s0_s8_s16_s24_t32w8(v20, (uint64_t)&v26);
    v18 = v9;
    v19 = &v22;
    LODWORD(v14) = objc_msgSend(v14, "performOnOpenFileDescriptor:error:", v17, 0);

    __destructor_8_s0_s8_s16_s24(v20);
    if ((_DWORD)v14)
      v15 = v23[3];
    else
LABEL_6:
      v15 = 0;

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v15 = 0;
  }
  __destructor_8_s0_s8_s16_s24((id *)&v26);

  return v15;
}

uint64_t __93__BRCFSWriter_Bouncing__computeSourceBounceNumberIfNecessaryWithLookup_localItem_serverItem___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a1 + 56;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logicalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "_generateGentlePhysicalBounceNameForPathMatch:dirfd:existingSourceLogicalName:lastBounceNo:", v4, a2, v7, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  return 0;
}

- (void)_stageCreationOfDirectory:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  unsigned int v12;

  v4 = a3;
  v12 = 0;
  v11 = 0;
  -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "makeDirectoryInStageGatherFileID:generationID:error:", &v11, &v12, &v10);
  v7 = v10;

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "markStagedWithFileID:generationID:", v11, v12);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      -[BRCFSWriter _stageCreationOfDirectory:].cold.1();

  }
}

- (void)_stageCreationOfSymlink:(id)a3 forLocalItem:(id)a4
{
  id v6;
  BRCAccountSession *session;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  unsigned int v17;

  v6 = a4;
  v17 = 0;
  v16 = 0;
  session = self->_session;
  v8 = a3;
  -[BRCAccountSession stageRegistry](session, "stageRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "symlinkTarget");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v11 = objc_msgSend(v9, "makeSymlinkWithTarget:inStageGatherFileID:generationID:error:", v10, &v16, &v17, &v15);
  v12 = v15;

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v6, "markStagedWithFileID:generationID:", v16, v17);
  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      -[BRCFSWriter _stageCreationOfSymlink:forLocalItem:].cold.1();

  }
}

- (BOOL)applyLocalEditIfNecessaryToURL:(id)a3 forItem:(id)a4 serverItem:(id)a5 forDelete:(BOOL)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  char *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  NSObject *v40;
  void *v41;
  char *v42;
  char *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  char *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  const char *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  char *v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  char *v68;
  __int16 v69;
  void *v70;
  _QWORD v71[2];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (a6)
    goto LABEL_6;
  if (!v13)
    v13 = v12;
  if ((objc_msgSend(v13, "sharingOptions") & 0x20) == 0
    && (objc_msgSend(v12, "currentVersion"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "uploadError"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "br_isCloudDocsErrorCode:", 43),
        v16,
        v15,
        v17))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "permanentStorageForItemAtURL:allocateIfNone:error:", v11, 0, a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v12, "currentVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "originalPOSIXName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "br_pathExtension");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "itemID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "itemIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("roedit_"), "stringByAppendingString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "length"))
      {
        objc_msgSend(v25, "stringByAppendingPathExtension:", v22);
        v26 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v26;
      }
      v27 = (id)*MEMORY[0x1E0D25D00];
      objc_msgSend(v19, "additionWithName:inNameSpace:error:", v25, v27, a7);
      v61 = v27;
      v62 = (char *)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        v57 = v25;
        brc_bread_crumbs();
        v28 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v64 = v62;
          v65 = 2112;
          v66 = v28;
          _os_log_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Found readonly edit we need to make live: %@%@", buf, 0x16u);
        }

        objc_msgSend(v12, "st");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logicalName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "br_pathExtension");
        v32 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "UUIDString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = (void *)v32;
        if (v32)
        {
          objc_msgSend(v34, "stringByAppendingPathExtension:", v32);
          v35 = objc_claimAutoreleasedReturnValue();

          v34 = (void *)v35;
        }
        v58 = v22;
        v36 = *MEMORY[0x1E0D25CD8];
        v71[0] = *MEMORY[0x1E0D25CD0];
        v71[1] = v36;
        v72[0] = v34;
        v72[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v19, "replaceDocumentWithContentsOfAddition:preservingCurrentVersionWithCreationInfo:createdAddition:error:", v62);
        v59 = 0;
        v60 = 0;
        if (v38)
        {
          brc_bread_crumbs();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            -[BRCFSWriter applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:].cold.1();

          objc_msgSend(v62, "userInfo");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("etag"));
          v42 = (char *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            brc_bread_crumbs();
            v43 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v64 = v42;
              v65 = 2112;
              v66 = (const char *)v12;
              v67 = 2112;
              v68 = v43;
              _os_log_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Overriding etag to original value %@ for %@%@", buf, 0x20u);
            }

            objc_msgSend(v12, "currentVersion");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "ckInfo");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setEtag:", v42);

          }
          objc_msgSend(v12, "markNeedsReading");
          objc_msgSend(v12, "saveToDB");
        }
        else
        {
          brc_bread_crumbs();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, (os_log_type_t)0x90u))
            -[BRCFSWriter applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:].cold.2();

          v42 = (char *)v60;
          if (v42)
          {
            brc_bread_crumbs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
            {
              v54 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v64 = "-[BRCFSWriter applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:]";
              v65 = 2080;
              if (!a7)
                v54 = "(ignored by caller)";
              v66 = v54;
              v67 = 2112;
              v68 = v42;
              v69 = 2112;
              v70 = v55;
              _os_log_error_impl(&dword_1CBD43000, v52, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a7)
          {
            v42 = objc_retainAutorelease(v42);
            *a7 = v42;
          }
        }
        v22 = v58;

        v25 = v57;
      }
      else
      {
        brc_bread_crumbs();
        v47 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v64 = (const char *)v12;
          v65 = 2112;
          v66 = v47;
          _os_log_impl(&dword_1CBD43000, v48, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find addition for %@, clearing upload error%@", buf, 0x16u);
        }

        objc_msgSend(v12, "currentVersion");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setUploadError:", 0);

        objc_msgSend(v12, "saveToDB");
        LOBYTE(v38) = 0;
      }

    }
    else
    {
      LOBYTE(v38) = 0;
    }

  }
  else
  {
    LOBYTE(v38) = 0;
  }

  return v38;
}

- (void)_applyChangesForServerAlias:(id)a3 localAlias:(id)a4 jobID:(int64_t)a5 zone:(id)a6 diffs:(unint64_t)a7
{
  char v7;
  id v11;
  id v12;
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
  NSObject *v24;
  BRCRelativePath *v25;
  BRCRelativePath *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  BRCRelativePath *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  int v50;
  const char *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  BRCBookmark *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  NSObject *v81;
  BRCBookmark *v82;
  void *v83;
  void *v84;
  BOOL v85;
  id v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  NSObject *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  BRCRelativePath *v107;
  void *v108;
  id v110;
  _QWORD v111[4];
  BRCRelativePath *v112;
  id v113;
  id v114;
  _QWORD v115[4];
  BRCRelativePath *v116;
  BRCRelativePath *v117;
  _BYTE *v118;
  int v119;
  _BYTE buf[32];
  _BYTE v121[20];
  uint64_t v122;

  v7 = a7;
  v122 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v110 = a6;
  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = 2;
  if (objc_msgSend(v11, "isLive"))
  {
    objc_msgSend(v11, "aliasTargetClientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serverZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isSharedZone"))
    {
      objc_msgSend(v15, "clientZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "aliasTargetItemID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serverItemByItemID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v15, "clientZone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "aliasTargetItemID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "itemByItemID:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setState:forServerItem:localItem:", 1, v18, v21);
      }
      objc_msgSend(v110, "dbRowID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setState:forRank:zoneRowID:", 0, a5, v22);

LABEL_11:
      v25 = 0;
      goto LABEL_12;
    }

  }
  if (objc_msgSend(v12, "isLost"))
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] Retry later, the alias is lost%@", buf, 0xCu);
    }

    goto LABEL_11;
  }
  if (!objc_msgSend(v12, "isLive"))
  {
    v25 = 0;
    if (!objc_msgSend(v11, "isLive"))
      goto LABEL_12;
    goto LABEL_23;
  }
  v26 = [BRCRelativePath alloc];
  objc_msgSend(v12, "st");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "fileID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "unsignedLongLongValue");
  objc_msgSend(v12, "session");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[BRCRelativePath initWithFileID:session:](v26, "initWithFileID:session:", v29, v30);

  if (-[BRCRelativePath resolveMustExist:error:](v25, "resolveMustExist:error:", 1, &v119))
  {
    v31 = -[BRCRelativePath parentFileID](v25, "parentFileID");
    objc_msgSend(v12, "parentFileID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v31 == objc_msgSend(v32, "unsignedLongLongValue");

    if (v33)
    {
      if ((objc_msgSend(v11, "isLive") & 1) == 0)
      {
        if (v25)
        {
          v111[0] = MEMORY[0x1E0C809B0];
          v111[1] = 3221225472;
          v111[2] = __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke_103;
          v111[3] = &unk_1E875EF40;
          v25 = v25;
          v112 = v25;
          if (-[BRCRelativePath performOnOpenParentFileDescriptor:error:](v25, "performOnOpenParentFileDescriptor:error:", v111, &v119))
          {

            brc_bread_crumbs();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.7();

            objc_msgSend(v12, "markDead");
            objc_msgSend(v12, "saveToDBForServerEdit:keepAliases:", 1, 0);
            objc_msgSend(v110, "dbRowID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setState:forRank:zoneRowID:", 0, a5, v36);

          }
          else
          {
            brc_bread_crumbs();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
              -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.8();

          }
        }
        goto LABEL_12;
      }
LABEL_23:
      if (v12 && (v7 & 0x62) == 0)
      {
        if ((v7 & 1) != 0)
        {
          brc_bread_crumbs();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.2();

          objc_msgSend(v12, "updateStructuralCKInfoFromServerItem:", v11);
          objc_msgSend(v12, "saveToDBForServerEdit:keepAliases:", 1, 0);
        }
        brc_bread_crumbs();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.1();

        objc_msgSend(v110, "dbRowID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setState:forRank:zoneRowID:", 0, a5, v41);

        goto LABEL_12;
      }
      objc_msgSend(v11, "parentLocalItemOnFS");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v108)
      {
        brc_bread_crumbs();
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v99 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
          -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.6();

      }
      v44 = [BRCRelativePath alloc];
      objc_msgSend(v108, "fileID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = -[BRCRelativePath initWithFileID:session:](v44, "initWithFileID:session:", objc_msgSend(v45, "unsignedLongLongValue"), self->_session);

      if (!-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v107, "resolveAndKeepOpenMustExist:error:", 1, &v119))
      {
        brc_bread_crumbs();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v119;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = v54;
          _os_log_debug_impl(&dword_1CBD43000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to relocate parent of %@: %{errno}d%@", buf, 0x1Cu);
        }

        goto LABEL_73;
      }
      if (objc_msgSend(v12, "isLive"))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy__55;
        *(_QWORD *)v121 = __Block_byref_object_dispose__55;
        *(_QWORD *)&v121[8] = 0;
        v115[0] = MEMORY[0x1E0C809B0];
        v115[1] = 3221225472;
        v115[2] = __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke;
        v115[3] = &unk_1E8767C60;
        v116 = v107;
        v117 = v25;
        v118 = buf;
        if (-[BRCRelativePath performOnOpenParentFileDescriptor:error:](v117, "performOnOpenParentFileDescriptor:error:", v115, &v119))
        {
          v46 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          objc_msgSend(v11, "st");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "logicalName");
          v48 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "filename");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "markRenamedUsingServerItem:toRelpath:logicalName:filename:origLogicalNameBeforeBounce:forContentApplyOnly:", v11, v46, v48, v49, 0, 0);

          v50 = 0;
          v51 = "updated";
        }
        else
        {
          brc_bread_crumbs();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.3();
          v51 = 0;
          v50 = 20;
        }

        _Block_object_dispose(buf, 8);
        if (v50)
          goto LABEL_72;
        v69 = v12;
        goto LABEL_68;
      }
      +[BRCBookmark createName](BRCBookmark, "createName");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v11, "newLocalItemWithServerZone:dbRowID:", v110, objc_msgSend(v12, "dbRowID"));
      objc_msgSend(v56, "asBRAlias");
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "st");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "_aliasTargetMangledID");
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      -[BRCAccountSession clientZoneByMangledID:](self->_session, "clientZoneByMangledID:", v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v105 && objc_msgSend(v104, "isShared"))
      {
        brc_bread_crumbs();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.5();

        -[BRCAccountSession containerScheduler](self->_session, "containerScheduler");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "scheduleSyncDownForSharedDatabaseImmediately:", 0);

      }
      objc_msgSend(v11, "st");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "_aliasTargetItemID");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v105, "itemByItemID:", v103);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "asDocument");
      v106 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v106, "asShareableItem");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63 && (objc_msgSend(v106, "isDead") & 1) == 0)
      {
        v76 = objc_msgSend(v106, "isReserved");

        if ((v76 & 1) == 0)
        {
          objc_msgSend(v106, "appLibrary");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "appLibrary");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v77, "isEqualToAppLibrary:", v78))
          {
            v79 = objc_msgSend(v102, "isSharedToMe");

            if ((v79 & 1) == 0)
            {
              brc_bread_crumbs();
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v81 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138413058;
                *(_QWORD *)&buf[4] = v106;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v102;
                *(_WORD *)&buf[22] = 2048;
                *(_QWORD *)&buf[24] = a5;
                *(_WORD *)v121 = 2112;
                *(_QWORD *)&v121[2] = v80;
                _os_log_debug_impl(&dword_1CBD43000, v81, OS_LOG_TYPE_DEBUG, "[DEBUG] Target %@ is in the same app library as %@ postponing rank: %lld%@", buf, 0x2Au);
              }

              -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
              v66 = (BRCBookmark *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "dbRowID");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[BRCBookmark setState:forRank:zoneRowID:](v66, "setState:forRank:zoneRowID:", 19, a5, v67);
              goto LABEL_57;
            }
          }
          else
          {

          }
          objc_msgSend(v102, "learnTarget:", v106);
          v82 = [BRCBookmark alloc];
          objc_msgSend(v102, "appLibrary");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "session");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = -[BRCBookmark initWithTarget:owningAppLibrary:path:session:](v82, "initWithTarget:owningAppLibrary:path:session:", v106, v83, 0, v84);

          v114 = 0;
          v85 = -[BRCBookmark resolveWithError:](v66, "resolveWithError:", &v114);
          v86 = v114;
          v67 = v86;
          if (v85)
          {
            v113 = v86;
            -[BRCBookmark writeUnderParent:name:error:](v66, "writeUnderParent:name:error:", v107, v101, &v113);
            v87 = objc_claimAutoreleasedReturnValue();
            v100 = v113;

            if (v87)
            {
              objc_msgSend(v102, "updateFromFSAtPath:", v87);
              objc_msgSend(v106, "session");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "fsUploader");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "addAliasItem:toUploadingItem:", v102, v106);

              v68 = 0;
              v51 = "created";
              v67 = (void *)v87;
            }
            else
            {
              brc_bread_crumbs();
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v97 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.4();

              v51 = 0;
              v68 = 20;
              v67 = v100;
            }
            goto LABEL_58;
          }
          brc_bread_crumbs();
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v67;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v106;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v90;
            _os_log_debug_impl(&dword_1CBD43000, v91, OS_LOG_TYPE_DEBUG, "[DEBUG] Grabbing the bookmark data fails with: %@\nMarking the target lost: %@%@", buf, 0x20u);
          }

          objc_msgSend(v106, "markLostClearGenerationID:backoffMode:", 0, 1);
LABEL_57:
          v51 = 0;
          v68 = 20;
LABEL_58:

          if (v68 == 20)
          {
            v12 = v102;
LABEL_72:
            -[BRCRelativePath close](v107, "close", v100);
LABEL_73:

            goto LABEL_12;
          }
          v69 = v102;
LABEL_68:
          v72 = v69;
          objc_msgSend(v69, "updateStructuralCKInfoFromServerItem:", v11, v100);
          objc_msgSend(v72, "saveToDBForServerEdit:keepAliases:", 1, 0);
          brc_bread_crumbs();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v51;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v72;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v73;
            _os_log_debug_impl(&dword_1CBD43000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %s successfully: %@%@", buf, 0x20u);
          }

          objc_msgSend(v110, "dbRowID");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setState:forRank:zoneRowID:", 0, a5, v75);

          v12 = v72;
          goto LABEL_72;
        }
      }
      else
      {

      }
      brc_bread_crumbs();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v102, "targetItemID");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        if (v105)
          v93 = "";
        else
          v93 = "unknown ";
        v94 = (uint64_t)v105;
        if (!v105)
        {
          objc_msgSend(v11, "st");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "_aliasTargetMangledID");
          v94 = objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v92;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v93;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v94;
        *(_WORD *)v121 = 2048;
        *(_QWORD *)&v121[2] = a5;
        *(_WORD *)&v121[10] = 2112;
        *(_QWORD *)&v121[12] = v64;
        v95 = (void *)v94;
        _os_log_debug_impl(&dword_1CBD43000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] Target %@ doesn't exist in %scontainer %@, postponing rank: %lld%@", buf, 0x34u);
        if (!v105)
        {

        }
      }

      -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
      v66 = (BRCBookmark *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "dbRowID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCBookmark setState:forRank:zoneRowID:](v66, "setState:forRank:zoneRowID:", 24, a5, v67);
      goto LABEL_57;
    }
    brc_bread_crumbs();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.9();

    if ((objc_msgSend(v12, "isLost") & 1) == 0)
    {
      objc_msgSend(v12, "markLostClearGenerationID:backoffMode:", 0, 1);
      objc_msgSend(v12, "saveToDB");
    }
  }
  else
  {
    brc_bread_crumbs();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v119;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v42;
      _os_log_debug_impl(&dword_1CBD43000, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to relocate %@: %{errno}d%@", buf, 0x1Cu);
    }

    objc_msgSend(v12, "markLostClearGenerationID:backoffMode:", 0, 0);
    objc_msgSend(v12, "saveToDB");
  }
LABEL_12:

}

uint64_t __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  unsigned int v13;

  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke_2;
  v8[3] = &unk_1E8767C38;
  v12 = a2;
  v3 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = v4;
  v11 = v5;
  objc_msgSend(v3, "performOnOpenFileDescriptor:error:", v8, &v13);
  v6 = v13;

  return v6;
}

uint64_t __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke_2(uint64_t a1, int a2)
{
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BRCRenameAt(v4, v5, a2, v6, 0);

  if (v7 < 0)
    return *__error();
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "pathRelativeToRoot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "pathRelativeToRoot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v16;
    v20 = 2112;
    v21 = v17;
    v22 = 2112;
    v23 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Reparented alias from %@ to %@%@", (uint8_t *)&v18, 0x20u);

  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathWithChildAtPath:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v18 = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "resolveMustExist:error:", 1, &v18))return 0;
  else
    return v18;
}

uint64_t __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke_103(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BRCUnlinkAt(a2, v3, 0);

  result = 0;
  if (v4 < 0)
    return *__error();
  return result;
}

- (unsigned)_computeDesiredVersionOptionsForDocument:(id)a3 createdReservedItem:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v12;
  NSObject *v13;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "asDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "desiredVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isReserved"))
  {
    if (v4)
    {
      if (objc_msgSend(v6, "shouldBeGreedy"))
        v8 = 3;
      else
        v8 = 1;
    }
    else
    {
      if (!v7)
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[BRCFSWriter _computeDesiredVersionOptionsForDocument:createdReservedItem:].cold.1();

      }
      v8 = objc_msgSend(v7, "options") | 1;
    }
  }
  else if (v7)
  {
    v8 = objc_msgSend(v7, "options");
  }
  else if (objc_msgSend(v6, "isFault"))
  {
    v8 = 1;
  }
  else
  {
    v8 = 2;
  }
  if (objc_msgSend(v6, "shouldAutomaticallyDownloadThumbnail"))
  {
    objc_msgSend(v5, "appLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldEvictUploadedItems");

    if (!v10)
      v8 |= 4u;
  }

  return v8 & 0xFFFFFFF7;
}

- (void)_scheduleActionCoordination:(id)a3 dstURL:(id)a4 action:(const char *)a5 li:(id)a6 si:(id)a7 diffs:(unint64_t)a8 hasFinished:(BOOL *)a9
{
  id v14;
  id v15;
  char *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  char *v28;
  void *v29;
  char *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  brc_task_tracker *taskTracker;
  void *v43;
  void *v44;
  NSObject *v45;
  char v46;
  brc_task_tracker *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const char *v54;
  void *v55;
  _QWORD v56[5];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  char *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = (char *)a6;
  v17 = a7;
  if (!v14)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter _scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:].cold.1();
    goto LABEL_11;
  }
  objc_msgSend(v15, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (v20)
  {

    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter _scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:].cold.2();

    v15 = 0;
  }
  objc_msgSend(v15, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "br_pathRelativeToPath:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "path");
      v28 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v58 = v16;
      v59 = 2112;
      v60 = v28;
      v61 = 2112;
      v62 = v29;
      v63 = 2112;
      v64 = v26;
      _os_log_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Retrying item because we are trying to rename it into itself: %@ '%@' vs '%@'%@", buf, 0x2Au);

    }
LABEL_11:

    goto LABEL_12;
  }
  if (v15 && objc_msgSend(v16, "isReserved"))
  {
    brc_bread_crumbs();
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v58 = v16;
      v59 = 2112;
      v60 = v30;
      _os_log_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Reserved item needs rename %@.  Re-staging to make live again%@", buf, 0x16u);
    }

    objc_msgSend(v16, "markNeedsDeleteForRescheduleOfItem:", v17);
    objc_msgSend(v16, "saveToDB");
  }
  else
  {
    v54 = a5;
    objc_msgSend(v16, "appLibrary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "defaultClientZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "defaultAppLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = v34;
    objc_msgSend(v34, "coordinatorForItem:forRead:", v16, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x1E0C809B0];
    *a9 = 0;
    v56[0] = v35;
    v56[1] = 3221225472;
    v56[2] = __81__BRCFSWriter__scheduleActionCoordination_dstURL_action_li_si_diffs_hasFinished___block_invoke;
    v56[3] = &unk_1E8767C88;
    v56[4] = self;
    v36 = (void *)MEMORY[0x1D17A6DB0](v56);
    if (v15)
    {
      brc_bread_crumbs();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v14, "path");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        BRCItemFieldsPrettyPrint();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316674;
        v58 = v54;
        v59 = 2112;
        v60 = v16;
        v61 = 2112;
        v62 = v17;
        v63 = 2112;
        v64 = v50;
        v65 = 2112;
        v66 = v49;
        v67 = 2112;
        v68 = v51;
        v69 = 2112;
        v70 = v37;
        _os_log_debug_impl(&dword_1CBD43000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] found item needing %s:\n  client item: %@\n  server item: %@\n  src path   : %@\n  dst path   : %@\n  diffs      : %@%@", buf, 0x48u);

      }
      objc_msgSend(v16, "st");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stagedFileID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCFSWriter serialQueue](self, "serialQueue");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      taskTracker = self->_taskTracker;
      v43 = v53;
      objc_msgSend(v53, "scheduleRenameOfItemAtURL:toItemAtURL:contentUpdate:queue:taskTracker:accessor:", v14, v15, v40 != 0, v41, taskTracker, v36);

    }
    else
    {
      brc_bread_crumbs();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v14, "path");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        BRCItemFieldsPrettyPrint();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316418;
        v58 = v54;
        v59 = 2112;
        v60 = v16;
        v61 = 2112;
        v62 = v17;
        v63 = 2112;
        v64 = v52;
        v65 = 2112;
        v66 = v48;
        v67 = 2112;
        v68 = v44;
        _os_log_debug_impl(&dword_1CBD43000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] found item needing %s:\n  client item: %@\n  server item: %@\n  path       : %@\n  diffs      : %@%@", buf, 0x3Eu);

      }
      v46 = objc_msgSend(v17, "isLive");
      -[BRCFSWriter serialQueue](self, "serialQueue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = self->_taskTracker;
      v43 = v53;
      if ((v46 & 1) != 0)
        objc_msgSend(v53, "scheduleUpdateOfItemAtURL:queue:taskTracker:accessor:", v14, v39, v47, v36);
      else
        objc_msgSend(v53, "scheduleDeleteOfItemAtURL:queue:taskTracker:accessor:", v14, v39, v47, v36);
    }

  }
LABEL_12:

}

uint64_t __81__BRCFSWriter__scheduleActionCoordination_dstURL_action_li_si_diffs_hasFinished___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUnderCoordinationFromURL:toURL:canDelete:", a2, a3, a4);
}

- (void)_handleClashingItemIfNecessary:(id)a3 parentID:(id)a4 si:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "st");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logicalName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reservedItemByParentID:andLogicalName:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter _handleClashingItemIfNecessary:parentID:si:].cold.3();

    v27 = 0u;
    v28 = 0u;
    v16 = v13;
    v25 = 0;
    v26 = v16;
    -[BRCFSWriter _generateGentlePhysicalBounceNameForPathMatch:dirfd:existingSourceLogicalName:lastBounceNo:](self, "_generateGentlePhysicalBounceNameForPathMatch:dirfd:existingSourceLogicalName:lastBounceNo:", &v26, 0xFFFFFFFFLL, 0, &v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BRCFSWriter _handleClashingItemIfNecessary:parentID:si:].cold.2();

    }
    objc_msgSend(v16, "bounceReservedItemWithBounceNumber:");
    objc_msgSend(v16, "st");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filename");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqualToString:", v19);

    if ((v20 & 1) == 0)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCFSWriter _handleClashingItemIfNecessary:parentID:si:].cold.1();

    }
    objc_msgSend(v16, "saveToDB");

    __destructor_8_s0_s8_s16_s24(&v26);
  }

}

- (void)applyChangesForServerItem:(id)a3 localItem:(id)a4 rank:(int64_t)a5 zone:(id)a6 activity:(id)a7 hasFinished:(BOOL *)a8
{
  id v13;
  int64_t v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  NSObject *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  BRCFSWriter *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  id v41;
  void *v42;
  char *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  BRCFSWriter *v53;
  NSObject *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  char *v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  char v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  int v75;
  char *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL4 v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  void *v90;
  _BOOL4 v91;
  const char *v92;
  uint64_t v93;
  int v94;
  void *v95;
  unsigned int v96;
  void *v97;
  unsigned int v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  const char *v104;
  void *v105;
  const __CFString *v106;
  const char *v107;
  const char *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  NSObject *v117;
  BRCFSWriter *v118;
  id v119;
  void *v120;
  NSObject *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  BOOL v126;
  NSObject *v127;
  void *v128;
  uint64_t v129;
  char v130;
  char *v131;
  const char *v132;
  id v133;
  void *v134;
  id v135;
  void *v137;
  _QWORD v138[4];
  id v139;
  char v140;
  uint64_t v141[3];
  uint64_t v142;
  uint8_t buf[4];
  BRCFSWriter *v144;
  __int16 v145;
  int64_t v146;
  __int16 v147;
  const char *v148;
  __int16 v149;
  id v150;
  __int16 v151;
  id v152;
  __int16 v153;
  void *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (int64_t)a4;
  v15 = a6;
  v135 = a7;
  objc_msgSend(v15, "clientZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = objc_msgSend((id)v14, "diffAgainstServerItem:", v13);
  memset(v141, 0, sizeof(v141));
  __brc_create_section(0, (uint64_t)"-[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:]", 2382, v141);
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v133 = v15;
    v36 = v16;
    v37 = self;
    v38 = v141[0];
    BRCItemFieldsPrettyPrint();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v40 = "existing";
    else
      v40 = "new";
    v41 = v39;
    *(_DWORD *)buf = 134219266;
    v144 = (BRCFSWriter *)v38;
    v145 = 2048;
    v146 = a5;
    v147 = 2080;
    v148 = v40;
    v149 = 2112;
    v150 = v13;
    v151 = 2112;
    v152 = v41;
    v153 = 2112;
    v154 = v17;
    _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%lld]: %s item: %@\n diffs: %@%@", buf, 0x3Eu);

    self = v37;
    v16 = v36;
    v15 = v133;

  }
  if (!((unint64_t)v13 | v14))
  {
    brc_bread_crumbs();
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v117 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_FAULT))
      -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:].cold.5();

  }
  if (!v16)
  {
    brc_bread_crumbs();
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v144 = (BRCFSWriter *)v13;
      v145 = 2112;
      v146 = v14;
      v147 = 2112;
      v148 = v19;
      _os_log_fault_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no client zone when applying %@ and %@%@", buf, 0x20u);
    }

  }
  *a8 = 1;
  v21 = +[BRCServerChangesApplyUtil deletingShareRoot:localItem:](BRCServerChangesApplyUtil, "deletingShareRoot:localItem:", v13, v14);
  LOBYTE(v122) = v21;
  if (+[BRCServerChangesApplyUtil checkEarlyExitsPriorToApplying:si:rank:scheduler:zone:session:isDeleteOfShareRoot:diffs:clientZone:](BRCServerChangesApplyUtil, "checkEarlyExitsPriorToApplying:si:rank:scheduler:zone:session:isDeleteOfShareRoot:diffs:clientZone:", v14, v13, a5, v137, v15, self->_session, v122, v142, v16))
  {
    goto LABEL_11;
  }
  if ((objc_msgSend((id)v14, "isBRAlias") & 1) != 0 || objc_msgSend(v13, "isBRAlias"))
  {
    objc_msgSend((id)v14, "asBRAlias");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:](self, "_applyChangesForServerAlias:localAlias:jobID:zone:diffs:", v13, v22, a5, v15, v142);

LABEL_11:
    v23 = 0;
    v24 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v13, "isLive"))
  {
    if (+[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:](BRCServerChangesApplyUtil, "handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:", v14, v21, a5, v137, v15, self->_session))
    {
      goto LABEL_11;
    }
    +[BRCItemToPathLookup lookupForItem:](BRCItemToPathLookup, "lookupForItem:", v14);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "coordinatedWriteURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "closePaths");

    v23 = 0;
    v132 = "delete";
    goto LABEL_132;
  }
  v140 = 0;
  if (objc_msgSend((id)v14, "isShareAcceptationFault"))
  {
    objc_msgSend((id)v14, "asShareAcceptationFault");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "markNeedsTransformIntoNormalFault");

    v140 = 1;
  }
  if (objc_msgSend(v13, "isDirectoryFault"))
  {
    objc_msgSend(v13, "itemID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isDocumentsFolder"))
    {
      objc_msgSend((id)v14, "appLibrary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_msgSend(v27, "state") & 0x4000000) == 0;

      if (v28)
        goto LABEL_23;
      objc_msgSend((id)v14, "appLibrary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "clearStateBits:", 0x4000000);

      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:].cold.4();

    }
  }
LABEL_23:
  if (objc_msgSend((id)v14, "physicalNameNeedsRename"))
    v142 |= 0x40uLL;
  if (+[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:](BRCServerChangesApplyUtil, "handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:", v14, v13, a5, v137, v15, &v142, &v140))
  {
    goto LABEL_11;
  }
  if (v14 && !objc_msgSend((id)v14, "isDead"))
  {
    v62 = 0;
  }
  else
  {
    objc_msgSend(v13, "parentZoneOnFS");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "clientZone");
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if (v128)
    {
      objc_msgSend(v13, "parentItemIDOnFS");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCFSWriter _handleClashingItemIfNecessary:parentID:si:](self, "_handleClashingItemIfNecessary:parentID:si:", v128, v32, v13);
      v33 = +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:](BRCServerChangesApplyUtil, "handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:", v14, v13, a5, v137, v15, 0);

      v34 = v128;
      if (v33)
      {
LABEL_30:

        goto LABEL_11;
      }
    }
    v134 = (void *)objc_msgSend(v13, "newLocalItemWithServerZone:dbRowID:", v15, objc_msgSend((id)v14, "dbRowID"));

    objc_msgSend(v134, "markReserved");
    objc_msgSend(v134, "orig");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "markReserved");

    v140 = 1;
    if (objc_msgSend(v134, "isDirectoryWithPackageName"))
    {
      objc_msgSend(v134, "bouncePhysicalNameToRepresentableName");
      brc_bread_crumbs();
      v43 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v134, "st");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "physicalName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v144 = (BRCFSWriter *)v13;
        v145 = 2112;
        v146 = (int64_t)v46;
        v147 = 2112;
        v148 = v43;
        _os_log_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Found directory %@ that has a package name, bounced name to %@%@", buf, 0x20u);

      }
      objc_msgSend(v134, "session");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "itemTransmogrifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "asDirectory");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "scheduleBouncedDirectoryRename:", v49);

    }
    if (objc_msgSend(v134, "isSharedToMeTopLevelItem"))
    {
      objc_msgSend(v13, "asSharedItem");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "fallbackParentAppLibraryOnFS");
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v124, "defaultClientZone");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "asShareableItem");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "unsaltedBookmarkData");
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v125, "serverAliasByUnsaltedBookmarkData:", v123);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v51) = v52 == 0;

      if ((_DWORD)v51)
      {
        brc_bread_crumbs();
        v53 = (BRCFSWriter *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v144 = v53;
          _os_log_impl(&dword_1CBD43000, v54, OS_LOG_TYPE_DEFAULT, "[WARNING] No alias pointing to new item shared container, forcing sync down on private container%@", buf, 0xCu);
        }

        objc_msgSend(v125, "serverZone");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "state");

        if ((v56 & 4) != 0)
        {
          objc_msgSend(v125, "scheduleSyncDown");
        }
        else
        {
          objc_msgSend(v13, "itemGlobalID");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "serverZone");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCItemID shareAliasRecordIDFromTargetItemID:zone:hasDerivedShareAlias:](BRCItemID, "shareAliasRecordIDFromTargetItemID:zone:hasDerivedShareAlias:", v57, v58, 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v125, "locateRecordIfNecessaryForRecordID:isUserWaiting:", v59, 0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v138[0] = MEMORY[0x1E0C809B0];
          v138[1] = 3221225472;
          v138[2] = __82__BRCFSWriter_applyChangesForServerItem_localItem_rank_zone_activity_hasFinished___block_invoke;
          v138[3] = &unk_1E8760F78;
          v61 = v59;
          v139 = v61;
          objc_msgSend(v60, "addLocateRecordCompletionBlock:", v138);

        }
      }

    }
    brc_bread_crumbs();
    v63 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      v106 = CFSTR("revived");
      *(_DWORD *)buf = 138412802;
      if (!v14)
        v106 = CFSTR("new");
      v144 = (BRCFSWriter *)v106;
      v145 = 2112;
      v146 = (int64_t)v134;
      v147 = 2112;
      v148 = v63;
      _os_log_debug_impl(&dword_1CBD43000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] Created reservation for %@ item: %@%@", buf, 0x20u);
    }

    v62 = 1;
    v14 = (int64_t)v134;
  }
  if (+[BRCServerChangesApplyUtil shouldForceApplyContentForItem:](BRCServerChangesApplyUtil, "shouldForceApplyContentForItem:", v14))
  {
    brc_bread_crumbs();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:].cold.3();

    v67 = v142 & 0x9F;
    v142 &= 0xFFFFFFFFFFFFFF9FLL;
  }
  else
  {
    v67 = v142;
  }
  v68 = "reparent";
  if ((v67 & 0x20) == 0)
    v68 = "rename";
  v69 = v67 & 0x60;
  v70 = "update";
  if (v69)
    v70 = v68;
  v129 = v69;
  v132 = v70;
  if (objc_msgSend(v13, "isLive") && objc_msgSend((id)v14, "isRejected"))
  {
    brc_bread_crumbs();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v144 = self;
      v145 = 2112;
      v146 = (int64_t)v71;
      _os_log_impl(&dword_1CBD43000, v72, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item was revived.  Marking sync as idle to apply server version for %@%@", buf, 0x16u);
    }

    objc_msgSend((id)v14, "markRejectedItemRemotelyRevived");
    v140 = 1;
  }
  if (objc_msgSend((id)v14, "isDirectory"))
  {
    if (v129)
    {
      objc_msgSend(v13, "st");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "logicalName");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "br_isPackageRoot");

      if (v75)
      {
        brc_bread_crumbs();
        v76 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "st");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "logicalName");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v144 = (BRCFSWriter *)v14;
          v145 = 2112;
          v146 = (int64_t)v79;
          v147 = 2112;
          v148 = v76;
          _os_log_impl(&dword_1CBD43000, v77, OS_LOG_TYPE_DEFAULT, "[WARNING] Renaming %@ to %@ which has a package name%@", buf, 0x20u);

        }
        objc_msgSend((id)v14, "session");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "itemTransmogrifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v14, "asDirectory");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "scheduleBouncedDirectoryRename:", v82);

      }
    }
    if (objc_msgSend((id)v14, "isReserved"))
    {
      objc_msgSend((id)v14, "st");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "stagedFileID");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v84 == 0;

      if (v85)
      {
        -[BRCFSWriter _stageCreationOfDirectory:](self, "_stageCreationOfDirectory:", v14);
        v140 = 1;
      }
      v132 = "creation";
    }
    objc_msgSend(v13, "st");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "type");
    objc_msgSend((id)v14, "st");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87 == objc_msgSend(v88, "type"))
    {

    }
    else
    {
      objc_msgSend(v13, "st");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v95, "type");
      if (v96 <= 0xA && ((1 << v96) & 0x611) != 0)
      {
        objc_msgSend((id)v14, "st");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v97, "type");
        if (v98 <= 0xA && ((1 << v98) & 0x611) != 0)
        {
          objc_msgSend((id)v14, "st");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = objc_msgSend(v99, "type") == 4;

          if (v126)
            goto LABEL_116;
          objc_msgSend((id)v14, "st");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "st");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "setType:", objc_msgSend(v101, "type"));

          v140 = 1;
          brc_bread_crumbs();
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v102 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v144 = (BRCFSWriter *)v13;
            v145 = 2112;
            v146 = v14;
            v147 = 2112;
            v148 = (const char *)v86;
            _os_log_impl(&dword_1CBD43000, v102, OS_LOG_TYPE_DEFAULT, "[WARNING] Updating item type from server item %@ for %@%@", buf, 0x20u);
          }

        }
        else
        {

        }
      }
      else
      {

      }
    }
  }
  else
  {
    if (objc_msgSend((id)v14, "isSymLink"))
    {
      if (objc_msgSend((id)v14, "isReserved"))
      {
        objc_msgSend((id)v14, "st");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "stagedFileID");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v90 == 0;

        if (!v91)
        {
          v132 = "creation";
          goto LABEL_116;
        }
        objc_msgSend((id)v14, "asSymlink");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCFSWriter _stageCreationOfSymlink:forLocalItem:](self, "_stageCreationOfSymlink:forLocalItem:", v13, v105);

        v140 = 1;
        v104 = "creation";
      }
      else
      {
        if ((v142 & 0x2000) == 0)
          goto LABEL_116;
        objc_msgSend((id)v14, "asSymlink");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCFSWriter _stageCreationOfSymlink:forLocalItem:](self, "_stageCreationOfSymlink:forLocalItem:", v13, v103);

        v140 = 1;
        v104 = "update";
      }
      v132 = v104;
LABEL_117:
      objc_msgSend((id)v14, "saveToDBForServerEdit:keepAliases:", 1, 0);
      goto LABEL_118;
    }
    if (!objc_msgSend((id)v14, "isDocument"))
      goto LABEL_116;
    objc_msgSend((id)v14, "asDocument");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "isReserved"))
      v92 = "creation";
    else
      v92 = v132;
    v93 = -[BRCFSWriter _computeDesiredVersionOptionsForDocument:createdReservedItem:](self, "_computeDesiredVersionOptionsForDocument:createdReservedItem:", v14, v62);
    if (objc_msgSend(v34, "updateDesiredVersionWithServerItem:diffs:options:needsSave:", v13, v142, v93, &v140) != 1)
    {
      if (v140)
        objc_msgSend(v34, "saveToDBForServerEdit:keepAliases:", 1, 0);
      goto LABEL_30;
    }
    if ((objc_msgSend(v34, "isReserved") & 1) != 0)
    {
      v86 = v34;
      v94 = 1;
    }
    else
    {
      v94 = objc_msgSend(v34, "isFault");
      v86 = v34;
    }
    v107 = "eviction";
    if ((v93 & 1) == 0)
      v107 = "making live";
    if (((v93 & 1) == 0) != v94)
      v108 = v92;
    else
      v108 = v107;
    v132 = v108;
  }

LABEL_116:
  if (v140)
    goto LABEL_117;
LABEL_118:
  +[BRCItemToPathLookup lookupForItem:](BRCItemToPathLookup, "lookupForItem:", v14);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "coordinatedWriteURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v129)
  {
    +[BRCItemToPathLookup lookupForServerItem:cleanupFaults:](BRCItemToPathLookup, "lookupForServerItem:cleanupFaults:", v13, 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "coordinatedWriteURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "closePaths");

  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v109, "closePaths");
  if (v129 && !v23)
  {
    brc_bread_crumbs();
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:].cold.2();

    v23 = 0;
    goto LABEL_12;
  }
  if (v23)
  {
    objc_msgSend(v23, "lastPathComponent");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v14, "computedDestinationFilenameFromServerItem:", v13);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v113, "isEqualToString:", v114);

    if ((v130 & 1) == 0)
    {
      brc_bread_crumbs();
      v131 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_FAULT))
      {
        v127 = v115;
        objc_msgSend(v23, "lastPathComponent");
        v118 = (BRCFSWriter *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v14, "computedDestinationFilenameFromServerItem:", v13);
        v119 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v144 = v118;
        v145 = 2112;
        v146 = (int64_t)v119;
        v147 = 2112;
        v148 = v131;
        _os_log_fault_impl(&dword_1CBD43000, v127, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: dst %@ isn't equal to computed %@%@", buf, 0x20u);

        v115 = v127;
      }

    }
  }

LABEL_132:
  if (objc_msgSend((id)v14, "isDead"))
  {
    brc_bread_crumbs();
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT))
      -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:].cold.1();

  }
  -[BRCFSWriter _scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:](self, "_scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:", v24, v23, v132, v14, v13, v142, a8);
LABEL_12:
  __brc_leave_section(v141);

}

void __82__BRCFSWriter_applyChangesForServerItem_localItem_rank_zone_activity_hasFinished___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("fail");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138413058;
    if (a2)
      v8 = CFSTR("success");
    v11 = v9;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_INFO, "[INFO] Fetch share alias for share alias record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }

}

- (void)_writeUnderCoordinationFromURL:(id)a3 toURL:(id)a4 canDelete:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  __CFString *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  _BOOL4 v60;
  __CFString *v61;
  __CFString *v62;
  uint64_t v63[3];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  const __CFString *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  NSObject *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v60 = a5;
  v84 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isBatchSuspended");

  if ((v10 & 1) == 0)
  {
    brc_bread_crumbs();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      -[BRCFSReader lookupAndReadItemUnderCoordinationAtURL:].cold.1();

  }
  if (v8)
  {
    -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lookupAndReadItemUnderCoordinationAtURL:", v8);
    v12 = objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:].cold.5(v8, (uint64_t)v13, v14);

      objc_msgSend(0, "closePaths");
      v12 = 0;
      v8 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lookupAndReadItemUnderCoordinationAtURL:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v12)
    {
      objc_msgSend(v16, "parentRelpath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clientZone");
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSObject parentRelpath](v12, "parentRelpath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "clientZone");
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v61 != v62)
      {
        objc_msgSend(v16, "byIDServerItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v23 = v21;
        }
        else
        {
          objc_msgSend(v16, "faultedServerItem");
          v23 = objc_claimAutoreleasedReturnValue();
        }
        v26 = v23;

        if ((-[NSObject isSharedToMeTopLevelItem](v26, "isSharedToMeTopLevelItem") & 1) != 0
          || (-[NSObject clientZone](v26, "clientZone"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v30 = objc_msgSend(v29, "isEqualToClientZone:", v62),
              v29,
              v30))
        {
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:].cold.4();

          v27 = v8;
        }
        else
        {
          brc_bread_crumbs();
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v65 = (uint64_t)v61;
            v66 = 2112;
            v67 = v62;
            v68 = 2112;
            v69 = v32;
            _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring destination part of coordination: URLs don't point to the same container: %@ != %@%@", buf, 0x20u);
          }

          -[NSObject closePaths](v12, "closePaths");
          v12 = 0;
          v27 = 0;
          v28 = v8;
        }
        v8 = v7;
LABEL_32:

        v7 = v8;
        goto LABEL_33;
      }
      v62 = v61;
    }
    else
    {
      v61 = 0;
      v62 = 0;
    }
    v27 = v8;
LABEL_33:
    memset(v63, 0, sizeof(v63));
    __brc_create_section(0, (uint64_t)"-[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:]", 2667, v63);
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v42 = CFSTR(", deleting");
      if (!v60)
        v42 = &stru_1E8769030;
      v57 = v63[0];
      v58 = v42;
      if (v27)
        v43 = CFSTR(", renaming");
      else
        v43 = &stru_1E8769030;
      v44 = CFSTR("\n from ");
      if (!v27)
        v44 = CFSTR("\n at ");
      v55 = v43;
      v56 = v44;
      objc_msgSend(v7, "path");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringByAbbreviatingWithTildeInPath");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("\n   to ");
      if (!v27)
        v45 = &stru_1E8769030;
      v53 = v45;
      objc_msgSend(v27, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringByAbbreviatingWithTildeInPath");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v47;
      v52 = v46;
      if (v47)
        v49 = (const __CFString *)v47;
      else
        v49 = &stru_1E8769030;
      *(_DWORD *)buf = 134220290;
      v65 = v57;
      v66 = 2112;
      v67 = v55;
      v68 = 2112;
      v69 = v58;
      v70 = 2112;
      v71 = v56;
      v72 = 2112;
      v73 = v54;
      v74 = 2112;
      v75 = v53;
      v76 = 2112;
      v77 = v49;
      v78 = 2112;
      v79 = v16;
      v80 = 2112;
      v81 = v12;
      v82 = 2112;
      v83 = v34;
      _os_log_debug_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx acquired coordination for (writing%@%@)%@%@%@%@\nsource lookup: %@\ndestination lookup: %@\n%@", buf, 0x66u);

    }
    v36 = -[BRCAccountSession availableDiskSpaceUsingCache:](self->_session, "availableDiskSpaceUsingCache:", 0);
    if (v60)
    {
      objc_msgSend(v16, "tryToDeleteItemInNamespace:", 2);
      objc_msgSend(v16, "tryToDeleteItemInNamespace:", 1);
      objc_msgSend(v16, "tryToDeleteItemInNamespace:", 0);
    }
    else
    {
      objc_msgSend(v16, "tryToUpdateItemInNamespace:withDstLookup:", 0, v12);
      objc_msgSend(v16, "tryToUpdateItemInNamespace:withDstLookup:", 1, v12);
      objc_msgSend(v16, "tryToUpdateItemInNamespace:withDstLookup:", 2, v12);
      -[NSObject tryToUpdateItemInNamespace:withDstLookup:](v12, "tryToUpdateItemInNamespace:withDstLookup:", 0, 0);
      -[NSObject tryToUpdateItemInNamespace:withDstLookup:](v12, "tryToUpdateItemInNamespace:withDstLookup:", 1, 0);
      -[NSObject tryToUpdateItemInNamespace:withDstLookup:](v12, "tryToUpdateItemInNamespace:withDstLookup:", 2, 0);
    }
    objc_msgSend(v16, "closePaths", v52);
    -[NSObject closePaths](v12, "closePaths");
    v37 = -[BRCAccountSession availableDiskSpaceUsingCache:](self->_session, "availableDiskSpaceUsingCache:", 0);
    v38 = v36 - v37;
    if (v36 > v37)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v38, 0, 0, 0);
        objc_claimAutoreleasedReturnValue();
        -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:].cold.2();
      }

      -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "rescheduleJobsForPendingDiskSpaceWithAvailableSpace:", v37);

    }
    __brc_leave_section(v63);

    v8 = v27;
    goto LABEL_42;
  }
  objc_msgSend(0, "closePaths");
  if (v12)
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:].cold.3(v7, (uint64_t)v24, v25);

    v26 = v12;
    v61 = 0;
    v62 = 0;
    v12 = 0;
    v27 = 0;
    v28 = v7;
    v16 = v26;
    goto LABEL_32;
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:].cold.1(v7, (uint64_t)v16, v12);
LABEL_42:

}

- (void)writeUnderCoordinationFromURL:(id)a3 toURL:(id)a4 canDelete:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a5 || (v10 = 4, v8) && v9)
    v10 = 20;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__BRCFSWriter_writeUnderCoordinationFromURL_toURL_canDelete___block_invoke;
  v14[3] = &unk_1E8767CB0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a5;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "performWithFlags:action:", v10, v14);

}

uint64_t __61__BRCFSWriter_writeUnderCoordinationFromURL_toURL_canDelete___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_writeUnderCoordinationFromURL:toURL:canDelete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  return 1;
}

- (BRCFSWriter)initWithAccountSession:(id)a3
{
  id v5;
  BRCFSWriter *v6;
  BRCFSWriter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *serialQueue;
  uint64_t v18;
  brc_task_tracker *taskTracker;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCFSWriter;
  v6 = -[BRCFSWriter init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    -[BRCAccountSession clientDB](v7->_session, "clientDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8
      || (objc_msgSend(v8, "serialQueue"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCFSWriter initWithAccountSession:].cold.1();

    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession clientTruthWorkloop](v7->_session, "clientTruthWorkloop");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create_with_target_V2("com.apple.brc.fs.writer", v15, v14);

    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v16;

    atomic_store(1u, (unsigned int *)&v7->_suspendCount);
    dispatch_suspend((dispatch_object_t)v7->_serialQueue);
    brc_task_tracker_create("com.apple.brc.fs.writer");
    v18 = objc_claimAutoreleasedReturnValue();
    taskTracker = v7->_taskTracker;
    v7->_taskTracker = (brc_task_tracker *)v18;

  }
  return v7;
}

- (void)close
{
  if (atomic_load((unsigned int *)&self->_suspendCount))
    dispatch_resume((dispatch_object_t)self->_serialQueue);
  brc_task_tracker_wait((uint64_t)self->_taskTracker);
}

- (void)suspend
{
  int *p_suspendCount;
  unsigned int v3;

  p_suspendCount = &self->_suspendCount;
  do
    v3 = __ldaxr((unsigned int *)p_suspendCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_suspendCount));
  if (!v3)
    dispatch_suspend((dispatch_object_t)self->_serialQueue);
}

- (void)resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: suspendCount >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cancel
{
  self->_isCancelled = 1;
  brc_task_tracker_cancel(self->_taskTracker);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (brc_task_tracker)taskTracker
{
  return self->_taskTracker;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Successfully bounced item %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Failed to move from fault stage to live %@%@");
  OUTLINED_FUNCTION_2();
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Failed to transfer docID to staged item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to move the existing fault to old version stage for bounce%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: item.st.stagedFileID != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: newLogicalName && ![origLogicalName isEqualToString:newLogicalName]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v1, v2, "[CRIT] UNREACHABLE: giving up bouncing %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Successfully bounced path %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_stageCreationOfDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Unable to stage directory: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_stageCreationOfSymlink:forLocalItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Unable to stage symlink: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Successfully restored readonly edit creating version with existing edit %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed to restore readonly edit - %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Remove rank for alias with no real changes: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Accepting Structural Etag update for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_13_1(&dword_1CBD43000, v0, v1, "[DEBUG] unable to rename alias %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Failed to make the bookmark live: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] syncing down shared database because %@ points to an unknown container%@");
  OUTLINED_FUNCTION_2();
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: parentItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Item deleted successfully: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_13_1(&dword_1CBD43000, v0, v1, "[DEBUG] unable to delete alias %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] unable to rename because alias has local unprocessed rename%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_computeDesiredVersionOptionsForDocument:createdReservedItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: dv%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Retrying item since we can't resolve its live path: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] ignoring dst url because it is the same as the item url%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleClashingItemIfNecessary:parentID:si:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [bounce isEqualToString:clash.st.filename]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleClashingItemIfNecessary:parentID:si:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: bounceNumber%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleClashingItemIfNecessary:parentID:si:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Found clashing reserved item, probably pending rename, bouncing it%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !li.isDead%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Retrying item since we can't resolve its destination path: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Not requesting rename on %@ where we're only applying content diffs%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Clearing the listed docs bit on the documents folder because the documents folder is a dir-fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: li || si%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_writeUnderCoordinationFromURL:(void *)a1 toURL:(uint64_t)a2 canDelete:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAbbreviatingWithTildeInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] Ignoring coordination: failed resolving %@%@", v7);

  OUTLINED_FUNCTION_6();
}

- (void)_writeUnderCoordinationFromURL:toURL:canDelete:.cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15_3();
  v1 = (void *)v0;
  OUTLINED_FUNCTION_10(v0, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] we just freed %@ when applying changes: scheduling download throttles%@", v5);

}

- (void)_writeUnderCoordinationFromURL:(void *)a1 toURL:(uint64_t)a2 canDelete:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAbbreviatingWithTildeInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] Ignoring source part of coordination: failed resolving %@%@", v7);

  OUTLINED_FUNCTION_6();
}

- (void)_writeUnderCoordinationFromURL:toURL:canDelete:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] granting cross-zone coordination request: moving a shared document%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_writeUnderCoordinationFromURL:(void *)a1 toURL:(uint64_t)a2 canDelete:(NSObject *)a3 .cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAbbreviatingWithTildeInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] Ignoring destination part of coordination: failed resolving %@%@", v7);

  OUTLINED_FUNCTION_6();
}

- (void)initWithAccountSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: db && db.serialQueue%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
