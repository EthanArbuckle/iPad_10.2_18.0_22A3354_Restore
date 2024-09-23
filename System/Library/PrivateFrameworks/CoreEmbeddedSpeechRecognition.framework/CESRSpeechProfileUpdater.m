@implementation CESRSpeechProfileUpdater

- (CESRSpeechProfileUpdater)initWithInstance:(id)a3 speechProfileSite:(id)a4 builder:(id)a5
{
  id v9;
  id v10;
  id v11;
  CESRSpeechProfileUpdater *v12;
  CESRSpeechProfileUpdater *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CESRSpeechProfileUpdater;
  v12 = -[CESRSpeechProfileUpdater init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_instance, a3);
    objc_storeStrong((id *)&v13->_speechProfileSite, a4);
    objc_storeStrong((id *)&v13->_builder, a5);
  }

  return v13;
}

- (BOOL)rebuildCategoryGroup:(id)a3 withSets:(id)a4 version:(id)a5 error:(id *)a6
{
  id *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  CESRSpeechProfileInstance *instance;
  NSObject *v22;
  void *v23;
  CESRSpeechProfileBuilder *builder;
  BOOL v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  CESRSpeechProfileBuilder *v39;
  BOOL v40;
  id v41;
  NSObject *v42;
  CESRSpeechProfileInstance *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  uint64_t v48;
  NSObject *v49;
  CESRSpeechProfileBuilder *v50;
  BOOL v51;
  id v52;
  NSObject *v53;
  CESRSpeechProfileInstance *v54;
  CESRSpeechProfileInstance *v55;
  int v56;
  NSObject *v57;
  NSObject *v58;
  CESRSpeechProfileInstance *v59;
  BOOL v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  CESRSpeechProfileBuilder *v64;
  BOOL v65;
  NSObject *v66;
  void *v67;
  CESRSpeechProfileBuilder *v69;
  BOOL v70;
  id v71;
  NSObject *v72;
  NSObject *v73;
  CESRSpeechProfileInstance *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  char v78;
  NSObject *v79;
  void *v80;
  CESRSpeechProfileInstance *v81;
  CESRSpeechProfileInstance *v82;
  CESRSpeechProfileInstance *v83;
  CESRSpeechProfileInstance *v84;
  CESRSpeechProfileInstance *v85;
  uint64_t v86;
  void *v87;
  unsigned int v89;
  os_signpost_id_t v90;
  id v91;
  uint64_t v92;
  id obj;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  _QWORD v116[6];
  id v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  int v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  _BYTE v132[128];
  uint8_t v133[128];
  uint8_t buf[4];
  const char *v135;
  __int16 v136;
  _BYTE v137[18];
  __int16 v138;
  id v139;
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v95 = a3;
  v91 = a4;
  v102 = a5;
  v9 = (id *)MEMORY[0x1E0CFE6C0];
  v10 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0CFE6C0]);
  v11 = *v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3E5F000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "speechProfileUpdate", " enableTelemetry=YES ", buf, 2u);
  }
  v90 = v10;

  +[CESRSpeechProfileCategoryGroup all](CESRSpeechProfileCategoryGroup, "all");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v95, "isEqual:", v13))
    v14 = 3;
  else
    v14 = 1;
  v89 = v14;

  objc_msgSend(v95, "speechCategories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v15, "count");

  if (v92)
  {
    +[CESRSpeechItemRanker rankersForInstance:speechProfileSite:categoryGroup:sets:](CESRSpeechItemRanker, "rankersForInstance:speechProfileSite:categoryGroup:sets:", self->_instance, self->_speechProfileSite, v95, v91);
    v86 = objc_claimAutoreleasedReturnValue();
    v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v92);
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    objc_msgSend(v95, "speechCategories");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v127, v140, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v128;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v128 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(v101, "setObject:forKey:", v102, *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * i), v86);
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v127, v140, 16);
      }
      while (v17);
    }

    v20 = *v9;
    if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_INFO))
    {
      instance = self->_instance;
      v22 = v20;
      objc_msgSend(v95, "speechCategoriesDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
      v136 = 2112;
      *(_QWORD *)v137 = instance;
      *(_WORD *)&v137[8] = 2112;
      *(_QWORD *)&v137[10] = v102;
      v138 = 2112;
      v139 = v23;
      _os_log_impl(&dword_1B3E5F000, v22, OS_LOG_TYPE_INFO, "%s (%@) Updating version: %@ for categories: %@", buf, 0x2Au);

    }
    builder = self->_builder;
    v126 = 0;
    v25 = -[CESRSpeechProfileBuilder beginWithCategoriesAndVersions:bundleId:error:](builder, "beginWithCategoriesAndVersions:bundleId:error:", v101, 0, &v126, v86);
    v26 = v126;
    v27 = v26;
    if (v25)
    {
      v99 = v26;
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      obj = v87;
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v133, 16);
      if (v96)
      {
        LODWORD(v98) = 0;
        v94 = *(_QWORD *)v123;
        while (2)
        {
          v28 = 0;
          v29 = v99;
          do
          {
            if (*(_QWORD *)v123 != v94)
            {
              v30 = v28;
              objc_enumerationMutation(obj);
              v28 = v30;
            }
            v97 = v28;
            v31 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v28);
            v118 = 0;
            v119 = &v118;
            v120 = 0x2020000000;
            v121 = 0;
            v117 = v29;
            v116[0] = MEMORY[0x1E0C809B0];
            v116[1] = 3221225472;
            v116[2] = __72__CESRSpeechProfileUpdater_rebuildCategoryGroup_withSets_version_error___block_invoke;
            v116[3] = &unk_1E6733DD0;
            v116[4] = self;
            v116[5] = &v118;
            v100 = v31;
            v32 = objc_msgSend(v31, "enumerateRankedItemsWithError:usingBlock:", &v117, v116);
            v99 = v117;

            if ((v32 & 1) == 0)
            {
              v62 = *v9;
              v63 = v99;
              if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
              {
                v82 = self->_instance;
                *(_DWORD *)buf = 136315906;
                v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                v136 = 2112;
                *(_QWORD *)v137 = v82;
                *(_WORD *)&v137[8] = 2112;
                *(_QWORD *)&v137[10] = v100;
                v138 = 2112;
                v139 = v99;
                _os_log_error_impl(&dword_1B3E5F000, v62, OS_LOG_TYPE_ERROR, "%s (%@) Failed to enumerate and add items from ranker: %@ error: %@", buf, 0x2Au);
              }
              if (a6 && v99)
              {
                *a6 = objc_retainAutorelease(v99);
                v63 = v99;
              }

              v64 = self->_builder;
              v115 = 0;
              v65 = -[CESRSpeechProfileBuilder cancelCategoriesWithError:](v64, "cancelCategoriesWithError:", &v115);
              v27 = v115;
              if (!v65)
              {
                v66 = *v9;
                if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
                {
                  v83 = self->_instance;
                  *(_DWORD *)buf = 136315906;
                  v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                  v136 = 2112;
                  *(_QWORD *)v137 = v83;
                  *(_WORD *)&v137[8] = 2112;
                  *(_QWORD *)&v137[10] = v101;
                  v138 = 2112;
                  v139 = v27;
                  _os_log_error_impl(&dword_1B3E5F000, v66, OS_LOG_TYPE_ERROR, "%s (%@) Failed to cancel categories: %@ error: %@", buf, 0x2Au);
                }
              }
              -[CESRSpeechProfileInstance changeRegistry](self->_instance, "changeRegistry");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "rollbackAllBookmarkUpdates");

              -[CESRSpeechProfileUpdater _endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:](self, "_endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:", v90, 4, v89, v92, 0);
              _Block_object_dispose(&v118, 8);

              goto LABEL_69;
            }
            v111 = 0u;
            v112 = 0u;
            v113 = 0u;
            v114 = 0u;
            objc_msgSend(v100, "getAllCodepathIds");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0;
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v111, v132, 16);
            if (v35)
            {
              v36 = *(_QWORD *)v112;
              do
              {
                for (j = 0; j != v35; ++j)
                {
                  if (*(_QWORD *)v112 != v36)
                    objc_enumerationMutation(v33);
                  v38 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * j);
                  v39 = self->_builder;
                  v110 = v34;
                  v40 = -[CESRSpeechProfileBuilder removeCodepathId:error:](v39, "removeCodepathId:error:", v38, &v110);
                  v41 = v110;

                  v34 = v41;
                  if (!v40)
                  {
                    v42 = *v9;
                    if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
                    {
                      v43 = self->_instance;
                      *(_DWORD *)buf = 136315906;
                      v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                      v136 = 2112;
                      *(_QWORD *)v137 = v43;
                      *(_WORD *)&v137[8] = 2112;
                      *(_QWORD *)&v137[10] = v38;
                      v138 = 2112;
                      v139 = v41;
                      _os_log_error_impl(&dword_1B3E5F000, v42, OS_LOG_TYPE_ERROR, "%s (%@) Failed to remove codepathId=%@ from the profile: %@", buf, 0x2Au);
                    }
                  }
                }
                v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v111, v132, 16);
              }
              while (v35);
            }

            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            objc_msgSend(v100, "getActivatedCodepathIds");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
            if (v45)
            {
              v46 = *(_QWORD *)v107;
              do
              {
                for (k = 0; k != v45; ++k)
                {
                  if (*(_QWORD *)v107 != v46)
                    objc_enumerationMutation(v44);
                  v48 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * k);
                  v49 = *v9;
                  if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_DEBUG))
                  {
                    v54 = self->_instance;
                    *(_DWORD *)buf = 136315650;
                    v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                    v136 = 2112;
                    *(_QWORD *)v137 = v54;
                    *(_WORD *)&v137[8] = 2112;
                    *(_QWORD *)&v137[10] = v48;
                    _os_log_debug_impl(&dword_1B3E5F000, v49, OS_LOG_TYPE_DEBUG, "%s (%@) Adding codepathId=%@ to the profile for trigger logging", buf, 0x20u);
                  }
                  v50 = self->_builder;
                  v105 = v34;
                  v51 = -[CESRSpeechProfileBuilder addCodepathId:error:](v50, "addCodepathId:error:", v48, &v105);
                  v52 = v105;

                  v34 = v52;
                  if (!v51)
                  {
                    v53 = *v9;
                    if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
                    {
                      v55 = self->_instance;
                      *(_DWORD *)buf = 136315906;
                      v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                      v136 = 2112;
                      *(_QWORD *)v137 = v55;
                      *(_WORD *)&v137[8] = 2112;
                      *(_QWORD *)&v137[10] = v48;
                      v138 = 2112;
                      v139 = v52;
                      _os_log_error_impl(&dword_1B3E5F000, v53, OS_LOG_TYPE_ERROR, "%s (%@) Failed to add codepathId=%@ to the profile: %@", buf, 0x2Au);
                    }
                  }
                }
                v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
              }
              while (v45);
            }

            v56 = *((_DWORD *)v119 + 6);
            v57 = *v9;
            if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
              v136 = 1024;
              *(_DWORD *)v137 = v56;
              *(_WORD *)&v137[4] = 2112;
              *(_QWORD *)&v137[6] = v100;
              _os_log_impl(&dword_1B3E5F000, v57, OS_LOG_TYPE_INFO, "%s Enumerated %u total items from ranker: %@", buf, 0x1Cu);
            }

            v98 = (v56 + v98);
            _Block_object_dispose(&v118, 8);
            v28 = v97 + 1;
            v29 = v99;
          }
          while (v97 + 1 != v96);
          v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v133, 16);
          if (v96)
            continue;
          break;
        }
      }
      else
      {
        v98 = 0;
      }

      v69 = self->_builder;
      v104 = v99;
      v70 = -[CESRSpeechProfileBuilder finishAndSaveProfile:error:](v69, "finishAndSaveProfile:error:", 1, &v104);
      v71 = v104;

      v72 = *v9;
      v73 = *v9;
      if (v70)
      {
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          v74 = self->_instance;
          v75 = v72;
          objc_msgSend(v95, "speechCategoriesDescription");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
          v136 = 2112;
          *(_QWORD *)v137 = v74;
          *(_WORD *)&v137[8] = 2112;
          *(_QWORD *)&v137[10] = v102;
          v138 = 2112;
          v139 = v76;
          _os_log_impl(&dword_1B3E5F000, v75, OS_LOG_TYPE_INFO, "%s (%@) Completed profile update version: %@ for categories: %@", buf, 0x2Au);

        }
        -[CESRSpeechProfileInstance changeRegistry](self->_instance, "changeRegistry");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = v71;
        v78 = objc_msgSend(v77, "commitAllBookmarkUpdates:", &v103);
        v27 = v103;

        if ((v78 & 1) == 0)
        {
          v79 = *v9;
          if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
          {
            v85 = self->_instance;
            *(_DWORD *)buf = 136315650;
            v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
            v136 = 2112;
            *(_QWORD *)v137 = v85;
            *(_WORD *)&v137[8] = 2112;
            *(_QWORD *)&v137[10] = v27;
            _os_log_error_impl(&dword_1B3E5F000, v79, OS_LOG_TYPE_ERROR, "%s (%@) Failed to commit bookmark updates: %@", buf, 0x20u);
          }
        }
        -[CESRSpeechProfileUpdater _endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:](self, "_endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:", v90, 6, v89, v92, v98);
        v60 = 1;
      }
      else
      {
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v84 = self->_instance;
          *(_DWORD *)buf = 136315650;
          v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
          v136 = 2112;
          *(_QWORD *)v137 = v84;
          *(_WORD *)&v137[8] = 2112;
          *(_QWORD *)&v137[10] = v71;
          _os_log_error_impl(&dword_1B3E5F000, v72, OS_LOG_TYPE_ERROR, "%s (%@) Failed to finish profile due to error: %@", buf, 0x20u);
        }
        if (a6 && v71)
          *a6 = objc_retainAutorelease(v71);
        -[CESRSpeechProfileInstance changeRegistry](self->_instance, "changeRegistry");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "rollbackAllBookmarkUpdates");

        -[CESRSpeechProfileUpdater _endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:](self, "_endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:", v90, 1, v89, v92, v98);
        v60 = 0;
        v27 = v71;
      }
    }
    else
    {
      v61 = *v9;
      if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
      {
        v81 = self->_instance;
        *(_DWORD *)buf = 136315906;
        v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
        v136 = 2112;
        *(_QWORD *)v137 = v81;
        *(_WORD *)&v137[8] = 2112;
        *(_QWORD *)&v137[10] = v101;
        v138 = 2112;
        v139 = v27;
        _os_log_error_impl(&dword_1B3E5F000, v61, OS_LOG_TYPE_ERROR, "%s (%@) Failed to begin building categories: %@ error: %@", buf, 0x2Au);
      }
      if (a6 && v27)
        *a6 = objc_retainAutorelease(v27);
      -[CESRSpeechProfileUpdater _endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:](self, "_endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:", v90, 3, v89, v92, 0);
LABEL_69:
      v60 = 0;
    }

  }
  else
  {
    v58 = *v9;
    if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_INFO))
    {
      v59 = self->_instance;
      *(_DWORD *)buf = 136315650;
      v135 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
      v136 = 2112;
      *(_QWORD *)v137 = v59;
      *(_WORD *)&v137[8] = 2112;
      *(_QWORD *)&v137[10] = v95;
      _os_log_impl(&dword_1B3E5F000, v58, OS_LOG_TYPE_INFO, "%s (%@) Skipping update for group: %@", buf, 0x20u);
    }
    -[CESRSpeechProfileUpdater _endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:](self, "_endSpeechProfileUpdateSignpost:updateResult:updateType:categoryCount:itemCount:", v10, 5, v89, 0, 0);
    v60 = 1;
  }

  return v60;
}

