@implementation HDDemoDataActivitySampleGenerator

- (HDDemoDataActivitySampleGenerator)init
{
  HDDemoDataActivitySampleGenerator *v2;
  HDDemoDataActivitySampleGenerator *v3;
  HDDemoDataGeneratorWorkoutConfiguration *currentWorkoutConfiguration;
  _HDDemoDataActivityWorkoutState *workoutState;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDDemoDataActivitySampleGenerator;
  v2 = -[HDDemoDataBaseSampleGenerator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nextActiveCaloriesSampleTime = 0.0;
    v2->_nextPhysicalEffortSampleTime = 0.0;
    v2->_nextAppleStandHourSampleTime = 0.0;
    v2->_nextRestingCaloriesSampleTime = 0.0;
    v2->_nextFallSampleTime = 0.0;
    v2->_nextFlightsClimbedSampleTime = 0.0;
    v2->_nextStepsSampleTime = 0.0;
    v2->_nextExerciseMinuteTime = 0.0;
    v2->_nextHeartRateRecoveryStartTime = 0.0;
    v2->_nextHeartRateRecoveryStopTime = 0.0;
    v2->_nextRunningPowerSampleTime = 0.0;
    v2->_nextRunningStrideLengthSampleTime = 0.0;
    v2->_nextRunningVerticalOscillationSampleTime = 0.0;
    v2->_nextRunningGroundContactTimeSampleTime = 0.0;
    v2->_nextCyclingPowerSampleTime = 0.0;
    v2->_nextCyclingFTPSampleTime = 0.0;
    v2->_nextCyclingCadenceSampleTime = 0.0;
    v2->_nextCyclingSpeedSampleTime = 0.0;
    v2->_nextWaterTemperatureSampleTime = 0.0;
    v2->_nextCrossCountrySkiingSpeedSampleTime = 0.0;
    v2->_nextRowingSpeedSampleTime = 0.0;
    v2->_nextPaddleSportsSpeedSampleTime = 0.0;
    v2->_nextUVIndexSampleTime = 0.0;
    v2->_lastUVIndexPeakTime = 0.0;
    v2->_lastUVExposure = 0.0;
    v2->_lastUVIndexPeak = 0.0;
    currentWorkoutConfiguration = v2->_currentWorkoutConfiguration;
    v2->_currentWorkoutConfiguration = 0;

    workoutState = v3->_workoutState;
    v3->_workoutState = 0;

  }
  return v3;
}

- (HDDemoDataActivitySampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataActivitySampleGenerator *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  HKActivityCache *lastActivityCache;
  uint64_t v36;
  HDDemoDataGeneratorWorkoutConfiguration *currentWorkoutConfiguration;
  uint64_t v38;
  _HDDemoDataActivityWorkoutState *workoutState;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)HDDemoDataActivitySampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v41, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextActiveCaloriesSampleTimeKey"));
    v5->_nextActiveCaloriesSampleTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextPhysicalEffortSampleTimeKey"));
    v5->_nextPhysicalEffortSampleTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextAppleStandHourSampleTimeKey"));
    v5->_nextAppleStandHourSampleTime = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRestingCaloriesSampleTimeKey"));
    v5->_nextRestingCaloriesSampleTime = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextFallSampleTimeKey"));
    v5->_nextFallSampleTime = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextFlightSampleTimeKey"));
    v5->_nextFlightsClimbedSampleTime = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextStepsSampleTimeKey"));
    v5->_nextStepsSampleTime = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextExerciseMinuteSampleTimeKey"));
    v5->_nextExerciseMinuteTime = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRunningPowerSampleTimeKey"));
    v5->_nextRunningPowerSampleTime = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRunningStrideLengthSampleTimeKey"));
    v5->_nextRunningStrideLengthSampleTime = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRunningVerticalOscillationSampleTimeKey"));
    v5->_nextRunningVerticalOscillationSampleTime = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRunningGroundContactTimeSampleTimeKey"));
    v5->_nextRunningGroundContactTimeSampleTime = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCyclingPowerSampleTimeKey"));
    v5->_nextCyclingPowerSampleTime = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCyclingFTPSampleTimeKey"));
    v5->_nextCyclingFTPSampleTime = v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCyclingCadenceSampleTimeKey"));
    v5->_nextCyclingCadenceSampleTime = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCyclingSpeedSampleTimeKey"));
    v5->_nextCyclingSpeedSampleTime = v21;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextWaterTemperatureSampleTimeKey"));
    v5->_nextWaterTemperatureSampleTime = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCrossCountrySkiingSpeedSampleTimeKey"));
    v5->_nextCrossCountrySkiingSpeedSampleTime = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRowingSpeedSampleTimeKey"));
    v5->_nextRowingSpeedSampleTime = v24;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextPaddleSportsSpeedSampleTimeKey"));
    v5->_nextPaddleSportsSpeedSampleTime = v25;
    v26 = objc_msgSend(v4, "containsValueForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStartTimeKey"));
    v27 = 0.0;
    v28 = 0.0;
    if (v26)
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStartTimeKey"), 0.0);
    v5->_nextHeartRateRecoveryStartTime = v28;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStopTimeKey")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStopTimeKey"));
      v27 = v29;
    }
    v5->_nextHeartRateRecoveryStopTime = v27;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextUVIndexSampleTimeKey"));
    v5->_nextUVIndexSampleTime = v30;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorLastUVIndexPeakTimeKey"));
    v5->_lastUVIndexPeakTime = v31;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorLastUVExposureKey"));
    v5->_lastUVExposure = v32;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataActivitySampleGeneratorLastUVIndexPeakKey"));
    v5->_lastUVIndexPeak = v33;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDemoDataActivitySampleGeneratorLastActivityCache"));
    v34 = objc_claimAutoreleasedReturnValue();
    lastActivityCache = v5->_lastActivityCache;
    v5->_lastActivityCache = (HKActivityCache *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDemoDataActivitySampleGeneratorCurrentWorkoutConfiguration"));
    v36 = objc_claimAutoreleasedReturnValue();
    currentWorkoutConfiguration = v5->_currentWorkoutConfiguration;
    v5->_currentWorkoutConfiguration = (HDDemoDataGeneratorWorkoutConfiguration *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDemoDataActivitySampleGeneratorWorkoutState"));
    v38 = objc_claimAutoreleasedReturnValue();
    workoutState = v5->_workoutState;
    v5->_workoutState = (_HDDemoDataActivityWorkoutState *)v38;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataActivitySampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextActiveCaloriesSampleTimeKey"), self->_nextActiveCaloriesSampleTime, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextPhysicalEffortSampleTimeKey"), self->_nextPhysicalEffortSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextAppleStandHourSampleTimeKey"), self->_nextAppleStandHourSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRestingCaloriesSampleTimeKey"), self->_nextRestingCaloriesSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextFallSampleTimeKey"), self->_nextFallSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextFlightSampleTimeKey"), self->_nextFlightsClimbedSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextStepsSampleTimeKey"), self->_nextStepsSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextExerciseMinuteSampleTimeKey"), self->_nextExerciseMinuteTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStartTimeKey"), self->_nextHeartRateRecoveryStartTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStopTimeKey"), self->_nextHeartRateRecoveryStopTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRunningPowerSampleTimeKey"), self->_nextRunningPowerSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRunningStrideLengthSampleTimeKey"), self->_nextRunningStrideLengthSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRunningVerticalOscillationSampleTimeKey"), self->_nextRunningVerticalOscillationSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRunningGroundContactTimeSampleTimeKey"), self->_nextRunningGroundContactTimeSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCyclingCadenceSampleTimeKey"), self->_nextCyclingCadenceSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCyclingSpeedSampleTimeKey"), self->_nextCyclingSpeedSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCyclingPowerSampleTimeKey"), self->_nextCyclingPowerSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCyclingFTPSampleTimeKey"), self->_nextCyclingFTPSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextWaterTemperatureSampleTimeKey"), self->_nextWaterTemperatureSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextCrossCountrySkiingSpeedSampleTimeKey"), self->_nextCrossCountrySkiingSpeedSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextRowingSpeedSampleTimeKey"), self->_nextRowingSpeedSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextPaddleSportsSpeedSampleTimeKey"), self->_nextPaddleSportsSpeedSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorNextUVIndexSampleTimeKey"), self->_nextUVIndexSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorLastUVIndexPeakTimeKey"), self->_lastUVIndexPeakTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorLastUVExposureKey"), self->_lastUVExposure);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataActivitySampleGeneratorLastUVIndexPeakKey"), self->_lastUVIndexPeak);
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastActivityCache, CFSTR("HDDemoDataActivitySampleGeneratorLastActivityCache"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentWorkoutConfiguration, CFSTR("HDDemoDataActivitySampleGeneratorCurrentWorkoutConfiguration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutState, CFSTR("HDDemoDataActivitySampleGeneratorWorkoutState"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setProfile:(id)a3 provenance:(id)a4
{
  HDDataOriginProvenance *v6;
  HDDataOriginProvenance *provenance;
  objc_super v8;

  v6 = (HDDataOriginProvenance *)a4;
  v8.receiver = self;
  v8.super_class = (Class)HDDemoDataActivitySampleGenerator;
  -[HDDemoDataBaseSampleGenerator setProfile:](&v8, sel_setProfile_, a3);
  provenance = self->_provenance;
  self->_provenance = v6;

}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDDemoDataActivitySampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v21, sel_setupWithDemoDataGenerator_, v4);
  if (!-[HDDemoDataBaseSampleGenerator createdFromNSKeyedUnarchiver](self, "createdFromNSKeyedUnarchiver"))
  {
    objc_msgSend(v4, "demoPerson");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeCaloriesSampleFrequency");
    self->_nextActiveCaloriesSampleTime = v6;

    objc_msgSend(v4, "demoPerson");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sedentarySampleFrequency");
    self->_nextAppleStandHourSampleTime = v8;

    objc_msgSend(v4, "demoPerson");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "restingCaloriesSampleFrequency");
    self->_nextRestingCaloriesSampleTime = v10;

    objc_msgSend(v4, "demoPerson");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIncrementDuringExercise");
    self->_nextPhysicalEffortSampleTime = v12;

    objc_msgSend(v4, "demoPerson");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fallSampleFrequency");
    self->_nextFallSampleTime = v14;

    objc_msgSend(v4, "demoPerson");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "flightsClimbedSampleTime");
    self->_nextFlightsClimbedSampleTime = v16;

    objc_msgSend(v4, "demoPerson");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uvIndexSampleFrequency");
    self->_nextUVIndexSampleTime = v18;

    objc_msgSend(v4, "demoPerson");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "exerciseTimeSampleFrequency");
    self->_nextExerciseMinuteTime = v20;

  }
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataActivitySampleGenerator;
  -[HDDemoDataBaseSampleGenerator generateFirstRunObjectsForDemoPerson:firstDate:objectCollection:](&v5, sel_generateFirstRunObjectsForDemoPerson_firstDate_objectCollection_, a3, a4, a5);
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  int v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  int v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  unint64_t v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  double v139;
  void *v140;
  void *v141;
  int v142;
  double v143;
  double v144;
  double v145;
  double v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  double v168;
  double v169;
  void *v170;
  void *v171;
  double v172;
  double v173;
  void *v174;
  void *v175;
  char v176;
  double v177;
  double v178;
  void *v179;
  void *v180;
  double v181;
  double v182;
  double v183;
  void *v184;
  void *v185;
  double v186;
  double v187;
  double v188;
  double v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  double v194;
  uint64_t v195;
  double v196;
  void *v197;
  void *v198;
  double v199;
  double v200;
  id v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  id v207;
  id v208;
  id v209;
  void *v210;
  void *v211;
  void *v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  id v217;
  void *v218;
  void *v219;
  int v220;
  double v221;
  double v222;
  void *v223;
  void *v224;
  char v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  uint64_t v230;
  _QWORD *v231;
  uint64_t v232;
  void *v233;
  void *v234;
  uint64_t v235;
  void *v236;
  id v237;
  id v238;
  void *v239;
  void *v240;
  int v241;
  void *v242;
  void *v243;
  void *v244;
  double v245;
  double v246;
  double v247;
  double v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  double v256;
  double v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  double v263;
  double v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  double v270;
  double v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  double v277;
  double v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  double v284;
  double v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  int v290;
  void *v291;
  id v292;
  id v293;
  id v294;
  double v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double nextRunningPowerSampleTime;
  void *v302;
  void *v303;
  double v304;
  id v305;
  id v306;
  id v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double nextRunningStrideLengthSampleTime;
  void *v315;
  void *v316;
  double v317;
  id v318;
  id v319;
  id v320;
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double nextRunningVerticalOscillationSampleTime;
  void *v328;
  void *v329;
  double v330;
  id v331;
  id v332;
  id v333;
  double v334;
  double v335;
  double v336;
  double v337;
  double v338;
  double v339;
  double nextRunningGroundContactTimeSampleTime;
  void *v341;
  void *v342;
  double v343;
  void *v344;
  void *v345;
  int v346;
  void *v347;
  void *v348;
  id v349;
  id v350;
  id v351;
  double v352;
  double v353;
  double v354;
  double v355;
  double v356;
  double v357;
  double nextCyclingPowerSampleTime;
  void *v359;
  void *v360;
  double v361;
  id v362;
  id v363;
  id v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double nextCyclingFTPSampleTime;
  void *v372;
  void *v373;
  double v374;
  id v375;
  id v376;
  id v377;
  double v378;
  double v379;
  double v380;
  double v381;
  double v382;
  double v383;
  double nextCyclingCadenceSampleTime;
  void *v385;
  void *v386;
  double v387;
  id v388;
  id v389;
  id v390;
  double v391;
  double v392;
  double v393;
  double v394;
  double v395;
  double v396;
  double nextCyclingSpeedSampleTime;
  void *v398;
  void *v399;
  double v400;
  void *v401;
  void *v402;
  int v403;
  id v404;
  id v405;
  id v406;
  double v407;
  double v408;
  double v409;
  double v410;
  double v411;
  double v412;
  double nextWaterTemperatureSampleTime;
  void *v414;
  void *v415;
  double v416;
  void *v417;
  void *v418;
  int v419;
  id v420;
  id v421;
  id v422;
  double v423;
  double v424;
  double v425;
  double v426;
  double v427;
  double v428;
  double nextCrossCountrySkiingSpeedSampleTime;
  void *v430;
  void *v431;
  double v432;
  void *v433;
  void *v434;
  int v435;
  id v436;
  id v437;
  id v438;
  double v439;
  double v440;
  double v441;
  double v442;
  double v443;
  double v444;
  double nextRowingSpeedSampleTime;
  void *v446;
  void *v447;
  double v448;
  void *v449;
  void *v450;
  int v451;
  id v452;
  id v453;
  id v454;
  double v455;
  double v456;
  double v457;
  double v458;
  double v459;
  double v460;
  double nextPaddleSportsSpeedSampleTime;
  void *v462;
  void *v463;
  double v464;
  id v465;
  id v466;
  void *v467;
  void *v468;
  int v469;
  void *v470;
  uint64_t v471;
  double v472;
  void *v473;
  void *v474;
  double v475;
  double v476;
  void *v477;
  void *v478;
  double v479;
  double v480;
  double v481;
  double v482;
  double v483;
  void *v484;
  void *v485;
  double v486;
  id v487;
  double v488;
  double v489;
  double v490;
  void *v491;
  void *v492;
  char v493;
  double v494;
  double v495;
  double v496;
  double v497;
  double v498;
  void *v499;
  void *v500;
  void *v501;
  double v502;
  uint64_t v503;
  void *v504;
  void *v505;
  double v506;
  double v507;
  double v508;
  double v509;
  double v510;
  void *v511;
  void *v512;
  double v513;
  double v514;
  double v515;
  double v516;
  double v517;
  void *v518;
  void *v519;
  int v520;
  double v521;
  void *v522;
  void *v523;
  void *v524;
  double v525;
  double v526;
  double v527;
  void *v528;
  void *v529;
  void *v530;
  char v531;
  void *v532;
  void *v533;
  double v534;
  void *v535;
  double v536;
  void *v537;
  double v538;
  double lastUVExposure;
  void *v540;
  void *v541;
  char v542;
  double v543;
  void *v544;
  void *v545;
  double v546;
  double v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  id v554;
  HKActivityCache *lastActivityCache;
  void *v556;
  int v557;
  void *v558;
  void *v559;
  int v560;
  void *v561;
  int v562;
  int v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  void *v568;
  void *v569;
  void *v570;
  void *v571;
  void *v572;
  uint64_t v573;
  void *v574;
  void *v575;
  uint64_t v576;
  void *v577;
  void *v578;
  uint64_t v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  HKActivityCache *v588;
  HKActivityCache *v589;
  HKActivityCache *v590;
  void *v591;
  void *v592;
  void *v593;
  HKActivityCache *v594;
  void *v595;
  void *v596;
  void *v597;
  uint64_t v598;
  void *v599;
  double v600;
  unint64_t v601;
  uint64_t v602;
  void *v603;
  double v604;
  unint64_t v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  void *v611;
  char v612;
  double v613;
  double v614;
  HKActivityCache *v615;
  void *v616;
  void *v617;
  void *v618;
  void *v619;
  int v620;
  void *v621;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  void *v629;
  void *v630;
  void *v631;
  void *v632;
  void *v633;
  void *v634;
  void *v635;
  int v636;
  void *v637;
  void *v638;
  void *v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  void *v644;
  void *v645;
  void *v646;
  void *v647;
  void *v648;
  void *v649;
  void *v650;
  void *v651;
  void *v652;
  objc_super v653;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v653.receiver = self;
  v653.super_class = (Class)HDDemoDataActivitySampleGenerator;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v653, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v11, v12, v13, a5, a5);
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v640 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
  v641 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  v15 = v14;
  v651 = v12;
  v652 = v13;
  if (!self)
  {

    v207 = v15;
    v30 = 0;
    goto LABEL_20;
  }
  if (self->_nextActiveCaloriesSampleTime <= a5)
  {
    objc_msgSend(v14, "activeCaloriesSampleFrequency");
    self->_nextActiveCaloriesSampleTime = v16 + self->_nextActiveCaloriesSampleTime;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generatorState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isExercising");

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      objc_msgSend(v20, "generatorState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "workoutConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "kcalRate");
      v25 = v24;

      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v15, "activeCaloriesSampleFrequency");
      v28 = v25 * v27;
      v29 = v26;
LABEL_5:
      objc_msgSend(v29, "numberWithDouble:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend(v20, "statisticsSampleGenerator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "randomDoubleFromGenerator");
    v33 = v32;

    if (v33 >= 0.12)
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sleepSampleGenerator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isDemoPersonAwake:atTime:", v15, a5);

      if (v36)
      {
        objc_msgSend(v15, "activeCaloriesSampleFrequency");
        if (-[HDDemoDataActivitySampleGenerator _isDemoPersonWalking:atTime:samplePeriod:](self, "_isDemoPersonWalking:atTime:samplePeriod:", v15, a5, v37))
        {
          -[HDDemoDataActivitySampleGenerator flightsClimbedForDemoPerson:atTime:]((double *)self, v15, a5);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "doubleValue");
          v40 = v39;
          objc_msgSend(v15, "activeCaloriesSampleFrequency");
          v42 = v41 / 0.000694444444;
          -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "statisticsSampleGenerator");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "activeCaloriesSampleFrequency");
          v46 = v45 / 0.000694444444;
          if (v40 == 0.0)
          {
            objc_msgSend(v44, "computeNoiseFromTime:stdDev:", a5, v46 * 100.0);
            v48 = v47 + v42 * 864.0;
          }
          else
          {
            objc_msgSend(v44, "computeNoiseFromTime:stdDev:", a5, v46 * 120.0);
            v54 = v53 + v42 * 1152.0;
            objc_msgSend(v38, "doubleValue");
            v48 = v54 + v55;
          }

        }
        else
        {
          objc_msgSend(v15, "activeCaloriesSampleFrequency");
          v50 = v49 / 0.000694444444;
          -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "statisticsSampleGenerator");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "activeCaloriesSampleFrequency");
          objc_msgSend(v43, "computeNoiseFromTime:stdDev:", a5, v51 / 0.000694444444 * 45.0);
          v48 = v52 + v50 * 244.8;
        }

        if (v48 > 0.00000011920929)
        {
          v56 = (double)(arc4random_uniform(9u) + 1);
          v29 = (void *)MEMORY[0x1E0CB37E8];
          v28 = v48 / (v56 + 6.0);
          goto LABEL_5;
        }
      }
    }
  }
  v30 = 0;
