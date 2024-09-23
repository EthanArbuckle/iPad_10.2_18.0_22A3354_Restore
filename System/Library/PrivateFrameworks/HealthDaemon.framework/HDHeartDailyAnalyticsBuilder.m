@implementation HDHeartDailyAnalyticsBuilder

- (HDHeartDailyAnalyticsBuilder)initWithProfile:(id)a3 calendar:(id)a4 dateInterval:(id)a5 heartRateNotificationsUserDefaults:(id)a6 heartRhythmUserDefaults:(id)a7 remoteFeatureAvailabilityUserDefaults:(id)a8 pairedDeviceRegistry:(id)a9 areHealthNotificationsAuthorized:(BOOL)a10 isHealthDataSubmissionAllowed:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  HDHeartDailyAnalyticsBuilder *v20;
  HDHeartDailyAnalyticsBuilder *v21;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a9;
  v26.receiver = self;
  v26.super_class = (Class)HDHeartDailyAnalyticsBuilder;
  v20 = -[HDHeartDailyAnalyticsBuilder init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_profile, a3);
    objc_storeStrong((id *)&v21->_heartRateNotificationsUserDefaults, a6);
    objc_storeStrong((id *)&v21->_heartRhythmUserDefaults, a7);
    v21->_isHealthDataSubmissionAllowed = a11;
    objc_storeStrong((id *)&v21->_calendar, a4);
    objc_storeStrong((id *)&v21->_dateInterval, a5);
    objc_storeStrong((id *)&v21->_pairedDeviceRegistry, a9);
    v21->_areHealthNotificationsAuthorized = a10;
  }

  return v21;
}

