@implementation HKMCDaySummary

+ (id)daySummaryWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 bleedingInPregnancyFlow:(int64_t)a5 bleedingAfterPregnancyFlow:(int64_t)a6 intermenstrualBleeding:(BOOL)a7 symptoms:(unint64_t)a8 sexualActivity:(int64_t)a9 ovulationTestResult:(int64_t)a10 pregnancyTestResult:(int64_t)a11 progesteroneTestResult:(int64_t)a12 cervicalMucusQuality:(int64_t)a13 basalBodyTemperature:(id)a14
{
  _BOOL8 v15;
  id v21;
  void *v22;

  v15 = a7;
  v21 = a14;
  v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, a4, a5, a6, v15, a8, a9, a10, a11, a12, a13, v21, 0, 0,
                  0,
                  0,
                  0,
                  0);

  return v22;
}

+ (id)daySummaryWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 bleedingInPregnancyFlow:(int64_t)a5 bleedingAfterPregnancyFlow:(int64_t)a6 intermenstrualBleeding:(BOOL)a7 symptoms:(unint64_t)a8 sexualActivity:(int64_t)a9 ovulationTestResult:(int64_t)a10 pregnancyTestResult:(int64_t)a11 progesteroneTestResult:(int64_t)a12 cervicalMucusQuality:(int64_t)a13 basalBodyTemperature:(id)a14 wristTemperature:(id)a15 menstrualFlowModificationDayIndex:(int64_t)a16 startOfCycleFromCycleTracking:(id)a17 startedCycleFactors:(id)a18 endedCycleFactors:(id)a19 sampleCountByType:(id)a20
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _BOOL4 v33;

  v33 = a7;
  v22 = a20;
  v23 = a19;
  v24 = a18;
  v25 = a17;
  v26 = a15;
  v27 = a14;
  v28 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, a4, a5, a6, v33, a8, a9, a10, a11, a12, a13, v27, v26, a16,
                  v25,
                  v24,
                  v23,
                  v22);

  return v28;
}

+ (id)emptyDaySummaryWithDayIndex:(int64_t)a3
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                           0,
                                           0,
                                           0,
                                           0,
                                           0));
}

