@implementation CLSNewLocationInformant

- (id)_regionOfInterestCategories
{
  if (_regionOfInterestCategories_onceToken != -1)
    dispatch_once(&_regionOfInterestCategories_onceToken, &__block_literal_global_43);
  return (id)_regionOfInterestCategories_regionOfInterestsCategories;
}

- (id)_pointOfInterestTraits
{
  if (_pointOfInterestTraits_onceToken != -1)
    dispatch_once(&_pointOfInterestTraits_onceToken, &__block_literal_global_60);
  return (id)_pointOfInterestTraits_pointOfInterestTraits;
}

- (id)_regionOfInterestTraits
{
  if (_regionOfInterestTraits_onceToken != -1)
    dispatch_once(&_regionOfInterestTraits_onceToken, &__block_literal_global_99);
  return (id)_regionOfInterestTraits_pointOfInterestsTraits;
}

- (id)outputLocationCluesForOuputClueKey:(id)a3 inputClue:(id)a4 region:(id)a5 traits:(id)a6 categories:(id)a7 exactMatch:(BOOL)a8 precision:(double)a9 cache:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  __int128 *v53;
  _QWORD v54[5];
  NSObject *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 *p_buf;
  double v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  __int128 buf;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v49 = a7;
  v21 = a10;
  objc_msgSend(v18, "placemark");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "loggingConnection");
    v35 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_error_impl(&dword_1CAB79000, v35, OS_LOG_TYPE_ERROR, "ERROR: inputLocationCluePlacemarkLocation is nil. %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_7;
  }
  v24 = (void *)objc_opt_class();
  objc_msgSend(v23, "coordinate");
  objc_msgSend(v24, "shiftedCoordinatesFromOriginalCoordinates:");
  v26 = v25;
  v28 = v27;
  v29 = (void *)objc_opt_class();
  objc_msgSend(v19, "center");
  objc_msgSend(v29, "shiftedCoordinatesFromOriginalCoordinates:");
  v31 = v30;
  v33 = v32;
  objc_msgSend((id)objc_opt_class(), "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", v49, v21, v30, v32, a9);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34 || !-[NSObject count](v34, "count"))
  {
LABEL_7:
    v43 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_8;
  }
  v46 = (void *)objc_opt_new();
  v36 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v48 = v17;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v68 = 0x2020000000;
  v69 = 0;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __124__CLSNewLocationInformant_outputLocationCluesForOuputClueKey_inputClue_region_traits_categories_exactMatch_precision_cache___block_invoke;
  v54[3] = &unk_1E84F8298;
  v54[4] = self;
  v35 = v35;
  v55 = v35;
  v62 = v31;
  v63 = v33;
  v56 = v19;
  v66 = a8;
  v64 = v26;
  v65 = v28;
  v37 = v36;
  v57 = v37;
  p_buf = &buf;
  v58 = v17;
  v59 = v18;
  v38 = v46;
  v60 = v38;
  v39 = v20;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v54);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __124__CLSNewLocationInformant_outputLocationCluesForOuputClueKey_inputClue_region_traits_categories_exactMatch_precision_cache___block_invoke_2;
  v50[3] = &unk_1E84F82C0;
  v47 = v37;
  v51 = v47;
  v53 = &buf;
  v41 = v40;
  v52 = v41;
  objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v50);
  v42 = v52;
  v43 = v41;

  v17 = v48;
  v20 = v39;

  _Block_object_dispose(&buf, 8);
LABEL_8:

  return v43;
}

