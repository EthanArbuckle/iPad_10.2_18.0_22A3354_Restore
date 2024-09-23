@implementation HDConceptIndexer

- (HDConceptIndexer)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (BOOL)indexSamplesForProfile:(id)a3 limit:(unint64_t)a4 outIndexedSamplesCount:(int64_t *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;
  int64_t *v18;

  v10 = a3;
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__HDConceptIndexer_indexSamplesForProfile_limit_outIndexedSamplesCount_error___block_invoke;
  v14[3] = &unk_1E6D09FB8;
  v17 = a4;
  v18 = a5;
  v15 = v10;
  v16 = a1;
  v12 = v10;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDMedicalRecordEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a6, v14);

  return (char)a6;
}

BOOL __78__HDConceptIndexer_indexSamplesForProfile_limit_outIndexedSamplesCount_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  HDMultiTypeSortedSampleIterator *v25;
  _BOOL4 v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  HDConceptResolutionConfiguration *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  int v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  id j;
  void *v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t k;
  uint64_t v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  NSObject *v80;
  HDConceptIndexEntry *v81;
  void *v82;
  void *v83;
  HDConceptIndexEntry *v84;
  void *v85;
  NSObject *v86;
  NSObject *v87;
  _BOOL4 v88;
  id v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  BOOL v93;
  void *v94;
  void *v95;
  objc_class *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  BOOL v101;
  id v102;
  void *v103;
  HDMultiTypeSortedSampleIterator *v104;
  int v105;
  NSObject *v106;
  id v107;
  void *v108;
  _BOOL8 v109;
  NSObject *v111;
  void *v112;
  void *v113;
  _QWORD *v114;
  void *v115;
  _QWORD *v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  uint64_t v121;
  HDMultiTypeSortedSampleIterator *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  HDConceptResolutionConfiguration *v130;
  id v131;
  char v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id obj;
  id obja;
  id v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _QWORD v155[4];
  NSObject *v156;
  uint64_t v157;
  id v158;
  id v159;
  _QWORD v160[4];
  HDConceptResolutionConfiguration *v161;
  id v162;
  id v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint8_t v168[4];
  void *v169;
  _BYTE v170[128];
  _BYTE buf[12];
  __int16 v172;
  void *v173;
  __int128 v174;
  HDQueryDescriptor *(*v175)(uint64_t, void *);
  void *v176;
  id v177;
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  v123 = a1[6];
  v114 = (_QWORD *)a1[7];
  v4 = (void *)a1[4];
  v5 = a2;
  v6 = v4;
  objc_opt_self();
  v7 = v6;
  v8 = v5;
  v9 = v7;
  v10 = objc_opt_self();
  +[HDConceptIndexer _keyValueDomainWithProfile:](v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDConceptIndexer _stateWithKeyValueDomain:transaction:error:](v10, v11, a3);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_97:
    v109 = 0;
    goto LABEL_98;
  }
  v116 = a3;
  v117 = v11;
  v120 = v8;
  v126 = v12;
  -[NSObject anchor](v12, "anchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v9;
  objc_msgSend(v9, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "behavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "futureMigrationsEnabled");
  v17 = v13;
  v121 = v10;
  objc_opt_self();
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v17, "_rowid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithProperty:greaterThanValue:", CFSTR("data_id"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB6A88], "medicalRecordDescriptionsWithPredicate:futureMigrationsEnabled:", 0, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v174 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v174 + 1) = 3221225472;
  v175 = __76__HDConceptIndexer__queryDescriptorsFollowingAnchor_futureMigrationEnabled___block_invoke;
  v176 = &unk_1E6D09FE0;
  v177 = v20;
  v23 = v20;
  objc_msgSend(v21, "hk_map:", &v174);
  v24 = objc_claimAutoreleasedReturnValue();

  v115 = (void *)v24;
  v25 = -[HDMultiTypeSortedSampleIterator initWithQueryDescriptors:includeDeletedObjects:anchor:sortDescriptors:bufferSize:profile:]([HDMultiTypeSortedSampleIterator alloc], "initWithQueryDescriptors:includeDeletedObjects:anchor:sortDescriptors:bufferSize:profile:", v24, 0, 0, 0, v123, v125);
  v119 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v145 = 0;
  v26 = -[HDMultiTypeSortedSampleIterator advanceWithError:](v25, "advanceWithError:", &v145);
  v27 = v145;
  v28 = v27;
  v122 = v25;
  if (v26)
  {
    v124 = 0;
    v129 = 0;
    v29 = v27;
    v8 = v120;
    while (1)
    {
      if (v123 && v129 >= v123)
      {
        v28 = v29;
        goto LABEL_79;
      }
      v128 = v29;
      -[HDMultiTypeSortedSampleIterator sample](v25, "sample");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = 0;
      v31 = v30;
      v32 = v125;
      v33 = v8;
      objc_opt_self();
      v127 = v33;
      if ((objc_msgSend(v31, "conformsToProtocol:", &unk_1EF2174C8) & 1) != 0)
      {
        v118 = v31;
        v34 = v31;
        v143 = v32;
        objc_msgSend(v32, "ontologyDatabase");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "ontologyContentVersionWithError:", &v144);
        v36 = (id)objc_claimAutoreleasedReturnValue();

        v142 = v36;
        if (v36)
        {
          v141 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v37 = [HDConceptResolutionConfiguration alloc];
          objc_msgSend(v34, "country");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          HKCurrentLocaleCountryCodeIfUnknown();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = -[HDConceptResolutionConfiguration initWithCountryCode:recordCategoryType:options:](v37, "initWithCountryCode:recordCategoryType:options:", v39, objc_msgSend(v34, "recordCategoryType"), 0);

          v166 = 0u;
          v167 = 0u;
          v164 = 0u;
          v165 = 0u;
          objc_msgSend((id)objc_opt_class(), "indexableConceptKeyPaths");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, &v174, 16);
          v135 = v34;
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v165;
            v132 = 1;
            while (2)
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v165 != v42)
                  objc_enumerationMutation(obj);
                v44 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * i);
                v163 = 0;
                objc_msgSend(v34, "codingsForKeyPath:error:", v44, &v163);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = v163;
                if (!v45)
                {
                  _HKInitializeLogging();
                  HKLogConceptIndex();
                  v62 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                  {
                    HKSensitiveLogItem();
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    *(_QWORD *)&buf[4] = v98;
                    _os_log_error_impl(&dword_1B7802000, v62, OS_LOG_TYPE_ERROR, "Failed to index sample with error %{public}@", buf, 0xCu);

                  }
                  v132 = 0;
                  goto LABEL_33;
                }
                v160[0] = v22;
                v160[1] = 3221225472;
                v160[2] = __59__HDConceptIndexer__indexSample_profile_transaction_error___block_invoke;
                v160[3] = &unk_1E6D0A008;
                v161 = v130;
                v162 = v143;
                objc_msgSend(v45, "hk_map:", v160);
                v47 = v22;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v159 = 0;
                v49 = objc_msgSend(v34, "applyConcepts:forKeyPath:error:", v48, v44, &v159);
                v50 = v159;
                v51 = v34;
                v52 = v50;
                if ((v49 & 1) != 0)
                {
                  v155[0] = v47;
                  v155[1] = 3221225472;
                  v155[2] = __59__HDConceptIndexer__indexSample_profile_transaction_error___block_invoke_281;
                  v155[3] = &unk_1E6D0A030;
                  v156 = v51;
                  v157 = v44;
                  v158 = v142;
                  objc_msgSend(v48, "hk_map:", v155);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v141, "addObjectsFromArray:", v53);

                  v54 = v156;
                }
                else
                {
                  _HKInitializeLogging();
                  HKLogConceptIndex();
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v135, "UUID");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    HKSensitiveLogItem();
                    v137 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)&buf[4] = v55;
                    v172 = 2114;
                    v173 = v137;
                    _os_log_error_impl(&dword_1B7802000, v54, OS_LOG_TYPE_ERROR, "Failed to apply concepts to sample with UUID %{public}@ with error %{public}@", buf, 0x16u);

                  }
                  v132 = 0;
                }

                if (!v49)
                {
                  v34 = v135;
                  goto LABEL_33;
                }
                v22 = MEMORY[0x1E0C809B0];
                v34 = v135;
              }
              v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, &v174, 16);
              if (v41)
                continue;
              break;
            }
          }
          else
          {
            v132 = 1;
          }
