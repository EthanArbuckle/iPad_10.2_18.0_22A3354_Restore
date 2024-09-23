@implementation GEOTileLoader

void __48__GEOTileLoader__tileDecoderForTileKey_quickly___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_3(uint64_t a1)
{
  -[GEOTileLoader _loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:](*(GEOTileLoader **)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

uint64_t __31__GEOTileLoader_openForClient___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1[4] + 24), "containsObject:", a1[5]))
  {
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Already open for client (%@)"), a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise");

  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 24), "count");
  return objc_msgSend(*(id *)(a1[4] + 24), "addObject:", a1[5]);
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(void *)a5 forClient:(uint64_t)a6 options:(unsigned int)a7 reason:(int)a8 qos:(double)a9 signpostID:(uint64_t)a10 createTime:(void *)a11 callbackQ:(void *)a12 beginNetwork:(void *)a13 callback:
{
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v26;

  v26 = a5;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = v22;
  if (a1)
  {
    LODWORD(v24) = a8;
    objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a2, a3, a4, v26, a6, a7, a9, v24, a10, 0, v20, v21, v22);
  }

}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(unsigned int)a8 qos:(int)a9 signpostID:(uint64_t)a10 auditToken:(void *)a11 callbackQ:(void *)a12 beginNetwork:(void *)a13 callback:(void *)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v25;

  v25 = a6;
  v18 = a11;
  v19 = a12;
  v20 = a13;
  v21 = a14;
  GEOMachAbsoluteTimeGetCurrent();
  LODWORD(v22) = a9;
  objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, a4, a5, v25, a7, a8, v22, a10, v18, v19, v20, v21);

}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(unsigned int)a6 options:(void *)a7 reason:(uint64_t)a8 qos:(char)a9 signpostID:(int)a10 auditToken:(uint64_t)a11 createTime:(void *)a12 callbackQ:(void *)a13 beginNetwork:(void *)a14 callback:(void *)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v27;

  v27 = a7;
  v20 = a12;
  v21 = a13;
  v22 = a14;
  v23 = a15;
  if (!v20)
  {
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  HIDWORD(v24) = a10;
  LOBYTE(v24) = a9;
  objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:auditToken:options:reason:qos:signpostID:createTime:callbackQ:beginNetwork:callback:", a4, a5, a6, v27, v20, a8, a2, v24, a11, v21, v22, v23);

}

- (void)loadKey:(uint64_t)a3 additionalInfo:(unint64_t *)a4 priority:(_OWORD *)a5 forClient:(int)a6 auditToken:(void *)a7 options:(void *)a8 reason:(void *)a9 qos:(char)a10 signpostID:(int)a11 createTime:(void *)a12 callbackQ:(void *)a13 beginNetwork:(void *)a14 callback:(void *)a15
{
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  unint64_t v25;
  void *v26;
  unsigned __int8 v27;
  unsigned int v28;
  unint64_t v29;
  unsigned __int8 v30;
  uint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id location[6];
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  int v50;
  __int128 v51;
  int v52;
  unint64_t v53;
  unint64_t v54;
  char v55;
  BOOL v56;
  uint8_t buf[16];
  _QWORD v58[4];
  id v59;
  id v60[3];
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v21 = a7;
  v22 = a8;
  v40 = a13;
  v37 = a14;
  v38 = a15;
  if (!v38)
    goto LABEL_33;
  if (!a4)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v38 + 2))(v38, 0, 0, 0, 0, 0);
    goto LABEL_33;
  }
  if (!v22 || !v21 || !v40)
  {
    (*((void (**)(id, unint64_t *, _QWORD, _QWORD, _QWORD, _QWORD))v38 + 2))(v38, a4, 0, 0, 0, 0);
    goto LABEL_33;
  }
  v23 = a12;
  if ((unint64_t)a12 + 1 <= 1)
  {
    GEOGetTileLoadingLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)os_signpost_id_generate(v24);

  }
  v62 = *(_OWORD *)a4;
  objc_msgSend(a1[5], "generateRequestedFromTileLoaderBeginSignpost:tileKey:options:", v23, a4, a9);
  objc_initWeak(location, a1[5]);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke;
  v58[3] = &unk_1E1C00088;
  v60[1] = a9;
  objc_copyWeak(v60, location);
  v60[2] = v23;
  v61 = v62;
  v59 = v38;
  v35 = (void *)MEMORY[0x18D765024](v58);
  v39 = v22;
  if (!+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    if (((unsigned __int16)a9 & 0x400) == 0)
    {
      if (((unsigned __int16)a9 & 0x800) != 0)
      {
LABEL_26:
        v32 = -97;
        if ((*(_BYTE *)a4 & 0x60) == 0)
          v32 = -1;
        v25 = v32 & *a4;
        goto LABEL_29;
      }
      v34 = v39;
      objc_msgSend(v34, "offlineCohortId");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = +[GEOOfflineService activeStateForCohortId:](GEOOfflineService, "activeStateForCohortId:", v26);

      if (v27 < 2u)
        goto LABEL_25;
      if (v27 != 2)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v27;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
        }
        goto LABEL_25;
      }
      if ((a9 & 4) != 0)
      {
LABEL_25:

        goto LABEL_26;
      }

    }
    v28 = *(_BYTE *)a4 & 0x7F;
    if (v28 >= 0x40)
    {
      v29 = *a4;
    }
    else
    {
      v29 = *a4;
      if (v28 != 8)
      {
        v30 = v29 & 0x9F | 0x40;
LABEL_22:
        v25 = v29 & 0xFFFFFFFFFFFFFF00 | v30;
        goto LABEL_29;
      }
    }
    v30 = v29;
    goto LABEL_22;
  }
  v25 = *a4;
LABEL_29:
  v33 = a4[1];

  if (a5)
    *(_OWORD *)buf = *a5;
  else
    memset(buf, 0, sizeof(buf));
  location[1] = (id)MEMORY[0x1E0C809B0];
  location[2] = (id)3221225472;
  location[3] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_2;
  location[4] = &unk_1E1C00100;
  v53 = v25;
  v54 = v33;
  v47 = a9;
  location[5] = a1;
  v42 = v21;
  v43 = v39;
  v44 = v40;
  v45 = v37;
  v46 = v35;
  v55 = a10;
  v50 = a6;
  v56 = a5 != 0;
  v51 = *(_OWORD *)buf;
  v52 = a11;
  v48 = v23;
  v49 = a2;
  geo_isolate_async();

  objc_destroyWeak(v60);
  objc_destroyWeak(location);
LABEL_33:

}

void __70__GEOTileLoader__notifyObserversOfSuccess_sizeInBytes_source_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectEnumerator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)proxy:(uint64_t)a3 loadedTile:(void *)a4 forKey:(__int128 *)a5 info:(void *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  char v36;
  char v37;
  _QWORD v38[5];
  id v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  char v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  v11 = v10;
  if (a1)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("GEOTileLoadResultSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    v14 = 88;
    if (v13 == 1)
      v14 = 84;
    v15 = (unsigned int *)(*(_QWORD *)(a1 + 112) + v14);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 + 1, v15));
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GEOTileLoadResultIsPreliminary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    v26 = 1;
    -[GEOTileLoader _tileDecoderForTileKey:quickly:](a1, (uint64_t)a5, (uint64_t)&v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *a5;
    v20 = objc_msgSend(v9, "length");
    v21 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __41__GEOTileLoader__loadedTile_forKey_info___block_invoke;
    v38[3] = &unk_1E1C00240;
    v38[4] = a1;
    v22 = v11;
    v42 = v44;
    v43 = v18;
    v39 = v22;
    v40 = v20;
    v41 = v13;
    v23 = (void *)MEMORY[0x18D765024](v38);
    v27 = v21;
    v28 = 3221225472;
    v29 = __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_3;
    v30 = &unk_1E1C00268;
    v31 = a1;
    v35 = v44;
    v36 = v18;
    v37 = v26;
    v24 = v19;
    v32 = v24;
    v33 = v9;
    v34 = v23;
    v25 = v23;
    geo_isolate_sync();

  }
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id WeakRetained;
  uint64_t v17;
  uint64_t v18;
  uint8_t v21[8];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GEOTileLoadResultIsPreliminary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (!v14 || (*(_BYTE *)(a1 + 48) & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "generateRequestedFromTileLoaderEndSignpost:", *(_QWORD *)(a1 + 56));

  }
  if (*(_QWORD *)a2 != *(_QWORD *)(a1 + 64) || *(_QWORD *)(a2 + 8) != *(_QWORD *)(a1 + 72))
  {
    v17 = *(_QWORD *)(a2 + 8);
    v18 = -97;
    if ((*(_BYTE *)a2 & 0x60) == 0)
      v18 = -1;
    v22 = v18 & *(_QWORD *)a2;
    v23 = v17;
    if ((v22 != *(_QWORD *)(a1 + 64) || v17 != *(_QWORD *)(a1 + 72))
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: GEOTileKeyEquals(&onlineKey, &inputKey)", v21, 2u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_tileDecoderForTileKey:(uint64_t)a3 quickly:
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = -97;
  if ((*(_BYTE *)a2 & 0x60) == 0)
    v5 = -1;
  v30[0] = v5 & *(_QWORD *)a2;
  v30[1] = v4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __48__GEOTileLoader__tileDecoderForTileKey_quickly___block_invoke;
  v20 = &unk_1E1BFFF70;
  v21 = a1;
  v22 = &v23;
  geo_isolate_sync_data();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)v24[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "canDecodeTile:quickly:", v30, a3, (_QWORD)v13) & 1) != 0)
        {
          v11 = v10;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v29, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  _Block_object_dispose(&v23, 8);
  return v11;
}

