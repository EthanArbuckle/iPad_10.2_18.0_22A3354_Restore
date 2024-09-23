@implementation PHUserFeedbackDataCache

- (PHUserFeedbackDataCache)initWithPhotoLibrary:(id)a3
{
  return -[PHUserFeedbackDataCache initWithPhotoLibrary:importantPersons:](self, "initWithPhotoLibrary:importantPersons:", a3, MEMORY[0x1E0C9AA60]);
}

- (PHUserFeedbackDataCache)initWithPhotoLibrary:(id)a3 importantPersons:(id)a4
{
  id v7;
  id v8;
  PHUserFeedbackDataCache *v9;
  PHUserFeedbackDataCache *v10;
  uint64_t v11;
  OS_os_log *userFeedbackLogging;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHUserFeedbackDataCache;
  v9 = -[PHUserFeedbackDataCache init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_importantPersons, a4);
    PLUserFeedbackGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    userFeedbackLogging = v10->_userFeedbackLogging;
    v10->_userFeedbackLogging = (OS_os_log *)v11;

  }
  return v10;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)loadDataWithPhotoLibrary:(id)a3
{
  id v4;

  v4 = a3;
  -[PHUserFeedbackDataCache _loadPersonFeedbackDataWithPhotoLibrary:](self, "_loadPersonFeedbackDataWithPhotoLibrary:", v4);
  -[PHUserFeedbackDataCache _loadMemoryFeedbackDataWithPhotoLibrary:](self, "_loadMemoryFeedbackDataWithPhotoLibrary:", v4);
  -[PHUserFeedbackDataCache _loadDeniedFeaturedPhotoUUIDsWithPhotoLibrary:](self, "_loadDeniedFeaturedPhotoUUIDsWithPhotoLibrary:", v4);

}

- (NSDictionary)userFeedbackTypeByPersonUUID
{
  PHUserFeedbackDataCache *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userFeedbackTypeByPersonUUID)
    -[PHUserFeedbackDataCache _loadPersonFeedbackDataWithPhotoLibrary:](v2, "_loadPersonFeedbackDataWithPhotoLibrary:", v2->_photoLibrary);
  objc_sync_exit(v2);

  return v2->_userFeedbackTypeByPersonUUID;
}

