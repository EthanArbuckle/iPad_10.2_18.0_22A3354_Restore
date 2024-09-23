@implementation HDCreateWorkoutOperation

- (HDCreateWorkoutOperation)initWithWorkoutConfiguration:(id)a3 identifier:(id)a4 dateInterval:(id)a5 metadata:(id)a6 device:(id)a7 source:(id)a8 sourceVersion:(id)a9 events:(id)a10 activities:(id)a11 statisticsCalculators:(id)a12 associatedSeries:(id)a13 goalType:(unint64_t)a14 goal:(id)a15 quantityTypesIncludedWhilePaused:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  HDCreateWorkoutOperation *v30;
  uint64_t v31;
  HKWorkoutConfiguration *workoutConfiguration;
  uint64_t v33;
  NSUUID *identifier;
  uint64_t v35;
  NSDateInterval *dateInterval;
  uint64_t v37;
  NSDictionary *metadata;
  uint64_t v39;
  HKDevice *device;
  uint64_t v41;
  HKSource *source;
  uint64_t v43;
  NSString *sourceVersion;
  uint64_t v45;
  NSArray *events;
  uint64_t v47;
  NSArray *activities;
  uint64_t v49;
  NSArray *associatedSeries;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;

  v54 = a3;
  v21 = a4;
  v57 = a5;
  v56 = a6;
  v55 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = v22;
  v53 = a12;
  v27 = a13;
  v28 = a15;
  v29 = a16;
  v58.receiver = self;
  v58.super_class = (Class)HDCreateWorkoutOperation;
  v30 = -[HDCreateWorkoutOperation init](&v58, sel_init);
  if (v30)
  {
    v31 = objc_msgSend(v54, "copy");
    workoutConfiguration = v30->_workoutConfiguration;
    v30->_workoutConfiguration = (HKWorkoutConfiguration *)v31;

    v33 = objc_msgSend(v21, "copy");
    identifier = v30->_identifier;
    v30->_identifier = (NSUUID *)v33;

    v35 = objc_msgSend(v57, "copy");
    dateInterval = v30->_dateInterval;
    v30->_dateInterval = (NSDateInterval *)v35;

    v37 = objc_msgSend(v56, "copy");
    metadata = v30->_metadata;
    v30->_metadata = (NSDictionary *)v37;

    v39 = objc_msgSend(v55, "copy");
    device = v30->_device;
    v30->_device = (HKDevice *)v39;

    v41 = objc_msgSend(v26, "copy");
    source = v30->_source;
    v30->_source = (HKSource *)v41;

    v43 = objc_msgSend(v23, "copy");
    sourceVersion = v30->_sourceVersion;
    v30->_sourceVersion = (NSString *)v43;

    v45 = objc_msgSend(v24, "copy");
    events = v30->_events;
    v30->_events = (NSArray *)v45;

    v47 = objc_msgSend(v25, "copy");
    activities = v30->_activities;
    v30->_activities = (NSArray *)v47;

    objc_storeStrong((id *)&v30->_statisticsCalculators, a12);
    v49 = objc_msgSend(v27, "copy");
    associatedSeries = v30->_associatedSeries;
    v30->_associatedSeries = (NSArray *)v49;

    v30->_goalType = a14;
    objc_storeStrong((id *)&v30->_goal, a15);
    objc_storeStrong((id *)&v30->_quantityTypesIncludedWhilePaused, a16);
  }

  return v30;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  NSUUID *identifier;
  id v16;
  id v17;
  NSDateInterval *dateInterval;
  id v19;
  NSArray *activities;
  void *v21;
  HDWorkoutBuilderStatisticsCalculators *statisticsCalculators;
  id v23;
  NSArray *events;
  void *v25;
  void *v26;
  HKWorkoutActivityType v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  char v47;
  _QWORD *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v62;
  NSArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  BOOL v69;
  NSArray *associatedSeries;
  BOOL v71;
  NSArray *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  NSArray *v86;
  char v87;
  NSArray *v88;
  NSArray *v89;
  NSArray *v90;
  NSArray *v91;
  NSArray *v92;
  id v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id obj;
  id obja;
  id v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  NSArray *v117;
  _QWORD v118[5];
  _QWORD v119[4];
  id v120;
  id v121;
  HDCreateWorkoutOperation *v122;
  id v123;
  id v124;
  _QWORD v125[5];
  _QWORD v126[4];
  id v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  id v133;
  HDCreateWorkoutOperation *v134;
  id v135;
  id v136;
  id v137;
  _QWORD v138[2];
  uint8_t buf[128];
  uint8_t v140[16];
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v115 = a3;
  v112 = a4;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleWatch");

  if (!v9)
  {
LABEL_7:
    identifier = self->_identifier;
    v128 = 0;
    +[HDWorkoutBuilderEntity workoutBuilderEntityWithIdentifier:profile:error:](HDWorkoutBuilderEntity, "workoutBuilderEntityWithIdentifier:profile:error:", identifier, v115, &v128);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v128;
    if (!v114)
    {
      if (v16)
      {
        v32 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Unable to look up workout builder '%@' during create workout operation."), self->_identifier);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          v113 = 0;
          v14 = 0;
LABEL_77:

          goto LABEL_78;
        }
      }
      if (a5)
      {
        v33 = objc_retainAutorelease(v32);
        v14 = 0;
        *a5 = v33;
        v113 = v33;
      }
      else
      {
        v34 = v32;
        _HKLogDroppedError();
        v14 = 0;
        v33 = v34;
        v113 = v34;
      }
LABEL_76:

      goto LABEL_77;
    }
    v113 = v16;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dateInterval = self->_dateInterval;
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke;
    v126[3] = &unk_1E6CF4F70;
    v109 = v17;
    v127 = v109;
    if (!objc_msgSend(v114, "pruneAssociatedSamplesToDateInterval:transaction:error:zonesHandler:", dateInterval, v112, a5, v126))
    {
      v14 = 0;
LABEL_75:

      v33 = v109;
      goto LABEL_76;
    }
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    activities = self->_activities;
    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_2;
    v125[3] = &unk_1E6CF4F98;
    v125[4] = self;
    -[NSArray hk_mapToDictionary:](activities, "hk_mapToDictionary:", v125);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    statisticsCalculators = self->_statisticsCalculators;
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_3;
    v119[3] = &unk_1E6CF4FC0;
    v23 = v115;
    v120 = v23;
    v94 = v114;
    v121 = v94;
    v122 = self;
    v105 = v21;
    v123 = v105;
    v102 = v19;
    v124 = v102;
    -[HDWorkoutBuilderStatisticsCalculators enumerateCalculatorsWithHandler:](statisticsCalculators, "enumerateCalculatorsWithHandler:", v119);
    events = self->_events;
    v118[0] = MEMORY[0x1E0C809B0];
    v118[1] = 3221225472;
    v118[2] = __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_199;
    v118[3] = &unk_1E6CF4FE8;
    v118[4] = self;
    -[NSArray hk_filter:](events, "hk_filter:", v118);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "allValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_78);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CB6DD0];
    v27 = -[HKWorkoutConfiguration activityType](self->_workoutConfiguration, "activityType");
    -[NSDateInterval startDate](self->_dateInterval, "startDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateInterval endDate](self->_dateInterval, "endDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:", v27, v28, v29, v104, v103, v102, 0.0, self->_goalType, self->_goal, self->_device, self->_metadata);
    v108 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v108, "_setUUID:", self->_identifier);
    objc_msgSend(v23, "sourceManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sourceEntityForClientSource:createOrUpdateIfNecessary:error:", self->_source, 0, a5);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v107)
      goto LABEL_12;
    if (self->_device)
    {
      objc_msgSend(v23, "deviceManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "deviceEntityForDevice:error:", self->_device, a5);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v99)
      {
LABEL_12:
        v14 = 0;
LABEL_74:

        goto LABEL_75;
      }
    }
    else
    {
      v99 = 0;
    }
    objc_msgSend(v23, "dataProvenanceManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localDataProvenanceForSourceEntity:version:deviceEntity:", v107, self->_sourceVersion, v99);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "dataManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v108;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", v37, v97, 0, 1, 1, a5, CFAbsoluteTimeGetCurrent());

    if (v38)
    {
      v98 = v112;
      v110 = v23;
      v39 = v109;
      v95 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      obj = v39;
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, buf, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v130;
        while (2)
        {
          for (i = 0; i != v40; ++i)
          {
            if (*(_QWORD *)v130 != v41)
              objc_enumerationMutation(obj);
            +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDWorkoutZonesSampleEntity, "objectWithUUID:encodingOptions:profile:error:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * i), 0, v110, a5);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if (!v43)
              goto LABEL_46;
            objc_msgSend(v43, "sampleType");
            v45 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB6ED0], "heartRateType");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v45, "isEqual:", v46);

            v48 = (_QWORD *)MEMORY[0x1E0CB5CB0];
            if ((v47 & 1) != 0
              || (objc_msgSend(MEMORY[0x1E0CB6ED0], "cyclingPowerType"),
                  v49 = (void *)objc_claimAutoreleasedReturnValue(),
                  v50 = objc_msgSend(v45, "isEqual:", v49),
                  v49,
                  v48 = (_QWORD *)MEMORY[0x1E0CB5AE8],
                  v50))
            {
              objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *v48);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v51 = 0;
            }

            if (v51)
            {
              -[HDWorkoutBuilderStatisticsCalculators calculatorForQuantityType:activityUUID:](self->_statisticsCalculators, "calculatorForQuantityType:activityUUID:", v51, self->_identifier);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = v52;
              if (v52)
              {
                objc_msgSend(v52, "currentStatistics");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = objc_msgSend(v54, "dataCount") == 0;

                if (!v55)
                {
                  objc_msgSend(v44, "UUID");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v138[0] = v56;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 1);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = +[HDWorkoutZonesAssociationEntity associateZonesSamplesWithUUIDs:withWorkoutUUID:transaction:profile:error:](HDWorkoutZonesAssociationEntity, "associateZonesSamplesWithUUIDs:withWorkoutUUID:transaction:profile:error:", v57, self->_identifier, v98, v110, a5);

                  if (!v58)
                  {

LABEL_46:
                    v106 = 0;
                    v61 = v95;
                    goto LABEL_47;
                  }
                  objc_msgSend(v44, "sampleType");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "setObject:forKeyedSubscript:", v44, v59);

                }
              }

            }
            else
            {
              _HKInitializeLogging();
              v60 = *MEMORY[0x1E0CB5380];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v140 = 138412290;
                *(_QWORD *)&v140[4] = v44;
                _os_log_error_impl(&dword_1B7802000, v60, OS_LOG_TYPE_ERROR, "Unsupported workout zone sample type: %@", v140, 0xCu);
              }
            }

          }
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, buf, 16);
          if (v40)
            continue;
          break;
        }
      }

      v61 = v95;
      v106 = v95;