LABEL_33:

          v154 = 0u;
          v152 = 0u;
          v153 = 0u;
          v151 = 0u;
          objc_msgSend((id)objc_opt_class(), "cachedConceptRelationshipKeyPaths");
          v131 = (id)objc_claimAutoreleasedReturnValue();
          v134 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v151, buf, 16);
          if (v134)
          {
            v133 = *(_QWORD *)v152;
            while (2)
            {
              for (j = 0; j != (id)v134; j = (char *)j + 1)
              {
                if (*(_QWORD *)v152 != v133)
                  objc_enumerationMutation(v131);
                v64 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * (_QWORD)j);
                objc_msgSend(v64, "componentsSeparatedByString:", CFSTR("."));
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = v34;
                v147 = 0u;
                v148 = 0u;
                v149 = 0u;
                v150 = 0u;
                v67 = v65;
                v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v147, v170, 16);
                if (v68)
                {
                  v69 = v68;
                  v138 = v64;
                  obja = j;
                  v70 = v66;
                  v71 = *(_QWORD *)v148;
                  v136 = v70;
                  while (2)
                  {
                    for (k = 0; k != v69; ++k)
                    {
                      if (*(_QWORD *)v148 != v71)
                        objc_enumerationMutation(v67);
                      v73 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * k);
                      v74 = (void *)MEMORY[0x1BCCACAC4]();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v75 = v70;
                        v70 = v75;
                        if ((objc_msgSend(v75, "relationshipsAreLoaded") & 1) == 0)
                        {
                          objc_msgSend(v75, "identifier");
                          v76 = (void *)objc_claimAutoreleasedReturnValue();
                          v146 = 0;
                          +[HDOntologyConceptManager relationshipsForConceptWithIdentifier:profile:error:](HDOntologyConceptManager, "relationshipsForConceptWithIdentifier:profile:error:", v76, v143, &v146);
                          v77 = (void *)objc_claimAutoreleasedReturnValue();
                          v78 = v146;

                          if (!v77)
                          {
                            _HKInitializeLogging();
                            HKLogConceptIndex();
                            v80 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                            {
                              HKSensitiveLogItem();
                              v85 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)v168 = 138543362;
                              v169 = v85;
                              _os_log_error_impl(&dword_1B7802000, v80, OS_LOG_TYPE_ERROR, "error loading relationships for concept: %{public}@", v168, 0xCu);

                            }
                            objc_autoreleasePoolPop(v74);
                            v132 = 0;
                            goto LABEL_54;
                          }
                          v70 = (void *)objc_msgSend(v75, "copyWithRelationships:", v77);

                        }
                      }
                      v79 = v70;
                      objc_autoreleasePoolPop(v74);
                      objc_msgSend(v70, "valueForKey:", v73);
                      v70 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v147, v170, 16);
                    if (v69)
                      continue;
                    break;
                  }
                  v75 = v70;
