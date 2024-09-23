@implementation HDDemoDataFoodSampleGenerator

- (HDDemoDataFoodSampleGenerator)init
{
  HDDemoDataFoodSampleGenerator *v2;
  HDDemoDataFoodSampleGenerator *v3;
  HDDemoDataFoodDatabase *foodDatabase;
  NSArray *lastMeal;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDDemoDataFoodSampleGenerator;
  v2 = -[HDDemoDataBaseSampleGenerator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    foodDatabase = v2->_foodDatabase;
    v2->_foodDatabase = 0;

    v3->_nextMealTime = 0.0;
    v3->_nextBreakfastTime = 0.0;
    v3->_nextLunchTime = 0.0;
    v3->_nextSnackTime = 0.0;
    v3->_nextDinnerTime = 0.0;
    v3->_lastMealTime = 0.0;
    lastMeal = v3->_lastMeal;
    v3->_lastMeal = 0;

    v3->_nextBloodGlucoseSampleTime = 0.0;
    v3->_nextBloodGlucoseFingerStickSampleTime = 0.0;
    v3->_nextBloodGlucoseMealTime = 0.0;
    v3->_lastBloodGlucose = 100.0;
    v3->_nextInsulinPumpBasalSampleTime = 0.0;
    v3->_carbohydratesLeftToDigest = 0.0;
    v3->_bloodGlucoseCarbohydrateGlycemicRate = 0.0;
    v3->_bloodGlucoseDecreaseRateDueToInsulin = 0.0;
    v3->_nextWaterConsumedSampleTime = 0.0;
  }
  return v3;
}