- (void)_loadPersonFeedbackDataWithPhotoLibrary:(id)a3
{
  id v4;
  OS_os_log *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const char *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t n;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  uint32_t numer;
  uint32_t denom;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  os_signpost_id_t spid;
  uint64_t v85;
  NSObject *v86;
  unint64_t v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  PHUserFeedbackDataCache *v93;
  uint64_t v94;
  id obj;
  void *v96;
  void *context;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
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
  __int128 v123;
  __int128 v124;
  __int128 v125;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v128;
  __int16 v129;
  double v130;
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  const __CFString *v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v93 = self;
  v5 = self->_userFeedbackLogging;
  v6 = os_signpost_id_generate((os_log_t)v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  v87 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadPersonFeedbackData", ", buf, 2u);
  }
  spid = v6;
  v86 = v8;

  v85 = mach_absolute_time();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v88 = v4;
  +[PHMemory blockedPersonLocalIdentifiersInPhotoLibrary:](PHMemory, "blockedPersonLocalIdentifiersInPhotoLibrary:", v4);
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v122, v137, 16);
  obj = v10;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v123;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v123 != v13)
          objc_enumerationMutation(obj);
        v15 = *(const char **)(*((_QWORD *)&v122 + 1) + 8 * i);
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E3654C70, v16);
        }
        else
        {
          PLPhotoKitGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v128 = v15;
            _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_FAULT, "PHUserFeedbackDataCache: person UUID is nil for local identifier %{public}@. Will not add this person on the list of people with negative feedback.", buf, 0xCu);
          }

        }
      }
      v10 = obj;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v137, 16);
    }
    while (v12);
  }

  PLPhotoKitGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v128 = (const char *)v19;
    _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading person user feedback data from legacy storage, %tu people found.", buf, 0xCu);
  }

  v20 = v88;
  objc_msgSend(v88, "librarySpecificFetchOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIncludedDetectionTypes:", &unk_1E3657078);
  objc_msgSend(v10, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHPerson fetchPersonsWithLocalIdentifiers:options:](PHPerson, "fetchPersonsWithLocalIdentifiers:options:", v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v23, "fetchedObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (void *)objc_msgSend(v24, "initWithArray:", v25);

  PLPhotoKitGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_msgSend(v101, "count");
    *(_DWORD *)buf = 134217984;
    v128 = (const char *)v27;
    _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading persons for checking merge candidates, %tu people found.", buf, 0xCu);
  }

  if (objc_msgSend((id)objc_opt_class(), "_isUserFeedbackFeatureFlagEnabled"))
  {
    v82 = v23;
    v83 = v21;
    objc_msgSend(v88, "librarySpecificFetchOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = CFSTR("PHPersonPropertySetUserFeedback");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFetchPropertySets:", v29);

    objc_msgSend(v28, "setIncludedDetectionTypes:", &unk_1E3657090);
    v99 = v28;
    +[PHPerson fetchPersonsWithUserFeedbackWithOptions:](PHPerson, "fetchPersonsWithUserFeedbackWithOptions:", v28);
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v91 = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v118, v135, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v119;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v119 != v32)
            objc_enumerationMutation(v91);
          v34 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * j);
          objc_msgSend(v34, "userFeedbackProperties");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "userFeedback");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "type");

          objc_msgSend(v34, "uuid");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "unsignedIntegerValue");

          v41 = +[PHUserFeedback sumFeedbackType:withOtherFeedbackType:](PHUserFeedback, "sumFeedbackType:withOtherFeedbackType:", v40, v37);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "uuid");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v42, v43);

          objc_msgSend(v101, "addObject:", v34);
        }
        v31 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v118, v135, 16);
      }
      while (v31);
    }

    PLPhotoKitGetLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(v91, "count");
      *(_DWORD *)buf = 134217984;
      v128 = (const char *)v45;
      _os_log_impl(&dword_1991EC000, v44, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading person user feedback data from PHPerson storage, %tu people found.", buf, 0xCu);
    }

    objc_msgSend(v88, "librarySpecificFetchOptions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "setIncludedDetectionTypes:", &unk_1E36570A8);
    v81 = v46;
    +[PHPerson fetchPersonsWithType:options:](PHPerson, "fetchPersonsWithType:options:", -1, v46);
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v90 = (id)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v114, v134, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v115;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v115 != v49)
            objc_enumerationMutation(v90);
          v51 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * k);
          objc_msgSend(v51, "uuid");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E3654CB8, v52);

          objc_msgSend(v101, "addObject:", v51);
        }
        v48 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v114, v134, 16);
      }
      while (v48);
    }

    PLPhotoKitGetLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = objc_msgSend(v90, "count");
      *(_DWORD *)buf = 134217984;
      v128 = (const char *)v54;
      _os_log_impl(&dword_1991EC000, v53, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading person user feedback data from hidden people. %tu persons found.", buf, 0xCu);
    }

    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v89 = v101;
    v94 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v110, v133, 16);
    v55 = 0;
    if (v94)
    {
      v92 = *(_QWORD *)v111;
      do
      {
        v56 = 0;
        do
        {
          if (*(_QWORD *)v111 != v92)
            objc_enumerationMutation(v89);
          v57 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v56);
          context = (void *)MEMORY[0x19AEBEADC]();
          objc_msgSend(v57, "uuid");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "unsignedIntegerValue");

          -[PHUserFeedbackDataCache _confidentMergeCandidateUUIDsForPerson:](v93, "_confidentMergeCandidateUUIDsForPerson:", v57);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectsForKeys:notFoundMarker:");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          v109 = 0u;
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v106, v132, 16);
          v98 = v56;
          v100 = v55;
          if (v62)
          {
            v63 = v62;
            v64 = *(_QWORD *)v107;
            do
            {
              for (m = 0; m != v63; ++m)
              {
                if (*(_QWORD *)v107 != v64)
                  objc_enumerationMutation(v61);
                v60 = +[PHUserFeedback mergeFeedbackType:withOtherFeedbackType:](PHUserFeedback, "mergeFeedbackType:withOtherFeedbackType:", v60, objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * m), "unsignedIntegerValue"));
              }
              v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v106, v132, 16);
            }
            while (v63);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v60);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "uuid");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v66, v67);

          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          v68 = v96;
          v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v102, v131, 16);
          if (v69)
          {
            v70 = v69;
            v71 = *(_QWORD *)v103;
            do
            {
              for (n = 0; n != v70; ++n)
              {
                if (*(_QWORD *)v103 != v71)
                  objc_enumerationMutation(v68);
                v73 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * n);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v60);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v74, v73);

              }
              v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v102, v131, 16);
            }
            while (v70);
          }

          v55 = &v100[objc_msgSend(v68, "count")];
          objc_autoreleasePoolPop(context);
          v56 = v98 + 1;
        }
        while (v98 + 1 != v94);
        v94 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v110, v133, 16);
      }
      while (v94);
    }

    PLPhotoKitGetLog();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v128 = v55;
      _os_log_impl(&dword_1991EC000, v75, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading merge candidates, %tu found.", buf, 0xCu);
    }

    v20 = v88;
    v23 = v82;
    v21 = v83;
  }
  v76 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v79 = v86;
  v80 = v79;
  if (v87 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v80, OS_SIGNPOST_INTERVAL_END, spid, "LoadPersonFeedbackData", ", buf, 2u);
  }

  if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v128 = "LoadPersonFeedbackData";
    v129 = 2048;
    v130 = (float)((float)((float)((float)(v76 - v85) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1991EC000, v80, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  -[PHUserFeedbackDataCache setUserFeedbackTypeByPersonUUID:](v93, "setUserFeedbackTypeByPersonUUID:", v9);

}

- (NSSet)holidayNamesWithNegativeFeedback
{
  PHUserFeedbackDataCache *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_holidayNamesWithNegativeFeedback)
    -[PHUserFeedbackDataCache _loadMemoryFeedbackDataWithPhotoLibrary:](v2, "_loadMemoryFeedbackDataWithPhotoLibrary:", v2->_photoLibrary);
  objc_sync_exit(v2);

  return v2->_holidayNamesWithNegativeFeedback;
}

- (NSSet)areaNamesWithNegativeFeedback
{
  PHUserFeedbackDataCache *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_areaNamesWithNegativeFeedback)
    -[PHUserFeedbackDataCache _loadMemoryFeedbackDataWithPhotoLibrary:](v2, "_loadMemoryFeedbackDataWithPhotoLibrary:", v2->_photoLibrary);
  objc_sync_exit(v2);

  return v2->_areaNamesWithNegativeFeedback;
}