- (id)locationAreaOfInterestCluesForInputClue:(id)a3 aoiCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  CLSNewLocationInformant *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[6];

  v41[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = (void *)objc_opt_new();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "areaOfInterestCategories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = &unk_1E8511920;
  v40[1] = &unk_1E8511938;
  v41[0] = &unk_1E8511B00;
  v41[1] = &unk_1E8511B00;
  v40[2] = &unk_1E8511950;
  v40[3] = &unk_1E8511A10;
  v41[2] = &unk_1E8511B00;
  v41[3] = &unk_1E8511B18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = &unk_1E8511920;
  v38[1] = &unk_1E8511938;
  v39[0] = CFSTR("Entertainment");
  v39[1] = CFSTR("Entertainment");
  v38[2] = &unk_1E8511950;
  v38[3] = &unk_1E8511A10;
  v39[2] = CFSTR("Entertainment");
  v39[3] = CFSTR("Park");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_class();
  objc_msgSend(v6, "region");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v16 = v15;
  v18 = v17;
  objc_msgSend((id)objc_opt_class(), "areaOfInterestCategories");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", v19, v7, v16, v18, 6000.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)objc_opt_class();
    objc_msgSend(v6, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "shiftedLocationFromOriginalLocation:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __76__CLSNewLocationInformant_locationAreaOfInterestCluesForInputClue_aoiCache___block_invoke;
    v30[3] = &unk_1E84F8340;
    v31 = v10;
    v32 = v11;
    v33 = self;
    v34 = v23;
    v35 = v12;
    v36 = v6;
    v24 = v29;
    v37 = v24;
    v25 = v23;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v30);
    v26 = v37;
    v27 = v24;

  }
  return v29;
}

- (id)locationPointOfInterestCluesForInputClue:(id)a3 poiCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNewLocationInformant _pointOfInterestTraits](self, "_pointOfInterestTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pointOfInterestCategories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  objc_msgSend(v6, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shiftedLocationFromOriginalLocation:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "region");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placemark");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "distanceFromLocation:", v13);
    if (v17 <= 10.0)
    {
      -[CLSNewLocationInformant outputLocationCluesForOuputClueKey:inputClue:region:traits:categories:exactMatch:precision:cache:](self, "outputLocationCluesForOuputClueKey:inputClue:region:traits:categories:exactMatch:precision:cache:", CFSTR("Location POI"), v6, v14, v9, v10, 1, 100.0, v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(v8, "addObjectsFromArray:", v18);

    }
  }
  if (!objc_msgSend(v8, "count"))
  {
    -[CLSNewLocationInformant outputLocationCluesForOuputClueKey:inputClue:region:traits:categories:exactMatch:precision:cache:](self, "outputLocationCluesForOuputClueKey:inputClue:region:traits:categories:exactMatch:precision:cache:", CFSTR("Location POI"), v6, v14, v9, v10, 0, 100.0, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v8, "addObjectsFromArray:", v19);

  }
  return v8;
}