- (HDDemoDataFoodSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataFoodSampleGenerator *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *lastMeal;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDDemoDataFoodSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextMealTimeKey"));
    v5->_nextMealTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextBreakfastTimeKey"));
    v5->_nextBreakfastTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextLunchTimeKey"));
    v5->_nextLunchTime = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextSnackTimeKey"));
    v5->_nextSnackTime = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextDinnerTimeKey"));
    v5->_nextDinnerTime = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorLastMealTimeKey"));
    v5->_lastMealTime = v11;
    v12 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("HDDemoDataFoodSampleGeneratorLastMealKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    lastMeal = v5->_lastMeal;
    v5->_lastMeal = (NSArray *)v15;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextBloodGlucoseSampleTimeKey"));
    v5->_nextBloodGlucoseSampleTime = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextBloodGlucoseFingerStickSampleTimeKey"));
    v5->_nextBloodGlucoseFingerStickSampleTime = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextBloodGlucoseMealTimeKey"));
    v5->_nextBloodGlucoseMealTime = v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorLastBloodGlucoseKey"));
    v5->_lastBloodGlucose = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextInsulinPumpBasalSampleKey"));
    v5->_nextInsulinPumpBasalSampleTime = v21;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorCarbohydratesLeftToDigestKey"));
    v5->_carbohydratesLeftToDigest = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorBloodGlucoseCarbohydrateGlycemicRateKey"));
    v5->_bloodGlucoseCarbohydrateGlycemicRate = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorBloodGlucoseDecreaseRateDueToInsulinKey"));
    v5->_bloodGlucoseDecreaseRateDueToInsulin = v24;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextWaterConsumeSampleTimeKey"));
    v5->_nextWaterConsumedSampleTime = v25;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataFoodSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextMealTimeKey"), self->_nextMealTime, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextBreakfastTimeKey"), self->_nextBreakfastTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextLunchTimeKey"), self->_nextLunchTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextSnackTimeKey"), self->_nextSnackTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextDinnerTimeKey"), self->_nextDinnerTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorLastMealTimeKey"), self->_lastMealTime);
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastMeal, CFSTR("HDDemoDataFoodSampleGeneratorLastMealKey"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextBloodGlucoseSampleTimeKey"), self->_nextBloodGlucoseSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextBloodGlucoseFingerStickSampleTimeKey"), self->_nextBloodGlucoseFingerStickSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextBloodGlucoseMealTimeKey"), self->_nextBloodGlucoseMealTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorLastBloodGlucoseKey"), self->_lastBloodGlucose);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextInsulinPumpBasalSampleKey"), self->_nextInsulinPumpBasalSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorCarbohydratesLeftToDigestKey"), self->_carbohydratesLeftToDigest);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorBloodGlucoseCarbohydrateGlycemicRateKey"), self->_bloodGlucoseCarbohydrateGlycemicRate);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorBloodGlucoseDecreaseRateDueToInsulinKey"), self->_bloodGlucoseDecreaseRateDueToInsulin);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodSampleGeneratorNextWaterConsumeSampleTimeKey"), self->_nextWaterConsumedSampleTime);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4;
  HDDemoDataFoodDatabase *v5;
  HDDemoDataFoodDatabase *foodDatabase;
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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDDemoDataFoodSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v19, sel_setupWithDemoDataGenerator_, v4);
  v5 = objc_alloc_init(HDDemoDataFoodDatabase);
  foodDatabase = self->_foodDatabase;
  self->_foodDatabase = v5;

  if (!-[HDDemoDataBaseSampleGenerator createdFromNSKeyedUnarchiver](self, "createdFromNSKeyedUnarchiver"))
  {
    objc_msgSend(v4, "demoPerson");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "breakfastTime");
    self->_nextMealTime = v8;

    objc_msgSend(v4, "demoPerson");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "breakfastTime");
    self->_nextBreakfastTime = v10;

    objc_msgSend(v4, "demoPerson");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lunchTime");
    self->_nextLunchTime = v12;

    objc_msgSend(v4, "demoPerson");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "snackTime");
    self->_nextSnackTime = v14;

    objc_msgSend(v4, "demoPerson");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dinnerTime");
    self->_nextDinnerTime = v16;

    objc_msgSend(v4, "demoPerson");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "breakfastTime");
    self->_nextBloodGlucoseMealTime = v18;

  }
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)HDDemoDataFoodSampleGenerator;
  v8 = a5;
  -[HDDemoDataBaseSampleGenerator generateFirstRunObjectsForDemoPerson:firstDate:objectCollection:](&v27, sel_generateFirstRunObjectsForDemoPerson_firstDate_objectCollection_, a3, a4, v8);
  v9 = v8;
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDemoDataGeneratorConfiguration configurationFromDefaults:](HDDemoDataGeneratorConfiguration, "configurationFromDefaults:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "shouldGenerateRecentLiquidsIntake"))
    {
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C20]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5B00]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "fluidOunceUSUnit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13, 8.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnit");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "quantityWithUnit:doubleValue:", v16, 0.12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc(MEMORY[0x1E0C99D48]);
      v19 = (void *)objc_msgSend(v18, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dateBySettingHour:minute:second:ofDate:options:", 8, 0, 0, v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v25, v14, v21, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v26, v17, v21, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v22;
      v28[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromPhone:", v24);

    }
  }

}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v12;
  id v13;
  HDDemoDataFoodSampleGenerator *v14;
  id v15;
  void **p_vtable;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  void *v27;
  HDDemoDataFoodDatabase *v28;
  void *v29;
  HDDemoDataFoodDatabase *v30;
  void *v31;
  void **v32;
  HDDemoDataFoodDatabase *v33;
  HDDemoDataFoodDatabase *v34;
  double v35;
  HDDemoDataFoodDatabase *v36;
  HDDemoDataFoodDatabase *v37;
  HDDemoDataFoodDatabase *v38;
  HDDemoDataFoodDatabase *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  int v50;
  double v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  uint64_t i;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  id v76;
  id v77;
  void (**v78)(_QWORD, double);
  double v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  char v107;
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
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  uint64_t v124;
  double v125;
  double v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  double v137;
  double v138;
  double v139;
  uint64_t v140;
  double v141;
  void *v142;
  uint64_t v143;
  double v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  id obj;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  void *v166;
  double *v167;
  id v168;
  _QWORD aBlock[5];
  id v170;
  id v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  objc_super v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  void *v184;
  _BYTE v185[128];
  _BYTE v186[128];
  void *v187;
  void *v188;
  _QWORD v189[16];
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  uint64_t v194;

  v194 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = self;
  v15 = v13;
  v180.receiver = v14;
  v180.super_class = (Class)HDDemoDataFoodSampleGenerator;
  v165 = a7;
  v166 = v15;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v180, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v12, v15, a5, a5);
  if (qword_1ED5521F0 != -1)
    dispatch_once(&qword_1ED5521F0, &__block_literal_global_26);
  p_vtable = (void **)(HDOntologyManifestImporter + 24);
  v167 = (double *)v14;
  v159 = v12;
  if (!v14)
  {
    v157 = v12;
    v24 = 0.0;
    goto LABEL_8;
  }
  v17 = v12;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](v14, "demoDataGenerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bodySampleGenerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastWeightInKg");
  v21 = v20 * 0.55;

  objc_msgSend(v17, "insulinProduction");
  v23 = v22;

  v24 = v21 * fmax(1.0 - v23, 0.0);
  v25 = -[HDDemoDataFoodSampleGenerator mealTypeForTime:]((uint64_t)v14, a5);
  v26 = v17;
  v158 = v25;
  if (v14->_nextDinnerTime <= a5)
  {
    v28 = v14->_foodDatabase;
    -[HDDemoDataFoodDatabase randomFoodForType:](v28, "randomFoodForType:", 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v14->_foodDatabase;
    -[HDDemoDataFoodDatabase randomFoodForType:](v30, "randomFoodForType:", 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v14->_nextDinnerTime = -[HDDemoDataFoodSampleGenerator _nextMealTimeForDemoPerson:atTime:]((double *)v14, v26, a5);
    v14->_nextMealTime = v14->_nextBreakfastTime;
    v189[0] = v29;
    v32 = (void **)v189;
  }
  else if (v14->_nextSnackTime <= a5)
  {
    v33 = v14->_foodDatabase;
    -[HDDemoDataFoodDatabase randomFoodForType:](v33, "randomFoodForType:", 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v14->_foodDatabase;
    -[HDDemoDataFoodDatabase randomFoodForType:](v34, "randomFoodForType:", 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "recommendedNumServings");
    objc_msgSend(v29, "setRecommendedNumServings:", v35 * 0.5);
    v14->_nextSnackTime = -[HDDemoDataFoodSampleGenerator _nextMealTimeForDemoPerson:atTime:]((double *)v14, v26, a5);
    v14->_nextMealTime = v14->_nextDinnerTime;
    *(_QWORD *)&v190 = v29;
    v32 = (void **)&v190;
  }
  else if (v14->_nextLunchTime <= a5)
  {
    v36 = v14->_foodDatabase;
    -[HDDemoDataFoodDatabase randomFoodForType:](v36, "randomFoodForType:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v14->_foodDatabase;
    -[HDDemoDataFoodDatabase randomFoodForType:](v37, "randomFoodForType:", 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v14->_nextLunchTime = -[HDDemoDataFoodSampleGenerator _nextMealTimeForDemoPerson:atTime:]((double *)v14, v26, a5);
    v14->_nextMealTime = v14->_nextSnackTime;
    v188 = v29;
    v32 = &v188;
  }
  else
  {
    if (v14->_nextBreakfastTime > a5)
    {
LABEL_8:
      v27 = v159;

      obj = 0;
      goto LABEL_61;
    }
    v38 = v14->_foodDatabase;
    -[HDDemoDataFoodDatabase randomFoodForType:](v38, "randomFoodForType:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v14->_foodDatabase;
    -[HDDemoDataFoodDatabase randomFoodForType:](v39, "randomFoodForType:", 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v14->_nextBreakfastTime = -[HDDemoDataFoodSampleGenerator _nextMealTimeForDemoPerson:atTime:]((double *)v14, v26, a5);
    v14->_nextMealTime = v14->_nextLunchTime;
    v187 = v29;
    v32 = &v187;
  }
  v32[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_storeStrong((id *)&v14->_lastMeal, v40);
    v178 = 0u;
    v179 = 0u;
    v177 = 0u;
    v176 = 0u;
    obj = v40;
    v163 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v186, 16);
    if (v163)
    {
      v162 = *(_QWORD *)v177;
      v160 = *MEMORY[0x1E0CB5508];
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v177 != v162)
            objc_enumerationMutation(obj);
          v164 = v41;
          v42 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * v41);
          v168 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v172 = 0u;
          v173 = 0u;
          v174 = 0u;
          v175 = 0u;
          objc_msgSend(v42, "nutritionFacts");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v172, v185, 16);
          if (v44)
          {
            v45 = v44;
            v46 = *(_QWORD *)v173;
            do
            {
              v47 = 0;
              do
              {
                if (*(_QWORD *)v173 != v46)
                  objc_enumerationMutation(v43);
                v48 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * v47);
                if (objc_msgSend(v26, "nutritionTrackingType") == 2)
                  goto LABEL_28;
                v49 = v48;
                if (qword_1ED552200 != -1)
                  dispatch_once(&qword_1ED552200, &__block_literal_global_248);
                v50 = objc_msgSend((id)qword_1ED5521F8, "containsObject:", v49);

                if (v50)
                {
LABEL_28:
                  v51 = -[HDDemoDataFoodSampleGenerator _computeNutrientForDemoPerson:atTime:mealItem:quantityType:]((id *)&v14->super.super.isa, v26, v42, v48, a5)* 1.3;
                  if (v51 != 0.0 && v51 != -2147483650.0)
                  {
                    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v48);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HDDemoDataFoodDatabase canonicalDietaryUnitForQuantityTypeIdentifier:](v14->_foodDatabase, "canonicalDietaryUnitForQuantityTypeIdentifier:", v48);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v54, v51);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v53, v55, v166, v166);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v165, "addObjectFromPhone:", v56);
                    objc_msgSend(v168, "addObject:", v56);

                    v14 = (HDDemoDataFoodSampleGenerator *)v167;
                  }
                }
                ++v47;
              }
              while (v45 != v47);
              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v172, v185, 16);
            }
            while (v45);
          }

          if (objc_msgSend(v168, "count"))
          {
            v183 = v160;
            objc_msgSend(v42, "brandName");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v184 = v57;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB6518], "correlationWithType:startDate:endDate:objects:metadata:", _MergedGlobals_9, v166, v166, v168, v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "addObjectFromPhone:", v59);

            v14 = (HDDemoDataFoodSampleGenerator *)v167;
          }

          v41 = v164 + 1;
        }
        while (v164 + 1 != v163);
        v163 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v186, 16);
      }
      while (v163);
    }
    v60 = obj;

    if ((unint64_t)(v158 - 2) < 3)
    {
LABEL_47:
      v66 = v60;
      obj = v66;
      if (v24 == 0.0)
        goto LABEL_56;
      v192 = 0u;
      v193 = 0u;
      v190 = 0u;
      v191 = 0u;
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v190, v189, 16);
      v66 = obj;
      if (!v67)
        goto LABEL_56;
      v68 = *(_QWORD *)v191;
      v69 = *MEMORY[0x1E0CB5B10];
      v70 = 0.0;
      do
      {
        for (i = 0; i != v67; ++i)
        {
          if (*(_QWORD *)v191 != v68)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v190 + 1) + 8 * i), "nutritionFacts");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKeyedSubscript:", v69);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "doubleValue");
          v70 = v70 + v74;

        }
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v190, v189, 16);
      }
      while (v67);
      v14 = (HDDemoDataFoodSampleGenerator *)v167;
      v66 = obj;
      if (v70 == 0.0)
      {
LABEL_56:

        v75 = 0;
      }
      else
      {
        v146 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "internationalUnit");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "quantityWithUnit:doubleValue:", v147, floor(v70 / (500.0 / v24)));
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
        {
          v148 = (void *)MEMORY[0x1E0CB6A40];
          p_vtable = HDOntologyManifestImporter.vtable;
          v149 = qword_1ED5521E0;
          v181 = *MEMORY[0x1E0CB5560];
          v182 = &unk_1E6DFA880;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v149, v75, v166, v166, v150);
          v151 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v165, "addObjectFromPhone:", v151);
          v14 = (HDDemoDataFoodSampleGenerator *)v167;
          goto LABEL_58;
        }
        v14 = (HDDemoDataFoodSampleGenerator *)v167;
      }
      p_vtable = (void **)(HDOntologyManifestImporter + 24);