- (NSSet)datesWithNegativeFeedback
{
  PHUserFeedbackDataCache *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_datesWithNegativeFeedback)
    -[PHUserFeedbackDataCache _loadMemoryFeedbackDataWithPhotoLibrary:](v2, "_loadMemoryFeedbackDataWithPhotoLibrary:", v2->_photoLibrary);
  objc_sync_exit(v2);

  return v2->_datesWithNegativeFeedback;
}

- (NSSet)dateIntervalsWithNegativeFeedback
{
  PHUserFeedbackDataCache *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_dateIntervalsWithNegativeFeedback)
    -[PHUserFeedbackDataCache _loadMemoryFeedbackDataWithPhotoLibrary:](v2, "_loadMemoryFeedbackDataWithPhotoLibrary:", v2->_photoLibrary);
  objc_sync_exit(v2);

  return v2->_dateIntervalsWithNegativeFeedback;
}

- (NSSet)locationsWithNegativeFeedback
{
  PHUserFeedbackDataCache *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_locationsWithNegativeFeedback)
    -[PHUserFeedbackDataCache _loadMemoryFeedbackDataWithPhotoLibrary:](v2, "_loadMemoryFeedbackDataWithPhotoLibrary:", v2->_photoLibrary);
  objc_sync_exit(v2);

  return v2->_locationsWithNegativeFeedback;
}

