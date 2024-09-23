@implementation HDDemoDataMindfulnessSampleGenerator

- (HDDemoDataMindfulnessSampleGenerator)init
{
  HDDemoDataMindfulnessSampleGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  result = -[HDDemoDataBaseSampleGenerator init](&v3, sel_init);
  if (result)
  {
    result->_nextMindfulSessionSampleTime = 0.0;
    result->_didGenerateMindfulnessMinute = 0;
  }
  return result;
}

- (HDDemoDataMindfulnessSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataMindfulnessSampleGenerator *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NextMindfulnessMinuteSampleTime"));
    v5->_nextMindfulSessionSampleTime = v6;
    v5->_didGenerateMindfulnessMinute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_DidGenerateMindfulnessMinuteKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double nextMindfulSessionSampleTime;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (self)
    nextMindfulSessionSampleTime = self->_nextMindfulSessionSampleTime;
  else
    nextMindfulSessionSampleTime = 0.0;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextMindfulnessMinuteSampleTime"), nextMindfulSessionSampleTime, v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", -[HDDemoDataMindfulnessSampleGenerator didGenerateMindfulnessMinute](self, "didGenerateMindfulnessMinute"), CFSTR("_DidGenerateMindfulnessMinuteKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v3, sel_setupWithDemoDataGenerator_, a3);
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  double v24;
  double v25;
  long double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint32_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  HDDemoDataMindfulnessSampleGenerator *v87;
  HDDemoDataMindfulnessSampleGenerator *v88;
  objc_super v89;
  _QWORD v90[3];
  _QWORD v91[3];
  uint64_t v92;
  void *v93;
  uint64_t v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v89.receiver = self;
  v89.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  v13 = a6;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v89, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v11, v13, v12, a5, a5);
  v14 = v11;
  v15 = v13;
  if (!self || self->_nextMindfulSessionSampleTime > a5)
    goto LABEL_3;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sleepSampleGenerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "isDemoPersonAwake:atTime:", v14, a5))
    goto LABEL_13;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activitySampleGenerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "_isDemoPersonInWorkoutRecovery:atTime:", v14, a5) & 1) == 0)
  {
    v85 = v14;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "generatorState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = self;
    v23 = objc_msgSend(v22, "isExercising");

    if ((v23 & 1) != 0)
    {
      v16 = 0;
      v14 = v85;
      self = v87;
      goto LABEL_15;
    }
    v14 = v85;
    objc_msgSend(v85, "mindfulSessionFrequency");
    self = v87;
    v87->_nextMindfulSessionSampleTime = v24 + a5;
    objc_msgSend(v85, "mindfulSessionFrequency");
    v26 = exp2(v25 * -2.0) * 100.0;
    if (v26 <= (double)arc4random_uniform(0x64u))
    {
LABEL_3:
      v16 = 0;
      goto LABEL_15;
    }
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](v87, "demoDataGenerator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "statisticsSampleGenerator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "computeNoiseFromTime:stdDev:", a5, (double)objc_msgSend(v85, "mindfulSessionStdDev"));
    v30 = v29;

    v31 = llround(v30 + (double)objc_msgSend(v85, "mindfulSessionMean"));
    objc_msgSend(&unk_1E6DFA6E8, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(&unk_1E6DFA6E8, "count")));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = arc4random_uniform(0x1Eu);
    v33 = *MEMORY[0x1E0CB7268];
    v90[0] = *MEMORY[0x1E0CB72D0];
    v90[1] = v33;
    v91[0] = v17;
    v91[1] = &unk_1E6DFEAB0;
    v90[2] = *MEMORY[0x1E0CB7270];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32 + 60);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31 >= 1)
    {
      objc_msgSend(v15, "dateByAddingTimeInterval:", (double)(60 * v31));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB6378];
      objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4928]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "categorySampleWithType:value:startDate:endDate:metadata:", v20, 0, v15, v19, v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v16 = 0;
LABEL_7:

LABEL_14:
LABEL_15:

  if (v16)
  {
    objc_msgSend(v12, "addObjectFromWatch:", v16);
    v36 = v16;
    v37 = v14;
    if (self)
    {
      v83 = v16;
      v84 = v12;
      v86 = v14;
      v88 = self;
      v39 = v37;
      objc_msgSend(v36, "endDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "startDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "timeIntervalSinceDate:", v41);
      v43 = (uint64_t)(v42 / 60.0);

      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v36;
      objc_msgSend(v36, "startDate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "timeIntervalSinceReferenceDate");
      v48 = v47;

      v49 = *MEMORY[0x1E0CB7298];
      if (v43 >= 1)
      {
        do
        {
          v48 = v48 + 60.0;
          v50 = objc_msgSend(v39, "restingHeartRate");
          v51 = (double)(v50 + arc4random_uniform(3u) + 2);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)MEMORY[0x1E0CB6A28];
          objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "quantityWithUnit:doubleValue:", v54, v51);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = (void *)MEMORY[0x1E0CB6A40];
          v90[0] = v49;
          v91[0] = &unk_1E6DFEAC8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v44, v55, v52, v52, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "addObject:", v58);
          --v43;
        }
        while (v43);
      }
      v59 = objc_msgSend(v39, "restingHeartRate");
      v60 = (double)(v59 + arc4random_uniform(3u) + 2);
      objc_msgSend(v82, "startDate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "dateByAddingTimeInterval:", -180.0);
      v62 = v39;
      v81 = v39;
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "quantityWithUnit:doubleValue:", v65, v60);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = (void *)MEMORY[0x1E0CB6A40];
      v68 = v49;
      v94 = v49;
      v95[0] = &unk_1E6DFEA80;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v44, v66, v63, v63, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v45;
      objc_msgSend(v45, "addObject:", v70);
      v71 = objc_msgSend(v62, "restingHeartRate");
      v72 = (double)(v71 + arc4random_uniform(3u) + 2);
      objc_msgSend(v82, "startDate");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "dateByAddingTimeInterval:", 120.0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      v75 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "quantityWithUnit:doubleValue:", v76, v72);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      v78 = (void *)MEMORY[0x1E0CB6A40];
      v92 = v68;
      v93 = &unk_1E6DFEA80;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v44, v77, v74, v74, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "addObject:", v80);
      v36 = v82;

      v12 = v84;
      v14 = v86;
      self = v88;
      v16 = v83;
      v37 = v81;
    }
    else
    {
      v38 = 0;
    }

    objc_msgSend(v12, "addObjectsFromWatch:", v38);
    if (self)
      self->_didGenerateMindfulnessMinute = 1;

  }
  else if (self)
  {
    self->_didGenerateMindfulnessMinute = 0;
  }

}

- (BOOL)didGenerateMindfulnessMinute
{
  return self->_didGenerateMindfulnessMinute;
}

@end