- (id)_initWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 bleedingInPregnancyFlow:(int64_t)a5 bleedingAfterPregnancyFlow:(int64_t)a6 intermenstrualBleeding:(BOOL)a7 symptoms:(unint64_t)a8 sexualActivity:(int64_t)a9 ovulationTestResult:(int64_t)a10 pregnancyTestResult:(int64_t)a11 progesteroneTestResult:(int64_t)a12 cervicalMucusQuality:(int64_t)a13 basalBodyTemperature:(id)a14 wristTemperature:(id)a15 menstrualFlowModificationDayIndex:(int64_t)a16 startOfCycleFromCycleTracking:(id)a17 startedCycleFactors:(id)a18 endedCycleFactors:(id)a19 sampleCountByType:(id)a20
{
  id v25;
  id v26;
  id v27;
  id v28;
  HKMCDaySummary *v29;
  HKMCDaySummary *v30;
  uint64_t v31;
  HKQuantity *basalBodyTemperature;
  uint64_t v33;
  HKMCWristTemperature *wristTemperature;
  uint64_t v35;
  NSArray *startedCycleFactors;
  uint64_t v37;
  NSArray *endedCycleFactors;
  uint64_t v39;
  NSDictionary *sampleCountByType;
  id v44;
  id v45;
  objc_super v46;

  v45 = a14;
  v44 = a15;
  v25 = a17;
  v26 = a18;
  v27 = a19;
  v28 = a20;
  v46.receiver = self;
  v46.super_class = (Class)HKMCDaySummary;
  v29 = -[HKMCDaySummary init](&v46, sel_init);
  v30 = v29;
  if (v29)
  {
    v29->_dayIndex = a3;
    v29->_menstrualFlow = a4;
    v29->_bleedingInPregnancyFlow = a5;
    v29->_bleedingAfterPregnancyFlow = a6;
    v29->_intermenstrualBleeding = a7;
    v29->_symptoms = a8;
    v29->_sexualActivity = a9;
    v29->_ovulationTestResult = a10;
    v29->_pregnancyTestResult = a11;
    v29->_progesteroneTestResult = a12;
    v29->_cervicalMucusQuality = a13;
    v31 = objc_msgSend(v45, "copy");
    basalBodyTemperature = v30->_basalBodyTemperature;
    v30->_basalBodyTemperature = (HKQuantity *)v31;

    v33 = objc_msgSend(v44, "copy");
    wristTemperature = v30->_wristTemperature;
    v30->_wristTemperature = (HKMCWristTemperature *)v33;

    v30->_menstrualFlowModificationDayIndex = a16;
    objc_storeStrong((id *)&v30->_startOfCycleFromCycleTracking, a17);
    v35 = objc_msgSend(v26, "copy");
    startedCycleFactors = v30->_startedCycleFactors;
    v30->_startedCycleFactors = (NSArray *)v35;

    v37 = objc_msgSend(v27, "copy");
    endedCycleFactors = v30->_endedCycleFactors;
    v30->_endedCycleFactors = (NSArray *)v37;

    v39 = objc_msgSend(v28, "copy");
    sampleCountByType = v30->_sampleCountByType;
    v30->_sampleCountByType = (NSDictionary *)v39;

  }
  return v30;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *startOfCycleFromCycleTracking;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v16 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_dayIndex);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_menstrualFlow);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  startOfCycleFromCycleTracking = self->_startOfCycleFromCycleTracking;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_bleedingInPregnancyFlow);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_bleedingAfterPregnancyFlow);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_intermenstrualBleeding);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_symptoms);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sexualActivity);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_ovulationTestResult);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_pregnancyTestResult);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_progesteroneTestResult);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_cervicalMucusQuality);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@:%p %@, menstrual flow = %@ (SOC: %@), BIP flow = %@, BAP flow = %@, spotting = %@, symptoms = %@, sex = %@, OPK = %@, PTR = %@, PDG = %@, CMQ = %@, BBT = %@, WT = %@>"), v15, self, v19, v18, startOfCycleFromCycleTracking, v17, v4, v5, v6, v7, v8, v9, v10, v11, self->_basalBodyTemperature, self->_wristTemperature);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)hk_redactedDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_dayIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t dayIndex;
  id v5;

  dayIndex = self->_dayIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", dayIndex, CFSTR("DayIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_menstrualFlow, CFSTR("MenstrualFlow"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bleedingInPregnancyFlow, CFSTR("BleedingInPregnancyFlow"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bleedingAfterPregnancyFlow, CFSTR("BleedingAfterPregnancyFlow"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_intermenstrualBleeding, CFSTR("IntermenstrualBleeding"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_symptoms, CFSTR("Symptoms"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sexualActivity, CFSTR("SexualActivity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ovulationTestResult, CFSTR("OvulationTestResult"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pregnancyTestResult, CFSTR("PregnancyTestResult"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_progesteroneTestResult, CFSTR("ProgesteroneTestResult"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cervicalMucusQuality, CFSTR("CervicalMucusQuality"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_basalBodyTemperature, CFSTR("BasalBodyTemperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wristTemperature, CFSTR("WristTemperature"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_menstrualFlowModificationDayIndex, CFSTR("MenstrualFlowModificationDayIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startOfCycleFromCycleTracking, CFSTR("StartOfCycleFromCycleTracking"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startedCycleFactors, CFSTR("StartedCycleFactors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endedCycleFactors, CFSTR("EndedCycleFactors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sampleCountByType, CFSTR("SampleCountByType"));

}

- (HKMCDaySummary)initWithCoder:(id)a3
{
  id v4;
  HKMCDaySummary *v5;
  uint64_t v6;
  HKQuantity *basalBodyTemperature;
  uint64_t v8;
  HKMCWristTemperature *wristTemperature;
  uint64_t v10;
  NSNumber *startOfCycleFromCycleTracking;
  void *v12;
  uint64_t v13;
  NSArray *startedCycleFactors;
  void *v15;
  uint64_t v16;
  NSArray *endedCycleFactors;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSDictionary *sampleCountByType;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKMCDaySummary;
  v5 = -[HKMCDaySummary init](&v24, sel_init);
  if (v5)
  {
    v5->_dayIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndex"));
    v5->_menstrualFlow = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MenstrualFlow"));
    v5->_bleedingInPregnancyFlow = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BleedingInPregnancyFlow"));
    v5->_bleedingAfterPregnancyFlow = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BleedingAfterPregnancyFlow"));
    v5->_intermenstrualBleeding = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IntermenstrualBleeding"));
    v5->_symptoms = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Symptoms"));
    v5->_sexualActivity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SexualActivity"));
    v5->_ovulationTestResult = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OvulationTestResult"));
    v5->_pregnancyTestResult = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PregnancyTestResult"));
    v5->_progesteroneTestResult = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProgesteroneTestResult"));
    v5->_cervicalMucusQuality = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CervicalMucusQuality"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BasalBodyTemperature"));
    v6 = objc_claimAutoreleasedReturnValue();
    basalBodyTemperature = v5->_basalBodyTemperature;
    v5->_basalBodyTemperature = (HKQuantity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WristTemperature"));
    v8 = objc_claimAutoreleasedReturnValue();
    wristTemperature = v5->_wristTemperature;
    v5->_wristTemperature = (HKMCWristTemperature *)v8;

    v5->_menstrualFlowModificationDayIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MenstrualFlowModificationDayIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartOfCycleFromCycleTracking"));
    v10 = objc_claimAutoreleasedReturnValue();
    startOfCycleFromCycleTracking = v5->_startOfCycleFromCycleTracking;
    v5->_startOfCycleFromCycleTracking = (NSNumber *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("StartedCycleFactors"));
    v13 = objc_claimAutoreleasedReturnValue();
    startedCycleFactors = v5->_startedCycleFactors;
    v5->_startedCycleFactors = (NSArray *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("EndedCycleFactors"));
    v16 = objc_claimAutoreleasedReturnValue();
    endedCycleFactors = v5->_endedCycleFactors;
    v5->_endedCycleFactors = (NSArray *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    objc_msgSend(v18, "hk_typesForDictionaryMapping:to:", v19, objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("SampleCountByType"));
    v21 = objc_claimAutoreleasedReturnValue();
    sampleCountByType = v5->_sampleCountByType;
    v5->_sampleCountByType = (NSDictionary *)v21;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v9 = a3;
  if (-[HKMCDaySummary isUserEnteredDataEqual:](self, "isUserEnteredDataEqual:", v9))
  {
    -[HKMCDaySummary wristTemperature](self, "wristTemperature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wristTemperature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      objc_msgSend(v9, "wristTemperature");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v13 = 0;
        goto LABEL_26;
      }
      v3 = (void *)v12;
      -[HKMCDaySummary wristTemperature](self, "wristTemperature");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "wristTemperature");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isEqual:", v4))
      {
        v13 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    v14 = -[HKMCDaySummary menstrualFlowModificationDayIndex](self, "menstrualFlowModificationDayIndex");
    if (v14 == objc_msgSend(v9, "menstrualFlowModificationDayIndex"))
    {
      -[HKMCDaySummary startOfCycleFromCycleTracking](self, "startOfCycleFromCycleTracking");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startOfCycleFromCycleTracking");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v57)
      {
        v54 = v4;
LABEL_14:
        -[HKMCDaySummary startedCycleFactors](self, "startedCycleFactors");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startedCycleFactors");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)v17;
        if ((void *)v17 != v55)
        {
          objc_msgSend(v9, "startedCycleFactors");
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            v52 = v7;
            v13 = 0;
            v25 = v51;
            v26 = v57;
            goto LABEL_55;
          }
          v48 = (void *)v18;
          -[HKMCDaySummary startedCycleFactors](self, "startedCycleFactors");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "startedCycleFactors");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v6, "isEqual:", v19) & 1) == 0)
          {

            if (v15 == v57)
            {

            }
            else
            {

            }
            v13 = 0;
LABEL_60:
            v4 = v54;
            if (v10 == v11)
              goto LABEL_26;
            goto LABEL_25;
          }
          v44 = v19;
        }
        -[HKMCDaySummary endedCycleFactors](self, "endedCycleFactors");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endedCycleFactors");
        v49 = (void *)v20;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v7;
        v47 = v6;
        if ((void *)v20 == v50)
        {
          v45 = v15;
          v46 = v5;
        }
        else
        {
          objc_msgSend(v9, "endedCycleFactors");
          v21 = objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            v34 = (void *)v20;
            v13 = 0;
            goto LABEL_42;
          }
          v43 = (void *)v21;
          -[HKMCDaySummary endedCycleFactors](self, "endedCycleFactors");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "endedCycleFactors");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "isEqual:", v23) & 1) == 0)
          {

            v13 = 0;
            v35 = v55;
            v36 = v56;
            v37 = v56 == v55;
LABEL_53:
            v25 = v51;
            v26 = v57;
            if (v37)
            {

              goto LABEL_56;
            }

LABEL_55:
LABEL_56:
            if (v15 != v26)
            {

            }
LABEL_59:

            goto LABEL_60;
          }
          v41 = v23;
          v42 = v22;
          v45 = v15;
          v46 = v5;
        }
        -[HKMCDaySummary sampleCountByType](self, "sampleCountByType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sampleCountByType");
        v28 = objc_claimAutoreleasedReturnValue();
        v13 = v27 == (void *)v28;
        if (v27 == (void *)v28)
        {

        }
        else
        {
          v29 = (void *)v28;
          objc_msgSend(v9, "sampleCountByType");
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = (void *)v30;
            -[HKMCDaySummary sampleCountByType](self, "sampleCountByType");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "sampleCountByType");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v32, "isEqual:", v33);

            if (v49 == v50)
            {

            }
            else
            {

            }
            v35 = v55;
            v36 = v56;
            v37 = v56 == v55;
            v15 = v45;
            v5 = v46;
            goto LABEL_53;
          }

        }
        v34 = v49;
        if (v49 == v50)
        {

          v40 = v55;
          v15 = v45;
          v5 = v46;
          v38 = v51;
          v39 = v57;
          if (v56 == v55)
            goto LABEL_44;
          goto LABEL_43;
        }

        v15 = v45;
        v5 = v46;
