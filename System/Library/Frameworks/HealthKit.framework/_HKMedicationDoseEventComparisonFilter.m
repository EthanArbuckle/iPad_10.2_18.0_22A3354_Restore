@implementation _HKMedicationDoseEventComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("status")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("medicationIdentifier")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("hashedMedicationIdentifier")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("scheduleItemIdentifier"));
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("status")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v19;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("medicationIdentifier")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("scheduleItemIdentifier")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v16;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("hashedMedicationIdentifier")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKMedicationDoseEventComparisonFilter.m"), 61, CFSTR("Unreachable code has been executed"));

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v13;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, 3, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v7;
  BOOL v9;
  void *v11;

  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("status")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("medicationIdentifier")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("hashedMedicationIdentifier")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("scheduleItemIdentifier")))
  {
    v9 = a3 == 10 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKMedicationDoseEventComparisonFilter.m"), 77, CFSTR("Unreachable code has been executed"));

    v9 = 0;
  }

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  void *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____HKMedicationDoseEventComparisonFilter;
  if (!objc_msgSendSuper2(&v19, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v13, v14, a5, a6, a7))goto LABEL_8;
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("status"))
    && (objc_msgSend(v14, "isEqualToString:", CFSTR("medicationIdentifier")) & 1) == 0
    && !objc_msgSend(v14, "isEqualToString:", CFSTR("scheduleItemIdentifier"))
    && !objc_msgSend(v14, "isEqualToString:", CFSTR("hashedMedicationIdentifier")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKMedicationDoseEventComparisonFilter.m"), 103, CFSTR("Unreachable code has been executed"));

LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  v15 = objc_opt_class();
  v16 = HKIsValueOrContainerValidForOperatorType(a5, v13, v15, (uint64_t)a7);
LABEL_9:

  return v16;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("status")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("medicationIdentifier")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("hashedMedicationIdentifier")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("scheduleItemIdentifier")) & 1) != 0)
  {
    v6 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKMedicationDoseEventComparisonFilter.m"), 124, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKMedicationDoseEventComparisonFilter;
    v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  HKMedicationIdentifier *v11;
  void *v12;
  HKMedicationIdentifier *v13;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    switch(-[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue"))
    {
      case 0:
        v7 = -[_HKMedicationDoseEventComparisonFilter _acceptsMedicationDoseEventWithStatus:](self, "_acceptsMedicationDoseEventWithStatus:", objc_msgSend(v6, "status"));
        break;
      case 1:
        objc_msgSend(v6, "medicationIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[_HKMedicationDoseEventComparisonFilter _acceptsMedicationDoseEventWithMedicationIdentifier:](self, "_acceptsMedicationDoseEventWithMedicationIdentifier:", v9);
        goto LABEL_9;
      case 2:
        v11 = [HKMedicationIdentifier alloc];
        objc_msgSend(v6, "medicationIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HKMedicationIdentifier initWithSemanticIdentifierString:](v11, "initWithSemanticIdentifierString:", v12);
        v7 = -[_HKMedicationDoseEventComparisonFilter _acceptsMedicationDoseEventWithHashedMedicationIdentifier:](self, "_acceptsMedicationDoseEventWithHashedMedicationIdentifier:", v13);

        break;
      case 3:
        objc_msgSend(v6, "scheduleItemIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[_HKMedicationDoseEventComparisonFilter _acceptsMedicationDoseEventWithScheduleItemIdentifier:](self, "_acceptsMedicationDoseEventWithScheduleItemIdentifier:", v9);
LABEL_9:
        v7 = v10;

        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKMedicationDoseEventComparisonFilter.m"), 142, CFSTR("Unreachable code has been executed"));

        v7 = 0;
        break;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_acceptsMedicationDoseEventWithStatus:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v11;

  v5 = -[_HKComparisonFilter operatorType](self, "operatorType");
  -[_HKComparisonFilter value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    return v9;
  }
  else
  {
    v11 = HKCompareIntegers(a3, objc_msgSend(v6, "integerValue"));

    return HKComparisonResultMatchesPredicateOperator(v11, -[_HKComparisonFilter operatorType](self, "operatorType"));
  }
}

- (BOOL)_acceptsMedicationDoseEventWithMedicationIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v10;

  v4 = a3;
  v5 = -[_HKComparisonFilter operatorType](self, "operatorType");
  -[_HKComparisonFilter value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 10)
  {
    v8 = objc_msgSend(v6, "containsObject:", v4);

    return v8;
  }
  else
  {
    v10 = objc_msgSend(v6, "compare:", v4);

    return HKComparisonResultMatchesPredicateOperator(v10, -[_HKComparisonFilter operatorType](self, "operatorType"));
  }
}

- (BOOL)_acceptsMedicationDoseEventWithHashedMedicationIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;

  v4 = a3;
  v5 = -[_HKComparisonFilter operatorType](self, "operatorType");
  -[_HKComparisonFilter value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 10)
  {
    v8 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    v9 = objc_msgSend(v6, "compare:", v4);

    v8 = HKComparisonResultMatchesPredicateOperator(v9, -[_HKComparisonFilter operatorType](self, "operatorType"));
  }

  return v8;
}

- (BOOL)_acceptsMedicationDoseEventWithScheduleItemIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v10;

  v4 = a3;
  v5 = -[_HKComparisonFilter operatorType](self, "operatorType");
  -[_HKComparisonFilter value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 10)
  {
    v8 = objc_msgSend(v6, "containsObject:", v4);

    return v8;
  }
  else
  {
    v10 = objc_msgSend(v6, "compare:", v4);

    return HKComparisonResultMatchesPredicateOperator(v10, -[_HKComparisonFilter operatorType](self, "operatorType"));
  }
}

@end
