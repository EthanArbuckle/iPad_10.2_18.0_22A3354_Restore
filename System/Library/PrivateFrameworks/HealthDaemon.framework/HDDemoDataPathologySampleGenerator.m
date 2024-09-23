@implementation HDDemoDataPathologySampleGenerator

- (HDDemoDataPathologySampleGenerator)init
{
  HDDemoDataPathologySampleGenerator *v2;
  HDDemoDataPathologySampleGenerator *v3;
  NSMutableDictionary *nextSpirometrySampleTimes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataPathologySampleGenerator;
  v2 = -[HDDemoDataBaseSampleGenerator init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    nextSpirometrySampleTimes = v2->_nextSpirometrySampleTimes;
    v2->_nextSpirometrySampleTimes = 0;

    v3->_nextAsthmaAttackSampleTime = 0.0;
    v3->_nextAsthmaAttackEndTime = 0.0;
    v3->_forcePEFR = 0;
  }
  return v3;
}

- (HDDemoDataPathologySampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataPathologySampleGenerator *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *nextSpirometrySampleTimes;
  double v12;
  double v13;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDDemoDataPathologySampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HDDemoDataPathologySampleHelperNextSpirometrySampleTimesKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    nextSpirometrySampleTimes = v5->_nextSpirometrySampleTimes;
    v5->_nextSpirometrySampleTimes = (NSMutableDictionary *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataPathologySampleHelperNextAsthmaAttackSampleTimeKey"));
    v5->_nextAsthmaAttackSampleTime = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataPathologySampleHelperNextAsthmaAttackEndTimeKey"));
    v5->_nextAsthmaAttackEndTime = v13;
    v5->_forcePEFR = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HDDemoDataPathologySampleHelperForcePEFRKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataPathologySampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_nextSpirometrySampleTimes, CFSTR("HDDemoDataPathologySampleHelperNextSpirometrySampleTimesKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataPathologySampleHelperNextAsthmaAttackSampleTimeKey"), self->_nextAsthmaAttackSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataPathologySampleHelperNextAsthmaAttackEndTimeKey"), self->_nextAsthmaAttackEndTime);
  objc_msgSend(v4, "encodeBool:forKey:", self->_forcePEFR, CFSTR("HDDemoDataPathologySampleHelperForcePEFRKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *nextSpirometrySampleTimes;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDDemoDataPathologySampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v14, sel_setupWithDemoDataGenerator_, v4);
  if (!-[HDDemoDataBaseSampleGenerator createdFromNSKeyedUnarchiver](self, "createdFromNSKeyedUnarchiver"))
  {
    v15[0] = &unk_1E6DFE870;
    v15[1] = &unk_1E6DFE8A0;
    v16[0] = &unk_1E6DFE888;
    v16[1] = &unk_1E6DFE888;
    v15[2] = &unk_1E6DFE8B8;
    v16[2] = &unk_1E6DFE888;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");
    nextSpirometrySampleTimes = self->_nextSpirometrySampleTimes;
    self->_nextSpirometrySampleTimes = v6;

    objc_msgSend(v4, "demoPerson");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lunchTime");
    self->_nextAsthmaAttackSampleTime = v9;

    v10 = self->_nextAsthmaAttackSampleTime + 0.107638889;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statisticsSampleGenerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "computeNoiseFromTime:stdDev:", 0.0, 0.0243055556);
    self->_nextAsthmaAttackEndTime = v10 + v13;

    self->_forcePEFR = 0;
  }

}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
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
  void *v50;
  void *v51;
  void *v52;
  double v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  objc_super v62;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v62.receiver = self;
  v62.super_class = (Class)HDDemoDataPathologySampleGenerator;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v62, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v11, v12, v13, a5, a5);
  if (objc_msgSend(v11, "resultsTrackingType") == 2)
  {
    if (qword_1EF199E00 != -1)
      dispatch_once(&qword_1EF199E00, &__block_literal_global_236);
    -[HDDemoDataPathologySampleGenerator spirometryForDemoPerson:atTime:type:]((uint64_t)self, v11, 0, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = (void *)MEMORY[0x1E0CB6A28];
      v17 = qword_1EF199DD0;
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199DE0, v18, v12, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectFromPhone:", v19);

    }
    -[HDDemoDataPathologySampleGenerator spirometryForDemoPerson:atTime:type:]((uint64_t)self, v11, 1, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = (void *)MEMORY[0x1E0CB6A28];
      v23 = qword_1EF199DD0;
      objc_msgSend(v20, "doubleValue");
      objc_msgSend(v22, "quantityWithUnit:doubleValue:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199DE8, v24, v12, v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectFromPhone:", v25);

    }
    -[HDDemoDataPathologySampleGenerator spirometryForDemoPerson:atTime:type:]((uint64_t)self, v11, 2, a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = (void *)MEMORY[0x1E0CB6A28];
      v29 = qword_1EF199DD8;
      objc_msgSend(v26, "doubleValue");
      objc_msgSend(v28, "quantityWithUnit:doubleValue:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199DF0, v30, v12, v12);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectFromPhone:", v31);

    }
    v32 = v11;
    v33 = v32;
    if (!self || objc_msgSend(v32, "asthmaSeverity") < 1 || self->_nextAsthmaAttackSampleTime >= a5)
      goto LABEL_16;
    objc_msgSend(v33, "timeIncrement");
    if (a5 - v34 <= self->_nextAsthmaAttackSampleTime)
      self->_forcePEFR = 1;
    if (self->_nextAsthmaAttackEndTime > a5)
    {
LABEL_16:

      v35 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v61 = v15;
    switch(objc_msgSend(v33, "asthmaSeverity"))
    {
      case 2:
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "statisticsSampleGenerator");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "computeNoiseFromTime:stdDev:", a5, 0.7);
        v39 = v38 + 4.66666667;
        v40 = 0.1;
        goto LABEL_25;
      case 3:
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "statisticsSampleGenerator");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "computeNoiseFromTime:stdDev:", a5, 0.7);
        v39 = v41 + 2.33333333;
        v40 = 0.2;
        goto LABEL_25;
      case 4:
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "statisticsSampleGenerator");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "computeNoiseFromTime:stdDev:", a5, 0.3);
        v39 = v42 + 1.2;
        v40 = 0.35;
        goto LABEL_25;
      case 5:
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "statisticsSampleGenerator");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "computeNoiseFromTime:stdDev:", a5, 0.3);
        v39 = v43 + 0.0520833333;
        v40 = 0.5;