LABEL_42:
        v38 = v51;
        v39 = v57;

        v40 = v55;
        if (v56 == v55)
        {
LABEL_44:

          if (v15 != v39)
          {

          }
          goto LABEL_59;
        }
LABEL_43:

        goto LABEL_44;
      }
      objc_msgSend(v9, "startOfCycleFromCycleTracking");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v53 = (void *)v16;
        -[HKMCDaySummary startOfCycleFromCycleTracking](self, "startOfCycleFromCycleTracking");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startOfCycleFromCycleTracking");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqual:", v6) & 1) != 0)
        {
          v54 = v4;
          v51 = v6;
          goto LABEL_14;
        }

      }
    }
    v13 = 0;
    if (v10 != v11)
      goto LABEL_25;
LABEL_26:

    goto LABEL_27;
  }
  v13 = 0;
LABEL_27:

  return v13;
}

- (BOOL)isUserEnteredDataEqual:(id)a3
{
  HKMCDaySummary *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  _BOOL4 v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  v4 = (HKMCDaySummary *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    v5 = -[HKMCDaySummary dayIndex](self, "dayIndex");
    if (v5 != -[HKMCDaySummary dayIndex](v4, "dayIndex"))
      goto LABEL_17;
    v6 = -[HKMCDaySummary menstrualFlow](self, "menstrualFlow");
    if (v6 != -[HKMCDaySummary menstrualFlow](v4, "menstrualFlow"))
      goto LABEL_17;
    v7 = -[HKMCDaySummary bleedingInPregnancyFlow](self, "bleedingInPregnancyFlow");
    if (v7 != -[HKMCDaySummary bleedingInPregnancyFlow](v4, "bleedingInPregnancyFlow"))
      goto LABEL_17;
    v8 = -[HKMCDaySummary bleedingAfterPregnancyFlow](self, "bleedingAfterPregnancyFlow");
    if (v8 != -[HKMCDaySummary bleedingAfterPregnancyFlow](v4, "bleedingAfterPregnancyFlow"))
      goto LABEL_17;
    v9 = -[HKMCDaySummary intermenstrualBleeding](self, "intermenstrualBleeding");
    if (v9 == -[HKMCDaySummary intermenstrualBleeding](v4, "intermenstrualBleeding")
      && (v10 = -[HKMCDaySummary symptoms](self, "symptoms"), v10 == -[HKMCDaySummary symptoms](v4, "symptoms"))
      && (v11 = -[HKMCDaySummary sexualActivity](self, "sexualActivity"),
          v11 == -[HKMCDaySummary sexualActivity](v4, "sexualActivity"))
      && (v12 = -[HKMCDaySummary ovulationTestResult](self, "ovulationTestResult"),
          v12 == -[HKMCDaySummary ovulationTestResult](v4, "ovulationTestResult"))
      && (v13 = -[HKMCDaySummary pregnancyTestResult](self, "pregnancyTestResult"),
          v13 == -[HKMCDaySummary pregnancyTestResult](v4, "pregnancyTestResult"))
      && (v14 = -[HKMCDaySummary progesteroneTestResult](self, "progesteroneTestResult"),
          v14 == -[HKMCDaySummary progesteroneTestResult](v4, "progesteroneTestResult"))
      && (v15 = -[HKMCDaySummary cervicalMucusQuality](self, "cervicalMucusQuality"),
          v15 == -[HKMCDaySummary cervicalMucusQuality](v4, "cervicalMucusQuality")))
    {
      -[HKMCDaySummary basalBodyTemperature](self, "basalBodyTemperature");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMCDaySummary basalBodyTemperature](v4, "basalBodyTemperature");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == v17)
      {
        v21 = 1;
      }
      else
      {
        -[HKMCDaySummary basalBodyTemperature](v4, "basalBodyTemperature");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[HKMCDaySummary basalBodyTemperature](self, "basalBodyTemperature");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCDaySummary basalBodyTemperature](v4, "basalBodyTemperature");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqual:", v20);

        }
        else
        {
          v21 = 0;
        }

      }
    }
    else
    {
LABEL_17:
      v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 intermenstrualBleeding;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_dayIndex);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v32, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_menstrualFlow);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v31, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_bleedingInPregnancyFlow);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v30, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_bleedingAfterPregnancyFlow);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v29, "hash");
  intermenstrualBleeding = self->_intermenstrualBleeding;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_symptoms);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = intermenstrualBleeding ^ objc_msgSend(v28, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sexualActivity);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_ovulationTestResult);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_pregnancyTestResult);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_progesteroneTestResult);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_cervicalMucusQuality);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10 ^ v16 ^ objc_msgSend(v17, "hash");
  v19 = -[HKQuantity hash](self->_basalBodyTemperature, "hash");
  v20 = v19 ^ -[HKMCWristTemperature hash](self->_wristTemperature, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_menstrualFlowModificationDayIndex);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  v23 = v22 ^ -[NSNumber hash](self->_startOfCycleFromCycleTracking, "hash");
  v24 = v23 ^ -[NSArray hash](self->_startedCycleFactors, "hash");
  v25 = v18 ^ v24 ^ -[NSArray hash](self->_endedCycleFactors, "hash");
  v26 = v25 ^ -[NSDictionary hash](self->_sampleCountByType, "hash");

  return v26;
}

