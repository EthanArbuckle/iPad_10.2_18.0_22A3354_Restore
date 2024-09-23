@implementation _HKObjectComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  void *v34;
  int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  int v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  char *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t m;
  uint64_t v75;
  HDSourceRevision *v76;
  void *v77;
  void *v78;
  HDSourceRevision *v79;
  NSObject *v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  int v85;
  uint64_t v86;
  void *v87;
  void *v88;
  NSObject *v89;
  uint64_t v90;
  int v91;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  int v100;
  void *v101;
  int v102;
  void *v103;
  int v104;
  void *v105;
  int v106;
  void *v107;
  int v108;
  void *v109;
  int v110;
  void *v111;
  int v112;
  void *v113;
  int v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  void *v122;
  void *v123;
  id obj;
  char *obja;
  id v126;
  void *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  id v132;
  uint64_t v133;
  _QWORD v134[3];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[12];
  __int16 v140;
  id v141;
  uint8_t buf[4];
  id v143;
  uint8_t v144[32];
  __int128 v145;
  __int128 v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB57C8]);

  if (v7)
  {
    if (a1)
    {
      HDAssociationEntityPredicateForAssociatedObjects(objc_msgSend(a1, "operatorType") == 4);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
      v9 = (void *)v8;
      goto LABEL_85;
    }
LABEL_111:
    v9 = 0;
    goto LABEL_85;
  }
  objc_msgSend(a1, "keyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB57D8]);

  v122 = a1;
  if (v11)
  {
    if (!a1)
      goto LABEL_111;
    v12 = v5;
    v13 = objc_msgSend(a1, "operatorType");
    objc_msgSend(a1, "value");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v116 = v5;
    if (v13 != 10)
    {
      v134[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 1);
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    *(_QWORD *)v139 = 0;
    v126 = v12;
    v17 = v15;
    objc_opt_self();
    v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    memset(v144, 0, sizeof(v144));
    v145 = 0u;
    v146 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
    if (v20)
    {
      v21 = v20;
      v22 = **(_QWORD **)&v144[16];
      obj = v19;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (**(_QWORD **)&v144[16] != v22)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*(_QWORD *)&v144[8] + 8 * i);
          objc_msgSend(v126, "deviceManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "deviceEntitiesForDevice:error:", v24, v139);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
          {
            v19 = obj;

            v33 = 0;
            goto LABEL_39;
          }
          v130 = 0u;
          v131 = 0u;
          v128 = 0u;
          v129 = 0u;
          v27 = v26;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v128, &v135, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v129;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v129 != v30)
                  objc_enumerationMutation(v27);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * j), "persistentID"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v32);

              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v128, &v135, 16);
            }
            while (v29);
          }

        }
        v19 = obj;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
        if (v21)
          continue;
        break;
      }
    }

    v33 = v18;
LABEL_39:

    v52 = *(id *)v139;
    if (v33)
    {
      objc_msgSend(v122, "operatorType");
      v53 = HDSQLiteComparisonTypeForPredicateOperator();
      HDDataEntityPredicateForDeviceIdentifierSet(v53, v33);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v116;
    }
    else
    {
      _HKInitializeLogging();
      v80 = *MEMORY[0x1E0CB52B0];
      v5 = v116;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v143 = v52;
        _os_log_error_impl(&dword_1B7802000, v80, OS_LOG_TYPE_ERROR, "Failed to find devices: %{public}@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_84:
    goto LABEL_85;
  }
  objc_msgSend(a1, "keyPath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0CB5870]);

  if (v35)
  {
    if (!a1)
      goto LABEL_111;
    v36 = v5;
    v37 = objc_msgSend(a1, "operatorType");
    objc_msgSend(a1, "value");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    v117 = v5;
    if (v37 != 10)
    {
      v134[0] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 1);
      v40 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)v40;
    }
    v41 = v36;
    v42 = v39;
    objc_opt_self();
    v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v19 = v42;
    v44 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v135, buf, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v136;
      while (2)
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v136 != v46)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * k), "bundleIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "sourceManager");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v128 = 0;
          objc_msgSend(v49, "allSourcesForBundleIdentifier:error:", v48, &v128);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (id)v128;

          if (!v50)
          {
            _HKInitializeLogging();
            v81 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v144 = 138412546;
              *(_QWORD *)&v144[4] = v48;
              *(_WORD *)&v144[12] = 2114;
              *(_QWORD *)&v144[14] = v51;
              _os_log_error_impl(&dword_1B7802000, v81, OS_LOG_TYPE_ERROR, "Failed to retrieve sources for '%@': %{public}@", v144, 0x16u);
            }

            v52 = 0;
            goto LABEL_71;
          }
          objc_msgSend(v43, "unionSet:", v50);

        }
        v45 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v135, buf, 16);
        if (v45)
          continue;
        break;
      }
    }

    v52 = v43;
