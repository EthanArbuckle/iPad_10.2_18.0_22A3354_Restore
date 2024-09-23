@implementation HDRaceRouteLocationSeriesEntity

+ (id)createRoutePointsFromWorkout:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (*v25)(uint64_t);
  void (*v26)(uint64_t);
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  unsigned int v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  __int128 v42;
  void *v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  _BOOL4 v50;
  id v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void (*obj)(uint64_t);
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void (*v66)(uint64_t);
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD *v79;
  uint64_t *v80;
  uint64_t *v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD *v86;
  const __CFString **v87;
  uint64_t *v88;
  uint64_t *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  _QWORD v103[3];
  char v104;
  _QWORD v105[3];
  BOOL v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD v111[5];
  id v112;
  _QWORD v113[5];
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __n128 (*v117)(__n128 *, uint64_t);
  void (*v118)(uint64_t);
  void *v119;
  int v120;
  char v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  _QWORD v125[4];
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  char v129;
  _BYTE v130[128];
  const __CFString *v131;
  const __CFString **v132;
  uint64_t v133;
  uint64_t (*v134)(uint64_t, uint64_t);
  void (*v135)(uint64_t);
  id v136;
  _QWORD v137[5];
  id v138;
  _QWORD v139[4];

  v139[1] = *MEMORY[0x1E0C80C00];
  v70 = a3;
  v10 = a4;
  v69 = a5;
  v72 = v10;
  objc_msgSend(v10, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v11;
  +[HDRaceRouteLocationSeriesEntity _maxSeriesIdentifierWithDatabase:error:]((uint64_t)a1, v11, (uint64_t)a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v12;
  if (v12)
  {
    v13 = objc_msgSend(v12, "longLongValue");
    v14 = v70;
    v71 = v11;
    objc_opt_self();
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = objc_alloc_init(MEMORY[0x1E0D298A0]);
    objc_msgSend(MEMORY[0x1E0CB6B50], "workoutRouteType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForDataType(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject(objc_msgSend(v14, "persistentID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v19);

    objc_msgSend(v15, "setEntityClass:", objc_opt_class());
    v20 = (void *)MEMORY[0x1E0D29888];
    objc_opt_class();
    objc_msgSend(v20, "orderingTermWithProperty:entityClass:ascending:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v13;
    v137[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOrderingTerms:", v22);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v71, v15);
    v131 = CFSTR("hfd_key");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = MEMORY[0x1E0C809B0];
    v115 = 3221225472;
    v116 = (uint64_t)__84__HDRaceRouteLocationSeriesEntity__routeSeriesIdentifiersForWorkout_database_error___block_invoke;
    v117 = (__n128 (*)(__n128 *, uint64_t))&unk_1E6CEB060;
    v25 = (void (*)(uint64_t))v65;
    v118 = v25;
    LODWORD(v19) = objc_msgSend(v23, "enumerateProperties:error:enumerationHandler:", v24, a6, &v114);

    if ((_DWORD)v19)
      v26 = v25;
    else
      v26 = 0;
    v66 = v26;

    if (v66)
    {
      objc_msgSend(v14, "totalDistanceInCanonicalUnitWithTransaction:error:", v72, a6);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        objc_msgSend(v14, "workoutDurationWithTransaction:error:", v72, a6);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          objc_msgSend(v14, "workoutStartDateWithTransaction:error:", v72, a6);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
          {
            objc_msgSend(v14, "mainWorkoutActivityTypeWithTransaction:error:", v72, a6);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v56
              && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "persistentID")),
                  v27 = (void *)objc_claimAutoreleasedReturnValue(),
                  +[HDWorkoutEventEntity workoutEventsWithOwnerID:database:error:](HDWorkoutEventEntity, "workoutEventsWithOwnerID:database:error:", v27, v71, a6), v28 = (void *)objc_claimAutoreleasedReturnValue(), v27, v28))
            {
              objc_msgSend(v28, "hk_filter:", &__block_literal_global_20);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "sortedArrayUsingComparator:", &__block_literal_global_200);
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v56, "integerValue");
              _HKWorkoutDistanceTypeForActivityType();
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              +[HDSampleEntity entityEnumeratorWithType:profile:](HDQuantitySampleEntity, "entityEnumeratorWithType:profile:");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v139[0] = v30;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "setOrderingTerms:", v31);

              HDSampleEntityPredicateForDataType(v62);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject(objc_msgSend(v14, "persistentID"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v55, v54);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "setPredicate:", v32);

              v126 = 0;
              v127 = &v126;
              v128 = 0x2020000000;
              v129 = 0;
              v137[0] = 0;
              v137[1] = v137;
              v137[2] = 0x3032000000;
              v137[3] = __Block_byref_object_copy__17;
              v137[4] = __Block_byref_object_dispose__17;
              v138 = v57;
              v125[0] = 0;
              v125[1] = v125;
              v125[2] = 0x2020000000;
              v125[3] = 0;
              objc_msgSend(v58, "doubleValue");
              v34 = v33;
              objc_opt_self();
              v35 = fmax(ceil(v34 / 2.5), 1.0);
              v114 = 0;
              v115 = (uint64_t)&v114;
              v116 = 0x6012000000;
              v117 = __Block_byref_object_copy__206;
              v118 = __Block_byref_object_dispose__207;
              if (v35 >= 0x1388)
                v36 = 5000;
              else
                v36 = v35;
              v119 = &unk_1B805FAAD;
              v120 = v36;
              v121 = 0;
              v122 = 0u;
              v123 = 0u;
              v124 = 0;
              if ((_DWORD)v36)
              {
                v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v36);
                v39 = (char *)*((_QWORD *)&v122 + 1);
                v40 = (char *)v122;
                v41 = v37;
                if (*((_QWORD *)&v122 + 1) != (_QWORD)v122)
                {
                  do
                  {
                    v42 = *(_OWORD *)(v39 - 24);
                    *((_QWORD *)v41 - 1) = *((_QWORD *)v39 - 1);
                    *(_OWORD *)(v41 - 24) = v42;
                    v41 -= 24;
                    v39 -= 24;
                  }
                  while (v39 != v40);
                  v39 = (char *)v122;
                }
                *(_QWORD *)&v122 = v41;
                *((_QWORD *)&v122 + 1) = v37;
                *(_QWORD *)&v123 = &v37[24 * v38];
                if (v39)
                {
                  operator delete(v39);
                  v41 = (char *)v122;
                }
              }
              else
              {
                v41 = 0;
              }
              *((_QWORD *)&v123 + 1) = v41;
              v131 = 0;
              v132 = &v131;
              v133 = 0x3032000000;
              v134 = __Block_byref_object_copy__17;
              v135 = __Block_byref_object_dispose__17;
              v113[0] = MEMORY[0x1E0C809B0];
              v113[1] = 3221225472;
              v113[2] = __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_208;
              v113[3] = &unk_1E6CEAF98;
              v113[4] = v137;
              objc_msgSend(v63, "hk_firstObjectPassingTest:", v113);
              v136 = (id)objc_claimAutoreleasedReturnValue();
              v111[0] = 0;
              v111[1] = v111;
              v111[2] = 0x3032000000;
              v111[3] = __Block_byref_object_copy__17;
              v111[4] = __Block_byref_object_dispose__17;
              -[__CFString dateInterval]((id)v132[5], "dateInterval");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "endDate");
              v112 = (id)objc_claimAutoreleasedReturnValue();

              v107 = 0;
              v108 = &v107;
              v109 = 0x2020000000;
              v110 = 0;
              v110 = objc_msgSend(v63, "indexOfObject:", v132[5]);
              v105[0] = 0;
              v105[1] = v105;
              v105[2] = 0x2020000000;
              v106 = 0;
              v45 = v108[3];
              v106 = v45 < objc_msgSend(v63, "count");
              v103[0] = 0;
              v103[1] = v103;
              v103[2] = 0x2020000000;
              v104 = 1;
              v102[0] = 0;
              v102[1] = v102;
              v102[2] = 0x2020000000;
              v102[3] = 0;
              v98 = 0u;
              v99 = 0u;
              v100 = 0u;
              v101 = 0u;
              obj = v66;
              v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v130, 16);
              if (v46)
              {
                v47 = *(_QWORD *)v99;
                while (2)
                {
                  for (i = 0; i != v46; ++i)
                  {
                    if (*(_QWORD *)v99 != v47)
                      objc_enumerationMutation(obj);
                    v49 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i);
                    v92 = 0;
                    v93 = &v92;
                    v94 = 0x3032000000;
                    v95 = __Block_byref_object_copy__17;
                    v96 = __Block_byref_object_dispose__17;
                    v97 = 0;
                    v73[0] = MEMORY[0x1E0C809B0];
                    v73[1] = 3221225472;
                    v73[2] = __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_2_210;
                    v73[3] = &unk_1E6CEAFE8;
                    v79 = v137;
                    v90 = a1;
                    v74 = v64;
                    v75 = v62;
                    v80 = &v114;
                    v76 = v72;
                    v81 = &v92;
                    v82 = v125;
                    v83 = v102;
                    v84 = v105;
                    v85 = v111;
                    v86 = v103;
                    v87 = &v131;
                    v88 = &v107;
                    v77 = v63;
                    v89 = &v126;
                    v91 = v59 + 1;
                    v78 = v71;
                    v50 = +[HDLocationSeriesSampleEntity enumerateLocationDataInDatabase:HFDKey:error:handler:](HDLocationSeriesSampleEntity, "enumerateLocationDataInDatabase:HFDKey:error:handler:", v78, v49, a6, v73);
                    v51 = (id)v93[5];
                    v52 = v51;
                    if (v51)
                    {
                      if (a6)
                        *a6 = objc_retainAutorelease(v51);
                      else
                        _HKLogDroppedError();
                    }

                    _Block_object_dispose(&v92, 8);
                    if (!v50)
                    {

                      v43 = 0;
                      goto LABEL_44;
                    }
                  }
                  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v130, 16);
                  if (v46)
                    continue;
                  break;
                }
              }

              if (*((_BYTE *)v127 + 24))
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v59 + 1);
              else
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:
              _Block_object_dispose(v102, 8);
              _Block_object_dispose(v103, 8);
              _Block_object_dispose(v105, 8);
              _Block_object_dispose(&v107, 8);
              _Block_object_dispose(v111, 8);

              _Block_object_dispose(&v131, 8);
              _Block_object_dispose(&v114, 8);
              if ((_QWORD)v122)
              {
                *((_QWORD *)&v122 + 1) = v122;
                operator delete((void *)v122);
              }
              _Block_object_dispose(v125, 8);
              _Block_object_dispose(v137, 8);

              _Block_object_dispose(&v126, 8);
            }
            else
            {
              v43 = 0;
            }

          }
          else
          {
            v43 = 0;
          }

        }
        else
        {
          v43 = 0;
        }

      }
      else
      {
        v43 = 0;
      }

    }
    else
    {
      v43 = 0;
    }

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