- (id)locationRegionOfInterestCluesForInputClue:(id)a3 roiCache:(id)a4 natureCache:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  id v50;
  id v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_class();
  objc_msgSend(v8, "region");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "center");
  objc_msgSend(v12, "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", &unk_1E8512158, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if ((unint64_t)objc_msgSend(v14, "count") > 0x95)
    {
      +[CLSOutputClue clueWithValue:forKey:confidence:relevance:](CLSOutputClue, "clueWithValue:forKey:confidence:relevance:", CFSTR("Urban"), CFSTR("Location ROI"), 1.0, 1.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addRelatedInputLocationClues:", v27);

      objc_msgSend(v11, "addObject:", v26);
LABEL_18:

      goto LABEL_19;
    }
    v15 = (void *)objc_opt_class();
    objc_msgSend(v8, "region");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "center");
    v18 = v17;
    v20 = v19;
    objc_msgSend((id)objc_opt_class(), "natureCategories");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", v21, v10, v18, v20, 20000.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v49 = 1;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __90__CLSNewLocationInformant_locationRegionOfInterestCluesForInputClue_roiCache_natureCache___block_invoke;
      v42[3] = &unk_1E84F83A0;
      v41 = v8;
      v43 = v41;
      v24 = v23;
      v44 = v24;
      v45 = &v46;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v42);
      objc_msgSend(v11, "addObjectsFromArray:", v24);
      v40 = v24;
      if (!*((_BYTE *)v47 + 24))
      {
LABEL_15:

        _Block_object_dispose(&v46, 8);
        -[CLSNewLocationInformant _regionOfInterestTraits](self, "_regionOfInterestTraits");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSNewLocationInformant _regionOfInterestCategories](self, "_regionOfInterestCategories");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "region");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSNewLocationInformant outputLocationCluesForOuputClueKey:inputClue:region:traits:categories:exactMatch:precision:cache:](self, "outputLocationCluesForOuputClueKey:inputClue:region:traits:categories:exactMatch:precision:cache:", CFSTR("Location ROI"), v41, v36, v26, v35, 0, 1000.0, v9);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          objc_msgSend(v11, "addObjectsFromArray:", v37);

        goto LABEL_18;
      }
      objc_msgSend(v41, "placemark");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(v39, "inlandWater");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {

LABEL_10:
          +[CLSOutputClue clueWithValue:forKey:confidence:relevance:](CLSOutputClue, "clueWithValue:forKey:confidence:relevance:", CFSTR("Water"), CFSTR("Location ROI"), 1.0, 1.0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addRelatedInputLocationClues:", v31);

          objc_msgSend(v11, "addObject:", v30);
          goto LABEL_13;
        }
        objc_msgSend(v39, "ocean");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28 == 0;

        if (!v29)
          goto LABEL_10;
      }
      objc_msgSend(v39, "ISOcountryCode");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("CN"));

      if (v33 != objc_msgSend(MEMORY[0x1E0D71A98], "isCurrentRevGeoProviderAutoNavi"))
      {
LABEL_14:

        goto LABEL_15;
      }
      +[CLSOutputClue clueWithValue:forKey:confidence:relevance:](CLSOutputClue, "clueWithValue:forKey:confidence:relevance:", CFSTR("Nature"), CFSTR("Location ROI"), 1.0, 1.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addRelatedInputLocationClues:", v34);

      objc_msgSend(v11, "addObject:", v30);
LABEL_13:

      goto LABEL_14;
    }
  }
LABEL_19:

  return v11;
}

- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "clueCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__CLSNewLocationInformant_gatherCluesForInvestigation_progressBlock___block_invoke;
  v22[3] = &unk_1E84F8A48;
  v23 = v8;
  v11 = v8;
  objc_msgSend(v9, "enumerateTimeClues:", v22);

  objc_msgSend(v6, "helper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clueCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __69__CLSNewLocationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2;
  v19[3] = &unk_1E84F83D8;
  v19[4] = self;
  v20 = v12;
  v14 = v7;
  v21 = v14;
  v15 = v12;
  objc_msgSend(v13, "enumerateLocationClues:", v19);

  v16 = v21;
  v17 = v14;

  return v17;
}

uint64_t __69__CLSNewLocationInformant_gatherCluesForInvestigation_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __69__CLSNewLocationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(v13, "isDefinite"))
  {
    objc_msgSend(v13, "placemark");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "areasOfInterest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "aoiCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationAreaOfInterestCluesForInputClue:aoiCache:", v13, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v8);
    }
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "roiCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "natureCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationRegionOfInterestCluesForInputClue:roiCache:natureCache:", v13, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v12);
}

void __90__CLSNewLocationInformant_locationRegionOfInterestCluesForInputClue_roiCache_natureCache___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(a2, "categories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__CLSNewLocationInformant_locationRegionOfInterestCluesForInputClue_roiCache_natureCache___block_invoke_2;
  v6[3] = &unk_1E84F8378;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

}

