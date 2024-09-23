@implementation HKMedicationDoseEvent

+ (id)medicationDoseEventWithLogOrigin:(int64_t)a3 scheduleItemIdentifier:(id)a4 medicationIdentifier:(id)a5 scheduledDoseQuantity:(id)a6 doseQuantity:(id)a7 scheduledDate:(id)a8 startDate:(id)a9 status:(int64_t)a10 metadata:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;

  v17 = a11;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  +[HKMedicationDoseEventType medicationDoseEventType](HKMedicationDoseEventType, "medicationDoseEventType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(a1, "_newMedicationDoseEventWithType:startDate:endDate:device:metadata:logOrigin:scheduleItemIdentifier:medicationUUID:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:status:config:", v24, v18, v18, 0, v17, a3, v23, 0, v22, v21, v20, v19, a10, 0);

  return v25;
}

+ (id)_newMedicationDoseEventWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 logOrigin:(int64_t)a8 scheduleItemIdentifier:(id)a9 medicationUUID:(id)a10 medicationIdentifier:(id)a11 scheduledDoseQuantity:(id)a12 doseQuantity:(id)a13 scheduledDate:(id)a14 status:(int64_t)a15 config:(id)a16
{
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
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  int64_t v54;
  int64_t v55;

  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __223__HKMedicationDoseEvent__newMedicationDoseEventWithType_startDate_endDate_device_metadata_logOrigin_scheduleItemIdentifier_medicationUUID_medicationIdentifier_scheduledDoseQuantity_doseQuantity_scheduledDate_status_config___block_invoke;
  aBlock[3] = &unk_1E37F2350;
  v47 = v19;
  v48 = v18;
  v49 = v20;
  v50 = v21;
  v51 = v22;
  v52 = v23;
  v54 = a8;
  v55 = a15;
  v53 = v24;
  v44 = v24;
  v43 = v23;
  v42 = v22;
  v41 = v21;
  v25 = v20;
  v26 = v18;
  v27 = v19;
  v28 = a7;
  v29 = a6;
  v30 = a5;
  v31 = a4;
  v32 = a3;
  v33 = _Block_copy(aBlock);
  v45.receiver = a1;
  v45.super_class = (Class)&OBJC_METACLASS___HKMedicationDoseEvent;
  v34 = objc_msgSendSuper2(&v45, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v32, v31, v30, v29, v28, v33);

  return v34;
}

void __223__HKMedicationDoseEvent__newMedicationDoseEventWithType_startDate_endDate_device_metadata_logOrigin_scheduleItemIdentifier_medicationUUID_medicationIdentifier_scheduledDoseQuantity_doseQuantity_scheduledDate_status_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  *((_QWORD *)v13 + 12) = *(_QWORD *)(a1 + 88);
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)*((_QWORD *)v13 + 14);
  *((_QWORD *)v13 + 14) = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)*((_QWORD *)v13 + 13);
  *((_QWORD *)v13 + 13) = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)*((_QWORD *)v13 + 15);
  *((_QWORD *)v13 + 15) = v7;

  objc_storeStrong((id *)v13 + 16, *(id *)(a1 + 56));
  objc_storeStrong((id *)v13 + 17, *(id *)(a1 + 64));
  v9 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v10 = (void *)*((_QWORD *)v13 + 18);
  *((_QWORD *)v13 + 18) = v9;

  v11 = v13;
  *((_QWORD *)v13 + 19) = *(_QWORD *)(a1 + 96);
  v12 = *(_QWORD *)(a1 + 80);
  if (v12)
  {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
    v11 = v13;
  }

}