LABEL_47:

      if (v106)
      {
        v117 = 0;
        obja = v108;
        v96 = v94;
        v62 = v110;
        v111 = v98;
        *(_OWORD *)v140 = 0u;
        v141 = 0u;
        v142 = 0u;
        v143 = 0u;
        v63 = self->_associatedSeries;
        v64 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", v140, buf, 16);
        if (v64)
        {
          v65 = *(_QWORD *)v141;
          v66 = MEMORY[0x1E0C9AA70];
          while (2)
          {
            for (j = 0; j != v64; ++j)
            {
              if (*(_QWORD *)v141 != v65)
                objc_enumerationMutation(v63);
              +[HDSeriesBuilderEntity freezeSeriesWithIdentifier:metadata:profile:error:](HDWorkoutRouteBuilderEntity, "freezeSeriesWithIdentifier:metadata:profile:error:", *(_QWORD *)(*(_QWORD *)&v140[8] + 8 * j), v66, v62, &v117);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = v68 == 0;

              if (v69)
              {
                v87 = 0;
                goto LABEL_64;
              }
            }
            v64 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", v140, buf, 16);
            if (v64)
              continue;
            break;
          }
        }

        associatedSeries = self->_associatedSeries;
        v136 = 0;
        v71 = -[HDCreateWorkoutOperation _associateSamplesWithUUIDs:activityUUID:type:profile:error:]((uint64_t)self, associatedSeries, 0, 0, v62, (uint64_t)&v136);
        v72 = (NSArray *)v136;
        v63 = v72;
        if (v71)
        {
          v73 = (void *)MEMORY[0x1E0D29840];
          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C88]);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          HDSampleEntityPredicateForDataType(v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v138[0] = v75;
          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DD8]);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          HDSampleEntityPredicateForDataType(v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v138[1] = v77;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 2);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "predicateMatchingAnyPredicates:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(obja, "metadata");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7330]);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          +[HDMetadataValueStatement metadataValueStatementWithTransaction:](HDMetadataValueStatement, "metadataValueStatementWithTransaction:", v111);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v129 = MEMORY[0x1E0C809B0];
          *((_QWORD *)&v129 + 1) = 3221225472;
          *(_QWORD *)&v130 = __105__HDCreateWorkoutOperation__associateQuantitySamplesWithWorkout_builderEntity_profile_transaction_error___block_invoke;
          *((_QWORD *)&v130 + 1) = &unk_1E6CF5070;
          *(_QWORD *)&v131 = v79;
          *((_QWORD *)&v131 + 1) = v62;
          *(_QWORD *)&v132 = v81;
          v83 = v111;
          *((_QWORD *)&v132 + 1) = v83;
          v133 = v82;
          v134 = self;
          v135 = obja;
          v84 = v82;
          v85 = v81;
          v86 = v79;
          v87 = objc_msgSend(v96, "enumerateAssociatedUUIDsWithTransaction:error:block:", v83, &v117, &v129);

        }
        else
        {
          v88 = v72;
          if (v88)
          {
            v86 = objc_retainAutorelease(v88);
            v87 = 0;
            v117 = v86;
          }
          else
          {
            v86 = 0;
            v87 = 1;
          }
        }

