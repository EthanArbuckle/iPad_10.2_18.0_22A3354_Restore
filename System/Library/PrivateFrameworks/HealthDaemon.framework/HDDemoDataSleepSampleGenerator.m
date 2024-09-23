@implementation HDDemoDataSleepSampleGenerator

- (HDDemoDataSleepSampleGenerator)init
{
  HDDemoDataSleepSampleGenerator *v2;
  HDDemoDataSleepSampleGenerator *v3;
  void *v4;
  uint64_t v5;
  NSArray *sleepGraphsArray;
  uint64_t v7;
  NSArray *breathingDisturbancesGraphsArray;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataSleepSampleGenerator;
  v2 = -[HDDemoDataBaseSampleGenerator init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nextSleepDurationSampleTime = 0.0;
    -[HDDemoDataSleepSampleGenerator sleepGraphsFileName](v2, "sleepGraphsFileName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataSleepSampleGenerator loadGraphsFromFileNamed:]((uint64_t)v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    sleepGraphsArray = v3->_sleepGraphsArray;
    v3->_sleepGraphsArray = (NSArray *)v5;

    -[HDDemoDataSleepSampleGenerator loadGraphsFromFileNamed:]((uint64_t)v3, CFSTR("BreathingDisturbancesData"));
    v7 = objc_claimAutoreleasedReturnValue();
    breathingDisturbancesGraphsArray = v3->_breathingDisturbancesGraphsArray;
    v3->_breathingDisturbancesGraphsArray = (NSArray *)v7;

  }
  return v3;
}

- (id)loadGraphsFromFileNamed:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB34D0];
  v3 = a2;
  objc_msgSend(v2, "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v3, CFSTR("json"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 4, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E0CB52C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      {
        v15 = v11;
        v16 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2114;
        v22 = v5;
        v17 = v16;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Could not serialize from JSON data at file path: %{public}@", buf, 0x16u);

      }
      v9 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      v13 = v10;
      *(_DWORD *)buf = 138543618;
      v20 = (id)objc_opt_class();
      v21 = 2114;
      v22 = v5;
      v14 = v20;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Could not get data from file path: %{public}@", buf, 0x16u);

    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (HDDemoDataSleepSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataSleepSampleGenerator *v5;
  double v6;
  void *v7;
  uint64_t v8;
  NSArray *sleepGraphsArray;
  uint64_t v10;
  NSArray *breathingDisturbancesGraphsArray;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDemoDataSleepSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataSleepSampleGeneratorNextSleepDurationSampleTimeKey"));
    v5->_nextSleepDurationSampleTime = v6;
    -[HDDemoDataSleepSampleGenerator sleepGraphsFileName](v5, "sleepGraphsFileName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataSleepSampleGenerator loadGraphsFromFileNamed:]((uint64_t)v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    sleepGraphsArray = v5->_sleepGraphsArray;
    v5->_sleepGraphsArray = (NSArray *)v8;

    -[HDDemoDataSleepSampleGenerator loadGraphsFromFileNamed:]((uint64_t)v5, CFSTR("BreathingDisturbancesData"));
    v10 = objc_claimAutoreleasedReturnValue();
    breathingDisturbancesGraphsArray = v5->_breathingDisturbancesGraphsArray;
    v5->_breathingDisturbancesGraphsArray = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataSleepSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataSleepSampleGeneratorNextSleepDurationSampleTimeKey"), self->_nextSleepDurationSampleTime, v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)sleepGraphsFileName
{
  return CFSTR("SleepData-Stages");
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataSleepSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v3, sel_setupWithDemoDataGenerator_, a3);
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
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
  double v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  NSObject *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  unint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t j;
  void *v116;
  void *v117;
  void *v118;
  char v119;
  int v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  id v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  double v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  double v166;
  double v167;
  double v168;
  void *v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  id v183;
  id v184;
  id v185;
  void *v186;
  void *v187;
  int v188;
  void *v189;
  void *v190;
  void *v191;
  double v192;
  double v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  double v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  void *v206;
  void *v207;
  void *v208;
  HDDemoDataSleepSampleGenerator *v209;
  void *v210;
  void *v211;
  id v212;
  id v213;
  void *v214;
  void *v215;
  void *v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  objc_super v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  uint8_t v226[128];
  uint8_t buf[4];
  void *v228;
  __int16 v229;
  void *v230;
  __int16 v231;
  void *v232;
  uint64_t v233;
  _QWORD v234[4];

  v234[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v221.receiver = self;
  v221.super_class = (Class)HDDemoDataSleepSampleGenerator;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v221, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v11, a6, v12, a5, a5);
  if (self->_nextSleepDurationSampleTime > a5)
    goto LABEL_64;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v213 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstSampleDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0x1E0CB6000uLL;
  v17 = 0x1E0CB6000uLL;
  v206 = v11;
  v207 = v13;
  v204 = v15;
  v205 = v12;
  v209 = self;
  if (self->_nextSleepDurationSampleTime == 0.0)
  {
    v18 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "hourUnit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19, 7.0);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(MEMORY[0x1E0CB6A70], "dataTypeWithCode:", 197);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = (void *)v20;
    objc_msgSend(v21, "quantitySampleWithType:quantity:startDate:endDate:", v22, v20, v15, v15);
    v23 = objc_claimAutoreleasedReturnValue();

    v208 = (void *)v23;
    objc_msgSend(v13, "addObject:", v23);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hk_weekendDays");
    v215 = (void *)objc_claimAutoreleasedReturnValue();

    v219 = 0u;
    v220 = 0u;
    v217 = 0u;
    v218 = 0u;
    HKSleepScheduleWeekdayArrayFromWeekdays();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v217, v226, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = 0;
      v30 = *(_QWORD *)v218;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v218 != v30)
            objc_enumerationMutation(v25);
          v32 = objc_msgSend(*(id *)(*((_QWORD *)&v217 + 1) + 8 * i), "unsignedIntegerValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", NSWeekdayComponentFromHKSleepScheduleWeekday());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v215, "containsObject:", v33);

          if (v34)
            v35 = v32;
          else
            v35 = 0;
          v28 |= v35;
          if (v34)
            v36 = 0;
          else
            v36 = v32;
          v29 |= v36;
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v217, v226, 16);
      }
      while (v27);
    }
    else
    {
      v28 = 0;
      v29 = 0;
    }

    v11 = v206;
    objc_msgSend(v206, "weekdaySleepParameters");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CB6C08];
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithHour:minute:", objc_msgSend(v37, "wakeUpTimeGoalHour"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithHour:minute:", objc_msgSend(v37, "bedtimeGoalHour"), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sleepScheduleWithDate:weekdays:wakeTimeComponents:bedTimeComponents:overrideDayIndex:device:metadata:", v15, v29, v39, v40, 0, 0, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "addObject:", v41);

    objc_msgSend(v206, "weekendSleepParameters");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)MEMORY[0x1E0CB6C08];
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithHour:minute:", objc_msgSend(v42, "wakeUpTimeGoalHour"), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithHour:minute:", objc_msgSend(v42, "bedtimeGoalHour"), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "sleepScheduleWithDate:weekdays:wakeTimeComponents:bedTimeComponents:overrideDayIndex:device:metadata:", v15, v28, v44, v45, 0, 0, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "addObject:", v46);

    v12 = v205;
    self = v209;
    v16 = 0x1E0CB6000uLL;
    v17 = 0x1E0CB6000uLL;
  }
  if (qword_1EF199D38 != -1)
    dispatch_once(&qword_1EF199D38, &__block_literal_global_40);
  v47 = (double)(uint64_t)a5;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v48, "isDemoDataTimeInWeekend:calendar:", v49, a5);

  if ((v50 & 1) != 0)
    objc_msgSend(v11, "weekendSleepParameters");
  else
    objc_msgSend(v11, "weekdaySleepParameters");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "wakeUpTime");
  v53 = v52;
  objc_msgSend(v11, "wakeUpTimeNoiseStdDev");
  -[HDDemoDataSleepSampleGenerator computeSleepTimeFromCurrentTime:mean:stdDev:](self, "computeSleepTimeFromCurrentTime:mean:stdDev:", a5, v53, v54);
  self->_nextSleepDurationSampleTime = v47 + 1.0 + v55;
  objc_msgSend(v51, "wakeUpTime");
  v57 = v56;
  objc_msgSend(v11, "wakeUpTimeNoiseStdDev");
  -[HDDemoDataSleepSampleGenerator computeSleepTimeFromCurrentTime:mean:stdDev:](self, "computeSleepTimeFromCurrentTime:mean:stdDev:", a5, v57, v58);
  v60 = v59;
  objc_msgSend(v51, "bedtime");
  v62 = v61;
  objc_msgSend(v51, "wakeUpTime");
  if (v62 <= v63)
    v64 = 0.0;
  else
    v64 = 1.0;
  v203 = v51;
  objc_msgSend(v51, "bedtime");
  v66 = v65;
  objc_msgSend(v11, "bedtimeNoiseStdDev");
  -[HDDemoDataSleepSampleGenerator computeSleepTimeFromCurrentTime:mean:stdDev:](self, "computeSleepTimeFromCurrentTime:mean:stdDev:", a5 - v64, v66, v67);
  v69 = v68;
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v71 = v70 + (v69 - v64 + v47) * 86400.0;
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v73 = v72 + (v60 + v47) * 86400.0;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "features");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "timeInBedTracking");

  if (v76)
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "statisticsSampleGenerator");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inBedTimeStdDev");
    objc_msgSend(v78, "computeNoiseFromTime:stdDev:", a5, v79);
    v81 = v80 * 86400.0;

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "statisticsSampleGenerator");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inBedTimeStdDev");
    objc_msgSend(v83, "computeNoiseFromTime:stdDev:", a5, v84);
    v86 = v85 * 86400.0;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v71 - fabs(v81));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v73 + fabs(v86 * 0.5));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v87, "hk_isAfterDate:", v88))
    {
      _HKInitializeLogging();
      v89 = (void *)*MEMORY[0x1E0CB52C8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      {
LABEL_33:

        goto LABEL_34;
      }
      v90 = v12;
      v91 = v11;
      v92 = v89;
      v93 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v228 = v93;
      v229 = 2114;
      v230 = v87;
      v231 = 2114;
      v232 = v88;
      v94 = v93;
      _os_log_error_impl(&dword_1B7802000, v92, OS_LOG_TYPE_ERROR, "[%{public}@] In Bed: Bedtime date cannot be after wake up date! %{public}@ - %{public}@", buf, 0x20u);

      v11 = v91;
      v12 = v90;
      v17 = 0x1E0CB6000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:metadata:", _MergedGlobals_13, 0, v87, v88, 0);
      v92 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "addObject:", v92);
    }

    goto LABEL_33;
  }
