@implementation HDDemoDataHeartSampleGenerator

- (HDDemoDataHeartSampleGenerator)init
{
  HDDemoDataHeartSampleGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataHeartSampleGenerator;
  result = -[HDDemoDataBaseSampleGenerator init](&v3, sel_init);
  if (result)
  {
    result->_nextRestingHeartRateSampleTime = 0.0;
    result->_nextWalkingHeartRateAverageSampleTime = 0.341666667;
    result->_nextElectrocardiogramSampleTime = 0.375;
    result->_nextElectrocardiogramClassification = 3;
    result->_lastRestingHeartRate = 0.0;
    result->_lastWalkingHeartRateAverage = 0.0;
    result->_nextVO2MaxSampleTime = 0.486805556;
    result->_lastVO2MaxValue = 0.0;
    result->_meanVO2MaxValue = 0.0;
    result->_lastVO2MaxWorkoutWasActive = 0;
    result->_lastHeartRateRecoveryValue = 0.0;
    result->_lastHeartRateRecoveryWorkoutWasActive = 0;
  }
  return result;
}

- (HDDemoDataHeartSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataHeartSampleGenerator *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDDemoDataHeartSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataHeartSampleGeneratorNextRestingHeartRateSampleTimeKey"));
    v5->_nextRestingHeartRateSampleTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataHeartSampleGeneratorNextWalkingHeartRateAverageSampleTimeKey"));
    v5->_nextWalkingHeartRateAverageSampleTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataHeartSampleGeneratorNextElectrocardiogramSampleTimeKey"));
    v5->_nextElectrocardiogramSampleTime = v8;
    v5->_nextElectrocardiogramClassification = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HDDemoDataHeartSampleGeneratorNextElectrocardiogramClassificationKey"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastRestingHeartRateSampleKey"));
    v5->_lastRestingHeartRate = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastWalkingHeartRateAverageSampleKey"));
    v5->_lastWalkingHeartRateAverage = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataHeartSampleGeneratorNextVO2MaxSampleTimeKey"));
    v5->_nextVO2MaxSampleTime = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastVO2MaxSampleKey"));
    v5->_lastVO2MaxValue = v12;
    v5->_lastVO2MaxWorkoutWasActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastVO2MaxWorkoutWasActiveKey"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastHeartRateRecoverySampleKey"));
    v5->_lastHeartRateRecoveryValue = v13;
    v5->_lastHeartRateRecoveryWorkoutWasActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastHeartRateRecoveryWorkoutWasActiveKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataHeartSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataHeartSampleGeneratorNextRestingHeartRateSampleTimeKey"), self->_nextRestingHeartRateSampleTime, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataHeartSampleGeneratorNextWalkingHeartRateAverageSampleTimeKey"), self->_nextWalkingHeartRateAverageSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataHeartSampleGeneratorNextElectrocardiogramSampleTimeKey"), self->_nextElectrocardiogramSampleTime);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_nextElectrocardiogramClassification, CFSTR("HDDemoDataHeartSampleGeneratorNextElectrocardiogramClassificationKey"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastRestingHeartRateSampleKey"), self->_lastRestingHeartRate);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastWalkingHeartRateAverageSampleKey"), self->_lastWalkingHeartRateAverage);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataHeartSampleGeneratorNextVO2MaxSampleTimeKey"), self->_nextVO2MaxSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastVO2MaxSampleKey"), self->_lastVO2MaxValue);
  objc_msgSend(v4, "encodeBool:forKey:", self->_lastVO2MaxWorkoutWasActive, CFSTR("HDDemoDataHeartSampleGeneratorLastVO2MaxWorkoutWasActiveKey"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataHeartSampleGeneratorLastHeartRateRecoverySampleKey"), self->_lastHeartRateRecoveryValue);
  objc_msgSend(v4, "encodeBool:forKey:", self->_lastHeartRateRecoveryWorkoutWasActive, CFSTR("HDDemoDataHeartSampleGeneratorLastHeartRateRecoveryWorkoutWasActiveKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setProfile:(id)a3 provenance:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDDemoDataHeartSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setProfile:](&v4, sel_setProfile_, a3, a4);
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HDDemoDataHeartSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v18, sel_setupWithDemoDataGenerator_, v4);
  objc_msgSend(v4, "demoPerson", v18.receiver, v18.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generatorState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v7;
  if (self)
  {
    objc_msgSend(v8, "birthDateComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HDDemoData_ageBetweenNSDateComponentsAndDate(v10, v9);

    v12 = objc_msgSend(v8, "biologicalSex");
    if (v12 == 2)
    {
      v13 = 20.0;
      if (v11 > 86)
        goto LABEL_12;
      v14 = (double)v11;
      v15 = 68.0;
      v16 = -0.55;
    }
    else
    {
      if (v12 == 1)
      {
        v13 = 18.0;
        if (v11 > 73)
          goto LABEL_12;
        v14 = (double)v11;
        v15 = 52.0;
      }
      else
      {
        v13 = 20.0;
        if (v11 > 79)
          goto LABEL_12;
        v14 = (double)v11;
        v15 = 57.0;
      }
      v16 = -0.46;
    }
    v13 = v15 + v14 * v16;
  }
  else
  {
    v13 = 0.0;
  }
LABEL_12:

  self->_meanVO2MaxValue = v13;
  if (!-[HDDemoDataBaseSampleGenerator createdFromNSKeyedUnarchiver](self, "createdFromNSKeyedUnarchiver"))
  {
    self->_lastRestingHeartRate = (double)objc_msgSend(v8, "restingHeartRate");
    self->_lastWalkingHeartRateAverage = (double)objc_msgSend(v8, "walkingHeartRateAverage");
    self->_lastVO2MaxValue = self->_meanVO2MaxValue;
    objc_msgSend(v8, "heartRateRecovery");
    self->_lastHeartRateRecoveryValue = v17;
  }

}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  HDDemoDataHeartSampleGenerator *v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint32_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  HDDemoDataHeartSampleGenerator *v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self)
  {
    objc_msgSend(v7, "birthDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HDDemoData_ageBetweenNSDateComponentsAndDate(v9, v8);

    if (v10 >= *MEMORY[0x1E0CB7568])
    {
      -[HDDemoDataBaseSampleGenerator profile](self, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "profileExtensionsConformingToProtocol:", &unk_1EF1B52D8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v47;
        v17 = *MEMORY[0x1E0CB5000];
LABEL_5:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v47 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v18), "featureAvailabilityExtensionForFeatureIdentifier:", v17);
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
            break;
          if (v15 == ++v18)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (v15)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v21 = (void *)v19;

        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "countryCode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0;
        objc_msgSend(v21, "onboardingEligibilityForCountryCode:error:", v23, &v45);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v45;
        if (v25
          && (_HKInitializeLogging(),
              v26 = *MEMORY[0x1E0CB52C8],
              os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR)))
        {
          *(_DWORD *)buf = 138543618;
          v51 = self;
          v52 = 2114;
          v53 = v25;
          _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Error while determining onboarding eligibility for Cardio Fitness %{public}@", buf, 0x16u);
          if (!v24)
            goto LABEL_24;
        }
        else if (!v24)
        {
          goto LABEL_24;
        }
        if ((objc_msgSend(v24, "ineligibilityReasons") & 8) == 0)
        {
          v27 = objc_alloc(MEMORY[0x1E0CB6990]);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v23;
          v30 = (void *)v28;
          v43 = v29;
          v31 = objc_msgSend(v27, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v17, 1, v28);

          -[HDDemoDataBaseSampleGenerator profile](self, "profile");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "onboardingCompletionManager");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0;
          v42 = (void *)v31;
          v34 = objc_msgSend(v33, "insertOnboardingCompletion:error:", v31, &v44);
          v35 = (HDDemoDataHeartSampleGenerator *)v44;

          _HKInitializeLogging();
          v36 = *MEMORY[0x1E0CB52C8];
          v37 = *MEMORY[0x1E0CB52C8];
          if ((v34 & 1) != 0)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v38 = "Completed Cardio Fitness onboarding";
              v39 = v36;
              v40 = OS_LOG_TYPE_INFO;
              v41 = 2;
LABEL_22:
              _os_log_impl(&dword_1B7802000, v39, v40, v38, buf, v41);
            }
          }
          else if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v51 = v35;
            v38 = "Failed to insert Cardio Fitness onboarding completion: %{public}@";
            v39 = v36;
            v40 = OS_LOG_TYPE_DEFAULT;
            v41 = 12;
            goto LABEL_22;
          }

          v23 = v43;
        }