LABEL_64:
        v89 = v117;
        v90 = v89;
        if ((v87 & 1) != 0)
        {
          objc_msgSend(v111, "onCommit:orRollback:", &__block_literal_global_209_1, 0);
          objc_storeStrong((id *)&self->_createdWorkout, v108);
          -[HKWorkout _setZonesByType:](self->_createdWorkout, "_setZonesByType:", v106);
          v14 = +[HDWorkoutBuilderEntity discardBuilderWithIdentifier:profile:error:](HDWorkoutBuilderEntity, "discardBuilderWithIdentifier:profile:error:", self->_identifier, v62, a5);
        }
        else
        {
          v91 = v89;
          v92 = v91;
          v14 = v91 == 0;
          if (v91)
          {
            if (a5)
              *a5 = objc_retainAutorelease(v91);
            else
              _HKLogDroppedError();
          }

        }
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

    goto LABEL_74;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_startOfDateBySubtractingDays:fromDate:", *MEMORY[0x1E0CB6120], v11);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v12, "hk_isBeforeDate:", v113);

  if (!(_DWORD)v11)
  {

    goto LABEL_7;
  }
  _HKInitializeLogging();
  v13 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to save a workout which is older than the standard data availability on Watch. Discarding builder", buf, 2u);
  }
  v14 = +[HDWorkoutBuilderEntity discardBuilderWithIdentifier:profile:error:](HDWorkoutBuilderEntity, "discardBuilderWithIdentifier:profile:error:", self->_identifier, v115, a5);