LABEL_25:

        break;
      default:
        v40 = 0.0;
        v39 = 0.0;
        break;
    }
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "statisticsSampleGenerator");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "computeNoiseFromTime:stdDev:", a5, 0.03125);
    self->_nextAsthmaAttackEndTime = fabs(v46) + a5;

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "statisticsSampleGenerator");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "pseudoRandomDoubleFromTime:", a5);
    if (v49 >= v40)
    {

    }
    else
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "sleepSampleGenerator");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v50, "isDemoPersonSleeping:atTime:", v33, self->_nextAsthmaAttackEndTime);

      if ((v59 & 1) == 0)
      {
        self->_forcePEFR = 1;
LABEL_33:

        v35 = &unk_1E6DFE8D0;
        v54 = &unk_1E6DFE8D0;
        v55 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "quantityWithUnit:doubleValue:", v56, (double)(int)objc_msgSend(&unk_1E6DFE8D0, "intValue"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199DF8, v57, v12, v12);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectFromPhone:", v58);

        v15 = v61;
        goto LABEL_17;
      }
    }
    self->_forcePEFR = 1;
    self->_nextAsthmaAttackSampleTime = v39 + a5;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "statisticsSampleGenerator");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "computeNoiseFromTime:stdDev:", a5, 0.0243055556);
    self->_nextAsthmaAttackEndTime = v39 + a5 + 0.107638889 + v53;

    for (;
          (-[HDDemoDataPathologySampleGenerator _isAsthmaAttackAllowedForDemoPerson:atTime:](self, v33, self->_nextAsthmaAttackSampleTime) & 1) == 0;
          self->_nextAsthmaAttackEndTime = self->_nextAsthmaAttackEndTime + 0.0104166667)
    {
      if (!-[HDDemoDataPathologySampleGenerator _isAsthmaAttackAllowedForDemoPerson:atTime:](self, v33, self->_nextAsthmaAttackEndTime))break;
      self->_nextAsthmaAttackSampleTime = self->_nextAsthmaAttackSampleTime + 0.0104166667;
    }
    goto LABEL_33;
  }
