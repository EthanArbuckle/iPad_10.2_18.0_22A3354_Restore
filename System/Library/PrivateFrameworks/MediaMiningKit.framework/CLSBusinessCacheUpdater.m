@implementation CLSBusinessCacheUpdater

- (CLSBusinessCacheUpdater)initWithBusinessCategoryCache:(id)a3
{
  id v5;
  CLSBusinessCacheUpdater *v6;
  CLSBusinessCacheUpdater *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSBusinessCacheUpdater;
  v6 = -[CLSBusinessCacheUpdater init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_businessCategoryCache, a3);

  return v7;
}

- (id)enrichedBusinessItemsByMuidsForBusinessItems:(id)a3 progressBlock:(id)a4
{
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, double);
  char v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  unint64_t v20;
  void *v21;
  double v22;
  CLSPOICache *v23;
  id v24;
  CLSPOICache *v25;
  void (**v26)(_QWORD);
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void (**v39)(_QWORD, _QWORD, double);
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  CLSPOICache *v48;
  id v49;
  void (**v50)(_QWORD, _QWORD, double);
  uint64_t *v51;
  uint8_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  uint8_t buf[8];
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v38 = a4;
  v6 = MEMORY[0x1D1796244]();
  v7 = (void (**)(_QWORD, _QWORD, double))v6;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  if (v6
    && (LOBYTE(v61) = 0,
        (*(void (**)(uint64_t, uint64_t *, double))(v6 + 16))(v6, &v61, 0.0),
        v8 = *((_BYTE *)v70 + 24) | v61,
        (*((_BYTE *)v70 + 24) = v8) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 41;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    }
    v9 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v37 = objc_msgSend(v40, "count");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v37);
    v39 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v37);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v11 = v40;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v66 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "muid");
          if (objc_msgSend(v15, "isEnriched"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v17);
          }
          else
          {
            -[CLSBusinessCategoryCache businessItemsForMuid:](self->_businessCategoryCache, "businessItemsForMuid:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "isEnriched"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

            }
            else
            {
              objc_msgSend(v41, "addObject:", v15);
            }
          }

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      }
      while (v12);
    }

    if (v39
      && (LOBYTE(v61) = 0,
          ((void (**)(_QWORD, uint64_t *, double))v39)[2](v39, &v61, 0.1),
          v19 = *((_BYTE *)v70 + 24) | v61,
          (*((_BYTE *)v70 + 24) = v19) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 68;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      v9 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v36 = objc_msgSend(v10, "count");
      v61 = 0;
      v62 = &v61;
      v63 = 0x2020000000;
      v64 = 0;
      if (objc_msgSend(v41, "count"))
      {
        v20 = objc_msgSend(v41, "count");
        *(_QWORD *)buf = 0;
        v74 = buf;
        v75 = 0x2020000000;
        LOBYTE(v76) = 0;
        v57 = 0;
        v58 = &v57;
        v59 = 0x2020000000;
        v60 = 0;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 1.0 / (double)v20 * 0.8;
        v23 = self->_businessCategoryCache;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __86__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForBusinessItems_progressBlock___block_invoke;
        v46[3] = &unk_1E84F8748;
        v51 = &v69;
        v52 = buf;
        v55 = 0x3FB999999999999ALL;
        v53 = &v61;
        v50 = v39;
        v46[4] = self;
        v24 = v21;
        v56 = v22;
        v47 = v24;
        v54 = &v57;
        v25 = v23;
        v48 = v25;
        v49 = v10;
        v26 = (void (**)(_QWORD))MEMORY[0x1D1796244](v46);
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v27 = v41;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v78, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v43;
LABEL_26:
          v30 = 0;
          while (1)
          {
            if (*(_QWORD *)v43 != v29)
              objc_enumerationMutation(v27);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v30), "muid"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v31);

            if ((unint64_t)objc_msgSend(v24, "count") >= 0x1E)
              v26[2](v26);
            if (*((_BYTE *)v58 + 24))
              break;
            if (v28 == ++v30)
            {
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v78, 16);
              if (v28)
                goto LABEL_26;
              break;
            }
          }
        }

        if (objc_msgSend(v24, "count") && !*((_BYTE *)v58 + 24))
          v26[2](v26);

        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(buf, 8);
      }
      v32 = objc_msgSend(v10, "count");
      v33 = v62[3];
      *(_QWORD *)buf = v37;
      v74 = (uint8_t *)(v32 - v36);
      v75 = v36;
      v76 = v33;
      v77 = 30;
      CLSPrintQueryPerformerProtocolStatisticsDescription((uint64_t)CFSTR("CLSBusinessGeoQuery.enrichBusiness"), buf);
      if (v39
        && (LOBYTE(v57) = 0,
            ((void (**)(_QWORD, uint64_t *, double))v39)[2](v39, &v57, 1.0),
            v34 = *((_BYTE *)v70 + 24) | v57,
            (*((_BYTE *)v70 + 24) = v34) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = 132;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        v9 = (id)MEMORY[0x1E0C9AA70];
      }
      else
      {
        v9 = v10;
      }
      _Block_object_dispose(&v61, 8);
    }

    v7 = v39;
  }
  _Block_object_dispose(&v69, 8);

  return v9;
}