- (id)heartDailyAnalyticsWithError:(id *)a3
{
  NSObject *v4;
  id v5;
  HDHeartDailyAnalytics *v6;
  HDHeartDailyAnalytics *heartDailyAnalytics;
  void *v8;
  void *v9;
  id v10;
  id v11;
  HDHeartDailyAnalytics *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSInteger v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  char v48;
  id v49;
  id v50;
  HDHeartDailyAnalytics *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  char v65;
  id v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  NSObject *v70;
  HDKeyValueDomain *v71;
  uint64_t v72;
  HDKeyValueDomain *v73;
  uint64_t v74;
  void *v75;
  id v76;
  NSObject *v77;
  uint64_t v78;
  HDKeyValueDomain *v79;
  id v80;
  NSObject *v81;
  HDKeyValueDomain *v82;
  uint64_t v83;
  void *v84;
  id v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  id v91;
  NSObject *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  char v103;
  id v104;
  void *v105;
  NSObject *v106;
  uint64_t v107;
  void *v108;
  NSObject *v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  id v113;
  void *v114;
  NSObject *v115;
  void *v116;
  NSCalendar *calendar;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  HDHeartDailyAnalytics *v122;
  HDHeartDailyAnalytics *v123;
  HDHeartDailyAnalytics *v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  BOOL v133;
  char v134;
  id v135;
  HDProfile *profile;
  NSDateInterval *dateInterval;
  uint64_t v138;
  id v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  id v144;
  id v145;
  void *v146;
  NSCalendar *v147;
  void *v148;
  void *v149;
  void *v150;
  HDHeartDailyAnalytics *v151;
  void *v152;
  void *v153;
  HDHeartDailyAnalytics *v154;
  void *v155;
  HDHeartDailyAnalytics *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  BOOL v162;
  char v163;
  HDHeartDailyAnalytics *v164;
  void *v165;
  id v166;
  id v167;
  HDHeartDailyAnalytics *v168;
  void *v169;
  HDHeartDailyAnalytics *v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  BOOL v176;
  char v177;
  HDHeartDailyAnalytics *v178;
  void *v179;
  id v180;
  BOOL v181;
  BOOL v182;
  void *v183;
  void *v185;
  NSObject *v186;
  id v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  void *v196;
  void *v197;
  void *v198;
  HDKeyValueDomain *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  uint64_t v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  uint8_t v211[4];
  id v212;
  __int128 buf;
  uint64_t (*v214)(uint64_t, uint64_t);
  void *v215;
  id v216;
  id v217;
  id v218;
  void *v219;
  uint64_t v220;

  v220 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogAnalytics();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v5 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Building heart daily analytics", (uint8_t *)&buf, 0xCu);

  }
  v6 = objc_alloc_init(HDHeartDailyAnalytics);
  heartDailyAnalytics = self->_heartDailyAnalytics;
  self->_heartDailyAnalytics = v6;

  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v9;
  v12 = self->_heartDailyAnalytics;
  -[HDHeartDailyAnalytics updateIrregularRhythmNotificationClassificationCount:](v12, "updateIrregularRhythmNotificationClassificationCount:", -1);
  -[HDHeartDailyAnalytics updateIsIrnOnboarded:](v12, "updateIsIrnOnboarded:", 0);
  -[HDHeartDailyAnalytics updateIsEcgOnboarded:](v12, "updateIsEcgOnboarded:", 0);
  -[HDProfile profileExtensionWithIdentifier:](self->_profile, "profileExtensionWithIdentifier:", CFSTR("Heart"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "featureAvailabilityExtensionForFeatureIdentifier:", *MEMORY[0x1E0CB5038]);
  v209 = 0;
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "featureOnboardingRecordWithError:", &v209);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v209;
  v204 = v15;
  v205 = (uint64_t)v10;
  if (v14)
  {
    -[HDHeartDailyAnalytics updateIsIrnOnboarded:](v12, "updateIsIrnOnboarded:", objc_msgSend(v14, "isOnboardingPresent"));
  }
  else
  {
    v16 = v15;
    _HKInitializeLogging();
    HKLogAnalytics();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Could not load IRN onboarding record with error: %{public}@", (uint8_t *)&buf, 0xCu);
    }

  }
  v18 = *MEMORY[0x1E0CB4D30];
  -[NSUserDefaults objectForKey:](self->_heartRhythmUserDefaults, "objectForKey:", *MEMORY[0x1E0CB4D30]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    -[HDHeartDailyAnalytics updateIsEcgOnboarded:](v12, "updateIsEcgOnboarded:", objc_msgSend(v19, "integerValue") > 0);
  -[NSUserDefaults objectForKey:](self->_heartRhythmUserDefaults, "objectForKey:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21 || objc_msgSend(v21, "integerValue") < 1)
    goto LABEL_19;
  v23 = objc_msgSend(v22, "integerValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(MEMORY[0x1E0CB6658], "algorithmVersionForOnboardingVersion:", v23));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24 || objc_msgSend(v24, "integerValue") <= 0)
  {

LABEL_19:
    goto LABEL_20;
  }
  objc_msgSend(v25, "stringValue");
  v26 = objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v196 = v14;
    -[HDHeartDailyAnalytics updateECGActiveAlgorithmVersion:](v12, "updateECGActiveAlgorithmVersion:", v26);
    objc_msgSend(MEMORY[0x1E0CB6A08], "productBuildVersionForDeviceType:", 0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
        -[HDHeartDailyAnalytics updateECGUpdateVersionPhone:](v12, "updateECGUpdateVersionPhone:", v28);
    }
    else
    {
      _HKInitializeLogging();
      HKLogAnalytics();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "Could not determine ECGUpdateVersionPhone", (uint8_t *)&buf, 2u);
      }
    }

    objc_msgSend(MEMORY[0x1E0CB6A08], "productBuildVersionForDeviceType:", 1);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    if (v185)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v26, v185);
      v186 = objc_claimAutoreleasedReturnValue();
      if (v186)
        -[HDHeartDailyAnalytics updateECGUpdateVersionWatch:](v12, "updateECGUpdateVersionWatch:", v186);
    }
    else
    {
      _HKInitializeLogging();
      HKLogAnalytics();
      v186 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1B7802000, v186, OS_LOG_TYPE_ERROR, "Could not determine ECGUpdateVersionWatch", (uint8_t *)&buf, 2u);
      }
    }

    v14 = v196;
    v29 = (void *)v26;
    goto LABEL_23;
  }
LABEL_20:
  _HKInitializeLogging();
  HKLogAnalytics();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "Could not determine ECGAlgorithmVersion", (uint8_t *)&buf, 2u);
  }
  v29 = 0;