LABEL_17:

  v57 = v15;
  if (self->_nextExerciseMinuteTime > a5)
  {
LABEL_20:

    v63 = 0;
    v64 = 1;
    goto LABEL_21;
  }
  v58 = v57;
  v646 = v30;
  v648 = v15;
  objc_msgSend(v57, "exerciseTimeSampleFrequency");
  self->_nextExerciseMinuteTime = v59 + a5;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sleepSampleGenerator");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "isDemoPersonSleeping:atTime:", v58, a5);

  if ((v62 & 1) != 0)
  {
LABEL_19:
    v30 = v646;
    v15 = v648;
    goto LABEL_20;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "generatorState");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "isExercising");

  if (v85)
  {
    objc_msgSend(v58, "timeIncrementDuringExercise");
    v644 = &unk_1E6DFC308;
LABEL_55:

    goto LABEL_56;
  }
  objc_msgSend(v58, "timeIncrement");
  v145 = v144;
  objc_msgSend(v58, "activeCaloriesSampleFrequency");
  if (-[HDDemoDataActivitySampleGenerator _isDemoPersonWalking:atTime:samplePeriod:](self, "_isDemoPersonWalking:atTime:samplePeriod:", v58, a5, v146))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random_uniform((uint64_t)(v145 * 86400.0 / 60.0) / 8) + 1);
    v644 = (void *)objc_claimAutoreleasedReturnValue();
    if (v644)
      goto LABEL_55;
  }
  if ((double)arc4random_uniform(0x64u) / 100.0 >= 0.1)
    goto LABEL_19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random_uniform(3u) + 1);
  v195 = objc_claimAutoreleasedReturnValue();

  v644 = (void *)v195;
  if (!v195)
  {
    v63 = 0;
    v64 = 1;
    v30 = v646;
    v15 = v648;
    goto LABEL_21;
  }
LABEL_56:
  v147 = objc_msgSend(v644, "integerValue");
  if (v147 >= 1)
  {
    v148 = v147;
    v149 = *MEMORY[0x1E0CB5A50];
    v150 = 60;
    do
    {
      objc_msgSend(v12, "dateByAddingTimeInterval:", (double)(v150 - 60));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingTimeInterval:", (double)v150);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = (void *)MEMORY[0x1E0CB6A40];
      objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", v149);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "quantityWithUnit:doubleValue:", v156, 1.0);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "quantitySampleWithType:quantity:startDate:endDate:", v154, v157, v151, v152);
      v158 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v652;
      objc_msgSend(v652, "addObjectFromWatch:", v158);

      v12 = v651;
      v150 += 60;
      --v148;
    }
    while (v148);
  }
  v63 = v644;
  v30 = v646;
  if (v646)
  {
    v64 = 0;
    v15 = v648;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)arc4random_uniform(0xAu) / 100.0 + 0.5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v15 = v648;
LABEL_21:
  if (!v30)
  {
    v69 = 0;
    goto LABEL_24;
  }
LABEL_22:
  v65 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v30, "doubleValue");
  objc_msgSend(v65, "quantityWithUnit:doubleValue:", v641);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)MEMORY[0x1E0CB6A40];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "quantitySampleWithType:quantity:startDate:endDate:", v68, v66, v12, v12);
  v69 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObjectFromWatch:", v69);
LABEL_24:
  v70 = v15;
  v71 = v30;
  v72 = v63;
  v638 = (void *)v69;
  v636 = v64;
  if (self && self->_nextAppleStandHourSampleTime <= a5)
  {
    objc_msgSend(v70, "sedentarySampleFrequency");
    self->_nextAppleStandHourSampleTime = v74 + self->_nextAppleStandHourSampleTime;
    if (v64)
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "sleepSampleGenerator");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "isDemoPersonAwake:atTime:", v70, a5);

      if (v77)
      {
        objc_msgSend(v70, "sedentarySampleFrequency");
        v73 = &unk_1E6DFC320;
        if (!-[HDDemoDataActivitySampleGenerator _isDemoPersonWalking:atTime:samplePeriod:](self, "_isDemoPersonWalking:atTime:samplePeriod:", v70, a5, v78))
        {
          -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "statisticsSampleGenerator");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "pseudoRandomDoubleFromTime:", a5);
          v82 = v81;

          if (v82 >= 0.75)
            v73 = &unk_1E6DFC338;
        }
      }
      else if (v71)
      {
        v73 = &unk_1E6DFC338;
      }
      else
      {
        v73 = 0;
      }
    }
    else
    {
      v73 = &unk_1E6DFC320;
    }
  }
  else
  {
    v73 = 0;
  }
  v639 = v72;

  v637 = v71;
  v86 = v73;
  if (v86)
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "gregorianCalendar");
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v88, "components:fromDate:", 62, v12);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "dateFromComponents:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "dateByAddingUnit:value:toDate:options:", 32, 1, v90, 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4880]);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", v92, objc_msgSend(v86, "integerValue"), v90, v91);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v652, "addObjectFromWatch:", v93);

  }
  v647 = v86;
  v94 = v70;
  v95 = v94;
  if (!self)
  {

    v208 = v95;
    v209 = v208;
    v634 = 0;
    v96 = 0x1E0CB6000uLL;
    v97 = 0;
    goto LABEL_83;
  }
  v96 = 0x1E0CB6000uLL;
  if (self->_nextRestingCaloriesSampleTime <= a5)
  {
    objc_msgSend(v94, "restingCaloriesSampleFrequency");
    self->_nextRestingCaloriesSampleTime = v99 + self->_nextRestingCaloriesSampleTime;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "bodySampleGenerator");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "lastWeightInKg");
    v103 = v102;

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "bodySampleGenerator");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "lastHeightInCm");
    v107 = v106;

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "currentDateFromCurrentTime:", a5);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v95, "birthDateComponents");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = (double)HDDemoData_ageBetweenNSDateComponentsAndDate(v110, v109);

    +[HDDemoDataFormula computeBasalMetabolicRateFromWeight:height:age:sex:](HDDemoDataFormula, "computeBasalMetabolicRateFromWeight:height:age:sex:", objc_msgSend(v95, "biologicalSex"), v103, v107, v111);
    v113 = v112;
    objc_msgSend(v95, "restingCaloriesSampleFrequency");
    v115 = v113 * v114;
    v116 = (void *)MEMORY[0x1E0CB37E8];
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "statisticsSampleGenerator");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "restingCaloriesSampleFrequency");
    objc_msgSend(v118, "computeNoiseFromTime:stdDev:", a5, v115 * v119);
    objc_msgSend(v116, "numberWithDouble:", v115 + v120);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v97)
      goto LABEL_47;
    v121 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v97, "doubleValue");
    objc_msgSend(v121, "quantityWithUnit:doubleValue:", v641);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A88]);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "quantitySampleWithType:quantity:startDate:endDate:", v123, v98, v12, v12);
    v124 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v652, "addObjectFromWatch:", v124);
  }
  else
  {
    v97 = 0;
    v98 = v94;
  }

LABEL_47:
  v125 = v95;
  v126 = v125;
  if (self->_nextPhysicalEffortSampleTime > a5)
  {
    v127 = 0;
    v128 = v125;
LABEL_64:
    v634 = v127;

    goto LABEL_65;
  }
  objc_msgSend(v125, "timeIncrementDuringExercise");
  v130 = v129;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "statisticsSampleGenerator");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "genericSampleTimeNoiseStdDev");
  objc_msgSend(v132, "computeNoiseFromTime:stdDev:", a5, v133);
  self->_nextPhysicalEffortSampleTime = v130 + v134 + self->_nextPhysicalEffortSampleTime;

  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "sleepSampleGenerator");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v136, "isDemoPersonSleeping:atTime:", v126, a5);

  if (v137)
  {
    v138 = (void *)MEMORY[0x1E0CB37E8];
    v139 = (double)arc4random_uniform(0x14u) / 100.0;
  }
  else
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "generatorState");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v141, "isExercising");

    v138 = (void *)MEMORY[0x1E0CB37E8];
    if (v142)
    {
      v143 = (double)arc4random_uniform(0x32u) / 100.0 + 3.0;
      v139 = v143 + (double)arc4random_uniform(0x12u);
    }
    else
    {
      v139 = (double)arc4random_uniform(0x1F4u) / 100.0 + 0.5;
    }
  }
  objc_msgSend(v138, "numberWithDouble:", v139);
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  if (v159)
  {
    v160 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("kcal/(kg*hr)"));
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "doubleValue");
    objc_msgSend(v160, "quantityWithUnit:doubleValue:", v161);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    v162 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D10]);
    v163 = v159;
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "quantitySampleWithType:quantity:startDate:endDate:", v164, v128, v12, v12);
    v165 = (void *)objc_claimAutoreleasedReturnValue();

    v127 = v163;
    objc_msgSend(v652, "addObjectFromWatch:", v165);

    goto LABEL_64;
  }
  v634 = 0;
LABEL_65:
  v166 = v126;
  if (self->_nextFallSampleTime <= a5)
  {
    v167 = v166;
    objc_msgSend(v166, "fallSampleFrequency");
    v169 = v168;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "statisticsSampleGenerator");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "genericSampleTimeNoiseStdDev");
    objc_msgSend(v171, "computeNoiseFromTime:stdDev:", a5, v172);
    self->_nextFallSampleTime = v169 + v173 + self->_nextFallSampleTime;

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "sleepSampleGenerator");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend(v175, "isDemoPersonSleeping:atTime:", v167, a5);

    if ((v176 & 1) == 0)
    {
      objc_msgSend(v167, "fallsDailyMean");
      v178 = v177;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "statisticsSampleGenerator");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "fallsDailyStdDev");
      objc_msgSend(v180, "computeNoiseFromTime:stdDev:", a5, v181);
      v183 = v178 + v182;

      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "sleepSampleGenerator");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "computeAwakeTimeForDemoPerson:atTime:", v167, a5);
      v187 = v186;

      objc_msgSend(v167, "fallSampleFrequency");
      v189 = v183 / (v187 / v188);
      objc_msgSend(v167, "birthDateComponents");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "currentDateFromCurrentTime:", a5);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = HDDemoData_ageBetweenNSDateComponentsAndDate(v190, v192);

      if (v193 >= 5)
      {
        if ((unint64_t)(v193 - 11) >= 0xB)
          v194 = (unint64_t)v193 < 0x33 ? 0.4 : (double)((130 - v193) / 130);
        else
          v194 = 0.8;
      }
      else
      {
        v194 = 1.3;
      }
      v196 = v189 * v194;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "statisticsSampleGenerator");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "pseudoRandomDoubleFromTime:", a5);
      v200 = v199;

      if (v200 < v196)
      {

        v201 = &unk_1E6DFC308;
        v202 = (void *)MEMORY[0x1E0CB6A28];
        v633 = &unk_1E6DFC308;
        objc_msgSend(&unk_1E6DFC308, "doubleValue");
        objc_msgSend(v202, "quantityWithUnit:doubleValue:", v640);
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = (void *)MEMORY[0x1E0CB6A40];
        objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CE8]);
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "quantitySampleWithType:quantity:startDate:endDate:", v205, v203, v12, v12);
        v206 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v652, "addObjectFromPhone:", v206);
        goto LABEL_84;
      }
    }
  }
LABEL_83:

  v633 = 0;
LABEL_84:
  if (objc_msgSend(MEMORY[0x1E0CA5698], "isFloorCountingAvailable"))
  {
    -[HDDemoDataActivitySampleGenerator flightsClimbedForDemoPerson:atTime:]((double *)self, v95, a5);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = v210;
    if (v210)
    {
      v212 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v210, "doubleValue");
      objc_msgSend(v212, "quantityWithUnit:doubleValue:", v640);
      v213 = objc_claimAutoreleasedReturnValue();
      v214 = (void *)MEMORY[0x1E0CB6A40];
      objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C90]);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "quantitySampleWithType:quantity:startDate:endDate:", v215, v213, v12, v12);
      v216 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v652, "addObjectFromWatch:", v216);
    }
    else
    {
      v213 = 0;
    }

  }
  else
  {
    v213 = 0;
  }
  v217 = v95;
  v635 = v97;
  if (!self || self->_nextStepsSampleTime > a5)
    goto LABEL_96;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "generatorState");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = objc_msgSend(v219, "isExercising");

  if (v220)
    objc_msgSend(v217, "stepsSampleFrequencyDuringExercise");
  else
    objc_msgSend(v217, "stepsSampleFrequency");
  v222 = v221;
  self->_nextStepsSampleTime = v221 + a5;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "sleepSampleGenerator");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v225 = objc_msgSend(v224, "isDemoPersonSleeping:atTime:", v217, a5);

  if ((v225 & 1) != 0)
  {
LABEL_96:
    v226 = 0;
    v227 = 0;
    v228 = 0;
    v229 = v217;
LABEL_97:
    v632 = v226;

    goto LABEL_98;
  }
  if (-[HDDemoDataActivitySampleGenerator _isDemoPersonWalking:atTime:samplePeriod:](self, "_isDemoPersonWalking:atTime:samplePeriod:", v217, a5, v222))
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v491 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v492 = (void *)objc_claimAutoreleasedReturnValue();
    v493 = objc_msgSend(v491, "isDemoDataTimeInWeekend:calendar:", v492, a5);

    if ((v493 & 1) != 0)
      objc_msgSend(v217, "weekendSleepParameters");
    else
      objc_msgSend(v217, "weekdaySleepParameters");
    v500 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v504 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v504, "sleepSampleGenerator");
    v505 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v500, "bedtime");
    v507 = v506;
    objc_msgSend(v217, "bedtimeNoiseStdDev");
    objc_msgSend(v505, "computeSleepTimeFromCurrentTime:mean:stdDev:", a5, v507, v508);
    v510 = v509;

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v511 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v511, "sleepSampleGenerator");
    v512 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v500, "wakeUpTime");
    v514 = v513;
    objc_msgSend(v217, "wakeUpTimeNoiseStdDev");
    objc_msgSend(v512, "computeSleepTimeFromCurrentTime:mean:stdDev:", a5, v514, v515);
    v517 = v516;

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v518 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v518, "generatorState");
    v519 = (void *)objc_claimAutoreleasedReturnValue();
    v520 = objc_msgSend(v519, "isRunning");

    if (v520)
    {
      v521 = v222 / 0.000694444444 * 100.0;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v522 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v522, "statisticsSampleGenerator");
      v523 = (void *)objc_claimAutoreleasedReturnValue();
      v524 = v523;
      v525 = 20.0;
    }
    else
    {
      v521 = (double)(arc4random_uniform(0x3E8u) + 9000) / ((v510 - v517) * 0.6 / v222);
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v522 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v522, "statisticsSampleGenerator");
      v523 = (void *)objc_claimAutoreleasedReturnValue();
      v524 = v523;
      v525 = 1.3;
    }
    objc_msgSend(v523, "computeNoiseFromTime:stdDev:", a5, v521 / v525);
    v527 = v521 + v526;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)fabs(v521 + v527));
    v503 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v499 = (void *)MEMORY[0x1E0CB37E8];
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v500 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v500, "statisticsSampleGenerator");
    v501 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v501, "computeNoiseFromTime:stdDev:", a5, 10.0);
    objc_msgSend(v499, "numberWithInteger:", (uint64_t)v502);
    v503 = objc_claimAutoreleasedReturnValue();

  }
  if (v503)
  {
    v528 = (void *)v503;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v529 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v529, "generatorState");
    v530 = (void *)objc_claimAutoreleasedReturnValue();
    v531 = objc_msgSend(v530, "isExercising");

    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D78]);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v531 & 1) != 0)
    {
      v532 = v640;
      v226 = v528;
      v228 = 0;
      v533 = v652;
    }
    else
    {
      v226 = v528;
      objc_msgSend(v528, "doubleValue");
      v532 = v640;
      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v640, fabs(v534));
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v229, v228, v12, v12);
      v535 = (void *)objc_claimAutoreleasedReturnValue();
      v533 = v652;
      objc_msgSend(v652, "addObjectFromPhone:", v535);

    }
    objc_msgSend(v226, "doubleValue");
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v532, fabs(v536 + (double)arc4random_uniform(5u)));
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v229, v227, v12, v12);
    v537 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v533, "addObjectFromWatch:", v537);

    v96 = 0x1E0CB6000;
    goto LABEL_97;
  }
  v632 = 0;
  v227 = 0;
  v228 = 0;