+ (id)_maxSeriesIdentifierWithDatabase:(uint64_t)a3 error:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD aBlock[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a2;
  v5 = objc_opt_self();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v15 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__HDRaceRouteLocationSeriesEntity__maxSeriesIdentifierWithDatabase_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = v5;
  v7 = _Block_copy(aBlock);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __74__HDRaceRouteLocationSeriesEntity__maxSeriesIdentifierWithDatabase_error___block_invoke_2;
  v10[3] = &unk_1E6CEA698;
  v10[4] = &v12;
  if (objc_msgSend(v4, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &+[HDRaceRouteLocationSeriesEntity _maxSeriesIdentifierWithDatabase:error:]::HDRaceRouteLocationSeriesEntityCacheKeyMaxIdentifier, a3, v7, 0, v10))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13[3]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v8;
}

BOOL __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 1 || objc_msgSend(v2, "type") == 2;

  return v3;
}

uint64_t __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_208(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hk_isAfterOrEqualToDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  return v5;
}

uint64_t __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_2_210(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  double *v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[2];
  double (*v64)(uint64_t, double);
  void *v65;
  uint64_t v66;
  id obj;
  _QWORD v68[5];
  id v69;
  uint64_t *v70;
  uint64_t v71;
  unint64_t v72;
  BOOL v73;
  uint64_t v74;
  double *v75;
  uint64_t v76;
  uint64_t v77;

  v3 = a2;
  objc_msgSend(v3, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hk_isBeforeDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v4);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v4);
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v9 = *(void **)(a1 + 48);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v12 = *(void **)(v10 + 40);
    v11 = (id *)(v10 + 40);
    obj = v12;
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v64 = __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_3;
    v65 = &unk_1E6CEAFC0;
    v66 = *(_QWORD *)(a1 + 96);
    v13 = v7;
    v14 = v6;
    v15 = v9;
    v16 = v63;
    objc_opt_self();
    v17 = (double *)&v74;
    v74 = 0;
    v75 = (double *)&v74;
    v76 = 0x2020000000;
    v77 = 0;
    v18 = *(double **)(v8 + 64);
    v19 = *(double **)(v8 + 80);
    while (v19 != v18)
    {
      v73 = 0;
      v20 = _overlappingSampleDistanceForInterval(v14, v19, &v73);
      v17 = v75;
      v75[3] = v20 + v75[3];
      *(double *)(v8 + 88) = *v19;
      if (!v73)
        goto LABEL_8;
      v19 = (double *)(*(_QWORD *)(v8 + 80) + 24);
      *(_QWORD *)(v8 + 80) = v19;
      v18 = *(double **)(v8 + 64);
    }
    if (*(_BYTE *)(v8 + 52))
    {
LABEL_8:
      v64((uint64_t)v16, v17[3]);
      _Block_object_dispose(&v74, 8);

      objc_storeStrong(v11, obj);
      goto LABEL_9;
    }
    v60 = v15;
    objc_msgSend(v13, "predicate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v8 + 88));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      HDSampleEntityPredicateForStartDate(5);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v61, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPredicate:", v53);

    }
    v54 = *(_QWORD *)(v8 + 56);
    *(_QWORD *)(v8 + 64) = v54;
    *(_QWORD *)(v8 + 80) = v54;
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = *(unsigned int *)(v8 + 48);
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __124__HDRaceRouteLocationSeriesEntity__distanceWithEnumerator_dateInterval_distanceType_sampleBuffer_transaction_error_handler___block_invoke;
    v68[3] = &unk_1E6CEB088;
    v58 = (void *)v55;
    v68[4] = v55;
    v69 = v14;
    v70 = &v74;
    v71 = v8 + 56;
    v72 = v56;
    v57 = objc_msgSend(v13, "enumerateInTransaction:error:handler:", v60, &obj, v68);
    objc_msgSend(v13, "setPredicate:", v61);
    if (v57 && 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v8 + 64) - *(_QWORD *)(v8 + 56)) >> 3) < v56)
      *(_BYTE *)(v8 + 52) = 1;
    v64((uint64_t)v16, v75[3]);

    _Block_object_dispose(&v74, 8);
    objc_storeStrong(v11, obj);
    if ((v57 & 1) == 0)
    {
      v5 = 0;
      goto LABEL_28;
    }