LABEL_24:

        goto LABEL_25;
      }
LABEL_11:

      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB52C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Unable to find Cardio Fitness Feature Availability Provider", buf, 2u);
      }
LABEL_25:

    }
  }

}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double lastWalkingHeartRateAverage;
  id v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  unint64_t nextElectrocardiogramClassification;
  id v63;
  __CFString *v64;
  void *v65;
  double v66;
  void *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  int v109;
  _BOOL4 lastVO2MaxWorkoutWasActive;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  void *v116;
  double lastVO2MaxValue;
  id v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double meanVO2MaxValue;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  char v146;
  char v147;
  void *v148;
  _BOOL4 lastHeartRateRecoveryWorkoutWasActive;
  void *v150;
  double lastHeartRateRecoveryValue;
  id v152;
  void *v153;
  void *v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  id v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  objc_super v191;
  _BYTE v192[128];
  uint64_t v193;
  void *v194;
  uint64_t v195;
  _QWORD v196[4];

  v196[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v191.receiver = self;
  v191.super_class = (Class)HDDemoDataHeartSampleGenerator;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v191, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v11, v12, v13, a5, a5);
  if (qword_1ED5523E8 != -1)
    dispatch_once(&qword_1ED5523E8, &__block_literal_global_141);
  v14 = v11;
  v15 = v14;
  v16 = (_QWORD *)MEMORY[0x1E0CB7288];
  if (!self)
  {

    v176 = v15;
    v181 = 0;
LABEL_10:

    v27 = v15;
    v28 = v12;
    v29 = 0;
    v30 = 0;
    if (!self)
      goto LABEL_36;
    goto LABEL_23;
  }
  if (self->_nextRestingHeartRateSampleTime <= a5)
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "statisticsSampleGenerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "genericSampleTimeNoiseStdDev");
    objc_msgSend(v19, "computeNoiseFromTime:stdDev:", a5, v20);
    self->_nextRestingHeartRateSampleTime = v21 + a5 + 1.0;

    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[HDDemoDataHeartSampleGenerator _computeRestingHeartRateForDemoPerson:atTime:](self, v15);
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v181 = v23;
    if (!v23)
      goto LABEL_9;
    objc_msgSend(v23, "doubleValue");
    self->_lastRestingHeartRate = v24;
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", _MergedGlobals_5_0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED5523C0, v17, v12, v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectFromPhone:", v25);

  }
  else
  {
    v181 = 0;
    v17 = v14;
  }