LABEL_98:
  -[HDDemoDataActivitySampleGenerator _computeWalkingRunningDistanceWithStepCount:demoPerson:](self, v228, v217);
  v230 = objc_claimAutoreleasedReturnValue();
  v231 = (_QWORD *)MEMORY[0x1E0CB5C68];
  v649 = (void *)v230;
  if (v230)
  {
    v232 = v230;
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C68]);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v233, v232, v12, v12);
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v652, "addObjectFromPhone:", v234);

  }
  -[HDDemoDataActivitySampleGenerator _computeWalkingRunningDistanceWithStepCount:demoPerson:](self, v227, v217);
  v235 = objc_claimAutoreleasedReturnValue();
  if (v235)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *v231);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v236, v235, v12, v12);
    v645 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v652, "addObjectFromWatch:");

  }
  else
  {
    v645 = 0;
  }
  v623 = (void *)v235;
  v237 = v227;
  v238 = v217;
  if (!self)
    goto LABEL_107;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "generatorState");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v241 = objc_msgSend(v240, "isExercising");

  if (!v241)
    goto LABEL_107;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "generatorState");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "workoutConfiguration");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "distanceCyclingRateInMiles");
  v246 = v245;

  objc_msgSend(v238, "stepsSampleFrequencyDuringExercise");
  v248 = v246 * v247;
  if (v248 > 0.00000011920929)
  {
    v249 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(*(id *)(v96 + 3280), "mileUnit");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v249, "quantityWithUnit:doubleValue:", v250, v248);
    v251 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_107:
    v251 = 0;
  }

  v643 = (void *)v213;
  if (v251)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C38]);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v252, v251, v12, v12);
    v630 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v652, "addObjectFromWatch:");

  }
  else
  {
    v630 = 0;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "generatorState");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "workoutConfiguration");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "distanceCrossCountrySkiingRateInMeters");
  v257 = v256;

  -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v257);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v631 = v228;
  if (v258)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C30]);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v259, v258, v12, v12);
    v629 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v652, "addObjectFromWatch:");

  }
  else
  {
    v629 = 0;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "generatorState");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v261, "workoutConfiguration");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "distanceRowingRateInMeters");
  v264 = v263;

  -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v264);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  if (v265)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C50]);
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v266, v265, v12, v12);
    v628 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v652, "addObjectFromWatch:");

  }
  else
  {
    v628 = 0;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "generatorState");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "workoutConfiguration");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "distanceSkatingSportsRateInMeters");
  v271 = v270;

  -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v271);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v642 = v237;
  if (v272)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C58]);
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v273, v272, v12, v12);
    v627 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v652, "addObjectFromWatch:");

  }
  else
  {
    v627 = 0;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "generatorState");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "workoutConfiguration");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "distancePaddleSportsRateInMeters");
  v278 = v277;

  -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v278);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  if (v279)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C48]);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v280, v279, v12, v12);
    v626 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v652, "addObjectFromWatch:");

  }
  else
  {
    v626 = 0;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "generatorState");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "workoutConfiguration");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "distanceDownhillSnowSportsRateInMeters");
  v285 = v284;

  -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v285);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  if (v286)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C40]);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v287, v286, v651, v651);
    v625 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v652, "addObjectFromWatch:");

  }
  else
  {
    v625 = 0;
  }

  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v288, "generatorState");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v290 = objc_msgSend(v289, "isRunning");

  v291 = v652;
  v650 = v238;
  if (self && v290)
  {
    v292 = v652;
    v293 = v651;
    v294 = v238;
    objc_msgSend(v294, "runningPowerMean");
    v296 = v295;
    objc_msgSend(v294, "runningPowerMeanStdDev");
    v298 = v297;
    objc_msgSend(v294, "timeIncrementDuringExercise");
    v300 = v299;
    nextRunningPowerSampleTime = self->_nextRunningPowerSampleTime;
    v302 = (void *)*MEMORY[0x1E0CB5D40];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "wattUnit");
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    v304 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v293, v292, v302, v303, self->_workoutState, a5, nextRunningPowerSampleTime, v296, v298, v300);

    self->_nextRunningPowerSampleTime = v304;
    v305 = v292;
    v306 = v293;
    v307 = v294;
    objc_msgSend(v307, "runningStrideLengthMean");
    v309 = v308;
    objc_msgSend(v307, "runningStrideLengthMeanStdDev");
    v311 = v310;
    objc_msgSend(v307, "timeIncrementDuringExercise");
    v313 = v312;
    nextRunningStrideLengthSampleTime = self->_nextRunningStrideLengthSampleTime;
    v315 = (void *)*MEMORY[0x1E0CB5D50];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    v317 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v306, v305, v315, v316, self->_workoutState, a5, nextRunningStrideLengthSampleTime, v309, v311, v313);

    self->_nextRunningStrideLengthSampleTime = v317;
    v318 = v305;
    v319 = v306;
    v320 = v307;
    objc_msgSend(v320, "runningVerticalOscillationMean");
    v322 = v321;
    objc_msgSend(v320, "runningVerticalOscillationMeanStdDev");
    v324 = v323;
    objc_msgSend(v320, "timeIncrementDuringExercise");
    v326 = v325;
    nextRunningVerticalOscillationSampleTime = self->_nextRunningVerticalOscillationSampleTime;
    v328 = (void *)*MEMORY[0x1E0CB5D58];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    v330 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v319, v318, v328, v329, self->_workoutState, a5, nextRunningVerticalOscillationSampleTime, v322, v324, v326);

    self->_nextRunningVerticalOscillationSampleTime = v330;
    v331 = v318;
    v332 = v319;
    v333 = v320;
    objc_msgSend(v333, "runningGroundContactTimeMean");
    v335 = v334;
    objc_msgSend(v333, "runningGroundContactTimeMeanStdDev");
    v337 = v336;
    objc_msgSend(v333, "timeIncrementDuringExercise");
    v339 = v338;
    nextRunningGroundContactTimeSampleTime = self->_nextRunningGroundContactTimeSampleTime;
    v341 = (void *)*MEMORY[0x1E0CB5D38];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ms"));
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    v343 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v332, v331, v341, v342, self->_workoutState, a5, nextRunningGroundContactTimeSampleTime, v335, v337, v339);

    self->_nextRunningGroundContactTimeSampleTime = v343;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "generatorState");
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v346 = objc_msgSend(v345, "isCycling");

  v347 = v645;
  v348 = v651;
  if (self && v346)
  {
    v349 = v652;
    v350 = v651;
    v351 = v238;
    objc_msgSend(v351, "cyclingPowerMean");
    v353 = v352;
    objc_msgSend(v351, "cyclingPowerMeanStdDev");
    v355 = v354;
    objc_msgSend(v351, "timeIncrementDuringExercise");
    v357 = v356;
    nextCyclingPowerSampleTime = self->_nextCyclingPowerSampleTime;
    v359 = (void *)*MEMORY[0x1E0CB5AE8];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "wattUnit");
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    v361 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v350, v349, v359, v360, self->_workoutState, a5, nextCyclingPowerSampleTime, v353, v355, v357);

    self->_nextCyclingPowerSampleTime = v361;
    v362 = v349;
    v363 = v350;
    v364 = v351;
    objc_msgSend(v364, "cyclingFTPMean");
    v366 = v365;
    objc_msgSend(v364, "cyclingFTPMeanStdDev");
    v368 = v367;
    objc_msgSend(v364, "timeIncrementDuringExercise");
    v370 = v369;
    nextCyclingFTPSampleTime = self->_nextCyclingFTPSampleTime;
    v372 = (void *)*MEMORY[0x1E0CB5AE0];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "wattUnit");
    v373 = (void *)objc_claimAutoreleasedReturnValue();
    v374 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v363, v362, v372, v373, self->_workoutState, a5, nextCyclingFTPSampleTime, v366, v368, v370);

    self->_nextCyclingFTPSampleTime = v374;
    v375 = v362;
    v376 = v363;
    v377 = v364;
    objc_msgSend(v377, "cyclingCadenceMean");
    v379 = v378;
    objc_msgSend(v377, "cyclingCadenceMeanStdDev");
    v381 = v380;
    objc_msgSend(v377, "timeIncrementDuringExercise");
    v383 = v382;
    nextCyclingCadenceSampleTime = self->_nextCyclingCadenceSampleTime;
    v385 = (void *)*MEMORY[0x1E0CB5AD8];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
    v386 = (void *)objc_claimAutoreleasedReturnValue();
    v387 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v376, v375, v385, v386, self->_workoutState, a5, nextCyclingCadenceSampleTime, v379, v381, v383);

    self->_nextCyclingCadenceSampleTime = v387;
    v388 = v375;
    v389 = v376;
    v390 = v377;
    objc_msgSend(v390, "cyclingSpeedMean");
    v392 = v391;
    objc_msgSend(v390, "speedMeanStdDev");
    v394 = v393;
    objc_msgSend(v390, "timeIncrementDuringExercise");
    v396 = v395;
    nextCyclingSpeedSampleTime = self->_nextCyclingSpeedSampleTime;
    v398 = (void *)*MEMORY[0x1E0CB5AF0];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
    v399 = (void *)objc_claimAutoreleasedReturnValue();
    v400 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v389, v388, v398, v399, self->_workoutState, a5, nextCyclingSpeedSampleTime, v392, v394, v396);

    self->_nextCyclingSpeedSampleTime = v400;
    v348 = v651;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v401, "generatorState");
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v403 = objc_msgSend(v402, "isUnderwaterDiving");

  if (self && v403)
  {
    v404 = v652;
    v405 = v348;
    v406 = v238;
    objc_msgSend(v406, "underwaterDivingWaterTemperatureMean");
    v408 = v407;
    objc_msgSend(v406, "underwaterDivingWaterTemperatureStdDev");
    v410 = v409;
    objc_msgSend(v406, "timeIncrementDuringExercise");
    v412 = v411;
    nextWaterTemperatureSampleTime = self->_nextWaterTemperatureSampleTime;
    v414 = (void *)*MEMORY[0x1E0CB5DD0];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeCelsiusUnit");
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    v416 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v405, v404, v414, v415, self->_workoutState, a5, nextWaterTemperatureSampleTime, v408, v410, v412);

    self->_nextWaterTemperatureSampleTime = v416;
    v348 = v651;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v417, "generatorState");
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  v419 = objc_msgSend(v418, "isCrossCountrySkiing");

  if (self && v419)
  {
    v420 = v652;
    v421 = v348;
    v422 = v238;
    objc_msgSend(v422, "crossCountrySkiingSpeedMean");
    v424 = v423;
    objc_msgSend(v422, "speedMeanStdDev");
    v426 = v425;
    objc_msgSend(v422, "timeIncrementDuringExercise");
    v428 = v427;
    nextCrossCountrySkiingSpeedSampleTime = self->_nextCrossCountrySkiingSpeedSampleTime;
    v430 = (void *)*MEMORY[0x1E0CB5AD0];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    v432 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v421, v420, v430, v431, self->_workoutState, a5, nextCrossCountrySkiingSpeedSampleTime, v424, v426, v428);

    self->_nextCrossCountrySkiingSpeedSampleTime = v432;
    v348 = v651;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v433, "generatorState");
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  v435 = objc_msgSend(v434, "isRowing");

  if (self && v435)
  {
    v436 = v652;
    v437 = v348;
    v438 = v238;
    objc_msgSend(v438, "rowingSpeedMean");
    v440 = v439;
    objc_msgSend(v438, "speedMeanStdDev");
    v442 = v441;
    objc_msgSend(v438, "timeIncrementDuringExercise");
    v444 = v443;
    nextRowingSpeedSampleTime = self->_nextRowingSpeedSampleTime;
    v446 = (void *)*MEMORY[0x1E0CB5D30];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
    v447 = (void *)objc_claimAutoreleasedReturnValue();
    v448 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v437, v436, v446, v447, self->_workoutState, a5, nextRowingSpeedSampleTime, v440, v442, v444);

    self->_nextRowingSpeedSampleTime = v448;
    v348 = v651;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v449, "generatorState");
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  v451 = objc_msgSend(v450, "isPaddleSports");

  if (v451)
  {
    if (!self)
    {
      v554 = v238;
      goto LABEL_187;
    }
    v452 = v652;
    v453 = v348;
    v454 = v238;
    objc_msgSend(v454, "paddleSportsSpeedMean");
    v456 = v455;
    objc_msgSend(v454, "speedMeanStdDev");
    v458 = v457;
    objc_msgSend(v454, "timeIncrementDuringExercise");
    v460 = v459;
    nextPaddleSportsSpeedSampleTime = self->_nextPaddleSportsSpeedSampleTime;
    v462 = (void *)*MEMORY[0x1E0CB5CF8];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
    v463 = (void *)objc_claimAutoreleasedReturnValue();
    v464 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v453, v452, v462, v463, self->_workoutState, a5, nextPaddleSportsSpeedSampleTime, v456, v458, v460);

    self->_nextPaddleSportsSpeedSampleTime = v464;
    v348 = v651;
    v465 = v454;
  }
  else
  {
    v466 = v238;
    if (!self)
    {
LABEL_187:
      v624 = 0;
      goto LABEL_188;
    }
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v467, "sleepSampleGenerator");
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  v469 = objc_msgSend(v468, "isDemoPersonAwake:atTime:", v238, a5);

  if (!v469)
    goto LABEL_187;
  if (self->_nextUVIndexSampleTime > a5)
  {
    v624 = 0;
LABEL_188:
    v550 = v238;
    goto LABEL_189;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  v471 = objc_msgSend(v470, "firstSampleDayOfYear");

  if ((uint64_t)a5 > (uint64_t)self->_lastUVIndexPeakTime)
  {
    v472 = (double)((uint64_t)((double)((uint64_t)((double)v471 + a5) % 365) / 91.0) + 5);
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v473 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v473, "statisticsSampleGenerator");
    v474 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v474, "pseudoRandomDoubleFromTime:", a5);
    v476 = v472 + v475 * 2.0;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v477 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v477, "statisticsSampleGenerator");
    v478 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v478, "computeNoiseFromTime:stdDev:", a5 + 1.0, 2.5);
    v480 = v476 + v479 + self->_lastUVIndexPeak / 7.0;

    v481 = 0.0;
    if (v480 >= 0.0)
      v481 = v480;
    self->_lastUVIndexPeak = fmin(v481, 11.0);
    self->_lastUVIndexPeakTime = a5;
  }
  objc_msgSend(v238, "uvIndexSampleFrequency");
  v483 = v482;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v484, "statisticsSampleGenerator");
  v485 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v485, "computeNoiseFromTime:stdDev:", a5, 0.00833333333);
  self->_nextUVIndexSampleTime = v483 + v486 + self->_nextUVIndexSampleTime;

  v487 = v238;
  v488 = a5 - (double)(uint64_t)a5;
  objc_msgSend(v487, "dawnTime");
  v489 = 0.0001;
  if (v488 >= v490)
  {
    objc_msgSend(v487, "sunsetTime");
    v348 = v651;
    if (v488 <= v494)
    {
      if (v488 >= 0.541666667)
      {
        objc_msgSend(v487, "sunsetTime");
        v498 = 1.0 - (v488 + -0.541666667) / (v538 + -0.541666667);
      }
      else
      {
        objc_msgSend(v487, "dawnTime");
        v496 = v488 - v495;
        objc_msgSend(v487, "dawnTime");
        v498 = v496 / (0.541666667 - v497);
      }
      v489 = v498 * self->_lastUVIndexPeak;
    }
  }
  else
  {
    v348 = v651;
  }

  lastUVExposure = self->_lastUVExposure;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v540 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v540, "generatorState");
  v541 = (void *)objc_claimAutoreleasedReturnValue();
  v542 = objc_msgSend(v541, "isExercising");

  if ((v542 & 1) == 0)
  {
    objc_msgSend(v487, "uvIndexSampleFrequency");
    if (-[HDDemoDataActivitySampleGenerator _isDemoPersonWalking:atTime:samplePeriod:](self, "_isDemoPersonWalking:atTime:samplePeriod:", v487, a5, v543))
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v544, "statisticsSampleGenerator");
      v545 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v545, "pseudoRandomDoubleFromTime:", a5);
      v547 = v546;

      if (lastUVExposure <= 1.0)
      {
        if (v547 < 0.35)
          goto LABEL_181;
      }
      else if (v547 >= 0.55)
      {
        goto LABEL_181;
      }
      goto LABEL_180;
    }
    if (lastUVExposure <= 1.0)
LABEL_180:
      v489 = (double)arc4random_uniform(2u);
  }
LABEL_181:
  self->_lastUVExposure = v489;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v489);
  v548 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v548)
  {
    v624 = 0;
    v238 = v650;
    goto LABEL_190;
  }
  v549 = (void *)MEMORY[0x1E0CB6A28];
  v624 = v548;
  objc_msgSend(v548, "doubleValue");
  objc_msgSend(v549, "quantityWithUnit:doubleValue:", v640);
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  v551 = (void *)MEMORY[0x1E0CB6A40];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D90]);
  v552 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v551, "quantitySampleWithType:quantity:startDate:endDate:", v552, v550, v348, v348);
  v553 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v652, "addObjectFromPhone:", v553);
  v238 = v650;
LABEL_189:

LABEL_190:
  lastActivityCache = self->_lastActivityCache;
  if (lastActivityCache)
  {
    -[HKActivityCache endDate](lastActivityCache, "endDate");
    v556 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v348, "hk_isAfterDate:", v556) & 1) != 0)
    {
      v557 = 1;
    }
    else
    {
      -[HKActivityCache startDate](self->_lastActivityCache, "startDate");
      v558 = (void *)objc_claimAutoreleasedReturnValue();
      v557 = objc_msgSend(v348, "hk_isBeforeDate:", v558);

    }
  }
  else
  {
    v557 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v559 = (void *)objc_claimAutoreleasedReturnValue();
  v560 = objc_msgSend(v559, "isStandalonePhoneFitnessMode");

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v561 = (void *)objc_claimAutoreleasedReturnValue();
  v562 = objc_msgSend(v561, "BOOLForKey:", CFSTR("HealthDemoDataLegacyActivityDataGenerationKey"));

  v563 = v560 & (v562 ^ 1);
  if (v557)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v564 = (void *)objc_claimAutoreleasedReturnValue();
    _HKActivityCacheDateComponentsFromDate();
    v622 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v564, "startOfDayForDate:", v348);
    v565 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v564, "dateByAddingUnit:value:toDate:options:", 16, 1, v565, 0);
    v566 = (void *)objc_claimAutoreleasedReturnValue();
    v619 = v564;
    objc_msgSend(v564, "startOfDayForDate:", v566);
    v621 = (void *)objc_claimAutoreleasedReturnValue();

    v567 = (void *)MEMORY[0x1E0CB6A28];
    v620 = v563;
    v568 = v238;
    objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
    v569 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "moveGoal");
    objc_msgSend(v567, "quantityWithUnit:doubleValue:", v569);
    v570 = (void *)objc_claimAutoreleasedReturnValue();

    v571 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(MEMORY[0x1E0CB6A70], "dataTypeWithCode:", 67);
    v572 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v571, "quantitySampleWithType:quantity:startDate:endDate:", v572, v570, v565, v565);
    v573 = objc_claimAutoreleasedReturnValue();

    v618 = (void *)v573;
    objc_msgSend(v652, "addObjectFromWatch:", v573);
    v574 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
    v575 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "exerciseGoal");
    objc_msgSend(v574, "quantityWithUnit:doubleValue:", v575);
    v576 = objc_claimAutoreleasedReturnValue();

    v577 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(MEMORY[0x1E0CB6A70], "dataTypeWithCode:", 105);
    v578 = (void *)objc_claimAutoreleasedReturnValue();
    v617 = (void *)v576;
    objc_msgSend(v577, "quantitySampleWithType:quantity:startDate:endDate:", v578, v576, v565, v565);
    v579 = objc_claimAutoreleasedReturnValue();

    v616 = (void *)v579;
    objc_msgSend(v652, "addObjectFromWatch:", v579);
    v580 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
    v581 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v568, "standGoal");
    objc_msgSend(v580, "quantityWithUnit:doubleValue:", v581);
    v582 = (void *)objc_claimAutoreleasedReturnValue();

    v583 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(MEMORY[0x1E0CB6A70], "dataTypeWithCode:", 104);
    v584 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v583, "quantitySampleWithType:quantity:startDate:endDate:", v584, v582, v565, v565);
    v585 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v652, "addObjectFromWatch:", v585);
    v586 = (void *)MEMORY[0x1E0CB6268];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v587 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v586, "_activityCacheWithUUID:startDate:endDate:dateComponents:sequence:", v587, v565, v621, v622, 1);
    v588 = (HKActivityCache *)objc_claimAutoreleasedReturnValue();
    v589 = self->_lastActivityCache;
    self->_lastActivityCache = v588;

    v563 = v620;
    -[HKActivityCache _setEnergyBurnedGoal:](self->_lastActivityCache, "_setEnergyBurnedGoal:", v570);
    if ((v620 & 1) == 0)
    {
      v590 = self->_lastActivityCache;
      v591 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
      v592 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v591, "quantityWithUnit:doubleValue:", v592, 30.0);
      v593 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivityCache _setBriskMinutesGoal:](v590, "_setBriskMinutesGoal:", v593);

      v594 = self->_lastActivityCache;
      v595 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
      v596 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v595, "quantityWithUnit:doubleValue:", v596, 12.0);
      v597 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKActivityCache _setActiveHoursGoal:](v594, "_setActiveHoursGoal:", v597);

      v563 = v620;
    }

    v348 = v651;
    v291 = v652;
    v347 = v645;
  }
  else
  {
    -[HKActivityCache _setSequence:](self->_lastActivityCache, "_setSequence:", -[HKActivityCache sequence](self->_lastActivityCache, "sequence") + 1);
  }
  if (v642)
  {
    v598 = -[HKActivityCache stepCount](self->_lastActivityCache, "stepCount");
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
    v599 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v642, "doubleValueForUnit:", v599);
    v601 = v598 + llround(v600);

    -[HKActivityCache _setStepCount:](self->_lastActivityCache, "_setStepCount:", v601);
  }
  if (objc_msgSend(MEMORY[0x1E0CA5698], "isFloorCountingAvailable") && v643)
  {
    v602 = -[HKActivityCache flightsClimbed](self->_lastActivityCache, "flightsClimbed");
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
    v603 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v643, "doubleValueForUnit:", v603);
    v605 = v602 + llround(v604);

    -[HKActivityCache _setFlightsClimbed:](self->_lastActivityCache, "_setFlightsClimbed:", v605);
  }
  if (v347)
  {
    -[HKActivityCache walkingAndRunningDistance](self->_lastActivityCache, "walkingAndRunningDistance");
    v606 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v347, "quantity");
    v607 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataActivitySampleGenerator _sumQuantity:withQuantity:](self, v606, v607);
    v608 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKActivityCache _setWalkingAndRunningDistance:](self->_lastActivityCache, "_setWalkingAndRunningDistance:", v608);
  }
  if (v638)
  {
    -[HKActivityCache energyBurned](self->_lastActivityCache, "energyBurned");
    v609 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v638, "quantity");
    v610 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataActivitySampleGenerator _sumQuantity:withQuantity:](self, v609, v610);
    v611 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKActivityCache _setEnergyBurned:](self->_lastActivityCache, "_setEnergyBurned:", v611);
  }
  if (v647)
  {
    v612 = objc_msgSend(v647, "integerValue") ? 1 : v563;
    if ((v612 & 1) == 0)
    {
      -[HKActivityCache activeHours](self->_lastActivityCache, "activeHours");
      -[HKActivityCache _setActiveHours:](self->_lastActivityCache, "_setActiveHours:", v613 + 1.0);
    }
  }
  if (((v636 | v563) & 1) == 0)
  {
    -[HKActivityCache briskMinutes](self->_lastActivityCache, "briskMinutes");
    -[HKActivityCache _setBriskMinutes:](self->_lastActivityCache, "_setBriskMinutes:", v614 + (double)objc_msgSend(v639, "integerValue"));
  }
  v615 = self->_lastActivityCache;
  if ((v563 & 1) != 0)
    objc_msgSend(v291, "addObjectFromPhone:", v615);
  else
    objc_msgSend(v291, "addObjectFromWatch:", v615);
  -[HDDemoDataActivitySampleGenerator _updateWorkoutStateWithActiveEnergyBurned:distanceWalking:distanceCycling:distanceCrossCountrySkiing:distanceRowing:distanceSkatingSports:distancePaddleSports:distanceDownhillSnowSports:currentTime:date:objectCollection:demoPerson:](self, v638, v645, v630, v629, v628, v627, v626, v625, v348, v291, v650);

}