LABEL_9:
    v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24)
      && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "hk_isAfterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40)))
    {
      objc_msgSend(v14, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "timeIntervalSinceReferenceDate");
          v24 = v23;
          objc_msgSend(v22, "timeIntervalSinceReferenceDate");
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v24
                                                                       - v25
                                                                       + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104)
                                                                                               + 8)
                                                                                   + 24);
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8)+ 40), "type", v58) != 1;
        v26 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v26 < objc_msgSend(*(id *)(a1 + 56), "count");
        v27 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);

        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
          break;
        objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24));
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
        v30 = *(void **)(v29 + 40);
        *(_QWORD *)(v29 + 40) = v28;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40), "dateInterval");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "endDate");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
        v34 = *(void **)(v33 + 40);
        *(_QWORD *)(v33 + 40) = v32;

        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
          break;
        v22 = v27;
      }
      while ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "hk_isAfterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40)) & 1) != 0);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24))
      {
        objc_msgSend(v14, "endDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "timeIntervalSinceReferenceDate");
        v37 = v36;
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v37
                                                                     - v38
                                                                     + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104)
                                                                                             + 8)
                                                                                 + 24);

      }
    }
    else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24))
    {
      objc_msgSend(v14, "duration");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v39
                                                                   + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                               + 24);
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24)
      && *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) == v21)
    {
      v5 = 1;
    }
    else
    {
      v40 = objc_alloc(MEMORY[0x1E0C9E410]);
      objc_msgSend(v3, "coordinate");
      v42 = v41;
      objc_msgSend(v3, "coordinate");
      v44 = v43;
      objc_msgSend(v3, "altitude");
      v46 = (void *)objc_msgSend(v40, "initWithLatitude:longitude:altitude:odometer:timestamp:signalEnvironmentType:", objc_msgSend(v3, "signalEnvironmentType"), v42, v44, v45, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
      v47 = *(_QWORD *)(a1 + 160);
      v48 = *(_QWORD *)(a1 + 168);
      v49 = *(void **)(a1 + 64);
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v62 = *(id *)(v50 + 40);
      v5 = +[HDRaceRouteLocationSeriesEntity _insertRoutePoint:seriesIdentifier:database:error:](v47, v46, v48, v49, (uint64_t)&v62);
      objc_storeStrong((id *)(v50 + 40), v62);
      if ((_DWORD)v5)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = 1;

    }
LABEL_28:

  }
  return v5;
}