void __28__GEOTileLoader__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  uint64_t *v14;
  uint64_t *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  void **v21;
  LoadItem *v22;
  char v23;
  unsigned int v24;
  char v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _QWORD *v31;
  uint64_t *v32;
  unsigned int v33;
  uint64_t *v34;
  uint64_t *v35;
  BOOL v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  double v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD *v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t *i;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  id v79;
  id v80;
  id v81;
  id v82;
  void (**v83)(_QWORD);
  void **v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  void *v89[6];
  _QWORD *v90;
  uint64_t *v91;
  uint64_t v92;
  uint8_t buf[16];
  uint64_t (*v94)(_QWORD *);
  void *v95;
  id v96;
  void **v97;
  uint64_t *v98;
  id v99;
  uint8_t v100[4];
  uint64_t v101;
  __int16 v102;
  int v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  uint64_t v107;
  _QWORD v108[3];
  _QWORD *v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 112);
    v3 = v2 + 8;
    v4 = *(_QWORD *)(v2 + 16);
    if (v4 == v2 + 8)
    {
      v5 = 0;
    }
    else
    {
      v5 = 0;
      do
      {
        if ((unint64_t)LoadItem::options((LoadItem *)(v4 + 16)) >= 0x200
          && (*(_DWORD *)(v4 + 40) - 1) < 2)
        {
          ++v5;
        }
        v4 = *(_QWORD *)(v4 + 8);
      }
      while (v4 != v3);
    }
    v90 = &v90;
    v91 = (uint64_t *)&v90;
    v92 = 0;
    if ((unint64_t)objc_msgSend(*(id *)(v1 + 80), "backpressureControlCountLimit") < 8)
      v6 = 1;
    else
      v6 = (unint64_t)objc_msgSend(*(id *)(v1 + 80), "backpressureControlCountLimit") >> 2;
    v86 = v6;
    v7 = *(_QWORD *)(v1 + 112);
    v8 = *(_QWORD *)(v7 + 16);
    v88 = v1;
    if (v8 != v7 + 8)
    {
      v85 = 0;
      while (1)
      {
        if (!*(_DWORD *)(v8 + 40))
        {
          v9 = (_BYTE *)(v8 + 16);
          v10 = LoadItem::options((LoadItem *)(v8 + 16));
          if (v10 < 0x200)
            goto LABEL_27;
          v11 = v86;
          if (*(_QWORD *)(v8 + 104))
          {
            v12 = *(uint64_t **)(v8 + 96);
            v11 = v86;
            if (v12)
            {
              v13 = 0;
              do
              {
                if (*((_DWORD *)v12 + 39) > v13)
                  v13 = *((_DWORD *)v12 + 39);
                v12 = (uint64_t *)*v12;
              }
              while (v12);
              v11 = v86;
              if (v13 >= 0x7FFFFFFE)
                v11 = objc_msgSend(*(id *)(v1 + 80), "backpressureControlCountLimit");
            }
          }
          if (v5 < v11)
          {
            ++v5;
LABEL_27:
            v87 = v5;
            *(_QWORD *)(v8 + 48) = v10;
            v89[0] = 0;
            v14 = v91;
            if (v91 != (uint64_t *)&v90)
            {
              do
              {
                if (*((_DWORD *)v14 + 13) == (*v9 & 0x7F) && ((*((_DWORD *)v14 + 10) ^ v10) & 7) == 0)
                {
                  if (*(_QWORD *)(v8 + 104) && (v15 = *(uint64_t **)(v8 + 96)) != 0)
                  {
                    v16 = 0;
                    do
                    {
                      if (v16 <= *((_DWORD *)v15 + 45))
                        v16 = *((_DWORD *)v15 + 45);
                      v15 = (uint64_t *)*v15;
                    }
                    while (v15);
                  }
                  else
                  {
                    v16 = 0;
                  }
                  if (*((_DWORD *)v14 + 21) == v16)
                  {
                    v17 = (void *)v14[11];
                    LoadItem::voucher((LoadItem *)(v8 + 16));
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v17 == v18)
                    {
                      v19 = *((unsigned __int8 *)v14 + 48);
                      v20 = v19 == LoadItem::reason(*(LoadItem **)(v8 + 96));

                      if (v20)
                      {
                        if ((v10 & 8) == 0)
                        {
                          v65 = v14[5];
                          if ((v65 & 8) != 0)
                            v14[5] = v65 ^ 8;
                        }
                        v21 = (void **)(v14 + 2);
                        v89[0] = v21;
                        goto LABEL_51;
                      }
                    }
                    else
                    {

                    }
                  }
                }
                v14 = (uint64_t *)v14[1];
              }
              while (v14 != (uint64_t *)&v90);
              v21 = (void **)v89[0];
              if (v89[0])
                goto LABEL_51;
            }
            v22 = *(LoadItem **)(v8 + 96);
            v23 = LoadItem::reason(v22);
            v24 = 0;
            if (*(_QWORD *)(v8 + 104) && v22)
            {
              v24 = 0;
              do
              {
                if (v24 <= *((_DWORD *)v22 + 45))
                  v24 = *((_DWORD *)v22 + 45);
                v22 = *(LoadItem **)v22;
              }
              while (v22);
            }
            v25 = *(_BYTE *)(v8 + 16);
            LoadItem::voucher((LoadItem *)(v8 + 16));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = operator new(0x60uLL);
            *v27 = 0;
            v27[1] = 0;
            geo::Batch::Batch((uint64_t)(v27 + 2), v10 & 0x1FF, v23, v25 & 0x7F, v24, v26);
            v28 = (uint64_t)v90;
            *v27 = v90;
            v27[1] = &v90;
            *(_QWORD *)(v28 + 8) = v27;
            v90 = v27;
            ++v92;

            v29 = (uint64_t)v90;
            v21 = (void **)(v90 + 2);
            v89[0] = v90 + 2;
            v30 = *(_DWORD *)(v1 + 88) + 1;
            *(_DWORD *)(v1 + 88) = v30;
            *(_DWORD *)(v29 + 80) = v30;
LABEL_51:
            *(_DWORD *)(v8 + 120) = *((_DWORD *)v21 + 16);
            *(_OWORD *)buf = *(_OWORD *)v9;
            v31 = *(_QWORD **)(v8 + 96);
            v32 = (uint64_t *)(v8 + 96);
            if (*(_QWORD *)(v8 + 104))
            {
              v33 = 0;
              if (v31)
              {
                v34 = *(uint64_t **)(v8 + 96);
                do
                {
                  if (*((_DWORD *)v34 + 39) > v33)
                    v33 = *((_DWORD *)v34 + 39);
                  v34 = (uint64_t *)*v34;
                }
                while (v34);
              }
              v35 = (uint64_t *)(v8 + 96);
              do
              {
                v35 = (uint64_t *)*v35;
                v36 = v35 != 0;
              }
              while (v35 && !*((_BYTE *)v35 + 161));
              v37 = (uint64_t *)(v8 + 96);
              while (1)
              {
                v37 = (uint64_t *)*v37;
                if (!v37)
                  break;
                if (*((_BYTE *)v37 + 161))
                {
                  v38 = *(uint64_t *)((char *)v37 + 164);
                  v39 = *(uint64_t *)((char *)v37 + 172);
                  goto LABEL_66;
                }
              }
            }
            else
            {
              v36 = 0;
              v33 = 0;
            }
            v39 = 0;
            v38 = 0;
LABEL_66:
            v40 = 0;
            if (v31)
            {
              LOBYTE(v41) = 0;
              do
              {
                if ((unint64_t)(v31[24] - 1) <= 0xFFFFFFFFFFFFFFFDLL
                  && (!v40 || (v41 & 0x40) != 0 && (v31[18] & 0x40) == 0))
                {
                  v41 = v31[18];
                  v40 = v31[24];
                }
                v31 = (_QWORD *)*v31;
              }
              while (v31);
            }
            v42 = (double *)(v8 + 96);
            while (1)
            {
              v42 = *(double **)v42;
              if (!v42)
                break;
              v43 = v42[25];
              if (v43 != 0.0)
                goto LABEL_79;
            }
            v43 = 0.0;
LABEL_79:
            v44 = (char *)v21[1];
            v45 = (char *)v21[2];
            if (v44 >= v45)
            {
              v47 = 0x6DB6DB6DB6DB6DB7 * ((v44 - (_BYTE *)*v21) >> 3);
              v48 = v47 + 1;
              if ((unint64_t)(v47 + 1) > 0x492492492492492)
                std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
              v49 = 0x6DB6DB6DB6DB6DB7 * ((v45 - (_BYTE *)*v21) >> 3);
              if (2 * v49 > v48)
                v48 = 2 * v49;
              if (v49 >= 0x249249249249249)
                v50 = 0x492492492492492;
              else
                v50 = v48;
              if (v50)
              {
                v84 = v21;
                if (v50 > 0x492492492492492)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v51 = v10;
                v10 = v38;
                v52 = v39;
                v53 = v50;
                v54 = (char *)operator new(56 * v50);
                v39 = v52;
                v38 = v10;
                LOBYTE(v10) = v51;
                v32 = (uint64_t *)(v8 + 96);
                v50 = v53;
                v21 = v84;
              }
              else
              {
                v54 = 0;
              }
              v55 = &v54[56 * v47];
              *(_OWORD *)v55 = *(_OWORD *)buf;
              *((_DWORD *)v55 + 4) = v33;
              v55[20] = v36;
              *((_QWORD *)v55 + 3) = v38;
              *((_QWORD *)v55 + 4) = v39;
              *((_QWORD *)v55 + 5) = v40;
              *((double *)v55 + 6) = v43;
              v57 = (char *)*v21;
              v56 = (char *)v21[1];
              v58 = v55;
              if (v56 == *v21)
              {
                v1 = v88;
              }
              else
              {
                v1 = v88;
                do
                {
                  v59 = *(_OWORD *)(v56 - 56);
                  v60 = *(_OWORD *)(v56 - 40);
                  v61 = *(_OWORD *)(v56 - 24);
                  *((_QWORD *)v58 - 1) = *((_QWORD *)v56 - 1);
                  *(_OWORD *)(v58 - 24) = v61;
                  *(_OWORD *)(v58 - 40) = v60;
                  *(_OWORD *)(v58 - 56) = v59;
                  v58 -= 56;
                  v56 -= 56;
                }
                while (v56 != v57);
                v56 = (char *)*v21;
              }
              v46 = v55 + 56;
              *v21 = v58;
              v21[1] = v55 + 56;
              v21[2] = &v54[56 * v50];
              if (v56)
                operator delete(v56);
            }
            else
            {
              *(_OWORD *)v44 = *(_OWORD *)v9;
              *((_DWORD *)v44 + 4) = v33;
              v44[20] = v36;
              *((_QWORD *)v44 + 3) = v38;
              *((_QWORD *)v44 + 4) = v39;
              *((_QWORD *)v44 + 5) = v40;
              *((double *)v44 + 6) = v43;
              v46 = v44 + 56;
              v1 = v88;
            }
            v21[1] = v46;
            v108[0] = &off_1E1BFA390;
            v108[1] = v89;
            v109 = v108;
            LoadItem::foreachRequester(*v32, (uint64_t)v108);
            v62 = v109;
            v5 = v87;
            if (v109 == v108)
            {
              v62 = v108;
              v63 = 4;
LABEL_103:
              (*(void (**)(void))(*v62 + 8 * v63))();
            }
            else if (v109)
            {
              v63 = 5;
              goto LABEL_103;
            }
            if ((v10 & 0x60) != 0)
              v64 = 1;
            else
              v64 = 3;
            *(_DWORD *)(v8 + 40) = 1;
            *(_DWORD *)(v8 + 44) = v64;
            goto LABEL_108;
          }
          ++v85;
        }
LABEL_108:
        v8 = *(_QWORD *)(v8 + 8);
        if (v8 == *(_QWORD *)(v1 + 112) + 8)
        {
          if (v85)
          {
            GEOGetTileLoadingLog();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349056;
              *(_QWORD *)&buf[4] = v85;
              _os_log_impl(&dword_1885A9000, v66, OS_LOG_TYPE_INFO, "Withholding %{public}llu tile requests from submission due to backpressure", buf, 0xCu);
            }

          }
          break;
        }
      }
    }
    for (i = v91; i != (uint64_t *)&v90; i = (uint64_t *)i[1])
    {
      v68 = i[2];
      v69 = i[3];
      v70 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v69 - v68) >> 3));
      if (v69 == v68)
        v71 = 0;
      else
        v71 = v70;
      std::__introsort<std::_ClassicAlgPolicy,-[GEOTileLoader _requestOnlineTiles]::$_3 &,geo::Batch::KeyInfo *,false>(v68, v69, v71, 1);
      geo::BatchLoadHelper::BatchLoadHelper((uint64_t)v89, (__int128 **)i + 2);
      v72 = (id)i[8];
      +[GEOApplicationAuditToken compositeTokenForTokens:](GEOApplicationAuditToken, "compositeTokenForTokens:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetTileLoadingLog();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        v75 = v89[4];
        v76 = objc_msgSend(v75, "count");
        v77 = *((_DWORD *)i + 13);
        v78 = objc_opt_class();
        *(_DWORD *)v100 = 134218754;
        v101 = v76;
        v102 = 1024;
        v103 = v77;
        v104 = 2112;
        v105 = v73;
        v106 = 2112;
        v107 = v78;
        _os_log_impl(&dword_1885A9000, v74, OS_LOG_TYPE_INFO, "Submitting batch of size %zu for provider %d and clients %@ to (%@)", v100, 0x26u);

        v1 = v88;
      }

      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3321888768;
      v94 = __36__GEOTileLoader__requestOnlineTiles__block_invoke;
      v95 = &__block_descriptor_64_ea8_32c49_ZTSKZ36__GEOTileLoader__requestOnlineTiles_E3__4_e5_v8__0l;
      v79 = (id)v1;
      v80 = v73;
      v96 = v79;
      v97 = v89;
      v98 = i + 2;
      v99 = v80;
      v81 = v80;
      v82 = v79;
      v83 = (void (**)(_QWORD))dispatch_block_create_with_voucher_and_qos_class();

      v83[2](v83);
      geo::BatchLoadHelper::~BatchLoadHelper(v89);
    }
    std::__list_imp<geo::Batch>::clear((uint64_t *)&v90);
  }
}

- (uint64_t)_requestOnlineTiles
{
    return a1 + 8;
  else
    return 0;
}

- (void)_loadedTileForLocalKey:(uint64_t)a3 preliminary:(int)a4 quickly:(int)a5 tileDecoder:(void *)a6 data:(void *)a7 disburseTile:(void *)a8
{
  uint64_t v11;
  uint64_t v12;
  id v14;
  char v15;
  uint64_t v16;
  LoadItem *v17;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  unint64_t v27;
  int v28;
  uint64_t v29;
  id v30;
  GEOTileData *v31;
  GEOTileData *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *p_super;
  void *v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  GEOTileData *v50;
  id v51;
  GEOTileLoader *v52;
  id v53;
  __int128 v54;
  uint8_t buf[4];
  id v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[24];
  _BYTE *v60;
  __int128 v61;
  uint64_t v62;

  v11 = a3;
  v12 = a2;
  v62 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v61 = a2;
  *((_QWORD *)&v61 + 1) = a3;
  v14 = a6;
  v39 = a7;
  v40 = a8;
  if (a1)
  {
    v38 = v14;
    _pruneErrors(a1);
    v15 = v12;
    v16 = (uint64_t)a1->_internal + 8;
    do
    {
      v16 = *(_QWORD *)(v16 + 8);
      if ((GEOTileLoaderInternal *)v16 == (GEOTileLoaderInternal *)((char *)a1->_internal + 8))
      {
        v19 = 0;
        v14 = v38;
        goto LABEL_30;
      }
      v17 = (LoadItem *)(v16 + 16);
    }
    while ((_QWORD)v61 != *(_QWORD *)(v16 + 16) || *((_QWORD *)&v61 + 1) != *(_QWORD *)(v16 + 24));
    if (a4)
    {
      *(_DWORD *)(v16 + 44) = 4;
      goto LABEL_26;
    }
    *(_DWORD *)(v16 + 40) = 4;
    if (*(_DWORD *)(v16 + 44) != 1)
    {
LABEL_26:
      v27 = LoadItem::options(v17);
      if ((v27 & 4) != 0)
      {

        v14 = 0;
        a5 = 1;
      }
      else
      {
        v14 = v38;
      }
      v19 = (v27 >> 2) & 1;
      if ((LoadItem::options(v17) & 0x60) != 0)
        goto LABEL_32;
LABEL_30:
      if (a4)
      {

        v14 = 0;
        v15 = v61;
        v19 = 1;
        v28 = 1;
        v11 = *((_QWORD *)&v61 + 1);
        v12 = v61;
        goto LABEL_33;
      }
LABEL_32:
      v28 = a5;
LABEL_33:
      v29 = -97;
      if ((v15 & 0x60) == 0)
        v29 = -1;
      *(_QWORD *)&v57 = v29 & v12;
      *((_QWORD *)&v57 + 1) = v11;
      if (v14 && !v28)
      {
        v46 = MEMORY[0x1E0C809B0];
        v47 = 3221225472;
        v48 = __90__GEOTileLoader__loadedTileForLocalKey_preliminary_quickly_tileDecoder_data_disburseTile___block_invoke;
        v49 = &unk_1E1C002B8;
        v50 = (GEOTileData *)v39;
        v30 = v14;
        v54 = v57;
        v51 = v30;
        v52 = a1;
        v53 = v40;
        geo_dispatch_async_qos();

        v31 = v50;
LABEL_49:

        goto LABEL_50;
      }
      v32 = (GEOTileData *)v39;
      v31 = v32;
      if (!v14)
      {
LABEL_48:
        (*((void (**)(id, GEOTileData *, uint64_t))v40 + 2))(v40, v31, v19);
        goto LABEL_49;
      }
      v41 = 0;
      -[GEOTileData readDataWithError:](v32, "readDataWithError:", &v41);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v41;
      if (v33)
      {
        objc_msgSend(v14, "decodeTile:forKey:", v33, &v57);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          p_super = &v31->super;
          v31 = -[GEOTileData initWithDecodedRepresentation:]([GEOTileData alloc], "initWithDecodedRepresentation:", v35);
LABEL_47:

          goto LABEL_48;
        }
        p_super = &v31->super;
      }
      else
      {
        GEOGetTileLoadingLog();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v34;
          _os_log_impl(&dword_1885A9000, p_super, OS_LOG_TYPE_ERROR, "Failed to read supposedly-loaded tile from disk: %@", buf, 0xCu);
        }
        v35 = v31;
      }
      v31 = 0;
      goto LABEL_47;
    }
    *(_DWORD *)(v16 + 44) = 3;
    buf[0] = 0;
    *(_QWORD *)&v57 = 0;
    v20 = (char *)operator new(0x28uLL);
    *(_QWORD *)v20 = &off_1E1BFA548;
    *(_OWORD *)(v20 + 8) = v61;
    *((_QWORD *)v20 + 3) = &v57;
    *((_QWORD *)v20 + 4) = buf;
    v60 = v20;
    LoadItem::foreachRequester(*(_QWORD *)(v16 + 96), (uint64_t)v59);
    v21 = v60;
    if (v60 == v59)
    {
      v22 = 4;
      v21 = v59;
    }
    else
    {
      if (!v60)
      {
LABEL_18:
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v23 = (id)v57;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v43 != v25)
                objc_enumerationMutation(v23);
              LoadItem::deleteRequester((int8x8_t *)v17, *(NSString **)(*((_QWORD *)&v42 + 1) + 8 * i), 0, 0);
            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
          }
          while (v24);
        }

        goto LABEL_26;
      }
      v22 = 5;
    }
    (*(void (**)(void))(*v21 + 8 * v22))();
    goto LABEL_18;
  }
LABEL_50:

}

