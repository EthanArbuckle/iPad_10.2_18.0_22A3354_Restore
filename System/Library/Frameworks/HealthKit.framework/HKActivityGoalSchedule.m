@implementation HKActivityGoalSchedule

+ (id)activityGoalScheduleWithDate:(id)a3 goalType:(int64_t)a4 mondayGoal:(id)a5 tuesdayGoal:(id)a6 wednesdayGoal:(id)a7 thursdayGoal:(id)a8 fridayGoal:(id)a9 saturdayGoal:(id)a10 sundayGoal:(id)a11 device:(id)a12 metadata:(id)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v36;
  id v37;
  id v39;
  objc_super v40;
  _QWORD aBlock[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  int64_t v49;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __165__HKActivityGoalSchedule_activityGoalScheduleWithDate_goalType_mondayGoal_tuesdayGoal_wednesdayGoal_thursdayGoal_fridayGoal_saturdayGoal_sundayGoal_device_metadata___block_invoke;
  aBlock[3] = &unk_1E37F49E0;
  v42 = v16;
  v43 = v17;
  v44 = v18;
  v45 = v19;
  v46 = v20;
  v47 = v21;
  v48 = v22;
  v49 = a4;
  v39 = v22;
  v37 = v21;
  v36 = v20;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  v27 = a13;
  v28 = a12;
  v29 = a3;
  v30 = _Block_copy(aBlock);
  +[HKObjectType activityGoalScheduleType](HKSampleType, "activityGoalScheduleType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40.receiver = a1;
  v40.super_class = (Class)&OBJC_METACLASS___HKActivityGoalSchedule;
  v32 = objc_msgSendSuper2(&v40, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v31, v29, v29, v28, v27, v30);

  return v32;
}

void __165__HKActivityGoalSchedule_activityGoalScheduleWithDate_goalType_mondayGoal_tuesdayGoal_wednesdayGoal_thursdayGoal_fridayGoal_saturdayGoal_sundayGoal_device_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;

  *(_QWORD *)(a2 + 96) = *(_QWORD *)(a1 + 88);
  objc_storeStrong((id *)(a2 + 104), *(id *)(a1 + 32));
  v4 = (id *)(id)a2;
  objc_storeStrong(v4 + 14, *(id *)(a1 + 40));
  objc_storeStrong(v4 + 15, *(id *)(a1 + 48));
  objc_storeStrong(v4 + 16, *(id *)(a1 + 56));
  objc_storeStrong(v4 + 17, *(id *)(a1 + 64));
  objc_storeStrong(v4 + 18, *(id *)(a1 + 72));
  objc_storeStrong(v4 + 19, *(id *)(a1 + 80));

}