- (void)_loadMemoryFeedbackDataWithPhotoLibrary:(id)a3
{
  id v4;
  OS_os_log *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint32_t numer;
  uint32_t denom;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  PHUserFeedbackDataCache *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  double v70;
  _BYTE v71[128];
  const __CFString *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48 = self;
  v5 = self->_userFeedbackLogging;
  v6 = os_signpost_id_generate((os_log_t)v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadMemoryFeedbackData", ", buf, 2u);
  }
  v46 = v8;

  v45 = mach_absolute_time();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v50 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v52 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v51 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHMemory fetchBlockedMemoriesWithOptions:](PHMemory, "fetchBlockedMemoriesWithOptions:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v63 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "blacklistedFeature");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "type") == 16)
        {
          objc_msgSend(v16, "date");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v10;
        }
        else if (objc_msgSend(v16, "type") == 512)
        {
          objc_msgSend(v16, "dateInterval");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v52;
        }
        else if (objc_msgSend(v16, "type") == 32)
        {
          objc_msgSend(v16, "holidayName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v9;
        }
        else if (objc_msgSend(v16, "type") == 4096)
        {
          objc_msgSend(v16, "location");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v51;
        }
        else
        {
          if (objc_msgSend(v16, "type") != 0x20000)
            goto LABEL_20;
          objc_msgSend(v16, "areaName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v50;
        }
        objc_msgSend(v18, "addObject:", v17);

LABEL_20:
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v13);
  }
  PLPhotoKitGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134217984;
    v68 = (const char *)v20;
    _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading memory user feedback data from legacy storage, %tu found.", buf, 0xCu);
  }

  if (objc_msgSend((id)objc_opt_class(), "_isUserFeedbackFeatureFlagEnabled"))
  {
    v49 = v9;
    v44 = v4;
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = CFSTR("PHMemoryPropertySetUserFeedback");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFetchPropertySets:", v22);

    v43 = v21;
    +[PHMemory fetchMemoriesWithUserFeedbackWithOptions:](PHMemory, "fetchMemoriesWithUserFeedbackWithOptions:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v59;
LABEL_27:
      v27 = 0;
      while (2)
      {
        if (*(_QWORD *)v59 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v27), "userFeedbackProperties");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "userFeedback");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        switch(objc_msgSend(v29, "feature"))
        {
          case 1:
            v57 = 0;
            objc_msgSend(v29, "contextAsDateWithError:", &v57);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (char *)v57;
            if (v30)
            {
              v32 = v10;
              goto LABEL_41;
            }
            PLPhotoKitGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              goto LABEL_53;
            *(_DWORD *)buf = 138412290;
            v68 = v31;
            v34 = v33;
            v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as date: %@";
            goto LABEL_52;
          case 2:
            v55 = 0;
            objc_msgSend(v29, "contextAsStringWithError:", &v55);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (char *)v55;
            if (v30)
            {
              v32 = v49;
              goto LABEL_41;
            }
            PLPhotoKitGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              goto LABEL_53;
            *(_DWORD *)buf = 138412290;
            v68 = v31;
            v34 = v33;
            v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as holiday name: %@";
            goto LABEL_52;
          case 3:
            v54 = 0;
            objc_msgSend(v29, "contextAsLocationWithError:", &v54);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (char *)v54;
            if (v30)
            {
              v32 = v51;
              goto LABEL_41;
            }
            PLPhotoKitGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              goto LABEL_53;
            *(_DWORD *)buf = 138412290;
            v68 = v31;
            v34 = v33;
            v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as location: %@";
            goto LABEL_52;
          case 4:
            v53 = 0;
            objc_msgSend(v29, "contextAsStringWithError:", &v53);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (char *)v53;
            if (v30)
            {
              v32 = v50;
              goto LABEL_41;
            }
            PLPhotoKitGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              goto LABEL_53;
            *(_DWORD *)buf = 138412290;
            v68 = v31;
            v34 = v33;
            v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as area name: %@";
            goto LABEL_52;
          case 5:
            v56 = 0;
            objc_msgSend(v29, "contextAsDateIntervalWithError:", &v56);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (char *)v56;
            if (v30)
            {
              v32 = v52;
LABEL_41:
              objc_msgSend(v32, "addObject:", v30);
            }
            else
            {
              PLPhotoKitGetLog();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v68 = v31;
                v34 = v33;
                v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as date interval: %@";
LABEL_52:
                _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0xCu);
              }
LABEL_53:

              v30 = 0;
            }

