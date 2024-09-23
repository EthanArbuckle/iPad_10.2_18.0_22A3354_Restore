@implementation HKMedicalCodingSystem

- (HKMedicalCodingSystem)initWithIdentifier:(id)a3 name:(id)a4 OID:(id)a5 type:(unint64_t)a6 synonyms:(id)a7 hasDisplayStrings:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKMedicalCodingSystem *v18;
  void *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSString *OID;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_super v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HKMedicalCodingSystem;
  v18 = -[HKMedicalCodingSystem init](&v30, sel_init);
  if (v18)
  {
    standardizeIdentifier(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    name = v18->_name;
    v18->_name = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    OID = v18->_OID;
    v18->_OID = (NSString *)v24;

    v18->_type = a6;
    v26 = objc_msgSend(v17, "copy");
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v18->_synonyms, v28);

    v18->_hasDisplayStrings = a8;
  }

  return v18;
}

- (HKMedicalCodingSystem)initWithCustomIdentifier:(id)a3
{
  return -[HKMedicalCodingSystem initWithIdentifier:name:OID:type:synonyms:hasDisplayStrings:](self, "initWithIdentifier:name:OID:type:synonyms:hasDisplayStrings:", a3, 0, 0, 2, 0, 0);
}

+ (id)codeSystemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKMedicalCodingSystem *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  HKMedicalCodingSystem *v32;
  HKMedicalCodingSystem *v34;
  HKMedicalCodingSystem *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *context;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E37FD4C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  standardizeIdentifier(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("urn:apple:medicalrecords:text")))
  {
    objc_msgSend(a1, "textSystem");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (HKMedicalCodingSystem *)v8;
    goto LABEL_30;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("urn:apple:medicalrecords:unknown")))
  {
    objc_msgSend(a1, "unknownSystem");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v10 = 0x1E0C99000uLL;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("urn:oid:"), &stru_1E37FD4C0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  +[HKMedicalCodingSystem externalCodeSystems](HKMedicalCodingSystem, "externalCodeSystems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v46;
    v36 = *(_QWORD *)v46;
    while (2)
    {
      v16 = 0;
      v37 = v14;
      do
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v13);
        v38 = v16;
        v9 = *(HKMedicalCodingSystem **)(*((_QWORD *)&v45 + 1) + 8 * v16);
        v17 = (void *)MEMORY[0x19AEC7968]();
        v18 = objc_alloc(*(Class *)(v10 + 3736));
        -[HKMedicalCodingSystem identifier](v9, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithString:", v19);

        if (objc_msgSend(v20, "isEqual:", v11)
          || (-[HKMedicalCodingSystem OID](v9, "OID"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = objc_msgSend(v12, "caseInsensitiveCompare:", v21),
              v21,
              !v22))
        {
          v34 = v9;
LABEL_28:

          objc_autoreleasePoolPop(v17);
          goto LABEL_29;
        }
        context = v17;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        -[HKMedicalCodingSystem synonyms](v9, "synonyms");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v42;
          v39 = v13;
          while (2)
          {
            v27 = v11;
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v42 != v26)
                objc_enumerationMutation(v23);
              v29 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
              if (!objc_msgSend(v7, "caseInsensitiveCompare:", v29)
                || !objc_msgSend(v12, "caseInsensitiveCompare:", v29))
              {
                v32 = v9;

                v11 = v27;
                v13 = v39;
                goto LABEL_27;
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            v11 = v27;
            v13 = v39;
            if (v25)
              continue;
            break;
          }
        }

        -[HKMedicalCodingSystem name](v9, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v7, "caseInsensitiveCompare:", v30);

        if (!v31)
        {
          v35 = v9;
LABEL_27:
          v17 = context;
          goto LABEL_28;
        }

        objc_autoreleasePoolPop(context);
        v16 = v38 + 1;
        v10 = 0x1E0C99000;
        v15 = v36;
      }
      while (v38 + 1 != v37);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v14)
        continue;
      break;
    }
  }

  v9 = -[HKMedicalCodingSystem initWithCustomIdentifier:]([HKMedicalCodingSystem alloc], "initWithCustomIdentifier:", v7);
LABEL_29:

LABEL_30:
  return v9;
}