double __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

+ (uint64_t)_insertRoutePoint:(uint64_t)a3 seriesIdentifier:(void *)a4 database:(uint64_t)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD aBlock[5];

  v8 = a2;
  v9 = a4;
  v10 = objc_opt_self();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__HDRaceRouteLocationSeriesEntity__insertRoutePoint_seriesIdentifier_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = v10;
  v12 = _Block_copy(aBlock);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __85__HDRaceRouteLocationSeriesEntity__insertRoutePoint_seriesIdentifier_database_error___block_invoke_2;
  v16[3] = &unk_1E6CEB038;
  v18 = a3;
  v13 = v8;
  v17 = v13;
  v14 = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &+[HDRaceRouteLocationSeriesEntity _insertRoutePoint:seriesIdentifier:database:error:]::HDRaceRouteLocationSeriesEntityCacheKeyInsert, a5, v12, v16, 0);

  return v14;
}

+ (BOOL)enumerateRoutePointsForSeries:(int64_t)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 transaction:(id)a6 error:(id *)a7 handler:(id)a8
{
  return objc_msgSend(a1, "enumerateRoutePointsForSeries:timestampAnchor:limit:startDuration:finishDuration:transaction:error:handler:", a3, a5, a6, a7, a8, a4, 0.0, 0.0);
}