LABEL_58:
      v27 = v159;

      goto LABEL_61;
    }
    if (v158 == 1)
    {
      v61 = (void *)qword_1ED5521E0;
      v62 = v26;
      v63 = v61;
      v64 = v166;
      if (v24 == 0.0 || objc_msgSend(v62, "insulinTherapy"))
      {
        v65 = 0;
      }
      else
      {
        v152 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "internationalUnit");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "quantityWithUnit:doubleValue:", v153, floor(v24 * 0.5));
        v154 = (void *)objc_claimAutoreleasedReturnValue();

        v155 = (void *)MEMORY[0x1E0CB6A40];
        *(_QWORD *)&v190 = *MEMORY[0x1E0CB5560];
        v189[0] = &unk_1E6DFA898;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v189, &v190, 1);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v63, v154, v64, v64, v156);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (HDDemoDataFoodSampleGenerator *)v167;
      }

      if (v65)
        objc_msgSend(v165, "addObjectFromPhone:", v65);

      v60 = obj;
      goto LABEL_47;
    }
  }
  else
  {
    obj = 0;
  }
  p_vtable = HDOntologyManifestImporter.vtable;
  v27 = v159;
LABEL_61:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__HDDemoDataFoodSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke_244;
  aBlock[3] = &unk_1E6CEB998;
  aBlock[4] = v14;
  v76 = v27;
  v170 = v76;
  v77 = v165;
  v171 = v77;
  v78 = (void (**)(_QWORD, double))_Block_copy(aBlock);
  if (objc_msgSend(v76, "useContinuousGlucoseMonitoring"))
  {
    while (a4 <= a5)
    {
      v78[2](v78, a4);
      objc_msgSend(v76, "continuousGlucoseMonitoringSampleFrequency");
      a4 = a4 + v79;
    }
  }
  else
  {
    v78[2](v78, a5);
  }
  v80 = p_vtable[60];
  v81 = v76;
  v82 = v80;
  v83 = v166;
  v84 = 0;
  if (v167 && v24 != 0.0)
  {
    if (objc_msgSend(v81, "insulinTherapy") == 1 && v167[11] <= a5)
    {
      objc_msgSend(v81, "timeIncrement");
      v167[11] = v85 + a5;
      objc_msgSend(v81, "timeIncrement");
      v87 = floor(v24 * 0.5 * v86 * 40.0) / 40.0;
      v88 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "internationalUnit");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "quantityWithUnit:doubleValue:", v89, v87);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v81, "timeIncrement");
      objc_msgSend(v83, "dateByAddingTimeInterval:", v91 * -86400.0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = (void *)MEMORY[0x1E0CB6A40];
      *(_QWORD *)&v190 = *MEMORY[0x1E0CB5560];
      v189[0] = &unk_1E6DFA898;
      v94 = (void *)MEMORY[0x1E0C99D80];
      v95 = v83;
      objc_msgSend(v94, "dictionaryWithObjects:forKeys:count:", v189, &v190, 1);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v82, v90, v92, v95, v96);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v84 = 0;
    }
  }

  if (v84)
    objc_msgSend(v77, "addObjectFromPhone:", v84);
  v97 = v81;
  v98 = v97;
  if (!v167)
    goto LABEL_76;
  if (v167[15] > a5)
    goto LABEL_76;
  objc_msgSend(v97, "waterConsumedSampleFrequency");
  v167[15] = v99 + a5;
  objc_msgSend(v167, "demoDataGenerator");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "sleepSampleGenerator");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v101, "isDemoPersonSleeping:atTime:", v98, a5);

  if ((v102 & 1) != 0)
  {
LABEL_76:
    v103 = 0;
    v104 = v98;
LABEL_77:

    goto LABEL_78;
  }
  objc_msgSend(v167, "demoDataGenerator");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v105, "isDemoDataTimeInWeekend:calendar:", v106, a5);

  if ((v107 & 1) != 0)
    objc_msgSend(v98, "weekendSleepParameters");
  else
    objc_msgSend(v98, "weekdaySleepParameters");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "demoDataGenerator");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "sleepSampleGenerator");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "bedtime");
  v112 = v111;
  objc_msgSend(v98, "bedtimeNoiseStdDev");
  objc_msgSend(v110, "computeSleepTimeFromCurrentTime:mean:stdDev:", a5, v112, v113);
  v115 = v114;

  objc_msgSend(v167, "demoDataGenerator");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "sleepSampleGenerator");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "wakeUpTime");
  v119 = v118;
  objc_msgSend(v98, "wakeUpTimeNoiseStdDev");
  objc_msgSend(v117, "computeSleepTimeFromCurrentTime:mean:stdDev:", a5, v119, v120);
  v122 = v121;

  objc_msgSend(v98, "waterConsumedSampleFrequency");
  v124 = (uint64_t)((v115 - v122) / v123);
  objc_msgSend(v98, "waterConsumedDailyMean");
  v126 = v125;
  objc_msgSend(v98, "waterConsumedIntervalMean");
  v128 = (double)((uint64_t)(v126 / v127) / v124);
  objc_msgSend(v167, "demoDataGenerator");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "statisticsSampleGenerator");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "pseudoRandomDoubleFromTime:", a5);
  v132 = v131;

  if (v132 >= v128)
  {
    v103 = 0;
  }
  else
  {
    objc_msgSend(v98, "waterConsumedIntervalMean");
    v134 = v133;
    objc_msgSend(v167, "demoDataGenerator");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "statisticsSampleGenerator");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "waterConsumedIntervalStdDev");
    objc_msgSend(v136, "computeNoiseFromTime:stdDev:", a5, v137);
    v139 = v134 + v138;

    v140 = 100 * (uint64_t)(v139 / 100.0);
    if (v140 < 0)
      v140 = -100 * (uint64_t)(v139 / 100.0);
    v141 = (double)v140;
    if ((double)v140 < 200.0)
      v141 = 200.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v141);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v103)
  {
    v142 = (void *)MEMORY[0x1E0CB6A28];
    v143 = qword_1ED5521D0;
    objc_msgSend(v103, "doubleValue");
    objc_msgSend(v142, "quantityWithUnit:doubleValue:", v143, v144 / 1000.0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED5521E8, v104, v83, v83);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addObjectFromPhone:", v145);

    goto LABEL_77;
  }