LABEL_78:

  return v14;
}

uint64_t __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, void *, id);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setEndDate:", v7);

  }
  objc_msgSend(v9, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v8, v9);

}

uint64_t __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  HDWorkoutBuilderStatisticsDataSource *v10;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v11;
  HDWorkoutBuilderStatisticsDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = -[HDWorkoutBuilderStatisticsDataSource initWithProfile:quantityType:builderEntity:]([HDWorkoutBuilderStatisticsDataSource alloc], "initWithProfile:quantityType:builderEntity:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 40));
  v11 = -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider initWithProfile:quantityType:]([HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc], "initWithProfile:quantityType:", *(_QWORD *)(a1 + 32), v8);
  objc_msgSend(v7, "setDataSource:", v10);
  objc_msgSend(v7, "setSourceOrderProvider:", v11);
  if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24)))
  {
    objc_msgSend(v7, "setDateInterval:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32));
  }
  else
  {
    v12 = v10;
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13
      || (objc_msgSend(v13, "endDate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "startDate"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v15, "hk_isAfterDate:", v16),
          v16,
          v15,
          !v17))
    {

      v10 = v12;
      goto LABEL_20;
    }
    v18 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v14, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithStartDate:endDate:", v19, v20);
    objc_msgSend(v7, "setDateInterval:", v21);

    v10 = v12;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 120), "containsObject:", v8) & 1) == 0)
  {
    _HKPausedIntervalsWithWorkoutEvents();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v23 = objc_msgSend(v7, "setMaskedIntervals:error:", v22, &v33);
    v24 = v33;
    if ((v23 & 1) == 0)
    {
      _HKInitializeLogging();
      v25 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v35 = v8;
        v36 = 2114;
        v37 = v24;
        _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "Failed to set mask interval for %{public}@ at workout end; will fall back on existing statistics: %{public}@",
          buf,
          0x16u);
      }
    }

  }
  v32 = 0;
  v26 = objc_msgSend(v7, "invalidateInterval:error:", 0, &v32);
  v27 = v32;
  if ((v26 & 1) == 0)
  {
    _HKInitializeLogging();
    v28 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v35 = v8;
      v36 = 2114;
      v37 = v27;
      _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "Failed to update statistics for %{public}@ at workout end; will fall back on existing statistics: %{public}@",
        buf,
        0x16u);
    }
  }
  objc_msgSend(v7, "currentStatistics");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24)))
    {
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v29, v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_setStatistics:forType:", v29, v8);

    }
  }