+ (BOOL)enumerateRoutePointsForSeries:(int64_t)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 startDuration:(double)a6 finishDuration:(double)a7 transaction:(id)a8 error:(id *)a9 handler:(id)a10
{
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  char v43;
  id v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  const __CFString *v52;
  _QWORD v53[2];
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v46 = a8;
  v45 = a10;
  v18 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v18, "setEntityClass:", a1);
  objc_msgSend(v18, "setLimitCount:", a5);
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("timestamp"), a1, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOrderingTerms:", v20);

  v21 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateWithProperty:equalToValue:", CFSTR("series_id"), v22);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateWithProperty:greaterThanValue:", CFSTR("timestamp"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v53[0] = v47;
  v53[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");

  if (a6 > 0.0)
  {
    v28 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("timestamp"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "addObject:", v30);
  }
  if (a7 > a6)
  {
    v31 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "predicateWithProperty:lessThanOrEqualToValue:", CFSTR("timestamp"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "addObject:", v33);
  }
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPredicate:", v34);

  +[HDRaceRouteLocationSeriesEntity _allEntityProperties]();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = CFSTR("series_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "arrayByExcludingObjectsInArray:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "selectSQLForProperties:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "databaseForEntityClass:", a1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __142__HDRaceRouteLocationSeriesEntity_enumerateRoutePointsForSeries_timestampAnchor_limit_startDuration_finishDuration_transaction_error_handler___block_invoke;
  v50[3] = &unk_1E6CEA6E8;
  v41 = v18;
  v51 = v41;
  v48[0] = v40;
  v48[1] = 3221225472;
  v48[2] = __142__HDRaceRouteLocationSeriesEntity_enumerateRoutePointsForSeries_timestampAnchor_limit_startDuration_finishDuration_transaction_error_handler___block_invoke_2;
  v48[3] = &unk_1E6CEB010;
  v42 = v45;
  v49 = v42;
  v43 = objc_msgSend(v39, "executeSQL:error:bindingHandler:enumerationHandler:", v38, a9, v50, v48);

  return v43;
}

+ (id)_allEntityProperties
{
  _QWORD v1[8];

  v1[7] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("series_id");
  v1[1] = CFSTR("timestamp");
  v1[2] = CFSTR("latitude");
  v1[3] = CFSTR("longitude");
  v1[4] = CFSTR("altitude");
  v1[5] = CFSTR("distance");
  v1[6] = CFSTR("signal_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __142__HDRaceRouteLocationSeriesEntity_enumerateRoutePointsForSeries_timestampAnchor_limit_startDuration_finishDuration_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;

  v3 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "bindToSelectStatement:bindingIndex:", a2, &v3);
}

uint64_t __142__HDRaceRouteLocationSeriesEntity_enumerateRoutePointsForSeries_timestampAnchor_limit_startDuration_finishDuration_transaction_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;

  v4 = MEMORY[0x1BCCAB1A4](a2, 0);
  v5 = MEMORY[0x1BCCAB1A4](a2, 1);
  v6 = MEMORY[0x1BCCAB1A4](a2, 2);
  v7 = MEMORY[0x1BCCAB1A4](a2, 3);
  v8 = MEMORY[0x1BCCAB1A4](a2, 4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E410]), "initWithLatitude:longitude:altitude:odometer:timestamp:signalEnvironmentType:", HDSQLiteColumnAsInt64(), v5, v6, v7, v8, v4);
  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v10;
}