void __90__CLSNewLocationInformant_locationRegionOfInterestCluesForInputClue_roiCache_natureCache___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "unsignedIntegerValue") == 15)
  {
    +[CLSOutputClue clueWithValue:forKey:](CLSOutputClue, "clueWithValue:forKey:", CFSTR("Mountain"), CFSTR("Location ROI"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addRelatedInputLocationClues:", v4);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __76__CLSNewLocationInformant_locationAreaOfInterestCluesForInputClue_aoiCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v3, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "intersectSet:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v3, "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "radius");
  v13 = v12;

  if (v13 >= v10)
  {
    v14 = (void *)objc_opt_class();
    objc_msgSend(v3, "region");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "doesRegion:containLocation:", v15, *(_QWORD *)(a1 + 56));

    if ((_DWORD)v14)
    {
      objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "relevance");
      +[CLSOutputClue clueWithValue:forKey:confidence:relevance:](CLSOutputClue, "clueWithValue:forKey:confidence:relevance:", v16, CFSTR("Location POI"), 1.0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addRelatedInputLocationClues:", v19);

      objc_msgSend(*(id *)(a1 + 80), "addObject:", v18);
    }
  }

}

void __124__CLSNewLocationInformant_outputLocationCluesForOuputClueKey_inputClue_region_traits_categories_exactMatch_precision_cache___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  double v26;
  double v28;
  double v29;
  double v30;
  double v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _BOOL4 v39;
  BOOL v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  _BYTE *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v46 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("categories"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sub-categories"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blacklist-categories"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("precision"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("minimumItemPrecision"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v50 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("confidence"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  v48 = (void *)v9;
  v49 = (void *)v8;
  v47 = (void *)v10;
  objc_msgSend((id)objc_opt_class(), "filterBusinessItems:forCategories:subCategories:blocklistCategories:", *(_QWORD *)(a1 + 40), v8, v9, v10);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "region", v46);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "radius");
        if (v26 > v16 && v16 != 0.0)
          v26 = v16;
        if (v13 == 0.0)
          v28 = v26;
        else
          v28 = v13;
        objc_msgSend(v25, "center", v26);
        CLLocationCoordinate2DGetDistanceFrom();
        if (v29 <= v28)
        {
          v30 = v29;
          objc_msgSend(*(id *)(a1 + 48), "radius");
          v32 = *(unsigned __int8 *)(a1 + 128);
          if (*(_BYTE *)(a1 + 128))
          {
            CLLocationCoordinate2DGetDistanceFrom();
            v31 = v28 + v33;
            v32 = *(unsigned __int8 *)(a1 + 128);
          }
          v34 = v28 * v28 / (v31 * v31);
          if (v34 > 1.0)
            v34 = 1.0;
          v35 = v31 / v28;
          if (v31 / v28 > 1.0)
            v35 = 1.0;
          v36 = v30 * v35;
          if (v31 < v28)
            v31 = v28;
          v37 = 1.0 - v36 / v31;
          if (v37 < 0.0)
            v37 = 0.0;
          v38 = v34 * v37;
          v39 = v32 == 0;
          if (v34 * v37 < v19)
            v39 = 0;
          v40 = v32 && v30 < 5.0;
          if (v40 || v39)
          {
            if (+[CLSNewLocationInformant doesRegion:intersectOtherRegion:](CLSNewLocationInformant, "doesRegion:intersectOtherRegion:", v25, *(_QWORD *)(a1 + 48)))
            {
              objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
              ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
            }
            v41 = *(_QWORD *)(a1 + 64);
            objc_msgSend(*(id *)(a1 + 72), "relevance");
            +[CLSOutputClue clueWithValue:forKey:confidence:relevance:](CLSOutputClue, "clueWithValue:forKey:confidence:relevance:", v6, v41, v38, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = *(_QWORD *)(a1 + 72);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addRelatedInputLocationClues:", v44);

            objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", v6);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v45)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v45, v6);
            }
            objc_msgSend(v45, "addObject:", v43);
            if (*(_BYTE *)(a1 + 128))
            {
              *v46 = 1;

              goto LABEL_42;
            }

          }
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_42:

}

void __124__CLSNewLocationInformant_outputLocationCluesForOuputClueKey_inputClue_region_traits_categories_exactMatch_precision_cache___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v9)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "score");
          v14 = v13;
          objc_msgSend(v9, "score");
          if (v14 <= v15)
            continue;
        }
        v16 = v12;

        v9 = v16;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
    if (v9)
    {
      objc_msgSend(v9, "confidence");
      v18 = v17;
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
        v18 = v18
            * ((double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "countForObject:", v5)
             / (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            * 0.2
            + v18 * 0.8;
      objc_msgSend(v9, "setConfidence:", v18);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

    }
  }

}

