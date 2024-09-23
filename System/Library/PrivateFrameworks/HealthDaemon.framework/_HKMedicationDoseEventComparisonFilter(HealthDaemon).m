@implementation _HKMedicationDoseEventComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id result;
  void *v22;
  void *v23;

  v3 = a1;
  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB58A8]);

  if (v5)
  {
    if (v3)
    {
      v6 = objc_msgSend(v3, "operatorType");
      objc_msgSend(v3, "value");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v6 == 10)
        HDMedicationDoseEventEntityPredicateForStatuses(v7);
      else
        HDMedicationDoseEventEntityPredicateForStatus(v7, objc_msgSend(v3, "operatorType") == 4);
LABEL_18:
      result = (id)objc_claimAutoreleasedReturnValue();
      v23 = result;

      return v23;
    }
  }
  else
  {
    objc_msgSend(v3, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB5820]);

    if (v10)
    {
      if (v3)
      {
        v11 = objc_msgSend(v3, "operatorType");
        objc_msgSend(v3, "value");
        v12 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v12;
        if (v11 == 10)
          HDMedicationDoseEventEntityPredicateForMedicationIdentifiers(v12);
        else
          HDMedicationDoseEventEntityPredicateForMedicationIdentifier(v12, objc_msgSend(v3, "operatorType") == 4);
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(v3, "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB5800]);

      if (v14)
      {
        if (v3)
        {
          v15 = objc_msgSend(v3, "operatorType");
          objc_msgSend(v3, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v16;
          if (v15 == 10)
            HDMedicationDoseEventEntityPredicateForHashedMedicationIdentifiers(v16);
          else
            HDMedicationDoseEventEntityPredicateForHashedMedicationIdentifier(v16, objc_msgSend(v3, "operatorType") == 4);
          goto LABEL_18;
        }
      }
      else
      {
        objc_msgSend(v3, "keyPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB5868]);

        if (v18)
        {
          if (v3)
          {
            v19 = objc_msgSend(v3, "operatorType");
            objc_msgSend(v3, "value");
            v20 = objc_claimAutoreleasedReturnValue();
            v8 = (void *)v20;
            if (v19 == 10)
              HDMedicationDoseEventEntityPredicateForScheduleItemIdentifiers(v20);
            else
              HDMedicationDoseEventEntityPredicateForScheduleItemIdentifier(v20, objc_msgSend(v3, "operatorType") == 4);
            goto LABEL_18;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("_HKMedicationDoseEventComparisonFilter+HealthDaemon.m"), 39, CFSTR("Unreachable code has been executed"));

          objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  return v3;
}

@end
