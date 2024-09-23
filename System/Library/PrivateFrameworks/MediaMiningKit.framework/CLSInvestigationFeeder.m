@implementation CLSInvestigationFeeder

- (CLSInvestigationFeeder)init
{
  CLSInvestigationFeeder *v2;
  CLSInvestigationFeeder *v3;
  uint64_t v4;
  NSMutableSet *focusItems;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSInvestigationFeeder;
  v2 = -[CLSInvestigationFeeder init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_locationClusteringAlgorithm = 0;
    v2->_allowsInterview = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    focusItems = v3->_focusItems;
    v3->_focusItems = (NSMutableSet *)v4;

  }
  return v3;
}

- (unint64_t)numberOfItems
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSDate)universalStartDate
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSDate)universalEndDate
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSDate)localStartDate
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSDate)localEndDate
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)localStartDateComponents
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)localEndDateComponents
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)approximateLocation
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)allItems
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)privateItems
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)sharedItems
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)itemAtIndex:(unint64_t)a3
{
  id v3;

  CLSAbstractMethodException(self, a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  CLSAbstractMethodException(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  CLSAbstractMethodException(self, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (unint64_t)numberOfShinyGemItems
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)numberOfRegularGemItems
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (double)behavioralScore
{
  id v2;

  CLSAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)_enumerateLocationClustersWithGaussians:(id)a3 enumerationBlock:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, void *, char *, double, double, double);
  unint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[6];
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, void *, char *, double, double, double))a4;
  if (objc_msgSend(v5, "count"))
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v7 = objc_msgSend(v5, "count");
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke;
    v37[3] = &unk_1E84F7D18;
    v39 = &v45;
    v40 = &v41;
    v10 = v8;
    v38 = v10;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v37);
    v11 = (double)(unint64_t)v46[3];
    v12 = (double)v7;
    v33 = 0;
    v34 = (double *)&v33;
    v35 = 0x2020000000;
    v36 = 0;
    v32[0] = v9;
    v32[1] = 3221225472;
    v32[2] = __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke_2;
    v32[3] = &unk_1E84F7D40;
    v13 = v11 / (double)v7;
    v32[4] = &v33;
    *(double *)&v32[5] = v13;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v32);
    v14 = v34[3];
    objc_msgSend(v5, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v9;
    v30[1] = 3221225472;
    v30[2] = __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke_3;
    v30[3] = &unk_1E84F7D68;
    v16 = v10;
    v31 = v16;
    objc_msgSend(v15, "sortedArrayUsingComparator:", v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v49, 16);
    if (v19)
    {
      v20 = sqrt(v14 / v12) * 3.0 * 0.25;
      v21 = *(_QWORD *)v27;
LABEL_4:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22);
        v25 = 0;
        objc_msgSend(v5, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v23, v24, &v25, v20, v13, (double)(unint64_t)v42[3]);
        LOBYTE(v23) = v25 == 0;

        if ((v23 & 1) == 0)
          break;
        if (v19 == ++v22)
        {
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v49, 16);
          if (v19)
            goto LABEL_4;
          break;
        }
      }
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);
  }

}

- (void)enumeratePersonNames:(id)a3 withGaussiansUsingBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  unint64_t v19;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    v8 = v7;
    v31 = 0;
    v32 = (double *)&v31;
    v33 = 0x2020000000;
    v9 = MEMORY[0x1E0C809B0];
    v34 = 0;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __71__CLSInvestigationFeeder_enumeratePersonNames_withGaussiansUsingBlock___block_invoke;
    v28[3] = &unk_1E84F7D90;
    v30 = &v31;
    v10 = v5;
    v29 = v10;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v28);
    v11 = v32[3];
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    v14 = (double)v8;
    v15 = v11 / (double)v8;
    if (v13)
    {
      v16 = *(_QWORD *)v25;
      v17 = 0.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v12);
          v19 = objc_msgSend(v12, "countForObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v17 = v17 + ((double)v19 - v15) * ((double)v19 - v15);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      }
      while (v13);
    }
    else
    {
      v17 = 0.0;
    }

    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __71__CLSInvestigationFeeder_enumeratePersonNames_withGaussiansUsingBlock___block_invoke_2;
    v20[3] = &unk_1E84F7DB8;
    v21 = v6;
    v22 = sqrt(v17 / v14) * 3.0 * 0.25;
    v23 = v15;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v20);

    _Block_object_dispose(&v31, 8);
  }

}