LABEL_23:
  v203 = v20;

  v30 = *MEMORY[0x1E0CB4608];
  v31 = -[NSUserDefaults integerForKey:](self->_remoteFeatureAvailabilityUserDefaults, "integerForKey:", *MEMORY[0x1E0CB4608]);
  if ((v31 & 0x8000000000000000) == 0)
    -[HDHeartDailyAnalytics updateCountMobileAssetsDownloadedPast24Hours:](v12, "updateCountMobileAssetsDownloadedPast24Hours:", v31);
  -[NSUserDefaults setInteger:forKey:](self->_remoteFeatureAvailabilityUserDefaults, "setInteger:forKey:", 0, v30);
  -[NSUserDefaults objectForKey:](self->_heartRateNotificationsUserDefaults, "objectForKey:", *MEMORY[0x1E0CB76D0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHeartDailyAnalytics updateIsAtrialFibrillationEnabled:](v12, "updateIsAtrialFibrillationEnabled:", v32);
  -[NRPairedDeviceRegistry getActivePairedDevice](self->_pairedDeviceRegistry, "getActivePairedDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "valueForProperty:", *MEMORY[0x1E0D51738]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHeartDailyAnalytics updateActiveWatchProductType:](v12, "updateActiveWatchProductType:", v34);

  objc_msgSend(v33, "valueForProperty:", *MEMORY[0x1E0D51760]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHeartDailyAnalytics updateActiveWatchSystemBuildVersion:](v12, "updateActiveWatchSystemBuildVersion:", v35);

  if (!self->_isHealthDataSubmissionAllowed)
  {
    -[HDHeartDailyAnalytics updateIsImproveHealthAndActivityAllowed:](v12, "updateIsImproveHealthAndActivityAllowed:", 0);
    v51 = v12;
    v52 = v203;
    v53 = (void *)v205;
    goto LABEL_97;
  }
  v191 = v33;
  v193 = v32;
  v194 = v29;
  v197 = v14;
  v198 = v13;
  -[HDHeartDailyAnalytics updateIsImproveHealthAndActivityAllowed:](v12, "updateIsImproveHealthAndActivityAllowed:", 1);
  -[HDHeartDailyAnalyticsBuilder _ecgClassificationsBetweenStartDate:endDate:]((uint64_t)self, v205, v11);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHeartDailyAnalytics updateElectrocardiogramClassificationCount:](v12, "updateElectrocardiogramClassificationCount:", objc_msgSend(v201, "count"));
  v195 = v11;
  v36 = v11;
  HDSampleEntityPredicateForStartDate(6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate(4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x1E0D29840];
  v218 = v37;
  v219 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v218, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "predicateMatchingAllPredicates:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6380], "atrialFibrillationEventType");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSampleEntity entityEnumeratorWithType:profile:](HDCategorySampleEntity, "entityEnumeratorWithType:profile:", v42, self->_profile);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "setPredicate:", v41);
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v217, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setOrderingTerms:", v45);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = 0;
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v214 = __69__HDHeartDailyAnalyticsBuilder__aFibSamplesBetweenStartDate_endDate___block_invoke;
  v215 = &unk_1E6CF89B8;
  v47 = v46;
  v216 = v47;
  v48 = objc_msgSend(v43, "enumerateWithError:handler:", &v210, &buf);
  v49 = v210;
  if ((v48 & 1) != 0)
  {
    v50 = v47;
  }
  else
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v211 = 138543362;
      v212 = v49;
      _os_log_error_impl(&dword_1B7802000, v54, OS_LOG_TYPE_ERROR, "Error querying atrial fibrillation samples: %{public}@", v211, 0xCu);
    }

    v50 = (id)MEMORY[0x1E0C9AA60];
  }

  v190 = v50;
  -[HDHeartDailyAnalytics updateIrregularRhythmNotificationClassificationCount:](v12, "updateIrregularRhythmNotificationClassificationCount:", objc_msgSend(v50, "count"));
  v55 = v36;
  HDSampleEntityPredicateForStartDate(6);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate(4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x1E0D29840];
  v218 = v56;
  v219 = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v218, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "predicateMatchingAllPredicates:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSampleEntity entityEnumeratorWithType:profile:](HDCategorySampleEntity, "entityEnumeratorWithType:profile:", v61, self->_profile);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "setPredicate:", v60);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = 0;
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v214 = __81__HDHeartDailyAnalyticsBuilder__countRecordedTachogramsBetweenStartDate_endDate___block_invoke;
  v215 = &unk_1E6CF89B8;
  v64 = v63;
  v216 = v64;
  v65 = objc_msgSend(v62, "enumerateWithError:handler:", &v217, &buf);
  v66 = v217;
  v67 = v66;
  if ((v65 & 1) != 0 || !v66)
  {
    v69 = objc_msgSend(v64, "count");
  }
  else
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v211 = 138543362;
      v212 = v67;
      _os_log_error_impl(&dword_1B7802000, v68, OS_LOG_TYPE_ERROR, "Error querying tacogram samples: %{public}@", v211, 0xCu);
    }

    v69 = -1;
  }

  if (v69 < 0)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1B7802000, v70, OS_LOG_TYPE_ERROR, "Unable to retrieve countRecordedTachograms", (uint8_t *)&buf, 2u);
    }

  }
  else
  {
    -[HDHeartDailyAnalytics updateCountRecordedTachogramsPast24Hours:](v12, "updateCountRecordedTachogramsPast24Hours:", v69);
  }
  v71 = [HDKeyValueDomain alloc];
  v72 = *MEMORY[0x1E0CB7700];
  v73 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v71, "initWithCategory:domainName:profile:", 105, *MEMORY[0x1E0CB7700], self->_profile);
  v74 = *MEMORY[0x1E0CB4600];
  v218 = 0;
  -[HDKeyValueDomain numberForKey:error:](v73, "numberForKey:error:", v74, &v218);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v218;
  if (v76)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v76;
      _os_log_error_impl(&dword_1B7802000, v77, OS_LOG_TYPE_ERROR, "Failed to get CountAnalyzedTacogramsPast24Hours, error: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v78 = -1;
  }
  else
  {
    v78 = objc_msgSend(v75, "integerValue");
  }

  if (v78 < 0)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v79 = (HDKeyValueDomain *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v79->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1B7802000, &v79->super, OS_LOG_TYPE_ERROR, "Unable to retrieve countAnalyzedTachograms", (uint8_t *)&buf, 2u);
    }
    goto LABEL_57;
  }
  -[HDHeartDailyAnalytics updateCountAnalyzedTachogramsPast24Hours:](v12, "updateCountAnalyzedTachogramsPast24Hours:", v78);
  if (v78)
  {
    v79 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 105, v72, self->_profile);
    v218 = 0;
    -[HDKeyValueDomain setNumber:forKey:error:](v79, "setNumber:forKey:error:", 0, v74, &v218);
    v80 = v218;
    if (v80)
    {
      _HKInitializeLogging();
      HKLogAnalytics();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v80;
        _os_log_error_impl(&dword_1B7802000, v81, OS_LOG_TYPE_ERROR, "Failed to reset CountAnalyzedTacogramsPast24Hours, error: %{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
LABEL_57:

  }
  v82 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 105, v72, self->_profile);
  if (v203 && objc_msgSend(v203, "integerValue") >= 1)
  {
    v83 = *MEMORY[0x1E0CB4D20];
    v210 = 0;
    -[HDKeyValueDomain stringForKey:error:](v82, "stringForKey:error:", v83, &v210);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v210;
    v86 = v85;
    if (v84)
    {
      -[HDHeartDailyAnalytics updateECGOnboardingCountryCode:](v12, "updateECGOnboardingCountryCode:", v84);
    }
    else if (v85)
    {
      _HKInitializeLogging();
      HKLogAnalytics();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v86;
        _os_log_error_impl(&dword_1B7802000, v87, OS_LOG_TYPE_ERROR, "Error getting ECGOnboardingCountryCode: %{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  v88 = *MEMORY[0x1E0CB4798];
  v208 = 0;
  -[HDKeyValueDomain stringForKey:error:](v82, "stringForKey:error:", v88, &v208);
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = v208;
  v91 = v90;
  v189 = (void *)v89;
  if (v89)
  {
    -[HDHeartDailyAnalytics updateIRNOnboardingCountryCode:](v12, "updateIRNOnboardingCountryCode:", v89);
  }
  else if (v90)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v91;
      _os_log_error_impl(&dword_1B7802000, v92, OS_LOG_TYPE_ERROR, "Error getting IRNCountryCodeError: %{public}@", (uint8_t *)&buf, 0xCu);
    }

  }
  v188 = v91;
  v200 = v82;
  v93 = v55;
  HDSampleEntityPredicateForStartDate(6);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate(4);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v93;

  v96 = (void *)MEMORY[0x1E0D29840];
  v218 = v94;
  v219 = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v218, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "predicateMatchingAllPredicates:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSampleEntity entityEnumeratorWithType:profile:](HDCategorySampleEntity, "entityEnumeratorWithType:profile:", v99, self->_profile);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setPredicate:", v98);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = 0;
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v214 = __82__HDHeartDailyAnalyticsBuilder__countActiveEnergySamplesBetweenStartDate_endDate___block_invoke;
  v215 = &unk_1E6CF89B8;
  v102 = v101;
  v216 = v102;
  v103 = objc_msgSend(v100, "enumerateWithError:handler:", &v217, &buf);
  v104 = v217;
  v105 = v104;
  if ((v103 & 1) != 0 || !v104)
  {
    v107 = objc_msgSend(v102, "count");
  }
  else
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v211 = 138543362;
      v212 = v105;
      _os_log_error_impl(&dword_1B7802000, v106, OS_LOG_TYPE_ERROR, "Error querying ActiveEnergyBurned samples: %{public}@", v211, 0xCu);
    }

    v107 = -1;
  }

  if (v107 < 0)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v109 = objc_claimAutoreleasedReturnValue();
    v108 = v204;
    v33 = v191;
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1B7802000, v109, OS_LOG_TYPE_ERROR, "wasWatchWornPast24Hours could not be determined", (uint8_t *)&buf, 2u);
    }

  }
  else
  {
    -[HDHeartDailyAnalytics updateWasWatchWornPast24Hours:](v12, "updateWasWatchWornPast24Hours:", v107 != 0);
    v108 = v204;
    v33 = v191;
  }

  v110 = *MEMORY[0x1E0CB4D10];
  v218 = 0;
  -[HDKeyValueDomain dateForKey:error:](v200, "dateForKey:error:", v110, &v218);
  v111 = objc_claimAutoreleasedReturnValue();
  v112 = v218;
  v113 = v112;
  v192 = (void *)v111;
  if (v111 && !v112)
  {
    -[HDHeartDailyAnalytics updateIsEcgOnboarded:](v12, "updateIsEcgOnboarded:", 1);
    -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 0x2000, v111, v187, 0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0;
    if (objc_msgSend(v114, "weekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v114, "weekOfYear"));
      v115 = objc_claimAutoreleasedReturnValue();
    }

    -[HDHeartDailyAnalytics updateWeeksSinceElectrocardiogramOnboarded:](v12, "updateWeeksSinceElectrocardiogramOnboarded:", v115);
LABEL_92:

    goto LABEL_93;
  }
  if (v112)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v113;
      _os_log_error_impl(&dword_1B7802000, v115, OS_LOG_TYPE_ERROR, "Error getting electrocardiogramFirstOnboardedCompletedDate: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_92;
  }
LABEL_93:
  -[HDHeartDailyAnalytics updateWithElectrocardiogramClassifications:isWithin24HoursPostIRN:](v12, "updateWithElectrocardiogramClassifications:isWithin24HoursPostIRN:", v201, 0);
  v204 = v113;
  if (objc_msgSend(v190, "count"))
  {
    objc_msgSend(v190, "firstObject");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    calendar = self->_calendar;
    objc_msgSend(v116, "startDate");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateByAddingUnit:value:toDate:options:](calendar, "dateByAddingUnit:value:toDate:options:", 16, 1, v118, 0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v116, "startDate");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHeartDailyAnalyticsBuilder _ecgClassificationsBetweenStartDate:endDate:]((uint64_t)self, (uint64_t)v120, v119);
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDHeartDailyAnalytics updateWithElectrocardiogramClassifications:isWithin24HoursPostIRN:](v12, "updateWithElectrocardiogramClassifications:isWithin24HoursPostIRN:", v121, 1);
    v122 = v12;
    v123 = v12;

  }
  else
  {
    v122 = v12;
    v124 = v12;
  }
  v14 = v197;
  v52 = v203;
  v32 = v193;
  v29 = v194;

  v53 = (void *)v205;
  v11 = v195;
  v12 = v122;
  v13 = v198;