- (id)enrichedBusinessItemsByMuidsForMuids:(id)a3 progressBlock:(id)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, double);
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  unint64_t v21;
  void *v22;
  id v23;
  void (**v24)(_QWORD);
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v34;
  CLSBusinessCacheUpdater *v35;
  uint64_t v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  id v44;
  id v45;
  void (**v46)(_QWORD, _QWORD, double);
  uint64_t *v47;
  uint8_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint8_t buf[8];
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint8_t v74[4];
  int v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = a4;
  v7 = MEMORY[0x1D1796244]();
  v8 = (void (**)(_QWORD, _QWORD, double))v7;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v37 = v6;
  if (!v7
    || (LOBYTE(v57) = 0,
        (*(void (**)(uint64_t, uint64_t *, double))(v7 + 16))(v7, &v57, 0.0),
        v9 = *((_BYTE *)v66 + 24) | v57,
        (*((_BYTE *)v66 + 24) = v9) == 0))
  {
    v36 = objc_msgSend(v6, "count");
    -[CLSBusinessCategoryCache businessItemsForMuids:](self->_businessCategoryCache, "businessItemsForMuids:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v6, "mutableCopy");
    v35 = self;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v36);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v62 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "muid"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "isEnriched"))
          {
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v19);
            objc_msgSend(v12, "removeObject:", v19);
          }

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      }
      while (v15);
    }

    if (v8)
    {
      LOBYTE(v57) = 0;
      ((void (**)(_QWORD, uint64_t *, double))v8)[2](v8, &v57, 0.2);
      v20 = *((_BYTE *)v66 + 24) | v57;
      *((_BYTE *)v66 + 24) = v20;
      if (v20)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = 158;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        v10 = (id)MEMORY[0x1E0C9AA70];
        goto LABEL_47;
      }
    }
    v34 = objc_msgSend(v13, "count");
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    if (!objc_msgSend(v12, "count"))
      goto LABEL_40;
    v21 = objc_msgSend(v12, "count");
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v70 = buf;
    v71 = 0x2020000000;
    LOBYTE(v72) = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __78__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForMuids_progressBlock___block_invoke;
    v43[3] = &unk_1E84F8770;
    v47 = &v65;
    v48 = buf;
    v51 = 0x3FC999999999999ALL;
    v49 = &v57;
    v46 = v8;
    v43[4] = v35;
    v23 = v22;
    v52 = 1.0 / (double)v21 * 0.8;
    v44 = v23;
    v50 = &v53;
    v45 = v13;
    v24 = (void (**)(_QWORD))MEMORY[0x1D1796244](v43);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v25 = v12;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v76, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v40;