- (double)flightsClimbedForDemoPerson:(double)a3 atTime:
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (a1[10] <= a3)
    {
      objc_msgSend(v5, "flightsClimbedSampleFrequency");
      v8 = v7;
      objc_msgSend(a1, "demoDataGenerator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "statisticsSampleGenerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flightsClimbedSampleFrequencyStdDev");
      objc_msgSend(v10, "computeNoiseFromTime:stdDev:", a3, v11);
      a1[10] = v8 + v12 + a1[10];

      objc_msgSend(a1, "_computeFlightsClimbedForDemoPerson:atTime:", v6, a3);
      a1 = (double *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_computeWalkingRunningDistanceWithStepCount:(void *)a3 demoPerson:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;

  v5 = a2;
  v6 = a3;
  v7 = 0;
  if (a1 && v5)
  {
    objc_msgSend(a1, "demoDataGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "generatorState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isExercising");

    if (v10)
    {
      objc_msgSend(a1, "demoDataGenerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "generatorState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "workoutConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "distanceWalkingRateInMiles");
      v15 = v14;

      objc_msgSend(v6, "stepsSampleFrequencyDuringExercise");
      v17 = v15 * v16;
      if (v17 > 0.00000011920929)
      {
        v18 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "mileUnit");
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v22 = (void *)v19;
        objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19, v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValueForUnit:", v20);
      v17 = v21 * 2.5;

      if (v17 > 0.00000011920929)
      {
        v18 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    v7 = 0;
  }
LABEL_10:

  return v7;
}

- (id)_computeDistanceWithDistanceRate:(double)a3 DemoPerson:
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "demoDataGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "generatorState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isExercising");

    if (v8 && (objc_msgSend(v5, "exerciseTimeSampleFrequency"), v10 = v9 * a3, v10 > 0.00000011920929))
    {
      v11 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12, v10);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_sumQuantity:(void *)a3 withQuantity:
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (v6)
      {
        objc_msgSend(v5, "_quantityByAddingQuantity:", v6);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = v5;
      }
    }
    else
    {
      v8 = v6;
    }
    a1 = v8;
  }

  return a1;
}

- (void)_updateWorkoutStateWithActiveEnergyBurned:(_QWORD *)a1 distanceWalking:(void *)a2 distanceCycling:(void *)a3 distanceCrossCountrySkiing:(void *)a4 distanceRowing:(void *)a5 distanceSkatingSports:(void *)a6 distancePaddleSports:(void *)a7 distanceDownhillSnowSports:(void *)a8 currentTime:(void *)a9 date:(void *)a10 objectCollection:(void *)a11 demoPerson:(void *)a12
{
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _HDDemoDataActivityWorkoutState *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  double v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  double v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  double v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  double v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  double v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  double v89;
  uint64_t v90;
  void *v91;
  _QWORD *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint32_t v111;
  uint32_t v112;
  uint32_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t i;
  void *v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  int v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  id v171;
  id v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  id v181;
  NSObject *v182;
  NSObject *v183;
  id v184;
  _QWORD *v185;
  _QWORD *v186;
  void *v187;
  _QWORD *v188;
  _QWORD *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  id v194;
  void *v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  void *v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  id v217[3];
  __int128 buf;
  void (*v219)(uint64_t, void *);
  void *v220;
  id v221;
  id v222;
  uint64_t v223;
  __int128 *v224;
  uint64_t v225;

  v225 = *MEMORY[0x1E0C80C00];
  v212 = a2;
  v211 = a3;
  v19 = a4;
  v20 = a5;
  v210 = a6;
  v209 = a7;
  v208 = a8;
  v207 = a9;
  v205 = a10;
  v21 = v20;
  v206 = a11;
  v204 = a12;
  if (!a1)
    goto LABEL_153;
  v22 = a1[33];
  v23 = (uint64_t)a1;
  objc_msgSend(a1, "demoDataGenerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "generatorState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isExercising");

  v27 = v23;
  if (((v22 == 0) & v26) == 1)
  {
    objc_msgSend((id)v23, "demoDataGenerator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "generatorState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "workoutConfiguration");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(void **)(v23 + 256);
    *(_QWORD *)(v23 + 256) = v30;

    v32 = objc_alloc_init(_HDDemoDataActivityWorkoutState);
    v33 = *(void **)(v23 + 264);
    *(_QWORD *)(v23 + 264) = v32;

    v34 = *(_QWORD *)(v23 + 264);
    if (v34)
    {
      objc_storeStrong((id *)(v34 + 56), a10);
      v35 = v23;
      v36 = *(_QWORD *)(v23 + 264);
    }
    else
    {
      v36 = 0;
      v35 = v23;
    }
    v37 = objc_msgSend(*(id *)(v35 + 256), "activityType");
    if (v36)
      *(_QWORD *)(v36 + 32) = v37;
    v38 = v35;
    v39 = *(_QWORD *)(v35 + 264);
    objc_msgSend(*(id *)(v38 + 256), "goal");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      objc_storeStrong((id *)(v39 + 48), v40);

    v27 = v23;
    v41 = *(_QWORD *)(v23 + 264);
    v42 = objc_msgSend(*(id *)(v23 + 256), "goalType");
    if (v41)
      *(_QWORD *)(v41 + 40) = v42;
    objc_msgSend(*(id *)(v23 + 256), "endTime");
    *(double *)(v23 + 104) = v43;
    *(double *)(v23 + 112) = v43 + *MEMORY[0x1E0CB7830] * 0.0000115740741;
  }
  if (!v26)
  {
    if (!v22)
      goto LABEL_153;
    if (!_HKWorkoutActivityTypeIsValid())
    {
LABEL_151:
      v191 = *(void **)(v27 + 256);
      *(_QWORD *)(v27 + 256) = 0;

      v91 = *(void **)(v27 + 264);
      *(_QWORD *)(v27 + 264) = 0;
LABEL_152:

      goto LABEL_153;
    }
    v92 = *(_QWORD **)(v27 + 264);
    if (v92)
    {
      v93 = v92[4];
      if (v93 <= 51)
      {
        switch(v93)
        {
          case '#':
          case '%':
            -[HDDemoDataActivitySampleGenerator _generateRunningWorkoutDataWithObjectCollection:demoPerson:workoutState:](v206, v204, *(void **)(v27 + 264));
            break;
          case '$':
          case '&':
          case '(':
          case '*':
          case '+':
          case ',':
          case '-':
            goto LABEL_84;
          case '\'':
          case ')':
            goto LABEL_72;
          case '.':
            -[HDDemoDataActivitySampleGenerator _generateSwimmingWorkoutDataWithObjectCollection:demoPerson:](v27, v206, v204);
            break;
          default:
            switch(v93)
            {
              case 16:
                goto LABEL_69;
              case 17:
              case 18:
              case 19:
              case 22:
              case 23:
                goto LABEL_84;
              case 20:
                goto LABEL_72;
              case 21:
                goto LABEL_78;
              case 24:
                v94 = &unk_1E6DF8ED0;
                v95 = &unk_1E6DF8EE8;
                goto LABEL_83;
              default:
                if (v93 == 31)
                  goto LABEL_78;
                break;
            }
            break;
        }
        goto LABEL_84;
      }
      if (v93 <= 76)
      {
        switch(v93)
        {
          case '4':
            v94 = &unk_1E6DF8EA0;
            v95 = &unk_1E6DF8EB8;
            goto LABEL_83;
          case '9':
LABEL_78:
            v94 = &unk_1E6DF8F00;
            v95 = &unk_1E6DF8F18;
            goto LABEL_83;
          case ';':
          case '<':
LABEL_69:
            -[HDDemoDataActivitySampleGenerator _generateEllipticalWorkoutDataWithObjectCollection:demoPerson:](v27, v206, v204);
            break;
          case '=':
          case '?':
          case 'C':
LABEL_72:
            -[HDDemoDataActivitySampleGenerator _generateHIITWorkoutDataWithObjectCollection:demoPerson:](v27, v206, v204);
            break;
          default:
            goto LABEL_84;
        }
        goto LABEL_84;
      }
      if (v93 == 77)
      {
        v94 = &unk_1E6DF8F60;
        v95 = &unk_1E6DF8F78;
      }
      else
      {
        if (v93 != 80)
        {
          if (v93 == 84)
            -[HDDemoDataActivitySampleGenerator _generateUnderwaterDivingWorkoutDataWithObjectCollection:demoPerson:](v27, v206, v204);
          goto LABEL_84;
        }
        v94 = &unk_1E6DF8F30;
        v95 = &unk_1E6DF8F48;
      }
LABEL_83:
      -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](v94, v95, v206, v92);
    }
LABEL_84:
    v96 = *(_QWORD *)(v27 + 264);
    objc_msgSend((id)v27, "profile");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = *(void **)(v23 + 32);
    v202 = v205;
    v201 = v97;
    v198 = v98;
    if (!v96)
    {
      v167 = 0;
      goto LABEL_140;
    }
    v99 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "quantityWithUnit:doubleValue:", v100, *(double *)(v96 + 64));
    v199 = (void *)objc_claimAutoreleasedReturnValue();

    v101 = *(_QWORD *)(v96 + 32);
    if (v101 > 45)
    {
      if (v101 > 60)
      {
        if (v101 == 61 || v101 == 67)
        {
          v106 = (void *)MEMORY[0x1E0CB6A28];
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "quantityWithUnit:doubleValue:", v103, *(double *)(v96 + 128));
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_104;
        }
      }
      else
      {
        if (v101 == 46)
        {
          v108 = (void *)MEMORY[0x1E0CB6A28];
          objc_msgSend(MEMORY[0x1E0CB6CD0], "yardUnit");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "quantityWithUnit:doubleValue:", v103, *(double *)(v96 + 88));
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_104;
        }
        if (v101 == 60)
        {
          v104 = (void *)MEMORY[0x1E0CB6A28];
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "quantityWithUnit:doubleValue:", v103, *(double *)(v96 + 96));
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_104;
        }
      }
    }
    else if (v101 > 34)
    {
      if (v101 == 35)
      {
        v109 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "quantityWithUnit:doubleValue:", v103, *(double *)(v96 + 104));
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_104;
      }
      if (v101 == 39)
      {
        v105 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "quantityWithUnit:doubleValue:", v103, *(double *)(v96 + 112));
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_104;
      }
    }
    else
    {
      if (v101 == 13)
      {
        v107 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "quantityWithUnit:doubleValue:", v103, *(double *)(v96 + 80));
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_104;
      }
      if (v101 == 31)
      {
        v102 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "quantityWithUnit:doubleValue:", v103, *(double *)(v96 + 120));
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_104;
      }
    }
    v110 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "quantityWithUnit:doubleValue:", v103, *(double *)(v96 + 72));
    v200 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_104:

    v197 = v19;
    v203 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v111 = arc4random_uniform(0xAu);
    v112 = arc4random_uniform(0x1Eu);
    v113 = arc4random_uniform(5u);
    v114 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeFahrenheitUnit");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "quantityWithUnit:doubleValue:", v115, (double)(v111 + 55));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v203, "setObject:forKeyedSubscript:", v116, *MEMORY[0x1E0CB5628]);

    v117 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "quantityWithUnit:doubleValue:", v118, (double)(v112 + 20));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v203, "setObject:forKeyedSubscript:", v119, *MEMORY[0x1E0CB5620]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v113 + 1);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v203, "setObject:forKeyedSubscript:", v120, *MEMORY[0x1E0CB5618]);

    v121 = *(_QWORD *)(v96 + 32);
    switch(v121)
    {
      case '%':
        v134 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "quantityWithUnit:doubleValue:", v135, 173.0);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v203, "setObject:forKeyedSubscript:", v136, *MEMORY[0x1E0CB7388]);

        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "dateByAddingUnit:value:toDate:options:", 8, -1, v138, 0);
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        v140 = *(id *)(v96 + 56);
        v141 = objc_msgSend(v140, "hk_isAfterDate:", v139);

        if (v141)
        {
          v142 = (void *)MEMORY[0x1E0CB6A28];
          objc_msgSend(MEMORY[0x1E0CB6CD0], "inchUnit");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "quantityWithUnit:doubleValue:", v143, 1236.0);
          v144 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v203, "setObject:forKeyedSubscript:", v144, *MEMORY[0x1E0CB54F8]);
        }

        v121 = *(_QWORD *)(v96 + 32);
        break;
      case '.':
        v122 = *(void **)(v96 + 24);
        v213 = 0u;
        v214 = 0u;
        v215 = 0u;
        v216 = 0u;
        v123 = v122;
        v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v213, &buf, 16);
        if (v124)
        {
          v195 = v21;
          v125 = 0;
          v126 = *(_QWORD *)v214;
          do
          {
            for (i = 0; i != v124; ++i)
            {
              if (*(_QWORD *)v214 != v126)
                objc_enumerationMutation(v123);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v213 + 1) + 8 * i), "type") == 3)
                ++v125;
            }
            v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v213, &buf, 16);
          }
          while (v124);

          v21 = v195;
          if (v125 >= 1)
          {
            objc_msgSend(MEMORY[0x1E0CB6CD0], "yardUnit");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v200, "doubleValueForUnit:", v128);
            v130 = v129;

            v131 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "yardUnit");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "quantityWithUnit:doubleValue:", v132, (double)(int)(v130 / (double)v125));
            v133 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v203, "setObject:forKeyedSubscript:", v133, *MEMORY[0x1E0CB5568]);
          }
        }
        else
        {

        }
        objc_msgSend(v203, "setObject:forKeyedSubscript:", &unk_1E6DFC338, *MEMORY[0x1E0CB55C0]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v96 + 144));
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v203, "setObject:forKeyedSubscript:", v176, *MEMORY[0x1E0CB55C8]);

        objc_msgSend(v203, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CB5558]);
        v177 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "quantityWithUnit:doubleValue:", v178, (double)(int)*(double *)(v96 + 136));
        v170 = (id)objc_claimAutoreleasedReturnValue();

        v179 = (void *)MEMORY[0x1E0CB6DD0];
        v180 = *(_QWORD *)(v96 + 32);
        v181 = *(id *)(v96 + 56);
        objc_msgSend(v179, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:totalSwimmingStrokeCount:totalFlightsClimbed:goalType:goal:device:metadata:", v180, v181, v202, *(_QWORD *)(v96 + 24), 0, v199, 0.0, 0, v200, v170, 0, 0, 0, 0, v203);
        v173 = (id)objc_claimAutoreleasedReturnValue();

LABEL_138:
        v167 = v173;
LABEL_139:
        v184 = *(id *)(v96 + 48);
        objc_msgSend(v167, "_setGoal:", v184);

        objc_msgSend(v167, "_setGoalType:", *(_QWORD *)(v96 + 40));
        v19 = v197;

LABEL_140:
        if (v167)
        {
          objc_msgSend(v206, "addObjectFromWatch:", v167);
          v185 = *(_QWORD **)(v23 + 264);
          if (v185)
            v185 = (_QWORD *)v185[1];
          v186 = v185;
          objc_msgSend(v167, "UUID");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v206, "setAssociatedObjectUUIDs:forObjectUUID:", v186, v187);

          objc_msgSend(v167, "workoutActivityType");
          if (HKCoreMotionSupportsEstimatedWorkoutEffortForActivityType())
            -[HDDemoDataActivitySampleGenerator _generateWorkoutEffortWithObjectCollection:forWorkout:dataType:](v23, v206, v167, (void *)*MEMORY[0x1E0CB5C88]);
          v188 = *(_QWORD **)(v23 + 264);
          if (v188 && v188[4] == 84
            || (-[HDDemoDataActivitySampleGenerator _generateWorkoutEffortWithObjectCollection:forWorkout:dataType:](v23, v206, v167, (void *)*MEMORY[0x1E0CB5DD8]), (v188 = *(_QWORD **)(v23 + 264)) != 0))
          {
            v188 = (_QWORD *)v188[2];
          }
          v189 = v188;
          objc_msgSend(v167, "UUID");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v206, "setLooseAssociatedObjectUUIDs:forObjectUUID:", v189, v190);

        }
        v27 = v23;
        goto LABEL_151;
      case 'C':
      case '=':
        v145 = objc_alloc(MEMORY[0x1E0CB3588]);
        v146 = *(id *)(v96 + 56);
        v147 = (void *)objc_msgSend(v145, "initWithStartDate:endDate:", v146, v202);

        v148 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v149 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mi/hr"));
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "quantityWithUnit:doubleValue:", v150, 7.7);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "setObject:forKeyedSubscript:", v151, *MEMORY[0x1E0CB54B8]);

        v152 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mi/hr"));
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "quantityWithUnit:doubleValue:", v153, 12.0);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "setObject:forKeyedSubscript:", v154, *MEMORY[0x1E0CB5580]);

        v155 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "quantityWithUnit:doubleValue:", v156, 15.0);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "setObject:forKeyedSubscript:", v157, *MEMORY[0x1E0CB5480]);

        v158 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "quantityWithUnit:doubleValue:", v159, 472.1);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "setObject:forKeyedSubscript:", v160, *MEMORY[0x1E0CB5500]);

        v161 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "quantityWithUnit:doubleValue:", v162, 5.0);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "setObject:forKeyedSubscript:", v163, *MEMORY[0x1E0CB54F8]);

        objc_msgSend(MEMORY[0x1E0CB6E50], "workoutEventWithType:dateInterval:metadata:", 7, v147, v148);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v96 + 24), "addObject:", v164);

        v121 = *(_QWORD *)(v96 + 32);
        break;
      default:
        v141 = 0;
        break;
    }
    v165 = (void *)MEMORY[0x1E0CB6DD0];
    v166 = *(id *)(v96 + 56);
    objc_msgSend(v165, "_workoutWithActivityType:startDate:endDate:workoutEvents:totalEnergyBurned:totalDistance:device:metadata:", v121, v166, v202, *(_QWORD *)(v96 + 24), v199, v200, 0, v203);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v141)
      goto LABEL_139;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "pathForResource:ofType:", CFSTR("GoldenGateLocationSeriesTrimmed"), CFSTR("json"));
    v169 = (void *)objc_claimAutoreleasedReturnValue();

    v170 = v169;
    v171 = v201;
    v172 = v198;
    v173 = v167;
    v196 = v172;
    if (v171)
    {
      if (v172)
      {
LABEL_127:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v170);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        if (v174)
        {
          v217[0] = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v174, 4, v217);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v194 = v217[0];
          if (v175)
          {
            *(_QWORD *)&v213 = 0;
            *((_QWORD *)&v213 + 1) = &v213;
            *(_QWORD *)&v214 = 0x3032000000;
            *((_QWORD *)&v214 + 1) = __Block_byref_object_copy__82;
            *(_QWORD *)&v215 = __Block_byref_object_dispose__82;
            objc_msgSend(v173, "startDate");
            *((_QWORD *)&v215 + 1) = objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v219 = __90___HDDemoDataActivityWorkoutState_addWorkoutRouteFromFilePath_profile_provenance_workout___block_invoke;
            v220 = &unk_1E6CF6840;
            v224 = &v213;
            v221 = v171;
            v222 = v196;
            v223 = v96;
            objc_msgSend(v175, "enumerateObjectsUsingBlock:", &buf);

            _Block_object_dispose(&v213, 8);
          }
          else
          {
            _HKInitializeLogging();
            v183 = *MEMORY[0x1E0CB52C8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v170;
              _os_log_impl(&dword_1B7802000, v183, OS_LOG_TYPE_DEFAULT, "Could not serialize from JSON data at file path: %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }

        }
        else
        {
          _HKInitializeLogging();
          v182 = *MEMORY[0x1E0CB52C8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v170;
            _os_log_impl(&dword_1B7802000, v182, OS_LOG_TYPE_DEFAULT, "Could not get data from file path: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }

        goto LABEL_138;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "handleFailureInMethod:object:file:lineNumber:description:", sel_addWorkoutRouteFromFilePath_profile_provenance_workout_, v96, CFSTR("HDDemoDataActivitySampleGenerator.m"), 2709, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

      if (v196)
        goto LABEL_127;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "handleFailureInMethod:object:file:lineNumber:description:", sel_addWorkoutRouteFromFilePath_profile_provenance_workout_, v96, CFSTR("HDDemoDataActivitySampleGenerator.m"), 2710, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provenance != nil"));

    goto LABEL_127;
  }
  if (v212)
  {
    v44 = *(_QWORD *)(v27 + 264);
    objc_msgSend(v212, "quantity");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValueForUnit:", v46);
    if (v44)
      *(double *)(v44 + 64) = v47 + *(double *)(v44 + 64);

    v48 = *(_QWORD *)(v23 + 264);
    objc_msgSend(v212, "UUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
      objc_msgSend(*(id *)(v48 + 8), "hk_appendBytesWithUUID:", v49);

    v27 = v23;
  }
  if (v211)
  {
    v50 = *(_QWORD *)(v27 + 264);
    objc_msgSend(v211, "quantity");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "doubleValueForUnit:", v52);
    if (v50)
      *(double *)(v50 + 72) = v53 + *(double *)(v50 + 72);

    v54 = *(_QWORD *)(v23 + 264);
    objc_msgSend(v211, "UUID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
      objc_msgSend(*(id *)(v54 + 8), "hk_appendBytesWithUUID:", v55);

    v27 = v23;
  }
  if (v19)
  {
    v56 = *(_QWORD *)(v27 + 264);
    objc_msgSend(v19, "quantity");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "doubleValueForUnit:", v58);
    if (v56)
      *(double *)(v56 + 80) = v59 + *(double *)(v56 + 80);

    v60 = *(_QWORD *)(v23 + 264);
    objc_msgSend(v19, "UUID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
      objc_msgSend(*(id *)(v60 + 8), "hk_appendBytesWithUUID:", v61);

    v27 = v23;
  }
  if (v20)
  {
    v62 = *(_QWORD *)(v27 + 264);
    objc_msgSend(v20, "quantity");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "doubleValueForUnit:", v64);
    if (v62)
      *(double *)(v62 + 96) = v65 + *(double *)(v62 + 96);

    v66 = *(_QWORD *)(v23 + 264);
    objc_msgSend(v20, "UUID");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
      objc_msgSend(*(id *)(v66 + 8), "hk_appendBytesWithUUID:", v67);

    v27 = v23;
  }
  if (v210)
  {
    v68 = *(_QWORD *)(v27 + 264);
    objc_msgSend(v210, "quantity");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "doubleValueForUnit:", v70);
    if (v68)
      *(double *)(v68 + 104) = v71 + *(double *)(v68 + 104);

    v72 = *(_QWORD *)(v23 + 264);
    objc_msgSend(v210, "UUID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
      objc_msgSend(*(id *)(v72 + 8), "hk_appendBytesWithUUID:", v73);

    v27 = v23;
  }
  if (v209)
  {
    v74 = *(_QWORD *)(v27 + 264);
    objc_msgSend(v209, "quantity");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "doubleValueForUnit:", v76);
    if (v74)
      *(double *)(v74 + 112) = v77 + *(double *)(v74 + 112);

    v78 = *(_QWORD *)(v23 + 264);
    objc_msgSend(v209, "UUID");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v78)
      objc_msgSend(*(id *)(v78 + 8), "hk_appendBytesWithUUID:", v79);

    v27 = v23;
  }
  if (v208)
  {
    v80 = *(_QWORD *)(v27 + 264);
    objc_msgSend(v208, "quantity");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "doubleValueForUnit:", v82);
    if (v80)
      *(double *)(v80 + 120) = v83 + *(double *)(v80 + 120);

    v84 = *(_QWORD *)(v23 + 264);
    objc_msgSend(v208, "UUID");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
      objc_msgSend(*(id *)(v84 + 8), "hk_appendBytesWithUUID:", v85);

    v27 = v23;
  }
  if (v207)
  {
    v86 = *(_QWORD *)(v27 + 264);
    objc_msgSend(v207, "quantity");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "doubleValueForUnit:", v88);
    if (v86)
      *(double *)(v86 + 128) = v89 + *(double *)(v86 + 128);

    v90 = *(_QWORD *)(v23 + 264);
    objc_msgSend(v207, "UUID");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
      objc_msgSend(*(id *)(v90 + 8), "hk_appendBytesWithUUID:", v91);
    goto LABEL_152;
  }
LABEL_153:

}