LABEL_97:

  if (!self->_isHealthDataSubmissionAllowed)
  {
    v128 = 0;
    goto LABEL_112;
  }
  -[HDProfile ageGatingManager](self->_profile, "ageGatingManager");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  objc_msgSend(v125, "ageInYearsWithError:", &buf);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (id)buf;

  if (v126 || !v127)
  {
    -[HDHeartDailyAnalytics updateAgeInYears:](self->_heartDailyAnalytics, "updateAgeInYears:", v126);
    objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49C0]);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDProfile userCharacteristicsManager](self->_profile, "userCharacteristicsManager");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = v127;
    objc_msgSend(v130, "userCharacteristicForType:error:", v129, &v218);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v218;

    if (v131)
      v133 = 1;
    else
      v133 = v132 == 0;
    v134 = v133;
    if (v133)
    {
      -[HDHeartDailyAnalytics updateSex:](self->_heartDailyAnalytics, "updateSex:", objc_msgSend(v131, "integerValue"));
      v128 = 0;
    }
    else
    {
      v128 = objc_retainAutorelease(v132);
    }

    if ((v134 & 1) == 0)
      goto LABEL_116;
LABEL_112:
    v135 = v128;
    -[HDHeartDailyAnalytics updateAreHealthNotificationsAuthorized:](self->_heartDailyAnalytics, "updateAreHealthNotificationsAuthorized:", self->_areHealthNotificationsAuthorized);
    if (!self->_isHealthDataSubmissionAllowed)
    {
      v144 = v135;

LABEL_121:
      -[HDProfile periodicCountryMonitor](self->_profile, "periodicCountryMonitor");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = self->_calendar;
      -[NSDateInterval endDate](self->_dateInterval, "endDate");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar dateByAddingUnit:value:toDate:options:](v147, "dateByAddingUnit:value:toDate:options:", 16, 2, v148, 0);
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v146, "lastCheckAttemptDate");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      if (v150)
      {
        v151 = self->_heartDailyAnalytics;
        -[HDHeartDailyAnalyticsBuilder _daysBetweenStartDate:endDate:](self->_calendar, (uint64_t)v150, (uint64_t)v149);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDHeartDailyAnalytics updateDaysSinceLastCountryMonitorCheck:](v151, "updateDaysSinceLastCountryMonitorCheck:", v152);

      }
      objc_msgSend(v146, "lastFetchAttemptDate");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      if (v153)
      {
        v154 = self->_heartDailyAnalytics;
        -[HDHeartDailyAnalyticsBuilder _daysBetweenStartDate:endDate:](self->_calendar, (uint64_t)v153, (uint64_t)v149);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDHeartDailyAnalytics updateDaysSinceLastCountryMonitorFetch:](v154, "updateDaysSinceLastCountryMonitorFetch:", v155);

      }
      v156 = self->_heartDailyAnalytics;
      objc_msgSend(v146, "lastFetchAttemptBuild");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDHeartDailyAnalytics updateLastCountryMonitorFetchBuildNumber:](v156, "updateLastCountryMonitorFetchBuildNumber:", v157);

      v158 = (void *)*MEMORY[0x1E0CB5028];
      *(_QWORD *)&buf = 0;
      -[HDHeartDailyAnalyticsBuilder _mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:error:](self->_profile, v158, (uint64_t)&buf);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = (id)buf;
      v161 = v160;
      if (v159)
        v162 = 1;
      else
        v162 = v160 == 0;
      v163 = v162;
      if (v162)
      {
        -[HDHeartDailyAnalytics updateIsGlucoseEnhancedChartingDelivered:](self->_heartDailyAnalytics, "updateIsGlucoseEnhancedChartingDelivered:", v159 != 0);
        v166 = v144;
        if (self->_isHealthDataSubmissionAllowed)
        {
          v164 = self->_heartDailyAnalytics;
          objc_msgSend(v159, "countryCode");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDHeartDailyAnalytics updateGlucoseEnhancedChartingCountryCode:](v164, "updateGlucoseEnhancedChartingCountryCode:", v165);

          v166 = v144;
        }
      }
      else
      {
        v166 = objc_retainAutorelease(v160);
      }

      v167 = v166;
      if ((v163 & 1) == 0)
        goto LABEL_153;
      if (self->_isHealthDataSubmissionAllowed)
      {
        -[HDHeartDailyAnalytics updateIsTachycardiaDetectionEnabled:](self->_heartDailyAnalytics, "updateIsTachycardiaDetectionEnabled:", -[NSUserDefaults BOOLForKey:](self->_heartRateNotificationsUserDefaults, "BOOLForKey:", *MEMORY[0x1E0CB76E8]));
        -[HDHeartDailyAnalytics updateIsBradycardiaDetectionEnabled:](self->_heartDailyAnalytics, "updateIsBradycardiaDetectionEnabled:", -[NSUserDefaults BOOLForKey:](self->_heartRateNotificationsUserDefaults, "BOOLForKey:", *MEMORY[0x1E0CB76D8]));
        v168 = self->_heartDailyAnalytics;
        -[NSUserDefaults hk_safeNumberForKeyPath:error:](self->_heartRateNotificationsUserDefaults, "hk_safeNumberForKeyPath:error:", *MEMORY[0x1E0CB76F0], 0);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDHeartDailyAnalytics updateHighHeartRateNotificationThreshold:](v168, "updateHighHeartRateNotificationThreshold:", v169);

        v170 = self->_heartDailyAnalytics;
        -[NSUserDefaults hk_safeNumberForKeyPath:error:](self->_heartRateNotificationsUserDefaults, "hk_safeNumberForKeyPath:error:", *MEMORY[0x1E0CB76C8], 0);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDHeartDailyAnalytics updateLowHeartRateNotificationThreshold:](v170, "updateLowHeartRateNotificationThreshold:", v171);

      }
      v172 = (void *)*MEMORY[0x1E0CB5070];
      *(_QWORD *)&buf = 0;
      -[HDHeartDailyAnalyticsBuilder _mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:error:](self->_profile, v172, (uint64_t)&buf);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = (id)buf;
      v175 = v174;
      if (v173)
        v176 = 1;
      else
        v176 = v174 == 0;
      v177 = v176;
      if (v176)
      {
        -[HDHeartDailyAnalytics updateIsMenstrualCyclesHeartRateInputDelivered:](self->_heartDailyAnalytics, "updateIsMenstrualCyclesHeartRateInputDelivered:", v173 != 0);
        v180 = v167;
        if (self->_isHealthDataSubmissionAllowed)
        {
          v178 = self->_heartDailyAnalytics;
          objc_msgSend(v173, "countryCode");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDHeartDailyAnalytics updateMenstrualCyclesHeartRateInputCountryCode:](v178, "updateMenstrualCyclesHeartRateInputCountryCode:", v179);

          v180 = v167;
        }
      }
      else
      {
        v180 = objc_retainAutorelease(v174);
      }

      v144 = v180;
      if ((v177 & 1) != 0)
      {
        v207 = v144;
        v181 = -[HDHeartDailyAnalyticsBuilder _buildIrregularRhythmNotificationsV2AnalyticsWithError:]((uint64_t)self, &v207);
        v167 = v207;

        if (v181 && -[HDHeartDailyAnalyticsBuilder _buildOTAFeatureAvailabilityAnalyticsWithError:]((uint64_t)self))
        {
          v206 = v167;
          v182 = -[HDHeartDailyAnalyticsBuilder _buildRespiratoryRateAnalyticsWithError:]((uint64_t)self, &v206);
          v144 = v206;

          if (v182)
          {
            v183 = (void *)-[HDHeartDailyAnalytics copy](self->_heartDailyAnalytics, "copy");
            goto LABEL_160;
          }
          goto LABEL_154;
        }
LABEL_153:
        v143 = v167;
        goto LABEL_155;
      }