LABEL_23:
      v28 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v25);
        objc_msgSend(v23, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v28));
        if ((unint64_t)objc_msgSend(v23, "count") >= 0x1F)
          v24[2](v24);
        if (*((_BYTE *)v54 + 24))
          break;
        if (*((_BYTE *)v66 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v74 = 67109120;
            v75 = 207;
            _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", v74, 8u);
          }

          v29 = 0;
          goto LABEL_39;
        }
        if (v26 == ++v28)
        {
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v76, 16);
          if (v26)
            goto LABEL_23;
          break;
        }
      }
    }

    if (objc_msgSend(v23, "count") && !*((_BYTE *)v54 + 24))
      v24[2](v24);
    v29 = 1;
LABEL_39:

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);

    if ((v29 & 1) != 0)
    {
LABEL_40:
      v30 = objc_msgSend(v13, "count");
      v31 = v58[3];
      *(_QWORD *)buf = v36;
      v70 = (uint8_t *)(v30 - v34);
      v71 = v34;
      v72 = v31;
      v73 = 30;
      CLSPrintQueryPerformerProtocolStatisticsDescription((uint64_t)CFSTR("CLSBusinessGeoQuery.enrichByMUID"), buf);
      if (!v8
        || (LOBYTE(v53) = 0,
            ((void (**)(_QWORD, uint64_t *, double))v8)[2](v8, &v53, 1.0),
            v32 = *((_BYTE *)v66 + 24) | v53,
            (*((_BYTE *)v66 + 24) = v32) == 0))
      {
        v10 = v13;
        goto LABEL_46;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 221;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
    }
    v10 = (id)MEMORY[0x1E0C9AA70];
LABEL_46:
    _Block_object_dispose(&v57, 8);
LABEL_47:

    goto LABEL_48;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 139;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
  }
  v10 = (id)MEMORY[0x1E0C9AA70];
LABEL_48:
  _Block_object_dispose(&v65, 8);

  return v10;
}

- (id)_resolvedBusinessMUIDs:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  dispatch_block_t v14;
  CLSBusinessGeoServiceQuery *v15;
  CLSGeoMapQueryHelper *v16;
  CLSPOICache *v17;
  uint64_t v18;
  id v19;
  CLSPOICache *v20;
  id v21;
  char v22;
  void *v24;
  char v25;
  _QWORD v26[4];
  CLSPOICache *v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _DWORD v44[4];
  uint64_t buf;
  uint64_t *p_buf;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1D1796244]();
  v11 = (void *)v10;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v24 = v8;
  if (v10
    && (LOBYTE(v34) = 0,
        (*(void (**)(uint64_t, uint64_t *, double))(v10 + 16))(v10, &v34, 0.0),
        v12 = *((_BYTE *)v41 + 24) | v34,
        (*((_BYTE *)v41 + 24) = v12) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0xE404000100;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
    v13 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v14 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_3834);
    buf = 0;
    p_buf = &buf;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__3835;
    v49 = __Block_byref_object_dispose__3836;
    v50 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__3835;
    v38 = __Block_byref_object_dispose__3836;
    v39 = 0;
    v15 = -[CLSBusinessGeoServiceQuery initWithMUIDs:]([CLSBusinessGeoServiceQuery alloc], "initWithMUIDs:", v8, v8);
    v16 = -[CLSGeoMapQueryHelper initWithQueryObject:]([CLSGeoMapQueryHelper alloc], "initWithQueryObject:", v15);
    v17 = self->_businessCategoryCache;
    v18 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __70__CLSBusinessCacheUpdater__resolvedBusinessMUIDs_progressBlock_error___block_invoke_14;
    v31[3] = &unk_1E84F87B8;
    v19 = v11;
    v32 = v19;
    v33 = &v40;
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __70__CLSBusinessCacheUpdater__resolvedBusinessMUIDs_progressBlock_error___block_invoke_2;
    v26[3] = &unk_1E84F87E0;
    v29 = &buf;
    v30 = &v34;
    v20 = v17;
    v27 = v20;
    v21 = v14;
    v28 = v21;
    -[CLSGeoMapQueryHelper launchQueryWithCancellerBlock:completionBlock:](v16, "launchQueryWithCancellerBlock:completionBlock:", v31, v26);
    dispatch_block_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (a5)
      *a5 = objc_retainAutorelease((id)p_buf[5]);
    if (v11
      && (v25 = 0,
          (*((void (**)(id, char *, double))v19 + 2))(v19, &v25, 1.0),
          v22 = *((_BYTE *)v41 + 24) | v25,
          (*((_BYTE *)v41 + 24) = v22) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v44[0] = 67109120;
        v44[1] = 263;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)v44, 8u);
      }
      v13 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v13 = (id)v35[5];
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&buf, 8);

  }
  _Block_object_dispose(&v40, 8);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessCategoryCache, 0);
}