+ (id)systemWithSystemDefinition:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  HKMedicalCodingSystem *v12;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3->var0, strnlen(a3->var0, 0x200uLL), 4, 0);
  standardizeIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HKHealthKitFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3->var1, strlen(a3->var1), 4, 0);
  v8 = &stru_1E37FD4C0;
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3->var2, strlen(a3->var2), 4, 0);
  if (a3->var3)
    v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3->var3, strlen(a3->var3), 4, 0);
  -[__CFString componentsSeparatedByString:](v8, "componentsSeparatedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKMedicalCodingSystem initWithIdentifier:name:OID:type:synonyms:hasDisplayStrings:]([HKMedicalCodingSystem alloc], "initWithIdentifier:name:OID:type:synonyms:hasDisplayStrings:", v5, v9, v10, a3->var4, v11, a3->var5);

  return v12;
}

+ (id)LOINCCodeSystem
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://loinc.org"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://loinc.org"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 154, v5);

  }
  return v4;
}

+ (id)SNOMEDCodeSystem
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://snomed.info/sct"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://snomed.info/sct"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 158, v5);

  }
  return v4;
}

+ (id)RxNormCodeSystem
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://www.nlm.nih.gov/research/umls/rxnorm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://www.nlm.nih.gov/research/umls/rxnorm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 162, v5);

  }
  return v4;
}

+ (id)UCUMSystem
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://unitsofmeasure.org"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://unitsofmeasure.org"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 166, v5);

  }
  return v4;
}

+ (id)CVXSystem
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/sid/cvx"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/sid/cvx"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 170, v5);

  }
  return v4;
}

+ (id)NDCSystem
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/sid/ndc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/sid/ndc"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 174, v5);

  }
  return v4;
}

+ (id)ICD10System
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/sid/icd-10"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/sid/icd-10"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 178, v5);

  }
  return v4;
}

+ (id)ICD9System
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/sid/icd-9"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/sid/icd-9"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 182, v5);

  }
  return v4;
}

+ (id)argonautHL7System
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://argonaut.hl7.org"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://argonaut.hl7.org"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 186, v5);

  }
  return v4;
}

+ (id)FHIRDeviceStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/devicestatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/devicestatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 190, v5);

  }
  return v4;
}

+ (id)FHIRDiagnosticReportStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/diagnostic-report-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/diagnostic-report-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 194, v5);

  }
  return v4;
}

+ (id)FHIREventStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/event-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/event-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 198, v5);

  }
  return v4;
}

+ (id)FHIRImmunizationStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/event-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/event-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 202, v5);

  }
  return v4;
}

+ (id)FHIRObservationStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/observation-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/observation-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 206, v5);

  }
  return v4;
}

+ (id)FHIRMedicationAdminStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/medication-admin-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/medication-admin-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 210, v5);

  }
  return v4;
}

+ (id)FHIRMedicationOrderStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/medication-order-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/medication-order-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 214, v5);

  }
  return v4;
}

+ (id)FHIRMedicationRequestStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/medicationrequest-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/medicationrequest-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 218, v5);

  }
  return v4;
}

+ (id)FHIRMedicationStatementStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/medication-statement-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/medication-statement-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 222, v5);

  }
  return v4;
}

+ (id)FHIRCarePlanStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/care-plan-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/care-plan-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 226, v5);

  }
  return v4;
}

+ (id)FHIRGoalStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/goal-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/ValueSet/goal-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 230, v5);

  }
  return v4;
}

+ (id)FHIRCoverageStatus
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/fm-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://hl7.org/fhir/fm-status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 234, v5);

  }
  return v4;
}

+ (id)FHIRCoverageClassification
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/coverage-class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://terminology.hl7.org/CodeSystem/coverage-class"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 238, v5);

  }
  return v4;
}

+ (id)FHIRCoverageType
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/v3-ActCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ code system should never be nil"), CFSTR("http://terminology.hl7.org/CodeSystem/v3-ActCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 242, v5);

  }
  return v4;
}

