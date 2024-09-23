@implementation HDDemoDataMobilitySampleGenerator

- (HDDemoDataMobilitySampleGenerator)init
{
  HDDemoDataMobilitySampleGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataMobilitySampleGenerator;
  result = -[HDDemoDataBaseSampleGenerator init](&v3, sel_init);
  if (result)
  {
    result->_nextStepLengthSampleTime = 0.0;
    result->_nextWalkingSpeedSampleTime = 0.0;
    result->_nextAsymmetryPercentageSampleTime = 0.0;
    result->_nextDoubleSupportPercentageSampleTime = 0.0;
    result->_nextSixMinuteWalkTestDistanceSampleTime = 0.0;
    result->_nextStairAscentSpeedSampleTime = 0.0;
    result->_nextStairDescentSpeedSampleTime = 0.0;
    result->_nextWalkingSteadinessSampleTime = 0.0;
  }
  return result;
}

- (HDDemoDataMobilitySampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataMobilitySampleGenerator *v5;
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
  v15.super_class = (Class)HDDemoDataMobilitySampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextStepLengthSampleTimeKey"));
    v5->_nextStepLengthSampleTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextWalkingSpeedSampleTimeKey"));
    v5->_nextWalkingSpeedSampleTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextAsymmetryPercentageSampleTimeKey"));
    v5->_nextAsymmetryPercentageSampleTime = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextDoubleSupportPercentageSampleTimeKey"));
    v5->_nextDoubleSupportPercentageSampleTime = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextSixMinuteWalkTestDistanceSampleTimeKey"));
    v5->_nextSixMinuteWalkTestDistanceSampleTime = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextStairAscentSpeedSampleTimeKey"));
    v5->_nextStairAscentSpeedSampleTime = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextStairDescentSpeedSampleTimeKey"));
    v5->_nextStairDescentSpeedSampleTime = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_NextWalkingSteadinessSampleTimeKey"));
    v5->_nextWalkingSteadinessSampleTime = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double nextWalkingSteadinessSampleTime;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataMobilitySampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (self)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextStepLengthSampleTimeKey"), self->_nextStepLengthSampleTime, v6.receiver, v6.super_class);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextWalkingSpeedSampleTimeKey"), self->_nextWalkingSpeedSampleTime);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextAsymmetryPercentageSampleTimeKey"), self->_nextAsymmetryPercentageSampleTime);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextDoubleSupportPercentageSampleTimeKey"), self->_nextDoubleSupportPercentageSampleTime);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextSixMinuteWalkTestDistanceSampleTimeKey"), self->_nextSixMinuteWalkTestDistanceSampleTime);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextStairAscentSpeedSampleTimeKey"), self->_nextStairAscentSpeedSampleTime);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextStairDescentSpeedSampleTimeKey"), self->_nextStairDescentSpeedSampleTime);
    nextWalkingSteadinessSampleTime = self->_nextWalkingSteadinessSampleTime;
  }
  else
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextStepLengthSampleTimeKey"), 0.0, v6.receiver, v6.super_class);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextWalkingSpeedSampleTimeKey"), 0.0);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextAsymmetryPercentageSampleTimeKey"), 0.0);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextDoubleSupportPercentageSampleTimeKey"), 0.0);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextSixMinuteWalkTestDistanceSampleTimeKey"), 0.0);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextStairAscentSpeedSampleTimeKey"), 0.0);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextStairDescentSpeedSampleTimeKey"), 0.0);
    nextWalkingSteadinessSampleTime = 0.0;
  }
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_NextWalkingSteadinessSampleTimeKey"), nextWalkingSteadinessSampleTime);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  HDDemoDataMobilitySampleGenerator *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  char v40;
  HDDemoDataMobilitySampleGenerator *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint32_t v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  HDDemoDataMobilitySampleGenerator *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  HDDemoDataMobilitySampleGenerator *v56;
  HDDemoDataMobilitySampleGenerator *v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  HDDemoDataMobilitySampleGenerator *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self)
  {
    objc_msgSend(v7, "birthDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HDDemoData_ageBetweenNSDateComponentsAndDate(v9, v8);

    if (v10 >= *MEMORY[0x1E0CB77F8])
    {
      -[HDDemoDataBaseSampleGenerator profile](self, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "profileExtensionsConformingToProtocol:", &unk_1EF1B52D8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v61;
        v17 = *MEMORY[0x1E0CB50B8];
LABEL_5:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v61 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v18), "featureAvailabilityExtensionForFeatureIdentifier:", v17);
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
            break;
          if (v15 == ++v18)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
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

        v59 = 0;
        objc_msgSend(v21, "onboardingEligibilityForCountryCode:error:", v23, &v59);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v59;
        if (v25
          && (_HKInitializeLogging(),
              v26 = *MEMORY[0x1E0CB52C8],
              os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR)))
        {
          *(_DWORD *)buf = 138543618;
          v65 = self;
          v66 = 2114;
          v67 = v25;
          _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Error while determining onboarding eligibility for Walking Steadiness %{public}@", buf, 0x16u);
          if (!v24)
            goto LABEL_34;
        }
        else if (!v24)
        {
          goto LABEL_34;
        }
        if ((objc_msgSend(v24, "ineligibilityReasons") & 8) == 0)
        {
          v55 = v24;
          v53 = v25;
          v27 = objc_alloc(MEMORY[0x1E0CB6990]);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v23;
          v29 = objc_msgSend(v27, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v17, 1, v28, v23, 102);

          -[HDDemoDataBaseSampleGenerator profile](self, "profile");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "onboardingCompletionManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0;
          v52 = (void *)v29;
          LOBYTE(v29) = objc_msgSend(v31, "insertOnboardingCompletion:error:", v29, &v58);
          v32 = (HDDemoDataMobilitySampleGenerator *)v58;

          if ((v29 & 1) == 0)
          {
            _HKInitializeLogging();
            v48 = *MEMORY[0x1E0CB52C8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v41 = v32;
              v65 = v32;
              _os_log_impl(&dword_1B7802000, v48, OS_LOG_TYPE_DEFAULT, "Failed to insert Walking Steadiness onboarding completion: %{public}@", buf, 0xCu);
              v25 = v53;
              v23 = v54;
              v49 = v52;
            }
            else
            {
              v25 = v53;
              v23 = v54;
              v49 = v52;
              v41 = v32;
            }
            v24 = v55;
            goto LABEL_33;
          }
          -[HDDemoDataBaseSampleGenerator profile](self, "profile");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "featureSettingsManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = *MEMORY[0x1E0CB50C8];
          v57 = v32;
          v36 = objc_msgSend(v34, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", MEMORY[0x1E0C9AAB0], v35, v17, 0, &v57);
          v51 = v57;

          if ((v36 & 1) == 0)
          {
            v41 = v51;
            _HKInitializeLogging();
            v50 = *MEMORY[0x1E0CB52C8];
            v24 = v55;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v51;
              _os_log_impl(&dword_1B7802000, v50, OS_LOG_TYPE_DEFAULT, "Failed to update feature settings enablement key for Walking Steadiness: %{public}@", buf, 0xCu);
            }
            v25 = v53;
            v23 = v54;
            goto LABEL_32;
          }
          -[HDDemoDataBaseSampleGenerator profile](self, "profile");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "featureSettingsManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = *MEMORY[0x1E0CB50D8];
          v56 = v51;
          v40 = objc_msgSend(v38, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", MEMORY[0x1E0C9AAB0], v39, v17, 0, &v56);
          v41 = v56;

          _HKInitializeLogging();
          v42 = *MEMORY[0x1E0CB52C8];
          v24 = v55;
          v43 = *MEMORY[0x1E0CB52C8];
          if ((v40 & 1) != 0)
          {
            v25 = v53;
            v23 = v54;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v44 = "Completed Walking Steadiness onboarding";
              v45 = v42;
              v46 = OS_LOG_TYPE_INFO;
              v47 = 2;
LABEL_31:
              _os_log_impl(&dword_1B7802000, v45, v46, v44, buf, v47);
            }
          }
          else
          {
            v25 = v53;
            v23 = v54;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v41;
              v44 = "Failed to update feature settings onboarding acknowledgement key for Walking Steadiness: %{public}@";
              v45 = v42;
              v46 = OS_LOG_TYPE_DEFAULT;
              v47 = 12;
              goto LABEL_31;
            }
          }
LABEL_32:
          v49 = v52;
LABEL_33:

        }
