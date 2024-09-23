@implementation HKSampleType

- (BOOL)hk_validateMetadata:(id)a3 sample:(id)a4 error:(id *)a5
{
  id v7;
  int64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  BOOL v12;

  v7 = a3;
  v8 = -[HKObjectType code](self, "code");
  if (v8 == 95)
  {
    if (!v7
      || (objc_msgSend(v7, "objectForKey:", CFSTR("HKMenstrualCycleStart")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      v10 = CFSTR("Type %@ is missing a required metadata key (required keys: HKMetadataKeyMenstrualCycleStart)");
      goto LABEL_10;
    }
  }
  else if (v8 == 125)
  {
    if (!v7
      || (objc_msgSend(v7, "objectForKey:", CFSTR("HKInsulinDeliveryReason")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v9))
    {
      v10 = CFSTR("Type %@ is missing a required metadata key (required keys: HKMetadataKeyInsulinDeliveryReason)");
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, v10, self);
      v12 = 0;
      goto LABEL_11;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

+ (id)medicalRecordTypes
{
  return +[HKSampleType medicalRecordTypesWithOptions:](HKSampleType, "medicalRecordTypesWithOptions:", 0);
}

+ (id)medicalRecordTypesWithOptions:(unint64_t)a3
{
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
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  _QWORD v23[12];

  v20 = a3;
  v23[11] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  +[HKAllergyRecordType allergyRecordType](HKAllergyRecordType, "allergyRecordType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v22;
  +[HKClinicalNoteRecordType clinicalNoteRecordType](HKClinicalNoteRecordType, "clinicalNoteRecordType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v21;
  +[HKConditionRecordType conditionRecordType](HKConditionRecordType, "conditionRecordType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v19;
  +[HKCoverageRecordType coverageRecordType](HKCoverageRecordType, "coverageRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v4;
  +[HKDiagnosticTestReportType diagnosticTestReportType](HKDiagnosticTestReportType, "diagnosticTestReportType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v5;
  +[HKDiagnosticTestResultType diagnosticTestResultType](HKDiagnosticTestResultType, "diagnosticTestResultType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v6;
  +[HKMedicationDispenseRecordType medicationDispenseRecordType](HKMedicationDispenseRecordType, "medicationDispenseRecordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v7;
  +[HKMedicationOrderType medicationOrderType](HKMedicationOrderType, "medicationOrderType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v8;
  +[HKMedicationRecordType medicationRecordType](HKMedicationRecordType, "medicationRecordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v9;
  +[HKProcedureRecordType procedureRecordType](HKProcedureRecordType, "procedureRecordType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v10;
  +[HKVaccinationRecordType vaccinationRecordType](HKVaccinationRecordType, "vaccinationRecordType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v20 & 1) == 0)
  {
    if ((v20 & 4) == 0)
      goto LABEL_3;
LABEL_7:
    +[HKSignedClinicalDataRecordType signedClinicalDataRecordType](HKSignedClinicalDataRecordType, "signedClinicalDataRecordType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v18);

    if ((v20 & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  +[HKUnknownRecordType unknownRecordType](HKUnknownRecordType, "unknownRecordType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v17);

  if ((v20 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v20 & 2) != 0)
  {
LABEL_4:
    +[HKAccountOwnerType accountOwnerType](HKAccountOwnerType, "accountOwnerType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
LABEL_5:
  v15 = (void *)objc_msgSend(v13, "copy");

  return v15;
}

+ (id)_sampleTypeWithCode:(int64_t)a3
{
  void *v3;
  id v4;

  objc_msgSend(a1, "dataTypeWithCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSTimeInterval)maximumAllowedDuration
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = HKMaximumSampleDurationForType(-[HKObjectType code](self, "code"));
  if (v3 == -1.0)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    -[HKObjectType identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Data type %@ is not duration restricted"), v6);

  }
  return v3;
}

- (NSTimeInterval)minimumAllowedDuration
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = HKMinimumSampleDurationForType(-[HKObjectType code](self, "code"));
  if (v3 == -1.0)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    -[HKObjectType identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Data type %@ is not duration restricted"), v6);

  }
  return v3;
}

- (BOOL)isMinimumDurationRestricted
{
  return HKMinimumSampleDurationForType(-[HKObjectType code](self, "code")) > 0.0;
}

- (BOOL)isMaximumDurationRestricted
{
  return HKMaximumSampleDurationForType(-[HKObjectType code](self, "code")) != -1.0;
}

- (BOOL)allowsRecalibrationForEstimates
{
  return -[HKObjectType code](self, "code") == 183;
}

- (BOOL)_validateStartDate:(double)a3 endDate:(double)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  BOOL result;
  void *v13;
  double v14;
  double v15;
  int64_t v16;
  uint64_t v17;

  if (a3 == 2.22507386e-308 || a4 == 2.22507386e-308)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Missing start or end time"), v17);
    return 0;
  }
  if (a3 > a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_assignError:code:format:", a5, 3, CFSTR("startDate (%@) cannot occur after endDate (%@)"), v9, v10);

    return 0;
  }
  if (!HKProgramSDKAtLeast(0x7E41201FFFFFFFFLL, a2))
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = v14;

  if (v15 > a4)
    return 1;
  v16 = -[HKObjectType code](self, "code");
  result = 1;
  if ((unint64_t)(v16 - 191) >= 3 && v16 != 109 && v16 != 257)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Type %@ can not have endDate of NSDate.distantFuture"), objc_opt_class());
    return 0;
  }
  return result;
}

- (id)_earliestAllowedStartDateForSampleOverlappingDate:(id)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  if (-[HKSampleType isMaximumDurationRestricted](self, "isMaximumDurationRestricted"))
  {
    -[HKSampleType maximumAllowedDuration](self, "maximumAllowedDuration");
    objc_msgSend(v4, "dateByAddingTimeInterval:", -v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_supportsRelativeDataCalculation
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HKSampleType _rollingBaselineConfiguration](self, "_rollingBaselineConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKSampleType _unitForChangeInCanonicalUnit](self, "_unitForChangeInCanonicalUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_rollingBaselineConfiguration
{
  if (-[HKObjectType code](self, "code") == 256)
    return -[HKRollingBaselineConfiguration initWithMinimumSampleCount:maximumSampleCount:maximumWindowDuration:options:]([HKRollingBaselineConfiguration alloc], "initWithMinimumSampleCount:maximumSampleCount:maximumWindowDuration:options:", 5, 50, 1, 31536000.0);
  else
    return 0;
}

- (id)_unitForChangeInCanonicalUnit
{
  void *v2;

  if (-[HKObjectType code](self, "code") == 256)
  {
    +[HKUnit _changeInDegreeCelsiusUnit](HKUnit, "_changeInDegreeCelsiusUnit");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)supportsAttachments
{
  return -[HKObjectType code](self, "code") == 257;
}

- (BOOL)canAttachFileOfType:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  BOOL v21;
  id v22;
  void *v23;

  v8 = a3;
  if (-[HKObjectType code](self, "code") != 257)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", CFSTR("heic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "conformsToType:", v9);

  if (v10)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", CFSTR("img"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "conformsToType:", v11);

  if (v12)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", CFSTR("jpeg"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "conformsToType:", v13);

  if (v14)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", CFSTR("pdf"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "conformsToType:", v15);

  if (v16)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", CFSTR("png"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v8, "conformsToType:", v17);

  if (v18
    || (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", CFSTR("tiff")),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v8, "conformsToType:", v19),
        v19,
        v20))
  {
LABEL_8:
    v21 = _HKValidateFileSize(a4, a5);
  }
  else
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Content Type is not supported"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v22);
      else
        _HKLogDroppedError(v22);
    }

    v21 = 0;
  }

  return v21;
}

@end