LABEL_71:

    if (v52)
    {
      objc_msgSend(v122, "operatorType");
      v82 = HDSQLiteComparisonTypeForPredicateOperator();
      HDDataEntityPredicateForSourceEntitySet(v82, v52);
      v83 = objc_claimAutoreleasedReturnValue();
LABEL_83:
      v9 = (void *)v83;
      v5 = v117;
      goto LABEL_84;
    }
    goto LABEL_82;
  }
  objc_msgSend(a1, "keyPath");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "isEqualToString:", *MEMORY[0x1E0CB5878]);

  if (v55)
  {
    if (!a1)
      goto LABEL_111;
    v56 = v5;
    v57 = objc_msgSend(a1, "operatorType");
    objc_msgSend(a1, "value");
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)v58;
    v117 = v5;
    if (v57 != 10)
    {
      v133 = v58;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
      v60 = objc_claimAutoreleasedReturnValue();

      v59 = (void *)v60;
    }
    v121 = v56;
    v61 = v59;
    objc_opt_self();
    v62 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    memset(v144, 0, sizeof(v144));
    v145 = 0u;
    v146 = 0u;
    v19 = v61;
    v120 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
    if (v120)
    {
      v118 = v19;
      v119 = **(_QWORD **)&v144[16];
      while (2)
      {
        v63 = 0;
        do
        {
          if (**(_QWORD **)&v144[16] != v119)
            objc_enumerationMutation(v19);
          v64 = *(void **)(*(_QWORD *)&v144[8] + 8 * (_QWORD)v63);
          objc_msgSend(v64, "source");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "bundleIdentifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v121, "sourceManager");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = 0;
          objc_msgSend(v67, "allSourcesForBundleIdentifier:error:", v66, &v132);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v132;

          if (!v68)
          {
            _HKInitializeLogging();
            v89 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v139 = 138412546;
              *(_QWORD *)&v139[4] = v66;
              v140 = 2114;
              v141 = v69;
              _os_log_error_impl(&dword_1B7802000, v89, OS_LOG_TYPE_ERROR, "Failed to retrieve sources for '%@': %{public}@", v139, 0x16u);
            }

            v52 = 0;
            goto LABEL_80;
          }
          v123 = v69;
          obja = v63;
          v127 = v66;
          v130 = 0u;
          v131 = 0u;
          v128 = 0u;
          v129 = 0u;
          v70 = v68;
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v128, &v135, 16);
          if (v71)
          {
            v72 = v71;
            v73 = *(_QWORD *)v129;
            do
            {
              for (m = 0; m != v72; ++m)
              {
                if (*(_QWORD *)v129 != v73)
                  objc_enumerationMutation(v70);
                v75 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * m);
                v76 = [HDSourceRevision alloc];
                objc_msgSend(v64, "version");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "productType");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                if (v64)
                  objc_msgSend(v64, "operatingSystemVersion");
                else
                  memset(v134, 0, sizeof(v134));
                v79 = -[HDSourceRevision initWithSource:version:productType:operatingSystemVersion:](v76, "initWithSource:version:productType:operatingSystemVersion:", v75, v77, v78, v134);

                objc_msgSend(v62, "addObject:", v79);
              }
              v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v128, &v135, 16);
            }
            while (v72);
          }

          v63 = obja + 1;
          a1 = v122;
          v19 = v118;
        }
        while (obja + 1 != (char *)v120);
        v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
        if (v120)
          continue;
        break;
      }
    }

    v52 = v62;
LABEL_80:

    if (v52)
    {
      objc_msgSend(a1, "operatorType");
      v90 = HDSQLiteComparisonTypeForPredicateOperator();
      objc_msgSend(a1, "applicationSDKVersionToken");
      v91 = dyld_version_token_at_least();
      HDDataEntityPredicateForSourceRevisionsSet(v90, v52, v91 ^ 1);
      v83 = objc_claimAutoreleasedReturnValue();
      goto LABEL_83;
    }