LABEL_78:

}

void __107__HDDemoDataFoodSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
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

  objc_msgSend(MEMORY[0x1E0CB6528], "correlationTypeForIdentifier:", *MEMORY[0x1E0CB4AC0]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = v0;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mg/dL"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED5521C8;
  qword_1ED5521C8 = v2;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "literUnit");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED5521D0;
  qword_1ED5521D0 = v4;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A98]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED5521D8;
  qword_1ED5521D8 = v6;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CD0]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED5521E0;
  qword_1ED5521E0 = v8;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C20]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ED5521E8;
  qword_1ED5521E8 = v10;

}

- (uint64_t)mealTypeForTime:(uint64_t)result
{
  if (result)
  {
    if (*(double *)(result + 152) <= a2)
    {
      return 4;
    }
    else if (*(double *)(result + 144) <= a2)
    {
      return 3;
    }
    else if (*(double *)(result + 136) <= a2)
    {
      return 2;
    }
    else if (*(double *)(result + 128) <= a2)
    {
      return 1;
    }
    else
    {
      return 5;
    }
  }
  return result;
}

- (double)_computeNutrientForDemoPerson:(void *)a3 atTime:(void *)a4 mealItem:(double)a5 quantityType:
{
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  int v44;
  double v45;
  double v46;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = 0.0;
  if (a1)
  {
    v13 = a5 - (double)(uint64_t)a5;
    v14 = 1.0;
    if (objc_msgSend(v9, "biologicalSex") == 2)
      v15 = 1.2;
    else
      v15 = 1.0;
    objc_msgSend(v9, "numCupsOfCoffeeDailyMean");
    v17 = v16;
    objc_msgSend(a1, "demoDataGenerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "statisticsSampleGenerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numCupsOfCoffeeStdDev");
    objc_msgSend(v19, "computeNoiseFromTime:stdDev:", a5, v20);
    v22 = v21;

    objc_msgSend(v9, "dinnerTime");
    if (v13 >= v23)
    {
      v27 = 4;
    }
    else
    {
      objc_msgSend(v9, "snackTime");
      if (v13 >= v24)
      {
        v14 = 0.5;
        v27 = 3;
      }
      else
      {
        objc_msgSend(v9, "lunchTime");
        if (v13 >= v25)
        {
          v27 = 2;
        }
        else
        {
          objc_msgSend(v9, "breakfastTime");
          if (v13 < v26)
            goto LABEL_24;
          v27 = 1;
        }
      }
    }
    objc_msgSend(v10, "nutritionFacts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v14 * v30;
    objc_msgSend(v10, "recommendedNumServings");
    v33 = v31 * v32;

    if (v33 != 0.0)
    {
      if (v27 <= (uint64_t)(v17 + v22) && objc_msgSend(v10, "foodType") != 5)
      {
        objc_msgSend(a1[4], "coffee");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "nutritionFacts");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v11);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v33 = v33 + v37;

      }
      objc_msgSend(v9, "weightLossStartDay");
      if (v38 > a5)
      {
        objc_msgSend(v9, "preDietIntakeMultiplier");
        v33 = v33 * v39;
      }
      objc_msgSend(a1, "demoDataGenerator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "statisticsSampleGenerator");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "pseudoRandomDoubleFromTime:", a5);
      v43 = v15 * v33 * (v42 * 0.07 + 0.95);

      v44 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB5C20]);
      v45 = 10.0;
      if (v43 >= 10.0)
        v45 = v43;
      v46 = (double)(uint64_t)v45;
      if (v44)
        v12 = v46;
      else
        v12 = v43;
    }
  }