- (void)_endSpeechProfileUpdateSignpost:(unint64_t)a3 updateResult:(unsigned __int8)a4 updateType:(unsigned __int8)a5 categoryCount:(unint64_t)a6 itemCount:(unint64_t)a7
{
  int v7;
  int v8;
  int v9;
  int v10;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  __CFString *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v12 = (id)*MEMORY[0x1E0CFE6C0];
  v13 = v12;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    if ((v9 - 1) > 2)
      v14 = CFSTR("Undefined");
    else
      v14 = off_1E6733938[(v9 - 1)];
    v15 = v14;
    if ((v10 - 1) > 5)
      v16 = CFSTR("Undefined");
    else
      v16 = off_1E6733998[(v10 - 1)];
    v17 = v16;
    v18 = 138544130;
    v19 = v15;
    v20 = 2114;
    v21 = v17;
    v22 = 1026;
    v23 = v7;
    v24 = 1026;
    v25 = v8;
    _os_signpost_emit_with_name_impl(&dword_1B3E5F000, v13, OS_SIGNPOST_INTERVAL_END, a3, "speechProfileUpdate", " updateType=%{public,signpost.telemetry:string1}@  updateResult=%{public,signpost.telemetry:string2}@  itemCount=%{public,signpost.telemetry:number1}d  speechCategoriesCount=%{public,signpost.telemetry:number2}d ", (uint8_t *)&v18, 0x22u);

  }
}