- (id)_prepareFeederWithServiceManager:(id)a3 locationCache:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  CLSClueCollection *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  char v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  CLSClueCollection *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  char v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  uint64_t *v73;
  _QWORD v74[5];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t *v81;
  uint64_t *v82;
  _QWORD v83[6];
  _QWORD v84[4];
  id v85;
  uint64_t *v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  char v94;
  void *v95;
  _QWORD v96[2];
  int v97;
  int v98;
  uint64_t buf;
  uint64_t *p_buf;
  uint64_t v101;
  char v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v54 = a4;
  v9 = a5;
  v10 = MEMORY[0x1D1796244]();
  v11 = (void *)v10;
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  if (!v10
    || (LOBYTE(v97) = 0,
        (*(void (**)(uint64_t, int *, double))(v10 + 16))(v10, &v97, 0.0),
        v12 = *((_BYTE *)v92 + 24) | v97,
        (*((_BYTE *)v92 + 24) = v12) == 0))
  {
    v50 = -[CLSClueCollection initWithServiceManager:]([CLSClueCollection alloc], "initWithServiceManager:", v8);
    v52 = (void *)objc_opt_new();
    v51 = (void *)objc_opt_new();
    v46 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    -[CLSInvestigationFeeder allItems](self, "allItems");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSInvestigationFeeder focusPersonLocalIdentifiers](self, "focusPersonLocalIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke;
    v87[3] = &unk_1E84F7DE0;
    v45 = v16;
    v88 = v45;
    v48 = v14;
    v89 = v48;
    v47 = v15;
    v90 = v47;
    v53 = (void *)MEMORY[0x1D1796244](v87);
    v84[0] = v17;
    v84[1] = 3221225472;
    v84[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2;
    v84[3] = &unk_1E84F94F0;
    v18 = v11;
    v85 = v18;
    v86 = &v91;
    -[CLSInvestigationFeeder locationClustersWithProgressBlock:](self, "locationClustersWithProgressBlock:", v84);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (*((_BYTE *)v92 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 0x12404000100;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
      }
      v13 = 0;
      goto LABEL_30;
    }
    buf = 0;
    p_buf = &buf;
    v101 = 0x2020000000;
    v102 = 1;
    v83[0] = v17;
    v83[1] = 3221225472;
    v83[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_154;
    v83[3] = &unk_1E84F7E30;
    v83[4] = self;
    v83[5] = &buf;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v83);
    v74[0] = v17;
    v74[1] = 3221225472;
    v74[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_3;
    v74[3] = &unk_1E84F7EC8;
    v81 = &buf;
    v74[4] = self;
    v21 = v53;
    v79 = v21;
    v42 = v18;
    v80 = v42;
    v82 = &v91;
    v75 = v54;
    v41 = v8;
    v76 = v41;
    v22 = v51;
    v77 = v22;
    v23 = v52;
    v78 = v23;
    -[CLSInvestigationFeeder _enumerateLocationClustersWithGaussians:enumerationBlock:](self, "_enumerateLocationClustersWithGaussians:enumerationBlock:", v20, v74);
    v44 = v20;
    if (*((_BYTE *)v92 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v97 = 67109120;
        v98 = 392;
        v24 = MEMORY[0x1E0C81028];
LABEL_27:
        _os_log_impl(&dword_1CAB79000, v24, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&v97, 8u);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
    -[CLSClueCollection mergeClues:](v50, "mergeClues:", v23);
    if (objc_msgSend(v22, "count")
      && (!*((_BYTE *)p_buf + 24)
       || (-[CLSInvestigationFeeder focusItems](self, "focusItems"),
           v25 = (void *)objc_claimAutoreleasedReturnValue(),
           v26 = objc_msgSend(v25, "count") == 0,
           v25,
           v26)))
    {
      -[CLSClueCollection mergeClues:](v50, "mergeClues:", v22);
    }
    else
    {
      -[CLSInvestigationFeeder localStartDateComponents](self, "localStartDateComponents");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLSInvestigationFeeder localEndDateComponents](self, "localEndDateComponents");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 && v39)
      {
        v96[0] = v27;
        v96[1] = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[CLSInputTimeClue clueWithDates:serviceManager:](CLSInputTimeClue, "clueWithDates:serviceManager:", v28, v41);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v95 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSClueCollection mergeClues:](v50, "mergeClues:", v30);

      }
    }
    if (*((_BYTE *)p_buf + 24) || !objc_msgSend(v48, "count"))
    {
      v70[0] = v17;
      v70[1] = 3221225472;
      v70[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_164;
      v70[3] = &unk_1E84F7EA0;
      v71 = v21;
      v72 = v42;
      v73 = &v91;
      objc_msgSend(v49, "enumerateObjectsUsingBlock:", v70);

    }
    if (*((_BYTE *)v92 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v97 = 67109120;
        v98 = 421;
        v24 = MEMORY[0x1E0C81028];
        goto LABEL_27;
      }
LABEL_28:
      v13 = 0;
LABEL_29:

      _Block_object_dispose(&buf, 8);
      v20 = v44;
LABEL_30:

      goto LABEL_31;
    }
    if (objc_msgSend(v49, "count"))
    {
      objc_msgSend(v49, "anyObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v32, "photoLibrary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }

    }
    else
    {
      v33 = 0;
    }
    v63[0] = v17;
    v63[1] = 3221225472;
    v63[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_166;
    v63[3] = &unk_1E84F7EF0;
    v40 = v33;
    v64 = v40;
    v34 = v41;
    v65 = v34;
    v35 = v48;
    v66 = v35;
    v36 = v46;
    v67 = v36;
    v43 = v42;
    v68 = v43;
    v69 = &v91;
    -[CLSInvestigationFeeder enumeratePersonNames:withGaussiansUsingBlock:](self, "enumeratePersonNames:withGaussiansUsingBlock:", v35, v63);
    if ((objc_msgSend(v47, "isEqualToSet:", v35) & 1) == 0)
    {
      v56[0] = v17;
      v56[1] = 3221225472;
      v56[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2_169;
      v56[3] = &unk_1E84F7EF0;
      v57 = v40;
      v58 = v34;
      v59 = v47;
      v60 = v36;
      v61 = v43;
      v62 = &v91;
      -[CLSInvestigationFeeder enumeratePersonNames:withGaussiansUsingBlock:](self, "enumeratePersonNames:withGaussiansUsingBlock:", v59, v56);

    }
    if (*((_BYTE *)v92 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v97 = 67109120;
        v98 = 485;
        v37 = MEMORY[0x1E0C81028];
LABEL_43:
        _os_log_impl(&dword_1CAB79000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&v97, 8u);
      }
    }
    else
    {
      -[CLSClueCollection mergeClues:](v50, "mergeClues:", v36);
      if (!v11
        || (v55 = 0,
            (*((void (**)(id, char *, double))v43 + 2))(v43, &v55, 1.0),
            v38 = *((_BYTE *)v92 + 24) | v55,
            (*((_BYTE *)v92 + 24) = v38) == 0))
      {
        v13 = v50;
        goto LABEL_50;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v97 = 67109120;
        v98 = 489;
        v37 = MEMORY[0x1E0C81028];
        goto LABEL_43;
      }
    }
    v13 = 0;
LABEL_50:

    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0xF104000100;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  v13 = 0;
LABEL_31:
  _Block_object_dispose(&v91, 8);

  return v13;
}

- (id)locationClustersWithProgressBlock:(id)a3
{
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  char v35;
  CLSInvestigationFeeder *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  double v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint8_t v57[128];
  uint8_t buf[4];
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v4 = MEMORY[0x1D1796244]();
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v39 = (void *)v4;
  if (v4
    && (v52 = 0,
        (*(void (**)(uint64_t, char *, double))(v4 + 16))(v4, &v52, 0.0),
        v5 = *((_BYTE *)v54 + 24) | v52,
        (*((_BYTE *)v54 + 24) = v5) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v59 = 501;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    }
    v6 = 0;
  }
  else
  {
    -[CLSInvestigationFeeder allItems](self, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = self;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v49 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1E0D71860];
          objc_msgSend(v14, "pl_coordinate", v37);
          if (objc_msgSend(v15, "canUseCoordinate:"))
          {
            objc_msgSend(v14, "pl_gpsHorizontalAccuracy");
            v17 = v16;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v18);

            if (objc_msgSend(MEMORY[0x1E0D71860], "horizontalAccuracyIsCoarse:", v17))
              objc_msgSend(v8, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v11);
    }

    objc_msgSend(v9, "sortUsingSelector:", sel_compare_);
    v19 = objc_msgSend(v9, "count");
    if (v19)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v19 >> 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = v21;

    }
    else
    {
      v22 = *MEMORY[0x1E0D72F40];
    }
    v23 = v10;
    v24 = objc_msgSend(MEMORY[0x1E0D71860], "horizontalAccuracyIsCoarse:", v22);
    v25 = MEMORY[0x1E0C809B0];
    v26 = v23;
    if ((v24 & 1) == 0)
    {
      v26 = v23;
      if (objc_msgSend(v8, "count"))
      {
        v27 = (void *)MEMORY[0x1E0CB3880];
        v46[0] = v25;
        v46[1] = 3221225472;
        v46[2] = __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke;
        v46[3] = &unk_1E84F7F18;
        v47 = v8;
        objc_msgSend(v27, "predicateWithBlock:", v46);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "filteredArrayUsingPredicate:", v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    v29 = (void *)MEMORY[0x1E0D71A50];
    v30 = -[CLSInvestigationFeeder locationClusteringAlgorithm](v37, "locationClusteringAlgorithm", v37);
    v43[0] = v25;
    v43[1] = 3221225472;
    v43[2] = __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke_2;
    v43[3] = &unk_1E84F94F0;
    v31 = v39;
    v44 = v31;
    v45 = &v53;
    objc_msgSend(v29, "performClustering:dataset:progressBlock:", v30, v26, v43);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v40[0] = v25;
      v40[1] = 3221225472;
      v40[2] = __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke_3;
      v40[3] = &unk_1E84F7F40;
      v42 = v22;
      v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v32, "count"));
      v41 = v33;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v40);
      v34 = v33;

    }
    else
    {
      v34 = 0;
    }
    if (v39
      && (v52 = 0,
          (*((void (**)(id, char *, double))v31 + 2))(v31, &v52, 1.0),
          v35 = *((_BYTE *)v54 + 24) | v52,
          (*((_BYTE *)v54 + 24) = v35) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v59 = 549;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      v6 = 0;
    }
    else
    {
      v6 = v34;
    }

  }
  _Block_object_dispose(&v53, 8);

  return v6;
}

- (unint64_t)numberOfItemsInInvestigation:(id)a3
{
  if (-[CLSInvestigationFeeder allowsInterview](self, "allowsInterview", a3))
    return -[CLSInvestigationFeeder numberOfItems](self, "numberOfItems");
  else
    return 0;
}

- (unint64_t)locationClusteringAlgorithm
{
  return self->_locationClusteringAlgorithm;
}

- (void)setLocationClusteringAlgorithm:(unint64_t)a3
{
  self->_locationClusteringAlgorithm = a3;
}

- (BOOL)allowsInterview
{
  return self->_allowsInterview;
}

- (void)setAllowsInterview:(BOOL)a3
{
  self->_allowsInterview = a3;
}

- (NSMutableSet)focusItems
{
  return self->_focusItems;
}

- (NSSet)focusPersonLocalIdentifiers
{
  return self->_focusPersonLocalIdentifiers;
}

- (void)setFocusPersonLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_focusPersonLocalIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_focusItems, 0);
}