uint64_t __70__CLSBusinessCacheUpdater__resolvedBusinessMUIDs_progressBlock_error___block_invoke_14(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

void __70__CLSBusinessCacheUpdater__resolvedBusinessMUIDs_progressBlock_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CLSBusinessItem *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (a2)
  {
    objc_msgSend(v9, "resultingMapItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
          v18 = [CLSBusinessItem alloc];
          v19 = -[CLSBusinessItem initFromMapItem:isoCountryCode:categoryOnly:](v18, "initFromMapItem:isoCountryCode:categoryOnly:", v17, 0, 0, (_QWORD)v23);
          if (v19)
            objc_msgSend(v11, "addObject:", v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 32), "updateBusinessItems:", v11);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForMuids_progressBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2
    && (buf[0] = 0,
        (*(void (**)(uint64_t, uint8_t *, double))(v2 + 16))(v2, buf, *(double *)(a1 + 96)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= buf[0]) != 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __78__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForMuids_progressBlock___block_invoke_2;
    v23[3] = &unk_1E84F8720;
    v5 = *(id *)(a1 + 56);
    v26 = *(_OWORD *)(a1 + 96);
    v6 = *(_QWORD *)(a1 + 64);
    v24 = v5;
    v25 = v6;
    v22 = 0;
    objc_msgSend(v3, "_resolvedBusinessMUIDs:progressBlock:error:", v4, v23, &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;

    if (v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Received a GeoService error, stopping Business Item resolution: (%@)", buf, 0xCu);
      }
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v17 = v7;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            v15 = *(void **)(a1 + 48);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "muid"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        }
        while (v11);
      }

      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
      v7 = v17;
    }

  }
}

uint64_t __78__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForMuids_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, *(double *)(a1 + 48) + *(double *)(a1 + 56) * a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

void __86__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForBusinessItems_progressBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  if (v2
    && (buf[0] = 0,
        (*(void (**)(uint64_t, uint8_t *, double))(v2 + 16))(v2, buf, *(double *)(a1 + 104)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) |= buf[0]) != 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __86__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForBusinessItems_progressBlock___block_invoke_2;
    v24[3] = &unk_1E84F8720;
    v5 = *(id *)(a1 + 64);
    v27 = *(_OWORD *)(a1 + 104);
    v6 = *(_QWORD *)(a1 + 72);
    v25 = v5;
    v26 = v6;
    v23 = 0;
    objc_msgSend(v3, "_resolvedBusinessMUIDs:progressBlock:error:", v4, v24, &v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v23;
    if (v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v8;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Received a GeoService error, stopping Business Item resolution: (%@)", buf, 0xCu);
      }
    }
    else
    {
      v9 = (id)objc_msgSend(*(id *)(a1 + 48), "updateBusinessItems:", v7);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v18 = v7;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            v16 = *(void **)(a1 + 56);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "muid"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        }
        while (v12);
      }

      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
      v7 = v18;
    }

  }
}

uint64_t __86__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForBusinessItems_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, *(double *)(a1 + 48) + *(double *)(a1 + 56) * a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

@end