LABEL_54:
                  v34 = v135;
                  v66 = v136;
                  v64 = v138;
                  j = obja;
                }
                else
                {
                  v75 = v66;
                }

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  _HKInitializeLogging();
                  HKLogConceptIndex();
                  v86 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                  {
                    v96 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v96);
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v168 = 138543362;
                    v169 = v97;
                    _os_log_error_impl(&dword_1B7802000, v86, OS_LOG_TYPE_ERROR, "Encountered an unsupported class %{public}@ when generating concept relationship cache", v168, 0xCu);

                  }
                  v8 = v120;
                  goto LABEL_64;
                }
                v81 = [HDConceptIndexEntry alloc];
                objc_msgSend(v66, "UUID");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "identifier");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = -[HDConceptIndexEntry initWithSampleUUID:conceptIdentifier:conceptVersion:keyPath:compoundIndex:type:ontologyVersion:](v81, "initWithSampleUUID:conceptIdentifier:conceptVersion:keyPath:compoundIndex:type:ontologyVersion:", v82, objc_msgSend(v83, "rawIdentifier"), objc_msgSend(v75, "version"), v64, 0, 1, v142);
                objc_msgSend(v141, "addObject:", v84);

              }
              v134 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v151, buf, 16);
              if (v134)
                continue;
              break;
            }
          }

          v8 = v120;
          if ((v132 & 1) != 0)
          {
            v36 = v141;
            v22 = MEMORY[0x1E0C809B0];
          }
          else
          {
LABEL_64:
            _HKInitializeLogging();
            HKLogConceptIndex();
            v87 = objc_claimAutoreleasedReturnValue();
            v88 = os_log_type_enabled(v87, OS_LOG_TYPE_ERROR);
            v22 = MEMORY[0x1E0C809B0];
            if (v88)
            {
              objc_msgSend(v34, "UUID");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v168 = 138412290;
              v169 = v95;
              _os_log_error_impl(&dword_1B7802000, v87, OS_LOG_TYPE_ERROR, "Failed to index sample with UUID %@", v168, 0xCu);

            }
            v36 = 0;
          }

        }
        v60 = v143;

        v61 = v118;
      }
      else
      {
        v56 = v32;
        v57 = (void *)MEMORY[0x1E0CB35C8];
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v59 = v57;
        v60 = v56;
        objc_msgSend(v59, "hk_assignError:code:format:", &v144, 3, CFSTR("Unsupported sample class (%@) when generating concept index"), v34);
        v61 = v31;
        v36 = 0;
      }

      v89 = v144;
      if (v36)
      {
        objc_msgSend(v119, "addObjectsFromArray:", v36);
        v25 = v122;
        objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", -[HDMultiTypeSortedSampleIterator objectID](v122, "objectID"));
        v90 = objc_claimAutoreleasedReturnValue();

        v91 = v126;
        v92 = -[NSObject copyWithAnchor:](v126, "copyWithAnchor:", v90);
        v124 = (void *)v90;
        v8 = v120;
        v126 = v92;
      }
      else
      {
        if (objc_msgSend(v89, "hk_isDatabaseAccessibilityError"))
        {

          v105 = 0;
          v28 = v128;
          goto LABEL_94;
        }
        _HKInitializeLogging();
        HKLogConceptIndex();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          HKSensitiveLogItem();
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v174) = 138543362;
          *(_QWORD *)((char *)&v174 + 4) = v94;
          _os_log_error_impl(&dword_1B7802000, v91, OS_LOG_TYPE_ERROR, "Failed to index sample with error %{public}@", (uint8_t *)&v174, 0xCu);

          v8 = v120;
        }
        v25 = v122;
      }
      ++v129;

      v145 = v128;
      v93 = -[HDMultiTypeSortedSampleIterator advanceWithError:](v25, "advanceWithError:", &v145);
      v28 = v145;

      v29 = v28;
      if (!v93)
        goto LABEL_79;
    }
  }
  v129 = 0;
  v124 = 0;
  v8 = v120;