+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD aBlock[5];

  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__HDRaceRouteLocationSeriesEntity_deleteSeriesDataWithIdentifier_transaction_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v10 = _Block_copy(aBlock);
  objc_msgSend(v8, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __84__HDRaceRouteLocationSeriesEntity_deleteSeriesDataWithIdentifier_transaction_error___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a3;
  LOBYTE(a5) = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &+[HDRaceRouteLocationSeriesEntity deleteSeriesDataWithIdentifier:transaction:error:]::deleteSQLCacheKey, a5, v10, v13, 0);

  return (char)a5;
}

id __84__HDRaceRouteLocationSeriesEntity_deleteSeriesDataWithIdentifier_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "databaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?"), v2, CFSTR("series_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __84__HDRaceRouteLocationSeriesEntity_deleteSeriesDataWithIdentifier_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

id __85__HDRaceRouteLocationSeriesEntity__insertRoutePoint_seriesIdentifier_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  +[HDRaceRouteLocationSeriesEntity _allEntityProperties]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertSQLForProperties:shouldReplace:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __85__HDRaceRouteLocationSeriesEntity__insertRoutePoint_seriesIdentifier_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "timestamp_s");
  sqlite3_bind_double(a2, 2, v4);
  objc_msgSend(*(id *)(a1 + 32), "latitude_deg");
  sqlite3_bind_double(a2, 3, v5);
  objc_msgSend(*(id *)(a1 + 32), "longitude_deg");
  sqlite3_bind_double(a2, 4, v6);
  objc_msgSend(*(id *)(a1 + 32), "altitude_m");
  sqlite3_bind_double(a2, 5, v7);
  objc_msgSend(*(id *)(a1 + 32), "odometer_m");
  sqlite3_bind_double(a2, 6, v8);
  return sqlite3_bind_int(a2, 7, objc_msgSend(*(id *)(a1 + 32), "signalEnvironmentType"));
}