void __41__GEOTileLoader__loadedTile_forKey_info___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  _OWORD *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _BYTE *v15;
  id v16;
  NSObject *v17;
  id v18;
  _OWORD *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD *v26;
  _BYTE *v27;
  uint64_t v28;
  id v29;
  id v30;
  char *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  _BOOL4 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  __int128 v46;
  _BYTE v47[24];
  _BYTE *v48;
  __int128 v49;
  _BYTE v50[24];
  _BYTE *v51;
  _QWORD block[5];
  __int128 v53;
  uint8_t buf[8];
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  geo_assert_isolated();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("GEOTileLoadResultMaxAge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (_OWORD *)(a1 + 64);
  v8 = 31;
  if ((*(_BYTE *)(a1 + 64) & 0x60) == 0)
    v8 = 127;
  v9 = (v8 & *(_QWORD *)(a1 + 64)) == 2
    && (((unint64_t)*(unsigned __int16 *)(a1 + 77) << 32) & 0xFFFC00000000) == 0x15000000000;
  if (!v5 || (a3 & 1) != 0)
  {
    if (!v5)
    {
      if (qword_1ECDBB858 != -1)
        dispatch_once(&qword_1ECDBB858, &__block_literal_global_422);
      v16 = (id)qword_1ECDBB850;
      GEOGetTileLoadingLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157955;
        *(_DWORD *)&buf[4] = 16;
        LOWORD(v55) = 2097;
        *(_QWORD *)((char *)&v55 + 2) = a1 + 64;
        _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Tile key: %{private,geo:TileKey}.*P failed to decode", buf, 0x12u);
      }

      v18 = *(id *)(a1 + 32);
      v12 = v16;
      *(_QWORD *)buf = buf;
      *(_QWORD *)&v55 = buf;
      *((_QWORD *)&v55 + 1) = 0;
      v19 = operator new(0x20uLL);
      v19[1] = *v7;
      *(_QWORD *)v19 = buf;
      *((_QWORD *)v19 + 1) = buf;
      *(_QWORD *)buf = v19;
      *(_QWORD *)&v55 = v19;
      *((_QWORD *)&v55 + 1) = 1;
      _appendError(v18, v12, (uint64_t)buf);
      std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(buf);

      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(NSObject **)(v20 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_190;
      block[3] = &unk_1E1C00218;
      v53 = *v7;
      block[4] = v20;
      dispatch_async(v21, block);
      goto LABEL_19;
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 80))
      v10 = 0;
    else
      v10 = v6 == 0;
    if (!v10)
      v9 = 1;
    if (!v9)
    {
      v11 = 40;
      if ((*(_QWORD *)(a1 + 64) & 0x80) == 0)
        v11 = 32;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + v11), "setTile:forKey:cost:", v5, a1 + 64, *(_QWORD *)(a1 + 48));
    }
  }
  v12 = 0;
LABEL_19:
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8;
  while (1)
  {
    v13 = *(_QWORD *)(v13 + 8);
    if (v13 == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8)
      break;
    if (*(_QWORD *)v7 == *(_QWORD *)(v13 + 16) && *(_QWORD *)(a1 + 72) == *(_QWORD *)(v13 + 24))
    {
      *(_QWORD *)buf = v13;
      v15 = (_BYTE *)(a1 + 80);
      if (*(_BYTE *)(a1 + 80))
      {
        v44 = 0;
        if (v5)
        {
          v39 = 0;
          goto LABEL_35;
        }
        v39 = 0;
        *(_DWORD *)(v13 + 44) = 3;
LABEL_44:
        v46 = *v7;
        v29 = v12;
        v30 = *(id *)(a1 + 40);
        v31 = (char *)operator new(0x38uLL);
        *(_QWORD *)v31 = &off_1E1BFB150;
        *(_OWORD *)(v31 + 8) = v46;
        *((_QWORD *)v31 + 3) = v29;
        v24 = v30;
        *((_QWORD *)v31 + 4) = v24;
        *((_QWORD *)v31 + 5) = v15;
        *((_QWORD *)v31 + 6) = &v44;
        v48 = v31;
        LoadItem::foreachRequester(*(_QWORD *)(v13 + 96), (uint64_t)v47);
        v27 = v48;
        if (v48 != v47)
          goto LABEL_45;
        v28 = 4;
        v27 = v47;
LABEL_48:
        (*(void (**)(void))(*(_QWORD *)v27 + 8 * v28))();
      }
      else
      {
        v39 = (unint64_t)LoadItem::options((LoadItem *)(v13 + 16)) > 0x1FF;
        v44 = 0;
        if (!v5)
        {
          *(_DWORD *)(v13 + 40) = 3;
          goto LABEL_44;
        }
LABEL_35:
        v22 = *(id *)(a1 + 40);
        if (*(_BYTE *)(a1 + 80))
        {
          v23 = 112;
          if (a3)
            v23 = 136;
          geo::_retain_ptr<GEOTileData * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::reset(v13 + v23 + 16, v5);
          *(_DWORD *)(v13 + 44) = 5;
        }
        else
        {
          *(_DWORD *)(v13 + 40) = 5;
        }
        v24 = v22;
        v49 = *v7;
        v25 = v5;
        v26 = operator new(0x38uLL);
        *v26 = &off_1E1BFB0F8;
        v26[1] = v24;
        *((_OWORD *)v26 + 1) = v49;
        v26[4] = v25;
        v26[5] = v15;
        v26[6] = &v44;
        v51 = v26;
        LoadItem::foreachRequester(*(_QWORD *)(v13 + 96), (uint64_t)v50);
        v27 = v51;
        if (v51 == v50)
        {
          v28 = 4;
          v27 = v50;
          goto LABEL_48;
        }
LABEL_45:
        if (v27)
        {
          v28 = 5;
          goto LABEL_48;
        }
      }

      if (*v15)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v32 = v44;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v41 != v34)
                objc_enumerationMutation(v32);
              LoadItem::deleteRequester((int8x8_t *)(v13 + 16), *(NSString **)(*((_QWORD *)&v40 + 1) + 8 * i), 0, 0);
            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          }
          while (v33);
        }

        -[GEOTileLoader _cancelIfNeeded:](*(_QWORD *)(a1 + 32), (uint64_t **)buf);
      }
      else
      {
        -[GEOTileLoader _notifyObserversOfSuccess:sizeInBytes:source:options:](*(_QWORD *)(a1 + 32), (__int128 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(v13 + 48));
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
        v37 = *(uint64_t **)buf;
        v38 = **(_QWORD **)buf;
        *(_QWORD *)(v38 + 8) = *(_QWORD *)(*(_QWORD *)buf + 8);
        *(_QWORD *)v37[1] = v38;
        --*(_QWORD *)(v36 + 24);
        std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)(v37 + 2));
        operator delete(v37);
      }
      if (v39)
        geo_isolate_async();

      break;
    }
  }

}

- (void)_notifyObserversOfSuccess:(uint64_t)a3 sizeInBytes:(uint64_t)a4 source:(uint64_t)a5 options:
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    v18 = 0;
    v10 = MEMORY[0x1E0C809B0];
    v11 = MEMORY[0x1E0C809B0];
    geo_isolate_sync_data();
    if (objc_msgSend((id)v14[5], "count", v11, 3221225472, __70__GEOTileLoader__notifyObserversOfSuccess_sizeInBytes_source_options___block_invoke, &unk_1E1BFFF70, a1, &v13))
    {
      v28 = *a2;
      v19 = v10;
      v20 = 3221225472;
      v21 = __70__GEOTileLoader__notifyObserversOfSuccess_sizeInBytes_source_options___block_invoke_2;
      v22 = &unk_1E1BFFF98;
      v23 = a1;
      v24 = &v13;
      v25 = a3;
      v26 = a4;
      v27 = a5;
      geo_dispatch_async_qos();
    }
    _Block_object_dispose(&v13, 8);

  }
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_2(uint64_t a1)
{
  __int128 *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v8;
  unsigned int v9;
  void *v10;
  id v11;
  _OWORD *v12;
  uint64_t *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  uint64_t v29;
  id v30;
  BOOL v31;
  unsigned int *v32;
  unsigned int v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD *v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t *v50;
  unsigned int v51;
  unint64_t v53;
  NSObject *queue;
  unint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  _QWORD v58[5];
  __int128 v59;
  _QWORD v60[4];
  id v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  char v65;
  _QWORD v66[5];
  __int128 v67;
  _QWORD v68[5];
  __int128 v69;
  _QWORD v70[4];
  id v71;
  uint64_t v72;
  __int128 v73;
  _QWORD block[5];
  __int128 v75;
  _QWORD v76[5];
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v2 = (__int128 *)(a1 + 128);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = v3 & 0xFFFFFFFFFFFFFFFELL;
  if ((v3 & 4) != 0)
    v4 = v3 & 0xFFFFFFFFFFFFFFFELL ^ 4;
  if (*(char *)(a1 + 128) < 0)
    v5 = v4;
  else
    v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8;
  do
  {
    v6 = *(_QWORD *)(v6 + 8);
    if (v6 == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8)
    {
      v57 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8);
      v10 = (void *)MEMORY[0x18D764E2C]();
      if ((*(_BYTE *)v2 & 0x7F) == 8)
      {
        if ((v5 & 4) == 0)
        {
          if ((*(_QWORD *)(a1 + 129) & 0x4000000000000000) != 0)
          {
            v11 = 0;
            goto LABEL_59;
          }
          goto LABEL_34;
        }
      }
      else if ((v5 & 4) == 0)
      {
LABEL_34:
        v18 = 32;
        if (*(char *)v2 < 0)
          v18 = 40;
        v19 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + v18);
        objc_msgSend(v19, "tileForKey:", v2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v20;
        v21 = v20 != 0;
        if (v20)
          v22 = objc_msgSend(v20, "length");
        else
          v22 = 0;

        goto LABEL_50;
      }
      v56 = 0;
      v21 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 32), "containsKey:cost:", v2, &v56);
      v11 = 0;
      if (v21)
        v22 = v56;
      else
        v22 = 0;
LABEL_50:
      if (v21)
        v31 = (v5 & 0x40) == 0;
      else
        v31 = 1;
      if (!v31)
      {
        v35 = *(NSObject **)(a1 + 56);
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_7;
        v66[3] = &unk_1E1C000B0;
        v66[4] = *(_QWORD *)(a1 + 72);
        v67 = *v2;
        dispatch_async(v35, v66);
        v36 = *(_QWORD *)(a1 + 32);
        _cacheMissErr();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOTileLoader _notifyObserversOfFailure:error:options:](v36, v2, v37, *(_QWORD *)(a1 + 80));
        goto LABEL_65;
      }
      if (v21)
      {
        v32 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 80);
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 + 1, v32));
        v34 = *(NSObject **)(a1 + 56);
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_8;
        v60[3] = &unk_1E1C000D8;
        v62 = *(_QWORD *)(a1 + 72);
        v64 = *v2;
        v11 = v11;
        v61 = v11;
        v63 = v22;
        v65 = 0;
        dispatch_async(v34, v60);
        -[GEOTileLoader _notifyObserversOfSuccess:sizeInBytes:source:options:](*(_QWORD *)(a1 + 32), v2, objc_msgSend(v11, "length"), 0, *(_QWORD *)(a1 + 80));
        v37 = v61;
        goto LABEL_65;
      }
LABEL_59:
      if ((v5 & 3) != 0)
      {
        v38 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
        v39 = operator new(0xB0uLL);
        *v39 = 0;
        v39[1] = 0;
        *((_OWORD *)v39 + 1) = *v2;
        GEOMachAbsoluteTimeGetCurrent();
        v39[4] = v40;
        *((_DWORD *)v39 + 10) = 0;
        v39[6] = 0;
        *((_OWORD *)v39 + 5) = 0u;
        *((_OWORD *)v39 + 6) = 0u;
        *((_DWORD *)v39 + 28) = 1065353216;
        *((_DWORD *)v39 + 30) = 0;
        v39[16] = &off_1E1BF6400;
        v39[17] = 0;
        v39[19] = &off_1E1BF6400;
        v39[20] = 0;
        v39[1] = v38 + 8;
        v41 = *(_QWORD *)(v38 + 8);
        *v39 = v41;
        *(_QWORD *)(v41 + 8) = v39;
        *(_QWORD *)(v38 + 8) = v39;
        ++*(_QWORD *)(v38 + 24);
        if (*(_BYTE *)(a1 + 145))
          v42 = (_OWORD *)(a1 + 108);
        else
          v42 = 0;
        LoadItem::addRequester(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8) + 16, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72), v5, *(_BYTE *)(a1 + 144), *(double *)(a1 + 96), *(_DWORD *)(a1 + 104), v42, *(_DWORD *)(a1 + 124), *(_QWORD *)(a1 + 88));
        objc_msgSend(*(id *)(a1 + 32), "_scheduleCoalesceTimer");
        goto LABEL_66;
      }
      v43 = *(NSObject **)(a1 + 56);
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_9;
      v58[3] = &unk_1E1C000B0;
      v58[4] = *(_QWORD *)(a1 + 72);
      v59 = *v2;
      dispatch_async(v43, v58);
      v44 = *(_QWORD *)(a1 + 32);
      _cacheMissErr();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOTileLoader _notifyObserversOfFailure:error:options:](v44, v2, v37, *(_QWORD *)(a1 + 80));
LABEL_65:

LABEL_66:
      objc_autoreleasePoolPop(v10);
      return;
    }
  }
  while (*(_QWORD *)v2 != *(_QWORD *)(v6 + 16) || *(_QWORD *)(a1 + 136) != *(_QWORD *)(v6 + 24));
  v57 = (uint64_t *)v6;
  if (*(_QWORD *)(v6 + 104) && (v8 = *(uint64_t **)(v6 + 96)) != 0)
  {
    v9 = 0;
    do
    {
      if (*((_DWORD *)v8 + 39) > v9)
        v9 = *((_DWORD *)v8 + 39);
      v8 = (uint64_t *)*v8;
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v55 = LoadItem::options((LoadItem *)(v6 + 16));
  if (*(_BYTE *)(a1 + 145))
    v12 = (_OWORD *)(a1 + 108);
  else
    v12 = 0;
  v13 = LoadItem::addRequester(v6 + 16, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72), v5, *(_BYTE *)(a1 + 144), *(double *)(a1 + 96), *(_DWORD *)(a1 + 104), v12, *(_DWORD *)(a1 + 124), *(_QWORD *)(a1 + 88));
  v14 = *(_DWORD *)(v6 + 40);
  if ((-[GEOTileLoader _cancelIfNeeded:](*(_QWORD *)(a1 + 32), &v57) & 1) == 0)
  {
    if ((v5 & 3) == 0)
    {
      LoadItem::deleteRequester((int8x8_t *)(v6 + 16), *(NSString **)(a1 + 40), 0, 0);
      v23 = *(NSObject **)(a1 + 56);
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_3;
      v76[3] = &unk_1E1C000B0;
      v76[4] = *(_QWORD *)(a1 + 72);
      v77 = *v2;
      dispatch_async(v23, v76);
      v24 = *(_QWORD *)(a1 + 32);
      _cacheMissErr();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOTileLoader _notifyObserversOfFailure:error:options:](v24, v2, v25, *(_QWORD *)(a1 + 80));

      return;
    }
    if ((v5 & 2) == 0 && v14 == 2)
    {
      LoadItem::deleteRequester((int8x8_t *)(v6 + 16), *(NSString **)(a1 + 40), 0, 0);
      v15 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_4;
      block[3] = &unk_1E1C000B0;
      block[4] = *(_QWORD *)(a1 + 72);
      v75 = *v2;
      dispatch_async(v15, block);
      v16 = *(_QWORD *)(a1 + 32);
      _noNetErr();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOTileLoader _notifyObserversOfFailure:error:options:](v16, v2, v17, *(_QWORD *)(a1 + 80));

      return;
    }
    v26 = *(void **)(v6 + 136);
    if (v26 && (v5 & 0x60) != 0)
    {
      v27 = v26;
      if ((v5 & 0x40) != 0)
        LoadItem::deleteRequester((int8x8_t *)(v6 + 16), *(NSString **)(a1 + 40), 0, 0);
      v28 = (v5 & 0x40) == 0;
      queue = *(NSObject **)(a1 + 56);
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_5;
      v70[3] = &unk_1E1C00038;
      v29 = *(_QWORD *)(a1 + 72);
      v73 = *v2;
      v71 = v27;
      v72 = v29;
      v30 = v27;
      dispatch_async(queue, v70);

      if (v28)
        goto LABEL_72;
    }
    else
    {
      v45 = *(id *)(v6 + 160);

      if (v45 && (v5 & 0x60) != 0)
      {
        v46 = *(id *)(v6 + 160);
        geo::_retain_ptr<GEOTileData * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::reset(v6 + 152, 0);
        objc_msgSend(*(id *)(a1 + 32), "_decodePreliminaryTileData:forKey:", v46, v2);

      }
      if ((v5 & 0x40) != 0)
      {
        if (*(_DWORD *)(v6 + 44) == 3)
        {
          LoadItem::deleteRequester((int8x8_t *)(v6 + 16), *(NSString **)(a1 + 40), 0, 0);
          v47 = *(NSObject **)(a1 + 56);
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_6;
          v68[3] = &unk_1E1C000B0;
          v68[4] = *(_QWORD *)(a1 + 72);
          v69 = *v2;
          dispatch_async(v47, v68);
          v48 = *(_QWORD *)(a1 + 32);
          _cacheMissErr();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOTileLoader _notifyObserversOfFailure:error:options:](v48, v2, v49, *(_QWORD *)(a1 + 80));

          return;
        }
      }
      else
      {
LABEL_72:
        if (v14 == 2)
          LoadItem::Requester::fireBeginNetwork((LoadItem::Requester *)v13);
      }
      if (*(_QWORD *)(v6 + 104) && (v50 = *(uint64_t **)(v6 + 96)) != 0)
      {
        v51 = 0;
        do
        {
          if (*((_DWORD *)v50 + 39) > v51)
            v51 = *((_DWORD *)v50 + 39);
          v50 = (uint64_t *)*v50;
        }
        while (v50);
      }
      else
      {
        v51 = 0;
      }
      if (v9 != v51 && (v14 - 1) <= 1)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "reprioritizeKey:newPriority:batchID:", v2);
      v53 = LoadItem::options((LoadItem *)(v6 + 16));
      if (v55 >= 0x200 && v53 <= 0x1FF)
        objc_msgSend(*(id *)(a1 + 32), "_scheduleCoalesceTimer");
    }
  }
}