LABEL_154:
      v143 = v144;
      goto LABEL_155;
    }
    profile = self->_profile;
    dateInterval = self->_dateInterval;
    *(_QWORD *)&buf = 0;
    HDAnalyticsBucketedNumberOfStandAndIdleHours(profile, dateInterval, &buf);
    v138 = objc_claimAutoreleasedReturnValue();
    v139 = (id)buf;
    v140 = v139;
    if (v138)
    {
      -[HDHeartDailyAnalytics updateNumberOfStandAndIdleHoursInPreviousCalendarDay:](self->_heartDailyAnalytics, "updateNumberOfStandAndIdleHoursInPreviousCalendarDay:", v138);
      v141 = (void *)v138;
    }
    else
    {
      v145 = v139;
      v141 = v145;
      if (v145)
      {
        v142 = objc_retainAutorelease(v145);
LABEL_120:

        v144 = v142;
        if (!v138)
          goto LABEL_154;
        goto LABEL_121;
      }
    }
    v142 = v135;
    goto LABEL_120;
  }
  v128 = objc_retainAutorelease(v127);

LABEL_116:
  v143 = v128;
LABEL_155:
  v144 = v143;
  if (v143)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v143);
    else
      _HKLogDroppedError();
  }

  v183 = 0;
LABEL_160:

  return v183;
}