id __74__HDRaceRouteLocationSeriesEntity__maxSeriesIdentifierWithDatabase_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "databaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT MAX(%@) FROM %@"), CFSTR("series_id"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __74__HDRaceRouteLocationSeriesEntity__maxSeriesIdentifierWithDatabase_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __84__HDRaceRouteLocationSeriesEntity__routeSeriesIdentifiersForWorkout_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

BOOL __124__HDRaceRouteLocationSeriesEntity__distanceWithEnumerator_dateInterval_distanceType_sampleBuffer_transaction_error_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void **v12;
  char *v13;
  char *v14;
  void *v15;
  void **v16;
  char *v17;
  char *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  __int128 v34;
  _BOOL8 v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  __int128 v40;
  BOOL v42;
  __int128 v43;
  uint64_t v44;

  v3 = a2;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  *(_QWORD *)&v43 = v5;
  objc_msgSend(v3, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  *((_QWORD *)&v43 + 1) = v7;
  objc_msgSend(v3, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  v44 = v9;

  v42 = 0;
  objc_msgSend(v3, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "hk_isAfterDate:", v11);

  if (!(_DWORD)v8)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = _overlappingSampleDistanceForInterval(*(void **)(a1 + 40), (double *)&v43, &v42)+ *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24);
    if (!v42)
    {
      v16 = *(void ***)(a1 + 56);
      v18 = (char *)v16[1];
      v17 = (char *)v16[2];
      if (v18 >= v17)
      {
        v25 = 0xAAAAAAAAAAAAAAABLL * ((v18 - (_BYTE *)*v16) >> 3);
        v26 = v25 + 1;
        if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_40;
        v27 = 0xAAAAAAAAAAAAAAABLL * ((v17 - (_BYTE *)*v16) >> 3);
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x555555555555555)
          v28 = 0xAAAAAAAAAAAAAAALL;
        else
          v28 = v26;
        if (v28)
          v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v28);
        else
          v29 = 0;
        v36 = v28 + 24 * v25;
        v37 = v28 + 24 * v29;
        *(_OWORD *)v36 = v43;
        *(_QWORD *)(v36 + 16) = v44;
        v19 = (void *)(v36 + 24);
        v39 = (char *)*v16;
        v38 = (char *)v16[1];
        if (v38 != *v16)
        {
          do
          {
            v40 = *(_OWORD *)(v38 - 24);
            *(_QWORD *)(v36 - 8) = *((_QWORD *)v38 - 1);
            *(_OWORD *)(v36 - 24) = v40;
            v36 -= 24;
            v38 -= 24;
          }
          while (v38 != v39);
          v38 = (char *)*v16;
        }
        *v16 = (void *)v36;
        v16[1] = v19;
        v16[2] = (void *)v37;
        if (v38)
          operator delete(v38);
      }
      else
      {
        *(_OWORD *)v18 = v43;
        *((_QWORD *)v18 + 2) = v44;
        v19 = v18 + 24;
      }
      v16[1] = v19;
      if (!v42)
        goto LABEL_30;
    }
    v35 = 1;
    goto LABEL_39;
  }
  v12 = *(void ***)(a1 + 56);
  v14 = (char *)v12[1];
  v13 = (char *)v12[2];
  if (v14 >= v13)
  {
    v20 = 0xAAAAAAAAAAAAAAABLL * ((v14 - (_BYTE *)*v12) >> 3);
    v21 = v20 + 1;
    if (v20 + 1 <= 0xAAAAAAAAAAAAAAALL)
    {
      v22 = 0xAAAAAAAAAAAAAAABLL * ((v13 - (_BYTE *)*v12) >> 3);
      if (2 * v22 > v21)
        v21 = 2 * v22;
      if (v22 >= 0x555555555555555)
        v23 = 0xAAAAAAAAAAAAAAALL;
      else
        v23 = v21;
      if (v23)
        v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v23);
      else
        v24 = 0;
      v30 = v23 + 24 * v20;
      v31 = v23 + 24 * v24;
      *(_OWORD *)v30 = v43;
      *(_QWORD *)(v30 + 16) = v44;
      v15 = (void *)(v30 + 24);
      v33 = (char *)*v12;
      v32 = (char *)v12[1];
      if (v32 != *v12)
      {
        do
        {
          v34 = *(_OWORD *)(v32 - 24);
          *(_QWORD *)(v30 - 8) = *((_QWORD *)v32 - 1);
          *(_OWORD *)(v30 - 24) = v34;
          v30 -= 24;
          v32 -= 24;
        }
        while (v32 != v33);
        v32 = (char *)*v12;
      }
      *v12 = (void *)v30;
      v12[1] = v15;
      v12[2] = (void *)v31;
      if (v32)
        operator delete(v32);
      goto LABEL_29;
    }