LABEL_34:
  -[HDDemoDataSleepSampleGenerator randomGraphFromArray:]((unint64_t)self, self->_sleepGraphsArray);
  v95 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v71);
  v96 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v73);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = (void *)v96;
  v202 = (void *)v95;
  -[HDDemoDataSleepSampleGenerator createSleepSamplesFromSleepGraph:sleepCategoryType:startDate:endDate:](self, "createSleepSamplesFromSleepGraph:sleepCategoryType:startDate:endDate:", v95, _MergedGlobals_13, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "addObjectsFromArray:", v98);

  v99 = v213;
  v100 = v12;
  v101 = v11;
  v216 = v99;
  if (objc_msgSend(v99, "count"))
  {
    v198 = v100;
    v199 = v97;
    v200 = a5;
    objc_msgSend(*(id *)(v17 + 2672), "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v99, "firstObject");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "startDate");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "lastObject");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "endDate");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)objc_msgSend(v102, "initWithStartDate:endDate:", v104, v106);

    objc_msgSend(v107, "startDate");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v233 = *MEMORY[0x1E0CB7298];
    v234[0] = &unk_1E6DFABE0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v234, &v233, 1);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "endDate");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v103) = objc_msgSend(v108, "hk_isBeforeDate:", v109);

    if ((_DWORD)v103)
    {
      v110 = 0x1E0CB6000uLL;
      do
      {
        v224 = 0u;
        v225 = 0u;
        v222 = 0u;
        v223 = 0u;
        v111 = v216;
        v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v222, buf, 16);
        if (v112)
        {
          v113 = v112;
          v114 = *(_QWORD *)v223;
          do
          {
            for (j = 0; j != v113; ++j)
            {
              if (*(_QWORD *)v223 != v114)
                objc_enumerationMutation(v111);
              v116 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * j);
              objc_msgSend(v116, "startDate");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v108, "hk_isAfterDate:", v117) & 1) != 0)
              {
                objc_msgSend(v116, "endDate");
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                v119 = objc_msgSend(v108, "hk_isBeforeDate:", v118);

                if ((v119 & 1) != 0)
                {
                  v120 = 1;
                  goto LABEL_49;
                }
              }
              else
              {

              }
            }
            v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v222, buf, 16);
          }
          while (v113);
          v120 = 0;