+ (id)activityGoalScheduleWithDate:(id)a3 goalType:(int64_t)a4 goal:(id)a5 device:(id)a6 metadata:(id)a7
{
  return (id)objc_msgSend(a1, "activityGoalScheduleWithDate:goalType:mondayGoal:tuesdayGoal:wednesdayGoal:thursdayGoal:fridayGoal:saturdayGoal:sundayGoal:device:metadata:", a3, a4, a5, a5, a5, a5, a5, a5, a5, a6, a7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKActivityGoalSchedule;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_goalType, CFSTR("GoalType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_mondayGoal, CFSTR("MondayGoal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tuesdayGoal, CFSTR("TuesdayGoal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_wednesdayGoal, CFSTR("WednesdayGoal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_thursdayGoal, CFSTR("ThursdayGoal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fridayGoal, CFSTR("FridayGoal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_saturdayGoal, CFSTR("SaturdayGoal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sundayGoal, CFSTR("SundayGoal"));

}

- (HKActivityGoalSchedule)initWithCoder:(id)a3
{
  id v4;
  HKActivityGoalSchedule *v5;
  uint64_t v6;
  uint64_t v7;
  HKQuantity *mondayGoal;
  uint64_t v9;
  HKQuantity *tuesdayGoal;
  uint64_t v11;
  HKQuantity *wednesdayGoal;
  uint64_t v13;
  HKQuantity *thursdayGoal;
  uint64_t v15;
  HKQuantity *fridayGoal;
  uint64_t v17;
  HKQuantity *saturdayGoal;
  uint64_t v19;
  HKQuantity *sundayGoal;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKActivityGoalSchedule;
  v5 = -[HKSample initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    v5->_goalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GoalType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("MondayGoal"));
    v7 = objc_claimAutoreleasedReturnValue();
    mondayGoal = v5->_mondayGoal;
    v5->_mondayGoal = (HKQuantity *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("TuesdayGoal"));
    v9 = objc_claimAutoreleasedReturnValue();
    tuesdayGoal = v5->_tuesdayGoal;
    v5->_tuesdayGoal = (HKQuantity *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("WednesdayGoal"));
    v11 = objc_claimAutoreleasedReturnValue();
    wednesdayGoal = v5->_wednesdayGoal;
    v5->_wednesdayGoal = (HKQuantity *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("ThursdayGoal"));
    v13 = objc_claimAutoreleasedReturnValue();
    thursdayGoal = v5->_thursdayGoal;
    v5->_thursdayGoal = (HKQuantity *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("FridayGoal"));
    v15 = objc_claimAutoreleasedReturnValue();
    fridayGoal = v5->_fridayGoal;
    v5->_fridayGoal = (HKQuantity *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("SaturdayGoal"));
    v17 = objc_claimAutoreleasedReturnValue();
    saturdayGoal = v5->_saturdayGoal;
    v5->_saturdayGoal = (HKQuantity *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("SundayGoal"));
    v19 = objc_claimAutoreleasedReturnValue();
    sundayGoal = v5->_sundayGoal;
    v5->_sundayGoal = (HKQuantity *)v19;

  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  objc_super v53;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53.receiver = self;
    v53.super_class = (Class)HKActivityGoalSchedule;
    if (-[HKSample isEquivalent:](&v53, sel_isEquivalent_, v4))
    {
      v5 = v4;
      v6 = -[HKActivityGoalSchedule goalType](self, "goalType");
      if (v6 != objc_msgSend(v5, "goalType"))
        goto LABEL_40;
      -[HKActivityGoalSchedule mondayGoal](self, "mondayGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mondayGoal");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        objc_msgSend(v5, "mondayGoal");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_39;
        v11 = (void *)v10;
        -[HKActivityGoalSchedule mondayGoal](self, "mondayGoal");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "mondayGoal");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (!v14)
          goto LABEL_40;
      }
      -[HKActivityGoalSchedule tuesdayGoal](self, "tuesdayGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tuesdayGoal");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v16)
      {

      }
      else
      {
        v9 = (void *)v16;
        objc_msgSend(v5, "tuesdayGoal");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_39;
        v18 = (void *)v17;
        -[HKActivityGoalSchedule tuesdayGoal](self, "tuesdayGoal");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "tuesdayGoal");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

        if (!v21)
          goto LABEL_40;
      }
      -[HKActivityGoalSchedule wednesdayGoal](self, "wednesdayGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wednesdayGoal");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v22)
      {

      }
      else
      {
        v9 = (void *)v22;
        objc_msgSend(v5, "wednesdayGoal");
        v23 = objc_claimAutoreleasedReturnValue();
        if (!v23)
          goto LABEL_39;
        v24 = (void *)v23;
        -[HKActivityGoalSchedule wednesdayGoal](self, "wednesdayGoal");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "wednesdayGoal");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqual:", v26);

        if (!v27)
          goto LABEL_40;
      }
      -[HKActivityGoalSchedule thursdayGoal](self, "thursdayGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "thursdayGoal");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v28)
      {

      }
      else
      {
        v9 = (void *)v28;
        objc_msgSend(v5, "thursdayGoal");
        v29 = objc_claimAutoreleasedReturnValue();
        if (!v29)
          goto LABEL_39;
        v30 = (void *)v29;
        -[HKActivityGoalSchedule thursdayGoal](self, "thursdayGoal");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "thursdayGoal");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "isEqual:", v32);

        if (!v33)
          goto LABEL_40;
      }
      -[HKActivityGoalSchedule fridayGoal](self, "fridayGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fridayGoal");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v34)
      {

      }
      else
      {
        v9 = (void *)v34;
        objc_msgSend(v5, "fridayGoal");
        v35 = objc_claimAutoreleasedReturnValue();
        if (!v35)
          goto LABEL_39;
        v36 = (void *)v35;
        -[HKActivityGoalSchedule fridayGoal](self, "fridayGoal");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fridayGoal");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isEqual:", v38);

        if (!v39)
          goto LABEL_40;
      }
      -[HKActivityGoalSchedule saturdayGoal](self, "saturdayGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "saturdayGoal");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v40)
      {

      }
      else
      {
        v9 = (void *)v40;
        objc_msgSend(v5, "saturdayGoal");
        v41 = objc_claimAutoreleasedReturnValue();
        if (!v41)
          goto LABEL_39;
        v42 = (void *)v41;
        -[HKActivityGoalSchedule saturdayGoal](self, "saturdayGoal");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "saturdayGoal");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "isEqual:", v44);

        if (!v45)
          goto LABEL_40;
      }
      -[HKActivityGoalSchedule sundayGoal](self, "sundayGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sundayGoal");
      v46 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v46)
      {

LABEL_44:
        v15 = 1;
        goto LABEL_41;
      }
      v9 = (void *)v46;
      objc_msgSend(v5, "sundayGoal");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v48 = (void *)v47;
        -[HKActivityGoalSchedule sundayGoal](self, "sundayGoal");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sundayGoal");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "isEqual:", v50);

        if ((v51 & 1) != 0)
          goto LABEL_44;
