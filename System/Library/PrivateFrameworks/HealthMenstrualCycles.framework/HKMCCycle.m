@implementation HKMCCycle

- (void)encodeWithCoder:(id)a3
{
  HKMCCycleSegment *menstruationSegment;
  id v5;

  menstruationSegment = self->_menstruationSegment;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", menstruationSegment, CFSTR("MenstruationSegment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fertileWindowSegment, CFSTR("FertileWindowSegment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastDayIndex, CFSTR("LastDayIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ovulationConfirmationType, CFSTR("OvulationConfirmationType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ovulationConfirmationFailure, CFSTR("OvulationConfirmationFailure"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dailyEligibleWristTemperatureCount, CFSTR("DailyEligibleWristTemperatureCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cycleFactors, CFSTR("CycleFactors"));

}

- (HKMCCycle)initWithCoder:(id)a3
{
  id v4;
  HKMCCycle *v5;
  uint64_t v6;
  HKMCCycleSegment *menstruationSegment;
  uint64_t v8;
  HKMCCycleSegment *fertileWindowSegment;
  uint64_t v10;
  NSNumber *lastDayIndex;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *cycleFactors;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMCCycle;
  v5 = -[HKMCCycle init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MenstruationSegment"));
    v6 = objc_claimAutoreleasedReturnValue();
    menstruationSegment = v5->_menstruationSegment;
    v5->_menstruationSegment = (HKMCCycleSegment *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FertileWindowSegment"));
    v8 = objc_claimAutoreleasedReturnValue();
    fertileWindowSegment = v5->_fertileWindowSegment;
    v5->_fertileWindowSegment = (HKMCCycleSegment *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastDayIndex"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastDayIndex = v5->_lastDayIndex;
    v5->_lastDayIndex = (NSNumber *)v10;

    v5->_ovulationConfirmationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OvulationConfirmationType"));
    v5->_ovulationConfirmationFailure = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OvulationConfirmationFailure"));
    v5->_dailyEligibleWristTemperatureCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DailyEligibleWristTemperatureCount"));
    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("CycleFactors"));
    v15 = objc_claimAutoreleasedReturnValue();
    cycleFactors = v5->_cycleFactors;
    v5->_cycleFactors = (NSArray *)v15;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_cycleWithMenstruationSegment:(id)a3 fertileWindowSegment:(id)a4 lastDayIndex:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v12 = (void *)objc_msgSend(v11, "_initWithMenstruationSegment:fertileWindowSegment:lastDayIndex:ovulationConfirmationType:ovulationConfirmationFailure:dailyEligibleWristTemperatureCount:cycleFactors:", v10, v9, v8, 0, 0, 0, MEMORY[0x24BDBD1A8]);

  return v12;
}

+ (id)_cycleWithMenstruationSegment:(id)a3 fertileWindowSegment:(id)a4 lastDayIndex:(id)a5 ovulationConfirmationType:(int64_t)a6 ovulationConfirmationFailure:(int64_t)a7 dailyEligibleWristTemperatureCount:(int64_t)a8 cycleFactors:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v16 = a9;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMenstruationSegment:fertileWindowSegment:lastDayIndex:ovulationConfirmationType:ovulationConfirmationFailure:dailyEligibleWristTemperatureCount:cycleFactors:", v19, v18, v17, a6, a7, a8, v16);

  return v20;
}

- (id)_initWithMenstruationSegment:(id)a3 fertileWindowSegment:(id)a4 lastDayIndex:(id)a5 ovulationConfirmationType:(int64_t)a6 ovulationConfirmationFailure:(int64_t)a7 dailyEligibleWristTemperatureCount:(int64_t)a8 cycleFactors:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  HKMCCycle *v19;
  HKMCCycle *v20;
  uint64_t v21;
  NSArray *cycleFactors;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HKMCCycle;
  v19 = -[HKMCCycle init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_menstruationSegment, a3);
    objc_storeStrong((id *)&v20->_fertileWindowSegment, a4);
    objc_storeStrong((id *)&v20->_lastDayIndex, a5);
    v20->_ovulationConfirmationType = a6;
    v20->_ovulationConfirmationFailure = a7;
    v20->_dailyEligibleWristTemperatureCount = a8;
    v21 = objc_msgSend(v18, "copy");
    cycleFactors = v20->_cycleFactors;
    v20->_cycleFactors = (NSArray *)v21;

  }
  return v20;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSNumber *lastDayIndex;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v12 = *(_OWORD *)&self->_menstruationSegment;
  lastDayIndex = self->_lastDayIndex;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_ovulationConfirmationType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_ovulationConfirmationFailure);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_dailyEligibleWristTemperatureCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCycleFactors(self->_cycleFactors);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p menstruation:%@ fertile window:%@ last day:%@ ovulation confirmation type:%@, ovulation confirmation failure:%@, daily eligible wrist temperature count:%@, cycle factors:%@>"), v4, self, v12, lastDayIndex, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)hk_redactedDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (BOOL)isEqual:(id)a3
{
  HKMCCycle *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  BOOL v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v4 = (HKMCCycle *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKMCCycle cycleFactors](self, "cycleFactors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      -[HKMCCycle cycleFactors](v4, "cycleFactors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v6 == v8)
      {
        -[HKMCCycle cycleFactors](self, "cycleFactors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          v11 = 0;
          do
          {
            -[HKMCCycle cycleFactors](self, "cycleFactors");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKMCCycle cycleFactors](v4, "cycleFactors");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v7, "isEqual:", v14);

            if ((v15 & 1) == 0)
              break;
            ++v11;
            -[HKMCCycle cycleFactors](self, "cycleFactors");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = (void *)objc_msgSend(v16, "count");

          }
          while (v11 < (unint64_t)v7);
        }
        else
        {
          v15 = 1;
        }
      }
      else
      {
        v15 = 0;
      }
      -[HKMCCycle menstruationSegment](self, "menstruationSegment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMCCycle menstruationSegment](v4, "menstruationSegment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 != v19)
      {
        -[HKMCCycle menstruationSegment](v4, "menstruationSegment");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v17 = 0;
          goto LABEL_47;
        }
        v7 = (void *)v20;
        -[HKMCCycle menstruationSegment](self, "menstruationSegment");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCCycle menstruationSegment](v4, "menstruationSegment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v21, "isEqual:", v22))
        {
          v17 = 0;
LABEL_46:

          goto LABEL_47;
        }
        v44 = v7;
        v45 = v22;
        v46 = v21;
      }
      -[HKMCCycle fertileWindowSegment](self, "fertileWindowSegment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMCCycle fertileWindowSegment](v4, "fertileWindowSegment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 != v24)
      {
        -[HKMCCycle fertileWindowSegment](v4, "fertileWindowSegment");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          v17 = 0;
          goto LABEL_43;
        }
        v26 = (void *)v25;
        -[HKMCCycle fertileWindowSegment](self, "fertileWindowSegment");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCCycle fertileWindowSegment](v4, "fertileWindowSegment");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v27, "isEqual:", v7) & 1) == 0)
        {

          v17 = 0;
          goto LABEL_45;
        }
        v41 = v7;
        v42 = v27;
        v43 = v26;
      }
      -[HKMCCycle lastDayIndex](self, "lastDayIndex");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMCCycle lastDayIndex](v4, "lastDayIndex");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 != v29)
      {
        -[HKMCCycle lastDayIndex](v4, "lastDayIndex");
        v30 = objc_claimAutoreleasedReturnValue();
        if (!v30)
          goto LABEL_37;
        v40 = (void *)v30;
        -[HKMCCycle lastDayIndex](self, "lastDayIndex");
        v31 = objc_claimAutoreleasedReturnValue();
        -[HKMCCycle lastDayIndex](v4, "lastDayIndex");
        v32 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v31;
        v33 = (void *)v31;
        v7 = (void *)v32;
        if (!objc_msgSend(v33, "isEqual:", v32))
        {
          v17 = 0;
LABEL_26:

          if (v23 == v24)
          {

            goto LABEL_44;
          }

LABEL_43:
LABEL_44:

LABEL_45:
          v22 = v45;
          v21 = v46;
          v7 = v44;
          if (v18 != v19)
            goto LABEL_46;
LABEL_47:

          goto LABEL_48;
        }
      }
      if (v15)
      {
        v34 = -[HKMCCycle ovulationConfirmationType](self, "ovulationConfirmationType");
        if (v34 == -[HKMCCycle ovulationConfirmationType](v4, "ovulationConfirmationType"))
        {
          v35 = -[HKMCCycle ovulationConfirmationFailure](self, "ovulationConfirmationFailure");
          if (v35 == -[HKMCCycle ovulationConfirmationFailure](v4, "ovulationConfirmationFailure"))
          {
            v36 = -[HKMCCycle dailyEligibleWristTemperatureCount](self, "dailyEligibleWristTemperatureCount");
            v17 = v36 == -[HKMCCycle dailyEligibleWristTemperatureCount](v4, "dailyEligibleWristTemperatureCount");
            v37 = v17;
            if (v28 != v29)
              goto LABEL_26;
            goto LABEL_40;
          }
        }
      }
      if (v28 == v29)
      {
        v37 = 0;
        v17 = 0;
LABEL_40:

LABEL_41:
        if (v23 != v24)
        {

          v17 = v37;
        }
        goto LABEL_43;
      }