LABEL_49:
          self = v209;
          v16 = 0x1E0CB6000;
          v110 = 0x1E0CB6000;
        }
        else
        {
          v120 = 0;
        }

        objc_msgSend(v108, "timeIntervalSinceReferenceDate");
        v122 = v121 * 0.0000115740741;
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "statisticsSampleGenerator");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "heartRateSampleNoiseStdDev");
        objc_msgSend(v124, "computeNoiseFromTime:stdDev:", v122, v125);
        v127 = v126;

        objc_msgSend(v108, "timeIntervalSinceReferenceDate");
        v129 = v128;
        objc_msgSend(v107, "startDate");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "timeIntervalSinceReferenceDate");
        v132 = v131;
        objc_msgSend(v107, "duration");
        v134 = v133;

        if (v120)
          v135 = v127 * 0.5 + (double)objc_msgSend(v101, "restingHeartRate") * ((v129 - v132) / v134 * -0.1 + 1.0);
        else
          v135 = v127 + (double)objc_msgSend(v101, "restingHeartRate");
        v136 = *(void **)(v16 + 2624);
        v137 = *(void **)(v110 + 2600);
        objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "quantityWithUnit:doubleValue:", v138, v135);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v214, v139, v108, v108, v211);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v212, "addObject:", v140);

        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "statisticsSampleGenerator");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "heartRateSampleFrequency");
        v144 = v143;
        objc_msgSend(v101, "heartRateSampleFrequencyStdDev");
        objc_msgSend(v142, "computeStatisticalTimeFromCurrentTime:mean:stdDev:", v122, v144, v145 * 0.5);
        v147 = v146;

        objc_msgSend(v108, "dateByAddingTimeInterval:", v147 * 86400.0);
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v107, "endDate");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v136) = objc_msgSend(v148, "hk_isBeforeDate:", v149);

        v108 = v148;
      }
      while ((v136 & 1) != 0);
    }
    else
    {
      v148 = v108;
    }
    v100 = v198;
    objc_msgSend(v198, "addObjectsFromWatch:", v212);

    v17 = 0x1E0CB6000;
    a5 = v200;
    v99 = v216;
    v97 = v199;
  }

  v150 = v101;
  v151 = v100;
  v152 = v97;
  v153 = v201;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "currentDateFromCurrentTime:", a5);
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v150, "birthDateComponents");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = HDDemoData_ageBetweenNSDateComponentsAndDate(v156, v155);

  v158 = 1.0;
  if (objc_msgSend(v150, "biologicalSex") == 1 && v157 >= 12)
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "reproductiveHealthSampleGenerator");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = objc_msgSend(v160, "cycleDayIndexAtTime:demoPerson:", v150, a5);

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "reproductiveHealthSampleGenerator");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "_basalBodyTempMultiplier");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "objectAtIndexedSubscript:", v161);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "doubleValue");
    v158 = v166;

    v17 = 0x1E0CB6000uLL;
    v16 = 0x1E0CB6000uLL;

  }
  objc_msgSend(v150, "baseCorrectedWristSkinTemperatureInCelsius");
  v168 = v158 * v167;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "statisticsSampleGenerator");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "dayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius");
  objc_msgSend(v170, "randomSampleFromNormalDistributionWithMean:stdDev:", 0.0, v171);
  v173 = v172;

  v174 = __exp10(2.0);
  v175 = (double)(uint64_t)((v168 + v173) * v174) / v174;
  v176 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeCelsiusUnit");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "quantityWithUnit:doubleValue:", v177, v175);
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  v179 = *(void **)(v16 + 2624);
  objc_msgSend(*(id *)(v17 + 2672), "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A68]);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "quantitySampleWithType:quantity:startDate:endDate:", v180, v178, v153, v152);
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v151, "addObjectFromWatch:", v181);
  v182 = v153;
  v183 = v152;
  v184 = v151;
  v185 = v150;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "features");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = objc_msgSend(v187, "nebula");

  if (v188)
  {
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A60]);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataSleepSampleGenerator randomGraphFromArray:]((unint64_t)self, self->_breathingDisturbancesGraphsArray);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v190, "count"));
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "doubleValue");
    v193 = v192;

    v194 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "quantityWithUnit:doubleValue:", v195, v193);
    v196 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v16 + 2624), "quantitySampleWithType:quantity:startDate:endDate:", v189, v196, v182, v183);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "addObjectFromWatch:", v197);

  }
  objc_msgSend(v184, "addObjectsFromPhone:", v207);
  objc_msgSend(v184, "addObjectsFromWatch:", v216);

  v12 = v205;
  v11 = v206;
