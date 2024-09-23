@implementation GEOResourcesVersionMigrationTask

void __173___GEOResourcesVersionMigrationTask_initForWithMigrator_manifestConfiguration_newTileGroup_inResourceManifest_dataSet_oldTileGroup_activeScales_activeScenarios_activeNames___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

void __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  unsigned int v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  unsigned int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _DWORD *v45;
  uint64_t v46;
  _DWORD *v47;
  unint64_t v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  unint64_t v60;
  unsigned int v61;
  void *v62;
  unint64_t v63;
  void *v64;
  int v65;
  void *v66;
  id v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  void *v73;
  unsigned int v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  int v83;
  double Current;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  char BOOL;
  void *v92;
  int v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  id v99;
  __int128 v100;
  uint64_t v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  uint64_t v107;
  id v108;
  id v109;
  void *v110;
  _QWORD v111[4];
  id v112;
  id v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD block[4];
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  uint8_t v131[128];
  uint8_t buf[4];
  void *v133;
  __int16 v134;
  double v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  v107 = a1;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  v7 = 0x1E0C99000uLL;
  if (v6)
  {
    v8 = *(void **)(v5 + 80);
    if (v8)
    {
      v9 = *(void **)(v5 + 48);
      v10 = *(id *)(v5 + 40);
      v11 = v9;
      v12 = v6;
      v13 = v8;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "resourceIndexsCount"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "resourceIndexsCount"))
      {
        v15 = 0;
        do
        {
          v16 = objc_msgSend(v10, "resourceIndexAtIndex:", v15);
          if (objc_msgSend(v11, "resourcesCount") > (unint64_t)v16)
          {
            objc_msgSend(v11, "resourceAtIndex:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v17, "regionsCount")
              && objc_msgSend(v17, "_geo_isRelevantForScales:scenarios:", v12, v13))
            {
              objc_msgSend(v14, "addObject:", v17);
            }

          }
          ++v15;
        }
        while (v15 < objc_msgSend(v10, "resourceIndexsCount"));
      }
      v18 = v10;
      v19 = v11;
      v20 = v12;
      v21 = v13;
      v22 = v14;
      if (objc_msgSend(v18, "attributionIndexsCount"))
      {
        v23 = 0;
        v108 = v18;
        v104 = v19;
        do
        {
          v24 = objc_msgSend(v18, "attributionIndexAtIndex:", v23);
          if (objc_msgSend(v19, "attributionsCount") > (unint64_t)v24)
          {
            objc_msgSend(v19, "attributionAtIndex:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v25, "regionsCount"))
            {
              v128 = 0u;
              v129 = 0u;
              v126 = 0u;
              v127 = 0u;
              objc_msgSend(v25, "resources");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v127;
                do
                {
                  for (i = 0; i != v28; ++i)
                  {
                    if (*(_QWORD *)v127 != v29)
                      objc_enumerationMutation(v26);
                    v31 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
                    if (objc_msgSend(v31, "_geo_isRelevantForScales:scenarios:", v20, v21))
                      objc_msgSend(v22, "addObject:", v31);
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
                }
                while (v28);
              }

              v18 = v108;
              v19 = v104;
            }

          }
          ++v23;
        }
        while (v23 < objc_msgSend(v18, "attributionIndexsCount"));
      }

      v32 = v18;
      v33 = v19;
      v109 = v20;
      v34 = v21;
      v35 = v32;
      v105 = v34;
      v36 = v22;
      if (!objc_msgSend(v32, "tileSetsCount"))
        goto LABEL_69;
      v37 = 0;
      v102 = v36;
      while (1)
      {
        v38 = objc_msgSend(v35, "tileSetAtIndex:", v37);
        if ((unint64_t)objc_msgSend(v33, "tileSetsCount") <= HIDWORD(v38))
          goto LABEL_56;
        objc_msgSend(v33, "tileSetAtIndex:", HIDWORD(v38));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = 0u;
        v127 = 0u;
        v128 = 0u;
        v129 = 0u;
        objc_msgSend(v39, "validVersions");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
        if (!v41)
          goto LABEL_55;
        v42 = v41;
        v43 = *(_QWORD *)v127;
LABEL_32:
        v44 = 0;
        while (1)
        {
          if (*(_QWORD *)v127 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_DWORD **)(*((_QWORD *)&v126 + 1) + 8 * v44);
          if (!v45)
          {
            if (!(_DWORD)v38)
            {
              v53 = 0;
LABEL_54:
              v35 = v32;
              v36 = v102;
              goto LABEL_55;
            }
            goto LABEL_37;
          }
          if (v45[21] == (_DWORD)v38)
            break;
LABEL_37:
          if (v42 == ++v44)
          {
            v46 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
            v42 = v46;
            if (!v46)
              goto LABEL_54;
            goto LABEL_32;
          }
        }
        v47 = v45;

        -[GEOTileSetVersion _readGenericTiles]((uint64_t)v47);
        if (!*((_QWORD *)v47 + 7))
        {
          v40 = v47;
          goto LABEL_54;
        }
        v48 = 0;
        v35 = v32;
        v36 = v102;
        do
        {
          v49 = -[GEOTileSetVersion genericTileAtIndex:]((uint64_t)v47, v48);
          if ((v50 & 0x100000000) != 0)
          {
            v51 = v49;
            if (objc_msgSend(v33, "resourcesCount") > (unint64_t)v49)
            {
              objc_msgSend(v33, "resourceAtIndex:", v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v52, "_geo_isRelevantForScales:scenarios:", v109, v105)
                && (objc_msgSend(v102, "containsObject:", v52) & 1) == 0)
              {
                objc_msgSend(v102, "addObject:", v52);
              }

            }
          }
          ++v48;
          -[GEOTileSetVersion _readGenericTiles]((uint64_t)v47);
        }
        while (v48 < *((_QWORD *)v47 + 7));
        v40 = v47;
LABEL_55:

LABEL_56:
        if (++v37 >= (unint64_t)objc_msgSend(v35, "tileSetsCount"))
        {
LABEL_69:

          v7 = 0x1E0C99000uLL;
          goto LABEL_70;
        }
      }
    }
  }
  v54 = *(void **)(v5 + 88);
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Nothing to do"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2;
    block[3] = &unk_1E1BFF970;
    v98 = *(NSObject **)(v107 + 40);
    v99 = *(id *)(v107 + 48);
    v124 = v97;
    v125 = v99;
    v67 = v97;
    dispatch_async(v98, block);

    v66 = v125;
    goto LABEL_101;
  }
  v55 = *(void **)(v5 + 48);
  v56 = *(id *)(v5 + 40);
  v57 = v55;
  v58 = v54;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v56, "resourceIndexsCount"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "resourceIndexsCount"))
  {
    v60 = 0;
    do
    {
      v61 = objc_msgSend(v56, "resourceIndexAtIndex:", v60);
      if (objc_msgSend(v57, "resourcesCount") > (unint64_t)v61)
      {
        objc_msgSend(v57, "resourceAtIndex:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v62, "regionsCount"))
        {
          if (objc_msgSend(v62, "_geo_isExplicit"))
          {
            objc_msgSend(v62, "filename");
            v63 = v7;
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v58, "containsObject:", v64);

            v7 = v63;
            if (v65)
              objc_msgSend(v59, "addObject:", v62);
          }
        }

      }
      ++v60;
    }
    while (v60 < objc_msgSend(v56, "resourceIndexsCount"));
  }

  v36 = v59;