- (void)_generateHIITWorkoutDataWithObjectCollection:(void *)a3 demoPerson:
{
  void *v4;
  void *v5;
  id v6;
  id v8;
  _QWORD v9[302];

  v9[300] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v6 = a2;
  v9[0] = &unk_1E6DFB240;
  v9[1] = &unk_1E6DFB258;
  v9[2] = &unk_1E6DFB270;
  v9[3] = &unk_1E6DFB288;
  v9[4] = &unk_1E6DFB2A0;
  v9[5] = &unk_1E6DFB2B8;
  v9[6] = &unk_1E6DFB2D0;
  v9[7] = &unk_1E6DFB2A0;
  v9[8] = &unk_1E6DFB2B8;
  v9[9] = &unk_1E6DFB2E8;
  v9[10] = &unk_1E6DFB300;
  v9[11] = &unk_1E6DFB300;
  v9[12] = &unk_1E6DFB318;
  v9[13] = &unk_1E6DFB330;
  v9[14] = &unk_1E6DFB348;
  v9[15] = &unk_1E6DFB360;
  v9[16] = &unk_1E6DFB348;
  v9[17] = &unk_1E6DFB378;
  v9[18] = &unk_1E6DFB390;
  v9[19] = &unk_1E6DFB3A8;
  v9[20] = &unk_1E6DFB3C0;
  v9[21] = &unk_1E6DFB3D8;
  v9[22] = &unk_1E6DFB3F0;
  v9[23] = &unk_1E6DFB3F0;
  v9[24] = &unk_1E6DFB408;
  v9[25] = &unk_1E6DFB420;
  v9[26] = &unk_1E6DFB438;
  v9[27] = &unk_1E6DFB450;
  v9[28] = &unk_1E6DFB468;
  v9[29] = &unk_1E6DFB480;
  v9[30] = &unk_1E6DFB498;
  v9[31] = &unk_1E6DFB4B0;
  v9[32] = &unk_1E6DFB4C8;
  v9[33] = &unk_1E6DFB4E0;
  v9[34] = &unk_1E6DFB438;
  v9[35] = &unk_1E6DFB468;
  v9[36] = &unk_1E6DFB4F8;
  v9[37] = &unk_1E6DFB408;
  v9[38] = &unk_1E6DFB480;
  v9[39] = &unk_1E6DFB510;
  v9[40] = &unk_1E6DFB528;
  v9[41] = &unk_1E6DFB540;
  v9[42] = &unk_1E6DFB480;
  v9[43] = &unk_1E6DFB558;
  v9[44] = &unk_1E6DFB570;
  v9[45] = &unk_1E6DFB528;
  v9[46] = &unk_1E6DFB510;
  v9[47] = &unk_1E6DFB588;
  v9[48] = &unk_1E6DFB5A0;
  v9[49] = &unk_1E6DFB5B8;
  v9[50] = &unk_1E6DFB3D8;
  v9[51] = &unk_1E6DFB3F0;
  v9[52] = &unk_1E6DFB318;
  v9[53] = &unk_1E6DFB5D0;
  v9[54] = &unk_1E6DFB5E8;
  v9[55] = &unk_1E6DFB600;
  v9[56] = &unk_1E6DFB618;
  v9[57] = &unk_1E6DFB5E8;
  v9[58] = &unk_1E6DFB630;
  v9[59] = &unk_1E6DFB648;
  v9[60] = &unk_1E6DFB5E8;
  v9[61] = &unk_1E6DFB600;
  v9[62] = &unk_1E6DFB630;
  v9[63] = &unk_1E6DFB660;
  v9[64] = &unk_1E6DFB300;
  v9[65] = &unk_1E6DFB678;
  v9[66] = &unk_1E6DFB690;
  v9[67] = &unk_1E6DFB6A8;
  v9[68] = &unk_1E6DFB6C0;
  v9[69] = &unk_1E6DFB630;
  v9[70] = &unk_1E6DFB6D8;
  v9[71] = &unk_1E6DFB498;
  v9[72] = &unk_1E6DFB558;
  v9[73] = &unk_1E6DFB588;
  v9[74] = &unk_1E6DFB6F0;
  v9[75] = &unk_1E6DFB5B8;
  v9[76] = &unk_1E6DFB5A0;
  v9[77] = &unk_1E6DFB588;
  v9[78] = &unk_1E6DFB510;
  v9[79] = &unk_1E6DFB708;
  v9[80] = &unk_1E6DFB5B8;
  v9[81] = &unk_1E6DFB588;
  v9[82] = &unk_1E6DFB6F0;
  v9[83] = &unk_1E6DFB720;
  v9[84] = &unk_1E6DFB738;
  v9[85] = &unk_1E6DFB510;
  v9[134] = &unk_1E6DFB5E8;
  v9[86] = &unk_1E6DFB750;
  v9[87] = &unk_1E6DFB738;
  v9[88] = &unk_1E6DFB5B8;
  v9[142] = &unk_1E6DFB660;
  v9[89] = &unk_1E6DFB768;
  v9[90] = &unk_1E6DFB498;
  v9[171] = &unk_1E6DFB4E0;
  v9[173] = &unk_1E6DFB900;
  v9[175] = &unk_1E6DFB930;
  v9[176] = &unk_1E6DFB948;
  v9[91] = &unk_1E6DFB618;
  v9[92] = &unk_1E6DFB780;
  v9[135] = &unk_1E6DFB330;
  v9[177] = &unk_1E6DFB330;
  v9[178] = &unk_1E6DFB5D0;
  v9[179] = &unk_1E6DFB960;
  v9[93] = &unk_1E6DFB798;
  v9[94] = &unk_1E6DFB7B0;
  v9[193] = &unk_1E6DFB540;
  v9[95] = &unk_1E6DFB7C8;
  v9[96] = &unk_1E6DFB7E0;
  v9[97] = &unk_1E6DFB6D8;
  v9[98] = &unk_1E6DFB7F8;
  v9[99] = &unk_1E6DFB648;
  v9[100] = &unk_1E6DFB6D8;
  v9[101] = &unk_1E6DFB810;
  v9[102] = &unk_1E6DFB828;
  v9[103] = &unk_1E6DFB840;
  v9[104] = &unk_1E6DFB558;
  v9[105] = &unk_1E6DFB570;
  v9[106] = &unk_1E6DFB750;
  v9[107] = &unk_1E6DFB858;
  v9[108] = &unk_1E6DFB6F0;
  v9[109] = &unk_1E6DFB750;
  v9[110] = &unk_1E6DFB738;
  v9[111] = &unk_1E6DFB708;
  v9[112] = &unk_1E6DFB588;
  v9[113] = &unk_1E6DFB498;
  v9[114] = &unk_1E6DFB738;
  v9[115] = &unk_1E6DFB750;
  v9[116] = &unk_1E6DFB5B8;
  v9[117] = &unk_1E6DFB720;
  v9[118] = &unk_1E6DFB870;
  v9[119] = &unk_1E6DFB888;
  v9[120] = &unk_1E6DFB8A0;
  v9[121] = &unk_1E6DFB768;
  v9[122] = &unk_1E6DFB738;
  v9[123] = &unk_1E6DFB750;
  v9[124] = &unk_1E6DFB858;
  v9[125] = &unk_1E6DFB5A0;
  v9[126] = &unk_1E6DFB708;
  v9[127] = &unk_1E6DFB750;
  v9[128] = &unk_1E6DFB6F0;
  v9[129] = &unk_1E6DFB588;
  v9[130] = &unk_1E6DFB498;
  v9[131] = &unk_1E6DFB4F8;
  v9[132] = &unk_1E6DFB3C0;
  v9[133] = &unk_1E6DFB8B8;
  v9[136] = &unk_1E6DFB7E0;
  v9[137] = &unk_1E6DFB8D0;
  v9[138] = &unk_1E6DFB6D8;
  v9[139] = &unk_1E6DFB648;
  v9[140] = &unk_1E6DFB7B0;
  v9[141] = &unk_1E6DFB6D8;
  v9[143] = &unk_1E6DFB7B0;
  v9[144] = &unk_1E6DFB7E0;
  v9[145] = &unk_1E6DFB7E0;
  v9[146] = &unk_1E6DFB810;
  v9[147] = &unk_1E6DFB8E8;
  v9[148] = &unk_1E6DFB6D8;
  v9[149] = &unk_1E6DFB648;
  v9[150] = &unk_1E6DFB6D8;
  v9[151] = &unk_1E6DFB498;
  v9[152] = &unk_1E6DFB558;
  v9[153] = &unk_1E6DFB588;
  v9[154] = &unk_1E6DFB6F0;
  v9[155] = &unk_1E6DFB5B8;
  v9[156] = &unk_1E6DFB5A0;
  v9[157] = &unk_1E6DFB588;
  v9[158] = &unk_1E6DFB510;
  v9[159] = &unk_1E6DFB708;
  v9[160] = &unk_1E6DFB5B8;
  v9[161] = &unk_1E6DFB588;
  v9[162] = &unk_1E6DFB6F0;
  v9[163] = &unk_1E6DFB720;
  v9[164] = &unk_1E6DFB738;
  v9[165] = &unk_1E6DFB510;
  v9[166] = &unk_1E6DFB750;
  v9[167] = &unk_1E6DFB738;
  v9[168] = &unk_1E6DFB5B8;
  v9[169] = &unk_1E6DFB768;
  v9[170] = &unk_1E6DFB498;
  v9[172] = &unk_1E6DFB450;
  v9[174] = &unk_1E6DFB918;
  v9[180] = &unk_1E6DFB6D8;
  v9[181] = &unk_1E6DFB810;
  v9[182] = &unk_1E6DFB828;
  v9[183] = &unk_1E6DFB840;
  v9[184] = &unk_1E6DFB558;
  v9[185] = &unk_1E6DFB570;
  v9[186] = &unk_1E6DFB750;
  v9[187] = &unk_1E6DFB858;
  v9[188] = &unk_1E6DFB6F0;
  v9[189] = &unk_1E6DFB750;
  v9[190] = &unk_1E6DFB5A0;
  v9[191] = &unk_1E6DFB5B8;
  v9[192] = &unk_1E6DFB738;
  v9[194] = &unk_1E6DFB708;
  v9[195] = &unk_1E6DFB5B8;
  v9[196] = &unk_1E6DFB738;
  v9[197] = &unk_1E6DFB870;
  v9[198] = &unk_1E6DFB8A0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", arc4random_uniform(0x14u) + 187);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[211] = &unk_1E6DFB4F8;
  v9[213] = &unk_1E6DFB828;
  v9[215] = &unk_1E6DFB318;
  v9[216] = &unk_1E6DFB810;
  v9[219] = &unk_1E6DFB618;
  v9[222] = &unk_1E6DFB7F8;
  v9[226] = &unk_1E6DFB8E8;
  v9[252] = &unk_1E6DFB840;
  v9[258] = &unk_1E6DFB600;
  v9[263] = &unk_1E6DFB360;
  v9[264] = &unk_1E6DFB420;
  v9[277] = &unk_1E6DFB720;
  v9[278] = &unk_1E6DFB870;
  v9[199] = v4;
  v9[200] = &unk_1E6DFB8A0;
  v9[201] = &unk_1E6DFB768;
  v9[202] = &unk_1E6DFB738;
  v9[203] = &unk_1E6DFB750;
  v9[204] = &unk_1E6DFB6F0;
  v9[205] = &unk_1E6DFB738;
  v9[206] = &unk_1E6DFB588;
  v9[207] = &unk_1E6DFB750;
  v9[208] = &unk_1E6DFB750;
  v9[209] = &unk_1E6DFB510;
  v9[210] = &unk_1E6DFB558;
  v9[212] = &unk_1E6DFB3F0;
  v9[214] = &unk_1E6DFB648;
  v9[217] = &unk_1E6DFB7C8;
  v9[218] = &unk_1E6DFB6D8;
  v9[220] = &unk_1E6DFB7C8;
  v9[221] = &unk_1E6DFB7B0;
  v9[223] = &unk_1E6DFB7C8;
  v9[224] = &unk_1E6DFB7E0;
  v9[225] = &unk_1E6DFB6D8;
  v9[227] = &unk_1E6DFB7E0;
  v9[228] = &unk_1E6DFB6D8;
  v9[229] = &unk_1E6DFB648;
  v9[230] = &unk_1E6DFB6D8;
  v9[231] = &unk_1E6DFB498;
  v9[232] = &unk_1E6DFB558;
  v9[233] = &unk_1E6DFB588;
  v9[234] = &unk_1E6DFB6F0;
  v9[235] = &unk_1E6DFB5B8;
  v9[236] = &unk_1E6DFB5A0;
  v9[237] = &unk_1E6DFB588;
  v9[238] = &unk_1E6DFB510;
  v9[239] = &unk_1E6DFB708;
  v9[240] = &unk_1E6DFB738;
  v9[241] = &unk_1E6DFB708;
  v9[242] = &unk_1E6DFB858;
  v9[243] = &unk_1E6DFB768;
  v9[244] = &unk_1E6DFB5A0;
  v9[245] = &unk_1E6DFB588;
  v9[246] = &unk_1E6DFB738;
  v9[247] = &unk_1E6DFB738;
  v9[248] = &unk_1E6DFB588;
  v9[249] = &unk_1E6DFB768;
  v9[250] = &unk_1E6DFB558;
  v9[251] = &unk_1E6DFB978;
  v9[253] = &unk_1E6DFB8B8;
  v9[254] = &unk_1E6DFB7E0;
  v9[255] = &unk_1E6DFB990;
  v9[256] = &unk_1E6DFB7C8;
  v9[257] = &unk_1E6DFB7B0;
  v9[259] = &unk_1E6DFB648;
  v9[260] = &unk_1E6DFB7B0;
  v9[261] = &unk_1E6DFB8D0;
  v9[262] = &unk_1E6DFB8B8;
  v9[265] = &unk_1E6DFB570;
  v9[266] = &unk_1E6DFB750;
  v9[267] = &unk_1E6DFB858;
  v9[268] = &unk_1E6DFB6F0;
  v9[269] = &unk_1E6DFB750;
  v9[270] = &unk_1E6DFB738;
  v9[271] = &unk_1E6DFB708;
  v9[272] = &unk_1E6DFB588;
  v9[273] = &unk_1E6DFB498;
  v9[274] = &unk_1E6DFB738;
  v9[275] = &unk_1E6DFB750;
  v9[276] = &unk_1E6DFB5B8;
  v9[279] = &unk_1E6DFB888;
  v9[280] = &unk_1E6DFB8A0;
  v9[281] = &unk_1E6DFB768;
  v9[282] = &unk_1E6DFB738;
  v9[283] = &unk_1E6DFB588;
  v9[284] = &unk_1E6DFB570;
  v9[285] = &unk_1E6DFB498;
  v9[286] = &unk_1E6DFB3F0;
  v9[287] = &unk_1E6DFB408;
  v9[288] = &unk_1E6DFB468;
  v9[289] = &unk_1E6DFB450;
  v9[290] = &unk_1E6DFB498;
  v9[291] = &unk_1E6DFB3C0;
  v9[292] = &unk_1E6DFB918;
  v9[293] = &unk_1E6DFB780;
  v9[294] = &unk_1E6DFB798;
  v9[295] = &unk_1E6DFB6D8;
  v9[296] = &unk_1E6DFB7E0;
  v9[297] = &unk_1E6DFB8D0;
  v9[298] = &unk_1E6DFB6D8;
  v9[299] = &unk_1E6DFB648;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 300);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](v5, &unk_1E6DF8E28, v6, *(void **)(a1 + 264));
}

- (void)_generateSwimmingWorkoutDataWithObjectCollection:(void *)a3 demoPerson:
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v25 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 256), "swimmingSwimSegmentTime");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 256), "swimmingRestSegmentTime");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 256), "swimmingSwimSegmentTime");
  v11 = v10;
  if (objc_msgSend(*(id *)(a1 + 256), "numSwimmingSegments") >= 2)
  {
    v12 = 0;
    v13 = 0;
    v14 = v7 + v9;
    do
    {
      v15 = *(_QWORD *)(a1 + 264);
      if (v15)
        v16 = *(void **)(v15 + 56);
      else
        v16 = 0;
      objc_msgSend(v16, "dateByAddingTimeInterval:", v14 * (double)(int)v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 256), "distanceSwimmingSegmentInYards");
      -[HDDemoDataActivitySampleGenerator _generateSwimmingSegmentDataWithStartDate:segmentTime:segmentDistance:numLaps:strokeStyle:objectCollection:demoPerson:](a1, v17, objc_msgSend(*(id *)(a1 + 256), "swimmingNumLapsPerSegment"), objc_msgSend(*(id *)(a1 + 256), "swimmingStrokeStyle"), v25, v5, v11, v18);
      ++v12;
      v13 = v17;
    }
    while (objc_msgSend(*(id *)(a1 + 256), "numSwimmingSegments") - 1 > v12);
    if (v17)
    {
      objc_msgSend(v17, "dateByAddingTimeInterval:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v11 * 0.5;
      objc_msgSend(*(id *)(a1 + 256), "distanceSwimmingSegmentInYards");
      v22 = v21 * 0.5;
      v23 = objc_msgSend(*(id *)(a1 + 256), "swimmingNumLapsPerSegment");
      if (v23 >= 0)
        v24 = v23;
      else
        v24 = v23 + 1;
      -[HDDemoDataActivitySampleGenerator _generateSwimmingSegmentDataWithStartDate:segmentTime:segmentDistance:numLaps:strokeStyle:objectCollection:demoPerson:](a1, v19, v24 >> 1, objc_msgSend(*(id *)(a1 + 256), "swimmingStrokeStyle"), v25, v5, v20, v22);
      -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](&unk_1E6DF8E40, &unk_1E6DF8E58, v25, *(void **)(a1 + 264));

    }
  }

}