void __50__CLSNewLocationInformant__regionOfInterestTraits__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Beach");
  v6[0] = CFSTR("categories");
  v6[1] = CFSTR("blacklist-categories");
  v7[0] = &unk_1E8512110;
  v7[1] = &unk_1E8512128;
  v6[2] = CFSTR("precision");
  v6[3] = CFSTR("minimumItemPrecision");
  v7[2] = &unk_1E8511B18;
  v7[3] = &unk_1E8511B48;
  v6[4] = CFSTR("confidence");
  v7[4] = &unk_1E8512228;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("Mountain");
  v9[0] = v0;
  v4[0] = CFSTR("categories");
  v4[1] = CFSTR("blacklist-categories");
  v5[0] = &unk_1E8512140;
  v5[1] = MEMORY[0x1E0C9AA60];
  v4[2] = CFSTR("precision");
  v4[3] = CFSTR("minimumItemPrecision");
  v5[2] = &unk_1E8511B60;
  v5[3] = &unk_1E8511B48;
  v4[4] = CFSTR("confidence");
  v5[4] = &unk_1E8512228;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_regionOfInterestTraits_pointOfInterestsTraits;
  _regionOfInterestTraits_pointOfInterestsTraits = v2;

}

void __49__CLSNewLocationInformant__pointOfInterestTraits__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
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
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[16];
  _QWORD v52[18];

  v52[16] = *MEMORY[0x1E0C80C00];
  v51[0] = CFSTR("Restaurant");
  v49[0] = CFSTR("categories");
  v49[1] = CFSTR("blacklist-categories");
  v50[0] = &unk_1E8511F78;
  v50[1] = MEMORY[0x1E0C9AA60];
  v0 = MEMORY[0x1E0C9AA60];
  v49[2] = CFSTR("precision");
  v49[3] = CFSTR("minimumItemPrecision");
  v50[2] = &unk_1E8511B00;
  v50[3] = &unk_1E8511B18;
  v49[4] = CFSTR("confidence");
  v50[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v18;
  v51[1] = CFSTR("Nightlife");
  v47[0] = CFSTR("categories");
  v47[1] = CFSTR("blacklist-categories");
  v48[0] = &unk_1E8511F90;
  v48[1] = &unk_1E8511FA8;
  v47[2] = CFSTR("precision");
  v47[3] = CFSTR("minimumItemPrecision");
  v48[2] = &unk_1E8511B00;
  v48[3] = &unk_1E8511B18;
  v47[4] = CFSTR("confidence");
  v48[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = CFSTR("Shopping");
  v52[1] = v17;
  v45[0] = CFSTR("categories");
  v45[1] = CFSTR("blacklist-categories");
  v46[0] = &unk_1E8511FC0;
  v46[1] = v0;
  v45[2] = CFSTR("precision");
  v45[3] = CFSTR("minimumItemPrecision");
  v46[2] = &unk_1E8511B00;
  v46[3] = &unk_1E8511B18;
  v45[4] = CFSTR("confidence");
  v46[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = CFSTR("Travel");
  v52[2] = v16;
  v43[0] = CFSTR("categories");
  v43[1] = CFSTR("blacklist-categories");
  v44[0] = &unk_1E8511FD8;
  v44[1] = v0;
  v43[2] = CFSTR("precision");
  v43[3] = CFSTR("minimumItemPrecision");
  v44[2] = &unk_1E8511B00;
  v44[3] = &unk_1E8511B18;
  v43[4] = CFSTR("confidence");
  v44[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = CFSTR("Culture");
  v52[3] = v15;
  v41[0] = CFSTR("categories");
  v41[1] = CFSTR("blacklist-categories");
  v42[0] = &unk_1E8511FF0;
  v42[1] = v0;
  v41[2] = CFSTR("precision");
  v41[3] = CFSTR("minimumItemPrecision");
  v42[2] = &unk_1E8511B00;
  v42[3] = &unk_1E8511B18;
  v41[4] = CFSTR("confidence");
  v42[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = CFSTR("Museum");
  v52[4] = v14;
  v39[0] = CFSTR("categories");
  v39[1] = CFSTR("blacklist-categories");
  v40[0] = &unk_1E8512008;
  v40[1] = v0;
  v39[2] = CFSTR("precision");
  v39[3] = CFSTR("minimumItemPrecision");
  v40[2] = &unk_1E8511B00;
  v40[3] = &unk_1E8511B18;
  v39[4] = CFSTR("confidence");
  v40[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = CFSTR("Entertainment");
  v52[5] = v13;
  v37[0] = CFSTR("categories");
  v37[1] = CFSTR("blacklist-categories");
  v38[0] = &unk_1E8512020;
  v38[1] = v0;
  v37[2] = CFSTR("precision");
  v37[3] = CFSTR("minimumItemPrecision");
  v38[2] = &unk_1E8511B00;
  v38[3] = &unk_1E8511B18;
  v37[4] = CFSTR("confidence");
  v38[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = CFSTR("AmusementPark");
  v52[6] = v12;
  v35[0] = CFSTR("categories");
  v35[1] = CFSTR("blacklist-categories");
  v36[0] = &unk_1E8512038;
  v36[1] = v0;
  v35[2] = CFSTR("precision");
  v35[3] = CFSTR("minimumItemPrecision");
  v36[2] = &unk_1E8511B00;
  v36[3] = &unk_1E8511B18;
  v35[4] = CFSTR("confidence");
  v36[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = CFSTR("Park");
  v52[7] = v11;
  v33[0] = CFSTR("categories");
  v33[1] = CFSTR("blacklist-categories");
  v34[0] = &unk_1E8512050;
  v34[1] = v0;
  v33[2] = CFSTR("precision");
  v33[3] = CFSTR("minimumItemPrecision");
  v34[2] = &unk_1E8511B00;
  v34[3] = &unk_1E8511B18;
  v33[4] = CFSTR("confidence");
  v34[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = CFSTR("Fitness");
  v52[8] = v10;
  v31[0] = CFSTR("categories");
  v31[1] = CFSTR("blacklist-categories");
  v32[0] = &unk_1E8512068;
  v32[1] = v0;
  v31[2] = CFSTR("precision");
  v31[3] = CFSTR("minimumItemPrecision");
  v32[2] = &unk_1E8511B00;
  v32[3] = &unk_1E8511B18;
  v31[4] = CFSTR("confidence");
  v32[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v51[10] = CFSTR("Activity");
  v52[9] = v9;
  v29[0] = CFSTR("categories");
  v29[1] = CFSTR("blacklist-categories");
  v30[0] = &unk_1E8512080;
  v30[1] = v0;
  v29[2] = CFSTR("precision");
  v29[3] = CFSTR("minimumItemPrecision");
  v30[2] = &unk_1E8511B00;
  v30[3] = &unk_1E8511B18;
  v29[4] = CFSTR("confidence");
  v30[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51[11] = CFSTR("Diving");
  v52[10] = v8;
  v27[0] = CFSTR("categories");
  v27[1] = CFSTR("blacklist-categories");
  v28[0] = &unk_1E8512098;
  v28[1] = v0;
  v27[2] = CFSTR("precision");
  v27[3] = CFSTR("minimumItemPrecision");
  v28[2] = &unk_1E8511B00;
  v28[3] = &unk_1E8511B18;
  v27[4] = CFSTR("confidence");
  v28[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51[12] = CFSTR("Performance");
  v52[11] = v7;
  v25[0] = CFSTR("categories");
  v25[1] = CFSTR("blacklist-categories");
  v26[0] = &unk_1E85120B0;
  v26[1] = v0;
  v25[2] = CFSTR("precision");
  v25[3] = CFSTR("minimumItemPrecision");
  v26[2] = &unk_1E8511B00;
  v26[3] = &unk_1E8511B18;
  v25[4] = CFSTR("confidence");
  v26[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v51[13] = CFSTR("Hospital");
  v52[12] = v6;
  v23[0] = CFSTR("categories");
  v23[1] = CFSTR("blacklist-categories");
  v24[0] = &unk_1E85120C8;
  v24[1] = v0;
  v23[2] = CFSTR("precision");
  v23[3] = CFSTR("minimumItemPrecision");
  v24[2] = &unk_1E8511B00;
  v24[3] = &unk_1E8511B18;
  v23[4] = CFSTR("confidence");
  v24[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51[14] = CFSTR("Hiking");
  v52[13] = v5;
  v21[0] = CFSTR("categories");
  v21[1] = CFSTR("blacklist-categories");
  v22[0] = &unk_1E85120E0;
  v22[1] = v0;
  v21[2] = CFSTR("precision");
  v21[3] = CFSTR("minimumItemPrecision");
  v22[2] = &unk_1E8511B00;
  v22[3] = &unk_1E8511B18;
  v21[4] = CFSTR("confidence");
  v22[4] = &unk_1E8512218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v51[15] = CFSTR("Stadium");
  v52[14] = v1;
  v19[0] = CFSTR("categories");
  v19[1] = CFSTR("blacklist-categories");
  v20[0] = &unk_1E85120F8;
  v20[1] = MEMORY[0x1E0C9AA60];
  v20[2] = &unk_1E8511B00;
  v19[2] = CFSTR("precision");
  v19[3] = CFSTR("minimumItemPrecision");
  v20[3] = &unk_1E8511B18;
  v20[4] = &unk_1E8512218;
  v19[4] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v52[15] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 16);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_pointOfInterestTraits_pointOfInterestTraits;
  _pointOfInterestTraits_pointOfInterestTraits = v3;

}

void __54__CLSNewLocationInformant__regionOfInterestCategories__block_invoke()
{
  void *v0;

  v0 = (void *)_regionOfInterestCategories_regionOfInterestsCategories;
  _regionOfInterestCategories_regionOfInterestsCategories = (uint64_t)&unk_1E8511F60;

}

+ (id)familyIdentifier
{
  __CFString *v2;

  v2 = CFSTR("com.apple.mediaminingkit.informant.core");
  return CFSTR("com.apple.mediaminingkit.informant.core");
}

+ (id)classIdentifier
{
  return CFSTR("newlocation");
}

+ (id)informantDependenciesIdentifiers
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)pointOfInterestCategories
{
  if (pointOfInterestCategories_onceToken != -1)
    dispatch_once(&pointOfInterestCategories_onceToken, &__block_literal_global_2400);
  return (id)pointOfInterestCategories_pointOfInterestsCategories;
}

+ (id)searchBusinessItemsAtCoordinate:(CLLocationCoordinate2D)a3 forCategories:(id)a4 precision:(double)a5 inCache:(id)a6
{
  double longitude;
  double latitude;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[16];
  CLLocationCoordinate2D v30;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v10 = a4;
  v11 = a6;
  v30.latitude = latitude;
  v30.longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v30))
  {
    v12 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithCenter:radius:identifier:", v14, latitude, longitude, a5);

    objc_msgSend(v11, "businessItemsForRegion:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __91__CLSNewLocationInformant_searchBusinessItemsAtCoordinate_forCategories_precision_inCache___block_invoke;
      v26[3] = &unk_1E84F82E8;
      v27 = v17;
      v19 = v18;
      v28 = v19;
      v20 = v17;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v26);
      v21 = v28;
      v22 = v19;

    }
    else
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "loggingConnection");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAB79000, v24, OS_LOG_TYPE_INFO, "Cannot find business items for region", buf, 2u);
      }

      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)filterBusinessItems:(id)a3 forCategories:(id)a4 subCategories:(id)a5 blocklistCategories:(id)a6
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a6;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__CLSNewLocationInformant_filterBusinessItems_forCategories_subCategories_blocklistCategories___block_invoke;
  v21[3] = &unk_1E84F8310;
  v22 = v13;
  v23 = v14;
  v15 = v12;
  v24 = v15;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);

  v18 = v24;
  v19 = v15;

  return v19;
}

+ (id)_categoriesDescriptionFromCategories:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CLSNewLocationInformant__categoriesDescriptionFromCategories___block_invoke;
  v8[3] = &unk_1E84F8400;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (id)businessItemsForRegion:(id)a3 poiCache:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a4;
  v7 = a3;
  GEOSpatialLookupAllCategories();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", &unk_1E8511B30);
  objc_msgSend(v9, "removeObject:", &unk_1E8511AD0);
  objc_msgSend(v9, "removeObject:", &unk_1E8511AE8);
  v10 = (void *)objc_opt_class();
  objc_msgSend(v7, "center");
  v12 = v11;
  v14 = v13;

  objc_msgSend(v10, "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", v9, v6, v12, v14, 100.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)shiftedLocationFromOriginalLocation:(id)a3
{
  double v4;
  double v5;

  objc_msgSend(a3, "coordinate");
  objc_msgSend(a1, "shiftedCoordinatesFromOriginalCoordinates:");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v4, v5);
}

+ (CLLocationCoordinate2D)shiftedCoordinatesFromOriginalCoordinates:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  double v9;
  double v10;
  CLLocationCoordinate2D result;

  longitude = a3.longitude;
  latitude = a3.latitude;
  +[CLSLocationShifter sharedLocationShifter](CLSLocationShifter, "sharedLocationShifter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shiftedCoordinateForOriginalCoordinate:", latitude, longitude);
  v8 = CLLocationCoordinate2DMake(v6, v7);

  v9 = v8.latitude;
  v10 = v8.longitude;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

+ (BOOL)doesRegion:(id)a3 intersectOtherRegion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  uint64_t v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "center");
  objc_msgSend(v5, "center");
  v16 = v7;
  v17 = v8;
  CLLocationCoordinate2DGetDistanceFrom();
  v10 = v9;
  objc_msgSend(v6, "radius", v16, v17);
  v12 = v11;

  objc_msgSend(v5, "radius");
  v14 = v13;

  return v10 < v12 + v14;
}

+ (BOOL)doesRegion:(id)a3 containLocation:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "center");
  objc_msgSend(v5, "coordinate");
  v8 = v7;
  v10 = v9;

  v16 = v8;
  CLLocationCoordinate2DGetDistanceFrom();
  v12 = v11;
  objc_msgSend(v6, "radius", v16, v10);
  v14 = v13;

  return v12 < v14;
}