- (id)_initFromDaySummary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a3;
  v23 = objc_msgSend(v3, "dayIndex");
  v22 = objc_msgSend(v3, "menstrualFlow");
  v21 = objc_msgSend(v3, "bleedingInPregnancyFlow");
  v20 = objc_msgSend(v3, "bleedingAfterPregnancyFlow");
  v19 = objc_msgSend(v3, "intermenstrualBleeding");
  v18 = objc_msgSend(v3, "symptoms");
  v17 = objc_msgSend(v3, "sexualActivity");
  v16 = objc_msgSend(v3, "ovulationTestResult");
  v15 = objc_msgSend(v3, "pregnancyTestResult");
  v4 = objc_msgSend(v3, "progesteroneTestResult");
  v5 = objc_msgSend(v3, "cervicalMucusQuality");
  objc_msgSend(v3, "basalBodyTemperature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wristTemperature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "menstrualFlowModificationDayIndex");
  objc_msgSend(v3, "startOfCycleFromCycleTracking");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedCycleFactors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endedCycleFactors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleCountByType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HKMCDaySummary _initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:](self, "_initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", v23, v22, v21, v20, v19, v18, v17, v16, v15, v4, v5, v6, v7, v8,
          v9,
          v10,
          v11,
          v12);

  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[HKMCDaySummary _initFromDaySummary:]([HKMCMutableDaySummary alloc], "_initFromDaySummary:", self);
}