LABEL_64:

}

void __108__HDDemoDataSleepSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4980]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v0;

}

- (id)randomGraphFromArray:(unint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    a1 = objc_msgSend(v3, "count");
    if (a1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", arc4random() % a1);
      a1 = objc_claimAutoreleasedReturnValue();
    }
  }

  return (id)a1;
}

- (double)computeAwakeTimeForDemoPerson:(id)a3 atTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = a3;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isDemoDataTimeInWeekend:calendar:", v8, a4);

  if ((v9 & 1) != 0)
    objc_msgSend(v6, "weekendSleepParameters");
  else
    objc_msgSend(v6, "weekdaySleepParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bedtime");
  v12 = v11;
  objc_msgSend(v6, "bedtimeNoiseStdDev");
  -[HDDemoDataSleepSampleGenerator computeSleepTimeFromCurrentTime:mean:stdDev:](self, "computeSleepTimeFromCurrentTime:mean:stdDev:", a4, v12, v13);
  v15 = v14;
  objc_msgSend(v10, "wakeUpTime");
  v17 = v16;
  objc_msgSend(v6, "wakeUpTimeNoiseStdDev");
  -[HDDemoDataSleepSampleGenerator computeSleepTimeFromCurrentTime:mean:stdDev:](self, "computeSleepTimeFromCurrentTime:mean:stdDev:", a4, v17, v18);
  v20 = v15 - v19;

  return v20;
}