- (BOOL)detectCategoriesToRebuild:(id *)a3 error:(id *)a4
{
  NSObject *v7;
  CESRSpeechProfileInstance *instance;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  CESRSpeechProfileInstance *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  CESRSpeechProfileInstance *v28;
  CESRSpeechProfileInstance *v29;
  NSObject *v30;
  CESRSpeechProfileInstance *v31;
  BOOL v32;
  id v33;
  NSObject *v34;
  BOOL v35;
  CESRSpeechProfileInstance *v37;
  id *v38;
  id *v39;
  id obj;
  uint64_t v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  CESRSpeechProfileInstance *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    instance = self->_instance;
    *(_DWORD *)buf = 136315394;
    v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
    v50 = 2112;
    v51 = instance;
    _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s (%@) Verifying profile", buf, 0x16u);
  }
  v39 = a3;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  +[CESRSpeechProfileCategoryGroup all](CESRSpeechProfileCategoryGroup, "all");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "speechCategories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v11)
  {
    v12 = v11;
    v38 = a4;
    v13 = 0;
    v14 = 0;
    v41 = *(_QWORD *)v45;
LABEL_5:
    v15 = 0;
    v16 = v14;
    while (1)
    {
      if (*(_QWORD *)v45 != v41)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v15);
      v43 = v16;
      -[CESRSpeechProfileUpdater _versionForCategory:error:](self, "_versionForCategory:error:", v17, &v43, v38);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v43;

      if (!v18)
      {
        if (-[CESRSpeechProfileUpdater _errorRequiresCleanRebuild:](self, "_errorRequiresCleanRebuild:", v14))
        {
          v30 = *MEMORY[0x1E0CFE6C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
          {
            v31 = self->_instance;
            *(_DWORD *)buf = 136315650;
            v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
            v50 = 2112;
            v51 = v31;
            v52 = 2112;
            v53 = v14;
            _os_log_impl(&dword_1B3E5F000, v30, OS_LOG_TYPE_INFO, "%s (%@) Verification error requires profile rebuild: %@", buf, 0x20u);
          }
          v42 = 0;
          v32 = -[CESRSpeechProfileUpdater removeProfile:](self, "removeProfile:", &v42);
          v33 = v42;
          if (!v32)
          {
            v34 = *MEMORY[0x1E0CFE6C0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
            {
              v37 = self->_instance;
              *(_DWORD *)buf = 136315650;
              v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
              v50 = 2112;
              v51 = v37;
              v52 = 2112;
              v53 = v33;
              _os_log_error_impl(&dword_1B3E5F000, v34, OS_LOG_TYPE_ERROR, "%s (%@) Failed to remove profile: %@", buf, 0x20u);
            }
          }

        }
        if (v38 && v14)
          *v38 = objc_retainAutorelease(v14);

        v35 = 0;
        goto LABEL_40;
      }
      -[CESRSpeechProfileInstance lastCompletedVersionForSpeechCategory:](self->_instance, "lastCompletedVersionForSpeechCategory:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CESRSpeechProfileInstance lastRegisteredVersionForSpeechCategory:](self->_instance, "lastRegisteredVersionForSpeechCategory:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
      {
        v29 = self->_instance;
        *(_DWORD *)buf = 136316418;
        v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
        v50 = 2112;
        v51 = v29;
        v52 = 2112;
        v53 = v17;
        v54 = 2112;
        v55 = v18;
        v56 = 2112;
        v57 = v19;
        v58 = 2112;
        v59 = v20;
        _os_log_debug_impl(&dword_1B3E5F000, v21, OS_LOG_TYPE_DEBUG, "%s (%@) Checking category (%@) built version (%@) last completed update (%@) last registered update (%@)", buf, 0x3Eu);
      }
      if ((objc_msgSend(v18, "isEqual:", v19) & 1) == 0)
        break;
      v22 = objc_msgSend(v20, "longLongValue");
      if (v22 > objc_msgSend(v19, "longLongValue"))
      {
        v23 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
        {
          v24 = self->_instance;
          *(_DWORD *)buf = 136316162;
          v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
          v50 = 2112;
          v51 = v24;
          v52 = 2112;
          v53 = v20;
          v54 = 2112;
          v55 = v19;
          v56 = 2112;
          v57 = v17;
          v25 = v23;
          v26 = "%s (%@) Found deferred update registered (%@) more recently than last completed (%@) for category (%@)";
          goto LABEL_17;
        }
        goto LABEL_18;
      }
LABEL_21:

      ++v15;
      v16 = v14;
      if (v12 == v15)
      {
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        if (v12)
          goto LABEL_5;
        goto LABEL_36;
      }
    }
    v27 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v28 = self->_instance;
      *(_DWORD *)buf = 136316162;
      v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
      v50 = 2112;
      v51 = v28;
      v52 = 2112;
      v53 = v17;
      v54 = 2112;
      v55 = v18;
      v56 = 2112;
      v57 = v19;
      v25 = v27;
      v26 = "%s (%@) Built category (%@) has version (%@) inconsistent with instance info file (%@)";
LABEL_17:
      _os_log_impl(&dword_1B3E5F000, v25, OS_LOG_TYPE_INFO, v26, buf, 0x34u);
    }
LABEL_18:
    if (!v13)
      v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v13, "addObject:", v17);
    goto LABEL_21;
  }
  v13 = 0;
  v14 = 0;