uint64_t __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *))(result + 16))(result, &v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

void __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  double v5;
  id v6;
  id v7;

  v5 = *(double *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "setClsHorizontalAccuracy:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D1796094]();
  if ((objc_msgSend(v3, "clsIsScreenshotOrScreenRecording") & 1) == 0)
  {
    objc_msgSend(v3, "clsPersonLocalIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
          v11 = *(void **)(a1 + 32);
          if (!v11 || objc_msgSend(v11, "containsObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9)))
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "clsConsolidatedPersonLocalIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
          v18 = *(void **)(a1 + 32);
          if (!v18 || objc_msgSend(v18, "containsObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16)))
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_154(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "focusItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2_155;
  v10[3] = &unk_1E84F7E08;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v8;
  v13 = a4;
  v9 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4, double a5, double a6, double a7)
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(_QWORD *, uint64_t, uint64_t, _BYTE *);
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  _QWORD v56[5];

  v56[2] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v49 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "focusItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_4;
  v43[3] = &unk_1E84F7E58;
  v17 = v14;
  v44 = v17;
  v45 = &v46;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v43);

  if (*((_BYTE *)v47 + 24))
  {
    v18 = objc_msgSend(v17, "count");
    objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_1627);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      v36 = v16;
      v37 = 3221225472;
      v38 = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_6;
      v39 = &unk_1E84F7EA0;
      v40 = *(id *)(a1 + 72);
      v20 = *(id *)(a1 + 80);
      v21 = *(_QWORD *)(a1 + 96);
      v41 = v20;
      v42 = v21;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", &v36);

    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      *a4 = 1;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v19, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cls_localDateComponents");
    v34 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cls_localDateComponents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34 || !v24)
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging", v34, v36, v37, v38, v39);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "loggingConnection");
      v25 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "firstObject");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v51 = v19;
        v52 = 2112;
        v53 = v30;
        v54 = 2112;
        v55 = v31;
        _os_log_error_impl(&dword_1CAB79000, v25, OS_LOG_TYPE_ERROR, "sortedObjectsByDate doesn't have any date %@ - [%@, %@]", buf, 0x20u);

      }
      goto LABEL_17;
    }
    +[CLSInputLocationClue clueWithLocation:locationCache:](CLSInputLocationClue, "clueWithLocation:locationCache:", v13, *(_QWORD *)(a1 + 40));
    v25 = objc_claimAutoreleasedReturnValue();
    -[NSObject setNumberOfAssets:](v25, "setNumberOfAssets:", objc_msgSend(v17, "count"));
    v56[0] = v34;
    v56[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSInputTimeClue clueWithDates:serviceManager:](CLSInputTimeClue, "clueWithDates:serviceManager:", v26, *(_QWORD *)(a1 + 48));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a5 != 0.0)
    {
      v32 = (double)v18;
      if ((double)v18 < a6)
      {
        objc_msgSend(v27, "setRelevance:", (double)(exp(-((v32 - a6) * (v32 - a6)) / (a5 * a5 + a5 * a5)) * 0.99));
        objc_msgSend(v28, "relevance");
        -[NSObject setRelevance:](v25, "setRelevance:");
        goto LABEL_16;
      }
      if (v32 < a7)
      {
        objc_msgSend(v27, "setRelevance:", v32 * 0.01 / a7 + 0.99);
        objc_msgSend(v28, "relevance");
        -[NSObject setRelevance:](v25, "setRelevance:");
        goto LABEL_16;
      }
    }
    objc_msgSend(v27, "setRelevance:", 1.0, v34, v36, v37, v38, v39);
    objc_msgSend(v28, "relevance");
    -[NSObject setRelevance:](v25, "setRelevance:");
LABEL_16:
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v28, v34);
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v25);