- (double)computeSleepTimeFromCurrentTime:(double)a3 mean:(double)a4 stdDev:(double)a5
{
  void *v8;
  void *v9;
  double v10;
  double v11;

  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statisticsSampleGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "computeStatisticalTimeFromCurrentTime:mean:stdDev:", (double)(uint64_t)a3, a4, a5);
  v11 = v10;

  if (v11 > 1.0 || v11 < 0.0)
    return a4;
  else
    return v11;
}

- (BOOL)isDemoPersonAwake:(id)a3 atTime:(double)a4
{
  return !-[HDDemoDataSleepSampleGenerator isDemoPersonSleeping:atTime:](self, "isDemoPersonSleeping:atTime:", a3, a4);
}

- (BOOL)isDemoPersonSleeping:(id)a3 atTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;

  v6 = a3;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isDemoDataTimeInWeekend:calendar:", v8, a4);

  if ((v9 & 1) != 0)
    objc_msgSend(v6, "weekendSleepParameters");
  else
    objc_msgSend(v6, "weekdaySleepParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a4 - (double)(uint64_t)a4;
  objc_msgSend(v10, "bedtime");
  v13 = v12;
  objc_msgSend(v6, "bedtimeNoiseStdDev");
  -[HDDemoDataSleepSampleGenerator computeSleepTimeFromCurrentTime:mean:stdDev:](self, "computeSleepTimeFromCurrentTime:mean:stdDev:", a4, v13, v14);
  v16 = v15;
  objc_msgSend(v10, "wakeUpTime");
  v18 = v17;
  objc_msgSend(v6, "wakeUpTimeNoiseStdDev");
  -[HDDemoDataSleepSampleGenerator computeSleepTimeFromCurrentTime:mean:stdDev:](self, "computeSleepTimeFromCurrentTime:mean:stdDev:", a4, v18, v19);
  v21 = v11 != v20;
  if (v20 != v16)
    v21 = 0;
  v22 = v11 <= v20;
  if (v11 >= v16)
    v22 = 1;
  if (v16 > v20)
    v21 = v22;
  v23 = v11 < v20;
  if (v11 <= v16)
    v23 = 0;
  if (v20 > v16)
    v24 = v23;
  else
    v24 = v21;

  return v24;
}