LABEL_36:

  if (v39 && objc_msgSend(v13, "count"))
  {
    +[CESRSpeechProfileCategoryGroup groupForSpeechCategories:](CESRSpeechProfileCategoryGroup, "groupForSpeechCategories:", v13);
    *v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  v35 = 1;
LABEL_40:

  return v35;
}

- (id)categoriesToRebuildForAllSets:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  CESRSpeechProfileInstance *instance;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  CESRSpeechProfileInstance *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CESRSpeechProfileInstance changeRegistry](self->_instance, "changeRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v6 = objc_msgSend(v5, "cleanupWithAllSets:error:", v4, &v25);
  v7 = v25;

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          buf[0] = 0;
          v15 = +[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:](CESRSpeechProfileUpdater, "updateModeForSet:speechProfileInstance:isSetNew:", v14, self->_instance, buf, (_QWORD)v21);
          if (buf[0])
            v16 = 0;
          else
            v16 = v15 == 0;
          if (!v16)
            objc_msgSend(v8, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      +[CESRSpeechProfileCategoryGroup groupForSets:](CESRSpeechProfileCategoryGroup, "groupForSets:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v18 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      instance = self->_instance;
      *(_DWORD *)buf = 136315650;
      v28 = "-[CESRSpeechProfileUpdater categoriesToRebuildForAllSets:]";
      v29 = 2112;
      v30 = instance;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1B3E5F000, v18, OS_LOG_TYPE_INFO, "%s (%@) Registry cleanup failed: %@", buf, 0x20u);
    }
    +[CESRSpeechProfileCategoryGroup all](CESRSpeechProfileCategoryGroup, "all");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_versionForCategory:(id)a3 error:(id *)a4
{
  id v6;
  CESRSpeechProfileBuilder *builder;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  builder = self->_builder;
  v13 = 0;
  v8 = -[CESRSpeechProfileBuilder getVersionForCategory:error:](builder, "getVersionForCategory:error:", v6, &v13);
  v9 = v13;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v10 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[CESRSpeechProfileUpdater _versionForCategory:error:]";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v9;
    _os_log_error_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_ERROR, "%s Checking version for category (%@) produced error: %@", buf, 0x20u);
    if (a4)
      goto LABEL_4;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!a4)
    goto LABEL_7;