LABEL_9:
  v26 = v15;
  if (self->_nextWalkingHeartRateAverageSampleTime > a5)
    goto LABEL_10;
  v31 = v26;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "statisticsSampleGenerator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "genericSampleTimeNoiseStdDev");
  objc_msgSend(v33, "computeNoiseFromTime:stdDev:", a5, v34);
  self->_nextWalkingHeartRateAverageSampleTime = v35 + a5 + 1.0;

  v36 = (void *)MEMORY[0x1E0CB37E8];
  lastWalkingHeartRateAverage = self->_lastWalkingHeartRateAverage;
  v38 = v31;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "statisticsSampleGenerator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "randomDoubleFromGenerator");
  v42 = v41;
  objc_msgSend(v38, "heartRateSampleNoiseStdDev");
  v44 = v43;

  v45 = self->_lastWalkingHeartRateAverage;
  v46 = objc_msgSend(v38, "walkingHeartRateAverage");
  v47 = objc_msgSend(v38, "walkingHeartRateAverageMaxDailyDifference");
  v48 = objc_msgSend(v38, "walkingHeartRateAverageMaxTotalDifference");

  v49 = (double)v46 + (double)v48;
  v50 = v45 + (double)v47;
  if (v50 >= lastWalkingHeartRateAverage + (v42 + -0.5) * v44)
    v50 = lastWalkingHeartRateAverage + (v42 + -0.5) * v44;
  if (v45 - (double)v47 >= v50)
    v50 = v45 - (double)v47;
  if (v49 >= v50)
    v49 = v50;
  if ((double)v46 - (double)v48 >= v49)
    v49 = (double)v46 - (double)v48;
  objc_msgSend(v36, "numberWithDouble:", v49);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v29, "doubleValue");
    self->_lastWalkingHeartRateAverage = v51;
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", _MergedGlobals_5_0);
    v184 = v29;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED5523C8, v52, v12, v12);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectFromPhone:", v53);
    v193 = *MEMORY[0x1E0CB7298];
    v194 = &unk_1E6DFE240;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:metadata:", qword_1ED5523B8, v52, v12, v12, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectFromPhone:", v55);

    v29 = v184;
  }
  v56 = v38;
  v57 = v12;
  v16 = (_QWORD *)MEMORY[0x1E0CB7288];