- (void)_scheduleCoalesceTimer
{
  GEOTileLoaderInternal *internal;
  _QWORD *v3;
  dispatch_qos_class_t v4;
  uint64_t *v5;
  dispatch_qos_class_t v6;
  uint64_t *v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_block_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  _QWORD block[5];

  if (self->_coalesceTimerEnabled)
  {
    internal = self->_internal;
    v3 = (_QWORD *)*((_QWORD *)internal + 2);
    if (v3 == (_QWORD *)((char *)internal + 8))
    {
      v8 = *((_QWORD *)internal + 6);
      if (*(_DWORD *)(v8 + 48) == 21)
        goto LABEL_22;
      v4 = QOS_CLASS_DEFAULT;
      *(_DWORD *)(v8 + 48) = 21;
    }
    else
    {
      v4 = QOS_CLASS_DEFAULT;
      do
      {
        if (v3[13])
        {
          v5 = (uint64_t *)v3[12];
          if (v5)
          {
            v6 = QOS_CLASS_UNSPECIFIED;
            v7 = (uint64_t *)v3[12];
            do
            {
              if (v6 <= *((_DWORD *)v7 + 45))
                v6 = *((_DWORD *)v7 + 45);
              v7 = (uint64_t *)*v7;
            }
            while (v7);
            if (v4 <= v6)
            {
              v4 = QOS_CLASS_UNSPECIFIED;
              do
              {
                if (v4 <= *((_DWORD *)v5 + 45))
                  v4 = *((_DWORD *)v5 + 45);
                v5 = (uint64_t *)*v5;
              }
              while (v5);
            }
          }
        }
        v3 = (_QWORD *)v3[1];
      }
      while (v3 != (_QWORD *)((char *)internal + 8));
      v8 = *((_QWORD *)internal + 6);
      if (*(_DWORD *)(v8 + 48) == v4)
        goto LABEL_22;
      *(_DWORD *)(v8 + 48) = v4;
      if (v4 == QOS_CLASS_UNSPECIFIED)
      {
        v9 = *(NSObject **)(v8 + 8);
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = ___ZN3geo13DispatchTimer8scheduleEyy11qos_class_t_block_invoke_2;
        v13[3] = &__block_descriptor_40_e5_v8__0l;
        v13[4] = v8;
        dispatch_source_set_event_handler(v9, v13);
LABEL_22:
        v11 = *(NSObject **)(v8 + 8);
        v12 = dispatch_time(0, 5000000);
        dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0xC350uLL);
        return;
      }
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN3geo13DispatchTimer8scheduleEyy11qos_class_t_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v8;
    v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v8 + 8), v10);

    goto LABEL_22;
  }
}

- (void)_loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:
{
}

- (uint64_t)_cancelIfNeeded:(uint64_t)result
{
  uint64_t v3;
  uint64_t *v4;
  char v5;
  int v6;
  uint64_t v7;
  void *v11;

  if (result)
  {
    v3 = result;
    v4 = *a2;
    v5 = LoadItem::options((LoadItem *)(*a2 + 2));
    if (v4[13])
    {
      v6 = *((_DWORD *)v4 + 10);
      v7 = v5 & 2;
      if (v6 == 1 && (v5 & 1) == 0 && v7 == 0)
      {
        _cacheMissErr();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOTileLoader _cancel:err:](v3, a2, v11);
      }
      else
      {
        if (v6 != 2 || v7 != 0)
          return 0;
        _noNetErr();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOTileLoader _cancel:err:](v3, a2, v11);
      }
    }
    else
    {
      _cancelErr();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOTileLoader _cancel:err:](v3, a2, v11);
    }

    return 1;
  }
  return result;
}

- (void)_requestOnlineTiles
{
}

- (void)proxyDidDownloadRegionalResources:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GEOTileLoader_proxyDidDownloadRegionalResources___block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __36__GEOTileLoader__requestOnlineTiles__block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v1 = (_QWORD *)a1[5];
  v2 = a1[6];
  LOBYTE(v4) = *(_BYTE *)(v2 + 32);
  return objc_msgSend(*(id *)(a1[4] + 40), "loadTiles:batchID:priorities:hasAdditionalInfos:additionalInfos:signpostIDs:createTimes:reason:options:auditToken:", v1[4], *(unsigned int *)(v2 + 64), *v1, v1[1], v1[2], v1[3], v1[5], v4, *(_QWORD *)(v2 + 24), a1[7]);
}

- (void)_cancel:(void *)a3 err:
{
  id v5;
  uint64_t *v6;
  NSObject *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  _QWORD v17[3];
  _QWORD *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  __int128 *v22;
  __int16 v23;
  id v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *a2;
  v25 = *((_OWORD *)*a2 + 1);
  GEOGetTileLoadingLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68158211;
    v20 = 16;
    v21 = 2097;
    v22 = &v25;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "_cancel %{private,geo:TileKey}.*P error: %@", buf, 0x1Cu);
  }

  if ((*((_DWORD *)v6 + 10) - 1) <= 1)
    objc_msgSend(*(id *)(a1 + 40), "cancel:batchID:", &v25, *((unsigned int *)v6 + 30));
  if (!v5)
  {
    _cancelErr();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __29__GEOTileLoader__cancel_err___block_invoke;
  v14[3] = &unk_1E1C00060;
  v16 = v25;
  v8 = v5;
  v15 = v8;
  v17[0] = &off_1E1BFA2E0;
  v17[1] = MEMORY[0x18D765024](v14);
  v18 = v17;
  LoadItem::foreachRequester(v6[12], (uint64_t)v17);
  v9 = v18;
  if (v18 == v17)
  {
    v10 = 4;
    v9 = v17;
    goto LABEL_11;
  }
  if (v18)
  {
    v10 = 5;
LABEL_11:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  v11 = *(_QWORD *)(a1 + 112);
  v12 = *a2;
  v13 = *v12;
  *(_QWORD *)(v13 + 8) = v12[1];
  *(_QWORD *)v12[1] = v13;
  --*(_QWORD *)(v11 + 24);
  std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)(v12 + 2));
  operator delete(v12);

}

void __51__GEOTileLoader_proxyDidDownloadRegionalResources___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GEOTileLoaderDidUpdateRegionalResourcesNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __32__GEOTileLoader_closeForClient___block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 24), "count");
  objc_msgSend(*(id *)(a1[4] + 24), "removeObject:", a1[5]);
  result = objc_msgSend(*(id *)(a1[4] + 24), "count");
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (void)closeForClient:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v5 = v4;
  v7 = v5;
  geo_isolate_sync_data();
  if (!v9[3] && v13[3])
    -[GEOTileServerProxy close](self->_proxy, "close", v6, 3221225472, __32__GEOTileLoader_closeForClient___block_invoke, &unk_1E1C00010, self, v5, &v12, &v8);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

}

- (void)openForClient:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4 = a3;
  geo_isolate_sync_data();
  if (!v6[3])
    -[GEOTileServerProxy open](self->_proxy, "open");

  _Block_object_dispose(&v5, 8);
}

+ (id)modernLoaderForResourceManifestConfiguration:(id)a3 locale:(id)a4
{
  GEOResourceManifestConfiguration *v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v6 = (GEOResourceManifestConfiguration *)a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = -[GEOResourceManifestConfiguration isDefaultConfiguration](v6, "isDefaultConfiguration");
    if (v8)
      v10 = 0;
    else
      v10 = v9;
    if (v10)
      goto LABEL_15;
  }
  else
  {
    if (!v7)
    {
LABEL_15:
      objc_msgSend(a1, "modernLoader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    v6 = objc_alloc_init(GEOResourceManifestConfiguration);
  }
  if (qword_1ECDBB818 != -1)
    dispatch_once(&qword_1ECDBB818, &__block_literal_global_99);
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_175);
  objc_msgSend((id)qword_1ECDBB810, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECDBB810, "setObject:forKey:", v11, v6);
  }
  if (v8)
  {
    v12 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v12;
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[GEOTileLoader singletonConfiguration]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(v16, "setManifestConfiguration:", v6);
    objc_msgSend(v16, "setLocale:", v8);
    objc_msgSend(v16, "manifestConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isDefaultConfiguration");
    if (v8)
      v19 = 0;
    else
      v19 = v18;

    if ((v19 & 1) == 0)
    {
      objc_msgSend(v16, "manifestConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataDirectoryFor:", 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "localeIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("loc_%@"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByAppendingPathComponent:", v24);
        v25 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v25;
      }
      objc_msgSend(v16, "diskCacheLocation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "stringByAppendingPathComponent:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDiskCacheLocation:", v28);

      objc_msgSend(v16, "diskCacheExternalLocation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "stringByAppendingPathComponent:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDiskCacheExternalLocation:", v31);

    }
    v13 = -[GEOTileLoader initWithConfiguration:serverProxy:]([GEOTileLoader alloc], v16);
    objc_msgSend(v11, "setObject:forKey:", v13, v14);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_175);

LABEL_27:
  return v13;
}

+ (id)modernLoader
{
  if (qword_1ECDBB808 != -1)
    dispatch_once(&qword_1ECDBB808, &__block_literal_global_97);
  return (id)qword_1ECDBB7F0;
}