LABEL_18:

}

void __112__HDDemoDataPathologySampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
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

  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_22;
  _MergedGlobals_22 = v0;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "literUnit");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1EF199DD0;
  qword_1EF199DD0 = v2;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("L/min"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1EF199DD8;
  qword_1EF199DD8 = v4;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C98]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1EF199DE0;
  qword_1EF199DE0 = v6;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CA0]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1EF199DE8;
  qword_1EF199DE8 = v8;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D00]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1EF199DF0;
  qword_1EF199DF0 = v10;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CC8]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1EF199DF8;
  qword_1EF199DF8 = v12;

}

- (id)spirometryForDemoPerson:(uint64_t)a3 atTime:(double)a4 type:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;

  v7 = a2;
  if (a1)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    if (v12 >= a4)
    {
      if (a3 != 2 || !*(_BYTE *)(a1 + 32))
      {
        a1 = 0;
        goto LABEL_17;
      }
    }
    else if (a3 != 2 || !*(_BYTE *)(a1 + 32))
    {
      objc_msgSend(v7, "spirometrySampleTime");
      v14 = v13 + a4;
      objc_msgSend((id)a1, "demoDataGenerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "statisticsSampleGenerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "genericSampleTimeNoiseStdDev");
      objc_msgSend(v16, "computeNoiseFromTime:stdDev:", a4, v17);
      v19 = v14 + v18;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

    }
    objc_msgSend((id)a1, "demoDataGenerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bodySampleGenerator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastHeightInCm");
    -[HDDemoDataPathologySampleGenerator _computeSpirometryForDemoPerson:atTime:type:computeLowerLimitOfNormality:height:]((void *)a1, v7, a4);
    v26 = v25;

    objc_msgSend((id)a1, "demoDataGenerator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bodySampleGenerator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastHeightInCm");
    -[HDDemoDataPathologySampleGenerator _computeSpirometryForDemoPerson:atTime:type:computeLowerLimitOfNormality:height:]((void *)a1, v7, a4);
    v30 = v29;

    v31 = (v26 - v30) / 2.3;
    objc_msgSend((id)a1, "demoDataGenerator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "statisticsSampleGenerator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "computeNoiseFromTime:stdDev:", 0.0, v31);
    v35 = v26 - fabs(v34);

    objc_msgSend((id)a1, "demoDataGenerator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "statisticsSampleGenerator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "computeNoiseFromTime:stdDev:", a4, v31 * 0.2);
    v39 = v38;

    v40 = v35 + v39;
    if (a3 == 2)
    {
      if (objc_msgSend(v7, "asthmaSeverity") >= 2 && *(double *)(a1 + 48) <= a4 && *(double *)(a1 + 56) >= a4)
      {
        objc_msgSend((id)a1, "demoDataGenerator");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "statisticsSampleGenerator");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "pseudoRandomDoubleFromTime:", a4);
        v40 = v40 * (v43 * 0.25 + 0.55);

      }
      if (*(_BYTE *)(a1 + 32))
        *(_BYTE *)(a1 + 32) = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
    a1 = objc_claimAutoreleasedReturnValue();
  }
LABEL_17:

  return (id)a1;
}

- (void)_computeSpirometryForDemoPerson:(double)a3 atTime:type:computeLowerLimitOfNormality:height:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  objc_msgSend(a1, "demoDataGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDateFromCurrentTime:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "birthDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDDemoData_ageBetweenNSDateComponentsAndDate(v8, v7);

  objc_msgSend(v5, "biologicalSex");
}

- (uint64_t)_isAsthmaAttackAllowedForDemoPerson:(double)a3 atTime:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;

  v5 = a2;
  objc_msgSend(a1, "demoDataGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generatorState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isExercising") & 1) == 0)
  {
    objc_msgSend(a1, "demoDataGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activitySampleGenerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "_isDemoPersonCoolingDown:atTime:", v5, a3) & 1) == 0)
    {
      objc_msgSend(a1, "demoDataGenerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sleepSampleGenerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isDemoPersonSleeping:atTime:", v5, a3);

      v10 = v13 ^ 1u;
      goto LABEL_6;
    }

  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextSpirometrySampleTimes, 0);
}

@end