LABEL_70:
  objc_msgSend(*(id *)(v7 + 3560), "array");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v7 + 3560), "array");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v67 = v36;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
  if (!v68)
    goto LABEL_99;
  v70 = v68;
  v71 = *(_QWORD *)v120;
  *(_QWORD *)&v69 = 138478083;
  v100 = v69;
  v103 = v67;
  v106 = v66;
  v101 = *(_QWORD *)v120;
  do
  {
    for (j = 0; j != v70; ++j)
    {
      if (*(_QWORD *)v120 != v71)
        objc_enumerationMutation(v67);
      v73 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
      v74 = objc_msgSend(v73, "connectionType", v100);
      v75 = v66;
      if (v74 >= 2)
      {
        if (v74 == 3)
          goto LABEL_92;
        if (v74 != 2)
          continue;
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)(v107 + 32) + 64), "staleResources");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
        if (v77)
        {
          v78 = v77;
          v79 = *(_QWORD *)v116;
          while (2)
          {
            for (k = 0; k != v78; ++k)
            {
              if (*(_QWORD *)v116 != v79)
                objc_enumerationMutation(v76);
              v81 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * k);
              objc_msgSend(v81, "desiredResource");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_msgSend(v82, "isEqual:", v73);

              if (v83)
              {
                Current = CFAbsoluteTimeGetCurrent();
                objc_msgSend(v81, "originalTimestamp");
                v86 = Current - v85;
                v87 = CFAbsoluteTimeGetCurrent();
                objc_msgSend(v81, "originalTimestamp");
                v89 = v87 - v88;
                v90 = v86 >= 0.0 ? v89 : -v89;
                if (v90 > (double)objc_msgSend(v73, "preferWiFiAllowedStaleThreshold"))
                {
                  GEOGetResourceManifestLog();
                  v94 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v73, "filename");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v100;
                    v133 = v95;
                    v134 = 2048;
                    v135 = v90;
                    _os_log_impl(&dword_1885A9000, v94, OS_LOG_TYPE_INFO, "Resource '%{private}@' has been stale for %f seconds, which is too long. Will force this resource to load over any type of connection.", buf, 0x16u);

                  }
                  v67 = v103;
                  v66 = v106;
                  v75 = v106;
                  v71 = v101;
                  goto LABEL_96;
                }
              }
            }
            v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
            if (v78)
              continue;
            break;
          }
        }

        BOOL = GEOConfigGetBOOL(GeoServicesConfig_PreferWiFiResourcesCanFallBackToNothing, (uint64_t)off_1EDF4D368);
        v75 = v110;
        v67 = v103;
        v66 = v106;
        v71 = v101;
        if ((BOOL & 1) == 0)
        {
          objc_msgSend(*(id *)(v107 + 32), "_staleResourceForResource:", v73);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = objc_msgSend(v92, "hasFallbackResource");

          v75 = v106;
          if (v93)
LABEL_92:
            v75 = v110;
        }
      }
