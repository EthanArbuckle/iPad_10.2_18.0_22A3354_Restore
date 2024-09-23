@implementation GEOSearchAttributionLoader

- (GEOSearchAttributionLoader)initWithAttributionManifest:(id)a3
{
  id v5;
  GEOSearchAttributionLoader *v6;
  GEOSearchAttributionLoader *v7;
  GEOSearchAttributionLoader *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOSearchAttributionLoader;
  v6 = -[GEOSearchAttributionLoader init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributionManifest, a3);
    v8 = v7;
  }

  return v7;
}

- (void)loadAttributionInfoForIdentifier:(id)a3 allowNetwork:(BOOL)a4 completionHandler:(id)a5
{
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  unint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  GEOSearchAttributionInfo *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  id *v57;
  id v58;
  id v59;
  id *v60;
  void *v61;
  id *v62;
  void *v63;
  void (**v64)(_QWORD, _QWORD, double);
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  void (**v69)(id, GEOSearchAttributionInfo *, _QWORD);
  void *v70;
  GEOSearchAttributionInfo *obj;
  void *v72;
  _QWORD block[4];
  id v74;
  id *v75;
  id *v76;
  id v77;
  id v78;
  void (**v79)(id, GEOSearchAttributionInfo *, _QWORD);
  _QWORD *v80;
  _QWORD v81[4];
  id v82;
  NSObject *v83;
  id v84;
  uint64_t v85;
  void (**v86)(id, GEOSearchAttributionInfo *, _QWORD);
  _BYTE *v87;
  _QWORD *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[3];
  char v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE buf[24];
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v69 = (void (**)(id, GEOSearchAttributionInfo *, _QWORD))a5;
  GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v66;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Loading attribution for identifier: (%{public}@)", buf, 0xCu);
  }

  +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 16);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v63, "length"))
  {
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    -[GEOSearchAttributionManifest searchAttributionSources]((id *)&self->_attributionManifest->super.super.isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v106;
LABEL_6:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v106 != v11)
          objc_enumerationMutation(v9);
        v13 = *(id **)(*((_QWORD *)&v105 + 1) + 8 * v12);
        -[GEOSearchAttributionSource sourceIdentifier](v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v66, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
          if (v10)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v62 = v13;

      if (!v62)
        goto LABEL_42;
      -[GEOSearchAttributionSource bestLocalizedAttribution](v62);
      v16 = objc_claimAutoreleasedReturnValue();
      v60 = (id *)v16;
      if (v16)
      {
        -[GEOLocalizedAttribution _readLogoURLs](v16);
        if (objc_msgSend(v60[6], "count")
          || (-[GEOLocalizedAttribution _readSnippetLogoURLs]((uint64_t)v60), objc_msgSend(v60[7], "count")))
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v99[0] = MEMORY[0x1E0C809B0];
          v99[1] = 3221225472;
          v99[2] = __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke;
          v99[3] = &unk_1E1C21CA8;
          v57 = v60;
          v100 = v57;
          v20 = v63;
          v101 = v20;
          v21 = v17;
          v102 = v21;
          v59 = v19;
          v103 = v59;
          v58 = v18;
          v104 = v58;
          v64 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x18D765024](v99);
          for (i = 1; i != 4; ++i)
          {
            v64[2](v64, 0, (double)i);
            v64[2](v64, 1, (double)i);
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "contentsOfDirectoryAtPath:error:", v20, 0);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          obj = (GEOSearchAttributionInfo *)v21;
          v24 = -[GEOSearchAttributionInfo countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v96;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v96 != v25)
                  objc_enumerationMutation(obj);
                v27 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
                objc_msgSend(v27, "lastPathComponent");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v72, "containsObject:", v28) & 1) == 0)
                  objc_msgSend(v70, "addObject:", v27);

              }
              v24 = -[GEOSearchAttributionInfo countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
            }
            while (v24);
          }

          v29 = objc_msgSend(v70, "count") == 0;
          GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v29)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v66;
              _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_DEBUG, "All necessary logos for '%{public}@' are already loaded", buf, 0xCu);
            }

            v53 = -[GEOSearchAttributionInfo initWithSource:localizedAttribution:logoPaths:snippetLogoPaths:]([GEOSearchAttributionInfo alloc], "initWithSource:localizedAttribution:logoPaths:snippetLogoPaths:", v62, v57, v58, v59);
            if (v69)
              v69[2](v69, v53, 0);

          }
          else
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v66;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v70;
              _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_INFO, "Missing some logos for '%{public}@': %{public}@", buf, 0x16u);
            }

            if (a4)
            {
              v93[0] = 0;
              v93[1] = v93;
              v93[2] = 0x2020000000;
              v94 = 0;
              GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1885A9000, v32, OS_LOG_TYPE_INFO, "Loading missing logos", buf, 2u);
              }

              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = dispatch_group_create();
              v34 = MEMORY[0x1E0C80D38];
              v89 = 0u;
              v90 = 0u;
              v91 = 0u;
              v92 = 0u;
              v65 = v70;
              v35 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v89, v113, 16);
              if (v35)
              {
                v67 = *(_QWORD *)v90;
                do
                {
                  for (k = 0; k != v35; ++k)
                  {
                    if (*(_QWORD *)v90 != v67)
                      objc_enumerationMutation(v65);
                    v37 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * k);
                    v38 = (void *)MEMORY[0x1E0C99E98];
                    -[GEOSearchAttributionInfo objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v37);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "URLWithString:", v39);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();

                    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "requestCounterTicketForType:auditToken:traits:", 5, v41, 0);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    dispatch_group_enter(v33);
                    *(_QWORD *)buf = 0;
                    *(_QWORD *)&buf[8] = buf;
                    *(_QWORD *)&buf[16] = 0x3032000000;
                    v110 = __Block_byref_object_copy__105;
                    v111 = __Block_byref_object_dispose__105;
                    v112 = 0;
                    v81[0] = MEMORY[0x1E0C809B0];
                    v81[1] = 3221225472;
                    v81[2] = __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_18;
                    v81[3] = &unk_1E1C21CF8;
                    v44 = v68;
                    v82 = v44;
                    v87 = buf;
                    v88 = v93;
                    v83 = v33;
                    v86 = v69;
                    v45 = v40;
                    v84 = v45;
                    v85 = v37;
                    +[GEODataURLSession asynchronousGetURL:kind:auditToken:requestCounterTicket:queue:completionHandler:](GEODataURLSession, "asynchronousGetURL:kind:auditToken:requestCounterTicket:queue:completionHandler:", v45, 5, v41, v43, MEMORY[0x1E0C80D38], v81);
                    v46 = objc_claimAutoreleasedReturnValue();
                    v47 = *(void **)(*(_QWORD *)&buf[8] + 40);
                    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v46;

                    objc_msgSend(v44, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
                    _Block_object_dispose(buf, 8);

                  }
                  v35 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v89, v113, 16);
                }
                while (v35);
              }

              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_21;
              block[3] = &unk_1E1C21D20;
              v74 = v66;
              v75 = v62;
              v76 = v57;
              v77 = v58;
              v78 = v59;
              v80 = v93;
              v79 = v69;
              dispatch_group_notify(v33, MEMORY[0x1E0C80D38], block);

              _Block_object_dispose(v93, 8);
            }
            else
            {
              GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = CFSTR("Attribution loader is not allowed to access the network, but cannot continue without it.");
                _os_log_impl(&dword_1885A9000, v54, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
              }

              if (v69)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Attribution loader is not allowed to access the network, but cannot continue without it."));
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(id, GEOSearchAttributionInfo *, void *))v69)[2](v69, 0, v55);

              }
            }
          }

        }
        else
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v56, OS_LOG_TYPE_DEBUG, "Attribution source has no logos. Calling back immediately.", buf, 2u);
          }

          obj = -[GEOSearchAttributionInfo initWithSource:localizedAttribution:logoPaths:snippetLogoPaths:]([GEOSearchAttributionInfo alloc], "initWithSource:localizedAttribution:logoPaths:snippetLogoPaths:", v62, v60, 0, 0);
          if (v69)
            ((void (*)(void))v69[2])();
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No matching localized attribution found for source: %@"), v62);
        obj = (GEOSearchAttributionInfo *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = obj;
          _os_log_impl(&dword_1885A9000, v51, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        if (v69)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, obj);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, GEOSearchAttributionInfo *, void *))v69)[2](v69, 0, v52);

        }
      }

    }
    else
    {
LABEL_12:

LABEL_42:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No matching attribution source found for %@"), v66);
      v62 = (id *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v62;
        _os_log_impl(&dword_1885A9000, v48, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      if (v69)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, v62);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, GEOSearchAttributionInfo *, void *))v69)[2](v69, 0, v61);

      }
    }
    v50 = v62;
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = CFSTR("Attribution logos container is missing.");
      _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("Attribution logos container is missing."));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
      ((void (*)(void))v69[2])();
  }

}