- (id)initWithConfiguration:(id)a1 serverProxy:(void *)a2
{
  id v3;
  uint64_t v4;
  void *v5;
  GEOTileLoaderInternal *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t (***v22)();
  uint64_t (***v23)();
  uint64_t (***v24)();
  uint64_t v25;
  dispatch_source_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t (***v30)();
  uint64_t v31;
  id v32;
  void *v33;
  GEOTilePool *v34;
  uint64_t v35;
  void *v36;
  GEOTilePool *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id to;
  id location;
  objc_super v57;
  uint64_t (**v58)();
  id v59;
  uint64_t (***v60)();
  _QWORD handler[3];
  uint64_t (***v62)();
  uint64_t v63;
  _QWORD v64[4];

  v64[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_31;
  v57.receiver = a1;
  v57.super_class = (Class)GEOTileLoader;
  a1 = objc_msgSendSuper2(&v57, sel_init);
  if (!a1)
    goto LABEL_31;
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)*((_QWORD *)a1 + 10);
  *((_QWORD *)a1 + 10) = v4;

  v6 = objc_alloc_init(GEOTileLoaderInternal);
  v7 = (void *)*((_QWORD *)a1 + 14);
  *((_QWORD *)a1 + 14) = v6;

  v8 = geo_dispatch_queue_create_with_format();
  v9 = (void *)*((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v8;

  v10 = geo_isolater_create_with_format();
  v11 = (void *)*((_QWORD *)a1 + 1);
  *((_QWORD *)a1 + 1) = v10;

  v12 = geo_isolater_create_with_format();
  v13 = (void *)*((_QWORD *)a1 + 7);
  *((_QWORD *)a1 + 7) = v12;

  v14 = geo_isolater_create_with_format();
  v15 = (void *)*((_QWORD *)a1 + 4);
  *((_QWORD *)a1 + 4) = v14;

  v16 = geo_isolater_create_with_format();
  v17 = (void *)*((_QWORD *)a1 + 16);
  *((_QWORD *)a1 + 16) = v16;

  *((_BYTE *)a1 + 104) = 1;
  objc_initWeak(&location, a1);
  v18 = *((_QWORD *)a1 + 14);
  v19 = operator new();
  v20 = (void *)*((_QWORD *)a1 + 2);
  objc_copyWeak(&to, &location);
  v60 = 0;
  v58 = &off_1E1BFA498;
  objc_moveWeak(&v59, &to);
  v60 = &v58;
  objc_destroyWeak(&to);
  v21 = v20;
  *(_QWORD *)v19 = &off_1E1BF6560;
  *(_QWORD *)(v19 + 8) = 0;
  v22 = (uint64_t (***)())(v19 + 16);
  *(_QWORD *)(v19 + 40) = 0;
  v23 = v60;
  if (!v60)
    goto LABEL_6;
  if (v60 != &v58)
  {
    v23 = (uint64_t (***)())((uint64_t (*)(uint64_t (***)()))(*v60)[2])(v60);
LABEL_6:
    v62 = v23;
    goto LABEL_8;
  }
  v62 = (uint64_t (***)())handler;
  ((void (*)(uint64_t, uint64_t))v58[3])((uint64_t)&v58, (uint64_t)handler);
  v23 = v62;
LABEL_8:
  v24 = *(uint64_t (****)())(v19 + 40);
  if (v23 == handler)
  {
    if (v24 == v22)
    {
      (*(void (**)(_QWORD *, _QWORD *))(handler[0] + 24))(handler, v64);
      ((void (*)(uint64_t (***)()))(*v62)[4])(v62);
      v62 = 0;
      (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)(v19 + 40) + 24))(*(_QWORD *)(v19 + 40), handler);
      (*(void (**)(_QWORD))(**(_QWORD **)(v19 + 40) + 32))(*(_QWORD *)(v19 + 40));
      *(_QWORD *)(v19 + 40) = 0;
      v62 = (uint64_t (***)())handler;
      (*(void (**)(_QWORD *, uint64_t))(v64[0] + 24))(v64, v19 + 16);
      (*(void (**)(_QWORD *))(v64[0] + 32))(v64);
      *(_QWORD *)(v19 + 40) = v22;
      v24 = v62;
    }
    else
    {
      (*(void (**)(_QWORD *, uint64_t))(handler[0] + 24))(handler, v19 + 16);
      ((void (*)(uint64_t (***)()))(*v62)[4])(v62);
      v24 = *(uint64_t (****)())(v19 + 40);
      v62 = v24;
      *(_QWORD *)(v19 + 40) = v22;
    }
  }
  else
  {
    if (v24 == v22)
    {
      v24 = (uint64_t (***)())handler;
      ((void (*)(uint64_t, _QWORD *))(*v22)[3])(v19 + 16, handler);
      (*(void (**)(_QWORD))(**(_QWORD **)(v19 + 40) + 32))(*(_QWORD *)(v19 + 40));
      *(_QWORD *)(v19 + 40) = v62;
      v62 = (uint64_t (***)())handler;
      v25 = 4;
      goto LABEL_19;
    }
    v62 = *(uint64_t (****)())(v19 + 40);
    *(_QWORD *)(v19 + 40) = v23;
  }
  if (v24 == handler)
  {
    v25 = 4;
    v24 = (uint64_t (***)())handler;
  }
  else
  {
    if (!v24)
      goto LABEL_20;
    v25 = 5;
  }
LABEL_19:
  ((void (*)(uint64_t (***)()))(*v24)[v25])(v24);
LABEL_20:
  *(_DWORD *)(v19 + 48) = 0;
  v26 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v21);
  v27 = *(void **)(v19 + 8);
  *(_QWORD *)(v19 + 8) = v26;

  dispatch_source_set_timer(*(dispatch_source_t *)(v19 + 8), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  v28 = *(NSObject **)(v19 + 8);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = ___ZN3geo13DispatchTimerC2EPU28objcproto17OS_dispatch_queue8NSObjectNSt3__18functionIFvvEEE_block_invoke;
  v62 = (uint64_t (***)())&__block_descriptor_40_e5_v8__0l;
  v63 = v19;
  dispatch_source_set_event_handler(v28, handler);
  dispatch_activate(*(dispatch_object_t *)(v19 + 8));

  v29 = *(_QWORD *)(v18 + 48);
  *(_QWORD *)(v18 + 48) = v19;
  if (v29)
    (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  v30 = v60;
  if (v60 == &v58)
  {
    v31 = 4;
    v30 = &v58;
  }
  else
  {
    if (!v60)
      goto LABEL_27;
    v31 = 5;
  }
  ((void (*)(uint64_t (***)()))(*v30)[v31])(v30);
LABEL_27:
  v32 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = (void *)*((_QWORD *)a1 + 3);
  *((_QWORD *)a1 + 3) = v32;

  if (objc_msgSend(v3, "memoryCacheCountLimit", a1) && objc_msgSend(v3, "memoryCacheCostLimit"))
  {
    v34 = objc_alloc_init(GEOTilePool);
    v35 = *((_QWORD *)a1 + 14);
    v36 = *(void **)(v35 + 32);
    *(_QWORD *)(v35 + 32) = v34;

    v37 = objc_alloc_init(GEOTilePool);
    v38 = *((_QWORD *)a1 + 14);
    v39 = *(void **)(v38 + 40);
    *(_QWORD *)(v38 + 40) = v37;

    objc_msgSend(*(id *)(*((_QWORD *)a1 + 14) + 32), "setMaxCapacity:", objc_msgSend(v3, "memoryCacheCountLimit"));
    objc_msgSend(*(id *)(*((_QWORD *)a1 + 14) + 40), "setMaxCapacity:", objc_msgSend(v3, "memoryCacheCountLimit"));
    objc_msgSend(*(id *)(*((_QWORD *)a1 + 14) + 32), "setMaxCost:", objc_msgSend(v3, "memoryCacheCostLimit"));
    objc_msgSend(*(id *)(*((_QWORD *)a1 + 14) + 40), "setMaxCost:", objc_msgSend(v3, "memoryCacheCostLimit"));
  }
  v40 = objc_alloc((Class)objc_msgSend(v3, "serverProxyClass"));
  objc_msgSend(v3, "diskCacheLocation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diskCacheExternalLocation");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manifestConfiguration");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locale");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v40, "initWithCacheDBLocation:cacheFilesLocation:manifestConfiguration:locale:delegateQueue:delegate:", v41, v42, v43, v44, *((_QWORD *)a1 + 2), a1);
  v46 = (void *)*((_QWORD *)a1 + 5);
  *((_QWORD *)a1 + 5) = v45;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObserver:selector:name:object:", a1, sel__tileEditionChanged_, CFSTR("GEOTileDBEditionUpgradeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObserver:selector:name:object:", a1, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObserver:selector:name:object:", a1, sel__offlineStateChanged_, CFSTR("GEOOfflineStateChangedNotification"), 0);

  objc_msgSend(v3, "manifestConfiguration");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addTileGroupObserver:queue:", a1, MEMORY[0x1E0C80D38]);

  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addExperimentObserver:queue:", a1, MEMORY[0x1E0C80D38]);

  dispatch_get_global_queue(21, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  GEORegisterPListStateCaptureLegacy();

  objc_destroyWeak(&location);
LABEL_31:

  return a1;
}

- (void)initWithConfiguration:serverProxy:
{
}

- (void)registerTileDecoder:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = v4;
    geo_isolate_sync_data();
    -[GEOTileLoader clearAllCaches](self, "clearAllCaches");

    v4 = v5;
  }

}

- (GEOTileLoader)initWithConfiguration:(id)a3
{
  return (GEOTileLoader *)-[GEOTileLoader initWithConfiguration:serverProxy:](self, a3);
}

- (void)clearAllCaches
{
  objc_msgSend(*((id *)self->_internal + 4), "removeAllObjects");
  objc_msgSend(*((id *)self->_internal + 5), "removeAllObjects");
}

void __39__GEOTileLoader_singletonConfiguration__block_invoke()
{
  GEOTileLoaderConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(GEOTileLoaderConfiguration);
  v1 = (void *)qword_1ECDBB800;
  qword_1ECDBB800 = (uint64_t)v0;

}

- (unint64_t)calculateFreeableSizeSync
{
  return -[GEOTileServerProxy calculateFreeableSizeSync](self->_proxy, "calculateFreeableSizeSync");
}

- (void)cancelKey:(uint64_t)a3 forClient:(void *)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  geo_isolate_async();

}

void __47__GEOTileLoader_proxy_willGoToNetworkForTiles___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *j;
  NSString *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[24];
  _BYTE *v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = v32;
    v32 = v2;

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v4);
        v35 = *(_OWORD *)*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8;
        while (1)
        {
          v8 = *(_QWORD *)(v8 + 8);
          if (v8 == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8)
            break;
          if ((_QWORD)v35 == *(_QWORD *)(v8 + 16) && *((_QWORD *)&v35 + 1) == *(_QWORD *)(v8 + 24))
          {
            v26 = 0;
            v27 = (uint64_t *)v8;
            v24 = (uint64_t)&v24;
            v25 = &v24;
            *(_DWORD *)(v8 + 40) = 2;
            if (*(_DWORD *)(v8 + 44) == 1)
              *(_DWORD *)(v8 + 44) = 3;
            v34 = 0;
            v10 = operator new(0x28uLL);
            *v10 = &off_1E1BFB1A8;
            v10[1] = &v24;
            *((_OWORD *)v10 + 1) = v35;
            v10[4] = &v32;
            v34 = v10;
            LoadItem::foreachRequester(*(_QWORD *)(v8 + 96), (uint64_t)v33);
            v11 = v34;
            if (v34 == v33)
            {
              v11 = v33;
              v12 = 4;
LABEL_21:
              (*(void (**)(void))(*v11 + 8 * v12))();
            }
            else if (v34)
            {
              v12 = 5;
              goto LABEL_21;
            }
            for (j = v25; j != &v24; j = (uint64_t *)j[1])
            {
              v14 = (NSString *)(id)j[2];
              LoadItem::deleteRequester((int8x8_t *)(v8 + 16), v14, 0, 0);

            }
            if (v26)
            {
              if (!*(_QWORD *)(v8 + 104))
              {
                v15 = *(_QWORD *)(a1 + 32);
                _noNetErr();
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[GEOTileLoader _notifyObserversOfFailure:error:options:](v15, &v35, v16, *(_QWORD *)(v8 + 48));

              }
              -[GEOTileLoader _cancelIfNeeded:](*(_QWORD *)(a1 + 32), &v27);
            }
            std::__list_imp<NSString * {__strong}>::clear(&v24);
            break;
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v5);
  }

  v17 = v32;
  if (v32)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
    if (v18)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __47__GEOTileLoader_proxy_willGoToNetworkForTiles___block_invoke_2;
      v21[3] = &unk_1E1BFFF48;
      v19 = v32;
      v20 = *(_QWORD *)(a1 + 32);
      v22 = v19;
      v23 = v20;
      dispatch_async(v18, v21);

      v17 = v32;
    }
  }

}

unint64_t __37__GEOTileLoader_cancelKey_forClient___block_invoke(unint64_t result)
{
  unint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  uint64_t *v11;

  v1 = result;
  v2 = (_QWORD *)(result + 48);
  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 112) + 8;
  while (1)
  {
    v3 = *(_QWORD *)(v3 + 8);
    if (v3 == *(_QWORD *)(*(_QWORD *)(result + 32) + 112) + 8)
      break;
    if (*v2 == *(_QWORD *)(v3 + 16) && *(_QWORD *)(result + 56) == *(_QWORD *)(v3 + 24))
    {
      v11 = (uint64_t *)v3;
      if (*(_QWORD *)(v3 + 104) && (v5 = *(uint64_t **)(v3 + 96)) != 0)
      {
        v6 = 0;
        do
        {
          if (*((_DWORD *)v5 + 39) > v6)
            v6 = *((_DWORD *)v5 + 39);
          v5 = (uint64_t *)*v5;
        }
        while (v5);
      }
      else
      {
        v6 = 0;
      }
      v7 = LoadItem::options((LoadItem *)(v3 + 16));
      LoadItem::deleteRequester((int8x8_t *)(v3 + 16), *(NSString **)(v1 + 40), 1, 0);
      result = -[GEOTileLoader _cancelIfNeeded:](*(_QWORD *)(v1 + 32), &v11);
      if ((result & 1) == 0)
      {
        if (*(_QWORD *)(v3 + 104) && (v8 = *(uint64_t **)(v3 + 96)) != 0)
        {
          v9 = 0;
          do
          {
            if (*((_DWORD *)v8 + 39) > v9)
              v9 = *((_DWORD *)v8 + 39);
            v8 = (uint64_t *)*v8;
          }
          while (v8);
        }
        else
        {
          v9 = 0;
        }
        if (v9 != v6 && (*(_DWORD *)(v3 + 40) - 1) <= 1)
          objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 40), "reprioritizeKey:newPriority:batchID:", v2);
        result = LoadItem::options((LoadItem *)(v3 + 16));
        if (v7 >= 0x200 && result <= 0x1FF)
          return objc_msgSend(*(id *)(v1 + 32), "_scheduleCoalesceTimer");
      }
      return result;
    }
  }
  return result;
}

- (void)proxy:(id)a3 canShrinkDiskCacheByAmount:(unint64_t)a4
{
  geo_isolate_sync();
}

- (void)proxy:(id)a3 willGoToNetworkForTiles:(id)a4
{
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  GEOGetTileLoadingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Will go to network for tiles %{geo:TileKeyList}@", buf, 0xCu);
  }

  v6 = v4;
  geo_isolate_sync();

}

void __47__GEOTileLoader_proxy_willGoToNetworkForTiles___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "tileLoader:submittedTilesToNetwork:forClient:", *(_QWORD *)(a1 + 40), v7, v6);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __37__GEOTileLoader_registerTileDecoder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

  }
}

void __29__GEOTileLoader_modernLoader__block_invoke()
{
  GEOTileLoader *v0;
  void *v1;

  v0 = objc_alloc_init(GEOTileLoader);
  v1 = (void *)qword_1ECDBB7F0;
  qword_1ECDBB7F0 = (uint64_t)v0;

}

- (GEOTileLoader)init
{
  void *v3;
  GEOTileLoader *v4;

  +[GEOTileLoader singletonConfiguration]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (GEOTileLoader *)-[GEOTileLoader initWithConfiguration:serverProxy:](self, v3);

  return v4;
}

+ (id)singletonConfiguration
{
  objc_opt_self();
  if (qword_1ECDBB7F8 != -1)
    dispatch_once(&qword_1ECDBB7F8, &__block_literal_global_4);
  return (id)qword_1ECDBB800;
}

void __50__GEOTileLoader_proxy_canShrinkDiskCacheByAmount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  if (*(_QWORD *)(v1 + 72))
  {
    v3 = *(_QWORD *)(v1 + 64);
    v4 = (void *)MEMORY[0x18D765024](*(_QWORD *)(v3 + 24));
    v5 = *(NSObject **)(v3 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__GEOTileLoader_proxy_canShrinkDiskCacheByAmount___block_invoke_2;
    v12[3] = &unk_1E1C00330;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 40);
    v13 = v6;
    v14 = v7;
    dispatch_async(v5, v12);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
    v9 = *(uint64_t **)(v8 + 64);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = *v9;
    *(_QWORD *)(v11 + 8) = v9[1];
    *(_QWORD *)v9[1] = v11;
    *(_QWORD *)(v8 + 72) = v10 - 1;
    std::__list_imp<_CacheRequester<void({block_pointer} {__strong})(unsigned long long)>>::__delete_node[abi:ne180100]<>((uint64_t)v9);

  }
}

- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 callbackQ:(void *)a8 beginNetwork:(void *)a9 callback:(void *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;

  v19 = a5;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  objc_msgSend(a1, "loadKey:priority:forClient:options:reason:qos:callbackQ:beginNetwork:callback:", a3, a4, v19, a6, a7, qos_class_self(), v16, v17, v18);

}

- (uint64_t)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(uint64_t)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(int)a8 callbackQ:(uint64_t)a9 beginNetwork:(uint64_t)a10 callback:(uint64_t)a11
{
  uint64_t v12;

  LODWORD(v12) = a8;
  return objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:callbackQ:beginNetwork:callback:", a3, 0, a4, a5, a6, a7, v12, a9, a10, a11);
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(unsigned int)a8 qos:(int)a9 callbackQ:(void *)a10 beginNetwork:(void *)a11 callback:(void *)a12
{
  id v18;
  id v19;
  id v20;
  double v21;
  id v22;

  v22 = a6;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  GEOMachAbsoluteTimeGetCurrent();
  -[GEOTileLoader loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:createTime:callbackQ:beginNetwork:callback:](a1, a3, a4, a5, v22, a7, a8, a9, v21, 0, v18, v19, v20);

}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 72);
  v8[0] = CFSTR("GEOTileLoadResultSource");
  v8[1] = CFSTR("OriginalLoadReason");
  v9[0] = &unk_1E1E80AA0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, void *))(v3 + 16))(v3, a1 + 56, v2, v4, 0, v7);
}

