@implementation _GEORegionalResourcesTileLoader

- (void)loadResourcesForTileKey:(uint64_t)a3 manifestConfiguration:(void *)a4 auditToken:(void *)a5 signpostID:(uint64_t)a6 finished:(void *)a7 error:(void *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  GEORegionalResourceTileData *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *global_queue;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v73;
  _QWORD v74[5];
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  objc_storeStrong((id *)(a1 + 16), a4);
  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", *(_QWORD *)(a1 + 16));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeTileGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc_init(GEORegionalResourceTileData);
  v21 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v20;

  v73 = a1;
  *(_OWORD *)(a1 + 36) = *(_OWORD *)a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (*(_QWORD *)(a3 + 1) >> 40) & 0x3FLL;
  if ((_DWORD)v23 == 1)
  {
    v32 = *(_QWORD *)(a3 + 1);
    if (v32 < objc_msgSend(v19, "attributionsCount"))
    {
      objc_msgSend(v19, "attributionAtIndex:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)v33;
        v69 = v15;
        objc_msgSend(*(id *)(a1 + 8), "addAttribution:", v33);
        v67 = v17;
        v68 = v16;
        if ((*(_QWORD *)(a3 + 1) >> 54))
        {
          v35 = v34;
          v36 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v36;
          v34 = v35;
          objc_msgSend(v38, "setWithObject:", v37);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          GEOAllPossibleFilterScales();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        GEORegionalResourceTileKeyActiveScenarios(a3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v66 = v34;
        objc_msgSend(v34, "resources");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
        if (!v50)
          goto LABEL_39;
        v51 = v50;
        v65 = a3;
        v70 = v19;
        v52 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v51; ++i)
          {
            if (*(_QWORD *)v78 != v52)
              objc_enumerationMutation(v41);
            v54 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
            if (objc_msgSend(v54, "_geo_isRelevantForScales:scenarios:", v31, v40))
            {
              objc_msgSend(v22, "addObject:", v54);
              if (objc_msgSend(v54, "resourceType") == 3)
              {
                v55 = *(void **)(v73 + 8);
                objc_msgSend(v54, "filename");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "addIcon:", v56);

              }
            }
          }
          v51 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
        }
        while (v51);
        goto LABEL_38;
      }
    }
  }
  else
  {
    if ((_DWORD)v23)
    {
LABEL_40:
      v71 = v19;
      +[GEOResourceRequester sharedRequester](GEOResourceRequester, "sharedRequester");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v15;
      v59 = (*(_QWORD *)(a3 + 1) >> 62) & 1;
      v60 = *(_QWORD *)(v73 + 16);
      global_queue = (void *)geo_get_global_queue();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __118___GEORegionalResourcesTileLoader_loadResourcesForTileKey_manifestConfiguration_auditToken_signpostID_finished_error___block_invoke;
      v74[3] = &unk_1E1C14B68;
      v75 = v17;
      v76 = v16;
      v74[4] = v73;
      v62 = v59;
      v15 = v58;
      v63 = v60;
      v19 = v71;
      objc_msgSend(v57, "fetchResources:force:unpack:manifestConfiguration:auditToken:signpostID:queue:handler:", v22, v62, 0, v63, v58, a6, global_queue, v74);

      goto LABEL_41;
    }
    v24 = *(_QWORD *)(a3 + 1);
    if (v24 < objc_msgSend(v19, "regionalResourcesCount"))
    {
      objc_msgSend(v19, "regionalResourceAtIndex:", v24);
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        v69 = v15;
        v70 = v19;
        v67 = v17;
        v68 = v16;
        if ((*(_QWORD *)(a3 + 1) >> 54))
        {
          v27 = (void *)v25;
          v28 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v28;
          v26 = v27;
          objc_msgSend(v30, "setWithObject:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          GEOAllPossibleFilterScales();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        GEORegionalResourceTileKeyActiveScenarios(a3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v66 = v26;
        objc_msgSend(v26, "resources");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
        if (!v42)
          goto LABEL_39;
        v43 = v42;
        v64 = v14;
        v65 = a3;
        v44 = *(_QWORD *)v82;
        do
        {
          for (j = 0; j != v43; ++j)
          {
            if (*(_QWORD *)v82 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
            if (objc_msgSend(v46, "_geo_isRelevantForScales:scenarios:", v31, v40))
            {
              objc_msgSend(v22, "addObject:", v46);
              v47 = objc_msgSend(v46, "resourceType");
              v48 = *(void **)(v73 + 8);
              objc_msgSend(v46, "filename");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47 == 3)
                objc_msgSend(v48, "addIcon:", v49);
              else
                objc_msgSend(v48, "addFilename:", v49);

            }
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
        }
        while (v43);
        v14 = v64;
LABEL_38:
        v19 = v70;
        a3 = v65;
LABEL_39:

        v16 = v68;
        v15 = v69;
        v17 = v67;
        goto LABEL_40;
      }
    }
  }
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v17 + 2))(v17, v39);

  }
LABEL_41:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_storeStrong((id *)&self->_tile, 0);
}

- (_GEORegionalResourcesTileLoader)init
{
  _GEORegionalResourcesTileLoader *v2;
  _GEORegionalResourcesTileLoader *v3;
  _GEORegionalResourcesTileLoader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GEORegionalResourcesTileLoader;
  v2 = -[_GEORegionalResourcesTileLoader init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_GEORegionalResourcesTileLoader cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_GEORegionalResourcesTileLoader;
  -[_GEORegionalResourcesTileLoader dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  GEOResourceLoader *resourceLoader;
  GEOResourceLoader *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  resourceLoader = self->_resourceLoader;
  self->_resourceLoader = 0;
  v5 = resourceLoader;

  os_unfair_lock_unlock(p_lock);
  -[GEOResourceLoader cancel](v5, "cancel");

}

- (uint64_t)tileKeyPtr
{
  return a1 + 36;
}

@end