LABEL_4:
  v11 = 0;
  *a4 = objc_retainAutorelease(v9);
LABEL_8:

  return v11;
}

- (BOOL)_errorRequiresCleanRebuild:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  BOOL v8;
  BOOL v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isEqual:", CFSTR("CESRProfileErrorDomain"));
  v8 = v4 == 6 || (unint64_t)(v4 - 1) < 2;
  if (v6)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (BOOL)removeProfile:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[CESRSpeechProfileSite speechProfileSiteURL](self->_speechProfileSite, "speechProfileSiteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CESRSpeechProfileInstance locale](self->_instance, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CESRSpeechProfileSite userId](self->_speechProfileSite, "userId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[CESRSpeechProfileBuilder deleteProfileAtDirectory:locale:userId:error:](CESRSpeechProfileBuilder, "deleteProfileAtDirectory:locale:userId:error:", v5, v6, v7, a3);

  return (char)a3;
}

- (void)refreshRankedItemCaches
{
  +[CESRSpeechItemRanker refreshRankedItemCachesForInstance:speechProfileSite:](CESRSpeechItemRanker, "refreshRankedItemCachesForInstance:speechProfileSite:", self->_instance, self->_speechProfileSite);
}

- (CESRSpeechProfileBuilder)builder
{
  return self->_builder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_speechProfileSite, 0);
  objc_storeStrong((id *)&self->_instance, 0);
}