LABEL_20:
  return 1;
}

uint64_t __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_199(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v3, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsDate:", v6))
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(v3, "dateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsDate:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_2_201(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_207()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("HDHealthStoreServerDidAssociateWorkoutSamples"), 0);

}

- (BOOL)_associateSamplesWithUUIDs:(void *)a3 activityUUID:(uint64_t)a4 type:(void *)a5 profile:(uint64_t)a6 error:
{
  id v11;
  id v12;
  id v13;
  HDAssociatableObjectReference *v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v18;

  v11 = a2;
  v12 = a3;
  v13 = a5;
  if (a1)
  {
    if (v12)
      v14 = -[HDAssociatableObjectReference initWithUUID:objectClass:]([HDAssociatableObjectReference alloc], "initWithUUID:objectClass:", v12, objc_opt_class());
    else
      v14 = 0;
    v15 = *(_QWORD *)(a1 + 24);
    v18 = 0;
    v16 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v11, v15, a4, v14, &v18, v13, a6);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

BOOL __105__HDCreateWorkoutOperation__associateQuantitySamplesWithWorkout_builderEntity_profile_transaction_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  unint64_t v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  id v77;
  id v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  id v86;
  _QWORD v87[3];
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  __int16 v94;
  uint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0D29840];
  HDDataEntityPredicateForDataUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v87[0] = v6;
  v87[1] = v8;
  objc_msgSend(v7, "metadataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = *MEMORY[0x1E0CB7330];
  objc_msgSend(v9, "predicateWithMetadataKey:value:operatorType:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "databaseForEntityClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDSampleEntity, "anyInDatabase:predicate:error:", v13, v12, &v80);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v80;

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "metadataManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "persistentID");
    v18 = *(_QWORD *)(a1 + 64);
    v79 = 0;
    objc_msgSend(v16, "metadataForObjectID:baseMetadata:keyFilter:statement:error:", v17, 0, 0, v18, &v79);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v79;

    if (v20)
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v63 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 138543874;
        v89 = v63;
        v90 = 2112;
        v91 = v4;
        v92 = 2112;
        v93 = v20;
        _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Error retrieving metadata on effort sample:%@, error:%@", buf, 0x20u);
      }
      if (a3)
        *a3 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();

      goto LABEL_24;
    }
    v67 = (void *)*MEMORY[0x1E0CB7380];
    objc_msgSend(v19, "objectForKey:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23)
    {
      _HKInitializeLogging();
      v48 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v49 = *(_QWORD *)(a1 + 72);
        v50 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 138543874;
        v89 = v49;
        v90 = 2112;
        v91 = v67;
        v92 = 2112;
        v93 = v50;
        _os_log_error_impl(&dword_1B7802000, v48, OS_LOG_TYPE_ERROR, "%{public}@, Effort sample is missing %@, skipping association to workout:%@", buf, 0x20u);
      }
      goto LABEL_45;
    }
    v71 = v19;
    v72 = v15;
    v69 = v23;
    v70 = v14;
    v73 = v12;
    v74 = v4;
    v25 = *(_QWORD *)(a1 + 72);
    v26 = *(void **)(a1 + 80);
    v27 = v23;
    v28 = v26;
    v29 = v28;
    if (!v25)
      goto LABEL_34;
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v68 = v28;
    objc_msgSend(v28, "_subActivities");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v82;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v82 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          objc_msgSend(v35, "UUID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "UUIDString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqual:", v27);

          if ((v38 & 1) != 0)
          {
            objc_msgSend(v35, "UUID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = v69;
            v14 = v70;
            v47 = 0x1E0C99000;
            v29 = v68;
            goto LABEL_36;
          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
        if (v32)
          continue;
        break;
      }
    }

    v29 = v68;
    objc_msgSend(v68, "metadata");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", v75);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v27, "isEqual:", v40);

    if (v41)
    {
      objc_msgSend(v68, "UUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_34:
      v42 = 0;
    }
    v24 = v69;
    v14 = v70;
    v47 = 0x1E0C99000uLL;
LABEL_36:

    if (!v42)
    {
      _HKInitializeLogging();
      v60 = *MEMORY[0x1E0CB5380];
      v19 = v71;
      v15 = v72;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v65 = *(_QWORD *)(a1 + 72);
        v66 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 138544130;
        v89 = v65;
        v90 = 2112;
        v91 = v67;
        v92 = 2112;
        v93 = 0;
        v94 = 2112;
        v95 = v66;
        _os_log_error_impl(&dword_1B7802000, v60, OS_LOG_TYPE_ERROR, "%{public}@, Effort samples <%@: %@>, does not match any activity UUID on workout:%@", buf, 0x2Au);
      }
      goto LABEL_44;
    }
    objc_msgSend(*(id *)(a1 + 80), "UUID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "isEqual:", v53))
      v54 = 0;
    else
      v54 = v42;
    v55 = v54;

    v56 = *(_QWORD *)(a1 + 72);
    v86 = v74;
    objc_msgSend(*(id *)(v47 + 3360), "arrayWithObjects:count:", &v86, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = *(void **)(a1 + 40);
    v78 = 0;
    LODWORD(v56) = -[HDCreateWorkoutOperation _associateSamplesWithUUIDs:activityUUID:type:profile:error:](v56, v57, v55, 1, v58, (uint64_t)&v78);

    v59 = v78;
    if ((_DWORD)v56)
    {

      v19 = v71;
      v15 = v72;
LABEL_44:

      v12 = v73;
      v4 = v74;
LABEL_45:

      v22 = 1;
      goto LABEL_53;
    }
    v61 = v59;
    v62 = v61;
    v22 = v61 == 0;
    v15 = v72;
    if (v61)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v61);
      else
        _HKLogDroppedError();
    }

    v12 = v73;
    v4 = v74;
  }
  else if (v15)
  {
    if (!a3)
    {
      _HKLogDroppedError();
LABEL_24:
      v22 = 0;
      goto LABEL_53;
    }
    v22 = 0;
    *a3 = objc_retainAutorelease(v15);
  }
  else
  {
    v43 = *(_QWORD *)(a1 + 72);
    v85 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *(void **)(a1 + 40);
    v77 = 0;
    LODWORD(v43) = -[HDCreateWorkoutOperation _associateSamplesWithUUIDs:activityUUID:type:profile:error:](v43, v44, 0, 0, v45, (uint64_t)&v77);
    v46 = v77;

    if ((_DWORD)v43)
    {

      v22 = 1;
      v15 = 0;
    }
    else
    {
      v51 = v46;
      v52 = v51;
      v22 = v51 == 0;
      v15 = 0;
      if (v51)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v51);
        else
          _HKLogDroppedError();
      }

    }
  }
