@implementation HDHealthRecordsExtractionRuleTransformer

+ (id)transformValue:(id)a3 rootResource:(id)a4 extractionRule:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "FHIRVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "FHIRRelease");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == (void *)*MEMORY[0x24BDD2BF0])
  {
    objc_msgSend(a1, "_transformDSTU2Value:rootResource:extractionRule:error:", v10, v11, v12, a6);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v17 = (void *)v18;
    goto LABEL_7;
  }
  if (v14 == (void *)*MEMORY[0x24BDD2C00])
  {
    objc_msgSend(a1, "_transformR4Value:rootResource:extractionRule:error:", v10, v11, v12, a6);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v11, "FHIRVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hk_assignError:code:format:", a6, 3, CFSTR("Unsupported FHIR version for extraction transforms: %@"), v16);

  v17 = 0;
LABEL_7:

  return v17;
}

+ (id)_transformDSTU2Value:(id)a3 rootResource:(id)a4 extractionRule:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_class();
  v26 = v12;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthRecordsExtractionRuleTransformer.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resource isKindOfClass:[HDOriginalFHIRResourceObject class]]"));

  }
  objc_msgSend(MEMORY[0x24BDD3BA0], "primaryDSTU2Version");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v13, "transforms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithRange")) & 1) == 0)
        {
          if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithRatio")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithRatio:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithRatio:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithQuantity")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithQuantity:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithQuantity:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithDateTime")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithDateTime:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithDateTime:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithPeriod")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithPeriod:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithPeriod:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithTime")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithTime:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithTime:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithString")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithString:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithString:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("localeFromLanguage")))
          {
            +[HDHealthRecordsExtractionUtilities localeFromLanguage:error:](HDHealthRecordsExtractionUtilities, "localeFromLanguage:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingsArrayWithCodeableConcept")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingsArrayWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "medicalCodingsArrayWithCodeableConcept:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingCollectionWithCodeableConcept")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingCollectionWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "medicalCodingCollectionWithCodeableConcept:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingCollectionArrayWithCodeableConcepts")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingCollectionArrayWithCodeableConcepts:error:](HDHealthRecordsExtractionUtilities, "medicalCodingCollectionArrayWithCodeableConcepts:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingsWithCodeableConcept")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingsWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "medicalCodingsWithCodeableConcept:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingsWithCodeableConcepts")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingsWithCodeableConcepts:error:](HDHealthRecordsExtractionUtilities, "medicalCodingsWithCodeableConcepts:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("referenceRangesWithObservationReferenceRanges")))
          {
            +[HDHealthRecordsExtractionUtilities referenceRangesWithObservationReferenceRanges:error:](HDHealthRecordsExtractionUtilities, "referenceRangesWithObservationReferenceRanges:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingsWithReference")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingsWithReference:error:](HDHealthRecordsExtractionUtilities, "medicalCodingsWithReference:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithCodeableConcept")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithCodeableConcept:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithObservationComponents")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithObservationComponents:FHIRVersion:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithObservationComponents:FHIRVersion:error:", v11, v27, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueCollectionWithObservationValues")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithObservationValues:FHIRVersion:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithObservationValues:FHIRVersion:error:", v11, v27, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueWithAbatementValue")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueWithAbatementValue:error:](HDHealthRecordsExtractionUtilities, "inspectableValueWithAbatementValue:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValueWithOnsetValue")))
          {
            +[HDHealthRecordsExtractionUtilities inspectableValueWithOnsetValue:error:](HDHealthRecordsExtractionUtilities, "inspectableValueWithOnsetValue:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithCoding")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithCoding:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithCoding:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithDiagnosticReportStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithDiagnosticReportStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithDiagnosticReportStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithMedicationDispenseStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationDispenseStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithMedicationDispenseStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithMedicationOrderStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationOrderStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithMedicationOrderStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithProcedureStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithProcedureStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithProcedureStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalDateWithDateTimeString")))
          {
            +[HDHealthRecordsExtractionUtilities medicalDateWithDateTimeString:error:](HDHealthRecordsExtractionUtilities, "medicalDateWithDateTimeString:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalDateWithDateString")))
          {
            +[HDHealthRecordsExtractionUtilities medicalDateWithDateString:error:](HDHealthRecordsExtractionUtilities, "medicalDateWithDateString:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalDateWithInstantString")))
          {
            +[HDHealthRecordsExtractionUtilities medicalDateWithInstantString:error:](HDHealthRecordsExtractionUtilities, "medicalDateWithInstantString:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("identifiersWithReferences")))
          {
            +[HDHealthRecordsExtractionUtilities identifiersWithReferences:parentResource:error:](HDHealthRecordsExtractionUtilities, "identifiersWithReferences:parentResource:error:", v11, v26, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithAllergyIntoleranceStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithAllergyIntoleranceStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithAllergyIntoleranceCategoryCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceCategoryCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithAllergyIntoleranceCategoryCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithAllergyIntoleranceCriticalityCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceCriticalityCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithAllergyIntoleranceCriticalityCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithAllergyIntoleranceTypeCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceTypeCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithAllergyIntoleranceTypeCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithConditionClinicalStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithConditionClinicalStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithConditionClinicalStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithConditionVerificationStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithConditionVerificationStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithConditionVerificationStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithMedicationAdminStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationAdminStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithMedicationAdminStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("preferredNameWithHumanNames")))
          {
            +[HDHealthRecordsExtractionUtilities preferredNameWithHumanNames:FHIRVersion:error:](HDHealthRecordsExtractionUtilities, "preferredNameWithHumanNames:FHIRVersion:error:", v11, v27, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("enteredInErrorWithStatusString")))
          {
            +[HDHealthRecordsExtractionUtilities enteredInErrorWithStatusString:error:](HDHealthRecordsExtractionUtilities, "enteredInErrorWithStatusString:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("allergyReactionsWithAllergyIntoleranceReaction")))
          {
            +[HDHealthRecordsExtractionUtilities allergyReactionsWithAllergyIntoleranceReaction:error:](HDHealthRecordsExtractionUtilities, "allergyReactionsWithAllergyIntoleranceReaction:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("codedQuantityWithQuantity")))
          {
            +[HDHealthRecordsExtractionUtilities codedQuantityWithQuantity:error:](HDHealthRecordsExtractionUtilities, "codedQuantityWithQuantity:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithObservationStatus")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithObservationStatus:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithObservationStatus:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithMedicationStatementStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationStatementStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithMedicationStatementStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("earliestDosageDateWithMedicationStatementDosageArray")))
          {
            +[HDHealthRecordsExtractionUtilities earliestDosageDateWithMedicationStatementDosageArray:error:](HDHealthRecordsExtractionUtilities, "earliestDosageDateWithMedicationStatementDosageArray:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("earliestDosageDateWithMedicationOrderDosageArray")))
          {
            +[HDHealthRecordsExtractionUtilities earliestDosageDateWithMedicationOrderDosageArray:error:](HDHealthRecordsExtractionUtilities, "earliestDosageDateWithMedicationOrderDosageArray:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("earliestDosageDateWithMedicationDispenseDosageArray")))
          {
            +[HDHealthRecordsExtractionUtilities earliestDosageDateWithMedicationDispenseDosageArray:error:](HDHealthRecordsExtractionUtilities, "earliestDosageDateWithMedicationDispenseDosageArray:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicationDosagesWithStatementDosageArray")))
          {
            +[HDHealthRecordsExtractionUtilities medicationDosagesWithStatementDosageInstructionArray:error:](HDHealthRecordsExtractionUtilities, "medicationDosagesWithStatementDosageInstructionArray:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicationDosagesWithDispenseDosageInstructionArray")))
          {
            +[HDHealthRecordsExtractionUtilities medicationDosagesWithDispenseDosageInstructionArray:error:](HDHealthRecordsExtractionUtilities, "medicationDosagesWithDispenseDosageInstructionArray:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicationDosagesWithOrderDosageInstructionArray")))
          {
            +[HDHealthRecordsExtractionUtilities medicationDosagesWithOrderDosageInstructionArray:error:](HDHealthRecordsExtractionUtilities, "medicationDosagesWithOrderDosageInstructionArray:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("observationCategoryWithObservationCategory")))
          {
            +[HDHealthRecordsExtractionUtilities observationCategoryWithObservationCategory:error:](HDHealthRecordsExtractionUtilities, "observationCategoryWithObservationCategory:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("referencedMedicationStatementActorTypeWithString")))
          {
            +[HDHealthRecordsExtractionUtilities referencedMedicationStatementActorTypeWithString:error:](HDHealthRecordsExtractionUtilities, "referencedMedicationStatementActorTypeWithString:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("stringWithRTF")))
          {
            +[HDHealthRecordsExtractionUtilities stringWithRTF:error:](HDHealthRecordsExtractionUtilities, "stringWithRTF:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithDeviceStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithDeviceStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithDeviceStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithCarePlanStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithCarePlanStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithCarePlanStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v19, "isEqualToString:", CFSTR("medicalCodingWithGoalStatusCode")))
          {
            +[HDHealthRecordsExtractionUtilities medicalCodingWithGoalStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithGoalStatusCode:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!objc_msgSend(v19, "isEqualToString:", CFSTR("wrapInArray")))
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported DSTU2 extraction transform '%@'"), v19);
              objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
              v25 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v25);
            }
            +[HDHealthRecordsExtractionUtilities wrapInArray:error:](HDHealthRecordsExtractionUtilities, "wrapInArray:error:", v11, a6);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          v21 = (void *)v20;

          v11 = v21;
        }
        if (!v11)
        {

          v22 = 0;
          goto LABEL_123;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v16)
        continue;
      break;
    }
  }

  v22 = v11;
LABEL_123:

  return v22;
}

+ (id)_transformR4Value:(id)a3 rootResource:(id)a4 extractionRule:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthRecordsExtractionRuleTransformer.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resource isKindOfClass:[HDOriginalFHIRResourceObject class]]"));

  }
  objc_msgSend(MEMORY[0x24BDD3BA0], "primaryR4Version");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v13, "transforms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
LABEL_5:
    v18 = 0;
    v19 = v11;
    while (1)
    {
      if (*(_QWORD *)v28 != v17)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v18);
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("codedQuantityWithQuantity")))
      {
        +[HDHealthRecordsExtractionUtilities codedQuantityWithQuantity:error:](HDHealthRecordsExtractionUtilities, "codedQuantityWithQuantity:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("enteredInErrorWithStatusString")))
      {
        +[HDHealthRecordsExtractionUtilities enteredInErrorWithStatusString:error:](HDHealthRecordsExtractionUtilities, "enteredInErrorWithStatusString:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("identifierFromReference")))
      {
        +[HDHealthRecordsExtractionUtilities identifierFromReference:error:](HDHealthRecordsExtractionUtilities, "identifierFromReference:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("localeFromLanguage")))
      {
        +[HDHealthRecordsExtractionUtilities localeFromLanguage:error:](HDHealthRecordsExtractionUtilities, "localeFromLanguage:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingCollectionWithCodeableConcept")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingCollectionWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "medicalCodingCollectionWithCodeableConcept:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingCollectionArrayWithCodeableConcepts")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingCollectionArrayWithCodeableConcepts:error:](HDHealthRecordsExtractionUtilities, "medicalCodingCollectionArrayWithCodeableConcepts:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingsWithCodeableConcept")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingsWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "medicalCodingsWithCodeableConcept:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingsWithCodeableConcepts")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingsWithCodeableConcepts:error:](HDHealthRecordsExtractionUtilities, "medicalCodingsWithCodeableConcepts:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingsArrayWithCodeableConcept")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingsArrayWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "medicalCodingsArrayWithCodeableConcept:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithEventStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithEventStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithEventStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalDateWithDateString")))
      {
        +[HDHealthRecordsExtractionUtilities medicalDateWithDateString:error:](HDHealthRecordsExtractionUtilities, "medicalDateWithDateString:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalDateWithDateTimeString")))
      {
        +[HDHealthRecordsExtractionUtilities medicalDateWithDateTimeString:error:](HDHealthRecordsExtractionUtilities, "medicalDateWithDateTimeString:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalDateWithInstantString")))
      {
        +[HDHealthRecordsExtractionUtilities medicalDateWithInstantString:error:](HDHealthRecordsExtractionUtilities, "medicalDateWithInstantString:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("wrapInArray")))
      {
        +[HDHealthRecordsExtractionUtilities wrapInArray:error:](HDHealthRecordsExtractionUtilities, "wrapInArray:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("allergyReactionsWithAllergyIntoleranceReaction")))
      {
        +[HDHealthRecordsExtractionUtilities allergyReactionsWithAllergyIntoleranceReaction:error:](HDHealthRecordsExtractionUtilities, "allergyReactionsWithAllergyIntoleranceReaction:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("allergyIntoleranceClinicalStatusCodingWithCodeableConcept")))
      {
        +[HDHealthRecordsExtractionUtilities allergyIntoleranceClinicalStatusCodingWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "allergyIntoleranceClinicalStatusCodingWithCodeableConcept:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("allergyIntoleranceVerificationStatusCodingWithCodeableConcept")))
      {
        +[HDHealthRecordsExtractionUtilities allergyIntoleranceVerificationStatusCodingWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "allergyIntoleranceVerificationStatusCodingWithCodeableConcept:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("enteredInErrorWithAllergyIntoleranceVerificationStatusCodeableConcept")))
      {
        +[HDHealthRecordsExtractionUtilities enteredInErrorWithAllergyIntoleranceVerificationStatusCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "enteredInErrorWithAllergyIntoleranceVerificationStatusCodeableConcept:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithAllergyIntoleranceCategoryCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceCategoryCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithAllergyIntoleranceCategoryCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithAllergyIntoleranceCriticalityCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithR4AllergyIntoleranceCriticalityCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithR4AllergyIntoleranceCriticalityCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithAllergyIntoleranceTypeCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceTypeCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithAllergyIntoleranceTypeCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("clinicalStatusCodingWithCodeableConcept")))
      {
        +[HDHealthRecordsExtractionUtilities conditionClinicalStatusCodingWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "conditionClinicalStatusCodingWithCodeableConcept:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("enteredInErrorWithConditionVerificationStatusCodeableConcept")))
      {
        +[HDHealthRecordsExtractionUtilities enteredInErrorWithConditionVerificationStatusCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "enteredInErrorWithConditionVerificationStatusCodeableConcept:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("inspectableValueWithAbatementValue")))
      {
        +[HDHealthRecordsExtractionUtilities inspectableValueWithAbatementValue:error:](HDHealthRecordsExtractionUtilities, "inspectableValueWithAbatementValue:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("inspectableValueWithOnsetValue")))
      {
        +[HDHealthRecordsExtractionUtilities inspectableValueWithOnsetValue:error:](HDHealthRecordsExtractionUtilities, "inspectableValueWithOnsetValue:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("conditionVerificationStatusCodingWithCodeableConcept")))
      {
        +[HDHealthRecordsExtractionUtilities conditionVerificationStatusCodingWithCodeableConcept:error:](HDHealthRecordsExtractionUtilities, "conditionVerificationStatusCodingWithCodeableConcept:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithDeviceStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithDeviceStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithDeviceStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithDiagnosticReportStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithDiagnosticReportStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithDiagnosticReportStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("identifiersWithReferences")))
      {
        +[HDHealthRecordsExtractionUtilities identifiersWithReferences:parentResource:error:](HDHealthRecordsExtractionUtilities, "identifiersWithReferences:parentResource:error:", v19, v12, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("BOOLeanNotDoneFromStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities BOOLeanNotDoneFromStatusCode:error:](HDHealthRecordsExtractionUtilities, "BOOLeanNotDoneFromStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithImmunizationStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithImmunizationStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithImmunizationStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("BOOLeanNotTakenFromStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities BOOLeanNotTakenFromStatusCode:error:](HDHealthRecordsExtractionUtilities, "BOOLeanNotTakenFromStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("earliestDosageDateWithDosageArray")))
      {
        +[HDHealthRecordsExtractionUtilities earliestDosageDateWithMedicationOrderDosageArray:error:](HDHealthRecordsExtractionUtilities, "earliestDosageDateWithMedicationOrderDosageArray:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicationDosagesWithDosageArray")))
      {
        +[HDHealthRecordsExtractionUtilities medicationDosagesWithDosageArray:error:](HDHealthRecordsExtractionUtilities, "medicationDosagesWithDosageArray:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithMedicationDispenseStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithR4MedicationDispenseStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithR4MedicationDispenseStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithMedicationRequestStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithR4MedicationRequestStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithR4MedicationRequestStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithMedicationStatementStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationStatementStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithMedicationStatementStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("referencedMedicationStatementActorTypeWithString")))
      {
        +[HDHealthRecordsExtractionUtilities referencedMedicationStatementActorTypeWithString:error:](HDHealthRecordsExtractionUtilities, "referencedMedicationStatementActorTypeWithString:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("inspectableValueCollectionWithObservationComponents")))
      {
        +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithObservationComponents:FHIRVersion:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithObservationComponents:FHIRVersion:error:", v19, v25, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("inspectableValueCollectionWithObservationValues")))
      {
        +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithObservationValues:FHIRVersion:error:](HDHealthRecordsExtractionUtilities, "inspectableValueCollectionWithObservationValues:FHIRVersion:error:", v19, v25, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("referenceRangesWithObservationReferenceRanges")))
      {
        +[HDHealthRecordsExtractionUtilities referenceRangesWithObservationReferenceRanges:error:](HDHealthRecordsExtractionUtilities, "referenceRangesWithObservationReferenceRanges:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("observationCategoryWithObservationCategories")))
      {
        +[HDHealthRecordsExtractionUtilities observationCategoryWithObservationCategories:error:](HDHealthRecordsExtractionUtilities, "observationCategoryWithObservationCategories:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithObservationStatus")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithObservationStatus:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithObservationStatus:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("medicalCodingWithCoverageStatusCode")))
      {
        +[HDHealthRecordsExtractionUtilities medicalCodingWithCoverageStatusCode:error:](HDHealthRecordsExtractionUtilities, "medicalCodingWithCoverageStatusCode:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("coverageClassificationWithClassElements")))
      {
        +[HDHealthRecordsExtractionUtilities coverageClassificationWithClassElements:error:](HDHealthRecordsExtractionUtilities, "coverageClassificationWithClassElements:error:", v19, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v20, "isEqualToString:", CFSTR("preferredNameWithHumanNames")))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported R4 extraction transform '%@'"), v20);
          objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v24);
        }
        +[HDHealthRecordsExtractionUtilities preferredNameWithHumanNames:FHIRVersion:error:](HDHealthRecordsExtractionUtilities, "preferredNameWithHumanNames:FHIRVersion:error:", v19, v25, a6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (id)v21;

      if (!v11)
        break;
      ++v18;
      v19 = v11;
      if (v16 == v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v16)
          goto LABEL_5;
        break;
      }
    }
  }

  return v11;
}

@end
