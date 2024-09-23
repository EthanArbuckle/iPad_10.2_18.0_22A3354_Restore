@implementation HKQueryDescriptor

+ (HKQueryDescriptor)queryDescriptorWithSampleType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSampleType:predicate:", v4, 0);

  return (HKQueryDescriptor *)v5;
}

+ (HKQueryDescriptor)queryDescriptorWithSampleType:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSampleType:predicate:", v7, v6);

  return (HKQueryDescriptor *)v8;
}

- (HKQueryDescriptor)init
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

- (HKQueryDescriptor)initWithSampleType:(HKSampleType *)sampleType predicate:(NSPredicate *)predicate
{
  HKSampleType *v6;
  NSPredicate *v7;
  HKQueryDescriptor *v8;
  uint64_t v9;
  HKSampleType *v10;
  uint64_t v11;
  NSPredicate *v12;
  void *v13;
  uint64_t v14;
  _HKFilter *filter;
  objc_super v17;

  v6 = sampleType;
  v7 = predicate;
  v17.receiver = self;
  v17.super_class = (Class)HKQueryDescriptor;
  v8 = -[HKQueryDescriptor init](&v17, sel_init);
  if (v8)
  {
    v9 = -[HKSampleType copy](v6, "copy");
    v10 = v8->_sampleType;
    v8->_sampleType = (HKSampleType *)v9;

    v11 = -[NSPredicate copy](v7, "copy");
    v12 = v8->_predicate;
    v8->_predicate = (NSPredicate *)v11;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8->_sampleType);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPredicate hk_filterRepresentationForDataTypes:](v7, "hk_filterRepresentationForDataTypes:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    filter = v8->_filter;
    v8->_filter = (_HKFilter *)v14;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKQueryDescriptor sampleType](self, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKQueryDescriptor _filter](self, "_filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKQueryDescriptor *v4;
  HKQueryDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (HKQueryDescriptor *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKQueryDescriptor sampleType](self, "sampleType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQueryDescriptor sampleType](v5, "sampleType");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKQueryDescriptor sampleType](v5, "sampleType");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        -[HKQueryDescriptor sampleType](self, "sampleType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKQueryDescriptor sampleType](v5, "sampleType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_15;
      }
      -[HKQueryDescriptor _filter](self, "_filter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQueryDescriptor _filter](v5, "_filter");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

LABEL_17:
        v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      -[HKQueryDescriptor _filter](v5, "_filter");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HKQueryDescriptor _filter](self, "_filter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKQueryDescriptor _filter](v5, "_filter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKQueryDescriptor sampleType](self, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQueryDescriptor predicate](self, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@, Predicate: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQueryDescriptor)initWithCoder:(id)a3
{
  id v4;
  HKSampleType *v5;
  HKSampleType *sampleType;
  HKQueryDescriptor *v7;
  uint64_t v8;
  _HKFilter *filter;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _HKFilter *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SampleType"));
  v5 = (HKSampleType *)objc_claimAutoreleasedReturnValue();
  sampleType = self->_sampleType;
  self->_sampleType = v5;

  v7 = -[HKQueryDescriptor initWithSampleType:predicate:](self, "initWithSampleType:predicate:", self->_sampleType, 0);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Filter"));
    v8 = objc_claimAutoreleasedReturnValue();
    filter = v7->_filter;
    v7->_filter = (_HKFilter *)v8;

    if (!v7->_filter)
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      v18[2] = objc_opt_class();
      v18[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("Predicate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7->_sampleType);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hk_filterRepresentationForDataTypes:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v7->_filter;
        v7->_filter = (_HKFilter *)v15;

      }
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKQueryDescriptor sampleType](self, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SampleType"));

  -[HKQueryDescriptor _filter](self, "_filter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Filter"));

}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (_HKFilter)_filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

+ (id)medicalRecordDescriptionsWithPredicate:(id)a3 futureMigrationsEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a4;
  v5 = a3;
  if (v4)
    v6 = 8;
  else
    v6 = 0;
  +[HKSampleType medicalRecordTypesWithOptions:](HKSampleType, "medicalRecordTypesWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__HKQueryDescriptor_HealthRecords__medicalRecordDescriptionsWithPredicate_futureMigrationsEnabled___block_invoke;
  v11[3] = &unk_1E37F67A0;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "hk_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

HKQueryDescriptor *__99__HKQueryDescriptor_HealthRecords__medicalRecordDescriptionsWithPredicate_futureMigrationsEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", a2, *(_QWORD *)(a1 + 32));
}

+ (id)allergiesDescriptions
{
  return (id)objc_msgSend(a1, "allergiesDescriptionsWithPredicate:", 0);
}

+ (id)allergiesDescriptionsWithPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKAllergyRecordType allergyRecordType](HKAllergyRecordType, "allergyRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)clinicalNotesDescriptions
{
  return (id)objc_msgSend(a1, "clinicalNotesDescriptionsWithPredicate:", 0);
}

+ (id)clinicalNotesDescriptionsWithPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKClinicalNoteRecordType clinicalNoteRecordType](HKClinicalNoteRecordType, "clinicalNoteRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)conditionsDescriptions
{
  return (id)objc_msgSend(a1, "conditionsDescriptionsWithPredicate:", 0);
}

+ (id)conditionsDescriptionsWithPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKConditionRecordType conditionRecordType](HKConditionRecordType, "conditionRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)coverageDescriptions
{
  return (id)objc_msgSend(a1, "coverageDescriptionsWithPredicate:", 0);
}

+ (id)coverageDescriptionsWithPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKCoverageRecordType coverageRecordType](HKCoverageRecordType, "coverageRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)immunizationsDescriptions
{
  return (id)objc_msgSend(a1, "immunizationsDescriptionsWithPredicate:", 0);
}

+ (id)immunizationsDescriptionsWithPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKVaccinationRecordType vaccinationRecordType](HKVaccinationRecordType, "vaccinationRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)labsDescriptions
{
  return (id)objc_msgSend(a1, "labsDescriptionsWithPredicate:", 0);
}

+ (id)labsDescriptionsWithPredicate:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKQuery predicateForDiagnosticTestResultCategory:](HKQuery, "predicateForDiagnosticTestResultCategory:", CFSTR("laboratory"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    v16[0] = v4;
    v16[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  +[HKDiagnosticTestReportType diagnosticTestReportType](HKDiagnosticTestReportType, "diagnosticTestReportType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  +[HKDiagnosticTestResultType diagnosticTestResultType](HKDiagnosticTestResultType, "diagnosticTestResultType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)medicationsDescriptions
{
  return (id)objc_msgSend(a1, "medicationsDescriptionsWithPredicate:", 0);
}

+ (id)medicationsDescriptionsWithPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKMedicationDispenseRecordType medicationDispenseRecordType](HKMedicationDispenseRecordType, "medicationDispenseRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicationOrderType medicationOrderType](HKMedicationOrderType, "medicationOrderType", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  +[HKMedicationRecordType medicationRecordType](HKMedicationRecordType, "medicationRecordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)proceduresDescriptions
{
  return (id)objc_msgSend(a1, "proceduresDescriptionsWithPredicate:", 0);
}

+ (id)proceduresDescriptionsWithPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKProcedureRecordType procedureRecordType](HKProcedureRecordType, "procedureRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)vitalsDescriptions
{
  return (id)objc_msgSend(a1, "vitalsDescriptionsWithPredicate:", 0);
}

+ (id)vitalsDescriptionsWithPredicate:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKQuery predicateForDiagnosticTestResultCategory:](HKQuery, "predicateForDiagnosticTestResultCategory:", CFSTR("vital-signs"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    v14[0] = v4;
    v14[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  +[HKDiagnosticTestResultType diagnosticTestResultType](HKDiagnosticTestResultType, "diagnosticTestResultType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQueryDescriptor queryDescriptorWithSampleType:predicate:](HKQueryDescriptor, "queryDescriptorWithSampleType:predicate:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