uint64_t __72__CESRSpeechProfileUpdater_rebuildCategoryGroup_withSets_version_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addVocabularyItem:isBoosted:error:", a2, a3, a4);
}

+ (id)updaterForInstance:(id)a3 atSpeechProfileSite:(id)a4
{
  id v5;
  id v6;
  CESRSpeechProfileBuilder *v7;
  void *v8;
  void *v9;
  void *v10;
  CESRSpeechProfileBuilder *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = [CESRSpeechProfileBuilder alloc];
  objc_msgSend(v5, "speechProfileSiteURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CESRSpeechProfileBuilder initWithDirectory:locale:userId:dataProtectionClass:](v7, "initWithDirectory:locale:userId:dataProtectionClass:", v8, v9, v10, (int)objc_msgSend(v5, "dataProtectionClass"));

  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInstance:speechProfileSite:builder:", v6, v5, v11);
  return v12;
}

+ (unint64_t)updateModeForSets:(id)a3 speechProfileInstance:(id)a4 speechProfileSite:(id)a5 isAnySetNew:(BOOL *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  BOOL v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v18;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v14)
        objc_enumerationMutation(v10);
      v13 |= +[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:](CESRSpeechProfileUpdater, "updateModeForSet:speechProfileInstance:isSetNew:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), v9, &v21, (_QWORD)v17);
      if (v21)
        break;
      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v13 = 0;
  }

  if (a6)
    *a6 = v21;

  return v13;
}