LABEL_24:

  return v12;
}

void __107__HDDemoDataFoodSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke_244(id *a1, double a2)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  double v83;
  uint64_t i;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  char v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  int v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  void *v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  uint64_t v138;
  double v139;
  void *v140;
  void *v141;
  double v142;
  double v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  void *v153;
  id v154;
  id v155;
  id v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  v5 = a1[5];
  v6 = v5;
  if (!v4 || *((double *)v4 + 7) > a2)
    goto LABEL_77;
  if (objc_msgSend(v5, "useContinuousGlucoseMonitoring"))
  {
    objc_msgSend(v6, "continuousGlucoseMonitoringSampleFrequency");
    *((double *)v4 + 7) = v7 + a2;
    v8 = 1;
  }
  else if (*((double *)v4 + 8) <= a2)
  {
    v9 = (uint64_t)a2;
    objc_msgSend(v4, "demoDataGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isDemoDataTimeInWeekend:calendar:", v11, a2);

    if ((v12 & 1) != 0)
      objc_msgSend(v6, "weekendSleepParameters");
    else
      objc_msgSend(v6, "weekdaySleepParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "demoDataGenerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activitySampleGenerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exerciseStartTime");
    v17 = v16;
    objc_msgSend(v6, "exerciseStartTimeStdDev");
    objc_msgSend(v15, "_computeExerciseTimeFromCurrentTime:mean:stdDev:", a2, v17, v18);
    v154 = v19;

    objc_msgSend(v4, "demoDataGenerator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activitySampleGenerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exerciseStopTime");
    v23 = v22;
    objc_msgSend(v6, "exerciseStopTimeStdDev");
    objc_msgSend(v21, "_computeExerciseTimeFromCurrentTime:mean:stdDev:", a2, v23, v24);
    v26 = v25;

    v27 = (double)v9;
    objc_msgSend(v6, "breakfastTime");
    v29 = v28;
    objc_msgSend(v6, "breakfastTimeSampleNoiseStdDev");
    objc_msgSend(v4, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v6, 1, a2, v29, v30);
    v32 = v31 + (double)v9;
    objc_msgSend(v6, "breakfastTime");
    v34 = v33;
    objc_msgSend(v6, "mealTimeSampleNoiseStdDev");
    objc_msgSend(v4, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v6, 2, a2, v34, v35);
    v37 = v36;
    objc_msgSend(v6, "breakfastTime");
    v39 = v38;
    objc_msgSend(v6, "mealTimeSampleNoiseStdDev");
    objc_msgSend(v4, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v6, 3, a2, v39, v40);
    v152 = v41;
    objc_msgSend(v6, "breakfastTime");
    v43 = v42;
    objc_msgSend(v6, "mealTimeSampleNoiseStdDev");
    objc_msgSend(v4, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v6, 4, a2, v43, v44);
    v151 = v45;
    objc_msgSend(v4, "demoDataGenerator");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sleepSampleGenerator");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bedtime");
    v49 = v48;
    objc_msgSend(v6, "bedtimeNoiseStdDev");
    objc_msgSend(v47, "computeSleepTimeFromCurrentTime:mean:stdDev:", a2, v49, v50);
    v150 = v51;

    objc_msgSend(v4, "demoDataGenerator");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "sleepSampleGenerator");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wakeUpTime");
    v55 = v54;
    objc_msgSend(v6, "wakeUpTimeNoiseStdDev");
    objc_msgSend(v53, "computeSleepTimeFromCurrentTime:mean:stdDev:", a2 + 1.0, v55, v56);
    v58 = v57;

    objc_msgSend(v4, "demoDataGenerator");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activitySampleGenerator");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exerciseStartTime");
    v62 = v61;
    objc_msgSend(v6, "exerciseStartTimeStdDev");
    objc_msgSend(v60, "_computeExerciseTimeFromCurrentTime:mean:stdDev:", a2 + 1.0, v62, v63);
    v65 = v64;

    if (*(double *)&v154 <= a2)
    {
      v67 = v37 + v27;
      if (v32 <= a2)
      {
        v68 = v152 + v27;
        if (v67 <= a2)
        {
          v69 = v151 + v27;
          if (v68 <= a2)
          {
            if (v69 <= a2)
              v66 = v58 + (double)(v9 + 1) + (v65 + (double)(v9 + 1) - (v58 + (double)(v9 + 1))) * 0.5;
            else
              v66 = v69 + (v150 + v27 - v69) * 0.5;
          }
          else
          {
            v66 = v68 + (v69 - v68) * 0.5;
          }
        }
        else
        {
          v66 = v67 + (v68 - v67) * 0.5;
        }
      }
      else
      {
        v66 = v32 + (v67 - v32) / 3.0;
      }
    }
    else
    {
      v66 = v26 + (v32 - v26) * 0.5;
    }
    *((double *)v4 + 8) = v66;
    objc_msgSend(v4, "demoDataGenerator", *(_QWORD *)&v150);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "statisticsSampleGenerator");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "pseudoRandomDoubleFromTime:", a2);
    v73 = v72;
    objc_msgSend(v6, "numDailyFingerSticksAdherence");
    v8 = v73 < v74;

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "demoDataGenerator");
  v155 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "bodySampleGenerator");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "lastWeightInKg");
  v76 = v75;
  v77 = v6;
  if (*((double *)v4 + 9) < a2)
  {
    v159 = 0u;
    v160 = 0u;
    v157 = 0u;
    v158 = 0u;
    v78 = *((id *)v4 + 6);
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v157, v161, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v158;
      v82 = (void *)*MEMORY[0x1E0CB5B10];
      v83 = 0.0;
      do
      {
        for (i = 0; i != v80; ++i)
        {
          if (*(_QWORD *)v158 != v81)
            objc_enumerationMutation(v78);
          v83 = v83
              + -[HDDemoDataFoodSampleGenerator _computeNutrientForDemoPerson:atTime:mealItem:quantityType:]((id *)v4, v77, *(void **)(*((_QWORD *)&v157 + 1) + 8 * i), v82, a2);
        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v157, v161, 16);
      }
      while (v80);

      if (v83 > 0.0)
      {
        objc_msgSend(v4, "demoDataGenerator");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "statisticsSampleGenerator");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "computeNoiseFromTime:stdDev:", a2 + 4.0, 0.58);
        v88 = fabs(v87) + 1.0;

        v89 = *((double *)v4 + 12);
        if (v89 > 0.0)
          v88 = (v83 * v88 + v89 * *((double *)v4 + 13)) / (v83 + v89);
        *((double *)v4 + 13) = v88;
        *((double *)v4 + 12) = v83 + *((double *)v4 + 12);
      }
    }
    else
    {

    }
  }
  objc_msgSend(v4, "demoDataGenerator");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "sleepSampleGenerator");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "isDemoPersonAwake:atTime:", v77, a2);

  if (v92)
  {
    objc_msgSend(v4, "demoDataGenerator");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "generatorState");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "isExercising");

    if ((v95 & 1) != 0)
    {
      v96 = 5.233;
    }
    else
    {
      objc_msgSend(v4, "demoDataGenerator");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "activitySampleGenerator");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "continuousGlucoseMonitoringSampleFrequency");
      v104 = objc_msgSend(v102, "_isDemoPersonWalking:atTime:samplePeriod:", v77, a2, v103);

      if (v104)
      {
        objc_msgSend(v4, "demoDataGenerator");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "activitySampleGenerator");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "_computeFlightsClimbedForDemoPerson:atTime:", v77, a2);
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        v96 = dbl_1B7F3A620[v107 == 0];
      }
      else
      {
        v96 = 0.443;
      }
    }
  }
  else
  {
    v96 = 0.233;
  }
  if (objc_msgSend(v77, "biologicalSex") == 2)
    v96 = v96 * 1.1;
  objc_msgSend(v77, "continuousGlucoseMonitoringSampleFrequency");
  v98 = v96 * (v97 / 0.000694444444);
  v99 = *((double *)v4 + 10);
  if (v99 <= 185.0)
  {
    if (v99 <= 180.0)
    {
      if (v99 <= 170.0)
      {
        if (v99 <= 160.0)
        {
          if (v99 <= 150.0)
          {
            if (v99 <= 140.0)
              v100 = dbl_1B7F3A630[v99 > 130.0];
            else
              v100 = 0.10019;
          }
          else
          {
            v100 = 0.20038;
          }
        }
        else
        {
          v100 = 0.39377;
        }
      }
      else
      {
        v100 = 0.8155;
      }
    }
    else
    {
      v100 = 1.6543;
    }
  }
  else
  {
    v100 = 2.4698;
  }
  if (objc_msgSend(v77, "biologicalSex") == 2)
    v108 = v100 * 1.08;
  else
    v108 = v100;
  objc_msgSend(v77, "insulinProduction");
  v110 = v109;
  objc_msgSend(v77, "insulinProduction");
  v112 = 1.0 - v111;
  objc_msgSend(v77, "insulinAdherence");
  v114 = *((double *)v4 + 14) + v108 * (v110 + v112 * v113);
  *((double *)v4 + 14) = v114;
  objc_msgSend(v77, "insulinSensitivity");
  v116 = v114 * v115;
  objc_msgSend(v77, "continuousGlucoseMonitoringSampleFrequency");
  v118 = v98 + v116 * (v117 / 0.000694444444);
  objc_msgSend(v77, "continuousGlucoseMonitoringSampleFrequency");
  *((long double *)v4 + 14) = *((double *)v4 + 14) * exp2(v119 / -0.00347222222);
  v120 = 0.0;
  if (*((double *)v4 + 12) > 0.0)
  {
    v121 = fmax(v76 * 2.20461988 * -0.02 + 7.0, 2.0);
    if (v121 <= 5.5)
      v122 = v121;
    else
      v122 = 5.5;
    v123 = *((double *)v4 + 13) / v122;
    objc_msgSend(v77, "continuousGlucoseMonitoringSampleFrequency");
    v125 = v123 * (v124 / 0.000694444444);
    v126 = *((double *)v4 + 12);
    if (v125 >= v126)
      v125 = *((double *)v4 + 12);
    v127 = v126 - v125;
    *((double *)v4 + 12) = v127;
    if (v127 < 0.0)
    {
      *((_QWORD *)v4 + 12) = 0;
      *((_QWORD *)v4 + 13) = 0;
    }
    v120 = v125 * v122 + 0.0;
  }
  v128 = v120 + *((double *)v4 + 10) - v118;
  if (v128 < 80.0)
  {
    v129 = (80.0 - v128) * 4.0 / 5.0;
    objc_msgSend(v4, "demoDataGenerator");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "statisticsSampleGenerator");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "computeNoiseFromTime:stdDev:", a2, v129 / 5.0);
    v133 = v129 * fabs(v132);

    v120 = v120 + v133;
  }
  objc_msgSend(v4, "demoDataGenerator");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "statisticsSampleGenerator");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "computeNoiseFromTime:stdDev:", a2, 2.0);
  v137 = v136;

  v138 = (uint64_t)(v137 + sin((a2 + -0.375) * 6.28318531) * 0.08 + v120 - v118 + *((double *)v4 + 10));
  if (*((double *)v4 + 9) <= a2)
    *((_QWORD *)v4 + 9) = *((_QWORD *)v4 + 5);
  v139 = (double)v138;
  if (*((double *)v4 + 7) - a2 < 0.0173611111)
    v139 = *((double *)v4 + 10) * 0.13 + v139 * 0.87;
  if (!v8)
  {
LABEL_77:
    v156 = 0;
    goto LABEL_78;
  }
  objc_msgSend(v4, "demoDataGenerator");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "statisticsSampleGenerator");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "computeNoiseFromTime:stdDev:", a2 + 4.0, 10.0);
  v143 = v139 + v142;

  *((double *)v4 + 10) = floor(v143);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v156 = (id)objc_claimAutoreleasedReturnValue();

  v144 = v156;
  if (v156)
  {
    objc_msgSend(a1[4], "demoDataGenerator");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "currentDateFromCurrentTime:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v146 = (void *)MEMORY[0x1E0CB6A28];
    v147 = qword_1ED5521C8;
    objc_msgSend(v156, "doubleValue");
    objc_msgSend(v146, "quantityWithUnit:doubleValue:", v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED5521D8, v148, v6, v6);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "addObjectFromPhone:", v149);

