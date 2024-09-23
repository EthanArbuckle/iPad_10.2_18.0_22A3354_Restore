@implementation HDDatabaseChangesQueryServer

- (HDDatabaseChangesQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDDatabaseChangesQueryServer *v11;
  void *v12;
  uint64_t v13;
  HKQueryAnchor *anchor;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDDatabaseChangesQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v16, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "anchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    anchor = v11->_anchor;
    v11->_anchor = (HKQueryAnchor *)v13;

  }
  return v11;
}

- (BOOL)validateConfiguration:(id *)a3
{
  void *v5;
  uint64_t v6;
  objc_super v8;

  -[HDDatabaseChangesQueryServer objectTypes](self, "objectTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)HDDatabaseChangesQueryServer;
    return -[HDQueryServer validateConfiguration:](&v8, sel_validateConfiguration_, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Must provide at least one object type"));
    return 0;
  }
}

- (id)objectTypes
{
  void *v2;
  void *v3;

  if (self)
  {
    -[HDQueryServer configuration](self, "configuration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(v2, "sampleTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_queue_start
{
  HKQueryAnchor *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  NSString *detailsQueryDateIndexSQL;
  NSString *detailsQueryAnchorIndexSQL;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[8];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HDDatabaseChangesQueryServer;
  -[HDQueryServer _queue_start](&v32, sel__queue_start);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__102;
  v30 = __Block_byref_object_dispose__102;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = self->_anchor;
  v4 = -[HKQueryAnchor _rowid](v3, "_rowid");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__102;
  v24 = __Block_byref_object_dispose__102;
  v25 = 0;
  -[HDQueryServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44__HDDatabaseChangesQueryServer__queue_start__block_invoke;
  v18[3] = &unk_1E6CFA1D0;
  v18[6] = &v26;
  v18[7] = v4;
  v18[4] = self;
  v18[5] = &v20;
  v7 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v6, &v19, v18);
  v8 = v19;

  detailsQueryDateIndexSQL = self->_detailsQueryDateIndexSQL;
  self->_detailsQueryDateIndexSQL = 0;

  detailsQueryAnchorIndexSQL = self->_detailsQueryAnchorIndexSQL;
  self->_detailsQueryAnchorIndexSQL = 0;

  if (v7)
  {
    v11 = v21;
    v12 = (void *)v21[5];
    if (v12)
    {
      v13 = objc_msgSend(v12, "_rowid");
      v11 = v21;
      if (v13 > v4)
      {
        -[HDQueryServer setDataCount:](self, "setDataCount:", objc_msgSend((id)v21[5], "_rowid") - v4);
        v11 = v21;
      }
    }
    if (objc_msgSend((id)v11[5], "_rowid") > v4 || !self->_hasDeliveredInitialResults)
    {
      -[HDDatabaseChangesQueryServer _queue_deliverQueryAnchor:sampleTypeChanges:]((id *)&self->super.super.isa, (void *)v21[5], (void *)v27[5]);
      self->_hasDeliveredInitialResults = 1;
    }
  }
  else
  {
    v14 = v8;
    -[HDQueryServer queryQueue](self, "queryQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v15);

    -[HDQueryServer clientProxy](self, "clientProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer queryUUID](self, "queryUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "client_deliverError:forQuery:", v14, v17);

  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

BOOL __44__HDDatabaseChangesQueryServer__queue_start__block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  id v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
  double *v51;
  double v52;
  double *v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  _QWORD *v62;
  uint64_t v63;
  id v64;
  id v65;
  double *v66;
  double v67;
  double *v68;
  id v69;
  uint64_t v70;
  void *v71;
  _QWORD *v73;
  uint64_t v74;
  id v75;
  unsigned int v76;
  void *v77;
  id v78;
  id v79;
  int v80;
  id v81;
  id v82;
  id v83;
  id obj;
  void *v85;
  void *v86;
  void *v87;
  _QWORD *v88;
  id v90;
  uint64_t v92;
  _QWORD v93[5];
  _QWORD v94[4];
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t *v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, sqlite3_stmt *);
  void *v116;
  id v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  double v126;
  uint64_t v127;
  double *v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  double *v132;
  uint64_t v133;
  double v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v81 = a2;
  objc_msgSend(v81, "protectedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity maxValueForProperty:predicate:database:error:](HDDataEntity, "maxValueForProperty:predicate:database:error:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;

  if (!v85)
  {
    v9 = v82;
    v10 = v9;
    v8 = v9 == 0;
    if (v9)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError();
    }

    goto LABEL_78;
  }
  objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", objc_msgSend(v85, "longLongValue"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = a1[7];
  if (v7 > objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_rowid"))
  {
    v8 = 1;
    goto LABEL_78;
  }
  v11 = (_QWORD *)a1[4];
  objc_msgSend(v81, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (_QWORD *)a1[7];
  v79 = v12;
  if (!v11)
  {
    v69 = 0;
    goto LABEL_77;
  }
  objc_msgSend(v11, "queryQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v83 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT MAX(%@) FROM %@ WHERE %@ = ?"), CFSTR("data_id"), v77, CFSTR("data_type"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseChangesQueryServer _authorizedObjectTypes](v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v15, "includeChangeDetails");

  v78 = v14;
  v90 = v79;
  v16 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDQuantitySampleSeriesEntity, "disambiguatedDatabaseTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("SELECT %@, COUNT(*) FROM %@ CROSS JOIN %@ USING (%@) WHERE %@ IS NOT NULL GROUP BY %@"), CFSTR("data_type"), v17, v18, CFSTR("data_id"), CFSTR("insertion_era"), CFSTR("data_type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v135 = 0;
  v136 = &v135;
  v137 = 0x3032000000;
  v138 = __Block_byref_object_copy__102;
  v139 = __Block_byref_object_dispose__102;
  v140 = 0;
  v104 = MEMORY[0x1E0C809B0];
  v105 = 3221225472;
  v20 = &unk_1E6CE8540;
  v106 = __107__HDDatabaseChangesQueryServer__queue_sampleTypeCodesWithUnfrozenSeriesWithAuthorizedTypes_database_error___block_invoke;
  v107 = &unk_1E6CE8540;
  v108 = &v135;
  if ((objc_msgSend(v90, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v19, a3, 0, &v104) & 1) != 0)
  {
    if (objc_msgSend((id)v136[5], "count"))
    {
      *(_QWORD *)&v100 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v100 + 1) = 3221225472;
      *(_QWORD *)&v101 = __107__HDDatabaseChangesQueryServer__queue_sampleTypeCodesWithUnfrozenSeriesWithAuthorizedTypes_database_error___block_invoke_2;
      *((_QWORD *)&v101 + 1) = &unk_1E6CFA1F8;
      *(_QWORD *)&v102 = &v135;
      objc_msgSend(v78, "hk_filter:", &v100);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    }
    v87 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v87 = 0;
  }
  _Block_object_dispose(&v135, 8);

  if (!v87)
  {
LABEL_73:
    v69 = 0;
    goto LABEL_76;
  }
  v102 = 0u;
  v103 = 0u;
  v101 = 0u;
  v100 = 0u;
  obj = v78;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, &v135, 16);
  if (!v21)
    goto LABEL_75;
  v92 = *(_QWORD *)v101;
  v22 = *MEMORY[0x1E0CB4CF8];
  v73 = v11;
  while (2)
  {
    v23 = 0;
    v74 = v21;
    do
    {
      if (*(_QWORD *)v101 != v92)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v23);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v24;
        v96 = 0;
        v97 = &v96;
        v98 = 0x2020000000;
        v99 = -1;
        v26 = MEMORY[0x1E0C809B0];
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __83__HDDatabaseChangesQueryServer__queue_changesByTypeWithDatabase_sinceAnchor_error___block_invoke;
        v94[3] = &unk_1E6CE9508;
        v27 = v25;
        v95 = v27;
        v93[0] = v26;
        v93[1] = 3221225472;
        v93[2] = __83__HDDatabaseChangesQueryServer__queue_changesByTypeWithDatabase_sinceAnchor_error___block_invoke_2;
        v93[3] = v20;
        v93[4] = &v96;
        if ((objc_msgSend(v90, "executeSQL:error:bindingHandler:enumerationHandler:", v86, a3, v94, v93) & 1) == 0)
        {

          _Block_object_dispose(&v96, 8);
          goto LABEL_73;
        }
        if (v97[3] <= (uint64_t)v88)
        {
          if (objc_msgSend(v87, "containsObject:", v27))
          {
            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6B08]), "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v27, 1, 0, v22, v22);
            objc_msgSend(v83, "setObject:forKeyedSubscript:", v33, v27);

          }
LABEL_68:
          _Block_object_dispose(&v96, 8);

          goto LABEL_69;
        }
        if (!v80)
        {
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6B08]), "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v27, objc_msgSend(v87, "containsObject:", v27), 0, v22, v22);
LABEL_66:
          if (!v34)
          {
LABEL_74:

            _Block_object_dispose(&v96, 8);
            goto LABEL_75;
          }
          objc_msgSend(v83, "setObject:forKeyedSubscript:", v34, v27);

          goto LABEL_68;
        }
        v76 = objc_msgSend(v87, "containsObject:", v27);
        v28 = v97[3];
        v29 = v27;
        objc_msgSend(v11, "queryQueue");
        v30 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(v30);

        objc_msgSend(v11, "configuration");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "changeDetailsQueryStrategy");

        if (v32)
        {

          if (v32 != 1)
          {
            if (v32 != 2)
              goto LABEL_74;
            goto LABEL_55;
          }
        }
        else
        {
          if (v88)
          {
            objc_msgSend(v11, "configuration");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v28 - (uint64_t)v88 > objc_msgSend(v35, "anchorStrategyChangeCountLimit");

            if (!v36)
            {

LABEL_55:
              v54 = v29;
              v75 = v90;
              objc_msgSend(v11, "queryQueue");
              v55 = objc_claimAutoreleasedReturnValue();
              dispatch_assert_queue_V2(v55);

              v56 = v11[29];
              if (!v56)
              {
                v57 = (void *)MEMORY[0x1E0CB3940];
                +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "stringWithFormat:", CFSTR("SELECT %@, %@ FROM %@ WHERE %@ > ? AND %@ = ?"), CFSTR("start_date"), CFSTR("end_date"), v58, CFSTR("data_id"), CFSTR("data_type"), 0);
                v59 = objc_claimAutoreleasedReturnValue();
                v60 = (void *)v11[29];
                v11[29] = v59;

                v56 = v11[29];
              }
              v61 = v20;
              v62 = v11;
              v131 = 0;
              v132 = (double *)&v131;
              v133 = 0x2020000000;
              v134 = v22;
              v127 = 0;
              v128 = (double *)&v127;
              v129 = 0x2020000000;
              v130 = v22;
              v123 = 0;
              v124 = &v123;
              v125 = 0x2020000000;
              LOBYTE(v126) = 0;
              v63 = MEMORY[0x1E0C809B0];
              v113 = MEMORY[0x1E0C809B0];
              v114 = 3221225472;
              v115 = __130__HDDatabaseChangesQueryServer__queue_detailedChangeUsingAnchorIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke;
              v116 = &unk_1E6CE82D8;
              v118 = v88;
              v64 = v54;
              v117 = v64;
              v104 = v63;
              v105 = 3221225472;
              v106 = __130__HDDatabaseChangesQueryServer__queue_detailedChangeUsingAnchorIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke_2;
              v107 = &unk_1E6CFA220;
              v108 = &v123;
              v109 = &v131;
              v111 = v88;
              v110 = &v127;
              if ((objc_msgSend(v75, "executeSQL:error:bindingHandler:enumerationHandler:", v56, a3, &v113, &v104) & 1) != 0)
              {
                v65 = objc_alloc(MEMORY[0x1E0CB6B08]);
                if (*((_BYTE *)v124 + 24))
                  v66 = (double *)MEMORY[0x1E0CB4CF8];
                else
                  v66 = v132 + 3;
                v67 = *v66;
                v68 = v128 + 3;
                if (*((_BYTE *)v124 + 24))
                  v68 = (double *)MEMORY[0x1E0CB4CF8];
                v34 = (void *)objc_msgSend(v65, "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v64, v76, 2, v67, *v68);
              }
              else
              {
                v34 = 0;
              }

              v11 = v62;
              v20 = v61;
              _Block_object_dispose(&v123, 8);
              _Block_object_dispose(&v127, 8);
              _Block_object_dispose(&v131, 8);

              goto LABEL_66;
            }
          }

        }
        v37 = v29;
        v38 = v90;
        objc_msgSend(v11, "queryQueue");
        v39 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(v39);

        v40 = v11[28];
        if (!v40)
        {
          +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT (SELECT MIN(%@) FROM %@ WHERE %@ > ? AND %@ = ?) AS min_start_date,(SELECT MAX(%@) FROM %@ WHERE %@ > ? AND %@ = ?) AS max_start_date,(SELECT MAX(%@) FROM %@ WHERE %@ = ?) as max_end_date,(SELECT %@ FROM %@ WHERE %@ > ? AND %@ = ? AND %@ IS NULL AND %@ IS NULL LIMIT 1) as deletions"), CFSTR("start_date"), v41, CFSTR("data_id"), CFSTR("data_type"), CFSTR("start_date"), v41, CFSTR("data_id"), CFSTR("data_type"), CFSTR("end_date"), v41, CFSTR("data_type"), CFSTR("data_id"), v41, CFSTR("data_id"), CFSTR("data_type"), CFSTR("start_date"),
            CFSTR("end_date"),
            0);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = (void *)v11[28];
          v11[28] = v42;

          v40 = v11[28];
        }
        v131 = 0;
        v132 = (double *)&v131;
        v133 = 0x2020000000;
        v134 = v22;
        v127 = 0;
        v128 = (double *)&v127;
        v129 = 0x2020000000;
        v130 = v22;
        v123 = 0;
        v124 = &v123;
        v125 = 0x2020000000;
        v126 = v22;
        v119 = 0;
        v120 = &v119;
        v121 = 0x2020000000;
        v122 = 0;
        v44 = MEMORY[0x1E0C809B0];
        v113 = MEMORY[0x1E0C809B0];
        v114 = 3221225472;
        v115 = __128__HDDatabaseChangesQueryServer__queue_detailedChangeUsingDateIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke;
        v116 = &unk_1E6CE82D8;
        v45 = v37;
        v117 = v45;
        v118 = v88;
        v104 = v44;
        v105 = 3221225472;
        v106 = __128__HDDatabaseChangesQueryServer__queue_detailedChangeUsingDateIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke_2;
        v107 = &unk_1E6CFA248;
        v108 = &v131;
        v109 = &v127;
        v112 = v88;
        v110 = &v123;
        v111 = &v119;
        if ((objc_msgSend(v38, "executeSQL:error:bindingHandler:enumerationHandler:", v40, a3, &v113, &v104) & 1) != 0)
        {
          if (v132[3] != v22
            && *((double *)v124 + 3) != v22
            && objc_msgSend(v45, "isMaximumDurationRestricted"))
          {
            v46 = *((double *)v124 + 3);
            v47 = v128[3];
            objc_msgSend(v45, "maximumAllowedDuration");
            v49 = v47 + v48;
            if (v46 < v49)
              v49 = v46;
            *((double *)v124 + 3) = v49;
          }
          v50 = objc_alloc(MEMORY[0x1E0CB6B08]);
          if (*((_BYTE *)v120 + 24))
            v51 = (double *)MEMORY[0x1E0CB4CF8];
          else
            v51 = v132 + 3;
          v52 = *v51;
          v53 = (double *)(v124 + 3);
          if (*((_BYTE *)v120 + 24))
            v53 = (double *)MEMORY[0x1E0CB4CF8];
          v34 = (void *)objc_msgSend(v50, "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v45, v76, 1, v52, *v53);
        }
        else
        {
          v34 = 0;
        }
        v21 = v74;

        v20 = &unk_1E6CE8540;
        v11 = v73;
        _Block_object_dispose(&v119, 8);
        _Block_object_dispose(&v123, 8);
        _Block_object_dispose(&v127, 8);
        _Block_object_dispose(&v131, 8);

        goto LABEL_66;
      }
LABEL_69:
      ++v23;
    }
    while (v21 != v23);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, &v135, 16);
    if (v21)
      continue;
    break;
  }