- (void)_generateEllipticalWorkoutDataWithObjectCollection:(void *)a3 demoPerson:
{
  void *v4;
  void *v5;
  id v6;
  id v8;
  _QWORD v9[302];

  v9[300] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v6 = a2;
  v9[0] = &unk_1E6DFBAF8;
  v9[1] = &unk_1E6DFBB10;
  v9[2] = &unk_1E6DFB2B8;
  v9[3] = &unk_1E6DFB2D0;
  v9[4] = &unk_1E6DFBAF8;
  v9[5] = &unk_1E6DFB9F0;
  v9[6] = &unk_1E6DFB2B8;
  v9[7] = &unk_1E6DFBAF8;
  v9[8] = &unk_1E6DFBBA0;
  v9[9] = &unk_1E6DFBAF8;
  v9[10] = &unk_1E6DFB2E8;
  v9[11] = &unk_1E6DFBBA0;
  v9[12] = &unk_1E6DFB9D8;
  v9[13] = &unk_1E6DFBB10;
  v9[14] = &unk_1E6DFBAF8;
  v9[15] = &unk_1E6DFB9D8;
  v9[16] = &unk_1E6DFB9F0;
  v9[17] = &unk_1E6DFBBA0;
  v9[18] = &unk_1E6DFBAF8;
  v9[19] = &unk_1E6DFBBA0;
  v9[20] = &unk_1E6DFBA08;
  v9[21] = &unk_1E6DFB2E8;
  v9[22] = &unk_1E6DFB690;
  v9[23] = &unk_1E6DFBB70;
  v9[24] = &unk_1E6DFB9F0;
  v9[25] = &unk_1E6DFBB88;
  v9[26] = &unk_1E6DFB690;
  v9[27] = &unk_1E6DFB9C0;
  v9[28] = &unk_1E6DFB300;
  v9[29] = &unk_1E6DFB300;
  v9[30] = &unk_1E6DFB9D8;
  v9[31] = &unk_1E6DFB9A8;
  v9[32] = &unk_1E6DFB660;
  v9[33] = &unk_1E6DFB6C0;
  v9[34] = &unk_1E6DFB660;
  v9[35] = &unk_1E6DFB7C8;
  v9[36] = &unk_1E6DFB7F8;
  v9[37] = &unk_1E6DFB7E0;
  v9[38] = &unk_1E6DFB810;
  v9[39] = &unk_1E6DFB990;
  v9[40] = &unk_1E6DFB7E0;
  v9[41] = &unk_1E6DFB7E0;
  v9[42] = &unk_1E6DFB810;
  v9[43] = &unk_1E6DFB8B8;
  v9[44] = &unk_1E6DFB330;
  v9[45] = &unk_1E6DFB318;
  v9[46] = &unk_1E6DFB330;
  v9[47] = &unk_1E6DFB780;
  v9[48] = &unk_1E6DFB840;
  v9[49] = &unk_1E6DFB930;
  v9[50] = &unk_1E6DFB348;
  v9[51] = &unk_1E6DFB840;
  v9[52] = &unk_1E6DFB348;
  v9[53] = &unk_1E6DFB360;
  v9[54] = &unk_1E6DFB840;
  v9[55] = &unk_1E6DFB3F0;
  v9[56] = &unk_1E6DFB378;
  v9[57] = &unk_1E6DFBB58;
  v9[58] = &unk_1E6DFB450;
  v9[59] = &unk_1E6DFB3D8;
  v9[60] = &unk_1E6DFBB58;
  v9[61] = &unk_1E6DFBB58;
  v9[62] = &unk_1E6DFB3D8;
  v9[63] = &unk_1E6DFB390;
  v9[64] = &unk_1E6DFB420;
  v9[65] = &unk_1E6DFB378;
  v9[66] = &unk_1E6DFB3D8;
  v9[67] = &unk_1E6DFB3D8;
  v9[68] = &unk_1E6DFB450;
  v9[69] = &unk_1E6DFB3A8;
  v9[70] = &unk_1E6DFB408;
  v9[71] = &unk_1E6DFB3F0;
  v9[72] = &unk_1E6DFB408;
  v9[73] = &unk_1E6DFB3F0;
  v9[74] = &unk_1E6DFB450;
  v9[75] = &unk_1E6DFB438;
  v9[76] = &unk_1E6DFB450;
  v9[77] = &unk_1E6DFB3D8;
  v9[78] = &unk_1E6DFB438;
  v9[79] = &unk_1E6DFB438;
  v9[80] = &unk_1E6DFB4E0;
  v9[81] = &unk_1E6DFB3D8;
  v9[82] = &unk_1E6DFB3D8;
  v9[83] = &unk_1E6DFB438;
  v9[84] = &unk_1E6DFB438;
  v9[85] = &unk_1E6DFB408;
  v9[86] = &unk_1E6DFB540;
  v9[87] = &unk_1E6DFB438;
  v9[88] = &unk_1E6DFB4B0;
  v9[89] = &unk_1E6DFB540;
  v9[90] = &unk_1E6DFB408;
  v9[91] = &unk_1E6DFB408;
  v9[92] = &unk_1E6DFB540;
  v9[93] = &unk_1E6DFB438;
  v9[94] = &unk_1E6DFB4B0;
  v9[95] = &unk_1E6DFB4F8;
  v9[96] = &unk_1E6DFB468;
  v9[97] = &unk_1E6DFB408;
  v9[98] = &unk_1E6DFB4E0;
  v9[99] = &unk_1E6DFB438;
  v9[100] = &unk_1E6DFB4B0;
  v9[101] = &unk_1E6DFB4F8;
  v9[102] = &unk_1E6DFB4F8;
  v9[103] = &unk_1E6DFB4F8;
  v9[104] = &unk_1E6DFB438;
  v9[105] = &unk_1E6DFB468;
  v9[106] = &unk_1E6DFB498;
  v9[107] = &unk_1E6DFB480;
  v9[108] = &unk_1E6DFB558;
  v9[109] = &unk_1E6DFB468;
  v9[110] = &unk_1E6DFB4B0;
  v9[111] = &unk_1E6DFB498;
  v9[112] = &unk_1E6DFB4F8;
  v9[113] = &unk_1E6DFB540;
  v9[114] = &unk_1E6DFB558;
  v9[115] = &unk_1E6DFB4B0;
  v9[116] = &unk_1E6DFB4B0;
  v9[117] = &unk_1E6DFB4C8;
  v9[118] = &unk_1E6DFB4E0;
  v9[119] = &unk_1E6DFB4C8;
  v9[120] = &unk_1E6DFB540;
  v9[121] = &unk_1E6DFB570;
  v9[122] = &unk_1E6DFB498;
  v9[123] = &unk_1E6DFB558;
  v9[124] = &unk_1E6DFB570;
  v9[125] = &unk_1E6DFB510;
  v9[126] = &unk_1E6DFB4C8;
  v9[127] = &unk_1E6DFBB28;
  v9[128] = &unk_1E6DFB558;
  v9[129] = &unk_1E6DFB528;
  v9[130] = &unk_1E6DFBB28;
  v9[131] = &unk_1E6DFB558;
  v9[132] = &unk_1E6DFB570;
  v9[133] = &unk_1E6DFB4B0;
  v9[134] = &unk_1E6DFB510;
  v9[135] = &unk_1E6DFB558;
  v9[136] = &unk_1E6DFBB28;
  v9[137] = &unk_1E6DFBB28;
  v9[138] = &unk_1E6DFB4F8;
  v9[139] = &unk_1E6DFB528;
  v9[140] = &unk_1E6DFB528;
  v9[141] = &unk_1E6DFB4F8;
  v9[142] = &unk_1E6DFB570;
  v9[143] = &unk_1E6DFB558;
  v9[144] = &unk_1E6DFBB28;
  v9[145] = &unk_1E6DFB498;
  v9[146] = &unk_1E6DFB528;
  v9[147] = &unk_1E6DFB510;
  v9[148] = &unk_1E6DFB558;
  v9[149] = &unk_1E6DFB4F8;
  v9[150] = &unk_1E6DFB588;
  v9[151] = &unk_1E6DFB4C8;
  v9[152] = &unk_1E6DFB498;
  v9[153] = &unk_1E6DFB528;
  v9[154] = &unk_1E6DFB588;
  v9[155] = &unk_1E6DFB528;
  v9[156] = &unk_1E6DFB558;
  v9[157] = &unk_1E6DFB570;
  v9[158] = &unk_1E6DFB510;
  v9[159] = &unk_1E6DFB510;
  v9[160] = &unk_1E6DFBB28;
  v9[161] = &unk_1E6DFB5A0;
  v9[162] = &unk_1E6DFB588;
  v9[163] = &unk_1E6DFB5A0;
  v9[164] = &unk_1E6DFB528;
  v9[165] = &unk_1E6DFBB28;
  v9[166] = &unk_1E6DFBB28;
  v9[167] = &unk_1E6DFB588;
  v9[168] = &unk_1E6DFB708;
  v9[169] = &unk_1E6DFB528;
  v9[170] = &unk_1E6DFB708;
  v9[171] = &unk_1E6DFB5B8;
  v9[172] = &unk_1E6DFB528;
  v9[173] = &unk_1E6DFB570;
  v9[174] = &unk_1E6DFB5B8;
  v9[175] = &unk_1E6DFB510;
  v9[176] = &unk_1E6DFB570;
  v9[177] = &unk_1E6DFB528;
  v9[178] = &unk_1E6DFB5A0;
  v9[179] = &unk_1E6DFBB28;
  v9[180] = &unk_1E6DFBB28;
  v9[181] = &unk_1E6DFB528;
  v9[182] = &unk_1E6DFB570;
  v9[183] = &unk_1E6DFBB28;
  v9[184] = &unk_1E6DFBB28;
  v9[185] = &unk_1E6DFB708;
  v9[186] = &unk_1E6DFB708;
  v9[187] = &unk_1E6DFB708;
  v9[188] = &unk_1E6DFBB28;
  v9[189] = &unk_1E6DFB528;
  v9[190] = &unk_1E6DFB570;
  v9[191] = &unk_1E6DFB588;
  v9[192] = &unk_1E6DFB5A0;
  v9[193] = &unk_1E6DFB528;
  v9[194] = &unk_1E6DFB5A0;
  v9[195] = &unk_1E6DFB528;
  v9[196] = &unk_1E6DFB858;
  v9[197] = &unk_1E6DFB750;
  v9[198] = &unk_1E6DFB510;
  v9[199] = &unk_1E6DFB858;
  v9[200] = &unk_1E6DFB5A0;
  v9[201] = &unk_1E6DFB858;
  v9[202] = &unk_1E6DFB738;
  v9[203] = &unk_1E6DFB750;
  v9[204] = &unk_1E6DFB6F0;
  v9[205] = &unk_1E6DFB588;
  v9[206] = &unk_1E6DFB5A0;
  v9[207] = &unk_1E6DFB5A0;
  v9[208] = &unk_1E6DFB6F0;
  v9[209] = &unk_1E6DFB720;
  v9[210] = &unk_1E6DFB858;
  v9[211] = &unk_1E6DFB738;
  v9[212] = &unk_1E6DFB6F0;
  v9[213] = &unk_1E6DFB5B8;
  v9[214] = &unk_1E6DFB738;
  v9[215] = &unk_1E6DFB588;
  v9[216] = &unk_1E6DFB6F0;
  v9[217] = &unk_1E6DFB588;
  v9[218] = &unk_1E6DFB750;
  v9[219] = &unk_1E6DFB708;
  v9[220] = &unk_1E6DFB5A0;
  v9[221] = &unk_1E6DFB588;
  v9[222] = &unk_1E6DFB6F0;
  v9[223] = &unk_1E6DFB6F0;
  v9[224] = &unk_1E6DFB5B8;
  v9[225] = &unk_1E6DFB6F0;
  v9[226] = &unk_1E6DFB720;
  v9[227] = &unk_1E6DFB738;
  v9[228] = &unk_1E6DFB5B8;
  v9[229] = &unk_1E6DFB750;
  v9[230] = &unk_1E6DFB5A0;
  v9[231] = &unk_1E6DFB708;
  v9[232] = &unk_1E6DFB720;
  v9[233] = &unk_1E6DFB5B8;
  v9[234] = &unk_1E6DFB588;
  v9[235] = &unk_1E6DFB858;
  v9[236] = &unk_1E6DFB858;
  v9[237] = &unk_1E6DFB6F0;
  v9[238] = &unk_1E6DFB588;
  v9[239] = &unk_1E6DFB750;
  v9[240] = &unk_1E6DFB5A0;
  v9[241] = &unk_1E6DFB720;
  v9[242] = &unk_1E6DFB858;
  v9[243] = &unk_1E6DFB738;
  v9[244] = &unk_1E6DFB858;
  v9[245] = &unk_1E6DFB738;
  v9[246] = &unk_1E6DFB738;
  v9[247] = &unk_1E6DFB750;
  v9[248] = &unk_1E6DFB738;
  v9[249] = &unk_1E6DFB720;
  v9[250] = &unk_1E6DFB588;
  v9[251] = &unk_1E6DFB750;
  v9[252] = &unk_1E6DFB738;
  v9[253] = &unk_1E6DFB588;
  v9[254] = &unk_1E6DFB750;
  v9[255] = &unk_1E6DFB6F0;
  v9[256] = &unk_1E6DFB5A0;
  v9[257] = &unk_1E6DFB5A0;
  v9[258] = &unk_1E6DFB588;
  v9[259] = &unk_1E6DFB5B8;
  v9[260] = &unk_1E6DFB5B8;
  v9[261] = &unk_1E6DFB708;
  v9[262] = &unk_1E6DFB5A0;
  v9[263] = &unk_1E6DFB5B8;
  v9[264] = &unk_1E6DFB738;
  v9[265] = &unk_1E6DFB750;
  v9[266] = &unk_1E6DFB5A0;
  v9[267] = &unk_1E6DFB6F0;
  v9[268] = &unk_1E6DFB5B8;
  v9[269] = &unk_1E6DFB708;
  v9[270] = &unk_1E6DFB5A0;
  v9[271] = &unk_1E6DFB858;
  v9[272] = &unk_1E6DFB720;
  v9[273] = &unk_1E6DFB5B8;
  v9[274] = &unk_1E6DFB738;
  v9[275] = &unk_1E6DFB750;
  v9[276] = &unk_1E6DFB6F0;
  v9[277] = &unk_1E6DFB5B8;
  v9[278] = &unk_1E6DFB5A0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", arc4random_uniform(0xAu) + 177);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[279] = v4;
  v9[280] = &unk_1E6DFB720;
  v9[281] = &unk_1E6DFB750;
  v9[282] = &unk_1E6DFB720;
  v9[283] = &unk_1E6DFB588;
  v9[284] = &unk_1E6DFB5B8;
  v9[285] = &unk_1E6DFB720;
  v9[286] = &unk_1E6DFB750;
  v9[287] = &unk_1E6DFB858;
  v9[288] = &unk_1E6DFB5B8;
  v9[289] = &unk_1E6DFB738;
  v9[290] = &unk_1E6DFB750;
  v9[291] = &unk_1E6DFB5A0;
  v9[292] = &unk_1E6DFB588;
  v9[293] = &unk_1E6DFB5B8;
  v9[294] = &unk_1E6DFB4C8;
  v9[295] = &unk_1E6DFB4C8;
  v9[296] = &unk_1E6DFB528;
  v9[297] = &unk_1E6DFB4C8;
  v9[298] = &unk_1E6DFB4F8;
  v9[299] = &unk_1E6DFB4F8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 300);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](v5, &unk_1E6DF8E70, v6, *(void **)(a1 + 264));
}