LABEL_40:
    std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
  }
  *(_OWORD *)v14 = v43;
  *((_QWORD *)v14 + 2) = v44;
  v15 = v14 + 24;
LABEL_29:
  v12[1] = v15;
LABEL_30:
  v35 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) - **(_QWORD **)(a1 + 56)) >> 3) < *(_QWORD *)(a1 + 64);
LABEL_39:

  return v35;
}

+ (id)databaseTable
{
  return CFSTR("RacePreviousRoute_location_series");
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  unsigned __int8 v3;
  int v5;
  unint64_t *v6;

  if ((v3 & 1) == 0)
  {
    v6 = a3;
    a3 = v6;
    if (v5)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor, 0, &dword_1B7802000);
      a3 = v6;
    }
  }
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDRaceRouteLocationSeriesEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (BOOL)hasROWID
{
  return 0;
}

+ (id)primaryKeyColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("series_id");
  v3[1] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)insertCodableRoutePoints:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "databaseForEntityClass:", a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDRaceRouteLocationSeriesEntity _maxSeriesIdentifierWithDatabase:error:]((uint64_t)a1, v10, (uint64_t)a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && (v12 = objc_msgSend(v11, "longLongValue") + 1,
          objc_msgSend(a1, "insertCodableRoutePoints:seriesKey:transaction:error:", v8, v12, v9, a5)))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (BOOL)insertCodableRoutePoints:(id)a3 seriesKey:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  BOOL v27;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v12)
  {
    v29 = v10;
    v13 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v16 = objc_alloc(MEMORY[0x1E0C9E410]);
        objc_msgSend(v15, "latitude", v29);
        v18 = v17;
        objc_msgSend(v15, "longitude");
        v20 = v19;
        objc_msgSend(v15, "altitude");
        v22 = v21;
        objc_msgSend(v15, "odometer");
        v24 = v23;
        objc_msgSend(v15, "timestamp");
        v26 = (void *)objc_msgSend(v16, "initWithLatitude:longitude:altitude:odometer:timestamp:signalEnvironmentType:", objc_msgSend(v15, "signalEnvironmentType"), v18, v20, v22, v24, v25);
        LODWORD(v15) = +[HDRaceRouteLocationSeriesEntity _insertRoutePoint:seriesIdentifier:database:error:]((uint64_t)a1, v26, a4, v11, (uint64_t)a6);

        if (!(_DWORD)v15)
        {
          v27 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v12)
        continue;
      break;
    }
  }
  v27 = 1;
LABEL_11:

  return v27;
}

+ (id)createTableSQLWithBehavior:(id)a3
{
  objc_msgSend(a1, "createTableSQL", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)indicesWithBehavior:(id)a3
{
  objc_msgSend(a1, "indices", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)triggersWithBehavior:(id)a3
{
  objc_msgSend(a1, "triggers", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