- (HKMedicationDoseEvent)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  NSString *scheduleItemIdentifier;
  void *v7;
  void *v8;
  int64_t logOrigin;
  void *v11;
  objc_super v12;

  v11 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationDoseEvent;
  -[HKSample description](&v12, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  logOrigin = self->_logOrigin;
  scheduleItemIdentifier = self->_scheduleItemIdentifier;
  -[NSUUID UUIDString](self->_medicationUUID, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@:%p super=%@, logOrigin = %ld, scheduleItemIdentifier = %@, medicationUUID = %@, medicationIdentifier = %@, scheduledDoseQuantity = %@, doseQuantity = %@, scheduledDate = %@, status = %ld, isLastScheduledDose = %d>"), v4, self, v5, logOrigin, scheduleItemIdentifier, v7, self->_medicationIdentifier, self->_scheduledDoseQuantity, self->_doseQuantity, self->_scheduledDate, self->_status, -[HKMedicationDoseEvent isLastScheduledDose](self, "isLastScheduledDose"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  v5.super_class = (Class)HKMedicationDoseEvent;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_logOrigin, CFSTR("LogOrigin"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_scheduleItemIdentifier, CFSTR("ScheduleItemIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_medicationUUID, CFSTR("MedicationUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_medicationIdentifier, CFSTR("MedicationIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_scheduledDoseQuantity, CFSTR("ScheduledDoseQuantity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_doseQuantity, CFSTR("DoseQuantity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_scheduledDate, CFSTR("ScheduledDate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_status, CFSTR("Status"));

}

- (HKMedicationDoseEvent)initWithCoder:(id)a3
{
  id v4;
  HKMedicationDoseEvent *v5;
  uint64_t v6;
  NSString *scheduleItemIdentifier;
  uint64_t v8;
  NSUUID *medicationUUID;
  uint64_t v10;
  NSString *medicationIdentifier;
  uint64_t v12;
  NSNumber *scheduledDoseQuantity;
  uint64_t v14;
  NSNumber *doseQuantity;
  uint64_t v16;
  NSDate *scheduledDate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationDoseEvent;
  v5 = -[HKSample initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_logOrigin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LogOrigin"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScheduleItemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    scheduleItemIdentifier = v5->_scheduleItemIdentifier;
    v5->_scheduleItemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicationUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    medicationUUID = v5->_medicationUUID;
    v5->_medicationUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicationIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    medicationIdentifier = v5->_medicationIdentifier;
    v5->_medicationIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScheduledDoseQuantity"));
    v12 = objc_claimAutoreleasedReturnValue();
    scheduledDoseQuantity = v5->_scheduledDoseQuantity;
    v5->_scheduledDoseQuantity = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DoseQuantity"));
    v14 = objc_claimAutoreleasedReturnValue();
    doseQuantity = v5->_doseQuantity;
    v5->_doseQuantity = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScheduledDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    scheduledDate = v5->_scheduledDate;
    v5->_scheduledDate = (NSDate *)v16;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Status"));
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
  int v15;
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
  int64_t v41;
  _BOOL4 v42;
  objc_super v43;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v43.receiver = self;
    v43.super_class = (Class)HKMedicationDoseEvent;
    if (!-[HKSample isEquivalent:](&v43, sel_isEquivalent_, v5))
      goto LABEL_30;
    v6 = -[HKMedicationDoseEvent logOrigin](self, "logOrigin");
    if (v6 != objc_msgSend(v5, "logOrigin"))
      goto LABEL_30;
    -[HKMedicationDoseEvent scheduleItemIdentifier](self, "scheduleItemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleItemIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      objc_msgSend(v5, "scheduleItemIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_29;
      v11 = (void *)v10;
      -[HKMedicationDoseEvent scheduleItemIdentifier](self, "scheduleItemIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scheduleItemIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (!v14)
        goto LABEL_30;
    }
    -[HKMedicationDoseEvent medicationIdentifier](self, "medicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medicationIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v16)
    {

    }
    else
    {
      v9 = (void *)v16;
      objc_msgSend(v5, "medicationIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_29;
      v18 = (void *)v17;
      -[HKMedicationDoseEvent medicationIdentifier](self, "medicationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "medicationIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if (!v21)
        goto LABEL_30;
    }
    -[HKMedicationDoseEvent scheduledDoseQuantity](self, "scheduledDoseQuantity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduledDoseQuantity");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v22)
    {

    }
    else
    {
      v9 = (void *)v22;
      objc_msgSend(v5, "scheduledDoseQuantity");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_29;
      v24 = (void *)v23;
      -[HKMedicationDoseEvent scheduledDoseQuantity](self, "scheduledDoseQuantity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scheduledDoseQuantity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_30;
    }
    -[HKMedicationDoseEvent doseQuantity](self, "doseQuantity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doseQuantity");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v28)
    {

    }
    else
    {
      v9 = (void *)v28;
      objc_msgSend(v5, "doseQuantity");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_29;
      v30 = (void *)v29;
      -[HKMedicationDoseEvent doseQuantity](self, "doseQuantity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doseQuantity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if (!v33)
        goto LABEL_30;
    }
    -[HKMedicationDoseEvent scheduledDate](self, "scheduledDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduledDate");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v34)
    {

LABEL_34:
      v41 = -[HKMedicationDoseEvent status](self, "status");
      if (v41 == objc_msgSend(v5, "status"))
      {
        v42 = -[HKMedicationDoseEvent isLastScheduledDose](self, "isLastScheduledDose");
        v15 = v42 ^ objc_msgSend(v5, "isLastScheduledDose") ^ 1;
        goto LABEL_31;
      }
LABEL_30:
      LOBYTE(v15) = 0;
LABEL_31:

      goto LABEL_32;
    }
    v9 = (void *)v34;
    objc_msgSend(v5, "scheduledDate");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      -[HKMedicationDoseEvent scheduledDate](self, "scheduledDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scheduledDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_30;
      goto LABEL_34;
    }
LABEL_29:

    goto LABEL_30;
  }
  LOBYTE(v15) = 0;
LABEL_32:

  return v15;
}

- (int64_t)logOrigin
{
  return self->_logOrigin;
}

- (void)_setLogOrigin:(int64_t)a3
{
  self->_logOrigin = a3;
}

- (NSString)scheduleItemIdentifier
{
  return self->_scheduleItemIdentifier;
}

- (void)_setScheduleItemIdentifier:(id)a3
{
  NSString *v4;
  NSString *scheduleItemIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  scheduleItemIdentifier = self->_scheduleItemIdentifier;
  self->_scheduleItemIdentifier = v4;

}

- (void)_setMedicationUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *medicationUUID;

  v4 = (NSUUID *)objc_msgSend(a3, "copy");
  medicationUUID = self->_medicationUUID;
  self->_medicationUUID = v4;

}

- (NSUUID)medicationUUID
{
  return self->_medicationUUID;
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (void)_setMedicationIdentifier:(id)a3
{
  NSString *v4;
  NSString *medicationIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  medicationIdentifier = self->_medicationIdentifier;
  self->_medicationIdentifier = v4;

}

- (NSNumber)scheduledDoseQuantity
{
  return self->_scheduledDoseQuantity;
}

- (void)_setScheduledDoseQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledDoseQuantity, a3);
}

- (NSNumber)doseQuantity
{
  return self->_doseQuantity;
}

- (void)_setDoseQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_doseQuantity, a3);
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (void)_setScheduledDate:(id)a3
{
  NSDate *v4;
  NSDate *scheduledDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  scheduledDate = self->_scheduledDate;
  self->_scheduledDate = v4;

}

- (int64_t)status
{
  return self->_status;
}

- (void)_setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)isLastScheduledDose
{
  void *v2;
  void *v3;
  char v4;

  -[HKObject metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_HKPrivateMetadataKeyIsLastScheduledDose"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKMedicationDoseEvent;
  -[HKSample _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    if (self->_medicationIdentifier)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("%@: medicationIdentifier must not be nil"), self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_6:

  return v8;
}

+ (id)_metadataWithSyncIdentifier:(id)a3 syncVersion:(id)a4 isLastScheduledDose:(BOOL)a5
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v15[0] = CFSTR("HKMetadataKeySyncIdentifier");
    v15[1] = CFSTR("HKMetadataKeySyncVersion");
    v16[0] = a3;
    v16[1] = a4;
    v15[2] = CFSTR("_HKPrivateMetadataKeyIsLastScheduledDose");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a4;
    v8 = a3;
    objc_msgSend(v6, "numberWithBool:", 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v16[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13[0] = CFSTR("HKMetadataKeySyncIdentifier");
    v13[1] = CFSTR("HKMetadataKeySyncVersion");
    v14[0] = a3;
    v14[1] = a4;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v8 = a4;
    v9 = a3;
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_doseQuantity, 0);
  objc_storeStrong((id *)&self->_scheduledDoseQuantity, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
  objc_storeStrong((id *)&self->_medicationUUID, 0);
  objc_storeStrong((id *)&self->_scheduleItemIdentifier, 0);
}

+ (id)medicationDoseEventWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 logOrigin:(int64_t)a8 scheduleItemIdentifier:(id)a9 medicationIdentifier:(id)a10 scheduledDoseQuantity:(double)a11 doseQuantity:(double)a12 scheduledDate:(id)a13 status:(int64_t)a14 medicationUuid:(id)a15
{
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v28;
  id v29;
  id v31;
  void *v33;
  id v34;
  void *v37;

  v20 = (void *)MEMORY[0x1E0CB37E8];
  v34 = a15;
  v21 = a13;
  v31 = a10;
  v28 = a9;
  v29 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  objc_msgSend(v20, "numberWithDouble:", a11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(a1, "_newMedicationDoseEventWithType:startDate:endDate:device:metadata:logOrigin:scheduleItemIdentifier:medicationUUID:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:status:config:", v25, v24, v23, v22, v29, a8, v28, v34, v31, v33, v26, v21, a14, 0);

  return v37;
}

@end