+ (unint64_t)updateModeForSet:(id)a3 speechProfileInstance:(id)a4 isSetNew:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  __CFString *v23;
  unint64_t v24;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend(v8, "changeRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bookmarkForSet:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v18 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      goto LABEL_8;
    *(_DWORD *)buf = 136315650;
    v39 = "+[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:]";
    v40 = 2112;
    v41 = v8;
    v42 = 2112;
    v43 = v7;
    v15 = "%s (%@) No bookmark found for set: %@";
    v16 = v18;
    v17 = 32;
LABEL_7:
    _os_log_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
LABEL_8:
    if (a5)
      *a5 = 1;
    goto LABEL_21;
  }
  objc_msgSend(v7, "changePublisherWithUseCase:", CFSTR("SpeechProfile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__CESRSpeechProfileUpdater_updateModeForSet_speechProfileInstance_isSetNew___block_invoke;
  v27[3] = &unk_1E6733DF8;
  v27[4] = &v32;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__CESRSpeechProfileUpdater_updateModeForSet_speechProfileInstance_isSetNew___block_invoke_2;
  v26[3] = &unk_1E6733E20;
  v26[4] = &v28;
  v12 = (id)objc_msgSend(v11, "drivableSinkWithBookmark:completion:shouldContinue:", v10, v27, v26);

  v13 = (__CFString *)v33[5];
  v14 = *MEMORY[0x1E0CFE6C0];
  if (v13)
  {
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      goto LABEL_8;
    *(_DWORD *)buf = 136315906;
    v39 = "+[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:]";
    v40 = 2112;
    v41 = v8;
    v42 = 2112;
    v43 = v7;
    v44 = 2112;
    v45 = v13;
    v15 = "%s (%@) Failed to enumerate set: %@ error: %@";
    v16 = v14;
    v17 = 42;
    goto LABEL_7;
  }
  v19 = v14;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = v29[3];
    if (v20)
    {
      v21 = CFSTR("Add");
      v22 = &stru_1E67359A8;
      if ((v20 & 1) == 0)
        v21 = &stru_1E67359A8;
      if ((v20 & 2) != 0)
        v22 = CFSTR("Remove");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@|%@]"), v21, v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("NO");
    }
    *(_DWORD *)buf = 136315906;
    v39 = "+[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:]";
    v40 = 2112;
    v41 = v8;
    v42 = 2112;
    v43 = v7;
    v44 = 2112;
    v45 = v23;
    _os_log_impl(&dword_1B3E5F000, v19, OS_LOG_TYPE_INFO, "%s (%@) Set %@ has %@ updates since last enumeration", buf, 0x2Au);
    if (v20)

  }
LABEL_21:
  v24 = v29[3];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v24;
}

void __76__CESRSpeechProfileUpdater_updateModeForSet_speechProfileInstance_isSetNew___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

BOOL __76__CESRSpeechProfileUpdater_updateModeForSet_speechProfileInstance_isSetNew___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "sharedItemChangeType");
  if (!v3)
  {
    v4 = 1;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    v4 = 2;
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v4;
  }
  return (~*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) & 3) != 0;
}

@end