LABEL_34:

        goto LABEL_35;
      }
LABEL_11:

      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB52C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Unable to find Walking Steadiness Feature Availability Provider", buf, 2u);
      }
LABEL_35:

    }
  }

}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int isDemoPersonWalkingAbove;
  double nextStepLengthSampleTime;
  void *v27;
  void *v28;
  double v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double nextWalkingSpeedSampleTime;
  void *v42;
  void *v43;
  double v44;
  id v45;
  id v46;
  id v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double nextAsymmetryPercentageSampleTime;
  void *v57;
  void *v58;
  double v59;
  id v60;
  id v61;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double nextDoubleSupportPercentageSampleTime;
  void *v72;
  void *v73;
  double v74;
  id v75;
  id v76;
  id v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double nextSixMinuteWalkTestDistanceSampleTime;
  void *v87;
  void *v88;
  double v89;
  id v90;
  id v91;
  id v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double nextStairAscentSpeedSampleTime;
  void *v102;
  void *v103;
  double v104;
  id v105;
  id v106;
  id v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double nextStairDescentSpeedSampleTime;
  void *v117;
  void *v118;
  double v119;
  id v120;
  id v121;
  id v122;
  void *v123;
  uint64_t v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double nextWalkingSteadinessSampleTime;
  void *v136;
  void *v137;
  id v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  void *v143;
  objc_super v144;

  v144.receiver = self;
  v144.super_class = (Class)HDDemoDataMobilitySampleGenerator;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v144, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v13, v12, v11, a5, a5);
  v142 = v12;
  v143 = v11;
  if (self)
  {
    v14 = v11;
    v15 = v12;
    v16 = v13;
    objc_msgSend(v16, "stepLengthMean");
    v18 = v17;
    objc_msgSend(v16, "stepLengthStdDev");
    v20 = v19;
    objc_msgSend(v16, "stepLengthSampleFrequency");
    v22 = v21;
    objc_msgSend(v16, "stepLengthSampleFrequencyStdDev");
    v24 = v23;
    isDemoPersonWalkingAbove = -[HDDemoDataMobilitySampleGenerator _isDemoPersonWalkingAboveAverage](self);
    if (isDemoPersonWalkingAbove)
    {
      v18 = v18 * 1.05;
      v22 = v22 * 0.2;
    }
    nextStepLengthSampleTime = self->_nextStepLengthSampleTime;
    if (isDemoPersonWalkingAbove)
      v24 = v24 * 0.2;
    v27 = (void *)*MEMORY[0x1E0CB5DC8];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v16, v15, 0, 0, v14, v27, v28, a5, 0.0, nextStepLengthSampleTime, v18, v20, v22, v24);

    self->_nextStepLengthSampleTime = v29;
    v30 = v16;
    v31 = v14;
    v32 = v15;
    objc_msgSend(v30, "walkingSpeedMean");
    v34 = v33;
    objc_msgSend(v30, "walkingSpeedStdDev");
    v36 = v35;
    objc_msgSend(v30, "walkingSpeedSampleFrequency");
    v38 = v37;
    objc_msgSend(v30, "walkingSpeedSampleFrequencyStdDev");
    v40 = v39;
    if (-[HDDemoDataMobilitySampleGenerator _isDemoPersonWalkingAboveAverage](self))
    {
      v34 = v34 * 1.2;
      v36 = v36 * 1.2;
      v38 = v38 * 0.2;
      v40 = v40 * 0.2;
    }
    nextWalkingSpeedSampleTime = self->_nextWalkingSpeedSampleTime;
    v42 = (void *)*MEMORY[0x1E0CB5DC0];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v30, v32, 0, 0, v31, v42, v43, a5, 0.0, nextWalkingSpeedSampleTime, v34, v36, v38, v40);

    self->_nextWalkingSpeedSampleTime = v44;
    v45 = v31;
    v46 = v32;
    v47 = v30;
    objc_msgSend(v47, "asymmetryPercentageMean");
    v49 = v48;
    objc_msgSend(v47, "asymmetryPercentageStdDev");
    v51 = v50;
    objc_msgSend(v47, "asymmetryPercentageSampleFrequency");
    v53 = v52;
    objc_msgSend(v47, "asymmetryPercentageSampleFrequencyStdDev");
    v55 = v54;
    nextAsymmetryPercentageSampleTime = self->_nextAsymmetryPercentageSampleTime;
    v57 = (void *)*MEMORY[0x1E0CB5DA8];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v47, v46, 0, 1, v45, v57, v58, a5, 0.0, nextAsymmetryPercentageSampleTime, v49, v51, v53, v55);

    self->_nextAsymmetryPercentageSampleTime = v59;
    v60 = v45;
    v61 = v46;
    v62 = v47;
    objc_msgSend(v62, "doubleSupportPercentageMean");
    v64 = v63;
    objc_msgSend(v62, "doubleSupportPercentageStdDev");
    v66 = v65;
    objc_msgSend(v62, "doubleSupportPercentageSampleFrequency");
    v68 = v67;
    objc_msgSend(v62, "doubleSupportPercentageSampleFrequencyStdDev");
    v70 = v69;
    nextDoubleSupportPercentageSampleTime = self->_nextDoubleSupportPercentageSampleTime;
    v72 = (void *)*MEMORY[0x1E0CB5DB0];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v62, v61, 0, 1, v60, v72, v73, a5, 0.0, nextDoubleSupportPercentageSampleTime, v64, v66, v68, v70);

    self->_nextDoubleSupportPercentageSampleTime = v74;
    v75 = v60;
    v76 = v61;
    v77 = v62;
    objc_msgSend(v77, "sixMinuteWalkTestDistanceMean");
    v79 = v78;
    objc_msgSend(v77, "sixMinuteWalkTestDistanceStdDev");
    v81 = v80;
    objc_msgSend(v77, "sixMinuteWalkTestDistanceSampleFrequency");
    v83 = v82;
    objc_msgSend(v77, "sixMinuteWalkTestDistanceSampleFrequencyStdDev");
    v85 = v84;
    nextSixMinuteWalkTestDistanceSampleTime = self->_nextSixMinuteWalkTestDistanceSampleTime;
    v87 = (void *)*MEMORY[0x1E0CB5D60];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v77, v76, 1, 0, v75, v87, v88, a5, 0.0, nextSixMinuteWalkTestDistanceSampleTime, v79, v81, v83, v85);

    self->_nextSixMinuteWalkTestDistanceSampleTime = v89;
    v90 = v75;
    v91 = v76;
    v92 = v77;
    objc_msgSend(v92, "stairAscentSpeedMean");
    v94 = v93;
    objc_msgSend(v92, "stairAscentSpeedStdDev");
    v96 = v95;
    objc_msgSend(v92, "stairAscentSpeedSampleFrequency");
    v98 = v97;
    objc_msgSend(v92, "stairAscentSpeedSampleFrequencyStdDev");
    v100 = v99;
    nextStairAscentSpeedSampleTime = self->_nextStairAscentSpeedSampleTime;
    v102 = (void *)*MEMORY[0x1E0CB5D68];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v92, v91, 1, 0, v90, v102, v103, a5, 0.0, nextStairAscentSpeedSampleTime, v94, v96, v98, v100);

    self->_nextStairAscentSpeedSampleTime = v104;
    v105 = v90;
    v106 = v91;
    v107 = v92;
    objc_msgSend(v107, "stairDescentSpeedMean");
    v109 = v108;
    objc_msgSend(v107, "stairDescentSpeedStdDev");
    v111 = v110;
    objc_msgSend(v107, "stairDescentSpeedSampleFrequency");
    v113 = v112;
    objc_msgSend(v107, "stairDescentSpeedSampleFrequencyStdDev");
    v115 = v114;
    nextStairDescentSpeedSampleTime = self->_nextStairDescentSpeedSampleTime;
    v117 = (void *)*MEMORY[0x1E0CB5D70];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v107, v106, 1, 0, v105, v117, v118, a5, 0.0, nextStairDescentSpeedSampleTime, v109, v111, v113, v115);

    self->_nextStairDescentSpeedSampleTime = v119;
    v120 = v107;
    v121 = v106;
    v122 = v105;
    objc_msgSend(v120, "birthDateComponents");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = HDDemoData_ageBetweenNSDateComponentsAndDate(v123, v121);

    if (v124 >= *MEMORY[0x1E0CB77F8])
    {
      objc_msgSend(v120, "walkingSteadinessMean");
      v126 = v125;
      objc_msgSend(v120, "walkingSteadinessStdDev");
      v128 = v127;
      objc_msgSend(v120, "walkingSteadinessSampleFrequency");
      v130 = v129;
      objc_msgSend(v120, "walkingSteadinessSampleFrequencyStdDev");
      v132 = v131;
      objc_msgSend(v120, "walkingSteadinessSampleFrequency");
      v134 = v133 * 86400.0;
      nextWalkingSteadinessSampleTime = self->_nextWalkingSteadinessSampleTime;
      v136 = (void *)*MEMORY[0x1E0CB5A70];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      self->_nextWalkingSteadinessSampleTime = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v120, v121, 0, 0, v122, v136, v137, a5, v134, nextWalkingSteadinessSampleTime, v126, v128, v130, v132);

    }
  }
  else
  {
    v138 = v13;

    v139 = v138;
    v140 = v12;
    v141 = v11;
  }

}