LABEL_17:
    v33 = *(_QWORD *)(a1 + 80);
    if (v33)
    {
      buf[0] = 0;
      (*(void (**)(uint64_t, uint8_t *, double))(v33 + 16))(v33, buf, 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) |= buf[0];
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
        *a4 = 1;
    }

    goto LABEL_21;
  }
LABEL_22:

  _Block_object_dispose(&v46, 8);
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_164(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  (*(void (**)(void))(a1[4] + 16))();
  result = a1[5];
  if (result)
  {
    v7 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v7, 0.4);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= v7;
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      *a4 = 1;
  }
  return result;
}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_166(uint64_t a1, void *a2, _BYTE *a3, double a4, double a5)
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  char v17;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = a2;
  +[CLSInputPeopleClue clueWithPersonLocalIdentifier:inPhotoLibrary:serviceManager:](CLSInputPeopleClue, "clueWithPersonLocalIdentifier:inPhotoLibrary:serviceManager:", v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(*(id *)(a1 + 48), "countForObject:", v11);

  objc_msgSend(v12, "setNumberOfFaces:", v13);
  v15 = 1.0;
  if (a4 != 0.0)
  {
    v14 = (double)v13;
    if ((double)v13 < a5)
      v15 = exp(-((v14 - a5) * (v14 - a5)) / (a4 * a4 + a4 * a4));
  }
  objc_msgSend(v12, "setRelevance:", v15, v14);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
  v16 = *(_QWORD *)(a1 + 64);
  if (v16)
  {
    v17 = 0;
    (*(void (**)(uint64_t, char *, double))(v16 + 16))(v16, &v17, 0.8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) |= v17;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      *a3 = 1;
  }

}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2_169(uint64_t a1, void *a2, _BYTE *a3, double a4, double a5)
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  char v17;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = a2;
  +[CLSInputPeopleClue clueWithConsolidatedPersonLocalIdentifier:inPhotoLibrary:serviceManager:](CLSInputPeopleClue, "clueWithConsolidatedPersonLocalIdentifier:inPhotoLibrary:serviceManager:", v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(*(id *)(a1 + 48), "countForObject:", v11);

  objc_msgSend(v12, "setNumberOfFaces:", v13);
  v15 = 1.0;
  if (a4 != 0.0)
  {
    v14 = (double)v13;
    if ((double)v13 < a5)
      v15 = exp(-((v14 - a5) * (v14 - a5)) / (a4 * a4 + a4 * a4));
  }
  objc_msgSend(v12, "setRelevance:", v15, v14);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
  v16 = *(_QWORD *)(a1 + 64);
  if (v16)
  {
    v17 = 0;
    (*(void (**)(uint64_t, char *, double))(v16 + 16))(v16, &v17, 0.9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) |= v17;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      *a3 = 1;
  }

}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_4(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_6(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  (*(void (**)(void))(a1[4] + 16))();
  result = a1[5];
  if (result)
  {
    v7 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v7, 0.2);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= v7;
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      *a4 = 1;
  }
  return result;
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "cls_localDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_localDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2_155(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  _BYTE *v6;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
  {
    v6 = *(_BYTE **)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *v6 = 1;
    *a3 = 1;
  }
  return result;
}

double __71__CLSInvestigationFeeder_enumeratePersonNames_withGaussiansUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  double result;

  v3 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)(v4 + 24) + (double)v3;
  *(double *)(v4 + 24) = result;
  return result;
}

uint64_t __71__CLSInvestigationFeeder_enumeratePersonNames_withGaussiansUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v6, "count");
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v8 = objc_msgSend(v6, "count");
  if (v7 <= v8)
    v9 = v8;
  else
    v9 = v7;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "cls_universalDate", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13)
        {
          objc_msgSend(v16, "earlierDate:", v13);
          v18 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v18;
        }
        else
        {
          v13 = v16;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v13, v5);
}

double __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  uint64_t v5;
  double result;

  v4 = objc_msgSend(a3, "count");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = ((double)v4 - *(double *)(a1 + 40)) * ((double)v4 - *(double *)(a1 + 40)) + *(double *)(v5 + 24);
  *(double *)(v5 + 24) = result;
  return result;
}

uint64_t __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

@end