LABEL_96:
      objc_msgSend(v75, "addObject:", v73);
    }
    v70 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
  }
  while (v70);
LABEL_99:

  objc_msgSend(*(id *)(*(_QWORD *)(v107 + 32) + 144), "setTotalUnitCount:", objc_msgSend(v67, "count"));
  v111[0] = MEMORY[0x1E0C809B0];
  v111[1] = 3221225472;
  v111[2] = __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_80;
  v111[3] = &unk_1E1C09550;
  v96 = *(void **)(v107 + 40);
  v112 = *(id *)(v107 + 32);
  v113 = v96;
  v114 = *(id *)(v107 + 48);
  objc_msgSend(v112, "_loadImmediateResources:conditionalWifiResources:completionHandler:", v66, v110, v111);

LABEL_101:
}

uint64_t __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_80(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v11 + 24))
  {
    objc_storeStrong((id *)(v11 + 128), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), a3);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2_81;
    v21 = &unk_1E1BFF970;
    v12 = *(NSObject **)(a1 + 40);
    v23 = *(id *)(a1 + 48);
    v22 = v10;
    dispatch_async(v12, &v18);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 96);
    *(_QWORD *)(v13 + 96) = 0;

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 104);
    *(_QWORD *)(v15 + 104) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "_removeRunningTask:", *(_QWORD *)(a1 + 32), v18, v19, v20, v21);

  }
}

uint64_t __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2_81(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __43___GEOResourcesVersionMigrationTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id WeakRetained;
  _QWORD block[4];
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 24);
  *(_BYTE *)(v2 + 24) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 168);
  *(_QWORD *)(v4 + 168) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "cancel");
  if (v3)
  {
    v6 = (void *)MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
    v7 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v7 + 96);
    v8 = *(void **)(v7 + 104);
    *(_QWORD *)(v7 + 96) = 0;
    v10 = v8;

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 104);
    *(_QWORD *)(v11 + 104) = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43___GEOResourcesVersionMigrationTask_cancel__block_invoke_2;
    block[3] = &unk_1E1C01F48;
    v16 = v6;
    v13 = v6;
    dispatch_async(v10, block);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_removeRunningTask:", *(_QWORD *)(a1 + 32));

}