LABEL_23:
  if (self->_nextElectrocardiogramSampleTime <= a5)
  {
    v185 = v29;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "statisticsSampleGenerator");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "genericSampleTimeNoiseStdDev");
    objc_msgSend(v59, "computeNoiseFromTime:stdDev:", a5, v60);
    self->_nextElectrocardiogramSampleTime = v61 + a5 + 60.0;

    nextElectrocardiogramClassification = self->_nextElectrocardiogramClassification;
    v63 = v15;
    if (nextElectrocardiogramClassification > 0xA)
      v64 = 0;
    else
      v64 = *off_1E6CFD040[nextElectrocardiogramClassification];
    v179 = v12;
    objc_msgSend(MEMORY[0x1E0CB6660], "builderFromDemoDataFile:startDate:", v64, v12);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = v63;
    if (nextElectrocardiogramClassification - 2 >= 9 && nextElectrocardiogramClassification)
    {
      v67 = 0;
    }
    else
    {
      -[HDDemoDataHeartSampleGenerator _computeRestingHeartRateForDemoPerson:atTime:](self, v63);
      objc_msgSend(MEMORY[0x1E0CB6A28], "_quantityWithBeatsPerMinute:", v66 + 2.0 + (double)arc4random_uniform(9u));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v68 = nextElectrocardiogramClassification - 4;
    v178 = v15;
    if (nextElectrocardiogramClassification - 4 > 5)
    {
      v69 = 1;
      v70 = 1;
    }
    else
    {
      v69 = qword_1B7F41E78[v68];
      v70 = qword_1B7F41EA8[v68];
    }
    v71 = v16;
    v195 = *v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v196[0] = v72;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v196, &v195, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "addClassification:", nextElectrocardiogramClassification);
    if (v67)
      objc_msgSend(v65, "addAverageHeartRate:", v67);
    objc_msgSend(v65, "finishWithDevice:metadata:", 0, v73);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_setSymptomsStatus:", v69);

    self->_nextElectrocardiogramClassification = (self->_nextElectrocardiogramClassification | 0xFFFFFFFFFFFFFFFELL) + 5;
    v29 = v185;
    v16 = v71;
    v15 = v178;
    v12 = v179;
  }
  else
  {
    v30 = 0;
  }