LABEL_75:

  v69 = v83;
LABEL_76:

LABEL_77:
  v70 = *(_QWORD *)(a1[6] + 8);
  v71 = *(void **)(v70 + 40);
  *(_QWORD *)(v70 + 40) = v69;

  v8 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
LABEL_78:

  return v8;
}

- (void)_queue_deliverQueryAnchor:(void *)a3 sampleTypeChanges:
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    v6 = a3;
    objc_msgSend(a1, "queryQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(a1, "clientProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client_deliverQueryAnchor:sampleTypeChanges:queryUUID:", v10, v6, v9);

    objc_storeStrong(a1 + 26, a2);
  }

}

- (id)_authorizedObjectTypes
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v1 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "objectTypes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(v1, "client");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "authorizationOracle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      objc_msgSend(v4, "readAuthorizationStatusesForTypes:error:", v2, &v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;

      if (v5)
      {
        objc_msgSend(v5, "hk_filterKeysWithBlock:", &__block_literal_global_111);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _HKInitializeLogging();
        v8 = *MEMORY[0x1E0CB5348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v12 = v1;
          v13 = 2114;
          v14 = v6;
          _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error reading authorization statuses: %{public}@", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v1 = (id)v7;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v1 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v1;
}

uint64_t __83__HDDatabaseChangesQueryServer__queue_changesByTypeWithDatabase_sinceAnchor_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "code"));
}