LABEL_55:
            if (v25 != ++v27)
              continue;
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
            if (!v25)
              goto LABEL_57;
            goto LABEL_27;
          default:
            goto LABEL_55;
        }
      }
    }
LABEL_57:
    PLPhotoKitGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(v23, "count");
      *(_DWORD *)buf = 134217984;
      v68 = (const char *)v37;
      _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading memory user feedback data from PHMemory storage, %tu found.", buf, 0xCu);
    }

    v4 = v44;
    v9 = v49;
  }
  -[PHUserFeedbackDataCache setHolidayNamesWithNegativeFeedback:](v48, "setHolidayNamesWithNegativeFeedback:", v9);
  -[PHUserFeedbackDataCache setAreaNamesWithNegativeFeedback:](v48, "setAreaNamesWithNegativeFeedback:", v50);
  -[PHUserFeedbackDataCache setDatesWithNegativeFeedback:](v48, "setDatesWithNegativeFeedback:", v10);
  -[PHUserFeedbackDataCache setDateIntervalsWithNegativeFeedback:](v48, "setDateIntervalsWithNegativeFeedback:", v52);
  -[PHUserFeedbackDataCache setLocationsWithNegativeFeedback:](v48, "setLocationsWithNegativeFeedback:", v51);
  v38 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v41 = v46;
  v42 = v41;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v42, OS_SIGNPOST_INTERVAL_END, v6, "LoadMemoryFeedbackData", ", buf, 2u);
  }

  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v68 = "LoadMemoryFeedbackData";
    v69 = 2048;
    v70 = (float)((float)((float)((float)(v38 - v45) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1991EC000, v42, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (id)_confidentMergeCandidateUUIDsForPerson:(id)a3
{
  id v4;
  OS_os_log *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint32_t denom;
  uint32_t numer;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t spid;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  double v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_userFeedbackLogging;
  v6 = os_signpost_id_generate((os_log_t)v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MergeCandidateUUIDsForPerson", ", buf, 2u);
  }

  v29 = mach_absolute_time();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "detectionType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIncludedDetectionTypes:", v14);

  objc_msgSend(v12, "setIncludeOnlyPersonsWithVisibleKeyFaces:", 1);
  spid = v6;
  if (objc_msgSend(v4, "detectionType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %f"), CFSTR("mergeCandidateConfidence"), 0x3FEA8F5C28F5C28FLL, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v15);

    +[PHPerson fetchMergeCandidateWithConfidencePersonsForPerson:options:](PHPerson, "fetchMergeCandidateWithConfidencePersonsForPerson:options:", v4, v12);
  }
  else
  {
    +[PHPerson fetchMergeCandidatePersonsForPerson:options:](PHPerson, "fetchMergeCandidatePersonsForPerson:options:", v4, v12);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v18);
  }

  v22 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v25 = v8;
  v26 = v25;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v26, OS_SIGNPOST_INTERVAL_END, spid, "MergeCandidateUUIDsForPerson", ", buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "MergeCandidateUUIDsForPerson";
    v37 = 2048;
    v38 = (float)((float)((float)((float)(v22 - v29) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v10;
}

- (NSSet)deniedFeaturedPhotoUUIDs
{
  PHUserFeedbackDataCache *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_deniedFeaturedPhotoUUIDs)
    -[PHUserFeedbackDataCache _loadDeniedFeaturedPhotoUUIDsWithPhotoLibrary:](v2, "_loadDeniedFeaturedPhotoUUIDsWithPhotoLibrary:", v2->_photoLibrary);
  objc_sync_exit(v2);

  return v2->_deniedFeaturedPhotoUUIDs;
}

- (void)_loadDeniedFeaturedPhotoUUIDsWithPhotoLibrary:(id)a3
{
  OS_os_log *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint32_t denom;
  uint32_t numer;
  NSObject *v32;
  NSObject *v33;
  id v34;
  os_signpost_id_t spid;
  uint64_t v36;
  NSObject *v37;
  unint64_t v38;
  PHUserFeedbackDataCache *v39;
  void *v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  double v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_isUserFeedbackFeatureFlagEnabled") & 1) != 0)
  {
    v39 = self;
    v4 = self->_userFeedbackLogging;
    v5 = os_signpost_id_generate((os_log_t)v4);
    info = 0;
    mach_timebase_info(&info);
    v6 = v4;
    v7 = v6;
    v38 = v5 - 1;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "LoadDeniedFeaturedPhotoUUIDs", ", buf, 2u);
    }
    spid = v5;
    v37 = v7;

    v36 = mach_absolute_time();
    objc_msgSend(v42, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("state == %d"), 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v9);

    v40 = v8;
    +[PHSuggestion fetchAllFeaturedStateEnabledSuggestionsWithOptions:](PHSuggestion, "fetchAllFeaturedStateEnabledSuggestionsWithOptions:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x19AEBEADC]();
          objc_msgSend(v42, "librarySpecificFetchOptions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHAsset fetchKeyAssetsInAssetCollection:options:](PHAsset, "fetchKeyAssetsInAssetCollection:options:", v16, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v44 != v23)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "uuid");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v25);

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
            }
            while (v22);
          }

          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      }
      while (v13);
    }

    -[PHUserFeedbackDataCache setDeniedFeaturedPhotoUUIDs:](v39, "setDeniedFeaturedPhotoUUIDs:", v11);
    PLPhotoKitGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[PHUserFeedbackDataCache deniedFeaturedPhotoUUIDs](v39, "deniedFeaturedPhotoUUIDs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v28;
      _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading denied featured photos, negative feedback added for %lu assets.", buf, 0xCu);

    }
    v29 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v32 = v37;
    v33 = v32;
    if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v33, OS_SIGNPOST_INTERVAL_END, spid, "LoadDeniedFeaturedPhotoUUIDs", ", buf, 2u);
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "LoadDeniedFeaturedPhotoUUIDs";
      v54 = 2048;
      v55 = (float)((float)((float)((float)(v29 - v36) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  else
  {
    v34 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    -[PHUserFeedbackDataCache setDeniedFeaturedPhotoUUIDs:](self, "setDeniedFeaturedPhotoUUIDs:", v34);

  }
}

- (NSArray)importantPersons
{
  return self->_importantPersons;
}

- (void)setImportantPersons:(id)a3
{
  objc_storeStrong((id *)&self->_importantPersons, a3);
}

- (void)setUserFeedbackTypeByPersonUUID:(id)a3
{
  objc_storeStrong((id *)&self->_userFeedbackTypeByPersonUUID, a3);
}

- (void)setHolidayNamesWithNegativeFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_holidayNamesWithNegativeFeedback, a3);
}

- (void)setAreaNamesWithNegativeFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_areaNamesWithNegativeFeedback, a3);
}

- (void)setDatesWithNegativeFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_datesWithNegativeFeedback, a3);
}

- (void)setDateIntervalsWithNegativeFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_dateIntervalsWithNegativeFeedback, a3);
}

- (void)setLocationsWithNegativeFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_locationsWithNegativeFeedback, a3);
}

- (void)setDeniedFeaturedPhotoUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deniedFeaturedPhotoUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedFeaturedPhotoUUIDs, 0);
  objc_storeStrong((id *)&self->_locationsWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_dateIntervalsWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_datesWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_areaNamesWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_holidayNamesWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_userFeedbackTypeByPersonUUID, 0);
  objc_storeStrong((id *)&self->_importantPersons, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_userFeedbackLogging, 0);
}

+ (BOOL)_isUserFeedbackFeatureFlagEnabled
{
  return 1;
}

+ (id)_emptyUserFeedbackDataCache
{
  return objc_alloc_init(PHUserFeedbackDataCache);
}

@end