LABEL_36:
  v186 = v29;

  v183 = v30;
  if (v30)
  {
    objc_msgSend(v13, "addObjectFromWatch:", v30);
    objc_msgSend(v30, "metadata");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectForKey:", *v16);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "integerValue");

    if (v76 != 1)
    {
      v180 = v12;
      if (self)
      {
        v77 = (void *)MEMORY[0x1E0CB6378];
        v78 = (void *)MEMORY[0x1E0CB6380];
        v79 = *MEMORY[0x1E0CB4960];
        v80 = v30;
        objc_msgSend(v78, "categoryTypeForIdentifier:", v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "startDate");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "endDate");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "device");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "metadata");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "categorySampleWithType:value:startDate:endDate:device:metadata:", v81, 0, v82, v83, v84, v85);
        v177 = (void *)objc_claimAutoreleasedReturnValue();

        v86 = (void *)MEMORY[0x1E0CB6378];
        objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48C0]);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "startDate");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "endDate");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "device");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "metadata");
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v86, "categorySampleWithType:value:startDate:endDate:device:metadata:", v87, 0, v88, v89, v90, v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        v196[0] = v177;
        v196[1] = v92;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 2);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v93 = 0;
      }
      v94 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      v187 = 0u;
      v188 = 0u;
      v189 = 0u;
      v190 = 0u;
      v95 = v93;
      v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v187, v192, 16);
      v12 = v180;
      if (v96)
      {
        v97 = v96;
        v98 = *(_QWORD *)v188;
        do
        {
          for (i = 0; i != v97; ++i)
          {
            if (*(_QWORD *)v188 != v98)
              objc_enumerationMutation(v95);
            v100 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
            objc_msgSend(v13, "addObjectFromWatch:", v100, v177);
            objc_msgSend(v100, "UUID");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "hk_appendBytesWithUUID:", v101);

          }
          v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v187, v192, 16);
        }
        while (v97);
      }

      objc_msgSend(v183, "UUID");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAssociatedObjectUUIDs:forObjectUUID:", v94, v102);

    }
  }
  v103 = v15;
  v104 = v12;
  if (!self)
    goto LABEL_57;
  objc_msgSend(v103, "birthDateComponents");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = HDDemoData_ageBetweenNSDateComponentsAndDate(v105, v104);

  if (v106 < *MEMORY[0x1E0CB7568])
    goto LABEL_57;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "generatorState");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v108, "isRunning") & 1) != 0 || (objc_msgSend(v108, "isWalking") & 1) != 0)
    v109 = 1;
  else
    v109 = objc_msgSend(v108, "isHiking");
  if ((v108,
        lastVO2MaxWorkoutWasActive = self->_lastVO2MaxWorkoutWasActive,
        self->_lastVO2MaxWorkoutWasActive = v109,
        lastVO2MaxWorkoutWasActive)
    && !v109
    || self->_nextVO2MaxSampleTime <= a5)
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator", v177);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "statisticsSampleGenerator");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "vo2MaxSampleTimeNoiseStdDev");
    objc_msgSend(v113, "computeNoiseFromTime:stdDev:", a5, v114);
    self->_nextVO2MaxSampleTime = v115 + a5 + 7.0;

    v116 = (void *)MEMORY[0x1E0CB37E8];
    lastVO2MaxValue = self->_lastVO2MaxValue;
    v118 = v103;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "statisticsSampleGenerator");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "randomDoubleFromGenerator");
    v122 = v121;
    objc_msgSend(v118, "vo2MaxValueStdDev");
    v124 = v123;

    v125 = self->_lastVO2MaxValue;
    meanVO2MaxValue = self->_meanVO2MaxValue;
    objc_msgSend(v118, "vo2MaxValueMaxConsecutiveDifference");
    v128 = v127;
    objc_msgSend(v118, "vo2MaxValueMaxTotalDifference");
    v130 = v129;

    v131 = meanVO2MaxValue - v130;
    v132 = meanVO2MaxValue + v130;
    v133 = v125 - v128;
    v134 = v125 + v128;
    if (v125 + v128 >= lastVO2MaxValue + (v122 + -0.5) * v124)
      v134 = lastVO2MaxValue + (v122 + -0.5) * v124;
    if (v133 < v134)
      v133 = v134;
    if (v132 >= v133)
      v132 = v133;
    if (v131 < v132)
      v131 = v132;
    objc_msgSend(v116, "numberWithDouble:", v131);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_57:
    v111 = 0;
  }

  if (v111)
  {
    objc_msgSend(v111, "doubleValue");
    self->_lastVO2MaxValue = v135;
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", qword_1ED5523D0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED5523D8, v136, v104, v104);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectFromWatch:", v137);

    v138 = v103;
    v139 = v104;
  }
  else
  {
    v140 = v103;
    v141 = v104;
    if (!self)
    {
LABEL_73:
      v148 = 0;
      goto LABEL_88;
    }
  }
  objc_msgSend(v103, "birthDateComponents", v177);
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v142)
    goto LABEL_73;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "generatorState");
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v144, "workoutConfiguration");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = objc_msgSend(v145, "indoor");

  if ((v146 & 1) != 0)
  {
    v147 = 0;
  }
  else if ((objc_msgSend(v144, "isRunning") & 1) != 0)
  {
    v147 = 1;
  }
  else
  {
    v147 = objc_msgSend(v144, "isWalking");
  }

  v148 = 0;
  lastHeartRateRecoveryWorkoutWasActive = self->_lastHeartRateRecoveryWorkoutWasActive;
  self->_lastHeartRateRecoveryWorkoutWasActive = v147;
  if (lastHeartRateRecoveryWorkoutWasActive && (v147 & 1) == 0)
  {
    v150 = (void *)MEMORY[0x1E0CB37E8];
    lastHeartRateRecoveryValue = self->_lastHeartRateRecoveryValue;
    v152 = v103;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "statisticsSampleGenerator");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "randomDoubleFromGenerator");
    v156 = v155;
    objc_msgSend(v152, "heartRateRecoveryValueStdDev");
    v158 = v157;

    v159 = self->_lastHeartRateRecoveryValue;
    objc_msgSend(v152, "heartRateRecovery");
    v161 = v160;
    objc_msgSend(v152, "heartRateRecoveryValueMaxConsecutiveDifference");
    v163 = v162;
    objc_msgSend(v152, "heartRateRecoveryValueMaxTotalDifference");
    v165 = v164;

    v166 = v161 - v165;
    v167 = v161 + v165;
    v168 = v159 - v163;
    v169 = v159 + v163;
    v170 = round(lastHeartRateRecoveryValue + (v156 + -0.5) * v158);
    if (v159 + v163 >= v170)
      v169 = v170;
    if (v168 < v169)
      v168 = v169;
    if (v167 >= v168)
      v167 = v168;
    if (v166 < v167)
      v166 = v167;
    objc_msgSend(v150, "numberWithDouble:", v166);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_88:

  if (v148)
  {
    objc_msgSend(v148, "doubleValue");
    self->_lastHeartRateRecoveryValue = v171;
    v172 = v104;
    objc_msgSend(v172, "dateByAddingTimeInterval:", 60.0);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", _MergedGlobals_5_0, self->_lastHeartRateRecoveryValue);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:metadata:", qword_1ED5523E0, v174, v172, v173, 0);
    v175 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "addObjectFromWatch:", v175);
  }

}

void __108__HDDemoDataHeartSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_5_0;
  _MergedGlobals_5_0 = v0;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED5523B8;
  qword_1ED5523B8 = v2;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D28]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED5523C0;
  qword_1ED5523C0 = v4;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DB8]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED5523C8;
  qword_1ED5523C8 = v6;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ml/kg*min"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED5523D0;
  qword_1ED5523D0 = v8;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DA0]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ED5523D8;
  qword_1ED5523D8 = v10;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB8]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1ED5523E0;
  qword_1ED5523E0 = v12;

}

- (void)_computeRestingHeartRateForDemoPerson:(void *)a1 atTime:(void *)a2
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(a1, "demoDataGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statisticsSampleGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "randomDoubleFromGenerator");
  objc_msgSend(v3, "heartRateSampleNoiseStdDev");

  objc_msgSend(v3, "restingHeartRate");
  objc_msgSend(v3, "restingHeartRateMaxDailyDifference");
  objc_msgSend(v3, "restingHeartRateMaxTotalDifference");

}

@end