LABEL_40:
        v15 = 0;
LABEL_41:

        goto LABEL_42;
      }
LABEL_39:

      goto LABEL_40;
    }
  }
  v15 = 0;
LABEL_42:

  return v15;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (void)setGoalType:(int64_t)a3
{
  self->_goalType = a3;
}

- (HKQuantity)mondayGoal
{
  return self->_mondayGoal;
}

- (void)setMondayGoal:(id)a3
{
  objc_storeStrong((id *)&self->_mondayGoal, a3);
}

- (HKQuantity)tuesdayGoal
{
  return self->_tuesdayGoal;
}

- (void)setTuesdayGoal:(id)a3
{
  objc_storeStrong((id *)&self->_tuesdayGoal, a3);
}

- (HKQuantity)wednesdayGoal
{
  return self->_wednesdayGoal;
}

- (void)setWednesdayGoal:(id)a3
{
  objc_storeStrong((id *)&self->_wednesdayGoal, a3);
}

- (HKQuantity)thursdayGoal
{
  return self->_thursdayGoal;
}

- (void)setThursdayGoal:(id)a3
{
  objc_storeStrong((id *)&self->_thursdayGoal, a3);
}

- (HKQuantity)fridayGoal
{
  return self->_fridayGoal;
}

- (void)setFridayGoal:(id)a3
{
  objc_storeStrong((id *)&self->_fridayGoal, a3);
}

- (HKQuantity)saturdayGoal
{
  return self->_saturdayGoal;
}

- (void)setSaturdayGoal:(id)a3
{
  objc_storeStrong((id *)&self->_saturdayGoal, a3);
}

- (HKQuantity)sundayGoal
{
  return self->_sundayGoal;
}

- (void)setSundayGoal:(id)a3
{
  objc_storeStrong((id *)&self->_sundayGoal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sundayGoal, 0);
  objc_storeStrong((id *)&self->_saturdayGoal, 0);
  objc_storeStrong((id *)&self->_fridayGoal, 0);
  objc_storeStrong((id *)&self->_thursdayGoal, 0);
  objc_storeStrong((id *)&self->_wednesdayGoal, 0);
  objc_storeStrong((id *)&self->_tuesdayGoal, 0);
  objc_storeStrong((id *)&self->_mondayGoal, 0);
}

@end