- (BOOL)_isMenstrualFlowLogged
{
  return self->_menstrualFlow != 0;
}

- (BOOL)_isBleedingInPregnancyFlowLogged
{
  return self->_bleedingInPregnancyFlow != 0;
}

- (BOOL)_isBleedingAfterPregnancyFlowLogged
{
  return self->_bleedingAfterPregnancyFlow != 0;
}

- (BOOL)_isIntermenstrualBleedingLogged
{
  return self->_intermenstrualBleeding;
}

- (BOOL)_isSymptomsLogged
{
  return self->_symptoms != 0;
}

- (BOOL)_isSexualActivityLogged
{
  return self->_sexualActivity != 0;
}

- (BOOL)_isOvulationTestResultLogged
{
  return self->_ovulationTestResult != 0;
}

- (BOOL)_isPregnancyTestResultLogged
{
  return self->_pregnancyTestResult != 0;
}

- (BOOL)_isProgesteroneTestResultLogged
{
  return self->_progesteroneTestResult != 0;
}

- (BOOL)_isCervicalMucusQualityLogged
{
  return self->_cervicalMucusQuality != 0;
}

- (BOOL)_isBasalBodyTemperatureLogged
{
  return self->_basalBodyTemperature != 0;
}

- (BOOL)isDataLogged
{
  return -[HKMCDaySummary _isMenstrualFlowLogged](self, "_isMenstrualFlowLogged")
      || -[HKMCDaySummary _isBleedingInPregnancyFlowLogged](self, "_isBleedingInPregnancyFlowLogged")
      || -[HKMCDaySummary _isBleedingAfterPregnancyFlowLogged](self, "_isBleedingAfterPregnancyFlowLogged")
      || -[HKMCDaySummary _isIntermenstrualBleedingLogged](self, "_isIntermenstrualBleedingLogged")
      || -[HKMCDaySummary _isSymptomsLogged](self, "_isSymptomsLogged")
      || -[HKMCDaySummary _isSexualActivityLogged](self, "_isSexualActivityLogged")
      || -[HKMCDaySummary _isOvulationTestResultLogged](self, "_isOvulationTestResultLogged")
      || -[HKMCDaySummary _isPregnancyTestResultLogged](self, "_isPregnancyTestResultLogged")
      || -[HKMCDaySummary _isProgesteroneTestResultLogged](self, "_isProgesteroneTestResultLogged")
      || -[HKMCDaySummary _isCervicalMucusQualityLogged](self, "_isCervicalMucusQualityLogged")
      || -[HKMCDaySummary _isBasalBodyTemperatureLogged](self, "_isBasalBodyTemperatureLogged");
}

