@implementation HDDemoDataAlcoholSampleGenerator

- (HDDemoDataAlcoholSampleGenerator)init
{
  HDDemoDataAlcoholSampleGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  result = -[HDDemoDataBaseSampleGenerator init](&v3, sel_init);
  if (result)
    result->_nextCheckInTime = 0.0;
  return result;
}

- (HDDemoDataAlcoholSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataAlcoholSampleGenerator *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataAlcoholSampleGeneratorNextCheckInTimeKey"));
    v5->_nextCheckInTime = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataAlcoholSampleGeneratorNextCheckInTimeKey"), self->_nextCheckInTime, v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v10, sel_setupWithDemoDataGenerator_, v4);
  if (!-[HDDemoDataBaseSampleGenerator createdFromNSKeyedUnarchiver](self, "createdFromNSKeyedUnarchiver"))
  {
    objc_msgSend(v4, "foodSampleGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "demoPerson");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "demoPerson");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dinnerTime");
    objc_msgSend(v5, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v6, 4, 0.0, v8, 0.0243055556);
    self->_nextCheckInTime = v9;

  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v21, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v14, v13, v12, a5, a5);
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator", v21.receiver, v21.super_class);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "foodSampleGenerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "statisticsSampleGenerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bodySampleGenerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataAlcoholSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:foodSampleGenerator:statisticsSampleGenerator:bodySampleGenerator:objectCollection:](self, "generateObjectsForDemoPerson:fromTime:toTime:currentDate:foodSampleGenerator:statisticsSampleGenerator:bodySampleGenerator:objectCollection:", v14, v13, v16, v18, v20, v12, a4, a5);

}

- (BOOL)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 foodSampleGenerator:(id)a7 statisticsSampleGenerator:(id)a8 bodySampleGenerator:(id)a9 objectCollection:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint64_t v25;
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
  HDDemoDataAlcoholSampleGenerator *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;

  v18 = a3;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  if ((objc_msgSend(v18, "resultsTrackingType") == 2 || objc_msgSend(v18, "profileType") == 4)
    && self->_nextCheckInTime <= a5)
  {
    if (qword_1ED552340 != -1)
      dispatch_once(&qword_1ED552340, &__block_literal_global_115);
    v25 = (uint64_t)a5;
    objc_msgSend(v18, "dinnerTime");
    v27 = v26;
    objc_msgSend(v18, "mealTimeSampleNoiseStdDev");
    objc_msgSend(v20, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v18, 4, a5, v27, v28);
    v30 = v29 + (double)(uint64_t)a5;
    if (v30 <= a5)
    {
      v42 = -[HDDemoDataAlcoholSampleGenerator _computeNumDrinksTodayForDemoPerson:atTime:statisticsSampleGenerator:]((uint64_t)self, v18, v21, a5);
      v43 = v42;
      if (v30 > a4)
      {
        objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", qword_1ED552330, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED552338, v44, v19, v19);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObjectFromPhone:", v45);

        v25 = (uint64_t)a5;
      }
      v38 = self;
      v39 = v18;
      v40 = a5;
      v41 = v43;
      v37 = v30;
    }
    else
    {
      v31 = -[HDDemoDataAlcoholSampleGenerator _computeNumDrinksTodayForDemoPerson:atTime:statisticsSampleGenerator:]((uint64_t)self, v18, v21, a5 + -1.0);
      if (v31 <= 0.0)
        goto LABEL_15;
      v32 = v31;
      objc_msgSend(v18, "dinnerTime");
      v34 = v33;
      objc_msgSend(v18, "mealTimeSampleNoiseStdDev");
      objc_msgSend(v20, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v18, 4, a5 + -1.0, v34, v35);
      v37 = v36 + (double)(v25 - 1);
      v38 = self;
      v39 = v18;
      v40 = a5;
      v41 = v32;
    }
    v46 = -[HDDemoDataAlcoholSampleGenerator bloodAlcoholContentForDemoPerson:atTime:numberOfDrinks:drinkTime:bodySampleGenerator:]((uint64_t)v38, v39, v22, v40, v41, v37);
    -[HDDemoDataAlcoholSampleGenerator _saveBAC:toObjectCollection:sampleDate:]((uint64_t)self, v23, v19, v46);
    if (v46 > 0.03)
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "statisticsSampleGenerator");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "genericSampleTimeNoiseStdDev");
      objc_msgSend(v48, "computeNoiseFromTime:stdDev:", a5, v49);
      v51 = v50 + 0.03125;

      v52 = v51 + a5;