void __43___GEOResourcesVersionMigrationTask_cancel__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __55___GEOResourcesVersionMigrationTask_populateTileGroup___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t n;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t ii;
  void *v55;
  id v56;
  void *v57;
  void *obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint8_t v94[128];
  uint8_t buf[4];
  void *v96;
  _BYTE v97[128];
  uint64_t v98;

  v1 = a1;
  v98 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "count"))
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 128), "mutableCopy");
    objc_msgSend(*(id *)(v1 + 40), "setActiveResources:", v2);

  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v3 = *(id *)(*(_QWORD *)(v1 + 32) + 136);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v86 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        GEOGetResourceManifestLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "filename");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v96 = v10;
          _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Looking for fallback information for stale resource '%{private}@'", buf, 0xCu);

        }
        objc_msgSend(*(id *)(v1 + 32), "_staleResourceForResource:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 40), "addStaleResource:", v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E1E811A8);
  v13 = objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 48), "resources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v82;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v82 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v18);
        if (!objc_msgSend(v19, "regionsCount")
          && objc_msgSend(v19, "filtersCount")
          && objc_msgSend(v19, "_geo_isRelevantForScales:scenarios:", 0, v13))
        {
          objc_msgSend(*(id *)(v1 + 40), "addExplicitResource:", v19);
        }
        ++v18;
      }
      while (v16 != v18);
      v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
      v16 = v20;
    }
    while (v20);
  }

  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __55___GEOResourcesVersionMigrationTask_populateTileGroup___block_invoke_86;
  v79[3] = &unk_1E1C09578;
  v56 = v12;
  v80 = v56;
  v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v79);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(*(id *)(v1 + 40), "activeResources");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v76 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * j), "filename");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v21)[2](v21, v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
    }
    while (v24);
  }
  v57 = (void *)v13;

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(*(id *)(v1 + 40), "explicitResources");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v72;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v72 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * k), "filename");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v21)[2](v21, v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
    }
    while (v30);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(*(id *)(v1 + 40), "staleResources");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v68;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v68 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * m);
        objc_msgSend(v39, "fallbackResource");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "hasFilename");

        if (v41)
        {
          objc_msgSend(v39, "fallbackResource");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "filename");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v21)[2](v21, v43);

        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
    }
    while (v36);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 48), "attributions");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v90, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v64;
    do
    {
      for (n = 0; n != v45; ++n)
      {
        if (*(_QWORD *)v64 != v46)
          objc_enumerationMutation(obj);
        v48 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * n);
        if (!objc_msgSend(v48, "regionsCount"))
        {
          v49 = v1;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          objc_msgSend(v48, "resources");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v60;
            do
            {
              for (ii = 0; ii != v52; ++ii)
              {
                if (*(_QWORD *)v60 != v53)
                  objc_enumerationMutation(v50);
                objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * ii), "filename");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v21)[2](v21, v55);

              }
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
            }
            while (v52);
          }

          v1 = v49;
        }
      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v90, 16);
    }
    while (v45);
  }

  objc_msgSend(*(id *)(v1 + 40), "setResourceCanonicalNameToFileName:", v56);
}

void __55___GEOResourcesVersionMigrationTask_populateTileGroup___block_invoke_86(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "length"))
  {
    GEOCanonicalResourceNameForVersionedName(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

  }
}

void __104___GEOResourcesVersionMigrationTask__loadImmediateResources_conditionalWifiResources_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "checkNetworkError:sendingGeoDErrorIfApplicable:", v6, -1001);

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 168);
    *(_QWORD *)(v8 + 168) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "becomeCurrentWithPendingUnitCount:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v10 = objc_alloc(*(Class *)(a1 + 96));
    v25 = *(_QWORD *)(a1 + 48);
    v26 = v10;
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 64);
    v24 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 104);
    v16 = *(_QWORD *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 80);
    GEOGetResourceManifestLog();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = 0;
    v18 = objc_msgSend(v26, "initWithTargetDirectory:auditToken:baseURL:alternateURLs:proxyURL:resources:forceUpdateCheck:maximumConcurrentLoads:additionalDirectoryToConsider:log:signpostID:", v25, v11, v24, v12, v16, v13, v23, v14, v15, v17, 0);
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 120);
    *(_QWORD *)(v19 + 120) = v18;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setRequiresWiFi:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "resignCurrent");
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 120);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __104___GEOResourcesVersionMigrationTask__loadImmediateResources_conditionalWifiResources_completionHandler___block_invoke_2;
    v27[3] = &unk_1E1C095A0;
    v27[4] = v21;
    v28 = v5;
    v29 = *(id *)(a1 + 40);
    v30 = *(id *)(a1 + 88);
    objc_msgSend(v22, "startWithCompletionHandler:callbackQueue:", v27, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  }
}

void __104___GEOResourcesVersionMigrationTask__loadImmediateResources_conditionalWifiResources_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "arrayWithArray:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v5);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
  objc_msgSend(v6, "removeObjectsInArray:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 168);
  *(_QWORD *)(v7 + 168) = 0;

}

@end