+ (id)modernLoaderForTileGroupIdentifier:(unsigned int)a3 locale:(id)a4
{
  uint64_t v4;
  id v6;
  GEOResourceManifestConfiguration *v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_alloc_init(GEOResourceManifestConfiguration);
  -[GEOResourceManifestConfiguration setTileGroupIdentifier:](v7, "setTileGroupIdentifier:", v4);
  objc_msgSend(a1, "modernLoaderForResourceManifestConfiguration:locale:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __69__GEOTileLoader_modernLoaderForResourceManifestConfiguration_locale___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECDBB810;
  qword_1ECDBB810 = v0;

}

+ (void)setServerProxyClass:(Class)a3
{
  id v4;

  +[GEOTileLoader singletonConfiguration]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServerProxyClass:", a3);

}

+ (void)useRemoteLoader
{
  id v2;

  +[GEOTileLoader singletonConfiguration]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setServerProxyClass:", objc_opt_class());

}

+ (void)useLocalLoader
{
  id v2;

  +[GEOTileLoader singletonConfiguration]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setServerProxyClass:", objc_opt_class());

}

+ (void)setMemoryCacheCountLimit:(unint64_t)a3
{
  id v4;

  +[GEOTileLoader singletonConfiguration]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMemoryCacheCountLimit:", a3);

}

+ (void)setMemoryCacheTotalCostLimit:(unint64_t)a3
{
  id v4;

  +[GEOTileLoader singletonConfiguration]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMemoryCacheCostLimit:", a3);

}

+ (void)setDiskCacheLocation:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[GEOTileLoader singletonConfiguration]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDiskCacheLocation:", v4);

}

+ (id)diskCacheLocation
{
  void *v2;
  void *v3;

  +[GEOTileLoader singletonConfiguration]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diskCacheLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setDiskCacheExternalLocation:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[GEOTileLoader singletonConfiguration]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDiskCacheExternalLocation:", v4);

}

+ (id)diskCacheExternalLocation
{
  void *v2;
  void *v3;

  +[GEOTileLoader singletonConfiguration]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diskCacheExternalLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)memoryHits
{
  return atomic_load((unsigned int *)self->_internal + 20);
}

- (int)diskHits
{
  return atomic_load((unsigned int *)self->_internal + 21);
}

- (int)networkHits
{
  return atomic_load((unsigned int *)self->_internal + 22);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[GEOTileLoaderConfiguration manifestConfiguration](self->_config, "manifestConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTileGroupObserver:", self);

  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeExperimentObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  GEOUnregisterStateCaptureLegacy();
  v7.receiver = self;
  v7.super_class = (Class)GEOTileLoader;
  -[GEOTileLoader dealloc](&v7, sel_dealloc);
}

- (NSString)description
{
  id v2;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync_data();
  v2 = v4;

  return (NSString *)v2;
}

void __28__GEOTileLoader_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  ErrorInfo *v13;
  unint64_t v14;
  void *v15;
  ErrorInfo *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v20;

  v2 = *(void **)(a1 + 32);
  v20.receiver = *(id *)(a1 + 40);
  v20.super_class = (Class)GEOTileLoader;
  objc_msgSendSuper2(&v20, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("<%@> {\n"), v3);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tcacheCountLimit: %ld\n"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "memoryCacheCountLimit"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tcacheTotalCostLimit: %ld\n"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "memoryCacheCostLimit"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tproxy: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v19 = *(id *)(a1 + 32);
  geo_isolate_sync_data();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tmemoryhits: %d\n"), objc_msgSend(*(id *)(a1 + 40), "memoryHits"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tdiskhits: %d\n"), objc_msgSend(*(id *)(a1 + 40), "diskHits"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tnetworkhits: %d\n"), objc_msgSend(*(id *)(a1 + 40), "networkHits"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112);
  v6 = *(_QWORD *)(v5 + 16);
  while (v6 != v5 + 8)
  {
    LoadItem::description((LoadItem *)(v6 + 16));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    v6 = *(_QWORD *)(v6 + 8);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tloadItems: %@\n"), v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 112);
  v10 = v9[13];
  if (v9[14] != v10)
  {
    v11 = v9[16];
    v12 = (_QWORD *)(v10 + 8 * (v11 / 0x49));
    v13 = (ErrorInfo *)(*v12 + 56 * (v11 % 0x49));
    v14 = *(_QWORD *)(v10 + 8 * ((v9[17] + v11) / 0x49)) + 56 * ((v9[17] + v11) % 0x49);
    while (v13 != (ErrorInfo *)v14)
    {
      ErrorInfo::description(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v15);

      v13 = (ErrorInfo *)((char *)v13 + 56);
      if ((ErrorInfo *)((char *)v13 - *v12) == (ErrorInfo *)4088)
      {
        v16 = (ErrorInfo *)v12[1];
        ++v12;
        v13 = v16;
      }
    }
  }
  v17 = *(void **)(a1 + 32);
  objc_msgSend(v8, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendFormat:", CFSTR("\terrors: %@\n"), v18);

}

uint64_t __28__GEOTileLoader_description__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\topeners: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

- (id)descriptionDictionaryRepresentation
{
  id v2;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync_data();
  v2 = v4;

  return v2;
}

void __52__GEOTileLoader_descriptionDictionaryRepresentation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  ErrorInfo *v21;
  unint64_t v22;
  void *v23;
  ErrorInfo *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  uint64_t v36;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "memoryCacheCountLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("cacheCountLimit"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "memoryCacheCostLimit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("cacheTotalCostLimit"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("proxy"));

  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __52__GEOTileLoader_descriptionDictionaryRepresentation__block_invoke_2;
  v34 = &unk_1E1BFFF48;
  v6 = v2;
  v7 = *(_QWORD *)(a1 + 32);
  v35 = v6;
  v36 = v7;
  geo_isolate_sync_data();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(*(id *)(a1 + 32), "memoryHits"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("memoryhits"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(*(id *)(a1 + 32), "diskHits"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("diskhits"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(*(id *)(a1 + 32), "networkHits"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("networkhits"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  v13 = *(_QWORD *)(v12 + 16);
  while (v13 != v12 + 8)
  {
    LoadItem::description((LoadItem *)(v13 + 16));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

    v13 = *(_QWORD *)(v13 + 8);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("loadItems"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 112);
  v18 = v17[13];
  if (v17[14] != v18)
  {
    v19 = v17[16];
    v20 = (_QWORD *)(v18 + 8 * (v19 / 0x49));
    v21 = (ErrorInfo *)(*v20 + 56 * (v19 % 0x49));
    v22 = *(_QWORD *)(v18 + 8 * ((v17[17] + v19) / 0x49)) + 56 * ((v17[17] + v19) % 0x49);
    while (v21 != (ErrorInfo *)v22)
    {
      ErrorInfo::description(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v23);

      v21 = (ErrorInfo *)((char *)v21 + 56);
      if ((ErrorInfo *)((char *)v21 - *v20) == (ErrorInfo *)4088)
      {
        v24 = (ErrorInfo *)v20[1];
        ++v20;
        v21 = v24;
      }
    }
  }
  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v16, "description");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v27, CFSTR("errors"));

  v28 = *(void **)(a1 + 40);
  v30.receiver = *(id *)(a1 + 32);
  v30.super_class = (Class)GEOTileLoader;
  objc_msgSendSuper2(&v30, sel_description);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v6, v29);

}

void __52__GEOTileLoader_descriptionDictionaryRepresentation__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:");

}

- (void)registerObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

void __34__GEOTileLoader_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _GEOTileLoaderObserverWrapper *v5;
  id v6;
  id *v7;
  objc_super v8;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 1);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 120);
    *(_QWORD *)(v3 + 120) = v2;

  }
  v5 = [_GEOTileLoaderObserverWrapper alloc];
  v6 = *(id *)(a1 + 40);
  if (v5
    && (v8.receiver = v5,
        v8.super_class = (Class)_GEOTileLoaderObserverWrapper,
        (v7 = (id *)objc_msgSendSuper2(&v8, sel_init)) != 0))
  {
    objc_storeWeak(v7 + 1, v6);
    *((_BYTE *)v7 + 16) = objc_opt_respondsToSelector() & 1;
    *((_BYTE *)v7 + 17) = objc_opt_respondsToSelector() & 1;
    *((_BYTE *)v7 + 18) = objc_opt_respondsToSelector() & 1;
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));
}

- (void)unregisterObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

uint64_t __36__GEOTileLoader_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __70__GEOTileLoader__notifyObserversOfSuccess_sizeInBytes_source_options___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id WeakRetained;
  id v10;
  id obj;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v12 = *(_QWORD *)v14;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v14 != v12)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v3);
        v6 = *(_QWORD *)(a1 + 48);
        v5 = *(_QWORD *)(a1 + 56);
        v7 = *(_QWORD *)(a1 + 64);
        v8 = *(id *)(a1 + 32);
        if (v4)
        {
          if (*(_BYTE *)(v4 + 17))
          {
            WeakRetained = objc_loadWeakRetained((id *)(v4 + 8));
            objc_msgSend(WeakRetained, "tileLoader:loadedTileKey:fromSource:withOptions:", v8, a1 + 72, v5, v7);

          }
          if (*(_BYTE *)(v4 + 16))
          {
            v10 = objc_loadWeakRetained((id *)(v4 + 8));
            objc_msgSend(v10, "tileLoader:loadedTileKey:sizeInBytes:fromSource:withOptions:", v8, a1 + 72, v6, v5, v7);

          }
        }

        ++v3;
      }
      while (v2 != v3);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v2);
  }

}

- (void)_notifyObserversOfFailure:(void *)a3 error:(uint64_t)a4 options:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__0;
    v13 = __Block_byref_object_dispose__0;
    v14 = 0;
    v8 = MEMORY[0x1E0C809B0];
    geo_isolate_sync_data();
    if (objc_msgSend((id)v10[5], "count"))
    {
      v23 = *a2;
      v15 = v8;
      v16 = 3221225472;
      v17 = __57__GEOTileLoader__notifyObserversOfFailure_error_options___block_invoke_2;
      v18 = &unk_1E1BFFFC0;
      v21 = &v9;
      v19 = a1;
      v20 = v7;
      v22 = a4;
      geo_dispatch_async_qos();

    }
    _Block_object_dispose(&v9, 8);

  }
}

void __57__GEOTileLoader__notifyObserversOfFailure_error_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectEnumerator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __57__GEOTileLoader__notifyObserversOfFailure_error_options___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id WeakRetained;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v5);
        v7 = *(void **)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 56);
        v9 = *(id *)(a1 + 32);
        v10 = v7;
        if (v6 && *(_BYTE *)(v6 + 18))
        {
          WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
          objc_msgSend(WeakRetained, "tileLoader:failedTileKey:error:withOptions:", v9, a1 + 64, v10, v8, (_QWORD)v12);

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

void __29__GEOTileLoader__cancel_err___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x18D765024](*(_QWORD *)(a2 + 104));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__GEOTileLoader__cancel_err___block_invoke_2;
  block[3] = &unk_1E1C00038;
  v8 = v4;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v5 = v4;
  LoadItem::Requester::performAsyncOnCallbackQueue(a2, block);

}

uint64_t __29__GEOTileLoader__cancel_err___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a1 + 48, 0, 0, *(_QWORD *)(a1 + 32), 0);
}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = a1 + 40;
  _cacheMissErr();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, v2, 0, 0);

}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = a1 + 40;
  _noNetErr();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, v2, 0, 0);

}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(v2, "length");
  v6 = CFSTR("GEOTileLoadResultIsPreliminary");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, _QWORD, void *))(v3 + 16))(v3, a1 + 48, v2, v4, 0, v5);

}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = a1 + 40;
  _cacheMissErr();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, v2, 0, 0);

}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = a1 + 40;
  _cacheMissErr();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, v2, 0, 0);

}

void __143__GEOTileLoader_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback___block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = a1 + 40;
  _cacheMissErr();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, v2, 0, 0);

}

- (void)_decodePreliminaryTileData:(void *)a3 forKey:(uint64_t *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *a4;
  v8 = a4[1];
  v10 = 1;
  -[GEOTileLoader _tileDecoderForTileKey:quickly:]((uint64_t)a1, (uint64_t)a4, (uint64_t)&v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__GEOTileLoader__decodePreliminaryTileData_forKey___block_invoke;
  v11[3] = &unk_1E1C00128;
  v11[4] = a1;
  v11[5] = v7;
  v11[6] = v8;
  -[GEOTileLoader _loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:](a1, v7, v8, 1, v10, v9, v6, v11);

}

void __51__GEOTileLoader__decodePreliminaryTileData_forKey___block_invoke(uint64_t *a1, void *a2, char a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  int8x8_t *v8;
  id v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint64_t *v23;
  _BYTE v24[128];
  __int128 v25;
  _BYTE v26[24];
  _BYTE *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5 && (a3 & 1) == 0)
  {
    v6 = a1 + 5;
    v7 = *(_QWORD *)(a1[4] + 112) + 8;
    do
    {
      v7 = *(_QWORD *)(v7 + 8);
      if (v7 == *(_QWORD *)(a1[4] + 112) + 8)
        goto LABEL_24;
      v8 = (int8x8_t *)(v7 + 16);
    }
    while (*v6 != *(_QWORD *)(v7 + 16) || a1[6] != *(_QWORD *)(v7 + 24));
    v23 = (uint64_t *)v7;
    if (*(_DWORD *)(v7 + 44) != 4)
      goto LABEL_24;
    geo::_retain_ptr<GEOTileData * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::reset(v7 + 128, v5);
    v22 = 0;
    v25 = *(_OWORD *)v6;
    v10 = v5;
    v11 = (char *)operator new(0x28uLL);
    *(_QWORD *)v11 = &off_1E1BFB200;
    *(_OWORD *)(v11 + 8) = v25;
    *((_QWORD *)v11 + 3) = v10;
    *((_QWORD *)v11 + 4) = &v22;
    v27 = v11;
    LoadItem::foreachRequester(*(_QWORD *)(v7 + 96), (uint64_t)v26);
    v12 = v27;
    if (v27 == v26)
    {
      v13 = 4;
      v12 = v26;
    }
    else
    {
      if (!v27)
      {
LABEL_16:
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v14 = v22;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v19 != v16)
                objc_enumerationMutation(v14);
              LoadItem::deleteRequester(v8, *(NSString **)(*((_QWORD *)&v18 + 1) + 8 * i), 0, 0);
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          }
          while (v15);
        }

        -[GEOTileLoader _cancelIfNeeded:](a1[4], &v23);
        goto LABEL_24;
      }
      v13 = 5;
    }
    (*(void (**)(void))(*v12 + 8 * v13))();
    goto LABEL_16;
  }
LABEL_24:

}