- (id)createSleepSamplesFromSleepGraph:(id)a3 sleepCategoryType:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  __int128 *p_buf;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "count") && !objc_msgSend(v11, "hk_isAfterDate:", v12))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__34;
    v52 = __Block_byref_object_dispose__34;
    v53 = (id)objc_msgSend(v11, "copy");
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__34;
    v47 = __Block_byref_object_dispose__34;
    v48 = (id)objc_msgSend(v11, "copy");
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__34;
    v41 = __Block_byref_object_dispose__34;
    objc_msgSend(v9, "firstObject");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __103__HDDemoDataSleepSampleGenerator_createSleepSamplesFromSleepGraph_sleepCategoryType_startDate_endDate___block_invoke;
    v30 = &unk_1E6CEE4F0;
    v34 = &v37;
    v35 = &v43;
    v16 = v12;
    v31 = v16;
    v17 = v15;
    v32 = v17;
    v18 = v10;
    v33 = v18;
    p_buf = &buf;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v27);
    if (objc_msgSend((id)v38[5], "integerValue", v27, v28, v29, v30) != 2)
    {
      v19 = (void *)MEMORY[0x1E0CB6378];
      v20 = objc_msgSend((id)v38[5], "integerValue");
      v21 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      if ((objc_msgSend(v16, "hk_isAfterDate:", v21) & 1) == 0)
        v16 = (id)v44[5];
      objc_msgSend(v19, "categorySampleWithType:value:startDate:endDate:", v18, v20, v21, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v22);

    }
    v23 = v33;
    v14 = v17;

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      v25 = v13;
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
      v26 = *(id *)((char *)&buf + 4);
      _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "[%{public}@] Asked to make sleep samples with invalid input, returning empty", (uint8_t *)&buf, 0xCu);

    }
    v14 = (id)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

void __103__HDDemoDataSleepSampleGenerator_createSleepSamplesFromSleepGraph_sleepCategoryType_startDate_endDate___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "isEqualToNumber:"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "dateByAddingTimeInterval:", 30.0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[8] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "hk_isAfterDate:", a1[4]);
    v11 = v20;
    if (v10)
      *a4 = 1;
  }
  else
  {
    v12 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", a1[6], objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "integerValue"), *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "copy");
    v15 = *(_QWORD *)(a1[9] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "dateByAddingTimeInterval:", 30.0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1[8] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    v11 = v20;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breathingDisturbancesGraphsArray, 0);
  objc_storeStrong((id *)&self->_sleepGraphsArray, 0);
}

@end