LABEL_79:
  v99 = v125;
  v100 = v119;
  objc_opt_self();
  *(_QWORD *)buf = 0;
  v101 = +[HDConceptIndexEntity insertConceptIndexEntries:profile:error:](HDConceptIndexEntity, "insertConceptIndexEntries:profile:error:", v100, v99, buf);

  v102 = *(id *)buf;
  v103 = v102;
  if (!v101)
  {
    _HKInitializeLogging();
    HKLogConceptIndex();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v174) = 138543362;
      *(_QWORD *)((char *)&v174 + 4) = v112;
      _os_log_error_impl(&dword_1B7802000, v106, OS_LOG_TYPE_ERROR, "Failed to store concept index entries with error %{public}@", (uint8_t *)&v174, 0xCu);

    }
    v107 = v103;
    v108 = v107;
    if (v107)
    {
      if (v116)
        *v116 = objc_retainAutorelease(v107);
      else
        _HKLogDroppedError();
    }

    goto LABEL_93;
  }

  if (!+[HDConceptIndexer _storeState:keyValueDomain:transaction:error:](v121, v126, v117, (uint64_t)v116))
  {
LABEL_93:
    v105 = 0;
    goto LABEL_94;
  }
  if (v114)
    *v114 = v129;
  v104 = v122;
  if (!v28 || (objc_msgSend(v28, "hk_isHealthKitErrorWithCode:", 900) & 1) != 0)
  {
    v105 = 1;
    goto LABEL_95;
  }
  _HKInitializeLogging();
  HKLogConceptIndex();
  v111 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
  {
    HKSensitiveLogItem();
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v174) = 138543362;
    *(_QWORD *)((char *)&v174 + 4) = v113;
    _os_log_error_impl(&dword_1B7802000, v111, OS_LOG_TYPE_ERROR, "Failed to index samples with error %{public}@", (uint8_t *)&v174, 0xCu);

  }
  if (!v116)
  {
    _HKLogDroppedError();
    goto LABEL_93;
  }
  v28 = objc_retainAutorelease(v28);
  v105 = 0;
  *v116 = v28;
LABEL_94:
  v104 = v122;
LABEL_95:

  if (!v105)
    goto LABEL_97;
  v109 = +[HDAdHocConceptEntity deleteNonIndexedConceptsWithTransaction:error:](HDAdHocConceptEntity, "deleteNonIndexedConceptsWithTransaction:error:", v8, v116);