LABEL_78:
    v144 = v156;
  }

}

void __73__HDDemoDataFoodSampleGenerator__isTypicalNutritionTrackingQuantityType___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB5B00];
  v7[0] = *MEMORY[0x1E0CB5B10];
  v7[1] = v1;
  v2 = *MEMORY[0x1E0CB5BD8];
  v7[2] = *MEMORY[0x1E0CB5B58];
  v7[3] = v2;
  v3 = *MEMORY[0x1E0CB5B38];
  v7[4] = *MEMORY[0x1E0CB5BB8];
  v7[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED5521F8;
  qword_1ED5521F8 = v5;

}

- (BOOL)_isDemoPersonConsumingCaffeine:(id)a3 atTime:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  BOOL result;
  double v19;
  double nextBreakfastTime;
  double v21;
  char v22;
  double v23;
  BOOL v24;

  v6 = a3;
  v7 = (double)(uint64_t)a4;
  v8 = a4 - v7;
  objc_msgSend(v6, "numCupsOfCoffeeDailyMean");
  v10 = v9;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statisticsSampleGenerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numCupsOfCoffeeStdDev");
  v14 = v13;

  objc_msgSend(v12, "computeNoiseFromTime:stdDev:", v7, v14);
  v16 = v15;

  v17 = -[HDDemoDataFoodSampleGenerator mealTypeForTime:]((uint64_t)self, v8) - 1;
  result = 0;
  v19 = fabs(v10 + v16);
  switch(v17)
  {
    case 0:
      nextBreakfastTime = self->_nextBreakfastTime;
      self->_lastMealTime = nextBreakfastTime;
      v21 = 1.0;
      goto LABEL_7;
    case 1:
      nextBreakfastTime = self->_nextLunchTime;
      self->_lastMealTime = nextBreakfastTime;
      v21 = 2.0;
      goto LABEL_7;
    case 2:
      nextBreakfastTime = self->_nextSnackTime;
      self->_lastMealTime = nextBreakfastTime;
      v21 = 3.0;
      goto LABEL_7;
    case 3:
      nextBreakfastTime = self->_nextDinnerTime;
      self->_lastMealTime = nextBreakfastTime;
      v21 = 4.0;
LABEL_7:
      if (v19 < v21)
        goto LABEL_8;
      v22 = 0;
      break;
    case 4:
      return result;
    default:
      nextBreakfastTime = self->_lastMealTime;
LABEL_8:
      v22 = 1;
      break;
  }
  v23 = nextBreakfastTime + 0.0163541667;
  self->_lastMealTime = v23;
  v24 = v8 <= v23;
  if (v8 >= v23 + 0.0486111111)
    v24 = 1;
  return (v22 | v24) ^ 1;
}