- (BOOL)_buildIrregularRhythmNotificationsV2AnalyticsWithError:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v20;
  id v21;

  if (!a1)
    return 0;
  v4 = (void *)*MEMORY[0x1E0CB5048];
  v21 = 0;
  -[HDHeartDailyAnalyticsBuilder _mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:error:](*(void **)(a1 + 8), v4, (uint64_t)&v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (!v8)
  {
    if (a2)
    {
      v11 = objc_retainAutorelease(v6);
      v12 = 0;
      *a2 = v11;
    }
    else
    {
      _HKLogDroppedError();
      v12 = 0;
      v11 = v7;
    }
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 8), "featureSettingsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  objc_msgSend(v9, "featureSettingsForFeatureIdentifier:error:", v4, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  v12 = v10 != 0;
  if (v10)
  {
    if (v5)
      v13 = &unk_1E6DFC470;
    else
      v13 = 0;
    objc_msgSend(*(id *)(a1 + 16), "updateAlgorithmVersionIRN:", v13);
    v14 = *(void **)(a1 + 16);
    objc_msgSend(v10, "numberForKey:error:", *MEMORY[0x1E0CB50C8], 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateIsAtrialFibrillationEnabledV2:", v15);

    if (!*(_BYTE *)(a1 + 48))
      goto LABEL_21;
    v16 = *(void **)(a1 + 16);
    objc_msgSend(v5, "countryCode");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateAtrialFibrillationDetectionV2CountryCode:", v17);
  }
  else
  {
    v18 = v11;
    v17 = v18;
    if (v18)
    {
      if (a2)
      {
        v17 = objc_retainAutorelease(v18);
        *a2 = v17;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
  }

LABEL_21:
LABEL_22:

  return v12;
}

- (BOOL)_buildOTAFeatureAvailabilityAnalyticsWithError:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "daemon");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "OTAFeatureAvailabilityManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 16);
    objc_msgSend(v3, "factorPackID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateOTAFactorPackID:", v5);

  }
  return a1 != 0;
}