- (void)_generateRunningWorkoutDataWithObjectCollection:(void *)a1 demoPerson:(void *)a2 workoutState:(void *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[542];

  v10[540] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a2;
  v7 = a1;
  v10[0] = &unk_1E6DFB9D8;
  v10[1] = &unk_1E6DFB2E8;
  v10[2] = &unk_1E6DFBAF8;
  v10[3] = &unk_1E6DFB9D8;
  v10[4] = &unk_1E6DFBB70;
  v10[5] = &unk_1E6DFBB88;
  v10[6] = &unk_1E6DFB6C0;
  v10[7] = &unk_1E6DFB9A8;
  v10[8] = &unk_1E6DFB660;
  v10[9] = &unk_1E6DFB690;
  v10[10] = &unk_1E6DFB630;
  v10[11] = &unk_1E6DFB648;
  v10[12] = &unk_1E6DFB630;
  v10[13] = &unk_1E6DFB7C8;
  v10[14] = &unk_1E6DFB648;
  v10[15] = &unk_1E6DFB8E8;
  v10[16] = &unk_1E6DFB618;
  v10[17] = &unk_1E6DFB8E8;
  v10[18] = &unk_1E6DFB828;
  v10[19] = &unk_1E6DFB8B8;
  v10[20] = &unk_1E6DFB828;
  v10[21] = &unk_1E6DFB618;
  v10[22] = &unk_1E6DFB948;
  v10[23] = &unk_1E6DFB828;
  v10[24] = &unk_1E6DFB330;
  v10[25] = &unk_1E6DFB8E8;
  v10[26] = &unk_1E6DFB5D0;
  v10[27] = &unk_1E6DFB618;
  v10[28] = &unk_1E6DFB5D0;
  v10[29] = &unk_1E6DFB960;
  v10[30] = &unk_1E6DFB618;
  v10[31] = &unk_1E6DFB828;
  v10[32] = &unk_1E6DFB8B8;
  v10[33] = &unk_1E6DFB828;
  v10[34] = &unk_1E6DFB900;
  v10[35] = &unk_1E6DFB330;
  v10[36] = &unk_1E6DFB900;
  v10[37] = &unk_1E6DFB318;
  v10[38] = &unk_1E6DFB318;
  v10[39] = &unk_1E6DFB840;
  v10[40] = &unk_1E6DFB390;
  v10[41] = &unk_1E6DFB930;
  v10[42] = &unk_1E6DFB360;
  v10[43] = &unk_1E6DFB3A8;
  v10[44] = &unk_1E6DFB348;
  v10[45] = &unk_1E6DFB378;
  v10[46] = &unk_1E6DFB390;
  v10[47] = &unk_1E6DFB930;
  v10[48] = &unk_1E6DFB390;
  v10[49] = &unk_1E6DFB348;
  v10[50] = &unk_1E6DFB3D8;
  v10[51] = &unk_1E6DFB450;
  v10[52] = &unk_1E6DFB390;
  v10[53] = &unk_1E6DFB348;
  v10[54] = &unk_1E6DFB420;
  v10[55] = &unk_1E6DFB3F0;
  v10[56] = &unk_1E6DFB420;
  v10[57] = &unk_1E6DFB408;
  v10[58] = &unk_1E6DFB4F8;
  v10[59] = &unk_1E6DFB438;
  v10[60] = &unk_1E6DFB558;
  v10[61] = &unk_1E6DFB4B0;
  v10[62] = &unk_1E6DFB468;
  v10[63] = &unk_1E6DFB4F8;
  v10[64] = &unk_1E6DFB540;
  v10[65] = &unk_1E6DFB540;
  v10[66] = &unk_1E6DFB4F8;
  v10[67] = &unk_1E6DFB540;
  v10[68] = &unk_1E6DFB420;
  v10[69] = &unk_1E6DFB558;
  v10[70] = &unk_1E6DFB468;
  v10[71] = &unk_1E6DFB3C0;
  v10[72] = &unk_1E6DFB4B0;
  v10[73] = &unk_1E6DFB420;
  v10[74] = &unk_1E6DFB468;
  v10[75] = &unk_1E6DFB4C8;
  v10[76] = &unk_1E6DFB3D8;
  v10[77] = &unk_1E6DFB558;
  v10[78] = &unk_1E6DFB570;
  v10[79] = &unk_1E6DFB498;
  v10[80] = &unk_1E6DFB4F8;
  v10[81] = &unk_1E6DFB4C8;
  v10[82] = &unk_1E6DFB540;
  v10[83] = &unk_1E6DFB558;
  v10[84] = &unk_1E6DFB540;
  v10[85] = &unk_1E6DFB468;
  v10[86] = &unk_1E6DFB4F8;
  v10[87] = &unk_1E6DFB570;
  v10[88] = &unk_1E6DFB558;
  v10[89] = &unk_1E6DFB4C8;
  v10[90] = &unk_1E6DFB528;
  v10[91] = &unk_1E6DFB480;
  v10[92] = &unk_1E6DFB498;
  v10[93] = &unk_1E6DFB570;
  v10[94] = &unk_1E6DFBB28;
  v10[95] = &unk_1E6DFB510;
  v10[96] = &unk_1E6DFB540;
  v10[97] = &unk_1E6DFB4C8;
  v10[98] = &unk_1E6DFB498;
  v10[99] = &unk_1E6DFB4C8;
  v10[100] = &unk_1E6DFB708;
  v10[101] = &unk_1E6DFB570;
  v10[102] = &unk_1E6DFB510;
  v10[103] = &unk_1E6DFB708;
  v10[104] = &unk_1E6DFB708;
  v10[105] = &unk_1E6DFBB28;
  v10[106] = &unk_1E6DFB558;
  v10[107] = &unk_1E6DFB5B8;
  v10[108] = &unk_1E6DFBB28;
  v10[109] = &unk_1E6DFB558;
  v10[110] = &unk_1E6DFB708;
  v10[111] = &unk_1E6DFB708;
  v10[112] = &unk_1E6DFB738;
  v10[113] = &unk_1E6DFB5B8;
  v10[114] = &unk_1E6DFB858;
  v10[115] = &unk_1E6DFB708;
  v10[116] = &unk_1E6DFB510;
  v10[117] = &unk_1E6DFB570;
  v10[118] = &unk_1E6DFB858;
  v10[119] = &unk_1E6DFBB28;
  v10[120] = &unk_1E6DFBB28;
  v10[121] = &unk_1E6DFB858;
  v10[122] = &unk_1E6DFB708;
  v10[123] = &unk_1E6DFB858;
  v10[124] = &unk_1E6DFBB28;
  v10[125] = &unk_1E6DFB570;
  v10[126] = &unk_1E6DFB858;
  v10[127] = &unk_1E6DFB708;
  v10[128] = &unk_1E6DFB5A0;
  v10[129] = &unk_1E6DFB738;
  v10[130] = &unk_1E6DFB708;
  v10[131] = &unk_1E6DFB570;
  v10[132] = &unk_1E6DFB510;
  v10[133] = &unk_1E6DFB708;
  v10[134] = &unk_1E6DFB708;
  v10[135] = &unk_1E6DFBB28;
  v10[136] = &unk_1E6DFB558;
  v10[137] = &unk_1E6DFB5B8;
  v10[138] = &unk_1E6DFBB28;
  v10[139] = &unk_1E6DFB558;
  v10[140] = &unk_1E6DFB708;
  v10[141] = &unk_1E6DFB708;
  v10[142] = &unk_1E6DFB738;
  v10[143] = &unk_1E6DFB5B8;
  v10[144] = &unk_1E6DFB858;
  v10[145] = &unk_1E6DFB708;
  v10[146] = &unk_1E6DFB510;
  v10[147] = &unk_1E6DFB570;
  v10[148] = &unk_1E6DFB858;
  v10[149] = &unk_1E6DFBB28;
  v10[150] = &unk_1E6DFBB28;
  v10[151] = &unk_1E6DFB858;
  v10[152] = &unk_1E6DFB708;
  v10[153] = &unk_1E6DFB858;
  v10[154] = &unk_1E6DFBB28;
  v10[155] = &unk_1E6DFB570;
  v10[156] = &unk_1E6DFB858;
  v10[157] = &unk_1E6DFB708;
  v10[158] = &unk_1E6DFB5A0;
  v10[159] = &unk_1E6DFB738;
  v10[160] = &unk_1E6DFB5B8;
  v10[161] = &unk_1E6DFB738;
  v10[162] = &unk_1E6DFB588;
  v10[163] = &unk_1E6DFB708;
  v10[164] = &unk_1E6DFB570;
  v10[165] = &unk_1E6DFB5B8;
  v10[166] = &unk_1E6DFBB28;
  v10[167] = &unk_1E6DFB4C8;
  v10[168] = &unk_1E6DFB498;
  v10[169] = &unk_1E6DFB4B0;
  v10[170] = &unk_1E6DFBB28;
  v10[171] = &unk_1E6DFB858;
  v10[172] = &unk_1E6DFB708;
  v10[173] = &unk_1E6DFB858;
  v10[174] = &unk_1E6DFBB28;
  v10[175] = &unk_1E6DFB570;
  v10[176] = &unk_1E6DFB858;
  v10[177] = &unk_1E6DFB708;
  v10[178] = &unk_1E6DFB5A0;
  v10[179] = &unk_1E6DFB738;
  v10[180] = &unk_1E6DFB588;
  v10[181] = &unk_1E6DFB4C8;
  v10[182] = &unk_1E6DFB540;
  v10[183] = &unk_1E6DFB4F8;
  v10[184] = &unk_1E6DFB588;
  v10[185] = &unk_1E6DFB498;
  v10[186] = &unk_1E6DFB540;
  v10[187] = &unk_1E6DFB4B0;
  v10[188] = &unk_1E6DFB510;
  v10[189] = &unk_1E6DFB4C8;
  v10[190] = &unk_1E6DFB4B0;
  v10[191] = &unk_1E6DFB708;
  v10[192] = &unk_1E6DFBB28;
  v10[193] = &unk_1E6DFBB28;
  v10[194] = &unk_1E6DFB528;
  v10[195] = &unk_1E6DFB750;
  v10[196] = &unk_1E6DFB738;
  v10[197] = &unk_1E6DFB708;
  v10[198] = &unk_1E6DFB588;
  v10[199] = &unk_1E6DFB510;
  v10[200] = &unk_1E6DFB5A0;
  v10[201] = &unk_1E6DFB720;
  v10[202] = &unk_1E6DFBB28;
  v10[203] = &unk_1E6DFB858;
  v10[204] = &unk_1E6DFB528;
  v10[205] = &unk_1E6DFB738;
  v10[206] = &unk_1E6DFB858;
  v10[207] = &unk_1E6DFB5A0;
  v10[208] = &unk_1E6DFB5B8;
  v10[209] = &unk_1E6DFB5B8;
  v10[210] = &unk_1E6DFB738;
  v10[211] = &unk_1E6DFB720;
  v10[212] = &unk_1E6DFB588;
  v10[213] = &unk_1E6DFB858;
  v10[214] = &unk_1E6DFB5B8;
  v10[215] = &unk_1E6DFB720;
  v10[216] = &unk_1E6DFB5B8;
  v10[217] = &unk_1E6DFB5A0;
  v10[218] = &unk_1E6DFBB28;
  v10[219] = &unk_1E6DFB750;
  v10[220] = &unk_1E6DFB570;
  v10[221] = &unk_1E6DFB6F0;
  v10[222] = &unk_1E6DFB570;
  v10[223] = &unk_1E6DFB6F0;
  v10[224] = &unk_1E6DFB738;
  v10[225] = &unk_1E6DFB570;
  v10[226] = &unk_1E6DFB708;
  v10[227] = &unk_1E6DFB750;
  v10[228] = &unk_1E6DFB720;
  v10[229] = &unk_1E6DFB750;
  v10[230] = &unk_1E6DFBB28;
  v10[231] = &unk_1E6DFB708;
  v10[232] = &unk_1E6DFB588;
  v10[233] = &unk_1E6DFB570;
  v10[234] = &unk_1E6DFB750;
  v10[235] = &unk_1E6DFB510;
  v10[236] = &unk_1E6DFB738;
  v10[237] = &unk_1E6DFB510;
  v10[238] = &unk_1E6DFB750;
  v10[239] = &unk_1E6DFB720;
  v10[240] = &unk_1E6DFB4B0;
  v10[241] = &unk_1E6DFB708;
  v10[242] = &unk_1E6DFBB28;
  v10[243] = &unk_1E6DFBB28;
  v10[244] = &unk_1E6DFB528;
  v10[245] = &unk_1E6DFB750;
  v10[246] = &unk_1E6DFB738;
  v10[247] = &unk_1E6DFB708;
  v10[248] = &unk_1E6DFB588;
  v10[249] = &unk_1E6DFB510;
  v10[250] = &unk_1E6DFB5B8;
  v10[251] = &unk_1E6DFB738;
  v10[252] = &unk_1E6DFB588;
  v10[253] = &unk_1E6DFB708;
  v10[254] = &unk_1E6DFB570;
  v10[255] = &unk_1E6DFB5B8;
  v10[256] = &unk_1E6DFBB28;
  v10[257] = &unk_1E6DFB4C8;
  v10[258] = &unk_1E6DFB498;
  v10[259] = &unk_1E6DFB4B0;
  v10[260] = &unk_1E6DFB5A0;
  v10[261] = &unk_1E6DFB720;
  v10[262] = &unk_1E6DFBB28;
  v10[263] = &unk_1E6DFB858;
  v10[264] = &unk_1E6DFB528;
  v10[265] = &unk_1E6DFB738;
  v10[266] = &unk_1E6DFB858;
  v10[267] = &unk_1E6DFB5A0;
  v10[268] = &unk_1E6DFB5B8;
  v10[269] = &unk_1E6DFB5B8;
  v10[270] = &unk_1E6DFB738;
  v10[271] = &unk_1E6DFB720;
  v10[272] = &unk_1E6DFB588;
  v10[273] = &unk_1E6DFB858;
  v10[274] = &unk_1E6DFB5B8;
  v10[275] = &unk_1E6DFB720;
  v10[276] = &unk_1E6DFB5B8;
  v10[277] = &unk_1E6DFB5A0;
  v10[278] = &unk_1E6DFBB28;
  v10[279] = &unk_1E6DFB750;
  v10[280] = &unk_1E6DFB5B8;
  v10[281] = &unk_1E6DFB738;
  v10[282] = &unk_1E6DFB588;
  v10[283] = &unk_1E6DFB708;
  v10[284] = &unk_1E6DFB570;
  v10[285] = &unk_1E6DFB5B8;
  v10[286] = &unk_1E6DFBB28;
  v10[287] = &unk_1E6DFB4C8;
  v10[288] = &unk_1E6DFB498;
  v10[289] = &unk_1E6DFB4B0;
  v10[290] = &unk_1E6DFB588;
  v10[291] = &unk_1E6DFB4C8;
  v10[292] = &unk_1E6DFB540;
  v10[293] = &unk_1E6DFB4F8;
  v10[294] = &unk_1E6DFB588;
  v10[295] = &unk_1E6DFB498;
  v10[296] = &unk_1E6DFB540;
  v10[297] = &unk_1E6DFB4B0;
  v10[298] = &unk_1E6DFB510;
  v10[299] = &unk_1E6DFB4C8;
  v10[300] = &unk_1E6DFB4B0;
  v10[301] = &unk_1E6DFB708;
  v10[302] = &unk_1E6DFBB28;
  v10[303] = &unk_1E6DFBB28;
  v10[304] = &unk_1E6DFB528;
  v10[305] = &unk_1E6DFB750;
  v10[306] = &unk_1E6DFB738;
  v10[307] = &unk_1E6DFB708;
  v10[308] = &unk_1E6DFB588;
  v10[309] = &unk_1E6DFB510;
  v10[310] = &unk_1E6DFB588;
  v10[311] = &unk_1E6DFB4C8;
  v10[312] = &unk_1E6DFB540;
  v10[313] = &unk_1E6DFB4F8;
  v10[314] = &unk_1E6DFB588;
  v10[315] = &unk_1E6DFB498;
  v10[316] = &unk_1E6DFB540;
  v10[317] = &unk_1E6DFB4B0;
  v10[318] = &unk_1E6DFB510;
  v10[319] = &unk_1E6DFB4C8;
  v10[320] = &unk_1E6DFB4B0;
  v10[321] = &unk_1E6DFB708;
  v10[322] = &unk_1E6DFBB28;
  v10[323] = &unk_1E6DFBB28;
  v10[324] = &unk_1E6DFB528;
  v10[325] = &unk_1E6DFB750;
  v10[326] = &unk_1E6DFB738;
  v10[327] = &unk_1E6DFB708;
  v10[328] = &unk_1E6DFB588;
  v10[329] = &unk_1E6DFB510;
  v10[330] = &unk_1E6DFB5A0;
  v10[331] = &unk_1E6DFB720;
  v10[332] = &unk_1E6DFBB28;
  v10[333] = &unk_1E6DFB858;
  v10[334] = &unk_1E6DFB528;
  v10[335] = &unk_1E6DFB738;
  v10[336] = &unk_1E6DFB858;
  v10[337] = &unk_1E6DFB5A0;
  v10[338] = &unk_1E6DFB5B8;
  v10[339] = &unk_1E6DFB5B8;
  v10[340] = &unk_1E6DFB738;
  v10[341] = &unk_1E6DFB720;
  v10[342] = &unk_1E6DFB588;
  v10[343] = &unk_1E6DFB858;
  v10[344] = &unk_1E6DFB5B8;
  v10[345] = &unk_1E6DFB720;
  v10[346] = &unk_1E6DFB5B8;
  v10[347] = &unk_1E6DFB5A0;
  v10[348] = &unk_1E6DFBB28;
  v10[349] = &unk_1E6DFB750;
  v10[350] = &unk_1E6DFB5A0;
  v10[351] = &unk_1E6DFB720;
  v10[352] = &unk_1E6DFBB28;
  v10[353] = &unk_1E6DFB858;
  v10[354] = &unk_1E6DFB528;
  v10[355] = &unk_1E6DFB738;
  v10[356] = &unk_1E6DFB858;
  v10[357] = &unk_1E6DFB5A0;
  v10[358] = &unk_1E6DFB5B8;
  v10[359] = &unk_1E6DFB5B8;
  v10[360] = &unk_1E6DFB738;
  v10[361] = &unk_1E6DFB720;
  v10[362] = &unk_1E6DFB588;
  v10[363] = &unk_1E6DFB858;
  v10[364] = &unk_1E6DFB5B8;
  v10[365] = &unk_1E6DFB720;
  v10[366] = &unk_1E6DFB5B8;
  v10[367] = &unk_1E6DFB5A0;
  v10[368] = &unk_1E6DFBB28;
  v10[369] = &unk_1E6DFB750;
  v10[370] = &unk_1E6DFB5B8;
  v10[371] = &unk_1E6DFB738;
  v10[372] = &unk_1E6DFB588;
  v10[373] = &unk_1E6DFB708;
  v10[374] = &unk_1E6DFB570;
  v10[375] = &unk_1E6DFB5B8;
  v10[376] = &unk_1E6DFBB28;
  v10[377] = &unk_1E6DFB4C8;
  v10[378] = &unk_1E6DFB498;
  v10[379] = &unk_1E6DFB4B0;
  v10[380] = &unk_1E6DFB588;
  v10[381] = &unk_1E6DFB4C8;
  v10[382] = &unk_1E6DFB540;
  v10[383] = &unk_1E6DFB4F8;
  v10[384] = &unk_1E6DFB588;
  v10[385] = &unk_1E6DFB498;
  v10[386] = &unk_1E6DFB540;
  v10[387] = &unk_1E6DFB4B0;
  v10[388] = &unk_1E6DFB510;
  v10[389] = &unk_1E6DFB4C8;
  v10[390] = &unk_1E6DFB4B0;
  v10[391] = &unk_1E6DFB708;
  v10[392] = &unk_1E6DFBB28;
  v10[393] = &unk_1E6DFBB28;
  v10[394] = &unk_1E6DFB528;
  v10[395] = &unk_1E6DFB750;
  v10[396] = &unk_1E6DFB738;
  v10[397] = &unk_1E6DFB708;
  v10[398] = &unk_1E6DFB588;
  v10[399] = &unk_1E6DFB510;
  v10[400] = &unk_1E6DFB5A0;
  v10[401] = &unk_1E6DFB720;
  v10[402] = &unk_1E6DFBB28;
  v10[403] = &unk_1E6DFB858;
  v10[404] = &unk_1E6DFB528;
  v10[405] = &unk_1E6DFB738;
  v10[406] = &unk_1E6DFB858;
  v10[407] = &unk_1E6DFB5A0;
  v10[408] = &unk_1E6DFB5B8;
  v10[409] = &unk_1E6DFB5B8;
  v10[410] = &unk_1E6DFB738;
  v10[411] = &unk_1E6DFB720;
  v10[412] = &unk_1E6DFB588;
  v10[413] = &unk_1E6DFB858;
  v10[414] = &unk_1E6DFB5B8;
  v10[415] = &unk_1E6DFB720;
  v10[416] = &unk_1E6DFB5B8;
  v10[417] = &unk_1E6DFB5A0;
  v10[418] = &unk_1E6DFBB28;
  v10[419] = &unk_1E6DFB750;
  v10[420] = &unk_1E6DFB570;
  v10[421] = &unk_1E6DFB6F0;
  v10[422] = &unk_1E6DFB570;
  v10[423] = &unk_1E6DFB6F0;
  v10[424] = &unk_1E6DFB738;
  v10[425] = &unk_1E6DFB570;
  v10[426] = &unk_1E6DFB708;
  v10[427] = &unk_1E6DFB750;
  v10[428] = &unk_1E6DFB720;
  v10[429] = &unk_1E6DFB750;
  v10[430] = &unk_1E6DFBB28;
  v10[431] = &unk_1E6DFB708;
  v10[432] = &unk_1E6DFB588;
  v10[433] = &unk_1E6DFB570;
  v10[434] = &unk_1E6DFB750;
  v10[435] = &unk_1E6DFB510;
  v10[436] = &unk_1E6DFB738;
  v10[437] = &unk_1E6DFB510;
  v10[438] = &unk_1E6DFB750;
  v10[439] = &unk_1E6DFB720;
  v10[440] = &unk_1E6DFB708;
  v10[441] = &unk_1E6DFB570;
  v10[442] = &unk_1E6DFB708;
  v10[443] = &unk_1E6DFB588;
  v10[444] = &unk_1E6DFB510;
  v10[445] = &unk_1E6DFBB28;
  v10[446] = &unk_1E6DFB750;
  v10[447] = &unk_1E6DFB6F0;
  v10[448] = &unk_1E6DFB708;
  v10[449] = &unk_1E6DFB708;
  v10[450] = &unk_1E6DFB708;
  v10[451] = &unk_1E6DFB750;
  v10[452] = &unk_1E6DFB858;
  v10[453] = &unk_1E6DFB588;
  v10[454] = &unk_1E6DFB588;
  v10[455] = &unk_1E6DFB750;
  v10[456] = &unk_1E6DFB6F0;
  v10[457] = &unk_1E6DFB588;
  v10[458] = &unk_1E6DFB5A0;
  v10[459] = &unk_1E6DFB750;
  v10[460] = &unk_1E6DFB738;
  v10[461] = &unk_1E6DFB738;
  v10[462] = &unk_1E6DFB5A0;
  v10[463] = &unk_1E6DFB870;
  v10[464] = &unk_1E6DFB528;
  v10[465] = &unk_1E6DFB6F0;
  v10[466] = &unk_1E6DFB708;
  v10[467] = &unk_1E6DFB750;
  v10[468] = &unk_1E6DFB750;
  v10[469] = &unk_1E6DFB738;
  v10[470] = &unk_1E6DFBC30;
  v10[471] = &unk_1E6DFB870;
  v10[472] = &unk_1E6DFB858;
  v10[473] = &unk_1E6DFB738;
  v10[474] = &unk_1E6DFB888;
  v10[475] = &unk_1E6DFBC48;
  v10[476] = &unk_1E6DFB858;
  v10[477] = &unk_1E6DFB750;
  v10[478] = &unk_1E6DFB720;
  v10[479] = &unk_1E6DFB8A0;
  v10[480] = &unk_1E6DFB720;
  v10[481] = &unk_1E6DFB750;
  v10[482] = &unk_1E6DFB768;
  v10[483] = &unk_1E6DFB8A0;
  v10[484] = &unk_1E6DFB870;
  v10[485] = &unk_1E6DFB6F0;
  v10[486] = &unk_1E6DFB5A0;
  v10[487] = &unk_1E6DFB5A0;
  v10[488] = &unk_1E6DFB720;
  v10[489] = &unk_1E6DFB738;
  v10[490] = &unk_1E6DFB888;
  v10[491] = &unk_1E6DFB750;
  v10[492] = &unk_1E6DFBC30;
  v10[493] = &unk_1E6DFB750;
  v10[494] = &unk_1E6DFBC48;
  v10[495] = &unk_1E6DFB738;
  v10[496] = &unk_1E6DFB888;
  v10[497] = &unk_1E6DFB888;
  v10[498] = &unk_1E6DFB5B8;
  v10[499] = &unk_1E6DFB8A0;
  v10[500] = &unk_1E6DFB5A0;
  v10[501] = &unk_1E6DFB5B8;
  v10[502] = &unk_1E6DFB750;
  v10[503] = &unk_1E6DFB5A0;
  v10[504] = &unk_1E6DFB6F0;
  v10[505] = &unk_1E6DFB8A0;
  v10[506] = &unk_1E6DFB5A0;
  v10[507] = &unk_1E6DFB768;
  v10[508] = &unk_1E6DFB5A0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", arc4random_uniform(0xAu) + 187);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[509] = v5;
  v10[510] = &unk_1E6DFB870;
  v10[511] = &unk_1E6DFB5B8;
  v10[512] = &unk_1E6DFB8A0;
  v10[513] = &unk_1E6DFB720;
  v10[514] = &unk_1E6DFB5A0;
  v10[515] = &unk_1E6DFB5A0;
  v10[516] = &unk_1E6DFB738;
  v10[517] = &unk_1E6DFB5A0;
  v10[518] = &unk_1E6DFB5A0;
  v10[519] = &unk_1E6DFBB28;
  v10[520] = &unk_1E6DFB510;
  v10[521] = &unk_1E6DFBB28;
  v10[522] = &unk_1E6DFB510;
  v10[523] = &unk_1E6DFB738;
  v10[524] = &unk_1E6DFB4F8;
  v10[525] = &unk_1E6DFB570;
  v10[526] = &unk_1E6DFB4C8;
  v10[527] = &unk_1E6DFB588;
  v10[528] = &unk_1E6DFBB28;
  v10[529] = &unk_1E6DFB558;
  v10[530] = &unk_1E6DFB528;
  v10[531] = &unk_1E6DFB558;
  v10[532] = &unk_1E6DFB558;
  v10[533] = &unk_1E6DFB570;
  v10[534] = &unk_1E6DFB588;
  v10[535] = &unk_1E6DFB558;
  v10[536] = &unk_1E6DFB4E0;
  v10[537] = &unk_1E6DFB4C8;
  v10[538] = &unk_1E6DFB4E0;
  v10[539] = &unk_1E6DFB468;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 540);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](v6, &unk_1E6DF8E88, v7, v8);
}