- (double)_computeMealTimeForDemoPerson:(id)a3 fromTime:(double)a4 mealTimeType:(int64_t)a5 timeMean:(double)a6 stdDev:(double)a7
{
  int v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v9 = a5;
  v10 = (double)(uint64_t)a4;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statisticsSampleGenerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "computeStatisticalTimeFromCurrentTime:mean:stdDev:", (double)v9 + v10 * 4.0, a6, a7);
  v14 = v13;

  return v14;
}

- (double)_nextMealTimeForDemoPerson:(double)a3 atTime:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  void *v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v27;
  double v28;
  double v29;
  double v30;

  v5 = a2;
  v6 = v5;
  v7 = (uint64_t)a3;
  v8 = (uint64_t)a3 + 1;
  if (a1[19] <= a3)
  {
    v10 = (double)v7;
    objc_msgSend(v5, "dinnerTime");
    v12 = v11;
    objc_msgSend(v6, "mealTimeSampleNoiseStdDev");
    v14 = v13;
    v15 = a1;
    v16 = v6;
    v17 = v10;
    v18 = 4;
LABEL_9:
    objc_msgSend(v15, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v16, v18, v17, v12, v14);
    v9 = v25 + (double)v8;
    goto LABEL_10;
  }
  if (a1[18] <= a3)
  {
    v19 = (double)v7;
    objc_msgSend(v5, "snackTime");
    v12 = v20;
    objc_msgSend(v6, "mealTimeSampleNoiseStdDev");
    v14 = v21;
    v15 = a1;
    v16 = v6;
    v17 = v19;
    v18 = 3;
    goto LABEL_9;
  }
  if (a1[17] <= a3)
  {
    v22 = (double)v7;
    objc_msgSend(v5, "lunchTime");
    v12 = v23;
    objc_msgSend(v6, "mealTimeSampleNoiseStdDev");
    v14 = v24;
    v15 = a1;
    v16 = v6;
    v17 = v22;
    v18 = 2;
    goto LABEL_9;
  }
  if (a1[16] <= a3)
  {
    objc_msgSend(v5, "breakfastTime");
    v28 = v27;
    objc_msgSend(v6, "breakfastTimeSampleNoiseStdDev");
    objc_msgSend(a1, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v6, 1, (double)v8, v28, v29);
    v9 = v30 + (double)v8;
  }
  else
  {
    v9 = a1[5];
  }