+ (id)FHIRMedicationDispenseStatus
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/medication-dispense-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 249, CFSTR("FHIR Diagnostic Medication Dispense code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRMedicationDispenseStatusR4
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/medicationdispense-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 255, CFSTR("FHIR Diagnostic Medication Dispense code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRProcedureStatus
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/procedure-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 261, CFSTR("FHIR Procedure code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRAllergyIntoleranceStatus
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/allergy-intolerance-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 267, CFSTR("FHIR AllergyIntoleranceStatus code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRAllergyIntoleranceCategory
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/allergy-intolerance-category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 273, CFSTR("FHIR AllergyIntoleranceCategory code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRAllergyIntoleranceCriticality
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 279, CFSTR("FHIR AllergyIntoleranceCriticality code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRAllergyIntoleranceSeverity
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/reaction-event-severity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 285, CFSTR("FHIR AllergyIntoleranceSeverity code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRAllergyIntoleranceType
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/allergy-intolerance-type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 291, CFSTR("FHIR AllergyIntoleranceType code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRAllergyIntoleranceClinicalStatus
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 297, CFSTR("FHIR AllergyIntoleranceClinicalStatus code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRAllergyIntoleranceVerificationStatus
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 303, CFSTR("FHIR AllergyIntoleranceVerificationStatus code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRConditionClinicalStatus
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/condition-clinical"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 309, CFSTR("FHIR ConditionClinicalStatus code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRConditionVerificationStatus
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/condition-ver-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 315, CFSTR("FHIR ConditionVerificationStatus code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRQuantityComparatorSystem
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/ValueSet/quantity-comparator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 322, CFSTR("FHIR Quantity Comparator code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRDocumentReferenceClinicalNoteStatus
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/document-reference-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 330, CFSTR("FHIR DocumentReferenceClinicalNoteStatus code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRDocumentReferenceClinicalNoteDocStatus
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/composition-status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 336, CFSTR("FHIR DocumentReferenceClinicalNoteDocStatus code system should never be nil"));

  }
  return v4;
}

+ (id)FHIRDocumentReferenceClinicalNoteCategorySystem
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingSystem.m"), 342, CFSTR("FHIR DocumentReferenceClinicalNoteCategorySystem code system should never be nil"));

  }
  return v4;
}

+ (id)textSystem
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__HKMedicalCodingSystem_textSystem__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (textSystem_onceToken != -1)
    dispatch_once(&textSystem_onceToken, v3);
  return (id)textSystem_ret;
}

void __35__HKMedicalCodingSystem_textSystem__block_invoke(uint64_t a1)
{
  HKMedicalCodingSystem *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = [HKMedicalCodingSystem alloc];
  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MEDICAL_CODING_SYSTEM_TEXT"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKMedicalCodingSystem initWithIdentifier:name:OID:type:synonyms:hasDisplayStrings:](v2, "initWithIdentifier:name:OID:type:synonyms:hasDisplayStrings:", CFSTR("urn:apple:medicalrecords:text"), v4, 0, 3, 0, 0);
  v6 = (void *)textSystem_ret;
  textSystem_ret = v5;

  if (!textSystem_ret)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("HKMedicalCodingSystem.m"), 357, CFSTR("Apple Text System should never be nil"));

  }
}

+ (id)unknownSystem
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__HKMedicalCodingSystem_unknownSystem__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (unknownSystem_onceToken != -1)
    dispatch_once(&unknownSystem_onceToken, v3);
  return (id)unknownSystem_ret;
}

void __38__HKMedicalCodingSystem_unknownSystem__block_invoke(uint64_t a1)
{
  HKMedicalCodingSystem *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = [HKMedicalCodingSystem alloc];
  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MEDICAL_CODING_SYSTEM_UNKNOWN"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKMedicalCodingSystem initWithIdentifier:name:OID:type:synonyms:hasDisplayStrings:](v2, "initWithIdentifier:name:OID:type:synonyms:hasDisplayStrings:", CFSTR("urn:apple:medicalrecords:unknown"), v4, 0, 3, 0, 0);
  v6 = (void *)unknownSystem_ret;
  unknownSystem_ret = v5;

  if (!unknownSystem_ret)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("HKMedicalCodingSystem.m"), 374, CFSTR("Apple Text System should never be nil"));

  }
}

+ (id)appleOntologySystem
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__HKMedicalCodingSystem_appleOntologySystem__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (appleOntologySystem_onceToken != -1)
    dispatch_once(&appleOntologySystem_onceToken, v3);
  return (id)appleOntologySystem_ret;
}

void __44__HKMedicalCodingSystem_appleOntologySystem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "codeSystemWithIdentifier:", CFSTR("urn:apple:health:ontology"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)appleOntologySystem_ret;
  appleOntologySystem_ret = v2;

  if (!appleOntologySystem_ret)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HKMedicalCodingSystem.m"), 386, CFSTR("Appple ontology System should never be nil"));

  }
}

