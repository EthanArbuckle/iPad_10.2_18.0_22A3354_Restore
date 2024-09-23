@implementation HDDatabaseDailyAnalytics

- (HDDatabaseDailyAnalytics)initWithProfile:(id)a3
{
  id v4;
  HDDatabaseDailyAnalytics *v5;
  HDDatabaseDailyAnalytics *v6;
  uint64_t v7;
  OS_dispatch_queue *serialAsynchronousQueue;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDatabaseDailyAnalytics;
  v5 = -[HDDatabaseDailyAnalytics init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    serialAsynchronousQueue = v6->_serialAsynchronousQueue;
    v6->_serialAsynchronousQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(v4, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerDaemonReadyObserver:queue:", v6, v6->_serialAsynchronousQueue);

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsSubmissionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HDDatabaseDailyAnalytics;
  -[HDDatabaseDailyAnalytics dealloc](&v6, sel_dealloc);
}

- (void)daemonReady:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsSubmissionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:queue:", self, self->_serialAsynchronousQueue);

}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  _BOOL8 v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  int64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  int64_t v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  int64_t v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  int64_t v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  int64_t v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  int64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  int64_t v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  int64_t v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  int64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  int64_t v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  int64_t v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  int64_t v121;
  id v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  int64_t v127;
  id v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161[2];

  p_profile = &self->_profile;
  v138 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "_newCorruptionEventStore");

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6DFACD0, CFSTR("hfdSchema"));
  v9 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v9, "profileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mostRecentCorruptionEventForProfileIdentifier:component:", v10, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v13, "profileIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mostRecentCorruptionEventForProfileIdentifier:component:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (id *)p_profile;
  v18 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v18, "profileIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mostRecentCorruptionEventForProfileIdentifier:component:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v139 = v7;
  objc_msgSend(v7, "dateOfMostRecentDeviceOutOfSpaceEvent");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v24 = objc_msgSend(v12, "compare:", v23) == 1;
    if (v16)
      goto LABEL_3;
LABEL_6:
    v25 = 0;
    if (v21)
      goto LABEL_4;
    goto LABEL_7;
  }
  v24 = 0;
  if (!v16)
    goto LABEL_6;
LABEL_3:
  v25 = objc_msgSend(v16, "compare:", v23) == 1;
  if (v21)
  {
LABEL_4:
    v26 = (void *)v23;
    v27 = objc_msgSend(v21, "compare:", v23) == 1;
    goto LABEL_8;
  }
LABEL_7:
  v26 = (void *)v23;
  v27 = 0;