- (BOOL)isSupplementaryDataLogged
{
  return -[HKMCDaySummary _isIntermenstrualBleedingLogged](self, "_isIntermenstrualBleedingLogged")
      || -[HKMCDaySummary _isSymptomsLogged](self, "_isSymptomsLogged")
      || -[HKMCDaySummary _isSexualActivityLogged](self, "_isSexualActivityLogged")
      || -[HKMCDaySummary _isOvulationTestResultLogged](self, "_isOvulationTestResultLogged")
      || -[HKMCDaySummary _isPregnancyTestResultLogged](self, "_isPregnancyTestResultLogged")
      || -[HKMCDaySummary _isProgesteroneTestResultLogged](self, "_isProgesteroneTestResultLogged")
      || -[HKMCDaySummary _isCervicalMucusQualityLogged](self, "_isCervicalMucusQualityLogged")
      || -[HKMCDaySummary _isBasalBodyTemperatureLogged](self, "_isBasalBodyTemperatureLogged");
}

- (NSSet)loggedSupplementaryDisplayTypes
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (-[HKMCDaySummary _isIntermenstrualBleedingLogged](self, "_isIntermenstrualBleedingLogged"))
    objc_msgSend(v3, "addObject:", CFSTR("DisplayTypeIdentifierIntermenstrualBleeding"));
  if (-[HKMCDaySummary _isSymptomsLogged](self, "_isSymptomsLogged"))
    objc_msgSend(v3, "addObject:", CFSTR("DisplayTypeIdentifierSymptoms"));
  if (-[HKMCDaySummary _isSexualActivityLogged](self, "_isSexualActivityLogged"))
    objc_msgSend(v3, "addObject:", CFSTR("DisplayTypeIdentifierSexualActivity"));
  if (-[HKMCDaySummary _isOvulationTestResultLogged](self, "_isOvulationTestResultLogged"))
    objc_msgSend(v3, "addObject:", CFSTR("DisplayTypeIdentifierOvulationTestResult"));
  if (-[HKMCDaySummary _isPregnancyTestResultLogged](self, "_isPregnancyTestResultLogged"))
    objc_msgSend(v3, "addObject:", CFSTR("DisplayTypeIdentifierPregnancyTestResult"));
  if (-[HKMCDaySummary _isProgesteroneTestResultLogged](self, "_isProgesteroneTestResultLogged"))
    objc_msgSend(v3, "addObject:", CFSTR("DisplayTypeIdentifierProgesteroneTestResult"));
  if (-[HKMCDaySummary _isCervicalMucusQualityLogged](self, "_isCervicalMucusQualityLogged"))
    objc_msgSend(v3, "addObject:", CFSTR("DisplayTypeIdentifierCervicalMucusQuality"));
  if (-[HKMCDaySummary _isBasalBodyTemperatureLogged](self, "_isBasalBodyTemperatureLogged"))
    objc_msgSend(v3, "addObject:", CFSTR("DisplayTypeIdentifierBasalBodyTemperature"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v4;
}

- (int64_t)menstrualFlowSampleCount
{
  NSDictionary *sampleCountByType;
  void *v3;
  void *v4;
  int64_t v5;

  sampleCountByType = self->_sampleCountByType;
  objc_msgSend(MEMORY[0x24BDD3F08], "dataTypeWithCode:", 95);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sampleCountByType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)bleedingInPregnancyFlowSampleCount
{
  NSDictionary *sampleCountByType;
  void *v3;
  void *v4;
  int64_t v5;

  sampleCountByType = self->_sampleCountByType;
  objc_msgSend(MEMORY[0x24BDD3F08], "dataTypeWithCode:", 313);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sampleCountByType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)bleedingAfterPregnancyFlowSampleCount
{
  NSDictionary *sampleCountByType;
  void *v3;
  void *v4;
  int64_t v5;

  sampleCountByType = self->_sampleCountByType;
  objc_msgSend(MEMORY[0x24BDD3F08], "dataTypeWithCode:", 314);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sampleCountByType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)sexualActivitySampleCount
{
  NSDictionary *sampleCountByType;
  void *v3;
  void *v4;
  int64_t v5;

  sampleCountByType = self->_sampleCountByType;
  objc_msgSend(MEMORY[0x24BDD3F08], "dataTypeWithCode:", 97);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sampleCountByType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)ovulationTestResultSampleCount
{
  NSDictionary *sampleCountByType;
  void *v3;
  void *v4;
  int64_t v5;

  sampleCountByType = self->_sampleCountByType;
  objc_msgSend(MEMORY[0x24BDD3F08], "dataTypeWithCode:", 92);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sampleCountByType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)pregnancyTestResultSampleCount
{
  NSDictionary *sampleCountByType;
  void *v3;
  void *v4;
  int64_t v5;

  sampleCountByType = self->_sampleCountByType;
  objc_msgSend(MEMORY[0x24BDD3F08], "dataTypeWithCode:", 243);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sampleCountByType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)progesteroneTestResultSampleCount
{
  NSDictionary *sampleCountByType;
  void *v3;
  void *v4;
  int64_t v5;

  sampleCountByType = self->_sampleCountByType;
  objc_msgSend(MEMORY[0x24BDD3F08], "dataTypeWithCode:", 244);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sampleCountByType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)cervicalMucusQualitySampleCount
{
  NSDictionary *sampleCountByType;
  void *v3;
  void *v4;
  int64_t v5;

  sampleCountByType = self->_sampleCountByType;
  objc_msgSend(MEMORY[0x24BDD3F08], "dataTypeWithCode:", 91);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sampleCountByType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (id)_daySummaryWithOverrideSourceIDBySourceID:(id)a3 ignoreCycleFactors:(BOOL)a4 ignoreOvulationTestResults:(BOOL)a5
{
  id v8;
  HKMCWristTemperature *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HKMCWristTemperature *v16;
  void *v17;
  uint64_t v18;
  int64_t ovulationTestResult;
  NSArray *startedCycleFactors;
  NSArray *endedCycleFactors;
  void *v22;

  v8 = a3;
  v9 = self->_wristTemperature;
  v10 = v9;
  if (v8 && v9)
  {
    -[HKMCWristTemperature watchBundleIdentifier](v9, "watchBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v10, "watchBundleIdentifier");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v16 = [HKMCWristTemperature alloc];
    objc_msgSend(v10, "quantity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HKMCWristTemperature initWithQuantity:watchBundleIdentifier:](v16, "initWithQuantity:watchBundleIdentifier:", v17, v15);

    v10 = (void *)v18;
  }
  if (a5)
    ovulationTestResult = 0;
  else
    ovulationTestResult = self->_ovulationTestResult;
  if (a4)
  {
    startedCycleFactors = (NSArray *)MEMORY[0x24BDBD1A8];
    endedCycleFactors = (NSArray *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    startedCycleFactors = self->_startedCycleFactors;
    endedCycleFactors = self->_endedCycleFactors;
  }
  +[HKMCDaySummary daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:](HKMCDaySummary, "daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", self->_dayIndex, self->_menstrualFlow, self->_bleedingInPregnancyFlow, self->_bleedingAfterPregnancyFlow, self->_intermenstrualBleeding, self->_symptoms, self->_sexualActivity, ovulationTestResult, self->_pregnancyTestResult, self->_progesteroneTestResult, self->_cervicalMucusQuality, self->_basalBodyTemperature, v10, self->_menstrualFlowModificationDayIndex,
    self->_startOfCycleFromCycleTracking,
    startedCycleFactors,
    endedCycleFactors,
    self->_sampleCountByType);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

- (int64_t)menstrualFlow
{
  return self->_menstrualFlow;
}

- (void)setMenstrualFlow:(int64_t)a3
{
  self->_menstrualFlow = a3;
}

- (int64_t)bleedingInPregnancyFlow
{
  return self->_bleedingInPregnancyFlow;
}

- (void)setBleedingInPregnancyFlow:(int64_t)a3
{
  self->_bleedingInPregnancyFlow = a3;
}

- (int64_t)bleedingAfterPregnancyFlow
{
  return self->_bleedingAfterPregnancyFlow;
}

- (void)setBleedingAfterPregnancyFlow:(int64_t)a3
{
  self->_bleedingAfterPregnancyFlow = a3;
}

- (BOOL)intermenstrualBleeding
{
  return self->_intermenstrualBleeding;
}

- (void)setIntermenstrualBleeding:(BOOL)a3
{
  self->_intermenstrualBleeding = a3;
}

- (unint64_t)symptoms
{
  return self->_symptoms;
}

- (void)setSymptoms:(unint64_t)a3
{
  self->_symptoms = a3;
}

- (int64_t)sexualActivity
{
  return self->_sexualActivity;
}

- (void)setSexualActivity:(int64_t)a3
{
  self->_sexualActivity = a3;
}

- (int64_t)ovulationTestResult
{
  return self->_ovulationTestResult;
}

- (void)setOvulationTestResult:(int64_t)a3
{
  self->_ovulationTestResult = a3;
}

- (int64_t)pregnancyTestResult
{
  return self->_pregnancyTestResult;
}

- (void)setPregnancyTestResult:(int64_t)a3
{
  self->_pregnancyTestResult = a3;
}

- (int64_t)progesteroneTestResult
{
  return self->_progesteroneTestResult;
}

- (void)setProgesteroneTestResult:(int64_t)a3
{
  self->_progesteroneTestResult = a3;
}

- (int64_t)cervicalMucusQuality
{
  return self->_cervicalMucusQuality;
}

- (void)setCervicalMucusQuality:(int64_t)a3
{
  self->_cervicalMucusQuality = a3;
}

- (HKQuantity)basalBodyTemperature
{
  return self->_basalBodyTemperature;
}

- (void)setBasalBodyTemperature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (HKMCWristTemperature)wristTemperature
{
  return self->_wristTemperature;
}

- (int64_t)menstrualFlowModificationDayIndex
{
  return self->_menstrualFlowModificationDayIndex;
}

- (NSNumber)startOfCycleFromCycleTracking
{
  return self->_startOfCycleFromCycleTracking;
}

- (void)setStartOfCycleFromCycleTracking:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)startedCycleFactors
{
  return self->_startedCycleFactors;
}

- (NSArray)endedCycleFactors
{
  return self->_endedCycleFactors;
}

- (NSDictionary)sampleCountByType
{
  return self->_sampleCountByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCountByType, 0);
  objc_storeStrong((id *)&self->_endedCycleFactors, 0);
  objc_storeStrong((id *)&self->_startedCycleFactors, 0);
  objc_storeStrong((id *)&self->_startOfCycleFromCycleTracking, 0);
  objc_storeStrong((id *)&self->_wristTemperature, 0);
  objc_storeStrong((id *)&self->_basalBodyTemperature, 0);
}

+ (id)daySummaryWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4
{
  return +[HKMCDaySummary daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:](HKMCDaySummary, "daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0);
}

+ (id)daySummaryWithDayIndex:(int64_t)a3 ovulationTestResult:(int64_t)a4
{
  return +[HKMCDaySummary daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:](HKMCDaySummary, "daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, 0, 0, 0, 0, 0, 0, a4, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0);
}

- (BOOL)isFetched
{
  return 1;
}

- (BOOL)hasConfirmedNoFlow
{
  return -[HKMCDaySummary menstrualFlow](self, "menstrualFlow") == 1;
}

- (BOOL)hasFlow
{
  return HKMCDaySummaryBleedingFlowHasFlow(-[HKMCDaySummary menstrualFlow](self, "menstrualFlow"));
}

@end