+ (id)adHocConceptSystem
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__HKMedicalCodingSystem_adHocConceptSystem__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (adHocConceptSystem_onceToken != -1)
    dispatch_once(&adHocConceptSystem_onceToken, v3);
  return (id)adHocConceptSystem_ret;
}

void __43__HKMedicalCodingSystem_adHocConceptSystem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "codeSystemWithIdentifier:", CFSTR("urn:apple:health:ontology:ad-hoc"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)adHocConceptSystem_ret;
  adHocConceptSystem_ret = v2;

  if (!adHocConceptSystem_ret)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HKMedicalCodingSystem.m"), 398, CFSTR("Ad-Hoc Concept System should never be nil"));

  }
}

+ (id)appleHealthDataTypeSystem
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__HKMedicalCodingSystem_appleHealthDataTypeSystem__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (appleHealthDataTypeSystem_onceToken != -1)
    dispatch_once(&appleHealthDataTypeSystem_onceToken, v3);
  return (id)appleHealthDataTypeSystem_ret;
}

void __50__HKMedicalCodingSystem_appleHealthDataTypeSystem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "codeSystemWithIdentifier:", CFSTR("urn:apple:health:data-type"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)appleHealthDataTypeSystem_ret;
  appleHealthDataTypeSystem_ret = v2;

  if (!appleHealthDataTypeSystem_ret)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HKMedicalCodingSystem.m"), 410, CFSTR("Apple Data Type System should never be nil"));

  }
}

- (BOOL)isEqual:(id)a3
{
  HKMedicalCodingSystem *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (HKMedicalCodingSystem *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[HKMedicalCodingSystem identifier](v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalCodingSystem identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = +[HKMedicalCodingSystem hash](HKMedicalCodingSystem, "hash");
  return -[NSString hash](self->_identifier, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HKMedicalCodingSystem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalCodingSystem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalCodingSystem OID](self, "OID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Code System (Identifier: %@, Name: %@, OID: %@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicalCodingSystem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKMedicalCodingSystem *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", v5);
  v6 = (HKMedicalCodingSystem *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKMedicalCodingSystem identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

+ (id)externalCodeSystems
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HKMedicalCodingSystem_externalCodeSystems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (externalCodeSystems_onceToken != -1)
    dispatch_once(&externalCodeSystems_onceToken, block);
  return (id)externalCodeSystems_externalCodeSystems;
}

void __44__HKMedicalCodingSystem_externalCodeSystems__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t i;
  void *v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _OWORD v9[2];
  char *v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 365; i += 5)
  {
    v4 = (void *)MEMORY[0x19AEC7968]();
    v5 = *(_OWORD *)&HKCodeSystemDefinitionsWithCount_systemDefinitions[i + 2];
    v9[0] = *(_OWORD *)&HKCodeSystemDefinitionsWithCount_systemDefinitions[i];
    v9[1] = v5;
    v10 = HKCodeSystemDefinitionsWithCount_systemDefinitions[i + 4];
    objc_msgSend(*(id *)(a1 + 32), "systemWithSystemDefinition:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

    objc_autoreleasePoolPop(v4);
  }
  v7 = objc_msgSend(v2, "copy");
  v8 = (void *)externalCodeSystems_externalCodeSystems;
  externalCodeSystems_externalCodeSystems = v7;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)OID
{
  return self->_OID;
}

- (void)setOID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void)setSynonyms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasDisplayStrings
{
  return self->_hasDisplayStrings;
}

- (void)setHasDisplayStrings:(BOOL)a3
{
  self->_hasDisplayStrings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_OID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)ontology_hasCodingSystemAttributeIdentifier
{
  void *v2;
  void *v3;

  -[HKMedicalCodingSystem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E389D6E8, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
