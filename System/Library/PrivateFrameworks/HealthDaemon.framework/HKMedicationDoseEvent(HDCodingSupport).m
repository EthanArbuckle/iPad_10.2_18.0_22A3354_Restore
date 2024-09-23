@implementation HKMedicationDoseEvent(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend([a1 alloc], "_init");
    if (objc_msgSend(v5, "applyToObject:", v6))
    {
      v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = 0;
      else
        v10 = v6;
      v11 = v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (HDCodableMedicationDoseEvent)codableRepresentationForSync
{
  HDCodableMedicationDoseEvent *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v2 = objc_alloc_init(HDCodableMedicationDoseEvent);
  v16.receiver = a1;
  v16.super_class = (Class)&off_1EF21FC18;
  objc_msgSendSuper2(&v16, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationDoseEvent setSample:](v2, "setSample:", v3);

  -[HDCodableMedicationDoseEvent setLogOrigin:](v2, "setLogOrigin:", objc_msgSend(a1, "logOrigin"));
  objc_msgSend(a1, "scheduleItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "scheduleItemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicationDoseEvent setScheduleItemIdentifier:](v2, "setScheduleItemIdentifier:", v5);

  }
  objc_msgSend(a1, "medicationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_dataForUUIDBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationDoseEvent setMedicationUuid:](v2, "setMedicationUuid:", v7);

  objc_msgSend(a1, "medicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationDoseEvent setMedicationIdentifier:](v2, "setMedicationIdentifier:", v8);
  objc_msgSend(a1, "scheduledDoseQuantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "scheduledDoseQuantity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    -[HDCodableMedicationDoseEvent setScheduledDoseQuantity:](v2, "setScheduledDoseQuantity:");

  }
  objc_msgSend(a1, "doseQuantity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "doseQuantity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    -[HDCodableMedicationDoseEvent setDoseQuantity:](v2, "setDoseQuantity:");

  }
  objc_msgSend(a1, "scheduledDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(a1, "scheduledDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicationDoseEvent setScheduledDate:](v2, "setScheduledDate:");

  }
  -[HDCodableMedicationDoseEvent setStatus:](v2, "setStatus:", objc_msgSend(a1, "status"));

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addMedicationDoseEvent:", v5);

  return v5 != 0;
}

@end