void __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke(uint64_t a1, int a2, double a3)
{
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = *(id **)(a1 + 32);
  if ((a2 & 1) != 0)
    -[GEOLocalizedAttribution snippetLogoURLs](v6);
  else
    -[GEOLocalizedAttribution logoURLs](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestURLForLogos:scale:", v7, a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v11, v9);
    v10 = 64;
    if (a2)
      v10 = 56;
    objc_msgSend(*(id *)(a1 + v10), "addObject:", v9);
  }

}

void __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  char v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v4 = *(_QWORD *)(a1 + 80);
  if (!*(_BYTE *)(*(_QWORD *)(v4 + 8) + 24))
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_2;
    v30[3] = &unk_1E1C21CD0;
    v33 = v4;
    v32 = *(id *)(a1 + 64);
    v31 = *(id *)(a1 + 40);
    v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v30);
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(void **)(a1 + 48);
        objc_msgSend(v3, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v8;
        v36 = 2114;
        v37 = v9;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Failed to load attribution logo from '%{public}@': %{public}@", buf, 0x16u);

      }
      objc_msgSend(v3, "error");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "receivedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v16 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543362;
          v35 = v16;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Loaded attribution logo from '%{public}@'. Writing to disk.", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 56), "stringByDeletingLastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v29);
        v19 = v29;
        if ((v18 & 1) == 0)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v35 = v19;
            _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Unable to create parent directory: %{public}@", buf, 0xCu);
          }

        }
        objc_msgSend(v3, "receivedData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 56);
        v28 = v19;
        v23 = objc_msgSend(v21, "writeToFile:options:error:", v22, 268435457, &v28);
        v24 = v28;

        if ((v23 & 1) != 0)
        {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
        }
        else
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = *(void **)(a1 + 56);
            *(_DWORD *)buf = 138543618;
            v35 = v27;
            v36 = 2114;
            v37 = v24;
            _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_ERROR, "Failed to write attribution logo %{public}@' to disk: %{public}@", buf, 0x16u);
          }

          ((void (**)(_QWORD, id))v5)[2](v5, v24);
        }

        goto LABEL_24;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v25 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        v35 = v25;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Didn't receive any data for '%{public}@'", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, 0);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    v5[2](v5, v10);
LABEL_24:

    goto LABEL_25;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_25:

}

void __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v3 + 24))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v5);
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
  }
  *(_BYTE *)(v3 + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_21(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  GEOSearchAttributionInfo *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[4];
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Finished loading attribution logos for '%{public}@'", (uint8_t *)&v7, 0xCu);
  }

  v4 = -[GEOSearchAttributionInfo initWithSource:localizedAttribution:logoPaths:snippetLogoPaths:]([GEOSearchAttributionInfo alloc], "initWithSource:localizedAttribution:logoPaths:snippetLogoPaths:", a1[5], a1[6], a1[7], a1[8]);
  v5 = *(_QWORD *)(a1[10] + 8);
  if (!*(_BYTE *)(v5 + 24))
  {
    v6 = a1[9];
    if (v6)
    {
      (*(void (**)(uint64_t, GEOSearchAttributionInfo *, _QWORD))(v6 + 16))(v6, v4, 0);
      v5 = *(_QWORD *)(a1[10] + 8);
    }
  }
  *(_BYTE *)(v5 + 24) = 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionManifest, 0);
}

@end