uint64_t __83__HDDatabaseChangesQueryServer__queue_changesByTypeWithDatabase_sinceAnchor_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __107__HDDatabaseChangesQueryServer__queue_sampleTypeCodesWithUnfrozenSeriesWithAuthorizedTypes_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  MEMORY[0x1BCCAB1C8](a2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  return 1;
}

uint64_t __107__HDDatabaseChangesQueryServer__queue_sampleTypeCodesWithUnfrozenSeriesWithAuthorizedTypes_database_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __130__HDDatabaseChangesQueryServer__queue_detailedChangeUsingAnchorIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "code"));
}

uint64_t __130__HDDatabaseChangesQueryServer__queue_detailedChangeUsingAnchorIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  double v9;
  double v10;

  if (MEMORY[0x1BCCAB204](a2, 0) && MEMORY[0x1BCCAB204](a2, 1) && (uint64_t)a1[7] >= 1)
  {
    v4 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  }
  else
  {
    v5 = MEMORY[0x1BCCAB1A4](a2, 0);
    v6 = *(_QWORD *)(a1[5] + 8);
    v7 = *(double *)(v6 + 24);
    if (v7 < v5 && v7 != *MEMORY[0x1E0CB4CF8])
      v5 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v5;
    v9 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
    v4 = 1;
    v10 = MEMORY[0x1BCCAB1A4](a2, 1);
    if (v9 >= v10)
      v10 = v9;
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v10;
  }
  return v4;
}