LABEL_10:

  return v9;
}

- (void)_generateRandomLastMeal
{
  HDDemoDataFoodDatabase *foodDatabase;
  HDDemoDataFoodDatabase *v4;
  void *v5;
  HDDemoDataFoodDatabase *v6;
  HDDemoDataFoodDatabase *v7;
  void *v8;
  NSArray *v9;
  NSArray *lastMeal;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (self)
    foodDatabase = self->_foodDatabase;
  else
    foodDatabase = 0;
  v4 = foodDatabase;
  -[HDDemoDataFoodDatabase randomFoodForType:](v4, "randomFoodForType:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    v6 = self->_foodDatabase;
  else
    v6 = 0;
  v7 = v6;
  -[HDDemoDataFoodDatabase randomFoodForType:](v7, "randomFoodForType:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v5;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lastMeal = self->_lastMeal;
  self->_lastMeal = v9;

}

- (id)_lastMeal
{
  return self->_lastMeal;
}

- (double)nextBreakfastTime
{
  return self->_nextBreakfastTime;
}

- (double)nextLunchTime
{
  return self->_nextLunchTime;
}

- (double)nextSnackTime
{
  return self->_nextSnackTime;
}

- (double)nextDinnerTime
{
  return self->_nextDinnerTime;
}

- (double)lastMealTime
{
  return self->_lastMealTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMeal, 0);
  objc_storeStrong((id *)&self->_foodDatabase, 0);
}

@end