- (void)_generateUnderwaterDivingWorkoutDataWithObjectCollection:(void *)a3 demoPerson:
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[122];

  v28[120] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v19 = a2;
  v28[0] = &unk_1E6DFBF00;
  v28[1] = &unk_1E6DFBF18;
  v28[2] = &unk_1E6DFBF30;
  v28[3] = &unk_1E6DFBF48;
  v28[4] = &unk_1E6DFBF60;
  v28[5] = &unk_1E6DFBF78;
  v28[6] = &unk_1E6DFBF90;
  v28[7] = &unk_1E6DFBFA8;
  v28[8] = &unk_1E6DFBFA8;
  v28[9] = &unk_1E6DFBFC0;
  v28[10] = &unk_1E6DFBFD8;
  v28[11] = &unk_1E6DFBFF0;
  v28[12] = &unk_1E6DFBFF0;
  v28[13] = &unk_1E6DFC008;
  v28[14] = &unk_1E6DFC020;
  v28[15] = &unk_1E6DFC038;
  v28[16] = &unk_1E6DFC050;
  v28[17] = &unk_1E6DFC068;
  v28[18] = &unk_1E6DFBE70;
  v28[19] = &unk_1E6DFBE28;
  v28[20] = &unk_1E6DFBE10;
  v28[21] = &unk_1E6DFBD68;
  v28[22] = &unk_1E6DFBDB0;
  v28[23] = &unk_1E6DFBCA8;
  v28[24] = &unk_1E6DFBE88;
  v28[25] = &unk_1E6DFBD80;
  v28[26] = &unk_1E6DFBC90;
  v28[27] = &unk_1E6DFBCD8;
  v28[28] = &unk_1E6DFBBD0;
  v28[29] = &unk_1E6DFBAC8;
  v28[32] = &unk_1E6DFBA38;
  v28[33] = &unk_1E6DFBA68;
  v28[34] = &unk_1E6DFBA50;
  v28[35] = &unk_1E6DFBC18;
  v28[30] = &unk_1E6DFBA80;
  v28[31] = &unk_1E6DFBA50;
  v28[36] = &unk_1E6DFBBE8;
  v28[37] = &unk_1E6DFBA50;
  v28[38] = &unk_1E6DFBA50;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", arc4random_uniform(0xAu) + 90);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[39] = v4;
  v28[40] = &unk_1E6DFBA50;
  v28[41] = &unk_1E6DFBBB8;
  v28[42] = &unk_1E6DFB240;
  v28[43] = &unk_1E6DFBAC8;
  v28[44] = &unk_1E6DFBD08;
  v28[45] = &unk_1E6DFBAC8;
  v28[46] = &unk_1E6DFBC60;
  v28[47] = &unk_1E6DFBC90;
  v28[48] = &unk_1E6DFBD80;
  v28[49] = &unk_1E6DFC080;
  v28[50] = &unk_1E6DFBDB0;
  v28[51] = &unk_1E6DFBE10;
  v28[52] = &unk_1E6DFBE28;
  v28[53] = &unk_1E6DFBE70;
  v28[54] = &unk_1E6DFBE58;
  v28[55] = &unk_1E6DFC068;
  v28[56] = &unk_1E6DFBE28;
  v28[57] = &unk_1E6DFBE58;
  v28[58] = &unk_1E6DFC098;
  v28[59] = &unk_1E6DFBE70;
  v28[60] = &unk_1E6DFC050;
  v28[61] = &unk_1E6DFC0B0;
  v28[62] = &unk_1E6DFC0C8;
  v28[63] = &unk_1E6DFC0E0;
  v28[64] = &unk_1E6DFC0F8;
  v28[65] = &unk_1E6DFC110;
  v28[66] = &unk_1E6DFC020;
  v28[67] = &unk_1E6DFC128;
  v28[68] = &unk_1E6DFC008;
  v28[69] = &unk_1E6DFC140;
  v28[70] = &unk_1E6DFC158;
  v28[71] = &unk_1E6DFC128;
  v28[72] = &unk_1E6DFC170;
  v28[73] = &unk_1E6DFC020;
  v28[74] = &unk_1E6DFC020;
  v28[75] = &unk_1E6DFC188;
  v28[76] = &unk_1E6DFC188;
  v28[77] = &unk_1E6DFC038;
  v28[78] = &unk_1E6DFC1A0;
  v28[79] = &unk_1E6DFC110;
  v28[80] = &unk_1E6DFC038;
  v28[81] = &unk_1E6DFC038;
  v28[82] = &unk_1E6DFC038;
  v28[83] = &unk_1E6DFC1B8;
  v28[84] = &unk_1E6DFC0F8;
  v28[85] = &unk_1E6DFC0F8;
  v28[86] = &unk_1E6DFC1D0;
  v28[87] = &unk_1E6DFC0E0;
  v28[88] = &unk_1E6DFC0E0;
  v28[89] = &unk_1E6DFC038;
  v28[90] = &unk_1E6DFC110;
  v28[91] = &unk_1E6DFC170;
  v28[92] = &unk_1E6DFC188;
  v28[93] = &unk_1E6DFC020;
  v28[94] = &unk_1E6DFC020;
  v28[95] = &unk_1E6DFC128;
  v28[96] = &unk_1E6DFC140;
  v28[97] = &unk_1E6DFC1E8;
  v28[98] = &unk_1E6DFC008;
  v28[99] = &unk_1E6DFC200;
  v28[100] = &unk_1E6DFC218;
  v28[101] = &unk_1E6DFBFF0;
  v28[102] = &unk_1E6DFBFF0;
  v28[103] = &unk_1E6DFC230;
  v28[104] = &unk_1E6DFC248;
  v28[105] = &unk_1E6DFC260;
  v28[106] = &unk_1E6DFBFA8;
  v28[107] = &unk_1E6DFC278;
  v28[108] = &unk_1E6DFC278;
  v28[109] = &unk_1E6DFC278;
  v28[110] = &unk_1E6DFC278;
  v28[111] = &unk_1E6DFC278;
  v28[112] = &unk_1E6DFC278;
  v28[113] = &unk_1E6DFC278;
  v28[114] = &unk_1E6DFBF48;
  v28[115] = &unk_1E6DFC290;
  v28[116] = &unk_1E6DFC2A8;
  v28[117] = &unk_1E6DFC2C0;
  v28[118] = &unk_1E6DFC2C0;
  v28[119] = &unk_1E6DFBF00;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 120);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0CB5D98];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 264);
  v9 = v7;
  v10 = v19;
  v11 = v8;
  v12 = (void *)MEMORY[0x1E0CB6A70];
  v13 = v5;
  objc_msgSend(v12, "quantityTypeForIdentifier:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __145__HDDemoDataActivitySampleGenerator__generateWorkoutDataForTypeIdentifier_unit_samples_objectCollection_demoPerson_sampleFrequency_workoutState___block_invoke;
  v22[3] = &unk_1E6CF67F0;
  v15 = v11;
  v23 = v15;
  v27 = 0x403E000000000000;
  v16 = v9;
  v24 = v16;
  v25 = v14;
  v17 = v10;
  v26 = v17;
  v18 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v22);

}

- (void)_generateWorkoutEffortWithObjectCollection:(void *)a3 forWorkout:(void *)a4 dataType:
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "numberWithUnsignedInt:", arc4random_uniform(7u) + 3);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "appleEffortScoreUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB6A40];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "quantitySampleWithType:quantity:startDate:endDate:", v15, v13, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObjectFromWatch:", v18);
  v19 = *(_QWORD *)(a1 + 264);
  objc_msgSend(v18, "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(*(id *)(v19 + 16), "hk_appendBytesWithUUID:", v20);

}

- (void)_generateWorkoutDataWithHeartRates:(void *)a3 recoveryHeartRates:(void *)a4 objectCollection:demoPerson:workoutState:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB6CD0];
  v10 = a2;
  v11 = a1;
  objc_msgSend(v9, "_countPerMinuteUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0CB7298];
  v39[0] = &unk_1E6DFC2D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __132__HDDemoDataActivitySampleGenerator__generateWorkoutDataWithHeartRates_recoveryHeartRates_objectCollection_demoPerson_workoutState___block_invoke;
  v32[3] = &unk_1E6CF67C8;
  v16 = v8;
  v33 = v16;
  v17 = v12;
  v34 = v17;
  v18 = v13;
  v35 = v18;
  v36 = v14;
  v19 = v7;
  v37 = v19;
  v20 = v14;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v32);
  v21 = objc_msgSend(v11, "count");

  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __132__HDDemoDataActivitySampleGenerator__generateWorkoutDataWithHeartRates_recoveryHeartRates_objectCollection_demoPerson_workoutState___block_invoke_2;
  v26[3] = &unk_1E6CF67F0;
  v22 = v16;
  v27 = v22;
  v28 = v17;
  v31 = v21 / 0xA;
  v29 = v18;
  v23 = v19;
  v30 = v23;
  v24 = v18;
  v25 = v17;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v26);

}

- (void)_generateSwimmingSegmentDataWithStartDate:(uint64_t)a3 segmentTime:(uint64_t)a4 segmentDistance:(void *)a5 numLaps:(void *)a6 strokeStyle:(double)a7 objectCollection:(double)a8 demoPerson:
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint32_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  int *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  double v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v67;
  id v68;
  uint64_t v69;
  _QWORD v70[2];

  v70[1] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v68 = a5;
  v14 = a6;
  objc_msgSend(v13, "dateByAddingTimeInterval:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v13;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v15);
  objc_msgSend(MEMORY[0x1E0CB6E50], "workoutEventWithType:dateInterval:metadata:", 7, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 264);
  if (v18)
    objc_msgSend(*(id *)(v18 + 24), "addObject:", v17);
  v19 = a8 / (double)a3;
  v20 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "yardUnit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "quantityWithUnit:doubleValue:", v21, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v22;
  v24 = v14;
  objc_msgSend(MEMORY[0x1E0CB6CD0], "yardUnit");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v23;
  objc_msgSend(v23, "doubleValueForUnit:", v25);
  v27 = v26;

  objc_msgSend(v24, "swimmingStrokesPerYard");
  v29 = v27 * v28;
  v30 = arc4random_uniform(0x64u);
  v31 = v29 * ((double)v30 / 1000.0 + (double)v30 / 1000.0 * -0.5 + 1.0);
  if (v31 <= 0.00000011920929)
  {
    v34 = 0;
  }
  else
  {
    v32 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "quantityWithUnit:doubleValue:", v33, (double)(int)v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C60]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D80]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = *MEMORY[0x1E0CB55C8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 >= 1)
  {
    v57 = v24;
    v58 = v17;
    v59 = v16;
    v60 = v15;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = a7 / (double)a3;
    v40 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
    do
    {
      v41 = v38;
      v42 = v37;
      objc_msgSend(v63, "dateByAddingTimeInterval:", v39 * (double)(int)v36, v57, v58, v59, v60);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v63, "dateByAddingTimeInterval:", v39 * (double)(int)++v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (void *)MEMORY[0x1E0CB6E50];
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v38, 0.0);
      objc_msgSend(v43, "workoutEventWithType:dateInterval:metadata:", 3, v44, v67);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = *(_QWORD *)(a1 + v40[236]);
      if (v46)
        objc_msgSend(*(id *)(v46 + 24), "addObject:", v45);
      objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v62, v64, v37, v38);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = *(_QWORD *)(a1 + v40[236]);
      if (v48)
        *(double *)(v48 + 88) = v19 + *(double *)(v48 + 88);
      objc_msgSend(v68, "addObjectFromWatch:", v47);
      v49 = *(_QWORD *)(a1 + v40[236]);
      objc_msgSend(v47, "UUID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
        objc_msgSend(*(id *)(v49 + 8), "hk_appendBytesWithUUID:", v50);

      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:metadata:", v61, v34, v37, v38, v67);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = *(_QWORD *)(a1 + v40[236]);
        objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValueForUnit:", v53);
        if (v52)
          *(double *)(v52 + 136) = v54 + *(double *)(v52 + 136);

        objc_msgSend(v68, "addObjectFromWatch:", v51);
        v55 = *(_QWORD *)(a1 + 264);
        objc_msgSend(v51, "UUID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
          objc_msgSend(*(id *)(v55 + 8), "hk_appendBytesWithUUID:", v56);

        v40 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
      }

    }
    while (a3 != v36);

    v16 = v59;
    v15 = v60;
    v24 = v57;
    v17 = v58;
  }

}

void __132__HDDemoDataActivitySampleGenerator__generateWorkoutDataWithHeartRates_recoveryHeartRates_objectCollection_demoPerson_workoutState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 56);
  else
    v5 = 0;
  v6 = (double)(unint64_t)(6 * a3);
  v7 = a2;
  objc_msgSend(v5, "dateByAddingTimeInterval:", v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB6A28];
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "doubleValue");
  v11 = v10;

  objc_msgSend(v8, "quantityWithUnit:doubleValue:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:metadata:", *(_QWORD *)(a1 + 48), v12, v16, v16, *(_QWORD *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "addObjectFromWatch:", v13);
  v14 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(*(id *)(v14 + 8), "hk_appendBytesWithUUID:", v15);

}

void __132__HDDemoDataActivitySampleGenerator__generateWorkoutDataWithHeartRates_recoveryHeartRates_objectCollection_demoPerson_workoutState___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 56);
  else
    v5 = 0;
  v6 = (double)(unint64_t)(5 * a3 + 60 * *(_QWORD *)(a1 + 64));
  v7 = a2;
  objc_msgSend(v5, "dateByAddingTimeInterval:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB6A28];
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "doubleValue");
  v12 = v11;

  objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB6A40];
  v15 = *(_QWORD *)(a1 + 48);
  v18 = *MEMORY[0x1E0CB7298];
  v19[0] = &unk_1E6DFC2F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v15, v13, v8, v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "addObjectFromWatch:", v17);
}

void __145__HDDemoDataActivitySampleGenerator__generateWorkoutDataForTypeIdentifier_unit_samples_objectCollection_demoPerson_sampleFrequency_workoutState___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 56);
  else
    v5 = 0;
  v6 = *(double *)(a1 + 64) * (double)a3;
  v7 = a2;
  objc_msgSend(v5, "dateByAddingTimeInterval:", v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB6A28];
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "doubleValue");
  v11 = v10;

  objc_msgSend(v8, "quantityWithUnit:doubleValue:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", *(_QWORD *)(a1 + 48), v12, v16, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addObjectFromWatch:", v13);
  v14 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(*(id *)(v14 + 8), "hk_appendBytesWithUUID:", v15);

}

- (double)_generateWorkoutDataSamplesForDemoPerson:(void *)a3 atTime:(void *)a4 sampleDate:(void *)a5 addFromWatch:(void *)a6 objectCollection:(double)a7 nextSampleTime:(double)a8 typeIdentifier:(double)a9 unit:(double)a10 sampleMean:(double)a11 sampleMeanStdDev:sampleFrequency:workoutState:
{
  id v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;

  v21 = a2;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  if (a7 >= a8)
  {
    a8 = a8 + a11;
    objc_msgSend(a1, "demoDataGenerator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstSampleDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v21, "compare:", v27);

    if (v28 != -1)
    {
      objc_msgSend(a1, "demoDataGenerator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "statisticsSampleGenerator");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "computeNoiseFromTime:stdDev:", a7, a10);
      v32 = v31 + a9;

      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v23);
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v24, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)v33;
      objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v33, v34, v21, v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObjectFromWatch:", v35);
      objc_msgSend(a1, "demoDataGenerator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "generatorState");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = objc_msgSend(v37, "isExercising");

      if ((_DWORD)v33)
      {
        objc_msgSend(v35, "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v25[1], "hk_appendBytesWithUUID:", v38);

      }
    }
  }

  return a8;
}

- (double)_computeExerciseTimeFromCurrentTime:(double)a3 mean:(double)a4 stdDev:(double)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v7 = (uint64_t)a3;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statisticsSampleGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "computeStatisticalTimeFromCurrentTime:mean:stdDev:", (double)(v7 + 10), a4, a5);
  v11 = v10;

  return v11;
}

- (id)_computeFlightsClimbedForDemoPerson:(id)a3 atTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;

  v6 = a3;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepSampleGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDemoPersonAwake:atTime:", v6, a4);

  if (v9
    && (objc_msgSend(v6, "flightsClimbedSampleFrequency"),
        -[HDDemoDataActivitySampleGenerator _isDemoPersonWalking:atTime:samplePeriod:](self, "_isDemoPersonWalking:atTime:samplePeriod:", v6, a4, v10)))
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isDemoDataTimeInWeekend:calendar:", v12, a4);

    if ((v13 & 1) != 0)
      objc_msgSend(v6, "weekendSleepParameters");
    else
      objc_msgSend(v6, "weekdaySleepParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sleepSampleGenerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bedtime");
    v19 = v18;
    objc_msgSend(v6, "bedtimeNoiseStdDev");
    objc_msgSend(v17, "computeSleepTimeFromCurrentTime:mean:stdDev:", a4, v19, v20);
    v22 = v21;

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sleepSampleGenerator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wakeUpTime");
    v26 = v25;
    objc_msgSend(v6, "wakeUpTimeNoiseStdDev");
    objc_msgSend(v24, "computeSleepTimeFromCurrentTime:mean:stdDev:", a4, v26, v27);
    v29 = v28;

    objc_msgSend(v6, "flightsClimbedSampleFrequency");
    v31 = (v22 - v29) / v30 * 0.6;
    objc_msgSend(v6, "flightsClimbedDailyMean");
    v33 = v32;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "statisticsSampleGenerator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flightsClimbedStdDev");
    objc_msgSend(v35, "computeNoiseFromTime:stdDev:", a4 + 1.0, v36);
    v38 = (v33 + v37) / 2.5;

    v39 = v38 / v31;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "statisticsSampleGenerator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "pseudoRandomDoubleFromTime:", a4);
    v43 = v42;

    if (v43 < v39)
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "statisticsSampleGenerator");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "computeNoiseFromTime:stdDev:", a4, 1.0);
      v47 = fabs(v46 + 2.5);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v47);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
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

  return v14;
}

- (double)_computePercentCooledForDemoPerson:(id)a3 atTime:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  double v21;

  v6 = a3;
  objc_msgSend(v6, "exerciseStopTime");
  v8 = v7;
  objc_msgSend(v6, "exerciseStopTimeStdDev");
  -[HDDemoDataActivitySampleGenerator _computeExerciseTimeFromCurrentTime:mean:stdDev:](self, "_computeExerciseTimeFromCurrentTime:mean:stdDev:", a4, v8, v9);
  v11 = v10;
  objc_msgSend(v6, "exerciseCooldownTime");
  v12 = a4 - (double)(uint64_t)a4;
  v14 = v11 + v13;
  if (v12 <= v11 || v12 > v14)
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "generatorState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isExercising");

    if (v18)
      v21 = 0.0;
    else
      v21 = 1.0;
  }
  else
  {
    v19 = v12 - v11;
    objc_msgSend(v6, "exerciseCooldownTime");
    v21 = v19 / v20;
  }

  return v21;
}

- (BOOL)_isDemoPersonCoolingDown:(id)a3 atTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v6 = a3;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generatorState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExercising");

  if (v9)
  {
    objc_msgSend(v6, "exerciseStopTime");
    v11 = v10;
    objc_msgSend(v6, "exerciseStopTimeStdDev");
    -[HDDemoDataActivitySampleGenerator _computeExerciseTimeFromCurrentTime:mean:stdDev:](self, "_computeExerciseTimeFromCurrentTime:mean:stdDev:", a4, v11, v12);
    v14 = v13;
    objc_msgSend(v6, "exerciseCooldownTime");
    v15 = a4 - (double)(uint64_t)a4;
    v17 = v15 <= v14 + v16 && v15 > v14;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isDemoPersonSedentary:(id)a3 atTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  double v16;

  v6 = a3;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepSampleGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDemoPersonAwake:atTime:", v6, a4);

  if (!v9)
    return 0;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generatorState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isExercising");

  if ((v12 & 1) != 0)
    return 0;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "statisticsSampleGenerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "computeNoiseFromTime:stdDev:", a4, 1.0);
  v13 = fabs(v16) >= 1.0;

  return v13;
}

- (BOOL)_isDemoPersonWalking:(id)a3 atTime:(double)a4 samplePeriod:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  double v17;
  double v18;

  v7 = a3;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepSampleGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDemoPersonAwake:atTime:", v7, a4);

  if (!v10)
    return 0;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generatorState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isRunning");

  if ((v13 & 1) != 0)
    return 1;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "statisticsSampleGenerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pseudoRandomDoubleFromTime:", a4);
  v18 = v17;

  return v18 < 0.6;
}

- (BOOL)_isDemoPersonInWorkoutRecovery:(id)a3 atTime:(double)a4
{
  return self->_nextHeartRateRecoveryStartTime <= a4 && self->_nextHeartRateRecoveryStopTime > a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutState, 0);
  objc_storeStrong((id *)&self->_currentWorkoutConfiguration, 0);
  objc_storeStrong((id *)&self->_lastActivityCache, 0);
  objc_storeStrong((id *)&self->_provenance, 0);
}

@end