LABEL_16:
      self->_nextCheckInTime = v52;
      v24 = 1;
      goto LABEL_17;
    }
LABEL_15:
    objc_msgSend(v18, "dinnerTime");
    v54 = v53;
    objc_msgSend(v18, "mealTimeSampleNoiseStdDev");
    objc_msgSend(v20, "_computeMealTimeForDemoPerson:fromTime:mealTimeType:timeMean:stdDev:", v18, 4, (double)(v25 + 1), v54, v55);
    v52 = v56 + (double)(v25 + 1);
    goto LABEL_16;
  }
  v24 = 0;
LABEL_17:

  return v24;
}

void __176__HDDemoDataAlcoholSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_foodSampleGenerator_statisticsSampleGenerator_bodySampleGenerator_objectCollection___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_209;
  _MergedGlobals_209 = v0;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED552330;
  qword_1ED552330 = v2;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A90]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED552328;
  qword_1ED552328 = v4;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CE0]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED552338;
  qword_1ED552338 = v6;

}

- (double)_computeNumDrinksTodayForDemoPerson:(void *)a3 atTime:(double)a4 statisticsSampleGenerator:
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  v10 = 0.0;
  if (a1)
  {
    v11 = (double)(uint64_t)a4;
    objc_msgSend(v8, "pseudoRandomDoubleFromTime:", v11 + 0.1);
    if (v12 < 0.33)
    {
      objc_msgSend(v9, "pseudoRandomDoubleFromTime:", v11);
      v10 = floor(v13 * 3.0) + 1.0;
    }
  }

  return v10;
}

- (double)bloodAlcoholContentForDemoPerson:(void *)a3 atTime:(double)a4 numberOfDrinks:(double)a5 drinkTime:(double)a6 bodySampleGenerator:
{
  double v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;

  if (!a1)
    return 0.0;
  v8 = (a4 - a6) * 86400.0;
  v9 = a2;
  objc_msgSend(a3, "lastWeightInKg");
  v11 = v10;
  v12 = objc_msgSend(v9, "biologicalSex");

  +[HDDemoDataFormula computeBloodAlcoholContentForNumDrinks:elapsedTime:weight:sex:](HDDemoDataFormula, "computeBloodAlcoholContentForNumDrinks:elapsedTime:weight:sex:", v12, a5, v8, v11);
  v14 = v13;
  v15 = __exp10(2.0);
  return (double)(uint64_t)(v14 * v15) / v15;
}

- (void)_saveBAC:(void *)a3 toObjectCollection:(double)a4 sampleDate:
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  if (a1)
  {
    if (qword_1ED552358 != -1)
      dispatch_once(&qword_1ED552358, &__block_literal_global_198_0);
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", qword_1ED552348, a4 / 100.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED552350, v8, v7, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectFromPhone:", v9);

  }
}

void __75__HDDemoDataAlcoholSampleGenerator__saveBAC_toObjectCollection_sampleDate___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED552348;
  qword_1ED552348 = v0;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A90]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED552350;
  qword_1ED552350 = v2;

}

- (double)nextCheckInTime
{
  return self->_nextCheckInTime;
}

- (void)setNextCheckInTime:(double)a3
{
  self->_nextCheckInTime = a3;
}

@end