LABEL_37:
      v37 = 0;
      v17 = 0;
      goto LABEL_41;
    }
    v17 = 0;
  }
LABEL_48:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSInteger v5;

  v3 = -[HKMCCycleSegment hash](self->_menstruationSegment, "hash");
  v4 = -[HKMCCycleSegment hash](self->_fertileWindowSegment, "hash") ^ v3;
  v5 = -[NSNumber integerValue](self->_lastDayIndex, "integerValue");
  return v4 ^ v5 ^ -[NSArray hash](self->_cycleFactors, "hash") ^ self->_ovulationConfirmationType ^ self->_ovulationConfirmationFailure ^ self->_dailyEligibleWristTemperatureCount;
}

- (HKMCCycleSegment)menstruationSegment
{
  return self->_menstruationSegment;
}

- (HKMCCycleSegment)fertileWindowSegment
{
  return self->_fertileWindowSegment;
}

- (int64_t)ovulationConfirmationType
{
  return self->_ovulationConfirmationType;
}

- (int64_t)ovulationConfirmationFailure
{
  return self->_ovulationConfirmationFailure;
}

- (int64_t)dailyEligibleWristTemperatureCount
{
  return self->_dailyEligibleWristTemperatureCount;
}

- (NSNumber)lastDayIndex
{
  return self->_lastDayIndex;
}

- (NSArray)cycleFactors
{
  return self->_cycleFactors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleFactors, 0);
  objc_storeStrong((id *)&self->_lastDayIndex, 0);
  objc_storeStrong((id *)&self->_fertileWindowSegment, 0);
  objc_storeStrong((id *)&self->_menstruationSegment, 0);
}

@end