- (BOOL)_buildRespiratoryRateAnalyticsWithError:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _BOOL8 v14;
  void *v15;
  id v16;
  id v17;
  id v19;
  id v20;

  if (!a1)
    return 0;
  v4 = (void *)*MEMORY[0x1E0CB5088];
  v20 = 0;
  -[HDHeartDailyAnalyticsBuilder _mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:error:](*(void **)(a1 + 8), v4, (uint64_t)&v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v20;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 16), "updateIsRespiratoryRateDelivered:", v5 != 0);
    if (*(_BYTE *)(a1 + 48))
    {
      v9 = *(void **)(a1 + 16);
      objc_msgSend(v5, "countryCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateRespiratoryRateCountryCode:", v10);

    }
    objc_msgSend(*(id *)(a1 + 8), "featureSettingsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    objc_msgSend(v11, "featureSettingsForFeatureIdentifier:error:", v4, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;

    v14 = v12 != 0;
    if (v12)
    {
      v15 = *(void **)(a1 + 16);
      objc_msgSend(v12, "numberForKey:error:", *MEMORY[0x1E0CB50C8], 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateIsRespiratoryRateEnabledInPrivacy:", v16);
    }
    else
    {
      v17 = v13;
      v16 = v17;
      if (v17)
      {
        if (a2)
        {
          v16 = objc_retainAutorelease(v17);
          *a2 = v16;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }

  }
  else if (a2)
  {
    v13 = objc_retainAutorelease(v6);
    v14 = 0;
    *a2 = v13;
  }
  else
  {
    _HKLogDroppedError();
    v14 = 0;
    v13 = v7;
  }

  return v14;
}

- (id)_daysBetweenStartDate:(uint64_t)a3 endDate:
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "components:fromDate:toDate:options:", 16, a2, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (objc_msgSend(v3, "day") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "day"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  objc_msgSend(a1, "onboardingCompletionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onboardingCompletionsForHighestVersionOfFeatureIdentifier:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "hk_firstSortedObjectWithComparison:", &__block_literal_global_97);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __106__HDHeartDailyAnalyticsBuilder__mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "completionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __69__HDHeartDailyAnalyticsBuilder__aFibSamplesBetweenStartDate_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

uint64_t __82__HDHeartDailyAnalyticsBuilder__countActiveEnergySamplesBetweenStartDate_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

uint64_t __81__HDHeartDailyAnalyticsBuilder__countRecordedTachogramsBetweenStartDate_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (id)_ecgClassificationsBetweenStartDate:(void *)a3 endDate:
{
  id v4;
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
  id v15;
  char v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HDSampleEntityPredicateForStartDate(6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate(4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D29840];
  v27[0] = v5;
  v27[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateMatchingAllPredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6680], "electrocardiogramType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSampleEntity entityEnumeratorWithType:profile:](HDCategorySampleEntity, "entityEnumeratorWithType:profile:", v10, *(_QWORD *)(a1 + 8));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v9);
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOrderingTerms:", v13);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__HDHeartDailyAnalyticsBuilder__ecgClassificationsBetweenStartDate_endDate___block_invoke;
  v21[3] = &unk_1E6CF89B8;
  v15 = v14;
  v22 = v15;
  v16 = objc_msgSend(v11, "enumerateWithError:handler:", &v23, v21);
  v17 = v23;
  if ((v16 & 1) != 0)
  {
    v18 = v15;
  }
  else
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Error querying electrocardiogram samples: %{public}@", buf, 0xCu);
    }

    v18 = (id)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

uint64_t __76__HDHeartDailyAnalyticsBuilder__ecgClassificationsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "privateClassification"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)v3;
  else
    v4 = &unk_1E6DFC488;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_remoteFeatureAvailabilityUserDefaults, 0);
  objc_storeStrong((id *)&self->_heartRhythmUserDefaults, 0);
  objc_storeStrong((id *)&self->_heartRateNotificationsUserDefaults, 0);
  objc_storeStrong((id *)&self->_heartDailyAnalytics, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