+ (id)areaOfInterestCategories
{
  return &unk_1E8512170;
}

+ (id)regionOfInterestCategories
{
  return &unk_1E8512188;
}

+ (id)natureCategories
{
  return &unk_1E85121A0;
}

+ (BOOL)location:(CLLocationCoordinate2D)a3 isCloseToLocation:(CLLocationCoordinate2D)a4
{
  double v4;

  CLLocationCoordinate2DGetDistanceFrom();
  return v4 <= 150.0;
}

+ (BOOL)location:(CLLocationCoordinate2D)a3 isFarFromLocation:(CLLocationCoordinate2D)a4
{
  double v4;

  CLLocationCoordinate2DGetDistanceFrom();
  return v4 >= 111111.11;
}

unint64_t __64__CLSNewLocationInformant__categoriesDescriptionFromCategories___block_invoke(uint64_t a1, void *a2)
{
  unint64_t result;

  result = objc_msgSend(a2, "integerValue");
  if (result <= 0x15)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", off_1E84F8420[result]);
  return result;
}

void __95__CLSNewLocationInformant_filterBusinessItems_forCategories_subCategories_blocklistCategories___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v7 = v3;
  objc_msgSend(v3, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(a1[4], "count") || (objc_msgSend(a1[4], "intersectsSet:", v6) & 1) == 0)
  {
    if (objc_msgSend(a1[5], "intersectsSet:", v6))
      objc_msgSend(a1[6], "addObject:", v7);
  }

}

void __91__CLSNewLocationInformant_searchBusinessItemsAtCoordinate_forCategories_precision_inCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v7 = v3;
  objc_msgSend(v3, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "intersectsSet:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

void __52__CLSNewLocationInformant_pointOfInterestCategories__block_invoke()
{
  void *v0;

  v0 = (void *)pointOfInterestCategories_pointOfInterestsCategories;
  pointOfInterestCategories_pointOfInterestsCategories = (uint64_t)&unk_1E8511F48;

}

@end