- (BOOL)reprioritizeKey:(uint64_t)a3 forClient:(void *)a4 newPriority:(int)a5
{
  id v8;
  void *v9;
  _BOOL8 v10;
  NSObject *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (a3 && v8 && a5)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v11 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__GEOTileLoader_reprioritizeKey_forClient_newPriority___block_invoke;
    block[3] = &unk_1E1C00150;
    v15 = &v18;
    v16 = a3;
    block[4] = a1;
    v14 = v8;
    v17 = a5;
    dispatch_sync(v11, block);
    v10 = *((_BYTE *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }

  return v10;
}

void __55__GEOTileLoader_reprioritizeKey_forClient_newPriority___block_invoke(uint64_t a1)
{
  id v1;
  __int128 v2;

  v2 = *(_OWORD *)(a1 + 40);
  v1 = (id)v2;
  geo_isolate_sync();

}

void __55__GEOTileLoader_reprioritizeKey_forClient_newPriority___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  int v5;
  id v6;
  uint64_t **v7;
  uint64_t *v8;
  unsigned int v9;
  uint64_t *v10;
  BOOL v11;
  BOOL v12;
  id v13;

  v2 = *(_QWORD **)(a1 + 56);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8;
  while (1)
  {
    v3 = *(_QWORD *)(v3 + 8);
    if (v3 == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 8)
      break;
    if (*v2 == *(_QWORD *)(v3 + 16) && v2[1] == *(_QWORD *)(v3 + 24))
    {
      v5 = *(_DWORD *)(a1 + 64);
      v6 = *(id *)(a1 + 40);
      v13 = v6;
      if (*(_DWORD *)(v3 + 40) <= 2u
        && (v7 = std::__hash_table<std::__hash_value_type<NSString * {__strong},LoadItem::Requester>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},LoadItem::Requester>,LoadItem::_NSStringHashFunc,LoadItem::_NSStringEqualsFunc,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},LoadItem::Requester>,LoadItem::_NSStringEqualsFunc,LoadItem::_NSStringHashFunc,true>,std::allocator<std::__hash_value_type<NSString * {__strong},LoadItem::Requester>>>::find<NSString * {__strong}>((_QWORD *)(v3 + 80), &v13)) != 0)
      {
        if (*(_QWORD *)(v3 + 104) && (v8 = *(uint64_t **)(v3 + 96)) != 0)
        {
          v9 = 0;
          v10 = *(uint64_t **)(v3 + 96);
          do
          {
            if (*((_DWORD *)v10 + 39) > v9)
              v9 = *((_DWORD *)v10 + 39);
            v10 = (uint64_t *)*v10;
          }
          while (v10);
          *((_DWORD *)v7 + 39) = v5;
          do
          {
            if (*((_DWORD *)v8 + 39) > v10)
              LODWORD(v10) = *((_DWORD *)v8 + 39);
            v8 = (uint64_t *)*v8;
          }
          while (v8);
        }
        else
        {
          v9 = 0;
          LODWORD(v10) = 0;
          *((_DWORD *)v7 + 39) = v5;
        }
        v12 = v9 == (_DWORD)v10;
        v11 = *(_DWORD *)(v3 + 40) == 0;
      }
      else
      {
        v11 = 0;
        v12 = 1;
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && !v12)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "reprioritizeKey:newPriority:batchID:", *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), *(unsigned int *)(v3 + 120));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      return;
    }
  }
}

- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 auditToken:(void *)a8 callbackQ:(void *)a9 beginNetwork:(void *)a10 callback:(void *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v21 = a5;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  objc_msgSend(a1, "loadKey:priority:forClient:options:reason:qos:signpostID:auditToken:callbackQ:beginNetwork:callback:", a3, a4, v21, a6, a7, qos_class_self(), 0, v17, v18, v19, v20);

}

- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(uint64_t)a8 signpostID:(uint64_t)a9 callbackQ:(void *)a10 beginNetwork:(void *)a11 callback:(void *)a12
{
  id v18;
  id v19;
  id v20;
  id v21;

  v21 = a5;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  GEOMachAbsoluteTimeGetCurrent();
  objc_msgSend(a1, "loadKey:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, a4, v21, a6, a7, a8, a9, 0, v18, v19, v20);

}

- (void)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(void *)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(unsigned int)a8 signpostID:(uint64_t)a9 auditToken:(void *)a10 callbackQ:(void *)a11 beginNetwork:(void *)a12 callback:(void *)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;

  v23 = a5;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v21 = a13;
  GEOMachAbsoluteTimeGetCurrent();
  objc_msgSend(a1, "loadKey:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, a4, v23, a6, a7, a8, a9, v18, v19, v20, v21);

}

- (uint64_t)loadKey:(uint64_t)a3 priority:(uint64_t)a4 forClient:(uint64_t)a5 options:(uint64_t)a6 reason:(uint64_t)a7 qos:(int)a8 signpostID:(uint64_t)a9 createTime:(uint64_t)a10 callbackQ:(uint64_t)a11 beginNetwork:(uint64_t)a12 callback:
{
  uint64_t v13;

  LODWORD(v13) = a8;
  return objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, 0, a4, a5, a6, a7, v13, a9, 0, a10, a11, a12);
}

- (uint64_t)loadKey:(void *)a1 priority:(uint64_t)a2 forClient:(uint64_t)a3 options:(uint64_t)a4 reason:(uint64_t)a5 qos:(uint64_t)a6 signpostID:(uint64_t)a7 auditToken:(int)a8 createTime:(uint64_t)a9 callbackQ:(uint64_t)a10 beginNetwork:(__int128)a11 callback:(uint64_t)a12
{
  uint64_t v13;

  LODWORD(v13) = a8;
  return objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:auditToken:createTime:callbackQ:beginNetwork:callback:", a3, 0, a4, a5, a6, a7, v13, a9, a10, a11, a12);
}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(uint64_t)a8 callbackQ:(void *)a9 beginNetwork:(void *)a10 callback:(void *)a11
{
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v21 = a6;
  v17 = a9;
  v18 = a10;
  v19 = a11;
  LODWORD(v20) = qos_class_self();
  objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:callbackQ:beginNetwork:callback:", a3, a4, a5, v21, a7, a8, v20, v17, v18, v19);

}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(uint64_t)a8 signpostID:(uint64_t)a9 callbackQ:(void *)a10 beginNetwork:(void *)a11 callback:(void *)a12
{
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;

  v22 = a6;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  LODWORD(v21) = qos_class_self();
  objc_msgSend(a1, "loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:callbackQ:beginNetwork:callback:", a3, a4, a5, v22, a7, a8, v21, a9, v18, v19, v20);

}

- (void)loadKey:(uint64_t)a3 additionalInfo:(uint64_t)a4 priority:(uint64_t)a5 forClient:(void *)a6 options:(uint64_t)a7 reason:(unsigned int)a8 qos:(int)a9 signpostID:(uint64_t)a10 callbackQ:(void *)a11 beginNetwork:(void *)a12 callback:(void *)a13
{
  id v18;
  id v19;
  id v20;
  double v21;
  id v23;

  v23 = a6;
  v18 = a11;
  v19 = a12;
  v20 = a13;
  GEOMachAbsoluteTimeGetCurrent();
  -[GEOTileLoader loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:createTime:callbackQ:beginNetwork:callback:](a1, a3, a4, a5, v23, a7, a8, a9, v21, a10, v18, v19, v20);

}

- (void)cancelAllForClient:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_async();

}

void __36__GEOTileLoader_cancelAllForClient___block_invoke(uint64_t a1)
{
  -[GEOTileLoader _cancelAllForClientOnLoadQueue:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_cancelAllForClientOnLoadQueue:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  unint64_t v7;
  int8x8_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t ***v13;
  uint64_t **i;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD *v20;
  char v21;
  int8x8_t *v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  int v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _BYTE buf[12];
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    geo_assert_isolated();
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v27 = &v27;
    v28 = &v27;
    v29 = 0;
    v4 = *(_QWORD *)(a1 + 112);
    v5 = *(_QWORD **)(v4 + 16);
    if (v5 != (_QWORD *)(v4 + 8))
    {
      do
      {
        v6 = v3;
        v7 = objc_msgSend(v6, "hash");
        v8 = (int8x8_t)v5[11];
        if (v8)
        {
          v9 = v7;
          v10 = (uint8x8_t)vcnt_s8(v8);
          v10.i16[0] = vaddlv_u8(v10);
          v11 = v10.u32[0];
          if (v10.u32[0] > 1uLL)
          {
            v12 = v7;
            if (v7 >= *(_QWORD *)&v8)
              v12 = v7 % *(_QWORD *)&v8;
          }
          else
          {
            v12 = (*(_QWORD *)&v8 - 1) & v7;
          }
          v13 = *(uint64_t ****)(v5[10] + 8 * v12);
          if (v13)
          {
            for (i = *v13; i; i = (uint64_t **)*i)
            {
              v15 = (unint64_t)i[1];
              if (v9 == v15)
              {
                if ((objc_msgSend(i[2], "isEqualToString:", v6) & 1) != 0)
                {

                  v16 = operator new(0x18uLL);
                  v17 = v27;
                  v16[1] = &v27;
                  v16[2] = v5;
                  *v16 = v17;
                  v17[1] = v16;
                  v27 = v16;
                  ++v29;
                  goto LABEL_20;
                }
              }
              else
              {
                if (v11 > 1)
                {
                  if (v15 >= *(_QWORD *)&v8)
                    v15 %= *(_QWORD *)&v8;
                }
                else
                {
                  v15 &= *(_QWORD *)&v8 - 1;
                }
                if (v15 != v12)
                  break;
              }
            }
          }
        }

LABEL_20:
        v5 = (_QWORD *)v5[1];
      }
      while (v5 != (_QWORD *)(*(_QWORD *)(a1 + 112) + 8));
      v18 = v29;
      if (v29)
      {
        GEOGetTileLoadingLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v6;
          v31 = 2050;
          v32 = v18;
          _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_INFO, "cancelAllForClient: %@ (%{public}zu in-flight)", buf, 0x16u);
        }

      }
    }
    v20 = v28;
    if (v28 != &v27)
    {
      v21 = 0;
      do
      {
        *(_QWORD *)buf = v20[2];
        v22 = (int8x8_t *)(*(_QWORD *)buf + 16);
        v23 = LoadItem::options((LoadItem *)(*(_QWORD *)buf + 16));
        LoadItem::deleteRequester(v22, (NSString *)v3, 1, 0);
        v24 = LoadItem::options((LoadItem *)v22);
        v25 = -[GEOTileLoader _cancelIfNeeded:](a1, (uint64_t **)buf);
        if (v23 < 0x200)
          v26 = 1;
        else
          v26 = v25;
        if (!v26)
          v21 |= v24 < 0x200;
        v20 = (_QWORD *)v20[1];
      }
      while (v20 != &v27);
      if ((v21 & 1) != 0)
        objc_msgSend((id)a1, "_scheduleCoalesceTimer");
    }
    std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(&v27);
  }

}

- (void)cancelAllForClientSynchronous:(id)a3
{
  id v4;
  NSObject *loadQ;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  loadQ = self->_loadQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__GEOTileLoader_cancelAllForClientSynchronous___block_invoke;
  block[3] = &unk_1E1BFFF48;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(loadQ, block);

}

void __47__GEOTileLoader_cancelAllForClientSynchronous___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  geo_isolate_sync_data();

}

void __47__GEOTileLoader_cancelAllForClientSynchronous___block_invoke_2(uint64_t a1)
{
  -[GEOTileLoader _cancelAllForClientOnLoadQueue:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)beginPreloadSessionOfSize:(unint64_t)a3 forClient:(id)a4
{
  -[GEOTileServerProxy beginPreloadSessionOfSize:](self->_proxy, "beginPreloadSessionOfSize:", a3, a4);
}

- (void)endPreloadSessionForClient:(id)a3
{
  -[GEOTileServerProxy endPreloadSession](self->_proxy, "endPreloadSession", a3);
}

- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQ:(id)a4 finished:(id)a5
{
  -[GEOTileServerProxy shrinkDiskCacheToSize:callbackQueue:completionHandler:](self->_proxy, "shrinkDiskCacheToSize:callbackQueue:completionHandler:", a3, a4, a5);
}

- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3
{
  return -[GEOTileServerProxy shrinkDiskCacheToSizeSync:](self->_proxy, "shrinkDiskCacheToSizeSync:", a3);
}

- (void)calculateFreeableSizeWithCallbackQ:(id)a3 finished:(id)a4
{
  id v6;
  id v7;
  GEOTileLoaderInternal *internal;
  _QWORD *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;

  v6 = a3;
  v7 = a4;
  internal = self->_internal;
  v9 = operator new(0x40uLL);
  *v9 = 0;
  v9[1] = 0;
  v16 = v6;
  v10 = v7;
  v11 = v10;
  v9[2] = &off_1E1BF6540;
  v9[3] = 0;
  if (v10)
    v12 = objc_msgSend(v10, "copy");
  else
    v12 = MEMORY[0x18D765024]();
  v13 = (void *)v9[3];
  v9[3] = v12;

  geo::_retain_ptr<NSObject  {objcproto17OS_dispatch_queue}* {__strong},geo::_retain_dispatch_arc<NSObject  {objcproto17OS_dispatch_queue}* {__strong}>,geo::_release_dispatch_arc,geo::_hash_ptr,geo::_equal_ptr>::_retain_ptr(v9 + 5, v16);
  v14 = (_QWORD *)*((_QWORD *)internal + 8);
  v15 = *((_QWORD *)internal + 9);
  *v9 = (char *)internal + 56;
  v9[1] = v14;
  *v14 = v9;
  *((_QWORD *)internal + 8) = v9;
  *((_QWORD *)internal + 9) = v15 + 1;
  -[GEOTileServerProxy calculateFreeableSize](self->_proxy, "calculateFreeableSize");

}

- (void)clearCachedTilesMatchingBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__GEOTileLoader_clearCachedTilesMatchingBlock___block_invoke;
  v7[3] = &unk_1E1C001C8;
  v5 = v4;
  v8 = v5;
  v6 = (void *)MEMORY[0x18D765024](v7);
  objc_msgSend(*((id *)self->_internal + 4), "removeTilesMatchingPredicate:", v6);
  objc_msgSend(*((id *)self->_internal + 5), "removeTilesMatchingPredicate:", v6);

}

uint64_t __47__GEOTileLoader_clearCachedTilesMatchingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerTileLoader:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GEOTileServerProxy registerProvider:](self->_proxy, "registerProvider:", a3);
}

- (void)expireTilesWithPredicate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, double);
  void *v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  GEOMachAbsoluteTimeGetCurrent();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __42__GEOTileLoader_expireTilesWithPredicate___block_invoke;
  v11 = &unk_1E1C001F0;
  v13 = v5;
  v6 = v4;
  v12 = v6;
  v7 = (void *)MEMORY[0x18D765024](&v8);
  objc_msgSend(*((id *)self->_internal + 5), "removeTilesMatchingPredicate:", v7, v8, v9, v10, v11);

}

uint64_t __42__GEOTileLoader_expireTilesWithPredicate___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 40) - a2);
}

- (void)reportCorruptTile:(char *)a3
{
  uint64_t v5;
  id v6;

  v5 = 40;
  if (*a3 >= 0)
    v5 = 32;
  v6 = *(id *)(*(_QWORD *)(a1 + 112) + v5);
  objc_msgSend(v6, "removeTileForKey:", a3);
  objc_msgSend(*(id *)(a1 + 40), "reportCorruptTile:", a3);

}

- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6
{
  -[GEOTileServerProxy enumerateAllKeysIncludingData:onQueue:group:dataHandler:](self->_proxy, "enumerateAllKeysIncludingData:onQueue:group:dataHandler:", a3, a4, a5, a6);
}

uint64_t __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_190(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "reportCorruptTile:", &v2);
}

uint64_t __41__GEOTileLoader__loadedTile_forKey_info___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleCoalesceTimer");
}

void __90__GEOTileLoader__loadedTileForLocalKey_preliminary_quickly_tileDecoder_data_disburseTile___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  GEOTileData *v6;
  GEOTileData *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v2, "readDataWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (!v3)
  {
    GEOGetTileLoadingLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Failed to read supposedly-loaded tile from disk: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "decodeTile:forKey:", v3, a1 + 64);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v6 = -[GEOTileData initWithDecodedRepresentation:]([GEOTileData alloc], "initWithDecodedRepresentation:", v5);
LABEL_7:

  v8 = *(id *)(a1 + 56);
  v7 = v6;
  geo_isolate_sync();

}

uint64_t __90__GEOTileLoader__loadedTileForLocalKey_preliminary_quickly_tileDecoder_data_disburseTile___block_invoke_192(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)proxy:(id)a3 failedToLoadTiles:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  GEOTileLoader *v20;
  uint64_t (**v21)();
  id v22;
  uint64_t (**v23)();
  id v24;
  uint64_t (**v25)();
  id v26;
  uint64_t (**v27)();
  id v28;
  uint64_t (**v29)();
  id v30;
  uint64_t v31;
  unsigned __int8 v32;
  unsigned int v33;
  char v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  GEOTileLoader *v41;
  id v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD v50[6];
  _QWORD v51[3];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  _QWORD *(*v55)(_QWORD *, _QWORD *);
  void (*v56)(uint64_t);
  uint64_t v57;
  uint64_t v58[3];
  __int128 v59;
  __int128 v60;
  _QWORD v61[26];

  v61[24] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v52 = 0;
  v53 = &v52;
  v54 = 0x4812000000;
  v55 = __Block_byref_object_copy__193;
  v56 = __Block_byref_object_dispose__194;
  v57 = 0;
  v58[0] = (uint64_t)v58;
  v58[1] = (uint64_t)v58;
  v58[2] = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x4812000000;
  v50[3] = __Block_byref_object_copy__195;
  v50[4] = __Block_byref_object_dispose__196;
  v50[5] = 0;
  v51[0] = v51;
  v51[1] = v51;
  v51[2] = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke;
  v39 = &unk_1E1C00308;
  v18 = v7;
  v40 = v18;
  v41 = self;
  v20 = self;
  v43 = v50;
  v44 = &v46;
  v45 = &v52;
  v19 = v8;
  v42 = v19;
  geo_isolate_sync();
  v9 = v53 + 6;
  v10 = v53[7];
  if ((uint64_t *)v10 != v53 + 6)
  {
    do
    {
      v60 = *(_OWORD *)(v10 + 16);
      LoadItem::Requester::Requester((LoadItem::Requester *)v61, (const LoadItem::Requester *)(v10 + 32));
      v59 = v60;
      LoadItem::Requester::Requester((LoadItem::Requester *)&v21, (const LoadItem::Requester *)v61);
      if (v34)
        v11 = (void *)MEMORY[0x18D765024](v28);
      else
        v11 = 0;
      v12 = v33;
      v13 = v22;
      v14 = v32;
      v15 = v31;
      v16 = v26;
      v17 = (void *)MEMORY[0x18D765024](v30);
      -[GEOTileLoader loadKey:priority:forClient:options:reason:callbackQ:beginNetwork:callback:](v20, "loadKey:priority:forClient:options:reason:callbackQ:beginNetwork:callback:", &v59, v12, v13, v15, v14, v16, v11, v17);

      v29 = &off_1E1BF6500;
      v27 = &off_1E1BF6520;

      v25 = &off_1E1BF64E0;
      v23 = &off_1E1BF6480;

      v21 = &off_1E1BF64C0;
      v61[12] = &off_1E1BF6500;

      v61[9] = &off_1E1BF6520;
      v61[6] = &off_1E1BF64E0;

      v61[3] = &off_1E1BF6480;
      v61[0] = &off_1E1BF64C0;

      v10 = *(_QWORD *)(v10 + 8);
    }
    while ((_QWORD *)v10 != v9);
  }
  if (*((_BYTE *)v47 + 24))
    geo_isolate_async();

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);
  std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(v51);
  _Block_object_dispose(&v52, 8);
  std::__list_imp<std::pair<_GEOTileKey,LoadItem::Requester>>::clear(v58);

}

void __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  _QWORD *v5;
  _QWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  _QWORD v27[3];
  _QWORD *v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v18 != v3)
          objc_enumerationMutation(obj);
        v29 = *(_OWORD *)*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v5 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) + 8);
        while (1)
        {
          v5 = (_QWORD *)v5[1];
          if (v5 == (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) + 8))
            break;
          if ((_QWORD)v29 == v5[2] && *((_QWORD *)&v29 + 1) == v5[3])
            goto LABEL_15;
        }
        v5 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) + 8);
LABEL_15:
        v7 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
        v8 = operator new(0x20uLL);
        v8[1] = v29;
        v9 = v7[6];
        v7 += 6;
        *(_QWORD *)v8 = v9;
        *((_QWORD *)v8 + 1) = v7;
        *(_QWORD *)(v9 + 8) = v8;
        *v7 = v8;
        ++v7[2];
        if (v5 != (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) + 8))
        {
          v10 = v5[6];
          v11 = LoadItem::options((LoadItem *)(v5 + 2));
          if (v11 >= 0x200)
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          *((_DWORD *)v5 + 10) = 3;
          if (*((_DWORD *)v5 + 11) == 1)
            *((_DWORD *)v5 + 11) = 3;
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_2;
          v21[3] = &unk_1E1C002E0;
          v24 = v10;
          v25 = v11;
          v23 = *(_QWORD *)(a1 + 72);
          v26 = v29;
          v22 = *(id *)(a1 + 48);
          v28 = 0;
          v27[0] = &off_1E1BFA2E0;
          v27[1] = MEMORY[0x18D765024](v21);
          v28 = v27;
          LoadItem::foreachRequester(v5[12], (uint64_t)v27);
          v12 = v28;
          if (v28 == v27)
          {
            v12 = v27;
            v13 = 4;
LABEL_24:
            (*(void (**)(void))(*v12 + 8 * v13))();
          }
          else if (v28)
          {
            v13 = 5;
            goto LABEL_24;
          }
          -[GEOTileLoader _notifyObserversOfFailure:error:options:](*(_QWORD *)(a1 + 40), &v29, *(void **)(a1 + 48), v10);
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112);
          v15 = *v5;
          *(_QWORD *)(v15 + 8) = v5[1];
          *(_QWORD *)v5[1] = v15;
          --*(_QWORD *)(v14 + 24);
          std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)(v5 + 2));
          operator delete(v5);

          continue;
        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
    }
    while (v2);
  }

  _appendError(*(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
}

void __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_2(uint64_t a1, const LoadItem::Requester *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == *(_QWORD *)(a1 + 56))
    goto LABEL_8;
  v5 = (v4 >> 1) & 1;
  v6 = *((_QWORD *)a2 + 15);
  if ((v6 & 2) == 0)
    LODWORD(v5) = 1;
  v7 = (v6 >> 3) & 1;
  if ((*(_QWORD *)(a1 + 48) & 8) == 0)
    LOBYTE(v7) = 1;
  if ((_DWORD)v5 == 1 && (v7 & 1) != 0)
  {
LABEL_8:
    v8 = (void *)MEMORY[0x18D765024](*((_QWORD *)a2 + 13));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_3;
    block[3] = &unk_1E1C00038;
    v16 = *(_OWORD *)(a1 + 64);
    v15 = v8;
    v14 = *(id *)(a1 + 32);
    v9 = v8;
    LoadItem::Requester::performAsyncOnCallbackQueue((uint64_t)a2, block);

  }
  else
  {
    v10 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v11 = operator new(0xD8uLL);
    *v11 = 0;
    v11[1] = 0;
    *((_OWORD *)v11 + 1) = *(_OWORD *)(a1 + 64);
    LoadItem::Requester::Requester((LoadItem::Requester *)(v11 + 4), a2);
    v12 = v10[6];
    v10 += 6;
    *v11 = v12;
    v11[1] = v10;
    *(_QWORD *)(v12 + 8) = v11;
    *v10 = v11;
    ++v10[2];
  }
}

uint64_t __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_3(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)(a1 + 48);
  return (*(uint64_t (**)(_QWORD, __int128 *, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), &v2, 0, 0, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __47__GEOTileLoader_proxy_failedToLoadTiles_error___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleCoalesceTimer");
}

- (void)proxy:(id)a3 failedToLoadAllPendingTilesWithError:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4 = a4;
  geo_isolate_sync();
  if (*((_BYTE *)v6 + 24))
    geo_isolate_async();

  _Block_object_dispose(&v5, 8);
}

void __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint8_t buf[16];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD **)(v2 + 112);
  if (v3[3])
  {
    GEOGetTileLoadingLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "All pending tiles fail with error %@", buf, 0xCu);
    }

    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD **)(v2 + 112);
  }
  v6 = (char *)v3[2];
  if (v6 != (char *)(v3 + 1))
  {
    while (1)
    {
      *(_OWORD *)buf = *((_OWORD *)v6 + 1);
      if ((*((_DWORD *)v6 + 10) - 1) <= 1)
        break;
      v6 = (char *)*((_QWORD *)v6 + 1);
LABEL_16:
      if (v6 == (char *)(*(_QWORD *)(v2 + 112) + 8))
        return;
    }
    *((_DWORD *)v6 + 10) = 3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= LoadItem::options((LoadItem *)(v6 + 16)) >> 9;
    if (*((_DWORD *)v6 + 11) == 1)
      *((_DWORD *)v6 + 11) = 3;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_197;
    v12[3] = &unk_1E1C00060;
    v14 = *(_OWORD *)buf;
    v13 = *(id *)(a1 + 40);
    v16 = 0;
    v15[0] = &off_1E1BFA2E0;
    v15[1] = MEMORY[0x18D765024](v12);
    v16 = v15;
    LoadItem::foreachRequester(*((_QWORD *)v6 + 12), (uint64_t)v15);
    v7 = v16;
    if (v16 == v15)
    {
      v7 = v15;
      v8 = 4;
    }
    else
    {
      if (!v16)
      {
LABEL_15:
        -[GEOTileLoader _notifyObserversOfFailure:error:options:](*(_QWORD *)(a1 + 32), (__int128 *)buf, *(void **)(a1 + 40), *((_QWORD *)v6 + 6));
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
        v10 = *(_QWORD *)v6;
        v11 = (char *)*((_QWORD *)v6 + 1);
        *(_QWORD *)(v10 + 8) = v11;
        **((_QWORD **)v6 + 1) = v10;
        --*(_QWORD *)(v9 + 24);
        std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)(v6 + 16));
        operator delete(v6);

        v2 = *(_QWORD *)(a1 + 32);
        v6 = v11;
        goto LABEL_16;
      }
      v8 = 5;
    }
    (*(void (**)(void))(*v7 + 8 * v8))();
    goto LABEL_15;
  }
}

void __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_197(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x18D765024](*(_QWORD *)(a2 + 104));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_2;
  block[3] = &unk_1E1C00038;
  v8 = v4;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v5 = v4;
  LoadItem::Requester::performAsyncOnCallbackQueue(a2, block);

}

uint64_t __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a1 + 48, 0, 0, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __60__GEOTileLoader_proxy_failedToLoadAllPendingTilesWithError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleCoalesceTimer");
}

uint64_t __50__GEOTileLoader_proxy_canShrinkDiskCacheByAmount___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)proxyDidDeleteExternalTileData:(id)a3
{
  void *v4;

  geo_isolate_sync();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("GEOTileLoaderDidDeleteExternalTileDataNotification"), self);

}

void __48__GEOTileLoader_proxyDidDeleteExternalTileData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint8_t v3[8];
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__GEOTileLoader_proxyDidDeleteExternalTileData___block_invoke_2;
  v4[3] = &unk_1E1C00380;
  v4[4] = &v5;
  objc_msgSend(v1, "removeTilesMatchingPredicate:", v4);
  if (*((_BYTE *)v6 + 24))
  {
    GEOGetTileLoadingLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Removed file-backed tiles from the in-memory cache", v3, 2u);
    }

  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __48__GEOTileLoader_proxyDidDeleteExternalTileData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "fileURL"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = 1;
    *(_BYTE *)(v6 + 24) = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)proxy
{
  return self->_proxy;
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_internalDelegate, a3);
}

- (GEOTileLoaderInternalDelegate)internalDelegate
{
  return self->_internalDelegate;
}

- (void)setInternalDelegateQ:(id)a3
{
  objc_storeStrong((id *)&self->_internalDelegateQ, a3);
}

- (uint64_t)cachedTileForKey:(uint64_t)a3
{
  return objc_msgSend(a1, "cachedTileForKey:auditToken:", a3, 0);
}

- (id)cachedTileForKey:(uint64_t *)a3 auditToken:(void *)a4
{
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  unsigned int v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    v22 = *(_OWORD *)a3;
    LOBYTE(v7) = v22;
    goto LABEL_21;
  }
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "offlineCohortId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[GEOOfflineService activeStateForCohortId:](GEOOfflineService, "activeStateForCohortId:", v10);

  if (v11 >= 2u)
  {
    if (v11 == 2)
    {

      v12 = *(_BYTE *)a3 & 0x7F;
      if (v12 >= 0x40)
      {
        v13 = *a3;
        v15 = *a3;
      }
      else
      {
        v13 = *a3;
        v14 = v12 == 8;
        v15 = *a3 & 0x9F | 0x40;
        if (v14)
          v15 = *a3;
      }
      v7 = v13 & 0xFFFFFFFFFFFFFF00 | v15;
      goto LABEL_20;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v24 = v11;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
    }
  }

  v17 = -97;
  if ((*(_BYTE *)a3 & 0x60) == 0)
    v17 = -1;
  v7 = v17 & *a3;
LABEL_20:
  v18 = a3[1];
  *(_QWORD *)&v22 = v7;
  *((_QWORD *)&v22 + 1) = v18;
LABEL_21:

  v19 = 40;
  if ((v7 & 0x80u) == 0)
    v19 = 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 112) + v19), "tileForKey:", &v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersIsolater, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_internalDelegateQ, 0);
  objc_storeStrong((id *)&self->_internalDelegate, 0);
  objc_storeStrong((id *)&self->_tileDecodersIsolater, 0);
  objc_storeStrong((id *)&self->_tileDecoders, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_openersIsolater, 0);
  objc_storeStrong((id *)&self->_openers, 0);
  objc_storeStrong((id *)&self->_loadQ, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

- (uint64_t)initWithConfiguration:serverProxy:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)initWithConfiguration:serverProxy:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E1BFA498;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (_QWORD)_requestOnlineTiles
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E1BFA390;
  result[1] = v3;
  return result;
}

- (__n128)_loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E1BFA548;
  result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)_loadedTileForLocalKey:preliminary:quickly:tileDecoder:data:disburseTile:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
