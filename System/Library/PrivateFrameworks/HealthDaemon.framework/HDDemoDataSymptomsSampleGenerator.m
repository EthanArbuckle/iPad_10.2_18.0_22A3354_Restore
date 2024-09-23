@implementation HDDemoDataSymptomsSampleGenerator

- (HDDemoDataSymptomsSampleGenerator)init
{
  HDDemoDataSymptomsSampleGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  result = -[HDDemoDataBaseSampleGenerator init](&v3, sel_init);
  if (result)
  {
    result->_nextCommonColdSymptomsTime = 0.0;
    result->_nextFoodPoisoningSymptomsTime = 0.0;
    result->_nextSingleRandomSymptomTime = 0.0;
  }
  return result;
}

- (HDDemoDataSymptomsSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataSymptomsSampleGenerator *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NextCommonColdSymptomsTimeKey"));
    v5->_nextCommonColdSymptomsTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NextFoodPoisoningSymptomsTimeKey"));
    v5->_nextFoodPoisoningSymptomsTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NextSingleRandomSymptomTimeKey"));
    v5->_nextSingleRandomSymptomTime = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double nextSingleRandomSymptomTime;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (self)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextCommonColdSymptomsTimeKey"), self->_nextCommonColdSymptomsTime, v6.receiver, v6.super_class);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextFoodPoisoningSymptomsTimeKey"), self->_nextFoodPoisoningSymptomsTime);
    nextSingleRandomSymptomTime = self->_nextSingleRandomSymptomTime;
  }
  else
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextCommonColdSymptomsTimeKey"), 0.0, v6.receiver, v6.super_class);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextFoodPoisoningSymptomsTimeKey"), 0.0);
    nextSingleRandomSymptomTime = 0.0;
  }
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextSingleRandomSymptomTimeKey"), nextSingleRandomSymptomTime);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v3, sel_setupWithDemoDataGenerator_, a3);
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  objc_super v39;
  _QWORD v40[3];
  _QWORD v41[4];
  _QWORD v42[6];

  v42[5] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v39, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v13, v12, v11, a5, a5);
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = 0x1E0C99000;
  if (self)
  {
    if (self->_nextSingleRandomSymptomTime <= a5)
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sleepSampleGenerator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isDemoPersonSleeping:atTime:", v14, a5);

      if ((v20 & 1) == 0)
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "statisticsSampleGenerator");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "computeNoiseFromTime:stdDev:", a5, 3.0);
        v24 = v23 + 10.0;

        self->_nextSingleRandomSymptomTime = v24 + self->_nextSingleRandomSymptomTime;
        v38 = arc4random_uniform(3u) + 2;
        objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4878]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v25;
        objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48B0]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v42[1] = v26;
        objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4918]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v42[2] = v27;
        objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4938]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v42[3] = v28;
        objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB49A8]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v42[4] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0x1E0C99000uLL;
        objc_msgSend(v30, "objectAtIndex:", arc4random_uniform(objc_msgSend(v30, "count")));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", v31, v38, v15, v15);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectFromPhone:", v32);

      }
    }
  }

  v33 = *MEMORY[0x1E0CB4990];
  v41[0] = *MEMORY[0x1E0CB48A0];
  v41[1] = v33;
  v34 = *MEMORY[0x1E0CB4978];
  v41[2] = *MEMORY[0x1E0CB4968];
  v41[3] = v34;
  objc_msgSend(*(id *)(v17 + 3360), "arrayWithObjects:count:", v41, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataSymptomsSampleGenerator generateSymptomSamplesForDemoPerson:atTime:sampleDate:nextTime:condition:sampleTypes:frequency:objectCollection:]((double *)self, v14, v15, 0, v35, v16, a5, self->_nextCommonColdSymptomsTime, 60.0);
  v36 = *MEMORY[0x1E0CB4930];
  v40[0] = *MEMORY[0x1E0CB49A0];
  v40[1] = v36;
  v40[2] = *MEMORY[0x1E0CB48A8];
  objc_msgSend(*(id *)(v17 + 3360), "arrayWithObjects:count:", v40, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataSymptomsSampleGenerator generateSymptomSamplesForDemoPerson:atTime:sampleDate:nextTime:condition:sampleTypes:frequency:objectCollection:]((double *)self, v14, v15, 1, v37, v16, a5, self->_nextFoodPoisoningSymptomsTime, 90.0);

}

- (void)generateSymptomSamplesForDemoPerson:(void *)a3 atTime:(uint64_t)a4 sampleDate:(void *)a5 nextTime:(void *)a6 condition:(double)a7 sampleTypes:(double)a8 frequency:(double)a9 objectCollection:
{
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint32_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;

  v28 = a2;
  v17 = a3;
  v18 = a5;
  v19 = a6;
  if (a1)
  {
    if (a7 >= a8)
    {
      objc_msgSend(a1, "demoDataGenerator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sleepSampleGenerator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isDemoPersonSleeping:atTime:", v28, a7);

      if ((v22 & 1) == 0)
      {
        objc_msgSend(a1, "demoDataGenerator");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "statisticsSampleGenerator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "computeNoiseFromTime:stdDev:", a7, 15.0);
        v26 = v25 + a9;

        if (a4 != 1)
        {
          if (a4)
          {
LABEL_8:
            v27 = arc4random_uniform(3u);
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __149__HDDemoDataSymptomsSampleGenerator_generateSymptomSamplesForDemoPerson_atTime_sampleDate_nextTime_condition_sampleTypes_frequency_objectCollection___block_invoke;
            v29[3] = &unk_1E6D04198;
            v32 = v27 + 2;
            v30 = v17;
            v31 = v19;
            objc_msgSend(v18, "enumerateObjectsUsingBlock:", v29);

            goto LABEL_9;
          }
          a1[4] = v26 + a1[4];
        }
        a1[5] = v26 + a1[5];
        goto LABEL_8;
      }
    }
  }
LABEL_9:

}

void __149__HDDemoDataSymptomsSampleGenerator_generateSymptomSamplesForDemoPerson_atTime_sampleDate_nextTime_condition_sampleTypes_frequency_objectCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectFromPhone:", v3);

}

@end