LABEL_8:
  v136 = v16;
  v137 = v12;
  v134 = (void *)v22;
  v135 = v21;
  v133 = v26;
  if (v22)
    v22 = objc_msgSend((id)v22, "compare:", v26) == 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("corruptionSeen.hfd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("corruptionSeen.protected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("corruptionSeen.unprotected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("outOfSpaceSeen"));

  if ((_DWORD)v22)
    v32 = &unk_1E6DFACE8;
  else
    v32 = &unk_1E6DFAD00;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("deviceOutOfSpaceCount"));
  if (v24)
    v33 = &unk_1E6DFACE8;
  else
    v33 = &unk_1E6DFAD00;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, CFSTR("hfdCorruptionDailyCount"));
  if (v25 || v27)
    v34 = &unk_1E6DFACE8;
  else
    v34 = &unk_1E6DFAD00;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, CFSTR("sqliteCorruptionDailyCount"));
  v35 = objc_loadWeakRetained(v17);
  objc_msgSend(v35, "database");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v161[0] = 0;
  v37 = +[HDHealthEntity countOfObjectsWithPredicate:healthDatabase:error:](HDSourceEntity, "countOfObjectsWithPredicate:healthDatabase:error:", 0, v36, v161);
  v38 = v161[0];

  -[HDDatabaseDailyAnalytics _binnedAnalyticsValue:error:](self, "_binnedAnalyticsValue:error:", v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, CFSTR("numberOfSourceRows"));
  v40 = objc_loadWeakRetained(v17);
  objc_msgSend(v40, "database");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = 0;
  v42 = +[HDHealthEntity countOfObjectsWithPredicate:healthDatabase:error:](HDLogicalSourceEntity, "countOfObjectsWithPredicate:healthDatabase:error:", 0, v41, &v160);
  v43 = v160;

  -[HDDatabaseDailyAnalytics _binnedAnalyticsValue:error:](self, "_binnedAnalyticsValue:error:", v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v44, CFSTR("numberOfLogicalSourceRows"));
  v45 = objc_loadWeakRetained(v17);
  objc_msgSend(v45, "database");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = 0;
  v47 = +[HDHealthEntity countOfObjectsWithPredicate:healthDatabase:error:](HDLogicalSourceOrderEntity, "countOfObjectsWithPredicate:healthDatabase:error:", 0, v46, &v159);
  v48 = v159;

  -[HDDatabaseDailyAnalytics _binnedAnalyticsValue:error:](self, "_binnedAnalyticsValue:error:", v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v49, CFSTR("numberOfSourceOrderRows"));
  v50 = objc_loadWeakRetained(v17);
  objc_msgSend(v50, "database");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = 0;
  +[HDHealthEntity countDistinctForProperty:healthDatabase:error:](HDSourceEntity, "countDistinctForProperty:healthDatabase:error:", CFSTR("logical_source_id"), v51, &v158);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v158;
  v54 = objc_msgSend(v52, "integerValue");

  -[HDDatabaseDailyAnalytics _binnedAnalyticsValue:error:](self, "_binnedAnalyticsValue:error:", v54, v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v55, CFSTR("numberOfUniqueSources"));
  v56 = objc_loadWeakRetained(v17);
  objc_msgSend(v56, "database");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = 0;
  v58 = +[HDHealthEntity countOfObjectsWithPredicate:healthDatabase:error:](HDCachedQueryMetadataEntity, "countOfObjectsWithPredicate:healthDatabase:error:", 0, v57, &v157);
  v59 = v157;

  -[HDDatabaseDailyAnalytics _binnedAnalyticsValue:error:](self, "_binnedAnalyticsValue:error:", v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v60, CFSTR("numberOfQueriesUsingCachedData"));
  v61 = objc_loadWeakRetained(v17);
  objc_msgSend(v61, "database");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = 0;
  v63 = +[HDHealthEntity countOfObjectsWithPredicate:healthDatabase:error:](HDSampleAggregateCacheEntity, "countOfObjectsWithPredicate:healthDatabase:error:", 0, v62, &v156);
  v64 = v156;

  -[HDDatabaseDailyAnalytics _binnedAnalyticsValue:error:](self, "_binnedAnalyticsValue:error:", v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v140 = v8;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v65, CFSTR("cacheRowCount"));

  v66 = objc_loadWeakRetained(v17);
  objc_msgSend(v66, "database");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = 0;
  v68 = +[HDHealthEntity sizeOfDatabaseTableInHealthDatabase:error:](HDSampleAggregateCacheEntity, "sizeOfDatabaseTableInHealthDatabase:error:", v67, &v155);
  v69 = v155;

  -[HDDatabaseDailyAnalytics _binnedAnalyticsValue:error:](self, "_binnedAnalyticsValue:error:", v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v70, CFSTR("cacheSizeInKB"));
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("type"), &unk_1E6DFAD18);
  v71 = objc_claimAutoreleasedReturnValue();
  v132 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2592000.0);
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -7776000.0);
  v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -15552000.0);
  v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -31104000.0);
  v141 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -93312000.0);
  v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -155520000.0);
  v73 = (void *)MEMORY[0x1E0D29840];
  -[HDDatabaseDailyAnalytics _predicateForDeletedObjectsBetweenDate:andOlderDate:](self, "_predicateForDeletedObjectsBetweenDate:andOlderDate:", v132, v72);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = (void *)v71;
  objc_msgSend(v73, "compoundPredicateWithPredicate:otherPredicate:", v74, v71);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = (void *)MEMORY[0x1E0CB37E8];
  v77 = objc_loadWeakRetained(v17);
  objc_msgSend(v77, "database");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = 0;
  v79 = +[HDDataEntity countOfObjectsWithPredicate:healthDatabase:error:](HDDataEntity, "countOfObjectsWithPredicate:healthDatabase:error:", v75, v78, &v154);
  v80 = v154;
  objc_msgSend(v76, "numberWithInteger:", v79);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setObject:forKeyedSubscript:", v81, CFSTR("countDeletedSamplesOneToThreeMonthsOld"));

  v82 = (void *)MEMORY[0x1E0D29840];
  -[HDDatabaseDailyAnalytics _predicateForDeletedObjectsBetweenDate:andOlderDate:](self, "_predicateForDeletedObjectsBetweenDate:andOlderDate:", v72, v144);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "compoundPredicateWithPredicate:otherPredicate:", v83, v71);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = (void *)MEMORY[0x1E0CB37E8];
  v86 = objc_loadWeakRetained(v17);
  objc_msgSend(v86, "database");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v80;
  v88 = +[HDDataEntity countOfObjectsWithPredicate:healthDatabase:error:](HDDataEntity, "countOfObjectsWithPredicate:healthDatabase:error:", v84, v87, &v153);
  v89 = v153;

  objc_msgSend(v85, "numberWithInteger:", v88);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setObject:forKeyedSubscript:", v90, CFSTR("countDeletedSamplesThreeToSixMonthsOld"));

  v91 = (void *)MEMORY[0x1E0D29840];
  -[HDDatabaseDailyAnalytics _predicateForDeletedObjectsBetweenDate:andOlderDate:](self, "_predicateForDeletedObjectsBetweenDate:andOlderDate:", v144, v143);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "compoundPredicateWithPredicate:otherPredicate:", v92, v145);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = (void *)MEMORY[0x1E0CB37E8];
  v95 = objc_loadWeakRetained(v17);
  objc_msgSend(v95, "database");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v89;
  v97 = +[HDDataEntity countOfObjectsWithPredicate:healthDatabase:error:](HDDataEntity, "countOfObjectsWithPredicate:healthDatabase:error:", v93, v96, &v152);
  v131 = v152;

  objc_msgSend(v94, "numberWithInteger:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setObject:forKeyedSubscript:", v98, CFSTR("countDeletedSamplesSixToTwelveMonthsOld"));

  v99 = (void *)MEMORY[0x1E0D29840];
  -[HDDatabaseDailyAnalytics _predicateForDeletedObjectsBetweenDate:andOlderDate:](self, "_predicateForDeletedObjectsBetweenDate:andOlderDate:", v143, v141);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "compoundPredicateWithPredicate:otherPredicate:", v100, v145);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = (void *)MEMORY[0x1E0CB37E8];
  v102 = objc_loadWeakRetained(v17);
  objc_msgSend(v102, "database");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v131;
  v104 = +[HDDataEntity countOfObjectsWithPredicate:healthDatabase:error:](HDDataEntity, "countOfObjectsWithPredicate:healthDatabase:error:", v130, v103, &v151);
  v105 = v151;

  objc_msgSend(v101, "numberWithInteger:", v104);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setObject:forKeyedSubscript:", v106, CFSTR("countDeletedSamplesTwelveToThirtySixMonthsOld"));

  v107 = (void *)MEMORY[0x1E0D29840];
  -[HDDatabaseDailyAnalytics _predicateForDeletedObjectsBetweenDate:andOlderDate:](self, "_predicateForDeletedObjectsBetweenDate:andOlderDate:", v141, v142);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "compoundPredicateWithPredicate:otherPredicate:", v108, v145);
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = (void *)MEMORY[0x1E0CB37E8];
  v110 = objc_loadWeakRetained(v17);
  objc_msgSend(v110, "database");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v105;
  v112 = +[HDDataEntity countOfObjectsWithPredicate:healthDatabase:error:](HDDataEntity, "countOfObjectsWithPredicate:healthDatabase:error:", v147, v111, &v150);
  v113 = v150;

  objc_msgSend(v109, "numberWithInteger:", v112);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setObject:forKeyedSubscript:", v114, CFSTR("countDeletedSamplesThirtySixToSixtyMonthsOld"));

  v115 = (void *)MEMORY[0x1E0D29840];
  HDDataEntityPredicateForCreationDate(3);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "compoundPredicateWithPredicate:otherPredicate:", v116, v145);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = (void *)MEMORY[0x1E0CB37E8];
  v119 = objc_loadWeakRetained(v17);
  objc_msgSend(v119, "database");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v113;
  v121 = +[HDDataEntity countOfObjectsWithPredicate:healthDatabase:error:](HDDataEntity, "countOfObjectsWithPredicate:healthDatabase:error:", v117, v120, &v149);
  v122 = v149;

  objc_msgSend(v118, "numberWithInteger:", v121);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setObject:forKeyedSubscript:", v123, CFSTR("countDeletedSamplesGreaterThanSixtyMonthsOld"));

  v124 = (void *)MEMORY[0x1E0CB37E8];
  v125 = objc_loadWeakRetained(v17);
  objc_msgSend(v125, "database");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v122;
  v127 = +[HDDataEntity countOfObjectsWithPredicate:healthDatabase:error:](HDDataEntity, "countOfObjectsWithPredicate:healthDatabase:error:", v145, v126, &v148);
  v128 = v148;

  objc_msgSend(v124, "numberWithInteger:", v127);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setObject:forKeyedSubscript:", v129, CFSTR("totalCountDeletedSamples"));

  (*((void (**)(id, void *, _QWORD, _QWORD))v138 + 2))(v138, v140, 0, 0);
}

- (id)_predicateForDeletedObjectsBetweenDate:(id)a3 andOlderDate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  HDDataEntityPredicateForCreationDate(3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForCreationDate(5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_binnedAnalyticsValue:(int64_t)a3 error:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a4;
  if (!v5)
  {
    if (a3 <= 99)
    {
      v7 = 10;
      if (a3 >= 11)
        v7 = 10 * (a3 / 0xAu);
      if (a3)
        v8 = v7;
      else
        v8 = 0;
      goto LABEL_16;
    }
    if (a3 == 100)
    {
      v8 = 100;
LABEL_16:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if ((unint64_t)a3 < 0x3E9)
    {
      v9 = 100;
    }
    else
    {
      v8 = 1000000;
      if ((unint64_t)a3 >= 0xF4240)
        goto LABEL_16;
      v9 = 1000;
    }
    v8 = (uint64_t)((double)v9 * (double)(a3 / v9));
    goto LABEL_16;
  }
  v6 = &unk_1E6DFAD30;
LABEL_17:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialAsynchronousQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