uint64_t __128__HDDatabaseChangesQueryServer__queue_detailedChangeUsingDateIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "code");
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, v4);
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 4, v4);
  sqlite3_bind_int64(a2, 5, v4);
  sqlite3_bind_int64(a2, 6, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_int64(a2, 7, v4);
}

uint64_t __128__HDDatabaseChangesQueryServer__queue_detailedChangeUsingDateIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  if (HDSQLiteColumnIsNonNull())
    *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 0);
  if (HDSQLiteColumnIsNonNull())
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 1);
  if (HDSQLiteColumnIsNonNull())
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 2);
  if ((uint64_t)a1[8] >= 1 && HDSQLiteColumnIsNonNull())
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = HDSQLiteColumnAsInt64() > 0;
  return 1;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  HDDatabaseChangesQueryServer *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HDDatabaseChangesQueryServer_samplesAdded_anchor___block_invoke;
  v10[3] = &unk_1E6CE7FB8;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  -[HDQueryServer onQueue:](self, "onQueue:", v10);

}

void __52__HDDatabaseChangesQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  id *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "longLongValue");
  if (v2 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "_rowid"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = *(id *)(a1 + 48);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v3)
    {
      v4 = v3;
      v22 = *(_QWORD *)v24;
      v5 = *MEMORY[0x1E0CB4CF8];
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v24 != v22)
            objc_enumerationMutation(obj);
          v7 = *(id **)(a1 + 40);
          v8 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v6);
          if (v7)
          {
            objc_msgSend(v7, "queryQueue");
            v9 = objc_claimAutoreleasedReturnValue();
            dispatch_assert_queue_V2(v9);

            if (!v7[25])
            {
              v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v11 = v7[25];
              v7[25] = v10;

            }
            objc_msgSend(v8, "sampleType");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7[25], "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "configuration");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "includeChangeDetails");

            if (v13)
            {
              if (v15)
                objc_msgSend(v13, "_extendDateIntervalWithSample:", v8);
            }
            else
            {
              v16 = objc_alloc(MEMORY[0x1E0CB6B08]);
              v17 = v5;
              v18 = v5;
              if (v15)
              {
                objc_msgSend(v8, "_startTimestamp");
                v17 = v19;
                objc_msgSend(v8, "_endTimestamp");
                v18 = v20;
              }
              v13 = (void *)objc_msgSend(v16, "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v12, 0, 0, v17, v18);
              objc_msgSend(v7[25], "setObject:forKeyedSubscript:", v13, v12);
            }

          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v4);
    }

  }
}

- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HDDatabaseChangesQueryServer *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HDDatabaseChangesQueryServer_didAddSamplesOfTypes_anchor___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[HDQueryServer onQueue:](self, "onQueue:", v7);

}

void __60__HDDatabaseChangesQueryServer_didAddSamplesOfTypes_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "longLongValue");
  if (v2 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "_rowid"))
  {
    -[HDDatabaseChangesQueryServer _authorizedObjectTypes](*(id *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 200);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__HDDatabaseChangesQueryServer_didAddSamplesOfTypes_anchor___block_invoke_2;
    v10[3] = &unk_1E6CFA270;
    v9 = v3;
    v11 = v9;
    objc_msgSend(v5, "hk_filter:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      -[HDDatabaseChangesQueryServer _queue_deliverQueryAnchor:sampleTypeChanges:](*(id **)(a1 + 40), v4, v6);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 200);
    *(_QWORD *)(v7 + 200) = 0;

  }
}

uint64_t __60__HDDatabaseChangesQueryServer_didAddSamplesOfTypes_anchor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  HDDatabaseChangesQueryServer *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HDDatabaseChangesQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v10[3] = &unk_1E6CE7FB8;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  -[HDQueryServer onQueue:](self, "onQueue:", v10);

}

void __65__HDDatabaseChangesQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "longLongValue");
  if (v2 > objc_msgSend(*((id *)a1[5] + 26), "_rowid"))
  {
    -[HDDatabaseChangesQueryServer _authorizedObjectTypes](a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = a1[6];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = *MEMORY[0x1E0CB4CF8];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v3, "containsObject:", v11, (_QWORD)v14))
          {
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6B08]), "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v11, 0, 0, v9, v9);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", objc_msgSend(a1[4], "longLongValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDatabaseChangesQueryServer _queue_deliverQueryAnchor:sampleTypeChanges:]((id *)a1[5], v13, v4);

    }
  }
}

BOOL __54__HDDatabaseChangesQueryServer__authorizedObjectTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "canRead"))
  {
    objc_msgSend(v2, "restrictedBundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsQueryAnchorIndexSQL, 0);
  objc_storeStrong((id *)&self->_detailsQueryDateIndexSQL, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_pendingSampleTypeChanges, 0);
}

@end