LABEL_82:
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v83 = objc_claimAutoreleasedReturnValue();
    goto LABEL_83;
  }
  objc_msgSend(a1, "keyPath");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "isEqualToString:", *MEMORY[0x1E0CB58B0]);

  if (!v85)
  {
    objc_msgSend(a1, "keyPath");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v93, "isEqualToString:", *MEMORY[0x1E0CB58D8]))
    {

    }
    else
    {
      objc_msgSend(a1, "keyPath");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "isEqualToString:", *MEMORY[0x1E0CB71F0]);

      if (!v95)
      {
        objc_msgSend(a1, "keyPath");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v99, "isEqualToString:", *MEMORY[0x1E0CB5938]);

        if (!v100)
        {
          objc_msgSend(a1, "keyPath");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v101, "isEqualToString:", *MEMORY[0x1E0CB71E8]);

          if (v102)
          {
            -[_HKObjectComparisonFilter _appleWatchSourcePredicate](a1);
            v8 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(a1, "keyPath");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = objc_msgSend(v103, "isEqualToString:", *MEMORY[0x1E0CB71F8]);

            if (v104)
            {
              -[_HKObjectComparisonFilter _OSBuildPredicate](a1);
              v8 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(a1, "keyPath");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = objc_msgSend(v105, "isEqualToString:", *MEMORY[0x1E0CB7200]);

              if (v106)
              {
                -[_HKObjectComparisonFilter _contributorPredicateWithProfile:](a1, v5);
                v8 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(a1, "keyPath");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                v108 = objc_msgSend(v107, "isEqualToString:", *MEMORY[0x1E0CB7208]);

                if (v108)
                {
                  -[_HKObjectComparisonFilter _creationDatePredicate](a1);
                  v8 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(a1, "keyPath");
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  v110 = objc_msgSend(v109, "isEqualToString:", *MEMORY[0x1E0CB7218]);

                  if (v110)
                  {
                    -[_HKObjectComparisonFilter _productTypePredicate](a1);
                    v8 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(a1, "keyPath");
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    v112 = objc_msgSend(v111, "hk_hasDevicePropertyKeyPathPrefix");

                    if (v112)
                    {
                      -[_HKObjectComparisonFilter _devicePropertyPredicateWithProfile:](a1, v5);
                      v8 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_msgSend(a1, "keyPath");
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      v114 = objc_msgSend(v113, "hk_hasMetadataKeyPathPrefix");

                      if (v114)
                      {
                        -[_HKObjectComparisonFilter _metadataPredicateWithProfile:](a1, v5);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                        v115 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v115, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKObjectComparisonFilter+HealthDaemon.m"), 67, CFSTR("Unreachable code has been executed"));

                        objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
                      }
                      v8 = objc_claimAutoreleasedReturnValue();
                    }
                  }
                }
              }
            }
          }
          goto LABEL_4;
        }
        v96 = a1;
        v97 = v5;
        v98 = 1;
        goto LABEL_90;
      }
    }
    v96 = a1;
    v97 = v5;
    v98 = 0;
LABEL_90:
    -[_HKObjectComparisonFilter _associationPredicateWithProfile:type:](v96, v97, v98);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (!a1)
    goto LABEL_111;
  v86 = objc_msgSend(a1, "operatorType");
  objc_msgSend(a1, "value");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v86 == 10)
    HDDataEntityPredicateForDataUUIDs(v87);
  else
    HDDataEntityPredicateForDataUUID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_85:
  return v9;
}

- (id)filterIgnoringPrivateMetadata
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a1, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hk_hasMetadataKeyPathPrefix");

  if (!v3)
    goto LABEL_7;
  -[_HKObjectComparisonFilter _metadataKeyFromMetadataKeyPath](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_HKMetadataKeyIsPrivate())
  {

LABEL_7:
    v7 = a1;
    return v7;
  }
  if (objc_msgSend(a1, "operatorType") == 5
    && (objc_msgSend(a1, "value"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(MEMORY[0x1E0CB6F20], "trueFilter");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F20], "falseFilter");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v6;

  return v7;
}

@end