LABEL_98:

  return v109;
}

+ (BOOL)resetIndexManagerStateForProfile:(id)a3 withError:(id *)a4
{
  id v5;
  HDConceptIndexResetOperation *v6;

  v5 = a3;
  v6 = objc_alloc_init(HDConceptIndexResetOperation);
  LOBYTE(a4) = -[HDJournalableOperation performOrJournalWithProfile:error:](v6, "performOrJournalWithProfile:error:", v5, a4);

  return (char)a4;
}

+ (id)stateWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[HDConceptIndexer _keyValueDomainWithProfile:]((uint64_t)a1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDConceptIndexer _stateWithKeyValueDomain:transaction:error:]((uint64_t)a1, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (HDKeyValueDomain)_keyValueDomainWithProfile:(uint64_t)a1
{
  id v2;
  HDKeyValueDomain *v3;

  v2 = a2;
  objc_opt_self();
  v3 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 0, CFSTR("com.apple.health.records"), v2);

  return v3;
}

+ (HDConceptIndexState)_stateWithKeyValueDomain:(uint64_t)a1 transaction:(void *)a2 error:(_QWORD *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HDConceptIndexState *v9;
  id v11;

  v4 = a2;
  objc_opt_self();
  v11 = 0;
  objc_msgSend(v4, "dataForKey:error:", CFSTR("Indexer-State"), &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, a3);
    objc_msgSend(v8, "setClass:forClassName:", objc_opt_class(), CFSTR("HDConceptIndexManagerState"));
    objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v9 = (HDConceptIndexState *)objc_claimAutoreleasedReturnValue();

  }
  else if (v6)
  {
    if (a3)
    {
      v9 = 0;
      *a3 = objc_retainAutorelease(v6);
    }
    else
    {
      _HKLogDroppedError();
      v9 = 0;
    }
  }
  else
  {
    v9 = objc_alloc_init(HDConceptIndexState);
  }

  return v9;
}

+ (BOOL)storeState:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a5;
  v11 = a3;
  +[HDConceptIndexer _keyValueDomainWithProfile:]((uint64_t)a1, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = +[HDConceptIndexer _storeState:keyValueDomain:transaction:error:]((uint64_t)a1, v11, v12, (uint64_t)a6);

  return (char)a6;
}

+ (uint64_t)_storeState:(uint64_t)a1 keyValueDomain:(void *)a2 transaction:(void *)a3 error:(uint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v6, "setData:forKey:error:", v8, CFSTR("Indexer-State"), a4);
  else
    v9 = 0;

  return v9;
}

HDQueryDescriptor *__76__HDConceptIndexer__queryDescriptorsFollowingAnchor_futureMigrationEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HDQueryDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDQueryDescriptor *v9;

  v3 = a2;
  v4 = [HDQueryDescriptor alloc];
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HDQueryDescriptor initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:filter:samplePredicate:deletedObjectsPredicate:](v4, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:filter:samplePredicate:deletedObjectsPredicate:", v7, 0, 0, 0, v8, *(_QWORD *)(a1 + 32), 0);
  return v9;
}

id __59__HDConceptIndexer__indexSample_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  +[HDOntologyConceptManager conceptForCodingCollection:configuration:profile:error:](HDOntologyConceptManager, "conceptForCodingCollection:configuration:profile:error:", v4, v5, v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB67C8], "indexableObjectWithObject:compoundIndex:", v7, objc_msgSend(v3, "compoundIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    HKLogConceptIndex();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to resolve concept for coding collection %{public}@ with error %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }

  return v9;
}

HDConceptIndexEntry *__59__HDConceptIndexer__indexSample_profile_transaction_error___block_invoke_281(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  HDConceptIndexEntry *v12;
  HDConceptIndexEntry *v14;

  v3 = a2;
  v14 = [HDConceptIndexEntry alloc];
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rawIdentifier");
  objc_msgSend(v3, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = *(_QWORD *)(a1 + 40);
  v11 = objc_msgSend(v3, "compoundIndex");

  v12 = -[HDConceptIndexEntry initWithSampleUUID:conceptIdentifier:conceptVersion:keyPath:compoundIndex:type:ontologyVersion:](v14, "initWithSampleUUID:conceptIdentifier:conceptVersion:keyPath:compoundIndex:type:ontologyVersion:", v4, v7, v9, v10, v11, 0, *(_QWORD *)(a1 + 48));
  return v12;
}

@end