- (uint64_t)_isDemoPersonWalkingAboveAverage
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "demoDataGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generatorState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isWalking") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "demoDataGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "generatorState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isHiking");

  }
  return v4;
}

- (double)_generateWalkingDataSamplesForDemoPerson:(void *)a3 atTime:(int)a4 sampleDate:(int)a5 duration:(void *)a6 addFromWatch:(void *)a7 shouldDecreaseDuringRehab:(void *)a8 objectCollection:(double)a9 nextSampleTime:(double)a10 typeIdentifier:(double)a11 unit:(double)a12 sampleMean:(double)a13 sampleMeanStdDev:(double)a14 sampleFrequency:(double)a15 sampleFrequencyStdDev:
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  long double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  int v62;
  int v63;
  void *v64;

  v29 = a2;
  v30 = a3;
  v31 = a6;
  v32 = a7;
  v33 = a8;
  if (a9 >= a11)
  {
    objc_msgSend(a1, "demoDataGenerator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sleepSampleGenerator");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "isDemoPersonAwake:atTime:", v29, a9))
    {
      v62 = a5;
      v63 = a4;
      v64 = v31;
      objc_msgSend(a1, "demoDataGenerator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "activitySampleGenerator");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "_isDemoPersonSedentary:atTime:", v29, a9);

      if ((v38 & 1) != 0)
      {
        v31 = v64;
        goto LABEL_16;
      }
      objc_msgSend(a1, "demoDataGenerator");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "statisticsSampleGenerator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "computeStatisticalTimeFromCurrentTime:mean:stdDev:", a9, a14, a15);
      a11 = v41 + a11;

      objc_msgSend(v30, "dateByAddingTimeInterval:", -a10);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v30;
      objc_msgSend(a1, "demoDataGenerator");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "firstSampleDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v34, "compare:", v43);

      if (v44 == -1)
      {
        v31 = v64;
      }
      else
      {
        v45 = objc_msgSend(v29, "profileType");
        v46 = 1.0;
        if (v45 == 3)
        {
          objc_msgSend(a1, "demoDataGenerator", 1.0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "configuration");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (double)objc_msgSend(v48, "generationPeriodInDays");

          objc_msgSend(v29, "rehabLogarithmicConstant");
          v51 = v50;
          v52 = log(v51 + (2.71828183 - v51) * (a9 / v49));
          if (v62)
            v52 = log(v51) + 1.0 - v52;
          v46 = fmin(v52, 1.0);
        }
        v53 = v46 * a12;
        objc_msgSend(a1, "demoDataGenerator");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "statisticsSampleGenerator");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "computeNoiseFromTime:stdDev:", a9, a13);
        v57 = v53 + v56;

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v32);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v33, v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v58, v59, v34, v35);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v64;
        if (v63)
          objc_msgSend(v64, "addObjectFromWatch:", v60);
        else
          objc_msgSend(v64, "addObjectFromPhone:", v60);

      }
    }

  }
LABEL_16:

  return a11;
}

@end