LABEL_53:

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDCreateWorkoutOperation)initWithCoder:(id)a3
{
  id v4;
  HDCreateWorkoutOperation *v5;
  uint64_t v6;
  HKWorkoutConfiguration *workoutConfiguration;
  uint64_t v8;
  NSUUID *identifier;
  uint64_t v10;
  NSDateInterval *dateInterval;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *metadata;
  uint64_t v16;
  HKDevice *device;
  uint64_t v18;
  HKSource *source;
  uint64_t v20;
  NSString *sourceVersion;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *events;
  uint64_t v27;
  HDWorkoutBuilderStatisticsCalculators *statisticsCalculators;
  uint64_t v29;
  HKQuantity *goal;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *activities;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HDCreateWorkoutOperation;
  v5 = -[HDCreateWorkoutOperation init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workout_configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    workoutConfiguration = v5->_workoutConfiguration;
    v5->_workoutConfiguration = (HKWorkoutConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date_interval"));
    v10 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v10;

    objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("metadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_replaceKeysFromSharedStringCache");
    v14 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
    v16 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HKDevice *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v18 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (HKSource *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source_version"));
    v20 = objc_claimAutoreleasedReturnValue();
    sourceVersion = v5->_sourceVersion;
    v5->_sourceVersion = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("events"));
    v25 = objc_claimAutoreleasedReturnValue();
    events = v5->_events;
    v5->_events = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calculators"));
    v27 = objc_claimAutoreleasedReturnValue();
    statisticsCalculators = v5->_statisticsCalculators;
    v5->_statisticsCalculators = (HDWorkoutBuilderStatisticsCalculators *)v27;

    v5->_goalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("goal_type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("goal"));
    v29 = objc_claimAutoreleasedReturnValue();
    goal = v5->_goal;
    v5->_goal = (HKQuantity *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithArray:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("activities"));
    v34 = objc_claimAutoreleasedReturnValue();
    activities = v5->_activities;
    v5->_activities = (NSArray *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKWorkoutConfiguration *workoutConfiguration;
  id v5;

  workoutConfiguration = self->_workoutConfiguration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", workoutConfiguration, CFSTR("workout_configuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("date_interval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_device, CFSTR("device"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceVersion, CFSTR("source_version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_events, CFSTR("events"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statisticsCalculators, CFSTR("calculators"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_goalType, CFSTR("goal_type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_goal, CFSTR("goal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activities, CFSTR("activities"));

}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (HKDevice)device
{
  return self->_device;
}

- (HKSource)source
{
  return self->_source;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSArray)events
{
  return self->_events;
}

- (NSArray)activities
{
  return self->_activities;
}

- (HDWorkoutBuilderStatisticsCalculators)statisticsCalculators
{
  return self->_statisticsCalculators;
}

- (NSArray)associatedSeries
{
  return self->_associatedSeries;
}

- (unint64_t)goalType
{
  return self->_goalType;
}

- (HKQuantity)goal
{
  return self->_goal;
}

- (NSArray)quantityTypesIncludedWhilePaused
{
  return self->_quantityTypesIncludedWhilePaused;
}

- (HKWorkout)createdWorkout
{
  return self->_createdWorkout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdWorkout, 0);
  objc_storeStrong((id *)&self->_quantityTypesIncludedWhilePaused, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_associatedSeries, 0);
  objc_storeStrong((id *)&self->_statisticsCalculators, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
}

@end
